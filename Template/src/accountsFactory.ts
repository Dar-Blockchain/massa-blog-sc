import * as dotenv from "dotenv";
import {
  Args,
  CHAIN_ID,
  bytesToStr,
  WalletClient,
  ClientFactory,
  DefaultProviderUrls,
  MAX_GAS_CALL,
  fromMAS,
} from "@massalabs/massa-web3";
import { getEnvVariable } from "./utils";
import { Profile } from "./structs/profile";

// Load .env file content into process.env
dotenv.config();

// Get environment variables
const privateKey1 = getEnvVariable("PRIVATE_KEY1");
const privateKey2 = getEnvVariable("PRIVATE_KEY2");
const factoryAddress = getEnvVariable("FACTORY_ADDRESS");

let testnetClient: any;
let testnetClient2: any;

// Initialize clients
async function initClient() {
  const baseAccount1 = await WalletClient.getAccountFromSecretKey(privateKey1);
  const baseAccount2 = await WalletClient.getAccountFromSecretKey(privateKey2);
  const chainId = CHAIN_ID.BuildNet;

  testnetClient = await ClientFactory.createDefaultClient(
    DefaultProviderUrls.BUILDNET,
    chainId,
    true, // retry failed requests
    baseAccount1 // optional parameter
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
    targetAddress: factoryAddress,
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
    targetAddress: factoryAddress,
    targetFunction: "receiveCoins",
    parameter: new Args().serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(amount),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function createProfile(
  firstName: string,
  lastName: string,
  bio: string,
  photo: string
) {
  let createAccountArgs = new Args()
    .addString(firstName)
    .addString(lastName)
    .addString(bio)
    .addString(photo);
  const tx = await testnetClient2.smartContracts().callSmartContract({
    targetAddress: factoryAddress,
    targetFunction: "createProfile",
    parameter: createAccountArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(10),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function updateProfile(
  userAddress: string,
  newUserAddress: string,
  newFirstName: string,
  newLastName: string,
  newAvatar: string,
  newBio: string
) {
  let updateProfileArgs = new Args()
    .addString(userAddress)
    .addString(newUserAddress)
    .addString(newFirstName)
    .addString(newLastName)
    .addString(newAvatar)
    .addString(newBio);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: factoryAddress,
    targetFunction: "updateProfile",
    parameter: updateProfileArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function getProfile(userAddress: string) {
  const userProfile = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: factoryAddress,
    targetFunction: "getProfile",
    parameter: new Args().addString(userAddress),
  });

  const userProfileRes = new Args(
    userProfile.returnValue
  ).nextSerializable<Profile>(Profile);
  console.log("Profile :", userProfileRes);
}

async function getUserProfile(userId: string) {
  const userContract = await testnetClient.smartContracts().readSmartContract({
    maxGas: BigInt(MAX_GAS_CALL),
    targetAddress: factoryAddress,
    targetFunction: "getUserProfile",
    parameter: new Args().addString(userId),
  });

  const userContractRes = new Args(userContract.returnValue).nextString();
  console.log("user contract is:", userContractRes);
}

async function setProfileTemplate(addressOfTemplate: string) {
  let setAccountTemplateArgs = new Args().addString(addressOfTemplate);
  const tx = await testnetClient.smartContracts().callSmartContract({
    targetAddress: factoryAddress,
    targetFunction: "setProfileTemplate",
    parameter: setAccountTemplateArgs.serialize(),
    maxGas: BigInt(MAX_GAS_CALL),
    coins: fromMAS(0),
    fee: fromMAS(0.01),
  });
  console.log(tx);
}

async function main() {
  try {
    await initClient();
    // await createProfile("Narjes", "Bougoffa", "Infermiere", "Narjes.png");
    // await updateProfile(
    //   "AU1bFBb1FB96M39FEkuopMUiq8osH5tJAZumGs4xkXAo3bVYexFc",
    //   "AU1bFBb1FB96M39FEkuopMUiq8osH5tJAZumGs4xkXAo3bVYexFc",
    //   "Ala",
    //   "Chahtour",
    //   "ala.png",
    //   "Software Blockchain developer"
    // );
    await getUserProfile(
      "AU1bFBb1FB96M39FEkuopMUiq8osH5tJAZumGs4xkXAo3bVYexFc"
    );
    await getProfile("AU1bFBb1FB96M39FEkuopMUiq8osH5tJAZumGs4xkXAo3bVYexFc");
    // await setAccountTemplate(
    //   "AS12E1thfgLkczW4SsSg8MkvGuvQtVgf9RNcVeMWioYpo4bmNuoYt"
    // );
  } catch (error) {
    console.error("An error occurred:", error);
  }
}
main();
