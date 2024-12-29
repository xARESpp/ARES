
# # 渲染下载页面
# def download_page(request):
#     return render(request, 'download.html')
from django.shortcuts import render

# Create your views here.
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q
from rest_framework.mixins import CreateModelMixin
from rest_framework import mixins
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from random import choice
from rest_framework import permissions
from rest_framework import authentication
from rest_framework.authentication import TokenAuthentication

# from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler

from .serializers import UserRegSerializer, UserDetailSerializer,UserLogginSerializer,UserProfileListSerializer
from FishManage.settings import API_KEY
import random
from .utils.HuYi import HuYiMessage
from .models import VerifyCode,ListUserProfile
from .serializers import VerifyCodeSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication
User = get_user_model()
from rest_framework.pagination import PageNumberPagination
import pytz
from datetime import datetime, timedelta
class StandardResultsSetPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    page_query_param = 'q'
    max_page_size = 100
class LoginWithCode(mixins.CreateModelMixin,viewsets.GenericViewSet):
    """
    验证码登录
    """
    serializer_class = UserLogginSerializer
    queryset = User.objects.all()
    def check_code(self,mobile,value):
       #print('验证码验证')
       Verify_record = VerifyCode.objects.filter(mobile=mobile).order_by('-add_time')
       #print(Verify_record)
       if Verify_record:
        last_code = Verify_record[0] 
        
        # 去除 last_code.add_time 的时区信息，使其成为 naive datetime
        last_code_time = last_code.add_time.replace(tzinfo=None)
        
        # 获取当前时间并减去 5 分钟，得到 naive datetime
        five_minutes_ago = datetime.now() - timedelta(minutes=5)

        # 比较
        if last_code_time < five_minutes_ago:
            return 1
        elif last_code.code != value:
            return 2
        else:
            #print('验证码正确')
            return 0
       else:
        print("Luoji")
        return 3
    def create(self, request, *args, **kwargs):
        """
        处理登录逻辑。根据手机号和验证码生成 JWT token。
        """
        print(request.data)
        mobile = request.data.get('mobile')
        code = request.data.get('code')
        print(mobile,code)
        if not mobile or not code:
            return Response({'error': '手机号和验证码必须提供'}, status=status.HTTP_400_BAD_REQUEST)

        # 验证验证码
        verification_status = self.check_code(mobile, code)
        error_messages = {
            1: "验证码过期",
            2: "验证码错误",
            3: "用户不存在",
        }

        if verification_status != 0:
            return Response({'error': error_messages[verification_status]}, status=status.HTTP_400_BAD_REQUEST)

        # 找到用户
        try:
            user = User.objects.get(mobile=mobile)
        except User.DoesNotExist:
            return Response({'error': '用户不存在'}, status=status.HTTP_404_NOT_FOUND)

        # 生成 JWT Token
        from rest_framework_simplejwt.tokens import RefreshToken
        refresh = RefreshToken.for_user(user)
        access_token = str(refresh.access_token)  # 获取访问 token

        # 返回用户信息和 token
        response_data = {
            'access': str(access_token),
            'refresh':str(refresh),
        }

        return Response(response_data, status=status.HTTP_200_OK)


class CustomBackend(ModelBackend):
    """
    自定义用户验证
    """
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username)|Q(mobile=username))
            # print("已经进入到了逻辑")
            if user.check_password(password):
                return user
        except Exception as e:
            print(e)
            return None
from .filter import VerifyCodeFilter,ListUserProfileFilter
class SMSCodeViewset(mixins.CreateModelMixin,viewsets.GenericViewSet):
    """
      发送短信验证码
    """
    queryset =  VerifyCode.objects.all()
    serializer_class = VerifyCodeSerializer
    # authentication_classes = [JWTAuthentication,]
    # permission_classes = [IsAuthenticated]
    pagination_class = StandardResultsSetPagination
    filterset_class = VerifyCodeFilter
    ordering_fields = ['add_time']
    search_fields = ['mobile','add_time']
    def generate_code(self):
        """
        生成验证码
        """
        seeds='1234567890'
        random_str = []
        for i in range(6):
   
            random_str.append(choice(seeds))
        return ''.join(random_str)
    
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        mobile = serializer.validated_data['mobile']
        yunpian = HuYiMessage(API_KEY)
        code = self.generate_code()
        statu = yunpian.send_sms(code=code, mobile=mobile)
         # 保存到数据库（send_time 自动生成）
        if statu == None:
          return Response({"message": "接口失效"})
        elif statu['SubmitResult']['code'] == '2':
            VerifyCode.objects.create(mobile=mobile, code=code)
            return Response({"success": True, "message": statu['SubmitResult']['msg'], "mobile": mobile}, status=status.HTTP_200_OK)
        else:
        #      返回自定义响应
            return Response({"success": False, "message": statu['SubmitResult']['msg'], "mobile": mobile})
        
from .serializers import UserRegSerializer
class UserViewSet(mixins.CreateModelMixin,mixins.RetrieveModelMixin,viewsets.GenericViewSet):
    """ 
    用户
    """       
    serializer_class = UserRegSerializer
    queryset = User.objects.all()

    authentication_classes = (JWTAuthentication, authentication.SessionAuthentication )

    def get_serializer_class(self):
        if self.action == "retrieve":
            return UserDetailSerializer
        elif self.action == "create":
            return UserRegSerializer

        return UserDetailSerializer

    # permission_classes = (permissions.IsAuthenticated, )
    def get_permissions(self):
        if self.action == "retrieve":
            return [permissions.IsAuthenticated()]
        elif self.action == "create":
            return []

        return []

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data['username'])  # 传递整个 request.data
        serializer.is_valid(raise_exception=True)
        print(serializer)
        user = self.perform_create(serializer)
        from rest_framework_simplejwt.tokens import RefreshToken

        re_dict = serializer.data
        refresh = RefreshToken.for_user(user)  # 使用 RefreshToken 生成 token
        access_token = str(refresh.access_token)  # 获取访问 token
         
    # 返回包含 token 的响应数据
        re_dict["token"] = access_token
        re_dict["name"] = user.name if user.name else user.username
        re_dict["status"] =status.HTTP_201_CREATED
        print(re_dict)
        user_desc = ListUserProfile.objects.create(user=user)
        user_desc.save()
        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    def get_object(self):
        return self.request.user

    def perform_create(self, serializer):
        return serializer.save()
    
class UserProfileListViewSet(mixins.ListModelMixin,viewsets.GenericViewSet,mixins.UpdateModelMixin):
    """
    供展示用的用户资料
    """
    queryset = ListUserProfile.objects.all()
    serializer_class = UserProfileListSerializer
    filterset_class = ListUserProfileFilter
    def check_code(self,mobile,value):
       #print('验证码验证')
       Verify_record = VerifyCode.objects.filter(mobile=mobile).order_by('-add_time')
       #print(Verify_record)
       if Verify_record:
        last_code = Verify_record[0] 
        
        # 去除 last_code.add_time 的时区信息，使其成为 naive datetime
        last_code_time = last_code.add_time.replace(tzinfo=None)
        
        # 获取当前时间并减去 5 分钟，得到 naive datetime
        five_minutes_ago = datetime.now() - timedelta(minutes=5)

        # 比较
        if last_code_time < five_minutes_ago:
            return 1
        elif last_code.code != value:
            return 2
        else:
            #print('验证码正确')
            return 0
       else:
        print("Luoji")
        return 3
       
    def get_object(self):
        # 获取URL中传入的user_id
        user_id = self.kwargs.get('pk')

        try:
            return ListUserProfile.objects.get(user_id=user_id)
            # return UserProfile.objects.get(id=user_id)
        except ListUserProfile.DoesNotExist:
            from rest_framework.exceptions import NotFound
            raise NotFound("No UserProfile matches the given query.")   
    def update(self, request, *args, **kwargs):
        code = request.data.get('verificationCode')
        mobile = request.data.get('phone')
        print(mobile,code)
        if code:
            
            """
            验证验证码
            """
            verification_status = self.check_code(mobile, code)
            error_messages = {
            1: "验证码过期",
            2: "验证码错误",
            3: "用户不存在",
          }

            if verification_status != 0:
              return Response({'error': error_messages[verification_status]}, status=status.HTTP_400_BAD_REQUEST)
            
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        user_instance = User.objects.get(id=self.kwargs.get('pk'))  # 外键指向User模型
        print(user_instance)
        # 更新与UserProfile相关的数据
        data_to_update = request.data.copy()

        # 1. 如果需要修改User模型（如username、email等），可以在此进行
        if 'username' in data_to_update:
            user_instance.username = data_to_update.get('username')
            user_instance.name = data_to_update.get('username')
        if 'email' in data_to_update:
            user_instance.email = data_to_update.get('email')
        if 'phone' in data_to_update:
            user_instance.mobile = data_to_update.get('phone')
        if 'newPassword' in data_to_update:
            user_instance.set_password(data_to_update.get('newPassword') )
        
        # 2. 如果需要修改UserProfile（如desc等），可以直接更新
        if 'bio' in data_to_update:
            instance.desc = data_to_update.get('bio')
        
        # 保存更新后的User实例和UserProfile实例
        user_instance.save()
        instance.save()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)


        
        
    