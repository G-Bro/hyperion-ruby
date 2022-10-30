<template>
  <Layout>
    <template #default>
      <h1>Hello from Vue</h1>
      <p>{{swag}}</p>
    </template>
  </Layout>
</template>

<script>
import Layout from '~/Layouts/Dashboard.vue';
export default {
  components: {
    Layout,
  },
  data() {
    return {
      swag: 'yes',
    };
  },
}
</script>