import { useUser } from '~/store/user';
import { User } from '~/server/models/user';
import type { Middleware } from '@nuxt/types';

const handler: Middleware = async ({ $pinia, $axios }) => {
  if (!process.server) return;
  const user = useUser($pinia);
  try {
    const { status, data } = await $axios.$post<{
      status: 'ok' | 'error';
      data?: User;
    }>('/api/user_data');
    if (status === 'ok' && data) {
      user.authorize(data);
    }
  } catch (e) {
    console.warn(e);
  }
};

export default handler;
