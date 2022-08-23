//引入mysql模块
const mysql=require('mysql');
//连接池
const pool=mysql.createPool({
  host:'127.0.0.1',
  port:'3306',
  user:'root',
  password:'',
  database:'cs',
  connectionLimit:15,
})
//暴露连接池
module.exports=pool;