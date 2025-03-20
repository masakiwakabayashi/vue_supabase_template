<script setup>
import { ref, onMounted } from 'vue';
import { supabase } from '@/lib/supabaseClient';

const userEmail = ref('');

onMounted(async () => {
  const { data: { user } } = await supabase.auth.getUser();
  if (user) {
    userEmail.value = user.email;
  }
});
</script>

<template>
  <div class="bg-blue-50 min-h-screen p-6">
    <div v-if="userEmail" class="mt-4 text-gray-700">
      ログイン中のユーザー: {{ userEmail }}
    </div>
  </div>
</template>
