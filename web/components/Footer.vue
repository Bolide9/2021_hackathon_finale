<template>
  <footer>
    <NuxtLink :to="{ name: 'index' }">
      <LogoWithName />
    </NuxtLink>
    <div class="desc">
      Команда 2beram · Цифровой прорыв 2021 · РОССЕТИ
    </div>
  </footer>
</template>

<script lang="ts">
import Vue from 'vue';
import LogoWithName from '~/components/Logo/WithName.vue';

export default Vue.extend({
  components: {
    LogoWithName,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

footer {
  padding: 36px 0;
}
.desc {
  font-weight: 500;
  font-size: 16px;
  line-height: 30px;
  color: rgba(197, 206, 228, 0.5);
  margin-top: 14px;

  @include media-breakpoint-down(sm) {
    font-size: 14px;
    line-height: 18px;
  }
}
</style>
