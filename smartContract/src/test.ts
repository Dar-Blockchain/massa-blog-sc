import {
  Account,
  Args,
  Mas,
  SmartContract,
  Web3Provider,
} from '@massalabs/massa-web3';
import {
  addPost,
  addPostComment,
  deletePost,
  followUser,
  getPostById,
  getPostComments,
  getPostLikedUsers,
  getPosts,
  getUserFollowers,
  getUserFollowings,
  getUserLikedPosts,
  getuserPosts,
  getUserProfile,
  likePost,
  removeComment,
  repostPost,
  unfollowUser,
  unlikePost,
  updateUserProfile,
} from './test/contractFunc';
import { getScByteCode } from './utils';

const account = await Account.fromEnv('PRIVATE_KEY');
const account2 = await Account.fromEnv('PRIVATE_KEY_TWO');
const provider = Web3Provider.buildnet(account);
const provider2 = Web3Provider.buildnet(account2);

console.log('Deploying contract...');

const byteCode = getScByteCode('build', 'main.wasm');

const constructorArgs = new Args();

const contract = await SmartContract.deploy(
  provider,
  byteCode,
  constructorArgs,
  { coins: Mas.fromString('5') },
);

const contract2 = new SmartContract(provider2, contract.address);

console.log('Contract deployed at:', contract.address);

console.log('Interacting with contract:', contract.address);

async function testProfile() {
  await getUserProfile(contract, account.address.toString());
  // update user profile
  await updateUserProfile(contract, account.address.toString(), 'Ayoub Amer');
  // get user profile
  await getUserProfile(contract, account.address.toString());
  // get user profile
  await getUserProfile(contract2, account2.address.toString());
  // update user profile
  await updateUserProfile(
    contract2,
    account2.address.toString(),
    'Ayoub Amer 2',
  );
  // get user profile
  await getUserProfile(contract2, account2.address.toString());
}

async function testPost() {
  // add post to the contract
  await addPost(contract, 'hello world');
  // get posts from the contract
  await getPosts(contract);
  // get post by id
  await getPostById(contract, 1n);
  // add another post to the contract
  await addPost(contract2, 'hello world 2');
  // get posts from the contract
  await getPosts(contract);
  // get post by id
  await getPostById(contract, 2n);
  // get  user 1  posts
  await getuserPosts(contract, account.address.toString());
  // get  user 2  posts
  await getuserPosts(contract2, account2.address.toString());
}

async function testRepost() {
  // add post to the contract
  await addPost(contract, 'hello world');
  // get posts from the contract
  await getPosts(contract);
  // add repost by user 2
  await repostPost(contract2, 1n);
  // get posts from the contract
  await getPosts(contract);
  // delete a repost
  await deletePost(contract2, 2n);
  // get posts from the contract
  await getPosts(contract);
  // delete original post
  await deletePost(contract, 1n);
  // get posts from the contract
  await getPosts(contract);
}

async function testLikePost() {
  // add post to the contract
  await addPost(contract, 'hello world');
  // get posts from the contract
  await getPosts(contract);
  // add like by user 2
  await likePost(contract2, 1n);
  // get posts liked users from the contract
  await getPostLikedUsers(contract, 1n);
  //  get user liked posts
  await getUserLikedPosts(contract2, account2.address.toString());
  // delete a like
  await unlikePost(contract2, 1n);
  // get posts liked users from the contract
  await getPostLikedUsers(contract, 1n);
  //  get user liked posts
  await getUserLikedPosts(contract2, account2.address.toString());
}

// async function testComment() {
//   await addPost(contract, 'hello world');
//   await getPosts(contract);
//   // add comment to post
//   await addPostComment(contract2, 1n, 'hello comment 1 ');
//   // get post comments
//   await getPostComments(contract, 1n);
//   // reply to comment
//   await addPostComment(contract, 1n, 'reply to comment 1 text', 1n);
//   // get post comments
//   await getPostComments(contract, 1n);
//   // delete comment
//   await removeComment(contract2, 1n);
//   // get post comments
//   await getPostComments(contract, 1n);
// }

async function testFollow() {
  // follow user 2
  await followUser(contract, account2.address.toString());
  // get user followers
  await getUserFollowers(contract, account2.address.toString());
  // get user followings
  await getUserFollowings(contract, account.address.toString());
  // unfollow user 2
  await unfollowUser(contract, account2.address.toString());
  // get user followers
  await getUserFollowers(contract, account2.address.toString());
  // get user followings
  await getUserFollowings(contract, account.address.toString());
}

await testProfile();
// await testPost();
// await testRepost();
// await testLikePost();
// await testComment();
await testFollow();

console.log('All the smart conract Events :');

const events = await provider.getEvents({
  smartContractAddress: contract.address,
});

for (const event of events) {
  console.log('Event message:', event.data);
}
