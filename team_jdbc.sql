/*
 Navicat Premium Data Transfer

 Source Server         : team_jdbc
 Source Server Type    : MySQL
 Source Server Version : 50017
 Source Host           : localhost:3306
 Source Schema         : team_jdbc

 Target Server Type    : MySQL
 Target Server Version : 50017
 File Encoding         : 65001

 Date: 24/07/2024 07:28:13
*/

-- SET NAMES utf8;
-- SET FOREIGN_KEY_CHECKS = 0;
drop database if exists `team_jdbc`;
create database team_jdbc;
use team_jdbc;
set names gb2312;
-- ----------------------------
-- Table structure for guide
-- ----------------------------
DROP TABLE IF EXISTS `guide`;
CREATE TABLE `guide`  (
  `gId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gImage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY USING BTREE (`gId`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of guide
-- ----------------------------
INSERT INTO `guide` VALUES (1, '“农业农村部将联合市场监管总局等有关部门积极推进宠物相关标准研制；强化宠物饲料监督管理；研究完善宠物用药和医疗器械研发、准入制度；规范宠物诊疗秩序。金融监管总局将继续鼓励和支持财险公司针对宠物相关健康风险等特点，开发设计差异化保险产品，持续提升宠物保险服务质效。”\n
7月12日，农业农村部官网发布“答复关于推动宠物经济健康发展的建议”。\n
在十四届全国人大二次会议上，骞芳莉代表提出了关于推动宠物经济健康发展的建议（第4672号）。农业农村部回复称，近年来，市场监管总局高度重视宠物标准研制工作。截至目前，批准发布多项宠物食品领域国家标准，为宠物食品产品质量监管提供依据，促进宠物食品质量提升。农业农村部着力加强宠物饲料监督管理，制定印发一系列规范性文件，指导地方依法开展宠物饲料管理工作，规范宠物饲料市场秩序，不断提高宠物饲料质量安全水平。
下一步，农业农村部将联合市场监管总局等有关部门积极推进宠物相关标准研制，充分发挥标准引领作用；强化宠物饲料监督管理，进一步健全宠物饲料管理制度体系，鼓励支持宠物饲料企业研发创制新产品，促进我国宠物食品品质提升。\n
在加强和优化宠物健康服务供给方面，农业农村部不断强化宠物用药、诊疗、防疫管理，引导宠物健康服务发展。一是通过支持专用、鼓励转化、优化审批等综合举措，不断丰富宠物用药品种。二是完善动物诊疗行业相关法规制度，进一步规范从事动物诊疗活动的机构和兽医人员管理。三是联合市场监管总局集中开展规范宠物诊疗秩序专项整治行动，有力规范了宠物诊疗秩序。市场监管总局批准发布多项宠物诊疗领域国家标准，为宠物疫病防控、疾病诊疗、诊疗场所管理提供标准支撑，还对宠物医疗供给、费用居高不下的情况进行了深入调查研究，依法查处价格欺诈等违法违规行为。此外，金融监管总局鼓励和支持财险公司针对宠物相关健康风险和责任风险特点，开发设计差异化的保险产品。\n
下一步，农业农村部将持续优化兽药审批服务，研究完善宠物用药和医疗器械研发、准入制度；会同有关部门加强动物诊疗活动监管，进一步规范宠物诊疗秩序；优化执业兽医继续教育机制，促进宠物诊疗水平不断提升。金融监管总局将继续鼓励和支持财险公司针对宠物相关健康风险等特点，开发设计差异化保险产品，持续提升宠物保险服务质效。', '涉及宠物饲料、医疗、保险 农业农村部回复了', './img/guide_1.jpg');
INSERT INTO `guide` VALUES (2, '近年来，宠物市场的细分品类消费现状及新趋势在不断变化，其中仅食品、用品便撑起了千亿市场。艾媒咨询最新公布的数据显示，2023年宠物食品行业市场规模1900亿元，同比增速20.1%。食品作为宠物行业占比最大的细分“刚需”市场，“喵星人和汪星人应该吃点啥”一直是整个行业以及养宠人最为关注的问题之一。\n
“00后”宠主琪琪告诉记者，“我平时会给猫吃些营养品，一方面是想要美毛、调理泪痕，另一方面是想调理肠胃、保护关节。”\n
目前宠主在为宠物挑选营养品时的考量因素越来越多。数据也证明了这一点，今年天猫国际宠物频道公布的“618”行业战报显示，许多消费者拒绝“奶奶式”喂养，低热、低卡控制体重的猫、狗粮成交量增速超1000%，猫、狗益生菌成交量增速达1100%，猫卵磷脂、鱼油、海藻粉成交量增速近150%，狗氨基酸、维生素、钙铁锌成交量增速近100%。\n
事实上，随着养宠精细化消费趋势发展，整个宠物食品领域正经历着品类爆发的时代。《2023—2024年中国宠物营养品消费报告》显示，宠物消费者为宠物购买营养品倾向多元化、功能化，其中，肠胃调理、强化免疫品类偏好度占比相近，占比分别为40.7%、40.6%。补钙壮骨、护肤美毛的偏好度占比相近，占比分别为37.6%、37.1%。此外，宠主对宠物的口腔也较为关注，购买口腔护理的营养品占比为30.7%。针对这一现状，功能性营养品成为各宠物食品企业的主要研发趋势之一。\n
在年轻人眼中，养宠物已经不是“给口饭就能活”，它们是家人，是朋友。年轻人愿意投入更多金钱、精力去关注宠物的健康需求。中国数实融合50人论坛智库专家洪勇认为，科学养宠、精细养宠的概念出现主要是因为在社会经济的高速发展和居民生活水平的大幅提升的环境下，人们对于宠物的关注度和投入不断增加。宠物主人把宠物视为家庭成员，因此更倾向于采用科学的方法来照顾宠物的饮食、健康和心理需求，追求更高质量和个性化的宠物养护方式。\n
像琪琪一样以改善已出现的体表症状为目的和以预防保护为目的而购买宠物营养品的消费者还有很多，更有部分消费者认为营养品除了补充营养外还可以作为零食。业内人士认为，部分消费者对宠物营养品的定位较为模糊，应提高宠主对营养品的市场教育，突出宠物营养品特征。此外，“零食化”需求的攀升意味着营养品需要更好地兼顾营养补充、营养特性、便携性以及适口性之间的关系。', '宠物喂养从“吃饱”转向“吃好”', './img/guide_2.jpg');
INSERT INTO `guide` VALUES (3, '近期多地持续高温，不断出现热射病患者，甚至还出现了死亡病例。烈日炎炎下，除了人的健康面临高温威胁外，人类的朋友——“狗狗”也面临同样的问题，而且犬比人更容易中暑。\n
近日，有记者在采访发现，成都近期宠物中暑案例增多。“连续高温的那几天，医院每天都有狗狗中暑的病例，还有一例死亡病例。”瑞派宠物医院(锦江畜科店)院长刘超对记者说。\n
夏天狗狗中暑的病例不在少数，刘超表示：“我们分院拿我接诊的病例来说，那段时间几乎每天都会接收一例，有的是下午来，有的是晚上急诊来。”\n
其实犬比人更容易中暑，尤其是短鼻子短腿犬，比如斗牛犬、松狮犬等，这是因为狗狗的汗腺非常少，只分布在脚垫、鼻镜。并且犬只能通过呼吸和分泌大量的唾液来完成散热，所以一旦环境中的温度过高，犬的蒸发散热效率会大打折扣。\n
中国农业大学临床兽医系副教授林珈好曾科普过，狗狗中暑一般可分为日射病和热射病，日射病是指犬的头部持续受到强烈日光照射，日光中的紫外线穿过颅骨直接作用于脑膜和脑组织，导致犬脑组织损伤和中枢神经系统出现机能障碍；热射病则是指，犬长时间处在潮湿闷热的环境中，其新陈代谢旺盛，机体产生的热量无法全部排出体外致使体内热量过度蓄积，引发严重的中枢神经系统功能紊乱。\n
狗狗中暑有什么症状？\n
若是发现狗狗目光呆滞、呼吸急促、口龈发红、大量流涎，可以初步判断为中暑。如果狗狗的体温长时间超过正常体温的上限（39.5℃），出现精神沉郁、步态不稳等情况，那就可以直接判断为中暑。', '小心高温天气宠物中暑！狗狗也会患“热射病”', './img/guide_3.png');
INSERT INTO `guide` VALUES (4, '现在随着人民生活水平的不断提高，宠物成为我们生活中不可或缺的东西，养宠物的好处还是蛮多的，有了宠物的陪伴人们也不会觉得孤独，同时养宠物的能使人变得更自律，因为主人每天需要定时定量的给它喂食，还要陪它出门去玩。此外养宠物还能起到减压的作用，现在人们工作压力都比较大，如果忙碌了一天之后，回到家里面就能看到非常可爱的宠物，那么心情瞬间就能变好了，能缓解焦虑，释放压力。除了大家熟悉的小猫、小狗等，哪些宠物最受欢迎？今天小编就为大家列举了7类宠物，看看有没有你饲养的宠物。

第一类：宠物狗
宠物狗是人们为了消除孤寂或出于娱乐目的而豢养的犬类动物。狗是动物界忠诚的代表，狗是从狼进化而来的，已被人类驯化了近万年，其嗅觉灵敏，动作敏捷，善解人意，忠于主人。目前市场上各种体形优美的狗早已成为最受喜爱的宠物之一。比较流行的宠物狗有：中华田园犬、哈士奇、柯基、柴犬、萨摩耶、金毛、德国牧羊犬、拉布拉多、贵宾犬、比熊犬、边境牧羊犬、阿拉斯加、藏獒等等。狗狗天生活泼、精力旺盛，需要每天到户外遛弯、来释放它的精力。如果长期将狗狗关在家里，容易出现心情焦虑不安、脾气暴躁等情况。一般女生更喜欢养体型娇小宠物狗，比如贵宾犬，萨摩耶，比熊犬等，而男生更偏向于高大威猛的，比如哈士奇，牧羊犬，藏獒等，是不是大部分男生心中都有一个藏獒梦呢？小编本身也是喜欢中华田园犬的，看起来呆萌又不失威武。你喜欢哪种宠物狗呢？

第二类 宠物猫
宠物猫可算是一种完美的动物，大自然把它安排得十全十美：猫长得好看、恪尽职守、独立生活、不依赖主人，贡献的多，索取的少。撸猫已成了大多数人生活的一部分，或许是因为猫猫的呆萌、温柔，可爱、傲娇、懒散、治愈，干净更能满足人们的征服欲以及陪伴、减压、治愈的需求吧，所以人类选择了猫做宠物。比较流行的宠物猫有：加菲猫，折耳猫，英国短毛猫，美国短毛猫，波斯猫，布偶猫，缅因猫，橘猫，狸花猫，金吉拉猫等等。猫咪的优点比较爱干净，讲卫生，不需要像狗狗一样经常洗澡；同时猫咪也不需要带出去遛，它们可以在猫砂盆里面排便排尿。坏处就是猫咪掉毛，主人衣物、家具上特别容易沾染上很多猫毛；猫咪和狗狗相比不容易驯服，它们比较高冷。

第三类 宠物鸟
我国现在法律保护野生鸟是非常严格的，不是什么鸟都可以养，画眉、百灵、绣眼、鹩哥现在都是国家二级保护动物，饲养国家二级保护动物一但被举报或者被警察蜀黍发现，会面临巨额罚款，情节严重还会面临牢狱之灾。黄雀、麻料、辣嘴、乌鸫也是三有保护动物，饲养一只可能会面临上千元罚款和批评教育。可以合法饲养鸟类有人工繁殖文鸟类：比如七彩文鸟、白文鸟、灰文鸟等，此外鹦鹉御三家虎皮鹦鹉，玄凤鹦鹉，桃面类牡丹鹦鹉，这三种鹦鹉个人可以大胆买卖和繁殖交易。虎皮鹦鹉因为价格便宜，也是饲养最多的鹦鹉之一。女孩子养玄凤鹦鹉的比较多，鹦鹉它外观漂亮。还特别的粘人。

第四类 观赏鱼
现在不少人都喜欢在室内用鱼缸养一些观赏鱼，可以净化心灵，舒缓身心、还有些人认为客厅中养鱼提升财运，因此现在许多家庭喜欢在家里养鱼。一般金鱼的生命力都比较强、比较耐养，尤其是七彩神仙、锦鲤、金鱼等色彩鲜艳，鱼性温和，容易养活。让饲养的人心情也比较愉悦，而且锦“鲤”或“金”鱼，其谐音“利”和“金”，都与人的财富有关，因此较受中国人的一喜爱。家里养鱼可以给家里带来自然的气息，在家中饲养一缸金鱼,不仅可为家居添上生气，茶余饭后观赏一下它们悠闲的泳姿,更可以收松弛神经之效。同时鱼缸的也能增加观赏性，坏处是容易潮湿，导致一些地方滋生菌类。一定不要将鱼缸放到光照强和声音比较吵地地方，这样会影响鱼的健康。另外，也不要将其放到卧室里，这不方便换水，而且增大了湿气，容易导致物品发霉。

第五类 兔子和乌龟
在大多人的印象中兔子是一种吃得多拉得多，到处乱拉，还不粘人动物，为何还会有人把它们当宠物来喂养？其实养兔子大多数女生其实原因很简单，兔子毛茸茸，外观可爱，性格温和安静。兔子也能够让我们的生活变得丰富多彩，在孤单寂寞的时候可以有一只兔子陪伴，让你生活不再那么压抑，随时随地可以撸撸兔子的毛。 “千年王八万年龟”，乌龟的寿命是比较长的，乌龟对于部分不希望看到自己和宠物生离死别的人来说是不错的选择，甚至可以说是最佳的选择。此外乌龟是最省事的宠物之一，不太需要主人经常照顾，只要主人每天按时给它投喂食物，定期给它换水，冬天时给它提供一个合适的冬眠环境，就能确保它能顺利地生存下去。因此，对于一些没有太多时间照顾宠物但又想养宠物的人来说，乌龟确实是一个很好的选择。乌龟和兔子一样，都是很安静的动物，几乎听不到它的叫声。对于喜欢安静的人来说乌龟和兔子是最佳选择宠物。

第六类 仓鼠和松鼠
仓鼠是一种经济型宠物宠物价格不是很贵，大众都可以接受并且饲养成本与其他宠物相比偏低这很大程度上决定了它在宠物界的地位，其次养一只仓鼠不需要花费太多的精力，不需要给它洗澡，剪指甲，不需要带它出去遛弯，给它一个笼子，铺上木屑，放上浴沙、跑轮，合理喂食，不用花费太多精力，你就有基本条件养一只仓鼠了，再次仓鼠活动范围小 ，性格大多胆小，无法对人造成严重伤害，并且激起你的保护欲，让你在它面前能有成就感。常见的宠物松鼠有魔王松鼠、雪地松鼠、红腹松鼠等。魔王松鼠野性比较大，容易咬人；雪地松鼠夏季皮毛棕色红色，冬季为纯白色，颜值较高；红腹松鼠容易亲人、互动性强，从小开始饲养的会黏主人。红腹松鼠是松鼠类饲养比较普遍的宠物之一。宠物松鼠多以壳斗科植物的种子为食。松鼠基本不挑食，可以喂食瓜子、葵花籽、松子等坚果类食物。

第七类 异宠
异宠有别于猫、狗、鸟、观赏鱼等传统宠物，未经过人类成千上万年的驯化，多数仍属于野生动物。异宠也被称作另类宠物，最先兴起于欧美、日本等国家，后在我国逐渐流行，是指被人们当作宠物饲养和观赏的野生动物，包括两栖类、爬行类、兽类等脊椎动物和部分无脊椎动物。根据不同的类别，异宠可以分为以下几类：
①水族宠物：巨骨舌鱼、海星、海葵、虾类、海螺、水母、陆生寄居蟹等；
②哺乳动物：主要是如海狸鼠、荷兰猪、香猪、雪狐、赤狐、雪貂等；
③爬行类：陆蜥蜴、暹罗鳄、非洲侏儒鳄、玉米锦蛇等；
④昆虫类：如蚂蚁、马达加斯加蟑螂、竹节虫、螳螂、蝶类；
⑤节肢动物类：红玫瑰蜘蛛、帝王蝎、蜈蚣等。
异宠并非都适合饲养，如存在攻击性、携带病毒等问题；异宠中有不少属于入侵物种，会对生态环境造成破坏；此外，如果打着异宠的名义贩卖野生动物还涉嫌触犯法律。鳄龟、鳄雀鳝、红火蚁等 这些异宠都是常见的外来入侵物种，会对当地生态系统造成破坏，进而还会造成人身损害及财产损失。
', '7类最受欢迎宠物，你家养的哪种？最后一种女生很少养吧？', './img/guide_4.jpg');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `iId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iInventory` int(11) NULL DEFAULT NULL,
  `iPrice` double NULL DEFAULT NULL,
  `iIntroduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `iImage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY USING BTREE (`iId`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, '按键宠物梳', 195, 8.9, '宠物猫咪狗狗脱毛梳子 猫毛清理器 泰迪专用 梳毛撸毛神器 狗毛刷用品', './img/item_1.png');
INSERT INTO `item` VALUES (2, '猫砂盆', 299, 99, '猫砂盆 全封闭超大号 防臭猫厕所防外溅 封闭式猫沙盆 大号猫屎盆幼猫', './img/item_2.png');
INSERT INTO `item` VALUES (3, '藤编猫窝', 250, 119, '藤编猫窝 四季通用 夏天凉席窝 阳台秋千 宠物猫床 猫咪摇篮 超级大吊篮', './img/item_3.png');
INSERT INTO `item` VALUES (4, '水粮碗', 300, 36.9, '猫碗双碗 自动饮水 自动喂食器 猫盆食盆狗食盆狗碗 喝水一体幼猫粮碗', './img/item_4.png');
INSERT INTO `item` VALUES (5, '沐浴露', 200, 39.9, '奥芬洁狗狗沐浴露 猫狗宠物沐浴露 洗澡液 除螨抑菌止痒除臭 持久留香', './img/item_5.png');
INSERT INTO `item` VALUES (6, '磨牙棒', 250, 2.89, '猫玩具 薄荷球 木天蓼磨牙棒 猫咪磨牙 逗猫棒 自嗨解闷神器 小猫咬用品', './img/item_6.png');
INSERT INTO `item` VALUES (7, '宠物窝', 99, 49.9, '秋冬加厚长毛绒 圆形宠物窝垫 深度睡眠猫窝狗窝 中小型犬', './img/item_7.png');
INSERT INTO `item` VALUES (8, '自动喂食器', 100, 36.9, '猫咪饮水机 猫粮自动喂食器 猫狗狗喝水神器 宠物流动喂水 狗水壶用品', './img/item_8.png');
INSERT INTO `item` VALUES (9, '宠物背包', 300, 22.2, '徕本猫包 外出便携猫咪太空舱 书包手提斜跨大容量 狗狗宠物背包', './img/item_9.png');
INSERT INTO `item` VALUES (10, '宠物鸡胸肉零食', 500, 97.99, '乐乐猫冻干 鸡肉粒 猫零食 鸡胸肉 宠物猫咪增肥 发腮狗狗成猫幼猫冻干', './img/item_10.png');
INSERT INTO `item` VALUES (11, '驱虫项圈', 200, 4.7, '狗狗驱虫项圈 猫咪驱蚊猫圈 去防虱子除跳蚤药颈圈 宠物用品小型大型', './img/item_11.png');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `oEvaluate` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isPet` int(11) NULL DEFAULT NULL,
  `Id` int(11) NULL DEFAULT NULL,
  `uId` int(11) NULL DEFAULT NULL,
  `oState` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`oId`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '宠物很乖很聪明，给好评！', 1, 7, 2, '已完成', '2024-07-24 03:22:19');
INSERT INTO `order` VALUES (2, '暂无评价', 0, 1, 2, '已完成', '2024-07-24 03:16:45');
INSERT INTO `order` VALUES (3, '质量非常好，品质有保障，好评！', 0, 2, 3, '已完成', '2024-07-24 04:30:31');
INSERT INTO `order` VALUES (4, '暂无评价', 0, 6, 3, '已完成', '2024-07-24 03:35:28');
INSERT INTO `order` VALUES (5, '品质很好，宠物很舒适，好评！', 0, 7, 3, '已完成', '2024-07-24 04:29:46');

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `pId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pPrice` double NULL DEFAULT NULL,
  `pBreed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pAge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pSex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pIntroduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uId` int(11) NULL DEFAULT NULL,
  `pImage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY USING BTREE (`pId`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (1, '嘎嘎', 45, '柯尔鸭', '1年', '雌', '待出售', '柯尔鸭的性格温和，喜欢与人互动，能够与人类建立亲密关系。它们不会像普通家鸭那样大声叫唤，而是以柔和的叫声与主人进行沟通。这种宠物鸭还具有较强的学习能力，可以很好的对其进行训练。', 0, './img/pet_1.png');
INSERT INTO `pet` VALUES (2, '金金', 2500, '金毛犬', '2年', '雄', '待出售', '金毛狗天生具有友善和亲人的性格。它们对人类非常热情和友好，喜欢与人互动，特别适合家庭饲养。金毛狗非常善于与人建立亲密关系，并表现出极高的耐心，尤其擅长陪伴儿童和老人。', 0, './img/pet_2.png');
INSERT INTO `pet` VALUES (3, '小鼠', 52.84, '西班牙睡鼠', '6个月', '雌', '待出售', '睡鼠属于啮齿目。睡鼠以贪睡得名，睡鼠似乎知道长寿的秘诀；它随时都会打盹，即使在嘈杂纷乱的场所，照样能睡着。\n', 0, './img/pet_3.png');
INSERT INTO `pet` VALUES (4, '小猪', 580.92, '泰国小香猪', '1年', '雄', '待出售', '小香猪通常性格温顺，对人友善。它们喜欢与人互动，喜欢被抚摸和关注，这使得小香猪成为了一种非常适合家养的宠物，尤其是对于有小孩的家庭来说，小香猪可以成为孩子们的好伙伴。', 0, './img/pet_4.png');
INSERT INTO `pet` VALUES (5, '星星', 6800, '星巴斯犬', '3年', '雌', '待出售', '眼睛中等大小为佳，稍成斜角，有风吹草动，会发出尖锐的叫声，是一种紧凑、短背、活跃的玩赏犬。具备可爱的气质，充满活力。', 0, './img/pet_5.png');
INSERT INTO `pet` VALUES (6, '柴柴', 5800, '柴犬', '2年', '雌', '待出售', '柴犬性格活泼、好动，对自己喜欢的玩具会一天到晚地把玩，柴犬特别忠诚，会关心和保护主人，无论何时何地都会密切注意主人的动态，如果有陌生人或外界的威胁，柴犬会立刻警觉并保护主人。', 0, './img/pet_6.png');
INSERT INTO `pet` VALUES (7, '牧牧', 600, '边牧犬', '1.5年', '雄', '已售出', '边境牧羊犬的性格是顽强的、温顺的、敏锐的、警觉的、敏感的、既不凶狠也不扭捏，聪明容易训练，温柔忠诚。边境牧羊犬天生具体强烈的牧羊本能，它能够聪明地观察主人的脸色，从而真正理解主人的意图，更神奇的是它可以通过目光凝视来驱赶羊群。', 2, './img/pet_7.png');
INSERT INTO `pet` VALUES (8, '茶茶', 2500, '茶杯犬', '1年', '雌', '待出售', '茶杯犬的一个显著特点是体型娇小。这种犬的体重通常在2-3公斤之间，肩高不超过20厘米。尽管体型小巧，茶杯犬却拥有精悍和威武的气质，这从它们警觉地站在高处向下观望的行为中可见一斑。这种犬的体型虽然小，但动作轻盈敏捷，身体强健。这种小巧的体型和机敏、活泼的性格使茶杯犬成为一种非常受欢迎的宠物。\n', 0, './img/pet_8.png');
INSERT INTO `pet` VALUES (9, '拉拉', 600, '拉布拉多犬', '3年', '雄', '待出售', '拉布拉多犬天生好动，充满活力。这种犬种在年轻时期特别需要大量的运动和锻炼，无论是跑步、追捕球类还是水上运动，它们都能从中获得巨大的满足感和快乐。除了身体活动，它们也喜欢与主人互动，如玩游戏，并且会一直陪伴在主人身边，除非主人表示累了。这种犬种的好动天性不仅体现在娱乐和游戏中，还表现在日常生活中，如帮助主人取物品等。', 0, './img/pet_9.png');
INSERT INTO `pet` VALUES (10, '泰迪', 850, '泰迪犬', '2年', '雌', '待出售', '泰迪是目前最受人们喜欢的品种之一，它们聪明伶俐、对主人忠诚，外表可爱乖巧、性格活泼好动、喜欢和主人一起玩耍、精力充沛。喜欢撒娇、喜欢黏人、感觉随时随地都跟着主人、总是希望主人得到关怀和抱抱。平时饲养时，需要较多的关心和陪伴。', 0, './img/pet_10.png');
INSERT INTO `pet` VALUES (11, '牧羊', 500, '德国牧羊犬', '4年', '雄', '待出售', '德国牧羊犬的智商在犬种中排名第三，具有出色的理解能力和记忆力，能够迅速理解并执行主人的命令，具有长时间记住训练过的动作。德国牧羊犬性格温顺，对主人绝对忠诚，具有强烈的保护意识和领地意识，会不惜一切保护主人和家庭。', 0, './img/pet_11.png');
INSERT INTO `pet` VALUES (12, '娃娃', 1200, '吉娃娃犬', '1.5年', '雌', '待出售', '吉娃娃外形非常小巧玲珑，携带非常方便，即便宠主想要出远门，不放心把吉娃娃独自放在家里，也不放心拿去寄养的话，那宠主就可以带着吉娃娃一起出门。毕竟这么小的狗狗，带去哪里都是很方便，不像其他中大型犬那样麻烦。', 0, './img/pet_12.png');
INSERT INTO `pet` VALUES (13, '布偶', 800, '布偶猫', '2年', '雌', '待出售', '布偶猫，那如仙女一般高贵的存在。它的外貌虽然看起来高冷，但内心却蕴藏着无限的温暖和亲近。这个猫咪品种以其温顺和亲人的性格而闻名，是家庭的理想伴侣。', 0, './img/pet_13.png');
INSERT INTO `pet` VALUES (14, '矮矮', 500, '矮脚猫', '1年', '雄', '待出售', '矮脚猫开朗活泼、友善、易与人相处、对周围反应敏感。该猫性格友善、聪明，很快便能学会一些小把戏。它像一个长不大的小孩子，终生都保留着小猫的天真活泼的特性。此猫很适合那些希望自己的猫咪永远长不大的人们饲养。', 0, './img/pet_14.png');
INSERT INTO `pet` VALUES (15, '英短', 399, '英国短毛猫', '2.5年', '雌', '待出售', '一颗温暖的心隐藏在灰溜溜的外表下。这是一种极为普遍的猫种，因其友善和亲爱的性格而备受欢迎。这些猫体形圆胖，毛短而密，头颅宽大，脸庞圆润。它们总是显得温和平静，对待人类充满友好。', 0, './img/pet_15.png');
INSERT INTO `pet` VALUES (16, '咪咪', 300, '中华田园猫', '1.5年', '雄', '待出售', '作为中国本土的纯种猫，的确因其适应环境能力强、身体素质高而备受喜爱。它们有独立的性格，喜欢自己独自探索并找到食物。这种自主性使它们成为适合在户外自由活动的伴侣。', 0, './img/pet_18.png');
INSERT INTO `pet` VALUES (17, '小猪', 500, '茶杯猪', '1年', '雌', '待出售', '这是一种小型的猪，只有茶杯那么大，如果养这种小猪的话，主人每天出门都可以带着这种小猪。', 0, './img/pet_19.png');
INSERT INTO `pet` VALUES (18, '哼哼', 800, '几内亚小猪', '6个月', '雄', '待出售', '这种小猪它的体重是非常轻的，身高也不高，它们特别的活泼好动，但是它们警惕性也是非常高的，特别的聪明，很喜欢和自己的主人亲近。', 0, './img/pet_20.png');
INSERT INTO `pet` VALUES (19, '波斯', 0, '波斯猫', '2年', '雌', NULL, '波斯猫，猫中的贵族，高贵华丽，如王子与王妃。这种猫咪以其美丽的背毛和优雅的举止而著称，被喻为猫界的贵族。波斯猫拥有聪明的头脑和敏锐的反应力，因此容易接受训练。它们的性格温和、文雅，不爱多动，适合追求宁静生活的人。', 2, './img/pet_17.png');
INSERT INTO `pet` VALUES (20, '花花', 0, '狸花猫', '3年', '雄', NULL, '狸花猫个性独立，活泼好动，对周围环境的改变非常敏感，一旦饲主有了变更，会对它们的心理造成不同程度的伤害。成年狸花猫并不太爱与人玩耍，但它又会时刻出现于人的视力范围内。如果喜欢含蓄、自信又忠诚的猫种，那么，狸花猫是不错的选择。', 3, './img/pet_16.png');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `sId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sPrice` double NULL DEFAULT NULL,
  `uId` int(11) NULL DEFAULT NULL,
  `sState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sIntroduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pId` int(11) NULL DEFAULT NULL,
  `sTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sImage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY USING BTREE (`sId`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (1, '宠物寄养', 300, NULL, NULL, '提供宠物日托、短期或长期住宿服务。', NULL, '2024-07-24 03:13:34', './img/service_1.png');
INSERT INTO `service` VALUES (2, '宠物美容', 200, NULL, NULL, '提供洗澡、修剪指甲、剪毛、清洁耳朵等服务，让宠物看起来更整洁美观。', NULL, '2024-07-24 03:13:34', './img/service_2.png');
INSERT INTO `service` VALUES (3, '宠物医疗', 500, NULL, NULL, '提供各种常规和紧急的兽医服务，如注射疫苗、治疗疾病等。', NULL, '2024-07-24 03:13:34', './img/service_3.png');
INSERT INTO `service` VALUES (4, '宠物训练', 300, NULL, NULL, '提供宠物行为训练，教导宠物基本的社交礼仪、指令和技能。', NULL, '2024-07-24 03:13:34', './img/service_4.png');
INSERT INTO `service` VALUES (5, '宠物接送', 98, NULL, NULL, '提供宠物接送服务，将宠物从家中或其它场所接到指定地点', NULL, '2024-07-24 03:13:34', './img/service_5.png');
INSERT INTO `service` VALUES (6, '宠物陪伴', 68, NULL, NULL, '提供宠物陪伴服务，让宠物在主人不在家的时候不感到孤单。', NULL, '2024-07-24 03:13:34', './img/service_6.png');
INSERT INTO `service` VALUES (7, '宠物摄影', 88, NULL, NULL, '提供宠物摄影服务，记录宠物的美好瞬间。', NULL, '2024-07-24 03:13:34', './img/service_7.png');
INSERT INTO `service` VALUES (8, '宠物摄影', 88, 2, '已预约', '提供宠物摄影服务，记录宠物的美好瞬间。', 7, '2024-07-29 14:00:00', './img/service_7.png');
INSERT INTO `service` VALUES (9, '宠物美容', 200, 2, '已预约', '提供洗澡、修剪指甲、剪毛、清洁耳朵等服务，让宠物看起来更整洁美观。', 19, '2024-07-29 10:00:00', './img/service_2.png');
INSERT INTO `service` VALUES (10, '宠物陪伴', 68, 2, '已预约', '提供宠物陪伴服务，让宠物在主人不在家的时候不感到孤单。', 19, '2024-07-29 16:00:00', './img/service_6.png');
INSERT INTO `service` VALUES (11, '宠物摄影', 88, 3, '已预约', '提供宠物摄影服务，记录宠物的美好瞬间。', 20, '2024-07-01 10:00:00', './img/service_7.png');
INSERT INTO `service` VALUES (12, '宠物寄养', 300, 3, '已预约', '提供宠物日托、短期或长期住宿服务。', 20, '2024-07-29 15:00:00', './img/service_1.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isManager` int(11) NULL DEFAULT NULL,
  `uEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uWallet` double NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`uId`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', 'zhangsan001', 1, '1870485655@qq.com', '19516716909', 3000);
INSERT INTO `user` VALUES (2, '李四', 'lisi002', 0, '2376745411@qq.com', '19516719906', 1999.5);
INSERT INTO `user` VALUES (3, '王五', 'wangwu003', 0, '2796824201@qq.com', '19599061671 ', 2522.2);

SET FOREIGN_KEY_CHECKS = 1;
