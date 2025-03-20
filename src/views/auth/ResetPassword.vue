<script setup>
import { ref } from 'vue';
import { supabase } from '@/lib/supabaseClient';
import { useRouter } from 'vue-router';

const password = ref('');
const confirmPassword = ref('');
const message = ref('');
const router = useRouter();

const updatePassword = async () => {
  message.value = '';

  if (password.value !== confirmPassword.value) {
    message.value = 'パスワードが一致しません';
    return;
  }

  try {
    const { error } = await supabase.auth.updateUser({ password: password.value });
    if (error) {
      message.value = 'エラーが発生しました: ' + error.message;
    } else {
      message.value = 'パスワードが更新されました。ログインページに移動します。';
      setTimeout(() => {
        router.push('/login');
      }, 2000);
    }
  } catch (err) {
    message.value = '予期しないエラーが発生しました。';
    console.error(err);
  }
};
</script>

<template>
  <div class="max-w-md mx-auto p-6 mt-10 bg-white shadow-md rounded-lg">
    <h2 class="text-xl font-bold text-gray-700 mb-4">パスワード更新</h2>
    <!-- 新しいパスワード -->
    <div class="form-block mb-4">
      <label for="password" class="block text-gray-700 font-medium mb-1">新しいパスワード</label>
      <input
        id="password"
        type="password"
        placeholder="新しいパスワード"
        v-model="password"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <!-- 確認用パスワード -->
    <div class="form-block mb-4">
      <label for="confirmPassword" class="block text-gray-700 font-medium mb-1">パスワード確認</label>
      <input
        id="confirmPassword"
        type="password"
        placeholder="パスワードを再入力"
        v-model="confirmPassword"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <!-- エラーメッセージ -->
    <div v-if="message" class="text-gray-700 mt-2">{{ message }}</div>
    <!-- 送信ボタン -->
    <div class="mt-4">
      <button
        v-on:click="updatePassword"
        class="w-full bg-green-600 text-white font-medium py-2 rounded-lg hover:bg-green-700 transition"
      >更新</button>
    </div>
  </div>
</template>
