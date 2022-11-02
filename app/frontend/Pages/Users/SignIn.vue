<script setup>
import Layout from '~/Layouts/Dashboard.vue';
import { HypForm, HypInput, HypButton, HypNotice } from '~/components';

import { ref } from 'vue';

defineProps({
  authenticityToken: String,
});

const email = ref('');
const password = ref('');
const rememberLogin = ref(false);

function onFormResponse({ data }) {
  window.location
  console.log(data);
}
</script>

<template>
  <Layout>
    <hyp-form
      rows="100%"
    >
      <hyp-input
        v-model="authenticityToken"
        name="authenticity_token"
        type="hidden"
      />
      <hyp-input
        label="Email"
        v-model="email"
        placeholder="Email"
        type="email"
        name="user[email]"
      />
      <hyp-input
        label="Password"
        v-model="password"
        placeholder="Password"
        type="password"
        name="user[password]"
      />
      <hyp-input
        label="Remember me"
        v-model="rememberLogin"
        type="checkbox"
      />
      <hyp-button
        href="/users/sign_in"
        method="post"
        :data="{
          authenticity_token: authenticityToken,
          user: {
            email: email,
            password: password,
            rememberLogin: rememberLogin
          }
        }"
      >
        Log In
      </hyp-button>
      <Link href="/users/sign_up">Sign up</Link>
      <Link href="/users/password/new">Forgot your password?</Link>
      <Link href="/users/confirmation/new">Didn't receive confirmation instructions?</Link>
    </hyp-form>
  </Layout>
</template>