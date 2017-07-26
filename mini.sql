-- MySQL dump 10.13  Distrib 5.6.35, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: mini
-- ------------------------------------------------------
-- Server version	5.6.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mini_activities`
--

DROP TABLE IF EXISTS `mini_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '活动内容',
  `btime` int(11) NOT NULL COMMENT '开始时间',
  `etime` int(11) NOT NULL COMMENT '结束时间',
  `imgage` varchar(255) NOT NULL COMMENT '图片',
  `prize` varchar(60) NOT NULL COMMENT '活动奖品',
  `url` varchar(200) NOT NULL COMMENT '跳转url',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '是否开启活动(1-开启,0-关闭)',
  `weight` int(6) NOT NULL DEFAULT '0' COMMENT '权重',
  `type_id` int(6) NOT NULL COMMENT '活动类型ID',
  `num` int(11) NOT NULL COMMENT '活动参加人数',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_activities`
--

LOCK TABLES `mini_activities` WRITE;
/*!40000 ALTER TABLE `mini_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_ad`
--

DROP TABLE IF EXISTS `mini_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_ad`
--

LOCK TABLES `mini_ad` WRITE;
/*!40000 ALTER TABLE `mini_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_admin_pay`
--

DROP TABLE IF EXISTS `mini_admin_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_admin_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `op_username` varchar(50) NOT NULL COMMENT '操作管理员',
  `uid` int(10) NOT NULL COMMENT 'uid',
  `username` varchar(50) NOT NULL COMMENT '被充值用户',
  `ip` varchar(50) NOT NULL COMMENT 'ip',
  `add_time` int(11) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `real_money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `type` int(2) DEFAULT '1' COMMENT '默认1后台管理员2推广员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_admin_pay`
--

LOCK TABLES `mini_admin_pay` WRITE;
/*!40000 ALTER TABLE `mini_admin_pay` DISABLE KEYS */;
INSERT INTO `mini_admin_pay` VALUES (1,'admin',75,'d355252735','118.29.185.230',1488448557,'测试平台币',10.00,1);
/*!40000 ALTER TABLE `mini_admin_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_app`
--

DROP TABLE IF EXISTS `mini_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `appid` varchar(50) DEFAULT NULL COMMENT 'appid',
  `appkey` varchar(50) DEFAULT NULL COMMENT 'md5(''251wan_xy''.appid)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `beizhu` varchar(50) DEFAULT NULL COMMENT '备注',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  PRIMARY KEY (`id`),
  KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_app`
--

LOCK TABLES `mini_app` WRITE;
/*!40000 ALTER TABLE `mini_app` DISABLE KEYS */;
INSERT INTO `mini_app` VALUES (1,'csyx','1c892453c70f5acf52fc549a82bcb6bc',1487750165,'测试游戏',1),(2,'shft','9c8a1326c1e7303b84f6191ed0b6fd37',1489131070,'兽血沸腾',2);
/*!40000 ALTER TABLE `mini_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_asset`
--

DROP TABLE IF EXISTS `mini_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_asset`
--

LOCK TABLES `mini_asset` WRITE;
/*!40000 ALTER TABLE `mini_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_auth_access`
--

DROP TABLE IF EXISTS `mini_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_auth_access`
--

LOCK TABLES `mini_auth_access` WRITE;
/*!40000 ALTER TABLE `mini_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_auth_rule`
--

DROP TABLE IF EXISTS `mini_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_auth_rule`
--

LOCK TABLES `mini_auth_rule` WRITE;
/*!40000 ALTER TABLE `mini_auth_rule` DISABLE KEYS */;
INSERT INTO `mini_auth_rule` VALUES (1,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),(43,'Admin','admin_url','admin/backup/export',NULL,'数据库导出',1,''),(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),(45,'Admin','admin_url','admin/backup/del',NULL,'删除备份',1,''),(46,'Admin','admin_url','admin/backup/import',NULL,'数据库导入',1,''),(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),(129,'Admin','admin_url','admin/mailer/active',NULL,'注册邮件模板',1,''),(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),(162,'Demo','admin_url','demo/adminindex/index',NULL,'',1,''),(163,'Demo','admin_url','demo/adminindex/last',NULL,'',1,''),(166,'Admin','admin_url','admin/mailer/test',NULL,'测试邮件',1,''),(167,'Admin','admin_url','admin/setting/upload',NULL,'上传设置',1,''),(168,'Admin','admin_url','admin/setting/upload_post',NULL,'上传设置提交',1,''),(169,'Portal','admin_url','portal/adminpost/copy',NULL,'文章批量复制',1,''),(170,'Admin','admin_url','admin/menu/backup_menu',NULL,'备份菜单',1,''),(171,'Admin','admin_url','admin/menu/export_menu_lang',NULL,'导出后台菜单多语言包',1,''),(172,'Admin','admin_url','admin/menu/restore_menu',NULL,'还原菜单',1,''),(173,'Admin','admin_url','admin/menu/getactions',NULL,'导入新菜单',1,''),(174,'Game','admin_url','game/indexadmin/default',NULL,'游戏管理',1,''),(175,'Game','admin_url','game/indexadmin/index',NULL,'游戏管理',1,''),(176,'Game','admin_url','game/serveradmin/index',NULL,'区服管理',1,''),(177,'Game','admin_url','game/cardadmin/index',NULL,'卡类管理',1,''),(178,'Game','admin_url','game/activitiesadmin/index',NULL,'活动管理',1,''),(179,'Website','admin_url','website/indexadmin/default',NULL,'官网自建',1,''),(180,'Website','admin_url','website/indexadmin/index',NULL,'官网列表',1,''),(181,'Admin','admin_url','admin/sms/index',NULL,'短信管理',1,''),(182,'新闻','admin_url','新闻/news/xw',NULL,'游戏新闻',1,''),(183,'攻略','admin_url','攻略/news/game_gl',NULL,'游戏攻略',1,''),(184,'活动','admin_url','活动/news/game_hd',NULL,'游戏活动',1,''),(185,'Portals','admin_url','portals/adminpages/index',NULL,'前台底部管理',1,''),(186,'Channel','admin_url','channel/indexadmin/default',NULL,'推广管理',1,''),(187,'Channel','admin_url','channel/indexadmin/index',NULL,'推广员管理',1,''),(188,'Channel','admin_url','channel/realadmin/index',NULL,'实时注册',1,''),(189,'Channel','admin_url','channel/realadmin/realpay',NULL,'实时充值',1,''),(190,'Admin','admin_url','admin/pay/index',NULL,'支付设置',1,''),(191,'Admin','admin_url','admin/stat/default',NULL,'统计管理',1,''),(192,'Admin','admin_url','admin/stat/login',NULL,'用户登录',1,''),(193,'Admin','admin_url','admin/stat/register',NULL,'用户注册',1,''),(194,'Admin','admin_url','admin/stat/recharge',NULL,'用户充值',1,''),(195,'Admin','admin_url','admin/stat/game',NULL,'游戏充值',1,''),(196,'Admin','admin_url','admin/stat/agent',NULL,'渠道充值',1,''),(197,'Pay','admin_url','pay/indexadmin/default',NULL,'支付管理',1,''),(198,'Pay','admin_url','pay/htpayadmin/index',NULL,'后台充值',1,''),(199,'pay','admin_url','pay/htpayadmin/add',NULL,'后台充值',1,''),(200,'Channel','admin_url','channel/settleadmin/index',NULL,'结算管理',1,''),(201,'Channel','admin_url','channel/settleadmin/settle',NULL,'结算',1,''),(202,'Channel','admin_url','channel/splitratioadmin/index',NULL,'分成比例',1,''),(203,'Admin','admin_url','admin/cardtype/index',NULL,'卡类类型',1,''),(204,'Admin','admin_url','admin/cardtype/add',NULL,'卡类类型',1,''),(205,'Admin','admin_url','admin/cardtype/add_post',NULL,'卡类添加',1,''),(206,'Admin','admin_url','admin/cardtype/edit',NULL,'卡类编辑',1,''),(207,'Admin','admin_url','admin/cardtype/edit_post',NULL,'卡类编辑提交',1,''),(208,'Admin','admin_url','admin/cardtype/delete',NULL,'卡类删除',1,''),(209,'Channel','admin_url','channel/settleadmin/look',NULL,'结算详情',1,''),(210,'Channel','admin_url','channel/cashadmin/index',NULL,'提现管理',1,''),(211,'Channel','admin_url','channel/cashadmin/cashlog',NULL,'提现记录',1,''),(212,'Pay','admin_url','pay/htpayadmin/cpspay',NULL,'代充记录',1,''),(213,'Channel','admin_url','channel/cashadmin/edit',NULL,'提现汇款',1,''),(214,'Channel','admin_url','channel/indexadmin/ios',NULL,'IOS申请',1,''),(215,'User','admin_url','user/roleadmin/role',NULL,'用户角色',1,''),(216,'Admin','admin_url','admin/backup/optimize',NULL,'优化表',1,''),(217,'Admin','admin_url','admin/backup/repair',NULL,'修复表',1,'');
/*!40000 ALTER TABLE `mini_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_card`
--

DROP TABLE IF EXISTS `mini_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_card` (
  `name` varchar(80) NOT NULL,
  `gid` int(5) NOT NULL,
  `sid` int(8) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` int(13) NOT NULL COMMENT '领取开始时间',
  `card_type_id` int(6) NOT NULL DEFAULT '0' COMMENT '新手卡类型ID',
  `card_general` int(6) NOT NULL DEFAULT '0' COMMENT '是否通服(0-否,1-是)',
  `card_image` varchar(60) NOT NULL COMMENT '图片',
  `card_context` text NOT NULL COMMENT '内容介绍',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `vip` int(3) NOT NULL DEFAULT '0' COMMENT '领取vip等级',
  `excerpt` varchar(255) NOT NULL COMMENT '摘要',
  `is_jk` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否调用接口',
  `cps_status` int(2) NOT NULL DEFAULT '0' COMMENT 'cps状态1为cps',
  `cps_uid` int(12) DEFAULT NULL,
  `card_num` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '礼包数量',
  `part_num` int(9) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `remain_num` int(9) NOT NULL COMMENT '剩余人数',
  `end_time` int(11) DEFAULT NULL COMMENT '兑换结束时间',
  `card` text NOT NULL COMMENT '领取码',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_card`
--

LOCK TABLES `mini_card` WRITE;
/*!40000 ALTER TABLE `mini_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_card_log`
--

DROP TABLE IF EXISTS `mini_card_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_card_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sid` int(6) NOT NULL COMMENT '区服id',
  `gid` int(6) NOT NULL COMMENT '游戏id',
  `uid` int(10) NOT NULL COMMENT '用户uid',
  `get_time` int(11) NOT NULL COMMENT '获取时间',
  `card_info` varchar(50) NOT NULL COMMENT '新手卡',
  `card_type_id` int(6) NOT NULL,
  `card_id` int(11) NOT NULL COMMENT '礼包id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_card_log`
--

LOCK TABLES `mini_card_log` WRITE;
/*!40000 ALTER TABLE `mini_card_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_card_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_card_type`
--

DROP TABLE IF EXISTS `mini_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_card_type` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '卡类id',
  `cardname` varchar(80) NOT NULL COMMENT '卡名',
  `tid` int(20) NOT NULL COMMENT '手机礼包0，页游1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='卡类类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_card_type`
--

LOCK TABLES `mini_card_type` WRITE;
/*!40000 ALTER TABLE `mini_card_type` DISABLE KEYS */;
INSERT INTO `mini_card_type` VALUES (1,'新手卡',0);
/*!40000 ALTER TABLE `mini_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cash`
--

DROP TABLE IF EXISTS `mini_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cash` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sucesstime` int(11) NOT NULL COMMENT '管理员支付汇款时间',
  `cps_uid` int(10) NOT NULL COMMENT 'cps用户id',
  `ip` varchar(50) NOT NULL COMMENT '提现ip',
  `beizhu` varchar(255) NOT NULL COMMENT '备注',
  `beizhu1` varchar(255) NOT NULL COMMENT '管理员备注',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '1未汇款2已经汇款',
  `ip1` varchar(50) NOT NULL COMMENT '管理员操作ip',
  `money` double(10,2) NOT NULL COMMENT '提现金额',
  `op_username` varchar(50) NOT NULL COMMENT '操作人员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cash`
--

LOCK TABLES `mini_cash` WRITE;
/*!40000 ALTER TABLE `mini_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_comments`
--

DROP TABLE IF EXISTS `mini_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_comments`
--

LOCK TABLES `mini_comments` WRITE;
/*!40000 ALTER TABLE `mini_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_common_action_log`
--

DROP TABLE IF EXISTS `mini_common_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_common_action_log`
--

LOCK TABLES `mini_common_action_log` WRITE;
/*!40000 ALTER TABLE `mini_common_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_common_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cpasettlement`
--

DROP TABLE IF EXISTS `mini_cpasettlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cpasettlement` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` int(11) NOT NULL COMMENT '结算开始时间',
  `endtime` int(11) NOT NULL COMMENT '结算结束时间',
  `gid` int(10) NOT NULL COMMENT 'gid',
  `cps_uid` int(10) NOT NULL COMMENT '推广uid',
  `num` int(10) NOT NULL COMMENT '人数',
  `price` double(10,2) NOT NULL COMMENT 'cpa单价',
  `total_money` double(10,2) NOT NULL COMMENT '总金额',
  `operator` varchar(30) NOT NULL COMMENT '操作人员',
  `ip` varchar(50) NOT NULL COMMENT 'ip',
  `allnum` int(11) NOT NULL COMMENT '总注册人数包含重复注册',
  `qishu` int(10) NOT NULL COMMENT '结算期数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cpasettlement`
--

LOCK TABLES `mini_cpasettlement` WRITE;
/*!40000 ALTER TABLE `mini_cpasettlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_cpasettlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_exchange`
--

DROP TABLE IF EXISTS `mini_cps_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(11) unsigned NOT NULL COMMENT '兑换时间',
  `cps_uid` int(10) unsigned NOT NULL COMMENT '兑换推广员ID',
  `money` double(10,2) NOT NULL COMMENT '兑换金额',
  `ip` varchar(20) NOT NULL COMMENT '兑换时操作IP',
  `beizhu` text NOT NULL COMMENT '备注',
  `jiesuan_time` int(11) NOT NULL COMMENT '结算期间内时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_exchange`
--

LOCK TABLES `mini_cps_exchange` WRITE;
/*!40000 ALTER TABLE `mini_cps_exchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_cps_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_ios`
--

DROP TABLE IF EXISTS `mini_cps_ios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_ios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cps_uid` int(10) NOT NULL COMMENT 'cps_uid',
  `gid` int(10) NOT NULL COMMENT 'gid',
  `username` varchar(50) NOT NULL COMMENT '申请用户',
  `addtime` int(11) NOT NULL COMMENT '申请时间',
  `ip` varchar(30) NOT NULL COMMENT '申请ip',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态默认1 未打包',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ios申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_ios`
--

LOCK TABLES `mini_cps_ios` WRITE;
/*!40000 ALTER TABLE `mini_cps_ios` DISABLE KEYS */;
INSERT INTO `mini_cps_ios` VALUES (1,13,2,'huanshi',1489995923,'60.29.19.66',1),(2,13,1,'huanshi',1489996684,'60.29.19.66',1),(3,1,2,'cps001',1490577640,'59.56.123.31',1);
/*!40000 ALTER TABLE `mini_cps_ios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_ratio`
--

DROP TABLE IF EXISTS `mini_cps_ratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_ratio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cps_uid` int(10) unsigned NOT NULL COMMENT '推广员ID',
  `gid` int(10) unsigned NOT NULL COMMENT '游戏ID',
  `ratio` double(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分成比例',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `ip` varchar(20) NOT NULL COMMENT '操作ip',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '1cps  2cpa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_ratio`
--

LOCK TABLES `mini_cps_ratio` WRITE;
/*!40000 ALTER TABLE `mini_cps_ratio` DISABLE KEYS */;
INSERT INTO `mini_cps_ratio` VALUES (1,1,1,10.00,1488518542,'118.29.185.230',1),(2,4,1,10.00,1488872387,'115.228.60.176',1),(3,6,2,0.00,1489376310,'113.200.135.39',1),(4,7,2,0.00,1489383605,'118.29.185.230',1),(5,7,1,10.00,1489383612,'118.29.185.230',1),(6,1,2,0.00,1489732895,'59.56.121.143',1),(7,13,1,0.60,1489996665,'60.29.19.66',1),(8,13,2,0.60,1489996749,'60.25.59.6',1);
/*!40000 ALTER TABLE `mini_cps_ratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_spreadpay`
--

DROP TABLE IF EXISTS `mini_cps_spreadpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_spreadpay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `cps_uid` int(10) unsigned NOT NULL COMMENT '充值推广员',
  `uid` int(10) NOT NULL COMMENT '充值账户ID',
  `pay_money` int(10) unsigned NOT NULL COMMENT '充值金额',
  `pay_ttb` int(10) unsigned NOT NULL COMMENT '获得ttb',
  `ip` varchar(20) NOT NULL COMMENT '操做IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_spreadpay`
--

LOCK TABLES `mini_cps_spreadpay` WRITE;
/*!40000 ALTER TABLE `mini_cps_spreadpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_cps_spreadpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_users`
--

DROP TABLE IF EXISTS `mini_cps_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '推广用户名',
  `pid` int(8) NOT NULL COMMENT '上级推广id',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `bankaccount` varchar(100) NOT NULL COMMENT '银行账户',
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `number_id` varchar(50) NOT NULL COMMENT '身份证',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `lastlogin_time` int(11) NOT NULL COMMENT '最近登录时间',
  `lastlogin_ip` varchar(30) NOT NULL COMMENT '最近登录ip',
  `available_money` double(10,2) NOT NULL COMMENT '预支的金额',
  `money` double(10,2) NOT NULL COMMENT '推广分成金额（实际可用金额）',
  `admin_username` char(30) NOT NULL COMMENT '所属专员',
  `totalmoney` double(10,2) NOT NULL COMMENT '总共推广金额',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `pay_tag` char(50) NOT NULL COMMENT '所属银行',
  `tel` varchar(50) NOT NULL COMMENT '联系方式',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_users`
--

LOCK TABLES `mini_cps_users` WRITE;
/*!40000 ALTER TABLE `mini_cps_users` DISABLE KEYS */;
INSERT INTO `mini_cps_users` VALUES (1,'cps001',0,'###27570b609485852fb400589afef5d011','','','','系统默认推广员',1450505425,1492019598,'120.36.22.157',0.00,0.00,'admin',0.00,1,'','','27102916@qq.com'),(2,'SCflower',0,'###54c45866945be7b8b1595df6e178fa01','','','','',1487643381,1489548385,'118.29.185.230',0.00,0.00,'admin',0.00,1,'','','58872662@qq.com'),(3,'cps002',1,'###27570b609485852fb400589afef5d011','','','','',1488518438,1489117371,'118.249.191.176',0.00,0.00,'',0.00,1,'','','123123@qq.com'),(4,'test001',0,'###27570b609485852fb400589afef5d011','','','','ceshi',1488872336,1488872360,'115.228.60.176',0.00,0.00,'admin',0.00,1,'','','test001@test.com'),(5,'chaochao',1,'###27570b609485852fb400589afef5d011','','','','',1489116549,1489116590,'118.29.185.230',0.00,0.00,'',0.00,1,'','','chaochao@qq.com'),(6,'beststar',0,'###9f2d769d53a131d00472be1494fd47ed','jiumaoghsr@126.com','王敏','','西安玖毛',1489375748,1489376091,'1.85.197.161',0.00,0.00,'admin',0.00,1,'支付宝','','2881393705@qq.com'),(7,'kukecps',0,'###17e0b4d866d7ef4f308d1ba07531f2c2','','酷客玩','','',1489376026,1489542557,'118.29.185.230',0.00,0.00,'admin',0.00,1,'','','kukewan@qq.com'),(8,'taiyuanc',0,'###c028ceb428e459d17009ba2c16e379c2','','','','',1489376939,1489377084,'60.26.218.3',0.00,0.00,'admin',0.00,1,'','','taiyuan@qq.com'),(9,'baixing01',6,'###422a5462e88a9088bfdf5111d04b4edc','','','','',1489378626,0,'',0.00,0.00,'',0.00,1,'','','2881533796@qq.com'),(10,'kukecps001',7,'###27570b609485852fb400589afef5d011','','王磊','','',1489387076,1489387127,'118.29.185.230',0.00,0.00,'admin',0.00,1,'','','kukecps001@miniyx.com'),(11,'kukecps002',7,'###27570b609485852fb400589afef5d011','','王磊','','',1489475307,0,'',0.00,0.00,'',0.00,1,'','','yangfan@4jyx.com'),(12,'kukecps003',7,'###27570b609485852fb400589afef5d011','','王磊','','',1489542071,1489542227,'118.29.185.230',0.00,0.00,'',0.00,1,'','','laowang@qq.com'),(13,'huanshi',0,'###3f2b578c0f82f80119363a667f7154c2','','幻世','','',1489992197,1489995687,'60.29.19.66',0.00,0.00,'admin',0.00,1,'','','huanshi@miniyx.com'),(14,'shendihan',13,'###27570b609485852fb400589afef5d011','','沈帝函','','',1489996325,0,'',0.00,0.00,'',0.00,1,'','','406101786@qq.com');
/*!40000 ALTER TABLE `mini_cps_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cps_version`
--

DROP TABLE IF EXISTS `mini_cps_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cps_version` (
  `id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `cps_name` varchar(255) NOT NULL COMMENT '推广员名',
  `gameid` int(50) NOT NULL COMMENT '游戏id',
  `version` varchar(255) NOT NULL DEFAULT '0' COMMENT '版本号',
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1、"本地''    2、“OSS”',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cps_version`
--

LOCK TABLES `mini_cps_version` WRITE;
/*!40000 ALTER TABLE `mini_cps_version` DISABLE KEYS */;
INSERT INTO `mini_cps_version` VALUES (1,'cps002',1,'0','1'),(10,'test001',1,'201703074','2'),(11,'cps001',1,'201703074','2'),(12,'test001',1,'201703074','1'),(13,'cps002',1,'201703074','2'),(14,'kukecps',1,'201703074','2'),(15,'kukecps001',1,'201703074','2'),(16,'kukecps003',1,'201703074','2'),(17,'huanshi',1,'201703074','2');
/*!40000 ALTER TABLE `mini_cps_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_cpurl`
--

DROP TABLE IF EXISTS `mini_cpurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_cpurl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `appid` int(11) DEFAULT NULL COMMENT 'wan_app表中的id',
  `url` varchar(300) DEFAULT NULL COMMENT '回调地址',
  `ios_url` varchar(300) DEFAULT NULL COMMENT 'ios回调地址',
  `kill_role_url` varchar(300) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_cpurl`
--

LOCK TABLES `mini_cpurl` WRITE;
/*!40000 ALTER TABLE `mini_cpurl` DISABLE KEYS */;
INSERT INTO `mini_cpurl` VALUES (1,1,'http://m.31wan.cn','http://m.31wan.cn','http://m.31wan.cn',1487753039),(2,2,'www.wancms.com','www.wancms.com','www.wancms.com',1490691520);
/*!40000 ALTER TABLE `mini_cpurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_game`
--

DROP TABLE IF EXISTS `mini_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_game` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `listorder` int(8) NOT NULL COMMENT '排序',
  `gamename` varchar(55) NOT NULL COMMENT '游戏名称',
  `short` char(3) NOT NULL COMMENT '简写',
  `tag` char(22) NOT NULL COMMENT '缩写',
  `gametype` int(3) NOT NULL COMMENT '游戏类别',
  `pic1` varchar(255) NOT NULL DEFAULT '/statics/images/icon/upload-pic.png' COMMENT '图片1',
  `pic2` varchar(255) NOT NULL DEFAULT '/statics/images/icon/upload-pic.png' COMMENT '图片2',
  `pic3` varchar(255) NOT NULL DEFAULT '/statics/images/icon/upload-pic.png' COMMENT '图片3',
  `payto` int(5) NOT NULL COMMENT '比例',
  `content` longtext NOT NULL COMMENT '描述',
  `ishot` int(3) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `game_web` varchar(255) NOT NULL COMMENT '游戏官网地址',
  `game_bbs` varchar(255) NOT NULL COMMENT '游戏论坛地址',
  `game_guide` varchar(255) NOT NULL COMMENT '游戏指南地址',
  `currency` char(20) NOT NULL COMMENT '游戏币单位',
  `addtime` int(15) NOT NULL COMMENT '添加时间',
  `downloadnum` int(8) NOT NULL DEFAULT '1' COMMENT '下载次数',
  `qq` text NOT NULL,
  `isdisplay` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `cpa` double(10,2) NOT NULL COMMENT 'cpa单价',
  `pic4` varchar(60) NOT NULL DEFAULT '/statics/images/icon/upload-pic.png' COMMENT '图片4',
  `pay_status` smallint(3) NOT NULL DEFAULT '1' COMMENT '充值状态',
  `gamesize` varchar(20) NOT NULL COMMENT '游戏大小',
  `operators` varchar(50) NOT NULL COMMENT '运营商',
  `model` varchar(60) NOT NULL COMMENT '收费模式',
  `type` varchar(60) NOT NULL COMMENT '测试状态',
  `android_url` varchar(255) NOT NULL COMMENT '安卓下载地址',
  `android_url_image` varchar(255) NOT NULL COMMENT '安卓下载二维码',
  `ios_url` varchar(255) NOT NULL COMMENT '苹果下载地址',
  `ios_url_image` varchar(255) NOT NULL COMMENT '苹果下载二维码',
  `updatetime` datetime NOT NULL,
  `android_version` varchar(20) NOT NULL COMMENT '安卓版本',
  `ios_version` varchar(20) NOT NULL COMMENT '苹果版本',
  `language` varchar(10) NOT NULL COMMENT '语言',
  `grade` varchar(2) NOT NULL COMMENT '星级',
  `platform` int(8) NOT NULL COMMENT '所属游戏平台id',
  `platform_id` int(8) NOT NULL COMMENT '游戏在合作平台的的id',
  `update_info` longtext NOT NULL COMMENT '更新信息',
  `transfer` tinyint(1) DEFAULT '1' COMMENT '是否为中转游戏，1非中转，2中转',
  `parameter` enum('1','2') NOT NULL DEFAULT '2' COMMENT '该游戏是否生成参数（1、生成 2、未生成）',
  `device_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '安装包类型，0安卓，1ios，2都有',
  `pinyin` text NOT NULL COMMENT '游戏拼音',
  `pic` varchar(255) NOT NULL COMMENT '图片5',
  `cps_type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '推广类型（1=>’cps‘、2=>''cpa''、3=>''cpa和cps''）',
  `cps_ratio` int(10) unsigned NOT NULL COMMENT '游戏默认推广比例',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `gamename` (`gamename`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_game`
--

LOCK TABLES `mini_game` WRITE;
/*!40000 ALTER TABLE `mini_game` DISABLE KEYS */;
INSERT INTO `mini_game` VALUES (1,0,'测试游戏','','csyx',1,'','','',0,'',1,'','','','金币',1487750161,0,'',1,'',0.00,'',1,'','','','','http://miniyx.oss-cn-beijing.aliyuncs.com/games/android/m/csyx.apk','/data/upload/qrcode/1488789734.png','','','0000-00-00 00:00:00','1.0','','1','',0,0,'',1,'1',2,'','','3',10),(2,1,'兽血沸腾','S','shft',1,'http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/game/20170315/58c8e8f992b32.jpg','http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/game/20170315/58c8e8b8f36c3.jpg','http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/game/20170320/58cf47011b1d3.jpg',0,'',1,'','','','元宝',1489130728,0,'',1,'',0.00,'',1,'','','','','','','','','0000-00-00 00:00:00','','','1','',0,0,'',1,'1',2,'','','1',0);
/*!40000 ALTER TABLE `mini_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_guestbook`
--

DROP TABLE IF EXISTS `mini_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_guestbook`
--

LOCK TABLES `mini_guestbook` WRITE;
/*!40000 ALTER TABLE `mini_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_links`
--

DROP TABLE IF EXISTS `mini_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_links`
--

LOCK TABLES `mini_links` WRITE;
/*!40000 ALTER TABLE `mini_links` DISABLE KEYS */;
INSERT INTO `mini_links` VALUES (1,'https://www.wancms.com','WANCMS','','_blank','',1,0,'',0);
/*!40000 ALTER TABLE `mini_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_logininfo`
--

DROP TABLE IF EXISTS `mini_logininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_logininfo` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  `agent` varchar(30) DEFAULT NULL COMMENT '渠道商',
  `imeil` varchar(50) DEFAULT NULL COMMENT '手机imeil码',
  `device` tinyint(2) DEFAULT NULL COMMENT '注册设备来源，1为PC，2为安卓，3为苹果',
  `login_time` int(11) DEFAULT NULL COMMENT '登录时间',
  `reg_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `fromflag` smallint(2) DEFAULT '1' COMMENT '1为SDK及平台，2为html5平台游戏',
  `ipv4` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `userid` (`userid`),
  KEY `gameid` (`gameid`),
  KEY `agent` (`agent`),
  KEY `IDX_US_GA_AG` (`userid`,`gameid`,`agent`),
  KEY `login_time` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_logininfo`
--

LOCK TABLES `mini_logininfo` WRITE;
/*!40000 ALTER TABLE `mini_logininfo` DISABLE KEYS */;
INSERT INTO `mini_logininfo` VALUES (1,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487751484,1487751484,1,'115.229.21.179'),(2,3,1,'cps001','867933028666240',2,1487752892,1487751510,1,'115.229.21.179'),(3,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487753134,1487751484,1,'115.229.21.179'),(4,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487753485,1487751484,1,'115.229.21.179'),(5,4,1,'cps001','867933028666240',2,1487753525,1487753126,1,'115.229.21.179'),(6,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487753941,1487751484,1,'115.229.21.179'),(7,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487754099,1487751484,1,'115.229.21.179'),(8,5,1,'cps001','867933028666240',2,1487755716,1487754039,1,'115.229.21.179'),(9,5,1,'cps001','867933028666240',2,1487755929,1487754039,1,'115.229.21.179'),(10,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487755936,1487751484,1,'115.229.21.179'),(11,5,1,'cps001','867933028666240',2,1487755970,1487754039,1,'115.229.21.179'),(12,5,1,'cps001','867933028666240',2,1487756147,1487754039,1,'115.229.21.179'),(13,5,1,'cps001','867933028666240',2,1487756357,1487754039,1,'115.229.21.179'),(14,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487756831,1487751484,1,'115.229.21.179'),(15,8,1,'cps001','A0000055E7FC1C',2,1487758511,1487758467,1,'115.229.21.179'),(16,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487811957,1487751484,1,'115.229.25.125'),(17,11,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487824948,1487824948,1,'115.229.25.125'),(18,14,1,'cps001','867933028666240',2,1487826249,1487825819,1,'115.229.25.125'),(19,12,1,'cps001','867933028666240',2,1487826519,1487825139,1,'115.229.25.125'),(20,8,1,'cps001','A0000055E7FC1C',2,1487903750,1487758467,1,'183.140.251.11'),(21,8,1,'cps001','A0000055E7FC1C',2,1487904824,1487758467,1,'183.140.251.11'),(22,8,1,'cps001','A0000055E7FC1C',2,1487904860,1487758467,1,'183.140.251.11'),(23,8,1,'cps001','A0000055E7FC1C',2,1487912469,1487758467,1,'183.140.251.11'),(24,11,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487915538,1487824948,1,'183.140.251.11'),(25,11,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487915553,1487824948,1,'183.140.251.11'),(26,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487915564,1487751484,1,'183.140.251.11'),(27,8,1,'cps001','A0000055E7FC1C',2,1487917003,1487758467,1,'183.140.251.11'),(28,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487917228,1487751484,1,'183.140.251.11'),(29,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487917258,1487751484,1,'183.140.251.11'),(30,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487917267,1487751484,1,'183.140.251.11'),(31,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487917268,1487751484,1,'183.140.251.11'),(32,8,1,'cps001','A0000055E7FC1C',2,1487927616,1487758467,1,'183.140.251.11'),(33,8,1,'cps001','A0000055E7FC1C',2,1487927638,1487758467,1,'183.140.251.11'),(34,2,1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487927708,1487751484,1,'183.140.251.11'),(35,16,1,'cps001','867933028666240',2,1487928766,1487928191,1,'183.140.251.11'),(36,8,1,'cps001','A0000055E7FC1C',2,1487930367,1487758467,1,'183.140.251.11'),(37,8,1,'cps001','A0000055E7FC1C',2,1487930447,1487758467,1,'183.140.251.11'),(38,19,1,'cps001','867933028666240',2,1487932067,1487931143,1,'183.140.251.11'),(39,21,1,'cps001','867933028666240',2,1487932515,1487932363,1,'183.140.251.11'),(40,23,1,'cps001','A0000055E7FC1C',2,1487932853,1487932730,1,'183.140.251.11'),(41,26,1,'cps001','863410036901582',2,1487933178,1487933174,1,'113.214.206.144'),(42,27,1,'cps001','A0000055E7FC1C',2,1487933479,1487933345,1,'183.140.251.11'),(43,27,1,'cps001','A0000055E7FC1C',2,1487934255,1487933345,1,'115.228.50.145'),(44,27,1,'cps001','A0000055E7FC1C',2,1488085035,1487933345,1,'115.228.50.145'),(45,29,1,'cps001','863738023824759',2,1488160313,1488160244,1,'115.228.59.134'),(46,29,1,'cps001','863738023824759',2,1488160565,1488160244,1,'115.228.59.134'),(47,29,1,'cps001','863738023824759',2,1488161410,1488160244,1,'115.228.59.134'),(48,29,1,'cps001','863738023824759',2,1488161722,1488160244,1,'115.228.59.134'),(49,27,1,'cps001','A0000055E7FC1C',2,1488163664,1487933345,1,'115.228.59.134'),(50,30,1,'cps001','863738023824759',2,1488166370,1488166267,1,'115.228.59.134'),(51,36,1,'cps001','859284662114500',2,1488249790,1488249674,1,'115.228.53.203'),(52,36,1,'cps001','859284662114500',2,1488250199,1488249674,1,'115.228.53.203'),(53,36,1,'cps001','859284662114500',2,1488250359,1488249674,1,'115.228.53.203'),(54,37,1,'cps001','859284662114500',2,1488251305,1488250470,1,'115.228.53.203'),(55,31,1,'cps001','864394010142216',2,1488252539,1488166494,1,'180.89.5.127'),(56,31,1,'cps001','868964028917951',2,1488252772,1488166494,1,'180.89.5.127'),(57,38,1,'cps001','859284662114500',2,1488253202,1488252430,1,'115.228.53.203'),(58,39,1,'cps001','859284662114500',2,1488266358,1488265962,1,'115.228.53.203'),(59,39,1,'cps001','859284662114500',2,1488266434,1488265962,1,'115.228.53.203'),(60,39,1,'cps001','859284662114500',2,1488266441,1488265962,1,'115.228.53.203'),(61,39,1,'cps001','859284662114500',2,1488266469,1488265962,1,'115.228.53.203'),(62,39,1,'cps001','859284662114500',2,1488266700,1488265962,1,'115.228.53.203'),(63,39,1,'cps001','859284662114500',2,1488266708,1488265962,1,'115.228.53.203'),(64,44,1,'cps001','860707030366420',2,1488270758,1488270419,1,'115.228.53.203'),(65,39,1,'cps001','859284662114500',2,1488270840,1488265962,1,'115.228.53.203'),(66,44,1,'cps001','860707030366420',2,1488271084,1488270419,1,'115.228.53.203'),(67,44,1,'cps001','860707030366420',2,1488271510,1488270419,1,'115.228.53.203'),(68,44,1,'cps001','860707030366420',2,1488271986,1488270419,1,'115.228.53.203'),(69,44,1,'cps001','860707030366420',2,1488272111,1488270419,1,'115.228.53.203'),(70,44,1,'cps001','860707030366420',2,1488272904,1488270419,1,'115.228.53.203'),(71,44,1,'cps001','860707030366420',2,1488272981,1488270419,1,'115.228.53.203'),(72,44,1,'cps001','860707030366420',2,1488273045,1488270419,1,'115.228.53.203'),(73,45,1,'cps001','860707030366420',2,1488274239,1488273827,1,'115.228.53.203'),(74,45,1,'cps001','860707030366420',2,1488274408,1488273827,1,'115.228.53.203'),(75,45,1,'cps001','860707030366420',2,1488274424,1488273827,1,'115.228.53.203'),(76,47,1,'cps001','860707030366420',2,1488339040,1488338440,1,'60.163.85.187'),(77,46,1,'cps001','867933028666240',2,1488344648,1488338152,1,'60.163.85.187'),(78,46,1,'cps001','867933028666240',2,1488344675,1488338152,1,'60.163.85.187'),(79,46,1,'cps001','867933028666240',2,1488345098,1488338152,1,'60.163.85.187'),(80,46,1,'cps001','867933028666240',2,1488345176,1488338152,1,'60.163.85.187'),(81,46,1,'cps001','867933028666240',2,1488345389,1488338152,1,'60.163.85.187'),(82,50,1,'cps001','860707030366420',2,1488346397,1488345600,1,'112.17.239.216'),(83,52,1,'cps001','860707030366420',2,1488347440,1488347046,1,'60.163.85.187'),(84,46,1,'cps001','867933028666240',2,1488347502,1488338152,1,'60.163.85.187'),(85,46,1,'cps001','867933028666240',2,1488347748,1488338152,1,'60.163.85.187'),(86,46,1,'cps001','867933028666240',2,1488347879,1488338152,1,'60.163.85.187'),(87,46,1,'cps001','867933028666240',2,1488347950,1488338152,1,'60.163.85.187'),(88,46,1,'cps001','867933028666240',2,1488348124,1488338152,1,'60.163.85.187'),(89,53,1,'cps001','859284662114500',2,1488349280,1488347624,1,'60.163.85.187'),(90,53,1,'cps001','859284662114500',2,1488349375,1488347624,1,'60.163.85.187'),(91,53,1,'cps001','859284662114500',2,1488349418,1488347624,1,'60.163.85.187'),(92,46,1,'cps001','867933028666240',2,1488350004,1488338152,1,'60.163.85.187'),(93,46,1,'cps001','867933028666240',2,1488350074,1488338152,1,'60.163.85.187'),(94,46,1,'cps001','867933028666240',2,1488350182,1488338152,1,'60.163.85.187'),(95,46,1,'cps001','867933028666240',2,1488350319,1488338152,1,'60.163.85.187'),(96,46,1,'cps001','867933028666240',2,1488350514,1488338152,1,'60.163.85.187'),(97,54,1,'cps001','867933028666240',2,1488350901,1488350598,1,'60.163.85.187'),(98,56,1,'cps001','867933028666240',2,1488352869,1488352818,1,'60.163.85.187'),(99,58,1,'cps001','A0000055E7FC1C',2,1488353105,1488353056,1,'60.163.85.187'),(100,58,1,'cps001','A0000055E7FC1C',2,1488353112,1488353056,1,'60.163.85.187'),(101,58,1,'cps001','A0000055E7FC1C',2,1488353124,1488353056,1,'60.163.85.187'),(102,58,1,'cps001','A0000055E7FC1C',2,1488353132,1488353056,1,'60.163.85.187'),(103,58,1,'cps001','A0000055E7FC1C',2,1488353156,1488353056,1,'60.163.85.187'),(104,58,1,'cps001','A0000055E7FC1C',2,1488353171,1488353056,1,'60.163.85.187'),(105,57,1,'cps001','867933028666240',2,1488353610,1488352973,1,'60.163.85.187'),(106,60,1,'cps001','867933028666240',2,1488354083,1488353845,1,'60.163.85.187'),(107,61,1,'cps001','867933028666240',2,1488354757,1488354152,1,'60.163.85.187'),(108,59,1,'cps001','864394010142216',2,1488354814,1488353140,1,'180.89.5.127'),(109,62,1,'cps001','867933028666240',2,1488354937,1488354897,1,'60.163.85.187'),(110,64,1,'cps001','867933028666240',2,1488355228,1488355206,1,'60.163.85.187'),(111,65,1,'cps001','A0000055E7FC1C',2,1488355955,1488355542,1,'60.163.85.187'),(112,64,1,'cps001','867933028666240',2,1488357837,1488355206,1,'60.163.85.187'),(113,64,1,'cps001','867933028666240',2,1488358033,1488355206,1,'60.163.85.187'),(114,64,1,'cps001','867933028666240',2,1488358361,1488355206,1,'60.163.85.187'),(115,64,1,'cps001','867933028666240',2,1488358546,1488355206,1,'60.163.85.187'),(116,64,1,'cps001','867933028666240',2,1488359148,1488355206,1,'60.163.85.187'),(117,64,1,'cps001','867933028666240',2,1488359355,1488355206,1,'60.163.85.187'),(118,66,1,'cps001','867933028666240',2,1488359606,1488359419,1,'60.163.85.187'),(119,66,1,'cps001','867933028666240',2,1488359711,1488359419,1,'60.163.85.187'),(120,66,1,'cps001','867933028666240',2,1488359798,1488359419,1,'60.163.85.187'),(121,66,1,'cps001','867933028666240',2,1488360734,1488359419,1,'60.163.85.187'),(122,66,1,'cps001','867933028666240',2,1488361153,1488359419,1,'60.163.85.187'),(123,66,1,'cps001','867933028666240',2,1488361274,1488359419,1,'60.163.85.187'),(124,66,1,'cps001','867933028666240',2,1488361344,1488359419,1,'60.163.85.187'),(125,66,1,'cps001','867933028666240',2,1488361578,1488359419,1,'60.163.85.187'),(126,66,1,'cps001','867933028666240',2,1488361682,1488359419,1,'60.163.85.187'),(127,66,1,'cps001','867933028666240',2,1488361728,1488359419,1,'60.163.85.187'),(128,66,1,'cps001','867933028666240',2,1488361745,1488359419,1,'60.163.85.187'),(129,67,1,'cps001','000000000000000',2,1488370177,1488369315,1,'111.1.152.73'),(130,67,1,'cps001','000000000000000',2,1488370472,1488369315,1,'111.1.152.73'),(131,67,1,'cps001','000000000000000',2,1488370614,1488369315,1,'111.1.152.73'),(132,67,1,'cps001','000000000000000',2,1488370775,1488369315,1,'111.1.152.73'),(133,67,1,'cps001','000000000000000',2,1488371250,1488369315,1,'111.1.152.73'),(134,67,1,'cps001','000000000000000',2,1488372336,1488369315,1,'111.1.152.73'),(135,67,1,'cps001','000000000000000',2,1488372445,1488369315,1,'111.1.152.73'),(136,67,1,'cps001','000000000000000',2,1488374331,1488369315,1,'111.1.152.73'),(137,67,1,'cps001','000000000000000',2,1488374351,1488369315,1,'111.1.152.73'),(138,67,1,'cps001','000000000000000',2,1488374500,1488369315,1,'111.1.152.73'),(139,67,1,'cps001','000000000000000',2,1488374548,1488369315,1,'111.1.152.73'),(140,67,1,'cps001','000000000000000',2,1488374884,1488369315,1,'111.1.152.73'),(141,67,1,'cps001','000000000000000',2,1488375087,1488369315,1,'111.1.152.73'),(142,67,1,'cps001','000000000000000',2,1488375153,1488369315,1,'111.1.152.73'),(143,66,1,'cps001','867933028666240',2,1488417139,1488359419,1,'183.140.252.174'),(144,66,1,'cps001','867933028666240',2,1488417492,1488359419,1,'183.140.252.174'),(145,66,1,'cps001','867933028666240',2,1488417518,1488359419,1,'183.140.252.174'),(146,66,1,'cps001','867933028666240',2,1488417535,1488359419,1,'183.140.252.174'),(147,66,1,'cps001','867933028666240',2,1488417653,1488359419,1,'183.140.252.174'),(148,66,1,'cps001','867933028666240',2,1488417931,1488359419,1,'183.140.252.174'),(149,66,1,'cps001','867933028666240',2,1488418499,1488359419,1,'183.140.252.174'),(150,66,1,'cps001','867933028666240',2,1488418630,1488359419,1,'183.140.252.174'),(151,66,1,'cps001','867933028666240',2,1488418814,1488359419,1,'183.140.252.174'),(152,66,1,'cps001','867933028666240',2,1488419017,1488359419,1,'183.140.252.174'),(153,66,1,'cps001','867933028666240',2,1488419383,1488359419,1,'183.140.252.174'),(154,66,1,'cps001','867933028666240',2,1488420482,1488359419,1,'183.140.252.174'),(155,71,1,'cps001','867933028666240',2,1488446195,1488446015,1,'183.140.252.174'),(156,72,1,'cps001','867933028666240',2,1488446824,1488446798,1,'183.140.252.174'),(157,59,1,'cps001','864394010142216',2,1488448107,1488353140,1,'118.29.185.230'),(158,59,1,'cps001','864394010142216',2,1488448113,1488353140,1,'118.29.185.230'),(159,59,1,'cps001','864394010142216',2,1488448131,1488353140,1,'118.29.185.230'),(160,75,1,'cps001','862891030680143',2,1488448583,1488448273,1,'118.29.185.230'),(161,75,1,'cps001','862891030680143',2,1488448588,1488448273,1,'118.29.185.230'),(162,74,1,'cps001','867933028666240',2,1488504560,1488447458,1,'115.229.16.129'),(163,74,1,'cps001','867933028666240',2,1488504566,1488447458,1,'115.229.16.129'),(164,76,1,'cps001','867933028666240',2,1488504590,1488504575,1,'115.229.16.129'),(165,77,1,'cps001','867933028666240',2,1488506296,1488506291,1,'115.229.16.129'),(166,59,1,'cps001','864394010142216',2,1488507048,1488353140,1,'118.29.185.230'),(167,59,1,'cps001','864394010142216',2,1488507058,1488353140,1,'118.29.185.230'),(168,59,1,'cps001','864394010142216',2,1488507062,1488353140,1,'118.29.185.230'),(169,59,1,'cps001','864394010142216',2,1488507079,1488353140,1,'118.29.185.230'),(170,31,1,'cps001','864394010142216',2,1488519719,1488166494,1,'118.29.185.230'),(171,31,1,'cps001','864394010142216',2,1488519737,1488166494,1,'118.29.185.230'),(172,2,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488524568,1487751484,1,'115.229.16.129'),(173,85,1,'cps001','859284662114500',2,1488773802,1488771252,1,'115.228.60.176'),(174,85,1,'cps001','859284662114500',2,1488773888,1488771252,1,'115.228.60.176'),(175,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488774301,1488774299,1,'115.228.60.176'),(176,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488774437,1488774299,1,'115.228.60.176'),(177,86,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778238,1488774299,1,'115.228.60.176'),(178,86,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778241,1488774299,1,'115.228.60.176'),(179,88,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778261,1488778260,1,'115.228.60.176'),(180,86,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778310,1488774299,1,'115.228.60.176'),(181,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488778356,1487751484,1,'115.228.60.176'),(182,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488778375,1488774299,1,'115.228.60.176'),(183,90,1,'cps001','A0000055E7FC1C',2,1488778702,1488778698,1,'115.228.60.176'),(184,90,1,'cps001','A0000055E7FC1C',2,1488778736,1488778698,1,'115.228.60.176'),(185,91,1,'cps001','867933028666240',2,1488780369,1488780325,1,'115.228.60.176'),(186,85,1,'cps001','859284662114500',2,1488794122,1488771252,1,'115.228.60.176'),(187,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488794444,1488774299,1,'115.228.60.176'),(188,97,1,'cps001','859284662114500',2,1488853740,1488853630,1,'115.228.60.176'),(189,98,1,'cps001','864394010142216',2,1488853829,1488853669,1,'118.29.185.230'),(190,98,1,'cps001','864394010142216',2,1488853837,1488853669,1,'118.29.185.230'),(191,98,1,'cps001','864394010142216',2,1488853974,1488853669,1,'118.29.185.230'),(192,99,1,'cps001','859284662114500',2,1488854400,1488853985,1,'115.228.60.176'),(193,98,1,'cps001','864394010142216',2,1488854480,1488853669,1,'118.29.185.230'),(194,98,1,'cps001','864394010142216',2,1488854485,1488853669,1,'118.29.185.230'),(195,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488855268,1488774299,1,'115.228.60.176'),(196,106,1,'cps001','A0000055E7FC1C',2,1488856675,1488856609,1,'115.228.60.176'),(197,106,1,'cps001','A0000055E7FC1C',2,1488856693,1488856609,1,'115.228.60.176'),(198,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488857441,1488774299,1,'115.228.60.176'),(199,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488857543,1488774299,1,'115.228.60.176'),(200,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488857546,1488774299,1,'115.228.60.176'),(201,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488857607,1488774299,1,'115.228.60.176'),(202,106,1,'cps001','A0000055E7FC1C',2,1488858286,1488856609,1,'115.228.60.176'),(203,110,1,'cps001','A0000055E7FC1C',2,1488858596,1488858591,1,'115.228.60.176'),(204,110,1,'cps001','A0000055E7FC1C',2,1488859796,1488858591,1,'115.228.60.176'),(205,112,1,'cps001','867933028666240',2,1488864476,1488864366,1,'115.228.60.176'),(206,122,1,'cps001','867933028666240',2,1488869187,1488868631,1,'115.228.60.176'),(207,129,1,'cps001','864895022454415',2,1488875142,1488875103,1,'120.195.151.20'),(208,129,1,'cps001','864895022454415',2,1488875241,1488875103,1,'120.195.151.20'),(209,129,1,'cps001','864895022454415',2,1488875244,1488875103,1,'120.195.151.20'),(210,132,1,'cps001','864394010142216',2,1488880694,1488880669,1,'118.29.185.230'),(211,127,1,'cps001','867933028666240',2,1488935808,1488874204,1,'115.228.60.176'),(212,127,1,'cps001','867933028666240',2,1488935927,1488874204,1,'115.228.60.176'),(213,127,1,'cps001','867933028666240',2,1488937409,1488874204,1,'115.228.60.176'),(214,133,1,'cps001','867933028666240',2,1488939512,1488939446,1,'115.228.60.176'),(215,133,1,'cps001','867933028666240',2,1488940296,1488939446,1,'115.228.60.176'),(216,133,1,'cps001','867933028666240',2,1488940415,1488939446,1,'115.228.60.176'),(217,133,1,'cps001','867933028666240',2,1488940485,1488939446,1,'115.228.60.176'),(218,133,1,'cps001','867933028666240',2,1488940929,1488939446,1,'115.228.60.176'),(219,133,1,'cps001','867933028666240',2,1488942462,1488939446,1,'115.228.60.176'),(220,132,1,'cps001','864394010142216',2,1488948034,1488880669,1,'118.29.185.230'),(221,138,1,'cps001','864394010504373',2,1488951063,1488951059,1,'115.228.60.176'),(222,137,1,'cps001','867933028666240',2,1488951428,1488944156,1,'115.228.60.176'),(223,139,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488951639,1488951638,1,'115.228.60.176'),(224,139,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488951644,1488951638,1,'115.228.60.176'),(225,139,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488951679,1488951638,1,'115.228.60.176'),(226,140,1,'cps001','867933028666240',2,1488952984,1488952981,1,'115.228.60.176'),(227,140,1,'cps001','867933028666240',2,1488953010,1488952981,1,'115.228.60.176'),(228,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953882,1488774299,1,'115.228.60.176'),(229,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953885,1488774299,1,'115.228.60.176'),(230,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953890,1488774299,1,'115.228.60.176'),(231,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953917,1488774299,1,'115.228.60.176'),(232,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953935,1488774299,1,'115.228.60.176'),(233,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488954353,1488774299,1,'115.228.60.176'),(234,86,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488957101,1488774299,1,'115.228.60.176'),(235,143,1,'cps001','867933028666240',2,1488961478,1488959353,1,'115.228.60.176'),(236,143,1,'cps001','867933028666240',2,1488961485,1488959353,1,'115.228.60.176'),(237,143,1,'cps001','867933028666240',2,1488961882,1488959353,1,'115.228.60.176'),(238,144,1,'cps001','864394010349720',2,1488962826,1488962820,1,'118.29.185.230'),(239,144,1,'cps001','864394010349720',2,1488964115,1488962820,1,'118.29.185.230'),(240,144,1,'cps001','864394010349720',2,1488964263,1488962820,1,'118.29.185.230'),(241,143,1,'cps001','867933028666240',2,1488964442,1488959353,1,'115.228.60.176'),(242,144,1,'cps001','864394010349720',2,1488964551,1488962820,1,'118.29.185.230'),(243,146,1,'cps001','864394010504373',2,1488966222,1488966217,1,'115.228.60.176'),(244,144,1,'cps001','864394010349720',2,1489028529,1488962820,1,'118.29.185.230'),(245,145,1,'cps001','867933028666240',2,1489036074,1488965387,1,'115.228.61.171'),(246,86,1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1489036711,1488774299,1,'115.228.61.171'),(247,149,1,'cps001','859284662114500',2,1489046734,1489046730,1,'115.228.61.171'),(248,150,1,'cps001','859284662114500',2,1489047515,1489047191,1,'115.228.61.171'),(249,144,1,'cps001','864394010349720',2,1489132559,1488962820,1,'118.29.185.230'),(250,144,1,'cps001','864394010349720',2,1489133317,1488962820,1,'118.29.185.230'),(251,144,1,'cps001','864394010349720',2,1489133321,1488962820,1,'118.29.185.230'),(252,156,2,'cps001','A0000055E7FC1C',2,1489134182,1489134168,1,'115.228.56.153'),(253,155,2,'cps001','867933028666240',2,1489278474,1489134011,1,'111.1.158.18'),(254,155,2,'cps001','867933028666240',2,1489278493,1489134011,1,'111.1.158.18'),(255,155,2,'cps001','867933028666240',2,1489301694,1489134011,1,'111.1.158.18'),(256,144,1,'cps001','864394010349720',2,1489370299,1488962820,1,'118.29.185.230'),(257,157,1,'kukecps','864394011142215',2,1489386766,1489386758,1,'118.29.185.230'),(258,157,1,'kukecps001','864394011142215',2,1489387209,1489386758,1,'118.29.185.230'),(259,158,1,'kukecps001','864394011142215',2,1489387300,1489387260,1,'118.29.185.230'),(260,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489469577,1487751484,1,'115.227.8.86'),(261,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489469804,1487751484,1,'115.227.8.86'),(262,52,1,'cps001','860707030366420',2,1489470244,1488347046,1,'218.205.55.101'),(263,156,2,'cps001','A0000055E7FC1C',2,1489470256,1489134168,1,'115.227.8.86'),(264,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489470378,1487751484,1,'115.227.8.86'),(265,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489470500,1487751484,1,'115.227.8.86'),(266,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489470745,1487751484,1,'115.227.8.86'),(267,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489470883,1487751484,1,'115.227.8.86'),(268,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471315,1487751484,1,'115.227.8.86'),(269,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471364,1487751484,1,'115.227.8.86'),(270,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471402,1487751484,1,'115.227.8.86'),(271,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471505,1487751484,1,'115.227.8.86'),(272,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471562,1487751484,1,'115.227.8.86'),(273,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471630,1487751484,1,'115.227.8.86'),(274,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489471739,1487751484,1,'115.227.8.86'),(275,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489472247,1487751484,1,'115.227.8.86'),(276,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489472672,1487751484,1,'115.227.8.86'),(277,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489473147,1487751484,1,'115.227.8.86'),(278,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489473384,1487751484,1,'115.227.8.86'),(279,52,1,'cps001','860707030366420',2,1489473476,1488347046,1,'115.227.8.86'),(280,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489479221,1487751484,1,'115.227.8.86'),(281,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480011,1487751484,1,'115.227.8.86'),(282,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480013,1487751484,1,'115.227.8.86'),(283,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480263,1487751484,1,'115.227.8.86'),(284,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480274,1487751484,1,'115.227.8.86'),(285,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480280,1487751484,1,'115.227.8.86'),(286,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480376,1487751484,1,'115.227.8.86'),(287,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480612,1487751484,1,'115.227.8.86'),(288,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480793,1487751484,1,'115.227.8.86'),(289,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489480802,1487751484,1,'115.227.8.86'),(290,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489481252,1487751484,1,'115.227.8.86'),(291,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489481265,1487751484,1,'115.227.8.86'),(292,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489481283,1487751484,1,'115.227.8.86'),(293,2,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489484750,1487751484,1,'115.227.8.86'),(294,139,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489484759,1488951638,1,'115.227.8.86'),(295,139,1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1489484764,1488951638,1,'115.227.8.86'),(296,160,1,'cps001','859284662114500',2,1489485077,1489484928,1,'115.227.8.86'),(297,161,1,'kukecps003','864394010527408',2,1489542370,1489542365,1,'118.29.185.230'),(298,26,1,'cps001','863410036901582',2,1489558367,1487933174,1,'115.227.8.86'),(299,26,1,'cps001','863410036901582',2,1489558375,1487933174,1,'115.227.8.86'),(300,26,1,'cps001','863410036901582',2,1489558387,1487933174,1,'115.227.8.86'),(301,163,2,'cps001','859284662114500',2,1490691607,1490691406,1,'183.140.252.65'),(302,164,2,'cps001','859284662114500',2,1490691664,1490691634,1,'183.140.252.65');
/*!40000 ALTER TABLE `mini_logininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_logoutinfo`
--

DROP TABLE IF EXISTS `mini_logoutinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_logoutinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  `agent` varchar(30) DEFAULT NULL COMMENT '渠道商',
  `imeil` varchar(50) DEFAULT NULL COMMENT '手机imeil码',
  `device` tinyint(2) DEFAULT NULL COMMENT '注册设备来源，1为PC，2为安卓，3为苹果',
  `logout_time` int(11) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_logoutinfo`
--

LOCK TABLES `mini_logoutinfo` WRITE;
/*!40000 ALTER TABLE `mini_logoutinfo` DISABLE KEYS */;
INSERT INTO `mini_logoutinfo` VALUES (1,'d463775011',1,'cps001','867933028666240',2,1487752122),(2,'d463775011',1,'cps001','867933028666240',2,1487752886),(3,'d528154873',1,'cps001','867933028666240',2,1487754812),(4,'d528154873',1,'cps001','867933028666240',2,1487755712),(5,'d280068238',1,'cps001','A0000055E7FC1C',2,1487758503),(6,'d280068238',1,'cps001','A0000055E7FC1C',2,1487758517),(7,'d280068238',1,'cps001','A0000055E7FC1C',2,1487758582),(8,'qqqqq',1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487824933),(9,'d280068238',1,'cps001','A0000055E7FC1C',2,1487903775),(10,'d280068238',1,'cps001','A0000055E7FC1C',2,1487903814),(11,'d280068238',1,'cps001','A0000055E7FC1C',2,1487904819),(12,'d280068238',1,'cps001','A0000055E7FC1C',2,1487904850),(13,'d280068238',1,'cps001','A0000055E7FC1C',2,1487904873),(14,'d280068238',1,'cps001','A0000055E7FC1C',2,1487904948),(15,'d280068238',1,'cps001','A0000055E7FC1C',2,1487908041),(16,'d280068238',1,'cps001','A0000055E7FC1C',2,1487908042),(17,'d280068238',1,'cps001','A0000055E7FC1C',2,1487908669),(18,'d280068238',1,'cps001','A0000055E7FC1C',2,1487912475),(19,'d280068238',1,'cps001','A0000055E7FC1C',2,1487912477),(20,'d280068238',1,'cps001','A0000055E7FC1C',2,1487912772),(21,'d280068238',1,'cps001','A0000055E7FC1C',2,1487912775),(22,'d280068238',1,'cps001','A0000055E7FC1C',2,1487917013),(23,'d280068238',1,'cps001','A0000055E7FC1C',2,1487917059),(24,'qqqqq',1,'test002','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1487917226),(25,'d280068238',1,'cps001','A0000055E7FC1C',2,1487918131),(26,'d280068238',1,'cps001','A0000055E7FC1C',2,1487918168),(27,'d280068238',1,'cps001','A0000055E7FC1C',2,1487927608),(28,'d280068238',1,'cps001','A0000055E7FC1C',2,1487927645),(29,'d280068238',1,'cps001','A0000055E7FC1C',2,1487927724),(30,'d280068238',1,'cps001','A0000055E7FC1C',2,1487928311),(31,'d280068238',1,'cps001','A0000055E7FC1C',2,1487928379),(32,'d280068238',1,'cps001','A0000055E7FC1C',2,1487928674),(33,'d663976011',1,'cps001','867933028666240',2,1487928676),(34,'d280068238',1,'cps001','A0000055E7FC1C',2,1487928676),(35,'d663976011',1,'cps001','867933028666240',2,1487928758),(36,'d127793572',1,'cps001','867933028666240',2,1487929599),(37,'d127793572',1,'cps001','867933028666240',2,1487930154),(38,'d280068238',1,'cps001','A0000055E7FC1C',2,1487930473),(39,'d127793572',1,'cps001','867933028666240',2,1487930759),(40,'d807043451',1,'cps001','A0000055E7FC1C',2,1487932592),(41,'d807043451',1,'cps001','A0000055E7FC1C',2,1487932592),(42,'d309129434',1,'cps001','A0000055E7FC1C',2,1487932792),(43,'d309129434',1,'cps001','A0000055E7FC1C',2,1487932873),(44,'d565655636',1,'cps001','A0000055E7FC1C',2,1487933402),(45,'d565655636',1,'cps001','A0000055E7FC1C',2,1487933524),(46,'d565655636',1,'cps001','A0000055E7FC1C',2,1487934262),(47,'d565655636',1,'cps001','A0000055E7FC1C',2,1487934263),(48,'d565655636',1,'cps001','A0000055E7FC1C',2,1487934267),(49,'d565655636',1,'cps001','A0000055E7FC1C',2,1488085104),(50,'d565655636',1,'cps001','A0000055E7FC1C',2,1488085692),(51,'d519970958',1,'cps001','860707030366420',2,1488159694),(52,'d426731275',1,'cps001','863738023824759',2,1488160281),(53,'d426731275',1,'cps001','863738023824759',2,1488160281),(54,'d426731275',1,'cps001','863738023824759',2,1488160324),(55,'d426731275',1,'cps001','863738023824759',2,1488160324),(56,'d426731275',1,'cps001','863738023824759',2,1488160427),(57,'d426731275',1,'cps001','863738023824759',2,1488160556),(58,'d426731275',1,'cps001','863738023824759',2,1488160647),(59,'d426731275',1,'cps001','863738023824759',2,1488160686),(60,'d426731275',1,'cps001','863738023824759',2,1488161418),(61,'d426731275',1,'cps001','863738023824759',2,1488161418),(62,'d426731275',1,'cps001','863738023824759',2,1488161486),(63,'d426731275',1,'cps001','863738023824759',2,1488161567),(64,'d565655636',1,'cps001','A0000055E7FC1C',2,1488163718),(65,'d565655636',1,'cps001','A0000055E7FC1C',2,1488163723),(66,'d565655636',1,'cps001','A0000055E7FC1C',2,1488163760),(67,'d565655636',1,'cps001','A0000055E7FC1C',2,1488163777),(68,'d565655636',1,'cps001','A0000055E7FC1C',2,1488163816),(69,'d565655636',1,'cps001','A0000055E7FC1C',2,1488164254),(70,'d565655636',1,'cps001','A0000055E7FC1C',2,1488164284),(71,'d101193725',1,'cps001','A0000055E7FC1C',2,1488166646),(72,'d101193725',1,'cps001','A0000055E7FC1C',2,1488166788),(73,'d101193725',1,'cps001','A0000055E7FC1C',2,1488166788),(74,'d851252080',1,'cps001','863738023824759',2,1488179174),(75,'d585551014',1,'cps001','860707030366420',2,1488180141),(76,'d585551014',1,'cps001','860707030366420',2,1488180567),(77,'d259062200',1,'cps001','860707030366420',2,1488184293),(78,'d820364926',1,'cps001','859284662114500',2,1488250154),(79,'d820364926',1,'cps001','859284662114500',2,1488250257),(80,'cao580098',1,'cps001','859284662114500',2,1488252331),(81,'d554553041',1,'cps001','859284662114500',2,1488252466),(82,'d101193725',1,'cps001','864394010142216',2,1488252565),(83,'d973933597',1,'cps001','859284662114500',2,1488266429),(84,'d973933597',1,'cps001','859284662114500',2,1488266432),(85,'d973933597',1,'cps001','859284662114500',2,1488266435),(86,'d973933597',1,'cps001','859284662114500',2,1488266438),(87,'d973933597',1,'cps001','859284662114500',2,1488266441),(88,'d973933597',1,'cps001','859284662114500',2,1488266451),(89,'d973933597',1,'cps001','859284662114500',2,1488266475),(90,'d973933597',1,'cps001','859284662114500',2,1488266698),(91,'d973933597',1,'cps001','859284662114500',2,1488266701),(92,'d973933597',1,'cps001','859284662114500',2,1488266703),(93,'d948107956',1,'cps001','860707030366420',2,1488270322),(94,'d948107956',1,'cps001','860707030366420',2,1488270330),(95,'d314518319',1,'cps001','860707030366420',2,1488272971),(96,'d684694026',1,'cps001','867933028666240',2,1488342280),(97,'d684694026',1,'cps001','867933028666240',2,1488342577),(98,'d389697669',1,'cps001','859284662114500',2,1488349198),(99,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353097),(100,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353102),(101,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353105),(102,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353109),(103,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353118),(104,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353121),(105,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353125),(106,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353129),(107,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353137),(108,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353153),(109,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353159),(110,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488353168),(111,'d468942912',1,'cps001','867933028666240',2,1488353643),(112,'d468942912',1,'cps001','867933028666240',2,1488353646),(113,'d331657065',1,'cps001','867933028666240',2,1488353847),(114,'d331657065',1,'cps001','867933028666240',2,1488353850),(115,'d331657065',1,'cps001','867933028666240',2,1488354085),(116,'d331657065',1,'cps001','867933028666240',2,1488354088),(117,'d405784848',1,'cps001','867933028666240',2,1488354156),(118,'d405784848',1,'cps001','867933028666240',2,1488354166),(119,'d405784848',1,'cps001','867933028666240',2,1488354758),(120,'d405784848',1,'cps001','867933028666240',2,1488354761),(121,'d405784848',1,'cps001','867933028666240',2,1488354763),(122,'d972353009',1,'cps001','867933028666240',2,1488354900),(123,'d972353009',1,'cps001','867933028666240',2,1488354916),(124,'d972353009',1,'cps001','867933028666240',2,1488354949),(125,'dhdjdf',1,'cps001','A0000055E7FC1C',2,1488355495),(126,'d697693137',1,'cps001','A0000055E7FC1C',2,1488355945),(127,'d529084204',1,'cps001','867933028666240',2,1488361709),(128,'d529084204',1,'cps001','867933028666240',2,1488361737),(129,'d551077675',1,'cps001','000000000000000',2,1488370146),(130,'d551077675',1,'cps001','000000000000000',2,1488370351),(131,'d551077675',1,'cps001','000000000000000',2,1488370580),(132,'d551077675',1,'cps001','000000000000000',2,1488370752),(133,'d551077675',1,'cps001','000000000000000',2,1488371231),(134,'d551077675',1,'cps001','000000000000000',2,1488372437),(135,'d551077675',1,'cps001','000000000000000',2,1488374238),(136,'d551077675',1,'cps001','000000000000000',2,1488374950),(137,'d909510836',1,'cps001','A0000055E7FC1C',2,1488445951),(138,'d690860419',1,'cps001','864394010142216',2,1488448122),(139,'d355252735',1,'cps001','862891030680143',2,1488448321),(140,'d690860419',1,'cps001','864394010142216',2,1488507051),(141,'d690860419',1,'cps001','864394010142216',2,1488507317),(142,'d690860419',1,'cps001','864394010142216',2,1488519707),(143,'d101193725',1,'cps001','864394010142216',2,1488519745),(144,'d690860419',1,'cps001','864394010142216',2,1488519753),(145,'magua01',1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488774429),(146,'magua01',1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488774445),(147,'magua01',1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778248),(148,'magua02',1,'cps001','32EC6369-B7D8-4D1C-8694-A4CFF9EE0B46',3,1488778283),(149,'d683545727',1,'cps001','859284662114500',2,1488853396),(150,'d967313053',1,'cps001','864394010142216',2,1488853818),(151,'d967313053',1,'cps001','864394010142216',2,1488853837),(152,'d967313053',1,'cps001','864394010142216',2,1488853858),(153,'d947272266',1,'cps001','859284662114500',2,1488854244),(154,'magua01',1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488855361),(155,'d885260425',1,'cps001','859284662114500',2,1488856064),(156,'d571323836',1,'cps001','A0000055E7FC1C',2,1488856723),(157,'magua01',1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488857469),(158,'d571323836',1,'cps001','A0000055E7FC1C',2,1488858554),(159,'d317640396',1,'cps001','A0000055E7FC1C',2,1488859804),(160,'chjk456',1,'cps001','867933028666240',2,1488864435),(161,'d616008310',1,'cps001','867933028666240',2,1488868378),(162,'d473504257',1,'cps001','867933028666240',2,1488869173),(163,'d256326002',1,'cps001','864895022454415',2,1488875241),(164,'d541904701',1,'test001','A0000055E7FC1C',2,1488875518),(165,'d967313053',1,'cps001','864394010142216',2,1488880634),(166,'d964655922',1,'cps001','864394010142216',2,1488880694),(167,'d798755492',1,'cps001','867933028666240',2,1488939407),(168,'d983944619',1,'cps001','867933028666240',2,1488939503),(169,'magua01',1,'cps001','8935F5C8-6C43-4268-BA42-E7E9881C0236',3,1488953923),(170,'d239061854',1,'cps001','867933028666240',2,1488955779),(171,'d862771861',1,'cps001','864394010349720',2,1488964260),(172,'dghh455f',1,'cps001','867933028666240',2,1489052499),(173,'d696572137',1,'cps001','867933028666240',2,1489132585),(174,'d862771861',1,'cps001','864394010349720',2,1489132720),(175,'d696572137',1,'cps001','867933028666240',2,1489132830),(176,'fghj4556',2,'cps001','867933028666240',2,1489139169),(177,'fghj4556',2,'cps001','867933028666240',2,1489139184),(178,'fghj4556',2,'cps001','867933028666240',2,1489139189),(179,'fghj4556',2,'cps001','867933028666240',2,1489286162),(180,'fghj4556',2,'cps001','867933028666240',2,1489301703),(181,'d128476516',1,'kukecps001','864394011142215',2,1489387677),(182,'d493471458',1,'cps001','860707030366420',2,1489478142),(183,'d888797506',1,'cps001','859284662114500',2,1489485341),(184,'d771123957',1,'cps001','863410036901582',2,1489558603),(185,'d771123957',1,'cps001','863410036901582',2,1489559495),(186,'d771123957',1,'cps001','863410036901582',2,1489559583),(187,'d771123957',1,'cps001','863410036901582',2,1489559829),(188,'d771123957',1,'cps001','863410036901582',2,1489559920),(189,'d771123957',1,'cps001','863410036901582',2,1489559944),(190,'d771123957',1,'cps001','863410036901582',2,1489560005),(191,'d771123957',1,'cps001','863410036901582',2,1489566272),(192,'d368642361',2,'cps001','859284662114500',2,1490691582),(193,'d899447348',2,'cps001','859284662114500',2,1490691653),(194,'d899447348',2,'cps001','859284662114500',2,1490693576);
/*!40000 ALTER TABLE `mini_logoutinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_menu`
--

DROP TABLE IF EXISTS `mini_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_menu`
--

LOCK TABLES `mini_menu` WRITE;
/*!40000 ALTER TABLE `mini_menu` DISABLE KEYS */;
INSERT INTO `mini_menu` VALUES (1,0,'Admin','Content','default','',0,1,'内容管理','th','',30),(2,1,'Api','Guestbookadmin','index','',1,1,'所有留言','','',0),(3,2,'Api','Guestbookadmin','delete','',1,0,'删除网站留言','','',0),(4,1,'Comment','Commentadmin','index','',1,1,'评论管理','','',0),(5,4,'Comment','Commentadmin','delete','',1,0,'删除评论','','',0),(6,4,'Comment','Commentadmin','check','',1,0,'评论审核','','',0),(7,1,'Portal','AdminPost','index','',1,1,'文章管理','','',1),(8,7,'Portal','AdminPost','listorders','',1,0,'文章排序','','',0),(9,7,'Portal','AdminPost','top','',1,0,'文章置顶','','',0),(10,7,'Portal','AdminPost','recommend','',1,0,'文章推荐','','',0),(11,7,'Portal','AdminPost','move','',1,0,'批量移动','','',1000),(12,7,'Portal','AdminPost','check','',1,0,'文章审核','','',1000),(13,7,'Portal','AdminPost','delete','',1,0,'删除文章','','',1000),(14,7,'Portal','AdminPost','edit','',1,0,'编辑文章','','',1000),(15,14,'Portal','AdminPost','edit_post','',1,0,'提交编辑','','',0),(16,7,'Portal','AdminPost','add','',1,0,'添加文章','','',1000),(17,16,'Portal','AdminPost','add_post','',1,0,'提交添加','','',0),(18,1,'Portal','AdminTerm','index','',0,1,'分类管理','','',2),(19,18,'Portal','AdminTerm','listorders','',1,0,'文章分类排序','','',0),(20,18,'Portal','AdminTerm','delete','',1,0,'删除分类','','',1000),(21,18,'Portal','AdminTerm','edit','',1,0,'编辑分类','','',1000),(22,21,'Portal','AdminTerm','edit_post','',1,0,'提交编辑','','',0),(23,18,'Portal','AdminTerm','add','',1,0,'添加分类','','',1000),(24,23,'Portal','AdminTerm','add_post','',1,0,'提交添加','','',0),(25,1,'Portal','AdminPage','index','',1,1,'页面管理','','',3),(26,25,'Portal','AdminPage','listorders','',1,0,'页面排序','','',0),(27,25,'Portal','AdminPage','delete','',1,0,'删除页面','','',1000),(28,25,'Portal','AdminPage','edit','',1,0,'编辑页面','','',1000),(29,28,'Portal','AdminPage','edit_post','',1,0,'提交编辑','','',0),(30,25,'Portal','AdminPage','add','',1,0,'添加页面','','',1000),(31,30,'Portal','AdminPage','add_post','',1,0,'提交添加','','',0),(32,1,'Admin','Recycle','default','',1,1,'回收站','','',4),(33,32,'Portal','AdminPost','recyclebin','',1,1,'文章回收','','',0),(34,33,'Portal','AdminPost','restore','',1,0,'文章还原','','',1000),(35,33,'Portal','AdminPost','clean','',1,0,'彻底删除','','',1000),(36,32,'Portal','AdminPage','recyclebin','',1,1,'页面回收','','',1),(37,36,'Portal','AdminPage','clean','',1,0,'彻底删除','','',1000),(38,36,'Portal','AdminPage','restore','',1,0,'页面还原','','',1000),(39,0,'Admin','Extension','default','',0,1,'扩展工具','cloud','',40),(40,39,'Admin','Backup','default','',1,1,'备份管理','','',0),(41,40,'Admin','Backup','restore','',1,1,'数据还原','','',0),(42,40,'Admin','Backup','index','',1,1,'数据备份','','',0),(43,42,'Admin','Backup','index_post','',1,0,'提交数据备份','','',0),(44,40,'Admin','Backup','download','',1,0,'下载备份','','',1000),(45,40,'Admin','Backup','del_backup','',1,0,'删除备份','','',1000),(46,40,'Admin','Backup','import','',1,0,'数据备份导入','','',1000),(47,39,'Admin','Plugin','index','',1,1,'插件管理','','',0),(48,47,'Admin','Plugin','toggle','',1,0,'插件启用切换','','',0),(49,47,'Admin','Plugin','setting','',1,0,'插件设置','','',0),(50,49,'Admin','Plugin','setting_post','',1,0,'插件设置提交','','',0),(51,47,'Admin','Plugin','install','',1,0,'插件安装','','',0),(52,47,'Admin','Plugin','uninstall','',1,0,'插件卸载','','',0),(53,39,'Admin','Slide','default','',1,1,'幻灯片','','',1),(54,53,'Admin','Slide','index','',1,1,'幻灯片管理','','',0),(55,54,'Admin','Slide','listorders','',1,0,'幻灯片排序','','',0),(56,54,'Admin','Slide','toggle','',1,0,'幻灯片显示切换','','',0),(57,54,'Admin','Slide','delete','',1,0,'删除幻灯片','','',1000),(58,54,'Admin','Slide','edit','',1,0,'编辑幻灯片','','',1000),(59,58,'Admin','Slide','edit_post','',1,0,'提交编辑','','',0),(60,54,'Admin','Slide','add','',1,0,'添加幻灯片','','',1000),(61,60,'Admin','Slide','add_post','',1,0,'提交添加','','',0),(62,53,'Admin','Slidecat','index','',1,1,'幻灯片分类','','',0),(63,62,'Admin','Slidecat','delete','',1,0,'删除分类','','',1000),(64,62,'Admin','Slidecat','edit','',1,0,'编辑分类','','',1000),(65,64,'Admin','Slidecat','edit_post','',1,0,'提交编辑','','',0),(66,62,'Admin','Slidecat','add','',1,0,'添加分类','','',1000),(67,66,'Admin','Slidecat','add_post','',1,0,'提交添加','','',0),(68,39,'Admin','Ad','index','',1,1,'网站广告','','',2),(69,68,'Admin','Ad','toggle','',1,0,'广告显示切换','','',0),(70,68,'Admin','Ad','delete','',1,0,'删除广告','','',1000),(71,68,'Admin','Ad','edit','',1,0,'编辑广告','','',1000),(72,71,'Admin','Ad','edit_post','',1,0,'提交编辑','','',0),(73,68,'Admin','Ad','add','',1,0,'添加广告','','',1000),(74,73,'Admin','Ad','add_post','',1,0,'提交添加','','',0),(75,39,'Admin','Link','index','',0,1,'友情链接','','',3),(76,75,'Admin','Link','listorders','',1,0,'友情链接排序','','',0),(77,75,'Admin','Link','toggle','',1,0,'友链显示切换','','',0),(78,75,'Admin','Link','delete','',1,0,'删除友情链接','','',1000),(79,75,'Admin','Link','edit','',1,0,'编辑友情链接','','',1000),(80,79,'Admin','Link','edit_post','',1,0,'提交编辑','','',0),(81,75,'Admin','Link','add','',1,0,'添加友情链接','','',1000),(82,81,'Admin','Link','add_post','',1,0,'提交添加','','',0),(83,39,'Api','Oauthadmin','setting','',1,1,'第三方登陆','leaf','',4),(84,83,'Api','Oauthadmin','setting_post','',1,0,'提交设置','','',0),(85,0,'Admin','Menu','default','',1,1,'菜单管理','list','',20),(86,85,'Admin','Navcat','default1','',1,1,'前台菜单','','',0),(87,86,'Admin','Nav','index','',1,1,'菜单管理','','',0),(88,87,'Admin','Nav','listorders','',1,0,'前台导航排序','','',0),(89,87,'Admin','Nav','delete','',1,0,'删除菜单','','',1000),(90,87,'Admin','Nav','edit','',1,0,'编辑菜单','','',1000),(91,90,'Admin','Nav','edit_post','',1,0,'提交编辑','','',0),(92,87,'Admin','Nav','add','',1,0,'添加菜单','','',1000),(93,92,'Admin','Nav','add_post','',1,0,'提交添加','','',0),(94,86,'Admin','Navcat','index','',1,1,'菜单分类','','',0),(95,94,'Admin','Navcat','delete','',1,0,'删除分类','','',1000),(96,94,'Admin','Navcat','edit','',1,0,'编辑分类','','',1000),(97,96,'Admin','Navcat','edit_post','',1,0,'提交编辑','','',0),(98,94,'Admin','Navcat','add','',1,0,'添加分类','','',1000),(99,98,'Admin','Navcat','add_post','',1,0,'提交添加','','',0),(100,85,'Admin','Menu','index','',1,1,'后台菜单','','',0),(101,100,'Admin','Menu','add','',1,0,'添加菜单','','',0),(102,101,'Admin','Menu','add_post','',1,0,'提交添加','','',0),(103,100,'Admin','Menu','listorders','',1,0,'后台菜单排序','','',0),(104,100,'Admin','Menu','export_menu','',1,0,'菜单备份','','',1000),(105,100,'Admin','Menu','edit','',1,0,'编辑菜单','','',1000),(106,105,'Admin','Menu','edit_post','',1,0,'提交编辑','','',0),(107,100,'Admin','Menu','delete','',1,0,'删除菜单','','',1000),(108,100,'Admin','Menu','lists','',1,0,'所有菜单','','',1000),(109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),(115,109,'Admin','Setting','site','',1,1,'网站信息','','',0),(116,115,'Admin','Setting','site_post','',1,0,'提交修改','','',0),(117,115,'Admin','Route','index','',1,0,'路由列表','','',0),(118,115,'Admin','Route','add','',1,0,'路由添加','','',0),(119,118,'Admin','Route','add_post','',1,0,'路由添加提交','','',0),(120,115,'Admin','Route','edit','',1,0,'路由编辑','','',0),(121,120,'Admin','Route','edit_post','',1,0,'路由编辑提交','','',0),(122,115,'Admin','Route','delete','',1,0,'路由删除','','',0),(123,115,'Admin','Route','ban','',1,0,'路由禁止','','',0),(124,115,'Admin','Route','open','',1,0,'路由启用','','',0),(125,115,'Admin','Route','listorders','',1,0,'路由排序','','',0),(126,109,'Admin','Mailer','default','',1,1,'邮箱配置','','',0),(127,126,'Admin','Mailer','index','',1,1,'SMTP配置','','',0),(128,127,'Admin','Mailer','index_post','',1,0,'提交配置','','',0),(129,126,'Admin','Mailer','active','',1,1,'注册邮件模板','','',0),(130,129,'Admin','Mailer','active_post','',1,0,'提交模板','','',0),(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),(137,133,'User','Oauthadmin','index','',1,1,'第三方用户','leaf','',0),(138,137,'User','Oauthadmin','delete','',1,0,'第三方用户解绑','','',0),(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),(149,139,'Admin','User','index','',1,1,'管理员','','',0),(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),(155,47,'Admin','Plugin','update','',1,0,'插件更新','','',0),(156,109,'Admin','Storage','index','',1,1,'文件存储','','',0),(157,156,'Admin','Storage','setting_post','',1,0,'文件存储设置提交','','',0),(158,54,'Admin','Slide','ban','',1,0,'禁用幻灯片','','',0),(159,54,'Admin','Slide','cancelban','',1,0,'启用幻灯片','','',0),(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),(166,127,'Admin','Mailer','test','',1,0,'测试邮件','','',0),(167,109,'Admin','Setting','upload','',1,1,'上传设置','','',0),(168,167,'Admin','Setting','upload_post','',1,0,'上传设置提交','','',0),(169,7,'Portal','AdminPost','copy','',1,0,'文章批量复制','','',0),(174,100,'Admin','Menu','backup_menu','',1,0,'备份菜单','','',0),(175,100,'Admin','Menu','export_menu_lang','',1,0,'导出后台菜单多语言包','','',0),(176,100,'Admin','Menu','restore_menu','',1,0,'还原菜单','','',0),(177,100,'Admin','Menu','getactions','',1,0,'导入新菜单','','',0),(187,0,'Game','Indexadmin','default','',1,1,'游戏管理','gamepad','手游管理',0),(188,187,'Game','indexadmin','index','',1,1,'游戏管理','','',0),(189,187,'Game','Serveradmin','index','',1,1,'区服管理','','区服管理',0),(190,187,'Game','Cardadmin','index','',1,1,'卡类管理','','卡类',0),(191,187,'Game','Activitiesadmin','index','',1,1,'活动管理','','',0),(192,0,'Website','Indexadmin','default','',1,1,'官网自建','','',0),(193,192,'Website','Indexadmin','index','',1,1,'官网列表','','',0),(194,39,'Admin','Sms','index','',1,1,'短信管理','','',0),(199,0,'Channel','Indexadmin','default','',1,1,'推广管理','user','',0),(200,199,'Channel','Indexadmin','index','',1,1,'推广员管理','user','',0),(201,199,'Channel','Realadmin','index','',1,1,'实时注册','user','',0),(202,199,'Channel','Realadmin','realPay','',1,1,'实时充值','user','',0),(203,39,'Admin','Pay','index','',1,1,'支付设置','','',0),(204,0,'Admin','stat','default','',1,1,'统计管理','tasks','统计',0),(205,204,'Admin','stat','login','',1,1,'用户登录','','统计用户登录',0),(206,204,'Admin','stat','register','',1,1,'用户注册','','统计注册号',0),(207,204,'Admin','stat','recharge','',1,1,'用户充值','','充值',0),(208,204,'Admin','stat','game','',1,1,'游戏充值','','游戏充值',0),(209,204,'Admin','stat','agent','',1,1,'渠道充值','','',0),(210,0,'Pay','Indexadmin','default','',1,1,'支付管理','paypal','',0),(211,210,'Pay','htpayadmin','index','',1,1,'后台充值','','',0),(212,211,'pay','Htpayadmin','add','',1,0,'后台充值','','',0),(213,199,'Channel','Settleadmin','index','',1,1,'结算管理','user','',0),(214,213,'Channel','Settleadmin','settle','',1,0,'结算','','',0),(215,199,'Channel','Splitratioadmin','index','',1,1,'分成比例','user','',0),(216,39,'Admin','Cardtype','index','',1,1,'卡类类型','','',0),(217,216,'Admin','Cardtype','add','',1,0,'卡类类型','','',0),(218,217,'Admin','Cardtype','add_post','',1,0,'卡类添加','','',0),(219,216,'Admin','Cardtype','edit','',1,0,'卡类编辑','','',0),(220,219,'Admin','Cardtype','edit_post','',1,0,'卡类编辑提交','','',0),(221,216,'Admin','Cardtype','delete','',1,0,'卡类删除','','',0),(222,213,'Channel','Settleadmin','look','',1,0,'结算详情','','',0),(223,199,'Channel','Cashadmin','index','',1,1,'提现管理','','',0),(224,223,'Channel','Cashadmin','cashlog','',1,0,'提现记录','','',0),(225,210,'Pay','htpayadmin','cpspay','',1,1,'代充记录','','',0),(226,223,'Channel','Cashadmin','edit','',1,0,'提现汇款','','',0),(227,199,'Channel','Indexadmin','ios','',1,1,'IOS申请','','',0),(228,133,'User','Roleadmin','role','',1,1,'用户角色','leaf','',0),(229,210,'Pay','Indexadmin','ptbPay','',1,1,'平台币充值','','',0),(230,229,'Pay','Indexadmin','ptbedit','',1,0,'平台币查看','','',0),(231,229,'Pay','Indexadmin','ptbdel','',1,0,'平台币删除','','',0),(232,205,'Admin','stat','ajaxdata','',1,0,'获取首页留存','','',0),(233,188,'Game','indexadmin','add','',1,0,'增加游戏','','',0),(234,188,'Game','indexadmin','edit','',1,0,'修改游戏','','',0),(235,188,'Game','indexadmin','getUrl','',1,0,'母包下载地址','','',0),(236,188,'Game','indexadmin','del','',1,0,'删除游戏','','',0),(237,188,'Game','indexadmin','listorders','',1,0,'排序','','',0),(238,188,'Game','indexadmin','toggle','',1,0,'开启关闭','','',0),(239,188,'Game','indexadmin','hot','',1,0,'推荐','','',0),(240,188,'Game','indexadmin','getSever','',1,0,'获取区服','','',0),(241,188,'Game','indexadmin','getqrcode','',1,0,'获取二维码','','',0),(242,188,'Game','indexadmin','qrcode','',1,0,'二维码类','','',0),(243,188,'Game','indexadmin','createKey','',1,0,'申请对接参数','','',0),(244,188,'Game','indexadmin','editCallback','',1,0,'对接参数查看修改','','',0),(245,189,'Game','Serveradmin','add','',1,0,'增加区服','','',0),(246,189,'Game','Serveradmin','getSid','',1,0,'区服管理','','',0),(247,189,'Game','Serveradmin','edit','',1,0,'修改区服','','',0),(248,189,'Game','Serveradmin','del','',1,0,'删除区服','','',0),(249,189,'Game','Serveradmin','toggle','',1,0,'开启关闭','','',0),(250,189,'Game','Serveradmin','hot','',1,0,'推荐不推荐','','',0),(251,190,'Game','Cardadmin','add','',1,0,'增加卡类','','',0),(252,190,'Game','Cardadmin','edit','',1,0,'修改卡类','','',0),(253,190,'Game','Cardadmin','del','',1,0,'删除卡类','','',0),(254,190,'Game','Cardadmin','toggle','',1,0,'开启关闭','','',0),(255,191,'Game','Activitiesadmin','add','',1,0,'增加活动','','',0),(256,191,'Game','Activitiesadmin','edit','',1,0,'修改活动','','',0),(257,191,'Game','Activitiesadmin','del','',1,0,'删除活动','','',0),(258,191,'Game','Activitiesadmin','toggle','',1,0,'开启关闭','','',0),(259,193,'Website','Indexadmin','add','',1,0,'增加官网','','',0),(260,193,'Website','Indexadmin','edit','',1,0,'修改官网','','',0),(261,193,'Website','Indexadmin','del','',1,0,'删除官网','','',0),(262,200,'Channel','Indexadmin','add','',1,0,'增加推广用户','','',0),(263,200,'Channel','Indexadmin','edit','',1,0,'修改推广用户','','',0),(264,200,'Channel','Indexadmin','toggle','',1,0,'开启关闭','','',0),(265,201,'Channel','Realadmin','getChannel','',1,0,'获取专员','','',0),(266,213,'Channel','Settleadmin','qishu','',1,0,'期数','','',0),(267,215,'Channel','Splitratioadmin','edit','',1,0,'修改分成比例','','',0),(268,194,'Admin','Sms','setting_post','',1,0,'短信提交','','',0),(269,204,'Admin','stat','retained','',1,0,'留存','','',0),(270,134,'User','Indexadmin','resetpwd','',1,0,'修改密码','','',0),(271,134,'User','Indexadmin','look','',1,0,'查看','','',0),(272,134,'User','Indexadmin','pay','',1,0,'查看用户充值记录','','',0),(273,134,'User','Indexadmin','log','',1,0,'查看游戏登录记录','','',0);
/*!40000 ALTER TABLE `mini_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_nav`
--

DROP TABLE IF EXISTS `mini_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='前台导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_nav`
--

LOCK TABLES `mini_nav` WRITE;
/*!40000 ALTER TABLE `mini_nav` DISABLE KEYS */;
INSERT INTO `mini_nav` VALUES (3,1,0,'游戏礼包','','/gift','',1,2,'0-3'),(1,1,0,'首页','','/','',1,0,'0-1'),(2,1,0,'客服中心','','/service','',1,5,'0-2'),(4,1,0,'游戏资讯','','/news','',1,4,'0-4'),(5,1,0,'游戏大全','','/game','',1,1,'0-5'),(6,1,0,'充值中心','','/pay','',1,3,'0-6');
/*!40000 ALTER TABLE `mini_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_nav_cat`
--

DROP TABLE IF EXISTS `mini_nav_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_nav_cat`
--

LOCK TABLES `mini_nav_cat` WRITE;
/*!40000 ALTER TABLE `mini_nav_cat` DISABLE KEYS */;
INSERT INTO `mini_nav_cat` VALUES (1,'主导航',1,'主导航');
/*!40000 ALTER TABLE `mini_nav_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_oauth_user`
--

DROP TABLE IF EXISTS `mini_oauth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_oauth_user`
--

LOCK TABLES `mini_oauth_user` WRITE;
/*!40000 ALTER TABLE `mini_oauth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_oauth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_options`
--

DROP TABLE IF EXISTS `mini_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_options`
--

LOCK TABLES `mini_options` WRITE;
/*!40000 ALTER TABLE `mini_options` DISABLE KEYS */;
INSERT INTO `mini_options` VALUES (1,'member_email_active','{\"title\":\"MiniYx\\u90ae\\u4ef6\\u9a8c\\u8bc1\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea <a title=\\\"\\\" href=\\\"http:\\/\\/www.miniyx.com\\\" target=\\\"_target\\\">MINI\\u6e38\\u620f\\u624b\\u6e38\\u4e2d\\u5fc3<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u7ed1\\u5b9a\\u9a8c\\u8bc1\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fMINI\\u6e38\\u620f\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u7684\\u9a8c\\u8bc1\\u7801\\u662f\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp;&nbsp;<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; MINI\\u6e38\\u620f&nbsp;\\u8fd0\\u8425\\u56e2\\u961f.<\\/p>\"}',1),(11,'site_options','{\"site_name\":\"\\u8ff7\\u4f60\\u6e38\\u620f-\\u624b\\u6e38\\u4e2d\\u5fc3\",\"site_host\":\"http:\\/\\/www.miniyx.com\\/\",\"site_admin_url_password\":\"miniyx\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"958732@qq.com\",\"qq\":\"12346\",\"tel\":\"\",\"wxcode\":\"354212\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u8ff7\\u4f60\\u6e38\\u620f-\\u624b\\u6e38\\u4e2d\\u5fc3\",\"site_seo_keywords\":\"\\u70ed\\u95e8\\u624b\\u6e38\",\"site_seo_description\":\"\\u8ff7\\u4f60\\u6e38\\u620f-\\u624b\\u6e38\\u4e2d\\u5fc3\",\"urlmode\":\"2\",\"html_suffix\":\".html\",\"comment_time_interval\":\"60\"}',1),(12,'cmf_settings','{\"banned_usernames\":\"\",\"storage\":{\"type\":\"Aliyun\",\"Aliyun\":{\"AccessKeyId\":\"Bhp8UHtoPBhBGc36\",\"AccessKeySecret\":\"uh77QOEpd1ZS1x0zpt96zkekD1ilvt\",\"Endpoint\":\"http:\\/\\/oss-cn-beijing.aliyuncs.com\",\"Bucket\":\"miniyx\",\"domain\":\"miniyx.oss-cn-beijing.aliyuncs.com\"}}}',1),(13,'cdn_settings','{\"cdn_static_root\":\"\"}',1),(14,'pay','{\"pay\":{\"alipay\":{\"partner\":\"\",\"email\":\"\",\"key\":\"\"},\"yeepay\":{\"partner\":\"\",\"key\":\"\"},\"wxpay\":{\"appid\":\"\",\"key\":\"\",\"mchid\":\"\",\"appsecret\":\"\"},\"shengpay\":{\"partner\":\"353425\",\"key\":\"958732mlcl521lin\"}}}',1);
/*!40000 ALTER TABLE `mini_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_part`
--

DROP TABLE IF EXISTS `mini_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  `roleid` varchar(30) DEFAULT NULL COMMENT '角色id',
  `zoneid` varchar(30) DEFAULT NULL COMMENT '区服id',
  `zonename` varchar(30) DEFAULT NULL COMMENT '区服名称',
  `rolename` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `rolename2` varchar(600) DEFAULT NULL,
  `rolelevel` varchar(30) DEFAULT NULL COMMENT '级别',
  `ext` text COMMENT '其他扩展参数',
  `cdt` int(11) DEFAULT NULL,
  `udt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_part`
--

LOCK TABLES `mini_part` WRITE;
/*!40000 ALTER TABLE `mini_part` DISABLE KEYS */;
INSERT INTO `mini_part` VALUES (1,'d101193725',1,'RloeId11111111111','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"测试时间\":\"1号十一点\",\"b\":{\"a\":{\"b\":\"xxk\"}}}',1488252797,'2017-02-28 03:33:17'),(2,'d608471158',1,'caobawang11','1','wancms','草泥马',NULL,'100','{\"测试时间\":\"1号十一点\",\"b\":{\"a\":{\"b\":\"xxk\"}}}',1488446832,'2017-03-02 09:27:12'),(3,'vhjjj855',1,'caobawang11','1','wancms','草泥马',NULL,'100','{\"测试时间\":\"1号十一点\",\"b\":{\"a\":{\"b\":\"xxk\"}}}',1488778311,'2017-03-06 05:31:51'),(4,'d947272266',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1488854511,'2017-03-07 02:41:51'),(5,'d838079785',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1488871192,'2017-03-07 07:19:52'),(6,'d256326002',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1488875147,'2017-03-07 08:25:47'),(7,'d318692015',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1488875451,'2017-03-07 08:30:51'),(8,'d429353691',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"a\":\"123456\",\"b\":{\"a\":\"21612\"}}',1488943646,'2017-03-08 03:27:26'),(9,'d862771861',1,'caobawang11','1','wancms','草泥马',NULL,'100','{\"b\":{\"a\":{\"b\":\"xxk\"}},\"测试时间\":\"1号十一点\"}',1488963912,'2017-03-08 09:05:12'),(10,'d623574387',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1489386905,'2017-03-13 06:35:05'),(11,'d314968501',1,'RloeId','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"b\":{\"a\":\"21612\"},\"a\":\"123456\"}',1489542744,'2017-03-15 01:52:24'),(12,'d771123957',1,'RloeId11111111111','ServerID','ServerName','RloeName',NULL,'RoleLevel','{\"测试时间\":\"1号十一点\",\"b\":{\"a\":{\"b\":\"xxk\"}}}',1489558381,'2017-03-15 06:13:01');
/*!40000 ALTER TABLE `mini_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_pay`
--

DROP TABLE IF EXISTS `mini_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  `amount` double(10,2) DEFAULT NULL COMMENT '充值订单金额，必须大于零',
  `username` varchar(30) DEFAULT NULL COMMENT '充值用户',
  `roleid` varchar(50) DEFAULT NULL COMMENT '游戏角色id',
  `paytype` varchar(30) DEFAULT NULL COMMENT '充值类型',
  `productname` varchar(100) DEFAULT NULL COMMENT '充值商品名称',
  `productdesc` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `agent` varchar(20) DEFAULT NULL COMMENT '渠道ID',
  `serverid` varchar(30) DEFAULT NULL COMMENT '服务器ID',
  `servername` varchar(45) DEFAULT NULL COMMENT '区服名称',
  `gameid` varchar(30) DEFAULT NULL COMMENT '游戏id',
  `status` smallint(2) DEFAULT '0' COMMENT '充值成功标志，0为待处理，1为成功，2为失败',
  `ip` varchar(30) DEFAULT NULL COMMENT '用户支付时使用的网络终端IP',
  `imeil` varchar(30) DEFAULT NULL COMMENT '手机imeil码',
  `create_time` int(11) DEFAULT NULL COMMENT '充值时间',
  `beizhu` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `total_channel` varchar(50) NOT NULL COMMENT '一级推广',
  `sub_channel` varchar(50) NOT NULL COMMENT '二级推广',
  `os` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0安卓1苹果',
  `settlement` enum('1','2') NOT NULL DEFAULT '2' COMMENT '是否结算（1‘已结算’、2‘未结算‘）',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `createtime` (`create_time`),
  KEY `agent` (`agent`),
  KEY `username` (`username`),
  KEY `gameid` (`gameid`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_pay`
--

LOCK TABLES `mini_pay` WRITE;
/*!40000 ALTER TABLE `mini_pay` DISABLE KEYS */;
INSERT INTO `mini_pay` VALUES (1,'14877531268005971',1.00,'d493033472','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753128,NULL,'1','1','0','2'),(2,'1487753141263595',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753141,NULL,'1','1','1','2'),(3,'O14877531513916',1.00,'d493033472','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753151,NULL,'1','1','0','2'),(4,'14877531623144554',1.00,'d493033472','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753164,NULL,'1','1','0','2'),(5,'O14877531738501',1.00,'qqqqq','1','wx','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753173,NULL,'1','1','1','2'),(6,'14877531860377718',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753186,NULL,'1','1','1','2'),(7,'14877532332941389',1.00,'d493033472','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753235,NULL,'1','1','0','2'),(8,'14877532623759691',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753262,NULL,'1','1','1','2'),(9,'14877534645841224',1.00,'d493033472','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753466,NULL,'1','1','0','2'),(10,'14877534707719982',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753470,NULL,'1','1','1','2'),(11,'14877534939384797',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753494,NULL,'1','1','1','2'),(12,'14877535267323094',1.00,'d493033472','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487753528,NULL,'1','1','0','2'),(13,'14877539312853308',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753931,NULL,'1','1','1','2'),(14,'14877539491217653',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753949,NULL,'1','1','1','2'),(15,'14877539508705771',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487753951,NULL,'1','1','1','2'),(16,'14877540407253126',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487754042,NULL,'1','1','0','2'),(17,'14877541070366801',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487754107,NULL,'1','1','1','2'),(18,'14877545867871553',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487754586,NULL,'1','1','1','2'),(19,'14877557495084256',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487755751,NULL,'1','1','0','2'),(20,'14877557952523170',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487755797,NULL,'1','1','0','2'),(21,'14877559316342748',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487755933,NULL,'1','1','0','2'),(22,'14877559427272057',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487755942,NULL,'1','1','1','2'),(23,'1487755963517397',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487755963,NULL,'1','1','1','2'),(24,'14877559715024815',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487755973,NULL,'1','1','0','2'),(25,'14877561504491064',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756152,NULL,'1','1','0','2'),(26,'14877563593235406',1.00,'d528154873','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756361,NULL,'1','1','0','2'),(27,'14877566507699488',1.00,'d113521333','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756652,NULL,'1','1','0','2'),(28,'14877568413414065',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.21.179','8935F5C8-6C43-4268-BA42-E7E988',1487756841,NULL,'1','1','1','2'),(29,'14877569004052507',1.00,'d546925690','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756902,NULL,'1','1','0','2'),(30,'14877569110679600',1.00,'d546925690','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756912,NULL,'1','1','0','2'),(31,'14877569384054242',1.00,'d546925690','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','867933028666240',1487756940,NULL,'1','1','0','2'),(32,'14877584712925842',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','A0000055E7FC1C',1487758471,NULL,'1','1','0','2'),(33,'14877584858891895',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','A0000055E7FC1C',1487758486,NULL,'1','1','0','2'),(34,'14877585143332173',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.21.179','A0000055E7FC1C',1487758514,NULL,'1','1','0','2'),(35,'14878119690516373',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'115.229.25.125','8935F5C8-6C43-4268-BA42-E7E988',1487811969,NULL,'1','1','1','2'),(36,'O14878208581510',1.00,'d292388057','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487820858,NULL,'1','1','0','2'),(37,'O14878208661355',1.00,'d292388057','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487820866,NULL,'1','1','0','2'),(38,'14878251437638943',1.00,'cao580052','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487825145,NULL,'1','1','0','2'),(39,'O14878251725581',1.00,'cao580052','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487825172,NULL,'1','1','0','2'),(40,'O14878258224968',1.00,'d724273308','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487825822,NULL,'1','1','0','2'),(41,'O14878265228560',1.00,'cao580052','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.25.125','867933028666240',1487826522,NULL,'1','1','0','2'),(42,'14879037518547833',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487903754,NULL,'1','1','0','2'),(43,'14879048294993276',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487904830,NULL,'1','1','0','2'),(44,'14879048648739969',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487904865,NULL,'1','1','0','2'),(45,'14879124710731299',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487912471,NULL,'1','1','0','2'),(46,'14879170077099512',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487917008,NULL,'1','1','0','2'),(47,'14879276177168810',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487927618,NULL,'1','1','0','2'),(48,'14879276402711948',1.00,'d280068238','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487927641,NULL,'1','1','0','2'),(49,'14879277156832146',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'183.140.251.11','8935F5C8-6C43-4268-BA42-E7E988',1487927715,NULL,'1','1','1','2'),(50,'14879277385021608',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',0,'183.140.251.11','8935F5C8-6C43-4268-BA42-E7E988',1487927738,NULL,'1','1','1','2'),(51,'O14879277625990',1.00,'qqqqq','1','wx','gg','hello','test002','1',NULL,'1',0,'183.140.251.11','8935F5C8-6C43-4268-BA42-E7E988',1487927762,NULL,'1','1','1','2'),(52,'14879277828183720',1.00,'qqqqq','1','zfb','gg','hello','test002','1',NULL,'1',1,'183.140.251.11','8935F5C8-6C43-4268-BA42-E7E988',1487927782,'2017022421001004360293944964','1','1','1','1'),(53,'O14879281954758',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928195,NULL,'1','1','0','2'),(54,'O14879283047005',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928304,NULL,'1','1','0','2'),(55,'14879283596133223',1.00,'d663976011','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928360,NULL,'1','1','0','2'),(56,'O14879287723055',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928772,NULL,'1','1','0','2'),(57,'O14879287791384',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928779,NULL,'1','1','0','2'),(58,'O14879287861752',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928786,NULL,'1','1','0','2'),(59,'O14879288305674',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928830,NULL,'1','1','0','2'),(60,'O14879289881994',1.00,'d663976011','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487928988,NULL,'1','1','0','2'),(61,'O14879290118839',0.10,'qqqqq','1','wx','gg','hello','test002','1',NULL,'1',1,'183.140.251.11','8935F5C8-6C43-4268-BA42-E7E988',1487929011,'4005092001201702241153581480','1','1','1','1'),(62,'O14879290501793',1.00,'d127793572','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487929050,NULL,'1','1','0','2'),(63,'O14879292209814',1.00,'d127793572','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487929220,NULL,'1','1','0','2'),(64,'O14879292843864',1.00,'d127793572','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487929284,NULL,'1','1','0','2'),(65,'O14879292897323',1.00,'d127793572','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487929289,NULL,'1','1','0','2'),(66,'14879319172624522',1.00,'d244064708','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487931918,NULL,'1','1','0','2'),(67,'O14879322037917',1.00,'d178313390','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932203,NULL,'1','1','0','2'),(68,'O14879322814077',1.00,'d178313390','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932281,NULL,'1','1','0','2'),(69,'O14879322914479',1.00,'d178313390','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932291,NULL,'1','1','0','2'),(70,'O14879323785227',1.00,'d748879436','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932378,NULL,'1','1','0','2'),(71,'14879325183204457',1.00,'d748879436','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932519,NULL,'1','1','0','2'),(72,'O14879325271715',1.00,'d748879436','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932527,NULL,'1','1','0','2'),(73,'O14879325476142',1.00,'d807043451','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932547,NULL,'1','1','0','2'),(74,'O14879325592868',1.00,'d807043451','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932560,NULL,'1','1','0','2'),(75,'14879325681085805',1.00,'d807043451','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932568,NULL,'1','1','0','2'),(76,'O14879325697667',1.00,'d748879436','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932569,NULL,'1','1','0','2'),(77,'O14879325862383',1.00,'d807043451','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932586,NULL,'1','1','0','2'),(78,'O14879327754450',1.00,'d309129434','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932775,NULL,'1','1','0','2'),(79,'O14879327845488',1.00,'d309129434','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932784,NULL,'1','1','0','2'),(80,'O14879328576768',1.00,'d309129434','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932857,NULL,'1','1','0','2'),(81,'O14879328699680',1.00,'d866994547','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487932869,NULL,'1','1','0','2'),(82,'O14879328692637',1.00,'d309129434','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487932869,NULL,'1','1','0','2'),(83,'O14879330395496',1.00,'d893019497','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','867933028666240',1487933039,NULL,'1','1','0','2'),(84,'O14879331992541',1.00,'d771123957','roleid','wx','魔神','','cps001','1',NULL,'1',0,'113.214.206.144','863410036901582',1487933199,NULL,'1','1','0','2'),(85,'O14879333821106',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487933382,NULL,'1','1','0','2'),(86,'O14879333931893',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487933393,NULL,'1','1','0','2'),(87,'O14879334832857',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487933483,NULL,'1','1','0','2'),(88,'O14879335204853',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.251.11','A0000055E7FC1C',1487933520,NULL,'1','1','0','2'),(89,'O14880850431743',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.50.145','A0000055E7FC1C',1488085043,NULL,'1','1','0','2'),(90,'O14881596441223',1.00,'d519970958','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','860707030366420',1488159644,NULL,'1','1','0','2'),(91,'O14881602613130',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488160261,NULL,'1','1','0','2'),(92,'O14881602794731',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488160279,NULL,'1','1','0','2'),(93,'O14881603231847',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488160323,NULL,'1','1','0','2'),(94,'O14881605816202',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488160581,NULL,'1','1','0','2'),(95,'O14881614167961',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488161416,NULL,'1','1','0','2'),(96,'O14881617384750',1.00,'d426731275','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488161738,NULL,'1','1','0','2'),(97,'O14881636684037',1.00,'d565655636','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','A0000055E7FC1C',1488163668,NULL,'1','1','0','2'),(98,'O14881662797748',1.00,'d253487886','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488166279,NULL,'1','1','0','2'),(99,'O14881663731331',1.00,'d253487886','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','863738023824759',1488166373,NULL,'1','1','0','2'),(100,'O14881665289315',1.00,'d101193725','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','A0000055E7FC1C',1488166528,NULL,'1','1','0','2'),(101,'O14881665895603',1.00,'d101193725','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','A0000055E7FC1C',1488166589,NULL,'1','1','0','2'),(102,'O14881666179647',1.00,'d101193725','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','A0000055E7FC1C',1488166617,NULL,'1','1','0','2'),(103,'O14881719879449',1.00,'d984072401','roleid','wx','魔神','','cps001','1',NULL,'1',0,'112.17.239.216','860707030366420',1488171987,NULL,'1','1','0','2'),(104,'O14881799802079',1.00,'d585551014','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','860707030366420',1488179980,NULL,'1','1','0','2'),(105,'O14881841307186',1.00,'d259062200','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.59.134','860707030366420',1488184130,NULL,'1','1','0','2'),(106,'O14882501554638',1.00,'d820364926','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488250155,NULL,'1','1','0','2'),(107,'14882501905843248',1.00,'d820364926','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488250190,NULL,'1','1','0','2'),(108,'14882502027672147',1.00,'d820364926','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488250202,NULL,'1','1','0','2'),(109,'14882502521854391',1.00,'d820364926','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488250252,NULL,'1','1','0','2'),(110,'14882503625374748',1.00,'d820364926','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488250362,NULL,'1','1','0','2'),(111,'O14882524757367',1.00,'d554553041','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488252475,NULL,'1','1','0','2'),(112,'14882525483041246',1.00,'d101193725','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'180.89.5.127','864394010142216',1488252548,NULL,'1','1','0','2'),(113,'14882525668734703',1.00,'d101193725','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'180.89.5.127','864394010142216',1488252566,NULL,'1','1','0','2'),(114,'14882527780108813',1.00,'d101193725','roleid','zfb','魔神','','cps001','1',NULL,'1',1,'180.89.5.127','868964028917951',1488252778,'2017022821001004210280017077','1','1','0','2'),(115,'O14882532057061',1.00,'d554553041','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488253205,NULL,'1','1','0','2'),(116,'O14882532218090',1.00,'d101193725','roleid','wx','魔神','','cps001','1',NULL,'1',1,'180.89.5.127','868964028917951',1488253221,'4008022001201702281627428791','1','1','0','2'),(117,'O14882680305522',1.00,'qwer1234','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268030,NULL,'1','1','0','2'),(118,'14882680600094316',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268060,NULL,'1','1','0','2'),(119,'14882680623391870',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268062,NULL,'1','1','0','2'),(120,'14882680634963531',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268063,NULL,'1','1','0','2'),(121,'14882680642721579',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268064,NULL,'1','1','0','2'),(122,'14882680650591490',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268065,NULL,'1','1','0','2'),(123,'14882680657729237',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268065,NULL,'1','1','0','2'),(124,'14882680664013187',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268066,NULL,'1','1','0','2'),(125,'14882680669471473',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268066,NULL,'1','1','0','2'),(126,'14882680679343906',1.00,'qwer1234','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268067,NULL,'1','1','0','2'),(127,'O14882689124589',1.00,'d483817505','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488268912,NULL,'1','1','0','2'),(128,'14882690015621314',1.00,'d483817505','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488269002,NULL,'1','1','0','2'),(129,'O14882690154174',1.00,'d483817505','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488269015,NULL,'1','1','0','2'),(130,'14882698527226676',1.00,'d412884831','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488269852,NULL,'1','1','0','2'),(131,'14882699070101157',1.00,'d412884831','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488269907,NULL,'1','1','0','2'),(132,'14882699550139294',1.00,'d412884831','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488269955,NULL,'1','1','0','2'),(133,'14882700944981674',1.00,'d948107956','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270094,NULL,'1','1','0','2'),(134,'14882704222614191',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270422,NULL,'1','1','0','2'),(135,'14882704250337194',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270425,NULL,'1','1','0','2'),(136,'14882704254007014',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270425,NULL,'1','1','0','2'),(137,'14882707620901833',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270762,NULL,'1','1','0','2'),(138,'14882707636811857',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270763,NULL,'1','1','0','2'),(139,'14882707647861492',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270764,NULL,'1','1','0','2'),(140,'14882707651081690',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488270765,NULL,'1','1','0','2'),(141,'14882708046119734',1.00,'d973933597','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488270804,NULL,'1','1','0','2'),(142,'14882708436525860',1.00,'d973933597','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488270843,NULL,'1','1','0','2'),(143,'14882710872365841',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271087,NULL,'1','1','0','2'),(144,'14882710896039874',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271089,NULL,'1','1','0','2'),(145,'14882710899961821',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271090,NULL,'1','1','0','2'),(146,'14882710904151443',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271090,NULL,'1','1','0','2'),(147,'14882710907534577',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271090,NULL,'1','1','0','2'),(148,'14882710910977528',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271091,NULL,'1','1','0','2'),(149,'14882710914129193',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271091,NULL,'1','1','0','2'),(150,'14882710917652373',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271091,NULL,'1','1','0','2'),(151,'14882713267069999',1.00,'d973933597','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','859284662114500',1488271326,NULL,'1','1','0','2'),(152,'14882715228444475',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271522,NULL,'1','1','0','2'),(153,'14882715793786920',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271579,NULL,'1','1','0','2'),(154,'14882716399401201',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271640,NULL,'1','1','0','2'),(155,'14882716973338881',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271697,NULL,'1','1','0','2'),(156,'14882717505782117',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271750,NULL,'1','1','0','2'),(157,'14882718249403721',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271825,NULL,'1','1','0','2'),(158,'14882719906602901',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488271990,NULL,'1','1','0','2'),(159,'14882721176238237',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272117,NULL,'1','1','0','2'),(160,'14882721853637093',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272185,NULL,'1','1','0','2'),(161,'14882729088345411',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272908,NULL,'1','1','0','2'),(162,'14882729105804153',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272910,NULL,'1','1','0','2'),(163,'14882729109342462',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272910,NULL,'1','1','0','2'),(164,'14882729114997890',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272911,NULL,'1','1','0','2'),(165,'14882729116336877',1.00,'d314518319','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488272911,NULL,'1','1','0','2'),(166,'14882738306348756',1.00,'d240726180','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488273830,NULL,'1','1','0','2'),(167,'14882738330202623',1.00,'d240726180','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488273833,NULL,'1','1','0','2'),(168,'14882742443934299',1.00,'d240726180','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.53.203','860707030366420',1488274244,NULL,'1','1','0','2'),(169,'14883381542659381',1.00,'d684694026','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488338154,NULL,'1','1','0','2'),(170,'O14883381824126',1.00,'d684694026','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488338182,NULL,'1','1','0','2'),(171,'14883384456874315',1.00,'d864073304','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488338445,NULL,'1','1','0','2'),(172,'14883384716665068',1.00,'d864073304','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488338472,NULL,'1','1','0','2'),(173,'14883384728944695',1.00,'d864073304','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488338472,NULL,'1','1','0','2'),(174,'14883390476287428',1.00,'d864073304','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488339047,NULL,'1','1','0','2'),(175,'14883391245021648',1.00,'d719096026','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488339124,NULL,'1','1','0','2'),(176,'14883394335891296',1.00,'d561657951','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488339433,NULL,'1','1','0','2'),(177,'14883422271805398',1.00,'d684694026','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488342227,NULL,'1','1','0','2'),(178,'14883446692926079',1.00,'d684694026','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488344669,NULL,'1','1','0','2'),(179,'14883456189541922',1.00,'d317163744','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'112.17.239.216','860707030366420',1488345618,NULL,'1','1','0','2'),(180,'14883465693285826',1.00,'d109340207','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'112.17.239.216','860707030366420',1488346569,NULL,'1','1','0','2'),(181,'14883470559748445',1.00,'d493471458','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'112.17.239.216','860707030366420',1488347056,NULL,'1','1','0','2'),(182,'O14883470821742',1.00,'d493471458','roleid','wx','魔神','','cps001','1',NULL,'1',0,'112.17.239.216','860707030366420',1488347082,NULL,'1','1','0','2'),(183,'O14883473311627',1.00,'d493471458','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488347331,NULL,'1','1','0','2'),(184,'O14883473469337',1.00,'d493471458','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','860707030366420',1488347346,NULL,'1','1','0','2'),(185,'O14883529755268',1.00,'d468942912','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488352975,NULL,'1','1','0','2'),(186,'O14883530643781',1.00,'dhdjdf','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','A0000055E7FC1C',1488353064,NULL,'1','1','0','2'),(187,'14883531705806614',99.00,'d690860419','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'180.89.5.127','864394010142216',1488353174,NULL,'1','1','0','2'),(188,'O14883617325961',1.00,'d529084204','roleid','wx','魔神','','cps001','1',NULL,'1',0,'60.163.85.187','867933028666240',1488361732,NULL,'1','1','0','2'),(189,'O14884187912373',1.00,'d529084204','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488418791,NULL,'1','1','0','2'),(190,'O14884456042245',1.00,'d477001886','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488445604,NULL,'1','1','0','2'),(191,'O14884457072467',1.00,'d693279649','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488445707,NULL,'1','1','0','2'),(192,'14884457134004463',1.00,'d693279649','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488445715,NULL,'1','1','0','2'),(193,'O14884468148935',1.00,'d608471158','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488446814,NULL,'1','1','0','2'),(194,'14884468262403964',1.00,'d608471158','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488446827,NULL,'1','1','0','2'),(195,'O14884469135389',1.00,'d300110989','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','A0000055E7FC1C',1488446913,NULL,'1','1','0','2'),(196,'14884469226074849',1.00,'d300110989','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','A0000055E7FC1C',1488446922,NULL,'1','1','0','2'),(197,'O14884474628525',1.00,'d130379123','roleid','wx','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488447462,NULL,'1','1','0','2'),(198,'14884474723998976',1.00,'d130379123','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'183.140.252.174','867933028666240',1488447473,NULL,'1','1','0','2'),(199,'14884482771169694',1.00,'d355252735','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'118.29.185.230','862891030680143',1488448279,NULL,'1','1','0','2'),(200,'O14884483029113',1.00,'d355252735','roleid','wx','魔神','','cps001','1',NULL,'1',0,'118.29.185.230','862891030680143',1488448302,NULL,'1','1','0','2'),(201,'14884486125194',1.00,'d355252735','roleid','ptb','魔神','金币','cps001','1',NULL,'1',1,'118.29.185.230','862891030680143',1488448612,NULL,'1','1','0','2'),(202,'14885220172053104',1.00,'d981438218','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.229.16.129','867933028666240',1488522018,NULL,'1','1','0','2'),(203,'O14885220267130',1.00,'d981438218','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.16.129','867933028666240',1488522026,NULL,'1','1','0','2'),(204,'O14885221446679',1.00,'d242583978','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.229.16.129','859284662114500',1488522144,NULL,'1','1','0','2'),(205,'O14887634552664',1.00,'d642342743','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488763455,NULL,'1','1','0','2'),(206,'14887703745567128',1.00,'d427099983','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488770375,NULL,'1','1','0','2'),(207,'O14887703836421',1.00,'d427099983','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488770383,NULL,'1','1','0','2'),(208,'O14887743073738',1.00,'magua01','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488774307,NULL,'1','1','1','2'),(209,'O14887778533259',1.00,'d905050782','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488777853,NULL,'1','1','0','2'),(210,'O14887783004098',2525.00,'vhjjj855','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488778300,NULL,'1','1','0','2'),(211,'O14887783835592',1.00,'magua01','角色ID','wx','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488778383,NULL,'1','1','1','2'),(212,'14887803271957629',1.00,'d649055814','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488780327,NULL,'1','1','0','2'),(213,'O14887803739505',1.00,'d649055814','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488780373,NULL,'1','1','0','2'),(214,'14887804055374250',1.00,'d649055814','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488780406,NULL,'1','1','0','2'),(215,'14887804145858727',1.00,'d649055814','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488780415,NULL,'1','1','0','2'),(216,'O14887944608329',1.00,'magua01','角色ID','wx','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488794460,NULL,'1','1','1','2'),(217,'14888516720819196',1.00,'d829273628','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488851672,NULL,'1','1','0','2'),(218,'O14888516864176',1.00,'d829273628','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488851686,NULL,'1','1','0','2'),(219,'O14888551988677',1.00,'d800469331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855198,NULL,'1','1','0','2'),(220,'14888552521227708',1.00,'d800469331','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855252,NULL,'1','1','0','2'),(221,'14888552775354719',1.00,'magua01','角色ID','zfb','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488855277,NULL,'1','1','1','2'),(222,'O14888552886513',1.00,'d800469331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855288,NULL,'1','1','0','2'),(223,'O14888552996982',1.00,'d800469331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855299,NULL,'1','1','0','2'),(224,'O14888557455424',1.00,'d800469331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855745,NULL,'1','1','0','2'),(225,'O14888558906060',1.00,'d800469331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488855890,NULL,'1','1','0','2'),(226,'O14888560185866',1.00,'d885260425','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','859284662114500',1488856018,NULL,'1','1','0','2'),(227,'O14888560324598',1.00,'d885260425','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','859284662114500',1488856032,NULL,'1','1','0','2'),(228,'O14888560581386',1.00,'d885260425','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','859284662114500',1488856058,NULL,'1','1','0','2'),(229,'O14888560638690',1.00,'d885260425','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','859284662114500',1488856063,NULL,'1','1','0','2'),(230,'O14888563193088',1.00,'d458701087','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856319,NULL,'1','1','0','2'),(231,'O14888563286542',1.00,'d458701087','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856328,NULL,'1','1','0','2'),(232,'O14888564632827',1.00,'d259508189','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856463,NULL,'1','1','0','2'),(233,'O14888564851517',1.00,'d259508189','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856485,NULL,'1','1','0','2'),(234,'O14888565376489',1.00,'d259508189','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856537,NULL,'1','1','0','2'),(235,'O14888565997646',1.00,'d259508189','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856599,NULL,'1','1','0','2'),(236,'O14888566139701',1.00,'d259508189','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488856613,NULL,'1','1','0','2'),(237,'14888566136491630',1.00,'d571323836','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488856614,NULL,'1','1','0','2'),(238,'O14888566258709',1.00,'d571323836','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488856625,NULL,'1','1','0','2'),(239,'14888566487443268',1.00,'d571323836','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488856649,NULL,'1','1','0','2'),(240,'O14888566577668',1.00,'d571323836','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488856657,NULL,'1','1','0','2'),(241,'O14888570891598',1.00,'d537965018','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488857089,NULL,'1','1','0','2'),(242,'O14888571607749',1.00,'d537965018','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488857160,NULL,'1','1','0','2'),(243,'O14888573908949',1.00,'d849542558','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488857390,NULL,'1','1','0','2'),(244,'O14888574005173',1.00,'d849542558','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488857400,NULL,'1','1','0','2'),(245,'14888574510879924',1.00,'magua01','角色ID','zfb','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488857451,NULL,'1','1','1','2'),(246,'O14888574997661',1.00,'d849542558','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488857499,NULL,'1','1','0','2'),(247,'O14888575532088',1.00,'magua01','角色ID','wx','产品名称','产品名称','cps001','服务器ID',NULL,'1',1,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488857553,'4005092001201703072520231814','1','1','1','2'),(248,'14888576151262475',1.00,'magua01','角色ID','zfb','产品名称','产品名称','cps001','服务器ID',NULL,'1',1,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488857615,'2017030721001004360210005696','1','1','1','2'),(249,'O14888580702586',1.00,'d436530429','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488858070,NULL,'1','1','0','2'),(250,'O14888582908439',1.00,'d571323836','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858290,NULL,'1','1','0','2'),(251,'O14888583132153',1.00,'d571323836','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858313,NULL,'1','1','0','2'),(252,'O14888586039646',1.00,'d317640396','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858603,NULL,'1','1','0','2'),(253,'O14888586147917',1.00,'d317640396','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858614,NULL,'1','1','0','2'),(254,'O14888586537862',1.00,'d912768632','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488858653,NULL,'1','1','0','2'),(255,'O14888586641472',1.00,'d317640396','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858664,NULL,'1','1','0','2'),(256,'14888586771881622',1.00,'d317640396','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488858677,NULL,'1','1','0','2'),(257,'14888586899214814',1.00,'d912768632','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488858690,NULL,'1','1','0','2'),(258,'O14888643693762',1.00,'chjk456','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864369,NULL,'1','1','0','2'),(259,'O14888643918056',1.00,'chjk456','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864391,NULL,'1','1','0','2'),(260,'14888644161842497',1.00,'chjk456','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864417,NULL,'1','1','0','2'),(261,'O14888644279424',1.00,'chjk456','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864427,NULL,'1','1','0','2'),(262,'O14888644799756',1.00,'chjk456','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864479,NULL,'1','1','0','2'),(263,'O14888646371402',1.00,'chjk456','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864637,NULL,'1','1','0','2'),(264,'O14888648168641',1.00,'d570390654','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864816,NULL,'1','1','0','2'),(265,'O14888648447820',1.00,'d570390654','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864844,NULL,'1','1','0','2'),(266,'O14888649961162',1.00,'d570390654','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488864996,NULL,'1','1','0','2'),(267,'O14888651079892',1.00,'d649174113','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865107,NULL,'1','1','0','2'),(268,'O14888651147428',1.00,'d649174113','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865114,NULL,'1','1','0','2'),(269,'O14888651344946',1.00,'d649174113','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865134,NULL,'1','1','0','2'),(270,'O14888653386363',1.00,'d649174113','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865338,NULL,'1','1','0','2'),(271,'14888653503745805',1.00,'d649174113','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865351,NULL,'1','1','0','2'),(272,'O14888659548660',1.00,'d352891696','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865954,NULL,'1','1','0','2'),(273,'O14888659587156',1.00,'d352891696','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488865958,NULL,'1','1','0','2'),(274,'O14888661373893',1.00,'d800408774','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866137,NULL,'1','1','0','2'),(275,'O14888662452210',1.00,'d590169771','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866245,NULL,'1','1','0','2'),(276,'O14888662525699',1.00,'d590169771','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866252,NULL,'1','1','0','2'),(277,'O14888668076661',1.00,'d335692802','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866807,NULL,'1','1','0','2'),(278,'14888668135207717',1.00,'d335692802','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866814,NULL,'1','1','0','2'),(279,'O14888668242725',1.00,'d335692802','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488866824,NULL,'1','1','0','2'),(280,'O14888668304441',1.00,'d335692802','roleid','wx','魔神','','cps001','1',NULL,'1',1,'115.228.60.176','867933028666240',1488866830,'4003822001201703072537634349','1','1','0','2'),(281,'O14888670921651',1.00,'d163220334','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867092,NULL,'1','1','0','2'),(282,'O14888672526809',1.00,'d227864167','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867252,NULL,'1','1','0','2'),(283,'O14888672589067',1.00,'d227864167','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867258,NULL,'1','1','0','2'),(284,'O14888672729890',1.00,'d227864167','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867272,NULL,'1','1','0','2'),(285,'14888672803866641',1.00,'d227864167','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867281,NULL,'1','1','0','2'),(286,'O14888672861254',1.00,'d227864167','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867286,NULL,'1','1','0','2'),(287,'O14888677073345',1.00,'d616008310','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867707,NULL,'1','1','0','2'),(288,'O14888677163602',1.00,'d616008310','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867716,NULL,'1','1','0','2'),(289,'14888677210806093',1.00,'d616008310','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867722,NULL,'1','1','0','2'),(290,'O14888677383896',1.00,'d616008310','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867738,NULL,'1','1','0','2'),(291,'O14888677497699',1.00,'d616008310','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488867749,NULL,'1','1','0','2'),(292,'O14888682657756',1.00,'d616008310','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488868265,NULL,'1','1','0','2'),(293,'O14888686351686',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488868635,NULL,'1','1','0','2'),(294,'O14888687568774',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488868756,NULL,'1','1','0','2'),(295,'14888689646147567',1.00,'d473504257','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488868965,NULL,'1','1','0','2'),(296,'14888690270881690',1.00,'d473504257','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869028,NULL,'1','1','0','2'),(297,'O14888690364777',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869036,NULL,'1','1','0','2'),(298,'O14888690402889',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869040,NULL,'1','1','0','2'),(299,'O14888690551566',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869055,NULL,'1','1','0','2'),(300,'O14888690688439',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869068,NULL,'1','1','0','2'),(301,'O14888691468528',1.00,'d473504257','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869146,NULL,'1','1','0','2'),(302,'14888691941053350',1.00,'d473504257','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869195,NULL,'1','1','0','2'),(303,'14888692050831939',1.00,'d473504257','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869206,NULL,'1','1','0','2'),(304,'14888692975597088',1.00,'d898898710','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869298,NULL,'1','1','0','2'),(305,'O14888693061133',1.00,'d898898710','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869306,NULL,'1','1','0','2'),(306,'O14888693464525',1.00,'d898898710','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869346,NULL,'1','1','0','2'),(307,'14888693586248844',1.00,'d898898710','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869359,NULL,'1','1','0','2'),(308,'O14888695963949',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869596,NULL,'1','1','0','2'),(309,'O14888696119330',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869611,NULL,'1','1','0','2'),(310,'14888696167177039',1.00,'fghhj455','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869617,NULL,'1','1','0','2'),(311,'O14888696341248',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869634,NULL,'1','1','0','2'),(312,'14888696441362150',1.00,'fghhj455','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869645,NULL,'1','1','0','2'),(313,'O14888697861159',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488869786,NULL,'1','1','0','2'),(314,'14888700519134938',1.00,'d838079785','roleid','zfb','魔神','','cps001','1',NULL,'1',1,'115.228.60.176','A0000055E7FC1C',1488870052,'2017030721001004800238287369','1','1','0','2'),(315,'O14888700989777',1.00,'d838079785','roleid','wx','魔神','','cps001','1',NULL,'1',1,'115.228.60.176','A0000055E7FC1C',1488870098,'4009132001201703072544162375','1','1','0','2'),(316,'14888701609406080',1.00,'d838079785','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488870161,NULL,'1','1','0','2'),(317,'O14888701735745',1.00,'d838079785','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488870173,NULL,'1','1','0','2'),(318,'14888703541235950',1.00,'d838079785','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488870354,NULL,'1','1','0','2'),(319,'O14888703629931',1.00,'d838079785','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488870362,NULL,'1','1','0','2'),(320,'O14888703817738',1.00,'d838079785','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488870381,NULL,'1','1','0','2'),(321,'O14888720887523',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488872088,NULL,'1','1','0','2'),(322,'O14888720918042',1.00,'fghhj455','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488872091,NULL,'1','1','0','2'),(323,'14888750616404789',1.00,'d541904701','roleid','zfb','魔神','','test001','1',NULL,'1',0,'115.228.60.176','A0000055E7FC1C',1488875062,NULL,'4','4','0','2'),(324,'O14889358341945',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488935834,NULL,'1','1','0','2'),(325,'O14889358952591',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488935895,NULL,'1','1','0','2'),(326,'O14889358999320',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488935899,NULL,'1','1','0','2'),(327,'14889374246328048',1.00,'d798755492','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937424,NULL,'1','1','0','2'),(328,'O14889374383568',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937438,NULL,'1','1','0','2'),(329,'O14889374767662',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937476,NULL,'1','1','0','2'),(330,'O14889374956023',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937495,NULL,'1','1','0','2'),(331,'O14889374995615',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937499,NULL,'1','1','0','2'),(332,'O14889375034075',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937503,NULL,'1','1','0','2'),(333,'O14889375043469',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937504,NULL,'1','1','0','2'),(334,'O14889375056469',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937505,NULL,'1','1','0','2'),(335,'O14889375115942',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937511,NULL,'1','1','0','2'),(336,'O14889375139309',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937513,NULL,'1','1','0','2'),(337,'O14889375143668',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937514,NULL,'1','1','0','2'),(338,'O14889375153141',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937515,NULL,'1','1','0','2'),(339,'O14889375162149',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937516,NULL,'1','1','0','2'),(340,'O14889375166947',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937516,NULL,'1','1','0','2'),(341,'O14889375244467',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937524,NULL,'1','1','0','2'),(342,'O14889375256983',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937525,NULL,'1','1','0','2'),(343,'O14889375263357',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937526,NULL,'1','1','0','2'),(344,'O14889375267235',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937526,NULL,'1','1','0','2'),(345,'O14889375288646',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937528,NULL,'1','1','0','2'),(346,'O14889375286192',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937528,NULL,'1','1','0','2'),(347,'O14889375296446',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937529,NULL,'1','1','0','2'),(348,'O14889375308946',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937530,NULL,'1','1','0','2'),(349,'O14889375328439',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937532,NULL,'1','1','0','2'),(350,'O14889375339252',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937533,NULL,'1','1','0','2'),(351,'O14889375344020',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937534,NULL,'1','1','0','2'),(352,'O14889375361508',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488937536,NULL,'1','1','0','2'),(353,'O14889386507010',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488938650,NULL,'1','1','0','2'),(354,'O14889386608796',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488938660,NULL,'1','1','0','2'),(355,'O14889391717395',1.00,'d798755492','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939171,NULL,'1','1','0','2'),(356,'O14889394503242',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939450,NULL,'1','1','0','2'),(357,'O14889394603188',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939460,NULL,'1','1','0','2'),(358,'O14889394688744',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939468,NULL,'1','1','0','2'),(359,'14889394759615906',1.00,'d983944619','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939476,NULL,'1','1','0','2'),(360,'O14889394864995',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939486,NULL,'1','1','0','2'),(361,'O14889395156846',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488939515,NULL,'1','1','0','2'),(362,'O14889400312695',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940031,NULL,'1','1','0','2'),(363,'O14889403126214',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940312,NULL,'1','1','0','2'),(364,'O14889404199006',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940419,NULL,'1','1','0','2'),(365,'O14889405002686',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940500,NULL,'1','1','0','2'),(366,'O14889405103684',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940510,NULL,'1','1','0','2'),(367,'O14889405186921',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940518,NULL,'1','1','0','2'),(368,'O14889405429621',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940542,NULL,'1','1','0','2'),(369,'O14889405928688',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488940592,NULL,'1','1','0','2'),(370,'O14889424653348',1.00,'d983944619','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942465,NULL,'1','1','0','2'),(371,'O14889428421924',1.00,'d526824562','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942842,NULL,'1','1','0','2'),(372,'O14889428525477',1.00,'d526824562','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942852,NULL,'1','1','0','2'),(373,'O14889428603958',1.00,'d526824562','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942860,NULL,'1','1','0','2'),(374,'14889428680775497',1.00,'d526824562','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942868,NULL,'1','1','0','2'),(375,'O14889428767105',1.00,'d526824562','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488942876,NULL,'1','1','0','2'),(376,'O14889435719373',1.00,'d429353691','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943571,NULL,'1','1','0','2'),(377,'O14889435865869',1.00,'d429353691','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943586,NULL,'1','1','0','2'),(378,'O14889435977391',1.00,'d429353691','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943597,NULL,'1','1','0','2'),(379,'O14889436176377',1.00,'d429353691','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943617,NULL,'1','1','0','2'),(380,'14889436557067927',1.00,'d429353691','roleid','zfb','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943655,NULL,'1','1','0','2'),(381,'O14889436615406',1.00,'d429353691','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488943661,NULL,'1','1','0','2'),(382,'O14889440511582',1.00,'d396705194','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488944051,NULL,'1','1','0','2'),(383,'O14889440624206',1.00,'d396705194','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488944062,NULL,'1','1','0','2'),(384,'O14889441598101',1.00,'d884689443','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488944159,NULL,'1','1','0','2'),(385,'O14889441681101',1.00,'d884689443','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488944168,NULL,'1','1','0','2'),(386,'O14889496556496',1.00,'d884689443','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488949655,NULL,'1','1','0','2'),(387,'14889540324905616',1.00,'magua01','角色ID','zfb','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488954032,NULL,'1','1','1','2'),(388,'1488954044256191',1.00,'magua01','角色ID','zfb','产品名称','产品名称','cps001','服务器ID',NULL,'1',1,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488954044,'2017030821001004360211831969','1','1','1','2'),(389,'O14889543602020',1.00,'magua01','角色ID','wx','产品名称','产品名称','cps001','服务器ID',NULL,'1',0,'115.228.60.176','8935F5C8-6C43-4268-BA42-E7E988',1488954360,NULL,'1','1','1','2'),(390,'O14889559095397',1.00,'d789903331','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.60.176','867933028666240',1488955909,NULL,'1','1','0','2'),(391,'O14890523384393',1.00,'dghh455f','roleid','wx','魔神','','cps001','1',NULL,'1',0,'115.228.61.171','867933028666240',1489052338,NULL,'1','1','0','2'),(392,'O14894695843781',1.00,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489469584,'4005092001201703143333403087','1','1','1','2'),(393,'O14894698694994',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489469869,'4005092001201703143332087476','1','1','1','2'),(394,'O14894713292519',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471329,'4005092001201703143334032283','1','1','1','2'),(395,'O14894713765174',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471376,'4005092001201703143336003503','1','1','1','2'),(396,'O14894714124584',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471412,'4005092001201703143334070433','1','1','1','2'),(397,'O14894715152047',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471515,'4005092001201703143338784820','1','1','1','2'),(398,'O14894715757946',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471575,'4005092001201703143337299851','1','1','1','2'),(399,'O14894716398524',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471639,'4005092001201703143334143506','1','1','1','2'),(400,'O14894717486799',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489471748,'4005092001201703143334191502','1','1','1','2'),(401,'O14894722568275',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489472256,'4005092001201703143337517126','1','1','1','2'),(402,'O14894731552100',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489473155,'4005092001201703143339422142','1','1','1','2'),(403,'O14894733965029',0.01,'qqqqq','WanCmsSDK-01','wx','屠龙宝刀','hello','cps001','1',NULL,'1',1,'115.227.8.86','8935F5C8-6C43-4268-BA42-E7E988',1489473396,'4005092001201703143340826284','1','1','1','2'),(404,'14895424016352979',1.00,'d314968501','roleid','zfb','魔神','','kukecps003','1',NULL,'1',1,'118.29.185.230','864394010527408',1489542401,'2017031521001004210202364151','7','12','0','2'),(405,'O14895591009033',1.00,'d785955020','roleid','wx','魔神','','cps001','1',NULL,'1',0,'112.17.244.194','860707030366420',1489559100,NULL,'1','1','0','2'),(406,'O14906915259344',5.00,'d368642361','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691525,NULL,'1','1','0','2'),(407,'O14906915837370',5.00,'d368642361','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691583,NULL,'1','1','0','2'),(408,'O14906915878544',5.00,'d368642361','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691587,NULL,'1','1','0','2'),(409,'O14906915886747',5.00,'d368642361','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691588,NULL,'1','1','0','2'),(410,'O14906916393246',1.00,'d899447348','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691639,NULL,'1','1','0','2'),(411,'14906916441901076',1.00,'d899447348','roleid','zfb','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691644,NULL,'1','1','0','2'),(412,'14906916678152099',1.00,'d899447348','roleid','zfb','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691668,NULL,'1','1','0','2'),(413,'O14906916787262',1.00,'d899447348','roleid','wx','魔神','','cps001','1',NULL,'2',0,'183.140.252.65','859284662114500',1490691678,NULL,'1','1','0','2');
/*!40000 ALTER TABLE `mini_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_pay_fee`
--

DROP TABLE IF EXISTS `mini_pay_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_pay_fee` (
  `name` char(30) NOT NULL COMMENT '充值方式',
  `fee` int(5) NOT NULL COMMENT '充值费率',
  `tag` char(30) NOT NULL COMMENT '充值方式tag',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` smallint(2) NOT NULL COMMENT '是否显示',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(30) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_pay_fee`
--

LOCK TABLES `mini_pay_fee` WRITE;
/*!40000 ALTER TABLE `mini_pay_fee` DISABLE KEYS */;
INSERT INTO `mini_pay_fee` VALUES ('alipay',0,'alipay',75,0,1,'支付宝(余额)'),('wxpay',0,'wxpay',76,0,0,'微信支付(余额)'),('yeepay',100,'yeepay',77,0,0,'网上银行'),('yeepay',100,'UNICOM',78,0,0,'联通充值卡'),('yeepay',100,'TELECOM',79,0,0,'电信充值卡'),('yeepay',100,'SZX',80,0,0,'神州行充值卡'),('yeepay',100,'SNDACARD',81,0,0,'盛大一卡通'),('yeepay',100,'JUNNET',82,0,0,'骏网一卡通'),('yeepay',100,'WANMEI',83,0,0,'完美充值卡'),('yeepay',100,'NETEASE',84,0,0,'网易充值卡'),('tenpay',0,'tenpay',85,0,0,'财付通'),('shengpay',0,'shengpay',86,0,0,'网上银行'),('shengpay',0,'UNICOM',87,0,0,'联通充值卡'),('shengpay',0,'TELECOM',88,0,0,'电信充值卡'),('shengpay',0,'SZX',89,0,0,'神州行充值卡'),('shengpay',0,'SNDACARD',90,0,0,'盛大一卡通'),('shengpay',0,'JUNNET',91,0,0,'骏网一卡通'),('shengpay',0,'WANMEI',92,0,0,'完美充值卡'),('shengpay',0,'NETEASE',93,0,0,'网易充值卡'),('shengpay',100,'WXZF',94,1,0,'微信支付');
/*!40000 ALTER TABLE `mini_pay_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_pay_ptb`
--

DROP TABLE IF EXISTS `mini_pay_ptb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_pay_ptb` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `orderid` varchar(30) NOT NULL COMMENT '订单号',
  `pay_to_account` varchar(30) NOT NULL COMMENT '充值账户',
  `uid` int(9) NOT NULL COMMENT '充值人id',
  `pay_bank` varchar(20) NOT NULL COMMENT '支付银行名称',
  `pay_money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pay_really_money` double(10,2) NOT NULL DEFAULT '0.00',
  `get_coin` int(9) NOT NULL COMMENT '游戏元宝数',
  `pay_ip` varchar(20) NOT NULL COMMENT '充值ip',
  `pay_time` int(12) NOT NULL COMMENT '充值时间',
  `success_time` int(12) NOT NULL COMMENT '充值成功时间',
  `order_status` smallint(2) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='PC端平台币表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_pay_ptb`
--

LOCK TABLES `mini_pay_ptb` WRITE;
/*!40000 ALTER TABLE `mini_pay_ptb` DISABLE KEYS */;
INSERT INTO `mini_pay_ptb` VALUES (3,'H3032953649640d','15157427985',82,'ICBC',5.00,0.00,0,'115.229.16.129',1488529928,1488529928,0,'15157427985(-)游戏充值'),(4,'H3033084875516d','15157427985',82,'WXZF',10.00,0.00,0,'115.229.16.129',1488530854,1488530854,0,'15157427985(-)游戏充值'),(5,'H3033086139436d','15157427985',82,'SNDA',10.00,0.00,0,'115.229.16.129',1488530865,1488530865,0,'15157427985(-)游戏充值'),(6,'H3032893687352d','d242583978',81,'WXZF',10.00,0.00,0,'118.29.185.230',1488531402,1488531402,0,'d242583978(-)游戏充值'),(7,'H3033197121465d','d242583978',81,'WXZF',10.00,10.00,0,'118.29.185.230',1488532010,1488532010,0,'d242583978(-)游戏充值');
/*!40000 ALTER TABLE `mini_pay_ptb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_paycpinfo`
--

DROP TABLE IF EXISTS `mini_paycpinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_paycpinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  `fcallbackurl` varchar(300) DEFAULT NULL COMMENT 'cp的前调接口地址',
  `params` varchar(500) DEFAULT NULL COMMENT '传递给fcallback的参数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` smallint(2) DEFAULT '0' COMMENT '状态，0为未通知，1为已经通知',
  `payflag` smallint(2) DEFAULT '0' COMMENT '充值状态，0为待支付，1为成功，2为失败',
  `update_time` int(11) DEFAULT NULL COMMENT '通知时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '充值设备类型,0安卓,1,IOS',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_paycpinfo`
--

LOCK TABLES `mini_paycpinfo` WRITE;
/*!40000 ALTER TABLE `mini_paycpinfo` DISABLE KEYS */;
INSERT INTO `mini_paycpinfo` VALUES (1,'14877531268005971','http://m.31wan.cn','orderid=14877531268005971&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487753128&attach=&sign=4261536e7e114ee668edf99ecd5b1cda',1487753128,0,0,NULL,0),(2,'1487753141263595','http://m.31wan.cn','orderid=1487753141263595&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753141&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=a522a3927035385c8644ad0fe21995c1',1487753141,0,0,NULL,1),(3,'O14877531513916','http://m.31wan.cn','orderid=O14877531513916&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487753151&attach=&sign=7e86fb8882b98295631ca0d5352b4802',1487753151,0,0,NULL,0),(4,'14877531623144554','http://m.31wan.cn','orderid=14877531623144554&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487753164&attach=&sign=75c081c233fbfc33620623db11c2e4d5',1487753164,0,0,NULL,0),(5,'O14877531738501','http://m.31wan.cn','orderid=O14877531738501&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=wx&amount=1&paytime=1487753173&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=64017e9e67a92e081e698d042d83028e',1487753173,0,0,NULL,1),(6,'14877531860377718','http://m.31wan.cn','orderid=14877531860377718&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753186&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=e2929b17be29c36a25747e7bbe5acf42',1487753186,0,0,NULL,1),(7,'14877532332941389','http://m.31wan.cn','orderid=14877532332941389&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487753235&attach=&sign=63e2893af9202ec7493858c8c7034839',1487753235,0,0,NULL,0),(8,'14877532623759691','http://m.31wan.cn','orderid=14877532623759691&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753262&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=bb1a97e32d7dc5f0e31e24ddcb7b5895',1487753262,0,0,NULL,1),(9,'14877534645841224','http://m.31wan.cn','orderid=14877534645841224&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487753466&attach=&sign=474cf422273ee92914cb60585d0d6ff8',1487753466,0,0,NULL,0),(10,'14877534707719982','http://m.31wan.cn','orderid=14877534707719982&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753470&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=f72c6c01b9c2736b568b4c36ea98cff5',1487753470,0,0,NULL,1),(11,'14877534939384797','http://m.31wan.cn','orderid=14877534939384797&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753494&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=4c6c9b5f2a86c46fed2fdf186355482f',1487753494,0,0,NULL,1),(12,'14877535267323094','http://m.31wan.cn','orderid=14877535267323094&username=d493033472&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487753528&attach=&sign=52147975161516109916672ed579ec4e',1487753528,0,0,NULL,0),(13,'14877539312853308','http://m.31wan.cn','orderid=14877539312853308&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753931&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=0cd9053b8d7cc71f3b5f56c01c3af7a9',1487753931,0,0,NULL,1),(14,'14877539491217653','http://m.31wan.cn','orderid=14877539491217653&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753949&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=02f26135e93aaca6a913467e5dcca31f',1487753949,0,0,NULL,1),(15,'14877539508705771','http://m.31wan.cn','orderid=14877539508705771&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487753951&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=d72043c8ecf36f786b1077ed6c278af1',1487753951,0,0,NULL,1),(16,'14877540407253126','http://m.31wan.cn','orderid=14877540407253126&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487754042&attach=&sign=3f009f1308081198a1a9f774a1320afb',1487754042,0,0,NULL,0),(17,'14877541070366801','http://m.31wan.cn','orderid=14877541070366801&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487754107&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=fdbd98b12f4f5a80d4be29595d34f940',1487754107,0,0,NULL,1),(18,'14877545867871553','http://m.31wan.cn','orderid=14877545867871553&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487754586&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=1ef91cf1cd2ac8df8b0c59691b1217c3',1487754586,0,0,NULL,1),(19,'14877557495084256','http://m.31wan.cn','orderid=14877557495084256&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487755751&attach=&sign=29f2afc1a52349f40c61854fe800f243',1487755751,0,0,NULL,0),(20,'14877557952523170','http://m.31wan.cn','orderid=14877557952523170&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487755797&attach=&sign=2203af27d6948f9667305cf3d22a9844',1487755797,0,0,NULL,0),(21,'14877559316342748','http://m.31wan.cn','orderid=14877559316342748&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487755933&attach=&sign=dbf63309e220e3e094513e3b9b04d129',1487755933,0,0,NULL,0),(22,'14877559427272057','http://m.31wan.cn','orderid=14877559427272057&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487755942&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=d823feb1625c15772d272943d9ff0079',1487755942,0,0,NULL,1),(23,'1487755963517397','http://m.31wan.cn','orderid=1487755963517397&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487755963&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=484a1e5a87d17f7641c4822f262e0b52',1487755963,0,0,NULL,1),(24,'14877559715024815','http://m.31wan.cn','orderid=14877559715024815&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487755973&attach=&sign=a5f75a817a6c417d8a560fec7baf626e',1487755973,0,0,NULL,0),(25,'14877561504491064','http://m.31wan.cn','orderid=14877561504491064&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756152&attach=&sign=e77af9aab957468544acb60fae570082',1487756152,0,0,NULL,0),(26,'14877563593235406','http://m.31wan.cn','orderid=14877563593235406&username=d528154873&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756361&attach=&sign=e89a06d5d8666a900f8fc3d56106cc5c',1487756361,0,0,NULL,0),(27,'14877566507699488','http://m.31wan.cn','orderid=14877566507699488&username=d113521333&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756652&attach=&sign=295048a50d65c8d4dbbdd0072e8e248e',1487756652,0,0,NULL,0),(28,'14877568413414065','http://m.31wan.cn','orderid=14877568413414065&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487756841&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=652bf059fb179eeb51e47e187b5ab45b',1487756841,0,0,NULL,1),(29,'14877569004052507','http://m.31wan.cn','orderid=14877569004052507&username=d546925690&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756902&attach=&sign=23e865cd5f46cb94518bc0dd72910596',1487756902,0,0,NULL,0),(30,'14877569110679600','http://m.31wan.cn','orderid=14877569110679600&username=d546925690&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756912&attach=&sign=1000eff1da199265e65cd3c9737e373e',1487756912,0,0,NULL,0),(31,'14877569384054242','http://m.31wan.cn','orderid=14877569384054242&username=d546925690&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487756940&attach=&sign=6c1e1d853d7f8de7214ed34893efaf34',1487756940,0,0,NULL,0),(32,'14877584712925842','http://m.31wan.cn','orderid=14877584712925842&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487758471&attach=&sign=3b0d11953352962a8c01d790419a97da',1487758471,0,0,NULL,0),(33,'14877584858891895','http://m.31wan.cn','orderid=14877584858891895&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487758486&attach=&sign=4b88e9b94ddf84f510ad0ebe5b50e709',1487758486,0,0,NULL,0),(34,'14877585143332173','http://m.31wan.cn','orderid=14877585143332173&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487758514&attach=&sign=2f829815a7ad5897aec12a6400149138',1487758514,0,0,NULL,0),(35,'14878119690516373','http://m.31wan.cn','orderid=14878119690516373&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487811969&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=a45958b49b781c9559f3361ba83d4c8a',1487811969,0,0,NULL,1),(36,'O14878208581510','http://m.31wan.cn','orderid=O14878208581510&username=d292388057&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487820858&attach=&sign=61db66ea5f8c6f04336b60f5b058c775',1487820858,0,0,NULL,0),(37,'O14878208661355','http://m.31wan.cn','orderid=O14878208661355&username=d292388057&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487820866&attach=&sign=0d31cf1db085703c6e3053a3520cf924',1487820866,0,0,NULL,0),(38,'14878251437638943','http://m.31wan.cn','orderid=14878251437638943&username=cao580052&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487825145&attach=&sign=6ccce29e008b13a8adcd2a2951859338',1487825145,0,0,NULL,0),(39,'O14878251725581','http://m.31wan.cn','orderid=O14878251725581&username=cao580052&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487825172&attach=&sign=d93be3c95594d6fd84db71dd5e8dbb5f',1487825172,0,0,NULL,0),(40,'O14878258224968','http://m.31wan.cn','orderid=O14878258224968&username=d724273308&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487825822&attach=&sign=9f9fbc9d5d97843ee304df04dda52dcf',1487825822,0,0,NULL,0),(41,'O14878265228560','http://m.31wan.cn','orderid=O14878265228560&username=cao580052&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487826522&attach=&sign=2688462ae86a41620f9be382b43e8542',1487826522,0,0,NULL,0),(42,'14879037518547833','http://m.31wan.cn','orderid=14879037518547833&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487903754&attach=&sign=bdc2d3f272c4c437372ae573ef05fdbb',1487903754,0,0,NULL,0),(43,'14879048294993276','http://m.31wan.cn','orderid=14879048294993276&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487904830&attach=&sign=2c67bcdd72423ce49a462911d7717a80',1487904830,0,0,NULL,0),(44,'14879048648739969','http://m.31wan.cn','orderid=14879048648739969&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487904865&attach=&sign=aeec9038c01de1994daab17c46443e8f',1487904865,0,0,NULL,0),(45,'14879124710731299','http://m.31wan.cn','orderid=14879124710731299&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487912471&attach=&sign=95e4c2d76f399e86c94b7f50024e9236',1487912471,0,0,NULL,0),(46,'14879170077099512','http://m.31wan.cn','orderid=14879170077099512&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487917008&attach=&sign=c4434a72e66c8b0ac7cd6925868116ff',1487917008,0,0,NULL,0),(47,'14879276177168810','http://m.31wan.cn','orderid=14879276177168810&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487927618&attach=&sign=34068cd976b4d84f7acb188cb785f249',1487927618,0,0,NULL,0),(48,'14879276402711948','http://m.31wan.cn','orderid=14879276402711948&username=d280068238&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487927641&attach=&sign=229a3f692e35d7e717bfdfdb374b1d08',1487927641,0,0,NULL,0),(49,'14879277156832146','http://m.31wan.cn','orderid=14879277156832146&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487927715&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=35e4a3f82f2ae5f70b5597c346903cbf',1487927715,0,0,NULL,1),(50,'14879277385021608','http://m.31wan.cn','orderid=14879277385021608&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487927738&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=5a397b5089b1a74b8cbf1c9b7c07daf0',1487927738,0,0,NULL,1),(51,'O14879277625990','http://m.31wan.cn','orderid=O14879277625990&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=wx&amount=1&paytime=1487927762&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=7575d0451513eccb36ddacbce35467ef',1487927762,0,0,NULL,1),(52,'14879277828183720','http://m.31wan.cn','orderid=14879277828183720&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=zfb&amount=1&paytime=1487927782&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=84022fa1cb5af9af2d2173282559087e',1487927782,0,0,NULL,1),(53,'O14879281954758','http://m.31wan.cn','orderid=O14879281954758&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928195&attach=&sign=9e2f2743175db494ff04dcbc598dcd27',1487928195,0,0,NULL,0),(54,'O14879283047005','http://m.31wan.cn','orderid=O14879283047005&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928304&attach=&sign=9dc058421cd7141fc64c0fb82f9eff2a',1487928304,0,0,NULL,0),(55,'14879283596133223','http://m.31wan.cn','orderid=14879283596133223&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487928360&attach=&sign=3edabc37e92dcc9eb614443cc79ab15b',1487928360,0,0,NULL,0),(56,'O14879287723055','http://m.31wan.cn','orderid=O14879287723055&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928772&attach=&sign=3491b29a4d82a70b37ecefe2b37a4c27',1487928772,0,0,NULL,0),(57,'O14879287791384','http://m.31wan.cn','orderid=O14879287791384&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928779&attach=&sign=8fdbf7a971181606fc6ff46038baca08',1487928779,0,0,NULL,0),(58,'O14879287861752','http://m.31wan.cn','orderid=O14879287861752&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928786&attach=&sign=66844562a4b623739b740bc5414a49b5',1487928786,0,0,NULL,0),(59,'O14879288305674','http://m.31wan.cn','orderid=O14879288305674&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928830&attach=&sign=4409b56d2dc19f9f4889ae24cdf3326b',1487928830,0,0,NULL,0),(60,'O14879289881994','http://m.31wan.cn','orderid=O14879289881994&username=d663976011&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487928988&attach=&sign=0a06c8df74089048e2336d4741c27cb0',1487928988,0,0,NULL,0),(61,'O14879290118839','http://m.31wan.cn','orderid=O14879290118839&username=qqqqq&gameid=1&roleid=1&serverid=1&paytype=wx&amount=0.1&paytime=1487929011&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=25a7c6a7dc703e51147c20288a99efb4',1487929011,0,1,NULL,1),(62,'O14879290501793','http://m.31wan.cn','orderid=O14879290501793&username=d127793572&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487929050&attach=&sign=57a0c9b137c2304489cafe754689cf70',1487929050,0,0,NULL,0),(63,'O14879292209814','http://m.31wan.cn','orderid=O14879292209814&username=d127793572&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487929220&attach=&sign=11165fe4311e238f56bab07a37df05aa',1487929220,0,0,NULL,0),(64,'O14879292843864','http://m.31wan.cn','orderid=O14879292843864&username=d127793572&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487929284&attach=&sign=de4aab75b1179ee9afe68ff9b9bdf771',1487929284,0,0,NULL,0),(65,'O14879292897323','http://m.31wan.cn','orderid=O14879292897323&username=d127793572&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487929289&attach=&sign=4264e30fcd9ae5a1ce65ad930c8c33d0',1487929289,0,0,NULL,0),(66,'14879319172624522','http://m.31wan.cn','orderid=14879319172624522&username=d244064708&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487931918&attach=&sign=cc0c78501c5579f756414f0ba42c3159',1487931918,0,0,NULL,0),(67,'O14879322037917','http://m.31wan.cn','orderid=O14879322037917&username=d178313390&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932203&attach=&sign=d8e48f9932ad1e08644f41f4f7a4836b',1487932203,0,0,NULL,0),(68,'O14879322814077','http://m.31wan.cn','orderid=O14879322814077&username=d178313390&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932281&attach=&sign=947b6530880062a3117d5407af9e4717',1487932281,0,0,NULL,0),(69,'O14879322914479','http://m.31wan.cn','orderid=O14879322914479&username=d178313390&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932291&attach=&sign=81056b5e154deca7e4c218ee497900ac',1487932291,0,0,NULL,0),(70,'O14879323785227','http://m.31wan.cn','orderid=O14879323785227&username=d748879436&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932378&attach=&sign=40777c9dcc4b34d9d22dc28423d45199',1487932378,0,0,NULL,0),(71,'14879325183204457','http://m.31wan.cn','orderid=14879325183204457&username=d748879436&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487932519&attach=&sign=911b7b6fdde4a6af2bd5e0ee86f411ac',1487932519,0,0,NULL,0),(72,'O14879325271715','http://m.31wan.cn','orderid=O14879325271715&username=d748879436&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932527&attach=&sign=9ed398ba1635cc2603183b8436f6f29c',1487932527,0,0,NULL,0),(73,'O14879325476142','http://m.31wan.cn','orderid=O14879325476142&username=d807043451&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932547&attach=&sign=dc85b649e416cd44764ed6795e7b19b9',1487932547,0,0,NULL,0),(74,'O14879325592868','http://m.31wan.cn','orderid=O14879325592868&username=d807043451&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932560&attach=&sign=14af194d5ed202e9ba87830d2573b67a',1487932560,0,0,NULL,0),(75,'14879325681085805','http://m.31wan.cn','orderid=14879325681085805&username=d807043451&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1487932568&attach=&sign=8840c777a260f4fdf20b1b2a7c536917',1487932568,0,0,NULL,0),(76,'O14879325697667','http://m.31wan.cn','orderid=O14879325697667&username=d748879436&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932569&attach=&sign=bd0d277e8df7af220dd9faf85696c1a5',1487932569,0,0,NULL,0),(77,'O14879325862383','http://m.31wan.cn','orderid=O14879325862383&username=d807043451&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932586&attach=&sign=070826dc71099d02f704b55abc5efdc8',1487932586,0,0,NULL,0),(78,'O14879327754450','http://m.31wan.cn','orderid=O14879327754450&username=d309129434&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932775&attach=&sign=5b80c191a9fbd63cfcc028984f16aa97',1487932775,0,0,NULL,0),(79,'O14879327845488','http://m.31wan.cn','orderid=O14879327845488&username=d309129434&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932784&attach=&sign=df5a325e0b186b4c256456fc21e9ac0c',1487932784,0,0,NULL,0),(80,'O14879328576768','http://m.31wan.cn','orderid=O14879328576768&username=d309129434&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932857&attach=&sign=bd247f36523108c08e9fcc0f5e7eda99',1487932857,0,0,NULL,0),(81,'O14879328699680','http://m.31wan.cn','orderid=O14879328699680&username=d866994547&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932869&attach=&sign=554b23abc79061ec7ec6a6e568346139',1487932869,0,0,NULL,0),(82,'O14879328692637','http://m.31wan.cn','orderid=O14879328692637&username=d309129434&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487932869&attach=&sign=6e2b68de5021099e0d741cc8074f5100',1487932869,0,0,NULL,0),(83,'O14879330395496','http://m.31wan.cn','orderid=O14879330395496&username=d893019497&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933039&attach=&sign=65af7a5b95ecf6c49c3aaf666679532e',1487933039,0,0,NULL,0),(84,'O14879331992541','http://m.31wan.cn','orderid=O14879331992541&username=d771123957&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933199&attach=&sign=ed22dbca9b9571f068f034b171eec7a3',1487933199,0,0,NULL,0),(85,'O14879333821106','http://m.31wan.cn','orderid=O14879333821106&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933382&attach=&sign=d02a557861aa2964bed03b3eaa51bb63',1487933382,0,0,NULL,0),(86,'O14879333931893','http://m.31wan.cn','orderid=O14879333931893&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933393&attach=&sign=3be23b93a8307d4c4491b006f4987d6e',1487933393,0,0,NULL,0),(87,'O14879334832857','http://m.31wan.cn','orderid=O14879334832857&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933483&attach=&sign=21144d412de3f489c9ce746e8192c290',1487933483,0,0,NULL,0),(88,'O14879335204853','http://m.31wan.cn','orderid=O14879335204853&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1487933520&attach=&sign=78e7887e22c43c489b9929e973e0df16',1487933520,0,0,NULL,0),(89,'O14880850431743','http://m.31wan.cn','orderid=O14880850431743&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488085043&attach=&sign=6fa3c9a3b262148e9096352f2a4a2416',1488085043,0,0,NULL,0),(90,'O14881596441223','http://m.31wan.cn','orderid=O14881596441223&username=d519970958&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488159644&attach=&sign=7622464e0c34183e054193689d8cd644',1488159644,0,0,NULL,0),(91,'O14881602613130','http://m.31wan.cn','orderid=O14881602613130&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488160261&attach=&sign=d5c4a1560354785dc897542e73d6c47e',1488160261,0,0,NULL,0),(92,'O14881602794731','http://m.31wan.cn','orderid=O14881602794731&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488160279&attach=&sign=e18ba14dbeb0d7de14161b78d4d014c8',1488160279,0,0,NULL,0),(93,'O14881603231847','http://m.31wan.cn','orderid=O14881603231847&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488160323&attach=&sign=e026f3b2bb8a73d01b4ca8775454d840',1488160323,0,0,NULL,0),(94,'O14881605816202','http://m.31wan.cn','orderid=O14881605816202&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488160581&attach=&sign=bb870fdda6f19c04ca17d22a682db2d1',1488160581,0,0,NULL,0),(95,'O14881614167961','http://m.31wan.cn','orderid=O14881614167961&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488161416&attach=&sign=6ecdb2c89955440ecdca6faee3b124aa',1488161416,0,0,NULL,0),(96,'O14881617384750','http://m.31wan.cn','orderid=O14881617384750&username=d426731275&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488161738&attach=&sign=c241782863aac68015e871099b61756a',1488161738,0,0,NULL,0),(97,'O14881636684037','http://m.31wan.cn','orderid=O14881636684037&username=d565655636&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488163668&attach=&sign=716a88c93b096abedf43344557d7e1d1',1488163668,0,0,NULL,0),(98,'O14881662797748','http://m.31wan.cn','orderid=O14881662797748&username=d253487886&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488166279&attach=&sign=6e587572484fa69c34c2b744f33b0ae3',1488166279,0,0,NULL,0),(99,'O14881663731331','http://m.31wan.cn','orderid=O14881663731331&username=d253487886&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488166373&attach=&sign=05c54cc741bcbd44953be8f77876ef49',1488166373,0,0,NULL,0),(100,'O14881665289315','http://m.31wan.cn','orderid=O14881665289315&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488166528&attach=&sign=2f9e0df36a60e737c67928881c123701',1488166528,0,0,NULL,0),(101,'O14881665895603','http://m.31wan.cn','orderid=O14881665895603&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488166589&attach=&sign=4d725c4ec39d2a952d14a33fc76bcb2f',1488166589,0,0,NULL,0),(102,'O14881666179647','http://m.31wan.cn','orderid=O14881666179647&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488166617&attach=&sign=74d367e09de3ecb4bc90ff495bbac24a',1488166617,0,0,NULL,0),(103,'O14881719879449','http://m.31wan.cn','orderid=O14881719879449&username=d984072401&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488171987&attach=&sign=e97c8a9660fe64b01045ae1f183defab',1488171987,0,0,NULL,0),(104,'O14881799802079','http://m.31wan.cn','orderid=O14881799802079&username=d585551014&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488179980&attach=&sign=ec8ca13b0144c5d22475bba07bb4d8a8',1488179980,0,0,NULL,0),(105,'O14881841307186','http://m.31wan.cn','orderid=O14881841307186&username=d259062200&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488184130&attach=&sign=e3a59c992e847963443d0850be39952d',1488184130,0,0,NULL,0),(106,'O14882501554638','http://m.31wan.cn','orderid=O14882501554638&username=d820364926&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488250155&attach=&sign=90ac1b4db31259e2760e5f30a32d13f7',1488250155,0,0,NULL,0),(107,'14882501905843248','http://m.31wan.cn','orderid=14882501905843248&username=d820364926&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488250190&attach=&sign=2d9c8612c6e7bda4a35208ced7e185a5',1488250190,0,0,NULL,0),(108,'14882502027672147','http://m.31wan.cn','orderid=14882502027672147&username=d820364926&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488250202&attach=&sign=c21633c92f80a917601339838a5b6787',1488250202,0,0,NULL,0),(109,'14882502521854391','http://m.31wan.cn','orderid=14882502521854391&username=d820364926&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488250252&attach=&sign=8a4bfb5bb826298c999618f0bd26d406',1488250252,0,0,NULL,0),(110,'14882503625374748','http://m.31wan.cn','orderid=14882503625374748&username=d820364926&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488250362&attach=&sign=43a04de8d2474503a05274050aff52d9',1488250362,0,0,NULL,0),(111,'O14882524757367','http://m.31wan.cn','orderid=O14882524757367&username=d554553041&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488252475&attach=&sign=6889bfece2b45f436242f5d5c7ac9144',1488252475,0,0,NULL,0),(112,'14882525483041246','http://m.31wan.cn','orderid=14882525483041246&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488252548&attach=&sign=348699bf039a9fd5f488c6c0a80d713d',1488252548,0,0,NULL,0),(113,'14882525668734703','http://m.31wan.cn','orderid=14882525668734703&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488252566&attach=&sign=3386ad6b97bb8e90ec5104ca2e0d45bc',1488252566,0,0,NULL,0),(114,'14882527780108813','http://m.31wan.cn','orderid=14882527780108813&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488252778&attach=&sign=a04f66c1264fc6d0c9c41ccbc557eba7',1488252778,0,0,NULL,0),(115,'O14882532057061','http://m.31wan.cn','orderid=O14882532057061&username=d554553041&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488253205&attach=&sign=5c84019abae0be1ac486f2b97d3d6021',1488253205,0,0,NULL,0),(116,'O14882532218090','http://m.31wan.cn','orderid=O14882532218090&username=d101193725&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488253221&attach=&sign=a950b4bff3567bb92f7e2d6c19d641d7',1488253221,0,1,NULL,0),(117,'O14882680305522','http://m.31wan.cn','orderid=O14882680305522&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488268030&attach=&sign=c26bde96a18b1da5bf56161d0a7c3507',1488268030,0,0,NULL,0),(118,'14882680600094316','http://m.31wan.cn','orderid=14882680600094316&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268060&attach=&sign=831e12aa60671589c8d7ffd404491b45',1488268060,0,0,NULL,0),(119,'14882680623391870','http://m.31wan.cn','orderid=14882680623391870&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268062&attach=&sign=3aaeb0a2de0cd28d3c339245150172f7',1488268062,0,0,NULL,0),(120,'14882680634963531','http://m.31wan.cn','orderid=14882680634963531&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268063&attach=&sign=c1c24a11ff27de541154a7154740dc81',1488268063,0,0,NULL,0),(121,'14882680642721579','http://m.31wan.cn','orderid=14882680642721579&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268064&attach=&sign=d4a11971bb836b41c565b57ceebd35a0',1488268064,0,0,NULL,0),(122,'14882680650591490','http://m.31wan.cn','orderid=14882680650591490&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268065&attach=&sign=c50c53b225461c93b7e2343575a87677',1488268065,0,0,NULL,0),(123,'14882680657729237','http://m.31wan.cn','orderid=14882680657729237&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268065&attach=&sign=3289fe9f2cd57c6c11214b0c7ece6106',1488268065,0,0,NULL,0),(124,'14882680664013187','http://m.31wan.cn','orderid=14882680664013187&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268066&attach=&sign=11d700cb9f64f43ff84e054bb96bcdf4',1488268066,0,0,NULL,0),(125,'14882680669471473','http://m.31wan.cn','orderid=14882680669471473&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268066&attach=&sign=6b30d76a42326d2b6f9014d6458d80f7',1488268066,0,0,NULL,0),(126,'14882680679343906','http://m.31wan.cn','orderid=14882680679343906&username=qwer1234&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488268067&attach=&sign=733cca58ec3be506e4cb8b0dd0a85b2a',1488268067,0,0,NULL,0),(127,'O14882689124589','http://m.31wan.cn','orderid=O14882689124589&username=d483817505&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488268912&attach=&sign=4bdb8b0268e882b07a4c75aed03ae20d',1488268912,0,0,NULL,0),(128,'14882690015621314','http://m.31wan.cn','orderid=14882690015621314&username=d483817505&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488269002&attach=&sign=40f48e76c2a83f645657e2e2cffe29ec',1488269002,0,0,NULL,0),(129,'O14882690154174','http://m.31wan.cn','orderid=O14882690154174&username=d483817505&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488269015&attach=&sign=55934cff0c38387f16e078147a6b5d64',1488269015,0,0,NULL,0),(130,'14882698527226676','http://m.31wan.cn','orderid=14882698527226676&username=d412884831&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488269852&attach=&sign=30ae45b1cecd36c7295f3be381c725ad',1488269852,0,0,NULL,0),(131,'14882699070101157','http://m.31wan.cn','orderid=14882699070101157&username=d412884831&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488269907&attach=&sign=4d6256a79fe39838e0ae97a5bab1008e',1488269907,0,0,NULL,0),(132,'14882699550139294','http://m.31wan.cn','orderid=14882699550139294&username=d412884831&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488269955&attach=&sign=f77899d59fa1e071ceaf5a419213e53d',1488269955,0,0,NULL,0),(133,'14882700944981674','http://m.31wan.cn','orderid=14882700944981674&username=d948107956&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270094&attach=&sign=f7c5130cb3bd544d93db09ddbb47d3d8',1488270094,0,0,NULL,0),(134,'14882704222614191','http://m.31wan.cn','orderid=14882704222614191&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270422&attach=&sign=d38774cffe4f01d08e844baf600ce39a',1488270422,0,0,NULL,0),(135,'14882704250337194','http://m.31wan.cn','orderid=14882704250337194&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270425&attach=&sign=86f8a0c4cba90360e109b0c7b4c0a956',1488270425,0,0,NULL,0),(136,'14882704254007014','http://m.31wan.cn','orderid=14882704254007014&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270425&attach=&sign=766df6a13f161f682075027a2a0ca32b',1488270425,0,0,NULL,0),(137,'14882707620901833','http://m.31wan.cn','orderid=14882707620901833&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270762&attach=&sign=0a4b5eda2f2bdf3a4d8213fdca47e34f',1488270762,0,0,NULL,0),(138,'14882707636811857','http://m.31wan.cn','orderid=14882707636811857&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270763&attach=&sign=613e185b504781c7b30a01b7d873cef3',1488270763,0,0,NULL,0),(139,'14882707647861492','http://m.31wan.cn','orderid=14882707647861492&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270764&attach=&sign=41667e05b84ecddee64be8334f0be6a4',1488270764,0,0,NULL,0),(140,'14882707651081690','http://m.31wan.cn','orderid=14882707651081690&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270765&attach=&sign=e5a85036910e3965e7178f1b7596d4d0',1488270765,0,0,NULL,0),(141,'14882708046119734','http://m.31wan.cn','orderid=14882708046119734&username=d973933597&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270804&attach=&sign=6f2740630652e148557e28b692ecfbee',1488270804,0,0,NULL,0),(142,'14882708436525860','http://m.31wan.cn','orderid=14882708436525860&username=d973933597&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488270843&attach=&sign=089d86ee84daf765685958a8b51bbcb8',1488270843,0,0,NULL,0),(143,'14882710872365841','http://m.31wan.cn','orderid=14882710872365841&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271087&attach=&sign=fc694b794c05cb43304607439d6c8dcf',1488271087,0,0,NULL,0),(144,'14882710896039874','http://m.31wan.cn','orderid=14882710896039874&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271089&attach=&sign=7af0bf20a189a47fba35f482fc43f4e9',1488271089,0,0,NULL,0),(145,'14882710899961821','http://m.31wan.cn','orderid=14882710899961821&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271090&attach=&sign=0db2e757e998ef9adc38b59acea041ee',1488271090,0,0,NULL,0),(146,'14882710904151443','http://m.31wan.cn','orderid=14882710904151443&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271090&attach=&sign=a39e3b16427a7940e352a3deeff174f0',1488271090,0,0,NULL,0),(147,'14882710907534577','http://m.31wan.cn','orderid=14882710907534577&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271090&attach=&sign=34763330c976205bc291c473d1204cc1',1488271090,0,0,NULL,0),(148,'14882710910977528','http://m.31wan.cn','orderid=14882710910977528&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271091&attach=&sign=c768bafa6365ff75caa5cda612ea8fe7',1488271091,0,0,NULL,0),(149,'14882710914129193','http://m.31wan.cn','orderid=14882710914129193&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271091&attach=&sign=6283576662107d07457b5599b2675691',1488271091,0,0,NULL,0),(150,'14882710917652373','http://m.31wan.cn','orderid=14882710917652373&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271091&attach=&sign=c75385f8d2605a26bdea8a619e8adf61',1488271091,0,0,NULL,0),(151,'14882713267069999','http://m.31wan.cn','orderid=14882713267069999&username=d973933597&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271326&attach=&sign=cdf66edc01df4df78440817b4a37ed06',1488271326,0,0,NULL,0),(152,'14882715228444475','http://m.31wan.cn','orderid=14882715228444475&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271522&attach=&sign=21e389733a37a193654ce4892a8cbb8f',1488271522,0,0,NULL,0),(153,'14882715793786920','http://m.31wan.cn','orderid=14882715793786920&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271579&attach=&sign=92b2e825b470d6aa353c2104ed4d1c45',1488271579,0,0,NULL,0),(154,'14882716399401201','http://m.31wan.cn','orderid=14882716399401201&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271640&attach=&sign=9346172d9d21625984c1d28a86b7fcdc',1488271640,0,0,NULL,0),(155,'14882716973338881','http://m.31wan.cn','orderid=14882716973338881&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271697&attach=&sign=09b512fb40e311bd689de55ade818475',1488271697,0,0,NULL,0),(156,'14882717505782117','http://m.31wan.cn','orderid=14882717505782117&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271750&attach=&sign=6fa82916ef26b014c9cb97535f9a7eb0',1488271750,0,0,NULL,0),(157,'14882718249403721','http://m.31wan.cn','orderid=14882718249403721&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271825&attach=&sign=d1846b79597c20dd41eb5a74fdfa8c6f',1488271825,0,0,NULL,0),(158,'14882719906602901','http://m.31wan.cn','orderid=14882719906602901&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488271990&attach=&sign=37fd8beee3f62006dcb6e86cb70c4e30',1488271990,0,0,NULL,0),(159,'14882721176238237','http://m.31wan.cn','orderid=14882721176238237&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272117&attach=&sign=40fd136a786f20105ab721a055779145',1488272117,0,0,NULL,0),(160,'14882721853637093','http://m.31wan.cn','orderid=14882721853637093&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272185&attach=&sign=25d3d2b43eca3d13d62410b6178fc07e',1488272185,0,0,NULL,0),(161,'14882729088345411','http://m.31wan.cn','orderid=14882729088345411&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272908&attach=&sign=1b516e922c5bad273ca67b00f8e94dd9',1488272908,0,0,NULL,0),(162,'14882729105804153','http://m.31wan.cn','orderid=14882729105804153&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272910&attach=&sign=f163c91d2629162a61c91764a8980a54',1488272910,0,0,NULL,0),(163,'14882729109342462','http://m.31wan.cn','orderid=14882729109342462&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272910&attach=&sign=c5dce871069ec6170d5e721252ebf5f5',1488272910,0,0,NULL,0),(164,'14882729114997890','http://m.31wan.cn','orderid=14882729114997890&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272911&attach=&sign=f8f3f2b23166e179dcee4d1280d82a96',1488272911,0,0,NULL,0),(165,'14882729116336877','http://m.31wan.cn','orderid=14882729116336877&username=d314518319&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488272911&attach=&sign=48a3adc4e0ebcaca005118fae7756fda',1488272911,0,0,NULL,0),(166,'14882738306348756','http://m.31wan.cn','orderid=14882738306348756&username=d240726180&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488273830&attach=&sign=7c5a6af813b09ce81873e578274c73a6',1488273830,0,0,NULL,0),(167,'14882738330202623','http://m.31wan.cn','orderid=14882738330202623&username=d240726180&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488273833&attach=&sign=ded9f40723212f09dc0875e15a4ecb6d',1488273833,0,0,NULL,0),(168,'14882742443934299','http://m.31wan.cn','orderid=14882742443934299&username=d240726180&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488274244&attach=&sign=a0836903816602b873d4e723945b940a',1488274244,0,0,NULL,0),(169,'14883381542659381','http://m.31wan.cn','orderid=14883381542659381&username=d684694026&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488338154&attach=&sign=ddfba1b62ecad087e6fa8b1454ad804c',1488338154,0,0,NULL,0),(170,'O14883381824126','http://m.31wan.cn','orderid=O14883381824126&username=d684694026&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488338182&attach=&sign=c6c6fbf35ce9fb31380ad31272c50770',1488338182,0,0,NULL,0),(171,'14883384456874315','http://m.31wan.cn','orderid=14883384456874315&username=d864073304&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488338445&attach=&sign=25112e4a3a8ce886328906764ae52a92',1488338445,0,0,NULL,0),(172,'14883384716665068','http://m.31wan.cn','orderid=14883384716665068&username=d864073304&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488338472&attach=&sign=03243c906d9dce254fcc23c9b9a5c203',1488338472,0,0,NULL,0),(173,'14883384728944695','http://m.31wan.cn','orderid=14883384728944695&username=d864073304&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488338472&attach=&sign=3ef1696a0840a1aee8483fd4b89bb1f6',1488338472,0,0,NULL,0),(174,'14883390476287428','http://m.31wan.cn','orderid=14883390476287428&username=d864073304&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488339047&attach=&sign=72eb01436838c1f37929eb7e8f923125',1488339047,0,0,NULL,0),(175,'14883391245021648','http://m.31wan.cn','orderid=14883391245021648&username=d719096026&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488339124&attach=&sign=27d213a724927e568121138941d2e451',1488339124,0,0,NULL,0),(176,'14883394335891296','http://m.31wan.cn','orderid=14883394335891296&username=d561657951&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488339433&attach=&sign=edf0ea42a63627d02de9dbc423d5deca',1488339433,0,0,NULL,0),(177,'14883422271805398','http://m.31wan.cn','orderid=14883422271805398&username=d684694026&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488342227&attach=&sign=18a7120f7ce1a25c31d6a40f811c7fe3',1488342227,0,0,NULL,0),(178,'14883446692926079','http://m.31wan.cn','orderid=14883446692926079&username=d684694026&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488344669&attach=&sign=f654164a6932b5d8b55f4f03db65d9e1',1488344669,0,0,NULL,0),(179,'14883456189541922','http://m.31wan.cn','orderid=14883456189541922&username=d317163744&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488345618&attach=&sign=eba85cc16d796ae4af65261072fb9c52',1488345618,0,0,NULL,0),(180,'14883465693285826','http://m.31wan.cn','orderid=14883465693285826&username=d109340207&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488346569&attach=&sign=11797b2296baa4cbb3c76501f092c692',1488346569,0,0,NULL,0),(181,'14883470559748445','http://m.31wan.cn','orderid=14883470559748445&username=d493471458&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488347056&attach=&sign=58176e19f609b0ac833d640edc2aa121',1488347056,0,0,NULL,0),(182,'O14883470821742','http://m.31wan.cn','orderid=O14883470821742&username=d493471458&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488347082&attach=&sign=3a0c4993286c078a2fa8e87c823b37fa',1488347082,0,0,NULL,0),(183,'O14883473311627','http://m.31wan.cn','orderid=O14883473311627&username=d493471458&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488347331&attach=&sign=70373709492d358bc709562ab52db9f7',1488347331,0,0,NULL,0),(184,'O14883473469337','http://m.31wan.cn','orderid=O14883473469337&username=d493471458&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488347346&attach=&sign=868baf1737ce1f7893035a5640fe1ac5',1488347346,0,0,NULL,0),(185,'O14883529755268','http://m.31wan.cn','orderid=O14883529755268&username=d468942912&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488352975&attach=&sign=3f8e91cba1f8a16fdb5b78609478401a',1488352975,0,0,NULL,0),(186,'O14883530643781','http://m.31wan.cn','orderid=O14883530643781&username=dhdjdf&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488353064&attach=&sign=86427f052acf9967f7a14d0a804488e0',1488353064,0,0,NULL,0),(187,'14883531705806614','http://m.31wan.cn','orderid=14883531705806614&username=d690860419&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=99&paytime=1488353174&attach=&sign=c8827a4fee6088b279b21e2f56975cc3',1488353174,0,0,NULL,0),(188,'O14883617325961','http://m.31wan.cn','orderid=O14883617325961&username=d529084204&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488361732&attach=&sign=3d24b70cf56d0fd9a11e010bf31156ef',1488361732,0,0,NULL,0),(189,'O14884187912373','http://m.31wan.cn','orderid=O14884187912373&username=d529084204&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488418791&attach=&sign=4c23084660046989ccc41dd32e3dd085',1488418791,0,0,NULL,0),(190,'O14884456042245','http://m.31wan.cn','orderid=O14884456042245&username=d477001886&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488445604&attach=&sign=8ba83629f6171ff6523d72817b2ac36a',1488445604,0,0,NULL,0),(191,'O14884457072467','http://m.31wan.cn','orderid=O14884457072467&username=d693279649&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488445707&attach=&sign=58aedb55cea2c6103c3b2d5f67538c05',1488445707,0,0,NULL,0),(192,'14884457134004463','http://m.31wan.cn','orderid=14884457134004463&username=d693279649&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488445715&attach=&sign=cb1ed709610d3bf155d004f55657feff',1488445715,0,0,NULL,0),(193,'O14884468148935','http://m.31wan.cn','orderid=O14884468148935&username=d608471158&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488446814&attach=&sign=63d71d25d1b6af5b6c3c803de2bb2e65',1488446814,0,0,NULL,0),(194,'14884468262403964','http://m.31wan.cn','orderid=14884468262403964&username=d608471158&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488446827&attach=&sign=8a7489e436845ef48222de12b748e492',1488446827,0,0,NULL,0),(195,'O14884469135389','http://m.31wan.cn','orderid=O14884469135389&username=d300110989&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488446913&attach=&sign=2d8da18dc5397fb792584384ad2bec06',1488446913,0,0,NULL,0),(196,'14884469226074849','http://m.31wan.cn','orderid=14884469226074849&username=d300110989&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488446922&attach=&sign=14fa0b5457ea48adb9a5370354c2cc7b',1488446922,0,0,NULL,0),(197,'O14884474628525','http://m.31wan.cn','orderid=O14884474628525&username=d130379123&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488447462&attach=&sign=13148d281991f5f6d6b8ce1093794126',1488447462,0,0,NULL,0),(198,'14884474723998976','http://m.31wan.cn','orderid=14884474723998976&username=d130379123&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488447473&attach=&sign=aa6927968d08708989d737fe5e3654c1',1488447473,0,0,NULL,0),(199,'14884482771169694','http://m.31wan.cn','orderid=14884482771169694&username=d355252735&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488448279&attach=&sign=a96bda07d5678e642d1a9994e85d556f',1488448279,0,0,NULL,0),(200,'O14884483029113','http://m.31wan.cn','orderid=O14884483029113&username=d355252735&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488448302&attach=&sign=441d7fc0d3263fb64255d89a46eafd42',1488448302,0,0,NULL,0),(201,'14884486125194','http://m.31wan.cn','orderid=14884486125194&username=d355252735&gameid=1&roleid=roleid&serverid=1&paytype=ptb&amount=1&paytime=1488448612&attach=&sign=a979c4cc5009238e4bbbbeb21ed0b800',1488448612,0,1,NULL,0),(202,'14885220172053104','http://m.31wan.cn','orderid=14885220172053104&username=d981438218&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488522018&attach=&sign=4f53b141d74192a45537291dfa2dc56e',1488522018,0,0,NULL,0),(203,'O14885220267130','http://m.31wan.cn','orderid=O14885220267130&username=d981438218&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488522026&attach=&sign=f0858a7b2af3398d80743a7121243cf0',1488522026,0,0,NULL,0),(204,'O14885221446679','http://m.31wan.cn','orderid=O14885221446679&username=d242583978&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488522144&attach=&sign=a1529a1e1c50f6da2df12896cc975e86',1488522144,0,0,NULL,0),(205,'O14887634552664','http://m.31wan.cn','orderid=O14887634552664&username=d642342743&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488763455&attach=&sign=e145e79d6785c8ef2d1d2fda0415ae34',1488763455,0,0,NULL,0),(206,'14887703745567128','http://m.31wan.cn','orderid=14887703745567128&username=d427099983&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488770375&attach=%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=1b79f32c75b56a6dbbbe1f8e8aabcbcb',1488770375,0,0,NULL,0),(207,'O14887703836421','http://m.31wan.cn','orderid=O14887703836421&username=d427099983&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488770383&attach=%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=c1d4a90bbf8b07de78b8003d795c123a',1488770383,0,0,NULL,0),(208,'O14887743073738','http://m.31wan.cn','orderid=O14887743073738&username=magua01&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=1&paytime=1488774307&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=1ee56f1fe71839e9cd5f3aa25c4fe8a5',1488774307,0,0,NULL,1),(209,'O14887778533259','http://m.31wan.cn','orderid=O14887778533259&username=d905050782&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488777853&attach=&sign=0961147e36dee7616260f00e284cc3e8',1488777853,0,0,NULL,0),(210,'O14887783004098','http://m.31wan.cn','orderid=O14887783004098&username=vhjjj855&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=2525&paytime=1488778300&attach=&sign=63827eaf165af043c41fe882b578d808',1488778300,0,0,NULL,0),(211,'O14887783835592','http://m.31wan.cn','orderid=O14887783835592&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=wx&amount=1&paytime=1488778383&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=14accabb7a80dc7568b506270e09f59b',1488778383,0,0,NULL,1),(212,'14887803271957629','http://m.31wan.cn','orderid=14887803271957629&username=d649055814&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488780327&attach=&sign=50f57185973df6678fd1bb7285d69548',1488780327,0,0,NULL,0),(213,'O14887803739505','http://m.31wan.cn','orderid=O14887803739505&username=d649055814&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488780373&attach=&sign=1644340e3715f5447133845af5729419',1488780373,0,0,NULL,0),(214,'14887804055374250','http://m.31wan.cn','orderid=14887804055374250&username=d649055814&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488780406&attach=&sign=880d41afb97646c7e17eeeefb19ccc1e',1488780406,0,0,NULL,0),(215,'14887804145858727','http://m.31wan.cn','orderid=14887804145858727&username=d649055814&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488780415&attach=&sign=b817b0c03d6c036d7b85084840872025',1488780415,0,0,NULL,0),(216,'O14887944608329','http://m.31wan.cn','orderid=O14887944608329&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=wx&amount=1&paytime=1488794460&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=db54f060fee8463293e63befe2f92740',1488794460,0,0,NULL,1),(217,'14888516720819196','http://m.31wan.cn','orderid=14888516720819196&username=d829273628&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488851672&attach=&sign=755e42d3e0a00d703a7754a0c0695771',1488851672,0,0,NULL,0),(218,'O14888516864176','http://m.31wan.cn','orderid=O14888516864176&username=d829273628&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488851686&attach=&sign=2cf4068e96f93e98bcb755f4c908c2b6',1488851686,0,0,NULL,0),(219,'O14888551988677','http://m.31wan.cn','orderid=O14888551988677&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488855198&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=80c3b4285cff7e8eaa47bbfef6d4931e',1488855198,0,0,NULL,0),(220,'14888552521227708','http://m.31wan.cn','orderid=14888552521227708&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488855252&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=01e8fe7bd97aa7653f7c3598a8a11e37',1488855252,0,0,NULL,0),(221,'14888552775354719','http://m.31wan.cn','orderid=14888552775354719&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=zfb&amount=1&paytime=1488855277&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=340bfa7188bd530005154b4128bbc219',1488855277,0,0,NULL,1),(222,'O14888552886513','http://m.31wan.cn','orderid=O14888552886513&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488855288&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=8900bf6ca10efbc33797b42df2454768',1488855288,0,0,NULL,0),(223,'O14888552996982','http://m.31wan.cn','orderid=O14888552996982&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488855299&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=51e30b406d3dee5b7ec7a0172bb39760',1488855299,0,0,NULL,0),(224,'O14888557455424','http://m.31wan.cn','orderid=O14888557455424&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488855745&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=2f6cb84cbcde732dd0b070e788c1b88a',1488855745,0,0,NULL,0),(225,'O14888558906060','http://m.31wan.cn','orderid=O14888558906060&username=d800469331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488855890&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=86be65314ef09bba4d82a0ccdbcc701d',1488855890,0,0,NULL,0),(226,'O14888560185866','http://m.31wan.cn','orderid=O14888560185866&username=d885260425&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856018&attach=&sign=f2792c54cc085da81b17f51844508760',1488856018,0,0,NULL,0),(227,'O14888560324598','http://m.31wan.cn','orderid=O14888560324598&username=d885260425&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856032&attach=&sign=af13de5dada514f4483079d8210d5f7b',1488856032,0,0,NULL,0),(228,'O14888560581386','http://m.31wan.cn','orderid=O14888560581386&username=d885260425&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856058&attach=&sign=9580105fa5641a243a645367edf0ad15',1488856058,0,0,NULL,0),(229,'O14888560638690','http://m.31wan.cn','orderid=O14888560638690&username=d885260425&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856063&attach=&sign=b1d14bc789c2ccbb7dcd82cbbc7b2b17',1488856063,0,0,NULL,0),(230,'O14888563193088','http://m.31wan.cn','orderid=O14888563193088&username=d458701087&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856319&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7171776c08bc381ecfecd50e7898b9e6',1488856319,0,0,NULL,0),(231,'O14888563286542','http://m.31wan.cn','orderid=O14888563286542&username=d458701087&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856328&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f38378b5e70c775a8294a5594c33eddc',1488856328,0,0,NULL,0),(232,'O14888564632827','http://m.31wan.cn','orderid=O14888564632827&username=d259508189&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856463&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=6265e1ea12e47972cc0d5bd3d4ef5a54',1488856463,0,0,NULL,0),(233,'O14888564851517','http://m.31wan.cn','orderid=O14888564851517&username=d259508189&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856485&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=e3dde67f2b748a6c92f588a528cf046d',1488856485,0,0,NULL,0),(234,'O14888565376489','http://m.31wan.cn','orderid=O14888565376489&username=d259508189&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856537&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=bb368b3a79b2c1f75891d84a379b00f5',1488856537,0,0,NULL,0),(235,'O14888565997646','http://m.31wan.cn','orderid=O14888565997646&username=d259508189&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856599&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=a03ca6d78c6b188a18bb7d762605d8aa',1488856599,0,0,NULL,0),(236,'O14888566139701','http://m.31wan.cn','orderid=O14888566139701&username=d259508189&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856613&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f22e93a660580198eec2c4950e867e7f',1488856613,0,0,NULL,0),(237,'14888566136491630','http://m.31wan.cn','orderid=14888566136491630&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488856614&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c0e2b2e44ec24e4ce4fcbc40c53a205d',1488856614,0,0,NULL,0),(238,'O14888566258709','http://m.31wan.cn','orderid=O14888566258709&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856625&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=3c672f715ec01067ba485148063a6886',1488856625,0,0,NULL,0),(239,'14888566487443268','http://m.31wan.cn','orderid=14888566487443268&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488856649&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=36726a352b567c87a7e3f004be0ffe9d',1488856649,0,0,NULL,0),(240,'O14888566577668','http://m.31wan.cn','orderid=O14888566577668&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488856657&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=fddb4d597a2289c86c7ef3cfd73ba00f',1488856657,0,0,NULL,0),(241,'O14888570891598','http://m.31wan.cn','orderid=O14888570891598&username=d537965018&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488857089&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c675f53d004c63330cda148d0f0b14ab',1488857089,0,0,NULL,0),(242,'O14888571607749','http://m.31wan.cn','orderid=O14888571607749&username=d537965018&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488857160&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=cff92ffbff8d301da781dc8898b99e06',1488857160,0,0,NULL,0),(243,'O14888573908949','http://m.31wan.cn','orderid=O14888573908949&username=d849542558&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488857390&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d2825ac71ed9562934d090b25add5f69',1488857390,0,0,NULL,0),(244,'O14888574005173','http://m.31wan.cn','orderid=O14888574005173&username=d849542558&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488857400&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=2acd00c2d819446db493b4e0644f2cb9',1488857400,0,0,NULL,0),(245,'14888574510879924','http://m.31wan.cn','orderid=14888574510879924&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=zfb&amount=1&paytime=1488857451&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=6858249f70ed66aba1abf072aa814701',1488857451,0,0,NULL,1),(246,'O14888574997661','http://m.31wan.cn','orderid=O14888574997661&username=d849542558&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488857499&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=42aabb37255034418bd2720d762f530b',1488857499,0,0,NULL,0),(247,'O14888575532088','http://m.31wan.cn','orderid=O14888575532088&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=wx&amount=1&paytime=1488857553&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=cd3e547ff02b65b69d0563451cc5b0da',1488857553,0,1,NULL,1),(248,'14888576151262475','http://m.31wan.cn','orderid=14888576151262475&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=zfb&amount=1&paytime=1488857615&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=351d3df8d0691dc722913d7be02b8eed',1488857615,0,0,NULL,1),(249,'O14888580702586','http://m.31wan.cn','orderid=O14888580702586&username=d436530429&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858070&attach=&sign=1c0ea3d3a18d23c584387c45e86d8e2f',1488858070,0,0,NULL,0),(250,'O14888582908439','http://m.31wan.cn','orderid=O14888582908439&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858290&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f43a555b65e55e95a0dca076ca1a4712',1488858290,0,0,NULL,0),(251,'O14888583132153','http://m.31wan.cn','orderid=O14888583132153&username=d571323836&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858313&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=37e4915b6ab284360387848eba8f1a3b',1488858313,0,0,NULL,0),(252,'O14888586039646','http://m.31wan.cn','orderid=O14888586039646&username=d317640396&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858603&attach=&sign=7c52cbe4863c96ec660914d0c1e8e52c',1488858603,0,0,NULL,0),(253,'O14888586147917','http://m.31wan.cn','orderid=O14888586147917&username=d317640396&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858614&attach=&sign=670c1d2f1bdcf14ce211778dec7c5ec1',1488858614,0,0,NULL,0),(254,'O14888586537862','http://m.31wan.cn','orderid=O14888586537862&username=d912768632&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858653&attach=&sign=1b7036c02c5aacf1c84eba09e6b06512',1488858653,0,0,NULL,0),(255,'O14888586641472','http://m.31wan.cn','orderid=O14888586641472&username=d317640396&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488858664&attach=&sign=89ddc549076c17832abcfd94cad8337f',1488858664,0,0,NULL,0),(256,'14888586771881622','http://m.31wan.cn','orderid=14888586771881622&username=d317640396&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488858677&attach=&sign=32fa0878b437022843dd5aec334d5f47',1488858677,0,0,NULL,0),(257,'14888586899214814','http://m.31wan.cn','orderid=14888586899214814&username=d912768632&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488858690&attach=&sign=6970709389d364c386e5e8ab00262650',1488858690,0,0,NULL,0),(258,'O14888643693762','http://m.31wan.cn','orderid=O14888643693762&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864369&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d544ede326ef7c6ced954ae10d39beee',1488864369,0,0,NULL,0),(259,'O14888643918056','http://m.31wan.cn','orderid=O14888643918056&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864391&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=63842a385c52feb716ce7e6e96406080',1488864391,0,0,NULL,0),(260,'14888644161842497','http://m.31wan.cn','orderid=14888644161842497&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488864417&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=3ad8553e961b043e2325c1ccb91368ba',1488864417,0,0,NULL,0),(261,'O14888644279424','http://m.31wan.cn','orderid=O14888644279424&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864427&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c6800f3d297c135ee0b174a58093bb38',1488864427,0,0,NULL,0),(262,'O14888644799756','http://m.31wan.cn','orderid=O14888644799756&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864479&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=4c80f1712d7b547efa450b39525c4348',1488864479,0,0,NULL,0),(263,'O14888646371402','http://m.31wan.cn','orderid=O14888646371402&username=chjk456&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864637&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=b655dd5df52ffd6987d2494ae6b3cee9',1488864637,0,0,NULL,0),(264,'O14888648168641','http://m.31wan.cn','orderid=O14888648168641&username=d570390654&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864816&attach=&sign=e9bf2ad258206722625b94c2613b9cc1',1488864816,0,0,NULL,0),(265,'O14888648447820','http://m.31wan.cn','orderid=O14888648447820&username=d570390654&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864844&attach=&sign=0eaf0023f02ff02f09d706080080ec18',1488864844,0,0,NULL,0),(266,'O14888649961162','http://m.31wan.cn','orderid=O14888649961162&username=d570390654&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488864996&attach=&sign=75ee86183d26c762e3d0bc3c204259d6',1488864996,0,0,NULL,0),(267,'O14888651079892','http://m.31wan.cn','orderid=O14888651079892&username=d649174113&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865107&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=a03c6fc66f659764ef89efa99d8dbf27',1488865107,0,0,NULL,0),(268,'O14888651147428','http://m.31wan.cn','orderid=O14888651147428&username=d649174113&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865114&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=b09f4737fda54d687114d60f8b337623',1488865114,0,0,NULL,0),(269,'O14888651344946','http://m.31wan.cn','orderid=O14888651344946&username=d649174113&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865134&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=61d6a59cbbe1c150ed7caae5d7d0ec98',1488865134,0,0,NULL,0),(270,'O14888653386363','http://m.31wan.cn','orderid=O14888653386363&username=d649174113&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865338&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=55c363615da2e9e700b8d7e4b3fb4368',1488865338,0,0,NULL,0),(271,'14888653503745805','http://m.31wan.cn','orderid=14888653503745805&username=d649174113&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488865351&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f2ee09a9e0b2d523f6604b7699ceedbf',1488865351,0,0,NULL,0),(272,'O14888659548660','http://m.31wan.cn','orderid=O14888659548660&username=d352891696&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865954&attach=&sign=6434b29648bd87c955ff161f72cc245c',1488865954,0,0,NULL,0),(273,'O14888659587156','http://m.31wan.cn','orderid=O14888659587156&username=d352891696&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488865958&attach=&sign=df025d5b73ba838419a14781e4efb0e3',1488865958,0,0,NULL,0),(274,'O14888661373893','http://m.31wan.cn','orderid=O14888661373893&username=d800408774&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866137&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=cad3b342cd45a189fa2c6d21402b17d4',1488866137,0,0,NULL,0),(275,'O14888662452210','http://m.31wan.cn','orderid=O14888662452210&username=d590169771&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866245&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=607e9928e0968a779fce1d6ff026af49',1488866245,0,0,NULL,0),(276,'O14888662525699','http://m.31wan.cn','orderid=O14888662525699&username=d590169771&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866252&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=710f45a48b4239a6577373cc576cc1ca',1488866252,0,0,NULL,0),(277,'O14888668076661','http://m.31wan.cn','orderid=O14888668076661&username=d335692802&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866807&attach=&sign=4572fa6d2ccb732c5086a78804d148cf',1488866807,0,0,NULL,0),(278,'14888668135207717','http://m.31wan.cn','orderid=14888668135207717&username=d335692802&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488866814&attach=&sign=34307eb11b1987481b7ab1c5e897adc8',1488866814,0,0,NULL,0),(279,'O14888668242725','http://m.31wan.cn','orderid=O14888668242725&username=d335692802&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866824&attach=&sign=74a213a32913f3d4af5ae0abf29a6279',1488866824,0,0,NULL,0),(280,'O14888668304441','http://m.31wan.cn','orderid=O14888668304441&username=d335692802&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488866830&attach=&sign=9e87bd59f9392f978f1835217a2d76bc',1488866830,0,1,NULL,0),(281,'O14888670921651','http://m.31wan.cn','orderid=O14888670921651&username=d163220334&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867092&attach=&sign=256eacb2e5961deecb540384061861bf',1488867092,0,0,NULL,0),(282,'O14888672526809','http://m.31wan.cn','orderid=O14888672526809&username=d227864167&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867252&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=907559d4fb3d5e77347da0994a780c30',1488867252,0,0,NULL,0),(283,'O14888672589067','http://m.31wan.cn','orderid=O14888672589067&username=d227864167&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867258&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=4e3268eab138cabee234812198de783f',1488867258,0,0,NULL,0),(284,'O14888672729890','http://m.31wan.cn','orderid=O14888672729890&username=d227864167&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867272&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=dbd5152acc2842cd5384c127c2c4617c',1488867272,0,0,NULL,0),(285,'14888672803866641','http://m.31wan.cn','orderid=14888672803866641&username=d227864167&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488867281&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=b2e49e62da093c28f863497dbdfe0c46',1488867281,0,0,NULL,0),(286,'O14888672861254','http://m.31wan.cn','orderid=O14888672861254&username=d227864167&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867286&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=cfcd06093ce3c9fafabd4843ca2b9444',1488867286,0,0,NULL,0),(287,'O14888677073345','http://m.31wan.cn','orderid=O14888677073345&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867707&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=309ffeecd6944e2ec68b0aa761f12f28',1488867707,0,0,NULL,0),(288,'O14888677163602','http://m.31wan.cn','orderid=O14888677163602&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867716&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f2c78273713fcf65f7c4b7e1f2d6b11a',1488867716,0,0,NULL,0),(289,'14888677210806093','http://m.31wan.cn','orderid=14888677210806093&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488867722&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=78b5402904625e4acae743d7ce7b822b',1488867722,0,0,NULL,0),(290,'O14888677383896','http://m.31wan.cn','orderid=O14888677383896&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867738&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=3396452d800839f78104cecfb457a769',1488867738,0,0,NULL,0),(291,'O14888677497699','http://m.31wan.cn','orderid=O14888677497699&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488867749&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=1e7cb3cd927163cf96a0fb26e04e062e',1488867749,0,0,NULL,0),(292,'O14888682657756','http://m.31wan.cn','orderid=O14888682657756&username=d616008310&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488868265&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c3e9f5647a5c9fe7b82c605188c0dd59',1488868265,0,0,NULL,0),(293,'O14888686351686','http://m.31wan.cn','orderid=O14888686351686&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488868635&attach=&sign=4ddfcef3b3baf3a711e6f8567108a3b4',1488868635,0,0,NULL,0),(294,'O14888687568774','http://m.31wan.cn','orderid=O14888687568774&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488868756&attach=&sign=6a46e0e951b2a623fa8eba491bc547fa',1488868756,0,0,NULL,0),(295,'14888689646147567','http://m.31wan.cn','orderid=14888689646147567&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488868965&attach=&sign=c873556af392e7a9588247fa741d2151',1488868965,0,0,NULL,0),(296,'14888690270881690','http://m.31wan.cn','orderid=14888690270881690&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869028&attach=&sign=95a9f4145c50729c4200368a1290612b',1488869028,0,0,NULL,0),(297,'O14888690364777','http://m.31wan.cn','orderid=O14888690364777&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869036&attach=&sign=06e8147c96359f6bd53f4b3b4b612374',1488869036,0,0,NULL,0),(298,'O14888690402889','http://m.31wan.cn','orderid=O14888690402889&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869040&attach=&sign=2f6e6e37ac949f789c512908257aac29',1488869040,0,0,NULL,0),(299,'O14888690551566','http://m.31wan.cn','orderid=O14888690551566&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869055&attach=&sign=9e5c9797c553d283c3ffee2aeaa4ea8a',1488869055,0,0,NULL,0),(300,'O14888690688439','http://m.31wan.cn','orderid=O14888690688439&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869068&attach=&sign=1efa35a063547ae33bda856b42bd283c',1488869068,0,0,NULL,0),(301,'O14888691468528','http://m.31wan.cn','orderid=O14888691468528&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869146&attach=&sign=f09f3b43c44cad10af4f5eb358b6f214',1488869146,0,0,NULL,0),(302,'14888691941053350','http://m.31wan.cn','orderid=14888691941053350&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869195&attach=&sign=1f3262099fd52b793e4c3085d28b9e50',1488869195,0,0,NULL,0),(303,'14888692050831939','http://m.31wan.cn','orderid=14888692050831939&username=d473504257&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869206&attach=&sign=a62d674081d06e170404e1ca6e847db9',1488869206,0,0,NULL,0),(304,'14888692975597088','http://m.31wan.cn','orderid=14888692975597088&username=d898898710&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869298&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=3b6ad664700864afa8fcb0b415d3d593',1488869298,0,0,NULL,0),(305,'O14888693061133','http://m.31wan.cn','orderid=O14888693061133&username=d898898710&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869306&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=aceb5ff4bdf9429d716e692dcde33e35',1488869306,0,0,NULL,0),(306,'O14888693464525','http://m.31wan.cn','orderid=O14888693464525&username=d898898710&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869346&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=36d7d2fdf867a9334b2324e5f7c4db42',1488869346,0,0,NULL,0),(307,'14888693586248844','http://m.31wan.cn','orderid=14888693586248844&username=d898898710&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869359&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=067c91e574f50bd57e9c11d7ab96fe50',1488869359,0,0,NULL,0),(308,'O14888695963949','http://m.31wan.cn','orderid=O14888695963949&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869596&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=ea595fbba85dc2a9e775cf5c24f45a6d',1488869596,0,0,NULL,0),(309,'O14888696119330','http://m.31wan.cn','orderid=O14888696119330&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869611&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9243972537487add088bad32dfd0a589',1488869611,0,0,NULL,0),(310,'14888696167177039','http://m.31wan.cn','orderid=14888696167177039&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869617&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9efab17bbd524cbf627651c429741684',1488869617,0,0,NULL,0),(311,'O14888696341248','http://m.31wan.cn','orderid=O14888696341248&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869634&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=774e1edfa60a39b6519a35d3f6fb8e09',1488869634,0,0,NULL,0),(312,'14888696441362150','http://m.31wan.cn','orderid=14888696441362150&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488869645&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7a4664f42841b414bb830497e232d425',1488869645,0,0,NULL,0),(313,'O14888697861159','http://m.31wan.cn','orderid=O14888697861159&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488869786&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7951fc423f4bbcedb234427c617f2cb2',1488869786,0,0,NULL,0),(314,'14888700519134938','http://m.31wan.cn','orderid=14888700519134938&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488870052&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=76d23be44cfdf8f80f2072409990d540',1488870052,0,0,NULL,0),(315,'O14888700989777','http://m.31wan.cn','orderid=O14888700989777&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488870098&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f2b46a336b227eca96ae6db6d072e1ec',1488870098,0,1,NULL,0),(316,'14888701609406080','http://m.31wan.cn','orderid=14888701609406080&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488870161&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=b67349a415bc6d291a986ba98f956b20',1488870161,0,0,NULL,0),(317,'O14888701735745','http://m.31wan.cn','orderid=O14888701735745&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488870173&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=aabf7287cebdef18692f616432556e0d',1488870173,0,0,NULL,0),(318,'14888703541235950','http://m.31wan.cn','orderid=14888703541235950&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488870354&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=b3f6aca84acadcf597369a08bdd1f26f',1488870354,0,0,NULL,0),(319,'O14888703629931','http://m.31wan.cn','orderid=O14888703629931&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488870362&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=769b935b5e1d8a57999f260c28c25225',1488870362,0,0,NULL,0),(320,'O14888703817738','http://m.31wan.cn','orderid=O14888703817738&username=d838079785&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488870381&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7eb630bb66f676fb8be8e2c93a3a5052',1488870381,0,0,NULL,0),(321,'O14888720887523','http://m.31wan.cn','orderid=O14888720887523&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488872088&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7ef0636743ff9e7eba356b8bd1923304',1488872088,0,0,NULL,0),(322,'O14888720918042','http://m.31wan.cn','orderid=O14888720918042&username=fghhj455&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488872091&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9d0693b7aa0293810a8b443911ac7c98',1488872091,0,0,NULL,0),(323,'14888750616404789','http://m.31wan.cn','orderid=14888750616404789&username=d541904701&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488875062&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=603cc60caff2c38e7847692ad975943a',1488875062,0,0,NULL,0),(324,'O14889358341945','http://m.31wan.cn','orderid=O14889358341945&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488935834&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=19fa02a2d017163a6167dc180610015a',1488935834,0,0,NULL,0),(325,'O14889358952591','http://m.31wan.cn','orderid=O14889358952591&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488935895&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f5c8add84b874be9eb01f3cbfa7d2a9c',1488935895,0,0,NULL,0),(326,'O14889358999320','http://m.31wan.cn','orderid=O14889358999320&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488935899&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c4518b3de1ab91aa2b944814d2df2056',1488935899,0,0,NULL,0),(327,'14889374246328048','http://m.31wan.cn','orderid=14889374246328048&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488937424&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7349f40dde9bedab1a499a4297acb120',1488937424,0,0,NULL,0),(328,'O14889374383568','http://m.31wan.cn','orderid=O14889374383568&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937438&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=aa2132d37436aa0d2a6b1d236e61d5e0',1488937438,0,0,NULL,0),(329,'O14889374767662','http://m.31wan.cn','orderid=O14889374767662&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937476&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=00f5155a6e422cca5a88f64476e4024d',1488937476,0,0,NULL,0),(330,'O14889374956023','http://m.31wan.cn','orderid=O14889374956023&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937495&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=8e6c61936f5c473d53693901c663f9d5',1488937495,0,0,NULL,0),(331,'O14889374995615','http://m.31wan.cn','orderid=O14889374995615&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937499&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f5e3e72a5c90c8298cf7f3c350ae0681',1488937499,0,0,NULL,0),(332,'O14889375034075','http://m.31wan.cn','orderid=O14889375034075&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937503&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=54dc7dc61897da498f2df506d5054143',1488937503,0,0,NULL,0),(333,'O14889375043469','http://m.31wan.cn','orderid=O14889375043469&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937504&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d506b33cba649f2a13ce311da2d18327',1488937504,0,0,NULL,0),(334,'O14889375056469','http://m.31wan.cn','orderid=O14889375056469&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937505&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=ff62a4f3e80027747f4201240b6f5d43',1488937505,0,0,NULL,0),(335,'O14889375115942','http://m.31wan.cn','orderid=O14889375115942&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937511&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=1167e43b07f22faeb5ac0ac7b6d8cc20',1488937511,0,0,NULL,0),(336,'O14889375139309','http://m.31wan.cn','orderid=O14889375139309&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937513&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=26d86142b36167f3bfcf16806f654056',1488937513,0,0,NULL,0),(337,'O14889375143668','http://m.31wan.cn','orderid=O14889375143668&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937514&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d65b580deaf5a2e5a72896bc8f7f2938',1488937514,0,0,NULL,0),(338,'O14889375153141','http://m.31wan.cn','orderid=O14889375153141&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937515&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=976a4306bd30f60ac0e19b315e8a9466',1488937515,0,0,NULL,0),(339,'O14889375162149','http://m.31wan.cn','orderid=O14889375162149&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937516&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=086531a874011dc65e42bf3fb84b3d57',1488937516,0,0,NULL,0),(340,'O14889375166947','http://m.31wan.cn','orderid=O14889375166947&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937516&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=5c5499b36d46fa0b8bca1170e512993a',1488937516,0,0,NULL,0),(341,'O14889375244467','http://m.31wan.cn','orderid=O14889375244467&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937524&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=69717978e11d1bb15bda5830d78c31f6',1488937524,0,0,NULL,0),(342,'O14889375256983','http://m.31wan.cn','orderid=O14889375256983&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937525&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=497ae5b2849cce0dbea3ad34271c5040',1488937525,0,0,NULL,0),(343,'O14889375263357','http://m.31wan.cn','orderid=O14889375263357&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937526&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=eb7af4ff017777f0fc6640123817e707',1488937526,0,0,NULL,0),(344,'O14889375267235','http://m.31wan.cn','orderid=O14889375267235&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937526&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9a2dccff679d1e5411db1e31763ea1fd',1488937526,0,0,NULL,0),(345,'O14889375288646','http://m.31wan.cn','orderid=O14889375288646&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937528&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=41d0fa6b9549befd82e7f967054a8847',1488937528,0,0,NULL,0),(346,'O14889375286192','http://m.31wan.cn','orderid=O14889375286192&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937528&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=ad1f3cad43b96e4d6aeafe03eb1822a0',1488937528,0,0,NULL,0),(347,'O14889375296446','http://m.31wan.cn','orderid=O14889375296446&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937529&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=ec85c41c87288cf4ca56d5e2e62aa36c',1488937529,0,0,NULL,0),(348,'O14889375308946','http://m.31wan.cn','orderid=O14889375308946&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937530&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=a4409bd6c59f70d2204d394ea4ea09d8',1488937530,0,0,NULL,0),(349,'O14889375328439','http://m.31wan.cn','orderid=O14889375328439&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937532&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=e4933480cedaefed6eaec8d4bc5ad855',1488937532,0,0,NULL,0),(350,'O14889375339252','http://m.31wan.cn','orderid=O14889375339252&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937533&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=74c14831b345c2a15bbb4bdad15d1de3',1488937533,0,0,NULL,0),(351,'O14889375344020','http://m.31wan.cn','orderid=O14889375344020&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937534&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=1c3b99358d917ce950301f5ca4ab57c7',1488937534,0,0,NULL,0),(352,'O14889375361508','http://m.31wan.cn','orderid=O14889375361508&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488937536&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d55307eb758591259dcc6115faaf6900',1488937536,0,0,NULL,0),(353,'O14889386507010','http://m.31wan.cn','orderid=O14889386507010&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488938650&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=53cb41375918d750f96e0f943d3926f8',1488938650,0,0,NULL,0),(354,'O14889386608796','http://m.31wan.cn','orderid=O14889386608796&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488938660&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9ed70579facd34314158e36619e66757',1488938660,0,0,NULL,0),(355,'O14889391717395','http://m.31wan.cn','orderid=O14889391717395&username=d798755492&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939171&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=4033216493721f531933e83e1526c480',1488939171,0,0,NULL,0),(356,'O14889394503242','http://m.31wan.cn','orderid=O14889394503242&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939450&attach=&sign=2beed84f5efee795fab59f9531439e53',1488939450,0,0,NULL,0),(357,'O14889394603188','http://m.31wan.cn','orderid=O14889394603188&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939460&attach=&sign=5983f58029893be0a8c7c05270589f84',1488939460,0,0,NULL,0),(358,'O14889394688744','http://m.31wan.cn','orderid=O14889394688744&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939468&attach=&sign=1893632dc7dc31d5a572cc149f1d5a03',1488939468,0,0,NULL,0),(359,'14889394759615906','http://m.31wan.cn','orderid=14889394759615906&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488939476&attach=&sign=4df8da1fdc915eb5b43dce3cface5b82',1488939476,0,0,NULL,0),(360,'O14889394864995','http://m.31wan.cn','orderid=O14889394864995&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939486&attach=&sign=187e44fcc987a82dccd0c24be2ec4fcd',1488939486,0,0,NULL,0),(361,'O14889395156846','http://m.31wan.cn','orderid=O14889395156846&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488939515&attach=&sign=ec102bf598dc3e49150b950bb69d11c2',1488939515,0,0,NULL,0),(362,'O14889400312695','http://m.31wan.cn','orderid=O14889400312695&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940031&attach=&sign=5b316e8cc267be40eb97c2dc6c30f764',1488940031,0,0,NULL,0),(363,'O14889403126214','http://m.31wan.cn','orderid=O14889403126214&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940312&attach=&sign=a1a881a397818532f19e7cad0b516fcf',1488940312,0,0,NULL,0),(364,'O14889404199006','http://m.31wan.cn','orderid=O14889404199006&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940419&attach=&sign=10172a1bc692f85d6a81fd0622cf515e',1488940419,0,0,NULL,0),(365,'O14889405002686','http://m.31wan.cn','orderid=O14889405002686&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940500&attach=&sign=f4381338b6c3c3412f299e1f00a8f0bd',1488940500,0,0,NULL,0),(366,'O14889405103684','http://m.31wan.cn','orderid=O14889405103684&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940510&attach=&sign=183498f1b32f183c94c855366b30ff3b',1488940510,0,0,NULL,0),(367,'O14889405186921','http://m.31wan.cn','orderid=O14889405186921&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940518&attach=&sign=1ce9be56b2a136939f43900be5f2ba7e',1488940518,0,0,NULL,0),(368,'O14889405429621','http://m.31wan.cn','orderid=O14889405429621&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940542&attach=&sign=acfbb6ed4bfa5102004ab1de9c67a5cd',1488940542,0,0,NULL,0),(369,'O14889405928688','http://m.31wan.cn','orderid=O14889405928688&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488940592&attach=&sign=24f3db68a16f5447cce2fc452f9f6103',1488940592,0,0,NULL,0),(370,'O14889424653348','http://m.31wan.cn','orderid=O14889424653348&username=d983944619&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488942465&attach=&sign=b855d652c83675742070b0205e6f129d',1488942465,0,0,NULL,0),(371,'O14889428421924','http://m.31wan.cn','orderid=O14889428421924&username=d526824562&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488942842&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=2840c3356f0e34bddbf683a739b19b84',1488942842,0,0,NULL,0),(372,'O14889428525477','http://m.31wan.cn','orderid=O14889428525477&username=d526824562&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488942852&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=2b81663dbbc1ca13db917f5a3b95b759',1488942852,0,0,NULL,0),(373,'O14889428603958','http://m.31wan.cn','orderid=O14889428603958&username=d526824562&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488942860&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=7e2ec2b78f9fe8c119ddfb1b1e3552d8',1488942860,0,0,NULL,0),(374,'14889428680775497','http://m.31wan.cn','orderid=14889428680775497&username=d526824562&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488942868&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=08f159382787871be180f2bf292c36ce',1488942868,0,0,NULL,0),(375,'O14889428767105','http://m.31wan.cn','orderid=O14889428767105&username=d526824562&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488942876&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=60c8092918422f70726c3d8377aba0d3',1488942876,0,0,NULL,0),(376,'O14889435719373','http://m.31wan.cn','orderid=O14889435719373&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488943571&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=029ef9dd631db6da1d850e3c41be6ee2',1488943571,0,0,NULL,0),(377,'O14889435865869','http://m.31wan.cn','orderid=O14889435865869&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488943586&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f98944decee4e8fa56cb7bf855195541',1488943586,0,0,NULL,0),(378,'O14889435977391','http://m.31wan.cn','orderid=O14889435977391&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488943597&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f0fd1252768a02185da3fa2b73929553',1488943597,0,0,NULL,0),(379,'O14889436176377','http://m.31wan.cn','orderid=O14889436176377&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488943617&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=67b3df2f0a6cadbc684d2bd68310980e',1488943617,0,0,NULL,0),(380,'14889436557067927','http://m.31wan.cn','orderid=14889436557067927&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1488943655&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=e63036f1bad8a4242a10d916d96cea4a',1488943655,0,0,NULL,0),(381,'O14889436615406','http://m.31wan.cn','orderid=O14889436615406&username=d429353691&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488943661&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=fd0a363608c5378896f5aaf4a8573aa1',1488943661,0,0,NULL,0),(382,'O14889440511582','http://m.31wan.cn','orderid=O14889440511582&username=d396705194&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488944051&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=d04c2ea615f347a87a4814354d664138',1488944051,0,0,NULL,0),(383,'O14889440624206','http://m.31wan.cn','orderid=O14889440624206&username=d396705194&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488944062&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=89de55840e2b87b5ded368d0130e66cf',1488944062,0,0,NULL,0),(384,'O14889441598101','http://m.31wan.cn','orderid=O14889441598101&username=d884689443&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488944159&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=2a3d6a58433c0ce7e5022ae55f445cce',1488944159,0,0,NULL,0),(385,'O14889441681101','http://m.31wan.cn','orderid=O14889441681101&username=d884689443&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488944168&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=1bd32d343a9e8db377d4165780c18926',1488944168,0,0,NULL,0),(386,'O14889496556496','http://m.31wan.cn','orderid=O14889496556496&username=d884689443&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488949655&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=dc5711007c332255e84fbdd084e64a37',1488949655,0,0,NULL,0),(387,'14889540324905616','http://m.31wan.cn','orderid=14889540324905616&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=zfb&amount=1&paytime=1488954032&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=f104ebf7cf34e43caf203f9f559722ba',1488954032,0,0,NULL,1),(388,'1488954044256191','http://m.31wan.cn','orderid=1488954044256191&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=zfb&amount=1&paytime=1488954044&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=a902194b33c5d7fcb249b9d75e3c5a16',1488954044,0,0,NULL,1),(389,'O14889543602020','http://m.31wan.cn','orderid=O14889543602020&username=magua01&gameid=1&roleid=%E8%A7%92%E8%89%B2ID&serverid=服务器ID&paytype=wx&amount=1&paytime=1488954360&attach=cp%E6%89%A9%E5%B1%95%E5%8F%82%E6%95%B0&sign=bcaa711e9d3817546a4cf20d62531d88',1488954360,0,0,NULL,1),(390,'O14889559095397','http://m.31wan.cn','orderid=O14889559095397&username=d789903331&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1488955909&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=3bffdb967367e58c34a17f23a5b7e16c',1488955909,0,0,NULL,0),(391,'O14890523384393','http://m.31wan.cn','orderid=O14890523384393&username=dghh455f&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1489052338&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=661c8ace209532f32c93336864b772e1',1489052338,0,0,NULL,0),(392,'O14894695843781','http://m.31wan.cn','orderid=O14894695843781&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=1&paytime=1489469584&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=552e808a691c071258b0e67d593243b7',1489469584,0,1,NULL,1),(393,'O14894698694994','http://m.31wan.cn','orderid=O14894698694994&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489469869&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=3f19e4332433c9ce75a18820a6ce1f24',1489469869,0,1,NULL,1),(394,'O14894713292519','http://m.31wan.cn','orderid=O14894713292519&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount= 0.01&paytime=1489471329&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=ddb0f04190cc5e92ce2a71d771361cf9',1489471329,0,1,NULL,1),(395,'O14894713765174','http://m.31wan.cn','orderid=O14894713765174&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471376&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=b544d06d0d37ef2c30727586103784af',1489471376,0,1,NULL,1),(396,'O14894714124584','http://m.31wan.cn','orderid=O14894714124584&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471412&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=9a53cd9cc6c96a1e063c663f711a33da',1489471412,0,1,NULL,1),(397,'O14894715152047','http://m.31wan.cn','orderid=O14894715152047&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471515&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=555ddd79d0e96348fb4fd09b6d9ad407',1489471515,0,1,NULL,1),(398,'O14894715757946','http://m.31wan.cn','orderid=O14894715757946&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471575&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=fa839d3d46aef4ae56a63807396b8620',1489471575,0,1,NULL,1),(399,'O14894716398524','http://m.31wan.cn','orderid=O14894716398524&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471639&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=e3ad2fe6301b1d67b9596221a66fe916',1489471639,0,1,NULL,1),(400,'O14894717486799','http://m.31wan.cn','orderid=O14894717486799&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489471748&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=88b0ac47db63061e12b3d96edfa91411',1489471748,0,1,NULL,1),(401,'O14894722568275','http://m.31wan.cn','orderid=O14894722568275&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489472256&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=9f40362ca0958b8ec093cfc5f3181cf0',1489472256,0,1,NULL,1),(402,'O14894731552100','http://m.31wan.cn','orderid=O14894731552100&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489473155&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=99f53688fa83d755af88606c103c6442',1489473155,0,1,NULL,1),(403,'O14894733965029','http://m.31wan.cn','orderid=O14894733965029&username=qqqqq&gameid=1&roleid=WanCmsSDK-01&serverid=1&paytype=wx&amount=0.01&paytime=1489473396&attach=%E5%93%88%E5%93%88%E5%93%88zzz&sign=863ea095a2d753a5a320e3e1fee0ddb4',1489473396,0,1,NULL,1),(404,'14895424016352979','http://m.31wan.cn','orderid=14895424016352979&username=d314968501&gameid=1&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1489542401&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c8dc3d030911c73a6f8bdd72f8cad1af',1489542401,0,0,NULL,0),(405,'O14895591009033','http://m.31wan.cn','orderid=O14895591009033&username=d785955020&gameid=1&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1489559100&attach=&sign=617305b2c5ae44ec5f006685077c2c5c',1489559100,0,0,NULL,0),(406,'O14906915259344','www.wancms.com','orderid=O14906915259344&username=d368642361&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=5&paytime=1490691525&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=f3543c83227816e0411de0a43906b130',1490691525,0,0,NULL,0),(407,'O14906915837370','www.wancms.com','orderid=O14906915837370&username=d368642361&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=5&paytime=1490691583&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=a4b304711c81b87d7446338e6d5ccf5c',1490691583,0,0,NULL,0),(408,'O14906915878544','www.wancms.com','orderid=O14906915878544&username=d368642361&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=5&paytime=1490691587&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=0346dd2f77cad6ba42d8741b66cb73a3',1490691587,0,0,NULL,0),(409,'O14906915886747','www.wancms.com','orderid=O14906915886747&username=d368642361&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=5&paytime=1490691588&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=56d8651b0442ae44da3176657c1f20b7',1490691588,0,0,NULL,0),(410,'O14906916393246','www.wancms.com','orderid=O14906916393246&username=d899447348&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1490691639&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=c995787d3a5f894548aca69f58951c81',1490691639,0,0,NULL,0),(411,'14906916441901076','www.wancms.com','orderid=14906916441901076&username=d899447348&gameid=2&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1490691644&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=14638e042cb712d0517b23a1f6243817',1490691644,0,0,NULL,0),(412,'14906916678152099','www.wancms.com','orderid=14906916678152099&username=d899447348&gameid=2&roleid=roleid&serverid=1&paytype=zfb&amount=1&paytime=1490691668&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=9f8db4cd06b0f8506c91b5d68d70e595',1490691668,0,0,NULL,0),(413,'O14906916787262','www.wancms.com','orderid=O14906916787262&username=d899447348&gameid=2&roleid=roleid&serverid=1&paytype=wx&amount=1&paytime=1490691678&attach=%E8%BF%B7%E4%BD%A0%E6%B8%B8%E6%88%8F&sign=ebc30122dc0f0166a99d42a1b3dbe10d',1490691678,0,0,NULL,0);
/*!40000 ALTER TABLE `mini_paycpinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_paytype`
--

DROP TABLE IF EXISTS `mini_paytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_paytype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `paytype` varchar(20) DEFAULT NULL COMMENT '充值方式',
  `payname` varchar(20) DEFAULT NULL COMMENT '充值名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_paytype`
--

LOCK TABLES `mini_paytype` WRITE;
/*!40000 ALTER TABLE `mini_paytype` DISABLE KEYS */;
INSERT INTO `mini_paytype` VALUES (2,'zfb','支付宝快捷支付'),(3,'ptb','平台币支付'),(21,'wx','微信支付');
/*!40000 ALTER TABLE `mini_paytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_phone`
--

DROP TABLE IF EXISTS `mini_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_phone` (
  `id` int(32) NOT NULL,
  `appkey` varchar(32) NOT NULL,
  `secretkey` varchar(32) NOT NULL,
  `templatecode` varchar(32) NOT NULL,
  `signname` varchar(100) NOT NULL COMMENT '签名名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_phone`
--

LOCK TABLES `mini_phone` WRITE;
/*!40000 ALTER TABLE `mini_phone` DISABLE KEYS */;
INSERT INTO `mini_phone` VALUES (1,'LTAIGR9keaqx1JCO','Ns4b6zkcg6FDuFK9c5qIxVJcCy4g0v','SMS_42770104','Mini游戏');
/*!40000 ALTER TABLE `mini_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_plugins`
--

DROP TABLE IF EXISTS `mini_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_plugins`
--

LOCK TABLES `mini_plugins` WRITE;
/*!40000 ALTER TABLE `mini_plugins` DISABLE KEYS */;
INSERT INTO `mini_plugins` VALUES (1,'Mobileverify','手机验证码','手机验证码',0,0,'{\"account_sid\":\"\",\"auth_token\":\"\",\"app_id\":\"\",\"template_id\":\"\",\"expire_minute\":\"30\"}','send_mobile_verify_code',1,'ThinkCMF','1.0',0,0),(2,'Comment','系统评论插件','系统评论插件',0,1,'[]','comment',0,'ThinkCMF','1.0',0,0),(3,'Demo','插件演示','插件演示',0,1,'{\"text\":\"hello,ThinkCMF!\",\"password\":\"\",\"select\":\"1\",\"checkbox\":1,\"radio\":\"1\",\"textarea\":\"\\u8fd9\\u91cc\\u662f\\u4f60\\u8981\\u586b\\u5199\\u7684\\u5185\\u5bb9\"}','footer',1,'ThinkCMF','1.0',0,0);
/*!40000 ALTER TABLE `mini_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_posts`
--

DROP TABLE IF EXISTS `mini_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_posts`
--

LOCK TABLES `mini_posts` WRITE;
/*!40000 ALTER TABLE `mini_posts` DISABLE KEYS */;
INSERT INTO `mini_posts` VALUES (1,1,'awsdergfh','awsdfegrg','2016-12-16 08:58:52','<p>daswfegrhh</p>','12354','asdfg',3,1,'2016-12-16 08:59:05',NULL,0,1,'',0,'{\"thumb\":\"news\\/20161216\\/58533c5075026.png\",\"template\":\"\"}',0,0,0,0),(2,1,'攻略测试','1232','2016-12-16 09:42:43','<p>啧啧啧</p>','游戏攻略测试','13215',3,1,'2016-12-19 15:17:24',NULL,0,1,'',0,'{\"thumb\":\"news\\/20161219\\/58578979c6e58.png\",\"template\":\"\"}',0,0,0,0),(3,1,'活动啊','132','2016-12-16 09:57:58','<p>活动活动啊 啊啊啊 啊</p>','活动','13215646',1,1,'2017-01-06 16:22:50',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f53d8a20d3.jpg\",\"template\":\"\"}',0,0,0,0),(4,1,'新闻啊','新闻啊啊啊啊啊','2016-12-16 09:59:08','<p>新闻啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>','游戏新闻','新闻啊啊啊',1,1,'2016-12-16 09:59:47',NULL,0,1,'',0,'{\"thumb\":\"news\\/20161216\\/58534a9049af9.png\",\"template\":\"\"}',0,0,0,0),(5,1,'1326','1332131','2016-12-16 10:52:47','<p>5641614616</p>','继续活动','32123123',1,1,'2017-01-06 16:01:22',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f4ecfb5ba4.jpg\",\"template\":\"\"}',0,0,0,0),(6,1,'攻略攻略-','攻略攻略-','2016-12-16 16:24:44','','攻略攻略-','攻略攻略-',1,1,'2017-01-09 17:15:10',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f311f94be9.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"news\\/20170109\\/5873548f29344.jpg\",\"alt\":\"\\u4e0b\\u8f7d (1)\"},{\"url\":\"news\\/20170109\\/587354981b0c7.jpg\",\"alt\":\"\"}]}',0,0,0,0),(7,1,'攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-攻略攻略-','攻略攻略-攻略攻略-','2016-12-16 16:25:00','<p>攻略攻略-攻略攻略-攻略攻略-攻略攻略-</p>','ceeeeeee','攻略攻略-攻略攻略-',1,1,'2017-01-17 14:55:03',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f30e4b6be9.jpg\",\"template\":\"\"}',0,0,0,0),(8,1,'活动活动--','活动活动--','2016-12-16 16:25:55','<p>活动活动--活动活动--</p>','活动活动--','活动活动--',1,1,'2017-01-06 16:10:09',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f50df011cd.jpg\",\"template\":\"\"}',0,0,0,0),(9,1,'活动活动--活动活动--','活动活动--活动活动--','2016-12-16 16:26:22','<p>活动活动--活动活动--活动活动--活动活动--</p>','活动活动--活动活动--','活动活动--活动活动--',1,1,'2017-01-06 16:22:21',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f53bacff8d.jpg\",\"template\":\"\"}',0,0,0,0),(10,1,'新闻新闻--','新闻新闻--','2016-12-16 16:27:09','<p>新闻新闻--新闻新闻--新闻新闻--</p>','新闻新闻--','新闻新闻--',1,1,'2016-12-16 16:27:47',NULL,0,1,'',0,'{\"thumb\":\"news\\/20161216\\/5853a57dda668.png\",\"template\":\"\"}',0,0,0,0),(11,1,'假猪套天下第一的传说假猪套天下第一的传说','假猪套天下第一','2016-12-16 16:27:48','<p>刷屏走起:&quot;假猪套天下第一&quot; , &quot;假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一&quot;假猪套天下第一假猪套天下第一假猪套天下第一&nbsp;</p><p>就是这么叼</p><p>假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一</p>','关于假猪套天下第一的传说','因为假猪套非常叼 , 所有天下第一,假猪套天下第一的传说假猪套天下第一的传说假猪套天下第一的传说假猪套天下第一的传说假猪套天下第一的传说',1,1,'2017-01-11 16:33:13',NULL,0,1,'',0,'{\"thumb\":\"news\\/20161216\\/5853bb42ba5a8.png\",\"template\":\"\",\"photo\":[{\"url\":\"news\\/20170111\\/5875edb5f3183.jpg\",\"alt\":\"\"},{\"url\":\"news\\/20170111\\/5875edbc30173.jpg\",\"alt\":\"\"},{\"url\":\"news\\/20170111\\/5875edc5d26d4.jpg\",\"alt\":\"4\"}]}',0,0,0,0),(12,1,'活动12345','活动12345','2016-12-16 18:01:14','<p>活动12345活动12345</p>','活动12345','活动12345',1,1,'2017-01-06 16:27:02',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f54d4cb370.jpg\",\"template\":\"\"}',0,0,0,0),(13,1,'123','1234','2016-12-16 18:05:56','<p>123456789</p>','1234','234',1,1,'2017-01-11 16:30:07',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170111\\/5875ed0d1c195.jpg\",\"template\":\"\"}',0,0,0,0),(14,1,'关键字啊啊啊啊啊假猪套天下第一','文章来源啊啊啊啊哈哈假猪套天下第一','2016-12-18 17:42:36','<p>内容啊啊啊啊,哈哈哈哈哈哈假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一</p>','假猪套天下第一假猪套天下第一','摘要啊啊啊啊啊假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一假猪套天下第一',1,1,'2017-01-11 16:24:33',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f5344e8a9c.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"news\\/20170111\\/5875ebb0a27b8.jpg\",\"alt\":\"4\"},{\"url\":\"news\\/20170111\\/5875ebb7b7219.jpg\",\"alt\":\"\"},{\"url\":\"news\\/20170111\\/5875ebbf34e58.jpg\",\"alt\":\"\\u4e0b\\u8f7d\"}]}',0,0,0,0),(15,1,'80000800',NULL,'2016-12-21 10:02:48','<p>188888188800000</p>','18618000002','80080000000',1,1,'2016-12-21 09:58:55',NULL,0,2,'',0,'{\"template\":\"page\",\"thumb\":\"\"}',0,0,0,0),(24,1,'游戏评测','游戏评测','2017-01-17 10:28:39','<p>游戏评测</p>','测试','游戏评测',1,1,'2017-01-31 17:00:10',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170117\\/587d816f08469.jpg\",\"template\":\"\"}',0,0,0,0),(17,1,'哈哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','2017-01-06 13:39:13','<p>最最最最做做做做做做做做做做做做做做</p><p>做做做做做做做做做做做做做做做做做做</p><p>做做做做做做做做做做做做做做做做做做做做做</p><p>做啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊<img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0036.gif\"/></p><p>啊啊啊噼噼啪啪铺铺铺铺铺铺铺铺</p><p>铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺</p><p>铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺铺呃呃呃呃呃</p><p>呃呃呃呃呃呃呃呃呃呃呃呃呃呃</p><p>呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃鹅鹅鹅鹅鹅鹅饿鹅鹅鹅饿</p>','天空之城&lt;教你怎么一天升1000万级,打一身神装&gt;','哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊\r\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊哈啊啊啊啊啊啊啊啊啊\r\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊',1,1,'2017-02-15 15:04:03',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f2e5a73c39.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f2ddf041b4.jpg\",\"alt\":\"2\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f2de646296.jpg\",\"alt\":\"6\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f2def3b41e.jpg\",\"alt\":\"8\"}]}',0,0,0,0),(18,1,'《王者荣耀》王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀','王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀','2017-01-06 15:48:23','<p>王者荣耀王者荣耀,送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止送礼送到你吐血为止。</p>','《王者荣耀私服上线了》下载注册角色送100万点券','王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀王者荣耀',1,1,'2017-01-06 16:26:07',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f549daa5fb.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f4d044ce93.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f4d0bcaa3a.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f4d114ae52.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f4d18e284b.jpg\",\"alt\":\"\"}]}',0,0,0,0),(19,1,'啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊','啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊','2017-01-06 16:23:06','<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>','哈啊啊啊啊阿啊啊啊啊啊啊啊啊','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊',1,1,'2017-01-06 16:25:27',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f5475bee5e.jpg\",\"template\":\"\"}',0,0,0,0),(20,1,'啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','2017-01-06 16:23:38','<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊\r\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊\r\n啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊',1,1,'2017-01-06 16:42:54',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170106\\/586f5458eaf1e.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f5812d3f13.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f581a54980.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f5823cf9ea.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170106\\/586f582a98f9e.jpg\",\"alt\":\"\"}]}',0,0,0,0),(21,1,'刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一','刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一','2017-01-11 16:00:28','<p>刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一</p>','新闻走起123456789','刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一',1,1,'2017-01-11 16:14:05',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170111\\/5875e6adf0c8b.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8c79c04f.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8ceb6ddb.jpg\",\"alt\":\"\\u4e0b\\u8f7d (1)\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8d5605f0.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8dca9b49.jpg\",\"alt\":\"\\u4e0b\\u8f7d (2)\"}]}',0,0,0,0),(25,1,'刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一','刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一','2017-01-31 17:27:25','<p>刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一</p>','新闻走起123456789','刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一刷屏走起假猪套天下第一',1,1,'2017-01-31 17:27:25',NULL,0,1,'',0,'{\"thumb\":\"news\\/20170111\\/5875e6adf0c8b.jpg\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8c79c04f.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8ceb6ddb.jpg\",\"alt\":\"\\u4e0b\\u8f7d (1)\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8d5605f0.jpg\",\"alt\":\"\"},{\"url\":\"http:\\/\\/m.31wan.cn\\/data\\/upload\\/news\\/20170111\\/5875e8dca9b49.jpg\",\"alt\":\"\\u4e0b\\u8f7d (2)\"}]}',0,0,0,0),(26,1,'111','11','2017-02-09 18:04:05','<p>3123123123123123</p>','测试活动','1211',1,1,'2017-02-09 18:04:26',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',1,0,0,0),(27,1,'活动文章1','活动文章1','2017-02-10 11:06:14','<p>活动文章1</p>','活动文章1','活动文章1',1,1,'2017-02-10 11:06:35',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',2,0,0,0),(28,1,'活动文章2','活动文章2','2017-02-10 11:06:40','<p>活动文章2</p>','活动文章2','活动文章2',1,1,'2017-02-10 11:06:54',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',1,0,0,0),(29,1,'活动文章3','活动文章2','2017-02-10 11:06:57','<p>活动文章2</p>','活动文章3','活动文章2',1,1,'2017-02-10 11:07:11',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',3,0,0,0),(30,1,'公告1','公告1','2017-02-10 11:07:15','<p>公告1111111111</p><p><img src=\"http://nangua2.oss-cn-hangzhou.aliyuncs.com/ueditor/20170215/58a3e5b4e3c89.jpg\" title=\"20161213155216_3664.jpg\" alt=\"20161213155216_3664.jpg\"/></p><p><strong>哈哈哈哈哈哈哈哈哈哈哈哈哈啊啊哈哈哈哈哈哈哈哈哈哈哈哈圣诞节疯狂来得及按时开放金坷垃是对接</strong></p><p><strong><img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/></strong></p><p><span style=\"color: rgb(255, 255, 0);\"><b>扎花费金额哈大富科技和首付款就爱好的设计费</b></span></p><p><span style=\"color: rgb(255, 255, 0);\"><b><img src=\"http://img.baidu.com/hi/jx2/j_0083.gif\"/></b></span></p><p><span style=\"color: rgb(255, 255, 0);\"><b><br/></b></span></p><p><font color=\"#ffff00\"><span style=\"color: rgb(0, 0, 0);\"><b>爱吃醋错错错错错错错错错错错错错错错错错错</b></span></font></p><p><font color=\"#ffff00\"><span style=\"color: rgb(0, 0, 0);\"><b><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/></b></span></font></p><p><br/></p>','公告1','公告1',1,1,'2017-02-15 13:24:25',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',5,0,0,0),(31,1,'资料1','资料1','2017-02-10 11:07:29','<p>资料1</p>','资料1','资料1',1,1,'2017-02-10 11:07:42',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',9,0,0,0),(32,1,'攻略1','攻略1','2017-02-10 11:07:43','<p>攻略1</p>','攻略1','攻略1',1,1,'2017-02-10 11:07:57',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',2,0,0,0),(33,1,'  公告2','   公告2','2017-02-15 14:11:13','<table class=\"table table-bordered\" width=\"1244\" style=\"width: 1098px;\"><tbody><tr class=\"firstRow\"><td style=\"padding: 8px; line-height: 20px; vertical-align: middle; font-size: 12px;\"><input type=\"text\" name=\"post[post_title]\" id=\"title\" required=\"\" value=\"\" placeholder=\"请输入标题\" style=\"margin: 0px; font-size: 14px; vertical-align: middle; line-height: 20px; font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; width: 400px; height: 20px; padding: 6px; color: rgb(149, 165, 166); border-radius: 3px; border-style: solid; border-color: rgb(220, 228, 236); box-shadow: none; transition: border 0.2s linear, box-shadow 0.2s linear; text-indent: 1px;\"/></td></tr></tbody></table><table class=\"table table-bordered\" width=\"1244\" style=\"width: 1098px;\"><tbody><tr class=\"firstRow\"><td style=\"padding: 8px; line-height: 20px; vertical-align: middle; font-size: 12px;\"><input type=\"text\" name=\"post[post_title]\" id=\"title\" required=\"\" value=\"\" placeholder=\"请输入标题\" style=\"margin: 0px; font-size: 14px; vertical-align: middle; line-height: 20px; font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; width: 400px; height: 20px; padding: 6px; color: rgb(149, 165, 166); border-radius: 3px; border-style: solid; border-color: rgb(220, 228, 236); box-shadow: none; transition: border 0.2s linear, box-shadow 0.2s linear; text-indent: 1px;\"/></td></tr></tbody></table><table class=\"table table-bordered\" width=\"1244\" style=\"width: 1098px;\"><tbody><tr class=\"firstRow\"><td style=\"padding: 8px; line-height: 20px; vertical-align: middle; font-size: 12px;\"><input type=\"text\" name=\"post[post_title]\" id=\"title\" required=\"\" value=\"\" placeholder=\"请输入标题\" style=\"margin: 0px; font-size: 14px; vertical-align: middle; line-height: 20px; font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; width: 400px; height: 20px; padding: 6px; color: rgb(149, 165, 166); border-radius: 3px; border-style: solid; border-color: rgb(220, 228, 236); box-shadow: none; transition: border 0.2s linear, box-shadow 0.2s linear; text-indent: 1px;\"/></td></tr></tbody></table><p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p><p>发送到发大水发大水的撒发的说法asdfafadsf</p><p>afdsafds</p><p><span style=\"color: rgb(192, 0, 0);\">发大水发大水发</span></p><p><span style=\"color: rgb(192, 0, 0);\">阿范德萨</span></p><p><br/></p>','公告2',' \r\n公告2\r\n',1,1,'2017-02-15 14:12:03',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',3,0,0,0),(35,1,'推广公告测试推广公告测试推广公告测试推广公告测试','推广公告测试推广公告测试推广公告测试推广公告测试','2017-03-03 14:57:50','<p><span style=\"color: rgb(44, 62, 80); font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(236, 240, 241);\">推广公告测试推广公告测试推广公告测试推广公告测试</span></p>','推广公告测试推广公告测试推广公告测试推广公告测试','推广公告测试推广公告测试推广公告测试推广公告测试',1,1,'2017-03-03 14:57:59',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(36,1,'充值遇到问题','充值遇到问题','2017-03-03 15:52:34','<p>充值遇到问题</p>','充值遇到问题','充值遇到问题',1,1,'2017-03-03 15:52:46',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(37,1,'联通卡充值帮助','联通卡充值帮助','2017-03-03 15:52:50','<p>联通卡充值帮助</p>','联通卡充值帮助','联通卡充值帮助',1,1,'2017-03-03 15:53:10',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(38,1,'支付宝充值帮助','支付宝充值帮助','2017-03-03 15:53:23','<p>支付宝充值帮助</p>','支付宝充值帮助','支付宝充值帮助',1,1,'2017-03-03 15:53:32',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(39,1,'银行卡充值帮助','银行卡充值帮助','2017-03-03 15:53:45','<p><span style=\"color: rgb(44, 62, 80); font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 245, 245);\">银行卡充值帮助</span></p>','银行卡充值帮助','银行卡充值帮助',1,1,'2017-03-03 15:53:53',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(40,1,'国外玩家如何充值？','国外玩家如何充值？','2017-03-03 15:53:57','<p><span style=\"color: rgb(44, 62, 80); font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(236, 240, 241);\">国外玩家如何充值？</span></p>','国外玩家如何充值？','国外玩家如何充值？',1,1,'2017-03-03 15:54:07',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0),(41,1,'没开通网银可以充值吗？','没开通网银可以充值吗？','2017-03-03 15:54:10','<p><span style=\"color: rgb(44, 62, 80); font-family: &quot;Microsoft YaHei&quot;, Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(236, 240, 241);\">没开通网银可以充值吗？</span></p>','没开通网银可以充值吗？','没开通网银可以充值吗？',1,1,'2017-03-03 15:54:20',NULL,0,1,'',0,'{\"thumb\":\"\",\"template\":\"\"}',0,0,0,0);
/*!40000 ALTER TABLE `mini_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_qishu`
--

DROP TABLE IF EXISTS `mini_qishu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_qishu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `qishu` int(10) NOT NULL COMMENT '结算期数',
  `create_time` int(11) NOT NULL COMMENT '结算开始时间',
  `endtime` int(11) NOT NULL COMMENT '结算结束时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_qishu`
--

LOCK TABLES `mini_qishu` WRITE;
/*!40000 ALTER TABLE `mini_qishu` DISABLE KEYS */;
INSERT INTO `mini_qishu` VALUES (1,1,1477843200,1488124799,1488160678);
/*!40000 ALTER TABLE `mini_qishu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_retained`
--

DROP TABLE IF EXISTS `mini_retained`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_retained` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `two` varchar(45) DEFAULT NULL,
  `three` varchar(45) DEFAULT NULL,
  `four` varchar(45) DEFAULT NULL,
  `five` varchar(45) DEFAULT NULL,
  `six` varchar(45) DEFAULT NULL,
  `seven` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留存临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_retained`
--

LOCK TABLES `mini_retained` WRITE;
/*!40000 ALTER TABLE `mini_retained` DISABLE KEYS */;
INSERT INTO `mini_retained` VALUES (1,1,'2','2','1','1','0','0','1491812179'),(2,2,'0','20','0','20','0','0','1491812179');
/*!40000 ALTER TABLE `mini_retained` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_role`
--

DROP TABLE IF EXISTS `mini_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_role`
--

LOCK TABLES `mini_role` WRITE;
/*!40000 ALTER TABLE `mini_role` DISABLE KEYS */;
INSERT INTO `mini_role` VALUES (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0);
/*!40000 ALTER TABLE `mini_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_role_user`
--

DROP TABLE IF EXISTS `mini_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_role_user`
--

LOCK TABLES `mini_role_user` WRITE;
/*!40000 ALTER TABLE `mini_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_route`
--

DROP TABLE IF EXISTS `mini_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_route`
--

LOCK TABLES `mini_route` WRITE;
/*!40000 ALTER TABLE `mini_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_server`
--

DROP TABLE IF EXISTS `mini_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_server` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `servername` varchar(50) NOT NULL COMMENT '名字',
  `start_time` int(13) NOT NULL,
  `add_time` int(13) NOT NULL,
  `stop_notice` varchar(255) NOT NULL,
  `is_display` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `content` varchar(255) NOT NULL COMMENT '简介',
  `server_img` varchar(255) NOT NULL COMMENT '开服表图标',
  `isstop` int(2) NOT NULL DEFAULT '1' COMMENT '1-不停 0-停服',
  `sid` int(10) NOT NULL,
  `zsid` int(10) NOT NULL COMMENT '合区之后主区ID',
  PRIMARY KEY (`id`),
  KEY `servername` (`servername`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_server`
--

LOCK TABLES `mini_server` WRITE;
/*!40000 ALTER TABLE `mini_server` DISABLE KEYS */;
INSERT INTO `mini_server` VALUES (1,2,'删档测试服',1489383000,1489383105,'',1,1,'删档测试服','',1,1,1),(2,1,'测试服（删档）',1489300440,1489386882,'',1,0,'','',1,1,1);
/*!40000 ALTER TABLE `mini_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_settlement`
--

DROP TABLE IF EXISTS `mini_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_settlement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL COMMENT '结算开始时间',
  `cps_uid` int(10) NOT NULL COMMENT '推广渠道id',
  `money` double(10,2) NOT NULL COMMENT '结算金额',
  `operator` varchar(255) NOT NULL COMMENT '操作员',
  `real_money` double(10,2) NOT NULL COMMENT '推广人员获得金额',
  `gid` int(6) NOT NULL COMMENT '充值对应的游戏ID',
  `spend_num` int(6) NOT NULL COMMENT '充值次数',
  `ip` varchar(20) NOT NULL COMMENT '操作IP',
  `endtime` int(11) NOT NULL COMMENT '结算结束时间',
  `qishu` int(10) NOT NULL COMMENT '结算期数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_settlement`
--

LOCK TABLES `mini_settlement` WRITE;
/*!40000 ALTER TABLE `mini_settlement` DISABLE KEYS */;
INSERT INTO `mini_settlement` VALUES (1,1477843200,1,1.10,'admin',0.00,1,2,'180.89.5.127',1488124799,1);
/*!40000 ALTER TABLE `mini_settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_slide`
--

DROP TABLE IF EXISTS `mini_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_slide`
--

LOCK TABLES `mini_slide` WRITE;
/*!40000 ALTER TABLE `mini_slide` DISABLE KEYS */;
INSERT INTO `mini_slide` VALUES (1,1,'兽血再燃','http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/content/20170315/58c8e6f95c465.jpg','','兽血再燃-首服','兽血再燃-首服即将开启，敬请期待！',1,0),(2,1,'图2','content/20161227/5862265245df6.png','','22','222',1,0),(3,1,'333','content/20161227/5862266f62ff7.jpg','','33','333',0,0),(4,2,'资讯图','content/20161227/5862267cf167a.jpg','','资讯','资讯',1,0),(5,1,'21321','content/20161227/5862271977b46.jpg','','','',0,0),(7,4,'w1','content/20170105/586d9f246ec60.jpg','','','123456789',1,0),(8,4,'w2','content/20170105/586d9f4451c79.jpg','','22','12345r5t',1,0),(9,4,'w3','content/20170105/586d9f5e54ace.jpg','','333','333',1,0),(10,4,'w4','content/20170105/586d9f74bf405.jpg','','','1234521',1,0),(11,5,'批次','content/20170209/589c3970c17bd.jpg','','','',1,0),(12,5,'测试','content/20170209/589c398de2412.jpg','','','',1,0);
/*!40000 ALTER TABLE `mini_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_slide_cat`
--

DROP TABLE IF EXISTS `mini_slide_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_slide_cat`
--

LOCK TABLES `mini_slide_cat` WRITE;
/*!40000 ALTER TABLE `mini_slide_cat` DISABLE KEYS */;
INSERT INTO `mini_slide_cat` VALUES (1,'首页轮播','sy','首页轮播',1),(2,'资讯轮播图','zx','资讯',1),(3,'游戏礼包轮播','gift','礼包轮播图',1),(4,'wap首页轮播','wap','wap首页轮播',1),(5,'测试官网','testgw','官网测试幻灯片',1);
/*!40000 ALTER TABLE `mini_slide_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_term_relationships`
--

DROP TABLE IF EXISTS `mini_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_term_relationships`
--

LOCK TABLES `mini_term_relationships` WRITE;
/*!40000 ALTER TABLE `mini_term_relationships` DISABLE KEYS */;
INSERT INTO `mini_term_relationships` VALUES (1,1,2,0,1),(16,2,5,0,1),(3,3,5,0,1),(4,4,3,0,1),(5,5,5,0,1),(6,6,4,0,1),(7,7,4,0,1),(8,8,5,0,1),(9,9,5,0,1),(10,10,3,0,1),(11,11,3,0,1),(12,12,5,0,1),(22,13,5,0,1),(21,14,3,0,1),(17,17,4,0,1),(18,18,5,0,1),(19,19,5,0,1),(20,20,5,0,1),(23,21,3,0,1),(29,25,7,0,1),(28,24,7,0,1),(30,26,11,0,1),(31,27,11,0,1),(32,28,11,0,1),(33,29,11,0,1),(34,30,10,0,1),(35,31,12,0,1),(36,32,13,0,1),(37,33,10,0,1),(39,35,15,0,1),(40,36,14,0,1),(41,37,14,0,1),(42,38,14,0,1),(43,39,14,0,1),(44,40,14,0,1),(45,41,14,0,1);
/*!40000 ALTER TABLE `mini_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_terms`
--

DROP TABLE IF EXISTS `mini_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  `webid` int(7) NOT NULL DEFAULT '0' COMMENT '官网id（默认是主站）',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_terms`
--

LOCK TABLES `mini_terms` WRITE;
/*!40000 ALTER TABLE `mini_terms` DISABLE KEYS */;
INSERT INTO `mini_terms` VALUES (4,'游戏攻略','','article','游戏攻略',0,0,'0-4','','','','list','article',0,1,0),(5,'游戏活动','','article','游戏活动',0,0,'0-5','','','','list','article',0,1,0),(3,'游戏新闻','','article','游戏新闻啊',0,0,'0-3','','','','list','article',0,1,0),(6,'游戏评测','','article','游戏评测',0,0,'0-6','','','','list','article',0,1,0),(7,'栏目11','','article','栏目1',0,0,'0-7','','','','list','article',0,1,14),(10,'公告','','article','公告',0,0,'0-10','','','','list','article',0,1,1),(11,'活动','','article','活动',0,0,'0-11','','','','list','article',0,1,1),(12,'资料','','article','资料',0,0,'0-12','','','','list','article',0,1,1),(13,'攻略','','article','攻略',0,0,'0-13','','','','list','article',0,1,1),(15,'推广公告','','article','推广公告',0,0,'0-14','','','','list','article',0,1,0),(14,'常见问题','','article','常见问题',0,0,'0-15','','','','list','article',0,1,0);
/*!40000 ALTER TABLE `mini_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_ttbrecord`
--

DROP TABLE IF EXISTS `mini_ttbrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_ttbrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderid` varchar(30) DEFAULT NULL COMMENT '订单号',
  `username` varchar(30) DEFAULT NULL COMMENT '用户名',
  `amount` int(11) DEFAULT NULL COMMENT '消费金额，必须大于零',
  `ttb` int(11) DEFAULT NULL COMMENT '天天币数量',
  `gameid` int(11) DEFAULT NULL COMMENT '游戏id',
  `agent` varchar(20) DEFAULT NULL COMMENT '渠道号',
  `serverid` varchar(30) DEFAULT NULL COMMENT '服务器ID',
  `ip` varchar(30) DEFAULT NULL COMMENT '用户支付时使用的网络终端IP',
  `imeil` varchar(30) DEFAULT NULL COMMENT '手机imeil码',
  `roleid` varchar(50) DEFAULT NULL COMMENT '游戏角色id',
  `productname` varchar(100) DEFAULT NULL COMMENT '充值商品名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_ttbrecord`
--

LOCK TABLES `mini_ttbrecord` WRITE;
/*!40000 ALTER TABLE `mini_ttbrecord` DISABLE KEYS */;
INSERT INTO `mini_ttbrecord` VALUES (1,'14884486125194','d355252735',1,10,1,'cps001','1','118.29.185.230','862891030680143','roleid','魔神',1488448612);
/*!40000 ALTER TABLE `mini_ttbrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_types`
--

DROP TABLE IF EXISTS `mini_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_types` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `list` int(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_types`
--

LOCK TABLES `mini_types` WRITE;
/*!40000 ALTER TABLE `mini_types` DISABLE KEYS */;
INSERT INTO `mini_types` VALUES (1,1,'休闲益智'),(2,2,'网络游戏'),(3,3,'体育竞速'),(4,4,'角色扮演'),(5,5,'飞行射击'),(6,6,'策略经营'),(7,7,'卡片棋牌'),(8,8,'动作冒险');
/*!40000 ALTER TABLE `mini_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_user_favorites`
--

DROP TABLE IF EXISTS `mini_user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_user_favorites`
--

LOCK TABLES `mini_user_favorites` WRITE;
/*!40000 ALTER TABLE `mini_user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_users`
--

DROP TABLE IF EXISTS `mini_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` int(10) NOT NULL,
  `deviceinfo` varchar(50) DEFAULT NULL COMMENT '设备数据,包括手机号码、用户系统版本，以||隔开',
  `fromflag` tinyint(2) DEFAULT '1' COMMENT '1为平台及SDK，2为h5平台,3为来自推广平台',
  `device` tinyint(2) DEFAULT NULL COMMENT '注册设备来源，1为PC，2为安卓，3为苹果',
  `imeil` varchar(30) DEFAULT NULL COMMENT '手机imeil码',
  `gameid` int(11) DEFAULT NULL COMMENT '注册时所用的游戏id',
  `update_time` int(11) DEFAULT NULL COMMENT '更改时间',
  `flag_email` int(2) NOT NULL DEFAULT '1' COMMENT '1未绑定 2绑定',
  `total_channel` int(10) NOT NULL COMMENT '一级推广',
  `sub_channel` int(10) NOT NULL COMMENT '二级推广',
  `money` int(10) NOT NULL DEFAULT '0' COMMENT '账号剩余金额(ttb)',
  `total_money` int(10) NOT NULL DEFAULT '0' COMMENT '累计充值金额',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `id_card` varchar(50) NOT NULL COMMENT '身份证',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_users`
--

LOCK TABLES `mini_users` WRITE;
/*!40000 ALTER TABLE `mini_users` DISABLE KEYS */;
INSERT INTO `mini_users` VALUES (1,'admin','###4d3d38931015f1cb65564778d972c550','admin','295729766@qq.com','',NULL,0,'2000-01-01',NULL,'118.28.234.91','2017-04-10 16:16:15','0000-00-00 00:00:00','0b88cf01e2c2501d32a660ce95d348c7',1,0,1,0,'',0,NULL,1,NULL,NULL,NULL,NULL,2,0,0,0,0,'',''),(10,'d292388057','###7aef79f8f7cf582eb22312bec9ca6019','','d292388057@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.25.125','2000-01-01 00:00:00','2017-02-23 11:34:02','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(2,'qqqqq','###27570b609485852fb400589afef5d011','','295729766@qq.com','',NULL,0,'2000-01-01',NULL,'118.28.234.91','2017-04-10 16:12:57','2017-02-22 16:18:04','67e8543d4b20842aa481ab8736a2a69a',1,0,2,2,'',0,'10.2.1',1,3,'8935F5C8-6C43-4268-BA42-E7E988',1,NULL,1,1,1,0,2,'',''),(3,'d463775011','###4098e741611b1ad4cc6b3bc2544e9d97','','d463775011@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.21.179','2017-02-22 16:41:32','2017-02-22 16:18:30','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(4,'d493033472','###4f2be36bd98e998c596d389763ad1826','','d493033472@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.21.179','2017-02-22 16:52:05','2017-02-22 16:45:26','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(5,'d528154873','###1547b3835846a911bc2e1ac1d8a47aa0','','d528154873@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.21.179','2017-02-22 17:39:17','2017-02-22 17:00:39','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(6,'d113521333','###bef4fa4fff85bd99b28f24c1bea6a905','','d113521333@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.21.179','2000-01-01 00:00:00','2017-02-22 17:44:09','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(7,'d546925690','###01895df3ad1e4b91cd62714d0355adb4','','d546925690@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.21.179','2000-01-01 00:00:00','2017-02-22 17:48:17','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(8,'d280068238','###302527f0a590326719633be8f605a754','','d280068238@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 18:00:47','2017-02-22 18:14:27','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(9,'d865246057','###1dfdb4bcfb5e5fcaead5580780640c9a','','d865246057@wancms.com','',NULL,0,'2000-01-01',NULL,'183.60.163.114','2000-01-01 00:00:00','2017-02-22 18:22:22','',1,0,2,0,'',0,'13547638356||android4.2.2',1,2,'868331011992179',1,NULL,1,1,1,0,0,'',''),(11,'xtt01','###27570b609485852fb400589afef5d011','','xtt01@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 13:52:33','2017-02-23 12:42:28','',1,0,2,0,'',0,'10.2.1',1,3,'8935F5C8-6C43-4268-BA42-E7E988',1,NULL,1,1,1,0,0,'',''),(12,'cao580052','###1b6c47f555300d9a0976eefa98c00fe1','','cao580052@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.25.125','2017-02-23 13:08:39','2017-02-23 12:45:39','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(13,'d539277315','###d7d354a60da316179d8518245371d079','','d539277315@wancms.com','',NULL,0,'2000-01-01',NULL,'183.60.163.111','2000-01-01 00:00:00','2017-02-23 12:55:55','',1,0,2,0,'',0,'13547638356||android4.2.2',1,2,'868331011992179',1,NULL,1,1,1,0,0,'',''),(14,'d724273308','###922cf03088c3f51ca4c9b65a0ff21e21','','d724273308@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.25.125','2017-02-23 13:04:09','2017-02-23 12:56:59','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(15,'d263987521','###1147cb4d6be30c5adc913c4c29a2a6fd','','d263987521@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 17:16:09','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(30,'d253487886','###fcc4b7133dab33f913566161faa601d0','','d253487886@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2017-02-27 11:32:50','2017-02-27 11:31:07','',1,0,2,0,'',0,'null||android4.3',1,2,'863738023824759',1,NULL,1,1,1,0,0,'',''),(16,'d663976011','###9cd93a05ad8c14201f8b512a138b969c','','d663976011@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 17:32:46','2017-02-24 17:23:11','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(17,'d127793572','###ef47b955e18b54bbb5c3e67d30f81f8f','','d127793572@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 17:37:28','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(18,'d877279103','###2822d1db6d0f45b2d8db10df176c885c','','d877279103@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 18:07:50','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(19,'d244064708','###809807ec988b5cac9dd6b9569bed6a46','','d244064708@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 18:27:47','2017-02-24 18:12:23','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(20,'d178313390','###4c245f79b81c717f20913f318313c34a','','d178313390@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 18:29:50','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(21,'d748879436','###36fb6252c051e5d0b76e2e77e85ae587','','d748879436@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 18:35:15','2017-02-24 18:32:43','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(22,'d807043451','###f6c05a47c2441d66d7e40810dd7f4650','','d807043451@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 18:35:19','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(23,'d309129434','###35afa8d480ff8b9064d26e6a9f78f3fd','','d309129434@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2017-02-24 18:40:53','2017-02-24 18:38:50','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(24,'d866994547','###3ad39bb846a5a19785282966bcbde3b9','','d866994547@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 18:40:51','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(25,'d893019497','###5957297c3cdd6e954e2cb69cfb2359fb','','d893019497@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.251.11','2000-01-01 00:00:00','2017-02-24 18:43:41','',1,0,2,0,'',0,'null||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(26,'d771123957','###27570b609485852fb400589afef5d011','','d771123957@wancms.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2017-03-15 14:13:07','2017-02-24 18:46:14','',1,0,2,0,'',0,'||android6.0.1',1,2,'863410036901582',1,NULL,1,1,1,0,0,'',''),(27,'d565655636','###7e823457847f86cd658ddc4533ea48eb','','d565655636@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2017-02-27 10:47:44','2017-02-24 18:49:05','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(28,'d519970958','###3a162d22620939990f63279b2054f71b','','d519970958@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2000-01-01 00:00:00','2017-02-27 09:39:55','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(29,'d426731275','###1a7bd5f07c4ba0c8653fa66367740cfe','','d426731275@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2017-02-27 10:15:22','2017-02-27 09:50:44','',1,0,2,0,'',0,'null||android4.3',1,2,'863738023824759',1,NULL,1,1,1,0,0,'',''),(31,'d101193725','###27570b609485852fb400589afef5d011','','d101193725@wancms.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-03 13:42:17','2017-02-27 11:34:54','',1,0,2,1,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,1,'',''),(32,'d984072401','###d88effe57cad2f2fd27614796213730c','','d984072401@wancms.com','',NULL,0,'2000-01-01',NULL,'112.17.239.216','2000-01-01 00:00:00','2017-02-27 13:05:56','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(33,'d851252080','###21102051598afd7eee316ed34d1f419c','','d851252080@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2000-01-01 00:00:00','2017-02-27 15:06:10','',1,0,2,0,'',0,'null||android4.3',1,2,'863738023824759',1,NULL,1,1,1,0,0,'',''),(34,'d585551014','###542b43f65be7d4b91d3d7151a49ce17a','','d585551014@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2000-01-01 00:00:00','2017-02-27 15:19:35','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(35,'d259062200','###b9ce9bbd6af0226f6047dd67129dc82c','','d259062200@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.59.134','2000-01-01 00:00:00','2017-02-27 16:28:40','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(36,'d820364926','###66716ff0b4417d87c6a1125d20e1fb19','','d820364926@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 10:52:39','2017-02-28 10:41:14','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(37,'cao580098','###27570b609485852fb400589afef5d011','','cao580098@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 11:08:25','2017-02-28 10:54:30','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(38,'d554553041','###41a77102166357a5ae7774287503b907','','d554553041@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 11:40:02','2017-02-28 11:27:10','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(39,'d973933597','###c778d09519c94e340b51b0dd31325d54','','d973933597@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 16:34:00','2017-02-28 15:12:42','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(40,'qwer1234','###58800615df06239ab546a496a5dc8807','','qwer1234@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2000-01-01 00:00:00','2017-02-28 15:46:44','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(41,'d483817505','###a343a91f316441542544525d92c42ace','','d483817505@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2000-01-01 00:00:00','2017-02-28 16:01:46','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(42,'d412884831','###ba367868d4ec1626889416af6744ee9e','','d412884831@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2000-01-01 00:00:00','2017-02-28 16:17:29','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(43,'d948107956','###59e8aedb10f82a9b2902147955edd98d','','d948107956@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2000-01-01 00:00:00','2017-02-28 16:21:31','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(44,'d314518319','###faaca57ee129f42e7aecadd83581e265','','d314518319@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 17:10:45','2017-02-28 16:26:59','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(45,'d240726180','###45b799fcd4ca1668f493c865aa9b913a','','d240726180@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.53.203','2017-02-28 17:33:44','2017-02-28 17:23:47','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(46,'d684694026','###2ce484a008753299a528b5d10f216990','','d684694026@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 14:41:54','2017-03-01 11:15:52','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(47,'d864073304','###c3a05eeb37f76ef60d2cd20760f6d075','','d864073304@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 11:30:40','2017-03-01 11:20:40','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(48,'d719096026','###c1d194c7488c8e392561636a22ba1f89','','d719096026@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2000-01-01 00:00:00','2017-03-01 11:32:01','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(49,'d561657951','###a44ff8e03ceb76fb91eeb64e448b6de6','','d561657951@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2000-01-01 00:00:00','2017-03-01 11:35:48','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(50,'d317163744','###f45c068cd8749a0c03dc593de23c35bf','','d317163744@wancms.com','',NULL,0,'2000-01-01',NULL,'112.17.239.216','2017-03-01 13:33:17','2017-03-01 13:20:00','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(51,'d109340207','###443072b81b41e09234e9a4865a821174','','d109340207@wancms.com','',NULL,0,'2000-01-01',NULL,'112.17.239.216','2000-01-01 00:00:00','2017-03-01 13:36:05','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(52,'d493471458','###7e1afb313df0f625d24df56c05bec367','','d493471458@wancms.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2017-03-14 14:37:56','2017-03-01 13:44:06','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(53,'d389697669','###5d74ce5ec389749500d1deadc170eae1','','d389697669@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 14:23:38','2017-03-01 13:53:44','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(54,'d896984624','###37439e9f309020c420f2adb77da48472','','d896984624@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 14:48:21','2017-03-01 14:43:18','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(55,'d666865530','###ccc3ec021eca4a21761ed13d1a462b4c','','d666865530@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2000-01-01 00:00:00','2017-03-01 15:19:58','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(56,'dghh455','###3b7acfb9b26cf08c8eb74df017979bd8','','dghh455@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:21:09','2017-03-01 15:20:18','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(57,'d468942912','###4a4700cc201c3f86062ca8ed2b855e27','','d468942912@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:33:30','2017-03-01 15:22:53','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(58,'dhdjdf','###27570b609485852fb400589afef5d011','','dhdjdf@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:26:11','2017-03-01 15:24:16','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(59,'d690860419','###55b4e2baca9a04df4c5c2c7988e13b05','','d690860419@wancms.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-03 10:11:19','2017-03-01 15:25:40','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010142216',1,NULL,1,1,1,0,0,'',''),(60,'d331657065','###f396659d1bafcff3724ae7b3930dc5b2','','d331657065@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:41:23','2017-03-01 15:37:25','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(61,'d405784848','###bc9a2599aa25961669b85126d8bd7648','','d405784848@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:52:37','2017-03-01 15:42:32','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(62,'d972353009','###03e64140694d47d3d39f99d843ca9bac','','d972353009@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 15:55:37','2017-03-01 15:54:57','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(63,'d352136419','###58d83c9f18a7c34d6ff85439d378718e','','d352136419@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2000-01-01 00:00:00','2017-03-01 15:57:32','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(64,'d138142759','###bcfe6882f8c82a136dd851dcec58eb18','','d138142759@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 17:09:15','2017-03-01 16:00:06','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(65,'d697693137','###27570b609485852fb400589afef5d011','','d697693137@wancms.com','',NULL,0,'2000-01-01',NULL,'60.163.85.187','2017-03-01 16:12:35','2017-03-01 16:05:42','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(66,'d529084204','###51a81fd03f9a07a14dc9491c1dc10f9f','','d529084204@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2017-03-02 10:08:02','2017-03-01 17:10:19','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(67,'d551077675','###be1300a806803591a232c7533f250258','','d551077675@wancms.com','',NULL,0,'2000-01-01',NULL,'111.1.152.73','2017-03-01 21:32:33','2017-03-01 19:55:15','',1,0,2,0,'',0,'15555215554||android4.3.1',1,2,'000000000000000',1,NULL,1,1,1,0,0,'',''),(68,'d477001886','###ab2128090ef77328bac8573b1e9c2bc0','','d477001886@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2000-01-01 00:00:00','2017-03-02 17:06:41','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(69,'d693279649','###d2fbc418a8df56764678b244e1421c52','','d693279649@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2000-01-01 00:00:00','2017-03-02 17:08:24','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(70,'d909510836','###27570b609485852fb400589afef5d011','','d909510836@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2000-01-01 00:00:00','2017-03-02 17:10:25','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(71,'d156824499','###5f01fda3d96c4c770f6f153a75f30f63','','d156824499@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2017-03-02 17:16:35','2017-03-02 17:13:35','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(72,'d608471158','###9c54c3d31d590e95095ad5070d19d82c','','d608471158@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2017-03-02 17:27:04','2017-03-02 17:26:38','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(73,'d300110989','###27570b609485852fb400589afef5d011','','d300110989@wancms.com','',NULL,0,'2000-01-01',NULL,'183.140.252.174','2000-01-01 00:00:00','2017-03-02 17:28:18','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(74,'d130379123','###e6d15b15489f48734bd71ac1ca87cfac','','d130379123@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2017-03-03 09:29:26','2017-03-02 17:37:38','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(75,'d355252735','###27570b609485852fb400589afef5d011','','d355252735@wancms.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-02 17:56:28','2017-03-02 17:51:13','',1,0,2,0,'',0,'||android6.0.1',1,2,'862891030680143',1,NULL,1,1,1,90,0,'',''),(76,'d550187918','###a596f422e40d812762cab5a65b3aba02','','d550187918@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2017-03-03 09:29:50','2017-03-03 09:29:35','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(77,'d838715995','###5c89f5a1afe839391c91ddb0a267860b','','d838715995@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2017-03-03 09:58:16','2017-03-03 09:58:11','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(78,'d718033907','###52ca0c7865bbd9efa7f70e08ce1662ba','','d718033907@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2000-01-01 00:00:00','2017-03-03 10:09:48','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(79,'d954873427','###4b07eaeb9f097d7f58747cfe094dc172','','d954873427@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2000-01-01 00:00:00','2017-03-03 11:17:32','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(80,'d981438218','###f9c59df375524bc359536ad8860e32ed','','d981438218@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2000-01-01 00:00:00','2017-03-03 14:20:14','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(81,'d242583978','###407edf903d0069e5fc969f600464b941','','d242583978@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2000-01-01 00:00:00','2017-03-03 14:22:20','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(82,'15157427985','###27570b609485852fb400589afef5d011','','15157427985@wancms.com','',NULL,0,'2000-01-01',NULL,'115.229.16.129','2017-03-03 16:25:31','2017-03-03 16:25:31','',1,0,2,0,'15157427985',0,NULL,1,NULL,NULL,NULL,NULL,1,1,1,0,0,'12','1'),(83,'d642342743','###484aabcc4649842d5ae037426e4f7625','','d642342743@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-06 09:24:13','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(84,'d427099983','###62251538f4f72094d0ed7fe7e35a9ca0','','d427099983@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-06 11:19:27','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(85,'d666867059','###d25af317b3e2e698b4fcc4ccef45a656','','d666867059@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-06 17:55:22','2017-03-06 11:34:12','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(86,'magua01','###27570b609485852fb400589afef5d011','','magua01@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2017-03-09 13:18:31','2017-03-06 12:24:59','',1,0,2,3,'',0,'10.2.1',1,3,'8935F5C8-6C43-4268-BA42-E7E988',1,NULL,1,1,1,0,3,'',''),(87,'d905050782','###c28ead49229f62ba45b4ef828730257f','','d905050782@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-06 13:24:05','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(88,'magua02','###5322a716de7ca77709b2c1ab6e6bc295','','magua02@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-06 13:31:01','2017-03-06 13:31:00','',1,0,2,0,'',0,'10.2',1,3,'32EC6369-B7D8-4D1C-8694-A4CFF9',1,NULL,1,1,1,0,0,'',''),(89,'vhjjj855','###92546bea65c75cdb3abdccf9945dc1e3','','vhjjj855@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-06 13:31:19','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(90,'d662094324','###27570b609485852fb400589afef5d011','','d662094324@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-06 13:38:56','2017-03-06 13:38:18','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(91,'d649055814','###794f10bdefe48c74828c6f9ac57510a6','','d649055814@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-06 14:06:09','2017-03-06 14:05:25','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(92,'d829273628','###d21028445a386eace7cac94dcc57cc93','','d829273628@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 09:54:30','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(93,'d305620090','###395ecceeaec3e4e25d76be7957d28118','','d305620090@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:10:09','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(94,'d681651337','###74f45ff44ca6423aa081faa79603c0f6','','d681651337@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:13:31','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(95,'d683545727','###57480647290c11586a85bd2c0e8bf280','','d683545727@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:20:28','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(96,'d158424253','###5ff4273c378d52cf660d171a5879e698','','d158424253@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:24:41','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(97,'d619046554','###85d37d31ddfe1416c447e4e8f5a1553b','','d619046554@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 10:29:00','2017-03-07 10:27:10','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(98,'d967313053','###27570b609485852fb400589afef5d011','','d967313053@wancms.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-07 10:41:25','2017-03-07 10:27:49','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010142216',1,NULL,1,1,1,0,0,'',''),(99,'d947272266','###1017e73497ad41ab25f5f7f18d1d916c','','d947272266@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 10:40:00','2017-03-07 10:33:05','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(100,'erfd134234','###b5014280f5c419bd7618e3accb9d6ccf','','erfd134234@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:42:52','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(101,'d815518641','###0c6c03f3bdf5e5ee6c70bc364327f6de','','d815518641@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:50:55','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(102,'d800469331','###5198f4687e6813a625b3c461b252c3b3','','d800469331@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 10:53:15','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(103,'d885260425','###898d110a13ea26401b647e886978472a','','d885260425@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:06:55','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(104,'d458701087','###4145f78e2050581f43ece0086e21db5b','','d458701087@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:11:55','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(105,'d259508189','###ac0ce872c3b05470ab6cd0d6179e7673','','d259508189@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:14:20','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(106,'d571323836','###27570b609485852fb400589afef5d011','','d571323836@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 11:44:46','2017-03-07 11:16:49','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(107,'d537965018','###1d0a97554ab3eb89280a969429e1e2ff','','d537965018@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:24:46','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(108,'d849542558','###197eb829493c2cc1534f15b056d590d4','','d849542558@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:29:47','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(109,'d436530429','###9a22f851aaf1acff68a9ed52a127da36','','d436530429@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:41:07','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(110,'d317640396','###27570b609485852fb400589afef5d011','','d317640396@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 12:09:56','2017-03-07 11:49:51','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,0,'',''),(111,'d912768632','###014f47a69e1df9e2ae77da45918bbcaa','','d912768632@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 11:50:50','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(112,'chjk456','###c94873ee558288da69e7c71e7f5d1610','','chjk456@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 13:27:56','2017-03-07 13:26:06','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(113,'d570390654','###6323a2fe317bd414ccf1d99f175a222c','','d570390654@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 13:33:32','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(114,'d649174113','###b3b03d7af8d8841dd75d47e3cdba1209','','d649174113@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 13:38:24','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(115,'d352891696','###180b37d9059a110925b523bd404ddd44','','d352891696@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 13:52:31','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(116,'d800408774','###ba9096f833aeed90fd289882b7dfebf1','','d800408774@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 13:55:35','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(117,'d590169771','###ef8b1db7787691aed79b24ef60e3615b','','d590169771@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 13:57:22','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(118,'d335692802','###634d7c025e9912f7823540c42c2f4436','','d335692802@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:06:45','',1,0,2,1,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,1,'',''),(119,'d163220334','###da7be43f0e076f4c7b8a26230f2fe330','','d163220334@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:11:27','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(120,'d227864167','###c99882d0e4e387e9047a1e7aedd6baeb','','d227864167@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:14:09','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(121,'d616008310','###a8d859458759382775192ac021751743','','d616008310@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:21:44','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(122,'d473504257','###2b1383b7ffe3d5d168a0845ea5e7e721','','d473504257@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-07 14:46:27','2017-03-07 14:37:11','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(123,'d898898710','###8d4ade7e298177386f0d38d293db8daf','','d898898710@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:48:11','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(124,'fghhj455','###0f7ee70f420354ebb1c2e97ce082d7dd','','fghhj455@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 14:53:13','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(125,'d838079785','###e7f1d43c7e178b8a1e410a574152b581','','d838079785@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 15:00:32','',1,0,2,2,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,1,1,0,2,'',''),(126,'d662055994','###3905e9ac7d198da57d3765aaf0e1625b','','d662055994@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 15:51:51','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(127,'d798755492','###d7fcfc7bd27de53d3954944b39449d5b','','d798755492@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 09:43:29','2017-03-07 16:10:04','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(128,'d541904701','###768c78fd9713c34c304426721c110b4a','','d541904701@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 16:24:04','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,4,4,0,0,'',''),(129,'d256326002','###3a7d2e070cef9f25343cf816a6bceec4','','d256326002@wancms.com','',NULL,0,'2000-01-01',NULL,'120.195.151.20','2017-03-07 16:27:24','2017-03-07 16:25:03','',1,0,2,0,'',0,'13982770876||android4.2.2',1,2,'864895022454415',1,NULL,1,1,1,0,0,'',''),(130,'d318692015','###f61de4a5463ce55f2270e2a911bddc67','','d318692015@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 16:30:01','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(131,'d713236861','###ba90f815345c85dac2e00cbb6d68d606','','d713236861@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-07 16:33:20','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010742122',1,NULL,1,4,4,0,0,'',''),(132,'d964655922','###27570b609485852fb400589afef5d011','','d964655922@wancms.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-08 12:40:34','2017-03-07 17:57:49','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010142216',1,NULL,1,1,1,0,0,'',''),(133,'d983944619','###db3cceef838af6c00236e91953ac068d','','d983944619@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 11:07:42','2017-03-08 10:17:26','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(134,'d526824562','###b982ca791c360b77adcc2f7d42f6960d','','d526824562@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-08 11:13:52','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(135,'d429353691','###b1405e9fbf978d7ecfd8e7aaa1ea9edb','','d429353691@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-08 11:26:07','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(136,'d396705194','###aaa03e107a9458ceb058400c9d681f6e','','d396705194@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-08 11:34:08','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(137,'d884689443','###9dfd0eb6f6313993dbca95583a936ebd','','d884689443@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 13:37:08','2017-03-08 11:35:56','d609876641457c5e04029467d1d6ecee',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(138,'zzzzpppp','###27570b609485852fb400589afef5d011','','295729766@qq.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 13:31:03','2017-03-08 13:30:59','cc84caff753619a91457e17472f6bd53',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010504373',1,NULL,2,1,1,0,0,'',''),(139,'nangua','###27570b609485852fb400589afef5d011','','nangua@wancms.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2017-03-14 17:46:04','2017-03-08 13:40:38','',1,0,2,0,'',0,'10.2',1,3,'32EC6369-B7D8-4D1C-8694-A4CFF9',1,NULL,1,1,1,0,0,'',''),(140,'d239061854','###ff667da32a159360659957d2bbbf8dc2','','d239061854@wancms.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 14:03:30','2017-03-08 14:03:01','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(141,'d789903331','###a8d859458759382775192ac021751743','','d789903331@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-08 14:51:46','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(142,'d486355394','###d7fcfc7bd27de53d3954944b39449d5b','','d486355394@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2000-01-01 00:00:00','2017-03-08 15:10:29','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(143,'d465957686','###398cdb67e919cd61cb425e6dff377fae','','d465957686@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 17:14:02','2017-03-08 15:49:13','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(144,'d862771861','###27570b609485852fb400589afef5d011','','d862771861@miniyx.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-13 09:58:19','2017-03-08 16:47:00','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010349720',1,NULL,1,1,1,0,0,'',''),(145,'d790406146','###c5f5e23ed11829aaca752045987f2c8c','','d790406146@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2017-03-09 13:07:54','2017-03-08 17:29:47','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(146,'d868384934','###27570b609485852fb400589afef5d011','','d868384934@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.60.176','2017-03-08 17:43:42','2017-03-08 17:43:37','9afdf8e528b648b3bdfb8f72ad8507ee',1,0,2,0,'',0,'||android4.4.2',1,2,'864394010504373',1,NULL,1,1,1,0,0,'',''),(157,'d623574387','###a541e91ddd21e2d30231c91d03bdbcd9','','d623574387@miniyx.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-13 14:40:09','2017-03-13 14:32:38','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394011142215',1,NULL,1,7,7,0,0,'',''),(147,'d730406716','###01081b9a22bae1bfaf2f75cb2ec4d190','','d730406716@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2000-01-01 00:00:00','2017-03-09 16:02:12','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(148,'23dssa4','###6d41a1ca0b387b89db980be1d8491a7b','','23dssa4@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2000-01-01 00:00:00','2017-03-09 16:02:22','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(149,'dfd3434','###a3061897fdabcce1b9b30cb5077e25c4','','dfd3434@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2017-03-09 16:05:34','2017-03-09 16:05:30','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(150,'dfdf234','###c29c46fe66d59760216405810173ded6','','dfdf234@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2017-03-09 16:18:35','2017-03-09 16:13:11','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(151,'dghh455f','###5c2e574f0b0e4dada60da028d07cbb7f','','dghh455f@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.61.171','2000-01-01 00:00:00','2017-03-09 17:38:45','',1,0,2,0,'',0,'+8613285733669||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(152,'d950082508','###1eb5ea35488e54271fa550d2a300ba8b','','d950082508@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.56.153','2000-01-01 00:00:00','2017-03-10 13:51:41','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',1,NULL,1,4,4,0,0,'',''),(153,'d696572137','###da7be43f0e076f4c7b8a26230f2fe330','','d696572137@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.56.153','2000-01-01 00:00:00','2017-03-10 15:54:33','',1,0,2,0,'',0,'+8618368461620||android5.1',1,2,'867933028666240',1,NULL,1,1,1,0,0,'',''),(154,'fghj8566','###6b7eb56cc9be25a5e288dec16561ca0c','','fghj8566@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.228.56.153','2000-01-01 00:00:00','2017-03-10 16:15:32','',1,0,2,0,'',0,'+8618368461620||android5.1',1,2,'867933028666240',2,NULL,1,1,1,0,0,'',''),(155,'fghj4556','###5b1fb5096f5a7405128cf4ebb15b1374','','fghj4556@miniyx.com','',NULL,0,'2000-01-01',NULL,'111.1.158.18','2017-03-12 14:54:54','2017-03-10 16:20:11','',1,0,2,0,'',0,'+8618368461620||android5.1',1,2,'867933028666240',2,NULL,1,1,1,0,0,'',''),(156,'d726138775','###60c8f3162acfc682ebb71ff0b01618ce','','d726138775@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2017-03-14 13:44:16','2017-03-10 16:22:48','',1,0,2,0,'',0,'||android4.4.4',1,2,'A0000055E7FC1C',2,NULL,1,1,1,0,0,'',''),(158,'d128476516','###97ccfbba47a4d5a3dbacac8245f1075b','','d128476516@miniyx.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-13 14:41:40','2017-03-13 14:41:00','',1,0,2,0,'',0,'||android4.4.2',1,2,'864394011142215',1,NULL,1,7,10,0,0,'',''),(161,'d314968501','###417941937d5072a8b02ecf0d831b5f06','','d314968501@miniyx.com','',NULL,0,'2000-01-01',NULL,'118.29.185.230','2017-03-15 09:46:10','2017-03-15 09:46:05','',1,0,2,1,'',0,'||android4.4.2',1,2,'864394010527408',1,NULL,1,7,12,0,1,'',''),(159,'d546054253','###32e42f28318527e4c9cef921848c7738','','d546054253@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2000-01-01 00:00:00','2017-03-14 17:37:28','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(160,'d888797506','###10709d09f4d32b57787193508db7d72f','','d888797506@miniyx.com','',NULL,0,'2000-01-01',NULL,'115.227.8.86','2017-03-14 17:51:17','2017-03-14 17:48:48','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',1,NULL,1,1,1,0,0,'',''),(162,'d785955020','###61f0ff05f77df07ea424e14e1ed5060e','','d785955020@miniyx.com','',NULL,0,'2000-01-01',NULL,'112.17.244.194','2000-01-01 00:00:00','2017-03-15 14:24:56','',1,0,2,0,'',0,'||android6.0.1',1,2,'860707030366420',1,NULL,1,1,1,0,0,'',''),(163,'d368642361','###f4cda197ba7ef15c009dbf93a87d4aaf','','d368642361@miniyx.com','',NULL,0,'2000-01-01',NULL,'183.140.252.65','2017-03-28 17:00:07','2017-03-28 16:56:46','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',2,NULL,1,1,1,0,0,'',''),(164,'d899447348','###97e9b681e6b77f63dcaa2727cab2635e','','d899447348@miniyx.com','',NULL,0,'2000-01-01',NULL,'183.140.252.65','2017-03-28 17:01:04','2017-03-28 17:00:34','',1,0,2,0,'',0,'14906015868||android4.4.4',1,2,'859284662114500',2,NULL,1,1,1,0,0,'',''),(165,'15222291959','###27570b609485852fb400589afef5d011','','15222291959@wancms.com','',NULL,0,'2000-01-01',NULL,'180.90.192.249','2017-04-08 11:39:06','2017-04-08 11:39:06','',1,0,2,0,'15222291959',0,NULL,1,NULL,NULL,NULL,NULL,1,1,1,0,0,'张三','120224199211055918');
/*!40000 ALTER TABLE `mini_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_website`
--

DROP TABLE IF EXISTS `mini_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_website` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `host` varchar(50) NOT NULL COMMENT '域名',
  `template` varchar(50) NOT NULL COMMENT '相应的模板',
  `gid` int(8) NOT NULL COMMENT '游戏id',
  `title` varchar(100) NOT NULL COMMENT '官网名称',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `model` varchar(50) NOT NULL DEFAULT 'Official' COMMENT '模块',
  `pic1` varchar(255) NOT NULL COMMENT '游戏logo',
  `pic2` varchar(255) NOT NULL COMMENT '游戏背景图',
  `ucconfig` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_website`
--

LOCK TABLES `mini_website` WRITE;
/*!40000 ALTER TABLE `mini_website` DISABLE KEYS */;
INSERT INTO `mini_website` VALUES (1,'sxft.miniyx.com','template1',2,'兽血沸腾官网','兽血沸腾官网-迷你游戏；最炫最好玩的游戏尽在mini游戏平台','年度超火小说正版授权，《兽血再燃》力邀KO张彬彬代言，引爆3D魔幻硬国战。实时渲染引擎、国际化欧美画风，完美营造真实、梦幻的3D魔幻世界。超丰富冒险，百位英雄征战，24小时无限制PK—实时3V3MOBA、公会战、国战……超劲爆的战斗，点燃你的热血欲望！','Official','http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/game/20170315/58c8e8105f369.jpg','http://miniyx.oss-cn-beijing.aliyuncs.com/data/upload/game/20170315/58c8e76150357.jpg','');
/*!40000 ALTER TABLE `mini_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_yzm`
--

DROP TABLE IF EXISTS `mini_yzm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_yzm` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `yzm` int(32) DEFAULT NULL,
  `uid` varchar(20) DEFAULT NULL COMMENT '注册时存手机号其他是存相应的用户id',
  `type` int(2) NOT NULL COMMENT '类型1手机 2邮箱 3 cps提现（充值） 4 手机注册',
  `addtime` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_yzm`
--

LOCK TABLES `mini_yzm` WRITE;
/*!40000 ALTER TABLE `mini_yzm` DISABLE KEYS */;
INSERT INTO `mini_yzm` VALUES (1,137190,'15157427985',4,1488529507),(2,546688,'2',2,0),(3,381380,'2',2,0),(4,368630,'2',1,1488784145),(5,669266,NULL,0,0),(6,834198,NULL,0,0),(7,173235,'137',2,0),(8,320590,'137',2,0),(9,152486,'2',2,0),(10,714447,'146',2,0),(11,718086,'2',2,0),(12,928299,'146',2,0),(13,23913,'146',2,0),(14,849583,'2',2,0),(15,234895,NULL,4,1489006819),(16,548531,'2',2,0),(17,65526,'2',2,0),(18,905436,'2',2,0),(19,575196,'2',2,0),(20,450125,'2',2,0),(21,234435,'2',2,0),(22,436673,'2',2,0),(23,413950,'2',2,0),(24,291826,'2',2,0),(25,390164,'2',2,0),(26,330481,'2',2,0),(27,743022,'2',2,0),(28,397125,'1',2,0),(29,615305,'138',2,0),(30,317355,'2',1,1489046900),(31,6187,'2',2,1489046922),(32,225857,NULL,4,1489474464),(33,896276,NULL,4,1489674958),(34,890102,NULL,4,1490092738),(35,201029,NULL,4,1490193561),(36,341357,NULL,4,1490837506),(37,292503,NULL,4,1490839033),(38,672960,'15222291959',4,1491620176),(39,132456,'15222291959',4,1491622516);
/*!40000 ALTER TABLE `mini_yzm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 18:01:41
