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

from apps.fish_manage.models import banners,FishGroup

import os

name = ['黑鳍金枪鱼', '金龙鱼', '孔雀鱼', '锦鲤', '虎头鲨', '海马', '金枪鱼', '龙鱼', '红鳍鱼', '黄鳍鱼', '月光鱼', '飞鱼', '草鱼', '红目鲢', '银龙鱼', '石斑鱼', '大西洋鳕鱼', '魔鬼鱼', '螳螂鱼', '黑石斑鱼']
for e in name:
  print('正在处理：',e)
  folder_path = r"D:\FishManage\media\banners\yu\{e}".format(e=e)
  folder_path = folder_path.replace("\x08", "")  # 移除退格符或其他非法字符
  print(folder_path)
  file_names = [f'banners/yu/{e}/'+os.path.basename(f) for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]
  banner = banners()
  fish = FishGroup.objects.get(name=e)
  banner.name = fish
  banner.image1 = file_names[0]
  banner.image2 = file_names[1]
  banner.image3 = file_names[2]
  banner.add_time = timezone.now()
  banner.save()


