<script setup>
import { ref } from 'vue';

const book = ref(
  {
   "kind": "books#volume",
   "id": "i1eYjgEACAAJ",
   "etag": "irRLfmjbLkw",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/i1eYjgEACAAJ",
   "volumeInfo": {
    "title": "ITエンジニアのための機械学習理論入門",
    "authors": [
     "中井悦司"
    ],
    "publishedDate": "2015-11-15",
    "description": "機械学習のしくみを学ぶデータサイエンスの本質を理解する。",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "4774176982"
     },
     {
      "type": "ISBN_13",
      "identifier": "9784774176987"
     }
    ],
    "readingModes": {
     "text": false,
     "image": false
    },
    "pageCount": 255,
    "printType": "BOOK",
    "maturityRating": "NOT_MATURE",
    "allowAnonLogging": false,
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://books.google.com/books/content?id=i1eYjgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
     "thumbnail": "http://books.google.com/books/content?id=i1eYjgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
    },
    "language": "ja",
    "previewLink": "http://books.google.co.jp/books?id=i1eYjgEACAAJ&dq=isbn:4774176982&hl=&cd=1&source=gbs_api",
    "infoLink": "http://books.google.co.jp/books?id=i1eYjgEACAAJ&dq=isbn:4774176982&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.co.jp/books/about/IT%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AE%E6%A9%9F%E6%A2%B0%E5%AD%A6.html?hl=&id=i1eYjgEACAAJ"
   },
   "saleInfo": {
    "country": "JP",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "JP",
    "viewability": "NO_PAGES",
    "embeddable": false,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.co.jp/books/reader?id=i1eYjgEACAAJ&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "NONE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "機械学習のしくみを学ぶデータサイエンスの本質を理解する。"
   }
  }
);

</script>



<template>
  <div class="bg-blue-50 min-h-screen p-6">
    <div class="max-w-3xl mx-auto">
      <!-- Header Section -->
      <div class="bg-white shadow-md rounded-2xl p-6 mb-6">
        <h1 class="text-blue-600 text-3xl font-bold">{{ book.volumeInfo.title }}</h1>
      </div>

      <!-- Book Details Section -->
      <div class="bg-white shadow-md rounded-2xl p-6">
        <div class="flex flex-col sm:flex-row gap-6">
          <!-- Book Image -->
          <div class="flex-shrink-0">
            <img 
              :src="book.volumeInfo.imageLinks.thumbnail" 
              alt="Book Cover" 
              class="w-48 h-64 object-cover rounded-lg"
            />
          </div>

          <!-- Book Info -->
          <div>
            <h2 class="text-blue-600 font-bold text-2xl mb-4">書籍情報</h2>
            <p class="text-gray-700 mb-2">
              <strong>著者:</strong> {{ book.volumeInfo.authors[0] }}
            </p>
            <p class="text-gray-700 mb-2">
              <strong>出版日:</strong> {{ book.volumeInfo.publishedDate }}
            </p>
            <p class="text-gray-700 mb-4">
              <strong>ページ数:</strong> {{ book.volumeInfo.pageCount }}ページ
            </p>
            <h3 class="text-blue-600 font-bold text-xl mb-2">説明</h3>
            <p class="text-gray-700">{{ book.volumeInfo.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

