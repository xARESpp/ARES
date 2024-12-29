name = ['黑鳍金枪鱼', '金龙鱼', '孔雀鱼', '锦鲤', '虎头鲨', '海马', '金枪鱼', '龙鱼', '红鳍鱼', '黄鳍鱼', '月光鱼', '飞鱼', '草鱼', '红目鲢', '银龙鱼', '石斑鱼', '大西 洋鳕鱼', '魔鬼鱼', '螳螂鱼', '黑石斑鱼']
import sys
import os
from django.utils import timezone

# 这样生成的时间会包含时区信息

pwd = os.path.dirname(os.path.realpath(__file__))
parent_dir = os.path.abspath(os.path.join(pwd, ".."))
sys.path.append(parent_dir)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "FishManage.settings")

import django
django.setup()

from apps.fish_manage.models import FishGroup

name = ['黑鳍金枪鱼', '金龙鱼', '孔雀鱼', '锦鲤', '虎头鲨', '海马', '金枪鱼', '龙鱼', '红鳍鱼', '黄鳍鱼', '月光鱼', '飞鱼', '草鱼', '红目鲢', '银龙鱼', '石斑鱼', '大西洋鳕鱼', '魔鬼鱼', '螳螂鱼', '黑石斑鱼']

for e in name:
    # 查找 FishGroup 对象
    group = FishGroup.objects.filter(name=e).first()  # 使用 first() 获取第一个匹配的实例

    if group:
        # 更新 videos 字段
        videos_url = f'videos/{e}.mp4'
        group.videos = videos_url
        group.save()  # 保存更改
    else:
        # 如果没有找到该对象，可以创建一个新的 FishGroup 实例
        group = FishGroup(name=e, videos=f'videos/{e}')
        group.save()  # 保存新对象

