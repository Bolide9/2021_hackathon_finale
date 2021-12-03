import jwt from 'jsonwebtoken';
import UserModel from './models/user';
import type { Request } from 'express';
import type { User } from './models/user';
import type { HydratedDocument } from 'mongoose';

const secret = process.env.AUTH_SECRET_KEY || 'super-secret-key-lol';

export const authenticate = (data: {
  email: string;
  username: string;
}) => jwt.sign(data, secret);

export const parseToken = (token = ''): { email: string; username: string; } | null => {
  try {
    const payload = jwt.verify(token?.replace(/^Bearer\s/, ''), secret);
    return !payload || typeof payload === 'string' ? null : payload as ANY;
  } catch (e) {
    return null;
  }
};

export const getUser = async (req: Request): Promise<HydratedDocument<User> | null> => {
  const { email } = parseToken(req.cookies.access_token) || {};
  return (email && await UserModel.findByEmail(email)) || null;
};
