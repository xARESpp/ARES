<template>
  <div class="edit-profile">
    <h2>修改个人资料</h2>
    <form @submit.prevent="updateProfile">
      <!-- 修改用户名 -->
      <div class="form-item">
        <label for="username">用户名</label>
        <input type="text" id="username" v-model="username" />
      </div>
      <!-- 修改邮箱 -->
      <div class="form-item">
        <label for="email">邮箱</label>
        <input type="email" id="email" v-model="email" />
      </div>
      <!-- 修改手机号 -->
      <div class="form-item">
        <label for="phone">手机号码</label>
        <div class="phone-wrapper">
          <input type="tel" id="phone" v-model="phone" />
          <button type="button" @click="sendVerificationCode" :disabled="isCodeSent">
            {{ isCodeSent ? `${countdown}秒后重发` : '发送验证码' }}
          </button>
        </div>
        <div v-if="showCodeInput" class="code-input-wrapper">
          <input
            v-model="verificationCode"
            type="text"
            placeholder="请输入验证码"
            class="code-input"
          />
          <p v-if="verificationError" class="error-msg">验证码错误，请重新输入。</p>
        </div>
      </div>
      <!-- 修改密码 -->
      <div class="form-item">
        <label for="new-password">新密码</label>
        <input type="password" id="new-password" v-model="newPassword" />
      </div>
      <div class="form-item">
        <label for="confirm-password">确认密码</label>
        <input type="password" id="confirm-password" v-model="confirmPassword" />
        <p v-if="passwordMismatch" class="error-msg">密码不一致，请重新输入。</p>
      </div>
      <!-- 修改个人简介 -->
      <div class="form-item">
        <label for="bio">个人简介</label>
        <textarea id="bio" v-model="bio" rows="4"></textarea>
      </div>
      <button type="submit">保存修改</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
import api from '../../api/api';

export default {
  data() {
    return {
      username: '',
      email: '',
      phone: '',
      bio: '',
      newPassword: '',
      confirmPassword: '',
      isCodeSent: false,
      showCodeInput: false,
      verificationCode: '',
      verificationError: false,
      passwordMismatch: false,
      countdown: 60,  // 设置倒计时初始值为60秒
      timer: null,
      user: null,
      defaultUserData: {},  // 用于存储默认的用户数据
    };
  },
  mounted() {
    this.fetchUserProfile();
  },
  methods: {
    // 获取用户数据
    async fetchUserProfile() {
      try {
        const user_id = window.localStorage.getItem('user_id');
        console.log('user_id:', user_id);
        if (!user_id) {
          this.$message.error('请先登录！');
          this.$router.push('/login');
          return;
        }

        const res = await api.UserProfile(user_id);
        if (res) {
          this.user = res[0];
          this.defaultUserData = {  // 存储初始用户数据
            username: this.user.username,
            email: this.user.email,
            phone: this.user.phone,
            bio: this.user.desc,
          };
          this.username = this.user.username;
          this.email = this.user.email;
          this.phone = this.user.phone;
          this.bio = this.user.desc;
        } else {
          this.$message.error('获取用户信息失败！');
        }
      } catch (error) {
        this.$message.error(error.message);
        console.error(error);
      }
    },

    // 提交修改后的数据
    async updateProfile() {
      // 先检查密码是否一致（如果密码被修改了）
      if (this.newPassword && this.newPassword !== this.confirmPassword) {
        this.passwordMismatch = true;
        return;
      }

      // 如果密码一致，进行更新
      this.passwordMismatch = false;

      // 构造提交的数据
      const updatedData = {};

      // 对比并更新已更改的字段
      if (this.username !== this.defaultUserData.username) {
        updatedData.username = this.username;
      }
      if (this.email !== this.defaultUserData.email) {
        updatedData.email = this.email;
      }
      if (this.phone !== this.defaultUserData.phone) {
        updatedData.phone = this.phone;
      }
      if (this.bio !== this.defaultUserData.bio) {
        updatedData.bio = this.bio;
      }
      if (this.newPassword) {
        updatedData.newPassword = this.newPassword;
      }
      if (this.verificationCode) {
        updatedData.verificationCode = this.verificationCode;
      }

      // 如果没有任何字段更新，则返回
      if (Object.keys(updatedData).length === 0) {
        this.$message.info('没有修改任何内容');
        return;
      }

      // 检查验证码是否存在
      if (this.showCodeInput && !this.verificationCode) {
        this.$message.error('请输入验证码');
        return;
      }

      try {
        const response = await api.UpdateUserProfile(this.user.id, updatedData);  // 假设此接口处理资料更新
        console.log('资料已更新：', response.data);
        this.$message.success('资料已成功更新');
        
        // 提交成功后，重新获取用户资料并更新页面
        window.location.reload()  // 重新刷新页面，获取最新数据
      } catch (error) {
        console.error('资料更新失败:', error);
        this.$message.error('资料更新失败，请稍后再试');
      }
    },

    // 发送验证码
    async sendVerificationCode() {
      if (!/^1[3456789]\d{9}$/.test(this.phone)) {
        this.$message.error('请输入有效的手机号');
        return;
      }

      try {
        const res = await api.sendCode(this.phone);
        if (res.success) {
          this.isCodeSent = true;
          this.showCodeInput = true;
          this.$message.success('验证码已发送');
          this.startCountdown();
        } else {
          this.$message.error('发送验证码失败');
        }
      } catch (error) {
        console.error(error);
        this.$message.error('发送验证码失败');
      }
    },

    // 倒计时功能
    startCountdown() {
      this.timer = setInterval(() => {
        if (this.countdown > 0) {
          this.countdown--;
        } else {
          clearInterval(this.timer);
          this.countdown = 60;
          this.isCodeSent = false;
        }
      }, 1000);
    },

    // 验证验证码
    verifyCode() {
      if (this.verificationCode === '1234') {
        this.verificationError = false;
        this.$message.success('验证码正确！');
      } else {
        this.verificationError = true;
      }
    },
  },
};
</script>


<style scoped>
.edit-profile {
  padding: 30px;
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
  font-size: 28px;
  color: #2c3e50;
  margin-bottom: 20px;
}

form {
  display: flex;
  flex-direction: column;
}

.form-item {
  margin-bottom: 20px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 8px;
  color: #34495e;
}

input,
textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 16px;
  background-color: #f9f9f9;
}

input:focus,
textarea:focus {
  border-color: #1abc9c;
  outline: none;
}

button {
  padding: 12px 20px;
  background-color: #1abc9c;
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #16a085;
}

.phone-wrapper {
  display: flex;
  align-items: center;
  gap: 10px;
}

.phone-wrapper button {
  padding: 8px 15px;
  background-color: #3498db;
  color: white;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s ease;
}

.phone-wrapper button:disabled {
  background-color: #95a5a6;
}

.phone-wrapper button:hover {
  background-color: #2980b9;
}

.code-input-wrapper {
  margin-top: 10px;
}

.code-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 16px;
  margin-bottom: 5px;
}

.error-msg {
  color: red;
  font-size: 14px;
}
</style>

