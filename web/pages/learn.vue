<template>
  <div class="learn">
    <div class="head">
      <Title h1 class="title">Теория</Title>
      <Title class="step">{{ Math.min(step, qna.length) }} / {{ qna.length }}</Title>
    </div>
    <div v-if="isOver" class="winwin">
      <div class="winwin__cup">
        <img alt="Кубок" src="~/assets/cup.png" />
      </div>
      <Title small class="winwin__title t-center">
        Вы завершили теоретическую часть теста. Отлично!
      </Title>
      <Text class="t-center">Ваш результат: {{ qna.length }} из {{ qna.length }}</Text>
      <div class="next d-flex justify-center">
        <Button @click="modalVisible=true">Перейти к следующему модулю</Button>
      </div>
    </div>
    <div v-else class="qna">
      <template v-if="isIntro">
        <div class="q-desc">Здесь будет описание урпавления дроном</div>
        <div class="next">
          <Button max-width @click="isIntro=false">Далее</Button>
        </div>
      </template>
      <template v-else>
        <div class="q-title">{{ current.q.title }}</div>
        <button
          v-for="(a, i) in current.a"
          :key="a.title"
          class="select"
          :class="{ select_active: selected === i }"
          @click="select(i)"
        >
          {{ a.title }}
        </button>
        <div v-if="wrongAnswer" class="wrong">
          Ответ неправильный
        </div>
        <div class="next">
          <Button :disabled="selected === -1 || isLoading" max-width @click="submit">Далее</Button>
        </div>
      </template>
    </div>
    <Modal @click-outside="closeModal">
      <div v-if="modalVisible" class="modal-content">
        <ModalClose @click="closeModal" />
        <div class="modal-content__title">
          Для того, чтобы перейти к следующему модулю, необходимо загрузить установщик
        </div>
        <Button max-width>Загрузить установщик</Button>
      </div>
    </Modal>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import { mapActions, mapState } from 'pinia';
import { useUser } from '~/store/user';
import QNA from '~/common/qna';
import Text from '~/components/Text.vue';
import Modal from '~/components/Modal.vue';
import Title from '~/components/Title.vue';
import Button from '~/components/Button.vue';
import ModalClose from '~/components/ModalClose.vue';

export default Vue.extend({
  middleware: ['auth'],

  data: () => ({
    isIntro: true,
    modalVisible: false,
    qna: QNA,
    selected: -1,
    isLoading: false,
    wrongAnswer: false,
  }),

  head: () => ({
    title: 'Обучение | Colibri',
  }),

  computed: {
    ...mapState(useUser, ['qnaScore']),
    current(): (typeof QNA)[number] {
      return this.qna[this.step - 1];
    },
    step(): number {
      return (this.qnaScore || 0) + 1;
    },
    isOver(): boolean {
      return this.step - 1 === QNA.length;
    },
  },

  methods: {
    ...mapActions(useUser, {
      resetUser: 'reset',
      setQnaScore: 'setQnaScore',
      incrementQnaScore: 'incrementQnaScore',
    }),
    closeModal() {
      this.modalVisible = false;
    },
    select(index: number) {
      this.selected = index;
      this.wrongAnswer = false;
    },
    async submit() {
      if (this.selected === -1) return;

      this.wrongAnswer = false;
      this.isLoading = true;
      try {
        const { status, errors, data } = await this.$axios.$post<{
          status: 'ok' | 'error';
          data?: { current: number; }
          errors?: { global: { msg: string } } | { qna: { msg: 'score' | 'answer' } };
        }>('/api/qna', {
          question: this.step,
          answer: this.selected,
        });
        if (status === 'ok') {
          this.incrementQnaScore();
          this.selected = -1;
        } else if (errors && 'global' in errors && errors.global.msg === 'auth') {
          this.resetUser();
          this.$router.push({ name: 'login' });
        } else if (errors && 'qna' in errors && errors.qna.msg === 'score' && data?.current) {
          this.setQnaScore(data.current);
        } else {
          this.wrongAnswer = true;
        }
      } catch (e) {
        console.warn(e);
      }

      this.isLoading = false;
    },
  },

  components: {
    ModalClose,
    Modal,
    Text,
    Title,
    Button,
  },
});
</script>

<style lang="scss" scoped>
.head {
  display: flex;
  justify-content: space-between;
  margin-bottom: 70px;
}
.step {
  color: #777E90;
}
.learn {
  padding-top: 30px;
}
.qna {
  max-width: 474px;
  margin: 0 auto;
}
.select {
  padding: 16px 0;
  width: 100%;
  background: #171B21;
  font-size: 18px;
  line-height: 28px;
  border-radius: 8px;
  border: 2px solid #171B21;
  transition: border-color 0.2s;
  cursor: pointer;

  & + & {
    margin-top: 18px;
  }

  &_active {
    border-color: #37ABFF;
  }
}
.q-title, .a-title {
  font-size: 32px;
  line-height: 40px;
  margin-bottom: 24px;
  text-align: center;
}
.q-desc {
  font-size: 16px;
  line-height: 28px;
  color: #BBBDC3;
}
.wrong {
  color: #FF202D;
  font-size: 13px;
  line-height: 20px;
  margin-top: 8px;
}
.next {
  margin-top: 36px;
}
.winwin {
  display: flex;
  align-items: center;
  flex-direction: column;
  max-width: 530px;
  margin: 0 auto;

  &__cup {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 148px;
    flex: 0 0 148px;
    margin-bottom: 40px;
    background-color: #17191E;
    border-radius: 50%;

    img {
      flex: 0 0 78px;
      height: 78px;
    }
  }

  &__title {
    margin-bottom: 16px;
  }
}
.modal-content {
  width: 100%;
  max-width: 480px;
  padding-top: 10px;

  &__title {
    font-size: 18px;
    line-height: 26px;
    font-weight: 500;
    margin-bottom: 32px;
  }
}
</style>
