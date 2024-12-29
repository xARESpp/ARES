from django.contrib import admin
from .models import UserProfile, VerifyCode,ListUserProfile

class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('username', 'name','email', 'mobile', 'gender', 'birthday', 'is_active', 'date_joined')
    search_fields = ('username', 'email', 'mobile')
    list_filter = ('gender', 'is_active', 'date_joined')
    ordering = ('-date_joined',)
    list_per_page = 20

admin.site.register(UserProfile, UserProfileAdmin)

class VerifyCodeAdmin(admin.ModelAdmin):
    list_display = ('code', 'mobile', 'add_time')
    search_fields = ('mobile', 'code')
    list_filter = ('add_time',)
    ordering = ('-add_time',)
    list_per_page = 20

class ListUserProfileAdmin(admin.ModelAdmin):
     list_display = ('user','desc' ,'add_time')
     search_fields = ('user', 'desc')
     list_filter = ('add_time',)
     ordering = ('-add_time',)
     list_per_page = 20

admin.site.register(ListUserProfile, ListUserProfileAdmin)

admin.site.register(VerifyCode, VerifyCodeAdmin)
