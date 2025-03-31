import { Args, DeserializedResult, Serializable } from '@massalabs/massa-web3';

export class Follow implements Serializable<Follow> {
  constructor(
    public id: bigint = 0n, // Use bigint for u64
    public follower: string = '', // Address serialized as a string
    public followed: string = '', // Address serialized as a string
    public createdAt: bigint = 0n, // Use bigint for timestamps
  ) {}

  // Serialize the Follow object
  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addString(this.follower) // Follower's address as string
      .addString(this.followed) // Followed's address as string
      .addU64(this.createdAt);

    return new Uint8Array(args.serialize());
  }

  // Deserialize the Follow object
  deserialize(data: Uint8Array, offset: number): DeserializedResult<Follow> {
    const args = new Args(data, offset);

    this.id = args.nextU64(); // Deserialize id
    this.follower = args.nextString(); // Deserialize follower address
    this.followed = args.nextString(); // Deserialize followed address
    this.createdAt = args.nextU64(); // Deserialize createdAt timestamp

    return { instance: this, offset: args.getOffset() };
  }
}
