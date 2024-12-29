import { mock } from 'mockjs';
// mockjs 拦截axios请求，给每一个请求写一个mock规则，不用写接口也可以跑前端，在发请求之前把mock的拦截写上
// mock("/.*?\/user/login", "post", {
//     code: 0,
//     data: {
//         "id|+1": 1,
//         name: "@cname",
//         "age|16-23": 1,
//     },
//     msg: "登录成功"
// })

mock("/user/login", "post", function (option) {
    console.log(option);
    return {
        code: 0,
        data: {
            "id|+1": 1,
            "name": "@cname",
            "age|16-23": 1,
            "addr": "@city(true)"
        },
        msg: "登录测试成功"
    }
})