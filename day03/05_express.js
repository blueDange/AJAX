
const express= require('express')

const cors= require('cors')

const app= express()

app.listen(3000)

app.use(cors())

// 托管静态资源到public目录
app.use(express.static('public')) 