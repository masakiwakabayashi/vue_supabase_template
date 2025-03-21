<script setup>
import { ref } from 'vue';
import { supabase } from '@/lib/supabaseClient';

const email = ref('');
const message = ref('');

// MEMO: ローカル環境だとInbucketにメールが飛ぶ (URLはsupabase statusのコマンドで見れる)
const sendPasswordResetEmail = async () => {
  message.value = '';
  try {
    const { error } = await supabase.auth.resetPasswordForEmail(email.value, {
      // TODO: あとで修正する
      redirectTo: 'http://localhost:5173/reset_password',
    });
    if (error) {
      message.value = 'エラーが発生しました: ' + error.message;
    } else {
      message.value = 'パスワード再設定メールを送信しました。メールを確認してください。';
    }
  } catch (err) {
    message.value = '予期しないエラーが発生しました。';
    console.error(err);
  }
};
</script>

<template>
  <div class="max-w-md mx-auto p-6 mt-10 bg-white shadow-md rounded-lg">
    <h2 class="text-xl font-bold text-gray-700 mb-4">パスワード再設定</h2>
    <div class="form-block mb-4">
      <label for="email" class="block text-gray-700 font-medium mb-1">登録済みメールアドレス</label>
      <input
        id="email"
        type="email"
        placeholder="email"
        v-model="email"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <div v-if="message" class="text-gray-700 mt-2">{{ message }}</div>
    <div class="mt-4">
      <button
        v-on:click="sendPasswordResetEmail"
        class="w-full bg-blue-600 text-white font-medium py-2 rounded-lg hover:bg-blue-700 transition"
      >送信</button>
    </div>
  </div>
</template>
