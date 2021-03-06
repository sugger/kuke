-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-09-16 18:03:26
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2admin`
--

-- --------------------------------------------------------

--
-- 表的结构 `yii2_ad`
--

CREATE TABLE IF NOT EXISTS `yii2_ad` (
  `id` int(8) NOT NULL,
  `type` tinyint(3) NOT NULL COMMENT '类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='图片广告';

--
-- 转存表中的数据 `yii2_ad`
--

INSERT INTO `yii2_ad` (`id`, `type`, `title`, `image`, `url`, `sort`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '测试广告1', '1', 'http://www.imhaigui.com', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_admin`
--

CREATE TABLE IF NOT EXISTS `yii2_admin` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '密码',
  `salt` char(32) NOT NULL COMMENT '密码干扰字符',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态 1正常 0禁用'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `yii2_admin`
--

INSERT INTO `yii2_admin` (`uid`, `username`, `password`, `salt`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', 'phphome111@qq.com', '13565231112', 1457922160, 2130706433, 1457922174, 2130706433, 1481278788, 1),
(2, 'feifei', '$2y$13$jqWGlVo8T3qtnWUX0kTX/ON5ctvokzkQ7RAvKuNRjN.WvxgBlFK4u', 'tzDsmCSLbtktnvbgn1YeEqslYOBo1Cn9', 'php11111@qq.com', '13631568985', 1458028401, 2130706433, 1458028401, 2130706433, 1504770002, 0),
(6, 'guanli', '$2y$13$QK.CEi7HHuTSIMbq5RbzeOfTNgrX8mUTl/noBkHtD/zKEf7y.SQO6', '_4F9_ptxkohU247kgi7UB4rg3UMYqo14', 'phphome222@qq.com', '13565656565', 1476438209, 2130706433, 0, 2130706433, 0, 1),
(7, 'huang', '$2y$13$SO1qMnykM3MJuNizsqzQH.QBjPPDZ7U556yUtmSU3optwZ1EdWm0W', 'nkqZMhWkbIsjZrF1J8laC1UxWoXPRobA', 'phphome@qqqqq.com', '13656589562', 1481000197, 3232243969, 0, 2130706433, 1481003421, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_admin_log`
--

CREATE TABLE IF NOT EXISTS `yii2_admin_log` (
  `id` int(8) NOT NULL,
  `uid` int(8) NOT NULL COMMENT '用户uid',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `controller` varchar(50) NOT NULL COMMENT '控制器',
  `action` varchar(50) NOT NULL COMMENT '动作',
  `querystring` varchar(255) NOT NULL COMMENT '查询字符串',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台日志';

--
-- 转存表中的数据 `yii2_admin_log`
--

INSERT INTO `yii2_admin_log` (`id`, `uid`, `title`, `controller`, `action`, `querystring`, `remark`, `ip`, `create_time`, `status`) VALUES
(1, 2, '修改菜单', 'menu', 'index', '/admin.php/menu/index?id=4', '用户修改了菜单', '192.168.0.101', 1435658950, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_ad_type`
--

CREATE TABLE IF NOT EXISTS `yii2_ad_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `createtime` int(11) NOT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_bin NOT NULL COMMENT '0隐藏1显示2删除'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `yii2_ad_type`
--

INSERT INTO `yii2_ad_type` (`id`, `name`, `createtime`, `status`) VALUES
(1, '测试广告', 0, '1');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_article`
--

CREATE TABLE IF NOT EXISTS `yii2_article` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(8) unsigned DEFAULT NULL COMMENT '封面ID',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `extend` text COMMENT '扩展内容array',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `up` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '支持数',
  `down` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '反对数',
  `view` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0回收站 1正常'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `yii2_article`
--

INSERT INTO `yii2_article` (`id`, `category_id`, `name`, `title`, `cover`, `description`, `content`, `extend`, `link`, `up`, `down`, `view`, `sort`, `create_time`, `update_time`, `status`) VALUES
(3, 1, 'jieshao', '帆海汇介绍', 4, '帆海汇介绍', '<p><img src=\\"/storage/web/image/201610/1476271961130042.png\\" title=\\"1476271961130042.png\\" alt=\\"icon_nav_button.png\\"/></p>', '', '', 0, 0, 0, 0, 1473606822, 1476272167, 1),
(2, 1, 'aboutus', '关于我们', 7, '关于我们', '<p><img src=\\"http://www.yii2.cn/storage/web/image/201611/editor1477984899430443.png\\" title=\\"editor1477984899430443.png\\" alt=\\"qrcode.png\\"/>这里是关于我们的内容</p>', 'a:4:{i:1;s:3:"222";i:3;s:4:"3434";i:6;s:5:"sdfsa";s:1:"s";s:4:"sdsf";}', '', 0, 0, 0, 0, 1472611249, 1477984905, 1),
(4, 1, 'julebu', '帆船俱乐部', 0, '帆船俱乐部', '<p>帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部帆船俱乐部</p>', '', '', 0, 0, 0, 0, 1473606857, 0, 1),
(5, 1, 'peixun', '培训中心', 0, '培训中心', '<p>培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心培训中心</p>', '', '', 0, 0, 0, 0, 1473606890, 0, 1),
(6, 1, 'lianxi', '联系我们', 0, '联系我们', '<p>联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们</p>', '', '', 0, 0, 0, 0, 1473606916, 0, 1),
(7, 1, 'hezuo', '合作伙伴', 0, '合作伙伴', '<p>合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴</p>', '', '', 0, 0, 0, 0, 1473606940, 0, 1),
(8, 3, '', '活动内容1111111', 0, '活动内容1111111', '<p>活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111活动内容1111111</p>', '', '', 0, 0, 0, 0, 1473607011, 1473608688, 1),
(9, 3, '', '活动内容222222', 0, '活动内容222222', '<p>活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222活动内容222222</p>', '', '', 0, 0, 0, 0, 1473607032, 1473608697, 1),
(10, 3, '', '活动内容333333', 14, '活动内容333333', '<p><img src="\\&quot;http://www.yii2.cn/storage/image/201610/editor1477901835457115.png\\&quot;" title="\\&quot;editor1477901835457115.png\\&quot;" alt="\\&quot;icon_nav_dialog.png\\&quot;/"/>活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333活动内容333333</p>', '', '', 0, 0, 0, 0, 1473607048, 1501235747, 1),
(11, 1, 'testabout', '测试关于我们', 13, '文章描述', '<p>文章内容<img src=\\"/storage/image/201612/editor1481280050913260.png\\" title=\\"editor1481280050913260.png\\" alt=\\"ad.png\\"/></p>', '', '', 0, 0, 0, 0, 1480907480, 1481280055, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_article_cat`
--

CREATE TABLE IF NOT EXISTS `yii2_article_cat` (
  `id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `link` varchar(250) DEFAULT '' COMMENT '外链',
  `extend` text COMMENT '扩展设置',
  `meta_title` varchar(50) DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `yii2_article_cat`
--

INSERT INTO `yii2_article_cat` (`id`, `pid`, `name`, `title`, `link`, `extend`, `meta_title`, `keywords`, `description`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 0, 'about', '关于我们', '', '', '', '', '', 1379474947, 1479373724, 10, 1),
(3, 0, 'event', '活动', '', 'a:2:{s:2:"sd";s:2:"11";s:4:"sdfs";s:3:"222";}', '测试标题', '测试seo关键词', '测试描述', 1471947194, 1473604631, 1, 1),
(4, 1, 'lianxi', '联系我们', '', '', '', '', '', 1479368832, 0, 0, 1),
(5, 3, 'xin', '最新活动', '', '', '', '', '', 1479368867, 1479373985, 10, 1),
(6, 3, 'hot', '热门活动', '', '', '', '', '', 1479373707, 1481280086, 9, 1),
(7, 4, 'lianxi3', '联系我们3', '', '', '', '', '', 1479374778, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_article_position`
--

CREATE TABLE IF NOT EXISTS `yii2_article_position` (
  `id` int(11) NOT NULL,
  `article_id` int(8) unsigned NOT NULL COMMENT '文章ID',
  `position_id` int(4) unsigned NOT NULL COMMENT '推荐位ID'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='文章推荐位映射表';

--
-- 转存表中的数据 `yii2_article_position`
--

INSERT INTO `yii2_article_position` (`id`, `article_id`, `position_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 8, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_article_tag`
--

CREATE TABLE IF NOT EXISTS `yii2_article_tag` (
  `article_id` int(8) NOT NULL COMMENT '文章ID',
  `tag_id` int(8) NOT NULL COMMENT '标签ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='文章标签映射表';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL COMMENT '角色名称 role',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `yii2_auth_assignment`
--

INSERT INTO `yii2_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', '1', 1476437918),
('administrator', '4', 1460012730),
('administrator', '6', 1476438227),
('editor', '2', 1476437926),
('editor', '7', 1481279497);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_auth_item`
--

CREATE TABLE IF NOT EXISTS `yii2_auth_item` (
  `name` varchar(64) NOT NULL COMMENT '角色或权限名称',
  `type` int(11) NOT NULL COMMENT '1角色 2权限',
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `yii2_auth_item`
--

INSERT INTO `yii2_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('action/actionlog', 2, '', 'action/actionlog', '', 1460031880, 1460031880),
('action/edit', 2, '', 'action/edit', '', 1460031880, 1460031880),
('ad/add', 2, NULL, 'ad/add', NULL, 1476437984, 1476437984),
('ad/delete', 2, NULL, 'ad/delete', NULL, 1476437984, 1476437984),
('ad/edit', 2, NULL, 'ad/edit', NULL, 1476437984, 1476437984),
('ad/index', 2, NULL, 'ad/index', NULL, 1476437984, 1476437984),
('Addons/addHook', 2, NULL, 'Addons/addHook', NULL, 1472528088, 1472528088),
('Addons/adminList', 2, NULL, 'Addons/adminList', NULL, 1472528088, 1472528088),
('Addons/edithook', 2, NULL, 'Addons/edithook', NULL, 1472528088, 1472528088),
('Addons/execute', 2, NULL, 'Addons/execute', NULL, 1472528088, 1472528088),
('Addons/hooks', 2, NULL, 'Addons/hooks', NULL, 1472528088, 1472528088),
('Addons/index', 2, '', 'Addons/index', '', 1460030539, 1460030539),
('admin/add', 2, NULL, 'admin/add', NULL, 1472528089, 1472528089),
('admin/auth', 2, NULL, 'admin/auth', NULL, 1472528089, 1472528089),
('admin/edit', 2, NULL, 'admin/edit', NULL, 1472528089, 1472528089),
('admin/index', 2, NULL, 'admin/index', NULL, 1472528089, 1472528089),
('administrator', 1, 'administrator角色12', NULL, NULL, 1465352150, 1476446363),
('article/add', 2, '', 'article/add', '', 1460027926, 1460027926),
('article/autoSave', 2, '', 'article/autoSave', '', 1460027926, 1460027926),
('article/batchOperate', 2, '', 'article/batchOperate', '', 1460027926, 1460027926),
('article/clear', 2, '', 'article/clear', '', 1460027927, 1460027927),
('article/copy', 2, '', 'article/copy', '', 1460027926, 1460027926),
('article/edit', 2, '', 'article/edit', '', 1460027926, 1460027926),
('Article/examine', 2, '', 'Article/examine', '', 1460027927, 1460027927),
('article/index', 2, '', 'article/index', '', 1460027926, 1460027926),
('article/move', 2, '', 'article/move', '', 1460027926, 1460027926),
('article/paste', 2, '', 'article/paste', '', 1460027926, 1460027926),
('article/permit', 2, '', 'article/permit', '', 1460027927, 1460027927),
('article/recycle', 2, '', 'article/recycle', '', 1460027927, 1460027927),
('article/setStatus', 2, '', 'article/setStatus', '', 1460027926, 1460027926),
('Article/sort', 2, '', 'Article/sort', '', 1460027927, 1460027927),
('article/update', 2, '', 'article/update', '', 1460027926, 1460027926),
('attribute/add', 2, '', 'attribute/add', '', 1460031881, 1460031881),
('attribute/edit', 2, '', 'attribute/edit', '', 1460031881, 1460031881),
('attribute/index1', 2, '', 'attribute/index1', '', 1460031881, 1460031881),
('attribute/setStatus', 2, '', 'attribute/setStatus', '', 1460031881, 1460031881),
('attribute/update', 2, '', 'attribute/update', '', 1460031881, 1460031881),
('auth/access', 2, '', 'auth/access', '', 1460031879, 1460031879),
('auth/add', 2, NULL, 'auth/add', NULL, 1472528089, 1472528089),
('auth/addToCategory', 2, '', 'auth/addToCategory', '', 1460031880, 1460031880),
('auth/addToGroup', 2, '', 'auth/addToGroup', '', 1460031880, 1460031880),
('auth/addToModel', 2, '', 'auth/addToModel', '', 1460031880, 1460031880),
('auth/auth', 2, '', 'auth/auth', '', 1460031879, 1460031879),
('auth/category', 2, '', 'auth/category', '', 1460031880, 1460031880),
('auth/changeStatus?method=deleteGroup', 2, '', 'auth/changeStatus?method=deleteGroup', '', 1460031879, 1460031879),
('auth/changeStatus?method=forbidGroup', 2, '', 'auth/changeStatus?method=forbidGroup', '', 1460031879, 1460031879),
('auth/changeStatus?method=resumeGroup', 2, '', 'auth/changeStatus?method=resumeGroup', '', 1460031879, 1460031879),
('auth/createGroup', 2, '', 'auth/createGroup', '', 1460031879, 1460031879),
('auth/delete', 2, NULL, 'auth/delete', NULL, 1472528089, 1472528089),
('auth/edit', 2, NULL, 'auth/edit', NULL, 1472528089, 1472528089),
('auth/editGroup', 2, '', 'auth/editGroup', '', 1460031879, 1460031879),
('auth/index', 2, '', 'auth/index', '', 1200000000, 1300000000),
('auth/modelauth', 2, '', 'auth/modelauth', '', 1460031880, 1460031880),
('auth/removeFromGroup', 2, '', 'auth/removeFromGroup', '', 1460031880, 1460031880),
('auth/user', 2, '', 'auth/user', '', 1460031880, 1460031880),
('auth/writeGroup', 2, '', 'auth/writeGroup', '', 1460031879, 1460031879),
('category/add', 2, '', 'category/add', '', 1460031882, 1460031882),
('category/edit', 2, '', 'category/edit', '', 1460031882, 1460031882),
('category/index', 2, '', 'category/index', '', 1460031882, 1460031882),
('category/operate/type/merge', 2, '', 'category/operate/type/merge', '', 1460031882, 1460031882),
('category/operate/type/move', 2, '', 'category/operate/type/move', '', 1460031882, 1460031882),
('category/remove', 2, '', 'category/remove', '', 1460031882, 1460031882),
('certificate/delete', 2, NULL, 'certificate/delete', NULL, 1476437984, 1476437984),
('certificate/edit', 2, NULL, 'certificate/edit', NULL, 1476437983, 1476437983),
('certificate/index', 2, NULL, 'certificate/index', NULL, 1476437983, 1476437983),
('channel/add', 2, '', 'channel/add', '', 1460031884, 1460031884),
('channel/del', 2, '', 'channel/del', '', 1460031885, 1460031885),
('channel/edit', 2, '', 'channel/edit', '', 1460031884, 1460031884),
('channel/index', 2, '', 'channel/index', '', 1460031884, 1460031884),
('config/add', 2, '', 'config/add', '', 1460031883, 1460031883),
('config/del', 2, '', 'config/del', '', 1460031883, 1460031883),
('config/edit', 2, '', 'config/edit', '', 1460031883, 1460031883),
('config/group', 2, '', 'config/group', '', 1452653200, 1452653210),
('config/index', 2, '', 'config/index', '', 1452653200, 1452653210),
('config/save', 2, '', 'config/save', '', 1460031883, 1460031883),
('Config/sort', 2, '', 'Config/sort', '', 1460031884, 1460031884),
('database/del', 2, '', 'database/del', '', 1460031882, 1460031882),
('database/export', 2, '', 'database/export', '', 1460031881, 1460031881),
('database/import', 2, '', 'database/import', '', 1460031882, 1460031882),
('database/index?type=export', 2, '数据库导出', 'database/index?type=export', '', 120000000, 130000000),
('database/index?type=import', 2, '数据库导入', 'database/index?type=import', '', 1200000000, 1300000000),
('database/optimize', 2, '', 'database/optimize', '', 1460031881, 1460031881),
('database/repair', 2, '', 'database/repair', '', 1460031881, 1460031881),
('editor', 1, 'editor 网站编辑角色', NULL, '', 1356232000, 1400000000),
('group/add', 2, NULL, 'group/add', NULL, 1476437986, 1476437986),
('group/delete', 2, NULL, 'group/delete', NULL, 1476437986, 1476437986),
('group/edit', 2, NULL, 'group/edit', NULL, 1476437986, 1476437986),
('group/index', 2, NULL, 'group/index', NULL, 1476437986, 1476437986),
('index/index', 2, '', 'index/index', '', 1356542542, 1425652320),
('log/index', 2, NULL, 'log/index', NULL, 1472528090, 1472528090),
('log/view', 2, NULL, 'log/view', NULL, 1472528090, 1472528090),
('login/logout', 2, '', 'login/logout', '', 1356565230, 1452653210),
('menu/add', 2, '', 'menu/add', '', 1460031884, 1460031884),
('menu/edit', 2, '', 'menu/edit', '', 1460031884, 1460031884),
('Menu/import', 2, '', 'Menu/import', '', 1460031884, 1460031884),
('menu/index', 2, '', 'menu/index', '', 1452653200, 1452653210),
('Menu/sort', 2, '', 'Menu/sort', '', 1460031884, 1460031884),
('model/add', 2, '', 'model/add', '', 1460031882, 1460031882),
('model/edit', 2, '', 'model/edit', '', 1460031883, 1460031883),
('Model/generate', 2, '', 'Model/generate', '', 1460031019, 1460031019),
('Model/index', 2, '', 'Model/index', '', 1460031882, 1460031882),
('model/setStatus', 2, '', 'model/setStatus', '', 1460031883, 1460031883),
('model/update', 2, '', 'model/update', '', 1460031883, 1460031883),
('order/add', 2, NULL, 'order/add', NULL, 1476438050, 1476438050),
('order/delete', 2, NULL, 'order/delete', NULL, 1476438050, 1476438050),
('order/edit', 2, NULL, 'order/edit', NULL, 1476438049, 1476438049),
('order/index', 2, NULL, 'order/index', NULL, 1472528088, 1472528088),
('other', 2, NULL, 'other', NULL, 1472528090, 1472528090),
('shop/add', 2, NULL, 'shop/add', NULL, 1476437985, 1476437985),
('shop/delete', 2, NULL, 'shop/delete', NULL, 1476437985, 1476437985),
('shop/edit', 2, NULL, 'shop/edit', NULL, 1476437985, 1476437985),
('shop/group', 2, NULL, 'shop/group', NULL, 1472528088, 1472528088),
('shop/index', 2, NULL, 'shop/index', NULL, 1481279433, 1481279433),
('shop/index&type=1', 2, NULL, 'shop/index&type=1', NULL, 1472528087, 1472528087),
('shop/index&type=2', 2, NULL, 'shop/index&type=2', NULL, 1472528087, 1472528087),
('shop/index&type=3', 2, NULL, 'shop/index&type=3', NULL, 1472528087, 1472528087),
('shop/index&type=4', 2, NULL, 'shop/index&type=4', NULL, 1472528088, 1472528088),
('shop/index?type=1', 2, NULL, 'shop/index?type=1', NULL, 1476437985, 1476437985),
('shop/index?type=2', 2, NULL, 'shop/index?type=2', NULL, 1476437986, 1476437986),
('shop/index?type=3', 2, NULL, 'shop/index?type=3', NULL, 1476437986, 1476437986),
('shop/index?type=4', 2, NULL, 'shop/index?type=4', NULL, 1476437986, 1476437986),
('think/add', 2, '', 'think/add', '', 1460031883, 1460031883),
('think/edit', 2, '', 'think/edit', '', 1460031019, 1460031019),
('think/lists', 2, '', 'think/lists', '', 1460031020, 1460031020),
('train/add', 2, NULL, 'train/add', NULL, 1476437985, 1476437985),
('train/delete', 2, NULL, 'train/delete', NULL, 1476437984, 1476437984),
('train/edit', 2, NULL, 'train/edit', NULL, 1476437984, 1476437984),
('train/index', 2, NULL, 'train/index', NULL, 1472528088, 1472528088),
('traintype/delete', 2, NULL, 'traintype/delete', NULL, 1476437984, 1476437984),
('traintype/edit', 2, NULL, 'traintype/edit', NULL, 1476437984, 1476437984),
('traintype/index', 2, NULL, 'traintype/index', NULL, 1476437984, 1476437984),
('user/action', 2, '', 'user/action', '', 1460031878, 1460031878),
('user/add', 2, '', 'user/add', '', 1460031878, 1460031878),
('user/addaction', 2, '', 'user/addaction', '', 1460031878, 1460031878),
('user/auth', 2, '', 'user/auth', '', 1460031878, 1460031878),
('User/changeStatus?method=deleteUser', 2, '', 'User/changeStatus?method=deleteUser', '', 1460031879, 1460031879),
('user/changeStatus?method=forbidUser', 2, '', 'user/changeStatus?method=forbidUser', '', 1460031878, 1460031878),
('user/changeStatus?method=resumeUser', 2, '', 'user/changeStatus?method=resumeUser', '', 1460031878, 1460031878),
('user/delete', 2, NULL, 'user/delete', NULL, 1476438050, 1476438050),
('user/edit', 2, NULL, 'user/edit', NULL, 1476438051, 1476438051),
('user/editaction', 2, '', 'user/editaction', '', 1460031878, 1460031878),
('user/index', 2, '', 'user/index', '', 1200000000, 1230000000),
('user/saveAction', 2, '', 'user/saveAction', '', 1460031878, 1460031878),
('user/setStatus', 2, '', 'user/setStatus', '', 1460031878, 1460031878),
('user/updateNickname', 2, '', 'user/updateNickname', '', 1460031881, 1460031881),
('user/updatePassword', 2, '', 'user/updatePassword', '', 1460031881, 1460031881);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `yii2_auth_item_child`
--

INSERT INTO `yii2_auth_item_child` (`parent`, `child`) VALUES
('administrator', 'ad/add'),
('administrator', 'ad/delete'),
('administrator', 'ad/edit'),
('administrator', 'ad/index'),
('administrator', 'admin/index'),
('administrator', 'article/add'),
('administrator', 'article/autoSave'),
('administrator', 'article/clear'),
('administrator', 'article/edit'),
('administrator', 'article/index'),
('administrator', 'article/move'),
('administrator', 'article/permit'),
('administrator', 'article/recycle'),
('administrator', 'article/setStatus'),
('administrator', 'article/update'),
('administrator', 'attribute/add'),
('administrator', 'attribute/edit'),
('administrator', 'attribute/index1'),
('administrator', 'attribute/setStatus'),
('administrator', 'attribute/update'),
('administrator', 'auth/index'),
('administrator', 'category/add'),
('administrator', 'category/edit'),
('administrator', 'category/index'),
('administrator', 'category/operate/type/merge'),
('administrator', 'category/operate/type/move'),
('administrator', 'category/remove'),
('administrator', 'certificate/delete'),
('administrator', 'certificate/edit'),
('administrator', 'certificate/index'),
('administrator', 'config/add'),
('administrator', 'config/del'),
('administrator', 'config/edit'),
('administrator', 'config/group'),
('administrator', 'config/index'),
('administrator', 'config/save'),
('administrator', 'Config/sort'),
('administrator', 'database/del'),
('administrator', 'database/export'),
('administrator', 'database/import'),
('administrator', 'database/index?type=export'),
('administrator', 'database/index?type=import'),
('administrator', 'database/optimize'),
('administrator', 'database/repair'),
('administrator', 'group/add'),
('administrator', 'group/delete'),
('administrator', 'group/edit'),
('administrator', 'group/index'),
('administrator', 'index/index'),
('administrator', 'log/index'),
('administrator', 'log/view'),
('administrator', 'menu/add'),
('administrator', 'menu/edit'),
('administrator', 'Menu/import'),
('administrator', 'menu/index'),
('administrator', 'Menu/sort'),
('administrator', 'order/add'),
('administrator', 'order/delete'),
('administrator', 'order/edit'),
('administrator', 'order/index'),
('administrator', 'other'),
('administrator', 'shop/add'),
('administrator', 'shop/delete'),
('administrator', 'shop/edit'),
('administrator', 'shop/index?type=1'),
('administrator', 'shop/index?type=2'),
('administrator', 'shop/index?type=3'),
('administrator', 'shop/index?type=4'),
('administrator', 'train/add'),
('administrator', 'train/delete'),
('administrator', 'train/edit'),
('administrator', 'train/index'),
('administrator', 'traintype/delete'),
('administrator', 'traintype/edit'),
('administrator', 'traintype/index'),
('administrator', 'user/add'),
('administrator', 'user/delete'),
('administrator', 'user/edit'),
('administrator', 'user/index'),
('administrator', 'user/updateNickname'),
('administrator', 'user/updatePassword'),
('editor', 'ad/add'),
('editor', 'ad/delete'),
('editor', 'ad/edit'),
('editor', 'ad/index'),
('editor', 'article/add'),
('editor', 'article/autoSave'),
('editor', 'article/clear'),
('editor', 'article/edit'),
('editor', 'article/index'),
('editor', 'article/move'),
('editor', 'article/permit'),
('editor', 'article/recycle'),
('editor', 'article/setStatus'),
('editor', 'article/update'),
('editor', 'category/add'),
('editor', 'category/edit'),
('editor', 'category/index'),
('editor', 'category/operate/type/merge'),
('editor', 'category/remove'),
('editor', 'certificate/delete'),
('editor', 'certificate/edit'),
('editor', 'certificate/index'),
('editor', 'group/add'),
('editor', 'group/delete'),
('editor', 'group/edit'),
('editor', 'group/index'),
('editor', 'index/index'),
('editor', 'shop/add'),
('editor', 'shop/delete'),
('editor', 'shop/edit'),
('editor', 'shop/index'),
('editor', 'shop/index?type=1'),
('editor', 'shop/index?type=2'),
('editor', 'shop/index?type=3'),
('editor', 'shop/index?type=4'),
('editor', 'train/add'),
('editor', 'train/delete'),
('editor', 'train/edit'),
('editor', 'train/index'),
('editor', 'traintype/delete'),
('editor', 'traintype/edit'),
('editor', 'traintype/index');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_auth_rule`
--

CREATE TABLE IF NOT EXISTS `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text COMMENT 'serialize后的rule对象',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `yii2_auth_rule`
--

INSERT INTO `yii2_auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('action/actionlog', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"action/actionlog";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('action/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"action/edit";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('ad/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:6:"ad/add";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('ad/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"ad/delete";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('ad/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:7:"ad/edit";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('ad/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"ad/index";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('Addons/addHook', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"Addons/addHook";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('Addons/adminList', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"Addons/adminList";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('Addons/edithook', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"Addons/edithook";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('Addons/execute', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"Addons/execute";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('Addons/hooks', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"Addons/hooks";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('Addons/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"Addons/index";s:9:"createdAt";i:1460030539;s:9:"updatedAt";i:1460030539;}', 1460030539, 1460030539),
('admin/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"admin/add";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('admin/auth', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"admin/auth";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('admin/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"admin/edit";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('admin/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"admin/index";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('article/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"article/add";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/autoSave', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"article/autoSave";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/batchOperate', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:20:"article/batchOperate";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/clear', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"article/clear";s:9:"createdAt";i:1460027927;s:9:"updatedAt";i:1460027927;}', 1460027927, 1460027927),
('article/copy', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"article/copy";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"article/edit";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('Article/examine', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"Article/examine";s:9:"createdAt";i:1460027927;s:9:"updatedAt";i:1460027927;}', 1460027927, 1460027927),
('article/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"article/index";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/move', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"article/move";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/paste', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"article/paste";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('article/permit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"article/permit";s:9:"createdAt";i:1460027927;s:9:"updatedAt";i:1460027927;}', 1460027927, 1460027927),
('article/recycle', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"article/recycle";s:9:"createdAt";i:1460027927;s:9:"updatedAt";i:1460027927;}', 1460027927, 1460027927),
('article/setStatus', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"article/setStatus";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('Article/sort', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"Article/sort";s:9:"createdAt";i:1460027927;s:9:"updatedAt";i:1460027927;}', 1460027927, 1460027927),
('article/update', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"article/update";s:9:"createdAt";i:1460027926;s:9:"updatedAt";i:1460027926;}', 1460027926, 1460027926),
('attribute/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"attribute/add";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('attribute/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"attribute/edit";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('attribute/index1', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"attribute/index1";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('attribute/setStatus', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:19:"attribute/setStatus";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('attribute/update', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"attribute/update";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('auth/access', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"auth/access";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"auth/add";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('auth/addToCategory', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:18:"auth/addToCategory";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/addToGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"auth/addToGroup";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/addToModel', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"auth/addToModel";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/auth', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"auth/auth";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/category', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"auth/category";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/changeStatus?method=deleteGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:36:"auth/changeStatus?method=deleteGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/changeStatus?method=forbidGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:36:"auth/changeStatus?method=forbidGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/changeStatus?method=resumeGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:36:"auth/changeStatus?method=resumeGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/createGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"auth/createGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"auth/delete";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('auth/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"auth/edit";s:9:"createdAt";i:1472528089;s:9:"updatedAt";i:1472528089;}', 1472528089, 1472528089),
('auth/editGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"auth/editGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('auth/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"auth/index";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1456542110, 1456542120),
('auth/modelauth', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"auth/modelauth";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/removeFromGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:20:"auth/removeFromGroup";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/user', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"auth/user";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880),
('auth/writeGroup', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"auth/writeGroup";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('category/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"category/add";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('category/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"category/edit";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('category/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"category/index";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('category/operate/type/merge', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:27:"category/operate/type/merge";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('category/operate/type/move', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:26:"category/operate/type/move";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('category/remove', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"category/remove";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('certificate/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:18:"certificate/delete";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('certificate/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"certificate/edit";s:9:"createdAt";i:1476437983;s:9:"updatedAt";i:1476437983;}', 1476437983, 1476437983),
('certificate/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"certificate/index";s:9:"createdAt";i:1476437983;s:9:"updatedAt";i:1476437983;}', 1476437983, 1476437983),
('channel/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"channel/add";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('channel/del', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"channel/del";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('channel/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"channel/edit";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('channel/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:13:"channel/index";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('config/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"config/add";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('config/del', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"config/del";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('config/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"config/edit";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('config/group', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"config/group";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1200000000, 1300000000),
('config/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"config/index";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1200000000, 1300000000),
('config/save', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"config/save";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('Config/sort', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"Config/sort";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('database/del', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"database/del";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('database/export', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"database/export";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('database/import', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"database/import";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('database/index?type=export', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:26:"database/index?type=export";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1456542110, 1456542120),
('database/index?type=import', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:26:"database/index?type=import";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1456542110, 1456542120),
('database/optimize', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"database/optimize";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('database/repair', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"database/repair";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('group/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"group/add";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('group/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"group/delete";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('group/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"group/edit";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('group/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"group/index";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('index/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"index/index";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1456542110, 1456542120),
('log/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"log/index";s:9:"createdAt";i:1472528090;s:9:"updatedAt";i:1472528090;}', 1472528090, 1472528090),
('log/view', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"log/view";s:9:"createdAt";i:1472528090;s:9:"updatedAt";i:1472528090;}', 1472528090, 1472528090),
('login/logout', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"login/logout";s:9:"createdAt";i:1459148665;s:9:"updatedAt";i:1459148675;}', 1456542110, 1456542120),
('menu/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"menu/add";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('menu/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"menu/edit";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('Menu/import', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"Menu/import";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('menu/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"menu/index";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1200000000, 1300000000),
('Menu/sort', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"Menu/sort";s:9:"createdAt";i:1460031884;s:9:"updatedAt";i:1460031884;}', 1460031884, 1460031884),
('model/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"model/add";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('model/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"model/edit";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('Model/generate', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"Model/generate";s:9:"createdAt";i:1460031019;s:9:"updatedAt";i:1460031019;}', 1460031019, 1460031019),
('Model/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"Model/index";s:9:"createdAt";i:1460031882;s:9:"updatedAt";i:1460031882;}', 1460031882, 1460031882),
('model/setStatus', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"model/setStatus";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('model/update', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"model/update";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('order/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"order/add";s:9:"createdAt";i:1476438050;s:9:"updatedAt";i:1476438050;}', 1476438050, 1476438050),
('order/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"order/delete";s:9:"createdAt";i:1476438049;s:9:"updatedAt";i:1476438049;}', 1476438049, 1476438049),
('order/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"order/edit";s:9:"createdAt";i:1476438049;s:9:"updatedAt";i:1476438049;}', 1476438049, 1476438049),
('order/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"order/index";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('other', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:5:"other";s:9:"createdAt";i:1472528090;s:9:"updatedAt";i:1472528090;}', 1472528090, 1472528090),
('shop/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"shop/add";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('shop/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"shop/delete";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('shop/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"shop/edit";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('shop/group', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"shop/group";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('shop/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"shop/index";s:9:"createdAt";i:1481279433;s:9:"updatedAt";i:1481279433;}', 1481279433, 1481279433),
('shop/index&type=1', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index&type=1";s:9:"createdAt";i:1472528087;s:9:"updatedAt";i:1472528087;}', 1472528087, 1472528087),
('shop/index&type=2', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index&type=2";s:9:"createdAt";i:1472528087;s:9:"updatedAt";i:1472528087;}', 1472528087, 1472528087),
('shop/index&type=3', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index&type=3";s:9:"createdAt";i:1472528087;s:9:"updatedAt";i:1472528087;}', 1472528087, 1472528087),
('shop/index&type=4', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index&type=4";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('shop/index?type=1', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index?type=1";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('shop/index?type=2', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index?type=2";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('shop/index?type=3', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index?type=3";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('shop/index?type=4', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:17:"shop/index?type=4";s:9:"createdAt";i:1476437986;s:9:"updatedAt";i:1476437986;}', 1476437986, 1476437986),
('think/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"think/add";s:9:"createdAt";i:1460031883;s:9:"updatedAt";i:1460031883;}', 1460031883, 1460031883),
('think/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"think/edit";s:9:"createdAt";i:1460031019;s:9:"updatedAt";i:1460031019;}', 1460031019, 1460031019),
('think/lists', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"think/lists";s:9:"createdAt";i:1460031020;s:9:"updatedAt";i:1460031020;}', 1460031020, 1460031020),
('train/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"train/add";s:9:"createdAt";i:1476437985;s:9:"updatedAt";i:1476437985;}', 1476437985, 1476437985),
('train/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:12:"train/delete";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('train/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"train/edit";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('train/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"train/index";s:9:"createdAt";i:1472528088;s:9:"updatedAt";i:1472528088;}', 1472528088, 1472528088),
('traintype/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:16:"traintype/delete";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('traintype/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"traintype/edit";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('traintype/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"traintype/index";s:9:"createdAt";i:1476437984;s:9:"updatedAt";i:1476437984;}', 1476437984, 1476437984),
('user/action', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"user/action";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/add', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:8:"user/add";s:9:"createdAt";i:1460031877;s:9:"updatedAt";i:1460031877;}', 1460031877, 1460031877),
('user/addaction', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"user/addaction";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/auth', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"user/auth";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('User/changeStatus?method=deleteUser', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:35:"User/changeStatus?method=deleteUser";s:9:"createdAt";i:1460031879;s:9:"updatedAt";i:1460031879;}', 1460031879, 1460031879),
('user/changeStatus?method=forbidUser', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:35:"user/changeStatus?method=forbidUser";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/changeStatus?method=resumeUser', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:35:"user/changeStatus?method=resumeUser";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/delete', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:11:"user/delete";s:9:"createdAt";i:1476438050;s:9:"updatedAt";i:1476438050;}', 1476438050, 1476438050),
('user/edit', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:9:"user/edit";s:9:"createdAt";i:1476438051;s:9:"updatedAt";i:1476438051;}', 1476438051, 1476438051),
('user/editaction', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"user/editaction";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/index', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:10:"user/index";s:9:"createdAt";i:1459148617;s:9:"updatedAt";i:1459148627;}', 1456542110, 1456542120),
('user/saveAction', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:15:"user/saveAction";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/setStatus', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:14:"user/setStatus";s:9:"createdAt";i:1460031878;s:9:"updatedAt";i:1460031878;}', 1460031878, 1460031878),
('user/updateNickname', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:19:"user/updateNickname";s:9:"createdAt";i:1460031881;s:9:"updatedAt";i:1460031881;}', 1460031881, 1460031881),
('user/updatePassword', 'O:21:"common\\core\\rbac\\Rule":3:{s:4:"name";s:19:"user/updatePassword";s:9:"createdAt";i:1460031880;s:9:"updatedAt";i:1460031880;}', 1460031880, 1460031880);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_captcha`
--

CREATE TABLE IF NOT EXISTS `yii2_captcha` (
  `id` int(8) unsigned NOT NULL,
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT 'IP地址',
  `mobile` char(20) NOT NULL COMMENT '手机号',
  `captcha` char(6) NOT NULL COMMENT '验证码',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='验证码表';

--
-- 转存表中的数据 `yii2_captcha`
--

INSERT INTO `yii2_captcha` (`id`, `ip`, `mobile`, `captcha`, `time`) VALUES
(1, '127.0.0.1', '13631539420', '7978', 1474196824),
(2, '127.0.0.1', '13631639420', '6743', 1474197192),
(3, '59.40.134.141', '13631539420', '8879', 1474199719),
(4, '59.40.134.141', '13631639420', '1111', 1474206930),
(5, '113.116.72.128', '13631539420', '2216', 1474278556),
(6, '113.116.72.128', '13631539420', '6349', 1474279293),
(7, '113.116.72.128', '13631539420', '8966', 1474279946),
(8, '14.154.236.128', '13631539420', '4171', 1474281062),
(9, '14.154.236.128', '13631539420', '3651', 1474281145),
(10, '116.6.88.148', '18665354960', '8448', 1474334541),
(11, '113.104.231.102', '13421839870', '3321', 1474365606),
(12, '113.104.231.102', '13421839870', '8593', 1474378859),
(13, '113.104.231.102', '13421839870', '6249', 1474380034),
(14, '113.104.231.102', '13421839870', '9893', 1474380089),
(15, '113.104.231.102', '13316922246', '9521', 1474380153),
(16, '113.104.231.115', '13421839870', '1606', 1474443343),
(17, '113.104.231.115', '13421839870', '9673', 1474443423),
(18, '113.104.231.115', '13421839870', '3285', 1474443621),
(19, '183.11.157.104', '13631539420', '6292', 1474444126),
(20, '183.11.157.104', '13631539420', '3221', 1474444208),
(21, '113.104.231.115', '13421839870', '9664', 1474444261),
(22, '113.104.231.115', '13421839870', '6477', 1474444479),
(23, '120.234.16.114', '13316922246', '2312', 1474612724);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_cart`
--

CREATE TABLE IF NOT EXISTS `yii2_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID，来自goods表',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID，来自goods表',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称，来自goods表',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场售价，来自goods表',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店售价，来自goods表',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `goods_attr` text NOT NULL COMMENT '选择商品的属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `yii2_comment`
--

CREATE TABLE IF NOT EXISTS `yii2_comment` (
  `id` int(8) NOT NULL,
  `appid` char(30) NOT NULL COMMENT '应用ID，格式goods-123',
  `uid` int(11) NOT NULL COMMENT '评论用户ID',
  `content` int(11) NOT NULL COMMENT '评论内容',
  `to_comment` int(8) NOT NULL COMMENT '回复评论ID',
  `up` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '支持数',
  `down` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '反对数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_config`
--

CREATE TABLE IF NOT EXISTS `yii2_config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `value` text COMMENT '配置值',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yii2_config`
--

INSERT INTO `yii2_config` (`id`, `name`, `title`, `group`, `type`, `value`, `extra`, `remark`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'WEB_SITE_TITLE', '网站标题', 1, 1, '内容管理框架', '', '网站标题前台显示标题', 1378898976, 1481906498, 0, 1),
(2, 'WEB_SITE_DESCRIPTION', '网站描述', 1, 2, '内容管理框架', '', '网站搜索引擎描述', 1378898976, 1472528403, 1, 1),
(3, 'WEB_SITE_KEYWORD', '网站关键字', 1, 2, '黄龙飞11', '', '网站搜索引擎关键字', 1378898976, 1472528403, 8, 1),
(4, 'WEB_SITE_CLOSE', '关闭站点', 4, 4, '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1463024280, 1, 0),
(9, 'CONFIG_TYPE_LIST', '配置类型列表', 3, 3, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '', '主要用于数据解析和页面表单的生成', 1378898976, 1463024244, 2, 1),
(10, 'WEB_SITE_ICP', '网站备案号', 1, 1, '沪ICP备12007941号-2', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1472528403, 9, 1),
(11, 'DATA_BACKUP_PATH', '数据库备份路径', 4, 1, '/storage/web/database/', '', '路径必须以 / 结尾', 1379053380, 1476448404, 3, 1),
(12, 'DOCUMENT_DISPLAY', '文档可见性', 2, 3, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1481279789, 4, 1),
(13, 'COLOR_STYLE', '后台色系', 1, 4, 'default_color', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1472528403, 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_game`
--

CREATE TABLE IF NOT EXISTS `yii2_game` (
  `id` int(8) NOT NULL COMMENT '游戏id',
  `name` varchar(55) NOT NULL COMMENT '游戏名称',
  `game_starttime` datetime NOT NULL COMMENT '游戏开服时间',
  `short` char(10) NOT NULL COMMENT '简写',
  `sort` int(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `gametype` varchar(20) NOT NULL COMMENT '游戏类别',
  `gamestyle` smallint(5) NOT NULL COMMENT '类型ʽ',
  `pic` tinytext NOT NULL COMMENT '图片数据',
  `payto` int(5) NOT NULL DEFAULT '10' COMMENT '比例',
  `content` text NOT NULL,
  `ishot` int(3) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `game_web` varchar(255) NOT NULL COMMENT '游戏官网地址',
  `game_bbs` varchar(255) NOT NULL COMMENT '游戏论坛地址',
  `currency` char(20) NOT NULL DEFAULT '元宝' COMMENT '游戏币单位',
  `addtime` int(15) NOT NULL COMMENT '添加时间',
  `game_hit` int(8) NOT NULL DEFAULT '1' COMMENT '点击次数',
  `game_players` int(11) NOT NULL DEFAULT '0' COMMENT '玩家数量',
  `qq` text NOT NULL,
  `isdisplay` int(2) NOT NULL DEFAULT '1' COMMENT '显示状态',
  `isopen` int(2) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `desc1` varchar(255) NOT NULL,
  `game_api` varchar(60) DEFAULT NULL COMMENT '游戏接口',
  `game_conf` text COMMENT '接口配置',
  `remarks` text NOT NULL COMMENT '停服备注',
  `lander` varchar(254) NOT NULL DEFAULT '' COMMENT '是否有微端',
  `is_del` tinyint(2) NOT NULL COMMENT '删除状态'
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yii2_game`
--

INSERT INTO `yii2_game` (`id`, `name`, `game_starttime`, `short`, `sort`, `gametype`, `gamestyle`, `pic`, `payto`, `content`, `ishot`, `game_web`, `game_bbs`, `currency`, `addtime`, `game_hit`, `game_players`, `qq`, `isdisplay`, `isopen`, `desc1`, `game_api`, `game_conf`, `remarks`, `lander`, `is_del`) VALUES
(95, '九阴九阳', '0000-00-00 00:00:00', 'j', 150, '0', 1, '{"pic1":"Public\\/Game\\/20170727\\/20170727298107.png","pic2":"Public\\/Game\\/20170727\\/20170727840623.png","pic3":"Public\\/Game\\/20170727\\/20170727895519.png","pic4":"Public\\/Game\\/20170727\\/20170727385565.png","pic5":"Public\\/Game\\/20170727\\/20170727250256', 100, '', 0, 'jyjy.kukewan.com', '', '元宝', 1500528407, 1, 0, '', 1, 1, '', 'Kuke', '{"game_key":"0053f613878d33a60c37c62fef8ca0e7","game_url":"","game_paykey":"0053f613878d33a60c37c62fef8ca0e7","game_payurl":"","game_id":"95"}', '150', '', 0),
(96, '操戈天下', '0000-00-00 00:00:00', 'c', 200, '0', 1, '{"pic1":"Public\\/Game\\/20170824\\/20170824317263.png","pic2":"Public\\/Game\\/20170824\\/20170824852586.png","pic3":"Public\\/Game\\/20170824\\/20170824775752.png","pic4":"Public\\/Game\\/20170824\\/20170824457742.png","pic5":"Public\\/Game\\/20170824\\/20170824296593', 10, '', 0, '', '', '元宝', 1502250172, 27, 1, '', 1, 1, '', 'cgtx', '{"game_key":"31288dbe94e9c983a480feb788fa1743","game_url":"http://cgtxlogin.play77.cn/login/","role_url":"http://cgtxlogin.play77.cn/api/getinfo/","game_paykey":"bc9a65ca7ac7d8a9ba99ea5965b6a201","game_payurl":"http://cgtxpay.play77.cn/{platform}/payment/","game_id":"96"}', '200', '', 0),
(86, '兵器谱', '0000-00-00 00:00:00', 'j', 141, '0', 1, '{"pic1":"Public\\/Game\\/20170517\\/20170517555429.png","pic2":"Public\\/Game\\/20170517\\/20170517616350.png","pic3":"Public\\/Game\\/20170517\\/20170517573515.png","pic4":"Public\\/Game\\/20170517\\/20170517773498.png","pic5":"Public\\/Game\\/20170517\\/2017051770378.', 10, '剑侠情缘兵器谱西山居正版IP授权,战骑萌宠,丰富社交,跨服战斗,剑侠情缘兵器谱收集天下神兵利器,化解武林危机,拯救天下苍生!', 0, 'jxqy.kukewan.com', '', '', 1494570924, 1, 0, '', 1, 1, '', 'Kuke', '{"game_key":"","game_url":"","game_paykey":"","game_payurl":"","game_id":"86"}', '141', '', 0),
(92, '乾坤战纪', '0000-00-00 00:00:00', 'q', 140, '0', 1, '{"pic1":"Public\\/Game\\/20170707\\/20170707639155.png","pic2":"Public\\/Game\\/20170707\\/2017070767229.png","pic3":"Public\\/Game\\/20170707\\/20170707811883.png","pic4":"Public\\/Game\\/20170707\\/20170707634124.png","pic5":"Public\\/Game\\/20170707\\/20170707677286.', 10, '', 1, 'qkzj.kukewan.com/', '', '', 1498874255, 1, 0, '', 1, 1, '', 'Kuke', '{"game_key":"","game_url":"","game_paykey":"","game_payurl":"","game_id":"92"}', '140', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_game_login`
--

CREATE TABLE IF NOT EXISTS `yii2_game_login` (
  `id` bigint(11) unsigned NOT NULL COMMENT 'id',
  `userid` int(11) unsigned DEFAULT NULL COMMENT '用户id',
  `gameid` int(11) unsigned DEFAULT NULL COMMENT '游戏id',
  `sid` smallint(5) unsigned NOT NULL COMMENT '区服ID',
  `agent` varchar(30) DEFAULT NULL COMMENT '渠道商',
  `login_time` int(11) unsigned DEFAULT NULL COMMENT '登录时间',
  `reg_time` int(11) unsigned DEFAULT NULL COMMENT '注册时间',
  `fromflag` varchar(30) DEFAULT '' COMMENT '用户来源',
  `ip` bigint(20) unsigned DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='游戏登录日志表';

--
-- 转存表中的数据 `yii2_game_login`
--

INSERT INTO `yii2_game_login` (`id`, `userid`, `gameid`, `sid`, `agent`, `login_time`, `reg_time`, `fromflag`, `ip`) VALUES
(1, 1, 1, 1, 'default', 0, 0, '0', 0),
(2, 86479, 95, 3210, '0', 1503480747, 1503479707, 'kukewan', 2130706433),
(3, 86479, 95, 3245, '0', 1503481478, 1503481455, 'kukewan', 2130706433),
(4, 86479, 95, 3246, '0', 1503481488, 1503481488, 'kukewan', 2130706433),
(5, 86479, 95, 3210, '0', 1503543784, 1503479707, 'kukewan', 2130706433),
(6, 86479, 96, 3282, '0', 1503546024, 1503544307, 'kukewan', 2130706433),
(7, 86479, 86, 2972, '0', 1503546777, 1503546749, 'kukewan', 2130706433),
(8, 86479, 92, 3141, '0', 1503546804, 1503546804, 'kukewan', 2130706433),
(9, 90000001, 96, 3345, '1', 1504255314, 1504245899, 'hf', 2130706433);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_game_role`
--

CREATE TABLE IF NOT EXISTS `yii2_game_role` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `gid` smallint(6) NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名',
  `level` int(11) NOT NULL COMMENT '等级',
  `roleid` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL,
  `up_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extend` text COLLATE utf8mb4_bin NOT NULL COMMENT '拓展信息',
  `from_social` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户渠道标识'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='游戏角色日志表';

--
-- 转存表中的数据 `yii2_game_role`
--

INSERT INTO `yii2_game_role` (`id`, `uid`, `sid`, `gid`, `role`, `level`, `roleid`, `create_time`, `up_time`, `extend`, `from_social`) VALUES
(1, 86479, 3141, 92, '猎天玺越', 49, '', '2017-08-24 15:44:33', '2017-08-24 15:55:42', '{"sex":"m","combat":"13676"}', 'kukewan'),
(2, 90000001, 3345, 96, '御煊', 47, '524770', '2017-09-01 17:12:54', '2017-09-01 17:12:54', '{"profession":"2","createTime":1504255045,"sex":"0","fightvalue":"24040"}', 'hf'),
(3, 86479, 3282, 96, '竹醉', 7, '262144', '2017-09-06 14:33:36', '2017-09-06 14:33:36', '{"profession":"4","createTime":1503544756,"sex":"1","fightvalue":"2314"}', 'kukewan'),
(4, 90000001, 3282, 96, '荫曲吾', 55, '263015', '2017-09-06 17:06:21', '2017-09-07 10:33:43', '{"profession":"2","createTime":1504688731,"sex":"0","fightvalue":"38194"}', 'hf');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_game_type`
--

CREATE TABLE IF NOT EXISTS `yii2_game_type` (
  `id` int(10) unsigned NOT NULL,
  `list` smallint(6) DEFAULT '1' COMMENT '排序',
  `name` varchar(32) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '名称'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `yii2_game_type`
--

INSERT INTO `yii2_game_type` (`id`, `list`, `name`) VALUES
(1, 1, '休闲益智'),
(2, 2, '网络游戏'),
(4, 4, '角色扮演'),
(5, 5, '飞行射击'),
(6, 6, '策略经营'),
(7, 7, '卡片棋牌'),
(8, 8, '动作冒险'),
(3, 3, '体育竞速');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods`
--

CREATE TABLE IF NOT EXISTS `yii2_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属商品分类id，取值category的cat_id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品的唯一货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品的名称',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品总库存数量，由各sku相加',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场售价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店售价，总价需加sku价',
  `goods_cover` int(8) NOT NULL COMMENT '封面单图，关联图片表',
  `goods_album` varchar(255) NOT NULL DEFAULT '' COMMENT '商品相册图组，逗号相隔，关联图片表',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '网站描述',
  `content` text NOT NULL COMMENT '商品详情',
  `attribute` text NOT NULL COMMENT '商品基本属性，序列化数据，这里涉及商品少且不用于搜索',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品报警数量',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否促销 1是 0否',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销价格开始日期',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销价格结束日期',
  `is_real` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否是实物，1是 0否',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '花费积分，暂供积分商城用',
  `give_integral` int(8) NOT NULL DEFAULT '0' COMMENT '购买后赠送的积分数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `up` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `down` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` smallint(4) NOT NULL DEFAULT '10' COMMENT '顺序排序值',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0回收站 1正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_attr`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '属性ID',
  `attr_value` text NOT NULL COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_attribute`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL,
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0单选（颜色、尺码）1多选（配件）',
  `attr_values` text NOT NULL COMMENT '可选属性值，多个逗号相隔',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序，按顺序排'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值约束';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_cat`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_cat` (
  `id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

--
-- 转存表中的数据 `yii2_goods_cat`
--

INSERT INTO `yii2_goods_cat` (`id`, `pid`, `name`, `title`, `keywords`, `description`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 0, 'about', '关于我们', '', '', 1379474947, 1479373724, 10, 1),
(3, 0, 'event', '活动', '测试seo关键词', '测试描述', 1471947194, 1473604631, 1, 1),
(4, 1, 'lianxi', '联系我们', '', '', 1479368832, 0, 0, 1),
(5, 3, 'xin', '最新活动', '', '', 1479368867, 1479373985, 10, 1),
(6, 3, 'hot', '热门活动', '', '', 1479373707, 1481280086, 9, 1),
(7, 4, 'lianxi3', '联系我们3', '', '', 1479374778, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_position`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_position` (
  `goods_id` int(8) unsigned NOT NULL COMMENT '商品ID',
  `position_id` int(4) unsigned NOT NULL COMMENT '推荐位ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='文章推荐位映射表';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_sku`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_sku` (
  `sku_id` int(10) unsigned NOT NULL COMMENT '自增ID',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品ID',
  `properties` varchar(100) NOT NULL COMMENT '商品特性组合,多个逗号分隔',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '额外价格',
  `number` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '库存数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SKU库存管理表';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_goods_tag`
--

CREATE TABLE IF NOT EXISTS `yii2_goods_tag` (
  `goods_id` int(8) NOT NULL COMMENT '商品ID',
  `tag_id` int(8) NOT NULL COMMENT '标签ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='文章标签映射表';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_menu`
--

CREATE TABLE IF NOT EXISTS `yii2_menu` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yii2_menu`
--

INSERT INTO `yii2_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `group`, `status`) VALUES
(1, '首页', 0, 1, 'index/index', 0, '', 1),
(2, '内容', 0, 2, 'article/index', 0, '', 1),
(3, '文章管理', 2, 1, 'article/index', 0, '文章管理|icon-note', 1),
(4, '新增', 3, 0, 'article/add', 0, '', 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', 1),
(6, '删除', 3, 0, 'article/delete', 0, '', 1),
(172, '删除', 138, 0, 'goods/delete', 0, '', 1),
(13, '回收站', 2, 99, 'article/recycle', 1, '内容', 1),
(14, '还原', 13, 0, 'article/permit', 0, '', 1),
(15, '清空', 13, 0, 'article/clear', 0, '', 1),
(16, '用户', 0, 4, 'admin/index', 0, '', 1),
(17, '管理员管理', 16, 1, 'admin/index', 0, '后台用户|icon-user', 1),
(18, '新增管理员', 17, 0, 'admin/add', 0, '', 1),
(137, '更新', 17, 0, 'admin/edit', 0, '', 1),
(144, '商城套餐', 2, 29, 'group/index', 0, '商城管理|icon-basket', 1),
(155, '删除', 144, 0, 'group/delete', 0, '', 1),
(27, '权限管理', 16, 2, 'auth/index', 0, '后台用户|icon-user', 1),
(28, '删除', 27, 0, 'auth/delete', 0, '', 1),
(29, '编辑', 27, 0, 'auth/edit', 0, '', 1),
(30, '恢复', 27, 0, 'auth/add', 0, '', 1),
(154, '编辑', 144, 0, 'group/edit', 0, '', 1),
(153, '添加', 144, 0, 'group/add', 0, '', 1),
(34, '授权', 27, 0, 'auth/auth', 0, '', 1),
(35, '访问授权', 27, 0, 'auth/access', 0, '', 1),
(36, '成员授权', 27, 0, 'auth/user', 0, '', 1),
(145, '添加', 142, 0, 'user/add', 0, '', 1),
(146, '编辑', 142, 0, 'user/edit', 0, '', 1),
(147, '删除', 142, 0, 'user/delete', 0, '', 1),
(43, '订单', 0, 3, 'order/index', 0, '', 1),
(44, '全部订单', 43, 1, 'order/index', 0, '订单管理|fa fa-cny', 1),
(142, '前台用户', 16, 20, 'user/index', 0, '前台用户|icon-users', 1),
(55, '添加', 44, 0, 'order/add', 0, '', 1),
(56, '编辑', 44, 0, 'order/edit', 0, '', 1),
(148, '删除', 44, 0, 'order/delete', 0, '', 1),
(63, '属性管理', 68, 0, 'attribute/index1', 1, '', 1),
(64, '新增', 63, 0, 'attribute/add', 0, '', 1),
(65, '编辑', 63, 0, 'attribute/edit', 0, '', 1),
(66, '改变状态', 63, 0, 'attribute/setStatus', 0, '', 1),
(67, '保存数据', 63, 0, 'attribute/update', 0, '', 1),
(68, '系统', 0, 6, 'config/group', 0, '', 1),
(69, '网站设置', 68, 1, 'config/group', 0, '系统设置|icon-settings', 1),
(70, '配置管理', 68, 1, 'config/index', 0, '系统设置|icon-settings', 1),
(71, '编辑', 70, 0, 'config/edit', 0, '', 1),
(72, '删除', 70, 0, 'config/del', 0, '', 1),
(73, '新增', 70, 0, 'config/add', 0, '', 1),
(74, '保存', 70, 0, 'config/save', 0, '', 1),
(75, '菜单管理', 68, 5, 'menu/index', 0, '系统设置|icon-settings', 1),
(80, '分类管理', 2, 2, 'article-cat/index', 0, '文章管理|icon-note', 1),
(81, '编辑', 80, 0, 'article-cat/edit', 0, '', 1),
(82, '新增', 80, 0, 'article-cat/add', 0, '', 1),
(83, '删除', 80, 0, 'article-cat/delete', 0, '', 1),
(171, '编辑', 138, 0, 'goods/edit', 0, '', 1),
(170, '添加', 138, 0, 'goods/add', 0, '', 1),
(86, '备份数据库', 68, 10, 'database/index?type=export', 0, '数据备份|fa fa-database', 1),
(87, '备份', 86, 0, 'database/export', 0, '', 1),
(88, '优化表', 86, 0, 'database/optimize', 0, '', 1),
(89, '修复表', 86, 0, 'database/repair', 0, '', 1),
(90, '还原数据库', 68, 11, 'database/index?type=import', 0, '数据备份|fa fa-database', 1),
(91, '恢复', 90, 0, 'database/import', 0, '', 1),
(92, '删除', 90, 0, 'database/del', 0, '', 1),
(93, '其他栏目', 0, 5, 'other', 1, '', 1),
(96, '新增', 75, 0, 'menu/add', 0, '系统设置|icon-legal', 1),
(98, '编辑', 75, 0, 'menu/edit', 0, '', 1),
(106, '行为日志', 16, 30, 'admin-log/index', 0, '用户日志|icon-check', 1),
(108, '修改密码', 16, 0, 'user/updatePassword', 1, '', 1),
(109, '修改昵称', 16, 0, 'user/updateNickname', 1, '', 1),
(110, '查看行为日志', 106, 0, 'admin-log/view', 1, '', 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', 1),
(138, '商品管理', 2, 20, 'goods/index', 0, '商城管理|icon-basket', 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', 1),
(129, '管理员授权', 17, 0, 'admin/auth', 0, '', 0),
(131, '待完成任务', 1, 0, 'index/index', 0, '任务列表|icon-speech', 0),
(159, '广告管理', 2, 0, 'ad/index', 0, '广告管理|icon-target', 1),
(160, '添加', 159, 0, 'ad/add', 0, '', 1),
(161, '编辑', 159, 0, 'ad/edit', 0, '', 1),
(162, '删除', 159, 0, 'ad/delete', 0, '', 1),
(166, '商品属性', 2, 21, 'attributes/index', 0, '商城管理|icon-basket', 1),
(167, '添加/修改类型', 166, 0, 'traintype/edit', 0, '', 1),
(168, '删除类型', 166, 0, 'traintype/delete', 0, '', 1),
(173, '游戏', 0, 5, 'game/index', 0, '', 1),
(174, '所有游戏', 173, 0, 'game/index', 0, '游戏管理|icon-basket', 1),
(175, '添加游戏', 173, 0, 'game/add', 0, '游戏管理|icon-basket', 1),
(176, '区服列表', 173, 0, 'server/index', 0, '区服管理|icon-basket', 1),
(177, '合作用户', 16, 1, 'partner/index', 0, '前台用户|icon-users', 1),
(178, '混服游戏', 173, 0, 'partner-game/index', 0, '混服管理|icon-basket', 1),
(179, '混服区服', 173, 0, 'partner-server/index', 0, '混服管理|icon-basket', 1),
(180, '添加', 178, 0, 'partner-game/create', 1, '混服管理|icon-basket', 1),
(181, '修改', 178, 0, 'partner-game/update', 1, '混服管理|icon-basket', 1),
(182, '修改', 179, 0, 'partner-server/update', 1, '混服管理|icon-basket', 1),
(183, '添加', 179, 0, 'partner-server/create', 1, '混服管理|icon-basket', 1),
(184, '添加合作账户', 16, 1, 'partner/create', 1, '前台用户|icon-users', 1),
(185, '修改合作账户', 16, 1, 'partner/update', 1, '前台用户|icon-users', 1),
(186, '资金流出订单', 43, 1, 'transfer/index', 0, '订单管理|fa fa-cny', 2);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_message`
--

CREATE TABLE IF NOT EXISTS `yii2_message` (
  `message_id` int(8) NOT NULL COMMENT '消息ID',
  `appid` varchar(30) NOT NULL COMMENT '应用ID，格式goods-123',
  `type` char(10) NOT NULL DEFAULT 'private' COMMENT '消息类型，private一对一，group一对多，system一对全部',
  `from_uid` int(8) unsigned NOT NULL COMMENT '消息发送者uid，0系统',
  `to_uid` int(8) unsigned NOT NULL COMMENT '消息接收者uid，0广播/组消息须配合message_sys表',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广播消息结束时间，定期清理过期消息，0为不清理',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否阅读 0未读 1已读 -1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内消息';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_message_sys`
--

CREATE TABLE IF NOT EXISTS `yii2_message_sys` (
  `sys_id` int(10) unsigned NOT NULL COMMENT '自增',
  `uid` int(8) unsigned NOT NULL COMMENT '用户uid',
  `message_id` int(10) unsigned NOT NULL COMMENT '消息ID',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否阅读 0未读 1已读 -1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内广播/组消息已读状态';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_migration`
--

CREATE TABLE IF NOT EXISTS `yii2_migration` (
  `version` varchar(180) COLLATE utf8mb4_bin NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `yii2_migration`
--

INSERT INTO `yii2_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1500532365),
('m170206_022119_ad', 1500532365),
('m170206_022119_admin', 1500532365),
('m170206_022119_admin_log', 1500532365),
('m170206_022119_article', 1500532366),
('m170206_022119_article_cat', 1500532366),
('m170206_022119_article_position', 1500532366),
('m170206_022119_article_tag', 1500532366),
('m170206_022119_auth_assignment', 1500532367),
('m170206_022119_auth_item', 1500532372),
('m170206_022119_auth_item_child', 1500532376),
('m170206_022119_auth_rule', 1500532381),
('m170206_022119_captcha', 1500532381),
('m170206_022119_cart', 1500532381),
('m170206_022119_comment', 1500532381),
('m170206_022119_config', 1500532381),
('m170206_022119_goods', 1500532383),
('m170206_022119_goods_attr', 1500532384),
('m170206_022119_goods_attribute', 1500532384),
('m170206_022119_goods_cat', 1500532384),
('m170206_022119_goods_position', 1500532384),
('m170206_022119_goods_sku', 1500532385),
('m170206_022119_goods_tag', 1500532385),
('m170206_022119_menu', 1500532385),
('m170206_022119_message', 1500532385),
('m170206_022119_message_sys', 1500532385),
('m170206_022119_nav', 1500532386),
('m170206_022119_order', 1500532386),
('m170206_022119_page', 1500532386),
('m170206_022119_picture', 1500532386),
('m170206_022119_position', 1500532386),
('m170206_022119_region', 1500532389),
('m170206_022119_tag', 1500532389),
('m170206_022119_user', 1500532389),
('m170206_022119_user_data', 1500532390),
('m170206_022119_user_rank', 1500532390);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_nav`
--

CREATE TABLE IF NOT EXISTS `yii2_nav` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态1正常0隐藏'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='前台栏目';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_order`
--

CREATE TABLE IF NOT EXISTS `yii2_order` (
  `order_id` int(8) NOT NULL,
  `order_sn` varchar(35) NOT NULL COMMENT '订单号',
  `pay_sn` varchar(35) NOT NULL COMMENT '支付渠道号',
  `uid` int(8) unsigned DEFAULT NULL COMMENT '用户id',
  `username` varchar(30) DEFAULT NULL COMMENT '姓名',
  `money` float(8,2) unsigned NOT NULL COMMENT '订单总额',
  `rebate_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '代金券ID',
  `payables` float(8,2) NOT NULL COMMENT '应付款',
  `really_money` float(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际后款金额',
  `game_money` float(7,1) NOT NULL DEFAULT '0.0' COMMENT '游戏到账金额',
  `type` char(10) NOT NULL COMMENT '订单类型',
  `gameid` int(5) unsigned NOT NULL COMMENT '游戏ID',
  `sid` int(8) unsigned NOT NULL COMMENT '区服ID',
  `title` varchar(100) NOT NULL COMMENT '商品名称',
  `rolename` varchar(30) NOT NULL COMMENT '角色名',
  `channel` int(11) NOT NULL COMMENT '渠道ID',
  `create_time` int(12) unsigned NOT NULL COMMENT '订单创建时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_type` varchar(10) NOT NULL COMMENT '支付类型 微信 支付宝 银联',
  `pay_source` varchar(10) NOT NULL COMMENT '支付途径',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态0未发放 1已发放',
  `ip` int(13) unsigned NOT NULL DEFAULT '0' COMMENT '充值IP',
  `remark` varchar(250) NOT NULL COMMENT '备注',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='订单表';

--
-- 转存表中的数据 `yii2_order`
--

INSERT INTO `yii2_order` (`order_id`, `order_sn`, `pay_sn`, `uid`, `username`, `money`, `rebate_id`, `payables`, `really_money`, `game_money`, `type`, `gameid`, `sid`, `title`, `rolename`, `channel`, `create_time`, `pay_time`, `pay_type`, `pay_source`, `pay_status`, `status`, `ip`, `remark`, `is_del`) VALUES
(1, '135555111', '', 86479, 'admin110', 10.00, 0, 0.00, 0.00, 10.0, 'payBal', 96, 3282, '商品名称', '', 0, 1486347086, 1504344620, '1', '1', 1, 0, 0, '下单', 0),
(2, '135555111', '', 1, '', 0.00, 0, 0.00, 0.00, 0.0, 'payGame', 1, 1, '商品名称1111', '', 0, 1365678940, 1365668940, '2', '2', 1, 1, 0, '', 0),
(3, '1473787901', '', 1, '', 0.00, 0, 0.00, 0.00, 0.0, 'ptbGame', 3, 3, '大床双人房特价', '', 0, 1473787924, 1473787901, '1', '1', 1, 1, 0, '', 0),
(4, '1473788097', '', 0, '龙凤', 0.00, 0, 0.00, 0.00, 0.0, 'Ptb', 0, 3, '帆船培训2', '', 0, 1473788126, 1478145300, '1', '1', 0, 1, 0, '', 0),
(5, '1474094023', '', 0, '111', 0.00, 0, 0.00, 0.00, 0.0, 'NC', 0, 3, '大床双人房特价', '', 0, 1474094061, 1480910460, '2', '1', 1, 1, 0, '', 0),
(6, '1480917844', '', 0, '啥打法是否', 0.00, 0, 0.00, 0.00, 0.0, 'hfPay', 0, 3, '测试酒店1', '', 0, 1486347104, 1486347060, '4', '3', 0, 1, 0, '', 0),
(11, 'hgkasjdhsad12', '', 86479, 'admin110', 1.00, 0, 1.00, 0.00, 1.0, 'hfFZ', 96, 3282, '操戈天下-双线1区', '竹醉', 0, 1504682009, 0, 'alipay', '0', 0, 0, 0, '', 0),
(12, '20170915N171949U', '103510075449201709156260502747', 90000001, 'cps001_kukejs', 1.00, 0, 1.00, 1.00, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504751623, 1505540405, '预付款', '预付款', 1, 1, 2130706433, '>付款>到账', 0),
(14, '20170907114405YFF9856', '123456', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504755845, 0, '预付款', '预付款', 1, 1, 0, '?', 0),
(15, '20170907130153YFF7726', '1234567', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504760513, 0, '预付款', '预付款', 1, 1, 0, '补单>已扣款>充值到游戏>充值成功>交易完成;', 0),
(16, '20170907132118YFF5030', '12345678', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 95, 3244, '预付款', '荫曲吾', 1, 1504761678, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(17, '20170907132356YFF8114', '123456789', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504761836, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;补单>已扣款>充值到游戏>充值成功>交易完成;', 0),
(18, '20170907132638YFF3210', '123456780', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504761998, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(19, '20170907132849YFF6731', '123456781', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762129, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(20, '20170907133001YFF2119', '123456782', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762201, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;补单>已扣款>充值到游戏>充值成功>交易完成;', 0),
(21, '20170907133432YFF9295', '123456783', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762472, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(22, '20170907133547YFF8261', '123456784', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762547, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(23, '20170907133723YFF4322', '123456785', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762643, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(24, '20170907133820YFF5090', '123456786', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762700, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(25, '20170907133842YFF8814', '123456787', 90000001, 'cps001_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 1, 1504762722, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(26, '20170907133842YFF88999', '123456787', 90000002, 'cps002_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 2, 1504762722, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(27, '20170907133842YFF878888', '123456787', 90000003, 'kukejs_kukejs', 1.00, 0, 0.65, 0.65, 1.0, 'hfBal', 96, 3282, '预付款', '荫曲吾', 3, 1504762722, 0, '预付款', '预付款', 1, 1, 0, '下单下单>扣款>扣款成功>充值到游戏>充值成功>交易完成;', 0),
(28, '20170914142918YFF4283', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '', '', 1, 1505377300, 0, 'wxpay', 'SYT', 0, 0, 0, '', 0),
(29, '20170914171454YFF5202', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505380768, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(30, '20170915111020YFF5156', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505445067, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(31, '20170915112017YFF2204', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 3, 1505445627, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(32, '20170915132534YFF2380', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 3, 1505453157, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(33, '20170915132609YFF7864', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 3, 1505453254, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(34, '20170915143651YFF7940', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 3, 1505457441, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(35, '20170915144156YFF4581', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505457735, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(36, '20170915144254YFF4977', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505457786, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(37, '20170915144828YFF7253', '', NULL, NULL, 1234.00, 0, 1234.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505458197, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(38, '20170915145940YFF1572', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505458788, 0, 'alipay', 'WFTWX', 0, 0, 2130706433, '', 0),
(39, '20170915151359YFF5574', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505459651, 0, 'wxpay', 'WFTWX', 0, 0, 2130706433, '', 0),
(40, '20170915151647YFF3930', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505459817, 0, 'wxpay', 'WFTWX', 0, 0, 2130706433, '', 0),
(41, '20170916121241YFF3193', '', NULL, NULL, 1.00, 0, 1.00, 0.00, 0.0, 'payBal', 0, 0, '预付费充值', '', 1, 1505535169, 0, 'wxpay', 'WFTWX', 0, 0, 2130706433, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_page`
--

CREATE TABLE IF NOT EXISTS `yii2_page` (
  `id` int(8) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '英文标识',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='单页面';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_partner_game`
--

CREATE TABLE IF NOT EXISTS `yii2_partner_game` (
  `id` int(11) NOT NULL,
  `partnerid` int(11) NOT NULL COMMENT '合作者ID',
  `gid` int(11) NOT NULL,
  `gkey` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '游戏标识',
  `status` tinyint(1) NOT NULL COMMENT '0关闭，1正常，2关闭充值',
  `rate` float(4,3) NOT NULL DEFAULT '0.000' COMMENT '分成比例',
  `totalmoney` float(10,2) NOT NULL COMMENT '充值总额',
  `lkey` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '登录KEY',
  `pkey` char(32) COLLATE utf8mb4_bin NOT NULL COMMENT '充值KEY',
  `auto_server` tinyint(1) NOT NULL DEFAULT '1' COMMENT '自动添加区服',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `up_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `url_web` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '官网地址',
  `url_pay` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '充值地址',
  `url_fcm` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '防沉迷地址',
  `url_bbs` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '论坛地址',
  `url_kefu` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '客服地址',
  `url_client` varchar(250) COLLATE utf8mb4_bin NOT NULL COMMENT '微端下载地址'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='合作者游戏对应表';

--
-- 转存表中的数据 `yii2_partner_game`
--

INSERT INTO `yii2_partner_game` (`id`, `partnerid`, `gid`, `gkey`, `status`, `rate`, `totalmoney`, `lkey`, `pkey`, `auto_server`, `create_time`, `up_time`, `url_web`, `url_pay`, `url_fcm`, `url_bbs`, `url_kefu`, `url_client`) VALUES
(1, 1, 96, 'cgtx', 1, 0.650, 3.00, '123', '123', 1, '2017-09-01 13:22:24', '2017-09-13 15:49:47', '', 'http://www.kukewan.com/pay/?game=96&server_id={serverid}&user={user}', '', '', '', ''),
(2, 1, 95, 'jyjy', 1, 0.000, 0.00, '九阴九阳', '九阴九阳', 2, '2017-09-08 14:24:05', '2017-09-12 16:33:14', 'http://jyjy.kukewan.com', 'http://jyjy.kukewan.com', '', '', '', '九阴九阳'),
(3, 2, 95, 'jyjy', 1, 0.000, 0.00, '九阴九阳', '', 1, '2017-09-08 14:24:05', '2017-09-08 15:03:26', 'http://jyjy.kukewan.com', 'http://jyjy.kukewan.com', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_partner_server`
--

CREATE TABLE IF NOT EXISTS `yii2_partner_server` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT '区服表主键',
  `pserverid` int(11) NOT NULL COMMENT '合作者接口区服号',
  `gid` int(11) NOT NULL COMMENT '游戏在本站的ID',
  `status` tinyint(1) NOT NULL COMMENT '0关闭，1开启，2仅登录',
  `pid` int(11) NOT NULL COMMENT '合作者ID',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='合作者区服对应关系表';

--
-- 转存表中的数据 `yii2_partner_server`
--

INSERT INTO `yii2_partner_server` (`id`, `sid`, `pserverid`, `gid`, `status`, `pid`, `ctime`) VALUES
(1, 3282, 1, 96, 1, 1, '2017-09-13 11:20:20'),
(2, 3345, 2, 96, 1, 1, '2017-09-13 11:20:20'),
(3, 3345, 2, 95, 1, 2, '2017-09-13 11:20:20');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_partner_users`
--

CREATE TABLE IF NOT EXISTS `yii2_partner_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL COMMENT '推广用户名',
  `parentid` int(8) NOT NULL DEFAULT '0' COMMENT '上级推广id',
  `domain` varchar(100) NOT NULL COMMENT '域名',
  `password` char(60) NOT NULL COMMENT '密码',
  `type` enum('1','2','3','4','0') NOT NULL DEFAULT '1' COMMENT '1混服，2CPS，3广告，4子账号',
  `bankaccount` varchar(100) NOT NULL COMMENT '银行账户',
  `realname` varchar(30) NOT NULL COMMENT '真实姓名',
  `number_id` varchar(50) NOT NULL COMMENT '身份证',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `register_time` int(11) NOT NULL COMMENT '注册时间',
  `lastlogin_time` int(11) NOT NULL COMMENT '最近登录时间',
  `lastlogin_ip` varchar(30) NOT NULL COMMENT '最近登录ip',
  `available_money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '预支的金额',
  `money` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '可用金额',
  `rate` float(4,3) NOT NULL DEFAULT '0.600' COMMENT '默认分成比例',
  `lkey` char(32) NOT NULL COMMENT '默认登录Key',
  `pkey` char(32) NOT NULL COMMENT '默认充值Key',
  `admin_username` char(30) NOT NULL DEFAULT 'admin' COMMENT '所属专员',
  `totalmoney` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '总共推广金额',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `pay_tag` char(50) NOT NULL COMMENT '所属银行',
  `tel` varchar(50) NOT NULL COMMENT '联系方式',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `qq` varchar(20) NOT NULL COMMENT 'qq',
  `test_account` varchar(50) NOT NULL COMMENT '测试号-未开服登陆充值时可用',
  `api_ip` text NOT NULL COMMENT '接口列表、IP白名单',
  `callback` varchar(250) NOT NULL COMMENT '同步回调地址',
  `notify` varchar(250) NOT NULL COMMENT '异步通知地址'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yii2_partner_users`
--

INSERT INTO `yii2_partner_users` (`id`, `username`, `parentid`, `domain`, `password`, `type`, `bankaccount`, `realname`, `number_id`, `remark`, `register_time`, `lastlogin_time`, `lastlogin_ip`, `available_money`, `money`, `rate`, `lkey`, `pkey`, `admin_username`, `totalmoney`, `status`, `pay_tag`, `tel`, `email`, `qq`, `test_account`, `api_ip`, `callback`, `notify`) VALUES
(1, 'cps001', 0, 'www.kukewan.com', '$2y$13$lzMcf//gE6PmG7vdyhWPUOhZJuu46rgTMqsOO4uih3j7oEjXYPaVW', '1', '123', '123', '123', '默认推广员', 1450505425, 1494386298, '221.220.250.13', 12.00, 9993.8500, 0.650, 'LkeyLkeyLkey', 'PkeyPkeyPkey', 'admin', 13.00, 1, 'Pay Tag', '15222291959', '295729766@qq.com', '295729766', 'kukejs,123456', '{"ip":["192.168.1.1","127.0.0.1","192.168.1.123","8.8.8.8","9.9.9.8"],"api":["v1\\/mix\\/login","v1\\/mix\\/role","v1\\/mix-balance-pay","v1\\/pay","v1\\/mix-balance"]}', 'http://www.kukewan.com/Callback', 'http://www.kukewan.com/Notify'),
(2, 'cps002', 0, 'www.kukewan.com', 'sda', '1', '123', '123', '123', '系统默认推广员', 1450505425, 1494386298, '221.220.250.13', 12.00, 9993.8500, 0.650, 'LkeyLkeyLkey', 'PkeyPkeyPkey', 'admin', 13.00, 1, 'Pay Tag', '15222291959', '2295729766@qq.com', '295729766', 'kukejs', '{"ip":["192.168.1.1","127.0.0.1","192.168.1.123"],"api":["v1\\/mix\\/login","v1\\/mix\\/role","v1\\/mix-balance-pay","v1\\/pay"]}', 'http://www.kukewan.com/Callback', 'http://www.kukewan.com/Notify'),
(3, 'kukejs', 0, 'www.kukewan.com', 'asdsadsa', '1', '123', '123', '123', '系统默认推广员', 1450505425, 1494386298, '221.220.250.13', 12.00, 9993.8500, 0.650, 'LkeyLkeyLkey', 'PkeyPkeyPkey', 'admin', 13.00, 1, 'Pay Tag', '15222291959', '3295729766@qq.com', '295729766', 'kukejs', '{"ip":["192.168.1.1","127.0.0.1","192.168.1.123"],"api":["v1\\/mix\\/login","v1\\/mix\\/role","v1\\/mix-balance-pay","v1\\/pay"]}', 'http://www.kukewan.com/Callback', 'http://www.kukewan.com/Notify');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_picture`
--

CREATE TABLE IF NOT EXISTS `yii2_picture` (
  `id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yii2_picture`
--

INSERT INTO `yii2_picture` (`id`, `path`, `md5`, `create_time`, `status`) VALUES
(1, '201610/1477562926256.png', 'f1510ddb99606c5aa75fdf9c9e245136', 1477562926, 1),
(2, '201610/1477564226300.png', '86375d934477a20aaf0f446b12a17cfb', 1477564226, 1),
(7, '201611/1477984758635.png', '90b4da99d2fc0ea4435b19e674e2ddf0', 1477984758, 1),
(4, '201610/1477567061651.png', 'db09e4d570a5d46bda6782cff9ead020', 1477567061, 1),
(5, '201610/1477894552955.png', '3c680300f3ae5c417f1eec06e8e012ca', 1477894552, 1),
(6, '201610/1477895930794.png', '4f9a57edb7971bdcf5195cc79a9ab4f2', 1477895930, 1),
(8, '201611/1477986537333.png', '8a7102fa0ed5cdea5a359f5d068e3838', 1477986537, 1),
(9, '201611/1478850859946.jpg', 'b80a764cc220b8044e933df30774b218', 1478850859, 1),
(11, '201611/1478854002500.jpg', '04e145672b976fb47164dd96e0090fd1', 1478854002, 1),
(12, '201611/1478854666137.jpg', '1f611a254f541830ab3a3490e32368c2', 1478854666, 1),
(13, '201612/1480907348789.png', '6d83a00e11eb16e95fa9200fd7ddc2e2', 1480907348, 1),
(14, '201707/1501235705615.jpg', '121a79365e6ea29f81c5e91ca3a97ab1', 1501235705, 1),
(15, '201707/1501465801969.jpg', '789de0f89cbda2102c9ba12ee4a73dc2', 1501465801, 1),
(16, '201707/1501466513789.jpg', '6a901a3cf0f4f9c36c0d8e9d46e35cc3', 1501466513, 1),
(17, '201707/1501468881648.jpg', '8a08a324cefb1d8e4f583c85b33027a3', 1501468881, 1),
(18, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505452886727&di=1fc4eaef73d45f33ca8c23ba8fad4fef&imgtype=0&src=http%3A%2F%2Fphotos.tuchong.com%2F56010%2Ff%2F1597850.jpg', 'e2282e974157c1265ec4c25dfa016d7e', 1501468900, 1),
(19, '201707/1501469519909.jpg', 'c7c467dbec7a0fb8f5fc997dca3dc6a5', 1501469519, 1),
(20, '201707/1501487303981.jpg', '40307aff916f4cc8990182874e16caee', 1501487303, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_position`
--

CREATE TABLE IF NOT EXISTS `yii2_position` (
  `position_id` int(4) NOT NULL COMMENT '推荐位ID',
  `name` char(30) NOT NULL COMMENT '推荐位名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='推荐位';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_rebate`
--

CREATE TABLE IF NOT EXISTS `yii2_rebate` (
  `id` int(11) NOT NULL,
  `class` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '使用范围(验证类)',
  `moeny` float(8,2) NOT NULL COMMENT '代金券額度',
  `stime` int(11) NOT NULL COMMENT '开始时间',
  `etiem` int(11) NOT NULL COMMENT '结束时间',
  `total_money` float(10,2) NOT NULL COMMENT '累计减免额度',
  `times` int(11) NOT NULL COMMENT '使用次数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1开启0关闭'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `yii2_rebate_user`
--

CREATE TABLE IF NOT EXISTS `yii2_rebate_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT 'UID',
  `rebate_id` int(11) NOT NULL COMMENT '代金券ID',
  `create_time` int(11) NOT NULL COMMENT '领取时间',
  `status` tinyint(1) NOT NULL COMMENT '0未使用 1已使用 2过期 3禁用',
  `expire_time` int(11) NOT NULL COMMENT '过期时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `yii2_region`
--

CREATE TABLE IF NOT EXISTS `yii2_region` (
  `code` mediumint(6) NOT NULL COMMENT '行政区划代码',
  `parent_code` mediumint(6) NOT NULL COMMENT '上级行政区划',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '简称',
  `fullname` varchar(100) NOT NULL COMMENT '全称',
  `level` tinyint(1) NOT NULL COMMENT '层级'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中国标准行政区划，方便对接地图接口';

--
-- 转存表中的数据 `yii2_region`
--

INSERT INTO `yii2_region` (`code`, `parent_code`, `name`, `fullname`, `level`) VALUES
(110000, 0, '', '北京市', 0),
(110100, 110000, '', '市辖区', 1),
(110101, 110100, '', '东城区', 2),
(110102, 110100, '', '西城区', 2),
(110105, 110100, '', '朝阳区', 2),
(110106, 110100, '', '丰台区', 2),
(110107, 110100, '', '石景山区', 2),
(110108, 110100, '', '海淀区', 2),
(110109, 110100, '', '门头沟区', 2),
(110111, 110100, '', '房山区', 2),
(110112, 110100, '', '通州区', 2),
(110113, 110100, '', '顺义区', 2),
(110114, 110100, '', '昌平区', 2),
(110115, 110100, '', '大兴区', 2),
(110116, 110100, '', '怀柔区', 2),
(110117, 110100, '', '平谷区', 2),
(110200, 110000, '', '县', 1),
(110228, 110200, '', '密云县', 2),
(110229, 110200, '', '延庆县', 2),
(120000, 0, '', '天津市', 0),
(120100, 120000, '', '市辖区', 1),
(120101, 120100, '', '和平区', 2),
(120102, 120100, '', '河东区', 2),
(120103, 120100, '', '河西区', 2),
(120104, 120100, '', '南开区', 2),
(120105, 120100, '', '河北区', 2),
(120106, 120100, '', '红桥区', 2),
(120110, 120100, '', '东丽区', 2),
(120111, 120100, '', '西青区', 2),
(120112, 120100, '', '津南区', 2),
(120113, 120100, '', '北辰区', 2),
(120114, 120100, '', '武清区', 2),
(120115, 120100, '', '宝坻区', 2),
(120116, 120100, '', '滨海新区', 2),
(120200, 120000, '', '县', 1),
(120221, 120200, '', '宁河县', 2),
(120223, 120200, '', '静海县', 2),
(120225, 120200, '', '蓟县', 2),
(130000, 0, '', '河北省', 0),
(130100, 130000, '', '石家庄市', 1),
(130101, 130100, '', '市辖区', 2),
(130102, 130100, '', '长安区', 2),
(130104, 130100, '', '桥西区', 2),
(130105, 130100, '', '新华区', 2),
(130107, 130100, '', '井陉矿区', 2),
(130108, 130100, '', '裕华区', 2),
(130109, 130100, '', '藁城区', 2),
(130110, 130100, '', '鹿泉区', 2),
(130111, 130100, '', '栾城区', 2),
(130121, 130100, '', '井陉县', 2),
(130123, 130100, '', '正定县', 2),
(130125, 130100, '', '行唐县', 2),
(130126, 130100, '', '灵寿县', 2),
(130127, 130100, '', '高邑县', 2),
(130128, 130100, '', '深泽县', 2),
(130129, 130100, '', '赞皇县', 2),
(130130, 130100, '', '无极县', 2),
(130131, 130100, '', '平山县', 2),
(130132, 130100, '', '元氏县', 2),
(130133, 130100, '', '赵县', 2),
(130183, 130100, '', '晋州市', 2),
(130184, 130100, '', '新乐市', 2),
(130200, 130000, '', '唐山市', 1),
(130201, 130200, '', '市辖区', 2),
(130202, 130200, '', '路南区', 2),
(130203, 130200, '', '路北区', 2),
(130204, 130200, '', '古冶区', 2),
(130205, 130200, '', '开平区', 2),
(130207, 130200, '', '丰南区', 2),
(130208, 130200, '', '丰润区', 2),
(130209, 130200, '', '曹妃甸区', 2),
(130223, 130200, '', '滦县', 2),
(130224, 130200, '', '滦南县', 2),
(130225, 130200, '', '乐亭县', 2),
(130227, 130200, '', '迁西县', 2),
(130229, 130200, '', '玉田县', 2),
(130281, 130200, '', '遵化市', 2),
(130283, 130200, '', '迁安市', 2),
(130300, 130000, '', '秦皇岛市', 1),
(130301, 130300, '', '市辖区', 2),
(130302, 130300, '', '海港区', 2),
(130303, 130300, '', '山海关区', 2),
(130304, 130300, '', '北戴河区', 2),
(130321, 130300, '', '青龙满族自治县', 2),
(130322, 130300, '', '昌黎县', 2),
(130323, 130300, '', '抚宁县', 2),
(130324, 130300, '', '卢龙县', 2),
(130400, 130000, '', '邯郸市', 1),
(130401, 130400, '', '市辖区', 2),
(130402, 130400, '', '邯山区', 2),
(130403, 130400, '', '丛台区', 2),
(130404, 130400, '', '复兴区', 2),
(130406, 130400, '', '峰峰矿区', 2),
(130421, 130400, '', '邯郸县', 2),
(130423, 130400, '', '临漳县', 2),
(130424, 130400, '', '成安县', 2),
(130425, 130400, '', '大名县', 2),
(130426, 130400, '', '涉县', 2),
(130427, 130400, '', '磁县', 2),
(130428, 130400, '', '肥乡县', 2),
(130429, 130400, '', '永年县', 2),
(130430, 130400, '', '邱县', 2),
(130431, 130400, '', '鸡泽县', 2),
(130432, 130400, '', '广平县', 2),
(130433, 130400, '', '馆陶县', 2),
(130434, 130400, '', '魏县', 2),
(130435, 130400, '', '曲周县', 2),
(130481, 130400, '', '武安市', 2),
(130500, 130000, '', '邢台市', 1),
(130501, 130500, '', '市辖区', 2),
(130502, 130500, '', '桥东区', 2),
(130503, 130500, '', '桥西区', 2),
(130521, 130500, '', '邢台县', 2),
(130522, 130500, '', '临城县', 2),
(130523, 130500, '', '内丘县', 2),
(130524, 130500, '', '柏乡县', 2),
(130525, 130500, '', '隆尧县', 2),
(130526, 130500, '', '任县', 2),
(130527, 130500, '', '南和县', 2),
(130528, 130500, '', '宁晋县', 2),
(130529, 130500, '', '巨鹿县', 2),
(130530, 130500, '', '新河县', 2),
(130531, 130500, '', '广宗县', 2),
(130532, 130500, '', '平乡县', 2),
(130533, 130500, '', '威县', 2),
(130534, 130500, '', '清河县', 2),
(130535, 130500, '', '临西县', 2),
(130581, 130500, '', '南宫市', 2),
(130582, 130500, '', '沙河市', 2),
(130600, 130000, '', '保定市', 1),
(130601, 130600, '', '市辖区', 2),
(130602, 130600, '', '新市区', 2),
(130603, 130600, '', '北市区', 2),
(130604, 130600, '', '南市区', 2),
(130621, 130600, '', '满城县', 2),
(130622, 130600, '', '清苑县', 2),
(130623, 130600, '', '涞水县', 2),
(130624, 130600, '', '阜平县', 2),
(130625, 130600, '', '徐水县', 2),
(130626, 130600, '', '定兴县', 2),
(130627, 130600, '', '唐县', 2),
(130628, 130600, '', '高阳县', 2),
(130629, 130600, '', '容城县', 2),
(130630, 130600, '', '涞源县', 2),
(130631, 130600, '', '望都县', 2),
(130632, 130600, '', '安新县', 2),
(130633, 130600, '', '易县', 2),
(130634, 130600, '', '曲阳县', 2),
(130635, 130600, '', '蠡县', 2),
(130636, 130600, '', '顺平县', 2),
(130637, 130600, '', '博野县', 2),
(130638, 130600, '', '雄县', 2),
(130681, 130600, '', '涿州市', 2),
(130683, 130600, '', '安国市', 2),
(130684, 130600, '', '高碑店市', 2),
(130700, 130000, '', '张家口市', 1),
(130701, 130700, '', '市辖区', 2),
(130702, 130700, '', '桥东区', 2),
(130703, 130700, '', '桥西区', 2),
(130705, 130700, '', '宣化区', 2),
(130706, 130700, '', '下花园区', 2),
(130721, 130700, '', '宣化县', 2),
(130722, 130700, '', '张北县', 2),
(130723, 130700, '', '康保县', 2),
(130724, 130700, '', '沽源县', 2),
(130725, 130700, '', '尚义县', 2),
(130726, 130700, '', '蔚县', 2),
(130727, 130700, '', '阳原县', 2),
(130728, 130700, '', '怀安县', 2),
(130729, 130700, '', '万全县', 2),
(130730, 130700, '', '怀来县', 2),
(130731, 130700, '', '涿鹿县', 2),
(130732, 130700, '', '赤城县', 2),
(130733, 130700, '', '崇礼县', 2),
(130800, 130000, '', '承德市', 1),
(130801, 130800, '', '市辖区', 2),
(130802, 130800, '', '双桥区', 2),
(130803, 130800, '', '双滦区', 2),
(130804, 130800, '', '鹰手营子矿区', 2),
(130821, 130800, '', '承德县', 2),
(130822, 130800, '', '兴隆县', 2),
(130823, 130800, '', '平泉县', 2),
(130824, 130800, '', '滦平县', 2),
(130825, 130800, '', '隆化县', 2),
(130826, 130800, '', '丰宁满族自治县', 2),
(130827, 130800, '', '宽城满族自治县', 2),
(130828, 130800, '', '围场满族蒙古族自治县', 2),
(130900, 130000, '', '沧州市', 1),
(130901, 130900, '', '市辖区', 2),
(130902, 130900, '', '新华区', 2),
(130903, 130900, '', '运河区', 2),
(130921, 130900, '', '沧县', 2),
(130922, 130900, '', '青县', 2),
(130923, 130900, '', '东光县', 2),
(130924, 130900, '', '海兴县', 2),
(130925, 130900, '', '盐山县', 2),
(130926, 130900, '', '肃宁县', 2),
(130927, 130900, '', '南皮县', 2),
(130928, 130900, '', '吴桥县', 2),
(130929, 130900, '', '献县', 2),
(130930, 130900, '', '孟村回族自治县', 2),
(130981, 130900, '', '泊头市', 2),
(130982, 130900, '', '任丘市', 2),
(130983, 130900, '', '黄骅市', 2),
(130984, 130900, '', '河间市', 2),
(131000, 130000, '', '廊坊市', 1),
(131001, 131000, '', '市辖区', 2),
(131002, 131000, '', '安次区', 2),
(131003, 131000, '', '广阳区', 2),
(131022, 131000, '', '固安县', 2),
(131023, 131000, '', '永清县', 2),
(131024, 131000, '', '香河县', 2),
(131025, 131000, '', '大城县', 2),
(131026, 131000, '', '文安县', 2),
(131028, 131000, '', '大厂回族自治县', 2),
(131081, 131000, '', '霸州市', 2),
(131082, 131000, '', '三河市', 2),
(131100, 130000, '', '衡水市', 1),
(131101, 131100, '', '市辖区', 2),
(131102, 131100, '', '桃城区', 2),
(131121, 131100, '', '枣强县', 2),
(131122, 131100, '', '武邑县', 2),
(131123, 131100, '', '武强县', 2),
(131124, 131100, '', '饶阳县', 2),
(131125, 131100, '', '安平县', 2),
(131126, 131100, '', '故城县', 2),
(131127, 131100, '', '景县', 2),
(131128, 131100, '', '阜城县', 2),
(131181, 131100, '', '冀州市', 2),
(131182, 131100, '', '深州市', 2),
(139000, 130000, '', '省直辖县级行政区划', 1),
(139001, 139000, '', '定州市', 2),
(139002, 139000, '', '辛集市', 2),
(140000, 0, '', '山西省', 0),
(140100, 140000, '', '太原市', 1),
(140101, 140100, '', '市辖区', 2),
(140105, 140100, '', '小店区', 2),
(140106, 140100, '', '迎泽区', 2),
(140107, 140100, '', '杏花岭区', 2),
(140108, 140100, '', '尖草坪区', 2),
(140109, 140100, '', '万柏林区', 2),
(140110, 140100, '', '晋源区', 2),
(140121, 140100, '', '清徐县', 2),
(140122, 140100, '', '阳曲县', 2),
(140123, 140100, '', '娄烦县', 2),
(140181, 140100, '', '古交市', 2),
(140200, 140000, '', '大同市', 1),
(140201, 140200, '', '市辖区', 2),
(140202, 140200, '', '城区', 2),
(140203, 140200, '', '矿区', 2),
(140211, 140200, '', '南郊区', 2),
(140212, 140200, '', '新荣区', 2),
(140221, 140200, '', '阳高县', 2),
(140222, 140200, '', '天镇县', 2),
(140223, 140200, '', '广灵县', 2),
(140224, 140200, '', '灵丘县', 2),
(140225, 140200, '', '浑源县', 2),
(140226, 140200, '', '左云县', 2),
(140227, 140200, '', '大同县', 2),
(140300, 140000, '', '阳泉市', 1),
(140301, 140300, '', '市辖区', 2),
(140302, 140300, '', '城区', 2),
(140303, 140300, '', '矿区', 2),
(140311, 140300, '', '郊区', 2),
(140321, 140300, '', '平定县', 2),
(140322, 140300, '', '盂县', 2),
(140400, 140000, '', '长治市', 1),
(140401, 140400, '', '市辖区', 2),
(140402, 140400, '', '城区', 2),
(140411, 140400, '', '郊区', 2),
(140421, 140400, '', '长治县', 2),
(140423, 140400, '', '襄垣县', 2),
(140424, 140400, '', '屯留县', 2),
(140425, 140400, '', '平顺县', 2),
(140426, 140400, '', '黎城县', 2),
(140427, 140400, '', '壶关县', 2),
(140428, 140400, '', '长子县', 2),
(140429, 140400, '', '武乡县', 2),
(140430, 140400, '', '沁县', 2),
(140431, 140400, '', '沁源县', 2),
(140481, 140400, '', '潞城市', 2),
(140500, 140000, '', '晋城市', 1),
(140501, 140500, '', '市辖区', 2),
(140502, 140500, '', '城区', 2),
(140521, 140500, '', '沁水县', 2),
(140522, 140500, '', '阳城县', 2),
(140524, 140500, '', '陵川县', 2),
(140525, 140500, '', '泽州县', 2),
(140581, 140500, '', '高平市', 2),
(140600, 140000, '', '朔州市', 1),
(140601, 140600, '', '市辖区', 2),
(140602, 140600, '', '朔城区', 2),
(140603, 140600, '', '平鲁区', 2),
(140621, 140600, '', '山阴县', 2),
(140622, 140600, '', '应县', 2),
(140623, 140600, '', '右玉县', 2),
(140624, 140600, '', '怀仁县', 2),
(140700, 140000, '', '晋中市', 1),
(140701, 140700, '', '市辖区', 2),
(140702, 140700, '', '榆次区', 2),
(140721, 140700, '', '榆社县', 2),
(140722, 140700, '', '左权县', 2),
(140723, 140700, '', '和顺县', 2),
(140724, 140700, '', '昔阳县', 2),
(140725, 140700, '', '寿阳县', 2),
(140726, 140700, '', '太谷县', 2),
(140727, 140700, '', '祁县', 2),
(140728, 140700, '', '平遥县', 2),
(140729, 140700, '', '灵石县', 2),
(140781, 140700, '', '介休市', 2),
(140800, 140000, '', '运城市', 1),
(140801, 140800, '', '市辖区', 2),
(140802, 140800, '', '盐湖区', 2),
(140821, 140800, '', '临猗县', 2),
(140822, 140800, '', '万荣县', 2),
(140823, 140800, '', '闻喜县', 2),
(140824, 140800, '', '稷山县', 2),
(140825, 140800, '', '新绛县', 2),
(140826, 140800, '', '绛县', 2),
(140827, 140800, '', '垣曲县', 2),
(140828, 140800, '', '夏县', 2),
(140829, 140800, '', '平陆县', 2),
(140830, 140800, '', '芮城县', 2),
(140881, 140800, '', '永济市', 2),
(140882, 140800, '', '河津市', 2),
(140900, 140000, '', '忻州市', 1),
(140901, 140900, '', '市辖区', 2),
(140902, 140900, '', '忻府区', 2),
(140921, 140900, '', '定襄县', 2),
(140922, 140900, '', '五台县', 2),
(140923, 140900, '', '代县', 2),
(140924, 140900, '', '繁峙县', 2),
(140925, 140900, '', '宁武县', 2),
(140926, 140900, '', '静乐县', 2),
(140927, 140900, '', '神池县', 2),
(140928, 140900, '', '五寨县', 2),
(140929, 140900, '', '岢岚县', 2),
(140930, 140900, '', '河曲县', 2),
(140931, 140900, '', '保德县', 2),
(140932, 140900, '', '偏关县', 2),
(140981, 140900, '', '原平市', 2),
(141000, 140000, '', '临汾市', 1),
(141001, 141000, '', '市辖区', 2),
(141002, 141000, '', '尧都区', 2),
(141021, 141000, '', '曲沃县', 2),
(141022, 141000, '', '翼城县', 2),
(141023, 141000, '', '襄汾县', 2),
(141024, 141000, '', '洪洞县', 2),
(141025, 141000, '', '古县', 2),
(141026, 141000, '', '安泽县', 2),
(141027, 141000, '', '浮山县', 2),
(141028, 141000, '', '吉县', 2),
(141029, 141000, '', '乡宁县', 2),
(141030, 141000, '', '大宁县', 2),
(141031, 141000, '', '隰县', 2),
(141032, 141000, '', '永和县', 2),
(141033, 141000, '', '蒲县', 2),
(141034, 141000, '', '汾西县', 2),
(141081, 141000, '', '侯马市', 2),
(141082, 141000, '', '霍州市', 2),
(141100, 140000, '', '吕梁市', 1),
(141101, 141100, '', '市辖区', 2),
(141102, 141100, '', '离石区', 2),
(141121, 141100, '', '文水县', 2),
(141122, 141100, '', '交城县', 2),
(141123, 141100, '', '兴县', 2),
(141124, 141100, '', '临县', 2),
(141125, 141100, '', '柳林县', 2),
(141126, 141100, '', '石楼县', 2),
(141127, 141100, '', '岚县', 2),
(141128, 141100, '', '方山县', 2),
(141129, 141100, '', '中阳县', 2),
(141130, 141100, '', '交口县', 2),
(141181, 141100, '', '孝义市', 2),
(141182, 141100, '', '汾阳市', 2),
(150000, 0, '', '内蒙古自治区', 0),
(150100, 150000, '', '呼和浩特市', 1),
(150101, 150100, '', '市辖区', 2),
(150102, 150100, '', '新城区', 2),
(150103, 150100, '', '回民区', 2),
(150104, 150100, '', '玉泉区', 2),
(150105, 150100, '', '赛罕区', 2),
(150121, 150100, '', '土默特左旗', 2),
(150122, 150100, '', '托克托县', 2),
(150123, 150100, '', '和林格尔县', 2),
(150124, 150100, '', '清水河县', 2),
(150125, 150100, '', '武川县', 2),
(150200, 150000, '', '包头市', 1),
(150201, 150200, '', '市辖区', 2),
(150202, 150200, '', '东河区', 2),
(150203, 150200, '', '昆都仑区', 2),
(150204, 150200, '', '青山区', 2),
(150205, 150200, '', '石拐区', 2),
(150206, 150200, '', '白云鄂博矿区', 2),
(150207, 150200, '', '九原区', 2),
(150221, 150200, '', '土默特右旗', 2),
(150222, 150200, '', '固阳县', 2),
(150223, 150200, '', '达尔罕茂明安联合旗', 2),
(150300, 150000, '', '乌海市', 1),
(150301, 150300, '', '市辖区', 2),
(150302, 150300, '', '海勃湾区', 2),
(150303, 150300, '', '海南区', 2),
(150304, 150300, '', '乌达区', 2),
(150400, 150000, '', '赤峰市', 1),
(150401, 150400, '', '市辖区', 2),
(150402, 150400, '', '红山区', 2),
(150403, 150400, '', '元宝山区', 2),
(150404, 150400, '', '松山区', 2),
(150421, 150400, '', '阿鲁科尔沁旗', 2),
(150422, 150400, '', '巴林左旗', 2),
(150423, 150400, '', '巴林右旗', 2),
(150424, 150400, '', '林西县', 2),
(150425, 150400, '', '克什克腾旗', 2),
(150426, 150400, '', '翁牛特旗', 2),
(150428, 150400, '', '喀喇沁旗', 2),
(150429, 150400, '', '宁城县', 2),
(150430, 150400, '', '敖汉旗', 2),
(150500, 150000, '', '通辽市', 1),
(150501, 150500, '', '市辖区', 2),
(150502, 150500, '', '科尔沁区', 2),
(150521, 150500, '', '科尔沁左翼中旗', 2),
(150522, 150500, '', '科尔沁左翼后旗', 2),
(150523, 150500, '', '开鲁县', 2),
(150524, 150500, '', '库伦旗', 2),
(150525, 150500, '', '奈曼旗', 2),
(150526, 150500, '', '扎鲁特旗', 2),
(150581, 150500, '', '霍林郭勒市', 2),
(150600, 150000, '', '鄂尔多斯市', 1),
(150601, 150600, '', '市辖区', 2),
(150602, 150600, '', '东胜区', 2),
(150621, 150600, '', '达拉特旗', 2),
(150622, 150600, '', '准格尔旗', 2),
(150623, 150600, '', '鄂托克前旗', 2),
(150624, 150600, '', '鄂托克旗', 2),
(150625, 150600, '', '杭锦旗', 2),
(150626, 150600, '', '乌审旗', 2),
(150627, 150600, '', '伊金霍洛旗', 2),
(150700, 150000, '', '呼伦贝尔市', 1),
(150701, 150700, '', '市辖区', 2),
(150702, 150700, '', '海拉尔区', 2),
(150703, 150700, '', '扎赉诺尔区', 2),
(150721, 150700, '', '阿荣旗', 2),
(150722, 150700, '', '莫力达瓦达斡尔族自治旗', 2),
(150723, 150700, '', '鄂伦春自治旗', 2),
(150724, 150700, '', '鄂温克族自治旗', 2),
(150725, 150700, '', '陈巴尔虎旗', 2),
(150726, 150700, '', '新巴尔虎左旗', 2),
(150727, 150700, '', '新巴尔虎右旗', 2),
(150781, 150700, '', '满洲里市', 2),
(150782, 150700, '', '牙克石市', 2),
(150783, 150700, '', '扎兰屯市', 2),
(150784, 150700, '', '额尔古纳市', 2),
(150785, 150700, '', '根河市', 2),
(150800, 150000, '', '巴彦淖尔市', 1),
(150801, 150800, '', '市辖区', 2),
(150802, 150800, '', '临河区', 2),
(150821, 150800, '', '五原县', 2),
(150822, 150800, '', '磴口县', 2),
(150823, 150800, '', '乌拉特前旗', 2),
(150824, 150800, '', '乌拉特中旗', 2),
(150825, 150800, '', '乌拉特后旗', 2),
(150826, 150800, '', '杭锦后旗', 2),
(150900, 150000, '', '乌兰察布市', 1),
(150901, 150900, '', '市辖区', 2),
(150902, 150900, '', '集宁区', 2),
(150921, 150900, '', '卓资县', 2),
(150922, 150900, '', '化德县', 2),
(150923, 150900, '', '商都县', 2),
(150924, 150900, '', '兴和县', 2),
(150925, 150900, '', '凉城县', 2),
(150926, 150900, '', '察哈尔右翼前旗', 2),
(150927, 150900, '', '察哈尔右翼中旗', 2),
(150928, 150900, '', '察哈尔右翼后旗', 2),
(150929, 150900, '', '四子王旗', 2),
(150981, 150900, '', '丰镇市', 2),
(152200, 150000, '', '兴安盟', 1),
(152201, 152200, '', '乌兰浩特市', 2),
(152202, 152200, '', '阿尔山市', 2),
(152221, 152200, '', '科尔沁右翼前旗', 2),
(152222, 152200, '', '科尔沁右翼中旗', 2),
(152223, 152200, '', '扎赉特旗', 2),
(152224, 152200, '', '突泉县', 2),
(152500, 150000, '', '锡林郭勒盟', 1),
(152501, 152500, '', '二连浩特市', 2),
(152502, 152500, '', '锡林浩特市', 2),
(152522, 152500, '', '阿巴嘎旗', 2),
(152523, 152500, '', '苏尼特左旗', 2),
(152524, 152500, '', '苏尼特右旗', 2),
(152525, 152500, '', '东乌珠穆沁旗', 2),
(152526, 152500, '', '西乌珠穆沁旗', 2),
(152527, 152500, '', '太仆寺旗', 2),
(152528, 152500, '', '镶黄旗', 2),
(152529, 152500, '', '正镶白旗', 2),
(152530, 152500, '', '正蓝旗', 2),
(152531, 152500, '', '多伦县', 2),
(152900, 150000, '', '阿拉善盟', 1),
(152921, 152900, '', '阿拉善左旗', 2),
(152922, 152900, '', '阿拉善右旗', 2),
(152923, 152900, '', '额济纳旗', 2),
(210000, 0, '', '辽宁省', 0),
(210100, 210000, '', '沈阳市', 1),
(210101, 210100, '', '市辖区', 2),
(210102, 210100, '', '和平区', 2),
(210103, 210100, '', '沈河区', 2),
(210104, 210100, '', '大东区', 2),
(210105, 210100, '', '皇姑区', 2),
(210106, 210100, '', '铁西区', 2),
(210111, 210100, '', '苏家屯区', 2),
(210112, 210100, '', '浑南区', 2),
(210113, 210100, '', '沈北新区', 2),
(210114, 210100, '', '于洪区', 2),
(210122, 210100, '', '辽中县', 2),
(210123, 210100, '', '康平县', 2),
(210124, 210100, '', '法库县', 2),
(210181, 210100, '', '新民市', 2),
(210200, 210000, '', '大连市', 1),
(210201, 210200, '', '市辖区', 2),
(210202, 210200, '', '中山区', 2),
(210203, 210200, '', '西岗区', 2),
(210204, 210200, '', '沙河口区', 2),
(210211, 210200, '', '甘井子区', 2),
(210212, 210200, '', '旅顺口区', 2),
(210213, 210200, '', '金州区', 2),
(210224, 210200, '', '长海县', 2),
(210281, 210200, '', '瓦房店市', 2),
(210282, 210200, '', '普兰店市', 2),
(210283, 210200, '', '庄河市', 2),
(210300, 210000, '', '鞍山市', 1),
(210301, 210300, '', '市辖区', 2),
(210302, 210300, '', '铁东区', 2),
(210303, 210300, '', '铁西区', 2),
(210304, 210300, '', '立山区', 2),
(210311, 210300, '', '千山区', 2),
(210321, 210300, '', '台安县', 2),
(210323, 210300, '', '岫岩满族自治县', 2),
(210381, 210300, '', '海城市', 2),
(210400, 210000, '', '抚顺市', 1),
(210401, 210400, '', '市辖区', 2),
(210402, 210400, '', '新抚区', 2),
(210403, 210400, '', '东洲区', 2),
(210404, 210400, '', '望花区', 2),
(210411, 210400, '', '顺城区', 2),
(210421, 210400, '', '抚顺县', 2),
(210422, 210400, '', '新宾满族自治县', 2),
(210423, 210400, '', '清原满族自治县', 2),
(210500, 210000, '', '本溪市', 1),
(210501, 210500, '', '市辖区', 2),
(210502, 210500, '', '平山区', 2),
(210503, 210500, '', '溪湖区', 2),
(210504, 210500, '', '明山区', 2),
(210505, 210500, '', '南芬区', 2),
(210521, 210500, '', '本溪满族自治县', 2),
(210522, 210500, '', '桓仁满族自治县', 2),
(210600, 210000, '', '丹东市', 1),
(210601, 210600, '', '市辖区', 2),
(210602, 210600, '', '元宝区', 2),
(210603, 210600, '', '振兴区', 2),
(210604, 210600, '', '振安区', 2),
(210624, 210600, '', '宽甸满族自治县', 2),
(210681, 210600, '', '东港市', 2),
(210682, 210600, '', '凤城市', 2),
(210700, 210000, '', '锦州市', 1),
(210701, 210700, '', '市辖区', 2),
(210702, 210700, '', '古塔区', 2),
(210703, 210700, '', '凌河区', 2),
(210711, 210700, '', '太和区', 2),
(210726, 210700, '', '黑山县', 2),
(210727, 210700, '', '义县', 2),
(210781, 210700, '', '凌海市', 2),
(210782, 210700, '', '北镇市', 2),
(210800, 210000, '', '营口市', 1),
(210801, 210800, '', '市辖区', 2),
(210802, 210800, '', '站前区', 2),
(210803, 210800, '', '西市区', 2),
(210804, 210800, '', '鲅鱼圈区', 2),
(210811, 210800, '', '老边区', 2),
(210881, 210800, '', '盖州市', 2),
(210882, 210800, '', '大石桥市', 2),
(210900, 210000, '', '阜新市', 1),
(210901, 210900, '', '市辖区', 2),
(210902, 210900, '', '海州区', 2),
(210903, 210900, '', '新邱区', 2),
(210904, 210900, '', '太平区', 2),
(210905, 210900, '', '清河门区', 2),
(210911, 210900, '', '细河区', 2),
(210921, 210900, '', '阜新蒙古族自治县', 2),
(210922, 210900, '', '彰武县', 2),
(211000, 210000, '', '辽阳市', 1),
(211001, 211000, '', '市辖区', 2),
(211002, 211000, '', '白塔区', 2),
(211003, 211000, '', '文圣区', 2),
(211004, 211000, '', '宏伟区', 2),
(211005, 211000, '', '弓长岭区', 2),
(211011, 211000, '', '太子河区', 2),
(211021, 211000, '', '辽阳县', 2),
(211081, 211000, '', '灯塔市', 2),
(211100, 210000, '', '盘锦市', 1),
(211101, 211100, '', '市辖区', 2),
(211102, 211100, '', '双台子区', 2),
(211103, 211100, '', '兴隆台区', 2),
(211121, 211100, '', '大洼县', 2),
(211122, 211100, '', '盘山县', 2),
(211200, 210000, '', '铁岭市', 1),
(211201, 211200, '', '市辖区', 2),
(211202, 211200, '', '银州区', 2),
(211204, 211200, '', '清河区', 2),
(211221, 211200, '', '铁岭县', 2),
(211223, 211200, '', '西丰县', 2),
(211224, 211200, '', '昌图县', 2),
(211281, 211200, '', '调兵山市', 2),
(211282, 211200, '', '开原市', 2),
(211300, 210000, '', '朝阳市', 1),
(211301, 211300, '', '市辖区', 2),
(211302, 211300, '', '双塔区', 2),
(211303, 211300, '', '龙城区', 2),
(211321, 211300, '', '朝阳县', 2),
(211322, 211300, '', '建平县', 2),
(211324, 211300, '', '喀喇沁左翼蒙古族自治县', 2),
(211381, 211300, '', '北票市', 2),
(211382, 211300, '', '凌源市', 2),
(211400, 210000, '', '葫芦岛市', 1),
(211401, 211400, '', '市辖区', 2),
(211402, 211400, '', '连山区', 2),
(211403, 211400, '', '龙港区', 2),
(211404, 211400, '', '南票区', 2),
(211421, 211400, '', '绥中县', 2),
(211422, 211400, '', '建昌县', 2),
(211481, 211400, '', '兴城市', 2),
(220000, 0, '', '吉林省', 0),
(220100, 220000, '', '长春市', 1),
(220101, 220100, '', '市辖区', 2),
(220102, 220100, '', '南关区', 2),
(220103, 220100, '', '宽城区', 2),
(220104, 220100, '', '朝阳区', 2),
(220105, 220100, '', '二道区', 2),
(220106, 220100, '', '绿园区', 2),
(220112, 220100, '', '双阳区', 2),
(220113, 220100, '', '九台区', 2),
(220122, 220100, '', '农安县', 2),
(220182, 220100, '', '榆树市', 2),
(220183, 220100, '', '德惠市', 2),
(220200, 220000, '', '吉林市', 1),
(220201, 220200, '', '市辖区', 2),
(220202, 220200, '', '昌邑区', 2),
(220203, 220200, '', '龙潭区', 2),
(220204, 220200, '', '船营区', 2),
(220211, 220200, '', '丰满区', 2),
(220221, 220200, '', '永吉县', 2),
(220281, 220200, '', '蛟河市', 2),
(220282, 220200, '', '桦甸市', 2),
(220283, 220200, '', '舒兰市', 2),
(220284, 220200, '', '磐石市', 2),
(220300, 220000, '', '四平市', 1),
(220301, 220300, '', '市辖区', 2),
(220302, 220300, '', '铁西区', 2),
(220303, 220300, '', '铁东区', 2),
(220322, 220300, '', '梨树县', 2),
(220323, 220300, '', '伊通满族自治县', 2),
(220381, 220300, '', '公主岭市', 2),
(220382, 220300, '', '双辽市', 2),
(220400, 220000, '', '辽源市', 1),
(220401, 220400, '', '市辖区', 2),
(220402, 220400, '', '龙山区', 2),
(220403, 220400, '', '西安区', 2),
(220421, 220400, '', '东丰县', 2),
(220422, 220400, '', '东辽县', 2),
(220500, 220000, '', '通化市', 1),
(220501, 220500, '', '市辖区', 2),
(220502, 220500, '', '东昌区', 2),
(220503, 220500, '', '二道江区', 2),
(220521, 220500, '', '通化县', 2),
(220523, 220500, '', '辉南县', 2),
(220524, 220500, '', '柳河县', 2),
(220581, 220500, '', '梅河口市', 2),
(220582, 220500, '', '集安市', 2),
(220600, 220000, '', '白山市', 1),
(220601, 220600, '', '市辖区', 2),
(220602, 220600, '', '浑江区', 2),
(220605, 220600, '', '江源区', 2),
(220621, 220600, '', '抚松县', 2),
(220622, 220600, '', '靖宇县', 2),
(220623, 220600, '', '长白朝鲜族自治县', 2),
(220681, 220600, '', '临江市', 2),
(220700, 220000, '', '松原市', 1),
(220701, 220700, '', '市辖区', 2),
(220702, 220700, '', '宁江区', 2),
(220721, 220700, '', '前郭尔罗斯蒙古族自治县', 2),
(220722, 220700, '', '长岭县', 2),
(220723, 220700, '', '乾安县', 2),
(220781, 220700, '', '扶余市', 2),
(220800, 220000, '', '白城市', 1),
(220801, 220800, '', '市辖区', 2),
(220802, 220800, '', '洮北区', 2),
(220821, 220800, '', '镇赉县', 2),
(220822, 220800, '', '通榆县', 2),
(220881, 220800, '', '洮南市', 2),
(220882, 220800, '', '大安市', 2),
(222400, 220000, '', '延边朝鲜族自治州', 1),
(222401, 222400, '', '延吉市', 2),
(222402, 222400, '', '图们市', 2),
(222403, 222400, '', '敦化市', 2),
(222404, 222400, '', '珲春市', 2),
(222405, 222400, '', '龙井市', 2),
(222406, 222400, '', '和龙市', 2),
(222424, 222400, '', '汪清县', 2),
(222426, 222400, '', '安图县', 2),
(230000, 0, '', '黑龙江省', 0),
(230100, 230000, '', '哈尔滨市', 1),
(230101, 230100, '', '市辖区', 2),
(230102, 230100, '', '道里区', 2),
(230103, 230100, '', '南岗区', 2),
(230104, 230100, '', '道外区', 2),
(230108, 230100, '', '平房区', 2),
(230109, 230100, '', '松北区', 2),
(230110, 230100, '', '香坊区', 2),
(230111, 230100, '', '呼兰区', 2),
(230112, 230100, '', '阿城区', 2),
(230123, 230100, '', '依兰县', 2),
(230124, 230100, '', '方正县', 2),
(230125, 230100, '', '宾县', 2),
(230126, 230100, '', '巴彦县', 2),
(230127, 230100, '', '木兰县', 2),
(230128, 230100, '', '通河县', 2),
(230129, 230100, '', '延寿县', 2),
(230182, 230100, '', '双城市', 2),
(230183, 230100, '', '尚志市', 2),
(230184, 230100, '', '五常市', 2),
(230200, 230000, '', '齐齐哈尔市', 1),
(230201, 230200, '', '市辖区', 2),
(230202, 230200, '', '龙沙区', 2),
(230203, 230200, '', '建华区', 2),
(230204, 230200, '', '铁锋区', 2),
(230205, 230200, '', '昂昂溪区', 2),
(230206, 230200, '', '富拉尔基区', 2),
(230207, 230200, '', '碾子山区', 2),
(230208, 230200, '', '梅里斯达斡尔族区', 2),
(230221, 230200, '', '龙江县', 2),
(230223, 230200, '', '依安县', 2),
(230224, 230200, '', '泰来县', 2),
(230225, 230200, '', '甘南县', 2),
(230227, 230200, '', '富裕县', 2),
(230229, 230200, '', '克山县', 2),
(230230, 230200, '', '克东县', 2),
(230231, 230200, '', '拜泉县', 2),
(230281, 230200, '', '讷河市', 2),
(230300, 230000, '', '鸡西市', 1),
(230301, 230300, '', '市辖区', 2),
(230302, 230300, '', '鸡冠区', 2),
(230303, 230300, '', '恒山区', 2),
(230304, 230300, '', '滴道区', 2),
(230305, 230300, '', '梨树区', 2),
(230306, 230300, '', '城子河区', 2),
(230307, 230300, '', '麻山区', 2),
(230321, 230300, '', '鸡东县', 2),
(230381, 230300, '', '虎林市', 2),
(230382, 230300, '', '密山市', 2),
(230400, 230000, '', '鹤岗市', 1),
(230401, 230400, '', '市辖区', 2),
(230402, 230400, '', '向阳区', 2),
(230403, 230400, '', '工农区', 2),
(230404, 230400, '', '南山区', 2),
(230405, 230400, '', '兴安区', 2),
(230406, 230400, '', '东山区', 2),
(230407, 230400, '', '兴山区', 2),
(230421, 230400, '', '萝北县', 2),
(230422, 230400, '', '绥滨县', 2),
(230500, 230000, '', '双鸭山市', 1),
(230501, 230500, '', '市辖区', 2),
(230502, 230500, '', '尖山区', 2),
(230503, 230500, '', '岭东区', 2),
(230505, 230500, '', '四方台区', 2),
(230506, 230500, '', '宝山区', 2),
(230521, 230500, '', '集贤县', 2),
(230522, 230500, '', '友谊县', 2),
(230523, 230500, '', '宝清县', 2),
(230524, 230500, '', '饶河县', 2),
(230600, 230000, '', '大庆市', 1),
(230601, 230600, '', '市辖区', 2),
(230602, 230600, '', '萨尔图区', 2),
(230603, 230600, '', '龙凤区', 2),
(230604, 230600, '', '让胡路区', 2),
(230605, 230600, '', '红岗区', 2),
(230606, 230600, '', '大同区', 2),
(230621, 230600, '', '肇州县', 2),
(230622, 230600, '', '肇源县', 2),
(230623, 230600, '', '林甸县', 2),
(230624, 230600, '', '杜尔伯特蒙古族自治县', 2),
(230700, 230000, '', '伊春市', 1),
(230701, 230700, '', '市辖区', 2),
(230702, 230700, '', '伊春区', 2),
(230703, 230700, '', '南岔区', 2),
(230704, 230700, '', '友好区', 2),
(230705, 230700, '', '西林区', 2),
(230706, 230700, '', '翠峦区', 2),
(230707, 230700, '', '新青区', 2),
(230708, 230700, '', '美溪区', 2),
(230709, 230700, '', '金山屯区', 2),
(230710, 230700, '', '五营区', 2),
(230711, 230700, '', '乌马河区', 2),
(230712, 230700, '', '汤旺河区', 2),
(230713, 230700, '', '带岭区', 2),
(230714, 230700, '', '乌伊岭区', 2),
(230715, 230700, '', '红星区', 2),
(230716, 230700, '', '上甘岭区', 2),
(230722, 230700, '', '嘉荫县', 2),
(230781, 230700, '', '铁力市', 2),
(230800, 230000, '', '佳木斯市', 1),
(230801, 230800, '', '市辖区', 2),
(230803, 230800, '', '向阳区', 2),
(230804, 230800, '', '前进区', 2),
(230805, 230800, '', '东风区', 2),
(230811, 230800, '', '郊区', 2),
(230822, 230800, '', '桦南县', 2),
(230826, 230800, '', '桦川县', 2),
(230828, 230800, '', '汤原县', 2),
(230833, 230800, '', '抚远县', 2),
(230881, 230800, '', '同江市', 2),
(230882, 230800, '', '富锦市', 2),
(230900, 230000, '', '七台河市', 1),
(230901, 230900, '', '市辖区', 2),
(230902, 230900, '', '新兴区', 2),
(230903, 230900, '', '桃山区', 2),
(230904, 230900, '', '茄子河区', 2),
(230921, 230900, '', '勃利县', 2),
(231000, 230000, '', '牡丹江市', 1),
(231001, 231000, '', '市辖区', 2),
(231002, 231000, '', '东安区', 2),
(231003, 231000, '', '阳明区', 2),
(231004, 231000, '', '爱民区', 2),
(231005, 231000, '', '西安区', 2),
(231024, 231000, '', '东宁县', 2),
(231025, 231000, '', '林口县', 2),
(231081, 231000, '', '绥芬河市', 2),
(231083, 231000, '', '海林市', 2),
(231084, 231000, '', '宁安市', 2),
(231085, 231000, '', '穆棱市', 2),
(231100, 230000, '', '黑河市', 1),
(231101, 231100, '', '市辖区', 2),
(231102, 231100, '', '爱辉区', 2),
(231121, 231100, '', '嫩江县', 2),
(231123, 231100, '', '逊克县', 2),
(231124, 231100, '', '孙吴县', 2),
(231181, 231100, '', '北安市', 2),
(231182, 231100, '', '五大连池市', 2),
(231200, 230000, '', '绥化市', 1),
(231201, 231200, '', '市辖区', 2),
(231202, 231200, '', '北林区', 2),
(231221, 231200, '', '望奎县', 2),
(231222, 231200, '', '兰西县', 2),
(231223, 231200, '', '青冈县', 2),
(231224, 231200, '', '庆安县', 2),
(231225, 231200, '', '明水县', 2),
(231226, 231200, '', '绥棱县', 2),
(231281, 231200, '', '安达市', 2),
(231282, 231200, '', '肇东市', 2),
(231283, 231200, '', '海伦市', 2),
(232700, 230000, '', '大兴安岭地区', 1),
(232721, 232700, '', '呼玛县', 2),
(232722, 232700, '', '塔河县', 2),
(232723, 232700, '', '漠河县', 2),
(310000, 0, '', '上海市', 0),
(310100, 310000, '', '市辖区', 1),
(310101, 310100, '', '黄浦区', 2),
(310104, 310100, '', '徐汇区', 2),
(310105, 310100, '', '长宁区', 2),
(310106, 310100, '', '静安区', 2),
(310107, 310100, '', '普陀区', 2),
(310108, 310100, '', '闸北区', 2),
(310109, 310100, '', '虹口区', 2),
(310110, 310100, '', '杨浦区', 2),
(310112, 310100, '', '闵行区', 2),
(310113, 310100, '', '宝山区', 2),
(310114, 310100, '', '嘉定区', 2),
(310115, 310100, '', '浦东新区', 2),
(310116, 310100, '', '金山区', 2),
(310117, 310100, '', '松江区', 2),
(310118, 310100, '', '青浦区', 2),
(310120, 310100, '', '奉贤区', 2),
(310200, 310000, '', '县', 1),
(310230, 310200, '', '崇明县', 2),
(320000, 0, '', '江苏省', 0),
(320100, 320000, '', '南京市', 1),
(320101, 320100, '', '市辖区', 2),
(320102, 320100, '', '玄武区', 2),
(320104, 320100, '', '秦淮区', 2),
(320105, 320100, '', '建邺区', 2),
(320106, 320100, '', '鼓楼区', 2),
(320111, 320100, '', '浦口区', 2),
(320113, 320100, '', '栖霞区', 2),
(320114, 320100, '', '雨花台区', 2),
(320115, 320100, '', '江宁区', 2),
(320116, 320100, '', '六合区', 2),
(320117, 320100, '', '溧水区', 2),
(320118, 320100, '', '高淳区', 2),
(320200, 320000, '', '无锡市', 1),
(320201, 320200, '', '市辖区', 2),
(320202, 320200, '', '崇安区', 2),
(320203, 320200, '', '南长区', 2),
(320204, 320200, '', '北塘区', 2),
(320205, 320200, '', '锡山区', 2),
(320206, 320200, '', '惠山区', 2),
(320211, 320200, '', '滨湖区', 2),
(320281, 320200, '', '江阴市', 2),
(320282, 320200, '', '宜兴市', 2),
(320300, 320000, '', '徐州市', 1),
(320301, 320300, '', '市辖区', 2),
(320302, 320300, '', '鼓楼区', 2),
(320303, 320300, '', '云龙区', 2),
(320305, 320300, '', '贾汪区', 2),
(320311, 320300, '', '泉山区', 2),
(320312, 320300, '', '铜山区', 2),
(320321, 320300, '', '丰县', 2),
(320322, 320300, '', '沛县', 2),
(320324, 320300, '', '睢宁县', 2),
(320381, 320300, '', '新沂市', 2),
(320382, 320300, '', '邳州市', 2),
(320400, 320000, '', '常州市', 1),
(320401, 320400, '', '市辖区', 2),
(320402, 320400, '', '天宁区', 2),
(320404, 320400, '', '钟楼区', 2),
(320405, 320400, '', '戚墅堰区', 2),
(320411, 320400, '', '新北区', 2),
(320412, 320400, '', '武进区', 2),
(320481, 320400, '', '溧阳市', 2),
(320482, 320400, '', '金坛市', 2),
(320500, 320000, '', '苏州市', 1),
(320501, 320500, '', '市辖区', 2),
(320505, 320500, '', '虎丘区', 2),
(320506, 320500, '', '吴中区', 2),
(320507, 320500, '', '相城区', 2),
(320508, 320500, '', '姑苏区', 2),
(320509, 320500, '', '吴江区', 2),
(320581, 320500, '', '常熟市', 2),
(320582, 320500, '', '张家港市', 2),
(320583, 320500, '', '昆山市', 2),
(320585, 320500, '', '太仓市', 2),
(320600, 320000, '', '南通市', 1),
(320601, 320600, '', '市辖区', 2),
(320602, 320600, '', '崇川区', 2),
(320611, 320600, '', '港闸区', 2),
(320612, 320600, '', '通州区', 2),
(320621, 320600, '', '海安县', 2),
(320623, 320600, '', '如东县', 2),
(320681, 320600, '', '启东市', 2),
(320682, 320600, '', '如皋市', 2),
(320684, 320600, '', '海门市', 2),
(320700, 320000, '', '连云港市', 1),
(320701, 320700, '', '市辖区', 2),
(320703, 320700, '', '连云区', 2),
(320706, 320700, '', '海州区', 2),
(320707, 320700, '', '赣榆区', 2),
(320722, 320700, '', '东海县', 2),
(320723, 320700, '', '灌云县', 2),
(320724, 320700, '', '灌南县', 2),
(320800, 320000, '', '淮安市', 1),
(320801, 320800, '', '市辖区', 2),
(320802, 320800, '', '清河区', 2),
(320803, 320800, '', '淮安区', 2),
(320804, 320800, '', '淮阴区', 2),
(320811, 320800, '', '清浦区', 2),
(320826, 320800, '', '涟水县', 2),
(320829, 320800, '', '洪泽县', 2),
(320830, 320800, '', '盱眙县', 2),
(320831, 320800, '', '金湖县', 2),
(320900, 320000, '', '盐城市', 1),
(320901, 320900, '', '市辖区', 2),
(320902, 320900, '', '亭湖区', 2),
(320903, 320900, '', '盐都区', 2),
(320921, 320900, '', '响水县', 2),
(320922, 320900, '', '滨海县', 2),
(320923, 320900, '', '阜宁县', 2),
(320924, 320900, '', '射阳县', 2),
(320925, 320900, '', '建湖县', 2),
(320981, 320900, '', '东台市', 2),
(320982, 320900, '', '大丰市', 2),
(321000, 320000, '', '扬州市', 1),
(321001, 321000, '', '市辖区', 2),
(321002, 321000, '', '广陵区', 2),
(321003, 321000, '', '邗江区', 2),
(321012, 321000, '', '江都区', 2),
(321023, 321000, '', '宝应县', 2),
(321081, 321000, '', '仪征市', 2),
(321084, 321000, '', '高邮市', 2),
(321100, 320000, '', '镇江市', 1),
(321101, 321100, '', '市辖区', 2),
(321102, 321100, '', '京口区', 2),
(321111, 321100, '', '润州区', 2),
(321112, 321100, '', '丹徒区', 2),
(321181, 321100, '', '丹阳市', 2),
(321182, 321100, '', '扬中市', 2),
(321183, 321100, '', '句容市', 2),
(321200, 320000, '', '泰州市', 1),
(321201, 321200, '', '市辖区', 2),
(321202, 321200, '', '海陵区', 2),
(321203, 321200, '', '高港区', 2),
(321204, 321200, '', '姜堰区', 2),
(321281, 321200, '', '兴化市', 2),
(321282, 321200, '', '靖江市', 2),
(321283, 321200, '', '泰兴市', 2),
(321300, 320000, '', '宿迁市', 1),
(321301, 321300, '', '市辖区', 2),
(321302, 321300, '', '宿城区', 2),
(321311, 321300, '', '宿豫区', 2),
(321322, 321300, '', '沭阳县', 2),
(321323, 321300, '', '泗阳县', 2),
(321324, 321300, '', '泗洪县', 2),
(330000, 0, '', '浙江省', 0),
(330100, 330000, '', '杭州市', 1),
(330101, 330100, '', '市辖区', 2),
(330102, 330100, '', '上城区', 2),
(330103, 330100, '', '下城区', 2),
(330104, 330100, '', '江干区', 2),
(330105, 330100, '', '拱墅区', 2),
(330106, 330100, '', '西湖区', 2),
(330108, 330100, '', '滨江区', 2),
(330109, 330100, '', '萧山区', 2),
(330110, 330100, '', '余杭区', 2),
(330122, 330100, '', '桐庐县', 2),
(330127, 330100, '', '淳安县', 2),
(330182, 330100, '', '建德市', 2),
(330183, 330100, '', '富阳市', 2),
(330185, 330100, '', '临安市', 2),
(330200, 330000, '', '宁波市', 1),
(330201, 330200, '', '市辖区', 2),
(330203, 330200, '', '海曙区', 2),
(330204, 330200, '', '江东区', 2),
(330205, 330200, '', '江北区', 2),
(330206, 330200, '', '北仑区', 2),
(330211, 330200, '', '镇海区', 2),
(330212, 330200, '', '鄞州区', 2),
(330225, 330200, '', '象山县', 2),
(330226, 330200, '', '宁海县', 2),
(330281, 330200, '', '余姚市', 2),
(330282, 330200, '', '慈溪市', 2),
(330283, 330200, '', '奉化市', 2),
(330300, 330000, '', '温州市', 1),
(330301, 330300, '', '市辖区', 2),
(330302, 330300, '', '鹿城区', 2),
(330303, 330300, '', '龙湾区', 2),
(330304, 330300, '', '瓯海区', 2),
(330322, 330300, '', '洞头县', 2),
(330324, 330300, '', '永嘉县', 2),
(330326, 330300, '', '平阳县', 2),
(330327, 330300, '', '苍南县', 2),
(330328, 330300, '', '文成县', 2),
(330329, 330300, '', '泰顺县', 2),
(330381, 330300, '', '瑞安市', 2),
(330382, 330300, '', '乐清市', 2),
(330400, 330000, '', '嘉兴市', 1),
(330401, 330400, '', '市辖区', 2),
(330402, 330400, '', '南湖区', 2),
(330411, 330400, '', '秀洲区', 2),
(330421, 330400, '', '嘉善县', 2),
(330424, 330400, '', '海盐县', 2),
(330481, 330400, '', '海宁市', 2),
(330482, 330400, '', '平湖市', 2),
(330483, 330400, '', '桐乡市', 2),
(330500, 330000, '', '湖州市', 1),
(330501, 330500, '', '市辖区', 2),
(330502, 330500, '', '吴兴区', 2),
(330503, 330500, '', '南浔区', 2),
(330521, 330500, '', '德清县', 2),
(330522, 330500, '', '长兴县', 2),
(330523, 330500, '', '安吉县', 2),
(330600, 330000, '', '绍兴市', 1),
(330601, 330600, '', '市辖区', 2),
(330602, 330600, '', '越城区', 2),
(330603, 330600, '', '柯桥区', 2),
(330604, 330600, '', '上虞区', 2),
(330624, 330600, '', '新昌县', 2),
(330681, 330600, '', '诸暨市', 2),
(330683, 330600, '', '嵊州市', 2),
(330700, 330000, '', '金华市', 1),
(330701, 330700, '', '市辖区', 2),
(330702, 330700, '', '婺城区', 2),
(330703, 330700, '', '金东区', 2),
(330723, 330700, '', '武义县', 2),
(330726, 330700, '', '浦江县', 2),
(330727, 330700, '', '磐安县', 2),
(330781, 330700, '', '兰溪市', 2),
(330782, 330700, '', '义乌市', 2),
(330783, 330700, '', '东阳市', 2),
(330784, 330700, '', '永康市', 2),
(330800, 330000, '', '衢州市', 1),
(330801, 330800, '', '市辖区', 2),
(330802, 330800, '', '柯城区', 2),
(330803, 330800, '', '衢江区', 2),
(330822, 330800, '', '常山县', 2),
(330824, 330800, '', '开化县', 2),
(330825, 330800, '', '龙游县', 2),
(330881, 330800, '', '江山市', 2),
(330900, 330000, '', '舟山市', 1),
(330901, 330900, '', '市辖区', 2),
(330902, 330900, '', '定海区', 2),
(330903, 330900, '', '普陀区', 2),
(330921, 330900, '', '岱山县', 2),
(330922, 330900, '', '嵊泗县', 2),
(331000, 330000, '', '台州市', 1),
(331001, 331000, '', '市辖区', 2),
(331002, 331000, '', '椒江区', 2),
(331003, 331000, '', '黄岩区', 2),
(331004, 331000, '', '路桥区', 2),
(331021, 331000, '', '玉环县', 2),
(331022, 331000, '', '三门县', 2),
(331023, 331000, '', '天台县', 2),
(331024, 331000, '', '仙居县', 2),
(331081, 331000, '', '温岭市', 2),
(331082, 331000, '', '临海市', 2),
(331100, 330000, '', '丽水市', 1),
(331101, 331100, '', '市辖区', 2),
(331102, 331100, '', '莲都区', 2),
(331121, 331100, '', '青田县', 2),
(331122, 331100, '', '缙云县', 2),
(331123, 331100, '', '遂昌县', 2),
(331124, 331100, '', '松阳县', 2),
(331125, 331100, '', '云和县', 2),
(331126, 331100, '', '庆元县', 2),
(331127, 331100, '', '景宁畲族自治县', 2),
(331181, 331100, '', '龙泉市', 2),
(340000, 0, '', '安徽省', 0),
(340100, 340000, '', '合肥市', 1),
(340101, 340100, '', '市辖区', 2),
(340102, 340100, '', '瑶海区', 2),
(340103, 340100, '', '庐阳区', 2),
(340104, 340100, '', '蜀山区', 2),
(340111, 340100, '', '包河区', 2),
(340121, 340100, '', '长丰县', 2),
(340122, 340100, '', '肥东县', 2),
(340123, 340100, '', '肥西县', 2),
(340124, 340100, '', '庐江县', 2),
(340181, 340100, '', '巢湖市', 2),
(340200, 340000, '', '芜湖市', 1),
(340201, 340200, '', '市辖区', 2),
(340202, 340200, '', '镜湖区', 2),
(340203, 340200, '', '弋江区', 2),
(340207, 340200, '', '鸠江区', 2),
(340208, 340200, '', '三山区', 2),
(340221, 340200, '', '芜湖县', 2),
(340222, 340200, '', '繁昌县', 2),
(340223, 340200, '', '南陵县', 2),
(340225, 340200, '', '无为县', 2),
(340300, 340000, '', '蚌埠市', 1),
(340301, 340300, '', '市辖区', 2),
(340302, 340300, '', '龙子湖区', 2),
(340303, 340300, '', '蚌山区', 2),
(340304, 340300, '', '禹会区', 2),
(340311, 340300, '', '淮上区', 2),
(340321, 340300, '', '怀远县', 2),
(340322, 340300, '', '五河县', 2),
(340323, 340300, '', '固镇县', 2),
(340400, 340000, '', '淮南市', 1),
(340401, 340400, '', '市辖区', 2),
(340402, 340400, '', '大通区', 2),
(340403, 340400, '', '田家庵区', 2),
(340404, 340400, '', '谢家集区', 2),
(340405, 340400, '', '八公山区', 2),
(340406, 340400, '', '潘集区', 2),
(340421, 340400, '', '凤台县', 2),
(340500, 340000, '', '马鞍山市', 1),
(340501, 340500, '', '市辖区', 2),
(340503, 340500, '', '花山区', 2),
(340504, 340500, '', '雨山区', 2),
(340506, 340500, '', '博望区', 2),
(340521, 340500, '', '当涂县', 2),
(340522, 340500, '', '含山县', 2),
(340523, 340500, '', '和县', 2),
(340600, 340000, '', '淮北市', 1),
(340601, 340600, '', '市辖区', 2),
(340602, 340600, '', '杜集区', 2),
(340603, 340600, '', '相山区', 2),
(340604, 340600, '', '烈山区', 2),
(340621, 340600, '', '濉溪县', 2),
(340700, 340000, '', '铜陵市', 1),
(340701, 340700, '', '市辖区', 2),
(340702, 340700, '', '铜官山区', 2),
(340703, 340700, '', '狮子山区', 2),
(340711, 340700, '', '郊区', 2),
(340721, 340700, '', '铜陵县', 2),
(340800, 340000, '', '安庆市', 1),
(340801, 340800, '', '市辖区', 2),
(340802, 340800, '', '迎江区', 2),
(340803, 340800, '', '大观区', 2),
(340811, 340800, '', '宜秀区', 2),
(340822, 340800, '', '怀宁县', 2),
(340823, 340800, '', '枞阳县', 2),
(340824, 340800, '', '潜山县', 2),
(340825, 340800, '', '太湖县', 2),
(340826, 340800, '', '宿松县', 2),
(340827, 340800, '', '望江县', 2),
(340828, 340800, '', '岳西县', 2),
(340881, 340800, '', '桐城市', 2),
(341000, 340000, '', '黄山市', 1),
(341001, 341000, '', '市辖区', 2),
(341002, 341000, '', '屯溪区', 2),
(341003, 341000, '', '黄山区', 2),
(341004, 341000, '', '徽州区', 2),
(341021, 341000, '', '歙县', 2),
(341022, 341000, '', '休宁县', 2),
(341023, 341000, '', '黟县', 2),
(341024, 341000, '', '祁门县', 2),
(341100, 340000, '', '滁州市', 1),
(341101, 341100, '', '市辖区', 2),
(341102, 341100, '', '琅琊区', 2),
(341103, 341100, '', '南谯区', 2),
(341122, 341100, '', '来安县', 2),
(341124, 341100, '', '全椒县', 2),
(341125, 341100, '', '定远县', 2),
(341126, 341100, '', '凤阳县', 2),
(341181, 341100, '', '天长市', 2),
(341182, 341100, '', '明光市', 2),
(341200, 340000, '', '阜阳市', 1),
(341201, 341200, '', '市辖区', 2),
(341202, 341200, '', '颍州区', 2),
(341203, 341200, '', '颍东区', 2),
(341204, 341200, '', '颍泉区', 2),
(341221, 341200, '', '临泉县', 2),
(341222, 341200, '', '太和县', 2),
(341225, 341200, '', '阜南县', 2),
(341226, 341200, '', '颍上县', 2),
(341282, 341200, '', '界首市', 2),
(341300, 340000, '', '宿州市', 1),
(341301, 341300, '', '市辖区', 2),
(341302, 341300, '', '埇桥区', 2),
(341321, 341300, '', '砀山县', 2),
(341322, 341300, '', '萧县', 2),
(341323, 341300, '', '灵璧县', 2),
(341324, 341300, '', '泗县', 2),
(341500, 340000, '', '六安市', 1),
(341501, 341500, '', '市辖区', 2),
(341502, 341500, '', '金安区', 2),
(341503, 341500, '', '裕安区', 2),
(341521, 341500, '', '寿县', 2),
(341522, 341500, '', '霍邱县', 2),
(341523, 341500, '', '舒城县', 2),
(341524, 341500, '', '金寨县', 2),
(341525, 341500, '', '霍山县', 2),
(341600, 340000, '', '亳州市', 1),
(341601, 341600, '', '市辖区', 2),
(341602, 341600, '', '谯城区', 2),
(341621, 341600, '', '涡阳县', 2),
(341622, 341600, '', '蒙城县', 2),
(341623, 341600, '', '利辛县', 2),
(341700, 340000, '', '池州市', 1),
(341701, 341700, '', '市辖区', 2),
(341702, 341700, '', '贵池区', 2),
(341721, 341700, '', '东至县', 2),
(341722, 341700, '', '石台县', 2),
(341723, 341700, '', '青阳县', 2),
(341800, 340000, '', '宣城市', 1),
(341801, 341800, '', '市辖区', 2),
(341802, 341800, '', '宣州区', 2),
(341821, 341800, '', '郎溪县', 2),
(341822, 341800, '', '广德县', 2),
(341823, 341800, '', '泾县', 2),
(341824, 341800, '', '绩溪县', 2),
(341825, 341800, '', '旌德县', 2),
(341881, 341800, '', '宁国市', 2),
(350000, 0, '', '福建省', 0),
(350100, 350000, '', '福州市', 1),
(350101, 350100, '', '市辖区', 2),
(350102, 350100, '', '鼓楼区', 2),
(350103, 350100, '', '台江区', 2),
(350104, 350100, '', '仓山区', 2),
(350105, 350100, '', '马尾区', 2),
(350111, 350100, '', '晋安区', 2),
(350121, 350100, '', '闽侯县', 2),
(350122, 350100, '', '连江县', 2),
(350123, 350100, '', '罗源县', 2),
(350124, 350100, '', '闽清县', 2),
(350125, 350100, '', '永泰县', 2),
(350128, 350100, '', '平潭县', 2),
(350181, 350100, '', '福清市', 2),
(350182, 350100, '', '长乐市', 2),
(350200, 350000, '', '厦门市', 1),
(350201, 350200, '', '市辖区', 2),
(350203, 350200, '', '思明区', 2),
(350205, 350200, '', '海沧区', 2),
(350206, 350200, '', '湖里区', 2),
(350211, 350200, '', '集美区', 2),
(350212, 350200, '', '同安区', 2),
(350213, 350200, '', '翔安区', 2),
(350300, 350000, '', '莆田市', 1),
(350301, 350300, '', '市辖区', 2),
(350302, 350300, '', '城厢区', 2),
(350303, 350300, '', '涵江区', 2),
(350304, 350300, '', '荔城区', 2),
(350305, 350300, '', '秀屿区', 2),
(350322, 350300, '', '仙游县', 2),
(350400, 350000, '', '三明市', 1),
(350401, 350400, '', '市辖区', 2),
(350402, 350400, '', '梅列区', 2),
(350403, 350400, '', '三元区', 2),
(350421, 350400, '', '明溪县', 2),
(350423, 350400, '', '清流县', 2),
(350424, 350400, '', '宁化县', 2),
(350425, 350400, '', '大田县', 2),
(350426, 350400, '', '尤溪县', 2),
(350427, 350400, '', '沙县', 2),
(350428, 350400, '', '将乐县', 2),
(350429, 350400, '', '泰宁县', 2),
(350430, 350400, '', '建宁县', 2),
(350481, 350400, '', '永安市', 2),
(350500, 350000, '', '泉州市', 1),
(350501, 350500, '', '市辖区', 2),
(350502, 350500, '', '鲤城区', 2),
(350503, 350500, '', '丰泽区', 2),
(350504, 350500, '', '洛江区', 2),
(350505, 350500, '', '泉港区', 2),
(350521, 350500, '', '惠安县', 2),
(350524, 350500, '', '安溪县', 2),
(350525, 350500, '', '永春县', 2),
(350526, 350500, '', '德化县', 2),
(350527, 350500, '', '金门县', 2),
(350581, 350500, '', '石狮市', 2),
(350582, 350500, '', '晋江市', 2),
(350583, 350500, '', '南安市', 2),
(350600, 350000, '', '漳州市', 1),
(350601, 350600, '', '市辖区', 2),
(350602, 350600, '', '芗城区', 2),
(350603, 350600, '', '龙文区', 2),
(350622, 350600, '', '云霄县', 2),
(350623, 350600, '', '漳浦县', 2),
(350624, 350600, '', '诏安县', 2),
(350625, 350600, '', '长泰县', 2),
(350626, 350600, '', '东山县', 2),
(350627, 350600, '', '南靖县', 2),
(350628, 350600, '', '平和县', 2),
(350629, 350600, '', '华安县', 2),
(350681, 350600, '', '龙海市', 2),
(350700, 350000, '', '南平市', 1),
(350701, 350700, '', '市辖区', 2),
(350702, 350700, '', '延平区', 2),
(350721, 350700, '', '顺昌县', 2),
(350722, 350700, '', '浦城县', 2),
(350723, 350700, '', '光泽县', 2),
(350724, 350700, '', '松溪县', 2),
(350725, 350700, '', '政和县', 2),
(350781, 350700, '', '邵武市', 2),
(350782, 350700, '', '武夷山市', 2),
(350783, 350700, '', '建瓯市', 2),
(350784, 350700, '', '建阳市', 2),
(350800, 350000, '', '龙岩市', 1),
(350801, 350800, '', '市辖区', 2),
(350802, 350800, '', '新罗区', 2),
(350821, 350800, '', '长汀县', 2),
(350822, 350800, '', '永定县', 2),
(350823, 350800, '', '上杭县', 2),
(350824, 350800, '', '武平县', 2),
(350825, 350800, '', '连城县', 2),
(350881, 350800, '', '漳平市', 2),
(350900, 350000, '', '宁德市', 1),
(350901, 350900, '', '市辖区', 2),
(350902, 350900, '', '蕉城区', 2),
(350921, 350900, '', '霞浦县', 2),
(350922, 350900, '', '古田县', 2),
(350923, 350900, '', '屏南县', 2),
(350924, 350900, '', '寿宁县', 2),
(350925, 350900, '', '周宁县', 2),
(350926, 350900, '', '柘荣县', 2),
(350981, 350900, '', '福安市', 2),
(350982, 350900, '', '福鼎市', 2),
(360000, 0, '', '江西省', 0),
(360100, 360000, '', '南昌市', 1),
(360101, 360100, '', '市辖区', 2),
(360102, 360100, '', '东湖区', 2),
(360103, 360100, '', '西湖区', 2),
(360104, 360100, '', '青云谱区', 2),
(360105, 360100, '', '湾里区', 2),
(360111, 360100, '', '青山湖区', 2),
(360121, 360100, '', '南昌县', 2),
(360122, 360100, '', '新建县', 2),
(360123, 360100, '', '安义县', 2),
(360124, 360100, '', '进贤县', 2),
(360200, 360000, '', '景德镇市', 1),
(360201, 360200, '', '市辖区', 2),
(360202, 360200, '', '昌江区', 2),
(360203, 360200, '', '珠山区', 2),
(360222, 360200, '', '浮梁县', 2),
(360281, 360200, '', '乐平市', 2),
(360300, 360000, '', '萍乡市', 1),
(360301, 360300, '', '市辖区', 2),
(360302, 360300, '', '安源区', 2),
(360313, 360300, '', '湘东区', 2),
(360321, 360300, '', '莲花县', 2),
(360322, 360300, '', '上栗县', 2),
(360323, 360300, '', '芦溪县', 2),
(360400, 360000, '', '九江市', 1),
(360401, 360400, '', '市辖区', 2),
(360402, 360400, '', '庐山区', 2),
(360403, 360400, '', '浔阳区', 2),
(360421, 360400, '', '九江县', 2),
(360423, 360400, '', '武宁县', 2),
(360424, 360400, '', '修水县', 2),
(360425, 360400, '', '永修县', 2),
(360426, 360400, '', '德安县', 2),
(360427, 360400, '', '星子县', 2),
(360428, 360400, '', '都昌县', 2),
(360429, 360400, '', '湖口县', 2),
(360430, 360400, '', '彭泽县', 2),
(360481, 360400, '', '瑞昌市', 2),
(360482, 360400, '', '共青城市', 2),
(360500, 360000, '', '新余市', 1),
(360501, 360500, '', '市辖区', 2),
(360502, 360500, '', '渝水区', 2),
(360521, 360500, '', '分宜县', 2),
(360600, 360000, '', '鹰潭市', 1),
(360601, 360600, '', '市辖区', 2),
(360602, 360600, '', '月湖区', 2),
(360622, 360600, '', '余江县', 2),
(360681, 360600, '', '贵溪市', 2),
(360700, 360000, '', '赣州市', 1),
(360701, 360700, '', '市辖区', 2),
(360702, 360700, '', '章贡区', 2),
(360703, 360700, '', '南康区', 2),
(360721, 360700, '', '赣县', 2),
(360722, 360700, '', '信丰县', 2),
(360723, 360700, '', '大余县', 2),
(360724, 360700, '', '上犹县', 2),
(360725, 360700, '', '崇义县', 2),
(360726, 360700, '', '安远县', 2),
(360727, 360700, '', '龙南县', 2),
(360728, 360700, '', '定南县', 2),
(360729, 360700, '', '全南县', 2),
(360730, 360700, '', '宁都县', 2),
(360731, 360700, '', '于都县', 2),
(360732, 360700, '', '兴国县', 2),
(360733, 360700, '', '会昌县', 2),
(360734, 360700, '', '寻乌县', 2),
(360735, 360700, '', '石城县', 2),
(360781, 360700, '', '瑞金市', 2),
(360800, 360000, '', '吉安市', 1),
(360801, 360800, '', '市辖区', 2),
(360802, 360800, '', '吉州区', 2),
(360803, 360800, '', '青原区', 2),
(360821, 360800, '', '吉安县', 2),
(360822, 360800, '', '吉水县', 2),
(360823, 360800, '', '峡江县', 2),
(360824, 360800, '', '新干县', 2),
(360825, 360800, '', '永丰县', 2),
(360826, 360800, '', '泰和县', 2),
(360827, 360800, '', '遂川县', 2),
(360828, 360800, '', '万安县', 2),
(360829, 360800, '', '安福县', 2),
(360830, 360800, '', '永新县', 2),
(360881, 360800, '', '井冈山市', 2),
(360900, 360000, '', '宜春市', 1),
(360901, 360900, '', '市辖区', 2),
(360902, 360900, '', '袁州区', 2),
(360921, 360900, '', '奉新县', 2),
(360922, 360900, '', '万载县', 2),
(360923, 360900, '', '上高县', 2),
(360924, 360900, '', '宜丰县', 2),
(360925, 360900, '', '靖安县', 2),
(360926, 360900, '', '铜鼓县', 2),
(360981, 360900, '', '丰城市', 2),
(360982, 360900, '', '樟树市', 2),
(360983, 360900, '', '高安市', 2),
(361000, 360000, '', '抚州市', 1),
(361001, 361000, '', '市辖区', 2),
(361002, 361000, '', '临川区', 2),
(361021, 361000, '', '南城县', 2),
(361022, 361000, '', '黎川县', 2),
(361023, 361000, '', '南丰县', 2),
(361024, 361000, '', '崇仁县', 2),
(361025, 361000, '', '乐安县', 2),
(361026, 361000, '', '宜黄县', 2),
(361027, 361000, '', '金溪县', 2),
(361028, 361000, '', '资溪县', 2),
(361029, 361000, '', '东乡县', 2),
(361030, 361000, '', '广昌县', 2),
(361100, 360000, '', '上饶市', 1),
(361101, 361100, '', '市辖区', 2),
(361102, 361100, '', '信州区', 2),
(361121, 361100, '', '上饶县', 2),
(361122, 361100, '', '广丰县', 2),
(361123, 361100, '', '玉山县', 2),
(361124, 361100, '', '铅山县', 2),
(361125, 361100, '', '横峰县', 2),
(361126, 361100, '', '弋阳县', 2),
(361127, 361100, '', '余干县', 2),
(361128, 361100, '', '鄱阳县', 2),
(361129, 361100, '', '万年县', 2),
(361130, 361100, '', '婺源县', 2),
(361181, 361100, '', '德兴市', 2),
(370000, 0, '', '山东省', 0),
(370100, 370000, '', '济南市', 1),
(370101, 370100, '', '市辖区', 2),
(370102, 370100, '', '历下区', 2),
(370103, 370100, '', '市中区', 2),
(370104, 370100, '', '槐荫区', 2),
(370105, 370100, '', '天桥区', 2),
(370112, 370100, '', '历城区', 2),
(370113, 370100, '', '长清区', 2),
(370124, 370100, '', '平阴县', 2),
(370125, 370100, '', '济阳县', 2),
(370126, 370100, '', '商河县', 2),
(370181, 370100, '', '章丘市', 2),
(370200, 370000, '', '青岛市', 1),
(370201, 370200, '', '市辖区', 2),
(370202, 370200, '', '市南区', 2),
(370203, 370200, '', '市北区', 2),
(370211, 370200, '', '黄岛区', 2),
(370212, 370200, '', '崂山区', 2),
(370213, 370200, '', '李沧区', 2),
(370214, 370200, '', '城阳区', 2),
(370281, 370200, '', '胶州市', 2),
(370282, 370200, '', '即墨市', 2),
(370283, 370200, '', '平度市', 2),
(370285, 370200, '', '莱西市', 2),
(370300, 370000, '', '淄博市', 1),
(370301, 370300, '', '市辖区', 2),
(370302, 370300, '', '淄川区', 2),
(370303, 370300, '', '张店区', 2),
(370304, 370300, '', '博山区', 2),
(370305, 370300, '', '临淄区', 2),
(370306, 370300, '', '周村区', 2),
(370321, 370300, '', '桓台县', 2),
(370322, 370300, '', '高青县', 2),
(370323, 370300, '', '沂源县', 2),
(370400, 370000, '', '枣庄市', 1),
(370401, 370400, '', '市辖区', 2),
(370402, 370400, '', '市中区', 2),
(370403, 370400, '', '薛城区', 2),
(370404, 370400, '', '峄城区', 2),
(370405, 370400, '', '台儿庄区', 2),
(370406, 370400, '', '山亭区', 2),
(370481, 370400, '', '滕州市', 2),
(370500, 370000, '', '东营市', 1),
(370501, 370500, '', '市辖区', 2),
(370502, 370500, '', '东营区', 2),
(370503, 370500, '', '河口区', 2),
(370521, 370500, '', '垦利县', 2),
(370522, 370500, '', '利津县', 2),
(370523, 370500, '', '广饶县', 2),
(370600, 370000, '', '烟台市', 1),
(370601, 370600, '', '市辖区', 2),
(370602, 370600, '', '芝罘区', 2),
(370611, 370600, '', '福山区', 2),
(370612, 370600, '', '牟平区', 2),
(370613, 370600, '', '莱山区', 2),
(370634, 370600, '', '长岛县', 2),
(370681, 370600, '', '龙口市', 2),
(370682, 370600, '', '莱阳市', 2),
(370683, 370600, '', '莱州市', 2),
(370684, 370600, '', '蓬莱市', 2),
(370685, 370600, '', '招远市', 2),
(370686, 370600, '', '栖霞市', 2),
(370687, 370600, '', '海阳市', 2),
(370700, 370000, '', '潍坊市', 1),
(370701, 370700, '', '市辖区', 2),
(370702, 370700, '', '潍城区', 2),
(370703, 370700, '', '寒亭区', 2),
(370704, 370700, '', '坊子区', 2),
(370705, 370700, '', '奎文区', 2),
(370724, 370700, '', '临朐县', 2),
(370725, 370700, '', '昌乐县', 2),
(370781, 370700, '', '青州市', 2),
(370782, 370700, '', '诸城市', 2),
(370783, 370700, '', '寿光市', 2),
(370784, 370700, '', '安丘市', 2),
(370785, 370700, '', '高密市', 2),
(370786, 370700, '', '昌邑市', 2),
(370800, 370000, '', '济宁市', 1),
(370801, 370800, '', '市辖区', 2),
(370811, 370800, '', '任城区', 2),
(370812, 370800, '', '兖州区', 2),
(370826, 370800, '', '微山县', 2),
(370827, 370800, '', '鱼台县', 2),
(370828, 370800, '', '金乡县', 2),
(370829, 370800, '', '嘉祥县', 2),
(370830, 370800, '', '汶上县', 2),
(370831, 370800, '', '泗水县', 2),
(370832, 370800, '', '梁山县', 2),
(370881, 370800, '', '曲阜市', 2),
(370883, 370800, '', '邹城市', 2),
(370900, 370000, '', '泰安市', 1),
(370901, 370900, '', '市辖区', 2),
(370902, 370900, '', '泰山区', 2),
(370911, 370900, '', '岱岳区', 2),
(370921, 370900, '', '宁阳县', 2),
(370923, 370900, '', '东平县', 2),
(370982, 370900, '', '新泰市', 2),
(370983, 370900, '', '肥城市', 2),
(371000, 370000, '', '威海市', 1),
(371001, 371000, '', '市辖区', 2),
(371002, 371000, '', '环翠区', 2),
(371003, 371000, '', '文登区', 2),
(371082, 371000, '', '荣成市', 2),
(371083, 371000, '', '乳山市', 2),
(371100, 370000, '', '日照市', 1),
(371101, 371100, '', '市辖区', 2),
(371102, 371100, '', '东港区', 2),
(371103, 371100, '', '岚山区', 2),
(371121, 371100, '', '五莲县', 2),
(371122, 371100, '', '莒县', 2),
(371200, 370000, '', '莱芜市', 1),
(371201, 371200, '', '市辖区', 2),
(371202, 371200, '', '莱城区', 2),
(371203, 371200, '', '钢城区', 2),
(371300, 370000, '', '临沂市', 1),
(371301, 371300, '', '市辖区', 2),
(371302, 371300, '', '兰山区', 2),
(371311, 371300, '', '罗庄区', 2),
(371312, 371300, '', '河东区', 2),
(371321, 371300, '', '沂南县', 2),
(371322, 371300, '', '郯城县', 2),
(371323, 371300, '', '沂水县', 2),
(371324, 371300, '', '兰陵县', 2),
(371325, 371300, '', '费县', 2),
(371326, 371300, '', '平邑县', 2),
(371327, 371300, '', '莒南县', 2),
(371328, 371300, '', '蒙阴县', 2),
(371329, 371300, '', '临沭县', 2),
(371400, 370000, '', '德州市', 1),
(371401, 371400, '', '市辖区', 2),
(371402, 371400, '', '德城区', 2),
(371403, 371400, '', '陵城区', 2),
(371422, 371400, '', '宁津县', 2),
(371423, 371400, '', '庆云县', 2),
(371424, 371400, '', '临邑县', 2),
(371425, 371400, '', '齐河县', 2),
(371426, 371400, '', '平原县', 2),
(371427, 371400, '', '夏津县', 2),
(371428, 371400, '', '武城县', 2),
(371481, 371400, '', '乐陵市', 2),
(371482, 371400, '', '禹城市', 2),
(371500, 370000, '', '聊城市', 1),
(371501, 371500, '', '市辖区', 2),
(371502, 371500, '', '东昌府区', 2),
(371521, 371500, '', '阳谷县', 2),
(371522, 371500, '', '莘县', 2),
(371523, 371500, '', '茌平县', 2),
(371524, 371500, '', '东阿县', 2),
(371525, 371500, '', '冠县', 2),
(371526, 371500, '', '高唐县', 2),
(371581, 371500, '', '临清市', 2),
(371600, 370000, '', '滨州市', 1),
(371601, 371600, '', '市辖区', 2),
(371602, 371600, '', '滨城区', 2),
(371603, 371600, '', '沾化区', 2),
(371621, 371600, '', '惠民县', 2),
(371622, 371600, '', '阳信县', 2),
(371623, 371600, '', '无棣县', 2),
(371625, 371600, '', '博兴县', 2),
(371626, 371600, '', '邹平县', 2),
(371700, 370000, '', '菏泽市', 1),
(371701, 371700, '', '市辖区', 2),
(371702, 371700, '', '牡丹区', 2),
(371721, 371700, '', '曹县', 2),
(371722, 371700, '', '单县', 2),
(371723, 371700, '', '成武县', 2),
(371724, 371700, '', '巨野县', 2),
(371725, 371700, '', '郓城县', 2),
(371726, 371700, '', '鄄城县', 2),
(371727, 371700, '', '定陶县', 2),
(371728, 371700, '', '东明县', 2),
(410000, 0, '', '河南省', 0);
INSERT INTO `yii2_region` (`code`, `parent_code`, `name`, `fullname`, `level`) VALUES
(410100, 410000, '', '郑州市', 1),
(410101, 410100, '', '市辖区', 2),
(410102, 410100, '', '中原区', 2),
(410103, 410100, '', '二七区', 2),
(410104, 410100, '', '管城回族区', 2),
(410105, 410100, '', '金水区', 2),
(410106, 410100, '', '上街区', 2),
(410108, 410100, '', '惠济区', 2),
(410122, 410100, '', '中牟县', 2),
(410181, 410100, '', '巩义市', 2),
(410182, 410100, '', '荥阳市', 2),
(410183, 410100, '', '新密市', 2),
(410184, 410100, '', '新郑市', 2),
(410185, 410100, '', '登封市', 2),
(410200, 410000, '', '开封市', 1),
(410201, 410200, '', '市辖区', 2),
(410202, 410200, '', '龙亭区', 2),
(410203, 410200, '', '顺河回族区', 2),
(410204, 410200, '', '鼓楼区', 2),
(410205, 410200, '', '禹王台区', 2),
(410211, 410200, '', '金明区', 2),
(410221, 410200, '', '杞县', 2),
(410222, 410200, '', '通许县', 2),
(410223, 410200, '', '尉氏县', 2),
(410224, 410200, '', '开封县', 2),
(410225, 410200, '', '兰考县', 2),
(410300, 410000, '', '洛阳市', 1),
(410301, 410300, '', '市辖区', 2),
(410302, 410300, '', '老城区', 2),
(410303, 410300, '', '西工区', 2),
(410304, 410300, '', '瀍河回族区', 2),
(410305, 410300, '', '涧西区', 2),
(410306, 410300, '', '吉利区', 2),
(410311, 410300, '', '洛龙区', 2),
(410322, 410300, '', '孟津县', 2),
(410323, 410300, '', '新安县', 2),
(410324, 410300, '', '栾川县', 2),
(410325, 410300, '', '嵩县', 2),
(410326, 410300, '', '汝阳县', 2),
(410327, 410300, '', '宜阳县', 2),
(410328, 410300, '', '洛宁县', 2),
(410329, 410300, '', '伊川县', 2),
(410381, 410300, '', '偃师市', 2),
(410400, 410000, '', '平顶山市', 1),
(410401, 410400, '', '市辖区', 2),
(410402, 410400, '', '新华区', 2),
(410403, 410400, '', '卫东区', 2),
(410404, 410400, '', '石龙区', 2),
(410411, 410400, '', '湛河区', 2),
(410421, 410400, '', '宝丰县', 2),
(410422, 410400, '', '叶县', 2),
(410423, 410400, '', '鲁山县', 2),
(410425, 410400, '', '郏县', 2),
(410481, 410400, '', '舞钢市', 2),
(410482, 410400, '', '汝州市', 2),
(410500, 410000, '', '安阳市', 1),
(410501, 410500, '', '市辖区', 2),
(410502, 410500, '', '文峰区', 2),
(410503, 410500, '', '北关区', 2),
(410505, 410500, '', '殷都区', 2),
(410506, 410500, '', '龙安区', 2),
(410522, 410500, '', '安阳县', 2),
(410523, 410500, '', '汤阴县', 2),
(410526, 410500, '', '滑县', 2),
(410527, 410500, '', '内黄县', 2),
(410581, 410500, '', '林州市', 2),
(410600, 410000, '', '鹤壁市', 1),
(410601, 410600, '', '市辖区', 2),
(410602, 410600, '', '鹤山区', 2),
(410603, 410600, '', '山城区', 2),
(410611, 410600, '', '淇滨区', 2),
(410621, 410600, '', '浚县', 2),
(410622, 410600, '', '淇县', 2),
(410700, 410000, '', '新乡市', 1),
(410701, 410700, '', '市辖区', 2),
(410702, 410700, '', '红旗区', 2),
(410703, 410700, '', '卫滨区', 2),
(410704, 410700, '', '凤泉区', 2),
(410711, 410700, '', '牧野区', 2),
(410721, 410700, '', '新乡县', 2),
(410724, 410700, '', '获嘉县', 2),
(410725, 410700, '', '原阳县', 2),
(410726, 410700, '', '延津县', 2),
(410727, 410700, '', '封丘县', 2),
(410728, 410700, '', '长垣县', 2),
(410781, 410700, '', '卫辉市', 2),
(410782, 410700, '', '辉县市', 2),
(410800, 410000, '', '焦作市', 1),
(410801, 410800, '', '市辖区', 2),
(410802, 410800, '', '解放区', 2),
(410803, 410800, '', '中站区', 2),
(410804, 410800, '', '马村区', 2),
(410811, 410800, '', '山阳区', 2),
(410821, 410800, '', '修武县', 2),
(410822, 410800, '', '博爱县', 2),
(410823, 410800, '', '武陟县', 2),
(410825, 410800, '', '温县', 2),
(410882, 410800, '', '沁阳市', 2),
(410883, 410800, '', '孟州市', 2),
(410900, 410000, '', '濮阳市', 1),
(410901, 410900, '', '市辖区', 2),
(410902, 410900, '', '华龙区', 2),
(410922, 410900, '', '清丰县', 2),
(410923, 410900, '', '南乐县', 2),
(410926, 410900, '', '范县', 2),
(410927, 410900, '', '台前县', 2),
(410928, 410900, '', '濮阳县', 2),
(411000, 410000, '', '许昌市', 1),
(411001, 411000, '', '市辖区', 2),
(411002, 411000, '', '魏都区', 2),
(411023, 411000, '', '许昌县', 2),
(411024, 411000, '', '鄢陵县', 2),
(411025, 411000, '', '襄城县', 2),
(411081, 411000, '', '禹州市', 2),
(411082, 411000, '', '长葛市', 2),
(411100, 410000, '', '漯河市', 1),
(411101, 411100, '', '市辖区', 2),
(411102, 411100, '', '源汇区', 2),
(411103, 411100, '', '郾城区', 2),
(411104, 411100, '', '召陵区', 2),
(411121, 411100, '', '舞阳县', 2),
(411122, 411100, '', '临颍县', 2),
(411200, 410000, '', '三门峡市', 1),
(411201, 411200, '', '市辖区', 2),
(411202, 411200, '', '湖滨区', 2),
(411221, 411200, '', '渑池县', 2),
(411222, 411200, '', '陕县', 2),
(411224, 411200, '', '卢氏县', 2),
(411281, 411200, '', '义马市', 2),
(411282, 411200, '', '灵宝市', 2),
(411300, 410000, '', '南阳市', 1),
(411301, 411300, '', '市辖区', 2),
(411302, 411300, '', '宛城区', 2),
(411303, 411300, '', '卧龙区', 2),
(411321, 411300, '', '南召县', 2),
(411322, 411300, '', '方城县', 2),
(411323, 411300, '', '西峡县', 2),
(411324, 411300, '', '镇平县', 2),
(411325, 411300, '', '内乡县', 2),
(411326, 411300, '', '淅川县', 2),
(411327, 411300, '', '社旗县', 2),
(411328, 411300, '', '唐河县', 2),
(411329, 411300, '', '新野县', 2),
(411330, 411300, '', '桐柏县', 2),
(411381, 411300, '', '邓州市', 2),
(411400, 410000, '', '商丘市', 1),
(411401, 411400, '', '市辖区', 2),
(411402, 411400, '', '梁园区', 2),
(411403, 411400, '', '睢阳区', 2),
(411421, 411400, '', '民权县', 2),
(411422, 411400, '', '睢县', 2),
(411423, 411400, '', '宁陵县', 2),
(411424, 411400, '', '柘城县', 2),
(411425, 411400, '', '虞城县', 2),
(411426, 411400, '', '夏邑县', 2),
(411481, 411400, '', '永城市', 2),
(411500, 410000, '', '信阳市', 1),
(411501, 411500, '', '市辖区', 2),
(411502, 411500, '', '浉河区', 2),
(411503, 411500, '', '平桥区', 2),
(411521, 411500, '', '罗山县', 2),
(411522, 411500, '', '光山县', 2),
(411523, 411500, '', '新县', 2),
(411524, 411500, '', '商城县', 2),
(411525, 411500, '', '固始县', 2),
(411526, 411500, '', '潢川县', 2),
(411527, 411500, '', '淮滨县', 2),
(411528, 411500, '', '息县', 2),
(411600, 410000, '', '周口市', 1),
(411601, 411600, '', '市辖区', 2),
(411602, 411600, '', '川汇区', 2),
(411621, 411600, '', '扶沟县', 2),
(411622, 411600, '', '西华县', 2),
(411623, 411600, '', '商水县', 2),
(411624, 411600, '', '沈丘县', 2),
(411625, 411600, '', '郸城县', 2),
(411626, 411600, '', '淮阳县', 2),
(411627, 411600, '', '太康县', 2),
(411628, 411600, '', '鹿邑县', 2),
(411681, 411600, '', '项城市', 2),
(411700, 410000, '', '驻马店市', 1),
(411701, 411700, '', '市辖区', 2),
(411702, 411700, '', '驿城区', 2),
(411721, 411700, '', '西平县', 2),
(411722, 411700, '', '上蔡县', 2),
(411723, 411700, '', '平舆县', 2),
(411724, 411700, '', '正阳县', 2),
(411725, 411700, '', '确山县', 2),
(411726, 411700, '', '泌阳县', 2),
(411727, 411700, '', '汝南县', 2),
(411728, 411700, '', '遂平县', 2),
(411729, 411700, '', '新蔡县', 2),
(419000, 410000, '', '省直辖县级行政区划', 1),
(419001, 419000, '', '济源市', 2),
(420000, 0, '', '湖北省', 0),
(420100, 420000, '', '武汉市', 1),
(420101, 420100, '', '市辖区', 2),
(420102, 420100, '', '江岸区', 2),
(420103, 420100, '', '江汉区', 2),
(420104, 420100, '', '硚口区', 2),
(420105, 420100, '', '汉阳区', 2),
(420106, 420100, '', '武昌区', 2),
(420107, 420100, '', '青山区', 2),
(420111, 420100, '', '洪山区', 2),
(420112, 420100, '', '东西湖区', 2),
(420113, 420100, '', '汉南区', 2),
(420114, 420100, '', '蔡甸区', 2),
(420115, 420100, '', '江夏区', 2),
(420116, 420100, '', '黄陂区', 2),
(420117, 420100, '', '新洲区', 2),
(420200, 420000, '', '黄石市', 1),
(420201, 420200, '', '市辖区', 2),
(420202, 420200, '', '黄石港区', 2),
(420203, 420200, '', '西塞山区', 2),
(420204, 420200, '', '下陆区', 2),
(420205, 420200, '', '铁山区', 2),
(420222, 420200, '', '阳新县', 2),
(420281, 420200, '', '大冶市', 2),
(420300, 420000, '', '十堰市', 1),
(420301, 420300, '', '市辖区', 2),
(420302, 420300, '', '茅箭区', 2),
(420303, 420300, '', '张湾区', 2),
(420304, 420300, '', '郧阳区', 2),
(420322, 420300, '', '郧西县', 2),
(420323, 420300, '', '竹山县', 2),
(420324, 420300, '', '竹溪县', 2),
(420325, 420300, '', '房县', 2),
(420381, 420300, '', '丹江口市', 2),
(420500, 420000, '', '宜昌市', 1),
(420501, 420500, '', '市辖区', 2),
(420502, 420500, '', '西陵区', 2),
(420503, 420500, '', '伍家岗区', 2),
(420504, 420500, '', '点军区', 2),
(420505, 420500, '', '猇亭区', 2),
(420506, 420500, '', '夷陵区', 2),
(420525, 420500, '', '远安县', 2),
(420526, 420500, '', '兴山县', 2),
(420527, 420500, '', '秭归县', 2),
(420528, 420500, '', '长阳土家族自治县', 2),
(420529, 420500, '', '五峰土家族自治县', 2),
(420581, 420500, '', '宜都市', 2),
(420582, 420500, '', '当阳市', 2),
(420583, 420500, '', '枝江市', 2),
(420600, 420000, '', '襄阳市', 1),
(420601, 420600, '', '市辖区', 2),
(420602, 420600, '', '襄城区', 2),
(420606, 420600, '', '樊城区', 2),
(420607, 420600, '', '襄州区', 2),
(420624, 420600, '', '南漳县', 2),
(420625, 420600, '', '谷城县', 2),
(420626, 420600, '', '保康县', 2),
(420682, 420600, '', '老河口市', 2),
(420683, 420600, '', '枣阳市', 2),
(420684, 420600, '', '宜城市', 2),
(420700, 420000, '', '鄂州市', 1),
(420701, 420700, '', '市辖区', 2),
(420702, 420700, '', '梁子湖区', 2),
(420703, 420700, '', '华容区', 2),
(420704, 420700, '', '鄂城区', 2),
(420800, 420000, '', '荆门市', 1),
(420801, 420800, '', '市辖区', 2),
(420802, 420800, '', '东宝区', 2),
(420804, 420800, '', '掇刀区', 2),
(420821, 420800, '', '京山县', 2),
(420822, 420800, '', '沙洋县', 2),
(420881, 420800, '', '钟祥市', 2),
(420900, 420000, '', '孝感市', 1),
(420901, 420900, '', '市辖区', 2),
(420902, 420900, '', '孝南区', 2),
(420921, 420900, '', '孝昌县', 2),
(420922, 420900, '', '大悟县', 2),
(420923, 420900, '', '云梦县', 2),
(420981, 420900, '', '应城市', 2),
(420982, 420900, '', '安陆市', 2),
(420984, 420900, '', '汉川市', 2),
(421000, 420000, '', '荆州市', 1),
(421001, 421000, '', '市辖区', 2),
(421002, 421000, '', '沙市区', 2),
(421003, 421000, '', '荆州区', 2),
(421022, 421000, '', '公安县', 2),
(421023, 421000, '', '监利县', 2),
(421024, 421000, '', '江陵县', 2),
(421081, 421000, '', '石首市', 2),
(421083, 421000, '', '洪湖市', 2),
(421087, 421000, '', '松滋市', 2),
(421100, 420000, '', '黄冈市', 1),
(421101, 421100, '', '市辖区', 2),
(421102, 421100, '', '黄州区', 2),
(421121, 421100, '', '团风县', 2),
(421122, 421100, '', '红安县', 2),
(421123, 421100, '', '罗田县', 2),
(421124, 421100, '', '英山县', 2),
(421125, 421100, '', '浠水县', 2),
(421126, 421100, '', '蕲春县', 2),
(421127, 421100, '', '黄梅县', 2),
(421181, 421100, '', '麻城市', 2),
(421182, 421100, '', '武穴市', 2),
(421200, 420000, '', '咸宁市', 1),
(421201, 421200, '', '市辖区', 2),
(421202, 421200, '', '咸安区', 2),
(421221, 421200, '', '嘉鱼县', 2),
(421222, 421200, '', '通城县', 2),
(421223, 421200, '', '崇阳县', 2),
(421224, 421200, '', '通山县', 2),
(421281, 421200, '', '赤壁市', 2),
(421300, 420000, '', '随州市', 1),
(421301, 421300, '', '市辖区', 2),
(421303, 421300, '', '曾都区', 2),
(421321, 421300, '', '随县', 2),
(421381, 421300, '', '广水市', 2),
(422800, 420000, '', '恩施土家族苗族自治州', 1),
(422801, 422800, '', '恩施市', 2),
(422802, 422800, '', '利川市', 2),
(422822, 422800, '', '建始县', 2),
(422823, 422800, '', '巴东县', 2),
(422825, 422800, '', '宣恩县', 2),
(422826, 422800, '', '咸丰县', 2),
(422827, 422800, '', '来凤县', 2),
(422828, 422800, '', '鹤峰县', 2),
(429000, 420000, '', '省直辖县级行政区划', 1),
(429004, 429000, '', '仙桃市', 2),
(429005, 429000, '', '潜江市', 2),
(429006, 429000, '', '天门市', 2),
(429021, 429000, '', '神农架林区', 2),
(430000, 0, '', '湖南省', 0),
(430100, 430000, '', '长沙市', 1),
(430101, 430100, '', '市辖区', 2),
(430102, 430100, '', '芙蓉区', 2),
(430103, 430100, '', '天心区', 2),
(430104, 430100, '', '岳麓区', 2),
(430105, 430100, '', '开福区', 2),
(430111, 430100, '', '雨花区', 2),
(430112, 430100, '', '望城区', 2),
(430121, 430100, '', '长沙县', 2),
(430124, 430100, '', '宁乡县', 2),
(430181, 430100, '', '浏阳市', 2),
(430200, 430000, '', '株洲市', 1),
(430201, 430200, '', '市辖区', 2),
(430202, 430200, '', '荷塘区', 2),
(430203, 430200, '', '芦淞区', 2),
(430204, 430200, '', '石峰区', 2),
(430211, 430200, '', '天元区', 2),
(430221, 430200, '', '株洲县', 2),
(430223, 430200, '', '攸县', 2),
(430224, 430200, '', '茶陵县', 2),
(430225, 430200, '', '炎陵县', 2),
(430281, 430200, '', '醴陵市', 2),
(430300, 430000, '', '湘潭市', 1),
(430301, 430300, '', '市辖区', 2),
(430302, 430300, '', '雨湖区', 2),
(430304, 430300, '', '岳塘区', 2),
(430321, 430300, '', '湘潭县', 2),
(430381, 430300, '', '湘乡市', 2),
(430382, 430300, '', '韶山市', 2),
(430400, 430000, '', '衡阳市', 1),
(430401, 430400, '', '市辖区', 2),
(430405, 430400, '', '珠晖区', 2),
(430406, 430400, '', '雁峰区', 2),
(430407, 430400, '', '石鼓区', 2),
(430408, 430400, '', '蒸湘区', 2),
(430412, 430400, '', '南岳区', 2),
(430421, 430400, '', '衡阳县', 2),
(430422, 430400, '', '衡南县', 2),
(430423, 430400, '', '衡山县', 2),
(430424, 430400, '', '衡东县', 2),
(430426, 430400, '', '祁东县', 2),
(430481, 430400, '', '耒阳市', 2),
(430482, 430400, '', '常宁市', 2),
(430500, 430000, '', '邵阳市', 1),
(430501, 430500, '', '市辖区', 2),
(430502, 430500, '', '双清区', 2),
(430503, 430500, '', '大祥区', 2),
(430511, 430500, '', '北塔区', 2),
(430521, 430500, '', '邵东县', 2),
(430522, 430500, '', '新邵县', 2),
(430523, 430500, '', '邵阳县', 2),
(430524, 430500, '', '隆回县', 2),
(430525, 430500, '', '洞口县', 2),
(430527, 430500, '', '绥宁县', 2),
(430528, 430500, '', '新宁县', 2),
(430529, 430500, '', '城步苗族自治县', 2),
(430581, 430500, '', '武冈市', 2),
(430600, 430000, '', '岳阳市', 1),
(430601, 430600, '', '市辖区', 2),
(430602, 430600, '', '岳阳楼区', 2),
(430603, 430600, '', '云溪区', 2),
(430611, 430600, '', '君山区', 2),
(430621, 430600, '', '岳阳县', 2),
(430623, 430600, '', '华容县', 2),
(430624, 430600, '', '湘阴县', 2),
(430626, 430600, '', '平江县', 2),
(430681, 430600, '', '汨罗市', 2),
(430682, 430600, '', '临湘市', 2),
(430700, 430000, '', '常德市', 1),
(430701, 430700, '', '市辖区', 2),
(430702, 430700, '', '武陵区', 2),
(430703, 430700, '', '鼎城区', 2),
(430721, 430700, '', '安乡县', 2),
(430722, 430700, '', '汉寿县', 2),
(430723, 430700, '', '澧县', 2),
(430724, 430700, '', '临澧县', 2),
(430725, 430700, '', '桃源县', 2),
(430726, 430700, '', '石门县', 2),
(430781, 430700, '', '津市市', 2),
(430800, 430000, '', '张家界市', 1),
(430801, 430800, '', '市辖区', 2),
(430802, 430800, '', '永定区', 2),
(430811, 430800, '', '武陵源区', 2),
(430821, 430800, '', '慈利县', 2),
(430822, 430800, '', '桑植县', 2),
(430900, 430000, '', '益阳市', 1),
(430901, 430900, '', '市辖区', 2),
(430902, 430900, '', '资阳区', 2),
(430903, 430900, '', '赫山区', 2),
(430921, 430900, '', '南县', 2),
(430922, 430900, '', '桃江县', 2),
(430923, 430900, '', '安化县', 2),
(430981, 430900, '', '沅江市', 2),
(431000, 430000, '', '郴州市', 1),
(431001, 431000, '', '市辖区', 2),
(431002, 431000, '', '北湖区', 2),
(431003, 431000, '', '苏仙区', 2),
(431021, 431000, '', '桂阳县', 2),
(431022, 431000, '', '宜章县', 2),
(431023, 431000, '', '永兴县', 2),
(431024, 431000, '', '嘉禾县', 2),
(431025, 431000, '', '临武县', 2),
(431026, 431000, '', '汝城县', 2),
(431027, 431000, '', '桂东县', 2),
(431028, 431000, '', '安仁县', 2),
(431081, 431000, '', '资兴市', 2),
(431100, 430000, '', '永州市', 1),
(431101, 431100, '', '市辖区', 2),
(431102, 431100, '', '零陵区', 2),
(431103, 431100, '', '冷水滩区', 2),
(431121, 431100, '', '祁阳县', 2),
(431122, 431100, '', '东安县', 2),
(431123, 431100, '', '双牌县', 2),
(431124, 431100, '', '道县', 2),
(431125, 431100, '', '江永县', 2),
(431126, 431100, '', '宁远县', 2),
(431127, 431100, '', '蓝山县', 2),
(431128, 431100, '', '新田县', 2),
(431129, 431100, '', '江华瑶族自治县', 2),
(431200, 430000, '', '怀化市', 1),
(431201, 431200, '', '市辖区', 2),
(431202, 431200, '', '鹤城区', 2),
(431221, 431200, '', '中方县', 2),
(431222, 431200, '', '沅陵县', 2),
(431223, 431200, '', '辰溪县', 2),
(431224, 431200, '', '溆浦县', 2),
(431225, 431200, '', '会同县', 2),
(431226, 431200, '', '麻阳苗族自治县', 2),
(431227, 431200, '', '新晃侗族自治县', 2),
(431228, 431200, '', '芷江侗族自治县', 2),
(431229, 431200, '', '靖州苗族侗族自治县', 2),
(431230, 431200, '', '通道侗族自治县', 2),
(431281, 431200, '', '洪江市', 2),
(431300, 430000, '', '娄底市', 1),
(431301, 431300, '', '市辖区', 2),
(431302, 431300, '', '娄星区', 2),
(431321, 431300, '', '双峰县', 2),
(431322, 431300, '', '新化县', 2),
(431381, 431300, '', '冷水江市', 2),
(431382, 431300, '', '涟源市', 2),
(433100, 430000, '', '湘西土家族苗族自治州', 1),
(433101, 433100, '', '吉首市', 2),
(433122, 433100, '', '泸溪县', 2),
(433123, 433100, '', '凤凰县', 2),
(433124, 433100, '', '花垣县', 2),
(433125, 433100, '', '保靖县', 2),
(433126, 433100, '', '古丈县', 2),
(433127, 433100, '', '永顺县', 2),
(433130, 433100, '', '龙山县', 2),
(440000, 0, '', '广东省', 0),
(440100, 440000, '', '广州市', 1),
(440101, 440100, '', '市辖区', 2),
(440103, 440100, '', '荔湾区', 2),
(440104, 440100, '', '越秀区', 2),
(440105, 440100, '', '海珠区', 2),
(440106, 440100, '', '天河区', 2),
(440111, 440100, '', '白云区', 2),
(440112, 440100, '', '黄埔区', 2),
(440113, 440100, '', '番禺区', 2),
(440114, 440100, '', '花都区', 2),
(440115, 440100, '', '南沙区', 2),
(440116, 440100, '', '萝岗区', 2),
(440117, 440100, '', '从化区', 2),
(440118, 440100, '', '增城区', 2),
(440200, 440000, '', '韶关市', 1),
(440201, 440200, '', '市辖区', 2),
(440203, 440200, '', '武江区', 2),
(440204, 440200, '', '浈江区', 2),
(440205, 440200, '', '曲江区', 2),
(440222, 440200, '', '始兴县', 2),
(440224, 440200, '', '仁化县', 2),
(440229, 440200, '', '翁源县', 2),
(440232, 440200, '', '乳源瑶族自治县', 2),
(440233, 440200, '', '新丰县', 2),
(440281, 440200, '', '乐昌市', 2),
(440282, 440200, '', '南雄市', 2),
(440300, 440000, '', '深圳市', 1),
(440301, 440300, '', '市辖区', 2),
(440303, 440300, '', '罗湖区', 2),
(440304, 440300, '', '福田区', 2),
(440305, 440300, '', '南山区', 2),
(440306, 440300, '', '宝安区', 2),
(440307, 440300, '', '龙岗区', 2),
(440308, 440300, '', '盐田区', 2),
(440400, 440000, '', '珠海市', 1),
(440401, 440400, '', '市辖区', 2),
(440402, 440400, '', '香洲区', 2),
(440403, 440400, '', '斗门区', 2),
(440404, 440400, '', '金湾区', 2),
(440500, 440000, '', '汕头市', 1),
(440501, 440500, '', '市辖区', 2),
(440507, 440500, '', '龙湖区', 2),
(440511, 440500, '', '金平区', 2),
(440512, 440500, '', '濠江区', 2),
(440513, 440500, '', '潮阳区', 2),
(440514, 440500, '', '潮南区', 2),
(440515, 440500, '', '澄海区', 2),
(440523, 440500, '', '南澳县', 2),
(440600, 440000, '', '佛山市', 1),
(440601, 440600, '', '市辖区', 2),
(440604, 440600, '', '禅城区', 2),
(440605, 440600, '', '南海区', 2),
(440606, 440600, '', '顺德区', 2),
(440607, 440600, '', '三水区', 2),
(440608, 440600, '', '高明区', 2),
(440700, 440000, '', '江门市', 1),
(440701, 440700, '', '市辖区', 2),
(440703, 440700, '', '蓬江区', 2),
(440704, 440700, '', '江海区', 2),
(440705, 440700, '', '新会区', 2),
(440781, 440700, '', '台山市', 2),
(440783, 440700, '', '开平市', 2),
(440784, 440700, '', '鹤山市', 2),
(440785, 440700, '', '恩平市', 2),
(440800, 440000, '', '湛江市', 1),
(440801, 440800, '', '市辖区', 2),
(440802, 440800, '', '赤坎区', 2),
(440803, 440800, '', '霞山区', 2),
(440804, 440800, '', '坡头区', 2),
(440811, 440800, '', '麻章区', 2),
(440823, 440800, '', '遂溪县', 2),
(440825, 440800, '', '徐闻县', 2),
(440881, 440800, '', '廉江市', 2),
(440882, 440800, '', '雷州市', 2),
(440883, 440800, '', '吴川市', 2),
(440900, 440000, '', '茂名市', 1),
(440901, 440900, '', '市辖区', 2),
(440902, 440900, '', '茂南区', 2),
(440904, 440900, '', '电白区', 2),
(440981, 440900, '', '高州市', 2),
(440982, 440900, '', '化州市', 2),
(440983, 440900, '', '信宜市', 2),
(441200, 440000, '', '肇庆市', 1),
(441201, 441200, '', '市辖区', 2),
(441202, 441200, '', '端州区', 2),
(441203, 441200, '', '鼎湖区', 2),
(441223, 441200, '', '广宁县', 2),
(441224, 441200, '', '怀集县', 2),
(441225, 441200, '', '封开县', 2),
(441226, 441200, '', '德庆县', 2),
(441283, 441200, '', '高要市', 2),
(441284, 441200, '', '四会市', 2),
(441300, 440000, '', '惠州市', 1),
(441301, 441300, '', '市辖区', 2),
(441302, 441300, '', '惠城区', 2),
(441303, 441300, '', '惠阳区', 2),
(441322, 441300, '', '博罗县', 2),
(441323, 441300, '', '惠东县', 2),
(441324, 441300, '', '龙门县', 2),
(441400, 440000, '', '梅州市', 1),
(441401, 441400, '', '市辖区', 2),
(441402, 441400, '', '梅江区', 2),
(441403, 441400, '', '梅县区', 2),
(441422, 441400, '', '大埔县', 2),
(441423, 441400, '', '丰顺县', 2),
(441424, 441400, '', '五华县', 2),
(441426, 441400, '', '平远县', 2),
(441427, 441400, '', '蕉岭县', 2),
(441481, 441400, '', '兴宁市', 2),
(441500, 440000, '', '汕尾市', 1),
(441501, 441500, '', '市辖区', 2),
(441502, 441500, '', '城区', 2),
(441521, 441500, '', '海丰县', 2),
(441523, 441500, '', '陆河县', 2),
(441581, 441500, '', '陆丰市', 2),
(441600, 440000, '', '河源市', 1),
(441601, 441600, '', '市辖区', 2),
(441602, 441600, '', '源城区', 2),
(441621, 441600, '', '紫金县', 2),
(441622, 441600, '', '龙川县', 2),
(441623, 441600, '', '连平县', 2),
(441624, 441600, '', '和平县', 2),
(441625, 441600, '', '东源县', 2),
(441700, 440000, '', '阳江市', 1),
(441701, 441700, '', '市辖区', 2),
(441702, 441700, '', '江城区', 2),
(441721, 441700, '', '阳西县', 2),
(441723, 441700, '', '阳东县', 2),
(441781, 441700, '', '阳春市', 2),
(441800, 440000, '', '清远市', 1),
(441801, 441800, '', '市辖区', 2),
(441802, 441800, '', '清城区', 2),
(441803, 441800, '', '清新区', 2),
(441821, 441800, '', '佛冈县', 2),
(441823, 441800, '', '阳山县', 2),
(441825, 441800, '', '连山壮族瑶族自治县', 2),
(441826, 441800, '', '连南瑶族自治县', 2),
(441881, 441800, '', '英德市', 2),
(441882, 441800, '', '连州市', 2),
(441900, 440000, '', '东莞市', 1),
(442000, 440000, '', '中山市', 1),
(445100, 440000, '', '潮州市', 1),
(445101, 445100, '', '市辖区', 2),
(445102, 445100, '', '湘桥区', 2),
(445103, 445100, '', '潮安区', 2),
(445122, 445100, '', '饶平县', 2),
(445200, 440000, '', '揭阳市', 1),
(445201, 445200, '', '市辖区', 2),
(445202, 445200, '', '榕城区', 2),
(445203, 445200, '', '揭东区', 2),
(445222, 445200, '', '揭西县', 2),
(445224, 445200, '', '惠来县', 2),
(445281, 445200, '', '普宁市', 2),
(445300, 440000, '', '云浮市', 1),
(445301, 445300, '', '市辖区', 2),
(445302, 445300, '', '云城区', 2),
(445303, 445300, '', '云安区', 2),
(445321, 445300, '', '新兴县', 2),
(445322, 445300, '', '郁南县', 2),
(445381, 445300, '', '罗定市', 2),
(450000, 0, '', '广西壮族自治区', 0),
(450100, 450000, '', '南宁市', 1),
(450101, 450100, '', '市辖区', 2),
(450102, 450100, '', '兴宁区', 2),
(450103, 450100, '', '青秀区', 2),
(450105, 450100, '', '江南区', 2),
(450107, 450100, '', '西乡塘区', 2),
(450108, 450100, '', '良庆区', 2),
(450109, 450100, '', '邕宁区', 2),
(450122, 450100, '', '武鸣县', 2),
(450123, 450100, '', '隆安县', 2),
(450124, 450100, '', '马山县', 2),
(450125, 450100, '', '上林县', 2),
(450126, 450100, '', '宾阳县', 2),
(450127, 450100, '', '横县', 2),
(450200, 450000, '', '柳州市', 1),
(450201, 450200, '', '市辖区', 2),
(450202, 450200, '', '城中区', 2),
(450203, 450200, '', '鱼峰区', 2),
(450204, 450200, '', '柳南区', 2),
(450205, 450200, '', '柳北区', 2),
(450221, 450200, '', '柳江县', 2),
(450222, 450200, '', '柳城县', 2),
(450223, 450200, '', '鹿寨县', 2),
(450224, 450200, '', '融安县', 2),
(450225, 450200, '', '融水苗族自治县', 2),
(450226, 450200, '', '三江侗族自治县', 2),
(450300, 450000, '', '桂林市', 1),
(450301, 450300, '', '市辖区', 2),
(450302, 450300, '', '秀峰区', 2),
(450303, 450300, '', '叠彩区', 2),
(450304, 450300, '', '象山区', 2),
(450305, 450300, '', '七星区', 2),
(450311, 450300, '', '雁山区', 2),
(450312, 450300, '', '临桂区', 2),
(450321, 450300, '', '阳朔县', 2),
(450323, 450300, '', '灵川县', 2),
(450324, 450300, '', '全州县', 2),
(450325, 450300, '', '兴安县', 2),
(450326, 450300, '', '永福县', 2),
(450327, 450300, '', '灌阳县', 2),
(450328, 450300, '', '龙胜各族自治县', 2),
(450329, 450300, '', '资源县', 2),
(450330, 450300, '', '平乐县', 2),
(450331, 450300, '', '荔浦县', 2),
(450332, 450300, '', '恭城瑶族自治县', 2),
(450400, 450000, '', '梧州市', 1),
(450401, 450400, '', '市辖区', 2),
(450403, 450400, '', '万秀区', 2),
(450405, 450400, '', '长洲区', 2),
(450406, 450400, '', '龙圩区', 2),
(450421, 450400, '', '苍梧县', 2),
(450422, 450400, '', '藤县', 2),
(450423, 450400, '', '蒙山县', 2),
(450481, 450400, '', '岑溪市', 2),
(450500, 450000, '', '北海市', 1),
(450501, 450500, '', '市辖区', 2),
(450502, 450500, '', '海城区', 2),
(450503, 450500, '', '银海区', 2),
(450512, 450500, '', '铁山港区', 2),
(450521, 450500, '', '合浦县', 2),
(450600, 450000, '', '防城港市', 1),
(450601, 450600, '', '市辖区', 2),
(450602, 450600, '', '港口区', 2),
(450603, 450600, '', '防城区', 2),
(450621, 450600, '', '上思县', 2),
(450681, 450600, '', '东兴市', 2),
(450700, 450000, '', '钦州市', 1),
(450701, 450700, '', '市辖区', 2),
(450702, 450700, '', '钦南区', 2),
(450703, 450700, '', '钦北区', 2),
(450721, 450700, '', '灵山县', 2),
(450722, 450700, '', '浦北县', 2),
(450800, 450000, '', '贵港市', 1),
(450801, 450800, '', '市辖区', 2),
(450802, 450800, '', '港北区', 2),
(450803, 450800, '', '港南区', 2),
(450804, 450800, '', '覃塘区', 2),
(450821, 450800, '', '平南县', 2),
(450881, 450800, '', '桂平市', 2),
(450900, 450000, '', '玉林市', 1),
(450901, 450900, '', '市辖区', 2),
(450902, 450900, '', '玉州区', 2),
(450903, 450900, '', '福绵区', 2),
(450921, 450900, '', '容县', 2),
(450922, 450900, '', '陆川县', 2),
(450923, 450900, '', '博白县', 2),
(450924, 450900, '', '兴业县', 2),
(450981, 450900, '', '北流市', 2),
(451000, 450000, '', '百色市', 1),
(451001, 451000, '', '市辖区', 2),
(451002, 451000, '', '右江区', 2),
(451021, 451000, '', '田阳县', 2),
(451022, 451000, '', '田东县', 2),
(451023, 451000, '', '平果县', 2),
(451024, 451000, '', '德保县', 2),
(451025, 451000, '', '靖西县', 2),
(451026, 451000, '', '那坡县', 2),
(451027, 451000, '', '凌云县', 2),
(451028, 451000, '', '乐业县', 2),
(451029, 451000, '', '田林县', 2),
(451030, 451000, '', '西林县', 2),
(451031, 451000, '', '隆林各族自治县', 2),
(451100, 450000, '', '贺州市', 1),
(451101, 451100, '', '市辖区', 2),
(451102, 451100, '', '八步区', 2),
(451121, 451100, '', '昭平县', 2),
(451122, 451100, '', '钟山县', 2),
(451123, 451100, '', '富川瑶族自治县', 2),
(451200, 450000, '', '河池市', 1),
(451201, 451200, '', '市辖区', 2),
(451202, 451200, '', '金城江区', 2),
(451221, 451200, '', '南丹县', 2),
(451222, 451200, '', '天峨县', 2),
(451223, 451200, '', '凤山县', 2),
(451224, 451200, '', '东兰县', 2),
(451225, 451200, '', '罗城仫佬族自治县', 2),
(451226, 451200, '', '环江毛南族自治县', 2),
(451227, 451200, '', '巴马瑶族自治县', 2),
(451228, 451200, '', '都安瑶族自治县', 2),
(451229, 451200, '', '大化瑶族自治县', 2),
(451281, 451200, '', '宜州市', 2),
(451300, 450000, '', '来宾市', 1),
(451301, 451300, '', '市辖区', 2),
(451302, 451300, '', '兴宾区', 2),
(451321, 451300, '', '忻城县', 2),
(451322, 451300, '', '象州县', 2),
(451323, 451300, '', '武宣县', 2),
(451324, 451300, '', '金秀瑶族自治县', 2),
(451381, 451300, '', '合山市', 2),
(451400, 450000, '', '崇左市', 1),
(451401, 451400, '', '市辖区', 2),
(451402, 451400, '', '江州区', 2),
(451421, 451400, '', '扶绥县', 2),
(451422, 451400, '', '宁明县', 2),
(451423, 451400, '', '龙州县', 2),
(451424, 451400, '', '大新县', 2),
(451425, 451400, '', '天等县', 2),
(451481, 451400, '', '凭祥市', 2),
(460000, 0, '', '海南省', 0),
(460100, 460000, '', '海口市', 1),
(460101, 460100, '', '市辖区', 2),
(460105, 460100, '', '秀英区', 2),
(460106, 460100, '', '龙华区', 2),
(460107, 460100, '', '琼山区', 2),
(460108, 460100, '', '美兰区', 2),
(460200, 460000, '', '三亚市', 1),
(460201, 460200, '', '市辖区', 2),
(460202, 460200, '', '海棠区', 2),
(460203, 460200, '', '吉阳区', 2),
(460204, 460200, '', '天涯区', 2),
(460205, 460200, '', '崖州区', 2),
(460300, 460000, '', '三沙市', 1),
(469000, 460000, '', '省直辖县级行政区划', 1),
(469001, 469000, '', '五指山市', 2),
(469002, 469000, '', '琼海市', 2),
(469003, 469000, '', '儋州市', 2),
(469005, 469000, '', '文昌市', 2),
(469006, 469000, '', '万宁市', 2),
(469007, 469000, '', '东方市', 2),
(469021, 469000, '', '定安县', 2),
(469022, 469000, '', '屯昌县', 2),
(469023, 469000, '', '澄迈县', 2),
(469024, 469000, '', '临高县', 2),
(469025, 469000, '', '白沙黎族自治县', 2),
(469026, 469000, '', '昌江黎族自治县', 2),
(469027, 469000, '', '乐东黎族自治县', 2),
(469028, 469000, '', '陵水黎族自治县', 2),
(469029, 469000, '', '保亭黎族苗族自治县', 2),
(469030, 469000, '', '琼中黎族苗族自治县', 2),
(500000, 0, '', '重庆市', 0),
(500100, 500000, '', '市辖区', 1),
(500101, 500100, '', '万州区', 2),
(500102, 500100, '', '涪陵区', 2),
(500103, 500100, '', '渝中区', 2),
(500104, 500100, '', '大渡口区', 2),
(500105, 500100, '', '江北区', 2),
(500106, 500100, '', '沙坪坝区', 2),
(500107, 500100, '', '九龙坡区', 2),
(500108, 500100, '', '南岸区', 2),
(500109, 500100, '', '北碚区', 2),
(500110, 500100, '', '綦江区', 2),
(500111, 500100, '', '大足区', 2),
(500112, 500100, '', '渝北区', 2),
(500113, 500100, '', '巴南区', 2),
(500114, 500100, '', '黔江区', 2),
(500115, 500100, '', '长寿区', 2),
(500116, 500100, '', '江津区', 2),
(500117, 500100, '', '合川区', 2),
(500118, 500100, '', '永川区', 2),
(500119, 500100, '', '南川区', 2),
(500120, 500100, '', '璧山区', 2),
(500151, 500100, '', '铜梁区', 2),
(500200, 500000, '', '县', 1),
(500223, 500200, '', '潼南县', 2),
(500226, 500200, '', '荣昌县', 2),
(500228, 500200, '', '梁平县', 2),
(500229, 500200, '', '城口县', 2),
(500230, 500200, '', '丰都县', 2),
(500231, 500200, '', '垫江县', 2),
(500232, 500200, '', '武隆县', 2),
(500233, 500200, '', '忠县', 2),
(500234, 500200, '', '开县', 2),
(500235, 500200, '', '云阳县', 2),
(500236, 500200, '', '奉节县', 2),
(500237, 500200, '', '巫山县', 2),
(500238, 500200, '', '巫溪县', 2),
(500240, 500200, '', '石柱土家族自治县', 2),
(500241, 500200, '', '秀山土家族苗族自治县', 2),
(500242, 500200, '', '酉阳土家族苗族自治县', 2),
(500243, 500200, '', '彭水苗族土家族自治县', 2),
(510000, 0, '', '四川省', 0),
(510100, 510000, '', '成都市', 1),
(510101, 510100, '', '市辖区', 2),
(510104, 510100, '', '锦江区', 2),
(510105, 510100, '', '青羊区', 2),
(510106, 510100, '', '金牛区', 2),
(510107, 510100, '', '武侯区', 2),
(510108, 510100, '', '成华区', 2),
(510112, 510100, '', '龙泉驿区', 2),
(510113, 510100, '', '青白江区', 2),
(510114, 510100, '', '新都区', 2),
(510115, 510100, '', '温江区', 2),
(510121, 510100, '', '金堂县', 2),
(510122, 510100, '', '双流县', 2),
(510124, 510100, '', '郫县', 2),
(510129, 510100, '', '大邑县', 2),
(510131, 510100, '', '蒲江县', 2),
(510132, 510100, '', '新津县', 2),
(510181, 510100, '', '都江堰市', 2),
(510182, 510100, '', '彭州市', 2),
(510183, 510100, '', '邛崃市', 2),
(510184, 510100, '', '崇州市', 2),
(510300, 510000, '', '自贡市', 1),
(510301, 510300, '', '市辖区', 2),
(510302, 510300, '', '自流井区', 2),
(510303, 510300, '', '贡井区', 2),
(510304, 510300, '', '大安区', 2),
(510311, 510300, '', '沿滩区', 2),
(510321, 510300, '', '荣县', 2),
(510322, 510300, '', '富顺县', 2),
(510400, 510000, '', '攀枝花市', 1),
(510401, 510400, '', '市辖区', 2),
(510402, 510400, '', '东区', 2),
(510403, 510400, '', '西区', 2),
(510411, 510400, '', '仁和区', 2),
(510421, 510400, '', '米易县', 2),
(510422, 510400, '', '盐边县', 2),
(510500, 510000, '', '泸州市', 1),
(510501, 510500, '', '市辖区', 2),
(510502, 510500, '', '江阳区', 2),
(510503, 510500, '', '纳溪区', 2),
(510504, 510500, '', '龙马潭区', 2),
(510521, 510500, '', '泸县', 2),
(510522, 510500, '', '合江县', 2),
(510524, 510500, '', '叙永县', 2),
(510525, 510500, '', '古蔺县', 2),
(510600, 510000, '', '德阳市', 1),
(510601, 510600, '', '市辖区', 2),
(510603, 510600, '', '旌阳区', 2),
(510623, 510600, '', '中江县', 2),
(510626, 510600, '', '罗江县', 2),
(510681, 510600, '', '广汉市', 2),
(510682, 510600, '', '什邡市', 2),
(510683, 510600, '', '绵竹市', 2),
(510700, 510000, '', '绵阳市', 1),
(510701, 510700, '', '市辖区', 2),
(510703, 510700, '', '涪城区', 2),
(510704, 510700, '', '游仙区', 2),
(510722, 510700, '', '三台县', 2),
(510723, 510700, '', '盐亭县', 2),
(510724, 510700, '', '安县', 2),
(510725, 510700, '', '梓潼县', 2),
(510726, 510700, '', '北川羌族自治县', 2),
(510727, 510700, '', '平武县', 2),
(510781, 510700, '', '江油市', 2),
(510800, 510000, '', '广元市', 1),
(510801, 510800, '', '市辖区', 2),
(510802, 510800, '', '利州区', 2),
(510811, 510800, '', '昭化区', 2),
(510812, 510800, '', '朝天区', 2),
(510821, 510800, '', '旺苍县', 2),
(510822, 510800, '', '青川县', 2),
(510823, 510800, '', '剑阁县', 2),
(510824, 510800, '', '苍溪县', 2),
(510900, 510000, '', '遂宁市', 1),
(510901, 510900, '', '市辖区', 2),
(510903, 510900, '', '船山区', 2),
(510904, 510900, '', '安居区', 2),
(510921, 510900, '', '蓬溪县', 2),
(510922, 510900, '', '射洪县', 2),
(510923, 510900, '', '大英县', 2),
(511000, 510000, '', '内江市', 1),
(511001, 511000, '', '市辖区', 2),
(511002, 511000, '', '市中区', 2),
(511011, 511000, '', '东兴区', 2),
(511024, 511000, '', '威远县', 2),
(511025, 511000, '', '资中县', 2),
(511028, 511000, '', '隆昌县', 2),
(511100, 510000, '', '乐山市', 1),
(511101, 511100, '', '市辖区', 2),
(511102, 511100, '', '市中区', 2),
(511111, 511100, '', '沙湾区', 2),
(511112, 511100, '', '五通桥区', 2),
(511113, 511100, '', '金口河区', 2),
(511123, 511100, '', '犍为县', 2),
(511124, 511100, '', '井研县', 2),
(511126, 511100, '', '夹江县', 2),
(511129, 511100, '', '沐川县', 2),
(511132, 511100, '', '峨边彝族自治县', 2),
(511133, 511100, '', '马边彝族自治县', 2),
(511181, 511100, '', '峨眉山市', 2),
(511300, 510000, '', '南充市', 1),
(511301, 511300, '', '市辖区', 2),
(511302, 511300, '', '顺庆区', 2),
(511303, 511300, '', '高坪区', 2),
(511304, 511300, '', '嘉陵区', 2),
(511321, 511300, '', '南部县', 2),
(511322, 511300, '', '营山县', 2),
(511323, 511300, '', '蓬安县', 2),
(511324, 511300, '', '仪陇县', 2),
(511325, 511300, '', '西充县', 2),
(511381, 511300, '', '阆中市', 2),
(511400, 510000, '', '眉山市', 1),
(511401, 511400, '', '市辖区', 2),
(511402, 511400, '', '东坡区', 2),
(511421, 511400, '', '仁寿县', 2),
(511422, 511400, '', '彭山县', 2),
(511423, 511400, '', '洪雅县', 2),
(511424, 511400, '', '丹棱县', 2),
(511425, 511400, '', '青神县', 2),
(511500, 510000, '', '宜宾市', 1),
(511501, 511500, '', '市辖区', 2),
(511502, 511500, '', '翠屏区', 2),
(511503, 511500, '', '南溪区', 2),
(511521, 511500, '', '宜宾县', 2),
(511523, 511500, '', '江安县', 2),
(511524, 511500, '', '长宁县', 2),
(511525, 511500, '', '高县', 2),
(511526, 511500, '', '珙县', 2),
(511527, 511500, '', '筠连县', 2),
(511528, 511500, '', '兴文县', 2),
(511529, 511500, '', '屏山县', 2),
(511600, 510000, '', '广安市', 1),
(511601, 511600, '', '市辖区', 2),
(511602, 511600, '', '广安区', 2),
(511603, 511600, '', '前锋区', 2),
(511621, 511600, '', '岳池县', 2),
(511622, 511600, '', '武胜县', 2),
(511623, 511600, '', '邻水县', 2),
(511681, 511600, '', '华蓥市', 2),
(511700, 510000, '', '达州市', 1),
(511701, 511700, '', '市辖区', 2),
(511702, 511700, '', '通川区', 2),
(511703, 511700, '', '达川区', 2),
(511722, 511700, '', '宣汉县', 2),
(511723, 511700, '', '开江县', 2),
(511724, 511700, '', '大竹县', 2),
(511725, 511700, '', '渠县', 2),
(511781, 511700, '', '万源市', 2),
(511800, 510000, '', '雅安市', 1),
(511801, 511800, '', '市辖区', 2),
(511802, 511800, '', '雨城区', 2),
(511803, 511800, '', '名山区', 2),
(511822, 511800, '', '荥经县', 2),
(511823, 511800, '', '汉源县', 2),
(511824, 511800, '', '石棉县', 2),
(511825, 511800, '', '天全县', 2),
(511826, 511800, '', '芦山县', 2),
(511827, 511800, '', '宝兴县', 2),
(511900, 510000, '', '巴中市', 1),
(511901, 511900, '', '市辖区', 2),
(511902, 511900, '', '巴州区', 2),
(511903, 511900, '', '恩阳区', 2),
(511921, 511900, '', '通江县', 2),
(511922, 511900, '', '南江县', 2),
(511923, 511900, '', '平昌县', 2),
(512000, 510000, '', '资阳市', 1),
(512001, 512000, '', '市辖区', 2),
(512002, 512000, '', '雁江区', 2),
(512021, 512000, '', '安岳县', 2),
(512022, 512000, '', '乐至县', 2),
(512081, 512000, '', '简阳市', 2),
(513200, 510000, '', '阿坝藏族羌族自治州', 1),
(513221, 513200, '', '汶川县', 2),
(513222, 513200, '', '理县', 2),
(513223, 513200, '', '茂县', 2),
(513224, 513200, '', '松潘县', 2),
(513225, 513200, '', '九寨沟县', 2),
(513226, 513200, '', '金川县', 2),
(513227, 513200, '', '小金县', 2),
(513228, 513200, '', '黑水县', 2),
(513229, 513200, '', '马尔康县', 2),
(513230, 513200, '', '壤塘县', 2),
(513231, 513200, '', '阿坝县', 2),
(513232, 513200, '', '若尔盖县', 2),
(513233, 513200, '', '红原县', 2),
(513300, 510000, '', '甘孜藏族自治州', 1),
(513321, 513300, '', '康定县', 2),
(513322, 513300, '', '泸定县', 2),
(513323, 513300, '', '丹巴县', 2),
(513324, 513300, '', '九龙县', 2),
(513325, 513300, '', '雅江县', 2),
(513326, 513300, '', '道孚县', 2),
(513327, 513300, '', '炉霍县', 2),
(513328, 513300, '', '甘孜县', 2),
(513329, 513300, '', '新龙县', 2),
(513330, 513300, '', '德格县', 2),
(513331, 513300, '', '白玉县', 2),
(513332, 513300, '', '石渠县', 2),
(513333, 513300, '', '色达县', 2),
(513334, 513300, '', '理塘县', 2),
(513335, 513300, '', '巴塘县', 2),
(513336, 513300, '', '乡城县', 2),
(513337, 513300, '', '稻城县', 2),
(513338, 513300, '', '得荣县', 2),
(513400, 510000, '', '凉山彝族自治州', 1),
(513401, 513400, '', '西昌市', 2),
(513422, 513400, '', '木里藏族自治县', 2),
(513423, 513400, '', '盐源县', 2),
(513424, 513400, '', '德昌县', 2),
(513425, 513400, '', '会理县', 2),
(513426, 513400, '', '会东县', 2),
(513427, 513400, '', '宁南县', 2),
(513428, 513400, '', '普格县', 2),
(513429, 513400, '', '布拖县', 2),
(513430, 513400, '', '金阳县', 2),
(513431, 513400, '', '昭觉县', 2),
(513432, 513400, '', '喜德县', 2),
(513433, 513400, '', '冕宁县', 2),
(513434, 513400, '', '越西县', 2),
(513435, 513400, '', '甘洛县', 2),
(513436, 513400, '', '美姑县', 2),
(513437, 513400, '', '雷波县', 2),
(520000, 0, '', '贵州省', 0),
(520100, 520000, '', '贵阳市', 1),
(520101, 520100, '', '市辖区', 2),
(520102, 520100, '', '南明区', 2),
(520103, 520100, '', '云岩区', 2),
(520111, 520100, '', '花溪区', 2),
(520112, 520100, '', '乌当区', 2),
(520113, 520100, '', '白云区', 2),
(520115, 520100, '', '观山湖区', 2),
(520121, 520100, '', '开阳县', 2),
(520122, 520100, '', '息烽县', 2),
(520123, 520100, '', '修文县', 2),
(520181, 520100, '', '清镇市', 2),
(520200, 520000, '', '六盘水市', 1),
(520201, 520200, '', '钟山区', 2),
(520203, 520200, '', '六枝特区', 2),
(520221, 520200, '', '水城县', 2),
(520222, 520200, '', '盘县', 2),
(520300, 520000, '', '遵义市', 1),
(520301, 520300, '', '市辖区', 2),
(520302, 520300, '', '红花岗区', 2),
(520303, 520300, '', '汇川区', 2),
(520321, 520300, '', '遵义县', 2),
(520322, 520300, '', '桐梓县', 2),
(520323, 520300, '', '绥阳县', 2),
(520324, 520300, '', '正安县', 2),
(520325, 520300, '', '道真仡佬族苗族自治县', 2),
(520326, 520300, '', '务川仡佬族苗族自治县', 2),
(520327, 520300, '', '凤冈县', 2),
(520328, 520300, '', '湄潭县', 2),
(520329, 520300, '', '余庆县', 2),
(520330, 520300, '', '习水县', 2),
(520381, 520300, '', '赤水市', 2),
(520382, 520300, '', '仁怀市', 2),
(520400, 520000, '', '安顺市', 1),
(520401, 520400, '', '市辖区', 2),
(520402, 520400, '', '西秀区', 2),
(520421, 520400, '', '平坝县', 2),
(520422, 520400, '', '普定县', 2),
(520423, 520400, '', '镇宁布依族苗族自治县', 2),
(520424, 520400, '', '关岭布依族苗族自治县', 2),
(520425, 520400, '', '紫云苗族布依族自治县', 2),
(520500, 520000, '', '毕节市', 1),
(520501, 520500, '', '市辖区', 2),
(520502, 520500, '', '七星关区', 2),
(520521, 520500, '', '大方县', 2),
(520522, 520500, '', '黔西县', 2),
(520523, 520500, '', '金沙县', 2),
(520524, 520500, '', '织金县', 2),
(520525, 520500, '', '纳雍县', 2),
(520526, 520500, '', '威宁彝族回族苗族自治县', 2),
(520527, 520500, '', '赫章县', 2),
(520600, 520000, '', '铜仁市', 1),
(520601, 520600, '', '市辖区', 2),
(520602, 520600, '', '碧江区', 2),
(520603, 520600, '', '万山区', 2),
(520621, 520600, '', '江口县', 2),
(520622, 520600, '', '玉屏侗族自治县', 2),
(520623, 520600, '', '石阡县', 2),
(520624, 520600, '', '思南县', 2),
(520625, 520600, '', '印江土家族苗族自治县', 2),
(520626, 520600, '', '德江县', 2),
(520627, 520600, '', '沿河土家族自治县', 2),
(520628, 520600, '', '松桃苗族自治县', 2),
(522300, 520000, '', '黔西南布依族苗族自治州', 1),
(522301, 522300, '', '兴义市', 2),
(522322, 522300, '', '兴仁县', 2),
(522323, 522300, '', '普安县', 2),
(522324, 522300, '', '晴隆县', 2),
(522325, 522300, '', '贞丰县', 2),
(522326, 522300, '', '望谟县', 2),
(522327, 522300, '', '册亨县', 2),
(522328, 522300, '', '安龙县', 2),
(522600, 520000, '', '黔东南苗族侗族自治州', 1),
(522601, 522600, '', '凯里市', 2),
(522622, 522600, '', '黄平县', 2),
(522623, 522600, '', '施秉县', 2),
(522624, 522600, '', '三穗县', 2),
(522625, 522600, '', '镇远县', 2),
(522626, 522600, '', '岑巩县', 2),
(522627, 522600, '', '天柱县', 2),
(522628, 522600, '', '锦屏县', 2),
(522629, 522600, '', '剑河县', 2),
(522630, 522600, '', '台江县', 2),
(522631, 522600, '', '黎平县', 2),
(522632, 522600, '', '榕江县', 2),
(522633, 522600, '', '从江县', 2),
(522634, 522600, '', '雷山县', 2),
(522635, 522600, '', '麻江县', 2),
(522636, 522600, '', '丹寨县', 2),
(522700, 520000, '', '黔南布依族苗族自治州', 1),
(522701, 522700, '', '都匀市', 2),
(522702, 522700, '', '福泉市', 2),
(522722, 522700, '', '荔波县', 2),
(522723, 522700, '', '贵定县', 2),
(522725, 522700, '', '瓮安县', 2),
(522726, 522700, '', '独山县', 2),
(522727, 522700, '', '平塘县', 2),
(522728, 522700, '', '罗甸县', 2),
(522729, 522700, '', '长顺县', 2),
(522730, 522700, '', '龙里县', 2),
(522731, 522700, '', '惠水县', 2),
(522732, 522700, '', '三都水族自治县', 2),
(530000, 0, '', '云南省', 0),
(530100, 530000, '', '昆明市', 1),
(530101, 530100, '', '市辖区', 2),
(530102, 530100, '', '五华区', 2),
(530103, 530100, '', '盘龙区', 2),
(530111, 530100, '', '官渡区', 2),
(530112, 530100, '', '西山区', 2),
(530113, 530100, '', '东川区', 2),
(530114, 530100, '', '呈贡区', 2),
(530122, 530100, '', '晋宁县', 2),
(530124, 530100, '', '富民县', 2),
(530125, 530100, '', '宜良县', 2),
(530126, 530100, '', '石林彝族自治县', 2),
(530127, 530100, '', '嵩明县', 2),
(530128, 530100, '', '禄劝彝族苗族自治县', 2),
(530129, 530100, '', '寻甸回族彝族自治县', 2),
(530181, 530100, '', '安宁市', 2),
(530300, 530000, '', '曲靖市', 1),
(530301, 530300, '', '市辖区', 2),
(530302, 530300, '', '麒麟区', 2),
(530321, 530300, '', '马龙县', 2),
(530322, 530300, '', '陆良县', 2),
(530323, 530300, '', '师宗县', 2),
(530324, 530300, '', '罗平县', 2),
(530325, 530300, '', '富源县', 2),
(530326, 530300, '', '会泽县', 2),
(530328, 530300, '', '沾益县', 2),
(530381, 530300, '', '宣威市', 2),
(530400, 530000, '', '玉溪市', 1),
(530401, 530400, '', '市辖区', 2),
(530402, 530400, '', '红塔区', 2),
(530421, 530400, '', '江川县', 2),
(530422, 530400, '', '澄江县', 2),
(530423, 530400, '', '通海县', 2),
(530424, 530400, '', '华宁县', 2),
(530425, 530400, '', '易门县', 2),
(530426, 530400, '', '峨山彝族自治县', 2),
(530427, 530400, '', '新平彝族傣族自治县', 2),
(530428, 530400, '', '元江哈尼族彝族傣族自治县', 2),
(530500, 530000, '', '保山市', 1),
(530501, 530500, '', '市辖区', 2),
(530502, 530500, '', '隆阳区', 2),
(530521, 530500, '', '施甸县', 2),
(530522, 530500, '', '腾冲县', 2),
(530523, 530500, '', '龙陵县', 2),
(530524, 530500, '', '昌宁县', 2),
(530600, 530000, '', '昭通市', 1),
(530601, 530600, '', '市辖区', 2),
(530602, 530600, '', '昭阳区', 2),
(530621, 530600, '', '鲁甸县', 2),
(530622, 530600, '', '巧家县', 2),
(530623, 530600, '', '盐津县', 2),
(530624, 530600, '', '大关县', 2),
(530625, 530600, '', '永善县', 2),
(530626, 530600, '', '绥江县', 2),
(530627, 530600, '', '镇雄县', 2),
(530628, 530600, '', '彝良县', 2),
(530629, 530600, '', '威信县', 2),
(530630, 530600, '', '水富县', 2),
(530700, 530000, '', '丽江市', 1),
(530701, 530700, '', '市辖区', 2),
(530702, 530700, '', '古城区', 2),
(530721, 530700, '', '玉龙纳西族自治县', 2),
(530722, 530700, '', '永胜县', 2),
(530723, 530700, '', '华坪县', 2),
(530724, 530700, '', '宁蒗彝族自治县', 2),
(530800, 530000, '', '普洱市', 1),
(530801, 530800, '', '市辖区', 2),
(530802, 530800, '', '思茅区', 2),
(530821, 530800, '', '宁洱哈尼族彝族自治县', 2),
(530822, 530800, '', '墨江哈尼族自治县', 2),
(530823, 530800, '', '景东彝族自治县', 2),
(530824, 530800, '', '景谷傣族彝族自治县', 2),
(530825, 530800, '', '镇沅彝族哈尼族拉祜族自治县', 2),
(530826, 530800, '', '江城哈尼族彝族自治县', 2),
(530827, 530800, '', '孟连傣族拉祜族佤族自治县', 2),
(530828, 530800, '', '澜沧拉祜族自治县', 2),
(530829, 530800, '', '西盟佤族自治县', 2),
(530900, 530000, '', '临沧市', 1),
(530901, 530900, '', '市辖区', 2),
(530902, 530900, '', '临翔区', 2),
(530921, 530900, '', '凤庆县', 2),
(530922, 530900, '', '云县', 2),
(530923, 530900, '', '永德县', 2),
(530924, 530900, '', '镇康县', 2),
(530925, 530900, '', '双江拉祜族佤族布朗族傣族自治县', 2),
(530926, 530900, '', '耿马傣族佤族自治县', 2),
(530927, 530900, '', '沧源佤族自治县', 2),
(532300, 530000, '', '楚雄彝族自治州', 1),
(532301, 532300, '', '楚雄市', 2),
(532322, 532300, '', '双柏县', 2),
(532323, 532300, '', '牟定县', 2),
(532324, 532300, '', '南华县', 2),
(532325, 532300, '', '姚安县', 2),
(532326, 532300, '', '大姚县', 2),
(532327, 532300, '', '永仁县', 2),
(532328, 532300, '', '元谋县', 2),
(532329, 532300, '', '武定县', 2),
(532331, 532300, '', '禄丰县', 2),
(532500, 530000, '', '红河哈尼族彝族自治州', 1),
(532501, 532500, '', '个旧市', 2),
(532502, 532500, '', '开远市', 2),
(532503, 532500, '', '蒙自市', 2),
(532504, 532500, '', '弥勒市', 2),
(532523, 532500, '', '屏边苗族自治县', 2),
(532524, 532500, '', '建水县', 2),
(532525, 532500, '', '石屏县', 2),
(532527, 532500, '', '泸西县', 2),
(532528, 532500, '', '元阳县', 2),
(532529, 532500, '', '红河县', 2),
(532530, 532500, '', '金平苗族瑶族傣族自治县', 2),
(532531, 532500, '', '绿春县', 2),
(532532, 532500, '', '河口瑶族自治县', 2),
(532600, 530000, '', '文山壮族苗族自治州', 1),
(532601, 532600, '', '文山市', 2),
(532622, 532600, '', '砚山县', 2),
(532623, 532600, '', '西畴县', 2),
(532624, 532600, '', '麻栗坡县', 2),
(532625, 532600, '', '马关县', 2),
(532626, 532600, '', '丘北县', 2),
(532627, 532600, '', '广南县', 2),
(532628, 532600, '', '富宁县', 2),
(532800, 530000, '', '西双版纳傣族自治州', 1),
(532801, 532800, '', '景洪市', 2),
(532822, 532800, '', '勐海县', 2),
(532823, 532800, '', '勐腊县', 2),
(532900, 530000, '', '大理白族自治州', 1),
(532901, 532900, '', '大理市', 2),
(532922, 532900, '', '漾濞彝族自治县', 2),
(532923, 532900, '', '祥云县', 2),
(532924, 532900, '', '宾川县', 2),
(532925, 532900, '', '弥渡县', 2),
(532926, 532900, '', '南涧彝族自治县', 2),
(532927, 532900, '', '巍山彝族回族自治县', 2),
(532928, 532900, '', '永平县', 2),
(532929, 532900, '', '云龙县', 2),
(532930, 532900, '', '洱源县', 2),
(532931, 532900, '', '剑川县', 2),
(532932, 532900, '', '鹤庆县', 2),
(533100, 530000, '', '德宏傣族景颇族自治州', 1),
(533102, 533100, '', '瑞丽市', 2),
(533103, 533100, '', '芒市', 2),
(533122, 533100, '', '梁河县', 2),
(533123, 533100, '', '盈江县', 2),
(533124, 533100, '', '陇川县', 2),
(533300, 530000, '', '怒江傈僳族自治州', 1),
(533321, 533300, '', '泸水县', 2),
(533323, 533300, '', '福贡县', 2),
(533324, 533300, '', '贡山独龙族怒族自治县', 2),
(533325, 533300, '', '兰坪白族普米族自治县', 2),
(533400, 530000, '', '迪庆藏族自治州', 1),
(533421, 533400, '', '香格里拉县', 2),
(533422, 533400, '', '德钦县', 2),
(533423, 533400, '', '维西傈僳族自治县', 2),
(540000, 0, '', '西藏自治区', 0),
(540100, 540000, '', '拉萨市', 1),
(540101, 540100, '', '市辖区', 2),
(540102, 540100, '', '城关区', 2),
(540121, 540100, '', '林周县', 2),
(540122, 540100, '', '当雄县', 2),
(540123, 540100, '', '尼木县', 2),
(540124, 540100, '', '曲水县', 2),
(540125, 540100, '', '堆龙德庆县', 2),
(540126, 540100, '', '达孜县', 2),
(540127, 540100, '', '墨竹工卡县', 2),
(540200, 540000, '', '日喀则市', 1),
(540202, 540200, '', '桑珠孜区', 2),
(540221, 540200, '', '南木林县', 2),
(540222, 540200, '', '江孜县', 2),
(540223, 540200, '', '定日县', 2),
(540224, 540200, '', '萨迦县', 2),
(540225, 540200, '', '拉孜县', 2),
(540226, 540200, '', '昂仁县', 2),
(540227, 540200, '', '谢通门县', 2),
(540228, 540200, '', '白朗县', 2),
(540229, 540200, '', '仁布县', 2),
(540230, 540200, '', '康马县', 2),
(540231, 540200, '', '定结县', 2),
(540232, 540200, '', '仲巴县', 2),
(540233, 540200, '', '亚东县', 2),
(540234, 540200, '', '吉隆县', 2),
(540235, 540200, '', '聂拉木县', 2),
(540236, 540200, '', '萨嘎县', 2),
(540237, 540200, '', '岗巴县', 2),
(542100, 540000, '', '昌都地区', 1),
(542121, 542100, '', '昌都县', 2),
(542122, 542100, '', '江达县', 2),
(542123, 542100, '', '贡觉县', 2),
(542124, 542100, '', '类乌齐县', 2),
(542125, 542100, '', '丁青县', 2),
(542126, 542100, '', '察雅县', 2),
(542127, 542100, '', '八宿县', 2),
(542128, 542100, '', '左贡县', 2),
(542129, 542100, '', '芒康县', 2),
(542132, 542100, '', '洛隆县', 2),
(542133, 542100, '', '边坝县', 2),
(542200, 540000, '', '山南地区', 1),
(542221, 542200, '', '乃东县', 2),
(542222, 542200, '', '扎囊县', 2),
(542223, 542200, '', '贡嘎县', 2),
(542224, 542200, '', '桑日县', 2),
(542225, 542200, '', '琼结县', 2),
(542226, 542200, '', '曲松县', 2),
(542227, 542200, '', '措美县', 2),
(542228, 542200, '', '洛扎县', 2),
(542229, 542200, '', '加查县', 2),
(542231, 542200, '', '隆子县', 2),
(542232, 542200, '', '错那县', 2),
(542233, 542200, '', '浪卡子县', 2),
(542400, 540000, '', '那曲地区', 1),
(542421, 542400, '', '那曲县', 2),
(542422, 542400, '', '嘉黎县', 2),
(542423, 542400, '', '比如县', 2),
(542424, 542400, '', '聂荣县', 2),
(542425, 542400, '', '安多县', 2),
(542426, 542400, '', '申扎县', 2),
(542427, 542400, '', '索县', 2),
(542428, 542400, '', '班戈县', 2),
(542429, 542400, '', '巴青县', 2),
(542430, 542400, '', '尼玛县', 2),
(542431, 542400, '', '双湖县', 2),
(542500, 540000, '', '阿里地区', 1),
(542521, 542500, '', '普兰县', 2),
(542522, 542500, '', '札达县', 2),
(542523, 542500, '', '噶尔县', 2),
(542524, 542500, '', '日土县', 2),
(542525, 542500, '', '革吉县', 2),
(542526, 542500, '', '改则县', 2),
(542527, 542500, '', '措勤县', 2),
(542600, 540000, '', '林芝地区', 1),
(542621, 542600, '', '林芝县', 2),
(542622, 542600, '', '工布江达县', 2),
(542623, 542600, '', '米林县', 2),
(542624, 542600, '', '墨脱县', 2),
(542625, 542600, '', '波密县', 2),
(542626, 542600, '', '察隅县', 2),
(542627, 542600, '', '朗县', 2),
(610000, 0, '', '陕西省', 0),
(610100, 610000, '', '西安市', 1),
(610101, 610100, '', '市辖区', 2),
(610102, 610100, '', '新城区', 2),
(610103, 610100, '', '碑林区', 2),
(610104, 610100, '', '莲湖区', 2),
(610111, 610100, '', '灞桥区', 2),
(610112, 610100, '', '未央区', 2),
(610113, 610100, '', '雁塔区', 2),
(610114, 610100, '', '阎良区', 2),
(610115, 610100, '', '临潼区', 2),
(610116, 610100, '', '长安区', 2),
(610122, 610100, '', '蓝田县', 2),
(610124, 610100, '', '周至县', 2),
(610125, 610100, '', '户县', 2),
(610126, 610100, '', '高陵县', 2),
(610200, 610000, '', '铜川市', 1),
(610201, 610200, '', '市辖区', 2),
(610202, 610200, '', '王益区', 2),
(610203, 610200, '', '印台区', 2),
(610204, 610200, '', '耀州区', 2),
(610222, 610200, '', '宜君县', 2),
(610300, 610000, '', '宝鸡市', 1),
(610301, 610300, '', '市辖区', 2),
(610302, 610300, '', '渭滨区', 2),
(610303, 610300, '', '金台区', 2),
(610304, 610300, '', '陈仓区', 2),
(610322, 610300, '', '凤翔县', 2),
(610323, 610300, '', '岐山县', 2),
(610324, 610300, '', '扶风县', 2),
(610326, 610300, '', '眉县', 2),
(610327, 610300, '', '陇县', 2),
(610328, 610300, '', '千阳县', 2),
(610329, 610300, '', '麟游县', 2),
(610330, 610300, '', '凤县', 2),
(610331, 610300, '', '太白县', 2),
(610400, 610000, '', '咸阳市', 1),
(610401, 610400, '', '市辖区', 2),
(610402, 610400, '', '秦都区', 2),
(610403, 610400, '', '杨陵区', 2),
(610404, 610400, '', '渭城区', 2),
(610422, 610400, '', '三原县', 2),
(610423, 610400, '', '泾阳县', 2),
(610424, 610400, '', '乾县', 2),
(610425, 610400, '', '礼泉县', 2),
(610426, 610400, '', '永寿县', 2),
(610427, 610400, '', '彬县', 2),
(610428, 610400, '', '长武县', 2),
(610429, 610400, '', '旬邑县', 2),
(610430, 610400, '', '淳化县', 2),
(610431, 610400, '', '武功县', 2),
(610481, 610400, '', '兴平市', 2),
(610500, 610000, '', '渭南市', 1),
(610501, 610500, '', '市辖区', 2),
(610502, 610500, '', '临渭区', 2),
(610521, 610500, '', '华县', 2),
(610522, 610500, '', '潼关县', 2),
(610523, 610500, '', '大荔县', 2),
(610524, 610500, '', '合阳县', 2),
(610525, 610500, '', '澄城县', 2),
(610526, 610500, '', '蒲城县', 2),
(610527, 610500, '', '白水县', 2),
(610528, 610500, '', '富平县', 2),
(610581, 610500, '', '韩城市', 2),
(610582, 610500, '', '华阴市', 2),
(610600, 610000, '', '延安市', 1),
(610601, 610600, '', '市辖区', 2),
(610602, 610600, '', '宝塔区', 2),
(610621, 610600, '', '延长县', 2),
(610622, 610600, '', '延川县', 2),
(610623, 610600, '', '子长县', 2),
(610624, 610600, '', '安塞县', 2),
(610625, 610600, '', '志丹县', 2),
(610626, 610600, '', '吴起县', 2),
(610627, 610600, '', '甘泉县', 2),
(610628, 610600, '', '富县', 2),
(610629, 610600, '', '洛川县', 2),
(610630, 610600, '', '宜川县', 2),
(610631, 610600, '', '黄龙县', 2),
(610632, 610600, '', '黄陵县', 2),
(610700, 610000, '', '汉中市', 1),
(610701, 610700, '', '市辖区', 2),
(610702, 610700, '', '汉台区', 2),
(610721, 610700, '', '南郑县', 2),
(610722, 610700, '', '城固县', 2),
(610723, 610700, '', '洋县', 2),
(610724, 610700, '', '西乡县', 2),
(610725, 610700, '', '勉县', 2),
(610726, 610700, '', '宁强县', 2),
(610727, 610700, '', '略阳县', 2),
(610728, 610700, '', '镇巴县', 2),
(610729, 610700, '', '留坝县', 2),
(610730, 610700, '', '佛坪县', 2),
(610800, 610000, '', '榆林市', 1),
(610801, 610800, '', '市辖区', 2),
(610802, 610800, '', '榆阳区', 2),
(610821, 610800, '', '神木县', 2),
(610822, 610800, '', '府谷县', 2),
(610823, 610800, '', '横山县', 2),
(610824, 610800, '', '靖边县', 2),
(610825, 610800, '', '定边县', 2),
(610826, 610800, '', '绥德县', 2),
(610827, 610800, '', '米脂县', 2),
(610828, 610800, '', '佳县', 2),
(610829, 610800, '', '吴堡县', 2),
(610830, 610800, '', '清涧县', 2),
(610831, 610800, '', '子洲县', 2),
(610900, 610000, '', '安康市', 1),
(610901, 610900, '', '市辖区', 2),
(610902, 610900, '', '汉滨区', 2),
(610921, 610900, '', '汉阴县', 2),
(610922, 610900, '', '石泉县', 2),
(610923, 610900, '', '宁陕县', 2),
(610924, 610900, '', '紫阳县', 2),
(610925, 610900, '', '岚皋县', 2),
(610926, 610900, '', '平利县', 2),
(610927, 610900, '', '镇坪县', 2),
(610928, 610900, '', '旬阳县', 2),
(610929, 610900, '', '白河县', 2),
(611000, 610000, '', '商洛市', 1),
(611001, 611000, '', '市辖区', 2),
(611002, 611000, '', '商州区', 2),
(611021, 611000, '', '洛南县', 2),
(611022, 611000, '', '丹凤县', 2),
(611023, 611000, '', '商南县', 2),
(611024, 611000, '', '山阳县', 2),
(611025, 611000, '', '镇安县', 2),
(611026, 611000, '', '柞水县', 2),
(620000, 0, '', '甘肃省', 0),
(620100, 620000, '', '兰州市', 1),
(620101, 620100, '', '市辖区', 2),
(620102, 620100, '', '城关区', 2),
(620103, 620100, '', '七里河区', 2),
(620104, 620100, '', '西固区', 2),
(620105, 620100, '', '安宁区', 2),
(620111, 620100, '', '红古区', 2),
(620121, 620100, '', '永登县', 2),
(620122, 620100, '', '皋兰县', 2),
(620123, 620100, '', '榆中县', 2),
(620200, 620000, '', '嘉峪关市', 1),
(620201, 620200, '', '市辖区', 2),
(620300, 620000, '', '金昌市', 1),
(620301, 620300, '', '市辖区', 2),
(620302, 620300, '', '金川区', 2),
(620321, 620300, '', '永昌县', 2),
(620400, 620000, '', '白银市', 1),
(620401, 620400, '', '市辖区', 2),
(620402, 620400, '', '白银区', 2),
(620403, 620400, '', '平川区', 2),
(620421, 620400, '', '靖远县', 2),
(620422, 620400, '', '会宁县', 2),
(620423, 620400, '', '景泰县', 2),
(620500, 620000, '', '天水市', 1),
(620501, 620500, '', '市辖区', 2),
(620502, 620500, '', '秦州区', 2),
(620503, 620500, '', '麦积区', 2),
(620521, 620500, '', '清水县', 2),
(620522, 620500, '', '秦安县', 2),
(620523, 620500, '', '甘谷县', 2),
(620524, 620500, '', '武山县', 2),
(620525, 620500, '', '张家川回族自治县', 2),
(620600, 620000, '', '武威市', 1),
(620601, 620600, '', '市辖区', 2),
(620602, 620600, '', '凉州区', 2),
(620621, 620600, '', '民勤县', 2),
(620622, 620600, '', '古浪县', 2),
(620623, 620600, '', '天祝藏族自治县', 2),
(620700, 620000, '', '张掖市', 1),
(620701, 620700, '', '市辖区', 2),
(620702, 620700, '', '甘州区', 2),
(620721, 620700, '', '肃南裕固族自治县', 2),
(620722, 620700, '', '民乐县', 2),
(620723, 620700, '', '临泽县', 2),
(620724, 620700, '', '高台县', 2),
(620725, 620700, '', '山丹县', 2),
(620800, 620000, '', '平凉市', 1),
(620801, 620800, '', '市辖区', 2),
(620802, 620800, '', '崆峒区', 2),
(620821, 620800, '', '泾川县', 2),
(620822, 620800, '', '灵台县', 2),
(620823, 620800, '', '崇信县', 2),
(620824, 620800, '', '华亭县', 2),
(620825, 620800, '', '庄浪县', 2),
(620826, 620800, '', '静宁县', 2),
(620900, 620000, '', '酒泉市', 1),
(620901, 620900, '', '市辖区', 2),
(620902, 620900, '', '肃州区', 2),
(620921, 620900, '', '金塔县', 2),
(620922, 620900, '', '瓜州县', 2),
(620923, 620900, '', '肃北蒙古族自治县', 2),
(620924, 620900, '', '阿克塞哈萨克族自治县', 2),
(620981, 620900, '', '玉门市', 2),
(620982, 620900, '', '敦煌市', 2),
(621000, 620000, '', '庆阳市', 1),
(621001, 621000, '', '市辖区', 2),
(621002, 621000, '', '西峰区', 2),
(621021, 621000, '', '庆城县', 2),
(621022, 621000, '', '环县', 2),
(621023, 621000, '', '华池县', 2),
(621024, 621000, '', '合水县', 2),
(621025, 621000, '', '正宁县', 2),
(621026, 621000, '', '宁县', 2),
(621027, 621000, '', '镇原县', 2),
(621100, 620000, '', '定西市', 1),
(621101, 621100, '', '市辖区', 2),
(621102, 621100, '', '安定区', 2),
(621121, 621100, '', '通渭县', 2),
(621122, 621100, '', '陇西县', 2),
(621123, 621100, '', '渭源县', 2),
(621124, 621100, '', '临洮县', 2),
(621125, 621100, '', '漳县', 2),
(621126, 621100, '', '岷县', 2),
(621200, 620000, '', '陇南市', 1),
(621201, 621200, '', '市辖区', 2),
(621202, 621200, '', '武都区', 2),
(621221, 621200, '', '成县', 2),
(621222, 621200, '', '文县', 2),
(621223, 621200, '', '宕昌县', 2),
(621224, 621200, '', '康县', 2),
(621225, 621200, '', '西和县', 2),
(621226, 621200, '', '礼县', 2),
(621227, 621200, '', '徽县', 2),
(621228, 621200, '', '两当县', 2),
(622900, 620000, '', '临夏回族自治州', 1),
(622901, 622900, '', '临夏市', 2),
(622921, 622900, '', '临夏县', 2),
(622922, 622900, '', '康乐县', 2),
(622923, 622900, '', '永靖县', 2),
(622924, 622900, '', '广河县', 2),
(622925, 622900, '', '和政县', 2),
(622926, 622900, '', '东乡族自治县', 2),
(622927, 622900, '', '积石山保安族东乡族撒拉族自治县', 2),
(623000, 620000, '', '甘南藏族自治州', 1),
(623001, 623000, '', '合作市', 2),
(623021, 623000, '', '临潭县', 2),
(623022, 623000, '', '卓尼县', 2),
(623023, 623000, '', '舟曲县', 2);
INSERT INTO `yii2_region` (`code`, `parent_code`, `name`, `fullname`, `level`) VALUES
(623024, 623000, '', '迭部县', 2),
(623025, 623000, '', '玛曲县', 2),
(623026, 623000, '', '碌曲县', 2),
(623027, 623000, '', '夏河县', 2),
(630000, 0, '', '青海省', 0),
(630100, 630000, '', '西宁市', 1),
(630101, 630100, '', '市辖区', 2),
(630102, 630100, '', '城东区', 2),
(630103, 630100, '', '城中区', 2),
(630104, 630100, '', '城西区', 2),
(630105, 630100, '', '城北区', 2),
(630121, 630100, '', '大通回族土族自治县', 2),
(630122, 630100, '', '湟中县', 2),
(630123, 630100, '', '湟源县', 2),
(630200, 630000, '', '海东市', 1),
(630202, 630200, '', '乐都区', 2),
(630221, 630200, '', '平安县', 2),
(630222, 630200, '', '民和回族土族自治县', 2),
(630223, 630200, '', '互助土族自治县', 2),
(630224, 630200, '', '化隆回族自治县', 2),
(630225, 630200, '', '循化撒拉族自治县', 2),
(632200, 630000, '', '海北藏族自治州', 1),
(632221, 632200, '', '门源回族自治县', 2),
(632222, 632200, '', '祁连县', 2),
(632223, 632200, '', '海晏县', 2),
(632224, 632200, '', '刚察县', 2),
(632300, 630000, '', '黄南藏族自治州', 1),
(632321, 632300, '', '同仁县', 2),
(632322, 632300, '', '尖扎县', 2),
(632323, 632300, '', '泽库县', 2),
(632324, 632300, '', '河南蒙古族自治县', 2),
(632500, 630000, '', '海南藏族自治州', 1),
(632521, 632500, '', '共和县', 2),
(632522, 632500, '', '同德县', 2),
(632523, 632500, '', '贵德县', 2),
(632524, 632500, '', '兴海县', 2),
(632525, 632500, '', '贵南县', 2),
(632600, 630000, '', '果洛藏族自治州', 1),
(632621, 632600, '', '玛沁县', 2),
(632622, 632600, '', '班玛县', 2),
(632623, 632600, '', '甘德县', 2),
(632624, 632600, '', '达日县', 2),
(632625, 632600, '', '久治县', 2),
(632626, 632600, '', '玛多县', 2),
(632700, 630000, '', '玉树藏族自治州', 1),
(632701, 632700, '', '玉树市', 2),
(632722, 632700, '', '杂多县', 2),
(632723, 632700, '', '称多县', 2),
(632724, 632700, '', '治多县', 2),
(632725, 632700, '', '囊谦县', 2),
(632726, 632700, '', '曲麻莱县', 2),
(632800, 630000, '', '海西蒙古族藏族自治州', 1),
(632801, 632800, '', '格尔木市', 2),
(632802, 632800, '', '德令哈市', 2),
(632821, 632800, '', '乌兰县', 2),
(632822, 632800, '', '都兰县', 2),
(632823, 632800, '', '天峻县', 2),
(640000, 0, '', '宁夏回族自治区', 0),
(640100, 640000, '', '银川市', 1),
(640101, 640100, '', '市辖区', 2),
(640104, 640100, '', '兴庆区', 2),
(640105, 640100, '', '西夏区', 2),
(640106, 640100, '', '金凤区', 2),
(640121, 640100, '', '永宁县', 2),
(640122, 640100, '', '贺兰县', 2),
(640181, 640100, '', '灵武市', 2),
(640200, 640000, '', '石嘴山市', 1),
(640201, 640200, '', '市辖区', 2),
(640202, 640200, '', '大武口区', 2),
(640205, 640200, '', '惠农区', 2),
(640221, 640200, '', '平罗县', 2),
(640300, 640000, '', '吴忠市', 1),
(640301, 640300, '', '市辖区', 2),
(640302, 640300, '', '利通区', 2),
(640303, 640300, '', '红寺堡区', 2),
(640323, 640300, '', '盐池县', 2),
(640324, 640300, '', '同心县', 2),
(640381, 640300, '', '青铜峡市', 2),
(640400, 640000, '', '固原市', 1),
(640401, 640400, '', '市辖区', 2),
(640402, 640400, '', '原州区', 2),
(640422, 640400, '', '西吉县', 2),
(640423, 640400, '', '隆德县', 2),
(640424, 640400, '', '泾源县', 2),
(640425, 640400, '', '彭阳县', 2),
(640500, 640000, '', '中卫市', 1),
(640501, 640500, '', '市辖区', 2),
(640502, 640500, '', '沙坡头区', 2),
(640521, 640500, '', '中宁县', 2),
(640522, 640500, '', '海原县', 2),
(650000, 0, '', '新疆维吾尔自治区', 0),
(650100, 650000, '', '乌鲁木齐市', 1),
(650101, 650100, '', '市辖区', 2),
(650102, 650100, '', '天山区', 2),
(650103, 650100, '', '沙依巴克区', 2),
(650104, 650100, '', '新市区', 2),
(650105, 650100, '', '水磨沟区', 2),
(650106, 650100, '', '头屯河区', 2),
(650107, 650100, '', '达坂城区', 2),
(650109, 650100, '', '米东区', 2),
(650121, 650100, '', '乌鲁木齐县', 2),
(650200, 650000, '', '克拉玛依市', 1),
(650201, 650200, '', '市辖区', 2),
(650202, 650200, '', '独山子区', 2),
(650203, 650200, '', '克拉玛依区', 2),
(650204, 650200, '', '白碱滩区', 2),
(650205, 650200, '', '乌尔禾区', 2),
(652100, 650000, '', '吐鲁番地区', 1),
(652101, 652100, '', '吐鲁番市', 2),
(652122, 652100, '', '鄯善县', 2),
(652123, 652100, '', '托克逊县', 2),
(652200, 650000, '', '哈密地区', 1),
(652201, 652200, '', '哈密市', 2),
(652222, 652200, '', '巴里坤哈萨克自治县', 2),
(652223, 652200, '', '伊吾县', 2),
(652300, 650000, '', '昌吉回族自治州', 1),
(652301, 652300, '', '昌吉市', 2),
(652302, 652300, '', '阜康市', 2),
(652323, 652300, '', '呼图壁县', 2),
(652324, 652300, '', '玛纳斯县', 2),
(652325, 652300, '', '奇台县', 2),
(652327, 652300, '', '吉木萨尔县', 2),
(652328, 652300, '', '木垒哈萨克自治县', 2),
(652700, 650000, '', '博尔塔拉蒙古自治州', 1),
(652701, 652700, '', '博乐市', 2),
(652702, 652700, '', '阿拉山口市', 2),
(652722, 652700, '', '精河县', 2),
(652723, 652700, '', '温泉县', 2),
(652800, 650000, '', '巴音郭楞蒙古自治州', 1),
(652801, 652800, '', '库尔勒市', 2),
(652822, 652800, '', '轮台县', 2),
(652823, 652800, '', '尉犁县', 2),
(652824, 652800, '', '若羌县', 2),
(652825, 652800, '', '且末县', 2),
(652826, 652800, '', '焉耆回族自治县', 2),
(652827, 652800, '', '和静县', 2),
(652828, 652800, '', '和硕县', 2),
(652829, 652800, '', '博湖县', 2),
(652900, 650000, '', '阿克苏地区', 1),
(652901, 652900, '', '阿克苏市', 2),
(652922, 652900, '', '温宿县', 2),
(652923, 652900, '', '库车县', 2),
(652924, 652900, '', '沙雅县', 2),
(652925, 652900, '', '新和县', 2),
(652926, 652900, '', '拜城县', 2),
(652927, 652900, '', '乌什县', 2),
(652928, 652900, '', '阿瓦提县', 2),
(652929, 652900, '', '柯坪县', 2),
(653000, 650000, '', '克孜勒苏柯尔克孜自治州', 1),
(653001, 653000, '', '阿图什市', 2),
(653022, 653000, '', '阿克陶县', 2),
(653023, 653000, '', '阿合奇县', 2),
(653024, 653000, '', '乌恰县', 2),
(653100, 650000, '', '喀什地区', 1),
(653101, 653100, '', '喀什市', 2),
(653121, 653100, '', '疏附县', 2),
(653122, 653100, '', '疏勒县', 2),
(653123, 653100, '', '英吉沙县', 2),
(653124, 653100, '', '泽普县', 2),
(653125, 653100, '', '莎车县', 2),
(653126, 653100, '', '叶城县', 2),
(653127, 653100, '', '麦盖提县', 2),
(653128, 653100, '', '岳普湖县', 2),
(653129, 653100, '', '伽师县', 2),
(653130, 653100, '', '巴楚县', 2),
(653131, 653100, '', '塔什库尔干塔吉克自治县', 2),
(653200, 650000, '', '和田地区', 1),
(653201, 653200, '', '和田市', 2),
(653221, 653200, '', '和田县', 2),
(653222, 653200, '', '墨玉县', 2),
(653223, 653200, '', '皮山县', 2),
(653224, 653200, '', '洛浦县', 2),
(653225, 653200, '', '策勒县', 2),
(653226, 653200, '', '于田县', 2),
(653227, 653200, '', '民丰县', 2),
(654000, 650000, '', '伊犁哈萨克自治州', 1),
(654002, 654000, '', '伊宁市', 2),
(654003, 654000, '', '奎屯市', 2),
(654021, 654000, '', '伊宁县', 2),
(654022, 654000, '', '察布查尔锡伯自治县', 2),
(654023, 654000, '', '霍城县', 2),
(654024, 654000, '', '巩留县', 2),
(654025, 654000, '', '新源县', 2),
(654026, 654000, '', '昭苏县', 2),
(654027, 654000, '', '特克斯县', 2),
(654028, 654000, '', '尼勒克县', 2),
(654200, 650000, '', '塔城地区', 1),
(654201, 654200, '', '塔城市', 2),
(654202, 654200, '', '乌苏市', 2),
(654221, 654200, '', '额敏县', 2),
(654223, 654200, '', '沙湾县', 2),
(654224, 654200, '', '托里县', 2),
(654225, 654200, '', '裕民县', 2),
(654226, 654200, '', '和布克赛尔蒙古自治县', 2),
(654300, 650000, '', '阿勒泰地区', 1),
(654301, 654300, '', '阿勒泰市', 2),
(654321, 654300, '', '布尔津县', 2),
(654322, 654300, '', '富蕴县', 2),
(654323, 654300, '', '福海县', 2),
(654324, 654300, '', '哈巴河县', 2),
(654325, 654300, '', '青河县', 2),
(654326, 654300, '', '吉木乃县', 2),
(659000, 650000, '', '自治区直辖县级行政区划', 1),
(659001, 659000, '', '石河子市', 2),
(659002, 659000, '', '阿拉尔市', 2),
(659003, 659000, '', '图木舒克市', 2),
(659004, 659000, '', '五家渠市', 2),
(710000, 0, '', '台湾省', 0),
(810000, 0, '', '香港特别行政区', 0),
(820000, 0, '', '澳门特别行政区', 0);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_server`
--

CREATE TABLE IF NOT EXISTS `yii2_server` (
  `sid` int(11) NOT NULL,
  `gid` smallint(6) NOT NULL,
  `servername` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '名字',
  `player_num` int(7) NOT NULL COMMENT '玩家数量',
  `start_time` int(13) NOT NULL,
  `add_time` int(13) NOT NULL,
  `up_time` int(13) NOT NULL,
  `stop_notice` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `is_display` tinyint(2) NOT NULL COMMENT '是否显示',
  `status` tinyint(2) NOT NULL COMMENT '是否推荐',
  `content` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '简介',
  `server_img` int(11) NOT NULL DEFAULT '0' COMMENT '开服表图标',
  `isstop` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-不停 1-停服',
  `serverid` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '本站区服ID',
  `cp_gameid` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '联运游戏id',
  `cp_sid` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '联运区服ID',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '1-删除'
) ENGINE=MyISAM AUTO_INCREMENT=3346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='区服表';

--
-- 转存表中的数据 `yii2_server`
--

INSERT INTO `yii2_server` (`sid`, `gid`, `servername`, `player_num`, `start_time`, `add_time`, `up_time`, `stop_notice`, `is_display`, `status`, `content`, `server_img`, `isstop`, `serverid`, `cp_gameid`, `cp_sid`, `is_del`) VALUES
(1, 1, '双线一区', 200, 1501651015, 1501651015, 1501651015, '', 1, 1, '', 0, 0, '1', '1', '1', 0),
(2, 1, '测试服', 200, 1501748127, 1501651015, 1501748198, '', 1, 0, '', 0, 0, '2', '1', '2', 0),
(3, 3, '张三', 0, 1501874100, 1501746646, 1501748411, '', 0, 1, '', 0, 0, '1', '', '1', 0),
(3243, 95, '双线2区', 0, 1501221600, 1501138713, 0, '', 1, 1, '', 0, 0, '2', '', '', 0),
(3210, 95, '双线1区', 0, 1501135200, 1500604161, 0, '', 1, 1, '', 0, 0, '1', '', '', 0),
(3244, 95, '双线3区', 0, 1501308000, 1501219519, 0, '', 1, 1, '', 0, 0, '3', '', '', 0),
(3245, 95, '双线4区', 0, 1501480800, 1501219744, 0, '', 1, 1, '', 0, 0, '4', '', '', 0),
(3246, 95, '双线5区', 0, 1501567200, 1501219763, 0, '', 1, 1, '', 0, 0, '5', '', '', 0),
(3282, 96, '双线1区', 0, 1503554400, 1502250216, 0, '', 1, 1, '', 0, 0, '1', '', '', 0),
(2972, 86, '双线1区', 0, 1495172400, 1494582016, 0, '', 1, 1, '', 0, 0, '1', '', '', 0),
(3141, 92, '双线1区', 0, 1499742000, 1498874453, 0, '', 1, 1, '', 0, 0, '1', '', '', 0),
(3345, 96, '双线2区', 1, 1504261517, 1503558423, 0, '', 1, 1, '', 0, 0, '2', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_tag`
--

CREATE TABLE IF NOT EXISTS `yii2_tag` (
  `id` int(8) NOT NULL,
  `name` char(30) NOT NULL COMMENT '标签名',
  `num` int(8) NOT NULL DEFAULT '0' COMMENT '有该标签内容数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- --------------------------------------------------------

--
-- 表的结构 `yii2_transfer_log`
--

CREATE TABLE IF NOT EXISTS `yii2_transfer_log` (
  `id` int(11) NOT NULL,
  `order_sn` varchar(35) NOT NULL COMMENT '订单号',
  `transfer_sn` varchar(35) DEFAULT '' COMMENT '流水号',
  `money` float(8,2) NOT NULL COMMENT '订单金额',
  `transfer_amount` float(8,2) NOT NULL COMMENT '转账(退款)金额',
  `partner` varchar(10) NOT NULL DEFAULT '' COMMENT '分账账户',
  `type` enum('TUI','FEN') NOT NULL DEFAULT 'FEN' COMMENT '类型',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成功时间',
  `status` enum('INIT','TI','SHOU','TUI','OK') NOT NULL DEFAULT 'INIT' COMMENT '资金状态',
  `remark` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='分账退款表';

--
-- 转存表中的数据 `yii2_transfer_log`
--

INSERT INTO `yii2_transfer_log` (`id`, `order_sn`, `transfer_sn`, `money`, `transfer_amount`, `partner`, `type`, `ctime`, `utime`, `stime`, `status`, `remark`) VALUES
(1, '20170915N171949U', '20170915N171949U', 1.00, 0.06, '', 'FEN', '2017-09-16 16:36:43', '2017-09-16 16:36:43', '0000-00-00 00:00:00', 'INIT', '');

-- --------------------------------------------------------

--
-- 表的结构 `yii2_user`
--

CREATE TABLE IF NOT EXISTS `yii2_user` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '昵称',
  `salt` char(32) DEFAULT NULL COMMENT '登录验证字符',
  `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `idcard` char(20) DEFAULT NULL COMMENT '身份证号',
  `money` float(8,2) unsigned NOT NULL COMMENT '账户金额',
  `total_money` float(10,2) NOT NULL COMMENT '累计付费',
  `from_social` varchar(200) NOT NULL COMMENT '来源',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tuid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '推荐人uid',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '头像路径',
  `score` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '当前积分',
  `score_all` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '总积分',
  `reg_gameid` int(5) unsigned NOT NULL COMMENT '注册游戏',
  `reg_serverid` int(10) unsigned NOT NULL COMMENT '注冊区服',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态 1正常 0禁用'
) ENGINE=MyISAM AUTO_INCREMENT=90000004 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `yii2_user`
--

INSERT INTO `yii2_user` (`uid`, `username`, `password`, `nickname`, `salt`, `email`, `mobile`, `idcard`, `money`, `total_money`, `from_social`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `tuid`, `image`, `score`, `score_all`, `reg_gameid`, `reg_serverid`, `status`) VALUES
(1, 'user001', '$2y$13$UwQndOKz1qyfyBg0A7yCx.lZKXMlwoH3VMtbcpWaveQfzG6dq5npy', '', 'l3_EmNGaR2Ab2brTYqIw5baNOsPBzKFL', 'user001@mail.com', '15222291959', NULL, 0.00, 0.00, '', 1501814354, 2130706433, 1503285855, 2130706433, '0000-00-00 00:00:00', 1, '', 100, 100, 0, 0, 1),
(2, 'user002', '$2y$13$8V32rbJviMNfzNqAeByZyuv/PDaK0RPw1x4ZffLf60kiEehLZl9/O', '点爬', '2k4ZUneUyVok9kbp2QuidavQSQ-tj1nQ', 'user002@mail.com', '15222291958', NULL, 0.00, 0.00, '', 1501814354, 2130706433, 0, 2130706433, '2017-08-21 16:42:37', 0, '', 100, 100, 0, 0, 1),
(86479, 'admin110', '$2y$13$kqmwB0YoIxjNto.QGR4IWekeuXQNRKqTOcCqDxWX64yfTr7mgNqM2', '快点爬', 'tTo4IlzRBlxwi2xXEWCklnyhY7X7RZUd', '295729767@qq.com', '295729766@qq.co', '540122198401217290', 0.00, 26.90, 'kukewan', 1436428445, 2073489831, 1503378407, 2130706433, '2017-09-02 14:26:28', 0, '', 74667, 27, 0, 0, 1),
(90000001, 'cps001_kukejs', '', '', '', 'cps001_kukejs@kkw.com', '', '', 0.00, 12.00, 'hf', 1504245828, 2130706433, 1504245828, 2130706433, '2017-09-16 13:38:20', 1, '', 7, 7, 96, 3345, 1),
(196834, 'kukejs', '', '23', '', '295729766@qq.com', '', '120224199211055918', 20.00, 125.00, 'kukewan', 1446285963, 2073468828, 1499158753, 1981583691, '2017-09-15 11:13:47', 0, '', 245, 125, 0, 0, 1),
(90000002, 'cps002_kukejs', '', '', '', 'cps002_kukejs@kkw.com', '', '', 0.00, 5.00, 'hf', 1504245828, 2130706433, 1504245828, 2130706433, '2017-09-11 16:46:15', 2, '', 0, 0, 96, 3345, 1),
(90000003, 'kukejs_kukejs', '', '', '', 'kukejs_kukejs@kkw.com', '', '', 0.00, 5.00, 'hf', 1504245828, 2130706433, 1504245828, 2130706433, '2017-09-11 16:46:21', 3, '', 0, 0, 96, 3345, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yii2_user_data`
--

CREATE TABLE IF NOT EXISTS `yii2_user_data` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `yii2_user_rank`
--

CREATE TABLE IF NOT EXISTS `yii2_user_rank` (
  `id` int(3) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '等级名称',
  `score` int(8) NOT NULL COMMENT '积分界限',
  `discount` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '折扣百分比',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员等级配置';

--
-- 转存表中的数据 `yii2_user_rank`
--

INSERT INTO `yii2_user_rank` (`id`, `title`, `score`, `discount`, `status`) VALUES
(1, '普通会员', 0, '0.00', 1),
(2, '一级会员', 2000, '3.00', 1),
(3, '二级会员', 5000, '6.00', 1),
(4, 'VIP会员', 10000, '10.00', 1),
(5, '钻石会员', 100000, '20.00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `yii2_ad`
--
ALTER TABLE `yii2_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_admin`
--
ALTER TABLE `yii2_admin`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `yii2_admin_log`
--
ALTER TABLE `yii2_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `yii2_ad_type`
--
ALTER TABLE `yii2_ad_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_article`
--
ALTER TABLE `yii2_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_status` (`category_id`,`status`),
  ADD KEY `idx_status_type_pid` (`status`);

--
-- Indexes for table `yii2_article_cat`
--
ALTER TABLE `yii2_article_cat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `yii2_article_position`
--
ALTER TABLE `yii2_article_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `yii2_article_tag`
--
ALTER TABLE `yii2_article_tag`
  ADD KEY `article_id` (`article_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `yii2_auth_assignment`
--
ALTER TABLE `yii2_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `yii2_auth_item`
--
ALTER TABLE `yii2_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `yii2_auth_item_child`
--
ALTER TABLE `yii2_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `yii2_auth_rule`
--
ALTER TABLE `yii2_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `yii2_captcha`
--
ALTER TABLE `yii2_captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_cart`
--
ALTER TABLE `yii2_cart`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `yii2_comment`
--
ALTER TABLE `yii2_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_config`
--
ALTER TABLE `yii2_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `yii2_game`
--
ALTER TABLE `yii2_game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_game_login`
--
ALTER TABLE `yii2_game_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `gameid` (`gameid`),
  ADD KEY `agent` (`agent`),
  ADD KEY `IDX_US_GA_AG` (`userid`,`gameid`,`agent`),
  ADD KEY `login_time` (`login_time`);

--
-- Indexes for table `yii2_game_role`
--
ALTER TABLE `yii2_game_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index` (`role`),
  ADD KEY `role` (`role`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`,`sid`,`role`),
  ADD KEY `roleid` (`roleid`);

--
-- Indexes for table `yii2_game_type`
--
ALTER TABLE `yii2_game_type`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `yii2_goods`
--
ALTER TABLE `yii2_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `goods_sn` (`goods_sn`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `last_update` (`update_time`),
  ADD KEY `promote_end_date` (`promote_end_date`),
  ADD KEY `promote_start_date` (`promote_start_date`),
  ADD KEY `goods_number` (`goods_number`),
  ADD KEY `sort_order` (`sort`);

--
-- Indexes for table `yii2_goods_attr`
--
ALTER TABLE `yii2_goods_attr`
  ADD PRIMARY KEY (`goods_attr_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `attr_id` (`attr_id`);

--
-- Indexes for table `yii2_goods_attribute`
--
ALTER TABLE `yii2_goods_attribute`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `yii2_goods_cat`
--
ALTER TABLE `yii2_goods_cat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `yii2_goods_position`
--
ALTER TABLE `yii2_goods_position`
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `yii2_goods_sku`
--
ALTER TABLE `yii2_goods_sku`
  ADD PRIMARY KEY (`sku_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `yii2_goods_tag`
--
ALTER TABLE `yii2_goods_tag`
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `yii2_menu`
--
ALTER TABLE `yii2_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `yii2_message`
--
ALTER TABLE `yii2_message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `yii2_message_sys`
--
ALTER TABLE `yii2_message_sys`
  ADD PRIMARY KEY (`sys_id`),
  ADD KEY `uid` (`uid`,`message_id`);

--
-- Indexes for table `yii2_migration`
--
ALTER TABLE `yii2_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `yii2_nav`
--
ALTER TABLE `yii2_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `yii2_order`
--
ALTER TABLE `yii2_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `yii2_page`
--
ALTER TABLE `yii2_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_partner_game`
--
ALTER TABLE `yii2_partner_game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gkey` (`gkey`),
  ADD KEY `patrnerid` (`partnerid`);

--
-- Indexes for table `yii2_partner_server`
--
ALTER TABLE `yii2_partner_server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_partner_users`
--
ALTER TABLE `yii2_partner_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `yii2_picture`
--
ALTER TABLE `yii2_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `md5` (`md5`);

--
-- Indexes for table `yii2_rebate`
--
ALTER TABLE `yii2_rebate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_rebate_user`
--
ALTER TABLE `yii2_rebate_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_region`
--
ALTER TABLE `yii2_region`
  ADD PRIMARY KEY (`code`),
  ADD KEY `area_type` (`level`);

--
-- Indexes for table `yii2_server`
--
ALTER TABLE `yii2_server`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `gid` (`gid`,`serverid`),
  ADD KEY `is_del` (`is_del`);

--
-- Indexes for table `yii2_tag`
--
ALTER TABLE `yii2_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yii2_transfer_log`
--
ALTER TABLE `yii2_transfer_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_sn` (`order_sn`);

--
-- Indexes for table `yii2_user`
--
ALTER TABLE `yii2_user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status` (`status`),
  ADD KEY `nickname` (`nickname`),
  ADD KEY `mobile` (`mobile`) USING BTREE;

--
-- Indexes for table `yii2_user_data`
--
ALTER TABLE `yii2_user_data`
  ADD PRIMARY KEY (`uid`,`type`,`target_id`),
  ADD UNIQUE KEY `uid` (`uid`,`type`,`target_id`);

--
-- Indexes for table `yii2_user_rank`
--
ALTER TABLE `yii2_user_rank`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `yii2_ad`
--
ALTER TABLE `yii2_ad`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yii2_admin`
--
ALTER TABLE `yii2_admin`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `yii2_admin_log`
--
ALTER TABLE `yii2_admin_log`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yii2_ad_type`
--
ALTER TABLE `yii2_ad_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yii2_article`
--
ALTER TABLE `yii2_article`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `yii2_article_cat`
--
ALTER TABLE `yii2_article_cat`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `yii2_article_position`
--
ALTER TABLE `yii2_article_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `yii2_captcha`
--
ALTER TABLE `yii2_captcha`
  MODIFY `id` int(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `yii2_cart`
--
ALTER TABLE `yii2_cart`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_comment`
--
ALTER TABLE `yii2_comment`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_config`
--
ALTER TABLE `yii2_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `yii2_game`
--
ALTER TABLE `yii2_game`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '游戏id',AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `yii2_game_login`
--
ALTER TABLE `yii2_game_login`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `yii2_game_role`
--
ALTER TABLE `yii2_game_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `yii2_game_type`
--
ALTER TABLE `yii2_game_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `yii2_goods`
--
ALTER TABLE `yii2_goods`
  MODIFY `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id';
--
-- AUTO_INCREMENT for table `yii2_goods_attr`
--
ALTER TABLE `yii2_goods_attr`
  MODIFY `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_goods_attribute`
--
ALTER TABLE `yii2_goods_attribute`
  MODIFY `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_goods_cat`
--
ALTER TABLE `yii2_goods_cat`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `yii2_goods_sku`
--
ALTER TABLE `yii2_goods_sku`
  MODIFY `sku_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `yii2_menu`
--
ALTER TABLE `yii2_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `yii2_message`
--
ALTER TABLE `yii2_message`
  MODIFY `message_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '消息ID';
--
-- AUTO_INCREMENT for table `yii2_message_sys`
--
ALTER TABLE `yii2_message_sys`
  MODIFY `sys_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增';
--
-- AUTO_INCREMENT for table `yii2_nav`
--
ALTER TABLE `yii2_nav`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID';
--
-- AUTO_INCREMENT for table `yii2_order`
--
ALTER TABLE `yii2_order`
  MODIFY `order_id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `yii2_page`
--
ALTER TABLE `yii2_page`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_partner_game`
--
ALTER TABLE `yii2_partner_game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `yii2_partner_server`
--
ALTER TABLE `yii2_partner_server`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `yii2_partner_users`
--
ALTER TABLE `yii2_partner_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `yii2_picture`
--
ALTER TABLE `yii2_picture`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `yii2_rebate`
--
ALTER TABLE `yii2_rebate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_rebate_user`
--
ALTER TABLE `yii2_rebate_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_server`
--
ALTER TABLE `yii2_server`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3346;
--
-- AUTO_INCREMENT for table `yii2_tag`
--
ALTER TABLE `yii2_tag`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yii2_transfer_log`
--
ALTER TABLE `yii2_transfer_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `yii2_user`
--
ALTER TABLE `yii2_user`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=90000004;
--
-- AUTO_INCREMENT for table `yii2_user_rank`
--
ALTER TABLE `yii2_user_rank`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- 限制导出的表
--

--
-- 限制表 `yii2_auth_assignment`
--
ALTER TABLE `yii2_auth_assignment`
  ADD CONSTRAINT `fk_auth_item_4494_00` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `yii2_auth_item_child`
--
ALTER TABLE `yii2_auth_item_child`
  ADD CONSTRAINT `fk_auth_item_4718_00` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auth_item_4718_01` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
