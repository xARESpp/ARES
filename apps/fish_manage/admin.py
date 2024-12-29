from django.contrib import admin
from .models import WaterPool, FishGroup,FishCategory,banners,Profile
from extra_apps.DjangoUeditor.widgets import UEditorWidget
from django import forms
from django.db import models


class ProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'avatar','result', 'add_time')
    search_fields = ('user','result')
    list_filter = ('add_time','result')

class FishCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'add_time')
    search_fields = ('name',)
    list_filter = ('add_time','name')

class WaterPoolAdmin(admin.ModelAdmin):
    list_display = ('name', 'location', 'size', 'depth', 'capacity', 'water_temperature', 'water_ph', 'oxygen_level', 'ammonia_level', 'created_time', 'updated_time')
    search_fields = ('name', 'location')
    list_filter = ('location', 'created_time', 'updated_time')

class FishGroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'species', 'age', 'gender_ratio', 'image','water_pool','desc','estimated_quantity', 'avg_weight', 'health_status', 'videos','created_time', 'updated_time')
    search_fields = ('name', 'species', 'health_status', 'water_pool__name')
    list_filter = ('species', 'health_status', 'water_pool', 'created_time', 'updated_time')

    fieldsets = (
        (None, {
            'fields': ('name', 'species', 'age', 'desc','gender_ratio', 'water_pool', 'estimated_quantity', 'avg_weight', 'health_status', 'health_alert')
        }),
        ('富文本内容', {
            'fields': ('content',),
            'classes': ('wide',)
        }),
        ('鱼类图片', {
            'fields': ('image',),
            'classes': ('collapse',)
        }),
         ('鱼类视频', {
            'fields': ('videos',),
            'classes': ('collapse',)
        }),
    )
    
    # 排除不可编辑的字段（created_time 和 updated_time）
    exclude = ('created_time', 'updated_time')

    # 设置 UEditor 富文本编辑器
    formfield_overrides = {
        models.TextField: {
            'widget': UEditorWidget(attrs={'width': '1000px', 'height': '300px'})  # 使用 attrs 配置宽度和高度
        },
    }

class bannersAdmin(admin.ModelAdmin):
    list_display = ('name', 'image1', 'image2', 'image3','add_time')
    search_fields = ('name',)
    list_filter = ('add_time',)

admin.site.register(WaterPool, WaterPoolAdmin)
admin.site.register(FishGroup, FishGroupAdmin)
admin.site.register(FishCategory, FishCategoryAdmin)
admin.site.register(banners, bannersAdmin)
admin.site.register(Profile, ProfileAdmin)

