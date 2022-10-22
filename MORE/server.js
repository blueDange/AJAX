// 1. 引入express
const { json } = require("express");
const express = require("express");

// 2. 创建对应对象
const app = express();

// 3. 创建路由规则
// request 是对请求报本的封装
// response 是对响应报文的封装
app.get("/get-server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");

  // 设置响应
  response.send("Hello Wrold GET");
});

// all 可以接收任意类型的请求
app.post("/post-/server", (request, response) => {
  // 设置响应头
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");

  // 设置响应
  response.send("Hello Wrold POST");

  //   const data = {
  //     name: "blueDange",
  //   };
  // 对对象进行字符串转换
});

app.all("/json-server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");
  // 响应一个数据
  const data = {
    name: "blueDange",
  };
  // 对对象进行字符串转换
  let str = JSON.stringify(data);

  // 设置响应
  response.send(str);
});

app.all("/server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");
  // // 响应一个数据
  // const data = {
  //   name: "blueDange",
  // };
  // // 对对象进行字符串转换
  // let str = JSON.stringify(data);

  // 设置响应
  response.send("Hello AJAX");
});

// app.all("/delay", (request, response) => {
//   // 设置响应头  设置允许跨域
//   response.setHeader("Access-Control-Allow-Origin", "*");
//   // response.setHeader("Access-Control-Allow-Headers", "*");
//   // 设置响应
//   setTimeout(() => {
//     // 设置响应体
//     response.send("Hello AJAX Delay");
//   }, 3000);
// });

app.get("/delay", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  // response.setHeader("Access-Control-Allow-Headers", "*");
  // 设置响应
  setTimeout(() => {
    // 设置响应体
    response.send("Hello AJAX Delay");
  }, 3000);
});

// JQuery 服务
app.all("/jquery-server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");
  // 设置响应
  // 设置响应体
  const data = {
    name: "blueDange",
  };
  // response.send("Hello JQuery");
  response.send(JSON.stringify(data));
});

// axios 服务
app.all("/axios-server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");
  // 设置响应
  // 设置响应体
  const data = {
    name: "blueDange",
  };
  // response.send("Hello JQuery");
  response.send(JSON.stringify(data));
});

// fetch 服务
app.all("/fetch-server", (request, response) => {
  // 设置响应头  设置允许跨域
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.setHeader("Access-Control-Allow-Headers", "*");
  // 设置响应
  // 设置响应体
  const data = {
    name: "blueDange",
  };
  // response.send("Hello JQuery");
  response.send(JSON.stringify(data));
});

// 4. 监听端口启动服务
app.listen(8000, () => {
  console.log("服务器已经启动,8000端口监听中...");
});
