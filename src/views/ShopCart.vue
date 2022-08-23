<template>
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">GOODS / SHOW</h2>
    <div class="line-container">
      <p class="line">物资展示</p>
    </div>
    <!-- banner -->
    <div class="banner"></div>
    <!-- 物资 -->
    <div class="news-container">
      <!-- &nbsp;&nbsp;<input type="checkbox" @change="checkAll" v-model="chba" />
      &nbsp;&nbsp;全选 -->
      <div class="news-list" v-for="(item, index) in caseData" :key="index">
        <div class="news-item">
          <!-- 双向数据绑定:用户操作可以同步修改数据 -->
          <!-- <input type="checkbox" v-model="item.state" @change="checkOne" /> -->
          <div class="cover-container">
            <img class="cover" :src="item.gpic" />
          </div>
          <div class="detail-container">
            <table>
              <tr>
                <span class="h2">名称</span>
                <span class="h2">价格</span>
                <span class="h2">数量</span>
                <span class="h2">小计</span>
              </tr>
              <tr>
                <span class="h3">{{ item.gname }}</span>
                <span class="h3">￥{{ item.price }}</span>
                <div class="h3" style="display: inline-block">
                  <button @click="item.gcount--" :disabled="item.gcount == 1">
                    -
                  </button>
                  <span>{{ item.gcount }}</span>
                  <button @click="item.gcount++">+</button>
                </div>
                <span class="h3">￥{{ item.price * item.gcount }}</span>
              </tr>
              <tr class="desc">
                {{
                  item.note
                }}
              </tr>
              <div class="gtotal">
                <div class="create">合计:{{ total }}</div>
                <button class="create1" @click="addCart(index)">
                  加入购物车
                </button>
              </div>
            </table>
          </div>
        </div>
      </div>
      <!-- <div class="gtotal">
        <div class="create">合计:{{ total }}</div>
        <button class="create1" @click="addCart()">加入购物车</button>
      </div> -->
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
import { mapState } from "vuex";
export default {
  data() {
    return {
      // 要想获取表单元素的值，都可以依赖双向绑定实现
      chba: false, //全选按钮的值
      data: [],
      caseData: [],
      pageSize: 5,
      currentPage: 1,
      data1: [],
      data2: [],
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    getData() {
      var url = "goods/infos";
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
        this.getPageData();
      });
    },
    // 倒计时
    countDown() {
      const TIME_COUNT = 3;
      if (!this.timer) {
        this.count = TIME_COUNT;
        this.timer = setInterval(() => {
          if (this.count > 1 && this.count <= TIME_COUNT) {
            this.count--;
          } else {
            clearInterval(this.timer);
            this.timer = null;
            this.$router.push("/login");
          }
        }, 1000);
      }
    },
    addCart(index) {
      console.log(index);
      if (this.$store.state.loginname) {
        const rname = this.$store.state.loginname;
        var url = `resident/infi/${rname}`;
        this.axios.get(url).then((res) => {
          console.log(res);
          let resid = res.data.data[0].rid;
          console.log(resid);
          if (res.data.code == 200) {
            var url = "shop/reg";
            let params = `rid=${resid}&gid=${index}`;
            this.axios.post(url, params).then((res) => {
              console.log(res);
              this.data2 = res.data.data;
              this.$message({
                type: "success",
                message: "成功添加到购物车",
              });
            });
          } 
          if (res.data.code == 501) {
            this.$message({
              type: "error",
              message: "您非居民用户!!!",
            });
          }
        });
      } else {
        this.$message({
          type: "error",
          message: "您未登录，即将跳转到登录页面",
        });
        // 倒计时跳转
        this.countDown();
      }
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
    // 每个数据项的单选按钮状态变化时
    // checkOne() {
    //   this.chba = this.data.every((item) => item.state);
    // },
    // checkAll(e) {
    //   console.log("全选状态变化", e.target.state);
    //   this.data.forEach((item) => (item.state = this.chba));
    // },
  },

  computed: {
    ...mapState(["loginname"]),
    total() {
      // 只计算勾选状态checked为真的元素
      // *checked  真1  假0
      return this.data.reduce(
        (sum, value) => sum + value.price * value.gcount * value.state,
        0
      );
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
  // text-align: center;
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
  margin: 0 10px;
}
.news-container .news-list .news-item .cover-container .cover {
  width: 180px;
  height: 180px;
  object-fit: cover;
}
.news-container .detail-container .h2 {
  font-weight: bold;
  color: #4e6990;
  padding: 40px;
}
.news-container .detail-container .h3 {
  padding: 40px;
  font-weight: bold;
}
.news-container .detail-container .desc {
  padding-top: 20px;
  color: #515151;
}
.news-container .gtotal {
  position: relative;
}
.news-container .gtotal .create {
  color: #515151;
  position: absolute;
  right: 100px;
}
.news-container .gtotal .create1 {
  color: #ce0b07;
  position: absolute;
  right: 10px;
  border: none;
  background-color: #fff;
  font-size: 16px;
}
.news-container .pager {
  margin-top: 30px;
  text-align: center;
}
</style>