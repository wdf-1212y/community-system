//引入express模块
const express=require('express');
//引入pool.js
const pool=require('../pool.js');
//创建路由对象
const r=express.Router();

//1.居民注册接口
//地址:127.0.0.1:3000/v1/resident/reg
//请求方式:post
r.post('/reg',(req,res)=>{
  //获取参数
  var obj=req.body
  // console.log(obj)
  //验证不能为空
	if(!obj.rname){
		res.send({code:401,msg:'rname不能为空'})
		return;
	}else if(!obj.rpassword){
		res.send({code:402,msg:'rpassword不能为空'})
		return;
	}
  pool.query('insert into cs_resident set ?',[obj],(err,result)=>{
    if(err){
      throw err
    }
    console.log(result)
    res.send({code:200,msg:'居民添加成功'})
  })
});
//2.居民登录接口
//地址:127.0.0.1:3000/v1/resident/login
//请求方式:post
r.post('/login',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  if(!obj.rname){
		res.send({code:401,msg:'rname不能为空'})
		return;
	}else if(!obj.rpassword){
		res.send({code:402,msg:'rpassword不能为空'})
		return;
	}
  pool.query('select * from cs_resident where rname=? and rpassword=?',[obj.rname,obj.rpassword],(err,result)=>{
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
//3.居民角色接口
//地址:127.0.0.1:3000/v1/resident/
//请求方式:delete
r.delete('/:rid',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('delete from cs_resident where rid=?',[obj.rid],(err,result)=>{
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
//4.查找居民接口
//地址:127.0.0.1:3000/v1/resident/info
//请求方式:get
r.get('/info/:rname',(req,res)=>{
  var obj=req.params
  console.log(obj)
  pool.query('select * from cs_resident where rname=?',[obj.rname],(err,result)=>{
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

r.get('/infi/:rname',(req,res)=>{
  var obj=req.params
  pool.query('select rid from cs_resident where rname=?',[obj.rname],(err,result)=>{
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

//5.修改居民接口
//地址:127.0.0.1:3000/v1/resident/info
//请求方式:put
r.put('/info',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  pool.query('update cs_resident set rname=?,rpassword=? where rid=?',[obj.rname,obj.rpassword,obj.rid],(err,result)=>{
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