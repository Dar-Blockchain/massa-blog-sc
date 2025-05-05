import { Profile } from '../structs/profile';
import { Post } from '../structs/post';
import { PersistentMap } from '../libraries/PersistentMap';
import { Comment } from '../structs/comment';
import { Like } from '../structs/like';
import { Follow } from '../structs/follow';
import { Repost } from '../structs/repost';
import { stringToBytes } from '@massalabs/as-types';
import { Category } from '../structs/category';

export const ACCOUNT_TEMPLATE = 'ACCOUNT_TEMPLATE';
export const OWNER_KEY = 'OWNER_KEY';
export const USERS = stringToBytes('USERS');
export const ONE_UNIT = u64(10 ** 9);

export const PROFILE_OWNERS = 'PROFILE_OWNERS';

export const FACTORY_CONTRACT = 'FACTORY_CONTRACT';
export const START_POST_ID = 1;
export const START_LIKE_ID = 1;
export const START_COMMENT_ID = 1;
export const START_FOLLOW_ID = 1;
export const USERS_ID_KEY = 'usersId';

/**
 * Key used in storage to track the next available post ID.
 * It ensures that each post has a unique and incrementing identifier.
 */
export const POST_ID_KEY = 'postId';

/**
 * Key used in storage to track the next available like ID.
 * It ensures that each like entry has a unique and incrementing identifier.
 */
export const LIKE_ID_KEY = 'likeId';

/**
 * Key used in storage to track the next available comment ID.
 * It ensures that each comment has a unique and incrementing identifier.
 */
export const COMMENT_ID_KEY = 'commentId';

/**
 * Key used in storage to track the next available follow ID.
 * It ensures that each follow has a unique and incrementing identifier.
 */
export const FOLLOW_ID_KEY = 'followId';

/**
 * A persistent map that associates a user's address (as a string) with their profile.
 * Used for storing and retrieving user profiles based on their unique address.
 */
export const profileMap = new PersistentMap<string, Profile>('profile');
export const profile_Address_Map = new PersistentMap<string, string>('profile_Address_Map');

/**
 * A persistent map that associates a post ID (as a string) with a `Post` object.
 * Used for storing and retrieving posts using their unique ID.
 */
export const postMap = new PersistentMap<string, Post>('post');

export const repostsMap = new PersistentMap<string, Repost>('reposts');

/**
 * A persistent map that associates a like ID (as a `u64`) with a `Like` object.
 * Used for storing and retrieving like entries based on their unique ID.
 */
export const likesMap = new PersistentMap<u64, Like>('likesMap');

/**
 * A persistent map that associates a comment ID (as a `u64`) with a `Comment` object.
 * Used for storing and retrieving comments using their unique ID.
 */
export const commentsMap = new PersistentMap<u64, Comment>('comments');

/**
 * A persistent map that associates a follow ID (as a `u64`) with a `Follow` object.
 * Used for storing and retrieving follow entries using their unique ID.
 */
export const followsMap = new PersistentMap<u64, Follow>('follows');

export const usersFollowsMap = new PersistentMap<string, u64>('userFollows');

export function _builduserFollowsKey(user1: string, user2: string): string {
  return `${user1}::${user2}`;
}

export function _buildUserRepostKey(user: string, postId: string): string {
  return `${user}::${postId}`;
}

export const CATEGORIES_KEY = 'CATEGORIES_KEY';

// Initial categories list
export const DEFAULT_CATEGORIES: Category[] = [
  new Category(
    1,
    'Garden',
    'https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    13,
  ),
  new Category(
    2,
    'Jewelry',
    'https://images.unsplash.com/photo-1485841890310-6a055c88698a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    16,
  ),
  new Category(
    3,
    'Industrial',
    'https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
    15,
  ),
  new Category(
    4,
    'Tools',
    'https://images.unsplash.com/photo-1581163276014-3f02795d6d88?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    21,
  ),
  new Category(
    5,
    'Automotive',
    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    19,
  ),
  new Category(
    6,
    'Toys',
    'https://images.unsplash.com/photo-1558060370-d644479cb6f7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    17,
  ),
  new Category(
    7,
    'Outdoors',
    'https://images.unsplash.com/photo-1519981337-7f7c5ac6ca4a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    14,
  ),
  new Category(
    8,
    'Health',
    'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    23,
  ),
  new Category(
    9,
    'Electronics',
    'https://images.unsplash.com/photo-1498049794561-7780e7231661?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    25,
  ),
  new Category(
    10,
    'Sports',
    'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    18,
  ),
  new Category(
    11,
    'Computers',
    'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    22,
  ),
  new Category(
    12,
    'Design',
    'https://images.unsplash.com/photo-1561736778-92e52a7769ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    20,
  ),
  new Category(
    13,
    'Beauty',
    'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    24,
  ),
  new Category(
    14,
    'Books',
    'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    16,
  ),
  new Category(
    15,
    'Life Style',
    'https://images.unsplash.com/photo-1511988617509-a57c8a288659?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    21,
  ),
  new Category(
    16,
    'Graphic Design',
    'https://images.unsplash.com/photo-1626785774573-4b799315345d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    19,
  ),
  new Category(
    17,
    'Politics',
    'https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=550&q=80',
    15,
  ),
];
