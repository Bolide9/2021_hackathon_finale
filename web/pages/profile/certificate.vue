<template>
  <div class="certificate">
    <div class="top">
      <img alt="Россети" width="170" height="56" src="~/assets/rosseti.png" />
      <div class="date">2 декабря, 2021</div>
    </div>
    <div class="t-center">
      <div class="title">Сертификат</div>
      <div class="fio">{{ fio }}</div>
      <div class="desc">
        Успешно прошел обучающую программу "Оператор БПЛА"
        и профпригоден в управлении беспилотных летательных аппаратов.
      </div>
    </div>
    <div class="bottom">
      <div class="download">Скачать в PDF</div>
      <div>
        <div class="bottom__name">
          Иван Иванов
        </div>
        <div class="bottom__desc">
          Специалист по БПЛА
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import { mapState } from 'pinia';
import { useUser } from '~/store/user';

export default Vue.extend({
  computed: {
    ...mapState(useUser, ['fio']),
  },
});
</script>

<style lang="scss" scoped>
.top, .bottom {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.date {
  font-weight: 500;
  font-size: 14px;
  line-height: 24px;
  color: #777E91;
}
.title {
  font-weight: 500;
  font-size: 48px;
  line-height: 56px;
  margin: 74px 0 30px;
}
.fio {
  font-weight: 500;
  font-size: 22px;
  line-height: 24px;
}
.desc {
  font-size: 15px;
  line-height: 24px;
  color: #777E90;
  margin-bottom: 112px;
}
.download {
  font-weight: 500;
  font-size: 16px;
  line-height: 24px;
  text-align: center;
  color: #37ABFF;
  padding: 16px 24px;
  background-color: transparent;
  border: 1px solid #37ABFF;
  box-sizing: border-box;
  border-radius: 12px;
}
.bottom__name {
  font-weight: 600;
  font-size: 18px;
  line-height: 26px;
  margin-bottom: 4px;
}
.bottom__desc {
  font-size: 14px;
  line-height: 20px;
}
</style>
