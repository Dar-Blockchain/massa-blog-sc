import { Args, Result, Serializable } from '@massalabs/as-types';
import { Address } from '@massalabs/massa-as-sdk';

// User Profile structure
export class Profile implements Serializable {
  constructor(
    public profileContract: Address = new Address(''),
    public address: Address = new Address(''),
    public firstName: string = '',
    public lastName: string = '',
    public profilePicUrl: string = '',
    public bio: string = '',
    public coverPhotoUrl: string = '',
    public email: string = '',
    public facebook: string = '',
    public twitter: string = '',
    public linkedin: string = '',
    public instagram: string = '',
    public website: string = '',
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.profileContract)
      .add(this.address)
      .add(this.firstName)
      .add(this.lastName)
      .add(this.profilePicUrl)
      .add(this.bio)
      .add(this.coverPhotoUrl)
      .add(this.email)
      .add(this.facebook)
      .add(this.twitter)
      .add(this.linkedin)
      .add(this.instagram)
      .add(this.website)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);

    this.profileContract = new Address(
      args.nextString().expect('Failed to deserialize profile address'),
    );
    this.address = new Address(
      args.nextString().expect('Failed to deserialize address'),
    );
    this.firstName = args
      .nextString()
      .expect('Failed to deserialize firstname');
    this.lastName = args.nextString().expect('Failed to deserialize lastName');
    this.profilePicUrl = args
      .nextString()
      .expect('Failed to deserialize profilePicUrl');
    this.bio = args.nextString().expect('Failed to deserialize bio');
    this.coverPhotoUrl = args
      .nextString()
      .expect('Failed to deserialize coverPhotoUrl');
    this.email = args.nextString().expect('Failed to deserialize email');
    this.facebook = args.nextString().unwrap();
    this.twitter = args.nextString().unwrap();
    this.linkedin = args.nextString().unwrap();
    this.instagram = args.nextString().unwrap();
    this.website = args.nextString().unwrap();

    return new Result(args.offset);
  }

  toString(): string {
    return `Address: "${this.address.toString()}", Name: "${this.firstName} ${
      this.lastName
    }", Email: "${this.email}", Bio: "${this.bio}", ProfilePic: "${
      this.profilePicUrl
    }", CoverPhoto: "${this.coverPhotoUrl}", Socials: [FB:${
      this.facebook
    }, TW:${this.twitter}, LI:${this.linkedin}, IG:${this.instagram}, WEB:${
      this.website
    }]`;
  }
}
