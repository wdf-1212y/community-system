<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">FORUM / INFORMATION</h2>
    <div class="line-container">
      <p class="line">论坛中心</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 论坛信息 -->
    <div class="forum-container">
      <div class="btn-container">
        <el-button type="danger" @click="$router.push('/login')">
          <i class="el-icon-circle-plus-outline"></i>&nbsp;&nbsp; 发布帖子
        </el-button>
      </div>
      <div class="forum-list">
        <div
          class="forum-item"
          v-for="item in caseData"
          :key="item.fid"
          @click="goDetail(item.fid)"
        >
          <h2 class="h2">
            {{ item.forum_title }}（发布人：{{ item.username }}）
          </h2>
          <div class="create-time">{{ dateFormat(item.addtime) }}</div>
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
      var url = "forum/infos";
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
  },
};
</script>

<style lang="scss" scoped>
// 论坛
.banner {
  background: #ce0b07;
  height: 30px;
  margin: 20px 0;
}
.forum-container {
  width: 1000px;
  margin: 30px auto;
  text-align: center;
}
.forum-container .btn-container {
  text-align: right;
  margin-bottom: 50px;
  border: 2px dotted #eeeeee;
  padding: 15px;
}
.forum-container .forum-list {
  text-align: left;
  margin-top: 20px;
}
.forum-container .forum-list .forum-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px;
  border-bottom: 3px dotted #eeeeee;
  border-top: 3px dotted #eeeeee;
}
.forum-container .forum-list .forum-item:hover {
  background: #ce0b07;
  color: #ffffff;
}
.forum-container .forum-list .forum-item .h2 {
  font-size: 14px;
}
.forum-container .forum-list .forum-item .create-time {
  font-size: 14px;
}
.forum-container .pager {
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