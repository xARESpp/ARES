row_data =[
    {
        "name": "水池A",
        "location": "区域A",
        "size": 500.0,
        "depth": 5.0,
        "capacity": 2500.0,
        "water_temperature": 28.0,
        "water_ph": 7.2,
        "oxygen_level": 8.0,
        "ammonia_level": 0.1,
        "created_time": "2024-12-01T12:00:00",
        "updated_time": "2024-12-01T12:00:00"
    },
    {
        "name": "水池B",
        "location": "区域B",
        "size": 450.0,
        "depth": 4.5,
        "capacity": 2025.0,
        "water_temperature": 24.0,
        "water_ph": 7.5,
        "oxygen_level": 7.5,
        "ammonia_level": 0.08,
        "created_time": "2024-12-01T12:00:00",
        "updated_time": "2024-12-01T12:00:00"
    },
    {
        "name": "水池C",
        "location": "区域C",
        "size": 600.0,
        "depth": 6.0,
        "capacity": 3600.0,
        "water_temperature": 22.0,
        "water_ph": 7.8,
        "oxygen_level": 9.0,
        "ammonia_level": 0.05,
        "created_time": "2024-12-01T12:00:00",
        "updated_time": "2024-12-01T12:00:00"
    }
]
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

from apps.fish_manage.models import WaterPool

for row in row_data:
    water_pool = WaterPool()
    water_pool.name = row["name"]
    water_pool.location = row["location"]
    water_pool.size = row["size"]
    water_pool.depth = row["depth"]
    water_pool.capacity = row["capacity"]
    water_pool.water_temperature = row["water_temperature"]
    water_pool.water_ph = row["water_ph"]
    water_pool.oxygen_level = row["oxygen_level"]
    water_pool.ammonia_level = row["ammonia_level"]
    water_pool.created_time = timezone.now()
    water_pool.updated_time = timezone.now()
    print(water_pool.depth)
    water_pool.save()