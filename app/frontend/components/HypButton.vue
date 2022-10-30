<script setup>
import { Link } from '@inertiajs/inertia-vue3'

const props = defineProps({
  href: String,
  fill: Boolean
})
</script>

<template>
  <Link
    :href="href"
    class="hyp-button"
    :class="{ fill }"
  >
    <slot>
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
}

.hyp-button.fill {
  @apply block
}
</style>