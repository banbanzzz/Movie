/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : movie

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 07/02/2020 15:24:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `cinema_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '影院编号',
  `cinema_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院名称',
  `cinema_address` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院地址',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES (1, '中山奇幻电影院', '石岐区岐头新村龙凤街4号大信溢彩荟二期8楼');
INSERT INTO `cinema` VALUES (2, '金逸影城中山石歧店', '石岐区大信南路2路大信新都汇5楼');
INSERT INTO `cinema` VALUES (3, '博纳国际影城（中山IMAX店）', '古镇区同兴路98号利和广场购物中心四楼4009号');
INSERT INTO `cinema` VALUES (4, 'UME影城（中山古镇店）', '古镇区中兴大道南一号花艺广场11层A区');
INSERT INTO `cinema` VALUES (5, '中影100影城石歧店', '石岐区康华路15号恒基大厦3楼');
INSERT INTO `cinema` VALUES (6, '橙天嘉禾影城（利和店）', '石岐区中山三路16号利和广场五层');
INSERT INTO `cinema` VALUES (7, '珠影GCC影城（中山杜比全景声店）', '火炬高技术产业开发区火炬开发区港城路7号明珠广场二期');
INSERT INTO `cinema` VALUES (8, '期遇·翼影城（东凤店）', '东凤镇东富路81号大顺时尚荟广场B座四楼（原君信大厦）');
INSERT INTO `cinema` VALUES (9, '中山IM电影城（南朗壹加壹店）', '南朗镇岭南路62号新壹加壹4楼');
INSERT INTO `cinema` VALUES (10, '艺达国际影城（小榄杜比全景声店）', '小榄镇新华中路118号大信新都汇118广场4楼');
INSERT INTO `cinema` VALUES (11, '中影天乐电影城（海州汇海城店）', '古镇镇古镇海州市场汇海城北门电梯5楼（星海湾对面）');
INSERT INTO `cinema` VALUES (12, '比高电影城（中山店）', '坦洲镇坦神北路118号皇爵假日广场4楼');
INSERT INTO `cinema` VALUES (13, '大地影院（星宝时代店）', '沙溪镇乐群坎溪村（星宝路6号星宝时代广场）');
INSERT INTO `cinema` VALUES (14, '中影星艺影城（南朗车站店）', '南朗镇南朗车站2楼');
INSERT INTO `cinema` VALUES (15, '中影太阳城影院（张家边店）', '火炬高技术产业开发区东镇东一路23号太阳城购物中心4楼（近群英华庭）');
INSERT INTO `cinema` VALUES (16, '五月花电影城（棕榈彩虹商业中心店）', '西区街道棕榈彩虹商业中心1座三楼（近新中医院）');
INSERT INTO `cinema` VALUES (17, '高菲影城（中山万益广场店）', '板芙镇迎宾大道8号（万益广场店）');
INSERT INTO `cinema` VALUES (18, '金逸影城（中山远洋城IMAX店）', '东区街道博爱六路28号远洋广场3幢大信新都汇4楼');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `user_id` bigint(10) NOT NULL COMMENT '所属用户编号',
  `comment_content` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `movie_id` bigint(10) NOT NULL COMMENT '所属电影编号',
  `comment_time` datetime(0) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (3, 1, '不容错过1', 3, '2020-02-06 16:10:38');
INSERT INTO `comment` VALUES (4, 1, '车开电车侧壁如履平地，足踢卫星返回舱一脚拯救东京，我看柯南跟吴京此生必有一战吧', 4, '2019-07-13 11:15:01');
INSERT INTO `comment` VALUES (5, 1, '看到最后一直在想真正的主角【皮球】怎么还不登场，结果果然没有让我失望。哦对，主役是皮球的话，二番就是安室的车了吧。', 5, '2019-07-13 11:15:14');
INSERT INTO `comment` VALUES (7, 1, '东南亚电影院的观众们同时发出了杠铃般的笑声', 7, '2019-07-13 04:31:17');
INSERT INTO `comment` VALUES (8, 1, '谁要看你们检察院公安撕逼 我操 还我黑衣人组织', 8, '2019-07-13 11:15:51');
INSERT INTO `comment` VALUES (9, 1, '咸水族的那个帝王蟹，好像很好吃的样子！', 9, '2019-07-13 11:16:17');
INSERT INTO `comment` VALUES (10, 1, '还行，没吹得那么好，有点像强化娱乐性的海底版《黑豹》...故事线极其简单，打戏遍布扩成了143分钟的篇幅，对路人非常友好，不过这类过度炫目眼花缭乱的特效已经越看越麻木，什么海底《阿凡达》吹太过了，坐等《阿凡达2》的潘多拉海底世界吊打吧', 10, '2019-07-13 11:16:34');
INSERT INTO `comment` VALUES (12, 2, '女王：维科，这是我大儿子，剩下的话不用我多说了吧，以后该怎么办，你自己招子放亮一点，好处不会少了你的。维科：晓得了。zz', 2, '2019-07-20 02:21:17');
INSERT INTO `comment` VALUES (13, 2, '东有沉香劈山救母，西有海娃寻叉救母。绿色秋裤哲学变身，刺身放题海底大战。同母异父兄弟相残，弟妹大伯不伦之恋。温子仁携手徐锦江，亚裔之光拯救好莱坞！', 3, '2019-07-13 11:28:40');
INSERT INTO `comment` VALUES (14, 2, '2.5 “我的恋人，就是这个国家啊！”———————好久没有听到这么烂的话了', 4, '2019-07-13 11:33:21');
INSERT INTO `comment` VALUES (15, 2, '今年的柯南剧场版好无聊啊。。后面那段飙车简直夸张到无法理解，故事最后的反转也很让人无语，完全是多此一举，没有好的剧本就别拍了好吗，估计上映了也捞不到太多票房。ps:韩语版的柯南真的让人看得别扭不舒服..', 5, '2019-07-13 11:35:46');
INSERT INTO `comment` VALUES (16, 2, '渔夫和灯塔守护多数是鳏夫，私下里经常养一些人鱼交欢。海洋远比陆地深远得多，人们赞美阳光下的海洋，却不知深夜降临海面上会冒出可怕的妖怪，海底也会藏着嘲笑人类的高级文明。所以！温子仁同样是一个借大热系列ip来讲自己故事的导演！', 6, '2019-07-13 11:36:08');
INSERT INTO `comment` VALUES (17, 2, '海王可能要被微博营销号给奶死了。。。', 7, '2019-07-13 11:36:14');
INSERT INTO `comment` VALUES (18, 2, '当陆地人为自己的文明沾沾自喜时，亚特兰蒂斯的服装设计已经领先我们几百年。', 8, '2019-07-13 11:36:41');
INSERT INTO `comment` VALUES (19, 2, '温子仁就像一个从没拍过特效大片的暴发户。两星半，降降火。', 9, '2019-07-13 11:36:50');
INSERT INTO `comment` VALUES (20, 2, '剧本，导演都有问题，很多片段都似曾相识，硬是凑了两个半小时真是辛苦了我的膀胱。然而剧情不够美工来凑，海底阿凡达，温子仁难担大任，DC要超越漫威还有很长的路要走。', 10, '2019-07-13 11:36:58');
INSERT INTO `comment` VALUES (21, 3, '故事果然还是DC常规水准，营销能力那真是突飞猛进了，有点好奇温子仁拍西游记定海神针篇会是什么效果。本马王粉反而觉得本片最帅的是前面拉了皮的威廉达福……', 2, '2019-07-13 11:37:32');
INSERT INTO `comment` VALUES (22, 3, '前面的小男孩突然问起诉是什么意思，我就在想这个故事小孩看得懂吗？动作场景依然需要帮忙按住牛顿的棺材板。', 4, '2019-07-13 11:37:43');
INSERT INTO `comment` VALUES (23, 3, '7分。温子仁确实很厉害，原以为这该是系列中最无趣的一部，尤其各种水下戏份。结果，却难得拍的很好看。影片节奏感和大场面掌控上，确实很见功力。以及，温子仁还融入了很多他自己的趣味，也算很有趣的细节了。整体可看性还不错，就是略长了，海底的光怪陆离，看久了也会有些视觉疲劳。', 5, '2019-07-13 11:38:06');
INSERT INTO `comment` VALUES (24, 3, '渔夫和灯塔守护多数是鳏夫，私下里经常养一些人鱼交欢。海洋远比陆地深远得多，人们赞美阳光下的海洋，却不知深夜降临海面上会冒出可怕的妖怪，海底也会藏着嘲笑人类的高级文明。所以！温子仁同样是一个借大热系列ip来讲自己故事的导演！', 3, '2019-07-13 11:38:35');
INSERT INTO `comment` VALUES (25, 3, '故事老套了一点 但是昨晚我的主要任务是努力让自己不要在影院里发大水…Jason太尼玛适合这个角色了，就算他能轻而易举的把我操坏我也心甘情愿地承受这份痛苦', 9, '2019-07-13 11:39:10');
INSERT INTO `comment` VALUES (26, 4, '飞机里的那一段是纪念，也是传承。钢铁侠说过，我们做的一切其实并不重要，重要的是我们选择给后代留下什么。而蜘蛛侠是托尼留给我们最好的遗产。', 10, '2019-07-13 11:39:30');
INSERT INTO `comment` VALUES (27, 4, '多年以后，面对敌人，蜘蛛侠彼得·帕克将会回想起，托尼·斯塔克带他见识超级英雄们的那个遥远的下午。 两个彩蛋比正片有意思', 7, '2019-07-13 11:39:41');
INSERT INTO `comment` VALUES (28, 4, '轻轻松松、啪啪砰砰，这样的超级英雄电影不挺好？温子仁真DC良心大管家——从头到尾堆特效，经费才烧1.6亿！欣赏不来海王徐锦江，51岁的妮可真的美炸了~~~~~', 6, '2019-07-13 11:39:57');
INSERT INTO `comment` VALUES (29, 4, '天空属于卢卡斯 陆地属于杰克逊 海洋属于温子仁！！！', 2, '2019-07-13 11:40:13');
INSERT INTO `comment` VALUES (30, 4, '特效和场景都非常不错，但是剧情和主角都非常不真实，唯一的真实人类就是那个收到新衣服以后改颜色镶铆钉的生命力很旺盛的青蛙反派。', 8, '2019-07-13 11:40:20');
INSERT INTO `comment` VALUES (32, 5, '3.5；失落的亚特兰蒂斯之国，古远传说提供与一般超英片迥异的丰富背景，DC另辟蹊径，开启美妙神秘的水下世界，星站兵密集，温子仁不负众望且适时塞私货，海沟一战jump scare其乐无穷。视效惊人，音效震人，抛却鸡汤亲情，大场面调度甚是过瘾。妮可基德曼真·女神，形象太契合。', 2, '2019-07-13 11:41:14');
INSERT INTO `comment` VALUES (33, 5, '我宣布！2018就是骨科文艺复兴之年！！！', 9, '2019-07-13 11:41:29');
INSERT INTO `comment` VALUES (38, 2, '毒液好丑啊', 1, '2019-07-21 06:40:43');
INSERT INTO `comment` VALUES (39, 4, '哇，这个毒液真的丑，但是女主真的好看！', 1, '2019-07-21 08:59:44');
INSERT INTO `comment` VALUES (40, 6, '以为是R级片，结果是儿童片。汤老湿毫无邪气只有痞气，把一个反派英雄演得正气凛然到闷，而且毒液跟《寄生兽》一样竟然养着养着就变宠物了77', 1, '2019-07-21 09:04:27');
INSERT INTO `comment` VALUES (41, 5, '无名之辈@@', 3, '2019-07-21 09:05:03');
INSERT INTO `comment` VALUES (42, 5, '你好之华', 5, '2019-07-21 09:05:46');
INSERT INTO `comment` VALUES (43, 6, '你的眼睛像火蜥蜴是我笨拙的情话，疯子离开懦夫是她最凶的咒骂，交换亲人让我的愧疚在博格特前显形，歃血为盟使我的爱在厄里斯镜里再现。点金石可以长生，纳吉尼终会成兽，爱心咒语不能保证天长地久，万咒皆终无法阻止核爆之灾。听说魔法世界也有很多爱恨与无奈，麻瓜世界里今年我的入学信还是被寄丢。', 2, '2019-07-21 09:06:34');
INSERT INTO `comment` VALUES (44, 6, '活人办了葬礼，死人偏剩一口气。手机那头她是暗夜里绽放的花，天台边缘她是绝路尽头的桥。两个抢手机模型的憨皮，却无比清醒地看到对方的痴，何惧陷阱，哪管嫌疑。有的人是还没剥开的蛋壳，有的人是胸口夹带的铁板，有的人是虚张声势的水枪，有的人是无法愈合的伤口。几分痴憨皆是勇，几句咒骂都是爱。', 3, '2019-07-21 09:07:47');
INSERT INTO `comment` VALUES (45, 3, '毒液好恶心，快看吐了。', 1, '2019-07-21 09:08:33');
INSERT INTO `comment` VALUES (46, 6, '在岩井俊二的作品里算不上好，但也不差。里面的“时空信息传递”、“替身与错位”，看似是《情书》的反面，实则挖掘的是家庭代际的空间，引出稍显过满的群戏——每个角色都有互文关系。演员方面重点夸下金马提名的张子枫，没想到她竟是戏眼，两次落泪都是因为她。', 5, '2019-07-21 09:08:54');
INSERT INTO `comment` VALUES (47, 3, '允儿来了zz', 1, '2019-07-21 09:09:21');
INSERT INTO `comment` VALUES (48, 6, '顶顶顶', 4, '2019-07-21 09:09:23');
INSERT INTO `comment` VALUES (49, 6, '别想着拍给年轻人看，拍给人看行不行。', 15, '2019-07-21 09:10:12');
INSERT INTO `comment` VALUES (50, 6, '古天乐又缺钱建学校了', 16, '2019-07-21 09:10:38');
INSERT INTO `comment` VALUES (51, 6, '以为玩三就完结甚至不敢期待怕失望，然而完全是惊喜。新元素加入很出彩，Woody找到归属，我的玩具系列完美结局。', 17, '2019-07-21 09:11:04');
INSERT INTO `comment` VALUES (52, 6, '有点泰国惊悚片的味道了，说实话我好几次被吓的冷汗都出来了；虽然有一些场景还是感觉逻辑不通，但至少画面和节奏不渣。本来我都不知道这部电影，但是我对象说要看，那就看了这部，现在的问题是，他不在家的时候我怎么办？', 18, '2019-07-21 09:11:39');
INSERT INTO `comment` VALUES (53, 6, '一个悲伤的故事：太阳都要毁灭，地球都要流浪了，我国的校服还是这么丑......', 20, '2019-07-21 09:12:06');
INSERT INTO `comment` VALUES (54, 6, '不拍妓女三部曲的陈果就不是陈果了。电影拍得跟开玩笑一样。就像故事的走向，演员的演法，都带着些玩世不恭。而这不是诙谐是轻佻。观众并不想看你们在大银幕开玩笑。', 21, '2019-07-21 09:12:31');
INSERT INTO `comment` VALUES (55, 3, '我的青春也全都是你呀', 26, '2019-07-21 09:19:26');
INSERT INTO `comment` VALUES (56, 3, '我是superAdmin，欢迎大家评论', 1, '2020-02-06 15:00:54');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall`  (
  `hall_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '放映厅编号',
  `hall_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '放映厅名称',
  `hall_capacity` int(10) NOT NULL DEFAULT 144 COMMENT '放映厅容量 默认为144  12 x 12 ',
  `cinema_id` bigint(10) NOT NULL COMMENT '所属影院编号',
  PRIMARY KEY (`hall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES (1, '1号厅', 144, 1);
INSERT INTO `hall` VALUES (2, '1号厅', 144, 2);
INSERT INTO `hall` VALUES (3, '1号厅', 144, 3);
INSERT INTO `hall` VALUES (4, '1号厅', 144, 4);
INSERT INTO `hall` VALUES (5, '1号厅', 144, 5);
INSERT INTO `hall` VALUES (6, '1号厅', 144, 6);
INSERT INTO `hall` VALUES (7, '2号厅', 144, 1);
INSERT INTO `hall` VALUES (8, '2号厅', 144, 2);
INSERT INTO `hall` VALUES (9, '2号厅', 144, 3);
INSERT INTO `hall` VALUES (10, '2号厅', 144, 4);
INSERT INTO `hall` VALUES (11, '2号厅', 144, 5);
INSERT INTO `hall` VALUES (12, '2号厅', 144, 6);
INSERT INTO `hall` VALUES (13, '3号厅', 144, 1);
INSERT INTO `hall` VALUES (14, '1号厅', 144, 7);
INSERT INTO `hall` VALUES (15, '1号厅', 144, 8);
INSERT INTO `hall` VALUES (16, '1号厅', 144, 9);
INSERT INTO `hall` VALUES (17, '1号厅', 144, 10);
INSERT INTO `hall` VALUES (18, '1号厅', 144, 11);
INSERT INTO `hall` VALUES (19, '1号厅', 144, 12);
INSERT INTO `hall` VALUES (20, '1号厅', 144, 13);
INSERT INTO `hall` VALUES (21, '1号厅', 144, 14);
INSERT INTO `hall` VALUES (22, '1号厅', 144, 15);
INSERT INTO `hall` VALUES (23, '1号厅', 144, 16);
INSERT INTO `hall` VALUES (24, '1号厅', 144, 17);
INSERT INTO `hall` VALUES (25, '1号厅', 144, 18);
INSERT INTO `hall` VALUES (26, '2号厅', 144, 7);
INSERT INTO `hall` VALUES (27, '2号厅', 144, 8);
INSERT INTO `hall` VALUES (28, '2号厅', 144, 9);
INSERT INTO `hall` VALUES (29, '2号厅', 144, 10);
INSERT INTO `hall` VALUES (30, '2号厅', 144, 11);
INSERT INTO `hall` VALUES (31, '2号厅', 144, 12);
INSERT INTO `hall` VALUES (32, '2号厅', 144, 13);
INSERT INTO `hall` VALUES (33, '2号厅', 144, 14);
INSERT INTO `hall` VALUES (34, '2号厅', 144, 15);
INSERT INTO `hall` VALUES (35, '2号厅', 144, 16);
INSERT INTO `hall` VALUES (36, '2号厅', 144, 17);
INSERT INTO `hall` VALUES (37, '2号厅', 144, 18);
INSERT INTO `hall` VALUES (38, '3号厅', 144, 3);
INSERT INTO `hall` VALUES (39, '3号厅', 144, 5);
INSERT INTO `hall` VALUES (40, '3号厅', 144, 7);
INSERT INTO `hall` VALUES (41, '3号厅', 144, 10);
INSERT INTO `hall` VALUES (42, '3号厅', 144, 11);
INSERT INTO `hall` VALUES (43, '3号厅', 144, 15);
INSERT INTO `hall` VALUES (44, '3号厅', 144, 18);
INSERT INTO `hall` VALUES (45, 'IMAX厅', 144, 1);
INSERT INTO `hall` VALUES (46, 'IMAX厅', 144, 3);
INSERT INTO `hall` VALUES (47, 'IMAX厅', 144, 8);
INSERT INTO `hall` VALUES (48, 'IMAX厅', 144, 12);
INSERT INTO `hall` VALUES (49, 'IMAX厅', 144, 14);
INSERT INTO `hall` VALUES (50, 'IMAX厅', 144, 16);
INSERT INTO `hall` VALUES (51, 'IMAX厅', 144, 17);

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movie_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '电影编号',
  `movie_cn_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称（中文）',
  `movie_fg_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称（外语）',
  `movie_actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影演职人员',
  `movie_director` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影导演',
  `movie_detail` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影详情',
  `movie_duration` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影时长',
  `movie_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影类型',
  `movie_score` float(10, 1) NULL DEFAULT 0.0 COMMENT '电影评分 默认为0',
  `movie_boxOffice` float(10, 4) NULL DEFAULT 0.0000 COMMENT '电影票房 默认为0',
  `movie_commentCount` bigint(10) NULL DEFAULT 0 COMMENT '电影参评人数 默认为0',
  `movie_releaseDate` date NOT NULL COMMENT '电影上映时间',
  `movie_country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影制片地区',
  `movie_picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影海报',
  `movie_state` int(3) NOT NULL DEFAULT 1 COMMENT '电影状态 默认为1  1：在线 0：下架',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '毒液：致命守护者', 'Venom', '汤姆·哈迪:埃迪·布洛克/毒液,米歇尔·威廉姆斯:安妮·韦英', '鲁本·弗雷斯彻', '身为记者的埃迪·布洛克（汤姆·哈迪饰）在调查生命基金会老板卡尔顿·德雷克（里兹·阿迈德饰）的过程中，事业遭受重创，与未婚妻安妮·韦英（米歇尔·威廉姆斯饰）的关系岌岌可危，并意外被外星共生体控制，他历经挣扎对抗，最终成为拥有强大超能力，无人可挡的“毒液“', '107分钟', '动作，科幻', 7.2, 1.0220, 6, '2019-06-24', '美国', '../upload/movies/Venom.jpg', 1);
INSERT INTO `movie` VALUES (2, '神奇动物：格林德沃之罪', 'Fantastic Beasts: The Crimes of Grindelwald', '埃迪·雷德梅恩:纽特·斯卡曼德,凯瑟琳·沃特斯顿:蒂娜‧戈德斯坦,约翰尼·德普:盖勒·格林德沃', '大卫·叶茨', '在《神奇动物在那里》第一部的结尾，纽特·斯卡曼德（埃迪·雷德梅恩 饰）协助美国魔法国会，将强大的黑巫师盖勒特·格林德沃（约翰尼·德普 饰）抓捕归案。但格林德沃不久便兑现狂言成功越狱，并开始纠集信徒，着手实现他们的邪恶目的：让纯血统的巫师成为统治阶层，镇压一切非魔法生物。为挫败格林德沃的阴谋，阿不思·邓布利多（裘德·洛 饰）向昔日的学生纽特·斯卡曼德寻求帮助。纽特欣然允诺，却没有意识到，他将踏上的会是一段充满艰险的未来征途。此时的魔法世界面临空前的分裂乱局，阶层鸿沟日益加深，爱与忠诚备受考验，至亲好友也可能反目成仇……', '134分钟', '奇幻，冒险', 7.7, 1.0236, 5, '2019-06-25', '美国', '../upload/movies/Fantastic Beasts.jpg', 1);
INSERT INTO `movie` VALUES (3, '无名之辈', 'A Cool Fish', '陈建斌:马先勇,任素汐:马嘉旗,潘斌龙:李海根', '饶晓志', '在一座山间小城中，一对低配劫匪、一个落魄的泼皮保安、一个身体残疾却性格彪悍的残毒舌女以及一系列生活在社会不同轨迹上的小人物，在一个貌似平常的日子里，因为一把丢失的老枪和一桩当天发生在城中的乌龙劫案，从而被阴差阳错地拧到一起，发生的一幕幕令人啼笑皆非的荒诞喜剧', '108分钟', '荒诞，喜剧', 9.2, 1.0315, 5, '2019-07-05', '中国大陆', '../upload/movies/A Cool Fish.jpg', 1);
INSERT INTO `movie` VALUES (4, '名侦探柯南：零的执行人', '名探偵コナン ゼロの執行人', '高山南:江户川柯南,山崎和佳奈:毛利兰,林原惠美:灰原哀', '立川让', '5月1日，东京湾边的新建筑“海洋边缘”将举办首脑云集的东京峰会。然而，峰会开办前一周，会场发生超大规模的爆炸事件，并出现了安室透的身影。疑似恐怖袭击的事件引起了警察部门的严肃调查。在警察局大型搜查会议上，公安部门提交证物，却发现疑犯指纹与毛利小五郎（小山力也 配音）指纹吻合。作为律师的妃英理努力收集证据证明丈夫的无辜，却无力阻止毛利小五郎被收监。看到毛利兰（山崎和佳奈 配音）绝望哭泣的样子，柯南（高山南 配音）决定调查事件真相，还毛利小五郎清白。另一方面，少年侦探团的孩子们正紧密关注着无人探测器“天鹅”的回航任务。行踪诡异的安室透、惨遭陷害的毛利小五郎、错综复杂的警察部门、即将着陆的无人探测器；随着“机密任务”进入倒计时，关乎整个东京的可怕计划拉开帷幕…', '111分钟', '悬疑，冒险，动画', 8.5, 1.0064, 4, '2019-07-13', '日本', '../upload/movies/名探偵.jpg', 1);
INSERT INTO `movie` VALUES (5, '你好，之华', 'Last Letter', '周迅:袁之华,秦昊:尹川,杜江:周文涛', '岩井俊二', '有人慌张得见面，有人简单地告别。姐姐袁之南离世的那个清晨，只匆匆留下一封信和一张同学会邀请函。妹妹之华(周迅 饰)代替姐姐参加，却意外遇见年少时的倾慕对象尹川（秦昊 饰）。往日的记忆在苏醒，但再次相见，已物是人非', '114分钟', '爱情', 7.9, 1.0000, 5, '2019-07-20', '中国大陆、日本', '../upload/movies/Last Letter.jpg', 1);
INSERT INTO `movie` VALUES (6, '恐龙王', 'DINO KING', '吕佩玉:钢妈,王衡:斑大师,孙晔:八百度', '施雅雅', '陆地霸主特暴龙“斑大师”和自己的小儿子“小疙瘩”生活在一起。“小疙瘩”自幼失去了母亲，生性懦弱，严厉的“斑大师”虽然心底十分疼爱自己的孩子，但是急于让“小疙瘩”成长为新的陆地霸主，常常忍不住责骂“小疙瘩”，父子俩虽然相依为命，却始终有一些隔阂。 一天“小疙瘩”被几只邪恶的恐爪龙抓走，“斑大师”踏上漫漫的寻子之路，路途中他结识了有高度近视眼的美甲龙“八百度”，两人穿过“巨蝎峡”、走出“长颈龙绿洲”、踏上火山峡谷，经历了重重难关。而身处险境的“小疙瘩”也结识了一些新的朋友，并且开始和邪恶的恐爪龙斗智斗勇。最终父子两人终于相见，但是却不得不一起面对一个更加凶恶的史前怪物……', '95分钟', '喜剧，动画，冒险', 8.9, 1.0000, 2, '2018-12-10', '中国大陆', '../upload/movies/DINO KING.jpg', 0);
INSERT INTO `movie` VALUES (7, '冰封侠：时空行者', 'Bing Feng Xia II', '甄子丹:贺英,黄圣依:小美,王宝强:萨獒', '叶伟民', '明朝大将军贺英（甄子丹 饰）利用时空金球终于重返明朝，与锦衣卫兄弟萨獒（王宝强 饰）获悉了倭寇和朝廷奸党之间足以倾覆皇权的密谋，绵延400年的惊天危机一触即发。贺英也在红颜知己小美（黄圣依 饰）的帮助下开始了抗倭锄奸和保护族人的战斗', '87分钟', '剧情，动作', 4.1, 1.0000, 3, '2018-09-02', '中国大陆', '../upload/movies/Bing Feng Xia II.jpg', 0);
INSERT INTO `movie` VALUES (8, '梦境之源', 'Source of Dreams', '陈志朋:徐朗,颜丹晨:李雪,方中信:梁文道', '柳珂', '货车司机李昂由于童年时代内向懦弱，颓废度日，频频做噩梦，严重影响了正常的生活，并因此不得不接受心理医生曹井润的催眠治疗，却在梦境中意外卷入一场凶杀案。睿智破案的警探成为凶手，而真正的幕后黑手仍在逍遥法外……', '90分钟', '悬疑，推理', 5.9, 1.0000, 3, '2018-11-16', '中国大陆', '../upload/movies/Source of Dreams.jpg', 0);
INSERT INTO `movie` VALUES (9, '摘金奇缘', 'Crazy Rich Asians', '吴恬敏:朱瑞秋,亨利·戈尔丁:杨尼克,杨紫琼:杨爱莉', '朱浩伟', '新加坡富二代王子杨尼克（亨利·戈尔丁饰）自豪地带着美丽大方、学识傲人的女友朱瑞秋（吴恬敏饰）回家见亲友。而这个巨富大家族对朱瑞秋的态度，与她的想像相差十万八千里远，朱瑞秋一开始以为只是跟深爱的男人轻松浪漫地度假，不料却面对排山倒海般的压力，她必须坚强应对一群有心机的情敌和反对者，但更难搞的竟然是她的准婆婆杨爱莉（杨紫琼饰），因为埃莉诺认为朱瑞秋这个现代美国女孩永远都高攀不上她们家', '120分钟', '喜剧，爱情', 6.1, 1.0000, 4, '2018-11-30', '美国', '../upload/movies/Crazy Rich Asians.jpg', 0);
INSERT INTO `movie` VALUES (10, '海王', 'Aquaman', '杰森·莫玛:海王/亚瑟·库瑞,艾梅柏·希尔德:海后/湄拉,威廉·达福:努迪斯·维科', '温子仁', '在一场狂风暴雨的海边灯塔看守人汤姆·库瑞（特穆拉·莫里森饰）救了受伤的亚特兰蒂斯女王亚特兰娜（妮可·基德曼饰）之后，他们相爱了，生下了拥有半人类、半亚特兰蒂斯人的血统亚瑟·库瑞（杰森·莫玛饰）。为了救自己的爱人和儿子亚特兰娜选择了离开。\r\n几年之后，亚特兰娜被迫回到海底国家缔结政治婚姻，生下儿子奥姆（帕特里克·威尔森饰）。奥姆长大后当上国王对陆地人类充满憎恨，开始吞并海底中发展中的国家的兵力，一举消灭陆地人。奥姆的未婚妻海底王国泽贝尔公主湄拉（艾梅柏·希尔德饰）打算阻止这场战争，她到陆地找回亚瑟，让他以亚特兰娜女王长子身份回亚特兰蒂斯把王位争回来，而且湄拉要协助亚瑟找回能统治大海的失落的三叉戟', '143分钟', '动作，科幻', 7.6, 1.0000, 3, '2018-12-07', '美国、澳大利亚', '../upload/movies/Aquaman.jpg', 0);
INSERT INTO `movie` VALUES (15, '素人特工', 'The Rookies', '王大陆:赵风,张榕容:淼淼', '袁锦麟', '极限运动达人赵风（王大陆 饰），误打误撞闯入了一场国际犯罪交易，不得不跟随国际特工（米拉·乔沃维奇 饰）一起前往布达佩斯。在这里他与废柴刑警淼淼（张榕容 饰）、民间科学家丁山（许魏洲 饰）与待业医生LV（刘美彤 饰）组成一支素人特工小队。这四个特工小白和高级国际特攻米拉一起，与恐怖分子开启了一场又惊又喜的斗争。', '113分钟', '喜剧,动作,冒险', 7.2, 1.0000, 1, '2019-07-12', '中国大陆', '../upload/movies/素人特工.jpg', 1);
INSERT INTO `movie` VALUES (16, '追龙Ⅱ', 'Chasing the Dragon Ⅱ', '梁家辉:龙志强,古天乐:何天', '王晶', '悍匪龙志强（梁家辉 饰），在香港回归前，趁香港英政府不作为，而屡犯巨案，先后绑架富豪利家及雷家之长子，勒索超过二十亿元，事主怕被报复, 交赎款后都不敢报警。中国公安部极为关注，与香港警方合力，派香港警员何天（古天乐 饰）卧底潜入龙志强犯罪团伙，发现他正策划绑架澳门富豪贺不凡，最终陆港警察合力勇擒龙志强，救出贺不凡', '103分钟', '犯罪,剧情,动作', 7.9, 1.0000, 1, '2019-06-06', '中国大陆、中国香港', '../upload/movies/追龙Ⅱ.jpg', 1);
INSERT INTO `movie` VALUES (17, '玩具总动员4', 'Toy Story 4', '汤姆·汉克斯:胡迪,蒂姆·艾伦:巴斯光年', '乔什·库雷', '当邦妮将所有玩具带上房车家庭旅行时，胡迪（汤姆·汉克斯 配音）与伙伴们将共同踏上全新的冒险之旅，领略房间外面的世界有多广阔，甚至偶遇老朋友牧羊女（安妮·波茨 配音）。在多年的独自闯荡中，牧羊女已经变得热爱冒险，不再只是一个精致的洋娃娃。正当胡迪和牧羊女发现彼此对玩具的使命的意义大相径庭时，他们很快意识到更大的威胁即将到来。', '100分钟', '喜剧,动画,奇幻', 9.1, 1.0000, 1, '2019-06-21', '美国', '../upload/movies/玩具总动员4.jpg', 1);
INSERT INTO `movie` VALUES (18, '碟仙', 'Mortal Ouija', '黄奕:梦瑶,范逸臣:项天', '廉涛', '以网络直播为业的单亲妈妈梦瑶（黄奕 饰）带着上幼儿园的女儿雯雯住进了一栋便宜的学区房，然而，屋里的诡异氛围，与不时散发的奇怪恶臭，令梦瑶感到不安。某夜，雯雯竟然在梦游中，玩了前租客遗留的“碟仙”游戏。传说只要玩过的人，七日内必会被碟仙夺命！紧接着，屋内接连发生令人毛骨悚然的怪事。七日大限将至，眼看爱女危在旦夕，为了解开碟仙诅咒，夺回女儿，绝望的妈妈不惜做出了惊人的举动……', '83分钟', '恐怖,惊悚', 7.9, 1.0056, 1, '2019-06-21', '中国大陆', '../upload/movies/碟仙.jpg', 1);
INSERT INTO `movie` VALUES (19, '扫毒', 'The White Storm', '古天乐:苏建秋,刘青云:马昊天', '陈木胜', '以马昊天（刘青云 饰）为首的毒品调查科，与手下张子伟（张家辉 饰）和卧底苏建秋（古天乐 饰）在执行一次跨国的大型扫毒行动中，被毒犯巨头八面佛（卢海鹏 饰）暗中揭发反埋伏，最终全军覆没。面对生死关头，三位主角为求活存，被迫命运扭转，展开一场残酷的人生战役。', '134分钟', '剧情,犯罪', 8.9, 1.0000, 0, '2018-11-21', '中国大陆、中国香港', '../upload/movies/扫毒.jpg', 0);
INSERT INTO `movie` VALUES (20, '流浪地球', 'The Wandering Earth', '吴京:刘培强,屈楚萧:刘启', '郭帆', '近未来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划，即倾全球之力在地球表面建造上万座发动机和转向发动机，推动地球离开太阳系，用2500年的时间奔往另外一个栖息之地。中国航天员刘培强在儿子刘启四岁那年前往国际空间站，和国际同侪肩负起领航者的重任。转眼刘启长大，他带着妹妹朵朵偷偷跑到地表，偷开外公韩子昂的运输车，结果不仅遭到逮捕，还遭遇了全球发动机停摆的事件。为了修好发动机，阻止地球坠入木星，全球开始展开饱和式营救，连刘启他们的车也被强征加入。在与时间赛跑的过程中，无数的人前仆后继，奋不顾身，只为延续百代子孙生存的希望…… 本片根据刘慈欣的同名小说改编。', '125分钟', '剧情,冒险,科幻', 9.2, 1.0000, 1, '2019-07-05', '中国大陆、中国香港', '../upload/movies/流浪地球.jpg', 1);
INSERT INTO `movie` VALUES (21, '九龙不败', 'The Invincible Dragon', '张晋:九龙', '陈果', '警探九龙（张晋 饰），查案方式奇异狠辣却屡建奇功，是叱咤香港警界的精英干探, 但他处事独断爆裂，又被警队视为“偏执狂人”。九龙奉命调查一桩妙龄女警连环被凶杀 案，用尽手段后不仅毫无线索, 他的警花未婚妻方宁（邓丽欣 饰）竟然也在这场抓捕行动中意外失踪。在爱与痛的边缘挣扎的九龙，突然发现女警连环遇害只是第一步，凶手还有着更加血腥的阴谋，自己和未婚妻竟然也被算计其中。此时澳门再度发生女警被杀案，这次的作案手法更加令人发指，但凶手好像故意留下了线索，是危险陷阱还是复仇曙光？九龙义无反顾出发，在好友王梦奇（刘心悠 饰）及国际拳王冼力山（安德森·席尔瓦 饰）的协助下, 与澳门警司曹志德（郑嘉颖 饰）联手展开调查。魔高一丈，道高几何！血债血偿之前，就算流干最后一滴血，也要誓不罢休。', '100分钟', '剧情,动作,犯罪', 5.7, 1.0000, 1, '2019-07-02', '中国大陆、中国香港', '../upload/movies/九龙不败.jpg', 1);
INSERT INTO `movie` VALUES (22, '阿丽塔：战斗天使', 'Alita: Battle Angel', '罗莎·萨拉查:阿丽塔,克里斯托弗·沃尔兹:戴森·艾德博士', '罗伯特·罗德里格兹', '未来26世纪，科技发展，人类与机械改造人共存，弱肉强食是钢铁城唯一的生存法则。依德（克里斯托夫·沃尔兹 饰）是钢铁城著名的改造人医生，他在垃圾场发现了一个半机械少女残躯，依德医生将其拯救后为她取名阿丽塔（罗莎·萨拉扎尔 饰）。阿丽塔虽然重获生命却失去了记忆，如一个新生儿一样对这个世界充满新鲜感。在依德医生与好友雨果（基恩·约翰逊 饰）的帮助下，她逐步适应着新生活和街头险恶。一次偶然的机会，阿丽塔发现自己竟有着惊人的战斗天赋。 一次次猎杀激发着她的觉醒，阿丽塔逐渐明白自己注定为战斗而生，为正义而战。一场揭开自己身世之谜，并打破宇宙旧秩序的史诗级冒险之旅就这样展开。', '122分钟', '动作,冒险,科幻', 9.0, 1.0000, 0, '2019-07-11', '美国', '../upload/movies/阿丽塔：战斗天使.jpg', 1);
INSERT INTO `movie` VALUES (23, 'X战警：黑凤凰', 'X-Men: Dark Phoenix', '苏菲·特纳:琴·格雷/黑凤凰,詹姆斯·麦卡沃伊:查尔斯·泽维尔/X教授', '西蒙·金伯格', '在一次危及生命的太空营救行动中，琴·葛蕾（苏菲·特纳 饰）被神秘的宇宙力量击中，成为最强大的变种人。此后琴不仅要设法掌控日益增长、极不稳定的力量，更要与自己内心的恶魔抗争，她的失控让整个X战警大家庭分崩离析，也让整个星球陷入毁灭的威胁之中……', '114分钟', '动作,冒险,科幻', 7.8, 1.0000, 0, '2019-06-06', '美国', '../upload/movies/X战警：黑凤凰.jpg', 0);
INSERT INTO `movie` VALUES (24, '疯狂的外星人', 'Crazy Alien', '黄渤:耿浩,沈腾:大飞,马修·莫里森:扎克,汤姆·派福瑞:约翰', '宁浩', '耿浩（黄渤 饰）与一心想发大财的好兄弟大飞（沈腾 饰），经营着各自惨淡的“事业”，然而“天外来客”（徐峥 饰）的意外降临，打破了二人平静又拮据的生活。神秘的西方力量也派出“哼哈二将”在全球搜查外星人行踪。啼笑皆非的跨物种对决，别开生面的“星战”，在中国某海边城市激情上演。', '116分钟', '剧情,喜剧,科幻', 8.5, 1.0000, 0, '2019-07-10', '中国大陆、美国', '../upload/movies/疯狂的外星人.jpg', 1);
INSERT INTO `movie` VALUES (25, '八子', 'ADVANCE WAVE UPON WAVE', '刘端端:满崽,邵兵:大牛', '高希希', '上世纪30年代的赣南地区，在这个被称为中国革命“红色摇篮”的地方，曾经有这样一位母亲，她将八个儿子先后送入红军，奔赴战场前线。但战火无情，兄弟中的六人陆续牺牲，只剩下大哥杨大牛和最小的孩子满崽。满崽找到了大牛的部队，成了哥哥麾下的普通一兵，经过一场场战役的淬炼，新兵满崽迅速成长为一个真正的战士。最后的战斗打响了，为了掩护大部队安全撤离，杨大牛带领弟弟满崽和全体战友浴血肉搏，直至弹尽粮绝…… 英雄的身前，是枪林弹雨的沙场，而在英雄的身后，家乡的村庄依然宁静安详，微风吹过金黄的稻浪簌簌作响，一位年迈的母亲正在村头的小路旁孤独的守望……', '121分钟', '战争,历史,动作', 8.4, 1.0118, 0, '2019-06-30', '中国大陆', '../upload/movies/bazi.jpg', 1);
INSERT INTO `movie` VALUES (26, '我的青春都是你', 'Love The Way You Are', '宋威龙:方予可,宋芸桦:周林林,林妍柔:茹婷,黄俊捷:谢端西,金士杰:畜牧系老师', '周彤', '周林林（宋芸桦 饰）高考发挥超常进入东方大学，与同校理科状元方予可（宋威龙 饰）一同进入了最高学府。郎有情妾无意，方予可其实从幼儿园时期就心系周林林，人生若只如初见，儿时的初遇相见便立下了日久的暗恋情愫！但万人瞩目的帅哥方予可身边有天之骄女茹庭（林妍柔 饰），从小暗恋状元对周林林看不顺眼，周林林则对方予可身边的同为校园风云人物的小西学长（黄俊捷 饰）心存爱慕，修习大学恋爱秘籍，苦练恋爱通关技巧，十八般武艺七十二变法轮番上阵！四人之间情感纠葛，在校园里上演了一幕青春爱情喜剧！', '92分钟', '爱情,青春', 7.3, 1.0000, 1, '2019-06-21', '中国大陆、中国台湾', '../upload/movies/我的青春都是你.jpg', 1);
INSERT INTO `movie` VALUES (27, '银河补习班', 'Looking up', '邓超:马皓文,白宇:成年马飞', '俞白眉', '浩瀚太空，航天员意外失联，生命最大的绝境中，他回忆起自己那个最了不起的爸爸。一对父子跨越漫长的时光，守护爱和亲情，故事充满了欢乐、温暖、泪水与奇观。', '147分钟', '剧情,家庭', 9.1, 1.0200, 0, '2019-07-18', '中国大陆', '../upload/movies/银河补习班.jpg', 1);
INSERT INTO `movie` VALUES (28, '12', '123', '123:13', '123', '1231', '123', '123', 6.1, 0.0000, 0, '2020-02-07', '123', '/upload/movies/9b3caf065b044c01b9e0aedc24a4b80a.jpg', 0);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint(10) NOT NULL COMMENT '所属用户编号',
  `schedule_id` bigint(10) NOT NULL COMMENT '所属场次编号',
  `order_position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影票座位 （x排x座）',
  `order_state` int(10) NOT NULL DEFAULT 1 COMMENT '订单状态 0:退票中 1:已支付 2:退票成功',
  `order_price` int(10) NOT NULL COMMENT '订单价格',
  `order_time` datetime(0) NOT NULL COMMENT '订单支付时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('2019072100030210', 3, 25, '2排10座', 1, 38, '2019-07-21 07:01:36');
INSERT INTO `orderinfo` VALUES ('2019072100030306', 3, 310, '3排6座', 1, 40, '2019-07-21 14:44:34');
INSERT INTO `orderinfo` VALUES ('2019072100030307', 3, 26, '3排7座', 0, 40, '2019-07-21 07:07:09');
INSERT INTO `orderinfo` VALUES ('2019072100030409', 3, 26, '4排9座', 1, 40, '2019-07-21 07:14:37');
INSERT INTO `orderinfo` VALUES ('2019072100030508', 3, 310, '5排8座', 2, 40, '2019-07-21 14:44:35');
INSERT INTO `orderinfo` VALUES ('2019072100030603', 3, 310, '6排3座', 1, 40, '2019-07-21 14:44:35');
INSERT INTO `orderinfo` VALUES ('2019072100030606', 3, 310, '6排6座', 1, 40, '2019-07-21 14:44:35');
INSERT INTO `orderinfo` VALUES ('2019072100040606', 4, 27, '6排6座', 1, 55, '2019-07-21 08:55:39');
INSERT INTO `orderinfo` VALUES ('2019072100050506', 5, 65, '5排6座', 2, 45, '2019-07-21 08:52:01');
INSERT INTO `orderinfo` VALUES ('2019072100050507', 5, 65, '5排7座', 0, 45, '2019-07-21 08:52:01');
INSERT INTO `orderinfo` VALUES ('2019072100050509', 5, 135, '5排9座', 1, 32, '2019-07-21 08:50:26');
INSERT INTO `orderinfo` VALUES ('2019072100050510', 5, 135, '5排10座', 1, 32, '2019-07-21 08:50:27');
INSERT INTO `orderinfo` VALUES ('2019072100060502', 6, 136, '5排2座', 1, 34, '2019-07-21 08:50:23');
INSERT INTO `orderinfo` VALUES ('2019072100060503', 6, 136, '5排3座', 1, 34, '2019-07-21 08:50:23');
INSERT INTO `orderinfo` VALUES ('2019072100060504', 6, 136, '5排4座', 1, 34, '2019-07-21 08:50:23');
INSERT INTO `orderinfo` VALUES ('2019072100060509', 6, 122, '5排9座', 1, 28, '2019-07-21 08:52:24');
INSERT INTO `orderinfo` VALUES ('2019072100060602', 6, 153, '6排2座', 0, 32, '2019-07-21 08:52:16');
INSERT INTO `orderinfo` VALUES ('2019072100060603', 6, 153, '6排3座', 1, 32, '2019-07-21 08:52:16');
INSERT INTO `orderinfo` VALUES ('2019072100060604', 6, 103, '6排4座', 0, 35, '2019-07-21 08:53:12');
INSERT INTO `orderinfo` VALUES ('2019072100060605', 6, 103, '6排5座', 1, 35, '2019-07-21 08:53:12');
INSERT INTO `orderinfo` VALUES ('2019072100060606', 6, 103, '6排6座', 1, 35, '2019-07-21 08:53:12');
INSERT INTO `orderinfo` VALUES ('2019072100060703', 6, 65, '7排3座', 1, 45, '2019-07-21 08:50:45');
INSERT INTO `orderinfo` VALUES ('2019072100060704', 6, 65, '7排4座', 1, 45, '2019-07-21 08:50:45');
INSERT INTO `orderinfo` VALUES ('2019072100060705', 6, 65, '7排5座', 1, 45, '2019-07-21 08:50:45');
INSERT INTO `orderinfo` VALUES ('2019072100060706', 6, 65, '7排6座', 1, 45, '2019-07-21 08:50:45');
INSERT INTO `orderinfo` VALUES ('2019072100060709', 6, 122, '7排9座', 0, 28, '2019-07-21 08:52:25');
INSERT INTO `orderinfo` VALUES ('2019072100060803', 6, 158, '8排3座', 0, 35, '2019-07-21 08:51:30');
INSERT INTO `orderinfo` VALUES ('2019072100060804', 6, 158, '8排4座', 0, 35, '2019-07-21 08:51:31');
INSERT INTO `orderinfo` VALUES ('2020020600030208', 3, 27, '2排8座', 1, 55, '2020-02-06 15:25:29');
INSERT INTO `orderinfo` VALUES ('2020020600030312', 3, 30, '3排12座', 1, 55, '2020-02-06 15:52:15');
INSERT INTO `orderinfo` VALUES ('2020020600030410', 3, 30, '4排10座', 1, 55, '2020-02-06 15:52:15');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schedule_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '场次编号',
  `hall_id` bigint(10) NOT NULL COMMENT '所属放映厅编号',
  `movie_id` bigint(10) NOT NULL COMMENT '所属电影编号',
  `schedule_startTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影放映时间',
  `schedule_price` int(10) NOT NULL COMMENT '场次价格',
  `schedule_remain` int(10) NOT NULL COMMENT '剩余座位数 默认=hall_capacity',
  `schedule_state` int(10) NOT NULL DEFAULT 1 COMMENT '场次状态 默认1 1：上映中 0：下架',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (25, 1, 25, '2019-07-21 17:30', 38, 144, 1);
INSERT INTO `schedule` VALUES (26, 7, 25, '2019-07-22 20:00', 40, 143, 1);
INSERT INTO `schedule` VALUES (27, 7, 1, '2019-07-21 19:10', 55, 142, 1);
INSERT INTO `schedule` VALUES (28, 8, 25, '2019-07-23 17:00', 48, 144, 1);
INSERT INTO `schedule` VALUES (29, 1, 20, '2019-07-21 00:00', 38, 144, 1);
INSERT INTO `schedule` VALUES (30, 13, 1, '2019-07-22 19:20', 55, 142, 1);
INSERT INTO `schedule` VALUES (31, 7, 20, '2019-07-21 00:00', 38, 144, 1);
INSERT INTO `schedule` VALUES (32, 13, 20, '2019-07-21 00:00', 38, 144, 0);
INSERT INTO `schedule` VALUES (33, 1, 1, '2019-07-23 20:00', 55, 144, 1);
INSERT INTO `schedule` VALUES (34, 45, 20, '2019-07-22 20:30', 58, 144, 1);
INSERT INTO `schedule` VALUES (35, 8, 25, '2019-07-24 00:00', 39, 144, 1);
INSERT INTO `schedule` VALUES (36, 7, 1, '2019-07-24 20:10', 55, 144, 1);
INSERT INTO `schedule` VALUES (37, 7, 20, '2019-07-22 15:30', 38, 144, 1);
INSERT INTO `schedule` VALUES (38, 8, 20, '2019-07-23 14:20', 39, 144, 1);
INSERT INTO `schedule` VALUES (39, 2, 1, '2019-07-21 10:10', 48, 144, 1);
INSERT INTO `schedule` VALUES (40, 2, 1, '2019-07-22 10:10', 45, 144, 1);
INSERT INTO `schedule` VALUES (41, 8, 20, '2019-07-23 21:45', 39, 144, 1);
INSERT INTO `schedule` VALUES (42, 11, 25, '2019-07-23 12:30', 28, 144, 1);
INSERT INTO `schedule` VALUES (43, 8, 20, '2019-07-23 10:40', 39, 144, 1);
INSERT INTO `schedule` VALUES (44, 29, 25, '2019-07-25 00:00', 40, 144, 1);
INSERT INTO `schedule` VALUES (45, 8, 1, '2019-07-23 10:20', 45, 144, 1);
INSERT INTO `schedule` VALUES (46, 2, 20, '2019-07-22 19:30', 39, 144, 1);
INSERT INTO `schedule` VALUES (47, 8, 1, '2019-07-24 10:20', 45, 144, 1);
INSERT INTO `schedule` VALUES (48, 37, 25, '2019-07-23 20:00', 38, 144, 0);
INSERT INTO `schedule` VALUES (49, 45, 20, '2019-07-23 20:20', 58, 144, 1);
INSERT INTO `schedule` VALUES (50, 7, 20, '2019-07-23 16:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (51, 46, 20, '2019-07-23 15:15', 68, 144, 1);
INSERT INTO `schedule` VALUES (52, 3, 1, '2019-07-23 10:00', 45, 144, 1);
INSERT INTO `schedule` VALUES (53, 14, 20, '2019-07-24 13:00', 39, 144, 1);
INSERT INTO `schedule` VALUES (54, 46, 1, '2019-07-23 19:20', 67, 144, 1);
INSERT INTO `schedule` VALUES (55, 29, 20, '2019-07-24 17:10', 38, 144, 1);
INSERT INTO `schedule` VALUES (56, 9, 1, '2019-07-24 09:40', 45, 144, 1);
INSERT INTO `schedule` VALUES (57, 46, 1, '2019-07-24 19:30', 66, 144, 1);
INSERT INTO `schedule` VALUES (58, 32, 20, '2019-07-23 09:30', 36, 144, 1);
INSERT INTO `schedule` VALUES (59, 24, 3, '2019-07-25 13:35', 45, 144, 1);
INSERT INTO `schedule` VALUES (60, 49, 25, '2019-07-24 10:00', 50, 144, 1);
INSERT INTO `schedule` VALUES (61, 37, 20, '2019-07-23 22:00', 38, 144, 1);
INSERT INTO `schedule` VALUES (62, 5, 1, '2019-07-23 10:15', 43, 144, 1);
INSERT INTO `schedule` VALUES (63, 51, 3, '2019-07-23 17:05', 35, 144, 1);
INSERT INTO `schedule` VALUES (64, 36, 25, '2019-07-23 19:30', 38, 144, 1);
INSERT INTO `schedule` VALUES (65, 35, 3, '2019-07-24 19:05', 45, 138, 1);
INSERT INTO `schedule` VALUES (66, 29, 20, '2019-07-24 07:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (67, 4, 26, '2019-07-23 20:00', 28, 144, 1);
INSERT INTO `schedule` VALUES (68, 16, 3, '2019-07-23 18:05', 40, 144, 1);
INSERT INTO `schedule` VALUES (69, 10, 20, '2019-07-24 13:35', 38, 144, 1);
INSERT INTO `schedule` VALUES (70, 33, 26, '2019-07-24 21:00', 22, 144, 1);
INSERT INTO `schedule` VALUES (71, 4, 1, '2019-07-23 09:45', 43, 144, 1);
INSERT INTO `schedule` VALUES (72, 10, 1, '2019-07-23 19:20', 43, 144, 1);
INSERT INTO `schedule` VALUES (73, 24, 3, '2019-07-25 21:00', 45, 144, 1);
INSERT INTO `schedule` VALUES (74, 11, 21, '2019-07-23 14:15', 36, 144, 1);
INSERT INTO `schedule` VALUES (75, 23, 26, '2019-07-24 13:00', 25, 144, 1);
INSERT INTO `schedule` VALUES (76, 4, 1, '2019-07-24 09:50', 43, 144, 1);
INSERT INTO `schedule` VALUES (77, 31, 3, '2019-07-26 12:45', 35, 144, 1);
INSERT INTO `schedule` VALUES (78, 37, 26, '2019-07-24 19:05', 38, 144, 1);
INSERT INTO `schedule` VALUES (79, 11, 21, '2019-07-23 15:25', 36, 144, 1);
INSERT INTO `schedule` VALUES (80, 10, 1, '2019-07-24 20:00', 43, 144, 1);
INSERT INTO `schedule` VALUES (81, 10, 26, '2019-07-23 22:05', 28, 144, 1);
INSERT INTO `schedule` VALUES (82, 39, 21, '2019-07-23 20:05', 36, 144, 1);
INSERT INTO `schedule` VALUES (83, 11, 1, '2019-07-23 21:10', 44, 144, 1);
INSERT INTO `schedule` VALUES (84, 5, 21, '2019-07-24 10:20', 36, 144, 1);
INSERT INTO `schedule` VALUES (85, 24, 26, '2019-07-24 17:30', 25, 144, 1);
INSERT INTO `schedule` VALUES (86, 31, 26, '2019-07-22 19:00', 28, 144, 1);
INSERT INTO `schedule` VALUES (87, 5, 1, '2019-07-24 09:30', 43, 144, 1);
INSERT INTO `schedule` VALUES (88, 11, 21, '2019-07-24 22:15', 36, 144, 1);
INSERT INTO `schedule` VALUES (89, 17, 26, '2019-07-22 00:00', 29, 144, 1);
INSERT INTO `schedule` VALUES (90, 35, 3, '2019-07-24 18:40', 34, 144, 1);
INSERT INTO `schedule` VALUES (91, 39, 1, '2019-07-24 20:25', 44, 144, 1);
INSERT INTO `schedule` VALUES (92, 12, 21, '2019-07-23 14:10', 29, 144, 1);
INSERT INTO `schedule` VALUES (93, 12, 26, '2019-07-23 22:00', 29, 144, 1);
INSERT INTO `schedule` VALUES (94, 24, 5, '2019-07-21 19:55', 54, 144, 1);
INSERT INTO `schedule` VALUES (95, 12, 21, '2019-07-23 16:05', 29, 144, 1);
INSERT INTO `schedule` VALUES (96, 6, 1, '2019-07-23 10:20', 46, 144, 1);
INSERT INTO `schedule` VALUES (97, 8, 26, '2019-07-23 10:00', 25, 144, 1);
INSERT INTO `schedule` VALUES (98, 47, 24, '2019-07-28 14:45', 33, 144, 1);
INSERT INTO `schedule` VALUES (99, 12, 21, '2019-07-24 10:00', 29, 144, 1);
INSERT INTO `schedule` VALUES (100, 6, 1, '2019-07-23 21:10', 46, 144, 1);
INSERT INTO `schedule` VALUES (101, 29, 26, '2019-07-23 20:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (102, 12, 1, '2019-07-24 10:10', 46, 144, 1);
INSERT INTO `schedule` VALUES (103, 30, 21, '2019-07-23 13:10', 35, 141, 1);
INSERT INTO `schedule` VALUES (104, 12, 1, '2019-07-24 20:40', 46, 144, 1);
INSERT INTO `schedule` VALUES (105, 30, 21, '2019-07-23 21:05', 35, 144, 1);
INSERT INTO `schedule` VALUES (106, 25, 26, '2019-07-24 23:00', 39, 144, 1);
INSERT INTO `schedule` VALUES (107, 28, 21, '2019-07-24 16:05', 38, 144, 1);
INSERT INTO `schedule` VALUES (108, 14, 1, '2019-07-23 19:20', 44, 144, 1);
INSERT INTO `schedule` VALUES (109, 1, 15, '2019-07-23 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (110, 26, 1, '2019-07-24 10:20', 44, 144, 1);
INSERT INTO `schedule` VALUES (111, 51, 22, '2019-07-21 00:00', 59, 144, 1);
INSERT INTO `schedule` VALUES (112, 40, 1, '2019-07-24 22:00', 44, 144, 1);
INSERT INTO `schedule` VALUES (113, 4, 18, '2019-07-25 08:05', 65, 144, 1);
INSERT INTO `schedule` VALUES (114, 36, 22, '2019-07-21 00:00', 58, 144, 1);
INSERT INTO `schedule` VALUES (115, 34, 22, '2019-07-23 13:15', 49, 144, 1);
INSERT INTO `schedule` VALUES (116, 31, 22, '2019-07-23 13:20', 49, 144, 1);
INSERT INTO `schedule` VALUES (117, 16, 17, '2019-07-24 09:10', 35, 144, 1);
INSERT INTO `schedule` VALUES (118, 15, 1, '2019-07-23 20:30', 43, 144, 1);
INSERT INTO `schedule` VALUES (119, 27, 1, '2019-07-24 09:50', 43, 144, 1);
INSERT INTO `schedule` VALUES (120, 47, 18, '2019-07-25 16:30', 54, 144, 1);
INSERT INTO `schedule` VALUES (121, 47, 1, '2019-07-24 20:40', 56, 144, 1);
INSERT INTO `schedule` VALUES (122, 43, 18, '2019-07-24 04:25', 28, 142, 1);
INSERT INTO `schedule` VALUES (123, 1, 15, '2019-07-21 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (124, 16, 1, '2019-07-23 21:20', 41, 144, 1);
INSERT INTO `schedule` VALUES (125, 34, 18, '2019-07-21 17:15', 34, 144, 1);
INSERT INTO `schedule` VALUES (126, 7, 15, '2019-07-22 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (127, 28, 1, '2019-07-24 20:30', 41, 144, 1);
INSERT INTO `schedule` VALUES (128, 17, 1, '2019-07-23 14:15', 42, 144, 1);
INSERT INTO `schedule` VALUES (129, 1, 15, '2019-07-21 20:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (130, 29, 1, '2019-07-24 09:00', 42, 144, 1);
INSERT INTO `schedule` VALUES (131, 7, 15, '2019-07-22 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (132, 36, 22, '2019-07-24 16:20', 48, 144, 1);
INSERT INTO `schedule` VALUES (133, 3, 16, '2019-07-24 10:10', 45, 144, 1);
INSERT INTO `schedule` VALUES (134, 13, 15, '2019-07-23 10:30', 30, 144, 1);
INSERT INTO `schedule` VALUES (135, 25, 4, '2019-07-21 05:25', 32, 142, 1);
INSERT INTO `schedule` VALUES (136, 1, 2, '2019-07-23 10:05', 34, 141, 1);
INSERT INTO `schedule` VALUES (137, 13, 15, '2019-07-23 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (138, 7, 2, '2019-07-23 22:15', 34, 144, 1);
INSERT INTO `schedule` VALUES (139, 48, 22, '2019-07-24 15:25', 58, 144, 1);
INSERT INTO `schedule` VALUES (140, 49, 23, '2019-07-21 15:15', 42, 144, 1);
INSERT INTO `schedule` VALUES (141, 13, 15, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (142, 30, 22, '2019-07-23 16:15', 48, 144, 1);
INSERT INTO `schedule` VALUES (143, 7, 15, '2019-07-24 18:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (144, 13, 2, '2019-07-24 17:10', 34, 144, 1);
INSERT INTO `schedule` VALUES (145, 7, 15, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (146, 25, 2, '2019-07-23 19:30', 33, 144, 1);
INSERT INTO `schedule` VALUES (147, 40, 23, '2019-07-23 10:30', 39, 144, 1);
INSERT INTO `schedule` VALUES (148, 37, 2, '2019-07-24 10:05', 34, 144, 1);
INSERT INTO `schedule` VALUES (149, 26, 23, '2019-07-23 20:15', 39, 144, 1);
INSERT INTO `schedule` VALUES (150, 44, 2, '2019-07-24 19:10', 34, 144, 1);
INSERT INTO `schedule` VALUES (151, 24, 2, '2019-07-22 00:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (152, 32, 23, '2019-07-23 13:30', 40, 144, 1);
INSERT INTO `schedule` VALUES (153, 36, 2, '2019-07-23 00:00', 32, 142, 1);
INSERT INTO `schedule` VALUES (154, 51, 2, '2019-07-24 00:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (155, 10, 23, '2019-07-23 13:20', 39, 144, 1);
INSERT INTO `schedule` VALUES (156, 2, 15, '2019-07-21 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (157, 33, 23, '2019-07-23 19:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (158, 23, 2, '2019-07-23 09:00', 35, 142, 1);
INSERT INTO `schedule` VALUES (159, 2, 15, '2019-07-21 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (160, 35, 2, '2019-07-24 21:00', 35, 144, 1);
INSERT INTO `schedule` VALUES (161, 8, 15, '2019-07-21 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (162, 50, 2, '2019-07-25 20:05', 45, 144, 1);
INSERT INTO `schedule` VALUES (163, 8, 15, '2019-07-21 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (164, 22, 2, '2019-07-22 00:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (165, 27, 23, '2019-07-23 16:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (166, 2, 15, '2019-07-21 20:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (167, 34, 2, '2019-07-23 00:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (168, 43, 2, '2019-07-24 00:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (169, 47, 24, '2019-07-23 16:10', 48, 144, 1);
INSERT INTO `schedule` VALUES (170, 2, 15, '2019-07-23 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (171, 28, 24, '2019-07-23 15:05', 38, 144, 1);
INSERT INTO `schedule` VALUES (172, 8, 15, '2019-07-23 10:30', 30, 144, 1);
INSERT INTO `schedule` VALUES (173, 29, 24, '2019-07-21 15:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (174, 20, 3, '2019-07-23 09:00', 27, 144, 1);
INSERT INTO `schedule` VALUES (175, 8, 15, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (176, 32, 3, '2019-07-24 12:15', 27, 144, 1);
INSERT INTO `schedule` VALUES (177, 34, 24, '2019-07-24 10:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (178, 8, 15, '2019-07-24 13:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (179, 4, 3, '2019-07-23 15:00', 27, 144, 1);
INSERT INTO `schedule` VALUES (180, 8, 15, '2019-07-24 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (181, 10, 3, '2019-07-24 17:00', 27, 144, 1);
INSERT INTO `schedule` VALUES (182, 3, 15, '2019-07-22 09:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (183, 42, 24, '2019-07-24 13:35', 38, 144, 1);
INSERT INTO `schedule` VALUES (184, 25, 3, '2019-07-22 08:00', 26, 144, 1);
INSERT INTO `schedule` VALUES (185, 3, 15, '2019-07-22 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (186, 9, 15, '2019-07-22 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (187, 38, 15, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (188, 37, 3, '2019-07-24 14:05', 26, 144, 1);
INSERT INTO `schedule` VALUES (189, 35, 24, '2019-07-24 16:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (190, 38, 15, '2019-07-25 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (191, 44, 3, '2019-07-25 09:00', 26, 144, 1);
INSERT INTO `schedule` VALUES (192, 3, 15, '2019-07-25 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (193, 1, 4, '2019-07-22 23:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (194, 7, 4, '2019-07-23 23:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (195, 35, 24, '2019-07-24 16:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (196, 4, 15, '2019-07-23 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (197, 13, 4, '2019-07-24 23:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (198, 10, 15, '2019-07-23 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (199, 45, 4, '2019-07-25 23:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (200, 10, 15, '2019-07-24 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (201, 20, 4, '2019-07-23 23:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (202, 10, 15, '2019-07-24 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (203, 20, 4, '2019-07-24 23:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (204, 5, 15, '2019-07-23 11:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (205, 4, 4, '2019-07-23 00:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (206, 10, 4, '2019-07-24 00:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (207, 11, 15, '2019-07-23 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (208, 16, 21, '2019-07-23 13:25', 38, 144, 1);
INSERT INTO `schedule` VALUES (209, 39, 15, '2019-07-23 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (210, 5, 15, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (211, 11, 15, '2019-07-24 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (212, 37, 4, '2019-07-23 15:05', 32, 144, 1);
INSERT INTO `schedule` VALUES (213, 22, 22, '2019-07-23 16:05', 49, 144, 1);
INSERT INTO `schedule` VALUES (214, 44, 4, '2019-07-24 14:10', 32, 144, 1);
INSERT INTO `schedule` VALUES (215, 6, 15, '2019-07-23 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (216, 24, 5, '2019-07-23 04:00', 34, 144, 1);
INSERT INTO `schedule` VALUES (217, 12, 15, '2019-07-23 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (218, 12, 15, '2019-07-24 09:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (219, 42, 22, '2019-07-24 17:00', 48, 144, 1);
INSERT INTO `schedule` VALUES (220, 6, 15, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (221, 1, 16, '2019-07-23 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (222, 36, 5, '2019-07-21 14:54', 34, 144, 1);
INSERT INTO `schedule` VALUES (223, 13, 16, '2019-07-23 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (224, 20, 23, '2019-07-24 18:45', 40, 144, 1);
INSERT INTO `schedule` VALUES (225, 15, 5, '2019-07-23 04:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (226, 7, 16, '2019-07-24 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (227, 42, 5, '2019-07-24 04:00', 34, 144, 1);
INSERT INTO `schedule` VALUES (228, 7, 16, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (229, 4, 23, '2019-07-24 14:15', 39, 144, 1);
INSERT INTO `schedule` VALUES (230, 27, 5, '2019-07-23 05:05', 33, 144, 1);
INSERT INTO `schedule` VALUES (231, 13, 15, '2019-07-24 18:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (232, 2, 16, '2019-07-23 11:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (233, 47, 23, '2019-07-23 20:15', 58, 144, 1);
INSERT INTO `schedule` VALUES (234, 2, 16, '2019-07-23 16:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (235, 2, 16, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (236, 15, 23, '2019-07-24 20:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (237, 8, 16, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (238, 11, 5, '2019-07-24 14:57', 32, 144, 1);
INSERT INTO `schedule` VALUES (239, 2, 16, '2019-07-24 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (240, 27, 5, '2019-07-21 14:58', 33, 144, 1);
INSERT INTO `schedule` VALUES (241, 41, 5, '2019-07-24 07:00', 32, 144, 1);
INSERT INTO `schedule` VALUES (242, 16, 24, '2019-07-23 20:05', 38, 144, 1);
INSERT INTO `schedule` VALUES (243, 3, 16, '2019-07-23 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (244, 22, 5, '2019-07-22 05:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (245, 38, 16, '2019-07-23 19:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (246, 34, 5, '2019-07-23 05:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (247, 9, 15, '2019-07-24 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (248, 41, 24, '2019-07-23 12:00', 38, 144, 1);
INSERT INTO `schedule` VALUES (249, 43, 5, '2019-07-24 05:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (250, 9, 16, '2019-07-24 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (251, 17, 24, '2019-07-24 20:15', 38, 144, 1);
INSERT INTO `schedule` VALUES (252, 4, 16, '2019-07-23 11:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (253, 10, 16, '2019-07-24 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (254, 30, 24, '2019-07-23 14:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (255, 5, 16, '2019-07-23 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (256, 22, 24, '2019-07-23 14:20', 38, 144, 1);
INSERT INTO `schedule` VALUES (257, 5, 16, '2019-07-23 19:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (258, 5, 16, '2019-07-24 13:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (259, 39, 16, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (260, 6, 16, '2019-07-23 00:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (261, 12, 16, '2019-07-24 16:00', 20, 144, 1);
INSERT INTO `schedule` VALUES (262, 1, 17, '2019-07-23 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (263, 7, 17, '2019-07-23 11:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (264, 13, 17, '2019-07-24 07:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (265, 7, 17, '2019-07-24 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (266, 2, 17, '2019-07-23 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (267, 8, 17, '2019-07-23 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (268, 2, 17, '2019-07-24 09:20', 30, 144, 1);
INSERT INTO `schedule` VALUES (269, 8, 17, '2019-07-24 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (270, 3, 17, '2019-07-23 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (271, 9, 17, '2019-07-23 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (272, 38, 17, '2019-07-24 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (273, 4, 17, '2019-07-23 14:00', 20, 144, 1);
INSERT INTO `schedule` VALUES (274, 10, 17, '2019-07-24 14:05', 20, 144, 1);
INSERT INTO `schedule` VALUES (275, 11, 17, '2019-07-23 10:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (276, 11, 17, '2019-07-24 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (277, 12, 17, '2019-07-23 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (278, 12, 17, '2019-07-24 11:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (279, 6, 17, '2019-07-23 09:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (280, 39, 17, '2019-07-23 21:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (281, 39, 17, '2019-07-24 00:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (282, 38, 17, '2019-07-24 08:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (283, 1, 18, '2019-07-23 08:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (284, 7, 18, '2019-07-23 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (285, 13, 18, '2019-07-24 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (286, 1, 18, '2019-07-24 16:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (287, 2, 18, '2019-07-23 17:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (288, 2, 18, '2019-07-23 09:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (289, 2, 18, '2019-07-23 14:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (290, 2, 18, '2019-07-24 10:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (291, 2, 18, '2019-07-24 13:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (292, 3, 18, '2019-07-23 12:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (293, 9, 18, '2019-07-23 20:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (294, 3, 18, '2019-07-23 15:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (295, 9, 18, '2019-07-24 10:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (296, 9, 18, '2019-07-24 11:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (297, 38, 18, '2019-07-24 21:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (298, 10, 18, '2019-07-23 08:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (299, 4, 18, '2019-07-23 11:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (300, 4, 18, '2019-07-24 14:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (301, 10, 18, '2019-07-24 21:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (302, 5, 18, '2019-07-23 08:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (303, 11, 18, '2019-07-24 11:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (304, 39, 18, '2019-07-24 15:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (305, 6, 18, '2019-07-23 10:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (306, 12, 18, '2019-07-24 12:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (307, 12, 18, '2019-07-24 18:00', 33, 144, 1);
INSERT INTO `schedule` VALUES (308, 1, 27, '2019-07-23 00:00', 45, 144, 1);
INSERT INTO `schedule` VALUES (309, 7, 27, '2019-07-24 19:00', 45, 144, 1);
INSERT INTO `schedule` VALUES (310, 8, 27, '2019-07-23 20:00', 40, 140, 1);
INSERT INTO `schedule` VALUES (311, 4, 27, '2019-07-23 16:00', 49, 144, 1);
INSERT INTO `schedule` VALUES (312, 11, 27, '2019-07-24 19:15', 45, 144, 1);
INSERT INTO `schedule` VALUES (313, 8, 27, '2019-07-24 15:00', 35, 144, 1);
INSERT INTO `schedule` VALUES (314, 1, 3, '2020-02-11 00:00', 123, 144, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员账号',
  `user_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员密码',
  `user_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员邮箱',
  `user_role` int(10) NOT NULL DEFAULT 0 COMMENT '会员权限（默认为0）\r\n0：普通会员 1：管理员',
  `user_headImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', 'user', '337872621@qq.com', 0, NULL);
INSERT INTO `user` VALUES (2, 'admin', 'admin', '3456872621@qq.com', 1, '../upload/head/dc56255b1e4f4ad4b0a76a8eb0fc7f45.jpg');
INSERT INTO `user` VALUES (3, 'wxj', '1234', '937872111@126.com', 1, '/upload/head/355f887b0ee8493a8070c89dcdcf1789.jpg');
INSERT INTO `user` VALUES (4, 'lpf', 'lpf', '23546211543@qq.com', 0, '../upload/head/85c888cf36d649d6aaea58f19cc8c143.jpg');
INSERT INTO `user` VALUES (5, 'wzw', 'wzw', '2154698421@126.com', 0, '../upload/head/bdc1cf2d9b9d4d5ca5d7a34f2ebfc5b3.jpg');
INSERT INTO `user` VALUES (6, 'hzw', 'hzw', 'a487953215@163.com', 0, '../upload/head/demo.jpg');
INSERT INTO `user` VALUES (7, 'lsw', 'lsw', '3215644123@qq.com', 0, '../upload/head/84c69b60d91e4c079e249a6cd09ef91c.jpg');
INSERT INTO `user` VALUES (8, 'bg12356484', '6484', '910050724@qq.com', 0, '../upload/head/demo.jpg');
INSERT INTO `user` VALUES (9, 'ao13546954', '6954', 'hsw236413512@163.com', 0, NULL);
INSERT INTO `user` VALUES (19, 'jd15154478', '4478', '5648132142@163.com', 0, '../upload/head/dc56255b1e4f4ad4b0a76a8eb0fc7f45.jpg');
INSERT INTO `user` VALUES (20, 'sn46845411', '5411', 'gs15648231@126.com', 0, '../upload/head/84c69b60d91e4c079e249a6cd09ef91c.jpg');
INSERT INTO `user` VALUES (21, 'gs12314864', '4864', '2154678122@qq.com', 0, '../upload/head/84c69b60d91e4c079e249a6cd09ef91c.jpg');
INSERT INTO `user` VALUES (22, 'jd12315164', '5164', '211215484@qq.com', 0, '../upload/head/dc56255b1e4f4ad4b0a76a8eb0fc7f45.jpg');
INSERT INTO `user` VALUES (23, 'kl15645641', '5641', 'g123456412@163.com', 0, '../upload/head/dd7cf74e264247ffbe888c4e163fb9ed.jpg');
INSERT INTO `user` VALUES (24, 'kd1231854', '1854', '123484547@qq.com', 0, NULL);
INSERT INTO `user` VALUES (25, 'tw1123484', '3484', '988744641@qq.com', 0, '../upload/head/dc56255b1e4f4ad4b0a76a8eb0fc7f45.jpg');
INSERT INTO `user` VALUES (26, 'if48648411', '8411', 'u365484741@163.com', 0, '../upload/head/dd7cf74e264247ffbe888c4e163fb9ed.jpg');
INSERT INTO `user` VALUES (27, 'od1561487', '1487', '1564562314@qq.com', 0, NULL);
INSERT INTO `user` VALUES (28, 'jd54687233', '7233', '165484754@qq.com', 0, NULL);
INSERT INTO `user` VALUES (29, 'test', '123', '123', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
