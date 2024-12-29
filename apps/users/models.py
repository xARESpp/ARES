from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.
from datetime import datetime
#用户资料

class UserProfile(AbstractUser):
    # 用户
    name = models.CharField(max_length=30,null=True,blank=True,verbose_name="姓名")
    birthday = models.DateField(null=True,blank=True,verbose_name="出生年月")
    gender = models.CharField(max_length=6,choices=(("male","男"),("female","女")),default="female",verbose_name="性别")
    mobile = models.CharField(max_length=11,verbose_name="电话")
    email = models.CharField(max_length=100,null=True,blank=True,verbose_name="电子邮箱")

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = "用户们"
    def __str__(self) -> str:
       return self.username if self.name else "未命名用户"
    
class VerifyCode(models.Model):
    #短信验证码
    #name = models.CharField(max_length=30,null=True,blank=True,verbose_name="姓名")
    code = models.CharField(max_length=10,verbose_name="验证码")
    mobile = models.CharField(max_length=11,verbose_name="电话")
    
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    class Meta:
        verbose_name = "短信验证码"
        verbose_name_plural = verbose_name
    def __str__(self) -> str:
        return self.code

class ListUserProfile(models.Model):
    """
    用户个人资料展示
    """
    desc = models.CharField(max_length=200,verbose_name="用户简介",default="这个人很懒，什么都没写...")
    user = models.ForeignKey(UserProfile,on_delete=models.CASCADE,verbose_name="用户",null=True,blank=True)
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    class Meta:
        verbose_name = "用户个人资料展示"
        verbose_name_plural = verbose_name
    def __str__(self) -> str:
        return self.user.name if self.user.name else "未命名用户"