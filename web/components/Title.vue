<template>
  <component :is="h1 ? 'h1' : 'div'" class="title-c" :class="{ 'title-c_small': small }">
    <slot />
  </component>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  props: {
    h1: {
      type: Boolean,
      default: false,
    },
    small: {
      type: Boolean,
      default: false,
    },
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

h1.title-c {
  @include media-breakpoint-up(md) {
    font-size: 50px;
  }
}

.title-c {
  font-size: 40px;
  line-height: 56px;
  font-weight: 700;

  &_small {
    @include media-breakpoint-up(md) {
      font-size: 32px;
      line-height: 44px;
      font-weight: 600;
    }
  }

  @include media-breakpoint-down(sm) {
    font-size: 32px;
    line-height: 44px;
    font-weight: 600;
  }

  @include media-breakpoint-down(xs) {
    font-size: 24px;
    line-height: 32px;
  }
}
</style>
