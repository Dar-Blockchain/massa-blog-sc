import { Args, Result, Serializable } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';

export class Repost implements Serializable {
  constructor(
    public id: u64 = 0,
    public originalPostId: u64 = 0,
    public authorProfileContract: Address = new Address(''),
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.id)
      .add(this.originalPostId)
      .add(this.authorProfileContract)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);
    this.id = args.nextU64().expect('Failed to deserialize id');
    this.originalPostId = args
      .nextU64()
      .expect('Failed to deserialize originalPostId');
    this.authorProfileContract = new Address(
      args.nextString().expect('Failed to deserialize authorProfileContract'),
    );
    return new Result(args.offset);
  }
}
