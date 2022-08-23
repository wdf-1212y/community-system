<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">NEWS / DETAILS</h2>
    <div class="line-container">
      <p class="line">新闻详情</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 新闻详情 -->
    <div class="news-container" v-for="item in data" :key="item.nid">
      <h1 class="title">{{ item.news_title }}</h1>
      <div class="auth-container">时间：{{ dateFormat(item.addtime) }}</div>
      <div class="content" v-html="item.news_detailcon" v-show="item.news_detailcon"></div>
      <div class="contentnot" v-show="!item.news_detailcon">不好意思，此项没有内容哟(●'◡'●)</div>
      <div class="bottom-container">
        <div class="title">本篇文章：{{ item.news_title }}</div>
        <el-button @click="jumpTo()" class="btn" type="danger"
          >返回列表</el-button
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      news_detailcon:'',
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    dateFormat: function (time) {
      const date = this.$moment(time).format("YYYY-MM-DD HH:mm:ss");
      return date;
    },
    getData() {
      console.log("$route", this.$route);
      const nid = this.$route.query.nid;
      var url = `news/info/${nid}`;
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
      });
    },
    jumpTo() {
      this.$router.go(-1);
    },
  },
};
</script>

<style lang="scss" scoped>
.banner {
  background: #ce0b07;
  height: 30px;
  margin: 20px 0;
}
.news-container {
  width: 1000px;
  text-align: center;
  margin: 30px auto;
}
.news-container .title {
  font-size: 22px;
  font-weight: bold;
  padding-top: 10px;
}
.news-container .content {
  width: 980px;
  margin: 10px auto;
  text-align: left;
  margin-top: 30px;
  font-size: 16px;
  line-height: 30px;
}
.news-container .contentnot{
  margin-top: 10px;
  font-size: 16px;
  font-weight: bold;
}
.news-container .auth-container {
  margin-top: 15px;
  color: #888888;
  border-bottom: 1px dotted #888888;
  padding-bottom: 15px;
}
.news-container .bottom-container {
  display: flex;
  justify-content: space-between;
  width: 100%;
  margin: 0 auto;
  background: #eeeeee;
  height: 50px;
  line-height: 35px;
  margin-top: 20px;
}
.news-container .bottom-container .title {
  font-size: 18px;
  color: #515151;
  margin-left: 10px;
}
.news-container .bottom-container .btn {
  font-size: 16px;
  padding: 0 10px;
  margin: 10px;
}
</style>