import {
  Args,
  IDeserializedResult,
  ISerializable,
} from "@massalabs/massa-web3";

export class Comment implements ISerializable<Comment> {
  constructor(
    public id: bigint = BigInt(0),
    public postId: bigint = BigInt(0),
    public commenter: string = "",
    public text: string = "",
    public createdAt: bigint = BigInt(0),
    public parentId: bigint = BigInt(0)
  ) {}

  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addU64(this.postId)
      .addString(this.commenter)
      .addString(this.text)
      .addU64(this.createdAt)
      .addU64(this.parentId)
      .serialize();
    return Uint8Array.from(args);
  }

  deserialize(
    buffer: Uint8Array,
    offset: number
  ): IDeserializedResult<Comment> {
    const args = new Args(buffer, offset);

    this.id = args.nextU64();
    this.postId = args.nextU64();
    this.commenter = args.nextString();
    this.text = args.nextString();
    this.createdAt = args.nextU64();
    this.parentId = args.nextU64();

    return {
      instance: this,
      offset: args.getOffset(),
    };
  }
}
