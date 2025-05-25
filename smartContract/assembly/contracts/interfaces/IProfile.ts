import { call } from '@massalabs/massa-as-sdk';
import {
    Args,
    bytesToString,
    bytesToU256,
   
  } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';
import { Post } from '../../structs/post';

export class IProfile {
  constructor(private _origin: Address) {}

  /**
   * Get paginated posts from this profile
   * @param selectionPart Pagination parameter (1-based)
   */
  getPosts(selectionPart: u64): Post[] {
    const res = call(
      this._origin,
      'getPosts',
      new Args().add(selectionPart),
      0
    );
    return new Args(res).nextSerializableObjectArray<Post>().unwrap();
  }

  /**
   * Get a specific post by its ID
   * @param postId The ID of the post to retrieve
   */
  getPostById(postId: u64): Post {
    const res = call(
      this._origin,
      'getPostById',
      new Args().add(postId),
      0
    );
    return new Args(res).nextSerializable<Post>().unwrap();
  }

  /**
   * Add a comment to a post
   * @param postId The ID of the post to comment on
   * @param text The comment text
   * @param parentCommentId Optional parent comment ID for replies
   */
  addPostComment(postId: u64, text: string, parentCommentId: u64 = 0): void {
    const args = new Args()
      .add(postId)
      .add(text);
    
    if (parentCommentId > 0) {
      args.add(parentCommentId);
    }

    call(
      this._origin,
      'addPostComment',
      args,
      0
    );
  }
}
