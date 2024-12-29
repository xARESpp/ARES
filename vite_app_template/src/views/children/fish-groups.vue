<template>
  <div class="fish-groups-page">
    <!-- 搜索栏 -->
    <div class="search-bar" ref="searchBar">
      <el-row justify="center" :gutter="20">
        <!-- 种类筛选框 -->
        <el-col :span="4">
          <el-select
            v-model="selectedCategory"
            placeholder="全部"
            class="category-select"
            @change="searchFishGroups"
          >
            <el-option
              v-for="(category, index) in categories"
              :key="index"
              :label="category"
              :value="category"
            />
          </el-select>
        </el-col>

        <!-- 关键字搜索 -->
        <el-col :span="8">
          <el-input
            v-model="searchKeyword"
            placeholder="搜索鱼群"
            prefix-icon="el-icon-search"
            clearable
            class="search-input"
            @input="searchFishGroups"
          />
        </el-col>

        <!-- 图像搜索 -->
        <el-col :span="8">
          <el-tooltip class="upload-tooltip" content="图片搜索" placement="top">
            <el-upload
              class="upload-box"
              action="#"
              :before-upload="beforeUpload"
              :show-file-list="false"
              @change="handleImageSearch"
            >
              <!-- 使用SVG图标 -->
              <svg class="upload-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" width="48" height="48">
                <path d="M21 19V6c0-.55-.45-1-1-1H4c-.55 0-1 .45-1 1v13c0 .55.45 1 
                        1 1h16c.55 0 1-.45 1-1zm-1-12v11H5V7h15zm-6 
                        8h-3v3h3v-3zm-5 0H8v3h3v-3z"/>
              </svg>
            </el-upload>
          </el-tooltip>
        </el-col>
      </el-row>
    </div>

    <!-- 鱼群展示列表 -->
    <el-row :gutter="20" class="fish-groups-list">
      <el-col v-for="(fishGroup, index) in paginatedFishGroups" :key="index" :span="6">
        <el-card class="fish-card" :body-style="{ padding: '20px' }" @click="viewFishGroup(fishGroup)">
          <img :src="fishGroup.image" class="fish-image" />
          <div class="fish-info">
            <h3 class="fish-name">{{ fishGroup.name }}</h3>
            <div v-html="decodeHtml(fishGroup.desc)"></div>
            <el-button class="view-btn" size="mini">查看详情</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 悬浮搜索框 -->
    <div v-if="showFloatingSearch" class="floating-search" @click="toggleFloatingSearch">
      <el-button class="floating-btn" icon="el-icon-search" size="large"></el-button>
    </div>

    <el-dialog
      v-model="showDialog"
      title="搜索鱼群"
      width="400px"
      :visible.sync="showDialog"
      @close="showFloatingSearch = true"
    >
      <div class="floating-search-dialog">
        <el-input
          v-model="searchKeyword"
          placeholder="请输入关键字"
          prefix-icon="el-icon-search"
          clearable
          class="floating-search-input"
          @input="searchFishGroups"
        />
        <el-upload
          class="upload-box"
          action="#"
          :before-upload="beforeUpload"
          :show-file-list="false"
          @change="handleImageSearch"
        >
          <el-button icon="el-icon-picture" class="upload-button">
            选择图片搜索
          </el-button>
        </el-upload>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import api from '../../api/api';
import { ElMessage } from 'element-plus';
export default {
  data() {
    return {
      searchKeyword: '',
      selectedCategory: '',
      DetailInfor:[],
      categories: ['全部'],
      fishGroups: [],
      filteredFishGroups: [],
      paginatedFishGroups: [],
      showFloatingSearch: false,
      showDialog: false,
      observer: null,
    };
  },
  methods: {
    decodeHtml(html) {
      const txt = document.createElement("textarea");
      txt.innerHTML = html;
      return txt.value;
    },
    async fetchCategories(){
      try {
        const res = await api.getCategories();
        if (res) {
          const data = res;
          this.DetailInfor = data;
          for(const item of data){
              this.categories.push(item.name);
          }
          }
    }catch(error){
      console.error(error);
      ElMessage.error('发生网络错误');
    }
  },
    async fetchFishGroups() {
      try {
        const res = await api.getDetail();
        if (res) {
          const data = res;
          for (const item of data) {
            const name1 = item.name;
            const desc1 = item.desc;
            const image1 = item.image;
            const id1 = item.id;
            const dict = { name: name1, desc: desc1, image: image1,id:id1};
            this.fishGroups.push(dict);
          }
          this.filteredFishGroups = this.fishGroups;
          this.paginateFishGroups();
        }
      } catch (error) {
        console.error(error);
        ElMessage.error('请求失败');
      }
    },
    searchFishGroups() {
      let filtered = [];
      if (this.selectedCategory !== '全部') {
        filtered = this.DetailInfor.filter(fish => fish.name === this.selectedCategory)
                                   .map(fish => fish.fish_category)
                                   .flat();
        filtered = this.fishGroups.filter(fish => filtered.includes(fish.name));
      } else {
        filtered = this.fishGroups;
      }

      if (this.searchKeyword) {
        filtered = filtered.filter((fish) =>
          fish.name.toLowerCase().includes(this.searchKeyword.toLowerCase())
        );
      }

      console.log(filtered);
      this.filteredFishGroups = filtered;
      this.paginateFishGroups();
    },
    paginateFishGroups() {
      this.paginatedFishGroups = this.filteredFishGroups.slice(0, 20);
    },
    loadMoreFishGroups() {
      if (this.paginatedFishGroups.length < this.filteredFishGroups.length) {
        const nextPage = this.filteredFishGroups.slice(
          this.paginatedFishGroups.length,
          this.paginatedFishGroups.length + 12
        );
        this.paginatedFishGroups = [...this.paginatedFishGroups, ...nextPage];
      }
    },
    beforeUpload(file) {
      const isImage = file.type.startsWith('image/');
      if (!isImage) {
        this.$message.error('请上传有效的图片');
      }
      return isImage;
    },
    handleImageSearch(file) {
      this.$message.success('正在进行图像搜索');
      let storedUserName = window.localStorage.getItem('username');
      console.log(file);
      api.imgRecognition(file.raw, storedUserName).
         then(res => {
           if(res){
            console.log(res.match);
             ElMessage.success('图像搜索成功:'+ res.match);
             this.searchKeyword = res.match;
             this.searchFishGroups();
           }else{
             ElMessage.error('图像搜索失败');
           }
           }).catch(error => {
             console.error(error);
             this.$message.error('图像搜索失败');
           });
    },
    viewFishGroup(fishGroup) {
      this.$message.info(`查看鱼群详情: ${fishGroup.name}`);
      this.$router.push({ name: 'FishGroupDetail', params: { id: fishGroup.id }});
    },
    toggleFloatingSearch() {
      this.showDialog = !this.showDialog;
      this.showFloatingSearch = !this.showFloatingSearch;
    },
    setupObserver() {
      this.observer = new IntersectionObserver((entries) => {
        const entry = entries[0];
        if (entry.isIntersecting) {
          this.loadMoreFishGroups();
        }
      });
      this.$nextTick(() => {
        const target = this.$el.querySelector('.fish-card:last-child');
        if (target) {
          this.observer.observe(target);
        }
      });
    },
    handleScroll() {
      const searchBar = this.$refs.searchBar;
      const rect = searchBar.getBoundingClientRect();
      if (rect.bottom < 0) {
        this.showFloatingSearch = true;
      } else {
        this.showFloatingSearch = false;
      }
    },
  },
  mounted() {
    this.selectedCategory = '全部';
    this.fetchFishGroups();
    this.fetchCategories();
    this.filteredFishGroups = this.fishGroups;
    this.paginateFishGroups();
    this.setupObserver();
    window.addEventListener('scroll', this.handleScroll);

    this.searchFishGroups();
  },

  destroyed() {
    if (this.observer) {
      this.observer.disconnect();
    }
    window.removeEventListener('scroll', this.handleScroll);
  },
};
</script>

<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap');

body, html {
  height: 100%;
  margin: 0;
  font-family: 'Share Tech Mono', monospace; /* 科幻风字体 */
}

.fish-groups-page {
  min-height: 100%;
  /* 使用高质量星空背景图并添加动画，让背景星空慢慢移动 */
  background: url('../../assets/三门峡.png') center center no-repeat;
  background-size: cover;
  animation: starMove 60s linear infinite;
  display: flex;
  flex-direction: column;
  color: #00ffff;
}

/* 缓慢移动背景 */
@keyframes starMove {
  0% {background-position: 0% 0%;}
  50% {background-position: 100% 50%;}
  100% {background-position: 0% 100%;}
}

.search-bar {
  margin-bottom: 30px;
  padding: 20px;
  background: rgba(0, 0, 0, 0.5);
  border: 1px solid #00ffff;
  border-radius: 10px;
  box-shadow: 0 0 10px #00ffff;
  transition: transform 0.3s ease;
}

.search-bar:hover {
  transform: scale(1.02);
}

.category-select {
  font-size: 14px;
  border-radius: 30px;
  background-color: rgba(0,0,0,0.6);
  color: #00ffff;
  box-shadow: 0 0 10px #00ffff;
  border: 1px solid #00ffff;
}

.search-input {
  border-radius: 30px;
  background-color: rgba(0,0,0,0.6);
  color: #00ffff;
  box-shadow: 0 0 10px #00ffff;
  border: 1px solid #00ffff;
}

.upload-box {
  display: inline-block;
}

.upload-icon {
  width: 20px;
  fill: #00ffff;
}

.upload-tooltip .el-tooltip__content {
  background: rgba(0,0,0,0.8);
  color: #00ffff;
  border: 1px solid #00ffff;
  border-radius: 5px;
}

.upload-box:hover .upload-icon {
  transform: scale(1.1);
}

.fish-groups-list {
  display: flex;
  flex-wrap: wrap;
  padding: 20px;
}

/* 卡片科幻风 */
.fish-card {
  background: rgba(0,0,0,0.6);
  border: 1px solid #00ffff;
  border-radius: 10px;
  box-shadow: 0 0 10px #00ffff;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  margin-bottom: 20px;
}

.fish-card:hover {
  transform: scale(1.05);
  box-shadow: 0 0 20px #00ffff;
}

.fish-image {
  width: 100%;
  height: 180px;
  object-fit: cover;
  border-bottom: 1px solid #00ffff;
}

.fish-info {
  padding: 10px;
  color: #00ffff;
}

.fish-name {
  font-size: 20px;
  font-weight: bold;
  text-align: center;
  margin: 10px 0;
  text-shadow: 0 0 5px #00ffff;
}

.view-btn {
  margin-top: 15px;
  background-color: rgba(0,255,255,0.2);
  color: #00ffff;
  border: 1px solid #00ffff;
  border-radius: 5px;
  width: 100%;
  text-align: center;
  transition: background-color 0.3s ease, color 0.3s ease, box-shadow 0.3s ease;
}

.view-btn:hover {
  background-color: #00ffff;
  color: #000;
  box-shadow: 0 0 10px #00ffff;
}

/* 悬浮搜索按钮 */
.floating-search {
  position: fixed;
  right: 20px;
  bottom: 20px;
  z-index: 999;
}

.floating-btn {
  background-color: #00ffff;
  color: #000;
  border-radius: 50%;
  border: none;
  padding: 15px;
  font-size: 24px;
  box-shadow: 0 0 10px #00ffff;
  transition: background-color 0.3s ease, transform 0.3s ease;
}

.floating-btn:hover {
  background-color: #00cccc;
  transform: scale(1.1);
}

/* 浮动搜索对话框 */
.floating-search-dialog {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.floating-search-input {
  width: 100%;
  font-size: 16px;
  padding: 10px;
  border-radius: 5px;
  background: rgba(0,0,0,0.6);
  color: #00ffff;
  border: 1px solid #00ffff;
  margin-bottom: 10px;
}

.upload-button {
  background-color: rgba(0,255,255,0.2);
  color: #00ffff;
  border: 1px solid #00ffff;
  border-radius: 5px;
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.upload-button:hover {
  background-color: #00ffff;
  color: #000;
  box-shadow: 0 0 10px #00ffff;
}

/* 响应式 */
@media (max-width: 768px) {
  .fish-card {
    width: 100%;
  }
  .el-col {
    padding: 5px;
  }
}
</style>
