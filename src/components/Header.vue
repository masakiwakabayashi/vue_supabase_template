<script setup lang="ts">
import { RouterLink } from 'vue-router'
</script>

<template>
  <header class="bg-blue-600 text-white shadow-md">
    <div class="wrapper max-w-7xl mx-auto px-4 py-5">
      <nav class="flex justify-between items-center">
        <div class="text-3xl font-bold">Vue.js Supabase Template</div>
        <div class="space-x-4 mr-4">
          <RouterLink
            to="/"
            class="text-lg hover:text-blue-200 transition-colors duration-200"
          >
            Home
          </RouterLink>
          <RouterLink
            to="/login"
            class="text-lg hover:text-blue-200 transition-colors duration-200"
          >
            Login
          </RouterLink>
          <RouterLink
            to="/account_register"
            class="text-lg hover:text-blue-200 transition-colors duration-200"
          >
            Account Register
          </RouterLink>
          <RouterLink
            to="/forgot_password"
            class="text-lg hover:text-blue-200 transition-colors duration-200"
          >
            Forgot Password
          </RouterLink>
          <RouterLink
            to="/reset_password"
            class="text-lg hover:text-blue-200 transition-colors duration-200"
          >
            Reset Password
          </RouterLink>
        </div>
      </nav>
    </div>
  </header>
</template>
