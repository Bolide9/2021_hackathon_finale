import bcrypt from 'bcryptjs';
import * as validator from 'express-validator';
import UserModel from '../../models/user';
import { authenticate, getUserPublicData } from '../../util';
import type { Request, Response } from 'express';

export default [
  validator.body('nameOrEmail').trim().isLength({ min: 3 }).withMessage('length'),
  validator.body('password').trim().isLength({ min: 4 }).withMessage('length'),
  async (req: Request, res: Response) => {
    const { nameOrEmail, password } = req.body;
    const validationResult = validator.validationResult(req);

    if (!validationResult.isEmpty() || typeof nameOrEmail !== 'string' || typeof password !== 'string') {
      return res.json({ status: 'error', errors: validationResult.mapped() });
    }

    const user = await UserModel.findByNameOrEmail(nameOrEmail);

    if (!user || !bcrypt.compareSync(password, user.password)) {
      return res.json({
        status: 'error',
        errors: {
          global: {
            msg: 'match',
          },
        },
      });
    }

    authenticate({
      email: user.email,
      username: user.username,
    });

    res.cookie('access_token', authenticate({
      email: user.email,
      username: user.username,
    }), { maxAge: 7 * 24 * 60 * 60 * 1000 });

    return res.json({
      status: 'ok',
      data: getUserPublicData(user),
    });
  },
];
