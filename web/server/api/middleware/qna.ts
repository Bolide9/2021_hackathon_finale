import { getUser } from '../../util';
import type { RequestHandler } from 'express';

const rightAnswers = [0, 2, 1, 2, 2, 0]; // bootiful :)

const handler: RequestHandler = async (req, res) => {
  const user = await getUser(req);
  const { question, answer } = req.body;

  if (!user) {
    return res.json({ status: 'error', errors: { global: { msg: 'auth' } } });
  }

  if (typeof question !== 'number' || typeof answer !== 'number' || answer !== rightAnswers[question - 1]) {
    return res.json({ status: 'error', errors: { qna: { msg: 'answer' } } });
  }

  if (question !== user.qnaScore + 1) {
    return res.json({ status: 'error', errors: { qna: { msg: 'score' } }, data: { current: user.qnaScore } });
  }

  user.qnaScore++;

  try {
    await user.save();
  } catch (e) {
    console.warn(e);
  }

  return res.json({ status: 'ok' });
};

export default handler;
