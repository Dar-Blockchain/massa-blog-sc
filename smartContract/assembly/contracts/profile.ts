import {
  Address,
  balance,
  call,
  callee,
  caller,
  Context,
  createEvent,
  generateEvent,
  isAddressEoa,
  Storage,
  timestamp,
  transferCoins,
  transferredCoins,
} from '@massalabs/massa-as-sdk';
import { Args, bytesToString } from '@massalabs/as-types';
import { _setOwner, OWNER_KEY } from './utils/ownership-internal';
import { onlyOwner, ownerAddress, setOwner } from './utils/ownership';
import { Profile } from '../structs/profile';
import {
  _builduserFollowsKey,
  _buildUserRepostKey,
  COMMENT_ID_KEY,
  commentsMap,
  FOLLOW_ID_KEY,
  followsMap,
  LIKE_ID_KEY,
  likesMap,
  POST_ID_KEY,
  postMap,
  repostsMap,
  usersFollowsMap,
  PROFILE_OWNERS,
  FACTORY_CONTRACT,
  START_POST_ID,
  START_LIKE_ID,
  START_COMMENT_ID,
  START_FOLLOW_ID,
} from './storage';
import { Post } from '../structs/post';
import { Comment } from '../structs/comment';
import { Like } from '../structs/like';
import { Follow } from '../structs/follow';
import { Repost } from '../structs/repost';

/**
 * Smart contract constructor - Initializes the contract at deployment.
 * Ensures the contract is only deployed once.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the user address.
 */
export function constructor(binaryArgs: StaticArray<u8>): void {
  if (!Context.isDeployingContract()) {
    return;
  }

  const args = new Args(binaryArgs);
  const userAddress = args.nextString().expect('User address required');

  _setOwner(userAddress);

  // Store contract references and initialize counters
  Storage.set(FACTORY_CONTRACT, caller().toString());
  Storage.set(POST_ID_KEY, START_POST_ID.toString());
  Storage.set(LIKE_ID_KEY, START_LIKE_ID.toString());
  Storage.set(COMMENT_ID_KEY, START_COMMENT_ID.toString());
  Storage.set(FOLLOW_ID_KEY, START_FOLLOW_ID.toString());

  generateEvent(createEvent('ContractDeployed', [userAddress]));
}

/**
 * Handles incoming deposits to the contract.
 *
 * @param {StaticArray<u8>} _ - Unused parameter.
 */
export function receiveCoins(_: StaticArray<u8>): void {
  generateEvent(
    createEvent('Deposit to the profile contract', [
      caller().toString(),
      transferredCoins().toString(),
    ]),
  );
}

/************ADMIN FEATURES************/

/**
 * Allows the contract owner to withdraw a specified amount to a given address.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing withdrawal details.
 */
export function claim(binaryArgs: StaticArray<u8>): void {
  assert(
    caller().toString() == Storage.get(OWNER_KEY),
    'Only owner can execute the claim',
  );

  const args = new Args(binaryArgs);
  const claimAmount = args
    .nextU64()
    .expect('claimAmount argument is missing or invalid');
  const to = args.nextString().expect('to argument is missing or invalid');

  assert(balance() > claimAmount, "This contract doesn't have enough balance");

  // Transfer funds either directly or via smart contract call
  if (isAddressEoa(to)) {
    transferCoins(new Address(to), claimAmount);
  } else {
    call(new Address(to), 'receiveCoins', new Args(), claimAmount);
  }

  generateEvent(
    createEvent('Claim from the profile contract', [
      to,
      claimAmount.toString(),
    ]),
  );
}

/**
 * Transfers ownership of the contract to a new owner.
 * Updates the profile contract to reflect the new owner.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the new owner address.
 */
export function transferOwnership(binaryArgs: StaticArray<u8>): void {
  onlyOwner();

  const args = new Args(binaryArgs);
  const oldOwner = bytesToString(ownerAddress(new Args().serialize()));
  const newOwner = args.nextString().unwrap();

  // Retrieve profile information from the factory contract
  const profile = new Args(
    call(
      new Address(Storage.get(FACTORY_CONTRACT)),
      'getProfile',
      new Args().add(oldOwner),
      0,
    ),
  )
    .nextSerializable<Profile>()
    .unwrap();

  // Update the profile contract with the new owner information
  call(
    new Address(Storage.get(FACTORY_CONTRACT)),
    'updateProfile',
    new Args()
      .add(oldOwner)
      .add(newOwner)
      .add(profile.firstName)
      .add(profile.lastName)
      .add(profile.profilePicUrl)
      .add(profile.bio)
      .add(profile.coverPhotoUrl)
      .add(profile.email)
      .add(profile.facebook)
      .add(profile.twitter)
      .add(profile.linkedin)
      .add(profile.instagram)
      .add(profile.website),

    0,
  );

  // Set the new contract owner
  setOwner(new Args().add(newOwner).serialize());

  generateEvent(createEvent('TransferOwnership', [oldOwner, newOwner]));
}

/**
 * Allows the contract owner to follow a profile.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the profile contract address.
 */
export function followProfile(binaryArgs: StaticArray<u8>): void {
  onlyOwner();

  const args = new Args(binaryArgs);
  const ProfileContractAddress = args.nextString().unwrap();

  // Check if the profile contract exists
  const profileExist = Storage.hasOf(
    new Address(Storage.get(FACTORY_CONTRACT)),
    PROFILE_OWNERS.concat(ProfileContractAddress),
  );
  assert(profileExist, "This contract profile doesn't exist");

  const lastFollowId = u64.parse(Storage.get(FOLLOW_ID_KEY));

  // Construct the key for the user's follows
  const usersFollowsKey = _builduserFollowsKey(
    callee().toString(),
    ProfileContractAddress,
  );

  const usersFollowsId = usersFollowsMap.get(usersFollowsKey, u64(0));

  const isFollowing = usersFollowsId > u64(0);

  assert(!isFollowing, 'User is already following this profile.');

  // Create a follow object
  const follow = new Follow(
    lastFollowId,
    callee(),
    new Address(ProfileContractAddress),
    timestamp(),
  );

  // Call the profile contract to add the follow relationship
  call(
    new Address(ProfileContractAddress),
    '_addFollowing',
    new Args().add(follow),
    0,
  );

  // Store the follow record
  followsMap.set(lastFollowId, follow);
  usersFollowsMap.set(usersFollowsKey, lastFollowId);

  // Update the follow ID counter
  Storage.set(FOLLOW_ID_KEY, (lastFollowId + 1).toString());

  generateEvent(
    createEvent('FollowProfile', [
      follow.follower.toString(),
      follow.followed.toString(),
      follow.createdAt.toString(),
    ]),
  );
}

/**
 * Allows the contract owner to unfollow a profile.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the profile contract address.
 */
export function unfollowProfile(binaryArgs: StaticArray<u8>): void {
  onlyOwner();
  const args = new Args(binaryArgs);
  const ProfileContractAddress = args.nextString().unwrap();

  // Check if the profile contract exists
  const profileExist = Storage.hasOf(
    new Address(Storage.get(FACTORY_CONTRACT)),
    PROFILE_OWNERS.concat(ProfileContractAddress),
  );
  assert(profileExist, "This contract profile doesn't exist");

  // Construct the key for the user's follows
  const usersFollowsKey = _builduserFollowsKey(
    callee().toString(),
    ProfileContractAddress,
  );

  const userFollowsId = usersFollowsMap.get(usersFollowsKey, u64(0));

  const isFollowing = userFollowsId > u64(0);

  assert(isFollowing, 'User is not following this profile.');

  // Retrieve follow object
  const follow = followsMap.getSome(userFollowsId);

  // Call the profile contract to remove the follow relationship
  call(follow.followed, '_removeFollowing', new Args().add(follow), 0);

  // Remove follow records
  usersFollowsMap.delete(usersFollowsKey);
  followsMap.delete(userFollowsId);

  generateEvent(
    createEvent('UnfollowProfile', [
      callee().toString(),
      ProfileContractAddress,
      timestamp().toString(),
    ]),
  );
}

/**
 * Internal function to register a follower in the profile contract.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the follow object.
 */
export function _addFollowing(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const follow = args.nextSerializable<Follow>().unwrap();
  assert(
    caller() == follow.follower,
    'Caller does not have permission to execute this function',
  );

  const lastFollowId = u64.parse(Storage.get(FOLLOW_ID_KEY));

  // add the follow entry to the map
  followsMap.set(lastFollowId, follow);

  // Create the key for user's follows
  const usersFollowsKey = _builduserFollowsKey(
    follow.follower.toString(),
    follow.followed.toString(),
  );

  usersFollowsMap.set(usersFollowsKey, lastFollowId);

  // Update the follow ID counter
  Storage.set(FOLLOW_ID_KEY, (lastFollowId + 1).toString());

  generateEvent(
    createEvent('FollowingProfile', [
      follow.follower.toString(),
      follow.followed.toString(),
      follow.createdAt.toString(),
    ]),
  );
}

/**
 * Internal function to remove a follower from the profile contract.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the follow object.
 */
export function _removeFollowing(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const follow = args.nextSerializable<Follow>().unwrap();

  assert(
    caller() == follow.follower,
    'Caller does not have permission to execute this function',
  );

  // Construct the key for user's follows
  const usersFollowsKey = _builduserFollowsKey(
    follow.follower.toString(),
    follow.followed.toString(),
  );

  const userFollowsId = usersFollowsMap.get(usersFollowsKey, u64(0));

  // Remove follow records
  usersFollowsMap.delete(usersFollowsKey);
  followsMap.delete(userFollowsId);

  generateEvent(
    createEvent('removeFollowing', [
      follow.follower.toString(),
      follow.followed.toString(),
      timestamp().toString(),
    ]),
  );
}

/**
 * Retrieves a paginated list of followers for the calling profile.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the pagination selection part.
 * @returns {StaticArray<u8>} - Serialized list of followers.
 */
export function getAllUserFollowers(
  binaryArgs: StaticArray<u8>,
): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap();
  assert(selectionPart > 0, 'selectionPart should be greater than 0');

  let followers: Follow[] = [];

  // Iterate through stored follows and collect relevant ones
  for (
    let i = u64(START_FOLLOW_ID) + (selectionPart - 1) * 10;
    i <= selectionPart * 10;
    i++
  ) {
    const follow = followsMap.get(i, new Follow());
    if (follow.followed.toString() == callee().toString()) {
      followers.push(follow);
    }
  }

  return new Args().addSerializableObjectArray<Follow>(followers).serialize();
}

/**
 * Retrieves a paginated list of profiles the calling user is following.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the pagination selection part.
 * @returns {StaticArray<u8>} - Serialized list of followings.
 */
export function getAllUserFollowings(
  binaryArgs: StaticArray<u8>,
): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap();
  assert(selectionPart > 0, 'selectionPart should be greater than 0');

  let followings: Follow[] = [];

  // Iterate through stored follows and collect relevant ones
  for (
    let i = u64(START_FOLLOW_ID) + (selectionPart - 1) * 10;
    i <= selectionPart * 10;
    i++
  ) {
    const follow = followsMap.get(i, new Follow());
    if (follow.follower.toString() == callee().toString()) {
      followings.push(follow);
    }
  }

  return new Args().addSerializableObjectArray<Follow>(followings).serialize();
}

/**
 * Creates a new post.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing post details.
 */
export function createPost(binaryArgs: StaticArray<u8>): void {
  onlyOwner(); // Ensure only the contract owner can create a post.
  const args = new Args(binaryArgs);

  const title = args.nextString().unwrap();
  const excerpt = args.nextString().unwrap();
  const content = args.nextString().unwrap();
  const featuredImage = args.nextString().unwrap();
  const categoryId = args.nextString().unwrap();
  const readingTime = args.nextU64().unwrap();
  const tags = args.nextString().unwrap();

  const postId = u64.parse(Storage.get(POST_ID_KEY)); // Get the current post ID.
  const createdAt = timestamp();
  generateEvent(
    createEvent('CreatePost', [
      title,
      excerpt,
      content,
      featuredImage,
      categoryId,
      readingTime.toString(),
      tags,
    ]),
  );
  // Create a new post object.
  const post = new Post(
    postId,
    caller(),
    title,
    excerpt,
    content,
    featuredImage,
    categoryId,
    readingTime,
    tags,
    createdAt,
  );

  generateEvent(createEvent('CreatePost after after', [postId.toString()]));

  postMap.set(postId.toString(), post); // Store the post in the map.

  Storage.set(POST_ID_KEY, (postId + 1).toString()); // Increment the post ID counter.
  // Update category count in the factory contract
  // call(
  //   new Address(Storage.get(FACTORY_CONTRACT)),
  //   '_updateCategoryCount',
  //   new Args().add(categoryId).add(true),
  //   0,
  // );
  generateEvent(
    createEvent('CreatePost', [
      post.id.toString(),
      post.author.toString(),
      post.createdAt.toString(),
      post.title,
      post.excerpt,
      post.content,
      post.featuredImage,
      post.categoryId,
      post.readingTime.toString(),
      post.tags,
    ]),
  );
}

/**
 * Updates an existing post.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing post ID and new content.
 */
export function updatePost(binaryArgs: StaticArray<u8>): void {
  onlyOwner(); // Ensure only the contract owner can update a post.

  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap();

  // Deserialize updated fields
  const title = args.nextString().unwrap();
  const excerpt = args.nextString().unwrap();
  const content = args.nextString().unwrap();
  const featuredImage = args.nextString().unwrap();
  const categoryId = args.nextString().unwrap();
  const readingTime = args.nextU64().unwrap();
  const tags = args.nextString().unwrap();

  // Check if post exists.
  assert(postMap.contains(postId.toString()), 'Post does not exist');

  let post = postMap.get(postId.toString(), new Post());

  // Ensure correct post ID.
  assert(post.id == postId, 'Post does not exist');

  // Update post content.
  post.title = title;
  post.excerpt = excerpt;
  post.content = content;
  post.featuredImage = featuredImage;
  post.categoryId = categoryId;
  post.readingTime = readingTime;
  post.tags = tags;

  postMap.set(postId.toString(), post); // Store the updated post.

  generateEvent(createEvent('UpdatePost', [postId.toString()]));
}

/**
 * Reposts an existing post.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the original post ID.
 */
export function repostPost(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const originalPostId = args.nextU64().unwrap();

  // Ensure the original post exists.
  assert(
    postMap.contains(originalPostId.toString()),
    'Original post not found',
  );

  // Retrieve the caller's profile contract.
  const profile = new Args(
    call(
      new Address(Storage.get(FACTORY_CONTRACT)),
      'getProfile',
      new Args().add(caller().toString()),
      0,
    ),
  )
    .nextSerializable<Profile>()
    .unwrap();

  // Create a new repost object.
  const repost = new Repost(0, originalPostId, callee());

  // Call the profile contract to register the repost.
  call(profile.profileContract, '_addRepost', new Args().add(repost), 0);

  generateEvent(
    createEvent('RepostPost', [
      originalPostId.toString(),
      profile.profileContract.toString(),
    ]),
  );
}

/**
 * Adds a repost entry to the repost map.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the repost details.
 */
export function _addRepost(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const repost = args.nextSerializable<Repost>().unwrap();

  // Ensure only the author can execute this.
  assert(
    caller().toString() == repost.authorProfileContract.toString(),
    'Caller does not have permission to execute this function',
  );

  const postId = u64.parse(Storage.get(POST_ID_KEY)); // Get the current post ID.

  repost.id = postId;
  repostsMap.set(postId.toString(), repost); // Store the repost.

  Storage.set(POST_ID_KEY, (postId + 1).toString()); // Increment the post ID counter.

  generateEvent(
    createEvent('AddRepost', [
      repost.id.toString(),
      repost.originalPostId.toString(),
      repost.authorProfileContract.toString(),
    ]),
  );
}

/**
 * Deletes a post.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the post ID.
 */
export function deletePost(binaryArgs: StaticArray<u8>): void {
  onlyOwner(); // Ensure only the contract owner can delete a post.
  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap();

  // Ensure the post exists.
  assert(
    postMap.contains(postId.toString()) ||
      repostsMap.contains(postId.toString()),
    'Post not found',
  );

  // Remove the post.
  if (postMap.contains(postId.toString())) {
    postMap.delete(postId.toString());
  } else if (repostsMap.contains(postId.toString())) {
    repostsMap.delete(postId.toString());
  }

  generateEvent(
    createEvent('DeletePost', [postId.toString(), callee().toString()]),
  );
}

/**
 * Retrieves a paginated list of posts.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the pagination selection part.
 * @returns {StaticArray<u8>} - Serialized list of posts.
 */
export function getPosts(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap();
  assert(selectionPart > 0, 'selectionPart should be greater than 0'); // Ensure valid pagination input.
  let posts: Post[] = [];

  // Iterate through the posts within the selected range.
  for (
    let i = u64(START_POST_ID) + (selectionPart - 1) * 10;
    i <= selectionPart * 10;
    i++
  ) {
    if (postMap.contains(i.toString())) {
      // Retrieve regular posts.
      const post = postMap.get(i.toString(), new Post());
      posts.push(post);
    } 
  }

  return new Args().addSerializableObjectArray<Post>(posts).serialize(); // Serialize and return the posts.
}

/**
 * Retrieves a single post by ID.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the post ID.
 * @returns {StaticArray<u8>} - Serialized post.
 */
export function getPost(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const lastPostId = u64.parse(Storage.get(POST_ID_KEY));

  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap();

  assert(postId < lastPostId, 'Post not found'); // Ensure the post ID is valid.

  let post = new Post();
  if (postMap.contains(postId.toString())) {
    // Retrieve and return a regular post.
    post = postMap.get(postId.toString(), new Post());
  } else if (repostsMap.contains(postId.toString())) {
    // Retrieve and return a repost.
    const repost = repostsMap.get(postId.toString(), new Repost());
    post = new Args(
      call(
        repost.authorProfileContract,
        'getPost',
        new Args().add(repost.originalPostId),
        0,
      ),
    )
      .nextSerializable<Post>()
      .unwrap();
  }
  return post.serialize();
}

/**
 * Function to like a post.
 * Ensures the user hasn't already liked the post before adding a new like.
 */
export function likePost(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap(); // Extract the post ID from arguments
  const userAddress = caller().toString(); // Get the caller's address

  const lastLikeId = u64.parse(Storage.get(LIKE_ID_KEY)); // Retrieve the last like ID from storage

  // Ensure the post or repost exists before proceeding
  assert(
    postMap.contains(postId.toString()) ||
      repostsMap.contains(postId.toString()),
    'Post not found',
  );

  let alreadyLiked = false;

  // Iterate through existing likes to check if the user already liked the post
  for (let i = u64(START_LIKE_ID); i < lastLikeId; i++) {
    const like = likesMap.get(i, new Like());

    if (like.userAddress.toString() == userAddress && like.postId == postId) {
      alreadyLiked = true;
      break;
    }
  }

  assert(!alreadyLiked, 'User has already liked this post'); // Prevent duplicate likes

  // Create a new like entry
  const like = new Like(
    lastLikeId,
    new Address(userAddress),
    postId,
    timestamp(),
  );

  likesMap.set(lastLikeId, like); // Store the like in the mapping

  Storage.set(LIKE_ID_KEY, (lastLikeId + 1).toString()); // Increment the like ID counter

  // Emit an event to signal that a post was liked
  generateEvent(createEvent('LikePost', [userAddress, postId.toString()]));
}

/**
 * Function to unlike a post.
 * Ensures the user has previously liked the post before allowing them to unlike it.
 */
export function unlikePost(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);

  const postId = args.nextU64().unwrap(); // Extract the post ID from arguments
  const userAddress = caller().toString(); // Get the caller's address

  const lastLikeId = u64.parse(Storage.get(LIKE_ID_KEY)); // Retrieve the last like ID from storage

  // Ensure the post or repost exists before proceeding
  assert(
    postMap.contains(postId.toString()) ||
      repostsMap.contains(postId.toString()),
    'Post not found',
  );

  let alreadyLiked = false;
  let likeId = u64(0);

  // Iterate through existing likes to find the like associated with the user
  for (let i = u64(START_LIKE_ID); i < lastLikeId; i++) {
    const like = likesMap.get(i, new Like());

    if (like.userAddress.toString() == userAddress && like.postId == postId) {
      likeId = i;
      alreadyLiked = true;
      break;
    }
  }

  assert(alreadyLiked, 'User has not liked this post'); // Ensure the user has liked the post before unliking

  likesMap.delete(likeId); // Remove the like from storage

  // Emit an event to signal that a post was unliked
  generateEvent(
    createEvent('UnlikePost', [
      likeId.toString(),
      userAddress,
      postId.toString(),
    ]),
  );
}

/**
 * Function to get users who liked a specific post.
 * Retrieves users in paginated format using selectionPart.
 */
export function getPostLikedUsers(
  binaryArgs: StaticArray<u8>,
): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap(); // Extract the pagination part
  const postId = args.nextU64().unwrap(); // Extract the post ID
  assert(selectionPart > 0, 'selectionPart should be greater than 0'); // Ensure pagination is valid

  let likedUsers: String[] = [];

  // Iterate through likes within the requested page range
  for (
    let i = u64(START_LIKE_ID) + (selectionPart - 1) * 10;
    i <= selectionPart * 10;
    i++
  ) {
    const like = likesMap.get(i, new Like());

    if (like.postId == postId) {
      likedUsers.push(like.userAddress.toString()); // Add the user address to the list
    }
  }

  return new Args().add(likedUsers).serialize(); // Return serialized list of liked users
}

/**
 * Function to add a comment to a post.
 * Supports both top-level comments and replies to existing comments.
 */
export function addPostComment(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap(); // Extract post ID from arguments
  const text = args.nextString().unwrap(); // Extract comment text
  const parentCommentIdOpt = args.nextU64(); // Optional parent comment ID

  // Ensure the post or repost exists before allowing comments
  assert(
    postMap.contains(postId.toString()) ||
      repostsMap.contains(postId.toString()),
    'Post not found',
  );

  const commentId = u64.parse(Storage.get(COMMENT_ID_KEY)); // Retrieve the last comment ID

  let parentId: u64 = u64(0);

  // If the comment is a reply, verify the parent comment exists
  if (!parentCommentIdOpt.isErr()) {
    const parentCommentId = parentCommentIdOpt.unwrap();
    assert(commentsMap.contains(parentCommentId), 'Parent comment not found');
    parentId = parentCommentId;
  }

  // Create a new comment object
  const comment = new Comment(
    commentId,
    postId,
    caller(), // The user posting the comment
    text,
    timestamp(), // Store the time of the comment
    parentId, // If it's a reply, store the parent comment ID
  );

  commentsMap.set(commentId, comment); // Store the comment in the mapping

  Storage.set(COMMENT_ID_KEY, (commentId + 1).toString()); // Increment the comment ID counter

  // Emit an event to signal that a comment has been added
  generateEvent(
    createEvent('AddComment', [
      postId.toString(),
      commentId.toString(),
      caller().toString(),
      parentId > u64(0) ? parentId.toString() : 'null',
    ]),
  );
}

/**
 * Function to retrieve paginated comments for a specific post.
 * Uses selectionPart to fetch a portion of comments.
 */
export function getPostComments(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap(); // Extract the pagination part
  const postId = args.nextU64().unwrap(); // Extract the post ID
  assert(selectionPart > 0, 'selectionPart should be greater than 0'); // Ensure pagination is valid

  // Ensure the post or repost exists
  assert(
    postMap.contains(postId.toString()) ||
      repostsMap.contains(postId.toString()),
    'Post not found',
  );

  let commentsArray: Comment[] = [];

  // Iterate through comments within the requested page range
  for (let i = u64(0) + (selectionPart - 1) * 10; i < selectionPart * 10; i++) {
    const commentId = i;
    const comment = commentsMap.get(commentId, new Comment());
    if (comment.postId === postId) {
      commentsArray.push(comment);
    }
  }

  // Return serialized list of comments
  return new Args()
    .addSerializableObjectArray<Comment>(commentsArray)
    .serialize();
}

/**
 * Function to get replies for a specific comment.
 * Supports pagination using selectionPart.
 */
export function getCommentReplies(
  binaryArgs: StaticArray<u8>,
): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap(); // Extract the pagination part
  const commentId = args.nextU64().unwrap(); // Extract the parent comment ID
  assert(selectionPart > 0, 'selectionPart should be greater than 0'); // Ensure pagination is valid

  assert(commentsMap.contains(commentId), 'Comment not found'); // Ensure the comment exists

  let repliesArray: Comment[] = [];

  // Iterate through stored comments to find replies to the given comment
  for (let i = u64(0) + (selectionPart - 1) * 10; i < selectionPart * 10; i++) {
    const comment = commentsMap.get(i, new Comment());
    if (comment.parentId === commentId) {
      repliesArray.push(comment);
    }
  }

  // Return serialized list of comment replies
  return new Args()
    .addSerializableObjectArray<Comment>(repliesArray)
    .serialize();
}

/**
 * Function to remove a comment.
 * Ensures only the original commenter can delete their comment.
 */
export function removeComment(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const commentId = args.nextU64().unwrap(); // Extract the comment ID

  assert(commentsMap.contains(commentId), 'Comment not found'); // Ensure the comment exists

  const comment = commentsMap.get(commentId, new Comment());

  // Ensure the caller is the owner of the comment before deletion
  assert(
    comment.commenter.toString() == caller().toString(),
    'Caller has no permission to delete this comment',
  );

  commentsMap.delete(commentId); // Remove the comment from storage

  // Emit an event indicating the comment was removed
  generateEvent(createEvent('commentRemoved', [commentId.toString()]));
}

/**
 * Function to delete a user's account.
 * Can only be executed by the contract owner.
 * Clears all stored data and transfers remaining balance.
 */
export function deleteAccount(): void {
  onlyOwner(); // Ensure only the contract owner can execute this function
  const owner = bytesToString(ownerAddress(new Args().serialize())); // Get the owner's address
  const keys = Storage.getKeys(); // Retrieve all stored keys for the account

  // Call external contract to delete the profile
  call(
    new Address(Storage.get(FACTORY_CONTRACT)),
    'deleteProfile',
    new Args().add(owner),
    0,
  );

  // Remove all stored data associated with the account
  for (let i = 0; i <= keys.length; i++) {
    Storage.del(keys[i]);
  }

  // Transfer remaining balance back to the owner
  transferCoins(new Address(owner), balance());

  // Emit an event indicating account deletion
  generateEvent(createEvent('AccountDeleted', [callee().toString(), owner]));
}

/**
 * Retrieves a post by its ID.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the post ID.
 * @returns {StaticArray<u8>} - Serialized post data.
 */
export function getPostById(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const postId = args.nextU64().unwrap();

  // Ensure the post exists
  assert(postMap.contains(postId.toString()), 'Post not found');

  // Get the post from storage
  const post = postMap.get(postId.toString(), new Post());

  // Return serialized post data
  return post.serialize();
}

