import requests
import xmltodict
import json

class HuYiMessage(object):
    def __init__(self,api_key) -> None:
        self.account = "C32995067"
        self.api_key= api_key
        self.single_send_url = "https://106.ihuyi.com/webservice/sms.php?method=Submit"

    def send_sms(self,code,mobile):
         parmas = {
             "account":self.account,
             "password":self.api_key,
             "mobile":mobile,
             "content": f"您的验证码是：{code}。请不要把验证码泄露给其他人。"
         }
         content = requests.post(self.single_send_url,data=parmas)
         dict_data = xmltodict.parse(content.text)
    # 将字典转换为JSON格式
         data = json.dumps(dict_data, ensure_ascii=False, indent=4)
         redict = json.loads(data)
         print(redict)
         return redict

"""
测试入口
"""
if __name__ == '__main__':
    yunpian = HuYiMessage("7f414a15e543f19a54311eece1991f94")
    yunpian.send_sms("123456","18013268019")