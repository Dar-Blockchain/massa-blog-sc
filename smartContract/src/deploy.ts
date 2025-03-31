/* eslint-disable no-console */
import {
  Account,
  Args,
  Mas,
  SmartContract,
  Web3Provider,
} from '@massalabs/massa-web3';
import { getScByteCode } from './utils';

const account = await Account.fromEnv();
const provider = Web3Provider.buildnet(account);

console.log('Deploying contract...');

const byteCode = getScByteCode('build', 'profile.wasm');

const constructorArgs = new Args()
  .addString('test')
  .addString('test')
  .addString('test')
  .addString('test')
  .addString('test');

const contract = await SmartContract.deploy(
  provider,
  byteCode,
  constructorArgs,
  { coins: Mas.fromString('20') },
);

console.log('Contract deployed at:', contract.address);

const events = await provider.getEvents({
  smartContractAddress: contract.address,
});

for (const event of events) {
  console.log('Event message:', event.data);
}
