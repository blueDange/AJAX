 // 引入express 模块
const express = require('express')
const cors=require('cors')
// 引入mysql模块
const mysql = require('mysql')
// 创建WEB服务器
const app = express()
// 设置端口
app.listen(3000, () => {
    console.log('成功');
})
app.use(cors() )
// 创建连接池对象
const pool = mysql.createPool({
    host: '127.0.0.1',
    port: '3306',
    user: 'root',
    database: 'tedu',
    connectionLimit: 15,
    // 开启一次执行多个SQL命令
    multipleStatements: true
})

app.use(express.static('public'))

// 添加路由 (get /emp),监听按钮提交的请求
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法 ：get

app.get('/v1/emps', (req, res) => {
    // 获取get传递的参数
    var obj = req.query
    console.log(obj);
    // 执行SQL命令
    pool.query('select * from emp where eid=?', [obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r);
        // 判断查询是否成功，如果结果是空数组说明该员工不存在、否则查询成功过
        if (r.length === 0) {
            res.send({
                code: 400,
                msg: '该员工不存在'
            })
        } else {
            // 接口规范，返回的结果是对象，包含有状态码（人为规定），消息说明;如果需要返回数据，添加查询的数据
            res.send({
                code: 200,
                msg: '查询成功',
                data: r
            })
        }
    })
})
// query属于异步操作，需要把响应的结果放入到回调函数 


// 练习：在public下添加add.html，点击提交 编写添加员工的接口（post /v1/emps）,获取传递的参数，执行SQL命令，将数据插入到数据表emp，最后响应{code:200,msg:'员工添加成功'}

// 将post传递参数转为对象
app.use(express.urlencoded({
    extended: true
}))
// 添加员工接口(post /v1/emps )
app.post('/v1/emps', (req, res) => {
    // 获取post传递的参数
    var obj = req.body
    console.log(obj);
    // 执行SQL命令，将数据插入到数据库
    pool.query('insert into emp set ?', [obj], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r);
    })
    res.send({
        code: 200,
        msg: '员工添加成功'

    })
})

// 练习：添加删除员工的接口（delete /v1/emps), get 传递员的编号，执行SQL命令，删除编号对应的员工

// 使用APIPost，新建接口，测试删除员工
// 删除员工接口（delete /v1/emps) 
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：delete

app.delete('/v1/emps/:eid', (req, res) => {
    // 获取parmas传递的参数
    var obj = req.params
    console.log(obj);
    // 执行SQL命令，删除编号对应的员工
    pool.query('delete from emp where eid=?', [obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r);
        // 删除结果是对象，判断对象下affectedRows值
        // 判断是否删除成功
        if (r.affectedRows === 0) {
            res.send({
                code: 400,
                msg: '删除失败'
            })
        } else {
            res.send({
                code: 200,
                msg: '删除成功'
            })
        }
    })

})


// 练习：添加修改员工数据接口，(put  /v1/emps),post 传递的值有编号（修改条件），姓名、性别、生日、工资、部门；获取post传递参数，执行SQL命令，修改编号对应的员工，如果修改失败响应{code:400,msg:'修改失败'}，否则{code:200,msg:'修改成功'}

// 修改员工接口接口(put /v1/emps)
// 接口地址：http://127.0.0.1:3000/v1/emps
// 请求方法：put

app.put('/v1/emps', (req, res) => {
    // 获取post传递的参数
    var obj = req.body
    console.log(obj);
    pool.query('update emp set ? where eid= ?', [obj, obj.eid], (err, r) => {
        if (err) {
            throw err
        }
        console.log(r);

        // 成功结果是对象，如果对象下的changeRows值为0 说明修改失败，否则修改成功
        if (r.changedRows === 0) {
            res.send({
                code: 400,
                msg: '修改失败'
            })
        } else {
            res.send({
                code: 200,
                msg: '修改成功'
            })
        }
    })



})


// 练习：添加员工列表接口，(get  /v1/emps/list),get 传递当前的页码pno和每页的数据量count，执行SQL命令，进行分页查询；最后响应(code:200,msg:'查询成功'data：查询的数据)

// 修改员工接口接口(get /v1/emps/list)
// 接口地址：http://127.0.0.1:3000/v1/emps/list
// 请求方法：get
app.get('/v1/emps/list', (req, res) => {
    // 获取get传递的参数
    var obj = req.query
    console.log(obj);
    // 如果页码为空，设置默认值为1
    if (!obj.pno) {
        obj.pno = 1
    }
    // 如果每页的数据量为空，设置默认值为5
    if (!obj.count) {
        obj.count = 5
    }
    // 计算每页开始查询的值
    var start = (obj.pno - 1) * obj.count
    // 将每页数量量转为文字
    var size = parseInt(obj.count)
    // 执行分页查询 1.分页查询 2.查询总数据量
    pool.query('select eid,ename from emp limit ? ,?;select count(eid) as sum from emp', [start, size], (err,
        r) => {
        if (err) {
            throw err
        }
        console.log(r);
        // 结果是一个二维数组
        // 总数据量
        var t = r[1][0].sum
        // 计算总页数=总数据量/每页现实的数据量
        // 要对结果向上取整

        var p = Math.ceil(t / obj.count)
        res.send({
            code: 200,
            msg: '查询成功',
            data: r[0],
            total: t,
            pages: p,
            pno: obj.pno
        })
    })
    console.log(obj);

})
