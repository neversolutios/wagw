/*
SQLyog Community v12.5.0 (32 bit)
MySQL - 10.1.32-MariaDB : Database - wagw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wagw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `wagw`;

/*Table structure for table `autochat` */

DROP TABLE IF EXISTS `autochat`;

CREATE TABLE `autochat` (
  `rowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `profil` bigint(11) DEFAULT NULL,
  `keyword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previd` bigint(20) DEFAULT NULL,
  `logic` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_media` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exec_php` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `respon` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `run_exe` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` int(1) DEFAULT '0',
  `neednext` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `autochat` */

insert  into `autochat`(`rowid`,`profil`,`keyword`,`previd`,`logic`,`answer`,`wa_media`,`wa_file`,`exec_php`,`respon`,`run_exe`,`tipe`,`neednext`) values 
(1,0,'INFO',0,'=','Silahkan pilih menu berikut ini :\r\nketikkan angka saja\r\n〰〰〰〰〰〰〰〰〰〰〰\r\n1 Ke Menu ke level 2\r\n2 Info tentang WA-GW\r\n3 Kirim saya Gambar','','','','1','',0,'1'),
(2,0,'???',0,'=','Maaf saya tidak mengerti ☹️\r\nCoba ketik INFO lagi untuk memulai','','','','1','',2,'0'),
(3,0,'999',0,'=','','','','','1','',4,'0'),
(4,0,'0',0,'=','','','','','1','',3,'0'),
(5,0,'1',1,'=','*INI ADALAH MENU LEVEL 2*\r\n☠☠☠☠☠☠☠☠☠☠\r\nketik 1 untuk masuk menu level 3\r\nketik PHP untuk tes respon dari PHP\r\nketik QURAN untuk Random Quran\r\nketik SHOLAT untuk Jadwal Sholat\r\n\r\nketik 0 untuk kembali','','','','1','',0,'1'),
(6,0,'2',1,'=','*INFO TENTANG WA-GW*\r\n〰〰〰〰〰〰〰〰〰〰〰\r\nKalo ada yg GRATIS !!\r\nKenapa harus Bayar ???\r\nWA-GW adalah WA Blaster, WA Sender, WA API,\r\nBot Otomatis, CRM & Helpdesk, Marketing Solution\r\nALL IN !!\r\nwa-gw.com\r\n\r\n\r\nketik 1 untuk buka link Instagram\r\nketik 0 untuk kembali ','','','','1','',0,'1'),
(7,0,'START',0,'=','Halo Selamat Datang, ☺️☺️\r\nSaya adalah Bot Demo WAGW\r\n\r\nKetik INFO untuk menampilkan menu','','','','1','',1,'0'),
(8,0,'1',6,'=','Please follow yaa..\r\nhttps://www.instagram.com/wagwapp \r\n \r\nketik 0 untuk kembali ','','','','1','',0,'1'),
(9,0,'3',1,'=','Kirim Gambar dari Auto Respon\r\nklik 0 untuk kembali','C:\\wa-gw\\app\\bg.png','','','1','',0,'1'),
(10,0,'1',5,'=','Ini Menu Level 3\r\n\r\nMasih mau dibikin berapa level lagi ??\r\nTerusin sendiri ya ☺️☺️\r\n\r\nketik 0 untuk kembali','','','','1','',0,'0'),
(11,0,'php',5,'=','','','','https://wa-gw.com/sample/sample.php','1','',0,'0'),
(12,0,'quran',5,'=','Hehe.. Coba kamu yang terusin bagian ini ya,,\r\ntinggal masukin PHP yang respon hasilnya ayat Quran\r\n\r\nbwt kembali ketik 0 lagi..','','','https://wa-gw.com/sample/quran.php','1','',0,'0'),
(13,0,'sholat',5,'=','','','','https://wa-gw.com/sample/sholat.php','1','',0,'0');

/*Table structure for table `autochat_exclude` */

DROP TABLE IF EXISTS `autochat_exclude`;

CREATE TABLE `autochat_exclude` (
  `profil` bigint(20) DEFAULT NULL,
  `wa_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `profil` (`profil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `autochat_exclude` */

/*Table structure for table `autochat_user` */

DROP TABLE IF EXISTS `autochat_user`;

CREATE TABLE `autochat_user` (
  `wa_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previd` bigint(20) DEFAULT NULL,
  `profil` bigint(20) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL,
  `backid` bigint(20) DEFAULT NULL,
  `otp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastreply` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `autochat_user` */

insert  into `autochat_user`(`wa_no`,`previd`,`profil`,`exp_time`,`backid`,`otp`,`lastreply`) values 
('Mas Ganteng',0,0,'2021-06-14 01:12:29',0,NULL,'Maaf saya tidak mengerti ☹️\r\nCoba ketik INFO lagi untuk memulai');

/*Table structure for table `autorespon` */

DROP TABLE IF EXISTS `autorespon`;

CREATE TABLE `autorespon` (
  `profil` bigint(11) NOT NULL,
  `keyword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `logic` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`profil`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `autorespon` */

insert  into `autorespon`(`profil`,`keyword`,`answer`,`logic`) values 
(1,'Hello','Hello :-)~r~rNice to met you','='),
(1,'How Are You','I am Fine','='),
(1,'I love you','Ohh.. I Love You Tooo.. <3 <3',''),
(1,'info','*I am AutoRespon*~rBot using WA-GW',''),
(1,'makasih','Sama Sama','%'),
(1,'Salam','Wa`alaykumsalam','%'),
(1,'Thanx','Your Welcome','='),
(2,'Hello','Hello :-)~r~rNice to met you','='),
(2,'How Are You','I am Fine','='),
(2,'I love you','Ohh.. I Love You Tooo.. <3 <3',''),
(2,'info','*I am AutoRespon*~rBot using WA-GW',''),
(2,'makasih','Sama Sama','%'),
(2,'Salam','Wa`alaykumsalam','%'),
(2,'Thanx','Your Welcome','='),
(3,'Hello','Hello :-)~r~rNice to met you','='),
(3,'How Are You','I am Fine','='),
(3,'I love you','Ohh.. I Love You Tooo.. <3 <3',''),
(3,'info','*I am AutoRespon*~rBot using WA-GW',''),
(3,'makasih','Sama Sama','%'),
(3,'Salam','Wa`alaykumsalam','%'),
(3,'Thanx','Your Welcome','=');

/*Table structure for table `datacollect` */

DROP TABLE IF EXISTS `datacollect`;

CREATE TABLE `datacollect` (
  `profil` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c3` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c4` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c5` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c6` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c7` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c8` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c9` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `datacollect` */

/*Table structure for table `datacollect_txt` */

DROP TABLE IF EXISTS `datacollect_txt`;

CREATE TABLE `datacollect_txt` (
  `profil` bigint(20) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `txt1` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txt2` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `datacollect_txt` */

/*Table structure for table `grab` */

DROP TABLE IF EXISTS `grab`;

CREATE TABLE `grab` (
  `profil` int(11) DEFAULT NULL,
  `grup` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `grab` */

/*Table structure for table `grab_tmp` */

DROP TABLE IF EXISTS `grab_tmp`;

CREATE TABLE `grab_tmp` (
  `profil` int(11) NOT NULL,
  `contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `grab_tmp` */

/*Table structure for table `inbox` */

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wa_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_text` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_time` datetime NOT NULL,
  `status` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inbox` */

/*Table structure for table `multi` */

DROP TABLE IF EXISTS `multi`;

CREATE TABLE `multi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profil` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_text` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_media` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_outbox` bigint(20) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `multi` */

/*Table structure for table `outbox` */

DROP TABLE IF EXISTS `outbox`;

CREATE TABLE `outbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_text` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_media` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `outbox` */

/*Table structure for table `sent` */

DROP TABLE IF EXISTS `sent`;

CREATE TABLE `sent` (
  `id` bigint(20) NOT NULL,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_text` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_media` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`wa_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sent` */

/*Table structure for table `tesbot` */

DROP TABLE IF EXISTS `tesbot`;

CREATE TABLE `tesbot` (
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tesbot` */

/*Table structure for table `tmp` */

DROP TABLE IF EXISTS `tmp`;

CREATE TABLE `tmp` (
  `tmp_cd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tmp_val` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tmp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tmp` */

insert  into `tmp`(`tmp_cd`,`tmp_val`) values 
('appname','wg'),
('status000001','Not Connect');

/*Table structure for table `web_user` */

DROP TABLE IF EXISTS `web_user`;

CREATE TABLE `web_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wa_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `qr` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bot_mode` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bot_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_read` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `expiry` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `web_user` */

insert  into `web_user`(`id`,`wa_user`,`wa_no`,`email`,`status`,`password`,`create_dt`,`last_login`,`qr`,`bot_mode`,`bot_url`,`disable_read`,`expiry`) values 
(1,'demo','6285692961782','demo','Y','demo','2021-07-25 03:38:57','2021-07-20 05:42:36','','1','http://localhost/bots/autorespon.php','Y','2099-12-31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
