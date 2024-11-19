-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- pododb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `pododb` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `pododb`;

-- 테이블 pododb.auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `auth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pododb.auth:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` (`id`, `username`, `auth`) VALUES
	(1, 'asdasd', 'ROLE_ADMIN'),
	(2, 'asd', 'ROLE_USER');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;

-- 테이블 pododb.refresh_token 구조 내보내기
CREATE TABLE IF NOT EXISTS `refresh_token` (
  `rt_id` int(11) NOT NULL AUTO_INCREMENT,
  `rt_refresh_token` varchar(255) NOT NULL,
  `rt_expiry_date` datetime NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rt_id`),
  KEY `username` (`username`),
  CONSTRAINT `refresh_token_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pododb.refresh_token:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` (`rt_id`, `rt_refresh_token`, `rt_expiry_date`, `username`) VALUES
	(37, '25280ce4-c2f9-44d5-89f8-94b68e9ad126', '2024-11-28 10:13:15', 'asdasd');
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;

-- 테이블 pododb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `regisDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `updateDateTime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `point` varchar(50) DEFAULT NULL,
  `isAccountNonExpired` tinyint(1) DEFAULT 1,
  `isAccountNonLocked` tinyint(1) DEFAULT 1,
  `isCredentialsNonExpired` tinyint(1) DEFAULT 1,
  `isEnabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`username`),
  UNIQUE KEY `index` (`index`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 pododb.user:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`index`, `username`, `password`, `name`, `regisDateTime`, `updateDateTime`, `email`, `address`, `number`, `point`, `isAccountNonExpired`, `isAccountNonLocked`, `isCredentialsNonExpired`, `isEnabled`) VALUES
	(13, 'asd', '$2a$10$LESpmuejsI0o54oCb4ZYK.R1cN5mPFwk1eOWo2Ic7FgpUv3pbb9m2', 'asd', '2024-10-14 09:08:52', '2024-10-14 09:08:52', 'asd@asd.asd', 'asd', '070787870707', NULL, 1, 1, 1, 1),
	(14, 'asdasd', '$2a$10$kSJ2gPz1tv6GlXaif4E1He1cy7jzr1NC0wnysFRbdJtondI2Svuq2', 'asdasd', '2024-10-24 08:59:52', '2024-10-24 08:59:52', 'nofresh@naver.com', '대구시 @@구 @@동 @@아파트 @@@@동 @@@@호', '01021343412', NULL, 1, 1, 1, 1),
	(4, 'asdasd12', '$2a$10$65CFAmh8jaSVBFEY14Rlwu9rW6PiBNL4qusplGy5CaIrmG.CVU062', '반가워요', '2024-10-08 11:39:46', '2024-10-29 11:26:06', 'sdg0627@gmail.com', NULL, '123456', '1234', 1, 1, 1, 1),
	(11, 'asdasd1233', '$2a$10$LAiU.wurb/dW1zYyt/BsGO2wQ.TOMByZikrsUg5MFjbHj95h/DqFi', '안닝', '2024-10-10 09:33:30', '2024-10-29 11:45:37', 'asddq@asd.rve', 'qsdqsd', '21233223232', '123331', 1, 1, 1, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
