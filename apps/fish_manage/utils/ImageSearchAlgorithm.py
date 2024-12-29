"""
本算法采用自设计的二轮匹配算法
在第一轮匹配中，根据得分优先精准匹配
第二轮匹配，采用分词关键词进行匹配，提高匹配精度(为了匹配大类)
分词匹配中，匹配以鱼结尾的关键词
剩余关键词进行精准匹配

"""

import jieba

# from fish_manage.models import FishGroup,FishCategory
import re

import sys
import os

# 将项目根目录添加到 sys.path 中
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../')))

import django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "FishManage.settings")
django.setup()

from apps.fish_manage.models import FishGroup



IMAGE_API_KEY = ""#百度图片API_KEY

IMAGE_SECRET_KEY = ""#百度图片SECRET_KEY
"""
这是图像搜索，基于百度接口
"""

import base64
import urllib
import requests
import sys,os
from django.core.files.uploadedfile import InMemoryUploadedFile


class ImageSearchApi(object):
    def __init__(self, API_KEY, SECRET_KEY)->None:
        self.API_KEY = API_KEY
        self.SECRET_KEY = SECRET_KEY
    def get_content_base64(self, image_path,urlencode):
         """
         读取图片，并将其转化为base64编码
          :param image_path: 图片路径
          :param urlencode: 是否进行urlencode
          :return: base64编码后的图片
          """
         if isinstance(image_path, InMemoryUploadedFile):
        # 如果是InMemoryUploadedFile，直接读取其内容
               image_content = image_path.read()
         else:
        # 否则假定传入的是文件路径，打开文件读取
            with open(image_path, 'rb') as f:
                image_content = f.read()

    # 转换成base64编码
         base64_data = base64.b64encode(image_content).decode('utf-8')

    # 如果需要urlencode，则进行URL编码
         if urlencode:
             base64_data = urllib.parse.quote_plus(base64_data)

         return base64_data
      
    def get_access_token(self):
      """
      使用 AK，SK 生成鉴权签名(Access Token)
      :return: access_token，或是None(如果错误)
      """
      url = "https://aip.baidubce.com/oauth/2.0/token"
      params = {"grant_type": "client_credentials", "client_id": self.API_KEY, "client_secret": self.SECRET_KEY}
      return str(requests.post(url, params=params).json().get("access_token"))
    
    def RequestServe(self, image_path):
        """
          图像搜索请求，返回搜索结果
          :param image_path: 图片路径
          :param urlencode: 是否进行urlencode
          :return: 搜索结果
        """
        urlencode = True
        access_token = self.get_access_token()
        url =  "https://aip.baidubce.com/rest/2.0/image-classify/v1/animal?access_token=" + access_token
        image_content = self.get_content_base64(image_path, urlencode)
        payload = 'image='+image_content
        headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
         }
    
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.json()['result']
    

class ImageSearchAlgorithm(object):
    def __init__(self,API_KEY,SECRET_KEY,image_url):
        self.api = ImageSearchApi(API_KEY,SECRET_KEY)
        self.res = None
        self.image_url = image_url

    def get_res(self):
        """
        结果获取
        """
        self.res = self.api.RequestServe(self.image_url)
        return self.res;
   
    # 对每条鱼的名称进行分词
    def segment_fish_names(self,results):
     segmented_results = []
    
     for fish in results:
        # 对每条鱼的名称进行分词
        words = list(jieba.cut(fish))
        segmented_results.append(words)
     
     print(segmented_results)
    
     return segmented_results
    def match(self):
        """
        匹配算法
        """
        # 第一轮匹配
        self.get_res()
        names =[]
        for e in self.res:
            name = e['name']
            names.append(name)
            if not FishGroup.objects.filter(name=name).exists():
                continue
            else:
                return name
        # 第二轮匹配，分词匹配
        print(names)
        segment =[]
        segment =self.segment_fish_names(results = names) #分词
        leave_words = []
        pattern = r'^.+鱼$'
        for words in segment:
           for word in words: 
            if re.match(pattern, word):
                print(word)
                if FishGroup.objects.filter(name=word).exists():
                    return word
            else:
                leave_words.append(word)
                continue
        # 剩余关键词进行精准匹配
        for word in leave_words:
            if FishGroup.objects.filter(name=word).exists():
                return word
            # 未匹配到，返回None
        return None
    
if __name__ == '__main__':

 test = ImageSearchAlgorithm(IMAGE_API_KEY,IMAGE_SECRET_KEY,r'D:\FishManage\media\banners\yu\黑鳍金枪鱼\微信图片_20241204214026.jpg')
#测试代码
 print(test.match())

    

        