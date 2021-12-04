<template>
  <div class="header d-flex">
    <div class="header__content d-flex flex-1">
      <div class="container flex-1 d-flex align-center">
        <header class="d-flex align-center flex-1">
          <NuxtLink :to="{ name: 'index' }" class="logo flex-none">
            <LogoWithName />
          </NuxtLink>
          <div class="d-flex d-md-none flex-1 justify-end">
            <button
              class="bars"
              :class="{ bars_active: isMobileMenuVisible }"
              @click="isMobileMenuVisible = !isMobileMenuVisible"
            />
          </div>
          <div class="nav-wrapper flex-1" :class="{ 'nav-wrapper_active': isMobileMenuVisible }">
            <nav class="nav-links">
              <NuxtLink v-for="link in links" :key="link.label" :to="link.to" class="link">
                {{ link.label }}
              </NuxtLink>
            </nav>
            <div class="user d-none d-md-flex flex-none">
              <button v-if="fio" @click="logout">{{ fio }}</button>
              <button v-else @click="$emit('auth')">Войти</button>
            </div>
            <Button max-width class="d-md-none" :to="{ name: 'login' }">
              Войти
            </Button>
          </div>
        </header>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Cookie from 'js-cookie';
import { mapState, mapActions } from 'pinia';
import { useUser } from '~/store/user';
import Button from '~/components/Button.vue';
import LogoWithName from '~/components/Logo/WithName.vue';

const LINKS = [{
  label: 'Главная',
  to: { name: 'index' },
}, {
  label: 'Обучение',
  to: { name: 'index', hash: '#learn' },
}, {
  label: 'База знаний',
  to: { name: 'index' },
}];

export default Vue.extend({
  data: () => ({
    links: LINKS,
    isMobileMenuVisible: false,
  }),

  computed: {
    ...mapState(useUser, ['fio']),
  },

  methods: {
    ...mapActions(useUser, { resetUser: 'reset' }),
    logout() {
      Cookie.remove('access_token');
      this.resetUser();
    },
  },

  components: {
    Button,
    LogoWithName,
  },
});
</script>

<style lang="scss" scoped>
@import "assets/mixins";

.header {
  border-bottom: 1px solid #1F242C;
  height: 85px;

  @include media-breakpoint-down(sm) {
    height: 70px;
  }

  &__content {
    background-color: var(--body-color);
    @include media-breakpoint-down(sm) {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      height: 70px;
      z-index: 1;
    }
  }
}
.logo {
  margin-right: 60px;
}
.link {
  font-size: 16px;
  font-weight: 500;
  padding: 6px;
  text-decoration: none;

  @include media-breakpoint-up(md) {
    transition: opacity 0.2s;

    &:hover {
      opacity: 0.9;
    }

    & + & {
      margin-left: 14px;
    }
  }

  @include media-breakpoint-down(sm) {
    opacity: 0;
    transform: translateX(-20px);
    transition: transform 0.3s, opacity 0.3s;
    transition-timing-function: ease-out;

    @for $i from 1 to 10 {
      &:nth-child(#{$i}) {
        transition-delay: #{($i - 1) * 0.05}s;
      }
    }

    .nav-wrapper_active & {
      opacity: 1;
      transform: none;
    }

    & + & {
      margin-top: 18px;
    }
  }
}
.nav-links {
  display: flex;
  flex: 1;
  @include media-breakpoint-up(md) {
    align-items: center;
  }
  @include media-breakpoint-down(sm) {
    flex-direction: column;
    margin-bottom: 30px;
  }
}
.user {
  button {
    font-size: 16px;
    line-height: 24px;
    font-weight: 500;
    padding: 8px 24px;
    color: #37ABFF;
    background-color: transparent;
    border: 1px solid #37ABFF;
    border-radius: 12px;
    transition: transform 0.2s, background-color 0.2s, border-color 0.2s;
    max-width: 300px;
    text-overflow: ellipsis;
    white-space: nowrap;

    &:hover {
      color: #62BDFF;
      border-color: #37ABFF;
    }

    &:active {
      transform: scale(0.98);
    }
  }
}
.nav-wrapper {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex: 1;

  @include media-breakpoint-down(sm) {
    position: fixed;
    align-items: flex-start;
    flex-direction: column;
    left: 0;
    top: 70px;
    right: 0;
    bottom: 0;
    overflow: auto;
    visibility: hidden;
    padding: 16px var(--gutter) 24px;
    opacity: 0;
    transition: opacity 0.2s, visibility 0s linear 0.2s;
    background-color: var(--body-color);

    &_active {
      opacity: 1;
      visibility: visible;
      transition: opacity 0.2s;
    }
  }
}

.bars {
  position: relative;
  width: 24px;
  height: 18px;
  background-color: transparent;
  border-top: 2px solid #fff;
  border-bottom: 2px solid #fff;
  border-left: 0;
  border-right: 0;
  border-radius: 0;
  transition: border-color 0.2s;

  &:before, &:after {
    content: '';
    position: absolute;
    top: calc(50% - 1px);
    left: 0;
    height: 2px;
    width: 100%;
    background-color: #fff;
    transition: transform 0.2s;
  }

  &_active {
    border-color: transparent;

    &:before {
      transform: rotate(45deg);
    }

    &:after {
      transform: rotate(135deg);
    }
  }
}
</style>
