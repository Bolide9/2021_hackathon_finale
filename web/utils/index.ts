export const parseCookie = (cookie: string): Partial<Record<string, string>> => (
  cookie.split(';').reduce<Record<string, string>>((acc, cur) => {
    const [key ,value] = cur.trim().split('=');
    acc[key] = value;
    return acc;
  }, {})
);
