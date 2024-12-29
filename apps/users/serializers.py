from rest_framework import serializers

from .models import UserProfile,VerifyCode,ListUserProfile
from django.contrib.auth import get_user_model
User = get_user_model()
from datetime import datetime, timedelta
class VerifyCodeSerializer(serializers.ModelSerializer):
    mobile = serializers.CharField(max_length=11)
    class Meta:
        model = VerifyCode
        fields = ['mobile']
    def validate_mobile(self, value):#自定义校验方法,validate_字段名为校验字段名
        """
        校验手机号格式
        """
        import re
        if not re.match(r'^1[3-9]\d{9}$', value):
            raise serializers.ValidationError("手机号格式不正确")
        one_minute_go = datetime.now() - timedelta(hours=0,minutes=1,seconds=0)
        if VerifyCode.objects.filter(mobile=value,add_time__gt=one_minute_go).exists():
            raise serializers.ValidationError("验证码发送频繁")

        return value
from rest_framework.validators import UniqueValidator
import pytz
class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(required=True,write_only=True,max_length=6,min_length=6,label='验证码',help_text='验证码',error_messages={'required': '验证码不能为空','max_length': '验证码长度不能超过6','min_length': '验证码长度不能少于6'})
    username = serializers.CharField(label='用户名',help_text='用户名',required=True,allow_blank=False,validators=[UniqueValidator(queryset=User.objects.all(),message='用户名已存在')])
    password = serializers.CharField(
    style={'input_type': 'password'}
)   
        
    def validate_mobile(self, value):#自定义校验方法,validate_字段名为校验字段名
        """
        校验手机号格式
        """
        if User.objects.filter(mobile=value).exists():
            raise serializers.ValidationError("手机号已注册")
        import re
        if not re.match(r'^1[3-9]\d{9}$', value):
            raise serializers.ValidationError("手机号格式不正确")
        # one_minute_go = datetime.now() - timedelta(hours=0,minutes=1,seconds=0)
        # if VerifyCode.objects.filter(mobile=value,add_time__gt=one_minute_go).exists():
        #     raise serializers.ValidationError("验证码发送频繁")

        return value
    def validate_code(self, value):
       print('进入到了验证逻辑')
       print(self.initial_data)
       Verify_record = VerifyCode.objects.filter(mobile=self.initial_data['mobile']).order_by('-add_time')
       print(Verify_record)
       if Verify_record:
        last_code = Verify_record[0] 
        
        # 去除 last_code.add_time 的时区信息，使其成为 naive datetime
        last_code_time = last_code.add_time.replace(tzinfo=None)
        
        # 获取当前时间并减去 5 分钟，得到 naive datetime
        five_minutes_ago = datetime.now() - timedelta(minutes=5)

        # 比较
        if last_code_time < five_minutes_ago:
            raise serializers.ValidationError("验证码已过期")
        if last_code.code != value:
            raise serializers.ValidationError("验证码错误")
        # else:
        #     # 当验证码正确时，判断验证码的发送频率
        #      one_minute_go = datetime.now() - timedelta(hours=0,minutes=1,seconds=0)
        #      if VerifyCode.objects.filter(mobile=value,add_time__gt=one_minute_go).exists():
        #          raise serializers.ValidationError("验证码发送频繁")
       else:
        print("Luoji")
        raise serializers.ValidationError("验证码错误")
    def validate(self, attrs):
        attrs['name'] = attrs['username']
        
        del attrs['code']
        return attrs
    # def create(self, validated_data):
    #     user = super(UserRegSerializer, self).create(validated_data)
    #     user.set_password(validated_data['password'])
    #     user.save()
    #     return user
    class Meta:
        model = User
        fields = ['username','mobile','code','password','date_joined']

class UserLogginSerializer(serializers.ModelSerializer):
    code = serializers.CharField(required=True,write_only=True,max_length=6,min_length=6,label='验证码',help_text='验证码',error_messages={'required': '验证码不能为空','max_length': '验证码长度不能超过6','min_length': '验证码长度不能少于6'})
    class Meta:
        model = User
        fields = ['mobile','code']
        
class UserDetailSerializer(serializers.ModelSerializer):
    """
    用户详情序列化类
    """
    class Meta:
        model = User
        fields = ("name", "gender", "birthday", "email", "mobile",'username','date_joined','id')
class UserProfileListSerializer(serializers.ModelSerializer):
    """
    用户详情序列化类
    """ 
    user = UserDetailSerializer(read_only=True,many=False)
    def to_representation(self, instance):
       represenetation = super().to_representation(instance)
       user_data = represenetation.get('user')
       username = user_data.get('name')
       useremail = user_data.get('email')
       usermobile = user_data.get('mobile')
       userjoined = user_data.get('date_joined')
       userid = user_data.get('id')
      
       new_data = [{'username':username},{'email':useremail},{'phone':usermobile},{"created_at":userjoined},{"id":userid}]
       for data in new_data:
        # 将 keys 和 values 转换为列表，然后可以进行索引操作
          keys_list = list(data.keys())
          values_list = list(data.values())

          represenetation[keys_list[0]] = values_list[0]
       del represenetation['user']

    #    represenetation['id'] = userid
       return represenetation
    class Meta:
        model = ListUserProfile
        fields = ('user','desc')