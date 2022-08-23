<template>
  <!-- 志愿者图文列表 -->
  <div class="data-container">
    <!-- 标题 -->
    <h2 class="index-title">DATA SHOW</h2>
    <div class="line-container">
      <p class="line">志愿者展示</p>
    </div>
    <!-- 搜索头 -->
    <div class="search-container">
      <div class="vol-inline">
        <label class="vol-label">志愿者姓名:</label>
        <div class="vol-input">
          <input
            type="text"
            placeholder="输入志愿者姓名"
            class="inline-input"
            v-model="search"
            @keyup.enter="getData1()"
          />
        </div>
        <!-- <router-link to=""> -->
        <el-button type="danger" class="search-btn" @click="getData1()">
          <i class="el-icon-search"></i> 搜索
        </el-button>
        <!-- </router-link> -->
      </div>
    </div>
    <!-- 志愿者列表 -->
    <div class="data-list">
      <div
        class="data-item"
        v-for="item in data.slice(0, 8)"
        :key="item.vid"
        @click="goDetail(item.vid)"
      >
        <img :src="item.photo" class="cover" />
        <h3 class="title">{{ item.vname }}</h3>
      </div>
    </div>
  </div>
</template> 
<script>
export default {
  data() {
    return {
      data: [],
      data1: [],
      search:'',
    };
  },
  mounted() {
    this.getData();
    this.getData1();
  },
  methods: {
    // 志愿者列表
    getData() {
      var url = "volunteer/infos";
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
      });
    },
    goDetail(index) {
      this.$router.push("/vdetail?vid=" + Number(index));
    },
    // 模糊搜索查看志愿者详情
    getData1() {
      let input=this.search
      if(input==''){
        return
      }else{
        this.$router.push(`/vproc/${this.search}`);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.data-container .search-container {
  min-width: 1000px;
  display: flex;
  justify-content: space-around;
  margin: 15px 0px;
}
.vol-inline .vol-label {
  margin: 0px 10px;
}
.vol-inline .vol-input {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
}
.inline-input {
  outline: 0;
  -webkit-appearance: none;
  transition: all 0.3s;
  -webkit-transition: all 0.3s;
  box-sizing: border-box;
  height: 38px;
  line-height: 38px;
  border-width: 1px;
  border-style: solid;
  border-radius: 4px;
  padding-left: 10px;
}
.inline-input:hover {
  border-color: #d2d2d2 !important;
}
.inline-input:focus {
  border-color: #c9c9c9 !important;
}
.search-btn {
  margin-left: 10px;
}
</style>