CREATE DATABASE `Jolie`;

USE `Jolie`;

CREATE TABLE `Config` (
  `id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
  `groupcode` VARCHAR(500) COLLATE utf8_unicode_ci DEFAULT NULL, /* EX: ROLE, CATEGORY, SEX, TYPE, BRAND, PAYMENTMETHOD, SHIPPINGMETHOD, BILL STATUS */
  `code` VARCHAR(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` VARCHAR(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` VARCHAR(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` VARCHAR(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iduser01` INT(11) DEFAULT NULL, /* creator */
  `iduser02` INT(11) DEFAULT NULL, /* editor*/ 
  `date01` DATETIME DEFAULT NULL, /* date create */
  `date02` DATETIME DEFAULT NULL /* date edit */
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `Account` (
	`username` VARCHAR(100) PRIMARY KEY,
	`password` VARCHAR(100) ,
	`type` INT(11) ZEROFILL NOT NULL,
	`role` INT(11) ZEROFILL NOT NULL,
	`date01` DATETIME DEFAULT NULL,  
	`date02` DATETIME DEFAULT NULL,  
    CONSTRAINT `type_fk` FOREIGN KEY (`type`) REFERENCES `Config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `role_fk` FOREIGN KEY (`role`) REFERENCES `Config` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `AccountInfo` (
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`username` VARCHAR(100) NOT NULL,
	`name` VARCHAR(1000) COLLATE utf8_unicode_ci NOT NULL,
	`birth` DATE,
	`sex` INT(11) ZEROFILL,
	`address` VARCHAR(1000) COLLATE utf8_unicode_ci,
	`date02` DATETIME DEFAULT NULL, -- date edit
	CONSTRAINT `username_fk` FOREIGN KEY (`username`) REFERENCES `Account` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `sex_fk` FOREIGN KEY (`sex`) REFERENCES `Config`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 ;


CREATE TABLE `Media` (
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`title` VARCHAR(1000) COLLATE utf8_unicode_ci,
	`description` VARCHAR(1000) COLLATE utf8_unicode_ci, -- alt
	`fileName` VARCHAR(1000) COLLATE utf8_unicode_ci,
	`fileType` VARCHAR(1000),
	`fileExtension` VARCHAR(1000),
	`mimeType` VARCHAR(1000),
	`fileSize` INT(11),
	`folder` VARCHAR(1000),
	`fileBatch` VARCHAR(1000),
	`iduser01` INT(11) DEFAULT NULL,  -- creator
	`date01` DATETIME DEFAULT NULL  -- date create
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `Product` (
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(500) NOT NULL,
	`brand` INT(11) ZEROFILL NOT NULL,
	`origin` VARCHAR(100) DEFAULT  NULL,
	`image` INT(11) ZEROFILL,
	`description` MEDIUMTEXT,
	`category` INT(11) ZEROFILL,
	`price` FLOAT NOT NULL,
	`priceSale` FLOAT DEFAULT NULL,
	`inventory` INT(11) NOT NULL,
	`iduser01` INT(11) DEFAULT NULL, -- creator
	`iduser02` INT(11) DEFAULT NULL, -- editor
	`date01` DATETIME DEFAULT NULL, -- date create
	`date02` DATETIME DEFAULT NULL, -- date edit
	CONSTRAINT `brand_fk` FOREIGN KEY (`brand`) REFERENCES `Config`(`id`),
	CONSTRAINT `image_fk` FOREIGN KEY (`image`) REFERENCES `Media`(`id`),
	CONSTRAINT `category_fk` FOREIGN KEY (`category`) REFERENCES `Config`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 ;

CREATE TABLE `Review` (
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idProduct` INT(11) ZEROFILL NOT NULL,
	`idUser` INT(11) ZEROFILL NOT NULL,
	`rating` INT(11) NOT NULL,
	`comment` VARCHAR(500),
	`image` INT(11),
	`date01` DATETIME DEFAULT NULL ,-- date create
	CONSTRAINT `idProduct_fk_1` FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`),
	CONSTRAINT `idUser_fk_1` FOREIGN KEY (`idUser`) REFERENCES `AccountInfo`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Cart`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idUser` INT(11) ZEROFILL NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	`status` INT(11) DEFAULT 0,  -- 0: giỏ hàng, 1: hóa đơn
	CONSTRAINT `idUser_fk_2` FOREIGN KEY (`idUser`) REFERENCES `AccountInfo`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `DetailCart`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idCart` INT(11) ZEROFILL NOT NULL,
	`idProduct` INT(11) ZEROFILL NOT NULL,
	`quantity` INT(11) NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	CONSTRAINT `idCart_fk_1` FOREIGN KEY (`idCart`) REFERENCES `Cart`(`id`),
	CONSTRAINT `idProduct_fk_2` FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BillInfo`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idCart` INT(11)  ZEROFILL NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	`shippingMethod` INT(11) ZEROFILL NOT NULL,
	`shippingAddress` VARCHAR(200) NOT NULL,
	`recipientName` VARCHAR(200) NOT NULL,
	`recipientPhone` VARCHAR(200) NOT NULL,
	`paymentMethod` INT(11) ZEROFILL NOT NULL,
	`datePayment` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`status` INT(11) NOT NULL,
	CONSTRAINT `idCart_fk_2` FOREIGN KEY (`idCart`) REFERENCES `Cart`(`id`),
	CONSTRAINT `paymentMethod_fk` FOREIGN KEY (`paymentMethod`) REFERENCES `Config`(`id`),
	CONSTRAINT `shippingMethod_fk` FOREIGN KEY (`shippingMethod`) REFERENCES `Config`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- Insert value--
`date02` DATETIME DEFAULT NULL, -- date edit
	CONSTRAINT `brand_fk` FOREIGN KEY (`brand`) REFERENCES `Config`(`id`),
	CONSTRAINT `image_fk` FOREIGN KEY (`image`) REFERENCES `Media`(`id`),
	CONSTRAINT `category_fk` FOREIGN KEY (`category`) REFERENCES `Config`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 ;

CREATE TABLE `Review` (
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idProduct` INT(11) ZEROFILL NOT NULL,
	`idUser` INT(11) ZEROFILL NOT NULL,
	`rating` INT(11) NOT NULL,
	`comment` VARCHAR(500),
	`image` INT(11),
	`date01` DATETIME DEFAULT NULL ,-- date create
	CONSTRAINT `idProduct_fk_1` FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`),
	CONSTRAINT `idUser_fk_1` FOREIGN KEY (`idUser`) REFERENCES `AccountInfo`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Cart`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idUser` INT(11) ZEROFILL NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	`status` INT(11) DEFAULT 0,  -- 0: giỏ hàng, 1: hóa đơn
	CONSTRAINT `idUser_fk_2` FOREIGN KEY (`idUser`) REFERENCES `AccountInfo`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `DetailCart`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idCart` INT(11) ZEROFILL NOT NULL,
	`idProduct` INT(11) ZEROFILL NOT NULL,
	`quantity` INT(11) NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	CONSTRAINT `idCart_fk_1` FOREIGN KEY (`idCart`) REFERENCES `Cart`(`id`),
	CONSTRAINT `idProduct_fk_2` FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BillInfo`
(
	`id` INT(11) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`idCart` INT(11)  ZEROFILL NOT NULL,
	`totalPrice` FLOAT NOT NULL,
	`shippingMethod` INT(11) ZEROFILL NOT NULL,
	`shippingAddress` VARCHAR(200) NOT NULL,
	`recipientName` VARCHAR(200) NOT NULL,
	`recipientPhone` VARCHAR(200) NOT NULL,
	`paymentMethod` INT(11) ZEROFILL NOT NULL,
	`datePayment` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`status` INT(11) NOT NULL,
	CONSTRAINT `idCart_fk_2` FOREIGN KEY (`idCart`) REFERENCES `Cart`(`id`),
	CONSTRAINT `paymentMethod_fk` FOREIGN KEY (`paymentMethod`) REFERENCES `Config`(`id`),
	CONSTRAINT `shippingMethod_fk` FOREIGN KEY (`shippingMethod`) REFERENCES `Config`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
-- Insert value--
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('ROLE', 'Quyền','Admin',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('ROLE', 'Quyền','Khách Hàng',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('SEX', 'Giới tính','Nam',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('SEX', 'Giới tính','Nữ',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('TYPE', 'Loại tài khoản','Jolie',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('TYPE', 'Loại tài khoản','Facebook',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('TYPE', 'Loại tài khoản','Google',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Mỹ phẩm High-end','my-pham-hidh-end', NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Chăm sóc da mặt','cham-soc-da-mat', NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Trang điểm','trang-diem',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Chăm sóc tóc và Da đầu','cham-soc-toc-va-da-dau',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Chăm sóc cơ thể','cham-soc-co-the',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Chăm sóc cá nhân','cham-soc-ca-nhan',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `value`, `date01`) VALUES ('CATEGORY', 'Danh mục mỹ phẩm','Nước hoa', 'nuoc-hoa',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','BIODERMA',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','LA ROCHE-POSAY',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','Sunplay',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','SHU UEMURA',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','LANCÔME',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','HAIRBURST',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','TSUBAKI',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','VASELINE',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BRAND', 'Thương hiệu sản phẩm','HATOMUGI',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('PAYMENTMETHOD', 'Phương thức thanh toán','Tiền mặt',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('PAYMENTMETHOD', 'Phương thức thanh toán','E-Barking',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('SHIPPINGMETHOD', 'Phương thức vận chuyển','Hỏa tốc',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('PAYMENTMETHOD', 'Phương thức vận chuyển','48h',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BILL_STATUS', 'Trạng thái đơn hàng','Chưa đặt hàng',NOW());
INSERT INTO `Config`( `groupcode`, `code`, `name`, `date01`) VALUES ('BILL_STATUS', 'Trạng thái đơn hàng','Đã đặt hàng',NOW());
---------------------------
INSERT INTO `Account` (`username`, `password`, `type`, `role`, `date01`) VALUES ('ADMIN','1234567',5,1,NOW() );
INSERT INTO `Account` (`username`, `password`, `type`, `role`, `date01`) VALUES ('NguyetQue','1234321@',5,2,NOW() );
INSERT INTO `Account` (`username`, `password`, `type`, `role`, `date01`) VALUES ('PhuongThao','1234321@',5,2,NOW() );
INSERT INTO `Account` (`username`, `password`, `type`, `role`, `date01`) VALUES ('MyDuyen','1234321@',5,2,NOW() );
INSERT INTO `Account` (`username`, `password`, `type`, `role`, `date01`) VALUES ('MinhThu','1234321@',5,2,NOW() );
--------------------------
INSERT `AccountInfo` (`username`, `name`, `birth`, `sex`, `address`) VALUES ('NguyetQue', 'Phạm Thị Nguyệt Quế', '2002-6-14',4,'Quảng Ngãi' );
INSERT `AccountInfo` (`username`, `name`, `birth`, `sex`, `address`) VALUES ('PhuongThao', 'Nguyễn Thanh Phương Thảo', '2002-6-21',4,'Đồng Nai');
INSERT `AccountInfo` (`username`, `name`, `birth`, `sex`, `address`) VALUES ('MyDuyen', 'Dư Mỹ Duyên', '2002-7-27',4,'KumTum');
INSERT `AccountInfo` (`username`, `name`, `birth`, `sex`, `address`) VALUES ('MinhThu', 'Võ Nguyễn Minh Thư', '2002-12-25',4,'KumTum');
--------------------------
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Tẩy trang Bioderma', 'Hình ảnh của sản phẩm', 'nuoc_tay_trang_bioderma.jpg', 'Photo', 'jpg', 'image/jpeg', '13.8', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp', default, default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Kem chống nắngLA ROCHE-POSAY', 'Hình ảnh của sản phẩm', 'kem_chong_nang_LA ROCHE-POSAY.jpg', 'Photo', 'jpg', 'image/jpeg', '13.5', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Kem chống nắng Sunplay', 'Hình ảnh của sản phẩm', 'kem_chong_nang_sunplay.jpg', 'Photo', 'jpg', 'image/jpeg', '28.1', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Son lì SHU UEMURA', 'Hình ảnh của sản phẩm', 'son_li_SHU_UEMURA.jpg', 'Photo', 'jpg', 'image/jpeg', '21.3', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Nước hoa Lancôme', 'Hình ảnh của sản phẩm', 'nuoc_hoa_lancome.jpg', 'Photo', 'jpg', 'image/jpeg', '17', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Bộ gội xả HAIRBURST', 'Hình ảnh của sản phẩm', 'bo_goi_xa_hairburst.jpg', 'Photo', 'jpg', 'image/jpeg', '25', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Mặt nạ tóc', 'Hình ảnh của sản phẩm', 'mat_na_toc_tsubaki.jpg', 'Photo', 'jpg', 'image/jpeg', '21.2', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Sữa dưỡng thể Vaseline', 'Hình ảnh của sản phẩm', 'sua_duong_the_vaseline.jpg', 'Photo', 'jpg', 'image/jpeg', '21.1', 'img/product','D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Sữa tắm Hatomugi', 'Hình ảnh của sản phẩm', 'sua_tam_hatomugi.jpg', 'Photo', 'jpg', 'image/jpeg', '14.3', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
INSERT INTO `Media` (`title`, `description`, `file_name`, `file_type`, `file_extension`, `mime_type`, `file_size`, `folder`, `file_batch`, `iduser01`, `date01`) VALUES ('Nước hoa Pinker Bell', 'Hình ảnh của sản phẩm', 'nuoc_hoa_pinker_bell.jpg', 'Photo', 'jpg', 'image/jpeg', '14.3', 'img/product', 'D:/SPKT/Cong_nghe_phan_mem/PROJECT/JolieWeb/src/main/webapp',default,default);
---------------------------------
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Tẩy trang Bioderma',15,default,1,default,10,370000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Kem chống nắngLA ROCHE-POSAY',16,'France',2,default,9,393000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Kem chống nắng Sunplay',17,default,3,default,9,129000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Son lì SHU UEMURA',18,default,4,default,10,559000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Nước hoa Lancôme',19,default,5,default,14,3094000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Bộ gội xả HAIRBURST',20,default,6,default,11,569000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Mặt Nạ Tóc Tsubaki',21,'Japan',7,default,11,169000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Nước hoa Pinker Bell',19,default,8,default,14,250000,100, Now() );
Insert INTO `Product` (`name` , `brand`, `origin`, `image`, `description`, `category`, `price`, `inventory`, `date02` ) VALUES ('Mặt Nạ Tóc Tsubaki',21,'Japan',7,default,11,169000,100, Now() );
