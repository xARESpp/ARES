from django.db import models
from ..users.models import UserProfile
# from extra_apps.DjangoUeditor.models import UEditorField

class WaterPool(models.Model):
    """
    水池信息
    """
    name = models.CharField(max_length=100, verbose_name="水池名称")  # 水池名称
    location = models.CharField(max_length=200, verbose_name="位置", null=True, blank=True)  # 水池的地理位置
    size = models.FloatField(verbose_name="水池面积 (平方米)", null=True, blank=True)  # 水池面积
    depth = models.FloatField(verbose_name="水池深度 (米)", null=True, blank=True)  # 水池深度
    capacity = models.FloatField(verbose_name="水容量 (立方米)", null=True, blank=True)  # 水池最大容积
    water_temperature = models.FloatField(verbose_name="水温 (°C)", null=True, blank=True)  # 当前水温
    water_ph = models.FloatField(verbose_name="水的pH值", null=True, blank=True)  # 水的酸碱值
    oxygen_level = models.FloatField(verbose_name="溶解氧含量 (mg/L)", null=True, blank=True)  # 溶解氧的含量
    ammonia_level = models.FloatField(verbose_name="氨氮浓度 (mg/L)", null=True, blank=True)  # 水中的氨氮含量
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    updated_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")
    class Meta:
        verbose_name = "水池信息"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
class FishCategory(models.Model):
    """
    鱼类分类
    """
    name = models.CharField(max_length=100, verbose_name="分类名称")  # 分类名称
    add_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    class Meta:
        verbose_name = "鱼类分类"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
    
class FishGroup(models.Model):
    # 基本信息
    name = models.CharField(max_length=100, verbose_name="鱼类名称")  # 鱼类名称
    species = models.ForeignKey(FishCategory,related_name='fish_category',on_delete=models.CASCADE,verbose_name="鱼类分类")#外键，鱼类分类
    age = models.PositiveIntegerField(verbose_name="养殖年龄", null=True, blank=True)  # 年龄，单位：月
    gender_ratio = models.CharField(
        max_length=20, verbose_name="雌雄比例", null=True, blank=True
    )  # 雌雄比例，如 "1:1"
    water_pool = models.ForeignKey(WaterPool,related_name='fish_pool',null=True,on_delete=models.SET_NULL,verbose_name="鱼类分布的水池")#外键，鱼类分布的水池信息
    # 数量和体重
    estimated_quantity = models.PositiveIntegerField(verbose_name="预估数量", default=0)  # 鱼群的数量
    avg_weight = models.FloatField(verbose_name="平均体重 (kg)", null=True, blank=True)  # 平均体重（单位：kg）

    # 健康信息
    health_status = models.CharField(max_length=100, verbose_name="健康状态", default="健康")  # 健康状态，例如“健康”“轻微感染”
    health_alert = models.TextField(verbose_name="健康预警", null=True, blank=True)  # 健康预警详情
    
    desc = models.TextField(verbose_name="首页描述", null=True, blank=True)  # 鱼类描述
    image = models.ImageField(upload_to="fish/", verbose_name="鱼类图片", null=True, blank=True)  # 鱼的封面图片
    content = models.TextField(verbose_name='富文本内容',help_text="富文本内容")  # 存储富文本HTML内容,科普文章，视频，以及图片的存储
    videos = models.FileField(upload_to="videos/", verbose_name="视频", null=True, blank=True)  # 视频文件
    # 时间
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    updated_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")
    class Meta:
        verbose_name = "鱼类信息"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
    
class banners(models.Model):
    """
    详情页轮播图
    """
    name = models.ForeignKey(FishGroup,on_delete=models.CASCADE,verbose_name="鱼类名称")  # 外键，关联鱼类信息
    image1 = models.ImageField(upload_to="banners/", verbose_name="轮播图1",null=True, blank=True)  # 轮播图1
    image2 = models.ImageField(upload_to="banners/", verbose_name="轮播图2",null=True, blank=True)  # 轮播图2
    image3 = models.ImageField(upload_to="banners/", verbose_name="轮播图3",null=True, blank=True)  # 轮播图3
    add_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name.name
    
class Profile(models.Model):
    """
    上传的图片
    """
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE,verbose_name="用户")
    avatar = models.ImageField(upload_to='avatars/', null=True, blank=True, verbose_name="图像")
    result = models.CharField(max_length=100, verbose_name="识别结果", null=True, blank=True)
    add_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "用户搜索的图片"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.username
