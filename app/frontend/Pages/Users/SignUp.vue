<script setup>
import Layout from '~/Layouts/Dashboard.vue';
import { HypForm, HypInput, HypButton, HypNotice } from '~/components';

import { ref } from 'vue';

defineProps({
  authenticityToken: String,
});

const email = ref('');
const password = ref('');
const passwordConfirm = ref('');

function onFormResponse({ data }) {
  console.log(data);
}
</script>

<template>
  <Layout>
    <hyp-form
      rows="100%"
      action="/users"
      method="post"
      ajax
      :formData="{
        authenticity_token: authenticityToken,
        user: {
          email: email,
          password: password,
          // password_confirm: passwordConfirm,
        }
      }"
      @ajaxResponse="onFormResponse"
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
      <!-- <hyp-input
        label="Password"
        v-model="passwordConfirm"
        placeholder="Password"
        type="password"
        name="user[password_confirmation]"
      /> -->
      <hyp-button
        type="submit"
      >
        Sign Up
      </hyp-button>
    </hyp-form>
  </Layout>
</template>