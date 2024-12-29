from rest_framework import serializers

from .models import WaterPool,FishGroup,FishCategory,banners,Profile

class FishGroupSerializers(serializers.ModelSerializer):
    species = serializers.CharField(source='species.name')
    class Meta:
        model = FishGroup
        fields = '__all__'




class FishCategorySerializers(serializers.ModelSerializer):
    fish_category = FishGroupSerializers(many=True, read_only=True)
    class Meta:
        model = FishCategory
        fields = ['name','fish_category']
    def to_representation(self, instance):
        representation = super().to_representation(instance)

        # 获取鱼群的名字列表
        fish_category_data = representation.get('fish_category', [])
        fish_category_names = [fish_group.get('name') for fish_group in fish_category_data]

        # 只返回鱼群的名字
        representation['fish_category'] = fish_category_names

        return representation

class BannersSerilizers(serializers.ModelSerializer):  
    # name = serializers.CharField(source='name.name')
    class Meta:
        model = banners
        fields = '__all__'

class ProfileSerilizers(serializers.ModelSerializer):
    # user_name = serializers.CharField(source='user.username')
    class Meta:
        model = Profile
        fields = ['avatar']

class WaterPoolSerializers(serializers.ModelSerializer):
    fish_pool = FishGroupSerializers(many=True, read_only=True)
    class Meta:
        model = WaterPool
        exclude = ['created_time','updated_time']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        fish_pool_data = representation.get('fish_pool', [])
        fish_pool_proportion= []
        total_quantity = 0
        for quantity in fish_pool_data:
               total_quantity += quantity.get('estimated_quantity')
        for fish_group in fish_pool_data:
            fish_group_name = fish_group.get('name')
            estimated_quantity = fish_group.get('estimated_quantity')
            proportion = estimated_quantity/total_quantity
            fish_pool_proportion.append({fish_group_name:proportion})
        # fish_pool_proportion = [{fish_group.get('name'):fish_group.get('estimated_quantity')} for fish_group in fish_pool_data]
        representation['fish_pool'] = fish_pool_proportion
        return representation