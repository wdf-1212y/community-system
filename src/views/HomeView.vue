<template>
  <div>
    <!-- 轮播图 -->
    <div class="thumb-example">
      <!-- swiper1 -->
      <swiper
        class="swiper gallery-top"
        :options="swiperOptionTop"
        ref="swiperTop"
      >
        <swiper-slide class="slide-1"></swiper-slide>
        <swiper-slide class="slide-2"></swiper-slide>
        <swiper-slide class="slide-3"></swiper-slide>
        <swiper-slide class="slide-4"></swiper-slide>
        <div
          class="swiper-button-next swiper-button-white"
          slot="button-next"
        ></div>
        <div
          class="swiper-button-prev swiper-button-white"
          slot="button-prev"
        ></div>
      </swiper>
      <!-- swiper2 Thumbs -->
      <swiper
        class="swiper gallery-thumbs"
        :options="swiperOptionThumbs"
        ref="swiperThumbs"
      >
        <swiper-slide class="slide-1"></swiper-slide>
        <swiper-slide class="slide-2"></swiper-slide>
        <swiper-slide class="slide-3"></swiper-slide>
        <swiper-slide class="slide-4"></swiper-slide>
      </swiper>
    </div>
    <!-- 首页新闻资讯 -->
    <div class="news-container">
      <h2 class="index-title">HOME NEWS</h2>
      <div class="line-container">
        <p class="line">新闻资讯</p>
      </div>
      <div class="news-row">
        <div class="news-col-left">
          <div class="news-collapse">
            <div
              class="news-item"
              v-for="item in data.slice(0, 2)"
              :key="item.nid"
            >
              <h2 class="news-title">{{ item.news_title }}</h2>
              <div class="news-content">{{ item.news_content }}...</div>
            </div>
          </div>
        </div>
        <div class="news-col-right">
          <div class="card-container">
            <div
              class="news-card"
              v-for="item in data.slice(2, 7)"
              :key="item.nid"
            >
              <div class="news-card-header">{{ item.news_title }}</div>
            </div>
          </div>
        </div>
      </div>
      <div class="more">
        <button type="button" @click="jumpTo">查看更多>></button>
      </div>
    </div>
    <!-- 首页志愿者列表 -->
    <div class="data-container">
      <h2 class="index-title">VOLUNTEER SHOW</h2>
      <div class="line-container">
        <p class="line">志愿者展示</p>
      </div>
      <div class="more">
        <button type="button" @click="jumpTo1">查看更多>></button>
      </div>
      <div class="data-list">
        <div class="data-item" v-for="item in data1.slice(0,4)" :key="item.vid">
          <img class="cover" :src="item.photo" />
          <h3 class="title">{{ item.vname }}</h3>
        </div>
        <!-- <div class="data-item">
          <img class="cover" src="/volunteer/zyz_touxiang2.jpg" />
          <h3 class="title">志愿者姓名</h3>
        </div> -->
      </div>
    </div>
  </div>
</template>

<script>
import { Swiper, SwiperSlide } from "vue-awesome-swiper";
import "swiper/css/swiper.css";
export default {
  name: "swiper-example-thumbs-gallery",
  title: "Thumbs gallery with Two-way control",
  components: {
    Swiper,
    SwiperSlide,
  },
  data() {
    return {
      swiperOptionTop: {
        autoplay: true,
        loop: true,
        loopedSlides: 4, // looped slides should be the same
        spaceBetween: 10,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      },
      swiperOptionThumbs: {
        loop: true,
        loopedSlides: 4, // looped slides should be the same
        spaceBetween: 10,
        centeredSlides: true,
        slidesPerView: "auto",
        touchRatio: 0.2,
        slideToClickedSlide: true,
      },
      // 新闻
      data: [],
      // 志愿者
      data1: [],
    };
  },
  created(){
  },
  mounted() {
    this.$nextTick(() => {
      const swiperTop = this.$refs.swiperTop.$swiper;
      const swiperThumbs = this.$refs.swiperThumbs.$swiper;
      swiperTop.controller.control = swiperThumbs;
      swiperThumbs.controller.control = swiperTop;
    });
    this.getData();
    this.getData1();
  },
  methods: {
    // 新闻列表
    getData() {
      var url = "news/infos";
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data = res.data.data;
      });
    },
    // 志愿者列表
    getData1() {
      var url = "volunteer/infos";
      this.axios.get(url).then((res) => {
        console.log(res);
        this.data1 = res.data.data;
      });
    },
    jumpTo() {
      this.$router.push("/news");
    },
    jumpTo1() {
      this.$router.push("/volunteer");
    },
  },
};
</script>

<style src="../assets/css/home.css">
</style>
<style lang="scss">
.thumb-example {
  min-width: 1226px;
  margin: 10px;
  height: 480px;
  background-color: black;
}
.swiper {
  .swiper-slide {
    background-size: cover;
    background-position: center;

    &.slide-1 {
      background-image: url("../assets/img/picture1.jpg");
    }
    &.slide-2 {
      background-image: url("../assets/img/picture2.jpg");
    }
    &.slide-3 {
      background-image: url("../assets/img/picture3.jpg");
    }
    &.slide-4 {
      background-image: url("../assets/img/picture4.jpg");
    }
  }

  &.gallery-top {
    height: 80%;
    width: 100%;
  }
  &.gallery-thumbs {
    height: 20%;
    box-sizing: border-box;
    padding: 10px 0;
  }
  &.gallery-thumbs .swiper-slide {
    width: 25%;
    height: 100%;
    opacity: 0.4;
  }
  &.gallery-thumbs .swiper-slide-active {
    opacity: 1;
  }
}
</style>