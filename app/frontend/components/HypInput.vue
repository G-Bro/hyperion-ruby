<script setup>
import { computed } from 'vue';

defineEmits(['update:modelValue', 'input'])

const props = defineProps({
  modelValue: String,
  label: String,
  type: String,
  name: String,
  placeholder: String
});

const autoFieldName = `form_${Date.now()}`;

const fieldName = computed(() => name ? name : autoFieldName);

</script>

<template>
  <label v-if="label" :for="fieldName">
    {{ label }}
  </label>
  <input
    class="hyp-input"
    :value="modelValue"
    @input="$emit('update:modelValue', $event.target.value)"
    :type="type"
    :name="name"
    :placeholder="placeholder"
  />
</template>

<style scoped>
.hyp-input {
  @apply
    bg-transparent
    border-2
    rounded-sm
    border-gray-600
    px-3
    py-2
}
</style>