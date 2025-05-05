import {
  Account,
  Args,
  Mas,
  SmartContract,
  Web3Provider,
} from '@massalabs/massa-web3';
import {
  createProfile,
  createPost,
  getProfile,
} from './test/contractFactoryFunc';
import { getScByteCode } from './utils';

const account = await Account.fromEnv('PRIVATE_KEY');
// const account2 = await Account.fromEnv('PRIVATE_KEY_TWO');
const provider = Web3Provider.buildnet(account);
// const provider2 = Web3Provider.buildnet(account2);

console.log('Deploying contract...');

const byteCode = getScByteCode('build', 'accountsFactory.wasm');
const byteCodeProfile = getScByteCode('build', 'profile.wasm');



const _TempconstructorArgs = new Args();
_TempconstructorArgs.addString("AS1EfWLpUZ3YagENXV7z3yzp7Zgm4mha9s54aChvyGFmCedRNYx1")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
  .addString("hatem")
const _Tempcontract = await SmartContract.deploy(
  provider,
  byteCodeProfile,
  _TempconstructorArgs,
  { coins: Mas.fromString('5') },
);
//const contract2 = new SmartContract(provider2, contract.address);
const constructorArgs = new Args().addString(_Tempcontract.address.toString());

const contract = await SmartContract.deploy(
  provider,
  byteCode,
  constructorArgs,
  { coins: Mas.fromString('5') },
);
console.log('Contract deployed at:', contract.address);

console.log('Interacting with contract:', contract.address);

async function testCreateProfile(profile:any) {
  await createProfile(contract,profile);
  // update user profile
  
}

const profile:any = {
  firstName:"Hatem",
  lastName:"Bouzidi",
  profilePicUrl:"https://www.google.com",
  bio:"Hello World",
  coverPhotoUrl:"https://www.google.com",
  email:"hatem.bouzidi@outlook.com",
  facebook:"https://www.facebook.com",
  twitter:"https://www.twitter.com",
  linkedin:"https://www.linkedin.com",
  instagram:"https://www.instagram.com",
  website:"https://www.website.com"

}
await testCreateProfile(profile);

console.log('All the smart conract Events :');

const events = await provider.getEvents({
  smartContractAddress: contract.address,
});

for (const event of events) {
  console.log('Event message:', event.data);
}

async function testCreatePost(contract_address: string) {
  const contract2 = new SmartContract(provider, contract_address);

  console.log('Creating a post...');
  const success = await createPost(
    contract2,
    "Blockchain Revolution",          // title
    "How blockchain is changing the world", // excerpt
    "This is a detailed post about...", // content
    "https://example.com/blockchain.jpg", // featuredImage
    "technology",                     // categoryId
    BigInt(5),                               // readingTime (minutes)
    "blockchain,web3,decentralization" // tags
  );

  if (success) {
    console.log('Post created successfully');
  } else {
    console.error('Failed to create post');
  }
}

async function testGetProfile(contract: SmartContract) {
  try {
    const callerAddress = account.address;
    console.log('Fetching profile for:', callerAddress);
    
    const profile = await getProfile(contract, callerAddress.toString());
    console.log('Retrieved profile:', profile);
    return profile;
  } catch (error) {
    console.error('Error getting profile:', error);
    throw error;
  }
}



const profile_account = await testGetProfile(contract);
console.log('Profile:', profile_account);


await testCreatePost(profile_account.profileContract.toString());