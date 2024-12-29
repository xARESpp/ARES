<template>
  <div id="app">
    <!-- 顶部导航栏 -->
    <el-header class="navigation">
      <div class="nav-left">
        <img src="../assets/智慧管理.png" alt="Logo" class="logo" />
        <span class="site-title">智慧鱼群平台</span>
      </div>

      <!-- 中间菜单 -->
      <el-menu mode="horizontal" class="nav-menu" router>
        <el-menu-item index="/fish-groups">
          <transition name="nav-transition">
            <span>鱼群管理</span>
          </transition>
        </el-menu-item>
        <el-menu-item index="/pools">
          <transition name="nav-transition">
            <span>水池管理</span>
          </transition>
        </el-menu-item>
        <el-menu-item index="/profile">
          <transition name="nav-transition">
            <span>个人资料</span>
          </transition>
        </el-menu-item>
      </el-menu>

      <!-- 右侧功能 -->
      <div class="nav-right">
        <el-badge value="99+" class="nav-icon">
          <el-icon><bell /></el-icon>
        </el-badge>
        <el-dropdown>
          <span class="user-ui">
            <img
              src="https://img.tukuppt.com/png_preview/00/07/66/T36mC2pzxT.jpg!/fw/780"
              alt="User Avatar"
              class="user-avatar"
            />
            <span class="user-name">用户名</span>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item>{{ str }}</el-dropdown-item>
              <el-dropdown-item>个人中心</el-dropdown-item>
              <el-dropdown-item @click="logout" divided>退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </el-header>

    <!-- 路由视图 -->
    <router-view></router-view>
  </div>
</template>

<script>
import api from '../api/api'
export default {
  data() {
    return {
      str : window.localStorage.getItem('username')+',欢迎您！',
    };
  },
  mounted() {
    // 在 mounted 生命周期钩子中读取并设置 username
    this.Username();
    const username = window.localStorage.getItem('username');
    this.str = username+',欢迎您！';
    // if (username) {
    //   this.str = username + ', 欢迎您！';
    // } else {
    //   ;
    // }
  },
  methods: {
    Username(){
      const user_id = window.localStorage.getItem('user_id');
      api.getUsername(user_id)
           .then(user =>{
              user_name = user.username
              window.localStorage.setItem('username', user_name);
              console.log(user_name);
           });
    },
    logout() {
      // 清除本地存储的用户数据
      window.localStorage.removeItem('username');
      window.localStorage.removeItem('isLogin');
      // 跳转到登录页或者首页
      this.$router.push('/login'); // 或者 '/home' 根据你的路由配置
    }
  },
}
</script>

<style>
/* 整体导航条 */
.navigation {
  background: linear-gradient(90deg, #f7f7f7, #eaeaea);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  height: 70px;
  border-bottom: 1px solid #dcdcdc;
}

/* 左侧 Logo */
.nav-left {
  display: flex;
  align-items: center;
  gap: 12px;
}

.logo {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.site-title {
  font-size: 22px;
  font-weight: 600;
  color: #333;
  letter-spacing: 0.5px;
}

/* 中间菜单 */
.nav-menu {
  flex: 2;
  display: flex;
  justify-content: center;
  gap: 60px;
}

.el-menu-item {
  font-size: 18px;
  font-weight: 500;
  color: #333 !important;
  transition: all 0.4s ease-in-out;
  padding: 10px 20px;
  border-radius: 10px;
}

/* 点击动画 */
.el-menu-item.is-active {
  background: linear-gradient(90deg, #3498db, #9b59b6);
  color: #fff !important;
  box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
  transform: scale(1.05);
}

/* 悬停动画 */
.el-menu-item:hover {
  background: linear-gradient(90deg, #9b59b6, #3498db);
  color: #fff !important;
  border-radius: 10px;
  transform: scale(1.08);
  box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
}

/* 动画效果 */
.nav-transition-enter-active,
.nav-transition-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.nav-transition-enter-from,
.nav-transition-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* 右侧功能 */
.nav-right {
  display: flex;
  align-items: center;
  gap: 20px;
}

.nav-icon {
  font-size: 20px;
  cursor: pointer;
  color: #666;
  transition: color 0.3s ease, transform 0.3s ease;
}

.nav-icon:hover {
  color: #3498db;
  transform: scale(1.2);
}

.user-ui {
  display: flex;
  align-items: center;
  gap: 10px;
  cursor: pointer;
  color: #333;
  transition: transform 0.3s ease;
}

.user-avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  border: 2px solid #dcdcdc;
}

.user-name {
  font-size: 16px;
  font-weight: 500;
}

.user-ui:hover {
  transform: scale(1.1);
}

/* 响应式支持 */
@media (max-width: 768px) {
  .nav-menu {
    display: none;
  }
}
</style>
