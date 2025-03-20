import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import { supabase } from '@/lib/supabaseClient'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/auth/Login.vue'),
    },
    {
      path: '/account_register',
      name: 'accountRegister',
      component: () => import('../views/auth/Register.vue'),
    },
  ],
});

// // ログイン判定
// router.beforeEach(async (to, from, next) => {
//   const { data: { session } } = await supabase.auth.getSession();
//   // 認証が必要なページへのアクセス時にログインしていない場合、ログインページにリダイレクト
//   if (to.meta.requiresAuth && !session) {
//     next('/login');
//   }
//   // ログインページにアクセスする際、すでにログインしている場合はダッシュボードへリダイレクト
//   else if (to.path === '/' && session) {
//     next('/');
//   }
//   else {
//     next();
//   }
// });

export default router
