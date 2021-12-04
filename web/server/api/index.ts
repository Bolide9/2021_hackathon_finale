import mongoose from 'mongoose';
import express from 'express';
import cookieParser from 'cookie-parser';
import qnaMiddleware from './middleware/qna';
import loginMiddleware from './middleware/login';
import registerMiddleware from './middleware/register';
import userDataMiddleware from './middleware/userData';

const app = express();

mongoose.connect('mongodb://localhost:27017/ddb')
  .then(() => console.log('db connection opened'))
  .catch((e) => console.error('db connection failed', e));

Object.keys(mongoose.connection.models).forEach((key) => {
  delete mongoose.connection.models[key];
});

app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/qna', qnaMiddleware);
app.post('/login', loginMiddleware);
app.post('/register', registerMiddleware);
app.post('/user_data', userDataMiddleware);

export default app;
