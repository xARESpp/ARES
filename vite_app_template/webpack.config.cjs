const path = require('path') // 引用path模块
module.exports = {  // 这里是commrnt.js语法
    // 入口文件
    entry:"./src/main.js",
    // 打包后的出口文件
    output:{
        // 输出的路径  是绝对路径(导入path模块) 这里是用node来做的
        path:path.resolve(__dirname,'build'),
        // 输出的文件名称
        filename:'build.js',
    },
    //配置webpack开发服务功能
    devServer:{
    contentBase: "./src", //本地服务器所加载的页面所在的目录
    host: "localhost",
    inline: true, //实时刷新
    compress: true,
    port: 8080,
    },
    mode:"development"
}
