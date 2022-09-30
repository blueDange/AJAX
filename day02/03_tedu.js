// 引入express模块
const express = require('express')
// 引入cors模块
const cors = require('cors')
// 引入mysql模块
const mysql = require('mysql')
// 创建WEB服务器
const app = express()
// 设置端口
app.listen(3000, () => {
    console.log('服务器启动成功')
})
// 使用cors解决跨域
app.use(cors())
// 创建连接池对象
const pool = mysql.createPool({
    host: '127.0.0.1',
    port: '3306',
    user: 'root',
    password: '',
    database: 'tedu',
    connectionLimit: 15,
    // 开启一次执行多个SQL命令
    multipleStatements: true,
})
// 托管静态资源
app.use(express.static('public'))
// 添加路由(get /emp)，监听按钮提交的请求
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：get
app.get('/v1/emps', (req, res) => {
    // 获取get传递的参数
    var obj = req.query
    console.log(obj)
    // 执行SQL命令
    pool.query('select * from emp where eid=?', [obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r)
        // 判断查询是否成功，如果结果是空数组说明该员工不存在，否则查询成功
        if (r.length === 0) {
            res.send({ code: 400, msg: '该员工不存在' })
        } else {
            // 接口规范，返回的结果是对象，包含有状态码(人为规定)，消息说明;如果需要返回数据，添加查询的数据
            res.send({ code: 200, msg: '查询成功', data: r })
        }
    })
    // query属于异步操作，需要把响应的结果放入到回调函数的内部
})

// 将post传递参数转为对象
app.use(
    express.urlencoded({
        extended: true,
    })
)
// 添加员工接口(post /v1/emps)
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：post
app.post('/v1/emps', (req, res) => {
    // 获取post传递的参数
    var obj = req.body
    console.log(obj)
    // 执行SQL命令，将数据插入到数据库
    pool.query('insert into emp set ?', [obj], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r)
        // 把成功的结果响应
        res.send({ code: 200, msg: '员工添加成功' })
    })
})

// 删除员工接口(delete /v1/emps)
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：delete
app.delete('/v1/emps/:eid', (req, res) => {
    // 获取params传递的参数
    var obj = req.params
    console.log(obj)
    // 执行SQL命令，删除编号对应的员工
    pool.query('delete from emp where eid=?', [obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r)
        // 删除结果是对象，判断对象下affectedRows值
        // 判断是否删除成功
        if (r.affectedRows === 0) {
            res.send({ code: 400, msg: '删除失败' })
        } else {
            res.send({ code: 200, msg: '删除成功' })
        }
    })
})

// 修改员工接口(put /v1/emps)
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：put
app.put('/v1/emps', (req, res) => {
    // 获取post传递的参数
    var obj = req.body
    console.log(obj)
    // 执行SQL命令
    pool.query('update emp set ? where eid=?', [obj, obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r)
        // 成功结果是对象，如果对象下的changedRows值为0说明修改失败，否则修改成功
        if (r.changedRows === 0) {
            res.send({ code: 400, msg: '修改失败' })
        } else {
            res.send({ code: 200, msg: '修改成功' })
        }
    })
})

// 员工列表接口(get /v1/emps/list)
// 接口地址：http://127.0.0.1:3000/v1/emps/list
// 请求方法：get
app.get('/v1/emps/list', (req, res) => {
    // 获取get传递的参数
    var obj = req.query
    console.log(obj)
    // 如果页码为空，设置默认值为1
    if (!obj.pno) {
        obj.pno = 1
    }
    // 如果每页数据量为空，设置默认值为5
    if (!obj.count) {
        obj.count = 5
    }
    console.log(obj)
    // 计算每页开始查询的值
    var start = (obj.pno - 1) * obj.count
    // 将每页数据量转为数字
    var size = parseInt(obj.count)
    // 执行SQL命令 1.分页查询 2.查询总数据量
    // 多个SQL命令之间用分号隔开
    pool.query(
        'select eid,ename from emp limit ?,?;select count(eid) as sum from emp',
        [start, size],
        (err, r) => {
            if (err) {
                throw err
            }
            console.log(r)
            // 结果是一个二维数组
            // 总数据量
            var t = r[1][0].sum
            // 计算总页数 = 总数据量/每页显示的数据量
            // 对结果进行向上取整
            var p = Math.ceil(t / obj.count)
            res.send({code: 200,msg: '查询成功',
                data: r[0],
                total: t,
                pages: p,
                pno: obj.pno,
            })
        }
    )
})
