//引入express模块
const express=require('express');
//引入pool.js
const pool=require('../pool.js');
//创建路由对象
const r=express.Router();

//1.管理员注册接口
//地址:127.0.0.1:3000/v1/admin/reg
//请求方式:post
r.post('/reg',(req,res)=>{
  //获取参数
  var obj=req.body
  // console.log(obj)
  //验证不能为空
	if(!obj.admin_name){
		res.send({code:401,msg:'admin_name不能为空'})
		return;
	}else if(!obj.password){
		res.send({code:402,msg:'password不能为空'})
		return;
	}
  pool.query('insert into cs_admin set ?',[obj],(err,result)=>{
    if(err){
      throw err
    }
    console.log(result)
    res.send({code:200,msg:'管理员添加成功'})
  })
});
//2.管理员登录接口
//地址:127.0.0.1:3000/v1/admin/login
//请求方式:post
r.post('/login',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  if(!obj.admin_name){
		res.send({code:401,msg:'admin_name不能为空'})
		return;
	}else if(!obj.password){
		res.send({code:402,msg:'password不能为空'})
		return;
	}
  pool.query('select * from cs_admin where admin_name=? and password=?',[obj.admin_name,obj.password],(err,result)=>{
    if(err){
      throw err
    }
    if(result.length!=0){
      res.send({code:200,msg:'登录成功'})
    }else{
      res.send({code:501,msg:'登录失败'})
    }
  })
});
//3.管理员角色接口
//地址:127.0.0.1:3000/v1/admin/
//请求方式:delete
r.delete('/:aid',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('delete from cs_admin where aid=?',[obj.aid],(err,result)=>{
    if(err){
      throw err
    }
    if(result.affectedRows===0){
      res.send({code:501,msg:'删除失败'})
    }else{
      res.send({code:200,msg:'删除成功'})
    }
  })
});
//4.查找管理员接口
//地址:127.0.0.1:3000/v1/admin/info
//请求方式:get
r.get('/info/:admin_name',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('select * from cs_admin where admin_name=?',[obj.admin_name],(err,result)=>{
    if(err){
      throw err
    }
    if(result.length===0){
      res.send({code:501,msg:'查找失败'})
    }else{
      res.send({code:200,msg:'查找成功',data:result})
    }
  })
})
//5.修改管理员接口
//地址:127.0.0.1:3000/v1/admin/info
//请求方式:put
r.put('/info',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  pool.query('update cs_admin set admin_name=?,password=? where aid=?',[obj.admin_name,obj.password,obj.aid],(err,result)=>{
    if(err){
      throw err
    }
    if(result.affectedRows===0){
      res.send({code:501,msg:'修改失败'})
    }else{
      res.send({code:200,msg:'修改成功',data:result})
    }
  })
})

//暴露路由器对象
module.exports=r