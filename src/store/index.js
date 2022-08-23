import Vue from 'vue'
import Vuex from 'vuex'

import router from '../router/index';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // 存储全局共享数据
    loginname:window.sessionStorage.getItem('loginname'), //保存当前登录用户
  },
  getters: {
  },
  mutations: {
    // 用于声明方法修改state
    updateUserInfo(state,payload){
      // 将用户名存入state
      state.loginname=payload
      // 需要持久化存储，还需要将用户名存入sessionStorage
      window.sessionStorage.setItem('loginname',payload) 
    },
    logout(state,payload){
      state.loginname='',  //将vuex的数据清空
      window.sessionStorage.clear()  //将sessionStorage中数据清空
      router.push({path:"/"})
    }
  },
  actions: {
  },
  modules: {
  }
})
