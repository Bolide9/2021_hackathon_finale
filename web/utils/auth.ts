import jwt from 'jsonwebtoken';

const secret = process.env.AUTH_SECRET_KEY || 'super-secret-key-fuck-off';

export const authenticate = (data: {
  email: string;
  username: string;
}) => jwt.sign(data, secret);

export const parseToken = (token = '') => {
  try {
    return jwt.verify(token?.replace(/^Bearer\s/, ''), secret);
  } catch (e) {
    console.error(e);
    return null;
  }
};
