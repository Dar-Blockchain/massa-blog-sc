import { Args, Result, Serializable } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';

export class Follow implements Serializable {
  constructor(
    public id: u64 = 0,
    public follower: Address = new Address(''),
    public followed: Address = new Address(''),
    public createdAt: u64 = 0,
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.id)
      .add(this.follower)
      .add(this.followed)
      .add(this.createdAt)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);

    this.id = args.nextU64().expect('Failed to deserialize id');
    this.follower = new Address(
      args.nextString().expect('Failed to deserialize follower'),
    );
    this.followed = new Address(
      args.nextString().expect('Failed to deserialize followed'),
    );
    this.createdAt = args.nextU64().expect('Failed to deserialize createdAt');

    return new Result(args.offset);
  }
}
