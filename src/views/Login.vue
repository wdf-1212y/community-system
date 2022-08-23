<template>
  <div>
    <div class="login-bg"></div>
    <div class="login-container">
      <!-- 标题 -->
      <h2 class="index-title">USER / LOGIN</h2>
      <div class="line-container">
        <p class="line">登录</p>
      </div>
      <!-- 内容 -->
      <el-form
        class="login-form"
        label-width="0px"
        :rules="rules"
        :model="form"
        ref="f1"
      >
        <!-- 账号 -->
        <div class="form-item">
          <el-form-item
            label="账号："
            label-width="80px"
            class="form-label"
            prop="name"
          >
            <el-input
              style="width: 280px"
              type="text"
              placeholder="请输入账号"
              v-model="form.name"
              prefix-icon="el-icon-user"
            />
          </el-form-item>
        </div>
        <!-- 密码 -->
        <div class="form-item">
          <el-form-item
            label="密码："
            label-width="80px"
            class="form-label"
            prop="pwd"
          >
            <el-input
              style="width: 280px"
              type="password"
              placeholder="请输入密码"
              v-model="form.pwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 角色类型 -->
        <div class="form-item">
          <el-form-item
            label="类型："
            label-width="80px"
            class="form-label"
            prop="type"
          >
            <el-radio label="1" v-model="radio">管理员</el-radio>
            <el-radio label="2" v-model="radio">居民</el-radio>
            <el-radio label="3" v-model="radio">志愿者</el-radio>
          </el-form-item>
        </div>
        <div class="form-item">
          <el-form-item>
            <el-button class="btn" type="danger" @click="checkForm(form)">
              登录
            </el-button>
            <el-button
              class="btn"
              type="danger"
              @click="$router.push('/register')"
              >注册</el-button
            >
          </el-form-item>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
export default {
  data() {
    return {
      radio: "1",
      form: {
        name: "",
        pwd: "",
      },
      rules: {
        // 定义表单验证规则--显示的字
        name: [
          {
            required: true,
            message: "账号必填",
            trigger: "blur",
          },
          {
            pattern: /^([\u4e00-\u9fa5]{2,10}|[a-zA-Z0-9]{2,10})$/,
            message: "账号需为2~10位数字、汉字或字符",
            trigger: "blur",
          },
        ],
        pwd: [
          { required: true, message: "密码必填", trigger: "blur" },
          { pattern: /^\d{6}$/, message: "密码需为6位字符", trigger: "blur" },
        ],
      },
    };
  },
  watch:{
    radio:function(newVal,oldVal){
      console.log(newVal)
      this.reset()
    }
  },
  methods: {
    // 清空
    reset() {
      this.$refs['f1'].resetFields();
    },
    //整个表单验证
    checkForm(form) {
      // 管理员
      if (this.radio === "1") {
        console.log(form.name);
        console.log(form.pwd);
        console.log("验证通过，执行登录");
        var url = "admin/login";
        let params = `admin_name=${form.name}&password=${form.pwd}`;
        this.axios.post(url, params).then((res) => {
          console.log("登录结果:", res);
          if (res.data.code == 200) {
            // 登录成功
            // 访问vuex的updateUserInfo方法，修改用户登录信息
            this.$store.commit("updateUserInfo", form.name);
            this.$router.go(-1);
          } else {
            this.$message({
              type: "error",
              message: "账号或密码输入错误",
            });
          }
        });
      } else if (this.radio === "2") {
        // 居民
        console.log(form.name);
        console.log(form.pwd);
        console.log("验证通过，执行登录");
        var url = "resident/login";
        let params = `rname=${form.name}&rpassword=${form.pwd}`;
        this.axios.post(url, params).then((res) => {
          console.log("登录结果:", res);
          if (res.data.code == 200) {
            // 登录成功
            // 访问vuex的updateUserInfo方法，修改用户登录信息
            this.$store.commit("updateUserInfo", form.name);
            this.$router.go(-1);
          } else {
            this.$message({
              type: "error",
              message: "账号或密码输入错误",
            });
          }
        });
      } else if (this.radio === "3") {
        // 志愿者
        console.log(form.name);
        console.log(form.pwd);
        console.log("验证通过，执行登录");
        var url = "volunteer/login";
        let params = `vname=${form.name}&vpassword=${form.pwd}`;
        this.axios.post(url, params).then((res) => {
          console.log("登录结果:", res);
          if (res.data.code == 200) {
            // 登录成功
            // 访问vuex的updateUserInfo方法，修改用户登录信息
            this.$store.commit("updateUserInfo", form.name);
            this.$router.go(-1);
          } else {
            this.$message({
              type: "error",
              message: "账号或密码输入错误",
            });
          }
        });
      }
      // }
      else {
        console.warn("验证失败，请检查表单");
      }
    },
  },
  computed: {
    ...mapState(['loginname']),
  },
};
</script>

<style src="../assets/css/login.css">
</style>
<style lang="scss">
.el-input__inner {
  background-color: rgba(255, 255, 255, 0.4);
}
.el-form-item {
  background-color: unset !important;
}
.el-form-item__error {
  font-size: 13px;
  left: 30px;
}
</style>