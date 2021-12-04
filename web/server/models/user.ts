import mongoose from 'mongoose';
import { validateEmail } from '../../utils/validation';
import type { Model, HydratedDocument } from 'mongoose';

export interface User {
  email: string;
  username: string;
  password: string;
  qnaScore: number;
  fio: string;
}

export type UserPublicData = Omit<User, 'password'>;

interface UserModel extends Model<User> {
  findByEmail(email: string): Promise<HydratedDocument<User> | null>;
  findByName(username: string): Promise<HydratedDocument<User> | null>;
  findByNameOrEmail(nameOrEmail: string): Promise<HydratedDocument<User> | null>;
}

export const userPublicFields: (keyof UserPublicData)[] = [
  'fio',
  'email',
  'username',
  'qnaScore',
];

const schema = new mongoose.Schema<User, UserModel>({
  qnaScore: {
    type: Number,
    default: 0,
  },
  fio: {
    type: String,
    trim: true,
    required: true,
    validate: {
      validator: (value = '') => value.length > 3 && value.length < 100,
    },
  },
  username: {
    type: String,
    trim: true,
    unique: true,
    required: true,
    validate: {
      validator: (value = '') => value.length > 3 && value.length < 100,
    },
  },
  password: {
    type: String,
    trim: true,
    required: true,
  },
  email: {
    type: String,
    trim: true,
    lowercase: true,
    unique: true,
    required: true,
    validate: {
      validator: (value = '') => validateEmail(value),
    },
  },
});

schema.statics.findByEmail = function findByEmail(email: string) {
  return this.findOne({ email });
};

schema.statics.findByName = function findByEmail(username: string) {
  return this.findOne({ username });
};

schema.statics.findByNameOrEmail = async function findByNameOrEmail(nameOrEmail: string) {
  try {
    const user = await this.findByName(nameOrEmail);
    if (user) return user;
  } catch (e) {
    console.warn(e);
  }
  try {
    return await this.findByEmail(nameOrEmail);
  } catch (e) {
    console.warn(e);
  }
  return null;
};

export default ((): UserModel => {
  try {
    return mongoose.model<User, UserModel>('user');
  } catch {
    return mongoose.model<User, UserModel>('user', schema);
  }
})();
