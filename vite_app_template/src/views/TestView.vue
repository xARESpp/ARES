<template>
  <div class="personal">
    <div class="personal-center">
      <!-- 侧边栏 -->
      <div class="sidebar">
        <ul>
          <li :class="{ active: activeTab === 'profile' }" @click="changeTab('profile')">
            <span class="icon">&#128100;</span> 个人信息
          </li>
          <li :class="{ active: activeTab === 'edit' }" @click="changeTab('edit')">
            <span class="icon">&#9998;</span> 修改资料
          </li>
          <!-- 可扩展的其他项（暂不启用） 
          <li class="disabled">
            <span class="icon">&#128274;</span> 账户安全
          </li>
          <li class="disabled">
            <span class="icon">&#128276;</span> 消息通知
          </li>
          <li class="disabled">
            <span class="icon">&#127942;</span> 成就
          </li>
          -->
        </ul>
      </div>

      <!-- 内容区域 -->
      <div class="content">
        <!-- 头部用户信息展示 (可选) -->
        <div class="user-header">
          <div class="user-avatar">
            <!-- 使用Unicode字符做头像的示意，如表情或者字母，也可使用base64图标 -->
            <div class="avatar-icon">&#128512;</div>
          </div>
          <div class="user-info">
            <h1 class="user-name">张三</h1>
            <p class="user-desc">一个热爱分享与记录生活的普通用户</p>
            <div class="user-stats">
              <div class="stat-item">
                <span class="stat-number">120</span>
                <span class="stat-label">关注</span>
              </div>
              <div class="stat-item">
                <span class="stat-number">230</span>
                <span class="stat-label">粉丝</span>
              </div>
              <div class="stat-item">
                <span class="stat-number">45</span>
                <span class="stat-label">发布</span>
              </div>
            </div>
          </div>
        </div>

        <!-- 动态切换视图 -->
        <router-view></router-view> 
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeTab: 'profile',
    };
  },
  methods: {
    changeTab(tab) {
      this.activeTab = tab;
      this.$router.push({ name: tab });
    },
  },
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

.personal {
  min-height: 100vh;
  background: linear-gradient(145deg, #f0f1f6, #e3e9f3);
  font-family: 'Roboto', sans-serif;
  padding: 20px;
  box-sizing: border-box;
}

.personal-center {
  display: flex;
  min-height: 80vh;
  /* 可以为整块容器添加一点透明白色叠加，让背景更柔和 */
  background: rgba(255,255,255,0.4);
  border-radius: 20px;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  overflow: hidden;
  position: relative;
}

/* 侧边栏样式 */
.sidebar {
  width: 220px;
  background: linear-gradient(135deg, #2c3e50, #34495e);
  color: white;
  padding: 20px;
  box-sizing: border-box;
  position: sticky;
  top: 20px;
  border-radius: 20px;
  margin: 20px;
  box-shadow: 0 0 15px rgba(0,0,0,0.2);
}

.sidebar ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sidebar li {
  display: flex;
  align-items: center;
  padding: 15px 0;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.3s ease;
  border-radius: 10px;
  margin: 10px 0;
  font-weight: 500;
}

.sidebar li:hover {
  background: rgba(255,255,255,0.1);
  transform: translateX(5px);
}

.sidebar li.active {
  background: #1abc9c;
  font-weight: 700;
  box-shadow: 0 0 10px #1abc9c;
  transform: scale(1.02);
}

.sidebar li.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.sidebar .icon {
  font-size: 20px;
  margin-right: 10px;
}

/* 内容区域样式 */
.content {
  flex: 1;
  padding: 40px;
  background: rgba(255,255,255,0.8);
  border-radius: 20px;
  box-shadow: 0 0 15px rgba(0,0,0,0.1);
  margin: 20px 20px 20px 0;
  position: relative;
  overflow: hidden;
  transition: all 0.3s ease;
}

/* 用户头部信息 */
.user-header {
  display: flex;
  align-items: center;
  margin-bottom: 30px;
  background: #fff;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.user-avatar {
  width: 100px;
  height: 100px;
  background: #ecf0f1;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 20px;
  box-shadow: inset 0 0 5px rgba(0,0,0,0.1);
}

.avatar-icon {
  font-size: 48px;
}

.user-info {
  flex: 1;
}

.user-name {
  font-size: 28px;
  color: #2c3e50;
  margin: 0;
}

.user-desc {
  font-size: 14px;
  color: #666;
  margin: 5px 0 15px;
}

.user-stats {
  display: flex;
  gap: 40px;
}

.stat-item {
  text-align: center;
}

.stat-number {
  font-size: 20px;
  font-weight: bold;
  color: #2c3e50;
}

.stat-label {
  font-size: 12px;
  color: #999;
}

/* 路由内容区统一样式 */
.content h1 {
  color: #2c3e50;
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 20px;
}

.content p {
  color: #333;
  line-height: 1.5;
}

/* 按钮等可进一步美化 */

/* 响应式 */
@media (max-width: 768px) {
  .personal-center {
    flex-direction: column;
  }

  .sidebar {
    width: 100%;
    margin: 20px 0;
    display: flex;
    overflow-x: auto;
  }

  .sidebar ul {
    display: flex;
    flex-wrap: nowrap;
  }

  .sidebar li {
    margin: 0 10px;
  }

  .content {
    margin: 0 20px 20px;
  }
}

</style>
