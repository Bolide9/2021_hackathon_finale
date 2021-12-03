<template>
  <div class="ln">
    <Logo />
    <Name class="ln__name" />
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Logo from './index.vue';
import Name from './Name.vue';

export default Vue.extend({
  components: {
    Logo,
    Name,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

.ln {
  display: flex;
  align-items: center;

  @include media-breakpoint-down(sm) {
    height: 28px;
  }

  svg {
    max-height: 100%;
  }

  &__name {
    @include media-breakpoint-up(md) {
      margin-left: 10px;
    }
  }
}
</style>
