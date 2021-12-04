import bcrypt from 'bcryptjs';
import * as validator from 'express-validator';
import UserModel from '../../models/user';
import { getUserPublicData } from '../../util';
import type { Request, Response } from 'express';

export default [
  validator.body('email').isEmail().withMessage('format').bail().normalizeEmail().custom(async (email = '') => {
    if (await UserModel.findByEmail(email)) {
      return Promise.reject('exists');
    }
    return true;
  }),
  validator.body('fio').trim().custom((fio = '') => {
    const parts = fio.split(' ');
    return parts.length < 2 || parts.some((part: string) => part.length < 3) ? Promise.reject('format') : true;
  }).escape(),
  validator.body('username').trim().isLength({ min: 3 }).withMessage('length').escape(),
  validator.body('password').trim().isLength({ min: 4 }).withMessage('length').escape(),
  async (req: Request, res: Response) => {
    const validationResult = validator.validationResult(req);
    if (!validationResult.isEmpty()) {
      return res.json({
        status: 'error',
        errors: validationResult.mapped(),
      });
    }

    const model = new UserModel({
      fio: req.body.fio,
      email: req.body.email,
      username: req.body.username,
    });
    model.password = bcrypt.hashSync(req.body.password as string, bcrypt.genSaltSync(10));

    try {
      await model.save();
    } catch (e) {
      return res.json({
        status: 'ok',
        errors: {
          global: {
            msg: 'save',
          },
        },
      });
    }

    return res.json({
      status: 'ok',
      data: getUserPublicData(model),
    });
  },
];
