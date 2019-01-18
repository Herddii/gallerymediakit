-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.34-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for intra-baru-mediakit
CREATE DATABASE IF NOT EXISTS `intra-baru-mediakit` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `intra-baru-mediakit`;

-- Dumping structure for table intra-baru-mediakit.advolution
CREATE TABLE IF NOT EXISTS `advolution` (
  `id_advolution` int(11) NOT NULL AUTO_INCREMENT,
  `nama_advolution` varchar(225) NOT NULL DEFAULT '0',
  `url_showreel` varchar(225) NOT NULL DEFAULT '0',
  `nama_video` varchar(225) DEFAULT NULL,
  `logo` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_advolution`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.advolution_type
CREATE TABLE IF NOT EXISTS `advolution_type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `id_advolution` int(11) NOT NULL DEFAULT '0',
  `nama` varchar(225) NOT NULL DEFAULT '0',
  `url_video` varchar(225) NOT NULL DEFAULT '0',
  `type_video` enum('benefit','compro') NOT NULL DEFAULT 'benefit',
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.artis
CREATE TABLE IF NOT EXISTS `artis` (
  `id_artis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_artis` varchar(100) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_artis`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.benefits
CREATE TABLE IF NOT EXISTS `benefits` (
  `id_benefit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_benefit` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `benefit_cover` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_concept` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_benefit`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.benefit_content
CREATE TABLE IF NOT EXISTS `benefit_content` (
  `id_benefit_content` int(11) NOT NULL AUTO_INCREMENT,
  `id_benefit` int(10) unsigned NOT NULL DEFAULT '0',
  `content_name` varchar(50) NOT NULL,
  `content_file` varchar(100) NOT NULL,
  `content_type` enum('images','video','file') NOT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_benefit_content`),
  KEY `FK_benefit_content_benefits` (`id_benefit`),
  CONSTRAINT `FK_benefit_content_benefits` FOREIGN KEY (`id_benefit`) REFERENCES `benefits_ori` (`id_benefit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.benefit_typespot
CREATE TABLE IF NOT EXISTS `benefit_typespot` (
  `id_typespot` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_benefit` int(10) unsigned DEFAULT NULL,
  `nama` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `durasi` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` int(11) NOT NULL,
  `stopping_power` int(11) NOT NULL,
  `massage_delivery` int(11) NOT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_typespot`),
  KEY `benefit_typespot_id_benefit_foreign` (`id_benefit`),
  CONSTRAINT `benefit_typespot_ibfk_1` FOREIGN KEY (`id_benefit`) REFERENCES `intra-portal`.`benefits_old` (`id_benefit`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.benefit_typespot_ori
CREATE TABLE IF NOT EXISTS `benefit_typespot_ori` (
  `id_typespot` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_benefit` int(10) unsigned DEFAULT NULL,
  `nama` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_typespot`),
  KEY `benefit_typespot_id_benefit_foreign` (`id_benefit`),
  CONSTRAINT `benefit_typespot_ori_ibfk_1` FOREIGN KEY (`id_benefit`) REFERENCES `benefits_ori` (`id_benefit`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.business_unit
CREATE TABLE IF NOT EXISTS `business_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_unit_id` int(11) DEFAULT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_unit` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT 'TV',
  `tier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insert_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam
CREATE TABLE IF NOT EXISTS `cam` (
  `id_cam` int(11) NOT NULL AUTO_INCREMENT,
  `id_am` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `id_sgm` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_sm` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic_am` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cam_typeactivity` int(11) DEFAULT NULL,
  `id_agcy_plan` int(11) DEFAULT NULL,
  `id_brand_plan` int(11) DEFAULT NULL,
  `id_adv_plan` int(11) DEFAULT NULL,
  `subject_plan` varchar(65) CHARACTER SET latin1 DEFAULT NULL,
  `description_plan` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `location_plan` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `id_agcy_act` int(11) DEFAULT NULL,
  `id_brand_act` int(11) DEFAULT NULL,
  `id_adv_act` int(11) DEFAULT NULL,
  `subject_act` varchar(65) CHARACTER SET latin1 DEFAULT NULL,
  `description_act` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `location_act` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `type` enum('PLAN','REPORT') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PLAN','ACTUAL') COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date_plan` datetime DEFAULT NULL,
  `end_date_plan` datetime DEFAULT NULL,
  `start_date_act` datetime DEFAULT NULL,
  `end_date_act` datetime DEFAULT NULL,
  `potency_revenue` float DEFAULT NULL,
  `insert_user` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `update_user` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cam`),
  KEY `TYPE_ACTIVITY` (`id_cam_typeactivity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_brand
CREATE TABLE IF NOT EXISTS `cam_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_client
CREATE TABLE IF NOT EXISTS `cam_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `id_client_account` varchar(50) DEFAULT NULL,
  `id_status` enum('REPORTING','COST') DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_comment
CREATE TABLE IF NOT EXISTS `cam_comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `comment` text,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_cost
CREATE TABLE IF NOT EXISTS `cam_cost` (
  `id_cam_cost` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `cost_description` varchar(255) DEFAULT NULL,
  `cost_by` varchar(50) DEFAULT NULL,
  `gift` enum('Y','N') DEFAULT NULL,
  `client` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cam_cost`),
  KEY `ID_CAM` (`id_cam`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_email
CREATE TABLE IF NOT EXISTS `cam_email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_event
CREATE TABLE IF NOT EXISTS `cam_event` (
  `id_cam_event` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_event` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `typeuser` varchar(50) NOT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cam_event`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_eventdate
CREATE TABLE IF NOT EXISTS `cam_eventdate` (
  `id_event_date` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam_event` int(11) DEFAULT NULL,
  `name_event` varchar(50) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `status` enum('UNIT','GROUP') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_eventdate_gift
CREATE TABLE IF NOT EXISTS `cam_eventdate_gift` (
  `id_event_date_gift` int(11) NOT NULL AUTO_INCREMENT,
  `id_event_date` int(11) NOT NULL,
  `id_gift` int(11) DEFAULT NULL,
  `id_hantaran` int(11) DEFAULT NULL,
  `tittle` varchar(200) DEFAULT NULL,
  `description` text,
  `cost` float DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `id_client_level` int(11) DEFAULT NULL,
  `id_company_cluster` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_event_date_gift`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_event_client
CREATE TABLE IF NOT EXISTS `cam_event_client` (
  `id_event_client` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_client_account` int(11) DEFAULT NULL,
  `id_event_date` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `type` enum('PERSONAL','COMPANY') DEFAULT 'PERSONAL',
  `type_company` enum('AGC','ADV') DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_event_client`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_event_client_gift
CREATE TABLE IF NOT EXISTS `cam_event_client_gift` (
  `id_client_gift` int(11) NOT NULL AUTO_INCREMENT,
  `id_event_client` int(11) DEFAULT NULL,
  `id_event_date_gift` int(11) DEFAULT NULL,
  `id_kado` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal_dikirim` date DEFAULT NULL,
  `status` enum('UNIT','GROUP') DEFAULT NULL,
  `merk` varchar(200) DEFAULT NULL,
  `warna` varchar(50) DEFAULT NULL,
  `image_gift` varchar(200) DEFAULT NULL,
  `image_approve` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `note` text,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_gift` enum('CONFRIM','ACCEPT','RETUR','CANCLE') DEFAULT NULL,
  PRIMARY KEY (`id_client_gift`),
  KEY `ID_CAM_EVENT` (`id_event_client`),
  KEY `ID_GIFT` (`id_event_date_gift`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_gift
CREATE TABLE IF NOT EXISTS `cam_gift` (
  `id_gift` int(11) NOT NULL AUTO_INCREMENT,
  `name_gift` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_gift`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_hantaran
CREATE TABLE IF NOT EXISTS `cam_hantaran` (
  `id_hantaran` int(11) NOT NULL AUTO_INCREMENT,
  `type_hantaran` varchar(100) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_hantaran`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_kado
CREATE TABLE IF NOT EXISTS `cam_kado` (
  `id_kado` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kado` varchar(100) DEFAULT NULL,
  `type_kado` enum('BUNGA','KADO','KUE') DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_partner
CREATE TABLE IF NOT EXISTS `cam_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_reimbuse
CREATE TABLE IF NOT EXISTS `cam_reimbuse` (
  `id_rembuse` int(11) NOT NULL AUTO_INCREMENT,
  `id_cam` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `cost_by` float DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rembuse`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_request
CREATE TABLE IF NOT EXISTS `cam_request` (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_event_date` int(11) DEFAULT NULL,
  `periode` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_request`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_type_activity
CREATE TABLE IF NOT EXISTS `cam_type_activity` (
  `id_cam_typeactivity` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_activity` varchar(50) NOT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_cam_typeactivity`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cam_update
CREATE TABLE IF NOT EXISTS `cam_update` (
  `id_update` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) DEFAULT NULL,
  `am` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_update`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.channel_ta
CREATE TABLE IF NOT EXISTS `channel_ta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_channel` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_brand
CREATE TABLE IF NOT EXISTS `cmv_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` varchar(15) DEFAULT NULL,
  `category_id` varchar(15) DEFAULT NULL,
  `brand_name` varchar(95) DEFAULT NULL,
  `parent_id` varchar(15) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `img` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8390 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_genre
CREATE TABLE IF NOT EXISTS `cmv_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(225) DEFAULT NULL,
  `genre_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_genre_category
CREATE TABLE IF NOT EXISTS `cmv_genre_category` (
  `genre_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`genre_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_target_audience
CREATE TABLE IF NOT EXISTS `cmv_target_audience` (
  `ta_id` varchar(10) NOT NULL,
  `ta_name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_variabel
CREATE TABLE IF NOT EXISTS `cmv_variabel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` varchar(50) NOT NULL,
  `subdemo_id` varchar(50) NOT NULL,
  `quartal` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `totals_thousand` float DEFAULT NULL,
  `totals_ver` float DEFAULT NULL,
  `total_hor` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`brand_id`,`subdemo_id`,`quartal`,`tahun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_variabel_target_audience
CREATE TABLE IF NOT EXISTS `cmv_variabel_target_audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ta_id` varchar(10) DEFAULT NULL,
  `quartal` int(11) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `index` float DEFAULT NULL,
  `totals_thousand` float DEFAULT NULL,
  `totals_ver` float DEFAULT NULL,
  `total_hor` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5908 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.cmv_variabel_top_program
CREATE TABLE IF NOT EXISTS `cmv_variabel_top_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quartal` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `program_name` varchar(200) DEFAULT NULL,
  `channel` varchar(200) DEFAULT NULL,
  `id_genre` int(11) DEFAULT NULL,
  `tvr` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1483 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.company_cluster
CREATE TABLE IF NOT EXISTS `company_cluster` (
  `ID_COMPANY_CLUSTER` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_COMPANY` enum('AGC','ADV') DEFAULT NULL,
  `ID_COMPANY` int(11) DEFAULT NULL,
  `CLUSTER` int(11) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DELETED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_COMPANY_CLUSTER`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_d_target_account
CREATE TABLE IF NOT EXISTS `db_d_target_account` (
  `id_targetaccount` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) DEFAULT NULL,
  `id_agcyptu` int(11) DEFAULT NULL,
  `id_agcyptu_run` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_targetaccount`)
) ENGINE=InnoDB AUTO_INCREMENT=4229 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_d_target_account_am
CREATE TABLE IF NOT EXISTS `db_d_target_account_am` (
  `id_targetaccount_am` int(11) NOT NULL AUTO_INCREMENT,
  `id_targetaccount` int(11) DEFAULT NULL,
  `id_am_run` varchar(100) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `ntc` enum('1','0') DEFAULT '0',
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_targetaccount_am`)
) ENGINE=InnoDB AUTO_INCREMENT=10180 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_advertiser
CREATE TABLE IF NOT EXISTS `db_m_advertiser` (
  `id_adv` int(11) NOT NULL AUTO_INCREMENT,
  `nama_adv` varchar(50) DEFAULT NULL,
  `id_typeadv` int(11) unsigned DEFAULT NULL,
  `id_demography` int(11) DEFAULT NULL,
  `address` text,
  `cluster` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `is_group` enum('Y','N') DEFAULT 'N',
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `delete_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_adv`),
  KEY `FK_IDADV` (`id_typeadv`)
) ENGINE=InnoDB AUTO_INCREMENT=2981 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_agencypintu
CREATE TABLE IF NOT EXISTS `db_m_agencypintu` (
  `id_agcyptu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_agencypintu` varchar(250) DEFAULT NULL,
  `id_agcy` int(11) DEFAULT NULL,
  `cluster` int(11) DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `address` text,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_agcyptu`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_brand
CREATE TABLE IF NOT EXISTS `db_m_brand` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `nama_brand` varchar(100) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_sector` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `delete_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=4370 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_category
CREATE TABLE IF NOT EXISTS `db_m_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_category` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insert_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_channel
CREATE TABLE IF NOT EXISTS `db_m_channel` (
  `id_channel` int(11) NOT NULL AUTO_INCREMENT,
  `name_channel` varchar(50) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  `group` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `keterangan` enum('internal','competitor') DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_channel`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_product
CREATE TABLE IF NOT EXISTS `db_m_product` (
  `id_produk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(191) DEFAULT NULL,
  `id_category` int(11) unsigned DEFAULT NULL,
  `id_sector` int(11) unsigned DEFAULT NULL,
  `id_brand` int(11) unsigned DEFAULT NULL,
  `id_adv` int(11) unsigned DEFAULT NULL,
  `id_ta` int(11) unsigned DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `FK_db_m_produk_db_m_category` (`id_category`),
  KEY `FK_db_m_produk_db_m_sector` (`id_sector`),
  KEY `FK_db_m_produk_db_m_brand` (`id_brand`),
  KEY `FK_db_m_produk_db_m_advertiser` (`id_adv`)
) ENGINE=InnoDB AUTO_INCREMENT=5883 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_m_sector
CREATE TABLE IF NOT EXISTS `db_m_sector` (
  `id_sector` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_sector` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insert_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sector`),
  KEY `db_m_sector_insert_user_foreign` (`insert_user`),
  KEY `db_m_sector_update_user_foreign` (`update_user`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_rating
CREATE TABLE IF NOT EXISTS `db_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DAYPART` varchar(50) NOT NULL,
  `DATE1` date NOT NULL,
  `TA` varchar(50) NOT NULL,
  `RCTI_TVR` float NOT NULL,
  `RCTI_SHARE` float NOT NULL,
  `SCTV_TVR` float NOT NULL,
  `SCTV_SHARE` float NOT NULL,
  `TRANS_TVR` float NOT NULL,
  `TRANS_SHARE` float NOT NULL,
  `TRANS7_TVR` float NOT NULL,
  `TRANS7_SHARE` float NOT NULL,
  `IVM_TVR` float NOT NULL,
  `IVM_SHARE` float NOT NULL,
  `MNCTV_TVR` float NOT NULL,
  `MNCTV_SHARE` float NOT NULL,
  `GTV_TVR` float NOT NULL,
  `GTV_SHARE` float NOT NULL,
  `ANTV_TVR` float NOT NULL,
  `ANTV_SHARE` float NOT NULL,
  `TVONE_TVR` float NOT NULL,
  `TVONE_SHARE` float NOT NULL,
  `METRO_TVR` float NOT NULL,
  `METRO_SHARE` float NOT NULL,
  `TVRI_TVR` float NOT NULL,
  `TVRI_SHARE` float NOT NULL,
  `INEWS_TVR` float DEFAULT NULL,
  `INEWS_SHARE` float DEFAULT NULL,
  `KOMPAS_TVR` float DEFAULT NULL,
  `KOMPAS_SHARE` float DEFAULT NULL,
  `NET_TVR` float DEFAULT NULL,
  `NET_SHARE` float DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=79491 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_target
CREATE TABLE IF NOT EXISTS `db_target` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YEAR` int(11) NOT NULL,
  `PERIODE` int(11) NOT NULL,
  `ID_SM` varchar(100) NOT NULL,
  `ID_SGM` varchar(100) NOT NULL,
  `ID_AE` varchar(100) NOT NULL,
  `NAMA_SM` varchar(100) NOT NULL,
  `NAMA_SGM` varchar(100) NOT NULL,
  `NAMA_AE` varchar(100) NOT NULL,
  `REG_TARGET` decimal(15,3) NOT NULL,
  `REG_ACH` decimal(15,3) NOT NULL,
  `REG_EFFORT` decimal(15,3) NOT NULL,
  `BC_TARGET` decimal(15,3) NOT NULL,
  `BC_ACH` decimal(15,3) NOT NULL,
  `BI_TARGET` decimal(15,3) NOT NULL,
  `BI_ACH` decimal(15,3) NOT NULL,
  `RS_TARGET` decimal(15,3) NOT NULL,
  `RS_ACT` decimal(15,3) NOT NULL,
  `CPRP_TARGET` decimal(15,3) NOT NULL,
  `CPRP_REV` decimal(15,3) NOT NULL,
  `BARTER_REV` decimal(15,3) NOT NULL,
  `BU_ID` int(11) NOT NULL,
  `ACTIVE` int(11) DEFAULT '1',
  `INSERT_DATE` datetime DEFAULT NULL,
  `INSERT_USER` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_AE` (`ID_AE`),
  KEY `PERIODE` (`PERIODE`),
  KEY `ID_SGM` (`ID_SGM`),
  KEY `ID_SM` (`ID_SM`),
  KEY `BU_ID` (`BU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10123 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_target_account
CREATE TABLE IF NOT EXISTS `db_target_account` (
  `ID_TARGETACCOUNT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PRODUK` int(11) DEFAULT NULL,
  `ID_AGCYPTU` int(11) DEFAULT NULL,
  `ID_AGCYPTU_RUN` int(11) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `TRASH` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID_TARGETACCOUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=1709 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_target_account_am
CREATE TABLE IF NOT EXISTS `db_target_account_am` (
  `ID_TARGETACCOUNT_AM` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TARGETACCOUNT` int(11) DEFAULT NULL,
  `ID_AM_RUN` varchar(100) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(100) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(100) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `TRASH` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID_TARGETACCOUNT_AM`)
) ENGINE=InnoDB AUTO_INCREMENT=5125 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.db_weekly
CREATE TABLE IF NOT EXISTS `db_weekly` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YEAR` int(4) DEFAULT NULL,
  `PERIODE` int(2) DEFAULT NULL,
  `ADVERTISER` varchar(75) DEFAULT NULL,
  `ADVERTISER_GROUP` varchar(75) DEFAULT NULL,
  `ADVG_ID` int(11) DEFAULT NULL,
  `KET` varchar(50) DEFAULT NULL,
  `AGENCY` varchar(255) DEFAULT NULL,
  `AP_ID` int(11) DEFAULT NULL,
  `AGENCY_MNCTV` varchar(255) DEFAULT NULL,
  `AP_ID_MNCTV` int(10) DEFAULT '1',
  `AGENCY_GTV` varchar(255) DEFAULT NULL,
  `AP_ID_GTV` int(10) DEFAULT '1',
  `PRODUK` varchar(100) NOT NULL,
  `SECTOR` varchar(100) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL,
  `RCTI` float NOT NULL,
  `SCTV` float NOT NULL,
  `TRANS` float NOT NULL,
  `TRANS7` float NOT NULL,
  `IVM` float NOT NULL,
  `MNCTV` float NOT NULL,
  `GTV` float NOT NULL,
  `ANTV` float NOT NULL,
  `TVONE` float NOT NULL,
  `METRO` float NOT NULL,
  `TVRI` float NOT NULL,
  `NETTV` float NOT NULL,
  `INEWS` float NOT NULL,
  `ALLTV` float NOT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `INSERT_USER` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64238 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.email_check
CREATE TABLE IF NOT EXISTS `email_check` (
  `id_check` int(11) NOT NULL AUTO_INCREMENT,
  `id_email` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_check`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.favorite
CREATE TABLE IF NOT EXISTS `favorite` (
  `id_favorite` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `id_client_account` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_favorite`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.group_unit
CREATE TABLE IF NOT EXISTS `group_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insert_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.level1
CREATE TABLE IF NOT EXISTS `level1` (
  `id_level1` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_level1`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.level2
CREATE TABLE IF NOT EXISTS `level2` (
  `id_level2` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `id_level1` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_level2`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.linked_social_accounts
CREATE TABLE IF NOT EXISTS `linked_social_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) DEFAULT NULL,
  `provider_name` varchar(200) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.login_activities
CREATE TABLE IF NOT EXISTS `login_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(65) DEFAULT NULL,
  `user_agent` varchar(191) DEFAULT NULL,
  `ip_address` varchar(65) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2481 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_flagrate
CREATE TABLE IF NOT EXISTS `mapping_flagrate` (
  `id_mapping_flagrate` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_awal` int(4) NOT NULL DEFAULT '0',
  `code_value` int(11) NOT NULL DEFAULT '0',
  `code_seasonal_pricing` int(11) NOT NULL DEFAULT '0',
  `code_type_order` int(11) NOT NULL DEFAULT '0',
  `code_platform` int(11) NOT NULL DEFAULT '0',
  `code_unit_revenue` int(11) NOT NULL DEFAULT '0',
  `code_program` int(11) NOT NULL DEFAULT '0',
  `code_kombinasi_flagrate` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapping_flagrate`)
) ENGINE=InnoDB AUTO_INCREMENT=1192 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_master
CREATE TABLE IF NOT EXISTS `mapping_master` (
  `id_mapping` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `id_mapping_master_type` int(11) DEFAULT NULL,
  `group_mapping` enum('POTYPE','FLAGRATE','SPOTTYPE') DEFAULT NULL,
  `subgroup_mapping` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapping`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_master_type
CREATE TABLE IF NOT EXISTS `mapping_master_type` (
  `id_mapping_master_type` int(11) NOT NULL AUTO_INCREMENT,
  `type_mapping` varchar(50) DEFAULT NULL,
  `digit_code` varchar(50) DEFAULT NULL,
  `description` text,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapping_master_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_po_type
CREATE TABLE IF NOT EXISTS `mapping_po_type` (
  `id_mapping_po_type` int(11) NOT NULL AUTO_INCREMENT,
  `code_unitorder` int(11) DEFAULT NULL,
  `code_client` int(11) DEFAULT NULL,
  `code_billcom` int(11) DEFAULT NULL,
  `code_invoice` int(11) DEFAULT NULL,
  `code_kombinasi_potype` varchar(50) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapping_po_type`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_spot_type
CREATE TABLE IF NOT EXISTS `mapping_spot_type` (
  `id_mapping_spot_type` int(11) NOT NULL AUTO_INCREMENT,
  `code_typespot` int(11) DEFAULT NULL,
  `code_package` int(11) DEFAULT NULL,
  `code_kombinasi_spottype` varchar(20) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mapping_spot_type`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mapping_subgroup_spottype
CREATE TABLE IF NOT EXISTS `mapping_subgroup_spottype` (
  `id_group_spottype` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '0',
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_group_spottype`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.media
CREATE TABLE IF NOT EXISTS `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` enum('one','many') DEFAULT NULL,
  PRIMARY KEY (`id_media`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.mediakit_email
CREATE TABLE IF NOT EXISTS `mediakit_email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `pengirim` varchar(50) DEFAULT NULL,
  `penerima` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.media_unit
CREATE TABLE IF NOT EXISTS `media_unit` (
  `id_media_unit` int(11) NOT NULL AUTO_INCREMENT,
  `id_media` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_media_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.media_video
CREATE TABLE IF NOT EXISTS `media_video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_media` int(11) NOT NULL DEFAULT '0',
  `video` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_video`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.meeting_progress
CREATE TABLE IF NOT EXISTS `meeting_progress` (
  `id_meeting_progress` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `meeting_date` date DEFAULT NULL,
  `file_meeting` varchar(225) DEFAULT NULL,
  `cover` varchar(225) DEFAULT NULL,
  `type_meeting` enum('progress','update') DEFAULT NULL,
  `id_bu` int(11) NOT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_meeting_progress`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.notification
CREATE TABLE IF NOT EXISTS `notification` (
  `chat` text,
  `id_bu` int(11) DEFAULT NULL,
  `tabs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.page-views
CREATE TABLE IF NOT EXISTS `page-views` (
  `visitable_id` int(11) DEFAULT NULL,
  `visitable_type` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_advertiser
CREATE TABLE IF NOT EXISTS `portal_advertiser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_adv` int(11) DEFAULT NULL,
  `id_portal` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_bankfoto
CREATE TABLE IF NOT EXISTS `portal_bankfoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_portal` int(11) NOT NULL DEFAULT '0',
  `keterangan` text,
  `images` varchar(225) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_berita
CREATE TABLE IF NOT EXISTS `portal_berita` (
  `id_portal` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `id_sector` int(11) DEFAULT '0',
  `id_agcyptu` int(11) DEFAULT '0',
  `judul` text,
  `slug` text,
  `cuplikan` varchar(200) DEFAULT NULL,
  `deskripsi` text,
  `sumber` varchar(200) DEFAULT NULL,
  `cover` varchar(225) DEFAULT NULL,
  `video` text,
  `type_video` enum('PARIWARA','YOUTUBE') DEFAULT NULL,
  `sumber_cover` varchar(100) DEFAULT NULL,
  `present` enum('yes','no') DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_portal`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_berita_ori
CREATE TABLE IF NOT EXISTS `portal_berita_ori` (
  `id_portal` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `id_sector` int(11) DEFAULT '0',
  `id_agcyptu` int(11) DEFAULT '0',
  `judul` text,
  `slug` text,
  `cuplikan` varchar(200) DEFAULT NULL,
  `deskripsi` text,
  `sumber` varchar(200) DEFAULT NULL,
  `cover` varchar(225) DEFAULT NULL,
  `video` text,
  `sumber_cover` varchar(100) DEFAULT NULL,
  `headline` enum('yes','no') DEFAULT NULL,
  `present` enum('yes','no') DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_portal`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_brand
CREATE TABLE IF NOT EXISTS `portal_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_brand` int(11) DEFAULT NULL,
  `id_portal` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_bu
CREATE TABLE IF NOT EXISTS `portal_bu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_portal` int(11) DEFAULT NULL,
  `for_bu` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_kategori
CREATE TABLE IF NOT EXISTS `portal_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  `id_bu` varchar(100) NOT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_tag
CREATE TABLE IF NOT EXISTS `portal_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tag` int(11) DEFAULT NULL,
  `id_portal` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1138 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.portal_tag_master
CREATE TABLE IF NOT EXISTS `portal_tag_master` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `id_bu` int(11) NOT NULL DEFAULT '0',
  `nama_tag` varchar(225) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `update_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.program_ariana
CREATE TABLE IF NOT EXISTS `program_ariana` (
  `id_program_ariana` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `id_level2` int(11) DEFAULT NULL,
  `id_channel` int(11) DEFAULT NULL,
  `daypart1` varchar(50) DEFAULT NULL,
  `daypart2` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_program_ariana`)
) ENGINE=InnoDB AUTO_INCREMENT=3362 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.program_gen
CREATE TABLE IF NOT EXISTS `program_gen` (
  `id_program_gen` int(11) NOT NULL AUTO_INCREMENT,
  `program_name_gen` varchar(225) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_program_gen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.program_mapping
CREATE TABLE IF NOT EXISTS `program_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_source` enum('INTRANET','ARIANA','SOCMED','GEN') DEFAULT NULL,
  `id_source` int(11) DEFAULT NULL,
  `type_mapping` enum('INTRANET','ARIANA','SOCMED','GEN') DEFAULT NULL,
  `id_mapping` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `insert_user` varchar(225) DEFAULT NULL,
  `update_user` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.program_rating
CREATE TABLE IF NOT EXISTS `program_rating` (
  `id` int(11) DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `id_program_ariana` int(11) DEFAULT NULL,
  `id_channel` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `index` float DEFAULT NULL,
  `tvr` float DEFAULT NULL,
  `thousands` float DEFAULT NULL,
  `share` float DEFAULT NULL,
  `total_thousands` float DEFAULT NULL,
  `pot_thousands` float DEFAULT NULL,
  `tot_pot_thousands` float DEFAULT NULL,
  `populasi` float DEFAULT NULL,
  `tot_populasi` float DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.program_unit
CREATE TABLE IF NOT EXISTS `program_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_unit_id` int(10) unsigned DEFAULT NULL,
  `program_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insert_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.sam
CREATE TABLE IF NOT EXISTS `sam` (
  `id_sam` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ref_sam` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_req_type` int(2) unsigned zerofill DEFAULT NULL,
  `id_sub_req_type` int(10) unsigned DEFAULT NULL,
  `id_status` int(10) unsigned DEFAULT NULL,
  `id_status_progress` int(10) unsigned DEFAULT NULL,
  `start_periode` date DEFAULT NULL,
  `end_periode` date DEFAULT NULL,
  `id_brand` int(10) unsigned DEFAULT NULL,
  `brand_variant` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_apu` int(10) unsigned DEFAULT NULL,
  `id_advg` int(10) unsigned DEFAULT NULL,
  `id_billcom` int(10) unsigned DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `nett` float DEFAULT NULL,
  `pic_am` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_sam` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_sa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_section` int(11) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `deadline_mkt` datetime DEFAULT NULL,
  `update_active` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_progress_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_progress_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_sgm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_sm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_mc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `id_am` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sm` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sgm` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_bu` int(10) unsigned DEFAULT NULL,
  `via_email` int(11) DEFAULT NULL,
  `active` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insert_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sam`),
  KEY `sam_id_sub_req_type_foreign` (`id_sub_req_type`),
  KEY `sam_update_progress_user_foreign` (`update_progress_user`),
  KEY `FK_sam_users` (`pic_am`),
  KEY `FK_sam_users_2` (`pic_sam`),
  KEY `FK_sam_sam_request_type` (`id_req_type`),
  KEY `FK_sam_sam_status` (`id_status`),
  KEY `FK_sam_sam_status_2` (`id_status_progress`),
  KEY `FK_sam_db_m_brand` (`id_brand`),
  KEY `FK_sam_db_m_agencypintu` (`id_apu`),
  KEY `FK_sam_db_m_advertiser` (`id_advg`),
  KEY `FK_sam_bu` (`id_bu`),
  KEY `FK_sam_users_3` (`insert_user`),
  KEY `FK_sam_users_4` (`update_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.sam_activity
CREATE TABLE IF NOT EXISTS `sam_activity` (
  `id_activity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ref_activity` int(10) unsigned DEFAULT NULL,
  `id_status` int(10) unsigned DEFAULT NULL,
  `id_sam` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sam_file` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_attach_file` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `time_to_work` int(11) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `id_bu` int(10) unsigned DEFAULT NULL,
  `id_nodeal` int(10) unsigned DEFAULT NULL,
  `insert_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_activity`),
  KEY `sam_activity_id_sam_foreign` (`id_sam`),
  KEY `sam_activity_id_status_foreign` (`id_status`),
  KEY `FK_sam_activity_users` (`insert_user`),
  KEY `FK_sam_activity_users_2` (`update_user`),
  KEY `FK_sam_activity_bu` (`id_bu`)
) ENGINE=InnoDB AUTO_INCREMENT=226298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.sam_request_type
CREATE TABLE IF NOT EXISTS `sam_request_type` (
  `id_req_type` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `singkatan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modul` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_req_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.sam_status
CREATE TABLE IF NOT EXISTS `sam_status` (
  `id_status` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_req_type` int(2) unsigned zerofill NOT NULL,
  `relasi_status` int(11) NOT NULL,
  `type_status` int(11) DEFAULT NULL,
  `dept_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warning` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_limit` int(11) NOT NULL,
  `stat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  KEY `sam_status_id_req_type_foreign` (`id_req_type`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.ta
CREATE TABLE IF NOT EXISTS `ta` (
  `id_ta` int(11) NOT NULL AUTO_INCREMENT,
  `ta_name` varchar(50) DEFAULT NULL,
  `group_ta` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_ta`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_acd_soal
CREATE TABLE IF NOT EXISTS `tbl_acd_soal` (
  `ID_SOAL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_QUIZ` int(11) DEFAULT NULL,
  `ID_SKILL` int(11) DEFAULT NULL,
  `SOAL` text,
  `JAWABAN_A` text,
  `JAWABAN_B` text,
  `JAWABAN_C` text,
  `JAWABAN_D` text,
  `JENIS_SOAL` varchar(50) DEFAULT NULL,
  `KUNCI_JAWABAN` text,
  `RUMUS` text,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `TRASH` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID_SOAL`),
  KEY `FK__tbl_acd_quiz` (`ID_QUIZ`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1 COMMENT='Tabel Academy Soal Quiz';

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_action_upload
CREATE TABLE IF NOT EXISTS `tbl_action_upload` (
  `ID_UPLOAD` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `INSERT_USER` varchar(100) DEFAULT NULL,
  `ID_BU` int(2) DEFAULT NULL,
  `ID_SECTION` int(3) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_UPLOAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_am
CREATE TABLE IF NOT EXISTS `tbl_am` (
  `ID_AM` varchar(50) NOT NULL,
  `AM_NAME` varchar(50) DEFAULT NULL,
  `ID_SGM` varchar(50) NOT NULL,
  `ID_SM` varchar(50) NOT NULL,
  `ID_GM` varchar(50) NOT NULL,
  `NTC` int(11) NOT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `INSER_USER` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `ACTIVE` int(11) DEFAULT '1',
  `TRASH` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_AM`),
  KEY `ID_SM` (`ID_SM`),
  KEY `ID_SGM` (`ID_SGM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_am-1
CREATE TABLE IF NOT EXISTS `tbl_am-1` (
  `ID_AM` varchar(50) NOT NULL,
  `AM_NAME` varchar(50) DEFAULT NULL,
  `ID_SGM` varchar(50) NOT NULL,
  `ID_SM` varchar(50) NOT NULL,
  `ID_GM` varchar(50) NOT NULL,
  `NTC` int(11) NOT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `INSER_USER` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `ACTIVE` int(11) DEFAULT '1',
  `TRASH` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_AM`),
  KEY `ID_SM` (`ID_SM`),
  KEY `ID_SGM` (`ID_SGM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_bu
CREATE TABLE IF NOT EXISTS `tbl_bu` (
  `ID_BU` int(11) NOT NULL AUTO_INCREMENT,
  `HAVE_CHANNEL` int(11) NOT NULL DEFAULT '0',
  `BU_FULL_NAME` varchar(75) NOT NULL,
  `BU_SHORT_NAME` varchar(45) NOT NULL,
  `IMAGE` varchar(45) NOT NULL,
  `INSERT_USER` varchar(50) NOT NULL,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` date NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_BU`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COMMENT='Bussiness Unit / Company / Branch';

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_bulan
CREATE TABLE IF NOT EXISTS `tbl_bulan` (
  `PERIODE` int(11) NOT NULL AUTO_INCREMENT,
  `BULAN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PERIODE`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_bu_channel_old
CREATE TABLE IF NOT EXISTS `tbl_bu_channel_old` (
  `ID_CHANNEL` int(11) NOT NULL AUTO_INCREMENT,
  `CHANNEL_NAME` varchar(200) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `ID_CAT_CHANNEL` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(200) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(200) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CHANNEL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_category_file
CREATE TABLE IF NOT EXISTS `tbl_category_file` (
  `id_cat_file` tinyint(5) NOT NULL AUTO_INCREMENT,
  `category_file` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cat_file`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_chat
CREATE TABLE IF NOT EXISTS `tbl_chat` (
  `id_chat` int(11) NOT NULL AUTO_INCREMENT,
  `text_chat` varchar(50) DEFAULT NULL,
  `insert_user` int(11) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `read_date` datetime DEFAULT NULL,
  `user_to` int(11) DEFAULT NULL,
  `read_stat` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_chat`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_city
CREATE TABLE IF NOT EXISTS `tbl_city` (
  `ID_CITY` int(11) NOT NULL,
  `NAME_CITY` varchar(50) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DELETED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_compare
CREATE TABLE IF NOT EXISTS `tbl_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(250) DEFAULT NULL,
  `replicate` varchar(100) DEFAULT NULL,
  `table` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_content
CREATE TABLE IF NOT EXISTS `tbl_content` (
  `id_content` int(11) NOT NULL AUTO_INCREMENT,
  `content_title` varchar(225) DEFAULT NULL,
  `id_program_periode` int(11) DEFAULT NULL,
  `id_master_filetype` int(11) DEFAULT NULL,
  `id_filetype` int(11) DEFAULT NULL,
  `id_section` int(11) DEFAULT NULL,
  `id_sector` int(11) DEFAULT NULL,
  `id_benefit` int(10) DEFAULT NULL,
  `id_channel` int(10) DEFAULT NULL,
  `id_genre` int(10) DEFAULT NULL,
  `year_of_file` year(4) DEFAULT NULL,
  `month_of_file` int(2) DEFAULT NULL,
  `content_desc` text,
  `content_file_download` varchar(225) DEFAULT NULL,
  `content_headline` int(11) DEFAULT NULL,
  `mediakit` tinyint(4) DEFAULT '1',
  `portal` tinyint(4) DEFAULT '1',
  `content_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `trash` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `delete_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_content`),
  KEY `BU_ID` (`id_bu`),
  KEY `SECTION_ID` (`id_section`),
  KEY `INPUT_USER` (`insert_user`)
) ENGINE=InnoDB AUTO_INCREMENT=53250 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_filetype
CREATE TABLE IF NOT EXISTS `tbl_filetype` (
  `id_filetype` int(11) NOT NULL AUTO_INCREMENT,
  `filetype_name` varchar(70) NOT NULL,
  `folder` varchar(30) NOT NULL DEFAULT 'public',
  `id_master_filetype` int(11) NOT NULL DEFAULT '0',
  `id_typespot` int(11) NOT NULL DEFAULT '0',
  `type` enum('typespot','benefit','other') DEFAULT NULL,
  `ext_file` varchar(50) NOT NULL DEFAULT 'free',
  `allow_ext` varchar(50) NOT NULL,
  `insert_user` varchar(50) NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `delete_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_filetype`),
  KEY `FILE_TYPE_NAME` (`filetype_name`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_galleryalbum
CREATE TABLE IF NOT EXISTS `tbl_galleryalbum` (
  `id_galleryalbum` int(11) NOT NULL AUTO_INCREMENT,
  `id_master_filetype` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `cover_gallery` varchar(50) DEFAULT NULL,
  `content_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `description` text,
  `id_bu` int(11) NOT NULL,
  `insert_user` varchar(50) NOT NULL,
  `insert_date` datetime NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `update_date` datetime NOT NULL,
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` tinyint(4) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_galleryalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_gallerycontent
CREATE TABLE IF NOT EXISTS `tbl_gallerycontent` (
  `id_content` int(11) NOT NULL AUTO_INCREMENT,
  `content_title` varchar(100) NOT NULL,
  `id_galleryalbum` int(11) DEFAULT NULL,
  `year_of_file` char(4) DEFAULT NULL,
  `month_of_file` int(2) DEFAULT NULL,
  `content_desc` varchar(5000) DEFAULT NULL,
  `content_file_download` varchar(200) DEFAULT NULL,
  `type_content` enum('images','video') DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_master_filetype` int(11) DEFAULT NULL,
  `id_filetype` int(11) NOT NULL,
  `id_section` int(11) NOT NULL,
  `id_bu` int(11) NOT NULL,
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` int(11) DEFAULT '0',
  PRIMARY KEY (`id_content`),
  KEY `BU_ID` (`id_bu`),
  KEY `SECTION_ID` (`id_section`),
  KEY `INPUT_USER` (`insert_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_gallery_comment
CREATE TABLE IF NOT EXISTS `tbl_gallery_comment` (
  `ID_COMMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CONTENT` int(11) DEFAULT NULL,
  `KOMENTAR` text,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_COMMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_gallery_highlight
CREATE TABLE IF NOT EXISTS `tbl_gallery_highlight` (
  `ID_HIGHLIGHT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CONTENT` int(11) DEFAULT NULL,
  `HIGHLIGHT_DESC` varchar(500) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_HIGHLIGHT`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_gallery_tag
CREATE TABLE IF NOT EXISTS `tbl_gallery_tag` (
  `ID_TAG` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CONTENT` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_master_filetype
CREATE TABLE IF NOT EXISTS `tbl_master_filetype` (
  `id_master_filetype` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `master_group` varchar(50) DEFAULT NULL,
  `description` text,
  `type_content` int(11) DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id_master_filetype`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_mk_fanof
CREATE TABLE IF NOT EXISTS `tbl_mk_fanof` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT_ID` int(11) DEFAULT NULL,
  `DATE_SHOW` date DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `TRASH` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_mk_highlight
CREATE TABLE IF NOT EXISTS `tbl_mk_highlight` (
  `ID_HIGHLIGHT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TA` int(11) DEFAULT NULL,
  `ID_CONTENT` int(11) DEFAULT NULL,
  `HIGHLIGHT_DESC` varchar(500) DEFAULT NULL,
  `NO_URUT` int(11) DEFAULT NULL,
  `ID_BU` int(5) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(150) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_HIGHLIGHT`)
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_mk_newsupdate
CREATE TABLE IF NOT EXISTS `tbl_mk_newsupdate` (
  `ID_NEWSUPDATE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TA` int(11) DEFAULT NULL,
  `ID_CONTENT` int(11) DEFAULT NULL,
  `NEWSUPDATE_DESC` varchar(500) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_NEWSUPDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program
CREATE TABLE IF NOT EXISTS `tbl_program` (
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(250) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_channel` int(11) NOT NULL,
  `id_bu` int(11) NOT NULL,
  `master_ta` int(11) NOT NULL DEFAULT '2',
  `description` text,
  `images` varchar(5000) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_type_event` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_program`)
) ENGINE=InnoDB AUTO_INCREMENT=4332 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_ariana_level1
CREATE TABLE IF NOT EXISTS `tbl_program_ariana_level1` (
  `id_level1` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_level1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_ariana_level2
CREATE TABLE IF NOT EXISTS `tbl_program_ariana_level2` (
  `id_level2` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_level2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_artis
CREATE TABLE IF NOT EXISTS `tbl_program_artis` (
  `id_program_artis` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_periode` int(11) NOT NULL,
  `id_artis` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_user` varchar(50) NOT NULL,
  `update_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_program_artis`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_category
CREATE TABLE IF NOT EXISTS `tbl_program_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_control
CREATE TABLE IF NOT EXISTS `tbl_program_control` (
  `ID_PROGRAM_CONTROL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROGRAM_PERIODE` int(11) DEFAULT NULL,
  `ID_FILETYPE` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(100) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_PROGRAM_CONTROL`)
) ENGINE=InnoDB AUTO_INCREMENT=2769 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_event
CREATE TABLE IF NOT EXISTS `tbl_program_event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) DEFAULT NULL,
  `id_type_event` int(11) DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  ` update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_genre
CREATE TABLE IF NOT EXISTS `tbl_program_genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_mapping1
CREATE TABLE IF NOT EXISTS `tbl_program_mapping1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_source` int(11) DEFAULT NULL,
  `type_source` enum('INTRANET','ARIANA','SOCMED','GEN') DEFAULT NULL,
  `id_program_mapping` int(11) DEFAULT NULL,
  `type` enum('INTRANET','ARIANA','SOCMED','GEN') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_ori
CREATE TABLE IF NOT EXISTS `tbl_program_ori` (
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_unit` int(11) NOT NULL,
  `program_name` varchar(250) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_channel` int(11) NOT NULL,
  `id_bu` int(11) NOT NULL,
  `master_ta` int(11) NOT NULL DEFAULT '2',
  `images` varchar(5000) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_type_event` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_program`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_periode
CREATE TABLE IF NOT EXISTS `tbl_program_periode` (
  `id_program_periode` int(11) NOT NULL AUTO_INCREMENT,
  `id_program` int(11) DEFAULT NULL,
  `content_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `onair_start_date` date DEFAULT NULL,
  `onair_end_date` date DEFAULT NULL,
  `date_onair` date DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `thousand` float DEFAULT NULL,
  `index` float DEFAULT NULL,
  `share` float DEFAULT NULL,
  `tvr` float DEFAULT NULL,
  `content_use` int(11) NOT NULL DEFAULT '0',
  `content_trailer` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `benefit` text,
  `target` double DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `portal` tinyint(4) DEFAULT '1',
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_program_periode`),
  KEY `PROGRAM_ID` (`id_program`),
  KEY `ID_PROGRAM_SEASON` (`id_season`),
  KEY `ID_PROGRAM_CATEGORY` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4305 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_periode_ori
CREATE TABLE IF NOT EXISTS `tbl_program_periode_ori` (
  `id_program_periode` int(11) NOT NULL AUTO_INCREMENT,
  `id_program` int(11) DEFAULT NULL,
  `content_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `onair_start_date` date DEFAULT NULL,
  `onair_end_date` date DEFAULT NULL,
  `date_onair` date DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `content_use` int(11) NOT NULL DEFAULT '0',
  `content_trailer` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `benefit` text,
  `target` double DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `portal` tinyint(4) DEFAULT '1',
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_program_periode`),
  KEY `PROGRAM_ID` (`id_program`),
  KEY `ID_PROGRAM_SEASON` (`id_season`),
  KEY `ID_PROGRAM_CATEGORY` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_pic
CREATE TABLE IF NOT EXISTS `tbl_program_pic` (
  `ID_PROGRAM_PIC` int(11) NOT NULL AUTO_INCREMENT,
  `ID_SECTION` int(11) DEFAULT NULL,
  `ID_USER` varchar(50) DEFAULT NULL,
  `ID_PROGRAM_PERIODE` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `ID_BU` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PROGRAM_PIC`)
) ENGINE=InnoDB AUTO_INCREMENT=1288 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_requirement
CREATE TABLE IF NOT EXISTS `tbl_program_requirement` (
  `ID_REQUIREMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PROGRAM_PERIODE` int(11) DEFAULT NULL,
  `ID_FILETYPE` int(11) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_REQUIREMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_season
CREATE TABLE IF NOT EXISTS `tbl_program_season` (
  `id_season` int(11) NOT NULL AUTO_INCREMENT,
  `season_name` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_season`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_ta
CREATE TABLE IF NOT EXISTS `tbl_program_ta` (
  `id_program_ta` int(11) NOT NULL AUTO_INCREMENT,
  `id_program` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_program_ta`)
) ENGINE=InnoDB AUTO_INCREMENT=1803 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_tvr
CREATE TABLE IF NOT EXISTS `tbl_program_tvr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_show` date DEFAULT NULL,
  `id_program_ariana` date DEFAULT NULL,
  `id_channel` int(11) DEFAULT NULL,
  `tvr` float DEFAULT NULL,
  `thousand` float DEFAULT NULL,
  `index` float DEFAULT NULL,
  `share` float DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_program_type_event
CREATE TABLE IF NOT EXISTS `tbl_program_type_event` (
  `id_type_event` int(11) NOT NULL AUTO_INCREMENT,
  `type_event_name` varchar(150) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_type_event`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_rating
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daypart` varchar(50) DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `ta` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `tvr` varchar(50) DEFAULT NULL,
  `share` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_salestools
CREATE TABLE IF NOT EXISTS `tbl_salestools` (
  `id_salestools` int(11) NOT NULL AUTO_INCREMENT,
  `id_master_filetype` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content_start_date` date DEFAULT NULL,
  `onair_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `onair_end_date` date DEFAULT NULL,
  `content_use` int(11) NOT NULL DEFAULT '0',
  `content_trailer` int(11) NOT NULL DEFAULT '0',
  `content_headline` int(11) NOT NULL DEFAULT '0',
  `description` varchar(5000) DEFAULT NULL,
  `id_bu` int(11) NOT NULL,
  `id_channel` int(11) NOT NULL,
  `advg_id` int(11) DEFAULT NULL,
  `id_ap` int(11) DEFAULT NULL,
  `id_am` varchar(50) DEFAULT NULL,
  `id_program_periode` int(11) DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `portal` tinyint(4) DEFAULT '1',
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` tinyint(4) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_salestools`),
  KEY `CONTENT_USE` (`content_use`)
) ENGINE=InnoDB AUTO_INCREMENT=5798 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_salestools_ori
CREATE TABLE IF NOT EXISTS `tbl_salestools_ori` (
  `id_salestools` int(11) NOT NULL AUTO_INCREMENT,
  `id_master_filetype` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content_start_date` date DEFAULT NULL,
  `onair_start_date` date DEFAULT NULL,
  `content_end_date` date DEFAULT NULL,
  `onair_end_date` date DEFAULT NULL,
  `content_use` int(11) NOT NULL DEFAULT '0',
  `content_trailer` int(11) NOT NULL DEFAULT '0',
  `content_headline` int(11) NOT NULL DEFAULT '0',
  `description` varchar(5000) DEFAULT NULL,
  `id_bu` int(11) NOT NULL,
  `id_channel` int(11) NOT NULL,
  `advg_id` int(11) DEFAULT NULL,
  `id_ap` int(11) DEFAULT NULL,
  `id_am` varchar(50) DEFAULT NULL,
  `id_program_periode` int(11) DEFAULT NULL,
  `insert_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_user` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(4) DEFAULT '1',
  `portal` tinyint(4) DEFAULT '1',
  `mediakit` tinyint(4) DEFAULT '1',
  `trash` tinyint(4) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_salestools`),
  KEY `CONTENT_USE` (`content_use`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_salestools_ta
CREATE TABLE IF NOT EXISTS `tbl_salestools_ta` (
  ` id_salestools_ta` int(11) NOT NULL AUTO_INCREMENT,
  `id_salestools` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL,
  `insert_user` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (` id_salestools_ta`)
) ENGINE=InnoDB AUTO_INCREMENT=16112 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_ta
CREATE TABLE IF NOT EXISTS `tbl_ta` (
  `ID` int(11) DEFAULT NULL,
  `TA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_target_audience
CREATE TABLE IF NOT EXISTS `tbl_target_audience` (
  `id_ta` int(11) NOT NULL AUTO_INCREMENT,
  `ta_name` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `ta` int(11) DEFAULT '1',
  `url` varchar(50) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `back` varchar(250) DEFAULT NULL,
  `active` tinyint(5) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_ta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_tv_audience_share
CREATE TABLE IF NOT EXISTS `tbl_tv_audience_share` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERIODE` varchar(50) DEFAULT NULL,
  `CHANNEL_TV` varchar(50) DEFAULT NULL,
  `ASHARE` float DEFAULT NULL,
  `TIME_TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `password_mobile` varchar(191) DEFAULT NULL,
  `USER_NAME` varchar(70) NOT NULL,
  `FIRST_NAME` varchar(70) NOT NULL,
  `LAST_NAME` varchar(70) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `RANDOM_PASSWORD` varchar(191) DEFAULT NULL,
  `PASSWORD_BARU` varchar(191) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `IMAGES` varchar(50) DEFAULT NULL,
  `POSITION` varchar(25) NOT NULL,
  `ID_ROLE` int(11) NOT NULL DEFAULT '1',
  `ADMIN` int(11) NOT NULL DEFAULT '0',
  `ID_SUBSECTION` varchar(50) DEFAULT NULL,
  `ID_SECTION` int(11) DEFAULT NULL,
  `ID_DEPARTEMENT` varchar(50) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `LEVEL_DBTARGET` int(11) NOT NULL DEFAULT '0',
  `HIT` int(11) DEFAULT '1',
  `IP_LOGIN` varchar(50) DEFAULT NULL,
  `LAST_ONLINE` datetime DEFAULT NULL,
  `ONLINE` tinyint(1) DEFAULT '0',
  `ACTIVE` tinyint(1) DEFAULT '1',
  `remember_token` varchar(191) DEFAULT '1',
  `true_email` enum('Y','N') DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_USER`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  KEY `SECTION_ID_idx` (`ID_SECTION`),
  KEY `BU_ID` (`ID_BU`)
) ENGINE=InnoDB AUTO_INCREMENT=2429 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_user-1
CREATE TABLE IF NOT EXISTS `tbl_user-1` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password_mobile` varchar(191) DEFAULT NULL,
  `USER_NAME` varchar(70) NOT NULL,
  `FIRST_NAME` varchar(70) NOT NULL,
  `LAST_NAME` varchar(70) NOT NULL,
  `password` varchar(225) DEFAULT NULL,
  `RANDOM_PASSWORD` varchar(191) DEFAULT NULL,
  `PASSWORD_BARU` varchar(191) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `IMAGES` varchar(50) DEFAULT NULL,
  `POSITION` varchar(25) NOT NULL,
  `ID_ROLE` int(11) NOT NULL DEFAULT '1',
  `ADMIN` int(11) NOT NULL DEFAULT '0',
  `ID_SUBSECTION` varchar(50) DEFAULT NULL,
  `ID_SECTION` int(11) DEFAULT NULL,
  `ID_DEPARTEMENT` varchar(50) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `LEVEL_DBTARGET` int(11) NOT NULL DEFAULT '0',
  `HIT` int(11) DEFAULT '1',
  `IP_LOGIN` varchar(50) DEFAULT NULL,
  `LAST_ONLINE` datetime DEFAULT NULL,
  `ONLINE` tinyint(1) DEFAULT '0',
  `ACTIVE` tinyint(1) DEFAULT '1',
  `remember_token` varchar(191) DEFAULT '1',
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `deleted_at` varchar(50) DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_USER`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  KEY `SECTION_ID_idx` (`ID_SECTION`),
  KEY `BU_ID` (`ID_BU`)
) ENGINE=InnoDB AUTO_INCREMENT=1883 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient
CREATE TABLE IF NOT EXISTS `tbl_userclient` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` enum('MR','MRS') COLLATE utf8_bin NOT NULL,
  `birth_place` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_religion` int(11) DEFAULT NULL,
  `group_religion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_etnis` int(11) DEFAULT NULL,
  `no_passport` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `name_passport` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `expired_passport` date DEFAULT NULL,
  `status` enum('NONE','SINGLE','MARRIAGE') COLLATE utf8_bin DEFAULT NULL,
  `no_of_children` int(11) DEFAULT NULL,
  `no_of_sibling` int(11) DEFAULT NULL,
  `order_of_children` int(11) DEFAULT NULL,
  `last_education` enum('SD','SMP','SMA','S1','S2','S3') COLLATE utf8_bin DEFAULT NULL,
  `photo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `active` enum('1','0') COLLATE utf8_bin DEFAULT '1',
  `insert_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `updated_at` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_user` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `RELIGION` (`id_religion`),
  KEY `ID_ETNIS` (`id_etnis`),
  KEY `ID_CITY` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=3927 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient-1
CREATE TABLE IF NOT EXISTS `tbl_userclient-1` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` enum('MR','MRS') COLLATE utf8_bin NOT NULL,
  `birth_place` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_religion` int(11) DEFAULT NULL,
  `group_religion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_etnis` int(11) DEFAULT NULL,
  `no_passport` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `name_passport` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `expired_passport` date DEFAULT NULL,
  `status` enum('NONE','SINGLE','MARRIAGE') COLLATE utf8_bin DEFAULT NULL,
  `no_of_children` int(11) DEFAULT NULL,
  `no_of_sibling` int(11) DEFAULT NULL,
  `order_of_children` int(11) DEFAULT NULL,
  `last_education` enum('SD','SMP','SMA','S1','S2','S3') COLLATE utf8_bin DEFAULT NULL,
  `photo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `active` enum('1','0') COLLATE utf8_bin DEFAULT '1',
  `insert_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `updated_at` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_user` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `RELIGION` (`id_religion`),
  KEY `ID_ETNIS` (`id_etnis`),
  KEY `ID_CITY` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_account
CREATE TABLE IF NOT EXISTS `tbl_userclient_account` (
  `id_client_account` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `type_company` enum('ADV','AGC') DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `id_client_level` int(11) DEFAULT NULL,
  `password` text,
  `remember_token` text,
  `password_reset` varchar(50) DEFAULT NULL,
  `active` enum('1','0') DEFAULT '1',
  `last_ip` varchar(50) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client_account`),
  KEY `ID_LEVEL` (`id_client_level`),
  KEY `ID_CLIENT` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3927 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_account-1
CREATE TABLE IF NOT EXISTS `tbl_userclient_account-1` (
  `id_client_account` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `type_company` enum('ADV','AGC') DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `id_client_level` int(11) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `remember_token` varchar(191) DEFAULT NULL,
  `password_reset` varchar(225) DEFAULT NULL,
  `active` enum('1','0') DEFAULT '1',
  `last_ip` varchar(50) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client_account`),
  KEY `ID_LEVEL` (`id_client_level`),
  KEY `ID_CLIENT` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_address
CREATE TABLE IF NOT EXISTS `tbl_userclient_address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `type_company` enum('AGC','ADV') DEFAULT NULL,
  `id_company` int(11) DEFAULT NULL,
  `address` text,
  `id_city` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_info
CREATE TABLE IF NOT EXISTS `tbl_userclient_info` (
  `id_client_info` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_client_infomaster` int(11) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `id_hobby` int(11) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client_info`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_infomaster
CREATE TABLE IF NOT EXISTS `tbl_userclient_infomaster` (
  `id_client_infomaster` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client_infomaster`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_level
CREATE TABLE IF NOT EXISTS `tbl_userclient_level` (
  `id_client_level` int(11) NOT NULL AUTO_INCREMENT,
  `name_level` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_client_level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_picam
CREATE TABLE IF NOT EXISTS `tbl_userclient_picam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client_account` int(11) DEFAULT NULL,
  `id_am` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `active` enum('1','0') COLLATE utf8_bin DEFAULT '1',
  `insert_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5639 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_picsgm
CREATE TABLE IF NOT EXISTS `tbl_userclient_picsgm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client_account` int(11) DEFAULT NULL,
  `id_sgm` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_bu` int(11) DEFAULT NULL,
  `active` enum('1','0') COLLATE utf8_bin DEFAULT '1',
  `insert_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_userclient_picsgm_tbl_userclient_account` (`id_client_account`)
) ENGINE=InnoDB AUTO_INCREMENT=15705 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_userclient_product
CREATE TABLE IF NOT EXISTS `tbl_userclient_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_client_account` int(11) DEFAULT NULL,
  `type` enum('ADV','BRAND','PRODUCT') DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `insert_user` varchar(50) DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_user_department
CREATE TABLE IF NOT EXISTS `tbl_user_department` (
  `ID_DEPARTEMENT` tinyint(5) NOT NULL AUTO_INCREMENT,
  `DEPARTEMENT_NAME` varchar(100) DEFAULT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL,
  `ID_BU` tinyint(5) DEFAULT NULL,
  `INSERT_USER` varchar(100) DEFAULT NULL,
  `INSERT_DATE` date DEFAULT NULL,
  `UPDATE_USER` varchar(100) DEFAULT NULL,
  `UPDATE_DATE` date DEFAULT NULL,
  `ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID_DEPARTEMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.tbl_user_section
CREATE TABLE IF NOT EXISTS `tbl_user_section` (
  `ID_SECTION` int(11) NOT NULL AUTO_INCREMENT,
  `MKT_MAP` text,
  `SECTION_NAME` varchar(50) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `NAMA_SINGKAT` varchar(50) DEFAULT NULL,
  `ID_DEPARTEMENT` tinyint(5) DEFAULT NULL,
  `ID_BU` int(11) DEFAULT NULL,
  `ID_PARENT` int(11) DEFAULT NULL,
  `IMAGES` varchar(50) DEFAULT NULL,
  `LIST_JOBDESK` varchar(50) DEFAULT NULL,
  `INTERCONNECTION` varchar(50) DEFAULT NULL,
  `OBJECTIVE` text,
  `SECTION_CATEGORY` varchar(100) DEFAULT NULL,
  `SECTION_GROUP` varchar(100) DEFAULT NULL,
  `INSERT_USER` varchar(50) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID_SECTION`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.unit_sosmed
CREATE TABLE IF NOT EXISTS `unit_sosmed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_sosmed` enum('corporate','program') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_program_unit` int(10) unsigned DEFAULT NULL,
  `sosmed_id` int(10) unsigned DEFAULT NULL,
  `unit_sosmed_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_sosmed_account_id` text COLLATE utf8mb4_unicode_ci,
  `target_use` int(10) unsigned DEFAULT NULL,
  `status_active` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `insert_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_sosmed_target_use_foreign` (`target_use`),
  CONSTRAINT `unit_sosmed_ibfk_1` FOREIGN KEY (`target_use`) REFERENCES `intra-portal`.`unit_sosmed_target` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.uploads
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resized_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table intra-baru-mediakit.youtube
CREATE TABLE IF NOT EXISTS `youtube` (
  `id_youtube` int(11) NOT NULL AUTO_INCREMENT,
  `id_bu` int(11) NOT NULL DEFAULT '0',
  `channelId` varchar(225) DEFAULT NULL,
  `nama_channel` varchar(150) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_youtube`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
