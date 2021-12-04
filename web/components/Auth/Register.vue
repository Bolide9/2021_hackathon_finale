<template>
  <div>
    <Form
      :errors="errors"
      :fields="fields"
      :is-loading="isLoading"
      :eula-checked="eulaChecked"
      @submit="$emit('submit', $event)"
    >
      <template #eula>
        <div class="reg-eula">
          <Checkbox v-model="eulaChecked" class="reg-eula__cb" />
          <span>
            Регистрируясь, вы принимаете наши
            <a href="#">Условия, Политику использования данных</a>
            и
            <a href="#">Политику в отношении файлов cookie.</a>
          </span>
        </div>
      </template>
      <template #button-label>
        Зарегистрироваться
      </template>
    </Form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Form from '~/components/Auth/Form.vue';
import Checkbox from '~/components/Checkbox.vue';
import type { PropType } from 'Vue';

const FIELDS = [{
  name: 'email',
  placeholder: 'Электронная почта',
}, {
  name: 'username',
  placeholder: 'Логин',
}, {
  name: 'fio',
  placeholder: 'Имя и фамилия',
}, {
  type: 'password',
  name: 'password',
  placeholder: 'Пароль',
}] as const;

export default Vue.extend({
  props: {
    errors: {
      type: Object as PropType<Record<string, { msg: string }> | null>,
      default: null,
    },
    isLoading: {
      type: Boolean,
      default: false,
    },
  },

  data: () => ({
    eulaChecked: false,
    fields: FIELDS,
  }),

  components: {
    Form,
    Checkbox,
  },
});
</script>

<style lang="scss" scoped>
.field {
  & + & {
    margin-top: 16px;
  }
}
.reg-eula {
  display: flex;

  &__cb {
    margin-right: 12px;
  }

  span {
    color: #777e90;
  }
}
.error {
  color: #B00020;
  font-size: 16px;
  margin-top: 8px;
}
.submit {
  margin-top: 32px;
}
</style>
