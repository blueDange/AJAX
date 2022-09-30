// 封装发送ajax函数
// options接收传递的对象
// option.type  请求的方法
// option.url    接口地址
// options.async   是否为异步
// options.data    传递给接口的参数,需要转为查询字符串

// options.success  是一个函数,作为回调函数,用于获取结果,结果在回调函数的参数中
function request(options) {
    console.log(options.data)
    // 将传递给接口的参数转为查询字符串
    var arr = []
    for (var k in options.data) {
        // k  options.data[k]
        // console.log(k+ '='+options.data[k]);
        // 把每组拼接放入到数组
        arr.push(k + '=' + options.data[k])
    }
    // 把数组转为字符串,用&分隔
    var params = arr.join('&')
    console.log(params)
    // 如果没有传递是否为异步,设置默认为异步
    options.async = options.async || true
    // 创建HTTP请求对象
    var xhr = new XMLHttpRequest()

    // 将请求方法转为大写
    var method = options.type.toUpperCase()
    // 判断请求方法，GET 和DELETE西相同 ，PUT 和 POST 相同
    if (method === 'GET' || method === 'DELETE') {
        // 打开服务器连接，请求接口
        xhr.open(method, options.url + '?' + params, options.async)
        xhr.send()
    } else if (method === 'PUT' || method === 'POST') {
        // 打开服务器连接，请求接口
        xhr.open(method, options.url, options.async)
        // 设置请求的内容内型
        xhr.setRequestHeader(
            'Content-Type',
            'application/x-www-form-urlencoded;charset=utf-8'
        )
        // 发送请求，将参数放入到请求主体
        xhr.send(params)
    }
    // 添加事件，监听响应
    xhr.onload = function () {
        // 将响应主体 传递到外部
        // 将JSON转为js
        options.success(JSON.parse(xhr.responseText))
    }
}

/* request({
    type: 'GEt',
    url: 'http://127.0.0.1:3000/v1/emps',
    async: true,
    data: {
        eid: 6,
        a: 1,
        b: 2
    },
    success: function(res) {
        console.log(res);
    }
})
 */
