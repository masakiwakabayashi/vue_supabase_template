<script setup>
import { ref } from 'vue';

const rankingData = ref([
  { rank: 1, id: "user1", name: "佐藤 太郎", book_count: 46 },
  { rank: 2, id: "user2", name: "鈴木 花子", book_count: 42 },
  { rank: 3, id: "user3", name: "田中 一郎", book_count: 39 },
  { rank: 4, id: "user4", name: "高橋 次郎", book_count: 35 },
  { rank: 5, id: "user5", name: "伊藤 美咲", book_count: 33 },
  { rank: 6, id: "user6", name: "渡辺 健", book_count: 30 },
  { rank: 7, id: "user7", name: "山本 花", book_count: 28 },
  { rank: 8, id: "user8", name: "中村 光", book_count: 26 },
  { rank: 9, id: "user9", name: "小林 蓮", book_count: 24 },
  { rank: 10, id: "user10", name: "加藤 結衣", book_count: 22 },
  { rank: 11, id: "user11", name: "山田 智也", book_count: 21 },
  { rank: 12, id: "user12", name: "佐々木 優", book_count: 19 },
  { rank: 13, id: "user13", name: "松本 愛", book_count: 17 },
  { rank: 14, id: "user14", name: "井上 春樹", book_count: 16 },
  { rank: 15, id: "user15", name: "木村 希", book_count: 15 },
  { rank: 16, id: "user16", name: "林 奈々", book_count: 13 },
  { rank: 17, id: "user17", name: "清水 直樹", book_count: 12 },
  { rank: 18, id: "user18", name: "山崎 陽子", book_count: 11 },
  { rank: 19, id: "user19", name: "池田 颯", book_count: 10 },
  { rank: 20, id: "user20", name: "橋本 彩", book_count: 9 },
]);


</script>

<template>
  <div class="bg-blue-50 min-h-screen p-6">
    <div class="max-w-4xl mx-auto">
      <!-- Header Section -->
      <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
        <h1 class="text-blue-600 text-3xl font-bold">読書数ランキング</h1>
        <p class="text-gray-700 mt-2">読書数が多いユーザーのランキングを表示しています。</p>
      </div>

      <!-- Toggle Buttons -->
      <div class="flex justify-center mb-6">
        <button 
          class="px-4 py-2 rounded-l-lg bg-blue-600 text-white font-semibold hover:bg-blue-700"
          @click="selectedTab = 'weekly'"
        >
          週間ランキング
        </button>
        <button 
          class="px-4 py-2 rounded-r-lg bg-blue-600 text-white font-semibold hover:bg-blue-700"
          @click="selectedTab = 'monthly'"
        >
          月間ランキング
        </button>
      </div>

      <!-- Ranking Table Section -->
      <div class="bg-white shadow-md rounded-2xl p-6">
        <h2 class="text-blue-600 text-2xl font-bold mb-4">{{ selectedTab === 'weekly' ? '週間ランキング一覧' : '月間ランキング一覧' }}</h2>
        <table class="table-auto w-full text-left border-collapse">
          <thead>
            <tr class="bg-blue-100">
              <th class="p-3 text-blue-600 font-semibold">順位</th>
              <th class="p-3 text-blue-600 font-semibold">ユーザー名</th>
              <th class="p-3 text-blue-600 font-semibold">読書数</th>
            </tr>
          </thead>
          <tbody>
            <tr class="border-b" v-for="user in rankingData" :key="user.id">
                <td class="p-3">{{ user.rank }}</td>
                <td class="p-3">{{ user.name }}</td>
                <td class="p-3">{{ user.book_count }}冊</td>
              </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

