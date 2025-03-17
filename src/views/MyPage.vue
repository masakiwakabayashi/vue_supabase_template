<script setup>
import { supabase } from '@/lib/supabaseClient';
import { onMounted, ref } from 'vue';

const user = ref(null);

const getCurrentUser = async () => {
  const { data, error } = await supabase.auth.getUser();
  if (error) {
    console.error('ユーザー情報取得エラー:', error.message);
  }
  console.log(data.user);
  user.value = data.user;
}

onMounted(getCurrentUser);

</script>

<template>
  <div class="bg-blue-50 min-h-screen p-6">
    <div class="max-w-4xl mx-auto">
      <!-- Account Info Section -->
      <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
        <h2 class="text-blue-600 text-2xl font-bold mb-4">アカウント情報</h2>
        <p class="text-gray-700">
          <span class="font-semibold">ユーザー名:</span> 山田太郎
        </p>
        <p class="text-gray-700">
          <span class="font-semibold">メールアドレス:</span> {{ user?.email }}
        </p>
      </div>

      <!-- Ranking Section -->
      <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
        <h2 class="text-blue-600 text-2xl font-bold mb-4">ランキング</h2>
        <p class="text-gray-700 text-lg">現在の順位: <span class="text-blue-600 font-semibold">15位</span></p>
      </div>

      <!-- Books List Section -->
      <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
        <h2 class="text-blue-600 text-2xl font-bold mb-4">読んだ本と読みたい本</h2>
        <div class="mb-4">
          <h3 class="text-lg font-semibold mb-2">読んだ本</h3>
          <ul class="list-disc pl-6 text-gray-700">
            <li>「吾輩は猫である」</li>
            <li>「こころ」</li>
            <li>「三四郎」</li>
          </ul>
        </div>
        <div>
          <h3 class="text-lg font-semibold mb-2">読みたい本</h3>
          <ul class="list-disc pl-6 text-gray-700">
            <li>「羅生門」</li>
            <li>「雪国」</li>
            <li>「人間失格」</li>
          </ul>
        </div>
      </div>

      <!-- Weekly and Monthly Read Books Section -->
      <div class="bg-white shadow-md rounded-2xl p-6">
        <h2 class="text-blue-600 text-2xl font-bold mb-4">今週と今月読んだ本</h2>
        <div class="mb-4">
          <h3 class="text-lg font-semibold mb-2">今週読んだ本</h3>
          <ul class="list-disc pl-6 text-gray-700">
            <li>「学問のすゝめ」</li>
            <li>「坊っちゃん」</li>
          </ul>
        </div>
        <div>
          <h3 class="text-lg font-semibold mb-2">今月読んだ本</h3>
          <ul class="list-disc pl-6 text-gray-700">
            <li>「草枕」</li>
            <li>「銀河鉄道の夜」</li>
            <li>「山月記」</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
