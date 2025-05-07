<template>
  <div>
    <p> TEST111 </p>
    <input type="text" v-model="path">
    <button @click="Clicked">fetch</button>
    <pre>{{ mas }}</pre>
      <!-- <NuxtRouteAnnouncer />
      <NuxtWelcome /> -->
  </div>
</template>

<script setup>
const path = ref('/api/users');
const mas = ref();

const Clicked = async() => {
  const { data } = await useFetch(path.value)
  console.log(data.value)
  mas.value = data.value
}

</script>