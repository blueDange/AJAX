const express = require('express');
// 引入cosr模块
const cors = require('cors');
const app = express();
app.listen(3000, () => {
	console.log('服务器搭建成功');
});
// 使用cors模块,解决跨域
app.use(cors());
// 添加路由(get /num)
app.get('/num', (req, res) => {
	res.send(Math.random() + '');
});
