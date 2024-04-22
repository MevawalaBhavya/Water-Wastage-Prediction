/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.27-community-nt : Database - waterwastage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`waterwastage` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `waterwastage`;

/*Table structure for table `area_tbl` */

DROP TABLE IF EXISTS `area_tbl`;

CREATE TABLE `area_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `area_description` varchar(255) default NULL,
  `area_name` varchar(255) default NULL,
  `Status` bit(1) default NULL,
  `zoneId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK254wj6hxofhxnhgriancjisvb` (`zoneId`),
  CONSTRAINT `FK254wj6hxofhxnhgriancjisvb` FOREIGN KEY (`zoneId`) REFERENCES `zone_tbl` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `area_tbl` */

insert  into `area_tbl`(`Id`,`area_description`,`area_name`,`Status`,`zoneId`) values (1,'gulbai tekra','gulbai tekra','\0',1),(2,'panjra ppol','panjra pol','\0',1),(3,'aashram road brts abd\r\n','aashram road','',5),(4,'panjra pol','panjra pol','\0',1),(5,'panjra pol brts','panjra pol','\0',1),(6,'Gulbai Tekra, Azad , Memnagar, ','NavragPura','',1);

/*Table structure for table `complaint_tbl` */

DROP TABLE IF EXISTS `complaint_tbl`;

CREATE TABLE `complaint_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `Status` bit(1) default NULL,
  `complain_date` varchar(255) default NULL,
  `complain_description` varchar(255) default NULL,
  `complain_status` varchar(255) default NULL,
  `complain_subject` varchar(255) default NULL,
  `file_name` varchar(255) default NULL,
  `file_path` varchar(255) default NULL,
  `reply` varchar(255) default NULL,
  `reply_date` varchar(255) default NULL,
  `login_id` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FKike5wh8iwhv2xer586s2ymyy8` (`login_id`),
  CONSTRAINT `FKike5wh8iwhv2xer586s2ymyy8` FOREIGN KEY (`login_id`) REFERENCES `login_tbl` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complaint_tbl` */

insert  into `complaint_tbl`(`Id`,`Status`,`complain_date`,`complain_description`,`complain_status`,`complain_subject`,`file_name`,`file_path`,`reply`,`reply_date`,`login_id`) values (1,'','22/01/2020 11:44:14','jsfsfsef','Resolved','dfdcfes','Capture.JPG','D:\\Degree\\BE final Year Project\\project\\waterWastageProject\\src\\main\\webapp\\document/demo/','dsghsztr','24/01/2020 09:18:20',2),(2,'','22/01/2020 12:00:37','gfhgfjgf','Resolved','fgfdb','Capture.JPG','D:\\Degree\\BE final Year Project\\project\\waterWastageProject\\src\\main\\webapp\\document/complain/','sdsfsd','13/02/2020 10:58:26',2),(3,'','22/01/2020 12:21:48','mlkjokl','Resolved','kjukik','Capture.JPG','D:\\Degree\\BE final Year Project\\project\\waterWastageProject\\src\\main\\webapp\\document/complain/','kdnjekndkewnkefk','24/01/2020 09:25:47',2),(4,NULL,NULL,'jsfsfsef','Resolved','dfdcfes',NULL,NULL,'cvd','23/01/2020 10:36:55',NULL),(5,'','02/04/2020 06:34:35','ward distribution ','pending','ward Conrtoller','Book1.xlsx','D:\\Degree\\BE final Year Project\\project\\waterWastageProject\\src\\main\\webapp\\document/complain/',NULL,NULL,2);

/*Table structure for table `feedback_tbl` */

DROP TABLE IF EXISTS `feedback_tbl`;

CREATE TABLE `feedback_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `feedback` varchar(255) default NULL,
  `rating` int(11) default NULL,
  `login_id` int(11) default NULL,
  `status` bit(1) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK840y89pgwjf0l0i7swptmdaw0` (`login_id`),
  CONSTRAINT `FK840y89pgwjf0l0i7swptmdaw0` FOREIGN KEY (`login_id`) REFERENCES `login_tbl` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback_tbl` */

insert  into `feedback_tbl`(`Id`,`feedback`,`rating`,`login_id`,`status`) values (1,'ergerfwsd',2,NULL,''),(2,'fgxfgh',1,2,''),(3,'dfd',2,2,''),(4,'dfdsds',1,2,''),(5,'dsfcs',5,2,'');

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (5);

/*Table structure for table `login_tbl` */

DROP TABLE IF EXISTS `login_tbl`;

CREATE TABLE `login_tbl` (
  `loginId` int(11) NOT NULL auto_increment,
  `enabled` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `status` bit(1) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_tbl` */

insert  into `login_tbl`(`loginId`,`enabled`,`password`,`role`,`status`,`username`) values (1,'1','admin','ROLE_ADMIN','','admin@gmail.com'),(2,'1','user','ROLE_USER','','user@gmail.com'),(3,'1','6G9B','ROLE_USER','','vaibhavi.softvan@gmail.com'),(4,'1','b0ASOHqx','ROLE_USER','','vaibhavi.softvan@gmail.com'),(5,'1','kinNVG4N','ROLE_USER','','riya@gmail.com'),(6,'1','yVeJXeOJ','ROLE_USER','','riya@gmail.com');

/*Table structure for table `register_tbl` */

DROP TABLE IF EXISTS `register_tbl`;

CREATE TABLE `register_tbl` (
  `registerId` int(11) NOT NULL,
  `address` varchar(255) default NULL,
  `firstName` varchar(255) default NULL,
  `mobileNumber` varchar(255) default NULL,
  `Status` bit(1) default NULL,
  `loginId` int(11) default NULL,
  PRIMARY KEY  (`registerId`),
  KEY `FKr1t6k29it4ve5u12pjjnbfwkf` (`loginId`),
  CONSTRAINT `FKr1t6k29it4ve5u12pjjnbfwkf` FOREIGN KEY (`loginId`) REFERENCES `login_tbl` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `register_tbl` */

insert  into `register_tbl`(`registerId`,`address`,`firstName`,`mobileNumber`,`Status`,`loginId`) values (4,'gcyjcjg','riya','5678903422','',6);

/*Table structure for table `ward_tbl` */

DROP TABLE IF EXISTS `ward_tbl`;

CREATE TABLE `ward_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `Status` bit(1) default NULL,
  `ward_description` varchar(255) default NULL,
  `ward_name` varchar(255) default NULL,
  `areaId` int(11) default NULL,
  `zoneId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FKplf75630yl7r5lk826sth61br` (`areaId`),
  KEY `FKoyx19t2j413yprl22d3fv9tk0` (`zoneId`),
  CONSTRAINT `FKoyx19t2j413yprl22d3fv9tk0` FOREIGN KEY (`zoneId`) REFERENCES `zone_tbl` (`Id`),
  CONSTRAINT `FKplf75630yl7r5lk826sth61br` FOREIGN KEY (`areaId`) REFERENCES `area_tbl` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ward_tbl` */

insert  into `ward_tbl`(`Id`,`Status`,`ward_description`,`ward_name`,`areaId`,`zoneId`) values (1,'','gulbai tekra, panjropl east','GULBAI TEKRA',2,5),(2,'','azad, aashram road south','AZAD',3,4),(3,'','mem nagar , panrapol ,north','MEMNAGAR',2,1),(4,'\0','gulbai tekrA ','GULBAI TEKRA',6,1),(5,'','hguiu','GULBAI TEKRA',3,1),(6,'','NAVRANGPURA','NAVRANGPURA',6,7),(7,'','NIYOJAN NAGAR','NIYOJAN NAGAR',3,7);

/*Table structure for table `wastageprediction_tbl` */

DROP TABLE IF EXISTS `wastageprediction_tbl`;

CREATE TABLE `wastageprediction_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `dateOfWater` varchar(255) default NULL,
  `population` bigint(20) default NULL,
  `predectionType` varchar(255) default NULL,
  `supply` bigint(20) default NULL,
  `usagePrediction` double default NULL,
  `wastagePrediction` double default NULL,
  `wardId` int(11) default NULL,
  `zoneId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK39r03pdtnskv1jukomsebj7so` (`wardId`),
  KEY `FKt1f9lsg1edweps492h5popmmr` (`zoneId`),
  CONSTRAINT `FKt1f9lsg1edweps492h5popmmr` FOREIGN KEY (`zoneId`) REFERENCES `zone_tbl` (`Id`),
  CONSTRAINT `FK39r03pdtnskv1jukomsebj7so` FOREIGN KEY (`wardId`) REFERENCES `ward_tbl` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wastageprediction_tbl` */

insert  into `wastageprediction_tbl`(`Id`,`dateOfWater`,`population`,`predectionType`,`supply`,`usagePrediction`,`wastagePrediction`,`wardId`,`zoneId`) values (1,'2019-07-01',30000,'usage',9016,3243.35815429688,NULL,1,7),(2,'2015-06-09',75195,'wastage',774,11279.25,-2468.04150390625,3,7),(3,'2015-06-09',29469,'wastage',8725,4439.85,4138.1103515625,1,7),(4,'2015-06-09',29469,'wastage',8725,4439.85,4138.1103515625,1,7),(5,'2019-10-08',76574,'usage',9937,7905.66455078125,NULL,3,7),(6,'2019-10-08',76574,'wastage',9937,9188.88,5352.79150390625,3,7),(7,'2018-12-01',67895,'usage',5645,1111.11111,4566.777777,1,7),(8,'2015-04-01',76451,'usage',9823,7919.29150390625,NULL,3,7),(9,'2016-04-01',28451,'usage',8645,3260.666015625,NULL,5,7),(10,'2016-04-01',52103,'usage',5208,3481.658203125,NULL,6,7),(11,'2016-04-01',94612,'usage',6520,7941.1337890625,NULL,7,7),(12,'2017-04-01',63521,'usage',5982,3505.51293945312,NULL,6,7),(13,'2017-04-01',55324,'usage',9845,3708.70947265625,NULL,6,7),(14,'2018-12-24',55324,'wastage',7596,6320.12,3247.36743164062,6,7);

/*Table structure for table `waterdata_tbl` */

DROP TABLE IF EXISTS `waterdata_tbl`;

CREATE TABLE `waterdata_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `fileName` varchar(255) default NULL,
  `filePath` varchar(255) default NULL,
  `Status` bit(1) default NULL,
  `areaId` int(11) default NULL,
  `wardId` int(11) default NULL,
  `zoneId` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FKam3676yl0w572q4uoj5h8dk7` (`areaId`),
  KEY `FKl92vuylfsowary0ythxwkfrjq` (`wardId`),
  KEY `FKarhufgo57ymu6x9mmeq3g6i81` (`zoneId`),
  CONSTRAINT `FKam3676yl0w572q4uoj5h8dk7` FOREIGN KEY (`areaId`) REFERENCES `area_tbl` (`Id`),
  CONSTRAINT `FKarhufgo57ymu6x9mmeq3g6i81` FOREIGN KEY (`zoneId`) REFERENCES `zone_tbl` (`Id`),
  CONSTRAINT `FKl92vuylfsowary0ythxwkfrjq` FOREIGN KEY (`wardId`) REFERENCES `ward_tbl` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `waterdata_tbl` */

insert  into `waterdata_tbl`(`Id`,`fileName`,`filePath`,`Status`,`areaId`,`wardId`,`zoneId`) values (1,'AUG 18.xlsx','https://waterwastageprediction.s3.amazonaws.com/wwp/AUG%2018.xlsx','',2,3,1),(2,'FEB 19.xlsx','https://waterwastageprediction.s3.amazonaws.com/wwp/FEB%2019.xlsx','',6,1,1);

/*Table structure for table `zone_tbl` */

DROP TABLE IF EXISTS `zone_tbl`;

CREATE TABLE `zone_tbl` (
  `Id` int(11) NOT NULL auto_increment,
  `Status` bit(1) default NULL,
  `zone_name` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `zone_tbl` */

insert  into `zone_tbl`(`Id`,`Status`,`zone_name`) values (1,'','North'),(4,'','South'),(5,'\0','East'),(6,'\0','West'),(7,'','West'),(8,'','East');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
