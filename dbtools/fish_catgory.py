import sys
import os
from django.utils import timezone

# 这样生成的时间会包含时区信息


pwd = os.path.dirname(os.path.realpath(__file__))

parent_dir = os.path.abspath(os.path.join(pwd,".."))

sys.path.append(parent_dir)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "FishManage.settings")

import django
django.setup()

from apps.fish_manage.models import FishCategory


category_list = {'鲨科', '鳍鱼科', '飞鱼科', '螳螂鱼科', '金枪鱼科', '孔雀鱼科', '石斑鱼科', '魔鬼鱼科', '鲤科', '龙鱼科', '鲢科', '鳕科', '海马科', '月光鱼科'}
for category in category_list:
    FishCategory.objects.create(name=category, add_time=timezone.now())
