<template>
  <div class="profile-card">
    <div class="card">
      <div v-if="user" class="profile-item">
        <span class="label">用户名:</span>
        <span class="value">{{ user.username }}</span>
      </div>
      <div v-if="user" class="profile-item">
        <span class="label">邮箱:</span>
        <span class="value">{{ user.email }}</span>
      </div>
      <div v-if="user" class="profile-item">
        <span class="label">手机:</span>
        <span class="value">{{ user.phone }}</span>
      </div>
      <div v-if="user" class="profile-item">
        <span class="label">注册时间:</span>
        <span class="value">{{ user.created_at}}</span>
      </div>
      <div v-if="user" class="profile-item">
        <span class="label">个人简介:</span>
        <span class="value">{{ user.desc}}</span>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { ElMessage } from 'element-plus';
import api from '../../api/api'
import { useRouter } from 'vue-router';
const router = useRouter();
export default {
  data() {
    return {
      user: null, // 用于存储后端传来的用户数据
    };
  },
  created() {
    this.fetchUserProfile(); // 在组件创建时调用 API 获取数据
  },
  methods: {
    async fetchUserProfile() {
          try{
             const user_id =  window.localStorage.getItem('user_id')
             if(!user_id){
              ElMessage.error('请先登录！')
              router.push('/login')
              return
             }
             const res = await api.UserProfile(user_id);
             if(res){
               this.user = res[0]
               console.log(res)
             }
             else{
               ElMessage.error('获取用户信息失败！')
             }
          }catch(error){
            ElMessage.error(error.message);
            console.error(error);
          }
    },
  },
  filters: {
    formatDate(value) {
      if (!value) return '';
      const date = new Date(value);
      return date.toLocaleDateString(); // 格式化日期
    }
  }
};
</script>

<style scoped>
/* 设置整个页面全屏，去除默认 margin/padding */
html, body {
  margin: 0;
  padding: 0;
  height: 100%;
  font-family: 'Arial', sans-serif;
  overflow: hidden; /* 禁止滚动条出现 */
}

/* 背景发散式渐变 */
.profile-card {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* 占满全屏 */
  background: radial-gradient(circle, #ff7e5f, #feb47b, #ff6a00, #ff0080, #800080, #00b4d9); /* 从中心发散的渐变色 */
  background-size: 300% 300%;
  animation: gradientBG 15s ease infinite; /* 动态背景渐变 */
  border-radius: 18px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

/* 渐变背景动画 */
@keyframes gradientBG {
  0% { background-position: center; }
  50% { background-position: top left; }
  100% { background-position: center; }
}

.card {
  background: #ffffff;
  padding: 40px 60px; /* 加大卡片内边距 */
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
  width: 90%;
  max-width: 800px;
  transition: background-color 0.3s ease;
}

.card:hover {
  background-color: #ecf0f1;
}

.profile-item {
  display: flex;
  justify-content: space-between;
  margin: 25px 0; /* 增加间隔 */
  padding: 15px;
  background: #fafafa;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
  transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.profile-item:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-3px);
}

.label {
  font-size: 18px;
  font-weight: 600;
  color: #34495e;
  opacity: 0.85;
}

.value {
  font-size: 18px;
  color: #2c3e50;
  font-weight: 400;
  text-align: right;
  opacity: 0.85;
}

.profile-item:hover .label,
.profile-item:hover .value {
  opacity: 1;
}
</style>
