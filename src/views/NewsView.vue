<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">NEWS / INFORMATION</h2>
    <div class="line-container">
      <p class="line">新闻资讯</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 新闻资讯 -->
    <div class="news-container">
      <div class="news-list" v-for="item in caseData" :key="item.nid">
        <div class="news-item" @click="goDetail(item.nid)">
          <div class="cover-container">
            <img class="cover" :src="item.picture" />
          </div>
          <div class="detail-container">
            <h2 class="h2">{{ item.news_title }}</h2>
            <div class="desc">{{ item.news_content }}...</div>
            <div class="create-time">{{ dateFormat(item.addtime) }}</div>
          </div>
        </div>
      </div>
      <!-- 分页 -->
      <div class="pager">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[5, 10, 15, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="data.length"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      caseData:[],
      pageSize: 5,
      currentPage: 1,
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
      var url = "news/infos";
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
        this.getPageData();
      });
    },
    // 根据分页设置的数据控制每页显示的数据条数及页码跳转页面刷新
    getPageData() {
      let start = (this.currentPage - 1) * this.pageSize;
      let end = start + this.pageSize;
      this.caseData = this.data.slice(start, end);
    },
    // 分页自带的函数，当pageSize变化时会触发此函数
    handleSizeChange(val) {
      this.pageSize = val;
      this.getPageData();
    },
    // 分页自带函数，当currentPage变化时会触发此函数
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getPageData();
    },
    goDetail(index) {
      this.$router.push("/fdetail?fid=" + Number(index));
    },
    goDetail(index) {
      this.$router.push("/ndetail?nid=" + Number(index));
    },
  },
};
</script>

<style lang="scss" scoped>
// 新闻
.banner {
  background: #ce0b07;
  height: 30px;
  margin: 20px 0;
}
.news-container {
  width: 1000px;
  text-align: center;
  margin: 30px auto;
  background-color: #fff;
}
.news-container .news-list {
  margin: 0 auto;
  text-align: left;
}
.news-container .news-list .news-item {
  display: flex;
  border-bottom: 2px solid #eeeeee;
  padding: 10px;
}
.news-container .news-list .news-item .cover-container {
  margin: 0 20px;
}
.news-container .news-list .news-item .cover-container .cover {
  width: 200px;
  height: 200px;
  object-fit: cover;
}
.news-container .news-list .news-item .detail-container .h2 {
  font-size: 18px;
  font-weight: bold;
}
.news-container .news-list .news-item .detail-container .desc {
  height: 140px;
  padding-top: 20px;
  color: #515151;
}
.news-container .news-list .news-item .detail-container .h2 {
  color: #4e6990;
}
.news-container .news-list .news-item .detail-container .create-time {
  color: #515151;
}
.news-container .pager {
  margin-top: 20px;
}
</style>
<style lang="scss">
.el-pager li:hover{
  color: #ce0b07;
}
.el-pager li.active{
  color: #ce0b07;
}
</style>