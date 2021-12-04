<template>
  <div class="page">
    <Header @auth="openAuth" />
    <div class="container flex-1">
      <Nuxt />
    </div>
    <Modal @click-outside="closeAuth">
      <div v-if="isAuthVisible" class="auth-modal">
        <ModalClose @click="closeAuth" />
        <Auth @close="closeAuth" />
      </div>
    </Modal>
    <div class="container">
      <div class="footer">
        <Footer />
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Modal from '~/components/Modal.vue';
import ModalClose from '~/components/ModalClose.vue';
import Header from '~/components/Header.vue';
import Footer from '~/components/Footer.vue';
import Auth from '~/components/Auth/index.vue';

export default Vue.extend({
  middleware: ['ssrInit'],

  data: () => ({
    isAuthVisible: false,
  }),

  methods: {
    openAuth() {
      this.isAuthVisible = true;
    },
    closeAuth() {
      this.isAuthVisible = false;
    },
  },

  components: {
    Auth,
    Modal,
    Header,
    Footer,
    ModalClose,
  },
});
</script>

<style lang="scss">
@import "assets/mixins";

:root {
  --font-size-base: 14px;
  --line-height-base: 1.285714285;
  --body-color: #0F1115;
  --gutter: 20px;
}

* {
  margin: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
}

body {
  background-color: var(--body-color);
}

body, button, input, a {
  color: #fff;
  font-size: var(--font-size-base);
  line-height: var(--line-height-base);
  font-family: Inter;
}

a {
  text-decoration: none;
}

button, input {
  outline: 0;
}

button {
  cursor: pointer;
}

.container {
  max-width: 1280px;
  padding: 0 var(--gutter);
  margin: 0 auto;
}

.t-center {
  text-align: center;
}
.d-none {
  display: none;
}
.d-flex {
  display: flex;
}
.d-sm-flex {
  @include media-breakpoint-up(sm) {
    display: flex;
  }
}
.d-sm-none {
  @include media-breakpoint-up(sm) {
    display: none;
  }
}
.d-md-flex {
  @include media-breakpoint-up(md) {
    display: flex;
  }
}
.d-md-none {
  @include media-breakpoint-up(md) {
    display: none;
  }
}
.d-lg-flex {
  @include media-breakpoint-up(lg) {
    display: flex;
  }
}
.d-lg-none {
  @include media-breakpoint-up(lg) {
    display: none;
  }
}
.flex-1 {
  flex: 1;
}
.flex-none {
  flex: none;
}
.justify-center {
  justify-content: center;
}
.justify-end {
  justify-content: flex-end;
}
.align-center {
  align-items: center;
}
</style>

<style lang="scss" scoped>
.page {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  min-height: 100vh;
  overflow: hidden;

  > * {
    width: 100%;
  }
}
.footer {
  margin-top: 40px;
}
.auth-modal {
  position: relative;
  padding-top: 36px;
  width: 464px;
  max-width: calc(100vw - 40px);
}
</style>
