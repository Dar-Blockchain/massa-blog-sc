import { Args, Result } from '@massalabs/as-types';
import { Serializable } from '@massalabs/as-types';

export class Category implements Serializable {
  constructor(
    public id: u64 = 0,
    public name: string = '',
    public thumbnail: string = '',
    public count: u64 = 0,
  ) {}

  serialize(): StaticArray<u8> {
    return new Args()
      .add(this.id)
      .add(this.name)
      .add(this.thumbnail)
      .add(this.count)
      .serialize();
  }

  deserialize(data: StaticArray<u8>, offset: i32): Result<i32> {
    const args = new Args(data, offset);
    this.id = args.nextU64().expect('Failed to deserialize id');
    this.name = args.nextString().expect('Failed to deserialize name');
    this.thumbnail = args
      .nextString()
      .expect('Failed to deserialize thumbnail');
    this.count = args.nextU64().expect('Failed to deserialize count');
    return new Result(args.offset);
  }
}
