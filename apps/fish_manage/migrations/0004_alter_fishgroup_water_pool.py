# Generated by Django 5.1.1 on 2024-12-03 16:23

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("fish_manage", "0003_fishgroup_videos"),
    ]

    operations = [
        migrations.AlterField(
            model_name="fishgroup",
            name="water_pool",
            field=models.ForeignKey(
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="fish_manage.waterpool",
                verbose_name="鱼类分布的水池",
            ),
        ),
    ]