import { defineStore } from 'pinia';
import { userPublicFields } from '~/server/models/user';
import type { UserPublicData } from '~/server/models/user';

type State = { [K in keyof UserPublicData]: UserPublicData[K] | null };
export const useUser = defineStore('user', {
  state: (): State => ({
    fio: null as string | null,
    email: null as string | null,
    username: null as string | null,
    qnaScore: null as number | null,
  }),

  actions: {
    reset() {
      this.$reset();
    },
    authorize(state: State) {
      this.$state = state;
    },
    incrementQnaScore() {
      this.qnaScore = this.qnaScore || 0;
      this.qnaScore++;
    },
    setQnaScore(score: number) {
      this.qnaScore = score;
    },
  },

  getters: {
    isAuthenticated: (state) => !!state.email,
  },
});
