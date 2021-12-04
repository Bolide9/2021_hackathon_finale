<template>
  <div class="forum">
    <Title class="title">Форум</Title>
    <div class="desc">Нет открытых тем</div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Title from '~/components/Title.vue';

export default Vue.extend({
  components: {
    Title,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";
.forum {
  padding-top: 30px;
}
.desc {
  margin-top: 40px;
  font-size: 24px;
}
.title {
  margin-bottom: 70px;

  @include media-breakpoint-down(sm) {
    margin-bottom: 30px;
  }
}
</style>
