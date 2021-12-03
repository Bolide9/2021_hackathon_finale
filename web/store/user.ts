import { defineStore } from 'pinia';

export const useUser = defineStore('user', {
  state: () => ({
    email: null as string | null,
    username: null as string | null,
  }),

  actions: {
    reset() {
      this.$reset();
    },
    authorize({ username, email }: { username: string; email: string; }) {
      this.email = email;
      this.username = username;
    },
  },

  getters: {
    isAuthenticated: (state) => !!state.email,
  },
});
