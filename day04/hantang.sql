-- 设置客户端连接服务器端编码
set names utf8;
-- 丢弃数据库如果存在
drop database if exists hantang;
-- 创建新的数据库
create database hantang charset=utf8;
-- 进入数据库
use hantang;
-- 轮播图表
create table ht_banner(
    bid int primary key auto_increment,
    title varchar(32),
    pic varchar(128),
    href varchar(128)
);
-- 插入数据
insert into ht_banner values(null,'轮播图1','/images/banner1.jpg','http://www.codece.cn');
insert into ht_banner values(null,'轮播图2','/images/banner2.jpg','http://www.codece.cn');
insert into ht_banner values(null,'轮播图3','/images/banner3.jpg','http://www.codece.cn');
insert into ht_banner values(null,'轮播图4','/images/banner4.jpg','http://www.codece.cn');

-- 新闻分类表
create table ht_cat(
	cid int primary key auto_increment,
	cname varchar(8) unique
);
-- 插入数据
insert into ht_cat values
(10,'公司动态'),
(20,'产品资讯'),
(30,'业界资讯');
-- 创建新闻数据表
create table ht_news(
	nid int primary key auto_increment,
	title varchar(32),
	ctime bigint,
	detail varchar(10240),
	cat_id int,
	-- 将cat_id列作为外键，它的值必须在ht_cat表的cid中出现过
	foreign key(cat_id) references ht_cat(cid)
);
-- 插入数据
insert into ht_news values(null,'让操作更简单 本周最受关注智能电视盘点',1642822323333,'<p style="text-indent:2em;">经过几年的发展，智能电视已经被越来越多的消费者所熟悉，全新的操作流程，炫酷的智能体验，以及更多的人机交互功能，让智能电视走进了更多消费者的家庭。那么，什么样的电视能称之为智能电视呢？我们又该如何选择智能电视呢？接下来，笔者就为大家盘点一下本周网购途径最受欢迎的智能电视，希望能对大家选购智能电视起到一些帮助。</p><p><img border="0" alt="让操作更简单 本周最受关注智能电视盘点" src="http://img1.cache.netease.com/catchpic/1/13/1383E9844F4CF5B61A35ABBA4509D054.jpg" /> </p><p style="text-indent:2em;">让操作更简单 本周最受关注智能电视盘点</p><p style="text-indent:2em;">TOP1：海信LED42K520DX3D智能电视</p><p style="text-indent:2em;">海信K520系列智能电视，打破频道界限，同类节目合并呈现。通过直播聚合技术，把同一时段的同类节目汇集在一起，形成直播导航界面，让您一眼挑中喜爱的节目。用户还可以通过文字、语音搜索，查找自己喜欢的电视节目。 目前，这款电视在京东商城直降1100元，加上节能补贴400元，成交价仅为4199元，喜欢的朋友不要错过。</p><p><img border="0" alt="海信LED42K520DX3D智能电视" src="http://img1.cache.netease.com/catchpic/4/41/4166B3AF26EACDDE16731B00532BB853.jpg" /></p><p style="text-indent:2em;">海信LED42K520DX3D智能电视</p><p style="text-indent:2em;">海信K520系列是国内首发的带安卓4.0系统的智能电视，配合Android4.0研发的SAMRTZONE2.2深度优化平台，采用1080P全高清操作界面，简易直观，真正适合电视使用。K520系列内置双核处理器（2CPU+2GPU），运行速度超流畅。</p><p><img border="0" alt="背部特写" src="http://img1.cache.netease.com/catchpic/A/AF/AF980A7FCF358B4E4E6A762213C0F309.jpg" /> </p><p style="text-indent:2em;">背部特写</p><p style="text-indent:2em;">海信K520智能电视能够与智能手机、海信I’TV，通过无线网络进行多屏互动，实现大屏传小屏、小屏传大屏、智能云分享、智能云遥控。在此基础上，实现了大屏传小屏后的反向控制，I’TV可以反向控制电视。</p><p><img border="0" alt="接口特写" src="http://img1.cache.netease.com/catchpic/1/11/116B3AB92FE1CE350A11E11FA0529EE8.jpg" /></p>',20);
insert into ht_news values(null,'独家对话马化腾：微信是社交应用与电信业务无关',1592820000333,'<p style="text-indent:2em;">凤凰科技讯 3月31日消息，针对微信是否具有电信业务特征的问题，腾讯董事局主席马化腾今日在IT领袖峰会间隙独家对话凤凰科技时予以否认，马化腾称，微信不是电信业务，是一款社交化应用。</p><p style="text-indent:2em;">自微信推出之后，即有不少业内人士认为微信因为可以传输信息及语音，具有明显的电信基础业务特征。也正因此，有人称腾讯为没有牌照的“虚拟运营商”。</p><p style="text-indent:2em;">不过，马化腾今日在独家对话凤凰科技时表示，微信不是电信业务，是典型的社交应用。</p><p style="text-indent:2em;">有业内人士认为，马化腾如此表态是为了避免“被”成为“虚拟运营商”，否则，腾讯将不可避免的向基础电信运营商支付网络租用费。（王鹏）</p>',10);
insert into ht_news values(null,'菲律宾海域发生5.4级地震 震源深度103公里',1566620000333,'<p><img src="http://img1.cache.netease.com/catchpic/5/55/551D645D57D394F7269393D9DCA338A1.jpg" alt="菲律宾海域发生5.4级地震震源深度103公里（图）" /> </p><p style="text-indent:2em;">图片来自美国地质勘探局网站。</p><p style="text-indent:2em;">中新网4月12日电 据美国地质勘探局网站消息，北京时间4月12日18点34分，菲律宾南部海域发生里氏5.4级<a href="http://news.163.com/special/rbdblhddz/" target="_blank">地震</a>，震源深度103.2公里。</p>',30);
insert into ht_news values(null,'老外街头救晕倒中国小伙 奇怪他人只拍照不施救',1569990000333,'<p style="text-indent:2em;"><img alt="" src="http://y0.ifengimg.com/644db11e181e00f8/2013/0412/re_51673177a7ac3.jpg" /> </p><p style="text-indent:2em;">巴基斯坦留学生哈马德讲述救人经过。记者杨涛摄</p><p style="text-indent:2em;">原标题：小伙子晕倒引来路人围观 有的拍照有的拍视频</p><p style="text-indent:2em;">巴基斯坦留学生“闯镜头”救人</p><p style="text-indent:2em;">前天下午，武昌地铁2号线光谷站出口发生感人一幕：一名小伙不幸晕倒在地，正好路过的巴基斯坦来华留学生哈马德见状，毫不犹豫地上前施救，让小伙在现场苏醒过来。</p><p style="text-indent:2em;">小伙晕倒被外国人救醒</p><p style="text-indent:2em;">前天下午3点50分，光谷地铁站C出口，一名年轻小伙突然晕倒在地。目击者马同学说，倒地小伙看起来二十出头，身体十分虚弱。</p><p style="text-indent:2em;">小伙倒地后，周围站满了围观的路人，就在大家犹豫要不要将其扶起时，人群中突然走进来一个皮肤黝黑的外国男子，他俯下身开始对小伙进行急救。有路人递来一瓶矿泉水，外国男子不断给小伙脸上和脖子上洒清水，试图让其清醒过来。</p><p style="text-indent:2em;">大约过了15分钟，小伙渐渐苏醒过来。在另外一名男子的帮助下，两人一起将小伙搀扶到旁边的花坛台阶上坐下。外国男子询问小伙的身份，有没有同伴和亲人，但小伙身体十分虚弱，听得懂大家说话，自己却始终说不出话来。</p><p style="text-indent:2em;">因湖北省中医院光谷院区就在光谷附近，有好心市民在路边拦下一辆出租车，两名男子和白衣女子将小伙扶上车，将其送往医院救治，外国男子则悄悄离开了现场。</p><p style="text-indent:2em;">救人者是巴基斯坦留学生</p><p style="text-indent:2em;">外国男子究竟是谁？根据马同学提供的信息，昨天下午4点，记者在中南民族大学辗转找到了这位外国男子。</p><p style="text-indent:2em;">他叫哈马德（Ahmed waqas），今年31岁，来自巴基斯坦伊斯兰堡。哈马德约1米78的个子，穿着一身休闲运动装，露出一张阳光般的笑脸。</p><p style="text-indent:2em;">哈马德开口就说一口流利的中文，他告诉记者，曾在北京学过半年的中文，去年9月再次来到中国，就读于中南民族大学国际教育学院，刚好学的就是汉语言专业，目前正在上大一。</p><p style="text-indent:2em;">前天下午3点半，哈马德在校门口乘坐538路公交车前往光谷广场，他下车后看见马路对面的地铁站C出口聚满了围观的人，透过人群看到一名小伙子晕倒在地。</p><p style="text-indent:2em;">“围观的人群中，有的在拍照，有的在拍视频，还有的在打电话。”哈马德说，让他感到奇怪的是，就是没有一个人上前施救。</p><p style="text-indent:2em;">哈马德介绍，小伙身体向左侧倒在地上，还在不断抽搐，但已经处于昏迷状态，鼻孔还流出了血。曾接触过急救知识的他来不及多想，俯下身子按住小伙的脖子，检查其脉搏。同时，他不断给小伙的胸部和手掌心按摩。</p><p style="text-indent:2em;">功夫不负有心人，15分钟后，小伙逐渐睁开眼苏醒过来。</p><p style="text-indent:2em;">昨天下午，记者来到湖北省中医院光谷院区急诊科，试图找到被救的小伙。由于无法核实其身份信息，医护人员在查阅了接诊记录后，并没有找到这名小伙。</p><p><img alt="20万台小米2S售罄" src="http://y1.ifengimg.com/719f9cb65353fcc6/2013/0410/ori_5164a76e5ebec.jpeg" /></p><p style="text-indent:2em;">最后多说一句：现在预约小米2S，除了有16GB标准版外，还有16GB电信版可选，有兴趣的用户可以关注一下。</p>',20);

-- 创建关于汉唐表
create table ht_about(
	aid int primary key auto_increment,
	title varchar(16),
	detail varchar(10240)
);
-- 插入数据
insert into ht_about values(1,'公司简介','北京汉唐资产管理集团有限公司由北京市工商局批准设立，注册资本人民币5亿元。公司成立于2004年，经过近十年的发展，旗下拥有北京亿利恒丰投资管理有限公司、北京汉唐凌和资本管理有限公司、北京众融互联财富投资管理有限公司、北京京盛典当行有限公司、山西融联恒丰投资有限公司、北京逸乐酒店管理有限公司、北京样云雅轩餐饮有限公司等控股子公司，形成以资产管理、财富管理、金融投资、融资业务、互联网金融、典当业务、海外金融业务、宾馆餐饮为主营业务的金融投资集团公司 。目前，公司已获得中国证监会批准的私募股权、私募证券资格。');
insert into ht_about values(2,'董事长致辞','时光如梭，岁月如歌。伴随着中国金融改革开放的浪潮，北京汉唐集团翩然迈过12个年头，形成了以资产管理、财富管理、金融投资、互联网金融、典当业务、海外金融业务、宾馆餐饮等为主营业务的金融投资集团公司，经营机构遍布中国主要的一、二线城市。天地和谐，源于携手，回眸汉唐集团取得的每一点成绩，都离不开各级政府和众多银行家、企业家、合作伙伴、广大客户的支持与厚爱！离不开公司全体同仁的不懈努力！在此，我深表感恩并致谢意！');

-- 创建公司大事件表
create table ht_event(
	eid int primary key auto_increment,
	title varchar(64),
	ctime date
);
-- 插入数据
insert into ht_event values(null,'汉唐亿利恒丰投资管理有限公司获得私募证券基金备案资格。','2015-1-22');
insert into ht_event values(null,'汉唐凌和资本管理有限公司获得私募股权基金备案资格。','2015-1-22');
insert into ht_event values(null,'北京汉唐资产管理有限公司与联想控股建立项目合作机制。','2015-1-9');
insert into ht_event values(null,'北京汉唐资产管理有限公司获得私募证券基金备案资格。','2015-1-7');
insert into ht_event values(null,'北京汉唐资产管理有限公司收购香港万兆丰资产管理有限公司，海外业务正式拉开序幕。','2015-1-6');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司网站平台正式发布。','2014-12-16');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司获中国电子商务协会批准成立产业金融委员会，并成为会员单位。','2014-12-10');
insert into ht_event values(null,'北京汉唐资产管理有限公司与绵世投资集团建立项目合作机制。','2014-11-21');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司协办《透过表情看思想》--第一届中国知名企业家肖像展。','2014-11-14');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司获得中关村高新技术企业认证。','2014-11-14');
insert into ht_event values(null,'北京汉唐资产管理有限公司与中银律师事务所、瑞华会计师事务所建立起项目推荐合作机制。','2014-11-10');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司成为北京市未来科技城及北京市昌平区重点支持','2014-10-26');
insert into ht_event values(null,'互联网金融企业，被评为区委区政府重点项目。北京汉唐资产管理有限公司入股内蒙古力农羊业集团。','2014-10-21');
insert into ht_event values(null,'北京众融互联财富投资管理有限责任公司在北京市未来科技城正式设立。','2014-9-19');
insert into ht_event values(null,'北京汉唐资产管理有限公司与石天资本建立合作机制。','2014-9-4');
insert into ht_event values(null,'北京汉唐资产管理有限公司与山西证券、中信建投建立合作关系。','2014-9-2');
insert into ht_event values(null,'北京汉唐资产管理有限公司与新企投资建立投资联盟合作机制。','2014-8-27');
insert into ht_event values(null,'祥云雅轩餐饮有限公司成为密云县"明厨亮灶"工程试点单位。','2014-5-1');

-- 创建旗下公司表
create table ht_member(
	mid int primary key auto_increment,
	mname varchar(32) unique not null
);
insert into ht_member values(null,'北京京盛典当行有限公司');
insert into ht_member values(null,'北京亿利恒丰投资管理有限公司');
insert into ht_member values(null,'北京汉唐凌和资本管理有限公司');
insert into ht_member values(null,'北京众融互联财富投资有限公司');
insert into ht_member values(null,'北京祥云雅轩餐饮有限公司');
insert into ht_member values(null,'北京逸乐酒店管理有限公司');
insert into ht_member values(null,'上海烁昕投资管理有限公司');
insert into ht_member values(null,'上海隽烁资产管理有限公司');
insert into ht_member values(null,'深圳诺金投资有限公司');
insert into ht_member values(null,'天津聚德成餐饮有限责任公司');

-- 公司业务
create table ht_business(
    bid int primary key auto_increment,
    title varchar(16),
    detail varchar(10240)
);
insert into ht_business values(null,'私募基金','<h3>私募基金</h3><p>以稳健投资、价值共创的投资理念，专注于在信息技术、医疗健康、文化产业、现代农业领域内的创新。</p><p>与成长机会。重点投资于成长期和扩展期企业，兼顾处于Pre-IPO的项目。对已投资项目通过积极主动的增值服务创造价值，促进已投企业创新与成长，帮助创建一流的公司。</p><h3>私募证券</h3><p>始终坚持以投资收益为导向、以价值投资为理念，以稳健、高效为目标，力求帮助客户达到资产的保值增值。证券市场业务主要围绕上市公司定向增发、证券投资基金、证券自营业务三方面展开，不断扩展公司管理资产规模。同时和对家证券公司合作开展PB业务，根据既定的投资策略进行主动管理，目前已发行的产品有“亿利恒丰”系列资产管理计划等。</p>');
insert into ht_business values(null,'资产管理','资产管理业务主要涉及流动资金贷款、融资、项目融资、综合授信、动产与不动产融资，结合企业实际情况设计金融产品，满足企业融资需求。（一）资产管理业务特色  科学的资产配置有效的资产管理完善的风控体系稳健的投资收益（二）资产管理产品');
insert into ht_business values(null,'财富管理','<p class="p1">我们秉承以客户需求为中心的经营理念，根据客户资产规模、财富目标、投资偏好，集合相关金融产品，提供一站式的金融产品组合以及多对一的财富咨询服务，彰显对高端客户的重视与公司品牌独特的竞争优势。</p><p class="p2">·  公司资产跨境流转<br />·  海外投资基金管理<br />·  企业境外投融资服务<br />·  企业高管与员工激励计划的服务方案<br />·  家庭慈善事业服务计划<br />·  家族办公室</p>');
insert into ht_business values(null,'投资顾问','<p style="text-indent:2em;">公司为企业客户提供融资顾问服务、投资顾问服务和投后管理顾问服务，为企业提供IPO上市的顾问咨询服务。将主要利用汉唐集团既有的客户、资金、信息和网络优势，根据客户需求和业务发展战略协助设计短期或中长期投资方案；</p><p style="padding-left:28px;">做好重大项目投资或股权投资的前期准备工作；<br />配合专项顾问服务团队做好客户重大项目投资和股权投资顾问工作；<br />做好客户投资活动的后续顾问服务工作。</p>');


-- 企业文化
create table ht_culture(
    cid int primary key auto_increment,
    title varchar(16),
    detail varchar(10240)
);
insert into ht_culture values(null,'核心理念','1、公司核心文化理念：尊重员工、和谐奋进。<br>2、公司的核心价值观<br>金融业务类公司：稳健、诚信、创新、共好；<br>宾馆酒店类公司：因您而变、超越期望。<br>3、公司管理理念: 以业绩论成败,让数字说话;以奖优罚劣为基本管理手段，让优秀的员工和团队脱颖而出;坚持以事为重、以人为先的管理作风。<br>4、公司的经营理念：以客户为中心、以市场为导向。<br>5、公司的企业精神：诚信为本、创新制胜、永无止境、执行到底。');
insert into ht_culture values(null,'公司愿景','汉唐集团将致力于打造:中国最具专业实力、最具内涵价值、最具盈利能力和影响力的金融服务公司实现集团经营的专业化、国际化。');

-- 合作交流
create table ht_cooperate(
    cid int primary key auto_increment,
    cname varchar(16),
    phone varchar(32),
	email varchar(32),
    detail varchar(10240),
    ctime bigint,
    is_recommend boolean  -- 1-项目推荐  0-投资意向
);
insert into ht_cooperate values(null,'新桑','18212345678','xin888@qq.com','我有项目推荐',1581233342234,1);
insert into ht_cooperate values(null,'铭桑','18812345678','ming123@qq.com','我有投资意向',1636632342234,0);

-- 招贤纳士
create table ht_job(
    jid int primary key auto_increment,
    title varchar(32),
    detail varchar(10240),
    ctime bigint
);
insert into ht_job values(null,'业务经理','<strong><span style="color:#000000;">在招职位</span></strong><br />融资业务部: 业务经理<br /><strong><span style="color:#000000;">岗位职责</span></strong><br />1、负责拓展销售渠道，开发新客户，销售公司发行或代销的金融理财产品；<br />2、负责维护销售渠道，维护老客户，为客户提供理财咨询等服务；<br />3、负责收集市场信息和客户建议，向客户传递公司产品与服务信息；<br />4、负责为客户提供金融理财的合理化建议，为客户实现资产保值增值；<br />5、负责向客户提供贷款融资类相关的业务工作；<br />6、负责组织并策划高级营销活动，开发高端市场；<br /><strong><span style="color:#000000;">任职资格</span></strong><br />1、专科及以上学历，经济、金融类等相关专业；<br />2、具有在证券公司、银行、保险等金融行业工作经验优先；<br />3、具有一定的证券、股票和基金相关的金融基础知识；<br />4、具有广泛的客户资源和金融营销经验者优先考虑；<br />5、具有较强的沟通能力和客户开发能力；<br />6、具有很强的工作责任心和良好的人际关系；<br />7、具有较强的团队合作精神，能承受一定的工作压力<br /><strong><span style="color:#000000;">加入方式：</span></strong><br />1、直接将电子简历以“应聘岗位-姓名-学校-专业”的方式命名，发送到邮箱hr@hantangamc.com；<br />2、登陆智联招聘或者前程无忧招聘网站，搜索“北京汉唐资产管理有限公司”职位，直接投递简历即可。<br />以上两种方式均可。',1630000000000);
insert into ht_job values(null,'财务经理','招聘财务经理1名，负责公司财务',1582300000000);
insert into ht_job values(null,'保安招聘','招聘保安若干名，负责公司安保工作',1542300000000);


-- 联系我们
create table ht_contact(
    cid int primary key auto_increment,
    cname varchar(32),
    addr varchar(64),
    tel char(12),
    fax char(12),
    code char(6)
);
insert into ht_contact values(null,'北京汉唐资产管理集团有限公司','北京市西城区黄寺大街23号阳光丽景3号楼23-81','010-85187800','010-85188700','100011');
insert into ht_contact values(null,'北京汉唐凌和资本管理有限公司','北京市西城区黄寺大街23号阳光丽景3号楼23-81','010-85187800','010-85188700','100011');
insert into ht_contact values(null,'北京京盛典当行有限公司','北京市西城区黄寺大街23-35','010-82233288','010-82233288','100011');
insert into ht_contact values(null,'北京祥云雅轩餐饮有限公司','北京市密云区鼓楼大街东斜街11号(原密云大鸭梨)','010-89030333','010-89030333','100011');
insert into ht_contact values(null,'天津聚德成餐饮有限责任公司','天津市和平区成都道211号','022-23352787','022-23352787','100011');

-- 合作伙伴
create table ht_partner (
	pid int primary key auto_increment,
	title varchar(16),
	pic varchar(128),
	href varchar(128)
);
insert into ht_partner values(null,'华融证券','/images/01.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'长城证券','/images/02.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'中金公司','/images/03.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'华能贵诚','/images/04.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'中国民生信托','/images/05.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'华安基金','/images/06.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'财通基金','/images/07.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'浙商银行','/images/08.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'江苏银行','/images/09.jpg','http://www.hrsec.com.cn');
insert into ht_partner values(null,'中国民生银行','/images/10.jpg','http://www.hrsec.com.cn');