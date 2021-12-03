<template>
  <div class="form">
    <Auth />
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import { useUser } from '~/store/user';
import Auth from '~/components/Auth/index.vue';

export default Vue.extend({
  middleware({ $pinia, redirect }) {
    if (useUser($pinia).email) {
      redirect({ name: 'index' });
    }
  },

  head: () => ({
    title: 'Вход | Colibri',
  }),

  components: {
    Auth,
  },
});
</script>

<style lang="scss" scoped>
.form {
  padding-top: 40px;
  width: 100%;
  max-width: 400px;
  margin: 0 auto;
}
</style>
