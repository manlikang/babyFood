/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : baby_food

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 10/02/2020 20:53:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shouhuoren` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `isdefault` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (10, '付涵111', '18702598180', '江西省南昌市进贤县', 12, '否');
INSERT INTO `t_address` VALUES (11, '付涵', '17679117105', '江西省南昌市青山湖区11', 12, '否');
INSERT INTO `t_address` VALUES (25, '付涵', '13361615339', '广东深圳', 12, '是');
INSERT INTO `t_address` VALUES (26, '滴滴', '12345666666', '我得去我', 14, '否');
INSERT INTO `t_address` VALUES (29, 'QQ', '1232134124', '撒大声地撒', 14, '是');
INSERT INTO `t_address` VALUES (30, '付涵', '1870259180', '123456', 12, '否');
INSERT INTO `t_address` VALUES (31, '热痱粉', '23213213', 'GAERGAF', 14, '否');
INSERT INTO `t_address` VALUES (32, 'xx', '123456', 'xxxx', 28, '是');
INSERT INTO `t_address` VALUES (33, 'xxx', '123456', 'sddsc', 28, '否');
INSERT INTO `t_address` VALUES (34, '123', '123', '123123123', 36, '是');
INSERT INTO `t_address` VALUES (35, '123', '45678', '7897', 12, '否');
INSERT INTO `t_address` VALUES (36, '123', '12312312321', '123123123123123', 41, '是');
INSERT INTO `t_address` VALUES (37, '123', '12312312321', '123123123', 43, '是');

-- ----------------------------
-- Table structure for t_baby
-- ----------------------------
DROP TABLE IF EXISTS `t_baby`;
CREATE TABLE `t_baby`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `like` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_baby
-- ----------------------------
INSERT INTO `t_baby` VALUES (1, '西西', '6个月', 'sliver20191018154238609.jpg', 108);
INSERT INTO `t_baby` VALUES (2, '夏夏', '7个月', 'ChildImg1.jpg', 83);
INSERT INTO `t_baby` VALUES (3, '囡囡', '4个月', 'ac75323d6b6de243-0bd502b2bdc1100a-7883fc234cdefffabed0fa1fa95594e8.jpg', 97);
INSERT INTO `t_baby` VALUES (4, '阳阳', '11个月', 'ChildImg2.jpg', 57);
INSERT INTO `t_baby` VALUES (5, '帅帅', '6个月', 'ac75323d6b6de243-ec94ab63938bc10f-099a73396c3aff7d32222aff6510ca51.jpg', 62);
INSERT INTO `t_baby` VALUES (7, '轩轩11', '3个月', 'sliver20191017193214564.png', 99);
INSERT INTO `t_baby` VALUES (8, '贝贝', '5个月', '4480b228ce6ec061-ebcf520ecd3b3312-cef76970d23b97641b64febb782e7daa.jpg', 36);
INSERT INTO `t_baby` VALUES (9, '秋秋', '7个月', 'ChildImg1.jpg', 66);
INSERT INTO `t_baby` VALUES (10, '楠楠', '4个月', 'ac75323d6b6de243-0bd502b2bdc1100a-7883fc234cdefffabed0fa1fa95594e8.jpg', 85);
INSERT INTO `t_baby` VALUES (11, '球球', '11个月', 'ChildImg2.jpg', 45);
INSERT INTO `t_baby` VALUES (12, '开开', '6个月', 'ac75323d6b6de243-ec94ab63938bc10f-099a73396c3aff7d32222aff6510ca51.jpg', 52);
INSERT INTO `t_baby` VALUES (13, '花花', '5个月', 'd7036c9a17f5fda2-d9a61ab1a5c30897-33c9b3fa2737373abfb9073a5fb7c4ac.jpg', 78);
INSERT INTO `t_baby` VALUES (15, '哒哒', '3个月', 'sliver20191017105506529.jpg', 1000);
INSERT INTO `t_baby` VALUES (16, '123', '123', 'sliver20191017193235198.png', 123);
INSERT INTO `t_baby` VALUES (17, 'aa', '1', 'sliver2019101815425913.jpg', 100);

-- ----------------------------
-- Table structure for t_baby_food
-- ----------------------------
DROP TABLE IF EXISTS `t_baby_food`;
CREATE TABLE `t_baby_food`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mixed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)',
  `net_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quality_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `storage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `eat_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `foodType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `foodpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isdelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `food_price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_baby_food
-- ----------------------------
INSERT INTO `t_baby_food` VALUES (1, '新西兰纽派婴幼儿乳钙60粒装123', '碳酸钙、L-乳酸钙、 维生素A醋酸酯、维生素D3', '1g/包*60包', '新西兰', '36个月', '置阴凉干燥通风处', '	6-36个月 每天一包', '孕产妇', 'HomeProdImg1.jpg', '0', 100);
INSERT INTO `t_baby_food` VALUES (2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '2克/包x10包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '幼儿', 'rutiedanbai.png', '0', 118);
INSERT INTO `t_baby_food` VALUES (3, '\r\n纽派乳铁蛋白调制乳粉', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '135克/罐 3克/包x45包/罐', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '6个月以下：半包/天，\r\n6个月到1岁：1包/天，\r\n1-3岁：1-2包/天，\r\n3岁以上及成人：2-3包/天', '幼儿', 'rutiedanbaitong.jpg', '0', 518);
INSERT INTO `t_baby_food` VALUES (4, '纽派益生菌滴液', '动物双歧杆菌、乳双歧杆菌、鼠李糖乳杆菌', '12毫升', '新西兰', '2年', '贮存在25℃以下阴凉干燥处。每次开启后请拧紧瓶盖。', '每天5-10滴', '婴幼儿', 'yishengjun.png', '0', 328);
INSERT INTO `t_baby_food` VALUES (5, 'DHA藻油软胶囊', 'DHA藻油、核桃油、明胶、甘油、纯化水', '39克(0.65克x60粒)', '新西兰', '3年', '25℃以下阴凉干燥处保存，开封后密闭保存并在保质期前 食用。', '建议每日1~2粒', '婴幼儿', 'zaoyoujiaonan.png', '0', 488);
INSERT INTO `t_baby_food` VALUES (6, '活性免疫蛋白+乳铁蛋白调制乳粉', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)、碳酸钙、', '2克/包x60包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '孕产妇', 'aabb.png', '1', 588);
INSERT INTO `t_baby_food` VALUES (7, '新西兰纽派婴幼儿乳钙60粒装123', '碳酸钙、L-乳酸钙、 维生素A醋酸酯、维生素D3', '1g/包*60包', '新西兰', '36个月', '置阴凉干燥通风处', '	6-36个月 每天一包', '孕产妇', 'HomeProdImg1.jpg', '0', 100);
INSERT INTO `t_baby_food` VALUES (8, '羊奶', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '1g/包*60包', '中国', '6个月', '低温干燥', '热水冲服', '幼儿', 'sliver20191011144929337.png', '0', 321);
INSERT INTO `t_baby_food` VALUES (9, '碳酸钙', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)、碳酸钙、', '2克/包x60包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '孕产妇', 'aabb.png', '1', 588);
INSERT INTO `t_baby_food` VALUES (10, '全脂奶粉', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '2克/包x10包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '幼儿', 'rutiedanbai.png', '0', 118);
INSERT INTO `t_baby_food` VALUES (11, '果糖', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '135克/罐 3克/包x45包/罐', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '6个月以下：半包/天，\r\n6个月到1岁：1包/天，\r\n1-3岁：1-2包/天，\r\n3岁以上及成人：2-3包/天', '幼儿', 'rutiedanbaitong.jpg', '0', 518);
INSERT INTO `t_baby_food` VALUES (12, '乳酸菌', '动物双歧杆菌、乳双歧杆菌、鼠李糖乳杆菌', '12毫升', '新西兰', '2年', '贮存在25℃以下阴凉干燥处。每次开启后请拧紧瓶盖。', '每天5-10滴', '孕产妇', 'yishengjun.png', '0', 328);
INSERT INTO `t_baby_food` VALUES (13, '鱼油胶囊', 'DHA藻油、核桃油、明胶、甘油、纯化水', '39克(0.65克x60粒)', '新西兰', '3年', '25℃以下阴凉干燥处保存，开封后密闭保存并在保质期前 食用。', '建议每日1~2粒', '婴幼儿', 'zaoyoujiaonan.png', '0', 488);
INSERT INTO `t_baby_food` VALUES (14, '蛋白粉', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)、碳酸钙、', '2克/包x60包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '孕产妇', 'aabb.png', '1', 588);
INSERT INTO `t_baby_food` VALUES (15, '牛奶', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '1g/包*60包', '中国', '6个月', '低温干燥', '热水冲服', '幼儿', 'sliver20191011144929337.png', '0', 321);
INSERT INTO `t_baby_food` VALUES (16, '麦片', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '1g/包*60包', '中国', '6个月', '低温干燥', '热水冲服', '婴幼儿', 'sliver20191011145212882.png', '0', 123);
INSERT INTO `t_baby_food` VALUES (17, '铁乳蛋白', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '2克/包x10包', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '建议每日1~2包', '幼儿', 'rutiedanbai.png', '0', 118);
INSERT INTO `t_baby_food` VALUES (18, '乳粉', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', '135克/罐 3克/包x45包/罐', '新西兰', '3年', '在温度低于30°C的凉爽处存放,开盖后请紧盖保存,并在指示日期前食用。', '6个月以下：半包/天，\r\n6个月到1岁：1包/天，\r\n1-3岁：1-2包/天，\r\n3岁以上及成人：2-3包/天', '幼儿', 'rutiedanbaitong.jpg', '0', 518);
INSERT INTO `t_baby_food` VALUES (19, '益酸菌', '动物双歧杆菌、乳双歧杆菌、鼠李糖乳杆菌', '12毫升', '新西兰', '2年', '贮存在25℃以下阴凉干燥处。每次开启后请拧紧瓶盖。', '每天5-10滴', '孕产妇', 'yishengjun.png', '0', 328);
INSERT INTO `t_baby_food` VALUES (20, '鱼油', 'DHA藻油、核桃油、明胶、甘油、纯化水', '39克(0.65克x60粒)', '新西兰', '3年', '25℃以下阴凉干燥处保存，开封后密闭保存并在保质期前 食用。', '建议每日1~2粒', '婴幼儿', 'zaoyoujiaonan.png', '1', 488);
INSERT INTO `t_baby_food` VALUES (22, '123', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', NULL, NULL, '6个月', NULL, NULL, '幼儿', 'sliver20191018111641497.png', '0', 222);
INSERT INTO `t_baby_food` VALUES (23, 'qq', '全脂乳粉、低聚果糖、乳清蛋白粉、乳铁蛋白(1%)', NULL, NULL, '6', NULL, NULL, '婴幼儿', 'sliver20191018154353631.jpg', '0', 121);

-- ----------------------------
-- Table structure for t_baby_food_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_baby_food_detail`;
CREATE TABLE `t_baby_food_detail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `detail_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age_range` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `packing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detail_profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `integral` int(255) DEFAULT NULL,
  `food_id` int(10) DEFAULT NULL,
  `is_delete` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_baby_food_detail
-- ----------------------------
INSERT INTO `t_baby_food_detail` VALUES (1, '新西兰纽派婴幼儿乳钙60粒装', '0-6个月', '39.0g/听', '活性免疫蛋白+乳铁蛋白调制乳粉', '每一位宝宝的降生都是一个幸福开始，而母乳是宝宝最佳的食物。乳铁蛋白是乳汁中一种重要的非血红素铁结合糖蛋白，是人类免疫系统的重要组成物质，可以为婴幼儿提供多种生物功能，尤其是调节免疫和抑菌作用。', ' a.开罐后请盖紧塑料盖，防止微生物及异味污染或杂物掉入，以免影响品质，并于两周内食用完。\r\nb.奶粉冲调后应马上喂哺，喂哺后如有剩余的奶水须倒掉，切勿留作下次喂哺。', 100, 1, 0);
INSERT INTO `t_baby_food_detail` VALUES (2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '不定', '2克/包x10包', '活性免疫蛋白+乳铁蛋白调制乳粉', '乳铁蛋白\r\n\r\n乳铁蛋白是母乳中重要的蛋白质之一，有抑菌作用，帮助宝宝抵抗致病菌，助力宝宝健康成长。\r\n\r\n\r\nα-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 118, 2, 0);
INSERT INTO `t_baby_food_detail` VALUES (3, '\r\n纽派乳铁蛋白调制乳粉', '不定', '135克/罐 3克/包x45包/罐', '乳铁蛋白燕窝酸', 'α-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。\r\n\r\n', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 518, 3, 0);
INSERT INTO `t_baby_food_detail` VALUES (4, '纽派益生菌滴液', '不定', '12毫升\r\n\r\n', '纽派益生菌滴液', '活性益生菌（Bb-12）与益生元（低聚果糖）\r\n\r\n益生菌有利于增加肠道内有益菌群数量，呵护宝宝肠道健康，益生元能促进有益菌群的生长和增殖。', '使用前请摇匀，可以混合在食物中食用。请勿将本品加入热的食物，会破坏益生菌的活性', 328, 4, 0);
INSERT INTO `t_baby_food_detail` VALUES (5, 'DHA藻油软胶囊', '0岁以上', '39克(0.65克x60粒)', 'DHA藻油软胶囊', '智+金装营养组合\r\n\r\n特别针对宝宝的成长需求，提供全方位营养组合：DHA、ARA、叶黄素、胆碱、核苷酸、牛磺酸，有助于宝宝眼脑发育。', '1.建议每日1~2粒。\r\n2.DHA每日推荐食用量≤300毫克，本品每粒含DHA125毫克，建议每日食用量不超过2粒。\r\n3.本品请勿与碳酸饮料同时食用,与其他同类产品同时食用时应该注意用量。\r\n4.本品不能代替母乳及婴幼儿辅助食品。\r\n5.请置于儿童不可触及处。', 488, 5, 0);
INSERT INTO `t_baby_food_detail` VALUES (6, '活性免疫蛋白+乳铁蛋白调制乳粉', '不定', '2克/包x60包', '活性免疫蛋白+乳铁蛋白调制乳粉', '100%原生态牧场奶\r\n\r\n选用位于北纬47°黄金奶源带的原生态牧场鲜奶，鲜奶品质比肩欧盟标准.', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 588, 6, 0);
INSERT INTO `t_baby_food_detail` VALUES (7, '好奶粉', '不定', '135克/罐 3克/包x45包/罐', '好奶粉', '好奶粉', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 325, 7, 0);
INSERT INTO `t_baby_food_detail` VALUES (8, '羊奶', '3~6个月', '2带', '好吃', '超级好吃', '超级好吃', 120, 8, 0);
INSERT INTO `t_baby_food_detail` VALUES (9, '碳酸钙', '6-36个月', '2克/包x60包', '碳酸钙', '每一位宝宝的降生都是一个幸福开始，而母乳是宝宝最佳的食物。乳铁蛋白是乳汁中一种重要的非血红素铁结合糖蛋白，是人类免疫系统的重要组成物质，可以为婴幼儿提供多种生物功能，尤其是调节免疫和抑菌作用。', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 588, 9, 0);
INSERT INTO `t_baby_food_detail` VALUES (10, '全脂奶粉', '3岁以上', '135克/罐 3克/包x45包/罐', '全脂奶粉', '智+金装营养组合\r\n\r\n特别针对宝宝的成长需求，提供全方位营养组合：DHA、ARA、叶黄素、胆碱、核苷酸、牛磺酸，有助于宝宝眼脑发育。', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 118, 10, 0);
INSERT INTO `t_baby_food_detail` VALUES (11, '果糖', '不定', '135克/罐 3克/包x45包/罐', '果糖', '超级好吃', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 518, 11, 0);
INSERT INTO `t_baby_food_detail` VALUES (12, '乳酸菌', '不定', '12毫升', '乳酸菌', '活性益生菌（Bb-12）与益生元（低聚果糖）\r\n\r\n益生菌有利于增加肠道内有益菌群数量，呵护宝宝肠道健康，益生元能促进有益菌群的生长和增殖。', '使用前请摇匀，可以混合在食物中食用。请勿将本品加入热的食物，会破坏益生菌的活性', 328, 12, 0);
INSERT INTO `t_baby_food_detail` VALUES (13, '鱼油胶囊', '0岁以上', '39克(0.65克x60粒)', '鱼油胶囊', '智+金装营养组合\r\n\r\n特别针对宝宝的成长需求，提供全方位营养组合：DHA、ARA、叶黄素、胆碱、核苷酸、牛磺酸，有助于宝宝眼脑发育。', '1.建议每日1~2粒。\r\n2.DHA每日推荐食用量≤300毫克，本品每粒含DHA125毫克，建议每日食用量不超过2粒。\r\n3.本品请勿与碳酸饮料同时食用,与其他同类产品同时食用时应该注意用量。\r\n4.本品不能代替母乳及婴幼儿辅助食品。\r\n5.请置于儿童不可触及处。', 488, 13, 0);
INSERT INTO `t_baby_food_detail` VALUES (14, '蛋白粉', '不定', '2克/包x60包', '蛋白粉', '乳铁蛋白\r\n\r\n乳铁蛋白是母乳中重要的蛋白质之一，有抑菌作用，帮助宝宝抵抗致病菌，助力宝宝健康成长。\r\n\r\n\r\nα-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 588, 14, 0);
INSERT INTO `t_baby_food_detail` VALUES (15, '牛奶', '不定', '1g/包*60包', '牛奶', '乳铁蛋白\r\n\r\n乳铁蛋白是母乳中重要的蛋白质之一，有抑菌作用，帮助宝宝抵抗致病菌，助力宝宝健康成长。\r\n\r\n\r\nα-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 321, 15, 0);
INSERT INTO `t_baby_food_detail` VALUES (16, '麦片', '6-36个月', '1g/包*60包', '麦片', 'α-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。\r\n\r\n', '1.建议每日1~2粒。\r\n2.DHA每日推荐食用量≤300毫克，本品每粒含DHA125毫克，建议每日食用量不超过2粒。\r\n3.本品请勿与碳酸饮料同时食用,与其他同类产品同时食用时应该注意用量。\r\n4.本品不能代替母乳及婴幼儿辅助食品。\r\n5.请置于儿童不可触及处。', 123, 16, 0);
INSERT INTO `t_baby_food_detail` VALUES (17, '铁乳蛋白', '不定', '2克/包x10包', '铁乳蛋白', 'α-乳白蛋白\r\n\r\nα-乳白蛋白具有高度的营养价值，可以提供丰富的必需氨基酸，有助于宝宝体格茁壮成长。\r\n\r\n', '1.建议每日1~2粒。\r\n2.DHA每日推荐食用量≤300毫克，本品每粒含DHA125毫克，建议每日食用量不超过2粒。\r\n3.本品请勿与碳酸饮料同时食用,与其他同类产品同时食用时应该注意用量。\r\n4.本品不能代替母乳及婴幼儿辅助食品。\r\n5.请置于儿童不可触及处。', 118, 17, 0);
INSERT INTO `t_baby_food_detail` VALUES (18, '乳粉', '不定', '135克/罐 3克/包x45包/罐', '乳粉', '100%原生态牧场奶\r\n\r\n选用位于北纬47°黄金奶源带的原生态牧场鲜奶，鲜奶品质比肩欧盟标准.', '1.建议每日1-2包。\r\n2.本品请勿与碳酸饮料同时食用，与其他同类产品同时食用时应该注意用量。\r\n3.本品不能代替母乳及婴幼儿辅助食品。', 518, 18, 0);
INSERT INTO `t_baby_food_detail` VALUES (19, '益酸菌', '不定', '12毫升', '益酸菌', '活性益生菌（Bb-12）与益生元（低聚果糖）\r\n\r\n益生菌有利于增加肠道内有益菌群数量，呵护宝宝肠道健康，益生元能促进有益菌群的生长和增殖。', '使用前请摇匀，可以混合在食物中食用。请勿将本品加入热的食物，会破坏益生菌的活性', 328, 19, 0);
INSERT INTO `t_baby_food_detail` VALUES (20, '鱼油', '6-36个月', '39克(0.65克x60粒)', '鱼油', '智+金装营养组合\r\n\r\n特别针对宝宝的成长需求，提供全方位营养组合：DHA、ARA、叶黄素、胆碱、核苷酸、牛磺酸，有助于宝宝眼脑发育。', '1.建议每日1~2粒。\r\n2.DHA每日推荐食用量≤300毫克，本品每粒含DHA125毫克，建议每日食用量不超过2粒。\r\n3.本品请勿与碳酸饮料同时食用,与其他同类产品同时食用时应该注意用量。\r\n4.本品不能代替母乳及婴幼儿辅助食品。\r\n5.请置于儿童不可触及处。', 488, 20, 0);
INSERT INTO `t_baby_food_detail` VALUES (21, '123', NULL, NULL, NULL, NULL, NULL, NULL, 22, 0);
INSERT INTO `t_baby_food_detail` VALUES (22, 'qq', '123', '13', '12', '', '', 121, 23, 0);

-- ----------------------------
-- Table structure for t_integral
-- ----------------------------
DROP TABLE IF EXISTS `t_integral`;
CREATE TABLE `t_integral`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `detailed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usefulness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `surplus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_integral
-- ----------------------------
INSERT INTO `t_integral` VALUES (1, 12, '全额付款获得', '+3424', '3924');
INSERT INTO `t_integral` VALUES (2, 14, '全额付款获得', '+10736', '11236');
INSERT INTO `t_integral` VALUES (3, 14, '全额付款获得', '+7808', '23468');
INSERT INTO `t_integral` VALUES (4, 14, '全额付款获得', '+7808', '31276');
INSERT INTO `t_integral` VALUES (5, 12, '全额付款获得', '+3416', '3916');
INSERT INTO `t_integral` VALUES (6, 12, '全额付款获得', '+3416', '7332');
INSERT INTO `t_integral` VALUES (7, 14, '全额付款获得', '+6832', '38108');
INSERT INTO `t_integral` VALUES (8, 14, '全额付款获得', '+6832', '44940');
INSERT INTO `t_integral` VALUES (9, 14, '商品抵扣', '-44940.0', '0');
INSERT INTO `t_integral` VALUES (10, 14, '商品抵扣', '-44940.0', '-44940');
INSERT INTO `t_integral` VALUES (11, 14, '全额付款获得', '+3416', '-41524');
INSERT INTO `t_integral` VALUES (12, 14, '全额付款获得', '+3416', '-38108');
INSERT INTO `t_integral` VALUES (13, 14, '全额付款获得', '+13664', '13664');
INSERT INTO `t_integral` VALUES (14, 14, '商品抵扣', '-13663.999999999998', '1');
INSERT INTO `t_integral` VALUES (15, 14, '全额付款获得', '+20496', '20497');
INSERT INTO `t_integral` VALUES (16, 14, '商品抵扣', '-20497.0', '0');
INSERT INTO `t_integral` VALUES (17, 12, '商品抵扣', '-7331.999999999999', '1');
INSERT INTO `t_integral` VALUES (18, 12, '商品抵扣', '-1.0', '0');
INSERT INTO `t_integral` VALUES (19, 12, '全额付款获得', '+3420', '3420');
INSERT INTO `t_integral` VALUES (20, 12, '商品抵扣', '-3420.0000000000005', '0');
INSERT INTO `t_integral` VALUES (21, 12, '全额付款获得', '+1008', '1008');
INSERT INTO `t_integral` VALUES (22, 12, '全额付款获得', '+488', '1496');
INSERT INTO `t_integral` VALUES (23, 12, '全额付款获得', '+23424', '24920');
INSERT INTO `t_integral` VALUES (24, 14, '全额付款获得', '+23023', '23023');
INSERT INTO `t_integral` VALUES (25, 14, '商品抵扣', '-12635.0', '10388');
INSERT INTO `t_integral` VALUES (26, 28, '全额付款获得', '+1818', '2318');
INSERT INTO `t_integral` VALUES (27, 12, '全额付款获得', '+488', '25408');
INSERT INTO `t_integral` VALUES (28, 12, '全额付款获得', '+3352', '28760');
INSERT INTO `t_integral` VALUES (29, 41, '商品抵扣', '-500.0', '0');
INSERT INTO `t_integral` VALUES (30, 43, '全额付款获得', '+916', '1416');
INSERT INTO `t_integral` VALUES (31, 12, '商品抵扣', '-28760.000000000004', '0');
INSERT INTO `t_integral` VALUES (32, 12, '商品抵扣', '-60.0', '0');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendtype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paytype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paycount` double(20, 0) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `shperson` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shaddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (10181, '韵达', '支付宝', 3400, '2019-10-15', 12, '付涵 ', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10182, '申通', '微信', 10639, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10183, '申通', '微信', 7740, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10184, '申通', '微信', 7740, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10185, '韵达', '微信', 3392, '2019-10-15', 12, '付涵 ', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10186, '韵达', '微信', 3392, '2019-10-15', 12, '付涵 ', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10187, '申通', '微信', 6774, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10188, '申通', '微信', 6774, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10189, '申通', '微信', 7774, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10190, '申通', '微信', 7774, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10191, '申通', '微信', 3392, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10192, '申通', '微信', 3392, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10193, '申通', '微信', 13537, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10194, '申通', '微信', 8086, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10195, '申通', '微信', 20301, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10196, '申通', '微信', 5602, '2019-10-15', 14, '电话', '12345666666', '滴滴滴');
INSERT INTO `t_order` VALUES (10197, '韵达', '微信', 1386, '2019-10-15', 12, '付涵 ', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10198, '韵达', '微信', 3396, '2019-10-16', 12, '付涵 ', '13361615339', '广东深圳');
INSERT INTO `t_order` VALUES (10199, '申通', '微信', 3396, '2019-10-16', 12, '付涵 ', '13361615339', '广东深圳');
INSERT INTO `t_order` VALUES (10200, '韵达', '微信', 560, '2019-10-16', 12, '付涵 ', '13361615339', '广东深圳');
INSERT INTO `t_order` VALUES (10201, '申通', '银联', 1008, '2019-10-16', 12, '付涵', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10202, '中通', '支付宝', 493, '2019-10-16', 12, '付涵', '17679117105', '江西省南昌市青山湖区');
INSERT INTO `t_order` VALUES (10203, '中通', '微信', 23200, '2019-10-16', 12, '付涵', '18702598180', '江西省南昌市进贤县');
INSERT INTO `t_order` VALUES (10204, '申通', '微信', 21881, '2019-10-17', 14, '滴滴', '12345666666', '我得去我的');
INSERT INTO `t_order` VALUES (10205, '韵达', '微信', 0, '2019-10-17', 14, 'QQ ', '1232134124', '撒大声地撒');
INSERT INTO `t_order` VALUES (10206, '圆通', '银联', 1810, '2019-10-17', 28, 'xx', '123456', 'xxxx');
INSERT INTO `t_order` VALUES (10207, '圆通', '银联', 493, '2019-10-17', 12, '付涵', '1870259180', '123456');
INSERT INTO `t_order` VALUES (10208, '申通', '微信', 3328, '2019-10-18', 12, '付涵 ', '13361615339', '广东深圳');
INSERT INTO `t_order` VALUES (10209, '韵达', '微信', 2518, '2019-11-11', 41, '123', '12312312321', '123123123123123');
INSERT INTO `t_order` VALUES (10210, '韵达', '微信', 917, '2019-11-14', 43, '123', '12312312321', '123123123');
INSERT INTO `t_order` VALUES (10211, '申通', '银联', 2361, '2019-11-14', 12, '付涵', '17679117105', '江西省南昌市青山湖区11');
INSERT INTO `t_order` VALUES (10212, '申通', '银联', 501, '2019-12-11', 12, '付涵111 ', '18702598180', '江西省南昌市进贤县');

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `foodid` int(11) DEFAULT NULL,
  `foodname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `foodprice` double(20, 2) DEFAULT NULL,
  `foodnum` int(20) DEFAULT NULL,
  `foodpic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_total_price` double(20, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ORDER`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES (55, 10181, 13, '鱼油胶囊', '2019-10-15', 488.00, 2, 'zaoyoujiaonan.png', 976.00);
INSERT INTO `t_order_detail` VALUES (56, 10181, 20, '鱼油', '2019-10-15', 488.00, 3, 'zaoyoujiaonan.png', 1464.00);
INSERT INTO `t_order_detail` VALUES (57, 10181, 4, '纽派益生菌滴液', '2019-10-15', 328.00, 3, 'yishengjun.png', 984.00);
INSERT INTO `t_order_detail` VALUES (58, 10182, 13, '鱼油胶囊', '2019-10-15', 488.00, 10, 'zaoyoujiaonan.png', 4880.00);
INSERT INTO `t_order_detail` VALUES (59, 10182, 20, '鱼油', '2019-10-15', 488.00, 12, 'zaoyoujiaonan.png', 5856.00);
INSERT INTO `t_order_detail` VALUES (60, 10183, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 16, 'zaoyoujiaonan.png', 7808.00);
INSERT INTO `t_order_detail` VALUES (61, 10185, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 7, 'zaoyoujiaonan.png', 3416.00);
INSERT INTO `t_order_detail` VALUES (62, 10187, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 14, 'zaoyoujiaonan.png', 6832.00);
INSERT INTO `t_order_detail` VALUES (63, 10189, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 17, 'zaoyoujiaonan.png', 8296.00);
INSERT INTO `t_order_detail` VALUES (64, 10191, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 7, 'zaoyoujiaonan.png', 3416.00);
INSERT INTO `t_order_detail` VALUES (65, 10193, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 28, 'zaoyoujiaonan.png', 13664.00);
INSERT INTO `t_order_detail` VALUES (66, 10194, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 17, 'zaoyoujiaonan.png', 8296.00);
INSERT INTO `t_order_detail` VALUES (67, 10195, 13, '鱼油胶囊', '2019-10-15', 488.00, 42, 'zaoyoujiaonan.png', 20496.00);
INSERT INTO `t_order_detail` VALUES (68, 10196, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 12, 'zaoyoujiaonan.png', 5856.00);
INSERT INTO `t_order_detail` VALUES (69, 10197, 5, 'DHA藻油软胶囊', '2019-10-15', 488.00, 3, 'zaoyoujiaonan.png', 1464.00);
INSERT INTO `t_order_detail` VALUES (70, 10198, 5, 'DHA藻油软胶囊', '2019-10-16', 488.00, 6, 'zaoyoujiaonan.png', 2928.00);
INSERT INTO `t_order_detail` VALUES (71, 10198, 16, '麦片', '2019-10-16', 123.00, 4, 'sliver20191011145212882.png', 492.00);
INSERT INTO `t_order_detail` VALUES (72, 10200, 10, '全脂奶粉', '2019-10-16', 118.00, 5, 'rutiedanbai.png', 590.00);
INSERT INTO `t_order_detail` VALUES (73, 10201, 2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '2019-10-16', 118.00, 6, 'rutiedanbai.png', 708.00);
INSERT INTO `t_order_detail` VALUES (74, 10201, 1, '新西兰纽派婴幼儿乳钙60粒装123', '2019-10-16', 100.00, 3, 'HomeProdImg1.jpg', 300.00);
INSERT INTO `t_order_detail` VALUES (75, 10202, 5, 'DHA藻油软胶囊', '2019-10-16', 488.00, 1, 'zaoyoujiaonan.png', 488.00);
INSERT INTO `t_order_detail` VALUES (76, 10203, 5, 'DHA藻油软胶囊', '2019-10-16', 488.00, 45, 'zaoyoujiaonan.png', 21960.00);
INSERT INTO `t_order_detail` VALUES (77, 10203, 20, '鱼油', '2019-10-16', 488.00, 3, 'zaoyoujiaonan.png', 1464.00);
INSERT INTO `t_order_detail` VALUES (78, 10204, 18, '乳粉', '2019-10-17', 518.00, 17, 'rutiedanbaitong.jpg', 8806.00);
INSERT INTO `t_order_detail` VALUES (79, 10204, 16, '麦片', '2019-10-17', 123.00, 15, 'sliver20191011145212882.png', 1845.00);
INSERT INTO `t_order_detail` VALUES (80, 10204, 20, '鱼油', '2019-10-17', 488.00, 21, 'zaoyoujiaonan.png', 10248.00);
INSERT INTO `t_order_detail` VALUES (81, 10204, 2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '2019-10-17', 118.00, 18, 'rutiedanbai.png', 2124.00);
INSERT INTO `t_order_detail` VALUES (82, 10205, 16, '麦片', '2019-10-17', 123.00, 1, 'sliver20191011145212882.png', 123.00);
INSERT INTO `t_order_detail` VALUES (83, 10206, 5, 'DHA藻油软胶囊', '2019-10-17', 488.00, 3, 'zaoyoujiaonan.png', 1464.00);
INSERT INTO `t_order_detail` VALUES (84, 10206, 2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '2019-10-17', 118.00, 3, 'rutiedanbai.png', 354.00);
INSERT INTO `t_order_detail` VALUES (85, 10207, 5, 'DHA藻油软胶囊', '2019-10-17', 488.00, 1, 'zaoyoujiaonan.png', 488.00);
INSERT INTO `t_order_detail` VALUES (86, 10208, 1, '新西兰纽派婴幼儿乳钙60粒装123', '2019-10-18', 100.00, 4, 'HomeProdImg1.jpg', 400.00);
INSERT INTO `t_order_detail` VALUES (87, 10208, 4, '纽派益生菌滴液', '2019-10-18', 328.00, 9, 'yishengjun.png', 2952.00);
INSERT INTO `t_order_detail` VALUES (88, 10209, 4, '纽派益生菌滴液', '2019-11-11', 328.00, 3, 'yishengjun.png', 984.00);
INSERT INTO `t_order_detail` VALUES (89, 10209, 3, '\r\n纽派乳铁蛋白调制乳粉', '2019-11-11', 518.00, 3, 'rutiedanbaitong.jpg', 1554.00);
INSERT INTO `t_order_detail` VALUES (90, 10210, 4, '纽派益生菌滴液', '2019-11-14', 328.00, 1, 'yishengjun.png', 328.00);
INSERT INTO `t_order_detail` VALUES (91, 10210, 9, '碳酸钙', '2019-11-14', 588.00, 1, 'aabb.png', 588.00);
INSERT INTO `t_order_detail` VALUES (92, 10211, 2, '活性免疫蛋白乳铁蛋白调制乳粉10条盒装', '2019-11-14', 118.00, 7, 'rutiedanbai.png', 826.00);
INSERT INTO `t_order_detail` VALUES (93, 10211, 5, 'DHA藻油软胶囊', '2019-11-14', 488.00, 4, 'zaoyoujiaonan.png', 1952.00);
INSERT INTO `t_order_detail` VALUES (94, 10212, 18, '乳粉', '2019-12-11', 518.00, 1, 'rutiedanbaitong.jpg', 518.00);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `truename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '男',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '2008年8月8日',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `member_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '普通会员',
  `integral` int(255) DEFAULT 500,
  `useful_integral` int(255) DEFAULT 500,
  `used_integral` int(255) DEFAULT 0,
  `frozen` int(255) DEFAULT 0,
  `pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isAdmin` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (12, '13587244041', '风起天澜', '付涵', '男', '1997年09月27日', '18702598180', '1358724404@qq.com', '超级会员', 60, 500, 0, 0, 'sliver2019111511482250.png', '2c3ccc552ed157f1250e3451abe7d380', '是');
INSERT INTO `t_user` VALUES (14, '嗯嗯', '问问', '滴滴答答', '女', '2008年08月18日', '15080099817', '1270358406@qq.com', '超级会员', 10423, 15660, 0, 0, 'sliver20191017103749866.jpg', 'd43456a713d5f614a67ccdf70a76530d', '是');
INSERT INTO `t_user` VALUES (37, '王企鹅', '王企鹅', 'qwe', '男', '2005年08月16日', '123456', '342423134@qq.com', '普通会员', 500, 500, 0, 0, NULL, 'fa89e5302256d3da3007cad3234742a4', '否');
INSERT INTO `t_user` VALUES (38, 'jkuj`', 'lkiij', 'ihio', '男', '2008年08月18日', '123456789', '123486@qq.com', '普通会员', 500, 500, 0, 0, NULL, 'b27bf5b940789867c00f46bc6fa0da86', '否');
INSERT INTO `t_user` VALUES (39, '123456', '123', '123', '男', '2008年08月15日', '110', '123456', '普通会员', 500, 500, 0, 0, NULL, '2f698bf742f19d1c59e88765529a1f28', '否');
INSERT INTO `t_user` VALUES (40, '23123', NULL, NULL, '男', '2008年8月8日', '150800998171', '1445464024@qq.com', '超级会员', 500, 500, 0, 0, NULL, '1382e9ea4f0cdbe318e2a70b44523200', '否');
INSERT INTO `t_user` VALUES (41, 'fuhan', '123', '小黑', '男', '2008年08月06日', '1234567', '1358724404@qq.com', '普通会员', 0, 500, 0, 0, NULL, '92b3eb35b3654cf6fa9171b75cf74023', '否');
INSERT INTO `t_user` VALUES (42, '123', '123', '123', '女', '2008年08月22日', '18702598181', '1358724404@qq.com', '普通会员', 500, 500, 0, 0, NULL, 'cae022a74ce17895578f6128f7683de1', '否');
INSERT INTO `t_user` VALUES (43, '123123', '123123', '123123', '男', '2008年08月28日', '18702598182', '123123', '普通会员', 1416, 500, 0, 0, NULL, 'e2a41d571b4aa493a3927490c6a75373', '否');

SET FOREIGN_KEY_CHECKS = 1;
