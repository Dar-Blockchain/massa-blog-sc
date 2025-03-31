import {
  Args,
  IDeserializedResult,
  ISerializable,
} from "@massalabs/massa-web3";

export class Post implements ISerializable<Post> {
  constructor(
    public id: bigint = BigInt(0),
    public author: string = "",
    public title: string = "",
    public text: string = "",
    public image: string = "",
    public createdAt: bigint = BigInt(0)
  ) {}

  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addString(this.author)
      .addString(this.title)
      .addString(this.text)
      .addString(this.image)
      .addU64(this.createdAt)
      .serialize();
    return Uint8Array.from(args);
  }

  deserialize(buffer: Uint8Array, offset: number): IDeserializedResult<Post> {
    const args = new Args(buffer, offset);

    this.id = args.nextU64();
    this.author = args.nextString();
    this.title = args.nextString();
    this.text = args.nextString();
    this.image = args.nextString();
    this.createdAt = args.nextU64();

    return {
      instance: this,
      offset: args.getOffset(),
    };
  }
}
