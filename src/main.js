import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false

// 优雅的全局注入axios
import axios from 'axios'
import VueAxios from 'vue-axios'
// 先配置axios再集成;配置基础服务器路径
axios.defaults.baseURL='http://127.0.0.1:3000/v1/'
Vue.use(VueAxios,axios)

// 注入swiper
import VAS from 'vue-awesome-swiper'
Vue.use(VAS)
// 全局加载swiper的css文件
import 'swiper/css/swiper.css'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

import moment from 'moment'
Vue.prototype.$moment = moment

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
