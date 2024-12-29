import django_filters 
from .models import WaterPool,FishGroup,banners
from django.db.models import Q

class FishGroupFilter(django_filters.rest_framework.FilterSet):
    """
    鱼类过滤器
    """
    name = django_filters.CharFilter(lookup_expr='icontains', label='鱼类名称')
    species = django_filters.CharFilter(lookup_expr='icontains', label='品种')
    age = django_filters.NumberFilter(lookup_expr='exact', label='年龄')
    health_status = django_filters.CharFilter(lookup_expr='icontains', label='健康状态')
    id = django_filters.NumberFilter(lookup_expr='exact', label='ID')

    class Meta:
        model = FishGroup
        fields = ['name', 'species', 'age', 'health_status','id']

class BannerFilter(django_filters.rest_framework.FilterSet):
    """
    首页轮播图过滤器
    """
    name = django_filters.CharFilter(lookup_expr='exact', label='名称')
    id = django_filters.NumberFilter(lookup_expr='exact', label='ID')

    class Meta:
        model = banners
        fields = ['name', 'id']