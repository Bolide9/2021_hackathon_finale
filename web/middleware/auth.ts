import { parseCookie } from '~/utils';
import { parseToken } from '~/utils/auth';
import { useUser } from '~/store/user';
import type { Middleware } from '@nuxt/types';

const handler: Middleware = ({ req, $pinia }) => {
  if (!process.server) return;
  const user = useUser($pinia);
  const { cookie } = req.headers;
  const token = typeof cookie === 'string' && parseCookie(cookie).access_token;
  const parsed = token && parseToken(token);
  if (parsed && typeof parsed !== 'string') {
    user.authorize({
      email: parsed.email,
      username: parsed.username,
    });
  }
};

export default handler;
