<template>
  <label>
    <input type="checkbox" :checked="checked" @change="$emit('change', $event.target.checked)" />
    <span>
      <svg xmlns="http://www.w3.org/2000/svg" width="14" height="10" viewBox="0 0 14 10" fill="none">
        <path
          d="M1 5L5 9L13 1"
          stroke="#FCFCFD"
          stroke-width="2"
          stroke-miterlimit="10"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
    </span>
  </label>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  props: {
    checked: {
      type: Boolean,
      default: false,
    },
  },
  data: () => ({ a: false }),
  methods: {
    asd(e: ANY) {
      this.a = !this.a;
      console.log(e.target);
    },
  },
});
</script>

<style lang="scss" scoped>
label {
  position: relative;
  display: inline-flex;
  cursor: pointer;
  width: 24px;
  flex: 0 0 24px;
  height: 24px;
}
span {
  flex: 1;
  height: 100%;
  border-radius: 4px;
  border: 1px solid #37ABFF;
  transition: background-color 0.2s;
}
svg {
  position: absolute;
  left: 5px;
  top: 7px;
}
path {
  stroke-dasharray: 20;
  stroke-dashoffset: 20;
  transition: stroke-dashoffset 0.2s;
}
input {
  position: absolute;
  opacity: 0;

  &:checked + span {
    background-color: #37ABFF;

    & > svg > path {
      stroke-dashoffset: 0;
    }
  }
}
</style>
