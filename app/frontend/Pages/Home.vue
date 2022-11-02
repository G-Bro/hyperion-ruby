<template>
  <Layout>
    <template #default>
      <hyp-button href="/test">Content</hyp-button>
      <hyp-button href="/users/sign_up">Sign up</hyp-button>
      <hyp-button href="/test">Content</hyp-button>
    </template>
  </Layout>
</template>

<script>
import Layout from '~/Layouts/Dashboard.vue';
import HypButton from '~/components/HypButton.vue';

export default {
  components: {
    Layout,
    HypButton,
  },
  data() {
    return {
      swag: 'yes',
    };
  },
}
</script>