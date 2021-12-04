<template>
  <div>
    <div class="glow">
      <Glow />
    </div>
    <div class="banner">
      <div class="banner__content">
        <Title h1>Онлайн-обучение управлению дронами</Title>
        <div class="banner__desc">
          Пройди симуляцию дронов, изучи теорию и получи сертификат
        </div>
        <div class="d-flex">
          <Button @click="ppScroll">Обучение</Button>
        </div>
      </div>
      <div class="banner__drone">
        <img alt="Дрон" src="~/assets/drone.png" />
      </div>
      <button class="banner__pp" @click="ppScroll" />
    </div>
    <div ref="content" class="content">
      <Title class="content__title">
        Программа обучения
      </Title>
      <div class="content__blocks">
        <Opener v-for="block in blocks" :key="block.title" :title="block.title" :desc="block.desc" />
      </div>
      <div class="content__learn">
        <Button :to="{ name: 'learn' }">Начать обучение</Button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Title from '~/components/Title.vue';
import Button from '~/components/Button.vue';
import Opener from '~/components/Opener.vue';
import Glow from '~/components/Glow.vue';

const BLOCKS = [{
  title: 'Обучение',
  desc: 'Описание',
}, {
  title: 'Практика',
  desc: 'Описание',
}, {
  title: 'Экзамен',
  desc: 'Описание',
}];

export default Vue.extend({
  data: () => ({
    blocks: BLOCKS,
  }),

  head: () => ({
    title: 'Главная | Colibri',
  }),

  watch: {
    '$route.hash': function hashChange() {
      this.ppScrollIfNeeded();
    },
  },

  mounted() {
    this.ppScrollIfNeeded();
  },

  methods: {
    ppScroll() {
      const { content } = this.$refs;
      if (content instanceof Element) {
        content.scrollIntoView({ behavior: 'smooth' });
      }
    },

    ppScrollIfNeeded() {
      if (this.$route.hash === '#learn') setTimeout(() => this.ppScroll(), 100);
    },
  },

  components: {
    Glow,
    Title,
    Opener,
    Button,
  },
});
</script>

<style lang="scss" scoped>
@import 'assets/mixins';

.glow {
  position: absolute;
  left: 0;
  top: 0;
  right: 0;
  height: 100vh;
  z-index: -1;

  ::v-deep svg {
    width: 100%;
    height: 100%;
  }
}
.banner {
  position: relative;
  display: flex;
  align-items: center;
  padding: 30px 0;

  @include media-breakpoint-up(md) {
    min-height: calc(100vh - 86px);
  }

  h1 {
    margin-bottom: 24px;

    @include media-breakpoint-down(sm) {
      margin-bottom: 18px;
    }
  }

  &__pp {
    position: absolute;
    left: calc(50% - 14px);
    bottom: 20px;
    border: 1px solid #fff;
    width: 28px;
    height: 40px;
    background-color: transparent;
    border-radius: 14px;

    @include media-breakpoint-down(sm) {
      display: none;
    }

    &:after {
      content: '';
      position: absolute;
      left: calc(50% - 1px);
      top: 8px;
      width: 2px;
      height: 8px;
      background-color: #fff;
      animation: pp-scroll 3s ease-in-out infinite;
    }
  }

  &__desc {
    font-size: 20px;
    line-height: 28px;
    color: #777E90;
    margin-bottom: 36px;

    @include media-breakpoint-down(sm) {
      font-size: 14px;
      line-height: 18px;
      margin-bottom: 24px;
    }
  }

  &__drone {
    position: relative;
    flex: 1;

    img {
      position: absolute;
      top: 0;
      left: 48px;
      transform: translateY(-50%);
    }
  }

  &__content {
    flex: none;
    width: 100%;
    max-width: 564px;
  }
}

.content {
  display: flex;
  flex-direction: column;
  justify-content: center;

  @include media-breakpoint-up(md) {
    padding: 60px 0;
    min-height: calc(100vh - 20px);
  }

  @include media-breakpoint-down(sm) {
    padding: 20px 0 30px;
  }

  &__title {
    margin-bottom: 62px;

    @include media-breakpoint-down(sm) {
      margin-bottom: 24px;
    }
  }

  &__learn {
    display: flex;
    justify-content: center;
    margin-top: 54px;
  }
}

@keyframes pp-scroll {
  45%, 55% {
    transform: none;
    opacity: 1;
  }
  49% {
    transform: translateY(5px);
    opacity: 0;
  }
  50% {
    transform: translateY(-5px);
  }
}
</style>
