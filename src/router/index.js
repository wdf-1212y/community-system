import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/cart',
    name: '物资',
    component: () => import('../views/ShopCart.vue'),
    meta: {
      title: '防疫物资展示',
    }
  },
  {
    path: '/vproc/:search',
    name: '搜索详情',
    props:true,
    component: () => import('../views/VolunteerProc.vue'),
    meta: {
      title: '志愿者',
    }
  },
  {
    path: '/vdetail',
    name: '志愿者详情',
    component: () => import('../views/VolunteerDetail.vue'),
    meta: {
      title: '志愿者详情',
    }
  },
  {
    path: '/ndetail',
    name: '新闻详情',
    component: () => import('../views/NewsDetail.vue'),
    meta: {
      title: '新闻资讯详情',
    }
  },
  {
    path: '/fdetail',
    name: '论坛详情',
    component: () => import('../views/ForumDetail.vue'),
    meta: {
      title: '论坛详情',
    }
  },
  {
    path: '/news',
    name: '新闻',
    component: () => import('../views/NewsView.vue'),
    meta: {
      title: '新闻资讯展示',
    }
  },
  {
    path: '/forum',
    name: '论坛',
    component: () => import('../views/ForumView.vue'),
    meta: {
      title: '论坛信息展示',
    },
  },
  {
    path: '/volunteer',
    name: '志愿者',
    component: () => import('../views/VolunteerView.vue'),
    meta: {
      title: '志愿者信息展示',
    },
  },
  {
    path: '/register',
    name: '注册',
    component: () => import('../views/Register.vue'),
    meta: {
      hideHeader:true,  //自定义的属性，代表隐藏头
      hideFooter:true,  //自定义的属性，代表隐藏脚
      title: '欢迎注册',
    },
  },
  {
    path: '/login',
    name: '登录',
    component: () => import('../views/Login.vue'),
    meta: {
      hideHeader:true,  //自定义的属性，代表隐藏头
      hideFooter:true,  //自定义的属性，代表隐藏脚
      title: '欢迎登录',
    },
  },
  {
    path: '*',
    name: '404',
    component: () => import('../views/NotFound.vue'),
    meta: {
      hideHeader:true,  //自定义的属性，代表隐藏头
      hideFooter:true,  //自定义的属性，代表隐藏脚
      title: '找不到！',
    },
  },
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      title: '社区之家',
    },
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
// 路由守卫：看路由大门的，凡是路由发生变化都会触发这个方法
// beforeEach：路由前置守卫，路由发生变化前触发
router.beforeEach((to,from,next)=>{
  // console.log('到哪去to:',to)
  // console.log('当前from:',from)
  // 修改标签栏标题
  document.title=to.meta.title
  
  next()  //放行：允许路由跳转，类似express的拦截器中间件
})

export default router
