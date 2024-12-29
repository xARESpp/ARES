"""
URL configuration for FishManage project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls import path, include
from  FishManage.settings import MEDIA_ROOT
from django.views.static import serve
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
# router = DefaultRouter()
#from apps.goods.views_base import GoodsListView
from rest_framework.routers import DefaultRouter
from apps.users.views import SMSCodeViewset,LoginWithCode
from apps.users.views import UserViewSet,UserProfileListViewSet
from apps.fish_manage.views import FishGroupListViewSet,FishCategoryViewSet,BannersShowViewSet,ImageSearchViewSet,WaterPoolViewSet

#配置goods的url
router = DefaultRouter()
router.register(r'codes',SMSCodeViewset,basename='codes')
router.register(r'users',UserViewSet,basename='users')
router.register(r'login2',LoginWithCode,basename='login2')
router.register(r'fish',FishGroupListViewSet,basename='fish')
router.register(r'category',FishCategoryViewSet,basename='category')
router.register(r'banner',BannersShowViewSet,basename='banner')
router.register(r'imagesearch',ImageSearchViewSet,basename='imagesearch')
router.register(r'waterpool',WaterPoolViewSet,basename='waterpool')
router.register(r'userprofile',UserProfileListViewSet,basename='userprofile')
urlpatterns = [
    path('grappelli/', include('grappelli.urls')),  # 这是 Grappelli 的 URL 配置
    path("admin/", admin.site.urls),
    path('media/<path:path>/', serve, {"document_root": MEDIA_ROOT}),  # 使用 path 动态参数
    path('',include(router.urls)),
    path('login1/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('ueditor/', include('extra_apps.DjangoUeditor.urls')),  # 确保 ueditor 路径被正确包含,
]
