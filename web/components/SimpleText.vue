<template>
  <div class="desc-c">
    <slot />
  </div>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'SimpleText',
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

.desc-c {
  font-size: 24px;
  line-height: 32px;

  @include media-breakpoint-down(sm) {
    font-size: 14px;
    line-height: 18px;
  }
}
</style>
