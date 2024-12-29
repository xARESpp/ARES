<template>
  <div class="personal">
    <div class="personal-center">
      <div class="sidebar">
        <ul>
          <li :class="{ active: activeTab === 'profile' }" @click="changeTab('profile')">
            <span class="icon">&#128100;</span> 个人信息
          </li>
          <li :class="{ active: activeTab === 'edit' }" @click="changeTab('edit')">
            <span class="icon">&#9998;</span> 修改资料
          </li>
        </ul>
      </div>
      <div class="content">
        <router-view></router-view> <!-- 动态切换视图 -->
      </div>
    </div>
  </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        activeTab: 'profile', // 当前选中的tab
      };
    },
    methods: {
      changeTab(tab) {
        this.activeTab = tab;
        this.$router.push({ name: tab }); // 使用 Vue Router 切换路由
      },
    },
  };
  </script>
  
  <style scoped>
  .personal-center {
    display: flex;
    min-height: 100vh;
    background: linear-gradient(145deg, #f0f1f6, #e3e9f3);
    box-sizing: border-box;
  }
  
  .sidebar {
    width: 220px;
    background-color: #2c3e50;
    color: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
  }
  
  .sidebar ul {
    list-style: none;
    padding: 0;
  }
  
  .sidebar li {
    display: flex;
    align-items: center;
    padding: 15px 0;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  .sidebar li:hover {
    background-color: #34495e;
  }
  
  .sidebar li.active {
    background-color: #1abc9c;
    font-weight: bold;
  }
  
  .sidebar .icon {
    font-size: 20px;
    margin-right: 10px;
  }
  
  .content {
    flex: 1;
    padding: 40px;
    background: white;
    border-radius: 12px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    margin-left: 20px;
    transition: all 0.3s ease;
  }
  
  .content h1 {
    color: #2c3e50;
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 20px;
  }
  </style>
  