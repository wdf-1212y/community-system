SET NAMES UTF8;
DROP DATABASE IF EXISTS cs;
CREATE DATABASE cs CHARSET=UTF8;
USE cs;

/**管理员信息**/
CREATE TABLE cs_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  admin_name VARCHAR(32),
  password VARCHAR(32),
  role VARCHAR(32) DEFAULT '管理员'
);

/**插入管理员信息**/
INSERT INTO cs_admin VALUES
(NULL, 'admin','123456','管理员');

/**居民信息**/
CREATE TABLE cs_resident(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  rname VARCHAR(32),
  rpassword VARCHAR(32),
  age VARCHAR(4),
  sex VARCHAR(4),
  phone VARCHAR(16),
  email VARCHAR(32),
  idcard VARCHAR(32),
  address VARCHAR(32),
  photo VARCHAR(128)
);

/**插入居民信息**/
INSERT INTO cs_resident VALUES
(NULL,'祺祺','111111',22,'男','13412121212','200212124@qq.com','142732200212126661','山西省太原市','...jpg');

/**志愿者信息**/
CREATE TABLE cs_volunteer(
  vid INT PRIMARY KEY AUTO_INCREMENT,
  vname VARCHAR(32),
  vpassword VARCHAR(32),
  sex VARCHAR(4),
  phone VARCHAR(16),
  address VARCHAR(32),
  idcard VARCHAR(32),
  photo VARCHAR(128)
);

/**插入志愿者信息**/
INSERT INTO cs_volunteer VALUES
(NULL,'张三','222221','男','17833334441','山西省太原市','140728200212127771','/volunteers/zyz_touxiang1.jpg'),
(NULL,'李四','222222','男','17833334442','山西省太原市','140728200212127772','/volunteers/zyz_touxiang2.jpg'),
(NULL,'李娟','222223','女','17833334443','山西省太原市','140728200212127773','/volunteers/zyz_touxiang3.jpg'),
(NULL,'李丽','222224','男','17833334444','山西省太原市','140728200212127774','/volunteers/zyz_touxiang4.jpg'),
(NULL,'Mike','222225','男','17833334445','山西省太原市','140728200212127775','/volunteers/zyz_touxiang5.jpg'),
(NULL,'王凯','222226','男','17833334446','山西省太原市','140728200212127776','/volunteers/zyz_touxiang6.jpg'),
(NULL,'Lily','222227','女','17833334447','山西省太原市','140728200212127777','/volunteers/zyz_touxiang7.jpg'),
(NULL,'魏浩','222228','男','17833334448','山西省太原市','140728200212127778','/volunteers/zyz_touxiang8.jpg');

/**健康登记信息**/
CREATE TABLE cs_health( 
  hid INT PRIMARY KEY AUTO_INCREMENT, #登记索引号
  rname VARCHAR(32) ,         #居民姓名
  population VARCHAR(16),     #家庭成员人数
  temperature_regist DECIMAL(3,1),    #体温登记
  reaction LONGTEXT,          #不适反应
  note LONGTEXT,              #备注
  regist_time DATE,           #登记时间
  audit_situation VARCHAR(32) DEFAULT '否',  #审核情况(是否审核)
  reply LONGTEXT              #审核回复
);

/**插入健康登记信息**/
INSERT INTO cs_health VALUES
(NULL,'祺祺',4,'36.4','无不适反应','无','2022-08-20','否','无');

/**一键报警信息**/
CREATE TABLE cs_police(
  pid INT PRIMARY KEY AUTO_INCREMENT, #报警索引号
  rname VARCHAR(32),         #居民姓名
  place VARCHAR(128),        #地点
  content LONGTEXT,          #报警内容
  time DATETIME              #报警时间
);

/**插入一键报警信息**/
INSERT INTO cs_police VALUES
(NULL,'祺祺','太原市小店区','居民不做核酸','2022-08-20 09:00:00');

/** 物资信息 **/
CREATE TABLE cs_goods(
  gid INT PRIMARY KEY AUTO_INCREMENT, #索引号
  gname VARCHAR(32),         #物资名称
  gpic VARCHAR(128),         #物资图片
  price INT,                 #物资价格
  gcount INT DEFAULT 1,      #物资数量
  note LONGTEXT,             #简单介绍
  state INT DEFAULT 0        #物资状态
);
/**插入物资信息**/
INSERT INTO cs_goods VALUES
(NULL,'口罩','/goods/kz.jpg',4,1,'一种卫生防疫用品，一般指戴在口鼻部位用于过滤进入口鼻的空气，以达到阻挡有害的气体、气味、飞沫、病毒等物质的作用，以纱布或纸等材料做成',0),
(NULL,'棉棒','/goods/mq.jpg',3,1,'卫生用品,主要用于医疗、家用、卫生化妆、婴儿护理、美容及清洁各类精密仪器清洗等。它一般采用与纯天然棉花，棉球均匀，触感细腻，不添加荧光增白剂，紫外线杀菌等',0),
(NULL,'酒精','/goods/jj.jpg',10,1,'医用酒精的主要成分是乙醇，并且它是混合物。用淀粉类植物经糖化再发酵经蒸馏制成，相当于制酒的过程，但蒸馏温度比酒低，蒸馏次数比酒多，酒精度高，制成品出量高，不能饮用，但可接触人体医用',0),
(NULL,'洗手液','/goods/xsy.jpg',15,1,'一种用来清洁手部的护肤清洁液，通过以机械摩擦和表面活性剂的作用，配合水流或不需要水来清除手上的污垢和附着的细菌',0),
(NULL,'体温计','/goods/twj.jpg',20,1,'一种最高温度计，又称“医用温度计”，广东及港台地区称为探热针。它可以记录该温度计所曾测定的最高温度',0),
(NULL,'纸巾','/goods/zj.jpg',16,1,'日常生活用品，纸巾成分有氯、漂白粉、酒精、木浆及可再生资源。纸巾种类多种多样',0);

/** 购物信息 **/
CREATE TABLE cs_shop(
  shid INT PRIMARY KEY AUTO_INCREMENT, #索引号
  rid INT,                   #居民
  gid INT,                   #物资
  foreign key (rid) references cs_resident(rid),
  foreign key (gid) references cs_goods(gid)
);
/**插入购物信息**/
INSERT INTO cs_shop (rid,gid) VALUES
(1,2),(1,5);

/**饮食申请信息**/
CREATE TABLE cs_diet(
  did INT PRIMARY KEY AUTO_INCREMENT, #申请索引号
  rname VARCHAR(32),         #居民姓名
  phone VARCHAR(16),         #电话
  address VARCHAR(32),       #家庭地址
  population VARCHAR(16),    #家庭成员人数
  apply_time DATETIME,       #申请时间
  menu VARCHAR(128),         #菜单详情
  note LONGTEXT,             #备注
  audit_situation VARCHAR(128) DEFAULT '否',  #审核情况(是否审核)
  reply LONGTEXT             #审核回复
);

/**插入饮食申请信息**/
INSERT INTO cs_diet VALUES
(NULL,'祺祺','13412121212','山西省太原市',4,'2022-08-20 09:00:00','鱼香肉丝','无','否','无');

/**上门服务信息**/
CREATE TABLE cs_service(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  place VARCHAR(32),           #地点
  alarm_content LONGTEXT,      #报警内容
  vname VARCHAR(32),           #志愿者姓名
  regist_time DATE             #登记时间
);

/**插入上门服务信息**/
INSERT INTO cs_service VALUES
(NULL,'山西省太原市','居民不做核酸','张三','2022-08-20');

/**配送订单信息**/
CREATE TABLE cs_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  rname VARCHAR(32),         #居民姓名
  phone VARCHAR(16),         #电话
  address VARCHAR(32),       #家庭地址
  vno VARCHAR(32),           #志愿者工号
  vname VARCHAR(32),         #志愿者姓名
  status VARCHAR(32),        #配送状态
  delivery_time DATE         #配送时间
);

/**插入配送订单信息**/
INSERT INTO cs_order VALUES
(NULL,'祺祺','13412121212','山西省太原市','志愿者工号1','张三','配送中','2022-08-20');

/**新闻资讯信息**/
CREATE TABLE cs_news(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  addtime DATETIME DEFAULT CURRENT_TIMESTAMP,
  news_title VARCHAR(32),     #新闻标题
  picture VARCHAR(128),       #新闻图片
  news_content LONGTEXT,      #新闻内容
  news_detailcon LONGTEXT     #新闻详情
);

/**插入新闻资讯信息**/
INSERT INTO cs_news VALUES
(NULL,'2022-8-17 10:30:00','疫情最新情况','/news/news_picture1.jpg','全国新增20例,本土新增5例,境外输入15例',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;海南省新冠肺炎疫情防控工作指挥部综合组副组长、省卫生健康委员会副主任李文秀在发布会上说，根据指挥部的疫情风险研判，海南疫情总体可控，正处于胶着对垒关键时期。三亚8月15日新增报告病例数同8月14日基本持平，新增感染者以管控人群为主。儋州、陵水、东方、临高、万宁、乐东6市县仍处于疫情发展期。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据介绍，2022年8月15日0-24时，海南省新增本土确诊病例426例，新增本土无症状感染者785例。8月1日0时至8月15日24时，海南本轮疫情累计报告阳性感染者10093例，其中确诊病例4816例，无症状感染者5277例。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李文秀说，海南积极统筹各园区疫情防控和施工生产，多渠道协调解决堵点问题，经济运行呈现恢复态势。海南制定静态管理期间生活物资保供方案，采取市县组织保供、省级支援保供、社会捐赠保供等措施，重要民生商品、疫情防护用品供应总体平稳，价格基本稳定。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李文秀说，海南全力开展医疗救治工作。目前，洋浦新都工业园方舱医院2360张床位和三亚第三方舱医院2000张床位交付使用，三亚第四方舱医院开工建设，海口第五方舱医院已启动建设。海南已建立全省定点医院及方舱医院联络机制，确保病情加重患者转院顺畅，密切关注危重症患者，加强风险评估及病情监测，确保存在重症风险患者及时转入ICU。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;截至8月17日，第一阶段12个方舱医院全部建成交付，累计交付床位22291张。8月17日0-24时，共接收患者1808例，治愈出院210例，截至8月17日24时，现有危重型患者5例，重型8例，普通型91例，轻型4398例，无症状6498例，未分型2098例，累计治愈出院440例。</p>'),
(NULL,'2022-8-14 18:30:25','抗击疫情在行动','/news/news_picture2.jpg','多点散发,聚集感染,面状扩散,抗疫战线迅速扩大。医生、基层干部等始终坚守一个共识,传递一个声音--科学精准,动态清零,坚决遏制疫情蔓延',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近期，大批共青团员、青年志愿者活跃在北京市抗击疫情第一线，他们在核酸检测人员信息录入、小区防疫执勤、居民生活保障、防疫物资运输等岗位上唱响抗击疫情的“青春之歌”。据共青团北京市委员会统计，近一个多月，共有17.2万名青年志愿者参与疫情防控工作。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为迅速阻击疫情蔓延，基层党员夜以继日，坚守在一线。儋州市大同社区常住人口超过1万人，防控难度大。社区25名网格员中，大部分都是党员。疫情发生后，党员何春花和同事们承担起疫情摸排、物资分发等工作，并为社区里的30多位独居老人上门做好服务保障。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;　一个党员就是一面旗帜。在救治一线，支援海南的多支医疗队分别建立起多个临时党组织。湖北援琼医疗队共有1500多人，成立了临时党委和七个临时党支部。在他们接管的三亚两家方舱医院里，哪里危险，党员医护人员就带头冲在哪里。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;　眼下，面对严峻复杂的防控形势和快速增长的感染人数，我们要坚定信心。有党中央坚强领导，有伟大抗疫精神的鼓舞，有来自全国各地医疗队志愿者的鼎力支持，相信一定能战胜眼前的困难，打赢这场疫情防控攻坚战。</p>'),
(NULL,'2022-8-15 10:20:00','物资运送','/news/news_picture3.jpg','要全面保障全国各个地区的物资充足',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;疫情发生以来，海南省委省政府千方百计保障重要农产品等物资流通。为此，海南省专门出台《海南省鲜活农产品应急航空运输保障机制》，通过政策兜底保障，打通特殊时期鲜活农产品航空出岛运输的堵点，确保农产品出岛“不断线”。其中，由省农业农村厅帮助垫付包机兜底费用及地面装机操作费用，省相关部门协调安排海口至南京3个航班保障亿尾虾苗出岛。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为做好管控工作，海南不断增强保供力量、优化流程，全力抓好生活物资保障工作。目前海南省商务厅已公布首批70家省级保供“白名单”企业，确保全省八大类生活必需品货源充足。海口加强市级储备粮巡查和粮油保障，指导承储企业提前做好与粮油加工企业的对接工作，保证应急加工、随时投放；三亚市德航供销电商平台进行电商无接触配送工作，既满足市民对生活物资的日常需求，又助力农户在疫情期间也能有稳定收入。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为保障全岛供应“不断链”，海南在实施免费过海政策的同时，还制定进岛物资运输车辆和司机安全保障服务方案，启用海南省重点物资运输车辆通行证。截至8月14日，全省累计发放货车通行证超10万张。省大数据管理局开发“保供人员身份”标识模块，保障配送人员通行，全省各行业持电子通行证的保供人员共计12万多人。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;按照海南省委统一部署，省发展改革委牵头成立“双统筹”工作专班，建立24小时工作值班制度，高效统筹疫情防控和经济社会发展，统筹发展和安全，按日调度保供稳价、经济运行、项目投资、园区生产和安全生产等工作。建立企业服务微信群，及时解决园区和企业生产因疫情造成的困难，最大限度减少园区受疫情影响造成的损失。</p>'),
(NULL,'2022-8-15 20:00:00','勤洗手','/news/news_picture4.jpg','牢记七步洗手法,饭前饭后勤洗手,健康环境共同造',
'<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以下7种情况 记得好好洗手</h3><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;什么情况下我们一定要洗手？贾蕾概括起来就是请大家记住两点：第一，接触脏东西后要洗手；第二，接触食物或者鼻黏膜、眼结膜等黏膜之前要洗手。特别是下列7种情况一定要洗手。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.去医院、看护病人后。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.外出或购物回家后。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.处理宠物粪便后。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.给孩子换尿布后。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.擤鼻涕、揉眼睛后。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.做饭前、冲奶粉前。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.摘戴隐形眼镜前。</p><br/>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自来水冲冲 效果很有限</h3><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有些人觉得自己手不脏，洗手的时候不愿意用香皂，只是用水随便冲冲，但其实这样洗手的效果不大。贾蕾用一个此前做的实验举例，首先对从公共场所回来的人的手进行涂抹采样，然后让她用水冲手后，再采一个样，最后用香皂认真清洗、擦干后，再采一个样。结果如何呢？不洗手的话，培养基上可以看到大片的菌落；手经过流水冲洗后，菌落数少了一些，但还是有很多；用香皂认真洗手并擦干后，肉眼看不到培养基上的细菌生长。可见，要想洗干净手，还是需要用香皂。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医学专家表示，秋冬季是流感等传染病高发时节，绝大多数传染病通过加强手部卫生是可以预防的，预防呼吸道传染病除了要严防呼吸道传播，更要注意手的清洁和消毒，最好每天几次用肥皂和温水清洗双手，而在现实生活中，相当一部分人没有养成良好的洗手习惯，甚至存在误区，如用手绢、纸巾以擦代洗，有的不用肥皂和洗手液，还有的刚刚搓出点泡沫儿就马上冲掉，都不符合科学洗手的基本要求。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;国家卫生计生委宣传司司长毛群安表示，洗手，虽然是日常小事，但不洗手或不能正确洗手，却关乎健康大事，事实上 “正确洗手”才是预防传染病最有效、最便捷、最经济的方法。在现代生活中，人们往往在不经意之间就会接触到大量病菌，如果不能及时洗手，就会加大腹泻、流感这些疾病的传播率。</p>'),
(NULL,'2022-8-16 08:00:00','开展核酸检测','/news/news_picture5.jpg','疫情频发,我省多地开展核酸检测',''),
(NULL,'2022-8-16 17:30:00','抓实抓细疫情防控措施','/news/news_picture6.jpg','严防境外输入病例,同时做好本土防疫措施',''),
(NULL,'2022-8-16 21:10:00','全面消杀快递','/news/news_picture7.jpg','现阶段,购物热潮使得快递消杀工作更加繁重','');

/**论坛信息**/
CREATE TABLE cs_forum(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  addtime DATETIME DEFAULT CURRENT_TIMESTAMP,
  forum_title VARCHAR(32),     #帖子标题
  forum_content LONGTEXT,      #帖子内容
  username VARCHAR(32)         #用户角色
);

/**插入论坛信息**/
INSERT INTO cs_forum VALUES
(NULL,'2022-8-16 15:30:00','疾控中心最新提示',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前，正值暑期和旅游高峰期，公众出行意愿强，人员流动大，而国内疫情呈现出多点散发、局部聚集的态势，多个旅游城市疫情防控形势严峻复杂。为持续坚持“外防输入、内防反弹”总策略和“动态清零”总方针，维护正常社会秩序，为经济社会发展保驾护航，8月15日，山西省疾病预防控制中心发布健康提示。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、严格第一落点管控。我省加强对海南三亚等涉疫地市入晋返晋人员的排查管控，严格落实第一时间、第一落点“落地核酸+点对点接返+精准赋码+隔离管控”的全链条管控措施。自8月12日起，对海南省三亚等涉疫地市的入晋返晋人员，在抵晋第一落点，第一时间实施3天免费集中隔离医学观察，隔离期间每天开展1次核酸检测。集中隔离期满后，由第一落点“点对点”转运至出发场站，并告知在返程途中全程做好个人防护。抵达目的地后，由目的地“点对点”接返，实施4天居家隔离医学观察，如不具备居家隔离医学观察条件，实施集中隔离医学观察，隔离费用按当地政策执行。居家隔离医学观察期间的第2天和第4天分别进行1次核酸检测，并加强症状监测，如出现发热、干咳、嗅觉丧失、肌肉酸痛等临床症状，要立即报告。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、严格出行防疫管理。公众出游前需密切关注途径地和目的地疫情动态，合理安排行程。旅途及就餐等过程中要认真做好个人防护，自觉配合测温、扫码验码、查验核酸阴性证明，按规定做到“戴口罩、勤洗手、不扎堆、勤通风”，准备充足的口罩、免洗手消毒品等防护物资。进入景区要执行实名制门票预约制度、遵守错峰游览、保持安全社交距离等要求。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、严格秋季开学防控。各级各类学校要明确返校要求，并及时通知师生，要加强家校联系，提醒家长、学生关注疫情，履行个人防控责任。返校师生要强化社会责任意识和自我防控意识，密切关注国内外疫情形势变化，主动配合交通场站做好测温验码、戴口罩、查验核酸检测等防疫管理措施。要主动加强自我健康监测，一旦出现发热、干咳、乏力、嗅（味）觉减退、鼻塞、流涕、咽痛、结膜炎、肌痛和腹泻等新冠肺炎疑似症状，请立即规范佩戴口罩并前往就近发热门诊就诊，途中不得乘坐公共交通工具。</p>',
'admin'),
(NULL,'2022-8-01 09:30:00','交流贴--社区治理能力',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;引入社会调解组织，以“定点式+顾问制”的服务模式，承接物业纠纷调解项目。在化解矛盾的同时，孵化培育一支能力强、业务精的人民调解队伍，也是社区的职责使命。把一些原来由政府履行的职能交由社会组织来承担，降低行政成本，实现政府管理与社会调节的良性互动。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成立物业纠纷调解咨询委员会，聘请具有相关住房保障、物业管理法律法规知识、熟悉房屋管理政策业务的专业人员，参与辖区物业管理纠纷，协助社区居委会商议或研讨其他涉及社区的重大事项，就能逐步提升辖区居委干部及社区群众的法治水平。社会组织参与矛盾纠纷化解工作，可以弥补审判力量的不足，缓解司法的压力。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社会调解组织根据自身的职能和特点，“量身打造”参与社会治理的方式方法，利用自治力量化解矛盾纠纷，更容易使当事人取得共识、达成谅解，在参与社会治理过程中发挥最大效能。</p>',
'祺祺'),
(NULL,'2022-8-15 15:30:00','防控工作情况',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着封闭式管理的时间延长，社区层面临着越来越多保供的压力，所以现阶段社区防控的重点就需要统筹各方的资源和人力，全力做好居民生活的物资供应，还有就医需求的保障。能使居民在家里安心待得住。从核酸的角度来讲，要全力做好重点区域，也就是患者比较相对集中的区域的核酸筛查，可以相应提高筛查频次。此外更重要的是，要严格落实社区层面的各项措施。这样的话能够使我们社区层面的风险进一步降低。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;社区也会更加精准、专业、安全地开展社区防控，进一步提升城乡社区防控能力。各地民政部门会指导村（居）民委员会和城乡社区工作者认真执行本地社区防控方案，切实提升疫情防控意识和防控能力，实现常态化防控和疫情应急处置快速转换；发生局部聚集性疫情地区的村（居）民委员会和城乡社区工作者要精准实施封控区、管控区、防范区分类管理措施，重点做好本社区防控策略宣传、群众诉求回应和应急处置工作。</p>',
'admin'),
(NULL,'2022-8-16 15:30:00','疫情防控需团结努力',
'<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在具体工作中，大家都冲锋在检测场一线、坚守在执勤卡口、穿梭在检测队伍中。有的“大白”志愿者身穿密不透风的白色防护服，做好检测场地周边的定时消杀工作，认真用采集设备扫码检测者的身份信息，遇到老人和小孩还得细致的输入核对证件内容。有的“小蓝”志愿者穿着蓝色隔离衣，引导社区居民有序排队进入检测场地，做好健康码扫码登记和体温检测工作，提醒现场居民戴好口罩、保持2米安全距离。有的“小红”志愿者身穿红色马甲志愿服，在社区卡口值守，对进入小区人员进行测温、扫码、查验48小时内核酸检测阴性证明。“大白”“小蓝”“小红”们不顾天气炎热、服装闷热等困难，认真细致、尽职尽责，检测采样现场井然有序，顺利地协助社区完成了既定任务，得到社区领导和居民们一致好评。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在志愿服务期间，党委有关同志深入社区核酸检测现场，看望和关心青年志愿者们，并向社区赠送了矿泉水等物资，表达对社区工作者的敬意和问候，以及支持社区疫情防控工作的决心和态度。</p><br/>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“用一份热，发一份光”。作为一名青年志愿者，很荣幸参加到社区疫情防控志愿服务工作，虽然工作很普通、很短暂，但愿意为属地社区防疫工作付出青春力量。在接下来的社会面清零战役中，随时做好志愿服务准备，听从属地社区指挥调度，携手同心、再接再厉，将隐匿传播捞干筛净，尽快实现社会面清零，用“青春志愿红”守护“每日健康绿”。</p>',
'张三'),
(NULL,'2022-8-16 15:30:00','疫情防控','','李四'),
(NULL,'2022-8-16 15:30:00','疫情防控','','李娟'),
(NULL,'2022-8-16 15:30:00','疫情防控','','魏凯');