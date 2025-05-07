<template>
  <div>
    <p> TEST111 </p>
    <p> {{ msg }}</p>
      <!-- <NuxtRouteAnnouncer />
      <NuxtWelcome /> -->
  </div>
</template>

<script setup>

onMounted(async() => {
  const msg = ref('');
  console.log('onMounted')
  const { data } = await useFetch('http://api/')
  msg.value = data.value?.message
})
</script>