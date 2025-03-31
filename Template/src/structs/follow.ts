import {
  Args,
  IDeserializedResult,
  ISerializable,
} from "@massalabs/massa-web3";

export class Follow implements ISerializable<Follow> {
  constructor(
    public id: bigint = BigInt(0),
    public follower: string = "",
    public followed: string = "",
    public createdAt: bigint = BigInt(0)
  ) {}

  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addString(this.follower)
      .addString(this.followed)
      .addU64(this.createdAt)
      .serialize();
    return Uint8Array.from(args);
  }

  deserialize(buffer: Uint8Array, offset: number): IDeserializedResult<Follow> {
    const args = new Args(buffer, offset);

    this.id = args.nextU64();
    this.follower = args.nextString();
    this.followed = args.nextString();
    this.createdAt = args.nextU64();

    return {
      instance: this,
      offset: args.getOffset(),
    };
  }
}
