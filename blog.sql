-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `first_picture` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '首图地址',
  `flag` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '文章类型，原创、转载',
  `views` int(11) NOT NULL COMMENT '浏览次数',
  `appreciation` bit(1) NOT NULL COMMENT '是否开启赞赏',
  `share_statement` bit(1) NOT NULL COMMENT '是否开启分享声明',
  `commentabled` bit(1) NOT NULL COMMENT '是否开启评论',
  `published` bit(1) NOT NULL COMMENT '是否发布',
  `recommend` bit(1) NOT NULL COMMENT '是否推荐',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `description` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `type_id` int(11) NOT NULL COMMENT '分类编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `tag_ids` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签编号1,2,3',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_type` (`type_id`) USING BTREE,
  KEY `fk_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog`
--

LOCK TABLES `t_blog` WRITE;
/*!40000 ALTER TABLE `t_blog` DISABLE KEYS */;
INSERT INTO `t_blog` VALUES (28,'Linux yum安装指定版本的MySQL（如MySQL5.7）','mysql 5.7的yum安装方法：\r\n\r\n【注意】不要直接yum install mysql ，因为默认yum源安装的maridb,不是mysql\r\n\r\n去官网找yum\r\n\r\n网址：https://dev.mysql.com/downloads/repo/yum/\r\n[![](https://note.youdao.com/yws/api/personal/file/WEBee150da5b2b6196de937486f9b8e8729?method=download&shareKey=8ddc9c87600759f7ca15a67a3578fc2e)](https://note.youdao.com/yws/api/personal/file/WEBee150da5b2b6196de937486f9b8e8729?method=download&shareKey=8ddc9c87600759f7ca15a67a3578fc2e)\r\n\r\n**可以直接通过wget下载：**\r\n\r\nwget https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm\r\n\r\n**安装yum源**\r\n\r\n    rpm -ivh mysql80-community-release-el7-3.noarch.rpm\r\n\r\n说明：虽然下载的源文件名字为mysql80-community-release-el7-3.noarch.rpm，不用担心，里边其实是包含了我们所要装的版本\r\n\r\n**安装命令执行完成后，可以查询到新的yum安装包，各种版本的都在其中，查询命令如下：**\r\n\r\n    yum repolist all | grep mysql \r\n\r\n可以看到，默认的安装源为mysql80-community版本\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB773af7f7dada43b84b81ce27fcb553d2?method=download&shareKey=be4e916e49341819e3ca9caed3fb95ce)](https://note.youdao.com/yws/api/personal/file/WEB773af7f7dada43b84b81ce27fcb553d2?method=download&shareKey=be4e916e49341819e3ca9caed3fb95ce)\r\n\r\n**我想安装的版本是mysql57-community，怎么办？**\r\n\r\n使用yum-config-manager --disable mysql80-community来取消mysql80-community的默认安装，然后\r\n\r\n使用yum-config-manager --enable mysql57-community来使能mysql57-community成为yum默认安装版本。\r\n\r\n执行对应命令后，会发现默认版本已经改为我们要安装的5.7版本了\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB7c90027df2e231ad2de3150e090123f5?method=download&shareKey=842fad63faff28aac3135a8a681c43c5)](https://note.youdao.com/yws/api/personal/file/WEB7c90027df2e231ad2de3150e090123f5?method=download&shareKey=842fad63faff28aac3135a8a681c43c5)\r\n**执行安装命令**：\r\n\r\nyum install mysql-community-server\r\n\r\nyum -y install mysql-devel\r\n\r\n**启动mysql服务**\r\n\r\nsystemctl restart mysqld.service //重启mysql服务\r\n\r\nsystemctl status mysqld.service //查看mysql状态\r\n\r\nsystemctl stop mysqld.service //停止mysql服务\r\n\r\n**获取临时密码**\r\n\r\n临时密码存在/var/log/mysqld.log中，使用如下命令查看：\r\n\r\ngrep \"temporary password\" /var/log/mysqld.log\r\n\r\n**登陆mysql**\r\n\r\nmysql -u root -p\r\n\r\nEnter password:\r\n\r\n**修改mysql密码**\r\n\r\n第一次连接不能用update语句进行密码更改，因为无法选中表\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB3cce2bf35c64274f750e215418a6bf27?method=download&shareKey=1f35f6951e2f1a486d8b52ed57edc237)](https://note.youdao.com/yws/api/personal/file/WEB3cce2bf35c64274f750e215418a6bf27?method=download&shareKey=1f35f6951e2f1a486d8b52ed57edc237)\r\n5.7.6版本以前用户可以使用如下命令：\r\n\r\nSET PASSWORD = PASSWORD(\'root\');\r\n\r\n5.7.6版本开始的用户可以使用如下命令：\r\n\r\nALTER USER USER() IDENTIFIED BY \'root\';\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB0543b3ab84bd0d9b688ee97c57790e47?method=download&shareKey=4c24311c13c623fe900c5647c97e94e0)](https://note.youdao.com/yws/api/personal/file/WEB0543b3ab84bd0d9b688ee97c57790e47?method=download&shareKey=4c24311c13c623fe900c5647c97e94e0)\r\n**update语句更改密码**\r\n\r\n这里要根据版本来执行不同的SQL语句了，因为版本不同，存储密码的字段可能不相同。5.7以前的版本可以用以下语句更新root密码：\r\n\r\nupdate user set password = password(\'root\') where user=\'root\';\r\n\r\n**如果是高版本，则会提示错误信息**\r\n\r\nERROR 1054 (42S22): Unknown column \'password\' in \'field list\'\r\n\r\n高版本里边没有password，是因为已经改成authentication_string字段了，于是重新执行修改字段后的更新语句\r\n\r\nupdate user set authentication_string = password(\'root\') where user=\'root\';\r\n\r\n**开启远程连接参考**（https://blog.csdn.net/li_wen_jin/article/details/103806171）\r\n\r\ngrant all privileges on *.* to \'root\'@\'%\' identified by \'root\';\r\n\r\nflush privileges;\r\n','https://note.youdao.com/yws/api/personal/file/WEBee150da5b2b6196de937486f9b8e8729?method=download&shareKey=8ddc9c87600759f7ca15a67a3578fc2e','转载',7,'','','','','','2020-05-01 08:43:25','2020-08-01 08:58:49','【注意】不要直接yum install mysql ，因为默认yum源安装的maridb,不是mysql',1,2,'1,2'),(29,'Linux mysql修改默认字符集永久为UTF-8','可能mysql安装的方式大同小异。我是以rpm方式安装的mysql5.7。对于中文来说，数据库编码一直是个问题（心里一万个跑过，谁叫mysql是外国人折腾出来），在Linux下设置编码全部永久为utf-8方法如下：（这里不说命令设置，命令行设置是临时的）\r\n在没改配置前，进入mysql运行  \r\n```java\r\nshow variables like \'character_set_%\';\r\n```\r\n来查看当前mysql的字符编码。\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB42b21c608ed6216d5da428c1484271c2?method=download&shareKey=5be679a709ecfbce35a1196f76b621b7)](https://note.youdao.com/yws/api/personal/file/WEB42b21c608ed6216d5da428c1484271c2?method=download&shareKey=5be679a709ecfbce35a1196f76b621b7)\r\n1.mysql配置文件一般默认为 /etc/my.cnf .（如果你找不到在哪儿，用  find / -iname \'*.cnf\' -print  来找配置文件），找到配置文件之后。\r\n修改用 vim /etc/my.cnf  。友情提示用root账号修改。\r\n在[client]下添加（注意：我在进入/etc/my.cnf 里面没有这一项，没有就不加，就只在[mysqld]下加对应的。）\r\n```java\r\ndefault-charater-set=utf8\r\n```\r\n在[mysqld]下添加\r\n```java\r\ncollation_server = utf8_general_ci character_set_server = utf8\r\n```\r\n\r\n保存退出后重启mysqld。service mysqld restart   然后登陆mysql看修改的效果。\r\n[![](https://note.youdao.com/yws/api/personal/file/WEB139a67f12b3ad7fac3cb04547e868bdf?method=download&shareKey=456ed19b2f5746fcec41faa78030281d)](https://note.youdao.com/yws/api/personal/file/WEB139a67f12b3ad7fac3cb04547e868bdf?method=download&shareKey=456ed19b2f5746fcec41faa78030281d)','https://note.youdao.com/yws/api/personal/file/WEB42b21c608ed6216d5da428c1484271c2?method=download&shareKey=5be679a709ecfbce35a1196f76b621b7','转载',0,'','','','','','2020-10-01 09:08:12','2020-11-01 09:08:12','可能mysql安装的方式大同小异。我是以rpm方式安装的mysql5.7。',1,2,'1,3,4'),(30,'Spring中三个注解@PathVariable、@Param和@RequestParam间的区别','**@Param**\r\n代码示例：\r\n```java\r\n@Select(\"select * from user where uid = #{uid} and uname = #{uname}\")\r\nList<User> getUserList(@Param(\"uid\") Integer id, @Param(\"uname\") String name);\r\n```\r\n特点：\r\n\r\n@Param主要应用在Dao层\r\n注解中的sql语句有多个条件参数，且和方法中的参数名称不一致，此时可以使用@Param注解\r\n只有一个参数时，可以不使用注解（不过还是建议使用= =）\r\n参数的顺序无关\r\n\r\n**@RequestParam**\r\n```java\r\n@ResponseBody\r\n@RequestMapping(value = \"/user/get\", method = RequestMethod.POST)\r\npublic List<User> getUserList(@RequestParam(\"uid\") Integer id, @RequestParam(\"uname\") String name) {\r\n}\r\n```\r\n\r\n特点：\r\n\r\n@RequestParam主要应用在Controller层\r\n前端提交的form表单数据中的属性名和方法中的参数名不一致时 ，springMVC就无法自动封装参数，所以需要 @RequestParam（\"前端所传属性名\"） 来指定前端提交的表单的属性的名称\r\n前端提交的form表单数据中的属性名和方法中的参数名一致时，可以不使用此注解\r\n\r\n**@PathVariable**\r\n代码示例：\r\n\r\n```java\r\n@ResponseBody\r\n@RequestMapping(\"/user/{uid}\")\r\npublic User getUserById(@PathVariable(\"uid\") Long uid) {\r\n}\r\n```\r\n特点：\r\n\r\n应用在Controller层\r\n@PathVariable是spring3.0的一个新功能：可接收请求路径中占位符的值，通过 @PathVariable 可以将URL中占位符参数{uid}绑定到处理器类的方法形参uid中 —— @PathVariable(“uid“)\r\n请求路径中占位符的名字可与方法参数名不一样：public User getUserById(@PathVariable(“uid”) Long id)\r\n\r\n**总结**\r\n此文只是大致介绍这三个参数的用法和使用场景，具体解析还需要再细细研究！','https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3462577905,2835417693&fm=26&gp=0.jpg','转载',0,'','','','','','2021-06-14 09:17:50','2021-06-14 09:17:50','三个注解的区别，一看介绍便了解',1,2,'4,5'),(31,'git设置忽略文件和目录','【例子】\r\n\r\n**# 忽略*.o和*.a文件**\r\n\r\n *.[oa]\r\n\r\n**# 忽略*.b和*.B文件，my.b除外**\r\n\r\n*.[bB]\r\n\r\n!my.b\r\n\r\n**# 忽略dbg文件和dbg目录**\r\n\r\ndbg\r\n\r\n**# 只忽略dbg目录，不忽略dbg文件**\r\n\r\ndbg/\r\n\r\n**# 只忽略dbg文件，不忽略dbg目录**\r\n\r\ndbg\r\n\r\n!dbg/\r\n\r\n**# 只忽略当前目录下的dbg文件和目录，子目录的dbg不在忽略范围内\r\n**\r\n/dbg\r\n\r\n**# 以\'#\'开始的行，被视为注释.**\r\n\r\n * ？：代表任意的一个字符\r\n    * ＊：代表任意数目的字符\r\n    * {!ab}：必须不是此类型\r\n    * {ab,bb,cx}：代表ab,bb,cx中任一类型即可\r\n    * [abc]：代表a,b,c中任一字符即可\r\n    * [ ^abc]：代表必须不是a,b,c中任一字符','https://note.youdao.com/yws/api/personal/file/WEB1f22b9615d8fe5b588aea8f809942271?method=download&shareKey=8f7a983f5219b40c21bc8b9e71254655','原创',5,'','','','','','2021-06-14 09:25:36','2021-06-14 09:37:05','设置git忽略文件，就不会上传到远程仓库',1,2,'4,5'),(32,'maven加速生成键值对及配置','archetypeCatalog = internal\r\n\r\nsetting->maven->Runner->VM中添加-DarchetypeCatalog=local','https://note.youdao.com/yws/api/personal/file/WEBc4d38b9638fd15a48f367d22ae75d376?method=download&shareKey=89c7c2e20977e036cf0de25ef729a879','原创',3,'','','','','','2021-06-14 09:47:55','2021-06-14 09:50:30','maven项目构建太慢怎么办？我来教你',1,2,'4,5');
/*!40000 ALTER TABLE `t_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `email` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '头像地址',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `admin_comment` bit(1) NOT NULL COMMENT '管理员评论',
  `blog_id` int(11) NOT NULL COMMENT '博客编号',
  `reply_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '被回复人昵称',
  `parent_comment_id` int(11) NOT NULL COMMENT '父评论编号',
  `top_comment_id` int(11) NOT NULL COMMENT '记录回复的编号，例如5回复的1，记录的是1',
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_blog` (`blog_id`) USING BTREE,
  CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (24,'管理员','965319040@qq.com','哈哈','https://unsplash.it/100/100?image=1005','2021-06-14 09:55:56','',32,NULL,-1,-1,'0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tag`
--

DROP TABLE IF EXISTS `t_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tag`
--

LOCK TABLES `t_tag` WRITE;
/*!40000 ALTER TABLE `t_tag` DISABLE KEYS */;
INSERT INTO `t_tag` VALUES (1,'Liunx'),(2,'数据结构与算法'),(3,'MySQL'),(4,'Java'),(5,'前端基础'),(6,'动漫'),(7,'面试'),(8,'数据库');
/*!40000 ALTER TABLE `t_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，编号',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (1,'学习'),(2,'工作'),(3,'影视'),(4,'总结'),(5,'生活');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，编号',
  `nickname` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `username` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '邮箱地址',
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '头像地址',
  `type` int(1) NOT NULL COMMENT '用户类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'陈旭锐','admin','21232f297a57a5a743894a0e4a801fc3','965319040@qq.com','https://unsplash.it/100/100?image=1005',1,'2021-06-01 17:47:35','2021-05-12 17:47:42'),(2,'管理员','CXRui','145496be273ef78d430ec64eb98d954a','965319040@qq.com','https://unsplash.it/100/100?image=1005',1,'2021-05-24 21:14:52','2021-05-24 21:15:07');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_visitor`
--

DROP TABLE IF EXISTS `t_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问者id',
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '访问者ip',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '访问者地区',
  `accessTime` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_visitor`
--

LOCK TABLES `t_visitor` WRITE;
/*!40000 ALTER TABLE `t_visitor` DISABLE KEYS */;
INSERT INTO `t_visitor` VALUES (23,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 08:39:04'),(24,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 08:43:29'),(25,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 08:57:53'),(26,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 08:58:03'),(27,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 08:58:52'),(28,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:01:13'),(29,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:01:17'),(30,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:01:34'),(31,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:01:47'),(32,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:08:15'),(33,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:08:30'),(34,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:09:22'),(35,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:17:53'),(36,'10.63.9.218',NULL,'2021-06-14 09:18:18'),(37,'10.63.9.218',NULL,'2021-06-14 09:18:38'),(38,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:25:38'),(39,'10.63.9.218',NULL,'2021-06-14 09:33:27'),(40,'10.63.9.218',NULL,'2021-06-14 09:33:33'),(41,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:33:52'),(42,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:35:24'),(43,'10.63.9.218',NULL,'2021-06-14 09:35:28'),(44,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:35:54'),(45,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:35:56'),(46,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:36:28'),(47,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:37:10'),(48,'10.63.9.218',NULL,'2021-06-14 09:37:17'),(49,'10.63.9.218',NULL,'2021-06-14 09:38:02'),(50,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:38:11'),(51,'10.63.9.218',NULL,'2021-06-14 09:41:47'),(52,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:41:56'),(53,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:41:59'),(54,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:42:05'),(55,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:48:08'),(56,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:48:37'),(57,'10.63.9.218',NULL,'2021-06-14 09:48:49'),(58,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:50:35'),(59,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:50:49'),(60,'127.0.0.1',NULL,'2021-06-14 09:53:10'),(61,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:53:14'),(62,'127.0.0.1',NULL,'2021-06-14 09:54:12'),(63,'0:0:0:0:0:0:0:1',NULL,'2021-06-14 09:54:16');
/*!40000 ALTER TABLE `t_visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-14 18:05:06
