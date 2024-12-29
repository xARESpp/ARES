import django_filters 
from .models import VerifyCode,ListUserProfile
from django.db.models import Q

class VerifyCodeFilter(django_filters.rest_framework.FilterSet):
    """
    验证码的过滤
    """
    add_time = django_filters.DateFilter(field_name='add_time',lookup_expr='gte')
    mobile = django_filters.CharFilter(field_name='mobile',lookup_expr='exact')

    # def top_category_filter(self, queryset, name, value):
    #     return queryset.filter(Q(category_id=value)|Q(category__parent_category_id=value)|Q(category__parent_category__parent_category_id=value))
    
    class Meta:
        model = VerifyCode
        fields = ['add_time','mobile'] 

class ListUserProfileFilter(django_filters.rest_framework.FilterSet):
    """
    用户信息的过滤
    """
    user_id = django_filters.NumberFilter(field_name='user__id', lookup_expr='exact')
    class Meta:
        model = ListUserProfile
        fields = ['user_id']