<script setup>
import Layout from '~/Layouts/Dashboard.vue';
import HypButton from '~/components/HypButton.vue';

import { ref } from 'vue';

defineProps({
  user: Object,
});

const swag = ref('yes')
</script>

<template>
  <Layout>
    <template #default>
      <hyp-button href="/test">Content</hyp-button>
      <template v-if="!user">
        <hyp-button href="/users/sign_up">Sign up</hyp-button>
        <hyp-button href="/users/sign_in">Login</hyp-button>
      </template>
      <template v-else>
        <h2>You are logged in :)</h2>
      </template>
    </template>
  </Layout>
</template>