import './assets/main.css'

import { createApp } from 'vue'

import { createPinia } from 'pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate';
import 'element-plus/dist/index.css'  // 引入 Element Plus 的全局样式
import 'element-plus/dist/index.css'; // 引入 Element Plus 样式
import 'leaflet/dist/leaflet.css'  // 引入 Leaflet 样式

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'// 引入 Element Plus 样式


// 开发环境使用mockjs拦截axios请求，生产环境使用真实的数据接口将该行代码注释即可
import "@/mock/index.js"

import App from './App.vue'
import router from './router'


const app = createApp(App)

// 全局导入的方式，最后app打包时会比较大，太大会影响性能
// import * as ElementPlusIconsVue from '@element-plus/icons-vue'
// for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
//     app.component(key, component)
// }

app.use(ElementPlus)

const pinia = createPinia()

app.use(pinia)
pinia.use(piniaPluginPersistedstate)	//将状态持久化到浏览器

app.use(router)

app.mount('#app')


