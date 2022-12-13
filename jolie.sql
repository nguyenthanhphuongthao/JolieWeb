-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: jolie
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

use heroku_f14451168439d07;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `username` varchar(100) NOT NULL,
  `date01` datetime(6) DEFAULT NULL,
  `date02` datetime(6) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`username`),
  KEY `FKg3javui8qortkb6kdl560ul8a` (`role`),
  KEY `FKge7dsq32h4lb4fncalrkfr6gf` (`type`),
  CONSTRAINT `FKg3javui8qortkb6kdl560ul8a` FOREIGN KEY (`role`) REFERENCES `config` (`id`),
  CONSTRAINT `FKge7dsq32h4lb4fncalrkfr6gf` FOREIGN KEY (`type`) REFERENCES `config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('a',NULL,NULL,'a',2,5),('thao',NULL,NULL,'5',2,5);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountinfo`
--

DROP TABLE IF EXISTS `accountinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `accountinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1000) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `date02` datetime(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(1000) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `sex` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnd0skfmjwc5wl05y1g6xn4sxi` (`username`),
  KEY `FKf799x212xauwkbpqc5qx9tiam` (`sex`),
  CONSTRAINT `FKf799x212xauwkbpqc5qx9tiam` FOREIGN KEY (`sex`) REFERENCES `config` (`id`),
  CONSTRAINT `FKnd0skfmjwc5wl05y1g6xn4sxi` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountinfo`
--

LOCK TABLES `accountinfo` WRITE;
/*!40000 ALTER TABLE `accountinfo` DISABLE KEYS */;
INSERT INTO `accountinfo` VALUES (1,'Trảng Bom, Đồng Nai','2022-06-06',NULL,'p.thao.21.602@gmail.com','Nguyễn Thanh Phương Thảo','0397827208','thao',4),(2,NULL,'2022-12-04',NULL,NULL,'a',NULL,'a',4);
/*!40000 ALTER TABLE `accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billinfo`
--

DROP TABLE IF EXISTS `billinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `billinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_payment` datetime(6) DEFAULT NULL,
  `recipient_name` varchar(200) NOT NULL,
  `recipient_phone` varchar(200) NOT NULL,
  `shipping_address` varchar(200) NOT NULL,
  `total_price` float NOT NULL,
  `id_cart` int NOT NULL,
  `payment_method` int NOT NULL,
  `shipping_method` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgr6j5rf9rr9xec66f2915h5i2` (`id_cart`),
  KEY `FK4p32sii7hxxgk8shn9vov3v8l` (`payment_method`),
  KEY `FKfv3bjiplp3mm7vg1pk4tfia2f` (`shipping_method`),
  KEY `FK1fs6yyftvmbwags76v3ip7lrw` (`status`),
  CONSTRAINT `FK1fs6yyftvmbwags76v3ip7lrw` FOREIGN KEY (`status`) REFERENCES `config` (`id`),
  CONSTRAINT `FK4p32sii7hxxgk8shn9vov3v8l` FOREIGN KEY (`payment_method`) REFERENCES `config` (`id`),
  CONSTRAINT `FKfv3bjiplp3mm7vg1pk4tfia2f` FOREIGN KEY (`shipping_method`) REFERENCES `config` (`id`),
  CONSTRAINT `FKgr6j5rf9rr9xec66f2915h5i2` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinfo`
--

LOCK TABLES `billinfo` WRITE;
/*!40000 ALTER TABLE `billinfo` DISABLE KEYS */;
INSERT INTO `billinfo` VALUES (1,'2022-12-13 13:50:01.630000','thảo','11','1',129000,1,24,27,28),(2,'2022-12-13 16:24:00.303000','a','q','q',129000,2,24,27,31),(3,'2022-12-13 16:48:26.200000','a','a','a',478000,4,24,27,19),(4,'2022-12-13 16:48:47.329000','a','a','a',3094000,5,25,27,22);
/*!40000 ALTER TABLE `billinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT NULL,
  `total_price` float NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm8q91maa08w9dyxajgqrmc63p` (`id_user`),
  CONSTRAINT `FKm8q91maa08w9dyxajgqrmc63p` FOREIGN KEY (`id_user`) REFERENCES `accountinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,129000,1),(2,1,129000,1),(3,0,4273000,1),(4,1,478000,2),(5,1,3094000,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(500) DEFAULT NULL,
  `date01` datetime(6) DEFAULT NULL,
  `date02` datetime(6) DEFAULT NULL,
  `groupcode` varchar(500) DEFAULT NULL,
  `iduser01` int DEFAULT NULL,
  `iduser02` int DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'Quyền','2022-12-13 13:47:51.000000',NULL,'ROLE',NULL,NULL,'Admin',NULL,NULL),(2,'Quyền','2022-12-13 13:47:51.000000',NULL,'ROLE',NULL,NULL,'Khách Hàng',NULL,NULL),(3,'Giới tính','2022-12-13 13:47:51.000000',NULL,'SEX',NULL,NULL,'Nam',NULL,NULL),(4,'Giới tính','2022-12-13 13:47:51.000000',NULL,'SEX',NULL,NULL,'Nữ',NULL,NULL),(5,'Loại tài khoản','2022-12-13 13:47:51.000000',NULL,'TYPE',NULL,NULL,'Jolie',NULL,NULL),(6,'Loại tài khoản','2022-12-13 13:47:51.000000',NULL,'TYPE',NULL,NULL,'Facebook',NULL,NULL),(7,'Loại tài khoản','2022-12-13 13:47:51.000000',NULL,'TYPE',NULL,NULL,'Google',NULL,NULL),(8,'Phương thức thanh toán','2022-12-13 13:47:51.000000',NULL,'PAYMENTMETHOD',NULL,NULL,'Tiền mặt',NULL,NULL),(9,'Phương thức thanh toán','2022-12-13 13:47:51.000000',NULL,'PAYMENTMETHOD',NULL,NULL,'E-Barking',NULL,NULL),(10,'Phương thức vận chuyển','2022-12-13 13:47:51.000000',NULL,'SHIPPINGMETHOD',NULL,NULL,'Hỏa tốc',NULL,NULL),(11,'Phương thức vận chuyển','2022-12-13 13:47:51.000000',NULL,'PAYMENTMETHOD',NULL,NULL,'48h',NULL,NULL),(12,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Mỹ phẩm High-end',NULL,'my-pham-high-end'),(13,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Chăm sóc da mặt',NULL,'cham-soc-da-mat'),(14,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Trang điểm',NULL,'trang-diem'),(15,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Chăm sóc tóc và Da đầu',NULL,'cham-soc-toc-va-da-dau'),(16,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Chăm sóc cơ thể',NULL,'cham-soc-co-the'),(17,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Chăm sóc cá nhân',NULL,'cham-soc-ca-nhan'),(18,'Danh mục mỹ phẩm','2022-12-13 13:47:51.000000',NULL,'CATEGORY',NULL,NULL,'Nước hoa',NULL,'nuoc-hoa'),(19,'Trạng thái đơn hàng','2022-12-13 13:47:51.000000',NULL,'BILL_STATUS',NULL,NULL,'Mới đặt',NULL,NULL),(20,'Trạng thái đơn hàng','2022-12-13 13:47:51.000000',NULL,'BILL_STATUS',NULL,NULL,'Đang xử lý',NULL,NULL),(21,'Trạng thái đơn hàng','2022-12-13 13:47:51.000000',NULL,'BILL_STATUS',NULL,NULL,'Thành công',NULL,NULL),(22,'Trạng thái đơn hàng','2022-12-13 13:47:51.000000',NULL,'BILL_STATUS',NULL,NULL,'Đã hủy',NULL,NULL),(23,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'BIODERMA',NULL,NULL),(24,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'LA ROCHE-POSAY',NULL,NULL),(25,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'Sunplay',NULL,NULL),(26,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'SHU UEMURA',NULL,NULL),(27,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'LANCÔME',NULL,NULL),(28,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'HAIRBURST',NULL,NULL),(29,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'TSUBAKI',NULL,NULL),(30,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'VASELINE',NULL,NULL),(31,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'HATOMUGI',NULL,NULL),(32,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'LANEIGE',NULL,NULL),(33,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'Oreal Professionnel',NULL,NULL),(34,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'EVOLUDERM',NULL,NULL),(35,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'LANEIGE',NULL,NULL),(36,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'Cocoon',NULL,NULL),(37,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'50 Megumi',NULL,NULL),(38,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'LANEIGE',NULL,NULL),(39,'Thương hiệu sản phẩm','2022-12-13 13:47:51.000000',NULL,'BRAND',NULL,NULL,'Remos',NULL,NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailcart`
--

DROP TABLE IF EXISTS `detailcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `detailcart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` float NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpquwcbew5trvvogdcc28i6mfh` (`id_cart`),
  KEY `FK9knlsvque8ohaxad77y66cfnd` (`id_product`),
  CONSTRAINT `FK9knlsvque8ohaxad77y66cfnd` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  CONSTRAINT `FKpquwcbew5trvvogdcc28i6mfh` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailcart`
--

LOCK TABLES `detailcart` WRITE;
/*!40000 ALTER TABLE `detailcart` DISABLE KEYS */;
INSERT INTO `detailcart` VALUES (1,1,129000,1,2),(2,1,129000,2,2),(3,1,370000,3,1),(4,1,559000,3,3),(5,1,3094000,3,4),(7,1,250000,3,7),(8,1,129000,4,2),(9,1,349000,4,11),(10,1,3094000,5,4);
/*!40000 ALTER TABLE `detailcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `favourite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acc` int NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15afausa0wbcfbjxy78jen8v` (`id_acc`),
  KEY `FKmofuap0uejsqjoqoysxfdktu` (`id_product`),
  CONSTRAINT `FK15afausa0wbcfbjxy78jen8v` FOREIGN KEY (`id_acc`) REFERENCES `accountinfo` (`id`),
  CONSTRAINT `FKmofuap0uejsqjoqoysxfdktu` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite`
--

LOCK TABLES `favourite` WRITE;
/*!40000 ALTER TABLE `favourite` DISABLE KEYS */;
INSERT INTO `favourite` VALUES (2,1,7),(3,1,10);
/*!40000 ALTER TABLE `favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date01` datetime(6) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `file_batch` varchar(1000) DEFAULT NULL,
  `file_extension` varchar(1000) DEFAULT NULL,
  `file_name` varchar(1000) DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `file_type` varchar(1000) DEFAULT NULL,
  `folder` varchar(1000) DEFAULT NULL,
  `iduser01` int DEFAULT NULL,
  `mime_type` varchar(1000) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','nuoc_tay_trang_bioderma.jpg',14,'Photo','img/product',NULL,'image/jpeg','Tẩy trang Bioderma'),(2,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','kem_chong_nang_LA ROCHE-POSAY.jpg',14,'Photo','img/product',NULL,'image/jpeg','Kem chống nắngLA ROCHE-POSAY'),(3,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','kem_chong_nang_sunplay.jpg',28,'Photo','img/product',NULL,'image/jpeg','Kem chống nắng Sunplay'),(4,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','son_li_SHU_UEMURA.jpg',21,'Photo','img/product',NULL,'image/jpeg','Son lì SHU UEMURA'),(5,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','nuoc_hoa_lancome.jpg',17,'Photo','img/product',NULL,'image/jpeg','Nước hoa Lancôme'),(6,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','bo_goi_xa_hairburst.jpg',25,'Photo','img/product',NULL,'image/jpeg','Bộ gội xả HAIRBURST'),(7,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','mat_na_toc_tsubaki.jpg',21,'Photo','img/product',NULL,'image/jpeg','Mặt nạ tóc'),(8,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','sua_duong_the_vaseline.jpg',21,'Photo','img/product',NULL,'image/jpeg','Sữa dưỡng thể Vaseline'),(9,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','sua_tam_hatomugi.jpg',14,'Photo','img/product',NULL,'image/jpeg','Sữa tắm Hatomugi'),(10,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','nuoc_hoa_pinker_bell.jpg',14,'Photo','img/product',NULL,'image/jpeg','Nước hoa Pinker Bell'),(11,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','mat_na_ngu_laneige.jpg',14,'Photo','img/product',NULL,'image/jpeg','Mặt Nạ Ngủ Laneige'),(12,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','dau_goi_l_oreal_professionnel-lam.jpg',14,'Photo','img/product',NULL,'image/jpeg','Dầu Gội LOréal Professionnel'),(13,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','son_son_shu_uemura.jpg',14,'Photo','img/product',NULL,'image/jpeg','Son Shu Uemura'),(14,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','nuoc_hoa_hong_bioderma.jpg',14,'Photo','img/product',NULL,'image/jpeg','Nước Hoa Hồng Bioderma'),(15,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','xit_khoang_evoluderm.jpg',14,'Photo','imgproduct',NULL,'image/jpeg','Xịt Khoáng Evoluderm'),(16,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','kem_chong_nang_MartiDerm.jpg',14,'Photo','img/product',NULL,'image/jpeg','Kem Chống Nắng MartiDerm'),(17,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','kem_lot_australis.jpg',14,'Photo','img/product',NULL,'image/jpeg','Kem Lót Australis'),(18,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','son_kem_maybelline.jpg',14,'Photo','img/product',NULL,'image/jpeg','Son Kem Maybelline'),(19,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','phan_nuoc_laneige.jpg',14,'Photo','img/product',NULL,'image/jpeg','Phấn Nước Laneige'),(20,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','dau-xa_buoi_cocoon.jpg',14,'Photo','img/product',NULL,'image/jpeg','Dầu Xả Bưởi Cocoon'),(21,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','bo_goi_xa_megumi.jpg',14,'Photo','img/product',NULL,'image/jpeg','Bộ Gội Xả 50 Megumi'),(22,NULL,'Hình ảnh của sản phẩm','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp','jpg','auto_nuoc_hoa_nam_gota.jpg',14,'Photo','img/product',NULL,'image/jpeg','Nước Hoa Nam Gota ');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date01` datetime(6) DEFAULT NULL,
  `date02` datetime(6) DEFAULT NULL,
  `description` longtext,
  `iduser01` int DEFAULT NULL,
  `iduser02` int DEFAULT NULL,
  `inventory` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `price` float NOT NULL,
  `price_sale` float DEFAULT NULL,
  `brand` int NOT NULL,
  `category` int DEFAULT NULL,
  `image` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfjt1tmfqgv7n770f93oev18uf` (`brand`),
  KEY `FKshty97ku1aiqaqxjr8r1etkmn` (`category`),
  KEY `FKrkpwde2wk07b9tgthcjurkvs4` (`image`),
  CONSTRAINT `FKfjt1tmfqgv7n770f93oev18uf` FOREIGN KEY (`brand`) REFERENCES `config` (`id`),
  CONSTRAINT `FKrkpwde2wk07b9tgthcjurkvs4` FOREIGN KEY (`image`) REFERENCES `media` (`id`),
  CONSTRAINT `FKshty97ku1aiqaqxjr8r1etkmn` FOREIGN KEY (`category`) REFERENCES `config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'2022-12-13 13:48:05.000000','Sensibio H2O được bào chế với độ pH sinh lý khoảng 5.5 tương tự như độ pH của làn da, do đó giúp nâng niu sự cân bằng về mặt sinh học - điều cần thiết để duy trì làn da khỏe mạnh. Bên cạnh đó, sản phẩm chứa thành phần nước tinh khiết, đạt chuẩn dược phẩm và một hợp chất bao gồm 3 loại đường mô phỏng sinh học có công dụng làm dịu và ngăn ngừa các phản ứng viêm. Việc lựa chọn cẩn thận các thành phần đảm bảo khả năng dung nạp hoàn hảo và loại bỏ bất kỳ nguy cơ gây tổn thương da nào của sản phẩm.',NULL,NULL,100,'Tẩy trang Bioderma',NULL,370000,NULL,21,15,1),(2,NULL,'2022-12-13 13:48:05.000000','Sunplay là thương hiệu thuộc tập đoàn Rohto-Mentholatum được thành lập từ năm 1899 tại Osaka, Nhật Bản. Qua hơn 100 năm có mặt trên thị trường, đến nay thương hiệu Rohto-Mentholatum đã phát triển và mở rộng việc kinh doanh trên cả 5 châu lục với 11 chi nhánh trên khắp thế giới, sở hữu một loạt thương hiệu con chuyên về lĩnh vực dược mỹ phẩm chăm sóc sức khỏe. ',NULL,NULL,97,'Kem chống nắng Sunplay',NULL,129000,NULL,23,15,3),(3,NULL,'2022-12-13 13:48:05.000000','Son Lì Shu Uemura Rouge Unlimited Matte 3g từ thương hiệu Shu Uemura của Nhật Bản là dòng son trang điểm môi cao cấp với sự kết hợp hoàn mỹ giữa chất son lì thượng hạng và kết cấu mịn nhẹ như nhung, cho sắc son được bền màu mà vẫn duy trì cảm giác thoải mái, nhẹ nhàng suốt ngày dài.',NULL,NULL,100,'Son lì SHU UEMURA',NULL,559000,NULL,24,16,4),(4,NULL,'2022-12-13 13:48:05.000000','Nước Hoa Nữ Lancôme La Vie Est Belle EDP là dòng sản phẩm nước hoa eau de parfum cho nữ ra đời trong mùa thu năm 2012 bởi thương hiệu cao cấp Lancôme của Pháp. Khái niệm hương thơm này tập trung ý tưởng về vẻ đẹp tự nhiên và giản dị, tự do từ các công ước và chọn lựa tầm nhìn cho hạnh phúc riêng của bạn. Nước hoa mang một phẩm chất triển vọng về cuộc sống và được lấy cảm hứng từ niềm vui trong những điều nhỏ nhặt.',NULL,NULL,99,'Nước hoa Lancôme',NULL,3094000,NULL,25,20,5),(5,NULL,'2022-12-13 13:48:05.000000','Bộ Dầu Gội & Dầu Xả Hỗ Trợ Mọc Tóc HAIRBURST Avocado & Coconut For Longer Stronger Hair là dòng sản phẩm chăm sóc tóc từ HAIRBURST - thương hiệu chăm sóc tóc nổi tiếng tại Anh, chứa các thành phần thiên nhiên giúp nuôi dưỡng cho mái tóc chắc khỏe sâu từ bên trong, kích thích tóc mọc nhanh và dài hơn, mang đến vẻ quyến rũ bồng bềnh cho mọi mái tóc.',NULL,NULL,100,'Bộ gội xả HAIRBURST',NULL,569000,NULL,26,17,6),(6,NULL,'2022-12-13 13:48:05.000000','Mặt Nạ Tóc Cao Cấp Phục Hồi Hư Tổn TSUBAKI Premium Repair Mask đến từ thương hiệu chăm sóc tóc nổi tiếng TSUBAKI Nhật Bản mang đến trải nghiệm dưỡng tóc chuẩn Salon mà không mất thời gian chờ đợi, mái tóc suôn mượt và mềm mại với các thành phần giàu dưỡng chất và công thức phục hồi tiên tiến vượt bậc',NULL,NULL,100,'Mặt Nạ Tóc Tsubaki','Japan',169000,NULL,27,17,7),(7,NULL,'2022-12-13 13:48:05.000000','Nước Hoa Pinker Bell Eau De Perfume 30ml là dòng nước hoa nữ đến từ thương hiệu nước hoa Pinker Bell của Hàn Quốc, với nồng độ tinh dầu 12 - 20% giúp độ lưu hương lên đến 6 tiếng, mùi hương đa dạng được xem là bản dupe của các hãng nước hoa nổi tiếng trên thế giới. Thiết kế sang trọng, tinh tế nhỏ gọn dễ mang theo bên mình.',NULL,NULL,100,'Nước hoa Pinker Bell',NULL,250000,NULL,28,20,8),(8,NULL,'2022-12-13 13:48:05.000000','Mặt Nạ Ngủ LANEIGE Water Sleeping Mask_EX 2021 là phiên bản cải tiến mới nhất của dòng mặt nạ ngủ nổi tiếng Water Sleeping Mask đến từ thương hiệu mỹ phẩm cao cấp Laneige của Hàn Quốc, với công nghệ Sleeping Micro Biome™ & Pro-Biotics Complex giúp dưỡng ẩm và tăng khả năng tự vệ của da, hỗ trợ phục hồi sự cân bằng hệ vi sinh trên da trong suốt đêm dài, giúp da tươi mới, căng tràn sức sống hơn mỗi khi thức dậy.',NULL,NULL,100,'Mặt Nạ Ngủ Laneige Dưỡng Ẩm & Tăng Khả Năng Tự Vệ Da','Korea',250000,NULL,30,14,11),(9,NULL,'2022-12-13 13:48:05.000000','Dầu Gội L Oréal Professionnel Serioxyl GlucoBoost Clarifying Shampoo đến từ thương hiệu chăm sóc tóc chuyên nghiệp L’Oréal Professionnel là giải pháp dành cho tình trạng tóc thưa - mảnh - rụng, giúp nhẹ nhàng làm sạch và loại bỏ tạp chất trên tóc và da đầu, đồng thời bổ sung Keratin nuôi dưỡng nang tóc từ sâu bên trong, mang đến mái tóc chắc khỏe và dày bồng bềnh hơn, bảo vệ tóc khỏi tác động từ môi trường.',NULL,NULL,100,'Dầu Gội L Oréal Professionnel Chăm Sóc Da Đầu Gàu','France',599000,NULL,31,14,12),(10,NULL,'2022-12-13 13:48:05.000000','[Phiên Bản Giới Hạn Tết] Son Nhiều Dưỡng Chất Shu Uemura Iron Reds Rouge Unlimited Central Lipstick là dòng son trang điểm môi cao cấp mới ra mắt từ thương hiệu Shu Uemura, thuộc bộ sưu tập Iron Reds phiên bản giới hạn dành riêng cho dịp Tết 2021. Với kết cấu son satin chứa nhiều chất dưỡng ẩm bao gồm dầu hoa trà quý giá & Ceramide cùng sắc đỏ chủ đạo thời thượng, Rouge Unlimited sẽ mang đến cho bạn đôi môi mềm mại, quyến rũ và màu sắc rạng rỡ suốt nhiều giờ liền.',NULL,NULL,100,'Son Shu Uemura Nhiều Dưỡng Chất','Japan',668000,NULL,24,14,13),(11,NULL,'2022-12-13 13:48:05.000000','Nước Hoa Hồng Dành Cho Da Nhạy Cảm Bioderma Sensibio Tonique là sản phẩm đến từ thương hiệu Bioderma nổi tiếng tại Pháp, với các chức năng chính là chăm sóc tăng cường độ ẩm cho da khỏe mạnh, nuôi dưỡng làn da giúp da trở nên tươi sáng hơn ngay sau khi sử dụng. Bênh cạnh đó, sản phẩm còn loại bỏ tạp chất dư thừa trên da, khôi phục và mang đến làn da rạng rỡ, đầy sức sống!',NULL,NULL,99,'Nước Hoa Hồng Bioderma ','France',349000,NULL,21,15,14),(12,NULL,'2022-12-13 13:48:05.000000','Xịt Khoáng Cung Cấp Nước Evoluderm Atomiseur Eau Pure thuộc thương hiệu Evoluderm được sản xuất, đóng gói tại Pháp đạt tiêu chuẩn GMP và ISO 9002. Với thành phần chính là nước tinh khiết nên xịt khoáng Evoluderm đảm bảo lành tính và không gây kích ứng với các loại da, thậm chí cả những người sở hữu làn da mỏng manh, nhạy cảm. Sản phẩm xịt khoáng có thể sử dụng cho cả mặt và toàn thân.',NULL,NULL,100,'Xịt Khoáng Evoluderm Dưỡng Ẩm Cấp Nước','France',135000,NULL,32,15,15),(13,NULL,'2022-12-13 13:48:05.000000','Kem Chống Nắng MartiDerm The Originals Proteos Screen SPF50+ Fluid Cream đến từ thương hiệu dược mỹ phẩm Martiderm của Tây Ban Nha là dòng kem chống nắng dạng lỏng dễ hấp thụ với chỉ số SPF 50+ giúp ngăn ngừa và sửa chữa các dấu hiệu lão hoá da sớm. Sản phẩm cung cấp màng lọc chống nắng phổ rộng chống lại các tia UVA, UVB, IR (hồng ngoại), HEV (ánh sáng xanh)',NULL,NULL,100,'Kem Chống Nắng MartiDerm',NULL,850000,NULL,33,16,16),(14,NULL,'2022-12-13 13:48:05.000000','Kem Chống Nắng MartiDerm The Originals Proteos Screen SPF50+ Fluid Cream đến từ thương hiệu dược mỹ phẩm Martiderm của Tây Ban Nha là dòng kem chống nắng dạng lỏng dễ hấp thụ với chỉ số SPF 50+ giúp ngăn ngừa và sửa chữa các dấu hiệu lão hoá da sớm. Sản phẩm cung cấp màng lọc chống nắng phổ rộng chống lại các tia UVA, UVB, IR (hồng ngoại), HEV (ánh sáng xanh)',NULL,NULL,100,'Sữa Chống Nắng Curél UV Protection Milk',NULL,355000,NULL,35,16,17),(15,NULL,'2022-12-13 13:48:05.000000','Dầu Gội Bưởi Cocoon Giảm Gãy Rụng & Kích Thích Mọc Tóc 310ml là dòng dầu gội đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với thiết kế đặc biệt công thức dịu nhẹ không chứa sulfate thân thiện cho mái tóc và da đầu. Dầu gội với thành phần kết hợp từ tinh dầu vỏ bưởi Việt Nam truyền thống, Vitamin B5 và hoạt chất dưỡng ẩm Xylishine™ mang đến khả năng làm sạch tóc, giảm gãy rụng và kích thích sự phát triển của tóc.',NULL,NULL,100,'Dầu Xả Bưởi Cocoon',NULL,131000,NULL,34,17,20),(16,NULL,'2022-12-13 13:48:05.000000','Bộ Đôi Gội Xả 50 Megumi Sạch Sâu & Thanh Mát là bộ chăm sóc tóc chuyên biệt dành cho mái tóc và da đầu dầu nhờn. Công thức chứa 50 thành phần dưỡng quý giá được chọn lọc kĩ lưỡng phù hợp với tình trạng tóc và da đầu trước ngưỡng tuổi 40, cung cấp nguồn dinh dưỡng tối ưu cho da đầu, giữ mái tóc dày và khỏe mạnh. Đồng thời, thành phần Betaine, tinh dầu bạc hà và chiết xuất các loại tảo biển giúp làm sạch sâu, mang lại cảm giác thanh mát và sảng khoái, hạn chế tiết bã nhờn, giúp tóc bồng bềnh và thoải mái suốt ngày dài.',NULL,NULL,100,'Bộ Gội Xả 50 Megumi ',NULL,355000,NULL,35,16,21),(17,NULL,'2022-12-13 13:48:05.000000','Urban Perfume For Men EDP (Vỏ hộp màu vàng): Hương thơm của Urban là sự giao hòa thú vị giữa con người và thời đại, mang đậm dấu ấn riêng biệt và phong thái thời thượng, hiện đại, phố thị với vị đắng nhẹ của chocolate nhấn nhá chút cay nồng của gia vị Á đông quyện chút vị mùi biển mát dịu.',NULL,NULL,100,'Nước Hoa Nam Gota',NULL,180000,NULL,35,20,22);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 18:18:17
