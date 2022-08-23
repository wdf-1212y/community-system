//引入express模块
const express=require('express');
//引入pool.js
const pool=require('../pool.js');
//创建路由对象
const r=express.Router();

//1.志愿者注册接口
//地址:127.0.0.1:3000/v1/volunteer/reg
//请求方式:post
r.post('/reg',(req,res)=>{
  //获取参数
  var obj=req.body
  // console.log(obj)
  //验证不能为空
	if(!obj.vname){
		res.send({code:401,msg:'vname不能为空'})
		return;
	}else if(!obj.vpassword){
		res.send({code:402,msg:'vpassword不能为空'})
		return;
	}
  pool.query('insert into cs_volunteer set ?',[obj],(err,result)=>{
    if(err){
      throw err
    }
    console.log(result)
    res.send({code:200,msg:'志愿者添加成功'})
  })
});
//2.志愿者登录接口
//地址:127.0.0.1:3000/v1/volunteer/login
//请求方式:post
r.post('/login',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  if(!obj.vname){
		res.send({code:401,msg:'vname不能为空'})
		return;
	}else if(!obj.vpassword){
		res.send({code:402,msg:'vpassword不能为空'})
		return;
	}
  pool.query('select * from cs_volunteer where vname=? and vpassword=?',[obj.vname,obj.vpassword],(err,result)=>{
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

//
r.get('/inf/:vid',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('select * from cs_volunteer where vid=?',[obj.vid],(err,result)=>{
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
//3.志愿者角色接口
//地址:127.0.0.1:3000/v1/volunteer/
//请求方式:delete
r.delete('/:vid',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('delete from cs_volunteer where vid=?',[obj.vid],(err,result)=>{
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
//4.模糊查找志愿者接口
//地址:127.0.0.1:3000/v1/volunteer/info
//请求方式:get
r.post('/info',(req,res)=>{
  var obj=req.body
  let a='%'+obj.search+'%'
  console.log(a)
  pool.query('select * from cs_volunteer where vname like ?',[a],(err,result)=>{
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


//5.修改志愿者接口
//地址:127.0.0.1:3000/v1/volunteer/info
//请求方式:put
r.put('/info',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  pool.query('update cs_volunteer set vname=?,vpassword=? where vid=?',[obj.vname,obj.vpassword,obj.vid],(err,result)=>{
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
//6.查询志愿者接口
//地址:127.0.0.1:3000/v1/volunteer/infos
//请求方式:get
r.get('/infos',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('select * from cs_volunteer',[obj.vid],(err,result)=>{
    if(err){
      throw err
    }
    if(result.length===0){
			res.send({code:501,msg:'查询失败'});
		}else{
			res.send({code:200,msg:'查询成功',data:result});
		}
  })
})

//暴露路由器对象
module.exports=r