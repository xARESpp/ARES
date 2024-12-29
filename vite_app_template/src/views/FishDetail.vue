<template>
  <div class="fish-detail-container">
    <!-- 轮播图部分 -->
   <div class="full-screen-bg"></div>  
    <div class="carousel-container">
      <el-carousel height="400px" v-if="fishData && fishData.images.length">
        <el-carousel-item v-for="(image, index) in fishData.images" :key="index">
          <img :src="image" alt="鱼类图片" class="carousel-image animate__animated animate__fadeIn" />
        </el-carousel-item>
      </el-carousel>
    </div>

    <!-- 鱼类简介部分 -->
    <div v-if="fishData && fishData.name" class="fish-introduction">
      <h2 class="fish-name animate__animated animate__fadeInDown">{{ fishData.name }}</h2>
      <div v-html="fishData.desc" class="fish-description animate__animated animate__fadeInUp"></div>
    </div>

    <!-- 鱼类资料卡片部分 -->
    <div class="info-cards-container">
      <!-- 资料卡 1 -->
      <div class="info-card animate__animated animate__fadeInUp" :style="`animation-delay: 0.2s`">
        <el-card class="box-card" :body-style="{ padding: '20px' }">
          <div class="text item">
            <p><strong>养殖时间：</strong>{{ fishData.info[0].age }}年</p>
            <p><strong>性别比：</strong>{{ fishData.info[0].gender_ratio }}</p>
          </div>
        </el-card>
      </div>

      <!-- 资料卡 2 -->
      <div class="info-card animate__animated animate__fadeInUp" :style="`animation-delay: 0.4s`">
        <el-card class="box-card" :body-style="{ padding: '20px' }">
          <div class="text item">
            <p><strong>养殖水池：</strong>{{ fishData.info[0].water_pool }}</p>
            <p><strong>健康状况：</strong>{{ fishData.info[0].health_status }}</p>
          </div>
        </el-card>
      </div>

      <!-- 资料卡 3 -->
      <div class="info-card animate__animated animate__fadeInUp" :style="`animation-delay: 0.6s`">
        <el-card class="box-card" :body-style="{ padding: '20px' }">
          <div class="text item">
            <p><strong>平均体重：</strong>{{ fishData.info[0].avg_weight }} kg</p>
            <p><strong>种类：</strong>{{ fishData.info[0].specie }}</p>
          </div>
        </el-card>
      </div>
    </div>

    <!-- 科普视频部分 -->
    <div v-if="fishData && fishData.videoUrl" class="video-section">
      <h2 class="video-title animate__animated animate__fadeInDown">了解更多</h2>
      <div class="video-container animate__animated animate__fadeInUp">
        <iframe :src="fishData.videoUrl" width="60%" height="70%" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      </div>
    </div>

    <!-- 科普文章部分（添加滚动功能）-->
    <div v-if="fishData && fishData.content" class="science-content">
      <h2 class="science-title animate__animated animate__fadeInDown">科普文章</h2>
      <div v-html="fishData.content" class="content-scroll animate__animated animate__fadeInUp"></div>
    </div>
  </div>
</template>

<script>
import api from '../api/api';
export default {
  data() {
    return {
      id: '',
      fishData:{
          name: '',
          images: [],
          desc: '',
          videoUrl: '',
          content: '',
          info: [
            {
                age: '',
                gender_ratio: '',
                water_pool: '',
                gender_ratio: '',
                avg_weight: '',
                health_status: '',
                specie: '',
            },
          ],

      },
    };
  },
  methods:{
    decodeHtml(html) {
      const txt = document.createElement("textarea");
      txt.innerHTML = html; // 将转义的字符串放入 textarea 中
      return txt.value; // 返回解码后的原始字符串
    },
    async fetchBanner(){
        try{
            const res_ = await api.getBanners(this.id);
            const res= res_[0]
            console.log(res)
            if(res){
              console.log(res.image1)
              this.fishData.images.push(res.image1)
              this.fishData.images.push(res.image2)
              this.fishData.images.push(res.image3)
              //console.log(this.fishData.images)
            }
        }catch(error){
          ElMessage.error('请求轮播图失败');
          console.log(error);
        }
    },
    async fetchFishGroups() {
      try {
        const res_ = await api.getDetail(this.id);
        const res = res_[0];
        if (res) {
          const pool = {3: 'A区域',5: 'B区域',7: 'C区域'};
          this.fishData.content = this.decodeHtml(res.content);
          this.fishData.desc = this.decodeHtml(res.desc);
          this.fishData.name = res.name;
          // this.fishData.images = res.images;
          this.fishData.info[0].age = res.age;
          this.fishData.info[0].gender_ratio = res.gender_ratio;
          this.fishData.info[0].water_pool = pool[res.water_pool];
          this.fishData.info[0].health_status = res.health_status;
          this.fishData.info[0].avg_weight = res.avg_weight;
          this.fishData.info[0].specie = res.species;
          this.fishData.videoUrl = res.videos;
        }
      } catch (error) {
        console.error(error);
        ElMessage.error('请求失败');
      }
    },
  },
  mounted() {
    this.id = this.$route.params.id; // 从 state 中获取传递的 fishGroup
    this.fetchFishGroups();
    this.fetchBanner();
    console.log(this.id);
  }
};
</script>
<style scoped>
.full-screen-bg {
 position: fixed;
 top: 0;
 left: 0;
 width: 100vw;
 height: 100vh;
 background-image: url('../assets/FishDetail.jpg');
 background-size: cover;
 background-position: center;
 background-repeat: no-repeat;
 z-index: -1;
}

.fish-detail-container {
 position: relative;
 max-width: 1200px;
 width: 80%;
 margin: 40px auto;
 padding: 20px;
 background-color: rgba(255, 255, 255, 0.8);
 border-radius: 10px;
 box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.carousel-container {
 margin-bottom: 30px;
}

.carousel-image {
 width: 100%;
 height: 500px;
 object-fit: cover;
 border-radius: 10px;
}

.fish-introduction {
 margin-bottom: 30px;
 text-align: center;
}

.fish-name {
 font-size: 28px;
 margin-bottom: 15px;
}

.fish-description {
 font-size: 16px;
 line-height: 1.6;
}

.info-cards-container {
 display: flex;
 justify-content: space-between;
 margin-bottom: 30px;
}

.info-card {
 width: 32%;
}

.video-section {
 margin-bottom: 40px;
 text-align: center;
}

.video-title {
 font-size: 22px;
 margin-bottom: 15px;
}

.video-container {
 position: relative;
 width: 80%;
 margin: 0 auto;
 padding-bottom: 45%;
 overflow: hidden;
 border-radius: 10px;
}

.video-container iframe {
 position: absolute;
 top: 0;
 left: 0;
 width: 100%;
 height: 100%;
 border: none;
}

.science-content {
 margin-bottom: 30px;
 text-align: center;
}

.science-title {
 font-size: 22px;
 margin-bottom: 15px;
}

.content-scroll {
 max-height: 400px;
 overflow-y: auto;
 font-size: 16px;
 line-height: 1.6;
 text-align: left;
 padding-right: 10px;
}
</style> 