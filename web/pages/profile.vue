<template>
  <div class="profile">
    <Title class="title">Профиль</Title>
    <div class="wrapper d-flex">
      <div class="menu">
        <div v-for="item in menuItems" :key="item.title" class="menu__item">
          <NuxtLink :to="{ name: `profile${item.sub}` }" class="menu__link">
            <component :is="item.icon" class="menu__icon" />
            {{ item.title }}
          </NuxtLink>
        </div>
        <button class="logout" @click="logout">
          Выйти
        </button>
      </div>
      <div class="content flex-1">
        <NuxtChild />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Cookie from 'js-cookie';
import { mapActions } from 'pinia';
import { useUser } from '~/store/user';
import Title from '~/components/Title.vue';
import IconCup from '~/components/Icon/Cup.vue';
import IconUser from '~/components/Icon/User.vue';
import IconChat from '~/components/Icon/Chat.vue';
import IconCertificate from '~/components/Icon/Certificate.vue';

const MENU_ITEMS = [{
  title: 'Профиль',
  sub: '',
  icon: 'IconUser',
}, {
  title: 'Достижения',
  sub: '-achievements',
  icon: 'IconCup',
}, {
  title: 'Сертификат',
  sub: '-certificate',
  icon: 'IconCertificate',
}, {
  title: 'Связь с ментором',
  sub: '-chat',
  icon: 'IconChat',
}];

export default Vue.extend({
  middleware: ['auth'],

  data: () => ({
    menuItems: MENU_ITEMS,
  }),

  head: () => ({
    title: 'Профиль | Colibri',
  }),

  methods: {
    ...mapActions(useUser, { resetUser: 'reset' }),
    logout() {
      Cookie.remove('access_token');
      this.resetUser();
      this.$router.push({ name: 'index' });
    },
  },

  components: {
    Title,
    IconCup,
    IconUser,
    IconChat,
    IconCertificate,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";
.wrapper {
  justify-content: space-between;
}
.profile {
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

  &__icon {
    width: 24px;
    height: 24px;
    margin-right: 8px;
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
