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

export async function createProfile(contract: SmartContract,templateAddress:string) {
  console.log('Adding a post to the contract...');
const args = new Args()
  .addString(templateAddress) // Template address
  .addString('John') // First name
  .addString('Doe') // Last name
  .addString('Blockchain enthusiast') // Bio
  .addString('base64encodedphoto') // Photo (base64 encoded)
  .addString('USA') // Country
  .addString('New York') // City
  .addString('@johndoe') // Telegram
  .addString('@johndoe_x') // X handle
  const operation = await contract.call('createAccount', args.serialize(), {
    coins: Mas.fromString('6'),
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
