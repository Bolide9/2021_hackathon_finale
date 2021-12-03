import { useUser } from '~/store/user';
import type { Middleware } from '@nuxt/types';

const handler: Middleware = ({ redirect, $pinia }) => {
  const user = useUser($pinia);

  if (!user.email) {
    redirect({ name: 'login' });
  }
};

export default handler;
