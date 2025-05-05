<template>
  <div>
    <p> TEST </p>
    <p> {{ msg }}</p>
      <!-- <NuxtRouteAnnouncer />
      <NuxtWelcome /> -->
  </div>
</template>

<script setup>

onMounted(async() => {
  const msg = ref('');
  console.log('onMounted')
  const { data } = await useFetch('http://backend:8000')
  msg.value = data.value?.message
})
</script>