//引入express模块
const express=require('express');
//引入pool.js
const pool=require('../pool.js');
//创建路由对象
const r=express.Router();

//1.添加购物信息接口
//地址:127.0.0.1:3000/v1/shop/reg
//请求方式:post
r.post('/reg',(req,res)=>{
  //获取参数
  var obj=req.body
  // console.log(obj)
  pool.query('insert into cs_shop (rid,gid) values (?,?)',[obj.rid,obj.gid],(err,result)=>{
    if(err){
      throw err
    }
    console.log(result)
    res.send({code:200,msg:'购物车添加成功'})
  })
});

//暴露路由器对象
module.exports=r