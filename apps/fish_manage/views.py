from django.shortcuts import render

# Create your views here.
# from snippets.models import Snippet
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import FishGroupSerializers,FishCategorySerializers,BannersSerilizers,ProfileSerilizers,WaterPoolSerializers
from .models import WaterPool,FishGroup,FishCategory,banners,Profile
from rest_framework import mixins
from rest_framework import generics

from .filter import FishGroupFilter,BannerFilter
from rest_framework.pagination import PageNumberPagination

from rest_framework import viewsets

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import filters
from .utils.ImageSearchAlgorithm import ImageSearchAlgorithm

from FishManage.settings import IMAGE_API_KEY,IMAGE_SECRET_KEY


class FishGroupListViewSet(mixins.ListModelMixin,viewsets.GenericViewSet):
    queryset = FishGroup.objects.all()
    serializer_class = FishGroupSerializers
    permission_classes = [IsAuthenticated]
    filter_backends = [DjangoFilterBackend,filters.SearchFilter,filters.OrderingFilter]
    ordering_fields = ['id','age']
    search_fields = ['name','species']
    filterset_class = FishGroupFilter

class FishCategoryViewSet(mixins.ListModelMixin,viewsets.GenericViewSet):
    queryset = FishCategory.objects.all()
    serializer_class = FishCategorySerializers
    filter_backends = [DjangoFilterBackend,filters.SearchFilter,filters.OrderingFilter]
    permission_classes = [IsAuthenticated]

class BannersShowViewSet(mixins.ListModelMixin,viewsets.GenericViewSet):
    queryset = banners.objects.all()
    serializer_class = BannersSerilizers
    filter_backends = [DjangoFilterBackend,filters.SearchFilter,filters.OrderingFilter]
    filterset_class = BannerFilter
    

class ImageSearchViewSet(mixins.CreateModelMixin,viewsets.GenericViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerilizers
    """
    重写post,接入识别接口
    """
    def create(self, request, *args, **kwargs):
        print(request.data)
        image =  request.data['avatar'] # 这里是 'avatar' 传递的字段名
        print(type(image))
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        algorithm = ImageSearchAlgorithm(IMAGE_API_KEY,IMAGE_SECRET_KEY,image)
        result = algorithm.match()
        print(result)
        if result:
           Profile.objects.create(user=request.user,avatar=image,result=result)
           return Response({'match':result},status=status.HTTP_200_OK)
        else:
          result = '未识别'
          Profile.objects.create(user=request.user,avatar=image,result=result)
          return Response({'error':'No match found'},status=status.HTTP_404_NOT_FOUND)
        
class WaterPoolViewSet(mixins.ListModelMixin,viewsets.GenericViewSet):
        queryset = WaterPool.objects.all()
        serializer_class = WaterPoolSerializers
       