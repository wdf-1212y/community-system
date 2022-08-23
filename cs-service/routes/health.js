//引入express模块
const express=require('express');
//引入pool.js
const pool=require('../pool.js');
//创建路由对象
const r=express.Router();

//1.添加健康登记信息接口
//地址:127.0.0.1:3000/v1/health/reg
//请求方式:post
r.post('/reg',(req,res)=>{
  //获取参数
  var obj=req.body
  // console.log(obj)
  pool.query('insert into cs_health set ?',[obj],(err,result)=>{
    if(err){
      throw err
    }
    console.log(result)
    res.send({code:200,msg:'健康信息添加成功'})
  })
});

//2.精确查询健康登记信息接口
//地址:127.0.0.1:3000/v1/health/info
//请求方式get
r.get('/info/:rname',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('select * from cs_health where rname=?',[obj.rname],(err,result)=>{
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

//3.修改健康登记信息接口
//地址:127.0.0.1:3000/v1/health/info
//请求方式:put
r.put('/info',(req,res)=>{
  var obj=req.body
  // console.log(obj)
  pool.query('update cs_health set ? where hid=?',[obj.hid],(err,result)=>{
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

//4.模糊查询健康登记信息接口
//地址:127.0.0.1:3000/v1/health/infos
//请求方式:get
r.get('/infos',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('select * from cs_health',[obj.hid],(err,result)=>{
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

//5.删除健康登记接口
//地址:127.0.0.1:3000/v1/health/
//请求方式:delete
r.delete('/:hid',(req,res)=>{
  var obj=req.params
  // console.log(obj)
  pool.query('delete from cs_health where hid=?',[obj.hid],(err,result)=>{
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


//暴露路由器对象
module.exports=r