import {
  Args,
  IDeserializedResult,
  ISerializable,
} from "@massalabs/massa-web3";

export class Profile implements ISerializable<Profile> {
  constructor(
    public profileContract: string = "",
    public address: string = "",
    public firstName: string = "",
    public lastName: string = "",
    public avatar: string = "",
    public bio: string = ""
  ) {}

  serialize(): Uint8Array {
    const args = new Args()
      .addString(this.profileContract)
      .addString(this.address)
      .addString(this.firstName)
      .addString(this.lastName)
      .addString(this.avatar)
      .addString(this.bio)
      .serialize();
    return Uint8Array.from(args);
  }

  deserialize(
    buffer: Uint8Array,
    offset: number
  ): IDeserializedResult<Profile> {
    const args = new Args(buffer, offset);

    this.profileContract = args.nextString();
    this.address = args.nextString();
    this.firstName = args.nextString();
    this.lastName = args.nextString();
    this.avatar = args.nextString();
    this.bio = args.nextString();

    return {
      instance: this,
      offset: args.getOffset(),
    };
  }
}
