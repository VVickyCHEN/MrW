/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mrw

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-04-24 17:25:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章类型',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '博客用户',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `cover_img` varchar(255) DEFAULT NULL COMMENT '文章封面',
  `describe` varchar(255) DEFAULT NULL COMMENT '文章描述',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `recommend` int(10) DEFAULT '0' COMMENT '推荐级别',
  `praise` int(11) DEFAULT '0' COMMENT '点赞量',
  `clicks` int(10) DEFAULT '0' COMMENT '点击量',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否公开 (0：否，1：是）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_article_sort` (`sort`) USING BTREE,
  KEY `index_blog_article_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客文章表';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('4', '6', '0', '云仓系统开发', '/static/uploads/20190423/569dddb9ef8b8d0d32889fc333b95560.jpg', '云仓系统开发', '<p><img src=\"/static/uploads/20190423/6749c8c17814d73b9ba4ba1c49fba8d1.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '19', '0', '8', '0', null, '0', '1', '0', '2018-08-10 16:59:53', '0', '2019-04-23 17:52:54', null);
INSERT INTO `blog_article` VALUES ('6', '6', '0', '小程序商城', '/static/uploads/20190423/432f9c5d988dc8a311636fda6cea8e1d.jpg', '小程序商城', '<p><img src=\"/static/uploads/20190423/72515b47615238b33257080ca96cbce4.jpg\" style=\"max-width:100%;\"><br></p>', '0', '0', '2', '0', null, '0', '1', '0', '2019-03-14 14:07:30', '0', '2019-04-23 17:49:01', null);
INSERT INTO `blog_article` VALUES ('7', '6', '0', '产品二维码', '/static/uploads/20190423/5d000d00446a8b51c416140e095f7f66.jpg', '产品二维码', '<p><img src=\"/static/uploads/20190423/cfde325dc174f2308c68ec4bf50f0119.jpg\" style=\"max-width:100%;\"><br></p>', '0', '0', '9', '0', null, '0', '1', '0', '2019-03-14 15:49:39', '0', '2019-04-23 17:48:12', null);
INSERT INTO `blog_article` VALUES ('8', '6', '0', '微商控价系统', '/static/uploads/20190423/66961ee21b487c359ed2f426935864fd.jpg', '微商控价系统', '<p><img src=\"/static/uploads/20190423/15b4485ab25ed9c369b96c60556b69d9.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '0', '5', '0', null, '0', '1', '0', '2019-03-14 15:49:55', '0', '2019-04-23 17:53:09', null);

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章编号',
  `tag_id` int(11) NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`id`),
  KEY `index_blog_article_tag_article_id` (`article_id`) USING BTREE,
  KEY `index_blog_article_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章标签关联表';

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES ('4', '13', '18');
INSERT INTO `blog_article_tag` VALUES ('5', '14', '19');
INSERT INTO `blog_article_tag` VALUES ('6', '15', '20');
INSERT INTO `blog_article_tag` VALUES ('10', '5', '24');
INSERT INTO `blog_article_tag` VALUES ('14', '7', '17');
INSERT INTO `blog_article_tag` VALUES ('15', '6', '17');
INSERT INTO `blog_article_tag` VALUES ('17', '4', '25');
INSERT INTO `blog_article_tag` VALUES ('18', '8', '21');
INSERT INTO `blog_article_tag` VALUES ('19', '8', '22');
INSERT INTO `blog_article_tag` VALUES ('20', '8', '23');

-- ----------------------------
-- Table structure for blog_case
-- ----------------------------
DROP TABLE IF EXISTS `blog_case`;
CREATE TABLE `blog_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `category_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '案例类型',
  `title` varchar(255) NOT NULL COMMENT '案例标题',
  `cover_img` varchar(255) DEFAULT NULL COMMENT '案例封面',
  `describe` varchar(255) DEFAULT NULL COMMENT '案例描述',
  `content` mediumtext NOT NULL COMMENT '案例内容',
  `recommend` int(10) DEFAULT '0' COMMENT '推荐级别',
  `praise` int(11) DEFAULT '0' COMMENT '点赞量',
  `clicks` int(10) DEFAULT '0' COMMENT '点击量',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否公开 (0：否，1：是）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_case_title` (`title`) USING BTREE,
  KEY `index_blog_case_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='案例表';

-- ----------------------------
-- Records of blog_case
-- ----------------------------
INSERT INTO `blog_case` VALUES ('28', '0', '9', '爱斯贝儿品牌', '/static/uploads/20190419/19ca771f51db3d41f1ce577fcd86eb07.jpg', '云仓', '<p>云仓</p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 11:33:11', '0', null, null);
INSERT INTO `blog_case` VALUES ('29', '0', '10', 'cicilove微商控价系统', '/static/uploads/20190419/ec9d8887b72aaaf7dd92adeec1e5bc25.jpg', '控价', '<p><img src=\"/static/uploads/20190424/3d541dbc90bfe5bd1ccfa1132d2272ce.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 14:15:30', '0', '2019-04-24 11:37:49', null);
INSERT INTO `blog_case` VALUES ('30', '0', '11', '凡玊云仓定制开发', '/static/uploads/20190419/c57b963962220708ea819b7ddb9baf15.jpg', '授权、云仓', '<p><img src=\"/static/uploads/20190424/9ae73d487d817ee080b39b58df8d495f.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '0', '3', '0', null, '0', '1', '0', '2019-04-19 14:16:28', '0', '2019-04-24 11:37:31', null);
INSERT INTO `blog_case` VALUES ('31', '0', '12', 'PMA微商控价系统', '/static/uploads/20190419/e48e40dd834be28b80dc34c35124fd41.jpg', '控价授权防伪', '<p>控价授权防伪</p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 14:17:06', '0', null, null);
INSERT INTO `blog_case` VALUES ('32', '0', '13', '喵本国际云仓定制开发', '/static/uploads/20190419/5e9c5d62cccfeca85afeaa8125302c82.jpg', '授权', '<p><img src=\"/static/uploads/20190424/8fab572a43e8508c598c421a8e42d3fe.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 14:18:01', '0', '2019-04-24 11:36:49', null);
INSERT INTO `blog_case` VALUES ('33', '0', '14', '三生雪云仓定制开发', '/static/uploads/20190419/e297b53c206cfdae305649b5cd1e36ea.jpg', '三生雪云仓定制开发', '<p><span style=\"color: rgb(34, 34, 34); font-family: Consolas, \'Lucida Console\', monospace; font-size: 12px; line-height: normal; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">三生雪云仓定制开发</span>&nbsp;&nbsp;<br></p><p><br></p>', '0', '0', '1', '0', null, '0', '1', '0', '2019-04-19 14:18:35', '0', '2019-04-24 11:33:58', null);
INSERT INTO `blog_case` VALUES ('34', '0', '17', '微商云仓系统', '/static/uploads/20190424/a3d608b82cab22faee98c1e0527ff07f.jpg', '入仓/云仓/提货', '<p><img src=\"/static/uploads/20190424/853e2e409a0aae6c88be2af0cbec0d73.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190424/719ef27c2a09f925940335102baabb86.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190424/5dc83572add2e2735d6674919bb2e484.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190424/8f2781a322d014fb8ad4e4b64e81e432.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190424/a240ee8a5c88e89cc7e473949f99a327.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 14:19:18', '0', '2019-04-24 11:35:45', null);
INSERT INTO `blog_case` VALUES ('35', '0', '17', '微商控价系统', '/static/uploads/20190424/eb785396fb3530361f27598e632e475c.jpg', '防伪/授权/控价', '<p><img src=\"http://www.mrw.com/static/uploads/20190424/4d498ca214c6a9967c2c3c35f32572b0.jpg\" style=\"max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/8f9bd9714e35a180f6ce5a0cf1a3a60d.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/a488b661ee1697196c214ede02571fd3.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/836b742349508fd3b2dc332979155744.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/33e7120d27ea6dcee99f4ce199f2061a.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/1d0dc1b244207d5b126f92aefadceb57.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/e6c96e1c4bd8adfee8f1fc4a2e8e0857.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"http://www.mrw.com/static/uploads/20190424/bbb717806945b390426eeeef3b64466d.jpg\" style=\"box-shadow: rgb(51, 51, 51) 0px 0px 5px; line-height: normal; max-width: 100%;\">&nbsp;&nbsp;<br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-19 14:20:05', '0', '2019-04-24 11:35:31', null);

-- ----------------------------
-- Table structure for blog_case_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_case_tag`;
CREATE TABLE `blog_case_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL COMMENT '案例编号',
  `tag_id` int(11) NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`id`),
  KEY `index_blog_case_tag_article_id` (`case_id`) USING BTREE,
  KEY `index_blog_case_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='案例标签关联表';

-- ----------------------------
-- Records of blog_case_tag
-- ----------------------------
INSERT INTO `blog_case_tag` VALUES ('43', '31', '38');
INSERT INTO `blog_case_tag` VALUES ('47', '28', '34');
INSERT INTO `blog_case_tag` VALUES ('70', '33', '36');
INSERT INTO `blog_case_tag` VALUES ('71', '35', '39');
INSERT INTO `blog_case_tag` VALUES ('72', '34', '40');
INSERT INTO `blog_case_tag` VALUES ('73', '32', '36');
INSERT INTO `blog_case_tag` VALUES ('75', '30', '36');
INSERT INTO `blog_case_tag` VALUES ('76', '29', '35');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '栏目标题',
  `image` varchar(20) DEFAULT NULL COMMENT '栏目图片',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：正常，1：禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_nav_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客文章栏目表';

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('6', '公司新闻', null, '', '0', '0', '2018-08-11 01:43:09', '0', '2019-04-24 10:38:06', null);
INSERT INTO `blog_category` VALUES ('7', '企业新闻', null, '', '0', '0', '2019-04-22 16:46:44', '0', '2019-04-24 10:38:03', null);

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL COMMENT '文章编号',
  `member_id` int(11) NOT NULL COMMENT '会员标号',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_blog_comment_article_id` (`article_id`) USING BTREE,
  KEY `index_blog_comment_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章评论表';

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('67', '25', '1', '<p>哈哈</p>', null, '0', '0', '2018-09-06 02:59:26');
INSERT INTO `blog_comment` VALUES ('71', '38', '1', '<p>我就评论了</p>', null, '0', '0', '2018-10-11 20:59:06');

-- ----------------------------
-- Table structure for blog_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_config`;
CREATE TABLE `blog_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `type` varchar(30) NOT NULL DEFAULT 'string' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客配置';

-- ----------------------------
-- Records of blog_config
-- ----------------------------
INSERT INTO `blog_config` VALUES ('1', 'LoginDuration', 'blog', 'time', '3600', '博客登录有效时长', '0', '2018-07-17 17:27:27', '0', '2018-07-17 22:10:33', null);
INSERT INTO `blog_config` VALUES ('36', 'ScanFollow', 'blog', 'string', '/static/uploads/20190424/0280708b824debd59400a2f23784ff14.jpg', '扫我关注', '0', '2018-08-29 12:58:10', '0', null, null);
INSERT INTO `blog_config` VALUES ('40', 'qq', 'blog', 'string', '180-5428-5450', 'QQ', '0', '2019-01-02 17:38:39', '0', null, null);
INSERT INTO `blog_config` VALUES ('41', 'phone', 'blog', 'string', '180-5428-5450', '手机号码', '0', '2019-01-02 17:38:49', '0', null, null);
INSERT INTO `blog_config` VALUES ('42', 'wechat', 'blog', 'string', '180-5428-5450', '微信', '0', '2019-01-02 17:39:00', '0', null, null);
INSERT INTO `blog_config` VALUES ('43', 'SiteLocation', 'blog', 'string', '广东省广州市白云区永泰商务中心B219', '工作地址', '0', '2019-01-02 17:39:20', '0', null, null);
INSERT INTO `blog_config` VALUES ('44', 'company_name', 'blog', 'string', '广东得翼网络科技有限公司', '公司名称', '0', '2019-04-24 16:34:49', '0', null, null);

-- ----------------------------
-- Table structure for blog_follow
-- ----------------------------
DROP TABLE IF EXISTS `blog_follow`;
CREATE TABLE `blog_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_pid` int(11) DEFAULT NULL COMMENT '被关注人',
  `member_id` int(11) DEFAULT NULL COMMENT '关注人',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态(0：已关注，1：取消关注）',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of blog_follow
-- ----------------------------

-- ----------------------------
-- Table structure for blog_login_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_login_record`;
CREATE TABLE `blog_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '登录类型（0：退出，1：登录）',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录IP地址',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `region` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `isp` varchar(50) DEFAULT NULL COMMENT '网络类型',
  `location` varchar(100) DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客会员登录记录';

-- ----------------------------
-- Records of blog_login_record
-- ----------------------------

-- ----------------------------
-- Table structure for blog_member
-- ----------------------------
DROP TABLE IF EXISTS `blog_member`;
CREATE TABLE `blog_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT '' COMMENT '用户的标识，对当前网站唯一',
  `nickname` varchar(255) DEFAULT NULL COMMENT '别称',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `head_img` varchar(100) DEFAULT '/static/image/blog/face_default.jpg' COMMENT '用户头像',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `job` varchar(20) DEFAULT NULL COMMENT '职位',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别（0：男，1：女）',
  `year` int(20) DEFAULT NULL COMMENT '出生年份',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `province` varchar(100) DEFAULT '' COMMENT '所在省份',
  `city` varchar(100) DEFAULT '' COMMENT '所在城市',
  `location` varchar(255) DEFAULT NULL COMMENT '工作位置',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `source` tinyint(1) DEFAULT '0' COMMENT '注册来源',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否有删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_member_nickname` (`nickname`) USING BTREE,
  KEY `index_blog_member_username` (`username`) USING BTREE,
  KEY `index_blog_member_phone` (`phone`),
  KEY `index_blog_member_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客用户表';

-- ----------------------------
-- Records of blog_member
-- ----------------------------
INSERT INTO `blog_member` VALUES ('11', '', '测试1', 'ceshi1', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', '/static/image/blog/face_default.jpg', '13659797499', '223@qq.com', null, '0', null, null, '', '', null, '', '0', '0', '1', '2018-10-10 15:54:35', '0', null, null);
INSERT INTO `blog_member` VALUES ('12', '', '测试2', 'ceshi2', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', 'https://static.99php.cn/817665ed87824a76af9b997081d87cf7.jpg', '15521045869', '', null, '0', null, null, '', '', null, '', '0', '0', '0', '2018-10-17 01:47:35', '0', null, null);

-- ----------------------------
-- Table structure for blog_member_follow
-- ----------------------------
DROP TABLE IF EXISTS `blog_member_follow`;
CREATE TABLE `blog_member_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员编号',
  `follow_num` int(11) DEFAULT '0' COMMENT '关注数量',
  `fans_num` int(11) DEFAULT '0' COMMENT '粉丝数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of blog_member_follow
-- ----------------------------

-- ----------------------------
-- Table structure for blog_msg_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_msg_record`;
CREATE TABLE `blog_msg_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '信息类型(0：验证码）',
  `send_type` tinyint(1) DEFAULT '1' COMMENT '联系方式类型（0：手机号，1：邮箱）',
  `send` varchar(30) DEFAULT NULL COMMENT '联系方式',
  `message` varchar(255) NOT NULL COMMENT '信息内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_blog_msg_record_send` (`send`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信发送记录表';

-- ----------------------------
-- Records of blog_msg_record
-- ----------------------------

-- ----------------------------
-- Table structure for blog_notice
-- ----------------------------
DROP TABLE IF EXISTS `blog_notice`;
CREATE TABLE `blog_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `href` varchar(100) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT '_blank' COMMENT '弹出方式',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_notice_title` (`title`) USING BTREE,
  KEY `idex_blog_notice_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客公告表';

-- ----------------------------
-- Records of blog_notice
-- ----------------------------
INSERT INTO `blog_notice` VALUES ('1', '广州得翼有限公司', null, '', '_blank', '0', null, '0', '2018-08-10 21:25:23', '0', null, null);
INSERT INTO `blog_notice` VALUES ('2', '广州得翼有限公司', null, '', '_blank', '0', '', '0', '2018-08-10 21:25:44', '0', null, null);
INSERT INTO `blog_notice` VALUES ('3', '广州得翼有限公司', null, '', '_blank', '0', '', '0', '2018-08-10 21:26:31', '0', null, null);

-- ----------------------------
-- Table structure for blog_product
-- ----------------------------
DROP TABLE IF EXISTS `blog_product`;
CREATE TABLE `blog_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `category_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '产品类型',
  `title` varchar(255) NOT NULL COMMENT '产品标题',
  `cover_img` varchar(255) DEFAULT NULL COMMENT '产品封面',
  `describe` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `content` mediumtext NOT NULL COMMENT '产品内容',
  `recommend` int(10) DEFAULT '0' COMMENT '推荐级别',
  `praise` int(11) DEFAULT '0' COMMENT '点赞量',
  `clicks` int(10) DEFAULT '0' COMMENT '点击量',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否公开 (0：否，1：是）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_product_title` (`title`) USING BTREE,
  KEY `index_blog_product_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客产品表';

-- ----------------------------
-- Records of blog_product
-- ----------------------------
INSERT INTO `blog_product` VALUES ('13', '0', '8', '得翼微商控价系统', '/static/uploads/20190423/69eb484f4c705fb4e87b81c46d8e799b.jpg', '微商控价系统', '<p><img src=\"/static/uploads/20190423/1c136323fb11099f081784866885d25e.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/4fc0adb506b01eb3523cf1711a90bf28.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/16e3b2dd9a69f3604f13c6ea8f7078ef.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/713f89070fb3959df4114e0bec76053d.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/6b706397e70c63fa5bce9160a2adaef1.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/f7e61061b0a6f82e65e7ff78e61b192d.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/abaa35c1e25e650666e03da1e354dd57.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/f92a0ce618e16f4a9d1b3b7b8af8e4d7.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-03-27 11:32:24', '0', '2019-04-23 15:56:05', null);
INSERT INTO `blog_product` VALUES ('15', '0', '8', '小程序防伪开发', '/static/uploads/20190423/1a59c871c3596aeb198209bbe80c9a3a.jpg', '小程序防伪开发', '<p><img src=\"/static/uploads/20190423/31abd1700fe39e0f825e01fefe28a5ad.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/8b6e585e9e2e2a67f50eb520521982e9.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/712a928f4c4ef814fb79622710bcf588.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/04eb02ebff50a44b838030711cb319d3.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/8ebbbef5af48b7b55d4333a5b0da529b.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '1', '0', null, '0', '1', '0', '2019-03-27 11:45:17', '0', '2019-04-23 15:56:40', null);
INSERT INTO `blog_product` VALUES ('26', '0', '11', 'SEO优化', '/static/uploads/20190423/bc634ea6ce4ce7a88e44307f97b0469c.jpg', 'SEO优化', '<p><img src=\"/static/uploads/20190423/a40a327146a45f4121510905a40cd9ec.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/b3c7165053bf44af92d6277f9c2e4e7b.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/a4c5cba051bcde3bab4f99766a47cd33.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/f6deabb1532e9247cb29fa171e8f6d82.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-03-27 14:09:27', '0', '2019-04-23 15:57:08', null);
INSERT INTO `blog_product` VALUES ('27', '0', '9', '云仓系统开发', '/static/uploads/20190423/8f8ec9d862dc68225dcae6c32c9def3b.jpg', '云仓系统开发', '<p><img src=\"/static/uploads/20190423/26be389379673cb00da77b83de17488b.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/b32e3538877187da45dfb35b7b2183e9.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/e96b3b9d0a99284752ae5ec0e303e85e.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/eba13c14c8d6491d65ece3fbdd2cc2c5.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/0c9998ed4a1941b0f2c99a7f6ff69d29.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '4', '0', null, '0', '1', '0', '2019-04-23 15:13:13', '0', '2019-04-23 15:59:02', null);
INSERT INTO `blog_product` VALUES ('28', '0', '12', '分销商城开发', '/static/uploads/20190423/6e66c20d4e63d5fb38f921cc3c043d00.jpg', '分销商城开发', '<p><img src=\"/static/uploads/20190423/62ce9e6ad5a43d851c00d89aa83352bf.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/995beb9d9e8924ddfb0f01e27bb1ac9c.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/0b4f093a64e5a0876ba8489fb191f37b.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/234a7046a3ba82d48ac9a57f7506a6b8.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/17886701f7cbd76ff6cae95b51894452.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/3be9e3fb611b567a713334a43048f507.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/6490580673d88814d327d008da9df798.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/306e77da7b9df826f0eaf0e65bfbfd58.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-23 15:13:59', '0', '2019-04-23 15:58:43', null);
INSERT INTO `blog_product` VALUES ('29', '0', '8', '产品二维码系统开发', '/static/uploads/20190423/e308d11d68370bb3dc7d0338e6743e63.jpg', '分销商城开发', '<p><img src=\"/static/uploads/20190423/c92dfbaf91b56821d5cdd2edcf1a758e.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/e31ca13f932219b7b91c56e888217975.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/e1c54c0855e4de2f41bb599c4f559ee0.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/7c97845355bbeb7d3e9fb32c1f826368.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/ca693995bd2a3f6187e54176cacacb93.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/047bdf010998725765f7e782f1ac20ba.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '6', '0', null, '0', '1', '0', '2019-04-23 15:14:59', '0', '2019-04-23 15:58:12', null);
INSERT INTO `blog_product` VALUES ('30', '0', '8', '小程序商城', '/static/uploads/20190423/c4d93cc16a175016899b99878b43d211.jpg', '小程序商城', '<p><img src=\"/static/uploads/20190423/4b0fb892ba20ca046fc28ed3f66db1c1.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/d05ef2e28d1844796d5e2bad120e84a0.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/0f5135606408627eaee3f99918b68d23.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/59897fc531e93ce5326d6720d573349c.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/3f79ee8b385bda73ac6feb0e0b9e222f.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/3ceebcccaca1b096ecf441d656cfa974.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/837f0d658290d815edaf42fcb1e4b7f2.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/279f5096491273c6d8c9036c079f1491.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/0a0bc05b10f805ddc45ec341ec1f9362.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '0', '0', null, '0', '1', '0', '2019-04-23 15:15:27', '0', '2019-04-23 15:57:51', null);
INSERT INTO `blog_product` VALUES ('31', '0', '8', 'APP开发', '/static/uploads/20190423/a54195fefd879b026ea82ceee46684ff.jpg', 'APP开发', '<p><img src=\"/static/uploads/20190423/625a4d5a8438e4e0fd10a68a77f798c5.jpg\" style=\"max-width:100%;\"><img src=\"/static/uploads/20190423/480f6c381f65d37cb83107cd6ad6c617.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/4bd546f640a752345e67af1fda006a42.jpg\" style=\"line-height: normal; max-width: 100%;\"><img src=\"/static/uploads/20190423/ca01dd84d59f3a4853769015d6f606f2.jpg\" style=\"line-height: normal; max-width: 100%;\"><br></p><p><br></p>', '0', '0', '18', '0', null, '0', '1', '0', '2019-04-23 15:16:04', '0', '2019-04-23 15:57:28', null);

-- ----------------------------
-- Table structure for blog_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_product_tag`;
CREATE TABLE `blog_product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品编号',
  `tag_id` int(11) NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`id`),
  KEY `index_blog_product_tag_article_id` (`product_id`) USING BTREE,
  KEY `index_blog_product_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品标签关联表';

-- ----------------------------
-- Records of blog_product_tag
-- ----------------------------
INSERT INTO `blog_product_tag` VALUES ('11', '14', '31');
INSERT INTO `blog_product_tag` VALUES ('31', '13', '34');
INSERT INTO `blog_product_tag` VALUES ('32', '13', '33');
INSERT INTO `blog_product_tag` VALUES ('33', '15', '35');
INSERT INTO `blog_product_tag` VALUES ('34', '26', '33');
INSERT INTO `blog_product_tag` VALUES ('35', '31', '39');
INSERT INTO `blog_product_tag` VALUES ('36', '30', '38');
INSERT INTO `blog_product_tag` VALUES ('37', '29', '37');
INSERT INTO `blog_product_tag` VALUES ('38', '28', '37');
INSERT INTO `blog_product_tag` VALUES ('39', '27', '36');

-- ----------------------------
-- Table structure for blog_search
-- ----------------------------
DROP TABLE IF EXISTS `blog_search`;
CREATE TABLE `blog_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT NULL COMMENT '搜索关键词',
  `total` int(11) DEFAULT '0' COMMENT '搜索总次数',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='搜索统计表';

-- ----------------------------
-- Records of blog_search
-- ----------------------------
INSERT INTO `blog_search` VALUES ('14', 'git', '4', '2018-10-22 18:23:05', '2018-08-30 13:29:53');
INSERT INTO `blog_search` VALUES ('15', 'php', '37', '2018-10-29 22:21:17', '2018-08-30 13:38:35');
INSERT INTO `blog_search` VALUES ('16', 'css', '2', '2018-08-30 13:37:40', '2018-08-30 13:39:11');
INSERT INTO `blog_search` VALUES ('17', 'mysql', '1', null, '2018-08-30 13:39:20');
INSERT INTO `blog_search` VALUES ('18', '索引', '1', null, '2018-08-30 13:39:27');
INSERT INTO `blog_search` VALUES ('19', '索引用法', '2', '2018-08-30 13:43:11', '2018-08-30 13:39:35');
INSERT INTO `blog_search` VALUES ('20', 'sdsd', '1', null, '2018-09-21 00:01:07');
INSERT INTO `blog_search` VALUES ('21', '646', '20', '2018-10-29 22:15:38', '2018-10-29 22:13:01');

-- ----------------------------
-- Table structure for blog_search_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_search_record`;
CREATE TABLE `blog_search_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '搜索类型（0：未知，1：标题，2：标签）',
  `word` varchar(255) DEFAULT NULL COMMENT '搜索关键词',
  `member_id` int(11) DEFAULT '0' COMMENT '登录会员编号（0：游客）',
  `ip` varchar(255) DEFAULT '' COMMENT 'ip地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='搜索记录表';

-- ----------------------------
-- Records of blog_search_record
-- ----------------------------
INSERT INTO `blog_search_record` VALUES ('6', '2', 'php', '0', '127.0.0.1', '正在搜索文章！', '2018-08-30 12:59:43');
INSERT INTO `blog_search_record` VALUES ('7', '2', 'mysql', '0', '127.0.0.1', '正在搜索文章！', '2018-08-30 13:00:05');
INSERT INTO `blog_search_record` VALUES ('8', '2', 'redis', '0', '127.0.0.1', '正在搜索文章！', '2018-08-30 13:01:04');

-- ----------------------------
-- Table structure for blog_slider
-- ----------------------------
DROP TABLE IF EXISTS `blog_slider`;
CREATE TABLE `blog_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `image` text NOT NULL COMMENT '轮播图片',
  `href` varchar(100) DEFAULT NULL COMMENT '轮播图片链接',
  `target` varchar(10) DEFAULT '_blank' COMMENT '弹出方式',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_slider_title` (`title`) USING BTREE,
  KEY `index_blog_slider_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客轮播图';

-- ----------------------------
-- Records of blog_slider
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(20) NOT NULL COMMENT '标签标题',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_blog_tag_title` (`tag_title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客标签表';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('16', '七牛云', null, '0', '2018-09-20 03:27:23', '0');
INSERT INTO `blog_tag` VALUES ('17', '阿斯蒂芬', null, '0', '2019-03-14 14:07:30', '0');
INSERT INTO `blog_tag` VALUES ('18', '测试产品标签一', null, '0', '2019-03-27 11:32:24', '0');
INSERT INTO `blog_tag` VALUES ('19', '23', null, '0', '2019-03-27 11:36:47', '0');
INSERT INTO `blog_tag` VALUES ('20', '出事了呢', null, '0', '2019-03-27 11:45:17', '0');
INSERT INTO `blog_tag` VALUES ('21', '其他类', null, '0', '2019-04-18 11:29:05', '0');
INSERT INTO `blog_tag` VALUES ('22', '科技感', null, '0', '2019-04-18 11:29:05', '0');
INSERT INTO `blog_tag` VALUES ('23', '质感立体', null, '0', '2019-04-18 11:29:05', '0');
INSERT INTO `blog_tag` VALUES ('24', '123', null, '0', '2019-04-22 16:47:32', '0');
INSERT INTO `blog_tag` VALUES ('25', '云仓系统开发', null, '0', '2019-04-23 17:52:30', '0');

-- ----------------------------
-- Table structure for blog_website_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_website_link`;
CREATE TABLE `blog_website_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `website_logo` varchar(500) DEFAULT NULL COMMENT '网站LOGO',
  `href` varchar(500) DEFAULT '#' COMMENT '链接地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(255) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='站点友链';

-- ----------------------------
-- Records of blog_website_link
-- ----------------------------
INSERT INTO `blog_website_link` VALUES ('1', '防伪系统', '', 'http://gzbaoman.com', '', '2', '0', '2018-08-29 12:30:32');
INSERT INTO `blog_website_link` VALUES ('2', '得翼网络', '', 'http://gzdy88.com', '', '1', '0', '2018-08-29 12:31:44');
INSERT INTO `blog_website_link` VALUES ('3', '控价系统', null, 'http://zhuoxiansheng.vip', null, '0', '0', '2019-04-23 14:42:09');
INSERT INTO `blog_website_link` VALUES ('4', '云仓系统', null, 'http://gzdy88.vip', null, '0', '0', '2019-04-23 14:42:31');

-- ----------------------------
-- Table structure for casecategory
-- ----------------------------
DROP TABLE IF EXISTS `casecategory`;
CREATE TABLE `casecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '栏目标题',
  `image` varchar(20) DEFAULT NULL COMMENT '栏目图片',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：正常，1：禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_nav_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='案例栏目表';

-- ----------------------------
-- Records of casecategory
-- ----------------------------
INSERT INTO `casecategory` VALUES ('9', '爱斯贝儿品牌合作', null, '', '0', '0', '2019-04-19 11:26:36', '0', '2019-04-24 11:48:50', null);
INSERT INTO `casecategory` VALUES ('10', 'cicilove品牌合作', null, '', '0', '0', '2019-04-19 14:26:33', '0', '2019-04-24 11:48:47', null);
INSERT INTO `casecategory` VALUES ('11', '凡玊品牌合作', null, '', '0', '0', '2019-04-19 14:26:44', '0', '2019-04-24 11:48:44', null);
INSERT INTO `casecategory` VALUES ('12', 'PMA品牌合作', null, '', '0', '0', '2019-04-19 14:26:59', '0', '2019-04-24 11:48:40', null);
INSERT INTO `casecategory` VALUES ('13', '喵本国际品牌合作', null, '', '1', '0', '2019-04-19 14:27:16', '0', '2019-04-24 11:48:33', null);
INSERT INTO `casecategory` VALUES ('14', '三生雪品牌合作', null, '', '0', '0', '2019-04-19 14:27:28', '0', '2019-04-24 11:48:30', null);
INSERT INTO `casecategory` VALUES ('17', '云仓系统开发', null, '', '0', '0', '2019-04-24 11:34:51', '0', '2019-04-24 11:47:29', null);

-- ----------------------------
-- Table structure for case_tag
-- ----------------------------
DROP TABLE IF EXISTS `case_tag`;
CREATE TABLE `case_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(20) NOT NULL COMMENT '标签标题',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_case_tag_title` (`tag_title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='案例标签表';

-- ----------------------------
-- Records of case_tag
-- ----------------------------
INSERT INTO `case_tag` VALUES ('32', '案例标签', null, '0', '2019-04-19 11:33:11', '0');
INSERT INTO `case_tag` VALUES ('33', '云仓', null, '0', '2019-04-19 14:14:41', '0');
INSERT INTO `case_tag` VALUES ('34', '虚拟币', null, '0', '2019-04-19 14:14:41', '0');
INSERT INTO `case_tag` VALUES ('35', '控价', null, '0', '2019-04-19 14:15:30', '0');
INSERT INTO `case_tag` VALUES ('36', '授权', null, '0', '2019-04-19 14:15:30', '0');
INSERT INTO `case_tag` VALUES ('37', '代理管理', null, '0', '2019-04-19 14:16:28', '0');
INSERT INTO `case_tag` VALUES ('38', '防伪', null, '0', '2019-04-19 14:17:06', '0');
INSERT INTO `case_tag` VALUES ('39', '防伪/授权/控价', null, '0', '2019-04-24 11:30:59', '0');
INSERT INTO `case_tag` VALUES ('40', '入仓/云仓/提货', null, '0', '2019-04-24 11:32:41', '0');

-- ----------------------------
-- Table structure for download_config
-- ----------------------------
DROP TABLE IF EXISTS `download_config`;
CREATE TABLE `download_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='下载信息配置表';

-- ----------------------------
-- Records of download_config
-- ----------------------------
INSERT INTO `download_config` VALUES ('1', 'DownloadUrl', 'https://static.99php.cn/99Admin_V1.0.3.zip', '下载地址', '2018-08-04 19:32:17', '0');
INSERT INTO `download_config` VALUES ('2', 'GitHub', 'https://github.com/zhongshaofa/99Admin', 'GitHub地址', '2018-08-04 19:33:48', '0');
INSERT INTO `download_config` VALUES ('3', 'Gitee', 'https://gitee.com/zhongshaofa/99Admin', '码云地址', '2018-08-04 19:34:40', '0');
INSERT INTO `download_config` VALUES ('4', 'QQUrl', 'https://jq.qq.com/?_wv=1027&k=5IHJawE', 'QQ群链接', '2018-08-04 19:35:04', '0');
INSERT INTO `download_config` VALUES ('5', 'Version', 'V1.0.3', '版本信息', '2018-08-04 19:36:41', '0');
INSERT INTO `download_config` VALUES ('6', 'WelcomeWord', '广州得翼有限公司', '欢迎词', '2018-08-04 20:04:01', '0');
INSERT INTO `download_config` VALUES ('7', 'Introduce', ' 广州得翼有限公司', null, '2018-08-04 20:13:17', '0');
INSERT INTO `download_config` VALUES ('8', 'Describe1', ' 广州得翼有限公司', null, '2018-08-04 20:36:32', '0');
INSERT INTO `download_config` VALUES ('9', 'Describe2', ' 广州得翼有限公司', null, '2018-08-04 20:36:36', '0');

-- ----------------------------
-- Table structure for download_record
-- ----------------------------
DROP TABLE IF EXISTS `download_record`;
CREATE TABLE `download_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `region` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `isp` varchar(50) DEFAULT NULL COMMENT '网络服务商',
  `location` varchar(100) DEFAULT NULL COMMENT '地理位置',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='下载记录表';

-- ----------------------------
-- Records of download_record
-- ----------------------------

-- ----------------------------
-- Table structure for email_template
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '类型 (1：注册，2：找回密码）',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `value` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信模板';

-- ----------------------------
-- Records of email_template
-- ----------------------------
INSERT INTO `email_template` VALUES ('2', '1', '注册验证码', '您正在申请手机注册，验证码为：${code}，5分钟内有效！', null, '2018-09-04 17:39:28');

-- ----------------------------
-- Table structure for procategory
-- ----------------------------
DROP TABLE IF EXISTS `procategory`;
CREATE TABLE `procategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '栏目标题',
  `image` varchar(20) DEFAULT NULL COMMENT '栏目图片',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：正常，1：禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `index_blog_nav_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客产品栏目表';

-- ----------------------------
-- Records of procategory
-- ----------------------------
INSERT INTO `procategory` VALUES ('8', '防伪/授权/控价', null, '', '0', '0', '2019-03-27 11:10:11', '0', null, null);
INSERT INTO `procategory` VALUES ('9', '入仓/云仓/提货', null, '', '0', '0', '2019-04-22 11:56:26', '0', null, null);
INSERT INTO `procategory` VALUES ('10', '官方性/新技术', null, '', '0', '0', '2019-04-22 11:56:40', '0', null, null);
INSERT INTO `procategory` VALUES ('11', '运营/布局/优化', null, '', '0', '0', '2019-04-22 11:56:55', '0', null, null);
INSERT INTO `procategory` VALUES ('12', '分销/下单/会员', null, '', '0', '0', '2019-04-22 11:57:08', '0', null, null);
INSERT INTO `procategory` VALUES ('13', '支持商家端/客户端/双端开发', null, '', '0', '0', '2019-04-22 11:57:31', '0', null, null);
INSERT INTO `procategory` VALUES ('14', '测试', null, '', '0', '0', '2019-04-22 14:16:47', '0', null, null);

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(20) NOT NULL COMMENT '标签标题',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` int(10) DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_product_tag_title` (`tag_title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品标签表';

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES ('27', '的', null, '0', '2019-03-27 14:09:27', '0');
INSERT INTO `product_tag` VALUES ('28', '平面类', null, '0', '2019-04-18 14:17:47', '0');
INSERT INTO `product_tag` VALUES ('29', '人工智能', null, '0', '2019-04-18 14:17:47', '0');
INSERT INTO `product_tag` VALUES ('30', '人工智能二', '', '0', '2019-04-18 14:17:47', '0');
INSERT INTO `product_tag` VALUES ('31', '质感', null, '0', '2019-04-18 17:29:29', '0');
INSERT INTO `product_tag` VALUES ('32', '123', '', '0', '2019-04-19 13:59:00', '0');
INSERT INTO `product_tag` VALUES ('33', '控价', null, '0', '2019-04-23 09:57:11', '0');
INSERT INTO `product_tag` VALUES ('34', '微商控价系统', null, '0', '2019-04-23 15:03:44', '0');
INSERT INTO `product_tag` VALUES ('35', '小程序', null, '0', '2019-04-23 15:10:34', '0');
INSERT INTO `product_tag` VALUES ('36', '云仓系统开发', null, '0', '2019-04-23 15:13:13', '0');
INSERT INTO `product_tag` VALUES ('37', '分销商城开发', null, '0', '2019-04-23 15:13:59', '0');
INSERT INTO `product_tag` VALUES ('38', '小程序商城', null, '0', '2019-04-23 15:15:27', '0');
INSERT INTO `product_tag` VALUES ('39', 'APP开发', null, '0', '2019-04-23 15:16:04', '0');

-- ----------------------------
-- Table structure for sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sms_template`;
CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '类型 (1：注册，2：找回密码）',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `value` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信模板';

-- ----------------------------
-- Records of sms_template
-- ----------------------------
INSERT INTO `sms_template` VALUES ('1', '1', 'SMS_134075338', '您正在申请手机注册，验证码为：${code}，5分钟内有效！', null, '2018-09-01 00:18:10');

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '管理员', '1', '4', '测试管理员', '0', '2018-03-17 15:59:46', '2018-08-07 10:26:57', null);
INSERT INTO `system_auth` VALUES ('4', '超级管理员', '0', '1', '不受权限控制', '0', '2018-01-23 13:28:14', null, null);
INSERT INTO `system_auth` VALUES ('6', '测试权限', '1', '0', '4242543', '0', '2018-09-22 18:15:31', null, null);

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT '0' COMMENT '创建人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'ManageName', 'basic', 'string', '微商控价系统、微商管理系统、微商云仓系统、微商新零售商城', '地址栏名称', '0', '2018-07-17 17:27:27', '0', '2018-07-17 22:10:33', null);
INSERT INTO `system_config` VALUES ('2', 'Beian', 'basic', 'string', '粤ICP备17015772号', '备案号', '0', '2018-07-17 17:27:27', '0', '2018-07-17 22:10:39', null);
INSERT INTO `system_config` VALUES ('18', 'FooterName', 'basic', 'string', 'Copyright © 2018-2019 广东得翼网络科技有限公司', '底部网站标识', '5', '2018-07-17 17:27:27', '0', '2018-07-17 18:40:16', null);
INSERT INTO `system_config` VALUES ('19', 'BeianUrl', 'basic', 'string', 'http://www.miitbeian.gov.cn', '备案查询链接', '2', '2018-07-17 17:30:39', '0', '2018-07-17 17:31:22', null);
INSERT INTO `system_config` VALUES ('20', 'HomeUrl', 'basic', 'string', 'https://www.99php.cn', '网站首页', '0', '2018-07-17 18:45:59', '0', '2018-07-17 18:46:12', null);
INSERT INTO `system_config` VALUES ('21', 'VercodeType', 'basic', 'tinyint', '1', '验证码登录开关（0：不开启，1：开启）', '3', '2018-07-17 21:52:00', '0', '2018-07-18 02:38:10', null);
INSERT INTO `system_config` VALUES ('32', 'Describe', 'basic', 'string', '广州得翼有限公司', '后台顶部的名字', '0', '2018-07-30 23:01:34', '0', null, null);
INSERT INTO `system_config` VALUES ('33', 'Author', 'basic', 'string', '卓经理：18620075349', '联系人一', '1', '2018-07-30 23:02:41', '0', null, null);
INSERT INTO `system_config` VALUES ('34', 'Email', 'basic', 'string', '联系邮箱：793755415@qq.com', '联系邮箱', '0', '2018-07-30 23:03:15', '0', null, null);
INSERT INTO `system_config` VALUES ('35', 'BlogFooterName', 'basic', 'string', 'Copyright © 2018-2019 广东得翼网络科技有限公司', '网站底部', '0', '2018-08-13 00:32:50', '0', null, null);
INSERT INTO `system_config` VALUES ('36', 'MailHost', 'mail', 'string', 'smtp.163.com', '发送方的SMTP服务器地址', '7', '2018-08-31 15:39:04', '0', null, null);
INSERT INTO `system_config` VALUES ('37', 'MailUsername', 'mail', 'string', '', '发送方的QQ邮箱用户名', '7', '2018-08-31 15:39:43', '0', null, null);
INSERT INTO `system_config` VALUES ('38', 'MailPassword', 'mail', 'string', '', '第三方授权登录码', '7', '2018-08-31 15:39:53', '0', null, null);
INSERT INTO `system_config` VALUES ('39', 'OursName', 'basic', 'string', '广东得翼网络科技有限公司', '公司全称', '0', '2018-08-31 15:40:44', '0', null, null);
INSERT INTO `system_config` VALUES ('40', 'MailReplyTo', 'mail', 'string', 'null', '回复邮件地址', '7', '2018-08-31 15:41:03', '0', null, null);
INSERT INTO `system_config` VALUES ('41', 'BusLine', 'basic', 'string', '乘坐车到元下田站(步行约530米)', '公交线路', '0', '2018-08-31 23:58:34', '0', null, null);
INSERT INTO `system_config` VALUES ('42', 'SubLine', 'basic', 'string', '白云大道北站C2出口下车(步行约1400米)', '地铁路线', '0', '2018-08-31 23:58:45', '0', null, null);
INSERT INTO `system_config` VALUES ('43', 'SignName', 'sms', 'string', '广东得翼网络科技有限公司', '短信注册模板', '7', '2018-09-01 00:08:55', '0', null, null);
INSERT INTO `system_config` VALUES ('44', 'CodeTime', 'code', 'int', '60', '验证码发送间隔时间', '5', '2018-09-04 18:03:52', '0', null, null);
INSERT INTO `system_config` VALUES ('45', 'CodeDieTime', 'code', 'int', '300', '验证码有效期', '5', '2018-09-04 18:17:26', '0', null, null);
INSERT INTO `system_config` VALUES ('46', 'FileType', 'file', 'int', '1', '文件保存方法（1：本地，2：七牛云）', '2', '2018-09-17 11:44:12', '0', null, null);
INSERT INTO `system_config` VALUES ('47', 'FileKey', 'file', 'string', '690c7175d2b4439646b437b8b48f92fb147eccf0', '文件路径加密秘钥（www.99php.cn）', '2', '2018-09-17 16:51:29', '0', null, null);
INSERT INTO `system_config` VALUES ('48', 'LoginDuration', 'basic', 'int', '7200', '后台登录有效时间', '1', '2018-09-30 01:02:53', '0', null, null);
INSERT INTO `system_config` VALUES ('49', 'AdminModuleName', 'basic', 'int', 'console', '后台登录模块名', '1', '2018-10-01 01:22:05', '0', null, null);
INSERT INTO `system_config` VALUES ('50', 'CleanCachePassword', 'basic', 'string', 'chung951222', '刷新缓存的密码', '3', '2018-10-01 01:42:16', '0', null, null);
INSERT INTO `system_config` VALUES ('51', 'contact_email', 'spider', 'string', '', '待续', '0', '2018-11-19 10:46:26', '0', null, null);
INSERT INTO `system_config` VALUES ('52', 'qq', 'basic', 'string', '180-5428-5450', 'QQ', '0', '2018-11-19 10:46:36', '0', null, null);
INSERT INTO `system_config` VALUES ('53', 'address', 'basic', 'string', '地址：广东省广州市白云区永泰商务中心B219', '地址', '0', '2018-11-19 10:46:46', '0', null, null);
INSERT INTO `system_config` VALUES ('54', 'Author2', 'basic', 'string', '黄经理 ：180-5428-5450', '联系人二', '0', '2019-04-18 18:26:46', '0', null, null);

-- ----------------------------
-- Table structure for system_login_record
-- ----------------------------
DROP TABLE IF EXISTS `system_login_record`;
CREATE TABLE `system_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '登录类型（0：退出，1：登录）',
  `user_id` int(11) DEFAULT NULL COMMENT '系统用户ID（0：账户不存在）',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录IP地址',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `region` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `isp` varchar(50) DEFAULT NULL COMMENT '网络类型',
  `location` varchar(100) DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0：失败，1：成功）',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客会员登录记录';

-- ----------------------------
-- Records of system_login_record
-- ----------------------------
INSERT INTO `system_login_record` VALUES ('444', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-14 09:57:19');
INSERT INTO `system_login_record` VALUES ('445', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-14 14:01:17');
INSERT INTO `system_login_record` VALUES ('446', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-14 14:01:32');
INSERT INTO `system_login_record` VALUES ('447', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-14 16:31:47');
INSERT INTO `system_login_record` VALUES ('448', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-14 16:31:58');
INSERT INTO `system_login_record` VALUES ('449', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-20 16:11:52');
INSERT INTO `system_login_record` VALUES ('450', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-25 09:53:40');
INSERT INTO `system_login_record` VALUES ('451', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-25 14:21:36');
INSERT INTO `system_login_record` VALUES ('452', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-25 14:21:46');
INSERT INTO `system_login_record` VALUES ('453', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-25 16:22:21');
INSERT INTO `system_login_record` VALUES ('454', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-25 16:22:30');
INSERT INTO `system_login_record` VALUES ('455', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-26 10:08:06');
INSERT INTO `system_login_record` VALUES ('456', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-26 10:46:00');
INSERT INTO `system_login_record` VALUES ('457', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-26 11:56:06');
INSERT INTO `system_login_record` VALUES ('458', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-26 13:57:44');
INSERT INTO `system_login_record` VALUES ('459', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-26 13:57:55');
INSERT INTO `system_login_record` VALUES ('460', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-26 17:25:41');
INSERT INTO `system_login_record` VALUES ('461', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-26 18:14:57');
INSERT INTO `system_login_record` VALUES ('462', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-27 09:36:35');
INSERT INTO `system_login_record` VALUES ('463', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-27 09:36:52');
INSERT INTO `system_login_record` VALUES ('464', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-27 11:36:55');
INSERT INTO `system_login_record` VALUES ('465', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-27 11:37:05');
INSERT INTO `system_login_record` VALUES ('466', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-27 11:56:21');
INSERT INTO `system_login_record` VALUES ('467', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-03-27 14:00:14');
INSERT INTO `system_login_record` VALUES ('468', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-03-27 14:00:39');
INSERT INTO `system_login_record` VALUES ('469', '1', '0', '127.0.0.1', '', '', '', '', '', '【账号登录】账户不存在，请重新输入！', '0', '2019-04-17 18:01:29');
INSERT INTO `system_login_record` VALUES ('470', '1', '0', '127.0.0.1', '', '', '', '', '', '【账号登录】账户不存在，请重新输入！', '0', '2019-04-17 18:01:35');
INSERT INTO `system_login_record` VALUES ('471', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:03:27');
INSERT INTO `system_login_record` VALUES ('472', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:03:42');
INSERT INTO `system_login_record` VALUES ('473', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:03:51');
INSERT INTO `system_login_record` VALUES ('474', '1', '0', '127.0.0.1', '', '', '', '', '', '【账号登录】账户不存在，请重新输入！', '0', '2019-04-17 18:04:01');
INSERT INTO `system_login_record` VALUES ('475', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:04:04');
INSERT INTO `system_login_record` VALUES ('476', '1', '0', '127.0.0.1', '', '', '', '', '', '【账号登录】账户不存在，请重新输入！', '0', '2019-04-17 18:05:23');
INSERT INTO `system_login_record` VALUES ('477', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:05:30');
INSERT INTO `system_login_record` VALUES ('478', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:05:33');
INSERT INTO `system_login_record` VALUES ('479', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:08:46');
INSERT INTO `system_login_record` VALUES ('480', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:09:07');
INSERT INTO `system_login_record` VALUES ('481', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:09:19');
INSERT INTO `system_login_record` VALUES ('482', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:10:11');
INSERT INTO `system_login_record` VALUES ('483', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:15:43');
INSERT INTO `system_login_record` VALUES ('484', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:18:35');
INSERT INTO `system_login_record` VALUES ('485', '1', '0', '127.0.0.1', '', '', '', '', '', '【账号登录】账户不存在，请重新输入！', '0', '2019-04-17 18:27:43');
INSERT INTO `system_login_record` VALUES ('486', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:27:46');
INSERT INTO `system_login_record` VALUES ('487', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-17 18:31:22');
INSERT INTO `system_login_record` VALUES ('488', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-17 18:32:04');
INSERT INTO `system_login_record` VALUES ('489', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-18 11:22:51');
INSERT INTO `system_login_record` VALUES ('490', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 11:22:55');
INSERT INTO `system_login_record` VALUES ('491', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-18 14:00:58');
INSERT INTO `system_login_record` VALUES ('492', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 14:01:03');
INSERT INTO `system_login_record` VALUES ('493', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-18 17:00:58');
INSERT INTO `system_login_record` VALUES ('494', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 17:01:01');
INSERT INTO `system_login_record` VALUES ('495', '0', '1', '127.0.0.1', '', '', '', '', '', '【主动退出】正在退出后台系统！', '1', '2019-04-18 17:45:04');
INSERT INTO `system_login_record` VALUES ('496', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 17:45:08');
INSERT INTO `system_login_record` VALUES ('497', '0', '1', '127.0.0.1', '', '', '', '', '', '【主动退出】正在退出后台系统！', '1', '2019-04-18 17:45:22');
INSERT INTO `system_login_record` VALUES ('498', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 17:50:57');
INSERT INTO `system_login_record` VALUES ('499', '0', '1', '127.0.0.1', '', '', '', '', '', '【主动退出】正在退出后台系统！', '1', '2019-04-18 17:51:37');
INSERT INTO `system_login_record` VALUES ('500', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 17:51:52');
INSERT INTO `system_login_record` VALUES ('501', '0', '1', '127.0.0.1', '', '', '', '', '', '【主动退出】正在退出后台系统！', '1', '2019-04-18 17:52:07');
INSERT INTO `system_login_record` VALUES ('502', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 17:54:56');
INSERT INTO `system_login_record` VALUES ('503', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 18:38:54');
INSERT INTO `system_login_record` VALUES ('504', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-18 21:13:34');
INSERT INTO `system_login_record` VALUES ('505', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-18 21:13:47');
INSERT INTO `system_login_record` VALUES ('506', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-19 10:06:01');
INSERT INTO `system_login_record` VALUES ('507', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 10:06:12');
INSERT INTO `system_login_record` VALUES ('508', '0', '1', '127.0.0.1', '', '', '', '', '', '【主动退出】正在退出后台系统！', '1', '2019-04-19 11:05:27');
INSERT INTO `system_login_record` VALUES ('509', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 11:05:37');
INSERT INTO `system_login_record` VALUES ('510', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 11:07:47');
INSERT INTO `system_login_record` VALUES ('511', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-19 13:52:11');
INSERT INTO `system_login_record` VALUES ('512', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 13:52:56');
INSERT INTO `system_login_record` VALUES ('513', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 13:54:00');
INSERT INTO `system_login_record` VALUES ('514', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 13:56:00');
INSERT INTO `system_login_record` VALUES ('515', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】密码不正确，请重新输入！', '0', '2019-04-19 15:06:38');
INSERT INTO `system_login_record` VALUES ('516', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 15:07:13');
INSERT INTO `system_login_record` VALUES ('517', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 15:08:15');
INSERT INTO `system_login_record` VALUES ('518', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 15:08:52');
INSERT INTO `system_login_record` VALUES ('519', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 15:11:27');
INSERT INTO `system_login_record` VALUES ('520', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-19 15:22:35');
INSERT INTO `system_login_record` VALUES ('521', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 11:16:47');
INSERT INTO `system_login_record` VALUES ('522', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-22 13:57:06');
INSERT INTO `system_login_record` VALUES ('523', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 13:57:20');
INSERT INTO `system_login_record` VALUES ('524', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 14:44:42');
INSERT INTO `system_login_record` VALUES ('525', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 14:45:41');
INSERT INTO `system_login_record` VALUES ('526', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 16:05:40');
INSERT INTO `system_login_record` VALUES ('527', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-22 19:07:35');
INSERT INTO `system_login_record` VALUES ('528', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-22 19:07:47');
INSERT INTO `system_login_record` VALUES ('529', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-23 09:50:40');
INSERT INTO `system_login_record` VALUES ('530', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-23 09:52:02');
INSERT INTO `system_login_record` VALUES ('531', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-23 14:33:10');
INSERT INTO `system_login_record` VALUES ('532', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-23 15:31:03');
INSERT INTO `system_login_record` VALUES ('533', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-23 17:35:27');
INSERT INTO `system_login_record` VALUES ('534', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-23 17:44:47');
INSERT INTO `system_login_record` VALUES ('535', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-24 09:50:05');
INSERT INTO `system_login_record` VALUES ('536', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-24 09:51:19');
INSERT INTO `system_login_record` VALUES ('537', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-24 11:51:21');
INSERT INTO `system_login_record` VALUES ('538', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-24 11:51:34');
INSERT INTO `system_login_record` VALUES ('539', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-24 14:17:23');
INSERT INTO `system_login_record` VALUES ('540', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-24 14:17:30');
INSERT INTO `system_login_record` VALUES ('541', '0', '1', '127.0.0.1', '', '', '', '', '', '【登录过期】正在退出后台系统！', '1', '2019-04-24 16:26:49');
INSERT INTO `system_login_record` VALUES ('542', '1', '1', '127.0.0.1', '', '', '', '', '', '【账号登录】登录成功，正在进入系统！', '1', '2019-04-24 16:26:56');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `spread` tinyint(1) DEFAULT '0',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` float(11,2) DEFAULT '0.00' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '后台首页', '0', '', '&#xe68e;', 'admin/index/welcome', '', '_self', '0.00', '1', '', '0', '2018-07-21 13:28:32', null, null);
INSERT INTO `system_menu` VALUES ('142', '0', '系统设置', '0', '', '&#xe620;', '#', '', '_self', '3.00', '1', null, '0', '2018-07-17 03:09:41', null, null);
INSERT INTO `system_menu` VALUES ('163', '167', '管理员列表', '0', '', 'fa-group', 'admin/user/index', '', '_self', '1.00', '1', '', '0', '2018-07-18 01:15:16', null, null);
INSERT INTO `system_menu` VALUES ('164', '167', '菜单配置', '0', '', '&#xe620;', 'admin/menu/index', '', '_self', '1.00', '1', '', '0', '2018-07-19 02:05:48', null, null);
INSERT INTO `system_menu` VALUES ('165', '169', '刷新缓存', '0', '', '&#xe9aa;', 'admin/system/refresh', '', '_self', '5.00', '1', '', '0', '2018-07-19 10:11:27', null, null);
INSERT INTO `system_menu` VALUES ('166', '168', '系统节点', '0', '', '&#xe631;', 'admin/node/index', '', '_self', '5.00', '1', '', '0', '2018-07-23 00:44:49', null, null);
INSERT INTO `system_menu` VALUES ('167', '142', '系统管理', '0', '', '&#xe716;', '#', '', '_self', '0.00', '1', '', '0', '2018-07-23 01:23:11', null, null);
INSERT INTO `system_menu` VALUES ('168', '142', '权限管理', '0', '', '&#xe857;', '#', '', '_self', '2.00', '1', '', '0', '2018-07-23 01:23:27', null, null);
INSERT INTO `system_menu` VALUES ('169', '142', '系统刷新', '0', '', '&#xe639;', '#', '', '_self', '3.00', '1', '', '0', '2018-07-23 01:26:30', null, null);
INSERT INTO `system_menu` VALUES ('171', '168', '角色权限', '0', '', '&#xe606;', 'admin/auth/index', '', '_self', '0.00', '1', '', '0', '2018-07-23 15:37:53', null, null);
INSERT INTO `system_menu` VALUES ('172', '169', '刷新节点', '0', '', '&#xe666;', 'admin/system/refresh_node', '', '_self', '1.00', '1', '', '0', '2018-07-25 22:06:45', null, null);
INSERT INTO `system_menu` VALUES ('173', '169', '清除节点', '0', '', '&#xe639;', 'admin/system/clear_node', '', '_self', '0.00', '1', '', '0', '2018-07-26 15:27:24', null, null);
INSERT INTO `system_menu` VALUES ('175', '167', '系统配置', '0', '', '&#xe663;', 'admin/config/index', '', '_self', '5.00', '1', '', '0', '2018-07-31 00:11:14', '2018-08-01 11:28:42', null);
INSERT INTO `system_menu` VALUES ('178', '0', '官网管理', '0', '', '&#xe60a;', '#', '', '_self', '2.00', '1', '', '0', '2018-09-20 02:00:30', null, null);
INSERT INTO `system_menu` VALUES ('179', '178', '文章管理', '0', '', '&#xe62a;', '#', '', '_self', '4.00', '1', '', '0', '2018-09-20 02:01:44', null, null);
INSERT INTO `system_menu` VALUES ('180', '179', '文章列表', '0', '', '&#xe637;', 'admin/blog.article/index', '', '_self', '0.00', '1', '', '0', '2018-09-20 02:03:17', null, null);
INSERT INTO `system_menu` VALUES ('185', '178', '会员管理', '0', '', '&#xe66f;', '#', '', '_self', '3.00', '0', '', '0', '2018-09-21 01:12:26', null, null);
INSERT INTO `system_menu` VALUES ('186', '185', '会员列表', '0', '', '&#xe770;', 'admin/blog.member/index', '', '_self', '0.00', '1', '', '0', '2018-09-21 01:13:19', null, null);
INSERT INTO `system_menu` VALUES ('187', '179', '标签管理', '0', '', '&#xe6b2;', 'admin/blog.tag/index', '', '_self', '0.00', '0', '', '0', '2018-09-21 01:14:43', null, null);
INSERT INTO `system_menu` VALUES ('189', '178', '广告管理', '0', '', '&#xe857;', '#', '', '_self', '5.00', '1', '', '0', '2018-09-21 01:17:25', null, null);
INSERT INTO `system_menu` VALUES ('190', '189', '轮播图配置', '0', '', '&#xe64a;', 'admin/blog.slider/index', '', '_self', '2.00', '1', '', '0', '2018-09-21 01:17:44', null, null);
INSERT INTO `system_menu` VALUES ('210', '185', '登录记录', '0', '', '&#xe665;', 'admin/blog.login_record/index', '', '_self', '2.00', '1', '', '0', '2018-09-26 17:33:29', null, null);
INSERT INTO `system_menu` VALUES ('211', '179', '文章分类', '0', '', '&#xe664;', 'admin/blog.category/index', '', '_self', '0.00', '1', '', '0', '2018-09-27 01:34:06', null, null);
INSERT INTO `system_menu` VALUES ('212', '179', '文章评论', '0', '', '&#xe66a;', 'admin/blog.comment/index', '', '_self', '0.00', '0', '', '0', '2018-10-11 21:04:53', null, null);
INSERT INTO `system_menu` VALUES ('213', '178', '常用工具', '0', '', '&#xe665;', '#', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:18:28', null, null);
INSERT INTO `system_menu` VALUES ('214', '213', '前台公共配置管理', '0', '', '&#xe716;', 'admin/blog.config/index', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:19:02', null, null);
INSERT INTO `system_menu` VALUES ('215', '213', '友情链接', '0', '', '&#xe64d;', 'admin/blog.website_link/index', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:19:32', null, null);
INSERT INTO `system_menu` VALUES ('216', '213', '公告管理', '0', '', '&#xe667;', 'admin/blog.notice/index', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:21:02', null, null);
INSERT INTO `system_menu` VALUES ('217', '178', '搜索管理', '0', '', '&#xe615;', '#', '', '_self', '0.00', '0', '', '0', '2018-10-11 22:23:04', null, null);
INSERT INTO `system_menu` VALUES ('218', '217', '搜索排行', '0', '', '&#xe649;', 'admin/blog.search_record/index', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:23:32', null, null);
INSERT INTO `system_menu` VALUES ('219', '217', '搜索记录', '0', '', '&#xe66e;', 'admin/blog.search/index', '', '_self', '0.00', '1', '', '0', '2018-10-11 22:23:54', null, null);
INSERT INTO `system_menu` VALUES ('224', '142', '系统工具', '0', '', 'fa-server', '#', '', '_self', '6.00', '1', '', '0', '2018-10-13 21:41:40', null, null);
INSERT INTO `system_menu` VALUES ('225', '224', '图标管理-layui', '0', '', 'fa-circle-o-notch', 'admin/tool.icon/index', '', '_self', '0.00', '1', '', '0', '2018-10-13 21:42:25', null, null);
INSERT INTO `system_menu` VALUES ('226', '224', '图标管理-fa', '0', '', 'fa-crosshairs', 'admin/tool.icon/fa', '', '_self', '0.00', '1', '', '0', '2018-10-13 21:43:02', null, null);
INSERT INTO `system_menu` VALUES ('228', '227', '标签管理', '0', '', '&#xe6b2;', 'admin/blog.protag/index', '', '_self', '0.00', '1', '', '0', '2019-03-27 09:47:00', null, null);
INSERT INTO `system_menu` VALUES ('229', '227', '产品列表', '0', '', '&#xe637;', 'admin/blog.product/index', '', '_self', '0.00', '1', '', '0', '2019-03-27 09:48:07', null, null);
INSERT INTO `system_menu` VALUES ('230', '227', '产品分类', '0', '', '&#xe664;', 'admin/blog.proCategory/index', '', '_self', '0.00', '1', '', '0', '2019-03-27 09:48:48', null, null);
INSERT INTO `system_menu` VALUES ('231', '178', '产品管理', '0', '', 'fa-apple', '#', '', '_self', '6.00', '1', '', '0', '2019-04-18 11:33:32', null, null);
INSERT INTO `system_menu` VALUES ('232', '231', '产品列表', '0', '', 'fa-align-left', 'admin/blog.product/index', '', '_self', '0.00', '1', '', '0', '2019-04-18 11:34:36', null, null);
INSERT INTO `system_menu` VALUES ('233', '231', '产品分类', '0', '', 'fa-book', 'admin/blog.pro_category/index', '', '_self', '0.00', '1', '', '0', '2019-04-18 11:35:28', null, null);
INSERT INTO `system_menu` VALUES ('234', '231', '产品标签', '0', '', 'fa-code', 'admin/blog.protag/index', '', '_self', '0.00', '0', '', '0', '2019-04-18 11:36:14', null, null);
INSERT INTO `system_menu` VALUES ('235', '178', '案例管理', '0', '', 'fa-css3', '#', '', '_self', '4.00', '1', '', '0', '2019-04-19 10:07:35', null, null);
INSERT INTO `system_menu` VALUES ('236', '235', '案例分类', '0', '', 'fa-tasks', 'admin/blog.caseCategory/index', '', '_self', '0.00', '1', '', '0', '2019-04-19 10:09:02', null, null);
INSERT INTO `system_menu` VALUES ('237', '235', '案例标签', '0', '', 'fa-comment', 'admin/blog.casetag/index', '', '_self', '0.00', '0', '', '0', '2019-04-19 10:11:17', null, null);
INSERT INTO `system_menu` VALUES ('238', '235', '案例列表', '0', '', 'fa-align-center', 'admin/blog.casement/index', '', '_self', '0.00', '1', '', '0', '2019-04-19 10:12:26', null, null);

-- ----------------------------
-- Table structure for system_nav
-- ----------------------------
DROP TABLE IF EXISTS `system_nav`;
CREATE TABLE `system_nav` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `sort` float(11,2) DEFAULT '0.00' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统快捷导航';

-- ----------------------------
-- Records of system_nav
-- ----------------------------
INSERT INTO `system_nav` VALUES ('214', '配置管理', '&#xe716;', 'admin/blog.config/index', '0.00', '1', '', '0', '2018-10-11 22:19:02', null, null);
INSERT INTO `system_nav` VALUES ('215', '友情链接', '&#xe64d;', 'admin/blog.website_link/index', '0.00', '1', '', '0', '2018-10-11 22:19:32', null, null);
INSERT INTO `system_nav` VALUES ('216', '公告管理', '&#xe667;', 'admin/blog.notice/index', '0.00', '1', '', '0', '2018-10-11 22:21:02', null, null);
INSERT INTO `system_nav` VALUES ('218', '搜索排行', '&#xe649;', 'admin/blog.search_record/index', '0.00', '1', '', '0', '2018-10-11 22:23:32', null, null);
INSERT INTO `system_nav` VALUES ('219', '搜索记录', '&#xe66e;', 'admin/blog.search/index', '0.00', '1', '', '0', '2018-10-11 22:23:54', null, null);
INSERT INTO `system_nav` VALUES ('225', '图标管理-layui', 'fa-circle-o-notch', 'admin/tool.icon/index', '0.00', '1', '', '0', '2018-10-13 21:42:25', null, null);
INSERT INTO `system_nav` VALUES ('226', '图标管理-fa', 'fa-crosshairs', 'admin/tool.icon/fa', '0.00', '1', '', '0', '2018-10-13 21:43:02', null, null);

-- ----------------------------
-- Table structure for system_node
-- ----------------------------
DROP TABLE IF EXISTS `system_node`;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：模块，2：控制器，3：节点）',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_auto` tinyint(1) DEFAULT '0' COMMENT '是否为系统自动刷新（0：是，1：手动添加）',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=1451 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of system_node
-- ----------------------------
INSERT INTO `system_node` VALUES ('1037', 'admin', '后台模块管理', '1', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1040', 'admin/auth', '角色管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1041', 'admin/auth/index', '角色列表', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1042', 'admin/auth/add', '添加角色', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1043', 'admin/auth/edit', '编辑角色', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1044', 'admin/auth/del', '删除角色', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1045', 'admin/auth/status', '更改角色状态', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1046', 'admin/auth/authorize', '角色授权', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1047', 'admin/icon', '系统图标管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1048', 'admin/icon/index', '图标列表', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1049', 'admin/index', '系统后台首页（不要开启）', '2', '0', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1050', 'admin/index/index', '后台首页（不要开启）', '3', '0', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1051', 'admin/index/welcome', '后台欢迎页面（不要开启）', '3', '0', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1052', 'admin/menu', '系统菜单管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1053', 'admin/menu/index', '菜单列表', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1054', 'admin/menu/add', '添加菜单', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1055', 'admin/menu/edit', '编辑菜单', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1056', 'admin/menu/del', '删除菜单', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1057', 'admin/menu/status', '更改菜单状态', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1058', 'admin/node', '节点管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1059', 'admin/node/index', '节点列表', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1063', 'admin/node/status', '更改节点状态', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1064', 'admin/system', '系统管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1065', 'admin/system/refresh', '刷新缓存', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1066', 'admin/system/refresh_node', '刷新节点', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1069', 'admin/user', '系统管理员管理', '2', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1070', 'admin/user/index', '管理员列表', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1071', 'admin/user/add', '添加管理员', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1072', 'admin/user/edit', '编辑管理员', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1073', 'admin/user/del', '删除管理员', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1074', 'admin/user/edit_password', '修改管理员密码', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1075', 'admin/user/status', '更改管理员状态', '3', '1', null, '2018-07-26 02:51:09', null, null, null);
INSERT INTO `system_node` VALUES ('1109', 'admin/system/clear_node', '清除节点', '3', '1', null, '2018-07-26 15:29:55', null, null, null);
INSERT INTO `system_node` VALUES ('1113', 'admin/config', '系统配置管理', '2', '1', null, '2018-07-31 01:00:16', null, null, null);
INSERT INTO `system_node` VALUES ('1114', 'admin/config/index', '系统配置列表', '3', '1', null, '2018-07-31 01:00:16', null, null, null);
INSERT INTO `system_node` VALUES ('1124', 'admin/login', '后台登录（不要开启）', '2', '0', '0', '2018-09-19 18:21:57', null, null, null);
INSERT INTO `system_node` VALUES ('1125', 'admin/login/index', null, '3', '0', '0', '2018-09-19 18:21:57', null, null, null);
INSERT INTO `system_node` VALUES ('1126', 'admin/login/change', null, '3', '0', '0', '2018-09-19 18:21:57', null, null, null);
INSERT INTO `system_node` VALUES ('1127', 'admin/login/out', null, '3', '0', '0', '2018-09-19 18:21:57', null, null, null);
INSERT INTO `system_node` VALUES ('1337', 'admin/api.menu', '菜单接口（不要开启）', '2', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1338', 'admin/api.menu/get_menu', null, '3', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1341', 'admin/api.node', '节点接口（不要开启）', '2', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1342', 'admin/api.node/get_node_tree', null, '3', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1345', 'admin/api.upload', '上传接口（不要开启）', '2', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1346', 'admin/api.upload/image', null, '3', '0', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1349', 'admin/blog.article', '博客文章管理', '2', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1350', 'admin/blog.article/index', '文章列表', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1351', 'admin/blog.article/add', '文章添加', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1352', 'admin/blog.article/edit', '文章修改', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1353', 'admin/blog.article/del', '文章删除', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1354', 'admin/blog.article/status', '修改文章状态', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1357', 'admin/blog.category', '博客分类管理', '2', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1358', 'admin/blog.category/index', '分类列表', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1361', 'admin/blog.login_record', '博客登录记录管理', '2', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1362', 'admin/blog.login_record/index', '登录记录列表', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1363', 'admin/blog.login_record/del', '登录记录删除', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1366', 'admin/blog.member', '博客会员管理', '2', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1367', 'admin/blog.member/index', '会员列表', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1368', 'admin/blog.member/add', '会员接口', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1369', 'admin/blog.member/edit', '会员编辑', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1371', 'admin/blog.member/del', '会员删除', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1372', 'admin/blog.member/status', '会员状态修改', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1373', 'admin/blog.member/detail', '会员详情', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1376', 'admin/blog.tag', '博客文章标签管理', '2', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1377', 'admin/blog.tag/index', '标签列表', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1378', 'admin/blog.tag/add', '标签添加', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1379', 'admin/blog.tag/edit', '标签编辑', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1380', 'admin/blog.tag/del', '标签删除', '3', '1', '0', '2018-10-01 13:54:12', null, null, null);
INSERT INTO `system_node` VALUES ('1383', 'admin/blog.category/add', '分类添加', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1384', 'admin/blog.category/edit', '分类编辑', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1385', 'admin/blog.category/del', '分类删除', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1386', 'admin/blog.category/status', '修改分类状态', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1387', 'admin/blog.member/reset_password', '会员重置密码', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1388', 'admin/blog.slider', '博客轮播图管理', '2', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1389', 'admin/blog.slider/index', '轮播图列表', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1390', 'admin/blog.slider/add', '轮播图添加', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1391', 'admin/blog.slider/edit', '轮播图编辑', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1392', 'admin/blog.slider/del', '轮播图删除', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1393', 'admin/blog.slider/status', '轮播图状态修改', '3', '1', '0', '2018-10-11 16:52:46', null, null, null);
INSERT INTO `system_node` VALUES ('1394', 'admin/icon/fa', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1395', 'admin/test', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1396', 'admin/test/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1397', 'admin/test/upload', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1398', 'admin/test/test', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1399', 'admin/test/url', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1400', 'admin/test/curl', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1401', 'admin/test/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1402', 'admin/user/edit_self', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1403', 'admin/api.menu/get_nav', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1404', 'admin/api.welcome', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1405', 'admin/api.welcome/article_census', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1406', 'admin/blog.comment', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1407', 'admin/blog.comment/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1408', 'admin/blog.comment/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1409', 'admin/blog.config', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1410', 'admin/blog.config/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1411', 'admin/blog.notice', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1412', 'admin/blog.notice/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1413', 'admin/blog.notice/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1414', 'admin/blog.notice/edit', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1415', 'admin/blog.notice/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1416', 'admin/blog.notice/status', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1417', 'admin/blog.pro_category', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1418', 'admin/blog.pro_category/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1419', 'admin/blog.pro_category/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1420', 'admin/blog.pro_category/edit', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1421', 'admin/blog.pro_category/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1422', 'admin/blog.pro_category/status', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1423', 'admin/blog.product', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1424', 'admin/blog.product/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1425', 'admin/blog.product/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1426', 'admin/blog.product/edit', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1427', 'admin/blog.product/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1428', 'admin/blog.product/status', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1429', 'admin/blog.protag', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1430', 'admin/blog.protag/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1431', 'admin/blog.protag/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1432', 'admin/blog.protag/edit', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1433', 'admin/blog.protag/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1434', 'admin/blog.search', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1435', 'admin/blog.search/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1436', 'admin/blog.search/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1437', 'admin/blog.search_record', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1438', 'admin/blog.search_record/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1439', 'admin/blog.search_record/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1440', 'admin/blog.website_link', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1441', 'admin/blog.website_link/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1442', 'admin/blog.website_link/add', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1443', 'admin/blog.website_link/edit', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1444', 'admin/blog.website_link/del', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1445', 'admin/blog.website_link/status', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1446', 'admin/tool.icon', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1447', 'admin/tool.icon/index', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1448', 'admin/tool.icon/fa', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1449', 'admin/tool.upload', null, '2', '1', '0', '2019-04-18 17:51:17', null, null, null);
INSERT INTO `system_node` VALUES ('1450', 'admin/tool.upload/image', null, '3', '1', '0', '2019-04-18 17:51:17', null, null, null);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT '/static/image/admin/face1.jpg' COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', '[\"1\",\"6\"]', '/static/uploads/20190418/1782244e33ca40d86142b749684c8a08.jpg', 'deyi', 'e1c5ebd0fd3eb20893a2456dc07ee824eb3672cd', '1491665985', '1486111354@qq.com', '15814868715', '黄经理', '0', null, '1', '0', '0', '2019-03-14 09:56:59', null, null);
