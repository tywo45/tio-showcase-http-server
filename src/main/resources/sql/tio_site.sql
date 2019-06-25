/*
Navicat MariaDB Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100027
Source Host           : 127.0.0.1:3306
Source Database       : tio_site

Target Server Type    : MariaDB
Target Server Version : 100027
File Encoding         : 65001

Date: 2017-12-20 12:38:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(32) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `nick` varchar(16) NOT NULL,
  `avatar` varchar(64) CHARACTER SET utf8 NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '注册ip',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户状态, 1：正常，2：注销，3：被拉黑',
  PRIMARY KEY (`id`),
  KEY `loginname` (`loginname`,`pwd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog
-- ----------------------------

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL COMMENT '提供者，对应person表的id',
  `casename` varchar(16) NOT NULL,
  `caseintro` varchar(255) NOT NULL COMMENT '简介',
  `caseurl` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `caseimg` varchar(255) DEFAULT NULL COMMENT '展示图片地址',
  `provideddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '案例提供日期，不一定准确',
  `remark` varchar(255) DEFAULT NULL,
  `orderby` int(11) NOT NULL DEFAULT '100000' COMMENT '排序号，值越小越在前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='tio案例';

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('1', '1', 'HTTP Server', '用t-io实现的Http Server', 'https://git.oschina.net/tywo45/t-io/tree/master/src/zoo/http', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/tchat/site.png', '2017-08-03 14:13:59', null, '100000');
INSERT INTO `case` VALUES ('2', '1', 'WebIM', '用t-io实现的WebIm', 'http://t-io.org/webim/', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/tchat/1.png', '2017-08-03 14:17:25', null, '100000');
INSERT INTO `case` VALUES ('3', '1', 'WebSocket', '用t-io实现的WebSocket', 'https://git.oschina.net/tywo45/t-io/tree/master/src/zoo/websocket', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/tchat/2.png', '2017-08-03 14:17:41', null, '100000');
INSERT INTO `case` VALUES ('4', '2', '扫码枪', '扫码枪项目', '', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/blog/2-3.jpg', '2017-08-03 14:18:52', null, '100000');
INSERT INTO `case` VALUES ('5', '3', '农业灌溉项目', '河北某地方的一个农业灌溉项目，生产项目，不方便提供截图', '', null, '2017-08-03 14:22:24', null, '100000');
INSERT INTO `case` VALUES ('6', '4', '某省移动公司CRM系统业务', '某省移动公司CRM系统业务调用受理，这是个短连接项目，生产项目，不方便提供截图', '', null, '2017-08-03 14:22:49', null, '6');
INSERT INTO `case` VALUES ('7', '5', '温控设备', '上线的项目服务器用的是tio框架，作为server端与温控设备（客户端）进行socket通讯，客户端是客户那边的硬件设备，有自己的协议实现，所以没有用到tio，tio帮我实现了自动重连和心跳检测，所以基本没什么事可以干了。上线两个月，一直很稳定', '', null, '2017-08-03 14:23:24', null, '100000');
INSERT INTO `case` VALUES ('8', '6', '燃气安全监测的平台', '燃气安全监测的平台，运行大半年了一直很稳定', '', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/case/359886056/1.png', '2017-08-03 14:24:17', null, '100000');
INSERT INTO `case` VALUES ('9', '7', '智能家居平台', '基于t-io的长连接服务器，为智能家居平台提供服务，实现了对智能设备的控制', '', 'https://git.oschina.net/tywo45/t-io/raw/master/docs/case/dendai/1.jpg', '2017-08-03 14:24:45', null, '100000');
INSERT INTO `case` VALUES ('10', '8', '路灯控制器', '用的是最新版的。用来做路灯控制器后台的server', null, null, '2017-08-03 14:25:31', null, '100000');
INSERT INTO `case` VALUES ('11', '9', 'IM', 'IM', null, 'https://git.oschina.net/tywo45/t-io/raw/master/docs/case/1428395410/1.jpg', '2017-08-03 15:53:35', null, '99999');
INSERT INTO `case` VALUES ('13', '10', '服务器数据监控', '深圳临界线网络科技有限公司，使用t-io做服务器数据监控', null, 'https://gitee.com/tywo45/t-io/raw/master/docs/case/%E5%8C%97%E6%9E%81%E5%BF%83/1.png', '2017-09-06 09:23:56', null, '100000');
INSERT INTO `case` VALUES ('14', '4', '冷链温湿度监控数据接收服务端', '项目包含硬件，硬件温湿监控设备（客户端)采集到温湿度信息与服务器端采用socket通讯，服务端采用tio框架，实现硬件厂家上传协议解码，数据记录等相关业务操作。硬件客户端程序是厂家实现，没用tio框架。服务端采用tio框架，本人只是实现了协议的编码解码，项目从4月份上线，一直很稳定没出现过问题。\r\n', null, 'https://gitee.com/tywo45/t-io/raw/master/docs/case/9250/2.png', '2017-09-08 10:40:48', null, '6');
INSERT INTO `case` VALUES ('15', '11', '南京某物联网公司', '南京某物联网公司，智能园区、智能抄表、智能停车等项目（先占个坑，等正式上线后再补全）', null, null, '2017-09-19 10:18:32', '先占个坑，等正式上线后再补全', '100000');
INSERT INTO `case` VALUES ('16', '12', '涉密项目', '我们公司都是涉密的，这个业务简单说就是 给红绿灯特殊车辆过车信息，更多的就不能提供了~', null, null, '2017-09-21 09:05:17', null, '100000');
INSERT INTO `case` VALUES ('17', '13', 'tio-im', 'tio-im是基于t-io写的IM，主要目标降低即时通讯门槛，通过极简洁的消息格式就可以实现多端不同协议间的消息发送如(http、websocket、tcp自定义im协议)等，并可以通过http协议的api接口进行消息发送无需关心接收端属于什么协议，一个消息格式搞定一切！', 'https://gitee.com/xchao/tio-im', 'https://git.oschina.net/uploads/images/2017/0922/195539_4a5d9ed4_410355.jpeg', '2017-09-25 08:58:24', null, '3');
INSERT INTO `case` VALUES ('18', '6', '智能床垫', '测试环境运行了半年没啥问题，数据都存了几百万了，这个后台和tio弄了不到1个月，这个还是用的最早的代码一直没升级\r\n', null, 'https://git.oschina.net/tywo45/t-io/raw/master/docs/case/359886056/3.png', '2017-09-26 10:43:12', null, '100000');

-- ----------------------------
-- Table structure for corp
-- ----------------------------
DROP TABLE IF EXISTS `corp`;
CREATE TABLE `corp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) DEFAULT NULL COMMENT '法人，对应person的id',
  `corpname` varchar(64) NOT NULL COMMENT '公司名字',
  `corpemail` varchar(32) DEFAULT NULL COMMENT '公司邮箱',
  `corpqq` bigint(19) DEFAULT NULL COMMENT '公司QQ',
  `corpsite` varchar(128) DEFAULT NULL COMMENT '公司主页地址',
  `corpintro` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司表';

-- ----------------------------
-- Records of corp
-- ----------------------------

-- ----------------------------
-- Table structure for donate
-- ----------------------------
DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `name` varchar(16) NOT NULL,
  `orderby` int(11) NOT NULL DEFAULT '999999999',
  `url` varchar(128) DEFAULT NULL COMMENT '用户或公司的url',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `waytype` int(4) DEFAULT NULL,
  `way` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `leavemsg` varchar(1024) DEFAULT NULL COMMENT '留言',
  `myremark` varchar(255) DEFAULT NULL COMMENT '给作者自己的备注，不对外显示',
  `avatar` varchar(2048) DEFAULT NULL,
  `tag1` varchar(16) DEFAULT NULL,
  `tag2` varchar(16) DEFAULT NULL,
  `tag3` varchar(16) DEFAULT NULL,
  `istitle` int(4) DEFAULT NULL COMMENT '1，是title，2，不是title',
  `title` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of donate
-- ----------------------------
INSERT INTO `donate` VALUES ('1', '20', '马文龙', '2', null, '2016-12-13 10:02:10', '1', '码云', 'qq：237903488', '感谢您的开源项目！希望多给些详细的文档 我的 qq是237903488', null, '/img/20171118122407.jpg', '首笔者捐赠者', null, null, '2', null);
INSERT INTO `donate` VALUES ('2', '10', '坏小孩', '999999999', null, '2016-12-13 10:19:37', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('3', '10', 'draper', '999999999', 'https://gitee.com/websterlu', '2016-12-13 10:20:35', '1', '码云', 'qq：10558813', '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('4', '20', '皓叶腾CEO', '1', null, '2016-12-13 10:25:16', '1', '码云', '南京皓叶腾信息科技有限公司CEO，也是作者曾经的同事，长期为t-io免费提供服务器支持', '再接再厉	', null, '/img/3440734_100.jpeg', '皓叶腾CEO', null, null, '1', '多次帮助t-io');
INSERT INTO `donate` VALUES ('5', '5', '钛合金核桃', '999999999', 'https://gitee.com/wu1g119', '2016-12-22 15:00:53', '1', '码云', null, '虽然没用过不过看起来很厉害', null, '/img/302580_wu1g119.png', null, null, null, null, null);
INSERT INTO `donate` VALUES ('6', '5', '爱犯迷糊的meallon', '999999999', 'https://gitee.com/meallon', '2016-12-22 17:07:16', '1', '码云', 'qq：376487342，作者前同事', '感谢您的开源项目！', null, '/img/636232_meallon.png', '', null, null, null, null);
INSERT INTO `donate` VALUES ('7', '10', 'lihc超哥', '999999999', 'https://gitee.com/lihc2015', '2017-01-02 17:58:17', '1', '码云', null, '感谢您的开源项目！向你学习NIO，设计开发IM这类的系统需要注意哪些点', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('8', '5', 'WhatAKitty', '999999999', 'https://gitee.com/wustart', '2017-01-08 00:07:37', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('9', '5', 'mahengyang', '999999999', 'https://gitee.com/enyo', '2017-01-14 20:35:21', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('10', '10', 'commonrpc', '999999999', 'https://gitee.com/284520459', '2017-01-19 16:55:37', '1', '码云', 'commonrpc作者', '感谢您的开源项目！', null, null, 'commonrpc作者', null, null, null, null);
INSERT INTO `donate` VALUES ('11', '5', 'wilsonbrant', '999999999', 'https://gitee.com/wilsonbrant', '2017-02-04 15:10:48', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('12', '10', '小房', '999999999', null, '2017-02-07 14:14:00', '1', '码云', 'qq：2667624395', '感谢您的开源项目，感谢您的无私付出！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('13', '10', 'YY守护天使YY', '2', 'https://gitee.com/yyljlyy', '2017-02-15 00:13:31', '1', '码云', '多次捐赠', '	感谢您的开源项目！', null, '/img/shts.jpg', 'OSC源创会积极志愿者', '多次捐赠', '', '1', '多次捐赠');
INSERT INTO `donate` VALUES ('14', '100', '捐赠者要求匿名', '999999999', '', '2017-03-19 10:02:53', '1', '码云', '捐赠者要求匿名，感谢这位同学，作者私下已备注该条捐赠信息', '开源不易 多谢开源', 'qq：787702029，章小凡，一袭白衣微胜雪，https://gitee.com/SJRSB', '/img/512121_SJRSB.png', null, null, null, null, null);
INSERT INTO `donate` VALUES ('15', '188', 'YY守护天使YY', '2', 'https://gitee.com/yyljlyy', '2017-03-26 09:33:48', '1', '码云', '多次捐赠', '愿talent-aio越来越好！', null, '/img/shts.jpg', 'OSC源创会积极志愿者', '多次捐赠', null, '1', '多次捐赠');
INSERT INTO `donate` VALUES ('16', '100', '漂泊', '6', null, '2017-04-03 13:16:10', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, '1', '');
INSERT INTO `donate` VALUES ('17', '58', 'YY守护天使YY', '2', 'https://gitee.com/yyljlyy', '2017-04-05 23:22:43', '1', '码云', '多次捐赠', '行动支持tio', null, '/img/shts.jpg', 'OSC源创会积极志愿者', '多次捐赠', null, '1', '多次捐赠');
INSERT INTO `donate` VALUES ('18', '10', '精灵007', '999999999', 'https://gitee.com/null_346_8382', '2017-04-07 13:03:38', '1', '码云', 'qq：270249250', '感谢您的开源项目！	', null, '/img/20171118125630.jpg', '多个项目使用t-io', null, null, null, null);
INSERT INTO `donate` VALUES ('19', '10', '叶昭良', '999999999', null, '2017-04-16 14:03:09', '1', '码云', 'qq：977962857', '感谢您的开源项目！	', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('20', '6', '未知', '999999999', 'mailto:tywo45@163.com', '2017-01-09 11:34:45', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('21', '15', '未知', '999999999', 'mailto:tywo45@163.com', '2017-04-07 17:40:09', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('22', '20', 'KevinBlandy', '999999999', null, '2017-05-03 00:18:24', '2', '微信二维码收款', 'qq：747692844', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('23', '100', '未知', '999999999', 'mailto:tywo45@163.com', '2017-05-05 09:34:28', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('24', '20', '未知', '999999999', 'mailto:tywo45@163.com', '2017-05-05 10:11:29', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('25', '128', 'orpherus', '5', 'https://my.oschina.net/u/3239976', '2017-05-07 19:24:09', '2', '微信二维码收款', '后来双帮助tio指正了一个认识错误', '继yii和vue之后第三个我觉得不错的国产基础库，小捐128以表鼓励。', null, '/img/orpherus.jpg', '指正过t-io错误', null, null, '1', null);
INSERT INTO `donate` VALUES ('26', '66', '未知', '999999999', 'mailto:tywo45@163.com', '2017-05-09 10:10:29', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('27', '50', '何勇波', '999999999', 'http://www.citis.cc', '2017-05-16 11:09:30', '2', '微信二维码收款', 'qq：834659942，公司地址：浙江省宁波市江东区民安路新天地大厦1号楼702室。正准备用tio的httpserver。', 'tio.谭.Java即时通讯框架', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('28', '10', '未知', '999999999', 'mailto:tywo45@163.com', '2017-05-25 10:01:31', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('29', '66', '未知', '999999999', 'mailto:tywo45@163.com', '2017-06-13 16:12:31', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('30', '5', '未知', '999999999', 'mailto:tywo45@163.com', '2017-06-14 17:24:35', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('31', '66', '捐赠者要求匿名', '999999999', '', '2017-06-16 22:26:13', '2', '微信二维码收款', '捐赠者要求匿名，感谢这位同学，作者私下已备注该条捐赠信息', '', '203025368，墨言', '/img/20171118121406.png', null, null, null, null, null);
INSERT INTO `donate` VALUES ('32', '600', '贤心', '1', 'http://www.layui.com/', '2017-05-11 17:26:24', '3', '支付宝', 'layui作者', '支持t-io', null, '/img/xianxin.jpg', 'Layui作者', 'LayIm作者', null, '1', 'layui作者');
INSERT INTO `donate` VALUES ('33', '88', '匠人(gopush作者)', '1', 'https://gitee.com/openWolf/gopush', '2017-03-18 07:31:15', '4', '微信红包', 'gopush作者', '', null, '/img/gopush.jpeg', 'gopush作者', null, null, '1', null);
INSERT INTO `donate` VALUES ('34', '58.88', 'YY守护天使YY', '2', 'https://gitee.com/yyljlyy', '2017-03-02 19:09:24', '4', '微信红包', '多次捐赠', '框架写得太霸道了！怒赞。读得我心潮澎湃，久违的感觉。', null, '/img/shts.jpg', 'OSC源创会积极志愿者', '多次捐赠', null, '1', null);
INSERT INTO `donate` VALUES ('35', '68', '独孤求BUG', '1', null, '2017-03-18 00:14:44', '4', '微信红包', 'qq：171707767', '辛苦了，小小心意', null, '/img/qbug.png', null, null, null, '1', null);
INSERT INTO `donate` VALUES ('36', '50', '(り涛声依旧', '999999999', null, '2017-04-25 18:41:18', '3', '支付宝', 'qq：253044990', '谭主加油，lam小涛', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('37', '42', '捐赠者要求匿名', '999999999', null, '2017-04-25 18:08:10', '2', '微信二维码收款', '捐赠者要求匿名，感谢这位同学，作者私下已备注该条捐赠信息', '', '何喜', '/img/556878_100.gif', null, null, null, null, null);
INSERT INTO `donate` VALUES ('38', '59', '木予', '999999999', null, '2017-04-23 15:50:04', '3', '支付宝', 'qq：18332024，提前预定企业版服务', '支持t-io发展', '提前预定企业版服务', '/img/20171118124247.png', null, null, null, null, null);
INSERT INTO `donate` VALUES ('39', '168', '贤心', '1', 'http://www.layui.com/', '2017-06-13 23:18:57', '3', '支付宝', 'layui作者贤心', '', '', '/img/xianxin.jpg', 'Layui作者', 'LayIm作者', null, '1', 'layui作者');
INSERT INTO `donate` VALUES ('40', '29', '绝尘', '999999999', null, '2017-05-08 21:55:40', '3', '支付宝', 'qq：237809796', '情怀助力()困了累了，喝杯咖啡', 'jf', '/img/20171118125112.jpg', null, null, null, null, null);
INSERT INTO `donate` VALUES ('41', '9', '木予', '999999999', null, '2017-05-09 09:18:14', '3', '支付宝', 'qq：18332024', '捐助', null, '/img/20171118124247.png', null, null, null, null, null);
INSERT INTO `donate` VALUES ('42', '20', 'KevinBlandy', '999999999', null, '2017-05-03 14:22:35', '3', '支付宝', 'qq：747692844', '', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('43', '6', '小徐同学', '999999999', '', '2017-04-28 11:04:48', '2', '微信二维码收款', 'qq：409413474。我上线的项目服务器用的是tio框架，作为server端与温控设备（客户端）进行socket通讯，客户端是客户那边的硬件设备，有自己的协议实现，所以没有用到tio，tio帮我实现了自动重连和心跳检测，所以基本没什么事可以干了。上线两个月，一直很稳定。', null, null, '/img/1168934_100.jpeg', '第一个集成tio到jfinal者', null, null, null, null);
INSERT INTO `donate` VALUES ('45', '8', '常尚全', '999999999', null, '2017-05-04 10:18:25', '2', '微信二维码收款', 'qq：244627250', null, null, '/img/20171118124108.jpg', null, null, null, null, null);
INSERT INTO `donate` VALUES ('46', '100', '谷子里', '4', '', '2017-08-15 11:13:50', '3', '支付宝', 'qq：136700219', '储蓄卡只有100多了，只能支持这么点了', 'qq：136700219', '/img/20171118124927.jpg', null, null, null, '1', null);
INSERT INTO `donate` VALUES ('47', '200', '小飞船', '4', null, '2017-08-19 19:49:55', '2', '微信二维码收款', 'qq：751585085。看了tio-websocket-server-demo-1，就掌握tio-websocket-server的用户', null, null, '/img/3196787_100.jpg', null, null, null, '1', null);
INSERT INTO `donate` VALUES ('48', '200', 'beimi', '1', 'http://gitee.com/beimigame/beimi', '2017-08-31 10:43:39', '2', '微信二维码收款', '贝密游戏qq群：529311623', null, null, '/img/beimi.jpeg', '贝密游戏作者', '优客服作者', null, '1', null);
INSERT INTO `donate` VALUES ('49', '10', '未知', '6', null, '2017-09-07 16:14:27', '2', '微信二维码收款', '不要和作者玩捉迷藏，赶紧报上您的大名吧！', '大爱无疆，持续开源', null, null, null, null, null, '2', null);
INSERT INTO `donate` VALUES ('50', '50', '不学无术', '6', null, '2017-09-28 11:50:06', '3', '支付宝', 'qq：920456494', '愿tio越来越好，生态越来越完善！感谢！', 'qq：920456494', null, null, null, null, '1', null);
INSERT INTO `donate` VALUES ('51', '10', '健平', '999999999', null, '2017-10-06 16:30:16', '3', '支付宝', 'qq：935124604', '多谢你的开源', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('52', '20', '陆斌', '999999999', 'https://gitee.com/lubin', '2017-10-19 11:38:31', '1', '码云', null, '感谢您的开源项目！', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('53', '10', '迷失网络', '999999999', null, '2017-10-29 13:18:24', '1', '码云', 'qq：416114831', '感谢谭总的贡献，我还没用上tio，先支持下。	', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('54', '20', '未知', '999999999', null, '2017-11-09 17:25:25', '2', '微信二维码收款', '', '支持开源，感谢', null, null, null, null, null, null, null);
INSERT INTO `donate` VALUES ('55', '20', '路小磊(hutool作者)', '1', 'https://gitee.com/loolly/hutool', '2017-11-11 23:15:49', '1', '码云', null, '	感谢您的开源项目！', null, '/img/luxiaolei.jpg', 'hutool作者', null, null, '1', null);
INSERT INTO `donate` VALUES ('56', '20', 'hehui082452239', '6', 'https://gitee.com/hehui082452239', '2017-11-11 23:21:59', '1', '码云', null, 'Thank you for your open source project!	', null, '/img/463940_hehui082452239.jpg', null, null, null, '1', null);
INSERT INTO `donate` VALUES ('57', '100', '李育森', '1', 'https://gitee.com/cnmob', '2017-11-17 08:52:00', '1', '码云', 'qq：378995687', '老谭辛苦了，喝两杯咖啡', null, '/img/liyus.jpg', '接入大量客户端', '节约了大量时间', null, '1', null);
INSERT INTO `donate` VALUES ('58', '20', '孙浩', '1', null, '2017-12-11 12:34:25', '3', '支付宝', null, '钱不多，请大神喝杯奶茶，希望tio被喜欢', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for donate_title
-- ----------------------------
DROP TABLE IF EXISTS `donate_title`;
CREATE TABLE `donate_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `orderno` int(11) NOT NULL COMMENT '值越小，排在越前面',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '1，有效；2，无效',
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of donate_title
-- ----------------------------
INSERT INTO `donate_title` VALUES ('1', '虎牛网络', '/img/20171118181652.jpg', 't-io服务器提供商', '1', '1', 'http://mp.weixin.qq.com/s/XX0w3MjtgTo1VbIYUlHX0Q');
INSERT INTO `donate_title` VALUES ('2', '路小磊', '/img/luxiaolei.jpg', 'hutool作者', '1', '1', 'https://gitee.com/loolly/hutool');
INSERT INTO `donate_title` VALUES ('3', '贤心', '/img/xianxin.jpg', 'LayUi作者', '1', '1', 'http://www.layui.com/');
INSERT INTO `donate_title` VALUES ('4', '皓叶腾', '/img/3440734_100.jpeg', '南京皓叶腾信息科技有限公司', '2', '1', '');
INSERT INTO `donate_title` VALUES ('5', '葳蕤', '/img/10171119181614.jpg', 't-io官网UI设计师', '2', '1', 'http://i.ui.cn/ucenter/126434.html');
INSERT INTO `donate_title` VALUES ('6', '黄磊', '/img/20171119182050.jpg', 't-io官网前端开发工程师', '2', '1', null);
INSERT INTO `donate_title` VALUES ('7', '智数平台', '/img/zhishu.png', '智能互联网数据采集平台', '3', '1', 'http://www.think-data.cn/');
INSERT INTO `donate_title` VALUES ('8', 'beimi', '/img/beimi.jpeg', '贝密游戏作者', '3', '1', 'http://gitee.com/beimigame/beimi');
INSERT INTO `donate_title` VALUES ('9', 'Spring For All', '/img/springForAll.png', '做最专业的Spring民间组织', '3', '1', 'http://www.spring4all.com/');

-- ----------------------------
-- Table structure for im_friendgroup
-- ----------------------------
DROP TABLE IF EXISTS `im_friendgroup`;
CREATE TABLE `im_friendgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '这个朋友分组的归属user',
  `groupname` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '分组创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='朋友分组';

-- ----------------------------
-- Records of im_friendgroup
-- ----------------------------

-- ----------------------------
-- Table structure for im_friendgroup_user
-- ----------------------------
DROP TABLE IF EXISTS `im_friendgroup_user`;
CREATE TABLE `im_friendgroup_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friendgroupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='朋友分组关联表';

-- ----------------------------
-- Records of im_friendgroup_user
-- ----------------------------

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS `im_group`;
CREATE TABLE `im_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(32) NOT NULL COMMENT '群组名，譬如java大神们，可以重复',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='群组';

-- ----------------------------
-- Records of im_group
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_msg
-- ----------------------------
DROP TABLE IF EXISTS `im_group_msg`;
CREATE TABLE `im_group_msg` (
  `id` bigint(19) NOT NULL COMMENT '消息id，由应用保证全局唯一',
  `groupid` int(11) NOT NULL COMMENT '发到哪个组',
  `fromuserid` int(11) NOT NULL COMMENT '发送者的userid',
  `content` varchar(512) NOT NULL COMMENT '消息内容',
  `filteredcontent` varchar(512) DEFAULT NULL COMMENT '过滤敏感词后的内容，为空则表示和content一样',
  `sendtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器收到这条消息的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_group_msg
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_msg_off
-- ----------------------------
DROP TABLE IF EXISTS `im_group_msg_off`;
CREATE TABLE `im_group_msg_off` (
  `groupmsgid` bigint(19) NOT NULL,
  `touserid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间，过期要被系统定时清理',
  PRIMARY KEY (`touserid`,`groupmsgid`),
  UNIQUE KEY `touserid_groupid` (`touserid`,`groupid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='组离线消息';

-- ----------------------------
-- Records of im_group_msg_off
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_user
-- ----------------------------
DROP TABLE IF EXISTS `im_group_user`;
CREATE TABLE `im_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户进入该组的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='群组和用户关联表';

-- ----------------------------
-- Records of im_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for im_user
-- ----------------------------
DROP TABLE IF EXISTS `im_user`;
CREATE TABLE `im_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '1：在线，2：隐身',
  `sign` varchar(64) DEFAULT NULL COMMENT '签名',
  `avatar` varchar(128) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_user
-- ----------------------------

-- ----------------------------
-- Table structure for im_user_msg
-- ----------------------------
DROP TABLE IF EXISTS `im_user_msg`;
CREATE TABLE `im_user_msg` (
  `id` bigint(19) NOT NULL COMMENT '消息id，由应用保证全局唯一',
  `touserid` int(11) NOT NULL COMMENT '发给谁',
  `fromuserid` int(11) NOT NULL COMMENT '发送者的userid',
  `content` varchar(512) NOT NULL COMMENT '消息内容',
  `filteredcontent` varchar(512) DEFAULT NULL COMMENT '过滤敏感词后的内容，为空则表示和content一样',
  `sendtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '服务器收到这条消息的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of im_user_msg
-- ----------------------------

-- ----------------------------
-- Table structure for im_user_msg_off
-- ----------------------------
DROP TABLE IF EXISTS `im_user_msg_off`;
CREATE TABLE `im_user_msg_off` (
  `usermsgid` bigint(19) NOT NULL,
  `touserid` int(11) NOT NULL,
  `fromuserid` int(11) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间，过期要被系统定时清理',
  PRIMARY KEY (`usermsgid`),
  UNIQUE KEY `usermsgid` (`usermsgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户离线消息';

-- ----------------------------
-- Records of im_user_msg_off
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corpid` int(11) DEFAULT NULL,
  `firstname` varchar(16) NOT NULL,
  `secondname` varchar(32) DEFAULT NULL,
  `personqq` bigint(19) DEFAULT NULL,
  `personemail` varchar(32) DEFAULT NULL,
  `personsite` varchar(64) DEFAULT NULL COMMENT '个人主页',
  `personintro` varchar(255) DEFAULT NULL COMMENT '个人简介，可以介绍职业技能等情况',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='人员表';

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', null, '谭', '耀武', '33745965', 'tywo45@163.com', 'http://t-io.org', 't-io作者', '2017-08-03 13:54:25', null);
INSERT INTO `person` VALUES ('2', null, '何', '喜', '137075079', null, 'https://my.oschina.net/u/556878', null, '2017-08-03 13:56:01', 'QQ：何喜，案例：扫码枪');
INSERT INTO `person` VALUES ('3', null, '', null, '2461392008', null, 'https://my.oschina.net/u/3224077', null, '2017-08-03 13:57:05', 'QQ：飞翔的云，案例：农业灌溉项目');
INSERT INTO `person` VALUES ('4', null, '', null, '270249250', null, 'https://my.oschina.net/u/2939390', null, '2017-08-03 13:58:25', 'QQ：精灵007，案例：CRM案例');
INSERT INTO `person` VALUES ('5', null, '徐', null, '409413474', null, 'https://my.oschina.net/u/1168934/home', null, '2017-08-03 13:59:12', 'QQ：小徐同学，案例：温控设备');
INSERT INTO `person` VALUES ('6', null, '', null, '359886056', null, 'https://my.oschina.net/u/2334571', null, '2017-08-03 14:04:20', 'QQ：小白，案例：燃气安全监测的平台');
INSERT INTO `person` VALUES ('7', null, '', null, '289056764', null, 'https://my.oschina.net/u/2369298/home', null, '2017-08-03 14:07:20', 'QQ：等待戈多，案例：智能家居平台');
INSERT INTO `person` VALUES ('8', null, '', null, '573824145', null, null, null, '2017-08-03 14:08:37', 'QQ：jackkang，案例：路灯控制器');
INSERT INTO `person` VALUES ('9', null, '', null, '1428395410', null, null, null, '2017-08-03 15:38:36', 'QQ：23，案例：IM');
INSERT INTO `person` VALUES ('10', null, '北', null, '851668663', null, null, null, '2017-09-06 09:24:50', null);
INSERT INTO `person` VALUES ('11', null, '', null, '11624317', null, null, null, '2017-09-20 09:36:17', 'QQ：大鲨鱼');
INSERT INTO `person` VALUES ('12', null, '', null, '506766132', null, null, null, '2017-09-21 09:06:59', 'QQ：饥饿面包');
INSERT INTO `person` VALUES ('13', null, '', null, '1241503759', null, 'https://gitee.com/xchao/tio-im', null, '2017-09-25 09:00:16', 'QQ：、轨迹');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(32) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `nick` varchar(16) NOT NULL,
  `avatar` varchar(64) CHARACTER SET utf8 NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '注册ip',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户状态, 1：正常，2：注销，3：被拉黑',
  PRIMARY KEY (`id`),
  KEY `loginname` (`loginname`,`pwd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_osc
-- ----------------------------
DROP TABLE IF EXISTS `user_osc`;
CREATE TABLE `user_osc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `oscid` varchar(32) NOT NULL,
  `oscnick` varchar(64) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_osc
-- ----------------------------
