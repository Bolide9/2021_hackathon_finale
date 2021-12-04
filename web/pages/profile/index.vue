<template>
  <div>
    <div class="top">
      <SimpleText>{{ fio }}</SimpleText>
      <div class="email">{{ email }}</div>
      <div class="progress">
        <div class="progress__fill" :style="{ width: `${80 * (qnaScore / qnaLength)}%` }" />
        {{ 80 * (qnaScore / qnaLength) }}%
      </div>
      <div class="block">
        <div class="block__title">
          Последний тест: сегодня в 12:53
        </div>
        <div class="block__item">
          <div class="block__req">Количество вопросов</div>
          <div class="block__sep" />
          <div>{{ qnaLength }}</div>
        </div>
        <div class="block__item">
          <div class="block__req">Количество правильных ответов</div>
          <div class="block__sep" />
          <div>{{ qnaLength }}</div>
        </div>
      </div>
      <div class="block">
        <div class="block__title">
          Последний полет: сегодня в 14:11
        </div>
        <div class="block__item">
          <div class="block__req">Общее время полета</div>
          <div class="block__sep" />
          <div>50 минут</div>
        </div>
        <div class="block__item">
          <div class="block__req">Общая дистанция полета</div>
          <div class="block__sep" />
          <div>5 км</div>
        </div>
        <div class="block__item">
          <div class="block__req">Время между чек-поинтами</div>
          <div class="block__sep" />
          <div>5 минут</div>
        </div>
        <div class="block__item">
          <div class="block__req">Точность полёта</div>
          <div class="block__sep" />
          <div>89%</div>
        </div>
        <div class="block__item">
          <div class="block__req">Количество найденных аварий</div>
          <div class="block__sep" />
          <div>8</div>
        </div>
        <div class="block__item">
          <div class="block__req">Количество столкновений</div>
          <div class="block__sep" />
          <div>1</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import QNA from '~/common/qna';
import { mapState } from 'pinia';
import { useUser } from '~/store/user';
import SimpleText from '~/components/SimpleText.vue';

export default Vue.extend({
  data: () => ({
    qnaLength: QNA.length,
  }),

  computed: {
    ...mapState(useUser, ['fio', 'email', 'qnaScore']),
  },

  components: {
    SimpleText,
  },
});
</script>

<style lang="scss" scoped>
.email {
  font-weight: 500;
  font-size: 14px;
  line-height: 24px;
  color: #777E90;
  margin-bottom: 12px;
}
.progress {
  position: relative;
  width: 250px;
  font-size: 12px;
  font-weight: 500;
  line-height: 14px;
  padding: 4px 10px;
  background-color: #777E90;
  text-align: right;
  border-radius: 14px;

  &__fill {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    border-radius: 14px;
    background-color: #37ABFF;
  }
}
.block {
  margin-top: 48px;

  &__title {
    font-size: 18px;
    line-height: 20px;
    font-weight: 500;
    margin-bottom: 28px;
  }

  &__item {
    display: flex;
    align-items: center;
    font-size: 16px;
    line-height: 20px;
    font-weight: 500;

    & + & {
      margin-top: 24px;
    }
  }

  &__sep {
    flex: 1;
    border-top: 1px dashed #505063;
    margin: 0 12px;
  }

  &__req {
    color: #777E90;
  }
}
</style>
