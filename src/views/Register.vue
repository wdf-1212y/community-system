<template>
  <div>
    <div class="login-bg"></div>
    <div class="login-container">
      <!-- 标题 -->
      <h2 class="index-title">USER / REGISTER</h2>
      <div class="line-container">
        <p class="line">注册</p>
      </div>
      <!-- 管理员注册内容 -->
      <el-form
        class="login-form"
        label-width="0px"
        :rules="rules"
        :model="adminRegister"
        v-if="radio == 1"
        key="admin"
      >
        <!-- 账号 -->
        <div class="form-item">
          <el-form-item
            label="账号："
            label-width="100px"
            class="form-label"
            prop="name"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入账号"
              type="text"
              v-model="adminRegister.name"
              prefix-icon="el-icon-user"
            />
          </el-form-item>
        </div>
        <!-- 密码 -->
        <div class="form-item">
          <el-form-item
            label="密码："
            label-width="100px"
            class="form-label"
            prop="pwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入密码"
              type="password"
              v-model="adminRegister.pwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 确认密码 -->
        <div class="form-item">
          <el-form-item
            label="确认密码："
            type="password"
            label-width="100px"
            class="form-label"
            prop="upwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入确认密码"
              type="password"
              v-model="adminRegister.upwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 角色类型 -->
        <div class="form-item">
          <el-form-item label="类型：" label-width="100px" class="form-label">
            <el-radio :label="1" v-model="radio">管理员</el-radio>
            <el-radio :label="2" v-model="radio">居民</el-radio>
            <el-radio :label="3" v-model="radio">志愿者</el-radio>
          </el-form-item>
        </div>
        <div class="form-item">
          <el-form-item class="reg">
            <el-button class="btn" type="danger" @click="checkForm">
              注册
            </el-button>
            <router-link to="/login">已有账号?去登录</router-link>
          </el-form-item>
        </div>
      </el-form>
      <!-- 居民注册内容 -->
      <el-form
        class="login-form"
        label-width="0px"
        :rules="rules"
        :model="residentRegister"
        v-if="radio == 2"
        key="resident"
      >
        <!-- 账号 -->
        <div class="form-item">
          <el-form-item
            label="账号："
            label-width="100px"
            class="form-label"
            prop="name"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入账号"
              type="text"
              v-model="residentRegister.name"
              prefix-icon="el-icon-user"
            />
          </el-form-item>
        </div>
        <!-- 密码 -->
        <div class="form-item">
          <el-form-item
            label="密码："
            label-width="100px"
            class="form-label"
            prop="pwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入密码"
              type="password"
              v-model="residentRegister.pwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 确认密码 -->
        <div class="form-item">
          <el-form-item
            label="确认密码："
            type="password"
            label-width="100px"
            class="form-label"
            prop="rupwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入确认密码"
              type="password"
              v-model="residentRegister.rupwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 性别 -->
        <div class="form-item">
          <el-form-item
            label="性别："
            label-width="100px"
            class="form-label"
            prop="rsex"
          >
            <el-select
              style="width: 280px"
              placeholder="请选择性别"
              v-model="residentRegister.rsex"
            >
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
        </div>
        <!-- 电话 -->
        <div class="form-item">
          <el-form-item
            label="电话："
            label-width="100px"
            class="form-label"
            prop="rphone"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入电话"
              v-model="residentRegister.rphone"
              prefix-icon="el-icon-phone-outline"
            />
          </el-form-item>
        </div>
        <!-- 邮箱 -->
        <div class="form-item">
          <el-form-item
            label="邮箱："
            label-width="100px"
            class="form-label"
            prop="remail"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入邮箱"
              v-model="residentRegister.remail"
              prefix-icon="el-icon-message"
            />
          </el-form-item>
        </div>
        <!-- 角色类型 -->
        <div class="form-item">
          <el-form-item label="类型：" label-width="100px" class="form-label">
            <el-radio :label="1" v-model="radio">管理员</el-radio>
            <el-radio :label="2" v-model="radio">居民</el-radio>
            <el-radio :label="3" v-model="radio">志愿者</el-radio>
          </el-form-item>
        </div>
        <div class="form-item">
          <el-form-item class="reg">
            <el-button class="btn" type="danger" @click="checkForm">
              注册
            </el-button>
            <router-link to="/login">已有账号?去登录</router-link>
          </el-form-item>
        </div>
      </el-form>
      <!-- 志愿者注册内容 -->
      <el-form
        class="login-form"
        label-width="0px"
        :rules="rules"
        :model="volunteerRegister"
        v-if="radio == 3"
        key="volunteer"
      >
        <!-- 账号 -->
        <div class="form-item">
          <el-form-item
            label="账号："
            label-width="100px"
            class="form-label"
            prop="name"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入账号"
              type="text"
              v-model="volunteerRegister.name"
              prefix-icon="el-icon-user"
            />
          </el-form-item>
        </div>
        <!-- 密码 -->
        <div class="form-item">
          <el-form-item
            label="密码："
            label-width="100px"
            class="form-label"
            prop="pwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入密码"
              type="password"
              v-model="volunteerRegister.pwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 确认密码 -->
        <div class="form-item">
          <el-form-item
            label="确认密码："
            type="password"
            label-width="100px"
            class="form-label"
            prop="vupwd"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入确认密码"
              type="password"
              v-model="volunteerRegister.vupwd"
              prefix-icon="el-icon-lock"
            />
          </el-form-item>
        </div>
        <!-- 性别 -->
        <div class="form-item">
          <el-form-item
            label="性别："
            label-width="100px"
            class="form-label"
            prop="vsex"
          >
            <el-select
              style="width: 280px"
              placeholder="请选择性别"
              v-model="volunteerRegister.vsex"
            >
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
        </div>
        <!-- 电话 -->
        <div class="form-item">
          <el-form-item
            label="电话："
            label-width="100px"
            class="form-label"
            prop="vphone"
          >
            <el-input
              style="width: 280px"
              placeholder="请输入电话"
              v-model="volunteerRegister.vphone"
              prefix-icon="el-icon-phone-outline"
            />
          </el-form-item>
        </div>
        <!-- 上传照片 -->
        <!-- <div class="form-item">
          <el-form-item label="照片：" label-width="100px" class="form-label" prop="photo">
            <el-upload
              class="upload-demo"
              drag
              action="http://127.0.0.1:3000/v1/volunteer/reg"
              multiple
              v-model="volunteerRegister.photo"
            >
              <i class="el-icon-upload"></i>
              <div class="el-upload__text">
                将文件拖到此处，或<em>点击上传</em>
              </div>
              <div class="el-upload__tip" slot="tip">
                只能上传jpg/png文件，且不超过500kb
              </div>
            </el-upload>
          </el-form-item>
        </div> -->
        <!-- 角色类型 -->
        <div class="form-item">
          <el-form-item label="类型：" label-width="100px" class="form-label">
            <el-radio :label="1" v-model="radio">管理员</el-radio>
            <el-radio :label="2" v-model="radio">居民</el-radio>
            <el-radio :label="3" v-model="radio">志愿者</el-radio>
          </el-form-item>
        </div>
        <div class="form-item">
          <el-form-item class="reg">
            <el-button class="btn" type="danger" @click="checkForm">
              注册
            </el-button>
            <router-link to="/login">已有账号?去登录</router-link>
          </el-form-item>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    // 验证重复密码与密码是否一致
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.adminRegister.upwd) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.residentRegister.rupwd) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    var validatePass3 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.volunteerRegister.vupwd) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    return {
      radio: 1,
      count: "",
      //管理员注册信息对象
      adminRegister: { name: "", pwd: "", upwd: "" },
      //居民注册信息对象
      residentRegister: {
        name: "",
        pwd: "",
        rupwd: "",
        rsex: "",
        rphone: "",
        remail: "",
      },
      //志愿者注册信息对象
      volunteerRegister: {
        name: "",
        pwd: "",
        vupwd: "",
        vsex: "",
        vphone: "",
        // photo: "",
      },
      rules: {
        // 定义表单验证规则
        name: [
          { required: true, message: "账号必填", trigger: "blur" },
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
        upwd: [
          { required: true, message: "确认密码必填", trigger: "blur" },
          {
            pattern: /^\d{6}$/,
            message: "确认密码需为6位字符且与密码一致",
            trigger: "blur",
          },
          { validator: validatePass, trigger: "blur" },
        ],
        rupwd: [
          { required: true, message: "确认密码必填", trigger: "blur" },
          {
            pattern: /^\d{6}$/,
            message: "确认密码需为6位字符且与密码一致",
            trigger: "blur",
          },
          { validator: validatePass2, trigger: "blur" },
        ],
        rsex: [{ required: true }],
        rphone: [
          { required: true, message: "电话必填", trigger: "blur" },
          {
            pattern: /^1[3-9]\d{9}$/,
            message: "电话为规范11位",
            trigger: "blur",
          },
        ],
        remail: [
          { required: true, message: "邮箱必填", trigger: "blur" },
          {
            pattern: /^([\w]+)@([\w]+)\.([a-zA-Z]{2,4})$/,
            message: "邮箱为QQ邮箱",
            trigger: "blur",
          },
        ],
        vupwd: [
          { required: true, message: "确认密码必填", trigger: "blur" },
          {
            pattern: /^\d{6}$/,
            message: "确认密码需为6位字符且与密码一致",
            trigger: "blur",
          },
          { validator: validatePass3, trigger: "blur" },
        ],
        vsex: [{ required: true }],
        vphone: [
          { required: true, message: "电话必填", trigger: "blur" },
          {
            pattern: /^1[3-9]\d{9}$/,
            message: "电话为规范11位",
            trigger: "blur",
          },
        ],
        // photo:[
        //   { required: true, message: "照片不能为空", trigger: "blur" },
        // ]
      },
    };
  },
  methods: {
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
    //整个表单验证
    checkForm() {
      if (this.radio === 1) {
        console.log(this.adminRegister.name);
        console.log(this.adminRegister.pwd);
        console.log("验证通过，执行注册");
        var url = `admin/info/${this.adminRegister.name}`;
        this.axios.get(url).then((res) => {
          console.log("注册结果:", res);
          if (res.data.code == 501) {
            var url = "admin/reg";
            let params = `admin_name=${this.adminRegister.name}&password=${this.adminRegister.pwd}`;
            this.axios.post(url, params).then((res) => {
              console.log("注册结果:", res);
              if (res.data.code == 200) {
                this.$store.commit("updateUserInfo", this.adminRegister.name);
                this.$message({
                  type: "success",
                  message: "注册成功，即将跳转到登录页面",
                });
                // 倒计时跳转
                this.countDown();
              }
            });
          } else {
            this.$message({
              type: "error",
              message: "注册失败,账户已存在",
            });
          }
        });
      } else if (this.radio === 2) {
        console.log(this.residentRegister.name);
        console.log(this.residentRegister.pwd);
        console.log("验证通过，执行注册");
        var url = `resident/info/${this.residentRegister.name}`;
        this.axios.get(url).then((res) => {
          console.log("注册结果:", res);
          if (res.data.code == 501) {
            var url = "resident/reg";
            let params = `rname=${this.residentRegister.name}&rpassword=${this.residentRegister.pwd}&sex=${this.residentRegister.rsex}&phone=${this.residentRegister.rphone}&email=${this.residentRegister.remail}`;
            this.axios.post(url, params).then((res) => {
              console.log("注册结果:", res);
              if (res.data.code == 200) {
                this.$store.commit(
                  "updateUserInfo",
                  this.residentRegister.name
                );
                this.$message({
                  type: "success",
                  message: "注册成功，即将跳转到登录页面",
                });
                // 倒计时跳转
                this.countDown();
              }
            });
          } else {
            this.$message({
              type: "error",
              message: "注册失败,账户已存在",
            });
          }
        });
      } else if (this.radio === 3) {
        console.log(this.volunteerRegister.name);
        console.log(this.volunteerRegister.pwd);
        console.log("验证通过，执行注册");
        var url = `volunteer/info/${this.volunteerRegister.name}`;
        this.axios.get(url).then((res) => {
          console.log("注册结果:", res);
          if (res.data.code == 501) {
            var url = "volunteer/reg";
            let params = `vname=${this.volunteerRegister.name}&vpassword=${this.volunteerRegister.pwd}&sex=${this.volunteerRegister.vsex}&phone=${this.volunteerRegister.vphone}`;
            this.axios.post(url, params).then((res) => {
              console.log("注册结果:", res);
              if (res.data.code == 200) {
                this.$store.commit(
                  "updateUserInfo",
                  this.volunteerRegister.name
                );
                this.$message({
                  type: "success",
                  message: "注册成功，即将跳转到登录页面",
                });
                // 倒计时跳转
                this.countDown();
              }
            });
          } else {
            this.$message({
              type: "error",
              message: "注册失败,账户已存在",
            });
          }
        });
      } else {
        alert("验证失败，请检查表单");
      }
    },
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
// .el-upload-dragger {
//   width: 280px;
//   height: 100px;
// }
// .el-upload-dragger .el-icon-upload {
//   // line-height: 20px;
//   margin: 10px 0;
// }
// .el-form-item__content {
//   line-height: 10px;
// }
</style>