<script setup>
defineProps({
  variable: String,
  error: Object,
  type: String,
});
</script>

<template>
  <p
    class="hyp-notice"
    :class="type"
    v-for="message in error"
  >
    {{ variable }} {{ message }}
  </p>
</template>

<style scoped>
.hyp-notice {
  @apply
    p-3
    mb-3
    border-1
    bg-blue-200
    text-blue-600
    border-blue-600
}

.hyp-notice.error {
  @apply
    bg-red-200
    text-red-600
    border-red-600
}
</style>