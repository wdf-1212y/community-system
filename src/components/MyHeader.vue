<template>
  <div>
    <!-- 顶部导航栏 -->
    <div class="header">
      <div class="container">
        <!-- logo -->
        <div class="header-logo">
          <router-link to="/">
            <img src="../assets/img/logo.jpg" />
          </router-link>
        </div>
        <!-- 导航列表 -->
        <div class="header-nav">
          <ul class="nav-list">
            <li class="nav-item"><router-link to="/">首页</router-link></li>
            <li class="nav-item">
              <router-link to="/volunteer">志愿者</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/forum">论坛信息</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/news">新闻资讯</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/cart">防疫物资</router-link>
            </li>
          </ul>
        </div>
        <!-- 头部右侧 -->
        <div class="rt">
          <ul class="lf" v-if="$store.state.loginname">
            <li>欢迎{{$store.state.loginname}}
              <button @click="logout()">退出</button>
            </li>
            <li>
              <a href="" title="购物车">
                <i class="el-icon-shopping-cart-2" style="color: black"></i> </a
              >
            </li>
            <li><a title="跳到后台">后台</a></li>
          </ul>
          <ul class="lf" v-else>
            <li>
              <a href="" title="跳到后台">
                <i class="el-icon-tickets" style="color: black"></i> </a
              >
            </li>
            <li><router-link to="/login" title="用户登录">登录</router-link></li>
            <li><router-link to="/register" title="注册新用户">注册</router-link></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

 <script>
import { mapMutations, mapState } from 'vuex';
export default {
  computed: {
    ...mapState(['loginname']),
  },
  methods: {
    ...mapMutations(['logout']),
  },
};
</script>

<style src="../assets/css/header.css">
</style>