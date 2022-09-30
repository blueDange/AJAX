// 引入express模块
const express = require('express')
// 引入cors模块
const cors = require('cors')
// 创建WEB服务器
const app = express()
// 设置端口
app.listen(3000)
// 使用cors模块，解决跨域
app.use(cors())

// 添加路由 (get /num)
// 接口地址:http://127.0.0.1:3000/num
app.get('/num', (req, res) => {
    // 响应一个随机数
    var s = Math.random() + ''
    if (s < 0.5) {
        res.send(`${s} 0.5以下`)
    } else {
        res.send(`${s} 0.5以上`)
    }
})
