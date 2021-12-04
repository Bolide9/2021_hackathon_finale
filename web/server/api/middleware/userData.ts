import { getUser, getUserPublicData } from '../../util';
import type { User } from '../../models/user';
import type { RequestHandler } from 'express';

const FIELDS: Exclude<keyof User, 'password'>[] = [
  'fio',
  'email',
  'username',
  'qnaScore',
];

const handler: RequestHandler = async (req, res, next) => {
  const user = await getUser(req);

  return res.json({
    status: 'ok',
    data: user && getUserPublicData(user),
  });
};

export default handler;
