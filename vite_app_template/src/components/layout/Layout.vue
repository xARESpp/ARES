<template>
  <div class="app-wrapper">
    <div class="sidebar-container">
      <Sidebar />
    </div>
    
    <div class="main-container">
      <Navbar />
      <div class="app-main">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script setup>
import Navbar from './Navbar.vue'
import Sidebar from './Sidebar.vue'
</script>

<style scoped>
.app-wrapper {
  height: 100vh;
  display: flex;
}

.sidebar-container {
  width: 210px;
  background: #304156;
  height: 100%;
}

.main-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.app-main {
  padding: 20px;
  overflow-y: auto;
  background: #f0f2f5;
  height: calc(100vh - 60px);
}
</style> 