import axios from 'axios';
import request from '../utils/request';  // 引入封装好的 axios 请求

const host = 'http://127.0.0.1:8000'//请求接口，本地请求，可根据实际需求替换成后端服务器请求地址
// 定义接口请求
const api = {
  // 发送验证码
  sendCode: (mobile) => {
    return request.post(`${host}/codes/`, { mobile });
  },
  // 验证验证码
  verifyCode: (phone, code) => {
    return request.post('/user/verifyCode', { phone, code });
  },
  // 登录接口1
  login1: (username,password) => {
    return request.post(`${host}/login1/`,{username,password});
  },//在这里定义了两套登录方式的接口，一种是使用用户名和密码登录，另一种是使用手机号码和验证码登录
  // 登录接口2
  login2: (mobile, code) => {
    return request.post(`${host}/login2/`,{mobile,code});
  },
   //请求详情接口
// 带参数的 GET 请求
  getDetail: (id) => {
  // 如果传入 id，则在 URL 中附加该 id 作为查询参数
  const url = id ? `${host}/fish/?id=${id}` : `${host}/fish/`;
  return request.get(url);
},
  // 请求轮播图接口
  getBanners: (id) => {
    const url = id ? `${host}/banner/?name=${id}` : `${host}/banner/`;
    return request.get(url);
  },

//第一种登录方式，前端传输样式类似于{username:xxx,password:xxx,code:'',mobile:''},第二种登录方式：{username:'',password:'',code:xxx,mobile:xxx}
  getCategories:()=>{
    return request.get(`${host}/category/`);
  },

  //获取用户名接口
  getUsername: (id) => {
    return request.get(`${host}/users/${id}/`);
  },
  // 注册接口
  register: (username,mobile,code,password) => {
    return request.post(`${host}/users/`, {username,mobile,code,password});
  },

  //水池信息接口
  getPoolInfo: ()=>{
    return request.get(`${host}/waterpool/`);
  },
  //获取用户个人中心信息接口
  UserProfile:(user_id) =>{
    return request.get(`${host}/userprofile/?user_id=${user_id}`);
  },
  //更新用户个人中心信息接口
  UpdateUserProfile:(user_id,playload)=>{
    return request.put(`${host}/userprofile/${user_id}/`,playload);
  },
  imgRecognition: (avatar, user_name) => {
    // 创建 FormData 实例
    const formData = new FormData();
    formData.append('avatar', avatar); // 添加文件
    formData.append('user_name', user_name); // 添加其他字段
  
    // 使用 request 发送 POST 请求
    return request.post(`${host}/imagesearch/`, formData, {
      headers: {
        'Content-Type': 'multipart/form-data', // 确保请求头设置为 multipart/form-data
      },
    });
  },
  
  
};

export default api;
