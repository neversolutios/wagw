/*
SQLyog Community v12.5.0 (32 bit)
MySQL - 5.6.24 : Database - wagw
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
