import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'createNote' : ActorMethod<[string, string], undefined>,
}
