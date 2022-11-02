<script setup>

</script>

<template>
  <div class="layout-grid text-white">
    <div class="header p-5 bg-dark-900 font-bold">
      <p>Hyperion logo here</p>
    </div>
    <div class="body p-5 bg-dark-800 text-white">
      <slot />
    </div>
    <div class="footer bg-dark-900 p-5 text-white">
      <p>Footer</p>
    </div>
  </div>
</template>

<style scoped>
.layout-grid {
  display: grid;
  grid-template-areas:
    "header"
    "body"
    "footer";
  grid-template-rows: min-content 1fr min-content;
  height: 100vh;
}
.header {
  grid-area: header;
}
.body {
  grid-area: body;
}
.footer {
  grid-area: footer;
}
</style>