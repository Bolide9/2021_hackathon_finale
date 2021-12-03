<template>
  <component
    :is="to ? 'NuxtLink' : 'button'"
    :to="to"
    class="button"
    :class="{ button_max: maxWidth }"
    v-on="$listeners"
  >
    <slot />
  </component>
</template>

<script lang="ts">
import Vue from 'vue';
import type { PropType } from 'vue';

export default Vue.extend({
  props: {
    maxWidth: {
      type: Boolean,
      default: false,
    },
    to: {
      type: Object as PropType<{ name: 'index' | 'register' | 'login' | 'learn' }>,
      default: null,
    },
  },
});
</script>

<style lang="scss" scoped>
.button {
  text-align: center;
  border: none;
  font-size: 16px;
  line-height: 24px;
  font-weight: 500;
  padding: 14px 34px;
  background: linear-gradient(0deg, #005FA3 0%, #0095FF 100%);
  box-shadow: 0 10px 60px rgba(0, 139, 238, 0.4), inset 0 4px 23px #29A6FF;
  border-radius: 12px;
  transition: transform 0.2s, background 0.2s, box-shadow 0.2s;

  &:hover {
    background: linear-gradient(0deg, #00538E 0%, #007BD2 100%);
    box-shadow: 0 10px 60px rgba(0, 113, 194, 0.4), inset 0 4px 23px #0086E6;
  }

  &:disabled {
    cursor: default;
    background: linear-gradient(0deg, #003052 0%, #004170 26.56%, #004D85 100%);
    box-shadow: 0 10px 60px rgba(0, 68, 117, 0.4), inset 0 4px 23px #004D85;
  }

  &:active {
    transform: scale(0.98);
  }

  &_max {
    width: 100%;
  }
}
</style>
