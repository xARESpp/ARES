import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/api/login/',
    method: 'post',
    data
  })
}

export function getUserInfo() {
  return request({
    url: '/api/user/info/',
    method: 'get'
  })
}

export function logout() {
  return request({
    url: '/api/logout/',
    method: 'post'
  })
} 