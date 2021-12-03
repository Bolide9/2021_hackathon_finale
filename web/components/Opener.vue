<template>
  <div role="button" class="opener" @click="opened=!opened">
    <div class="title">{{ title }}</div>
    <div class="desc" :class="{ desc_visible: opened }">{{ desc }}</div>
    <div class="cross" :class="{ cross_active: opened }" />
  </div>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  props: {
    title: {
      type: String,
      required: true,
    },
    desc: {
      type: String,
      required: true,
    },
  },

  data: () => ({
    opened: false,
  }),
});
</script>

<style lang="scss" scoped>
.opener {
  position: relative;
  cursor: pointer;
  padding: 36px 0;
  border-top: 1px solid #1F242C;
  border-bottom: 1px solid #1F242C;

  & + & {
    border-top: 0;
  }
}

.title {
  font-size: 24px;
  line-height: 36px;
  font-weight: 500;
}

.desc {
  font-size: 16px;
  line-height: 24px;
  color: #777E90;
  opacity: 0;
  height: 0;
  transform: translateY(-10px);
  transition: transform 0.2s, opacity 0.2s, margin 0.2s;

  &_visible {
    height: auto;
    transform: none;
    opacity: 1;
    margin-top: 12px;
  }
}

.cross {
  position: absolute;
  top: 36px;
  right: 0;
  width: 24px;
  height: 24px;
  transition: transform 0.2s;

  &_active {
    transform: rotate(45deg);
  }

  &:after, &:before {
    content: '';
    position: absolute;
    width: 24px;
    height: 1px;
    top: 12px;
    background-color: #fff;
  }

  &:after {
    transform: rotate(90deg);
  }
}
</style>
