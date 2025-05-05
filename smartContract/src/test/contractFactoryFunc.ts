import {
  Address,
  Args,
  ArrayTypes,
  bytesToSerializableObjectArray,
  bytesToStr,
  DeserializedResult,
  Mas,
  Operation,
  OperationStatus,
  ReadSCData,
  Serializable,
  SmartContract,
} from '@massalabs/massa-web3';
import { Profile } from './structs/profile';
import { Post } from './structs/post';
import { Comment } from './structs/comment';
import { Follow } from './structs/follow';

export async function createProfile(contract: SmartContract,profile:any) {
  console.log('Creating a profile ...');
const args = new Args()
  .addString(profile.firstName)
  .addString(profile.lastName)
  .addString(profile.profilePicUrl)
  .addString(profile.bio)
  .addString(profile.coverPhotoUrl)
  .addString(profile.email)
  .addString(profile.facebook)
  .addString(profile.twitter)
  .addString(profile.linkedin)
  .addString(profile.instagram)
  .addString(profile.website)
  
  const operation = await contract.call('createProfile', args.serialize(), {
    coins: Mas.fromString('15'),
  });

  const operationStatus = await operation.waitFinalExecution();

  if (operationStatus === OperationStatus.Success) {
    console.log('Post added successfully');
    return true;
  } else {
    console.error('Operation failed with status:', operationStatus);
    return false;
  }
}

export async function createPost(
  contract: SmartContract,
  title: string,
  excerpt: string,
  content: string,
  featuredImage: string,
  categoryId: string,
  readingTime: bigint,  // Changed from u64 to number for JS compatibility
  tags: string
): Promise<boolean> {
  
  const postArgs = new Args()
    .addString(title)
    .addString(excerpt)
    .addString(content)
    .addString(featuredImage)
    .addString(categoryId)
    .addU64(readingTime)
    .addString(tags);
    // Note: id, author and createdAt are set by the contract

  const operation = await contract.call('createPost', postArgs.serialize(), {
    coins: Mas.fromString('40'),
  });

  const operationStatus = await operation.waitFinalExecution();

  if (operationStatus === OperationStatus.Success) {
    console.log('Post created successfully');
    return true;
  } else {
    console.error('Operation failed with status:', operationStatus);
    return false;
  }
}

export async function getProfile(contract: SmartContract, address: string): Promise<Profile> {
  console.log('Getting profile for address:', address);
  
  const args = new Args().addString(address);
  const result = await contract.read('getProfile', args.serialize());

  if (result.value) {
    return new Args(result.value).nextSerializable<Profile>(Profile);
  } else {
    throw new Error('Failed to get profile');
  }
}
