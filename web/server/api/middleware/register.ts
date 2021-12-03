import bcrypt from 'bcryptjs';
import * as validator from 'express-validator';
import UserModel from '../../models/user';
import type { Request, Response } from 'express';

export default [
  validator.body('email').isEmail().withMessage('format').bail().normalizeEmail().custom(async (email = '') => {
    if (await UserModel.findByEmail(email)) {
      return Promise.reject('exists');
    }
    return null;
  }),
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
      data: {
        email: req.body.email,
        username: req.body.username,
      },
    });
  },
];
