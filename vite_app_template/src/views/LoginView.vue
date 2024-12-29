<template>
  <div class="login-body">
    <div class="login-panel">
      <div class="login-title">{{ isLogin ? '用户登录' : '用户注册' }}</div>
      
      <el-form :model="formData" :rules="rules" ref="formDataRef">
        <!-- 登录方式 1：手机号 + 验证码 输入框 -->
        <el-form-item v-if="isLogin && useCode" label="手机号" prop="phone">
          <el-input
            placeholder="请输入手机号"
            v-model="formData.phone"
            size="large"
            type="text"
          />
        </el-form-item>

        <el-form-item v-if="isLogin && useCode" label="验证码" prop="code">
          <el-input
            placeholder="请输入验证码"
            v-model="formData.code"
            size="large"
            type="text"
          />
          <el-button
            :disabled="countdown > 0"
            @click="sendCode"
            size="small"
            style="margin-top: 10px;"
          >
            {{ countdown > 0 ? countdown + 's' : '获取验证码' }}
          </el-button>
        </el-form-item>

        <!-- 登录方式 2：用户名 + 密码 输入框 -->
        <el-form-item v-if="isLogin && !useCode" label="用户名" prop="username">
          <el-input
            placeholder="请输入用户名或手机号"
            v-model="formData.username"
            size="large"
            type="text"
          />
        </el-form-item>

        <el-form-item v-if="isLogin && !useCode" label="密码" prop="password">
          <el-input
            placeholder="请输入密码"
            v-model="formData.password"
            size="large"
            type="password"
          />
        </el-form-item>

        <!-- 注册页面字段：用户名、手机号、密码和验证码 -->
        <el-form-item v-if="!isLogin" label="用户名" prop="username">
          <el-input
            placeholder="请输入用户名"
            v-model="formData.username"
            size="large"
            type="text"
          />
        </el-form-item>

        <el-form-item v-if="!isLogin" label="手机号" prop="phone">
          <el-input
            placeholder="请输入手机号"
            v-model="formData.phone"
            size="large"
            type="text"
          />
        </el-form-item>

        <el-form-item v-if="!isLogin" label="验证码" prop="code">
          <el-input
            placeholder="请输入验证码"
            v-model="formData.code"
            size="large"
            type="text"
          />
          <el-button
            :disabled="countdown > 0"
            @click="sendCode"
            size="small"
            style="margin-top: 10px;"
          >
            {{ countdown > 0 ? countdown + 's' : '获取验证码' }}
          </el-button>
        </el-form-item>

        <el-form-item v-if="!isLogin" label="密码" prop="password">
          <el-input
            placeholder="请输入密码"
            v-model="formData.password"
            size="large"
            type="password"
          />
        </el-form-item>

        <el-form-item label="">
          <el-button
            type="primary"
            style="width: 100%;"
            @click="handleSubmit"
            size="large"
          >
            {{ isLogin ? '登录' : '注册' }}
          </el-button>
        </el-form-item>
      </el-form>

      <div class="switch-mode" @click="toggleMode">
        {{ isLogin ? '没有账号？点击注册' : '已有账号？点击登录' }}
      </div>

      <div class="switch-method" v-if="isLogin" @click="toggleAuthMethod">
        {{ useCode ? '使用密码登录' : '使用验证码登录' }}
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { ElMessage } from 'element-plus';
import { useRouter } from 'vue-router';
import api from '../api/api';
import decodeJWT from '../utils/jwt';
// 切换登录/注册模式
const isLogin = ref(true);
const useCode = ref(false); // 是否使用验证码登录
// 表单数据和验证规则
const formData = reactive({
  phone: '',
  username: '',
  password: '',
  code: '',
  token: '',
});

const rules = {
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
  ],
  username: [{ required: !isLogin.value, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: !useCode.value && !isLogin.value, message: '请输入密码', trigger: 'blur' }],
  code: [{ required: true, message: '请输入验证码', trigger: 'blur' }],
};

const countdown = ref(0); // 验证码倒计时
const timer = ref(null);
const router = useRouter();

// 切换登录/注册模式
const toggleMode = () => {
  isLogin.value = !isLogin.value;
  formData.password = ''; // 清空密码字段
  formData.code = ''; // 清空验证码字段
  formData.username = ''; // 清空用户名字段
  useCode.value = false; // 默认使用密码登录
};

// 切换登录方式（密码登录或验证码登录）
const toggleAuthMethod = () => {
  useCode.value = !useCode.value;
  formData.password = ''; // 切换时清空密码字段
  formData.code = ''; // 清空验证码字段
};

// 发送验证码
const sendCode = async () => {
  if (!/^1[3456789]\d{9}$/.test(formData.phone)) {
    ElMessage.error('请输入有效的手机号');
    return;
  }

  try {
    const res = await api.sendCode(formData.phone);
    if (res.success) {
      ElMessage.success('验证码已发送');
      startCountdown();
    } else {
      ElMessage.error('发送验证码失败');
    }
  } catch (error) {
    console.error(error);
    ElMessage.error('发送验证码失败');
  }
};

// 开始验证码倒计时
const startCountdown = () => {
  countdown.value = 60;
  timer.value = setInterval(() => {
    if (countdown.value > 0) {
      countdown.value--;
    } else {
      clearInterval(timer.value);
    }
  }, 1000);
};

// 登录/注册提交
const handleSubmit = () => {
  if (isLogin.value) {
    login();
  } else {
    register();
  }
};

// 登录功能
const login = () => {
  const loginData = {};
  if (useCode.value) {
    loginData.code = formData.code; // 验证码登录时不传用户名
    loginData.mobile = formData.phone; // 验证码登录时不传密码
    api.login2(loginData.mobile,loginData.code)
      .then(res => {
        if (res.access) {
          window.localStorage.setItem('isLogin', JSON.stringify({
          token: res.access, // JWT token
        startTime: new Date().getTime() // 登录时间戳
          }));
          const user_id =decodeJWT(res.access)
          let user_name = ''
          window.localStorage.setItem('user_id', user_id);
          api.getUsername(user_id)
           .then(user =>{
              user_name = user.username
              window.localStorage.setItem('username', user_name);
              console.log(user_name);
           });
          ElMessage.success('登录成功');
          router.push({ name: '鱼群管理' }); // 这里是跳转到设置的 /home 路由
        } else {
          ElMessage.error('验证码错误');
        }
      })
      .catch(error => {
        console.error(error);
        ElMessage.error('登录失败');
      });
  } else {
    loginData.username = formData.phone; // 密码登录
    loginData.username = formData.username;
    loginData.password = formData.password;
    console.log(loginData.username,loginData.password);
    api.login1(loginData.username,loginData.password)
      .then(res => {
        if (res.access) {
          const user_id =decodeJWT(res.access)
          console.log(user_id);
          let user_name = ''
          window.localStorage.setItem('user_id', user_id);
          api.getUsername(user_id)
           .then(user =>{
              user_name = user.username
              window.localStorage.setItem('username', user_name);
              console.log(user_name);
           });
          ElMessage.success('登录成功');
          router.push({ name: '鱼群管理' }); // 这里是跳转到设置的 /home 路由
          window.localStorage.setItem('isLogin', JSON.stringify({
          token: res.access, // JWT token
        startTime: new Date().getTime() // 登录时间戳
          }));
        } else {
          ElMessage.error('账号或密码错误');
        }
      })
      .catch(error => {
        console.error(error);
        ElMessage.error('登录失败');
      });
  }
};

// 注册功能
const register = async () => {
  const registerData = {
    mobile: formData.phone,
    username: formData.username,
    code: formData.code,
    password: formData.password
  };

  try {
    const res = await api.register(registerData);
    if (res.status === 201) { // 201 Created 表示注册成功
      ElMessage.success('注册成功');
      formData.phone = '';
      formData.username = '';
      formData.password = '';
      formData.code = '';
      isLogin.value = true;  // 注册成功后切换到登录模式
    } else if (res.status === 400) { // 400 Bad Request 表示请求有问题，可能是参数错误
      ElMessage.error('注册失败，参数错误');
    } else if (res.status === 409) { // 409 Conflict 表示用户名或手机号冲突
      ElMessage.error('用户名或手机号已被注册');
    } else {
      ElMessage.error('注册失败');
    }
  } catch (error) {
    console.error(error);
    ElMessage.error('注册失败');
  }
};
</script>

<style lang="scss" scoped>
.login-body {
  background: url("../assets/background.png") no-repeat center center;
  background-size: cover;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  .login-panel {
    background: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;

    .login-title {
      font-size: 22px;
      text-align: center;
      margin-bottom: 20px;
    }

    .switch-mode {
      text-align: center;
      margin-top: 10px;
      color: #409eff;
      cursor: pointer;
    }

    .switch-method {
      text-align: center;
      margin-top: 10px;
      color: #409eff;
      cursor: pointer;
    }
  }
}
</style>
