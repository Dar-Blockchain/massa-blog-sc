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
  getPostsByAuthor,
  getPostById,
  followProfile,
  addPostComment,
} from './test/contractFactoryFunc';
import { getScByteCode } from './utils';

const account = await Account.fromEnv('PRIVATE_KEY');
const account2 = await Account.fromEnv('PRIVATE_KEY_TWO');
const provider = Web3Provider.buildnet(account);
const provider2 = Web3Provider.buildnet(account2);

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
// Deploy the main contract
const constructorArgs = new Args().addString(_Tempcontract.address.toString());
const contract = await SmartContract.deploy(
  provider,
  byteCode,
  constructorArgs,
  { coins: Mas.fromString('15') },
);
console.log('Main Contract deployed at:', contract.address);

// Create contract instance for second account
const contract2 = new SmartContract(provider2, contract.address);

// Profile data for two users
const profile1 = {
  firstName: "Alice",
  lastName: "Johnson",
  profilePicUrl: "https://example.com/alice.jpg",
  bio: "Profile 1 - Tech enthusiast",
  coverPhotoUrl: "https://example.com/alice-cover.jpg",
  email: "alice@example.com",
  facebook: "https://facebook.com/alice",
  twitter: "https://twitter.com/alice",
  linkedin: "https://linkedin.com/alice",
  instagram: "https://instagram.com/alice",
  website: "https://alice-blog.com"
};

const profile2 = {
  firstName: "Bob",
  lastName: "Smith",
  profilePicUrl: "https://example.com/bob.jpg",
  bio: "Profile 2 - Web3 developer",
  coverPhotoUrl: "https://example.com/bob-cover.jpg",
  email: "bob@example.com",
  facebook: "https://facebook.com/bob",
  twitter: "https://twitter.com/bob",
  linkedin: "https://linkedin.com/bob",
  instagram: "https://instagram.com/bob",
  website: "https://bob-blog.com"
};

async function testCreateTwoProfilesAndFollow() {
  try {
    console.log('Creating profile 1...');
    await createProfile(contract, profile1);
    const profile1Data = await getProfile(contract, account.address.toString());
    console.log('Profile 1 created with contract:', profile1Data.profileContract.toString());

    console.log('Creating profile 2...');
    await createProfile(contract2, profile2);
    const profile2Data = await getProfile(contract, account2.address.toString());
    console.log('Profile 2 created with contract:', profile2Data.profileContract.toString());

    // Create SmartContract instance for profile1's contract
    const profile1Contract = new SmartContract(provider, profile1Data.profileContract);

    console.log('Testing follow functionality...');
    console.log('Profile 1 following Profile 2...');
    
    const success = await followProfile(
      profile1Contract,
      account.address.toString(),
      profile2Data.profileContract.toString()
    );

    if (success) {
      console.log('Profile 1 successfully followed Profile 2');
    } else {
      console.log('Failed to follow Profile 2');
    }

    return { profile1: profile1Data, profile2: profile2Data, followSuccess: success };
  } catch (error) {
    console.error('Error in create profiles and follow test:', error);
    throw error;
  }
}

// Run the test
console.log('Starting profile creation and follow test...');
const testResult = await testCreateTwoProfilesAndFollow();
console.log('Test completed. Results:', testResult);

// Get events to verify
const events = await provider.getEvents({
  smartContractAddress: contract.address,
});

console.log('Smart contract events:');
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

console.log('Testing get posts by author...');
const authorPosts = await testGetPostsByAuthor(contract, profile_account.address.toString());
console.log('Total posts retrieved:', authorPosts.length);

async function testGetPostsByAuthor(contract: SmartContract, authorAddress: string) {
  try {
    console.log('Fetching posts for author:', authorAddress);
    
    // Get first page of posts (10 posts per page)
    const posts = await getPostsByAuthor(contract, authorAddress, 1);
    
    console.log('Number of posts found:', posts.length);
    posts.forEach((post, index) => {
      console.log(`Post ${index + 1}:`);
      console.log('- Title:', post.title);
      console.log('- Excerpt:', post.excerpt);
      console.log('- Category:', post.categoryId);
      console.log('- Created at:', new Date(Number(post.createdAt)).toLocaleString());
      console.log('---');
    });

    return posts;
  } catch (error) {
    console.error('Error getting author posts:', error);
    throw error;
  }
}

async function testGetPostById(contract: SmartContract, authorAddress: string, postId: bigint) {
  try {
    console.log('Fetching post by ID:', postId, 'from author:', authorAddress);
    
    const post = await getPostById(contract, authorAddress, postId);
    
    console.log('Retrieved post:');
    console.log('- ID:', post.id.toString());
    console.log('- Title:', post.title);
    console.log('- Author:', post.author);
    console.log('- Content:', post.content);
    console.log('- Category:', post.categoryId);
    console.log('- Created at:', new Date(Number(post.createdAt)).toLocaleString());

    return post;
  } catch (error) {
    console.error('Error getting post by ID:', error);
    throw error;
  }
}

// After creating a post and getting posts by author, test getting a specific post
if (authorPosts.length > 0) {
  console.log('Testing get post by ID...');
  const firstPost = authorPosts[0];
  const postById = await testGetPostById(contract, profile_account.address.toString(), firstPost.id);
  console.log('Successfully retrieved post by ID:', postById.id.toString());
}

async function testFollowProfile(contract: SmartContract, user: string, userToFollow: string) {
  try {
    console.log('Testing follow profile functionality...');
    console.log('Current user:', account.address.toString());
    console.log('User to follow:', userToFollow);
    
    // Get the profile contract address of the user to follow
    const userProfile = await getProfile(contract, user);
    const userTofollow = await getProfile(contract, userToFollow);

    // Follow the user
    const success = await followProfile(
      new SmartContract(provider, userProfile.profileContract),
      userProfile.address.toString(),
      userTofollow.profileContract.toString()
    );
    
    if (success) {
      console.log('Successfully followed user:', userToFollow);
    } else {
      console.log('Failed to follow user:', userToFollow);
    }
    
    return success;
  } catch (error) {
    console.error('Error in follow profile test:', error);
    throw error;
  }
}

async function testAddPostComment(contract: SmartContract, postId: bigint, text: string, parentCommentId?: bigint) {
  try {
    console.log('Testing add post comment functionality...');
    console.log('Adding comment to post ID:', postId.toString());
    console.log('Comment text:', text);
    
    if (parentCommentId) {
      console.log('Reply to comment ID:', parentCommentId.toString());
    }
    
    const success = await addPostComment(contract, postId, text, parentCommentId);
    
    if (success) {
      console.log('Comment added successfully!');
    } else {
      console.log('Failed to add comment');
    }
    
    return success;
  } catch (error) {
    console.error('Error in add post comment test:', error);
    throw error;
  }
}

// Test follow profile functionality (add this after other tests)
console.log('Testing follow profile functionality...');
// You can replace this with any valid user address you want to follow
//await testFollowProfile(contract,account.address.toString(), account2.address.toString());

// Test comment functionality
if (authorPosts.length > 0) {
  console.log('\n=== Testing Comment Functionality ===');
  const firstPost = authorPosts[0];
  
  // Test adding a regular comment
  console.log('Testing regular comment...');
  const commentSuccess = await testAddPostComment(
    contract, 
    firstPost.id, 
    "This is a great post! Thanks for sharing."
  );
  
  if (commentSuccess) {
    // Test adding a reply comment (assuming first comment has ID 1)
    console.log('Testing reply comment...');
    await testAddPostComment(
      contract, 
      firstPost.id, 
      "I totally agree with the previous comment!", 
      BigInt(1) // Reply to the first comment
    );
  }
  
  console.log('Comment tests completed!');
}