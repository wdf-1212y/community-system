//引入express模块
const express=require('express');
//引入cors模块
const cors=require('cors');
//引入管理员路由器模块
const adminRouter=require('./routes/admin.js');
//引入居民路由器模块
const residentRouter=require('./routes/resident.js');
//引入志愿者路由器模块
const volunteerRouter=require('./routes/volunteer.js');
//引入健康登记路由器模块
const healthRouter=require('./routes/health.js');
//引入一键报警路由器模块
const policeRouter=require('./routes/police.js');
//引入物资信息路由器模块
const goodsRouter=require('./routes/goods.js');
//引入饮食申请路由器模块
const dietRouter=require('./routes/diet.js');
//引入上门服务路由器模块
const serviceRouter=require('./routes/service.js');
//引入配送订单路由器模块
const orderRouter=require('./routes/order.js');
//引入新闻资讯路由器模块
const newsRouter=require('./routes/news.js');
//引入新闻资讯-右 路由器模块
//const newsRouter2=require('./routes/newsRgiht.js');
//引入论坛路由器模块
const forumRouter=require('./routes/forum.js');
//引入购物车路由器模块
const shopRouter=require('./routes/shop.js');


//创建服务器对象
const app=express();
//设置响应端口号
app.listen(3000,()=>{
  console.log('服务器响应成功,端口3000')
});
//跨域问题
app.use(cors());
//将post传参转为对象
app.use(express.urlencoded({
  extended:true
}));

//添加前缀v1/admin
app.use('/v1/admin',adminRouter);
//添加前缀v1/resident
app.use('/v1/resident',residentRouter);
//添加前缀v1/volunteer
app.use('/v1/volunteer',volunteerRouter);
//添加前缀v1/health
app.use('/v1/health',healthRouter);
//添加前缀v1/police
app.use('/v1/police',policeRouter);
//添加前缀v1/diet
app.use('/v1/diet',dietRouter);
//添加前缀v1/service
app.use('/v1/service',serviceRouter);
//添加前缀v1/order
app.use('/v1/order',orderRouter);
//添加前缀v1/news
app.use('/v1/news',newsRouter);
//添加前缀v1/goods
app.use('/v1/goods',goodsRouter);
//添加前缀v1/newsRight
//app.use('/v1/newsRight',newsRouter2);
//添加前缀v1/forum
app.use('/v1/forum',forumRouter)
//添加前缀v1/shop
app.use('/v1/shop',shopRouter)