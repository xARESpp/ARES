# 鱼塘管理系统

## 项目简介

这是一个基于Django REST framework（DRF）和Vue.js构建的鱼塘展示管理系统，主要面向课程设计，毕业设计。系统提供了完整的鱼塘管理功能，包括用户管理、鱼塘监控、数据统计等功能。

## 关键点说明

本系统采用了百度图像识别接口和互忆短信接口，相关功能已经封装完成，如有需求，可在settings.py里替换自己的密钥。本系统网站爬取自网上，仅供于学习，请勿用以盈利目的。

### 后端技术栈

- 框架：Django + Django REST framework
- 数据库：MySQL
- 认证：JWT
- API文档：Swagger/OpenAPI
- 任务调度：APScheduler

### 前端技术栈

- 框架：Vue.js
- 构建工具：Vite
- UI组件库：Element Plus
- 状态管理：Pinia
- 路由：Vue Router
- HTTP客户端：Axios

## 项目结构

```
FishManage/
├── apps/                    # Django应用目录
│   ├── fish_manage/        # 鱼塘管理核心应用
│   └── users/              # 用户管理应用
├── vite_app_template/      # Vue前端项目
│   ├── src/
│   │   ├── api/           # API接口
│   │   ├── components/    # 组件
│   │   ├── views/        # 页面
│   │   ├── router/       # 路由配置
│   │   └── stores/       # 状态管理
├── FishManage/            # Django项目配置
├── media/                 # 媒体文件
├── staticfiles/          # 静态文件
├── requirements.txt      # Python依赖
├── manage.py            # Django管理脚本
└── fish.sql            # 数据库脚本
```

## 功能特性

- 多角色用户系统（管理员、普通用户）
- 鱼塘管理和监控
- 数据可视化
- 实时数据统计
- 响应式设计

## 快速开始

### 后端部署

1. 创建虚拟环境并激活

```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```

2. 安装依赖

```bash
pip install -r requirements.txt
```

3. 数据库迁移

```bash
python manage.py migrate
```

4. 运行开发服务器

```bash
python manage.py runserver
```

### 前端部署

1. 进入前端项目目录

```bash
cd vite_app_template
```

2. 安装依赖

```bash
npm install
# 或
yarn install
```

3. 开发环境运行

```bash
npm run dev
# 或
yarn dev
```

4. 生产环境构建

```bash
npm run build
# 或
yarn build
```

## 环境要求

- Python 3.8+
- Node.js 14+
- MySQL 5.7+

## 开发指南

1. 遵循RESTful API设计规范
2. 使用ESLint进行代码规范检查
3. 遵循Vue.js官方推荐的开发规范
4. 使用Git Flow工作流程

## 部署说明

1. 确保服务器已安装所需环境
2. 配置数据库连接
3. 设置环境变量
4. 收集静态文件
5. 配置Web服务器（如Nginx）

## 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交Pull Request

## 许可证

MIT License

## 联系方式

如有任何问题或建议，请提交 Issue 或 Pull Request。
