import { Args, bytesToString, stringToBytes } from '@massalabs/as-types';
import {
  Address,
  changeCallStack,
  Context,
  createEvent,
  generateEvent,
  mockScCall,
  resetStorage,
  setDeployContext,
} from '@massalabs/massa-as-sdk';
import {
  constructor,
  createPost,
  getPost,
  getPosts,
  likePost,
  repostPost,
  unlikePost,
  updatePost,
} from '../contracts/profile';
import { Profile } from '../structs/profile';
import { Post } from '../structs/post';

// const contractOwner = 'AU12Yd4kCcsizeeTEK9AZyBnuJNZ1cpp99XfCZgzS77ZKnwTFMpVE';
const user1 = 'AU12Yd4kCcsizeeTEK9AZyBnuJNZ1cpp99XfCZgzS77ZKnwTFMpVE';
const user2 = 'AU1aC6g4NpkLQrhp6mVC1ugaDrAEdPGUyVk57xPmEZgF6bh6dTUf';
const contractAdddress =
  'AU12Yd4kCcsizeeTEK9AZyBnuJNZ1cpp99XfCZgzS77ZKnwTFMpVE';

function switchUser(user: string): void {
  changeCallStack(user + ' , ' + contractAdddress);
}

describe('test user profile', () => {
  beforeAll(() => {
    resetStorage();

    setDeployContext();

    constructor([]);
  });

  test('get user default profile', () => {
    const args = new Args().add(user1).serialize();

    const profile = getProfile(args);

    generateEvent(createEvent('GetProfile', [user1, bytesToString(profile)]));
  });

  test('update user profile', () => {
    const profile1 = new Profile(
      new Address(user1),
      'Ayoub Amer',
      'fsf',
      'Juniro fill stack dev',
    );

    updateProfile(profile1.serialize());

    const profile = getProfile(new Args().add(user1).serialize());

    expect(bytesToString(profile)).toBe(bytesToString(profile1.serialize()));
  });

  test('create post', () => {
    const args = new Args()
      .add(stringToBytes('hello world'))
      .add(stringToBytes(''))
      .serialize();

    createPost(args);

    const posts = getPosts();

    const deserializedPosts = new Args(
      posts,
    ).nextSerializableObjectArray<Post>();

    expect(deserializedPosts.isOk()).toBe(true);

    const post = deserializedPosts.unwrap()[0];

    expect(post.text).toBe('hello world');
  });

  test('edit post', () => {
    const post = getPost(new Args().add(u64(0)).serialize());

    const deserializedPost = new Args(post).nextSerializable<Post>();

    generateEvent(createEvent('GetPost', [deserializedPost.unwrap().text]));

    expect(deserializedPost.unwrap().text).toBe('hello world');

    const args = new Args()
      .add(u64(0))
      .add(stringToBytes('hello world 2'))
      .add(stringToBytes(''))
      .serialize();

    updatePost(args);

    const post2 = getPost(new Args().add(u64(0)).serialize());

    const deserializedPost2 = new Args(post2).nextSerializable<Post>();

    generateEvent(createEvent('GetPost', [deserializedPost2.unwrap().text]));

    expect(deserializedPost2.unwrap().text).toBe('hello world 2');
  });

  test('like post', () => {
    const args = new Args().add(u64(0)).serialize();

    likePost(args);

    const postLikes = getPostLikes(args);

    const deserializedPostLikes = new Args(postLikes).nextStringArray();

    generateEvent(
      createEvent('GetPostLikes', [deserializedPostLikes.unwrap()[0]]),
    );
  });

  test('get post likes', () => {
    const args = new Args().add(u64(0)).serialize();

    const postLikes = getPostLikes(args);
    const deserializedPostLikes = new Args(postLikes).nextStringArray();
    generateEvent(
      createEvent('GetPostLikes', [deserializedPostLikes.unwrap()[0]]),
    );
  });

  test('get user liked posts', () => {
    const args = new Args().add(user1).serialize();
    const userLikedPosts = getLikedPosts(args);
    const deserializedUserLikedPosts = new Args(
      userLikedPosts,
    ).nextStringArray();
  });

  test('unlike post', () => {
    const postId = u64(0);

    // Like the post first to ensure unlikePost can be tested
    const likeArgs = new Args().add(postId).serialize();

    // Verify the post is liked by user1
    const postLikesBefore = getPostLikes(likeArgs);
    const deserializedPostLikesBefore = new Args(
      postLikesBefore,
    ).nextStringArray();

    expect(deserializedPostLikesBefore.isOk()).toBe(true);

    // Unlike the post
    unlikePost(likeArgs);

    // Verify the post is no longer liked by user1
    const postLikesAfter = getPostLikes(likeArgs);
    const deserializedPostLikesAfter = new Args(
      postLikesAfter,
    ).nextStringArray();

    expect(deserializedPostLikesAfter.isOk()).toBe(true);

    expect(deserializedPostLikesAfter.unwrap().length).toBe(0);

    generateEvent(
      createEvent('UnlikePostTest', ['User1 unliked post', postId.toString()]),
    );
  });

  test('repost post', () => {
    const post = getPost(new Args().add(u64(0)).serialize());

    const deserializedPost = new Args(post).nextSerializable<Post>();

    generateEvent(createEvent('GetPost', [deserializedPost.unwrap().text]));

    expect(deserializedPost.unwrap().text).toBe('hello world 2');

    const args = new Args().add(u64(0)).serialize();

    repostPost(args);

    const post2 = getPost(new Args().add(u64(0)).serialize());

    const deserializedPost2 = new Args(post2).nextSerializable<Post>();
    generateEvent(createEvent('GetPost', [deserializedPost2.unwrap().text]));

    expect(deserializedPost2.unwrap().text).toBe('hello world 2');
  });
});
