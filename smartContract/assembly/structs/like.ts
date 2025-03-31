import { Args, Result, Serializable } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';

export class Like implements Serializable {
  constructor(
    public id: u64 = 0,
    public userAddress: Address = new Address(''),
    public postId: u64 = 0,
    public createdAt: u64 = 0,
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.id)
      .add(this.userAddress)
      .add(this.postId)
      .add(this.createdAt)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);

    this.id = args.nextU64().expect('Failed to deserialize id');
    this.userAddress = new Address(
      args.nextString().expect('Failed to deserialize userAddress'),
    );
    this.postId = args.nextU64().expect('Failed to deserialize postId');
    this.createdAt = args.nextU64().expect('Failed to deserialize createdAt');

    return new Result(args.offset);
  }
}
