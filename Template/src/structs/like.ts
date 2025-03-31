import {
  Args,
  IDeserializedResult,
  ISerializable,
} from "@massalabs/massa-web3";

export class Like implements ISerializable<Like> {
  constructor(
    public id: bigint = BigInt(0),
    public userAddress: string = "",
    public postId: bigint = BigInt(0),
    public createdAt: bigint = BigInt(0)
  ) {}

  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addString(this.userAddress)
      .addU64(this.postId)
      .addU64(this.createdAt)
      .serialize();
    return Uint8Array.from(args);
  }

  deserialize(buffer: Uint8Array, offset: number): IDeserializedResult<Like> {
    const args = new Args(buffer, offset);

    this.id = args.nextU64();
    this.userAddress = args.nextString();
    this.postId = args.nextU64();
    this.createdAt = args.nextU64();

    return {
      instance: this,
      offset: args.getOffset(),
    };
  }
}
