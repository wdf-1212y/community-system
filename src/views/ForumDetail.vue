<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">FORUM / DETAILS</h2>
    <div class="line-container">
      <p class="line">论坛详情</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 论坛详情 -->
    <div class="forum-container" v-for="item in data" :key="item.fid">
      <h1 class="title">{{item.forum_title}}</h1>
      <div class="auth-container">发布人：{{item.username}} 时间：{{ dateFormat(item.addtime)}}</div>
      <div class="bottom-container">
        <div class="title2">帖子内容</div>
        <el-button id="btn-add-win" class="btn" type="danger"
        @click="jumpTo()">返回列表</el-button>
      </div>
      <div class="content" v-html="item.forum_content" v-show="item.forum_content"></div>
      <div class="contentnot" v-show="!item.forum_content">不好意思，此项没有内容哟(●'◡'●)</div>
      <div class="message-list">
        <div class="message-item">
          <div class="username-container">
            <img class="avator" src="../assets/img/avator.png" />
            <span class="username">用户：{{item.username}}</span>
          </div>
          <div class="content">
            <span class="message"> 本篇帖子：{{item.forum_title}} </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
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
      const fid = this.$route.query.fid;
      var url = `forum/info/${fid}`;
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
.forum-container {
  width: 1000px;
  text-align: center;
  margin: 30px auto;
}
.forum-container .title {
	font-size: 22px;
  font-weight: bold;
  padding-top: 10px;
}
.forum-container .title2 {
	font-size: 18px;
  font-weight: bold;
  padding-top: 10px;
  padding-left: 10px;
}
.forum-container .content {
	width: 980px;
  margin: 10px auto;
  text-align: left;
  margin-top: 30px;
  font-size: 16px;
  line-height: 30px;
}
.forum-container .contentnot{
  margin-top: 10px;
  font-size: 16px;
  font-weight: bold;
}
.forum-container .auth-container {
	margin-top: 15px;
  color: #888888;
  border-bottom: 1px dotted #888888;
  padding-bottom: 15px;
}
.forum-container .bottom-container {
	display: flex;
  justify-content: space-between;
  width: 100%;
  margin: 0 auto;
  background: #eeeeee;
  height: 50px;
  line-height: 35px;
  margin-top: 20px;
}
.forum-container .bottom-container .title {
	margin-left: 30px;
	font-size: 20px;
	color: #515151;
}
.forum-container .bottom-container .btn {
	font-size: 16px;
  padding: 0 10px;
  margin: 10px;
}
.forum-container .message-list {
	text-align: left;
}
.forum-container .message-list .message-item {
	margin-top: 20px;
	border-bottom: 1px solid #EEEEEE;
}
.forum-container .message-list .message-item .username-container {
	font-size: 18px;
  position: relative;
}
.forum-container .message-list .message-item .username-container .avator {
	width: 50px;
	height: 50px;
	border-radius: 50%;
  display: inline-block;
}
.forum-container .message-list .message-item .username-container .username{
  position: absolute;
  top: 10px;
  margin-left: 10px;
}
.forum-container .message-list .message-item .content {
	margin: 10px;
  font-weight: bold;
  color: #777;
}
</style>