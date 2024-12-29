<template>
  <div class="pools">
    <div class="water-pool-visualization">
      <!-- 地图容器 -->
      <div class="map-container">
        <div ref="map" class="map"></div>
      </div>

      <!-- 图表容器 -->
      <div class="charts-container">
        <div v-for="pool in pools" :key="pool.id" class="chart-wrapper">
          <h3>{{ pool.name }} 鱼群分布</h3>
          <canvas :id="'pie-chart-' + pool.id"></canvas>
        </div>
      </div>
    </div>
  </div> 
</template>

<script>
import Chart from 'chart.js/auto';
import api from '../../api/api';
import { ElMessage } from 'element-plus';
import L from 'leaflet';

export default {
  data() {
    return {
      activePool: null,
      pools: [],
      chartInstances: {},  
      map: null,
      poolLayers: [],
      farmCenter: [23.1135, 113.2595], 
      farmRadius: 200 
    };
  },
  methods: {
    async Get_pools() {
      try {
        const response = await api.getPoolInfo();
        if (response) {
          const centerLat = this.farmCenter[0];
          const centerLng = this.farmCenter[1];

          this.pools = response.map((item, index) => {
            const fishGroups = item.fish_pool.map(fish => ({
              name: Object.keys(fish)[0],  
              value: Object.values(fish)[0] * 100, 
            }));

            const latOffset = (Math.random() - 0.5) * 0.001; 
            const lngOffset = (Math.random() - 0.5) * 0.001; 
            const poolCenterLat = centerLat + latOffset;
            const poolCenterLng = centerLng + lngOffset;

            const poolCoords = [
              [poolCenterLat + 0.0001, poolCenterLng - 0.0001],
              [poolCenterLat + 0.0001, poolCenterLng + 0.0001],
              [poolCenterLat - 0.0001, poolCenterLng + 0.0001],
              [poolCenterLat - 0.0001, poolCenterLng - 0.0001],
            ];

            return {
              id: item.location,
              name: item.name,
              details: {
                "水池面积": item.size,
                "水池深度": item.depth,
                "水池容量": item.capacity,
                "水温": item.water_temperature,
                "水的pH值": item.water_ph,
                "含氧量": item.oxygen_level,
                "氨气浓度": item.ammonia_level
              },
              fishGroups,
              coords: poolCoords
            };
          });

          this.$nextTick(() => {
            this.pools.forEach(pool => {
              this.renderPieChart(pool);
            });
          });

          this.drawPoolsOnMap();
        } else {
          console.log("获取水池信息失败");
          ElMessage.error("获取水池信息失败");
        }
      } catch (error) {
        console.log(error);
      }
    },
    renderPieChart(pool) {
      const canvasId = `pie-chart-${pool.id}`;
      const ctx = document.getElementById(canvasId).getContext('2d');

      const generateColors = (count) => {
        return Array.from({ length: count }, () => 
          `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.7)`
        );
      };

      const colors = generateColors(pool.fishGroups.length);
      const labels = pool.fishGroups.map(group => group.name);
      const data = pool.fishGroups.map(group => group.value);

      if (this.chartInstances[pool.id]) {
        this.chartInstances[pool.id].destroy();
      }

      this.chartInstances[pool.id] = new Chart(ctx, {
        type: 'pie',
        data: {
          labels,
          datasets: [{
            label: 'Fish Distribution',
            data,
            backgroundColor: colors,
          }],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'top',
            },
            tooltip: {
              callbacks: {
                label: function(tooltipItem) {
                  return `${tooltipItem.label}: ${tooltipItem.raw}%`;
                }
              }
            }
          },
        }
      });
    },
    drawPoolsOnMap() {
      this.poolLayers.forEach(layer => {
        this.map.removeLayer(layer);
      });
      this.poolLayers = [];

      this.pools.forEach(pool => {
        const polygon = L.polygon(pool.coords, {
          color: 'blue',
          weight: 1,
          fillColor: 'blue',
          fillOpacity: 0.4
        }).addTo(this.map);

        polygon.on('click', (e) => {
          this.showPoolPopup(e, pool);
        });

        this.poolLayers.push(polygon);
      });
    },
    showPoolPopup(e, pool) {
      let detailsHtml = '';
      for (let key in pool.details) {
        detailsHtml += `<div class="detail-item"><span class="detail-label">${key}:</span> <span class="detail-value">${pool.details[key]}</span></div>`;
      }

      const clickLat = e.latlng.lat.toFixed(6);
      const clickLng = e.latlng.lng.toFixed(6);

      const content = `
        <div class="popup-content">
          <h3>${pool.name}</h3>
          ${detailsHtml}
          <hr>
          <p>点击位置坐标：纬度 ${clickLat}, 经度 ${clickLng}</p>
        </div>
      `;

      L.popup({ maxWidth: 300 })
        .setLatLng(e.latlng)
        .setContent(content)
        .openOn(this.map);
    },
    initMap() {
      this.map = L.map(this.$refs.map).setView(this.farmCenter, 15);

      L.tileLayer('https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: '© Esri & the GIS User Community'
      }).addTo(this.map);

      // 添加淡黄色圈标记农场区域
      L.circle(this.farmCenter, {
        color: 'yellow',
        weight: 2,
        fillColor: 'yellow',
        fillOpacity: 0.2,
        radius: this.farmRadius
      }).addTo(this.map);
    }
  },
  mounted() {
    this.initMap();
    this.Get_pools();
  }
};
</script>

<style scoped>
html, body {
  margin: 0; 
  padding: 0; 
  width: 100%; 
  height: 100%; 
  overflow: hidden;
}

/* 使用星空图片作为背景(请使用实际存在的星空图URL替换) */
/* 在这里假设您有一张星空背景图像：/assets/stars.jpg */

.pools {
  width: 100%;
  height: 100%;
  position: relative;
  background: url('../../assets/sky.jpg') center center no-repeat;
  background-size: cover;
  /* 尝试取消动画或降低动画幅度，以减少背景图模糊感 */
  animation: starScroll 20s linear infinite;
}

@keyframes starScroll {
  0% {background-position: 0% 0%;}
  100% {background-position: 10% 10%;} /* 缓慢移动，幅度小，避免大范围拉伸 */
}

/* 动画让背景图缓慢移动，模拟动态星空 */
@keyframes starScroll {
  0% {background-position: 0% 0%;}
  50% {background-position: 100% 50%;}
  100% {background-position: 0% 100%;}
}

.water-pool-visualization {
  display: flex;
  flex-direction: column;
  max-width: 1400px;
  margin: 0 auto;
  padding: 40px;
  height: 100%;
  box-sizing: border-box;
}

.map-container {
  width: 100%;
  height: 60%; /* 地图仍占据上方较大部分 */
  margin-bottom: 20px;
  position: relative;
  border: 2px solid #ffdd00;
  box-shadow: 0 0 20px #ffdd00;
  background: rgba(255,255,255,0.1);
}

.map {
  width: 100%;
  height: 100%;
}

.charts-container {
  flex: 1;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  overflow-y: auto;
}

.chart-wrapper {
  width: 30%;
  background: rgba(255,255,255,0.9);
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.chart-wrapper h3 {
  text-align: center;
  margin-bottom: 15px;
  color: #333;
}

.detail-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  color: #333;
}
.detail-label {
  font-weight: bold;
  margin-right: 10px;
}

/* 弹窗样式 */
.popup-content h3 {
  margin-top: 0;
  font-size: 16px;
  font-weight: bold;
  color: #333;
}

.popup-content .detail-item {
  color: #333;
}

.popup-content hr {
  border: none;
  border-top: 1px solid #ccc;
  margin: 10px 0;
}
</style>
