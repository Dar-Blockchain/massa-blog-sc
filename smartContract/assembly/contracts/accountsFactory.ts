import {
  createSC,
  call,
  Context,
  Storage,
  generateEvent,
  createEvent,
  getBytecodeOf,
  Address,
  caller,
  balance,
  isAddressEoa,
  transferCoins,
  transferredCoins,
} from '@massalabs/massa-as-sdk';
import {
  Args,
  stringToBytes,
  bytesToSerializableObjectArray,
} from '@massalabs/as-types';
import { Profile } from '../structs/profile';
import {
  profileMap,
  PROFILE_OWNERS,
  ACCOUNT_TEMPLATE,
  OWNER_KEY,
  USERS,
  ONE_UNIT,
  CATEGORIES_KEY,
  DEFAULT_CATEGORIES,
} from './storage';
import { Post } from '../structs/post';
import { onlyOwner } from './utils/ownership';
import { Category } from '../structs/category';

/**
 * Smart contract constructor - Initializes the contract at deployment.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the profile template address.
 */
export function constructor(binaryArgs: StaticArray<u8>): void {
  assert(
    Context.isDeployingContract(),
    'constructor can only be called at deployment',
  );

  const args = new Args(binaryArgs);
  const addressOfTemplate = args
    .nextString()
    .expect('Profile template address required');
  Storage.set(OWNER_KEY, Context.caller().toString());
  Storage.set(ACCOUNT_TEMPLATE, addressOfTemplate);
  Storage.set(USERS, new Args().add<Array<string>>([]).serialize());
  Storage.set(
    CATEGORIES_KEY,
    new Args()
      .addSerializableObjectArray<Category>(DEFAULT_CATEGORIES)
      .serialize()
      .toString(),
  );

  generateEvent(createEvent('FactoryDeployed', [Context.caller().toString()]));
}

/**
 * Function to handle deposits to the contract.
 *
 * @param {StaticArray<u8>} _ - Unused parameter.
 */
export function receiveCoins(_: StaticArray<u8>): void {
  generateEvent(
    createEvent('Deposit to the accountFactory contract', [
      Context.caller().toString(),
      Context.transferredCoins().toString(),
    ]),
  );
}

/************ADMIN FEATURES************/

/**
 * Allows the contract owner to withdraw a specified amount to a given address.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the amount to withdraw and recipient address.
 */
export function claim(binaryArgs: StaticArray<u8>): void {
  // Ensure only the marketplace owner can call this function
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
  if (isAddressEoa(to)) {
    transferCoins(new Address(to), claimAmount);
  } else {
    call(new Address(to), 'receiveCoins', new Args(), claimAmount);
  }

  generateEvent(
    createEvent('Claim from the accountFactory contract', [
      to,
      claimAmount.toString(),
    ]),
  );
}

/**
 * Admin function to add a new category
 */
export function addCategory(binaryArgs: StaticArray<u8>): void {
  onlyOwner();
  const args = new Args(binaryArgs);
  const newCategory = args.nextString().unwrap();

  const categories = new Args(stringToBytes(Storage.get(CATEGORIES_KEY)))
    .nextStringArray()
    .unwrap();

  assert(!categories.includes(newCategory), 'Category already exists');

  categories.push(newCategory);
  Storage.set(
    CATEGORIES_KEY,
    new Args().add<Array<string>>(categories).serialize().toString(),
  );

  generateEvent(createEvent('CategoryAdded', [newCategory]));
}

/**
 * Creates a new profile for a user by deploying a new smart contract instance.
 * Requires a payment of 10 Mas.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing user details.
 */
export function createProfile(binaryArgs: StaticArray<u8>): void {
  assert(
    transferredCoins() >= 10000000000,
    'You need to pay 10 Mas in order to create account',
  );

  assert(
    !profileMap.contains(caller().toString()),
    'This user already have an account',
  );

  const args = new Args(binaryArgs);

  const firstName = args.nextString().expect('First name required');
  const lastName = args.nextString().expect('Last name required');
  const profilePicUrl = args.nextString().expect('Profile picture required');
  const bio = args.nextString().expect('Bio required');
  const coverPhotoUrl = args.nextString().expect('Cover photo required');
  const email = args.nextString().expect('Email required');
  const facebook = args.nextString().unwrapOrDefault();
  const twitter = args.nextString().unwrapOrDefault();
  const linkedin = args.nextString().unwrapOrDefault();
  const instagram = args.nextString().unwrapOrDefault();
  const website = args.nextString().unwrapOrDefault();

  const constructorArgs = new Args().add(caller().toString());
  const profilecontract: StaticArray<u8> = getBytecodeOf(
    new Address(Storage.get(ACCOUNT_TEMPLATE)),
  );
  const newContractAddress = createSC(profilecontract);
  call(newContractAddress, 'constructor', constructorArgs, ONE_UNIT);

  const profile = new Profile(
    newContractAddress,
    caller(),
    firstName,
    lastName,
    profilePicUrl,
    bio,
    coverPhotoUrl,
    email,
    facebook,
    twitter,
    linkedin,
    instagram,
    website,
  );

  let users = new Args(Storage.get(USERS)).nextStringArray().unwrap();
  users.push(caller().toString());
  profileMap.set(caller().toString(), profile);
  Storage.set(USERS, new Args().add<Array<string>>(users).serialize());
  Storage.set(
    PROFILE_OWNERS.concat(newContractAddress.toString()),
    caller().toString(),
  );

  generateEvent(
    createEvent('ProfileCreated', [
      caller().toString(),
      newContractAddress.toString(),
    ]),
  );
}

/**
 * Retrieves a user's profile information.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the user's address.
 * @returns {StaticArray<u8>} - Serialized profile data.
 */
export function getProfile(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);

  const userAddress = args.nextString().unwrap();

  const profile = profileMap.getSome(userAddress);

  return profile.serialize();
}

/**
 * Updates an existing user's profile information.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing updated profile details.
 */
export function updateProfile(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const userAddress = args.nextString().unwrap();
  const newUserAddress = args.nextString().unwrap();
  const newFirstName = args.nextString().unwrap();
  const newLastName = args.nextString().unwrap();
  const newProfilePicUrl = args.nextString().unwrap();
  const newBio = args.nextString().unwrap();
  const newCoverPhotoUrl = args.nextString().unwrap();
  const newEmail = args.nextString().unwrap();
  const newFacebook = args.nextString().unwrap();
  const newTwitter = args.nextString().unwrap();
  const newLinkedin = args.nextString().unwrap();
  const newInstagram = args.nextString().unwrap();
  const newWebsite = args.nextString().unwrap();

  const profile = profileMap.getSome(userAddress);

  assert(
    caller().toString() == profile.address.toString() ||
      caller().toString() == profile.profileContract.toString(),
    'Caller does not have permission to update this profile',
  );

  if (caller().toString() == profile.address.toString()) {
    assert(userAddress == newUserAddress, 'Change user address denied');
  }

  if (userAddress != newUserAddress) {
    profileMap.delete(userAddress);
    profile.address = new Address(newUserAddress);
    Storage.set(PROFILE_OWNERS.concat(caller().toString()), newUserAddress);
  }

  profile.firstName = newFirstName;
  profile.lastName = newLastName;
  profile.profilePicUrl = newProfilePicUrl;
  profile.bio = newBio;
  profile.coverPhotoUrl = newCoverPhotoUrl;
  profile.email = newEmail;
  profile.facebook = newFacebook;
  profile.twitter = newTwitter;
  profile.linkedin = newLinkedin;
  profile.instagram = newInstagram;
  profile.website = newWebsite;

  profileMap.set(newUserAddress.toString(), profile);

  generateEvent(createEvent('UpdateProfile', [userAddress.toString()]));
}

/**
 * Retrieves the profile contract address associated with a user.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the user ID.
 * @returns {StaticArray<u8>} - Serialized profile contract address.
 */
export function getUserProfile(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const userId = args.nextString().expect('Missing userId argument');

  const profile = profileMap.getSome(userId);

  return new Args().add(profile.profileContract).serialize();
}

/**
 * Retrieves the owner of a specific profile contract.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the profile contract address.
 * @returns {StaticArray<u8>} - Serialized owner address.
 */
export function getProfileOwner(binaryArgs: StaticArray<u8>): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const profileContractAddress = args
    .nextString()
    .expect('Missing profileContractAddress argument');

  return new Args()
    .add(Storage.get(PROFILE_OWNERS.concat(profileContractAddress)))
    .serialize();
}

/**
 * Sets or updates the profile contract template.
 * Only the contract owner can execute this function.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the new template address.
 */
export function setProfileTemplate(binaryArgs: StaticArray<u8>): void {
  assert(
    caller().toString() == Storage.get(OWNER_KEY),
    'Only Owner address can execute this function',
  );

  const args = new Args(binaryArgs);
  const addressOfTemplate = args
    .nextString()
    .expect('Template address required');

  Storage.set(ACCOUNT_TEMPLATE, addressOfTemplate);

  generateEvent(createEvent('AccountTemplateChanged', [addressOfTemplate]));
}

/**
 * Deletes a user's profile from the system.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the user's address.
 */
export function deleteProfile(binaryArgs: StaticArray<u8>): void {
  const args = new Args(binaryArgs);
  const userAddress = args.nextString().expect('Missing userAddress argument');

  const profile = profileMap.getSome(userAddress);

  assert(
    caller().toString() == profile.profileContract.toString(),
    'Caller does not have permission to delete this profile',
  );

  let users = new Args(Storage.get(USERS)).nextStringArray().unwrap();
  users.splice(users.indexOf(userAddress), 1);
  Storage.set(USERS, new Args().add<Array<string>>(users).serialize());
  profileMap.delete(userAddress);
  Storage.del(PROFILE_OWNERS.concat(caller().toString()));

  generateEvent(
    createEvent('ProfileDeleted', [
      userAddress,
      profile.profileContract.toString(),
    ]),
  );
}

/**
 * Get all available categories
 */
export function getCategories(): StaticArray<u8> {
  const storedData = Storage.get(CATEGORIES_KEY);
  const bytes = stringToBytes(storedData);

  // Convert back to Category array and unwrap the Result
  const categoriesResult = bytesToSerializableObjectArray<Category>(bytes);
  const categories = categoriesResult.unwrap(); // This extracts the actual array from the Result

  // Re-serialize for the frontend
  return new Args()
    .addSerializableObjectArray<Category>(categories)
    .serialize();
}

/**
 * Retrieves a paginated list of posts by category across all users.
 *
 * @param {StaticArray<u8>} binaryArgs - Serialized arguments containing the category and pagination selection part.
 * @returns {StaticArray<u8>} - Serialized list of posts.
 */
export function getPostsByCategory(
  binaryArgs: StaticArray<u8>,
): StaticArray<u8> {
  const args = new Args(binaryArgs);
  const selectionPart = args.nextU64().unwrap();
  const category = args.nextString().unwrap();

  assert(selectionPart > 0, 'selectionPart should be greater than 0');

  // Verify category exists
  const categories = new Args(stringToBytes(Storage.get(CATEGORIES_KEY)))
    .nextStringArray()
    .unwrap();
  assert(categories.includes(category), 'Invalid category');

  let posts: Post[] = [];
  const users = new Args(Storage.get(USERS)).nextStringArray().unwrap();

  // Iterate through all users
  for (let i = 0; i < users.length; i++) {
    const userProfile = profileMap.get(users[i], new Profile());

    // Call each user's profile contract to get their posts
    const userPosts = new Args(
      call(
        userProfile.profileContract,
        'getPosts',
        new Args().add(selectionPart),
        0,
      ),
    )
      .nextSerializableObjectArray<Post>()
      .unwrap();

    // Filter posts by category
    for (let j = 0; j < userPosts.length; j++) {
      if (userPosts[j].categoryId == category) {
        posts.push(userPosts[j]);
      }
    }
  }

  // Sort posts by timestamp (newest first)
  posts.sort((a, b) => i32(b.createdAt - a.createdAt));

  // Apply pagination
  const start = (selectionPart - 1) * 10;
  const end = i32(Math.min(f64(start + 10), f64(posts.length)));
  const paginatedPosts = posts.slice(i32(start), i32(end));

  return new Args()
    .addSerializableObjectArray<Post>(paginatedPosts)
    .serialize();
}

/**
 * Internal function to update category count
 * @param categoryId - The category ID to update
 * @param increment - True to increment, false to decrement
 */
export function _updateCategoryCount(
  categoryId: string,
  increment: boolean,
): void {
  const categories = new Args(stringToBytes(Storage.get(CATEGORIES_KEY)))
    .nextSerializableObjectArray<Category>()
    .unwrap();

  for (let i = 0; i < categories.length; i++) {
    if (categories[i].id.toString() == categoryId) {
      if (increment) {
        categories[i].count += 1;
      } else {
        categories[i].count =
          categories[i].count > 0 ? categories[i].count - 1 : 0;
      }
      break;
    }
  }

  Storage.set(
    CATEGORIES_KEY,
    new Args()
      .addSerializableObjectArray<Category>(categories)
      .serialize()
      .toString(),
  );
}
