import { Args, Result, Serializable } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';

export class Post implements Serializable {
  constructor(
    public id: u64 = 0,
    public author: Address = new Address(), // Profile contract address
    public title: string = '',
    public excerpt: string = '',
    public content: string = '', // Previously "text"
    public featuredImage: string = '', // Previously "image"
    public categoryId: string = '',
    public readingTime: u64 = 0,
    public tags: string = '', // Comma-separated
    public createdAt: u64 = 0,
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.id)
      .add(this.author)
      .add(this.title)
      .add(this.excerpt)
      .add(this.content)
      .add(this.featuredImage)
      .add(this.categoryId)
      .add(this.readingTime)
      .add(this.tags)
      .add(this.createdAt)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);
    this.id = args.nextU64().expect('Failed to deserialize id');
    this.author = new Address(
      args.nextString().expect('Failed to deserialize author'),
    );
    this.title = args.nextString().expect('Failed to deserialize title');
    this.excerpt = args.nextString().expect('Failed to deserialize excerpt');
    this.content = args.nextString().expect('Failed to deserialize content');
    this.featuredImage = args
      .nextString()
      .expect('Failed to deserialize featuredImage');
    this.categoryId = args
      .nextString()
      .expect('Failed to deserialize categoryId');
    this.readingTime = args
      .nextU64()
      .expect('Failed to deserialize readingTime');
    this.tags = args.nextString().expect('Failed to deserialize tags');
    const createdAtTimestamp = args.nextU64();
    this.createdAt = createdAtTimestamp.isOk()
      ? createdAtTimestamp.unwrap()
      : 0;

    return new Result(args.offset);
  }
}
