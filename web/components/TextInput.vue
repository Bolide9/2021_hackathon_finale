<template>
  <input
    :type="type"
    :value="value"
    class="input"
    :class="{ input_max: maxWidth, input_error: error }"
    @input="$emit('input', $event.target.value)"
  />
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  props: {
    maxWidth: {
      type: Boolean,
      default: false,
    },
    value: {
      type: String,
      required: true,
    },
    type: {
      type: String,
      default: 'text',
    },
    error: {
      type: Boolean,
      default: false,
    },
  },
});
</script>

<style lang="scss" scoped>
.input {
  background-color: transparent;
  border: 1px solid #2C303A;
  padding: 16px 18px;
  font-weight: 500;
  border-radius: 7px;
  transition: border-color 0.2s, color 0.2s;

  &:focus {
    border-color: #5C657A;
  }

  &_error {
    color: #FF202D;
    border-color: #FF202D !important;
  }

  &_max {
    width: 100%;
  }
}
</style>
