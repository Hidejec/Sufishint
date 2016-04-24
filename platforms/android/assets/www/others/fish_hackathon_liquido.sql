-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2016 at 01:10 PM
-- Server version: 5.5.45-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fish_hackathon_liquido`
--

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE IF NOT EXISTS `license` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`id`, `license_code`, `created_at`, `updated_at`) VALUES
(1, 'ASDASD', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'show_user', 'user Access', NULL, NULL),
(2, 'show_vessel', 'vessel Access', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'user', 'normal user pages', NULL, NULL),
(2, 'vessel', 'vessel pages', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(2, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sites_species`
--

CREATE TABLE IF NOT EXISTS `sites_species` (
  `sites_id` int(10) unsigned NOT NULL,
  `species_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abundance` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `habitat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sites_species_sites_id_foreign` (`sites_id`),
  KEY `sites_species_species_id_foreign` (`species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE IF NOT EXISTS `species` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vessel_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `track_vessel_id_foreign` (`vessel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `vessel_id`, `date`, `location`, `created_at`, `updated_at`) VALUES
(1, 4, '2016-04-05', 'Zamboanga', '2016-04-04 16:00:00', '2016-04-04 16:00:00'),
(5, 4, '2016-04-16', 'Zamboanga', '2016-04-23 16:17:53', NULL),
(8, 4, '2016-04-16', 'Zamboanga', '2016-04-23 16:21:07', NULL),
(10, 4, '2016-04-16', 'General Santos', '2016-04-23 16:22:40', NULL),
(13, 4, '2016-04-16', 'General Santos', '2016-04-23 16:23:51', NULL),
(14, 4, '2016-04-24', 'Makati', '2016-04-23 16:23:55', NULL),
(15, 4, '2016-04-24', 'Makati', '2016-04-23 16:30:56', NULL),
(16, 4, '2016-04-24', 'Makati', '2016-04-23 16:32:40', NULL),
(17, 4, '2016-04-24', 'Makati', '2016-04-23 16:33:01', NULL),
(18, 4, '2016-04-24', 'Makati', '2016-04-23 16:46:19', NULL),
(19, 4, '2016-04-24', 'Makati', '2016-04-23 16:50:45', NULL),
(20, 4, '2016-04-24', 'Makati', '2016-04-23 16:51:14', NULL),
(21, 4, '2016-04-24', 'Makati', '2016-04-23 17:10:00', NULL),
(22, 4, '2016-04-24', 'Makati', '2016-04-23 17:10:17', NULL),
(23, 4, '2016-04-24', 'Makati', '2016-04-23 17:10:50', NULL),
(24, 4, '2016-04-24', 'Makati', '2016-04-23 17:42:09', NULL),
(25, 4, '2016-04-24', 'Makati', '2016-04-23 18:13:22', NULL),
(26, 4, '2016-04-24', 'Makati', '2016-04-23 18:14:47', NULL),
(27, 4, '2016-04-24', 'Makati', '2016-04-23 18:14:53', NULL),
(28, 4, '2016-04-24', 'Makati', '2016-04-23 18:53:40', NULL),
(29, 4, '2016-04-24', 'Makati', '2016-04-23 19:01:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Jerico.pulvera@outlook.ph', '$2y$10$ieJMCtp0VFISb/gB06VxieKWorvalGUTmSPMvEMkMf3l1w8XdSXLW', NULL, '2016-04-23 07:53:19', '2016-04-23 07:53:19'),
(10, 'jerico@yahoo.com', '$2y$10$MDTku56AHh2zy9rL5k7/meEJ3TGL5Kaoinu9S7pwngf7zdSwqcn3u', NULL, '2016-04-24 01:11:29', '2016-04-24 01:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

CREATE TABLE IF NOT EXISTS `vessels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `license_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `license_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vessels_email_unique` (`email`),
  KEY `vessels_license_id_foreign` (`license_id`),
  KEY `vessels_user_id_foreign` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vessels`
--

INSERT INTO `vessels` (`id`, `license_id`, `user_id`, `email`, `company_name`, `officer`, `license_code`, `contact_number`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 1, 9, 'Jerico.pulvera@outlook.ph', '', '', '', '', '$2y$10$vXlhnMBnuKpgiMmQCQUOP.hS2/zuQANX3cpozP3z1SMAqiDAi5kpS', NULL, '2016-04-23 07:53:19', '2016-04-23 07:53:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites_species`
--
ALTER TABLE `sites_species`
  ADD CONSTRAINT `sites_species_sites_id_foreign` FOREIGN KEY (`sites_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sites_species_species_id_foreign` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_vessel_id_foreign` FOREIGN KEY (`vessel_id`) REFERENCES `vessels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vessels`
--
ALTER TABLE `vessels`
  ADD CONSTRAINT `vessels_license_id_foreign` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vessels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
