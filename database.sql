-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sarah
CREATE DATABASE IF NOT EXISTS `sarah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sarah`;

-- Dumping structure for table sarah.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.cart: ~5 rows (approximately)
DELETE FROM `cart`;
INSERT INTO `cart` (`id`, `count`, `product_id`, `user_id`) VALUES
	(26, 1, 64, 'TNphuchau3'),
	(27, 1, 54, 'TNphuchau3'),
	(30, 1, 58, 'TNphuchau1'),
	(31, 1, 56, 'mon'),
	(32, 1, 57, 'mon');

-- Dumping structure for table sarah.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.category: ~6 rows (approximately)
DELETE FROM `category`;
INSERT INTO `category` (`id`, `category_name`) VALUES
	(1, 'Son'),
	(2, 'Sữa rửa mặt'),
	(3, 'Thực phẩm chức năng'),
	(4, 'Kem chống nắng'),
	(5, 'Serum'),
	(7, 'Xịt khoáng');

-- Dumping structure for table sarah.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.order: ~58 rows (approximately)
DELETE FROM `order`;
INSERT INTO `order` (`id`, `address`, `booking_date`, `email`, `fullname`, `note`, `payment_method`, `phone`, `status`, `total`, `user_id`) VALUES
	(8, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 4, 'TNphuchau1'),
	(9, '47 Đường Lò Lu, Trường Thạnh, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'f', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(10, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(11, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(12, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(13, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(14, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(15, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(16, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(17, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(18, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(19, '', '2023-05-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 21, 'TNphuchau1'),
	(20, '', '2023-05-17', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(21, '', '2023-05-17', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(22, '', '2023-05-18', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(23, '', '2023-05-18', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(24, '', '2023-05-22', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(25, '', '2023-05-22', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(26, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(27, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(28, '', '2023-05-27', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(29, '', '2023-05-27', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(30, '', '2023-05-29', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(31, '', '2023-05-29', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(32, '', '2023-05-29', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(33, '', '2023-05-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(34, '', '2023-05-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(35, '', '2023-05-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 1, 'TNphuchau1'),
	(36, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(37, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(38, '', '2023-06-07', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 1000000, 'TNphuchau1'),
	(39, '', '2023-06-08', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 25000, 'TNphuchau1'),
	(40, '', '2023-06-08', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 25000, 'TNphuchau1'),
	(41, '', '2023-06-08', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 25000, 'TNphuchau1'),
	(42, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(43, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(44, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(45, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(46, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(47, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(48, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(49, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(50, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(51, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(52, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(53, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(54, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(55, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(56, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(57, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(58, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(59, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(60, '', '2023-06-10', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 30000, 'TNphuchau1'),
	(61, '1502/22', '2023-06-11', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 304000, 'TNphuchau1'),
	(62, '1502/22', '2023-06-11', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 250000, 'TNphuchau1'),
	(63, '1502/22', '2023-06-11', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 850000, 'TNphuchau1'),
	(64, '1502/22', '2023-06-11', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 359000, 'TNphuchau1'),
	(65, '47/22 lò lưu', '2023-06-11', 'hang08hb@gmail.com', 'Hằng', '', 'Thanh toán khi nhận hàng', '0868781832', 'Pending', 1054000, 'mon');

-- Dumping structure for table sarah.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.order_item: ~6 rows (approximately)
DELETE FROM `order_item`;
INSERT INTO `order_item` (`id`, `count`, `order_id`, `product_id`) VALUES
	(41, 1, 61, 56),
	(42, 1, 62, 55),
	(43, 1, 63, 61),
	(44, 1, 64, 58),
	(45, 1, 65, 56),
	(46, 1, 65, 57);

-- Dumping structure for table sarah.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `is_selling` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.product: ~13 rows (approximately)
DELETE FROM `product`;
INSERT INTO `product` (`id`, `created_at`, `description`, `is_active`, `is_selling`, `price`, `product_name`, `quantity`, `category_id`) VALUES
	(54, '2023-06-10', 'Gel Rửa Mặt Cosrx Tràm Trà, 0.5% BHA Có Độ pH Thấp là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Cosrx của Hàn Quốc, với độ pH lý tưởng 4.5 - 5.5 sản phẩm an toàn và dịu nhẹ trên mọi làn da ngay cả làn da nhạy cảm và da mụn. Gel rửa mặt chứa 0,5% BHA tự ', 1, 1, 120000, 'Gel Rửa Mặt Cosrx', 100, 2),
	(55, '2023-06-10', 'Sữa Rửa Mặt Cerave Sạch Sâu là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Cerave của Mỹ, với sự kết hợp của ba Ceramides thiết yếu, Hyaluronic Acid sản phẩm giúp làm sạch và giữ ẩm cho làn da mà không ảnh hưởng đến hàng rào bảo vệ da mặt và cơ thể.', 1, 1, 250000, 'Sữa Rửa Mặt CeraVe', 99, 1),
	(56, '2023-06-10', 'Son Thỏi Lì 3CE Vỏ Trong Suốt 3.5g là sản phẩm son môi đến từ thương hiệu mỹ phẩm 3CE của Hàn Quốc, kết cấu son mềm mại và nhẹ môi cùng sắc tố cao giúp lên màu chuẩn sắc ngay từ lần đầu tiên. Sản phẩm với thiết kế vỏ trong suốt độc đáo, lạ mắt và ấn tượng', 1, 1, 304000, 'Son Thỏi Lì 3CE ', 98, 1),
	(57, '2023-06-10', 'Son Lì Shu Uemura Rouge Unlimited Matte 3g từ thương hiệu Shu Uemura của Nhật Bản là dòng son trang điểm môi cao cấp với sự kết hợp hoàn mỹ giữa chất son lì thượng hạng và kết cấu mịn nhẹ như nhung, cho sắc son được bền màu mà vẫn duy trì cảm giác thoải m', 1, 1, 750000, 'Son li Uemurra Matte', 99, 1),
	(58, '2023-06-10', 'Timeless Vitamin B5 Serum là sản phẩm tinh chất (serum) dưỡng da đa công dụng đến từ thương hiệu Timeless nổi tiếng của Mỹ, với công thức lỏng nhẹ, không chứa dầu, giúp làm dịu và hỗ trợ phục hồi làn da đang gặp vấn đề. Công thức chứa thành phần Vitamin B', 1, 1, 359000, 'Serum Timeless', 99, 5),
	(59, '2023-06-10', 'Serum Caryophy Portulaca Ampoule là sản phẩm serum dành cho da mụn đến từ thương hiệu mỹ phẩm Caryophy của Hàn Quốc, mang đến công dụng 3 trong 1: giảm mụn, mờ thâm và hỗ trợ se khít lỗ chân lông. Công thức chứa các thành phần 100% từ thiên nhiên, trong đ', 1, 1, 449000, 'Serum Caryophy', 100, 5),
	(60, '2023-06-10', 'Blossomy là dòng sản phẩm thực phẩm bảo vệ sức khỏe dạng nước uống thuộc Rohto Health Science – nhãn hiệu thực phẩm chức năng chăm sóc sức khỏe của công ty Rohto-Mentholatum Việt Nam dựa trên nguyên lý kết hợp tinh hoa thiên nhiên cùng khoa học hiện đại N', 1, 1, 398000, 'Thực Phẩm Bảo Vệ Sức Khỏe Blossomy Nghệ Collagen', 100, 3),
	(61, '2023-06-10', 'Collagen Nước DHC Beauty 7000 Plus đến từ thương hiệu thực phẩm chức năng DHC nổi tiếng của Nhật Bản là giải pháp lý tưởng dành cho những làn da đang có dấu hiệu lão hoá như khô ráp, chảy xệ, kém đàn hồi. Sản phẩm ứng dụng công nghệ độc quyền Beauty Plus ', 1, 1, 850000, 'Nước Uống Collagen DHC Dưỡng Da Căng Mịn, Ngừa Lão Hoá 10 Lọ Collagen Beauty 7000 Plus', 99, 3),
	(62, '2023-06-10', 'Bộ Đôi Chống Nắng Đa Chức Năng Anessa Perfect UV Sunscreen Skincare Milk N SPF 50+ PA++++ Trial Set C 2022 Edition mới từ thương hiệu Anessa (thuộc tập đoàn Shiseido) cung cấp chỉ số chống nắng cao SPF 50+ PA++++ giúp bảo vệ da chống lại tia cực tím cùng ', 1, 1, 571000, 'Bộ Đôi Anessa Sữa Chống Nắng Kiềm Dầu 60ml + Serum Chống Nắng 6ml', 100, 4),
	(63, '2023-06-10', 'Với khí hậu oi bức ở Việt Nam, đặc biệt là trong những ngày hè tiết trời nắng nóng, ánh nắng chói chang, bỏng rát như thế này thì việc sử dụng kem chống nắng khi ra ngoài là điều vô cùng cần thiết. Thoa kem chống nắng là một trong những bước quan trọng tr', 1, 1, 82000, 'Sữa Chống Nắng Sunplay ', 100, 4),
	(64, '2023-06-10', 'Xịt Khoáng Cocoon Nghệ Hưng Yên Giúp Sáng Da 130ml là sản phẩm xịt khoáng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với chiết xuất từ củ nghệ, muối khoáng, enzym SOD, EGCG và các axit amin giúp chống oxy hoá, làm sáng, mờ vết thâm đồng thời làm tăng', 1, 1, 192000, 'Xịt Khoáng Cocoon Nghệ Hưng Yên Giúp Sáng Da 130ml Hung Yen Turmeric Face Mist', 100, 7),
	(65, '2023-06-10', 'Dưỡng Chất Khoáng Cô Đặc Hỗ Trợ Phục Hồi, Bảo Vệ Da Vichy Mineral 89 Serum chứa đến 89% khoáng Vichy cô đặc với 15 khoáng chất quý báu kết hợp hoàn hảo cùng Hyaluronic Acid (HA) vốn nổi tiếng với khả năng giữ nước và phục hồi làn da ưu việt, phân tử HA có', 1, 1, 996000, 'Bộ Sản Phẩm Vichy Hỗ Trợ Phục Hồi & Cấp Ẩm Da 2 Món', 100, 7),
	(66, '2023-06-10', 'Sữa Rửa Mặt Cetaphil Gentle Skin Cleanser phiên bản mới ra mắt năm 2022 từ thương hiệu Cetaphil với công thức khoa học mới cho làn da nhạy cảm, giúp làm sạch da, loại bỏ bụi bẩn, phù hợp cho mọi loại da, không làm khô da và duy trì hàng rào bảo vệ da suốt', 1, 1, 329000, 'Sữa Rửa Mặt Cetaphil ', 100, 2);

-- Dumping structure for table sarah.product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.product_image: ~15 rows (approximately)
DELETE FROM `product_image`;
INSERT INTO `product_image` (`id`, `url_image`, `product_id`) VALUES
	(146, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686414338/s4haompegztjsygmbasa.jpg', 54),
	(147, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686414909/s5hl98d8mpqhxgnqr7vl.jpg', 55),
	(148, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686414997/osu5t0yfrvo7wh8cdnlh.jpg', 56),
	(149, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415133/ugnohyfsv2myzla02amm.jpg', 57),
	(150, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415198/diiqeyy45zrjnl6flwul.jpg', 58),
	(151, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415246/kvzk0otwey2zo0zaz3rk.jpg', 59),
	(152, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415329/bc2iflflk6lqseqeezya.jpg', 60),
	(153, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415402/koig0w77hrudufrpkrus.jpg', 61),
	(154, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415474/ackscxwdcth8ftdws5zf.jpg', 62),
	(155, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415520/cyieoynfkiz7pyxjglvh.jpg', 63),
	(156, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415676/cdcyimctehk77f0y9xec.jpg', 64),
	(157, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686415878/e1jbv9ojriqzwywleoiw.jpg', 65),
	(158, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686416127/js4ot9yxhf8lnucetm1h.jpg', 66),
	(159, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686416282/snva0cvzrrwedcbvji6a.jpg', 54),
	(160, 'http://res.cloudinary.com/dxq4bknfm/image/upload/v1686416303/ohkwehevbz1wvjjljyzq.jpg', 54);

-- Dumping structure for table sarah.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.user: ~6 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `avatar`, `email`, `password`, `phone_number`, `role`, `user_name`) VALUES
	('admin', '/web/images/hoa.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', NULL, 'admin', 'Trần Nguyễn Phúc Hậu'),
	('mon', '/web/images/hoa.png', 'hang08hb@gmail.com', 'MQ==', NULL, 'user', 'Hằng'),
	('mon1', '/web/images/hoa.png', 'hang08hb@gmail.com', 'MQ==', NULL, 'user', 'Hằng'),
	('TNphuchau', '/web/images/hoa.png', 'phuchauTN0312@gmail.com', 'MQ==', NULL, 'admin\r\n', 'Trần Nguyễn Phúc Hậu'),
	('TNphuchau1', 'http://res.cloudinary.com/drlroexjl/image/upload/v1685879751/hwnqzv3pkod60g27i6bs.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', '0707396920', 'user', 'Trần Nguyễn Phúc Hậu'),
	('TNphuchau3', '/web/images/hoa.png', 'phuchauTN0312@gmail.com', 'MQ==', NULL, 'user', 'Trần Nguyễn Phúc Hậu');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
