<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Header from './components/Header.vue';
// import { supabase } from './lib/supabaseClient';

// console.log(supabase);
</script>

<template>
  <Header />
  <RouterView />
</template>
