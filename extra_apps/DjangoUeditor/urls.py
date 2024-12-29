from django import VERSION
from .widgets import UEditorWidget, AdminUEditorWidget
from .views import get_ueditor_controller
from django.urls import path

urlpatterns = [
    path('controller/', get_ueditor_controller),  # 使用 path 替代 url
]