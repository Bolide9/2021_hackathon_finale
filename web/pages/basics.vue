<template>
  <div class="basics">
    <Title class="title">База знаний</Title>
    <div class="wrapper d-flex">
      <div class="menu">
        <div v-for="item in menuItems" :key="item.title" class="menu__item">
          <NuxtLink :to="{ name: `basics${item.sub}` }" class="menu__link">
            {{ item.title }}
          </NuxtLink>
        </div>
      </div>
      <div class="content flex-1">
        <NuxtChild />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Title from '~/components/Title.vue';

const MENU_ITEMS = [{
  title: 'Управление',
  sub: '',
}, {
  title: 'Механика',
  sub: '-mechanics',
}];

export default Vue.extend({
  data: () => ({
    menuItems: MENU_ITEMS,
  }),

  head: () => ({
    title: 'База знаний | Colibri',
  }),

  components: {
    Title,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";
.wrapper {
  justify-content: space-between;
}
.basics {
  padding-top: 30px;
}
.title {
  margin-bottom: 70px;

  @include media-breakpoint-down(sm) {
    margin-bottom: 30px;
  }
}
.menu {
  flex: 0 0 180px;
  margin-right: 20px;

  &__link {
    display: inline-flex;
    align-items: center;
    opacity: 0.5;
    transition: opacity 0.2s;

    &.nuxt-link-exact-active {
      opacity: 1 !important;
    }

    &:hover {
      opacity: 0.8;
    }
  }

  &__item {
    & + & {
      margin-top: 22px;
    }
  }
}
.logout {
  font-weight: 500;
  font-size: 16px;
  line-height: 24px;
  padding: 10px 24px;
  margin-top: 50px;
  border-radius: 12px;
  border: 0;
  background-color: #26282D;
}
.content {
  padding: 48px 40px;
  background-color: #17191E;
  border-radius: 24px;
  max-width: 792px;
}
</style>
