<template>
  <div class="auth">
    <Title class="title">{{ isLogin ? 'Вход' : 'Регистрация' }}</Title>
    <component
      :is="isLogin ? 'Login' : 'Register'"
      :is-loading="isLoading"
      :errors="errors"
      @submit="submit"
    />
    <div class="switch">
      <span>{{ isLogin ? 'Нет аккаунта?' : 'У вас уже есть аккаунт?' }} </span>
      <NuxtLink v-if="isPage" :to="{ name: isLogin ? 'register' : 'login' }">
        {{ switcherTitle }}
      </NuxtLink>
      <button v-else @click="isReg=!isReg">
        {{ switcherTitle }}
      </button>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import { mapActions } from 'pinia';
import { useUser } from '~/store/user';
import Title from '~/components/Title.vue';
import Login from './Login.vue';
import Register from './Register.vue';

export default Vue.extend({
  data: () => ({
    isReg: false,
    isLoading: false,
    errors: null as Object | null | undefined,
  }),

  computed: {
    isLogin(): boolean {
      return this.$route.name !== 'register' && !this.isReg;
    },

    isPage(): boolean {
      return ['register', 'login'].includes(this.$route.name || '');
    },

    switcherTitle(): string {
      return this.isLogin ? 'Зарегистрируйтесь' : 'Вход';
    },
  },

  methods: {
    ...mapActions(useUser, ['authorize']),

    async submit(data: Record<string, string>) {
      this.errors = null;
      this.isLoading = true;
      try {
        const { status, errors, data: rData } = await this.$axios.$post<{
          status: 'ok' | 'error';
          errors?: Object;
          data?: { username: string; email: string; }
        }>(`/api/${this.isLogin ? 'login' : 'register'}`, data);
        if (status === 'ok' && rData) {
          this.authorize(rData);
          if (this.isPage) {
            this.$router.push({ name: 'index' });
          } else {
            this.$emit('close');
          }
        } else {
          this.errors = errors || {
            global: {
              msg: 'unknown',
            },
          };
        }
      } catch (e) {
        console.warn(e);
        this.errors = {
          global: {
            msg: 'unknown',
          },
        };
      }
      this.isLoading = false;
    },
  },

  components: {
    Login,
    Title,
    Register,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

.auth {
  width: 100%;
}

.title {
  margin-bottom: 44px;

  @include media-breakpoint-up(sm) {
    text-align: center;
  }
}

.switch {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
  line-height: 24px;
  font-weight: 500;
  margin-top: 48px;

  span {
    color: #777E90;
  }

  a, button {
    border: 0;
    font-size: 16px;
    line-height: 24px;
    font-weight: 600;
    color: #37ABFF;
    background-color: transparent;
    padding: 0;
    margin: 0;
    margin-left: 8px;
  }
}
</style>
