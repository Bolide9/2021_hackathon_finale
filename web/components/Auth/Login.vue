<template>
  <div>
    <Form :errors="errors" :fields="fields" :is-loading="isLoading" @submit="$emit('submit', $event)">
      <template #button-label>
        Войти
      </template>
    </Form>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';
import Form from '~/components/Auth/Form.vue';
import type { PropType } from 'Vue';

const FIELDS = [{
  name: 'nameOrEmail',
  placeholder: 'Логин или почта',
}, {
  type: 'password',
  name: 'password',
  placeholder: 'Пароль',
}];

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
    fields: FIELDS,
  }),

  components: {
    Form,
  },
});
</script>

<style lang="scss" scoped>
.field {
  & + & {
    margin-top: 16px;
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
