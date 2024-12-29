<template>
  <div class="sidebar">
    <ul>
      <li><router-link to="/admin/dashboard">仪表盘</router-link></li>
      <!-- 可以在这里添加更多的导航链接 -->
    </ul>
  </div>
</template>

<script setup>
// 这里可以添加侧边栏的逻辑
</script>

<style scoped>
.sidebar {
  background-color: #304156;
  color: #fff;
  width: 210px;
  height: 100%;
  padding: 20px;
}

.sidebar ul {
  list-style: none;
  padding: 0;
}

.sidebar li {
  margin: 10px 0;
}

.sidebar a {
  color: #fff;
  text-decoration: none;
}
</style> 