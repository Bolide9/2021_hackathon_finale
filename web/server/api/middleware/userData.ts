import { getUser } from '../../util';
import type { User } from '../../models/user';
import type { RequestHandler } from 'express';

const FIELDS: Exclude<keyof User, 'password'>[] = [
  'email',
  'username',
  'qnaScore',
];

const handler: RequestHandler = async (req, res, next) => {
  const user = await getUser(req);

  return res.json({
    status: 'ok',
    data: user && FIELDS.reduce<Partial<User>>((acc, key) => {
      acc[key] = user[key] as ANY;
      return acc;
    }, {}),
  });
};

export default handler;
