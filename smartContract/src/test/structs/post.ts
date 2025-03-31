import { Args, DeserializedResult, Serializable } from '@massalabs/massa-web3';

export class Post implements Serializable<Post> {
  constructor(
    public id: bigint = 0n, // Use bigint to handle u64 values in JavaScript
    public author: string = '', // Address serialized as string
    public text: string = '',
    public image: string = '',
    public isRepost: boolean = false,
    public repostedPostId: bigint = 0n, // Use bigint for u64 values
    public createdAt: bigint = 0n, // Use bigint for timestamp
  ) {}

  // Serialize the Post object for sending to the backend
  serialize(): Uint8Array {
    const args = new Args()
      .addU64(this.id)
      .addString(this.author) // Author as a string
      .addString(this.text)
      .addString(this.image)
      .addBool(this.isRepost)
      .addU64(this.repostedPostId)
      .addU64(this.createdAt);

    return new Uint8Array(args.serialize());
  }

  // Deserialize the data received from the backend
  deserialize(data: Uint8Array, offset: number): DeserializedResult<Post> {
    const args = new Args(data, offset);

    this.id = args.nextU64(); // Deserialize id as bigint
    this.author = args.nextString(); // Deserialize author
    this.text = args.nextString(); // Deserialize text
    this.image = args.nextString(); // Deserialize image
    this.isRepost = args.nextBool(); // Deserialize isRepost
    this.repostedPostId = args.nextU64(); // Deserialize repostedPostId as bigint
    this.createdAt = args.nextU64(); // Deserialize createdAt as bigint

    return { instance: this, offset: args.getOffset() };
  }
}
