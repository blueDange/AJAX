const express = require('express')
// 引入cosr 模块 ，解决跨域
const cors = require('cors')
// 创建WEB服务器
const app = express()
// 使用模块
app.use(cors())

app.listen(3000)
// 添加路由 (get /index)
// 接口：http://127.0.0.1:3000/index
// 请求方法：get
app.get('/index', (req, res) => {
    /* res.send({
	  code: 200,
	  msg: '新闻分类',
	  data: [{
			  cid: 30,
			  title: '业界资讯'
		  },
		  {
			  cid: 20,
			  title: '产品咨询'
		  },
		  {
			  cid: 10,
			  title: '公司动态'
		  }
	  ]
  }) */
    // 设置响应的主体
    res.send('这是首页')
})
/* // 托管到静态资源到public
app.use(express.static('public'))

app.use(express.urlencoded({
	extended:true
}))
// 将post传参转为对象
// 将请求内容类型为application/x-www-form-urlencoded转为对象
app.use(express.urlencoded({
	extended:true
}))
// 创建路由 (post /mylogin),监听按钮提交请求
app.post('/mylogin',(req,res)=>{
	// 获取传递参数
	var obj=req.body
	console.log(obj);
	res.send('响应成功:')
}) */
