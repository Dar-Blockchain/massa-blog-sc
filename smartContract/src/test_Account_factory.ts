import {
  Account,
  Args,
  Mas,
  SmartContract,
  Web3Provider,
} from '@massalabs/massa-web3';
import {
  createProfile
} from './test/contractFactoryFunc';
import { getScByteCode } from './utils';

const account = await Account.fromEnv('PRIVATE_KEY');
// const account2 = await Account.fromEnv('PRIVATE_KEY_TWO');
const provider = Web3Provider.buildnet(account);
// const provider2 = Web3Provider.buildnet(account2);

console.log('Deploying contract...');

const byteCode = getScByteCode('build', 'accountsFactory.wasm');
const byteCodeProfile = getScByteCode('build', 'main.wasm');

const constructorArgs = new Args();

const contract = await SmartContract.deploy(
  provider,
  byteCode,
  constructorArgs,
  { coins: Mas.fromString('5') },
);

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

console.log('Contract deployed at:', contract.address);

console.log('Interacting with contract:', contract.address);

async function testCreateProfile() {
  await createProfile(contract,_Tempcontract.address);
  // update user profile
  
}

await testCreateProfile();

console.log('All the smart conract Events :');

const events = await provider.getEvents({
  smartContractAddress: contract.address,
});

for (const event of events) {
  console.log('Event message:', event.data);
}