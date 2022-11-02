<script setup>
import { Link } from '@inertiajs/inertia-vue3';

const props = defineProps({
  href: String,
  fill: Boolean,
  type: String,
  text: String,
})
</script>

<template>
  <input
    v-if="type === 'submit'"
    :href="href"
    class="hyp-button"
    :class="{ fill }"
    type="submit"
    :value="text"
  />
  <Link
    v-else
    :href="href"
    class="hyp-button"
    :class="{ fill }"
    :type="type"
  >
    <slot>
      {{ text }}
    </slot>
  </Link>
</template>

<style scoped>
.hyp-button {
  @apply 
    bg-primary-500
    hover:bg-primary-600
    px-3
    py-2
    rounded-sm
    no-underline
    text-white
    shadow-sm
    shadow-dark-500
    inline-block
    cursor-pointer
}

.hyp-button.fill {
  @apply block
}
</style>