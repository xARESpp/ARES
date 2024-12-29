<template>
  <el-container class="layout-container-demo" style="min-height: 100vh;">
    <el-aside style="width: 15%;">
      <el-menu :default-openeds="['1', '2']"
        style="min-height: 100%; overflow: hidden; box-shadow:2px 0 6px rgb(0 21 41 / 35%);"
        background-color="rgb(48,65,86)" :collapse-transition="false" text-color="white" active-text-color="#ffd04b"
        :router="true" :default-active="route.path">
        <!-- <div>
                  <b style="color: white;"> 后台管理系统</b>
              </div> -->
        <el-menu-item index="/home">
          <el-icon>
            <i-ep-House />
          </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>首页</span>
        </el-menu-item>

        <el-menu-item index="/table">
          <el-icon>
            <i-ep-MessageBox />
          </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>CRUD表格</span>
        </el-menu-item>

        <el-menu-item index="/chart">
          <el-icon>
            <i-ep-Histogram />
          </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>图表</span>
        </el-menu-item>

        <!-- 
        <el-sub-menu index="1">
          <template #title>
            <el-icon>
              <i-ep-Histogram />
            </el-icon>&nbsp;&nbsp;&nbsp;&nbsp;
            <span>图表</span>
          </template>
          <el-menu-item index="/chart01">个人分析页</el-menu-item>
          <el-menu-item index="/chart02">汇总展示页</el-menu-item>
        </el-sub-menu> -->

      </el-menu>
    </el-aside>

    <el-container>

      <el-header style="font-size: 12px;border-bottom: 1px solid #ccc; text-align: right;display: flex;">

        <el-breadcrumb :separator-icon="ArrowRight" style="flex: 1; padding-top:30px; ">
          <!-- <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item :to="{ path: '/workbench' }">工作台</el-breadcrumb-item>
                    <el-breadcrumb-item :to="{ path: '/table' }">学生信息</el-breadcrumb-item>
                    <el-breadcrumb-item :to="{ path: '/chart01' }">图表展示</el-breadcrumb-item>
                    <el-breadcrumb-item :to="{ path: '/introduce' }">专业</el-breadcrumb-item>
                    <el-breadcrumb-item :to="{ path: '/map' }">定位</el-breadcrumb-item> -->
        </el-breadcrumb>
        <!-- <div  style="cursor: pointer; flex: 1;" @click="collapse">
                  <el-icon :size="33" style="padding-top: 20px;">
                      <Expand />
                  </el-icon>
              </div> -->

        <el-icon @click="SetFullScreen()" size="25" style="margin-top: 18px;cursor: pointer;">
          <FullScreen />
        </el-icon>

        <div class="toolbar" style="width: 80px;">
          <el-dropdown>
            <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" :size="40"
              style="margin-top: 5px; "></el-avatar>
            <template #dropdown>
              <el-dropdown-menu>
                <div style="text-align: center; padding: 10px 10px;"><b><i>{{ local_username }}</i></b>
                </div>
                <!-- <el-dropdown-item @click="personal_center = true">个人中心</el-dropdown-item> -->
                <el-dropdown-item @click="outLogin()">退出登录</el-dropdown-item>
                <!-- <el-dropdown-item @click="drawer_setting = true"><i>设置</i></el-dropdown-item> -->
              </el-dropdown-menu>
            </template>
          </el-dropdown>

          <el-drawer v-model="personal_center" title="个人中心" :direction="direction" :append-to-body="true">
            <span>个人信息</span>
          </el-drawer>

          <el-drawer v-model="drawer_setting" title="项目设置" :direction="direction" :append-to-body="true">
            <p>设置点什么好呢......</p>

          </el-drawer>

        </div>
      </el-header>

      <el-main>
        <RouterView></RouterView>
      </el-main>

    </el-container>

  </el-container>
</template>

<script setup>
import { h, ref } from 'vue';
import { useRouter, RouterView, useRoute } from 'vue-router';
import { ArrowRight } from '@element-plus/icons-vue';
import { ElNotification, ElMessageBox, ElMessage } from 'element-plus';
import screenfull from 'screenfull'


const SetFullScreen = () => {
  //screenfull.isEnabled  此方法返回布尔值，判断当前能不能进入全屏
  if (!screenfull.isEnabled) {
    return false;
  }
  //screenfull.toggle 此方法是执行全屏化操作。如果已是全屏状态，则退出全屏
  screenfull.toggle()
}


const router = useRouter();
const route = useRoute();
let drawer_setting = ref(false);
let personal_center = ref(false);


let local_username = localStorage.getItem("username");
// 当前路由的匹配记录
// console.log(router.currentRoute.value.matched)

const outLogin = () => {
  ElMessageBox.confirm(
    '确定退出当前登录状态吗？',
    'Warning',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    }).then(() => {
      router.push("/login");
      ElNotification.success({
        title: 'Success',
        message: h('i', { style: 'color: teal' }, '成功退出当前用户登录状态'),
        offset: 100,
      })
      window.localStorage.removeItem('isLogin');
      window.localStorage.removeItem('username');
    }).catch(() => {
      ElMessage({
        type: 'info',
        message: '已取消退出操作',
      })
    })
}

</script>

<style scoped>
.layout-container-demo .el-header {
  position: relative;
  /* background-color: #B3C0D1; */
  color: var(--el-text-color-primary);
}

.layout-container-demo .el-aside {
  color: var(--el-text-color-primary);
  background: var(--el-color-primary-light-8);
}

.layout-container-demo .el-menu {
  border-right: none;
}

.layout-container-demo .el-main {
  padding: 0;
}

.layout-container-demo .toolbar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  right: 20px;
}
</style>
