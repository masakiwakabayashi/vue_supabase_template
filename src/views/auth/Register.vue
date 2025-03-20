<script setup>
import { ref } from 'vue';
import { supabase } from '@/lib/supabaseClient';
import { useRouter } from 'vue-router';

const email = ref('');
const password = ref('');
const confirmPassword = ref('');
const router = useRouter();

const doRegister = async () => {
  console.log(email.value);
  console.log(password.value);
  console.log(confirmPassword.value);

  // TODO: あとでちゃんとしたバリデーションを作成する
  if (password.value !== confirmPassword.value) {
    alert('パスワードが一致しません');
    return;
  }

  // Supabaseにリクエストを送る
  await supabase.auth.signUp({
    email: email.value,
    password: password.value,
  }).then((res) => {
    console.log(res);
    // ホームにリダイレクト
    router.push('/');
  });
}
</script>

<template>
  <div class="max-w-md mx-auto p-6 mt-10 bg-white shadow-md rounded-lg">
    <!-- メールアドレス -->
    <div class="form-block mb-4">
      <label for="email" class="block text-gray-700 font-medium mb-1">メールアドレス</label>
      <input
        id="email"
        type="email"
        placeholder="email"
        v-bind:value="email"
        v-on:input="email = $event.target.value"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <!-- パスワード -->
    <div class="form-block mb-4">
      <label for="password" class="block text-gray-700 font-medium mb-1">パスワード</label>
      <input
        id="password"
        type="password"
        placeholder="password"
        v-bind:value="password"
        v-on:input="password = $event.target.value"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <!-- 確認用パスワード -->
    <div class="form-block mb-4">
      <label for="confirmPassword" class="block text-gray-700 font-medium mb-1">パスワード確認</label>
      <input
        id="confirmPassword"
        type="password"
        placeholder="confirm password"
        v-bind:value="confirmPassword"
        v-on:input="confirmPassword = $event.target.value"
        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
      >
    </div>
    <!-- 送信ボタン -->
    <div>
      <button
        v-on:click="doRegister()"
        class="w-full bg-green-600 text-white font-medium py-2 rounded-lg hover:bg-green-700 transition"
      >送信</button>
    </div>
  </div>
</template>
