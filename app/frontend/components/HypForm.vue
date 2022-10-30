<script setup>
import axios from 'axios';
import { ref } from 'vue';
import { HypNotice } from '~/components';

const props = defineProps({
  action: String,
  method: {
    type: String,
    default: 'get',
  },
  ajax: Boolean,
  formData: Object,
});

const emit = defineEmits(['ajaxResponse'])

const flashes = ref([]);
const errors = ref([]);

function onSubmit(event) {
  if (props.ajax) {
    event.preventDefault();
    console.log(event);
    axios({
      method: props.method,
      url: props.action,
      data: props.formData,
    }).then(
      (response) => {
        if (response.data.errors) {
          errors.value = response.data.errors;
        }
        if (response.data.flash) {
          flashes.value = response.data.flash;
        }
        emit('ajaxResponse', response);
      }
    );
  }
}
</script>

<template>
  <hyp-notice
    v-for="messages in flashes"
    :error="[messages[1]]"
    type="info"
  />
  <hyp-notice
    v-for="(messages, variable) in errors"
    :key="variable"
    :variable="variable"
    :error="messages"
    type="error"
  />
  <form class="hyp-form" :action="action" :method="method" @submit="onSubmit">
    <slot />
  </form>
</template>

<style scoped>
.hyp-form {
  @apply grid gap-3
}
</style>