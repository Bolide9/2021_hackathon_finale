<template>
  <form @submit.prevent="submit">
    <div v-for="field in fields" :key="field.name" class="field">
      <TextInput
        max-width
        :value="userData[field.name]"
        :error="!!computedErrors[field.name]"
        :name="field.name"
        :type="field.type"
        :placeholder="field.placeholder"
        @input="onFieldChange(field.name, $event)"
      />
      <div v-if="computedErrors[field.name]" class="error">
        {{ computedErrors[field.name] }}
      </div>
    </div>
    <div v-if="$slots.eula" class="eula">
      <slot name="eula" />
    </div>
    <div class="submit">
      <Button max-width :disabled="isLoading || !isReady" type="submit">
        <slot name="button-label" />
      </Button>
    </div>
    <div v-if="computedErrors.global" class="error">
      {{ computedErrors.global }}
    </div>
  </form>
</template>

<script lang="ts">
import Vue from 'vue';
import Button from '~/components/Button.vue';
import TextInput from '~/components/TextInput.vue';
import type { PropType } from 'Vue';

const ERRORS: Record<string, Record<string, string>> = {
  email: {
    format: 'Неверный формат почты',
    exists: 'Аккаунт с такой почтой уже зарегистрирован',
  },
  username: {
    length: 'Логин должен состоять хотя бы из трех символов',
  },
  password: {
    length: 'Пароль должен состоять хотя бы из четырех символов',
  },
  global: {
    match: 'Пользователь не найден',
    save: 'Что-то пошло совсем не так',
    unknown: 'Что-то пошло не так',
  },
};

export default Vue.extend({
  props: {
    fields: {
      type: Array as PropType<{
        name: string;
        placeholder: string;
        type?: 'password' | 'text';
      }[]>,
      required: true,
    },
    errors: {
      type: Object as PropType<Record<string, { msg: string }> | null>,
      default: null,
    },
    isLoading: {
      type: Boolean,
      default: false,
    },
  },

  data() {
    return {
      ignoreErrors: {} as Record<string, boolean>,
      errorsDescriptions: ERRORS,
      userData: this.fields.reduce<Record<string, string>>((acc, cur) => {
        acc[cur.name] = '';
        return acc;
      }, {}),
    };
  },

  computed: {
    isReady(): boolean {
      return Object.values(this.userData).every(Boolean);
    },

    computedErrors() {
      return !this.errors ? {} : Object.entries(this.errors).reduce<Record<string, string>>((acc, [key, err]) => {
        if (!this.ignoreErrors[key]) {
          acc[key] = ERRORS[key][err.msg];
        }
        return acc;
      }, {});
    },
  },

  watch: {
    errors() {
      this.ignoreErrors = {};
    },
  },

  methods: {
    submit() {
      if (this.isReady) {
        this.$emit('submit', this.userData);
      }
    },

    onFieldChange(name: string, value: string) {
      this.$set(this.ignoreErrors, 'global', true);
      this.$set(this.ignoreErrors, name, true);
      this.userData[name] = value;
    },
  },

  components: {
    Button,
    TextInput,
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
  color: #FF202D;;
  font-size: 13px;
  line-height: 20px;
  margin-top: 8px;
}
.submit, .eula {
  margin-top: 32px;
}
</style>
