import mongoose from 'mongoose';
import express from 'express';
import loginMiddleware from './middleware/login';
import registerMiddleware from './middleware/register';

const app = express();

mongoose.connect('mongodb://localhost:27017/ddb')
  .then(() => console.log('db connection opened'))
  .catch((e) => console.error('db connection failed', e));
Object.keys(mongoose.connection.models).forEach((key) => {
  delete mongoose.connection.models[key];
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.post('/register', registerMiddleware);
app.post('/login', loginMiddleware);

export default app;
