import * as dotenv from "dotenv";
import {
  Args,
  CHAIN_ID,
  WalletClient,
  ClientFactory,
  DefaultProviderUrls,
  MAX_GAS_CALL,
  fromMAS,
  ArrayTypes,
} from "@massalabs/massa-web3";
import { getEnvVariable } from "./utils";
import { Follow } from "./structs/follow";
import { Post } from "./structs/post";
import { Comment } from "./structs/comment";

// Load .env file content into process.env
dotenv.config();

// Get environment variables
const privateKey = getEnvVariable("PRIVATE_KEY1");
const privateKey2 = getEnvVariable("PRIVATE_KEY2");
const profileAddress = getEnvVariable("PROFILE_ADDRESS");

let testnetClient: any;
let testnetClient2: any;

// Initialize clients
async function initClient() {
  const baseAccount = await WalletClient.getAccountFromSecretKey(privateKey);
  const baseAccount2 = await WalletClient.getAccountFromSecretKey(privateKey2);
  const chainId = CHAIN_ID.BuildNet;

  testnetClient = await ClientFactory.createDefaultClient(
    DefaultProviderUrls.BUILDNET,
    chainId,
    true, // retry failed requests
    baseAccount // optional parameter
  );

  testnetClient2 = await ClientFactory.createDefaultClient(
    DefaultProviderUrls.BUILDNET,
    chainId,
    true, // retry failed requests
    baseAccount2 // optional parameter
  );
}

async function claim(amount: number, to: string) {
  let claimArgs = new Args().addU64(fromMAS(amount)).addString(to);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "claim",
    parameter: claimArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function receiveCoins(amount: number) {
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "receiveCoins",
    parameter: new Args().serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(amount),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function transferOwnership(newOwner: string) {
  let transferOwnershipArgs = new Args().addString(newOwner);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "transferOwnership",
    parameter: transferOwnershipArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function followProfile(userAddress: string) {
  let followProfileArgs = new Args().addString(userAddress);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "followProfile",
    parameter: followProfileArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function unfollowProfile(userAddress: string) {
  let unfollowProfileArgs = new Args().addString(userAddress);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "unfollowProfile",
    parameter: unfollowProfileArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function getAllUserFollowers(selectionPart: number) {
  const followers = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getAllUserFollowers",
    parameter: new Args().addU64(BigInt(selectionPart)),
  });

  const followersRes = new Args(
    followers.returnValue
  ).nextSerializableObjectArray<Follow>(Follow);
  console.log("Folowers :", followersRes);
}

async function getAllUserFollowings(selectionPart: number) {
  const followings = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getAllUserFollowings",
    parameter: new Args().addU64(BigInt(selectionPart)),
  });

  const followingsRes = new Args(
    followings.returnValue
  ).nextSerializableObjectArray<Follow>(Follow);
  console.log("Followings :", followingsRes);
}

async function createPost(title: string, text: string, image: string) {
  let postArgs = new Args().addString(title).addString(text).addString(image);
  const tx = await testnetClient2.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "createPost",
    parameter: postArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function updatePost(
  postId: number,
  title: string,
  text: string,
  image: string
) {
  let updatePostArgs = new Args()
    .addU64(BigInt(postId))
    .addString(title)
    .addString(text)
    .addString(image);
  const tx = await testnetClient2.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "updatePost",
    parameter: updatePostArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function repostPost(postId: number) {
  let repostPostArgs = new Args().addU64(BigInt(postId));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "repostPost",
    parameter: repostPostArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function deletePost(postId: number) {
  let deletePostArgs = new Args().addU64(BigInt(postId));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "deletePost",
    parameter: deletePostArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function getPosts(selectionPart: number) {
  const posts = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getPosts",
    parameter: new Args().addU64(BigInt(selectionPart)),
  });

  const postsRes = new Args(
    posts.returnValue
  ).nextSerializableObjectArray<Post>(Post);
  console.log("Posts :", postsRes);
}

async function getPost(postId: number) {
  const post = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getPost",
    parameter: new Args().addU64(BigInt(postId)),
  });

  const postRes = new Args(post.returnValue).nextSerializable<Post>(Post);
  console.log("Post :", postRes);
}

async function likePost(postId: number) {
  let likePostArgs = new Args().addU64(BigInt(postId));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "likePost",
    parameter: likePostArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function unlikePost(postId: number) {
  let unlikePostArgs = new Args().addU64(BigInt(postId));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "unlikePost",
    parameter: unlikePostArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function getPostLikedUsers(selectionPart: number, postId: number) {
  const users = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getPostLikedUsers",
    parameter: new Args().addU64(BigInt(selectionPart)).addU64(BigInt(postId)),
  });

  const usersRes = new Args(users.returnValue).nextArray(ArrayTypes.STRING);
  console.log("Users :", usersRes);
}

async function addPostComment(
  postId: number,
  text: string,
  parentCommentIdOpt: number
) {
  let addPostCommentArgs = new Args()
    .addU64(BigInt(postId))
    .addString(text)
    .addU64(BigInt(parentCommentIdOpt));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "addPostComment",
    parameter: addPostCommentArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function removeComment(commentId: number) {
  let removeCommentArgs = new Args().addU64(BigInt(commentId));
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "removeComment",
    parameter: removeCommentArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function getPostComments(postId: number) {
  const comments = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getPostComments",
    parameter: new Args().addU64(BigInt(postId)),
  });

  const commentsRes = new Args(
    comments.returnValue
  ).nextSerializableObjectArray<Comment>(Comment);
  console.log("Comments :", commentsRes);
}

async function getCommentReplies(commentId: number) {
  const comments = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getCommentReplies",
    parameter: new Args().addU64(BigInt(commentId)),
  });

  const commentsRes = new Args(
    comments.returnValue
  ).nextSerializableObjectArray<Comment>(Comment);
  console.log("Comments :", commentsRes);
}

async function getAllComments() {
  const comments = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: profileAddress,
    targetFunction: "getAllComments",
    parameter: new Args(),
  });

  const commentsRes = new Args(
    comments.returnValue
  ).nextSerializableObjectArray<Comment>(Comment);
  console.log("Comments :", commentsRes);
}

async function deleteAccount() {
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: profileAddress,
    targetFunction: "deleteAccount",
    parameter: new Args().serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function main() {
  try {
    await initClient();
    // await transferOwnership(
    //   "AU12uctMA217TsaumbZag89HABxyEmkSAM1XhyQEn5qh5SVV57sF8"
    // );
    // await followProfile(
    //   "AS12ARoFwjgvLnZiiD1oTY2mGLYfBS6WWWEiUNFxJ394ZMHw8b28N"
    // );
    // await unfollowProfile(
    //   "AS12ARoFwjgvLnZiiD1oTY2mGLYfBS6WWWEiUNFxJ394ZMHw8b28N"
    // );
    // await getAllUserFollowers(1);
    // await getAllUserFollowings(1);
    // await createPost("FIRST POST", "text for the second post", "image.png");
    // await updatePost(1, "UPDATED POST", "text updated post", "image.png");
    // await getPosts(1);
    // await getPost(1);
    // await repostPost(1);
    // await likePost(1);
    // await unlikePost(1);
    // await getPostLikedUsers(1, 1);
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
main();
