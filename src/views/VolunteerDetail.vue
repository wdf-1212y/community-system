<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">DATA / DETAILS</h2>
    <div class="line-container">
      <p class="line">志愿者详情</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 志愿者详情 -->
    <div class="vol-container">
      <div class="vol-list" v-for="item in data" :key="item.vid">
        <div class="vol-item">
          <div class="cover-container">
            <img class="cover" :src="item.photo" />
          </div>
          <div class="detail-container">
            <h2 class="h2">志愿者姓名：{{ item.vname }}</h2>
            <div class="desc">性别：{{ item.sex }}</div>
            <div class="desc">家庭地址：{{ item.address }}</div>
            <div class="desc">联系电话：{{ item.phone }}</div>
            <div class="desc">身份证号：{{ item.idcard }}</div>
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
    getData() {
      // console.log("$route", this.$route);
      const vid = this.$route.query.vid;
      var url = `volunteer/inf/${vid}`;
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
// 志愿者
.banner {
  background: #ce0b07;
  height: 30px;
  margin: 20px 0;
}
.vol-container {
  width: 1000px;
  text-align: center;
  margin: 30px auto;
  background-color: #fff;
}
.vol-container .vol-list {
  margin: 0 auto;
  text-align: left;
}
.vol-container .vol-item {
  display: flex;
  border-bottom: 2px solid #eeeeee;
  padding: 10px;
}
.vol-container .vol-item .cover-container {
  margin: 0 20px;
}
.vol-container .vol-item .cover-container .cover {
  width: 200px;
  height: 200px;
  object-fit: cover;
}
.vol-container .vol-item .detail-container .h2 {
  font-size: 18px;
  font-weight: bold;
  margin-left: 30px;
}
.vol-container .vol-item .detail-container .desc {
  height: 25px;
  padding-top: 20px;
  margin-left: 30px;
  color: #515151;
}
.vol-container .vol-item .detail-container .h2 {
  color: #4e6990;
}
.vol-container .vol-item .detail-container .create-time {
  color: #515151;
}
</style>