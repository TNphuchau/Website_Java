-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
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
DROP DATABASE IF EXISTS `sarah`;
CREATE DATABASE IF NOT EXISTS `sarah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sarah`;

-- Dumping structure for table sarah.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.cart: ~2 rows (approximately)
INSERT INTO `cart` (`id`, `count`, `product_id`, `user_id`) VALUES
	(54, 1, 63, 'mon'),
	(56, 1, 56, 'mon');

-- Dumping structure for table sarah.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.category: ~6 rows (approximately)
INSERT INTO `category` (`id`, `category_name`) VALUES
	(1, 'Son'),
	(2, 'Sữa rửa mặt'),
	(3, 'Thực phẩm chức năng'),
	(4, 'Kem chống nắng'),
	(5, 'Serum'),
	(7, 'Xịt khoáng'),
	(8, 'Dưỡng da');

-- Dumping structure for table sarah.order
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `email` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `user_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.order: ~94 rows (approximately)
INSERT INTO `order` (`id`, `address`, `booking_date`, `email`, `fullname`, `note`, `payment_method`, `phone`, `status`, `total`, `user_id`) VALUES
	(8, '', '2023-05-24', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 4, 'TNphuchau1'),
	(9, '47/22', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'f', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(10, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(11, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(12, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(13, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(14, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(15, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(16, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with momo', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(17, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(18, '', '2023-05-25', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 19, 'TNphuchau1'),
	(19, '', '2023-06-02', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 21, 'TNphuchau1'),
	(20, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(21, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(22, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(23, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(24, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(25, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(26, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(27, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(28, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(29, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(30, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(31, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(32, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(33, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(34, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 5000, 'TNphuchau1'),
	(35, '', '2023-06-04', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 1, 'TNphuchau1'),
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
	(66, 'as', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 404000, 'TNphuchau1'),
	(67, 'd', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 404000, 'TNphuchau1'),
	(68, 'd', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 404000, 'TNphuchau1'),
	(69, 'jh', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 404000, 'TNphuchau1'),
	(70, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 404000, 'TNphuchau1'),
	(71, 'ed', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(72, 'd', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(73, 'a', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(74, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(75, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(76, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(77, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(78, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(79, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment on delivery', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(80, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(81, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(82, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(83, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(84, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(85, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(86, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(87, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(88, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(89, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(90, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(91, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(92, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(93, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(94, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(95, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(96, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(97, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(98, '1502/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1'),
	(99, '47/22 ', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Vui lòng mua gì đó', 'Payment with momo', '0707396920', 'Pending', 424000, 'TNphuchau1'),
	(100, '47/22', '2023-06-16', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0707396920', 'Pending', 424000, 'TNphuchau1'),
	(101, '111', '2023-06-19', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', '', 'Payment with vnpay', '0909737573', 'Pending', 82000, 'mon'),
	(102, '1502/22', '2023-08-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Vui lòng mua gì đó', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(103, '1502/22', '2023-08-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Vui lòng mua gì đó', 'Payment with vnpay', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(104, '1502/22', '2023-08-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Hằng đẹp gái ', 'Payment with vnpay', '0707396920', 'Pending', 82000, 'TNphuchau1'),
	(105, '1502/22', '2023-08-30', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Hau dep trai', 'Payment with vnpay', '0707396920', 'Pending', 202000, 'TNphuchau1'),
	(106, '1502/22', '2024-02-29', 'phuchauTN0312@gmail.com', 'Trần Nguyễn Phúc Hậu', 'Che tên', 'Thanh toán khi nhận hàng', '0707396920', 'Pending', 120000, 'TNphuchau1');

-- Dumping structure for table sarah.order_item
DROP TABLE IF EXISTS `order_item`;
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.order_item: ~54 rows (approximately)
INSERT INTO `order_item` (`id`, `count`, `order_id`, `product_id`) VALUES
	(41, 1, 51, 56),
	(42, 1, 52, 55),
	(43, 1, 53, 61),
	(44, 1, 54, 58),
	(45, 1, 55, 56),
	(46, 1, 55, 57),
	(47, 1, 56, 56),
	(48, 1, 57, 55),
	(49, 1, 58, 61),
	(50, 1, 59, 58),
	(51, 1, 60, 56),
	(52, 1, 49, 57),
	(53, 2, 66, 63),
	(54, 2, 66, 54),
	(55, 2, 67, 63),
	(56, 2, 67, 54),
	(57, 2, 68, 63),
	(58, 2, 68, 54),
	(59, 2, 69, 63),
	(60, 2, 69, 54),
	(61, 2, 70, 63),
	(62, 2, 70, 54),
	(63, 1, 71, 63),
	(64, 1, 72, 63),
	(65, 1, 73, 63),
	(66, 1, 74, 63),
	(67, 1, 75, 63),
	(68, 1, 76, 63),
	(69, 1, 77, 63),
	(70, 1, 78, 63),
	(71, 1, 79, 63),
	(72, 1, 80, 54),
	(73, 1, 81, 54),
	(74, 1, 82, 54),
	(75, 1, 83, 54),
	(76, 1, 84, 54),
	(77, 1, 85, 54),
	(78, 1, 86, 54),
	(79, 1, 87, 54),
	(80, 1, 88, 54),
	(81, 1, 89, 54),
	(82, 1, 90, 54),
	(83, 1, 91, 54),
	(84, 1, 92, 54),
	(85, 1, 93, 54),
	(86, 1, 94, 54),
	(87, 1, 95, 54),
	(88, 1, 96, 54),
	(89, 1, 97, 54),
	(90, 1, 98, 54),
	(91, 1, 99, 56),
	(92, 1, 99, 54),
	(93, 1, 102, 63),
	(94, 1, 106, 54);

-- Dumping structure for table sarah.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `is_selling` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.product: ~13 rows (approximately)
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
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.product_image: ~0 rows (approximately)
INSERT INTO `product_image` (`id`, `url_image`, `product_id`) VALUES
	(146, 'https://media.hcdn.vn/wysiwyg/minhchau/gel-rua-mat-cosrx-tram-tra-0-5-bha-co-do-ph-thap-150ml-1.jpg', 54),
	(147, 'https://product.hstatic.net/200000117693/product/erave_sach_sau_cho_da_thuong_den_da_dau_foaming_cleanser_236ml_-_front_9f3940d1d30443199e5a736a66ca6f83_master.jpg', 55),
	(148, 'https://gomimall.vn/cdn/shop/products/2022-12-16T06_57_50.198Z-Focus_20on_20me_8c4be668-9595-4ed4-b951-53890b512d0e.jpg?v=1689653099', 56),
	(149, 'https://product.hstatic.net/200000230227/product/image_br_785_1_son_thoi.jpg_ddef80d3b59f4c7e87888c57cdbc475f_master.jpg', 57),
	(150, 'https://bizweb.dktcdn.net/100/193/981/products/review-timeless-vitamin-b5-serum-30ml-chinh-hang.jpg?v=1685086360130', 58),
	(151, 'https://media.hasaki.vn/wysiwyg/HaNguyen/serum-caryophy-giam-mun-mo-tham-se-lo-chan-long-10ml-2.jpg', 59),
	(152, 'https://product.hstatic.net/1000006063/product/61c7d44542a4674e075cff950460be32_quot_5757568efb1e4cdf9e3266bc81121724.jpg', 60),
	(153, 'https://bizweb.dktcdn.net/100/382/633/products/nuoc-uong-dhc-collagen-beauty-7000-plus.png?v=1642848949393', 61),
	(154, 'https://bizweb.dktcdn.net/thumb/grande/100/382/633/products/set-anessa-sua-chong-nang-kiem-dau-60ml-serum-chong-nang-6ml-1648606517-img-358x358-843626-fit-center.jpg?v=1651372357690', 62),
	(155, 'https://cdn.nhathuoclongchau.com.vn/unsafe/800x0/filters:quality(95)/https://cms-prod.s3-sgn09.fptcloud.com/kem_chong_nang_sunplay_super_block_spf_81_1_a3a9e6955e.jpg', 63),
	(156, 'https://image.cocoonvietnam.com/uploads/Artboard_16_2d4e366728.jpg', 64),
	(157, 'https://ibeautyshop.vn/wp-content/uploads/2020/10/tinh-chat-mineral-89-vichy-50ml-1575973742.jpg', 65),
	(158, 'https://product.hstatic.net/200000117693/product/centaphil-gentle-skin-cleanser_e7b92d8fee7949f9b14d405111752e27_master.jpg', 66);

-- Dumping structure for table sarah.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table sarah.user: ~5 rows (approximately)
INSERT INTO `user` (`id`, `avatar`, `email`, `password`, `phone_number`, `role`, `user_name`) VALUES
	('admin', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', NULL, 'admin', 'TNphuchau'),
	('mon', '/web/images/hoa.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', NULL, 'user', 'Trần Nguyễn Phúc Hậu'),
	('mon1', '/web/images/hoa.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', NULL, 'user', 'Vo Thi My Hang'),
	('TNphuchau', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', NULL, 'admin\r\n', 'Trần Nguyễn Phúc Hậu'),
	('TNphuchau1', 'https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png', 'phuchauTN0312@gmail.com', 'QWFAMTIz', '0707396920', 'user', 'Trần Nguyễn Phúc Hậu');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
