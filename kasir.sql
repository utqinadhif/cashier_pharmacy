-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2019 at 05:27 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `user_id`, `username`, `created`, `updated`) VALUES
(2, 'Obat Cacing', 2, 'apt.sriwedari', '2019-07-01 06:52:22', '2019-07-01 06:52:22'),
(3, 'Obat Batuk', 2, 'apt.sriwedari', '2019-07-01 06:52:31', '2019-07-01 06:52:31'),
(4, 'Obat Demam', 2, 'apt.sriwedari', '2019-07-01 06:52:42', '2019-07-01 06:52:42'),
(5, 'Obat Batuk Pilek', 2, 'apt.sriwedari', '2019-07-01 06:52:49', '2019-07-01 06:52:49'),
(6, 'Obat Pilek', 2, 'apt.sriwedari', '2019-07-01 06:52:55', '2019-07-01 06:52:55'),
(7, 'Obat Diare', 2, 'apt.sriwedari', '2019-07-01 06:53:08', '2019-07-01 06:53:08'),
(8, 'Lain-Lain', 2, 'apt.sriwedari', '2019-07-01 06:53:16', '2019-07-01 06:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `value`) VALUES
(1, 'general', '{\"store\":\"APOTEK SRIWEDARI\",\"address\":\"Jl Pati - Gabus KM. 03, Banjarsari 01\\/01 Gabus\",\"phone\":\"081215140614\",\"printer\":\"\\\\\\\\localhost\\\\kasir\\\\\",\"theme\":\"skin-purple\"}');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id`, `name`, `address`, `phone`, `user_id`, `username`, `created`, `updated`) VALUES
(2, 'Sehat Bersama Sejahtera (SBS)', 'Kel. Mlati Kidul 01/01, Kec. Kudus', '0291431318', 2, 'admin', '2019-06-29 16:49:45', '2019-06-29 16:49:45'),
(3, 'Tirta Husada Farma', 'Jl. Tondonegoro No. 17 Pati ', '0295383700', 2, 'admin', '2019-06-29 19:09:09', '2019-06-29 19:09:09'),
(4, 'Sehati', 'Jl. Kol. Sugiyono 2B1 Pati', '-', 2, 'apt.sriwedari', '2019-06-30 11:28:32', '2019-06-30 11:28:32'),
(5, 'Surya Baru', 'Jl. Jend Sudirman 148/150 Pati', '0295381495', 2, 'apt.sriwedari', '2019-07-01 05:24:02', '2019-07-01 05:24:02'),
(6, 'CV. Bengawan Multi Trading', 'Jl. DR. Sutomo Pati', '-', 2, 'apt.sriwedari', '2019-07-01 05:36:03', '2019-07-01 05:36:03');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `name`, `is_main`, `user_id`, `username`, `created`, `updated`) VALUES
(2, 'Normal', 1, 2, 'apt.sriwedari', '2019-07-01 06:50:24', '2019-07-01 06:50:24'),
(3, 'Diskon', 0, 2, 'apt.sriwedari', '2019-07-01 06:50:29', '2019-07-01 06:50:29'),
(4, 'Resep', 0, 2, 'apt.sriwedari', '2019-07-01 06:50:34', '2019-07-01 06:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `stock` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `stock`, `unit`, `category_id`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 'paramex', 5, 'pcs', 1, 4, 'Febri', '2019-06-28 17:47:54', '2019-06-29 21:25:36'),
(2, 'oskadon', 20, '', 0, 2, 'apt.sriwedari', '2019-06-28 20:15:52', '2019-06-29 21:22:25'),
(3, 'madu', 12, '', 0, 2, 'apt.sriwedari', '2019-06-28 20:22:35', '2019-06-29 21:22:25'),
(4, 'jahe', 5, '', 0, 2, 'apt.sriwedari', '2019-06-28 20:22:35', '2019-06-29 21:22:25'),
(5, 'Antangin Cair Junior', 10, 'sach', 8, 2, 'apt.sriwedari', '2019-06-29 19:25:34', '2019-07-01 10:43:45'),
(6, 'Antangin JRG Cair isi 12', 24, 'sach', 8, 2, 'apt.sriwedari', '2019-06-29 19:25:34', '2019-07-01 10:44:05'),
(7, 'Balsam Elang 40gr', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:25:34', '2019-07-01 10:44:54'),
(8, 'Betadin Solution 5 ml', 6, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:45:32'),
(9, 'Betadin Solution 15 ml', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:46:00'),
(10, 'Betadine Solutin 30 ml', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:46:21'),
(11, 'Dettol Cair 100 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:46:50'),
(12, 'Dettol Cair 250 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:47:11'),
(13, 'Gandapura Elang 30 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:31:36', '2019-07-01 10:48:06'),
(14, 'Gandapura Cair 60 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:47:44'),
(15, 'Herocyn Bedak 85 gr', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:49:17'),
(16, 'Herocyn Bedak Bayi 100 gr', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:49:46'),
(17, 'Larutan Cap Badak 500 ml', 4, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:50:29'),
(18, 'Listerine Greentea 80 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:51:07'),
(19, 'Listerine Greentea 250 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:51:27'),
(20, 'Listerine Coolmint 250 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:38:32', '2019-07-01 10:51:47'),
(21, 'Listerine Original 250 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:40:10', '2019-07-01 10:35:56'),
(22, 'Madurasa sacht', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:36:21'),
(23, 'Minyak Tawon DD 35 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:38:04'),
(24, 'Minyak Tawon EE 65 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:38:22'),
(25, 'Minyak Telon Konicare 30 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:44:53'),
(26, 'Minyak Telon Konicare 60 ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:45:12'),
(27, 'Salicyl Talk 75 gr Cito', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:45:44'),
(28, 'Salicyl Talk Parfm 50 gr Cito', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-29 19:53:31', '2019-07-01 10:46:02'),
(29, 'Tolak Angin Anak', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-29 20:00:29', '2019-07-01 10:46:32'),
(30, 'Bye Bye Fever Anak', 5, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-29 20:00:29', '2019-07-01 10:46:58'),
(31, 'Bye Bye Fever Baby', 10, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-29 20:00:29', '2019-07-01 10:47:15'),
(32, 'Hansaplast Jumbo', 24, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-29 20:00:29', '2019-07-01 10:47:36'),
(33, 'Komix Jeruk Nipis', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:03:55', '2019-06-30 05:14:32'),
(34, 'Komix Jahe', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:03:55', '2019-06-30 05:14:32'),
(35, 'Komix Mint', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:03:55', '2019-06-30 05:14:32'),
(36, 'Komix Kids Straw', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:03:55', '2019-06-30 05:14:32'),
(37, 'Bodrex flu&batuk tdk berdahak', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:03:55', '2019-06-30 05:14:32'),
(38, 'Bodrex Migra', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(39, 'Bodrexin tab', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(40, 'Counterpain Tube 30 gr', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(41, 'Counterpain Tube 60 gr', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(42, 'Diapet kapsul', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(43, 'Diapet Anak Sacht', 18, '', 0, 1, 'nadhif', '2019-06-29 20:13:53', '2019-07-01 21:16:22'),
(44, 'Dulcolac tab', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-07-01 07:11:43'),
(45, 'Sakatonik ABC Antariksa', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(46, 'Vidoraan Smart jrk/straw', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:13:53', '2019-06-30 05:14:35'),
(47, 'Panadol biru', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(48, 'Panadol Extra/Merah', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(49, 'Lactacyd Feminim 60ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(50, 'Paramex', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(51, 'Promag tab', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(52, 'Fatigon Spirit', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(53, 'Mixagrip tab', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(54, 'combantrin jeruk 10ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(55, 'Hufagrip TMP 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(56, 'Mylanta liquid 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(57, 'Mylanta Liquid 150 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(58, 'Sangobion Vitatonik 250 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(59, 'One Med test hamil', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:29:13', '2019-06-30 05:14:37'),
(60, 'Hufagrip BP 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(61, 'Hufagrip Pilek 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(62, 'OBH Combi Anak Jeruk 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(63, 'OBH Combi Plus 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(64, 'OBH Tropica extra 60 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(65, 'OBH Tropica Extra 100 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(66, 'Paratusin syr', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:35:42', '2019-06-30 05:14:40'),
(67, 'Fitkom tab jeruk', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:02'),
(68, 'Fitkom tab straw', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:02'),
(69, 'Tolak Angin Linu', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:02'),
(70, 'Vigel 30 gr', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:03'),
(71, 'Vigel 60 gr', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:03'),
(72, 'Gajah MKP 120 ml', 0, '', 0, 2, 'apt.sriwedari', '2019-06-29 20:55:19', '2019-06-30 05:14:03'),
(73, 'Verban KB merah 4x5cm', 50, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:40:14'),
(74, 'Larutan Kaki 3 200ml', 3, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:40:46'),
(75, 'MBK Putih', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:41:12'),
(76, 'MBK Super', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:41:31'),
(77, 'Parcok 25ml', 1, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:42:21'),
(78, 'Parcok 75ml', 1, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:42:41'),
(79, 'Anakonidin 60ml', 1, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 07:43:17'),
(80, 'Antimo Tab', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 11:55:14', '2019-07-01 07:43:38'),
(81, 'Uni Baby Cough', 3, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 11:55:14', '2019-07-01 07:44:01'),
(82, 'Biolysin Syr 60ml', 2, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 12:02:37', '2019-07-01 07:44:27'),
(83, 'Bodrexin FB Berdahak syr', 2, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 12:02:38', '2019-07-01 07:45:20'),
(84, 'Bodrexin Demam Syr', 2, 'btl', 8, 2, 'apt.sriwedari', '2019-06-30 12:04:47', '2019-07-01 07:45:43'),
(85, 'Dragon MKP 100ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:46:12'),
(86, 'Dragon MKP 60ml', 1, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:46:27'),
(87, 'Telon Lang 60ml', 1, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:47:08'),
(88, 'Telon Lang 30ml', 4, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:46:54'),
(89, 'Tolak Angin Cair 12\'', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:47:54'),
(90, 'Tolak Angin Flu 12\'', 12, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:48:20'),
(91, 'Fitkom Gummy', 1, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:48:44'),
(92, 'Gajah Salicyl Menth 100g', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:49:24'),
(93, 'IPI Vit B12', 2, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:00:12'),
(94, 'Medicated Oil 12ml', 1, 'tub', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:49:58'),
(95, 'Mixagrip FB tab', 25, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:50:49'),
(96, 'My Baby Telon Plus 90ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:51:11'),
(97, 'My Baby Telon plus 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:51:35'),
(98, 'Natur E 16\'', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:52:29'),
(99, 'Nellco Spesial 55ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:18:16', '2019-07-01 07:52:48'),
(100, 'OB Herbal 100ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:53:17'),
(101, 'OB Herbal anak', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:53:37'),
(102, 'OBH Combi Anak Straw', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:54:04'),
(103, 'OBH Combi Anak Madu', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:54:33'),
(104, 'Salonpas Hijau', 5, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:54:56'),
(105, 'Salonpas Merah', 5, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:55:18'),
(106, 'Sanaflu', 25, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:55:37'),
(107, 'Scott Emulsion Jrk 200ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:56:02'),
(108, 'Sensi Gloves 100\'', 200, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:56:25'),
(109, 'Siladex biru 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:56:48'),
(110, 'Siladex Merah 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:57:03'),
(111, 'Sutra Mrh 3\'', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:57:42'),
(112, 'Sutra Htm 3\'', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:57:27'),
(113, 'Tonikum Bayer 100ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:58:09'),
(114, 'Tonikum Bayer 330ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:58:33'),
(115, 'Ultraflu', 25, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:59:08'),
(116, 'Vicks F 44 Dws 100ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 07:59:33'),
(117, 'Vicks F44 Dws 27ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:00:11'),
(118, 'Vicks F44 Anak 27ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:02:37'),
(119, 'Woods Syr Biru 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:03:15'),
(120, 'Woods Syr Merah 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:03:36'),
(121, 'Farsifen Syr', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:04:36'),
(122, 'Proris Syr', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:04:55'),
(123, 'OBH Itrasal', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:05:38'),
(124, 'Ikadry Flu 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:05:58'),
(125, 'Antimo Ank Straw 5ml 10\'', 22, 'sach', 8, 1, 'nadhif', '2019-06-30 12:50:01', '2019-07-02 17:45:48'),
(126, 'Promag Gazero Cair 6\'', 6, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:06:48'),
(127, 'Madu TJ Panas Dalam 150g', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:09:50'),
(128, 'Anakonidin OBH 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:08:19'),
(129, 'Woods Herbal Hijau 60ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:04:09'),
(130, 'Vidoran Gummy Frugie', 1, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:08:45'),
(131, 'TJ Joybee Madu Jrk', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:09:20'),
(132, 'TJ Joybee Madu Straw', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:50:01', '2019-07-01 08:09:33'),
(133, 'Madu TJ Kurma 150g', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:52:10', '2019-07-01 08:07:52'),
(134, 'Anakonidin herbal 30ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:52:10', '2019-07-01 08:10:07'),
(135, 'Rivanol 100ml Cito', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:52:10', '2019-07-01 08:10:36'),
(136, 'Ikadryl Batuk Merah', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:54:30', '2019-07-01 08:18:24'),
(137, 'Coparcetin syr', 14, 'fls', 8, 1, 'nadhif', '2019-06-30 12:54:30', '2019-07-01 21:14:24'),
(138, 'Bronchitin syr', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 12:54:30', '2019-07-01 08:17:42'),
(139, 'Combantrin 250 mg tab', 2, 'pcs', 2, 1, 'nadhif', '2019-06-30 21:01:54', '2019-07-02 17:42:35'),
(140, 'combantrin 125 mg tab', 2, 'pcs', 2, 1, 'nadhif', '2019-06-30 21:01:54', '2019-07-02 17:42:35'),
(141, 'decolgen tab', 3, 'pcs', 8, 1, 'nadhif', '2019-06-30 21:01:55', '2019-07-02 17:42:35'),
(142, 'Enervon C strip', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 06:56:10'),
(143, 'feminax tab', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 06:58:02'),
(144, 'Ipi vit A', 2, 'Fls', 8, 1, 'nadhif', '2019-06-30 21:01:56', '2019-07-02 17:43:39'),
(145, 'Ipi Vit B complex', 2, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 06:59:56'),
(146, 'Ipi Vit C', 2, 'Fls', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:00:35'),
(147, 'Napacin tab', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:02:29'),
(148, 'pagoda salep 10 gr', 2, 'tub', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:04:06'),
(149, 'Salep 88', 3, 'tub', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:38:04'),
(150, 'Vitalong C strip', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:09:36'),
(151, 'Woods Permen', 6, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 08:02:48'),
(152, 'Intunal tab', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:12:35'),
(153, 'Strepsil Cool', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:13:57'),
(154, 'Strepsil Honey/Kuning', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:14:11'),
(155, 'Ever E 250 amplop', 2, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-06-30 21:01:56'),
(156, 'Strepsil Regular/Merah', 2, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 21:01:56', '2019-07-01 07:14:24'),
(229, 'Imboost tab 50 s', 50, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 21:07:06', '2019-07-01 10:58:24'),
(230, 'Aspilet tab', 10, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:53:53'),
(231, 'bisoprolol 5mg', 30, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:54:33'),
(232, 'Imboost kids 60 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:56:03'),
(233, 'Kassa steril medika', 5, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:56:30'),
(234, 'Hirokids blackcurrant 60 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:57:02'),
(235, 'Hirokids jrk 60 ml', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 10:57:17'),
(236, 'oskadon tab', 50, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(237, 'fasidol tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(238, 'demacoline tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(239, 'tera - f tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(240, 'lodecon tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(241, 'mixalgin tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(242, 'Bufacaryl tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(243, 'infalgin tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(244, 'Paracetamol 500mg MEF', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(245, 'farsifen tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(246, 'Dexanta tab', 10, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(247, 'Neo Rheumacyl', 24, '', 0, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-06-30 21:26:25'),
(248, 'Aletrol TM', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 08:58:54'),
(249, 'Andalan Pil KB Biru/strip', 15, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:01:05'),
(250, 'Bodrex Tb New', 9, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:34:23'),
(251, 'Braito Ori 5ml', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:25:25'),
(252, 'Cendo Asthenof TM 5ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:26:46'),
(253, 'Cendo Catarlent TM 5ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:29:38'),
(254, 'Cendo Xltrol TM 5ml', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 09:29:58'),
(255, 'Cdr EFF-10', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:03:19'),
(256, 'Cdr Fortos', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:06:05'),
(257, 'Cdr Fruit', 1, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:06:30'),
(260, 'Curcuma Plus 60ml', 3, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:07:46'),
(261, 'Entrostop', 6, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:09:20'),
(262, 'Entrostop HB Anak', 6, 'sach', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:10:30'),
(263, 'Ester C', 12, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:15:36'),
(264, 'Imbost', 5, 'Strip', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:16:17'),
(265, 'Insto', 2, 'fls', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:18:02'),
(266, 'Microgynon', 10, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:18:27'),
(267, 'Microlax 5ml', 3, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 11:19:55'),
(268, 'Paramex Nyeri Otot Merah', 25, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(269, 'Redoxon', 1, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(270, 'Rohto Cool 7ml', 2, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(271, 'Sakatonik ABC Straw', 1, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(272, 'Ultracap', 25, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(273, 'Visine', 2, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(274, 'Vital Ear Oil', 2, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(275, 'masker earloop', 100, 'pcs', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 07:19:44'),
(276, 'Masker Sensi Headloop', 100, 'pcs', 8, 1, 'nadhif', '2019-06-30 23:15:42', '2019-07-01 23:20:15'),
(277, 'Tissue Magic Man Hitam', 1, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(278, 'Tissue Super Magic Merah', 1, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(279, 'Medicated Oil 20ml', 1, 'tub', 8, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 07:50:15'),
(280, 'Medicated Oil 40ml', 1, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-06-30 23:15:42'),
(281, 'Vicks Vaporus', 12, '', 0, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 05:19:08'),
(282, 'vitacimin', 0, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:26:13', '2019-07-01 06:22:23'),
(283, 'SGM 1 Ananda 150gr', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:30:31', '2019-07-01 05:30:31'),
(284, 'SGM Eksplore 3+', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:30:31', '2019-07-01 05:30:31'),
(285, 'Avail Day Use Hijau', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:30:31', '2019-07-01 05:30:31'),
(286, 'Avail Pantyliner Hijau', 2, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:30:31', '2019-07-01 05:30:31'),
(287, 'Avail Night Use Ungu', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:33:46', '2019-07-01 05:33:47'),
(288, 'Diabetasol Vanila 180gr', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:33:46', '2019-07-01 05:33:47'),
(289, 'Diabetasol Coklat 180gr', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:33:46', '2019-07-01 05:33:47'),
(290, 'Anlene Gold Vanilla 180gr', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:33:46', '2019-07-01 05:33:47'),
(291, 'Anlene Gold Coklat 250gr', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:33:46', '2019-07-01 05:33:47'),
(292, 'Entrasol QS Vanila 5S', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(293, 'Entrasol QS Coklat 5S', 1, '', 0, 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(294, 'Betadine Grg 100ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(295, 'Betadine Grg 190ml', 1, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(296, 'Alkohol 70% 100ml', 105, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 22:55:22'),
(297, 'Balsam K3 YLW 20gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(298, 'Balsem Balpirik Hijau', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(299, 'Balsem Balpirik Lvdr 20gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(300, 'Balsem Balpirik Merah', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(301, 'Balsem Geliga 20gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(302, 'Balsem Geliga 40gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(303, 'Balsem Lang 20gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(304, 'Caladine Ltn 60ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(305, 'Caladine Ltn 95ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(306, 'Caladine Powder 100gr', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(307, 'Fresh Care GT 10ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(308, 'Fresh Care LVD 10ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(309, 'Fresh Care MAA Strong 10ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(310, 'Fresh Care ORG', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(311, 'GPU Krim 150gr', 1, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(312, 'GPU Krim 60gr', 1, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(313, 'Minyak Urut GPU 30ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(314, 'Minyak Urut GPU 60ml', 2, '', 0, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 20:03:02'),
(315, 'Gajah MKP 30ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:09:47', '2019-07-01 20:02:56'),
(316, 'Gajah MKP 60ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:09:47', '2019-07-01 20:02:56'),
(317, 'Hot In CRM 120ml', 1, '', 0, 1, 'nadhif', '2019-07-01 06:09:47', '2019-07-01 20:02:56'),
(318, 'Hot In CRM 60ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:09:47', '2019-07-01 20:02:56'),
(319, 'Kapas Selection', 12, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(320, 'Konicare MT 30ml', 1, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(321, 'KOnicare MT 60ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(322, 'Lang MKP 120ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(323, 'Lang MKP 30ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(324, 'Madu TJ 150gr', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(325, 'Madu TJ 250gr', 1, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(326, 'Minyak Kapak 10ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(327, 'Minyak Kapak 28ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(328, 'Sari Kurma TJ 250ml', 2, '', 0, 1, 'nadhif', '2019-07-01 06:21:47', '2019-07-01 20:02:56'),
(329, 'Softex Maternity 10s', 1, 'pcs', 8, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(330, 'Madurasa Kurma 150gr', 1, 'fls', 8, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(331, 'Madurasa Premium 150gr', 1, 'fls', 8, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(332, 'SUN Tim Ayamsayur', 1, 'pcs', 8, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(333, 'Sleek Baby 70ml', 4, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(334, 'Mitu Wipes Biru', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(335, 'Mitu wipes ungu', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(336, 'Ranita Cotton Bud 60', 5, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(337, 'Ranita Cottonbud Baby 100', 6, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(338, 'Cusson Baby pwd 100gr', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(339, 'My Baby Pwd 100gr', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(340, 'Rita bedak', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(341, 'Mamy poko NB9', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(342, 'Mamy poko S11', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(343, 'Mamy poko M9', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(344, 'Softek DS23cm isi 20', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(345, 'Softex DS29cm isi 8+2', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(346, 'Tessa TP', 3, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(347, 'Sweety pants S9+1', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(348, 'Sweety Pant m8+1', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(349, 'Sweety Pants L7+1', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(350, 'Sweety Pant XL6+1', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(351, 'Laurier 22cm 18', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(352, 'Laurier 22cm 8', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(353, 'SUN beras merah 100gr', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(354, 'Tropicana Gula Diabtx', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(355, 'Tropicana Gula Diabtx 50', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(356, 'Diabetasol Gula 25', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(357, 'Diabetasol Gula 50', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(358, 'Lifree celana L4', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(359, 'Lifree Celana XL3', 1, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(360, 'Tessa 250s', 2, '', 0, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 20:03:14'),
(361, 'New Diatab', 25, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(362, 'Contrexyn', 25, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(363, 'Laxing', 25, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(364, 'Tolak Linu', 10, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(365, 'Ever E 12S', 2, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(366, 'Antimo Ank Jrk 10s', 10, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(367, 'Genoint SK', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(368, 'Genoint SM', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(369, 'Erla SM', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(370, 'Betametason SK', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(371, 'Kalcinol N', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(372, 'Betason N', 3, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(373, 'Kalpanax Cr', 2, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(374, 'Kapsida', 2, '', 0, 2, 'apt.sriwedari', '2019-07-01 06:45:22', '2019-07-01 06:45:22'),
(375, 'Alat tensi Omron Hem 7120', 25, '', 0, 1, 'nadhif', '2019-07-01 07:35:23', '2019-07-02 17:45:48'),
(376, 'Embalase Resep', 3, 'pcs', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(377, 'Anacetine', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(378, 'Antasida Susp AFI', 3, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(379, 'Batugin 120ml', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(380, 'Caviplex Syr 120ml', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(382, 'Cerebrofort G Straw 100ml', 1, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(383, 'Hufagesic Drop 16ml', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(384, 'Itramol', 3, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(385, 'Laserin 110ml', 1, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(386, 'OBH Combi 100ml', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(387, 'Paracetamol Syr Mersi 60ml', 3, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(388, 'Sucralfat Susp MEPRO 100ml', 2, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(389, 'Zink Syr Mepro', 3, 'fls', 8, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 19:15:31'),
(409, 'Cerebrofort G org 100 ml', 0, 'fls', 8, 2, 'apt.sriwedari', '2019-07-01 11:12:26', '2019-07-01 11:12:26'),
(410, 'telek', 12, '', 0, 1, 'nadhif', '2019-07-01 22:59:08', '2019-07-01 22:59:43'),
(411, 'tem', 12, '', 0, 1, 'nadhif', '2019-07-01 23:03:49', '2019-07-01 23:05:17'),
(412, 'es teh', 12, '', 0, 1, 'nadhif', '2019-07-02 17:45:00', '2019-07-02 17:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE `product_price` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `price_id` int(11) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`id`, `product_id`, `price_id`, `price`, `user_id`, `username`, `created`, `updated`) VALUES
(2, 139, 2, 14500, 2, 'apt.sriwedari', '2019-07-01 06:53:55', '2019-07-01 06:53:55'),
(3, 139, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:53:55', '2019-07-01 06:53:55'),
(4, 139, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:53:55', '2019-07-01 06:53:55'),
(5, 140, 2, 14000, 2, 'apt.sriwedari', '2019-07-01 06:54:16', '2019-07-01 06:54:16'),
(6, 140, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:54:16', '2019-07-01 06:54:16'),
(7, 140, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:54:16', '2019-07-01 06:54:16'),
(8, 141, 2, 2000, 2, 'apt.sriwedari', '2019-07-01 06:55:17', '2019-07-01 06:55:17'),
(9, 141, 3, 1900, 2, 'apt.sriwedari', '2019-07-01 06:55:17', '2019-07-01 06:55:17'),
(10, 141, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:55:17', '2019-07-01 06:55:17'),
(11, 142, 2, 4600, 2, 'apt.sriwedari', '2019-07-01 06:56:10', '2019-07-01 06:56:10'),
(12, 142, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:56:10', '2019-07-01 06:56:10'),
(13, 142, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:56:10', '2019-07-01 06:56:10'),
(14, 143, 2, 2500, 2, 'apt.sriwedari', '2019-07-01 06:58:02', '2019-07-01 06:58:02'),
(15, 143, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:58:02', '2019-07-01 06:58:02'),
(16, 143, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:58:02', '2019-07-01 06:58:02'),
(17, 144, 2, 4800, 2, 'apt.sriwedari', '2019-07-01 06:59:37', '2019-07-01 06:59:37'),
(18, 144, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:59:37', '2019-07-01 06:59:37'),
(19, 144, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:59:37', '2019-07-01 06:59:37'),
(20, 145, 2, 4800, 2, 'apt.sriwedari', '2019-07-01 06:59:56', '2019-07-01 06:59:56'),
(21, 145, 3, 0, 2, 'apt.sriwedari', '2019-07-01 06:59:56', '2019-07-01 06:59:56'),
(22, 145, 4, 0, 2, 'apt.sriwedari', '2019-07-01 06:59:56', '2019-07-01 06:59:56'),
(23, 93, 2, 4800, 2, 'apt.sriwedari', '2019-07-01 07:00:12', '2019-07-01 07:00:12'),
(24, 93, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:00:12', '2019-07-01 07:00:12'),
(25, 93, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:00:12', '2019-07-01 07:00:12'),
(26, 146, 2, 4800, 2, 'apt.sriwedari', '2019-07-01 07:00:35', '2019-07-01 07:00:35'),
(27, 146, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:00:35', '2019-07-01 07:00:35'),
(28, 146, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:00:35', '2019-07-01 07:00:35'),
(29, 147, 2, 2500, 2, 'apt.sriwedari', '2019-07-01 07:02:29', '2019-07-01 07:02:29'),
(30, 147, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:02:29', '2019-07-01 07:02:29'),
(31, 147, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:02:29', '2019-07-01 07:02:29'),
(32, 148, 2, 5400, 2, 'apt.sriwedari', '2019-07-01 07:04:06', '2019-07-01 07:04:06'),
(33, 148, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:04:06', '2019-07-01 07:04:06'),
(34, 148, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:04:06', '2019-07-01 07:04:06'),
(35, 149, 2, 10000, 2, 'apt.sriwedari', '2019-07-01 07:04:44', '2019-07-01 07:05:38'),
(36, 149, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:04:44', '2019-07-01 07:04:44'),
(37, 149, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:04:44', '2019-07-01 07:04:44'),
(38, 150, 2, 5500, 2, 'apt.sriwedari', '2019-07-01 07:09:36', '2019-07-01 07:09:36'),
(39, 150, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:09:36', '2019-07-01 07:09:36'),
(40, 150, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:09:36', '2019-07-01 07:09:36'),
(41, 151, 2, 3700, 2, 'apt.sriwedari', '2019-07-01 07:10:53', '2019-07-01 07:10:53'),
(42, 151, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:10:53', '2019-07-01 07:10:53'),
(43, 151, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:10:53', '2019-07-01 07:10:53'),
(44, 44, 2, 7800, 2, 'apt.sriwedari', '2019-07-01 07:11:43', '2019-07-01 07:11:43'),
(45, 44, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:11:43', '2019-07-01 07:11:43'),
(46, 44, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:11:43', '2019-07-01 07:11:43'),
(47, 152, 2, 2800, 2, 'apt.sriwedari', '2019-07-01 07:12:35', '2019-07-01 07:12:35'),
(48, 152, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:12:35', '2019-07-01 07:12:35'),
(49, 152, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:12:35', '2019-07-01 07:12:35'),
(50, 153, 2, 9200, 2, 'apt.sriwedari', '2019-07-01 07:13:57', '2019-07-01 07:13:57'),
(51, 153, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:13:57', '2019-07-01 07:13:57'),
(52, 153, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:13:57', '2019-07-01 07:13:57'),
(53, 154, 2, 9200, 2, 'apt.sriwedari', '2019-07-01 07:14:11', '2019-07-01 07:14:11'),
(54, 154, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:14:11', '2019-07-01 07:14:11'),
(55, 154, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:14:11', '2019-07-01 07:14:11'),
(56, 156, 2, 9200, 2, 'apt.sriwedari', '2019-07-01 07:14:24', '2019-07-01 07:14:24'),
(57, 156, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:14:24', '2019-07-01 07:14:24'),
(58, 156, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:14:24', '2019-07-01 07:14:24'),
(59, 276, 2, 700, 2, 'apt.sriwedari', '2019-07-01 07:17:59', '2019-07-01 07:17:59'),
(60, 276, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:17:59', '2019-07-01 07:17:59'),
(61, 276, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:17:59', '2019-07-01 07:17:59'),
(62, 275, 2, 500, 2, 'apt.sriwedari', '2019-07-01 07:19:44', '2019-07-01 07:19:44'),
(63, 275, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:19:44', '2019-07-01 07:19:44'),
(64, 275, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:19:44', '2019-07-01 07:19:44'),
(65, 73, 2, 1200, 2, 'apt.sriwedari', '2019-07-01 07:40:14', '2019-07-01 07:40:14'),
(66, 73, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:40:14', '2019-07-01 07:40:14'),
(67, 73, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:40:14', '2019-07-01 07:40:14'),
(68, 74, 2, 3200, 2, 'apt.sriwedari', '2019-07-01 07:40:47', '2019-07-01 07:40:47'),
(69, 74, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:40:47', '2019-07-01 07:40:47'),
(70, 74, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:40:47', '2019-07-01 07:40:47'),
(71, 75, 2, 1800, 2, 'apt.sriwedari', '2019-07-01 07:41:12', '2019-07-01 07:41:44'),
(72, 75, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:41:12', '2019-07-01 07:41:12'),
(73, 75, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:41:12', '2019-07-01 07:41:12'),
(74, 76, 2, 2300, 2, 'apt.sriwedari', '2019-07-01 07:41:31', '2019-07-01 07:41:31'),
(75, 76, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:41:31', '2019-07-01 07:41:31'),
(76, 76, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:41:31', '2019-07-01 07:41:31'),
(77, 77, 2, 7200, 2, 'apt.sriwedari', '2019-07-01 07:42:21', '2019-07-01 07:42:21'),
(78, 77, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:42:21', '2019-07-01 07:42:21'),
(79, 77, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:42:21', '2019-07-01 07:42:21'),
(80, 78, 2, 15200, 2, 'apt.sriwedari', '2019-07-01 07:42:41', '2019-07-01 07:42:41'),
(81, 78, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:42:41', '2019-07-01 07:42:41'),
(82, 78, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:42:41', '2019-07-01 07:42:41'),
(83, 79, 2, 11500, 2, 'apt.sriwedari', '2019-07-01 07:43:17', '2019-07-01 07:43:17'),
(84, 79, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:43:17', '2019-07-01 07:43:17'),
(85, 79, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:43:17', '2019-07-01 07:43:17'),
(86, 80, 2, 4500, 2, 'apt.sriwedari', '2019-07-01 07:43:38', '2019-07-01 07:43:38'),
(87, 80, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:43:38', '2019-07-01 07:43:38'),
(88, 80, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:43:38', '2019-07-01 07:43:38'),
(89, 81, 2, 5000, 2, 'apt.sriwedari', '2019-07-01 07:44:01', '2019-07-01 07:44:01'),
(90, 81, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:44:01', '2019-07-01 07:44:01'),
(91, 81, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:44:01', '2019-07-01 07:44:01'),
(92, 82, 2, 12200, 2, 'apt.sriwedari', '2019-07-01 07:44:27', '2019-07-01 07:44:27'),
(93, 82, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:44:27', '2019-07-01 07:44:27'),
(94, 82, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:44:27', '2019-07-01 07:44:27'),
(95, 83, 2, 9500, 2, 'apt.sriwedari', '2019-07-01 07:45:20', '2019-07-01 07:45:20'),
(96, 83, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:45:20', '2019-07-01 07:45:20'),
(97, 83, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:45:20', '2019-07-01 07:45:20'),
(98, 84, 2, 9000, 2, 'apt.sriwedari', '2019-07-01 07:45:43', '2019-07-01 07:45:43'),
(99, 84, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:45:43', '2019-07-01 07:45:43'),
(100, 84, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:45:43', '2019-07-01 07:45:43'),
(101, 85, 2, 28200, 2, 'apt.sriwedari', '2019-07-01 07:46:12', '2019-07-01 07:46:12'),
(102, 85, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:12', '2019-07-01 07:46:12'),
(103, 85, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:12', '2019-07-01 07:46:12'),
(104, 86, 2, 17200, 2, 'apt.sriwedari', '2019-07-01 07:46:27', '2019-07-01 07:46:27'),
(105, 86, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:27', '2019-07-01 07:46:27'),
(106, 86, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:27', '2019-07-01 07:46:27'),
(107, 88, 2, 8200, 2, 'apt.sriwedari', '2019-07-01 07:46:54', '2019-07-01 07:46:54'),
(108, 88, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:54', '2019-07-01 07:46:54'),
(109, 88, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:46:54', '2019-07-01 07:46:54'),
(110, 87, 2, 15200, 2, 'apt.sriwedari', '2019-07-01 07:47:08', '2019-07-01 07:47:08'),
(111, 87, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:47:08', '2019-07-01 07:47:08'),
(112, 87, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:47:08', '2019-07-01 07:47:08'),
(113, 89, 2, 2800, 2, 'apt.sriwedari', '2019-07-01 07:47:54', '2019-07-01 07:47:54'),
(114, 89, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:47:54', '2019-07-01 07:47:54'),
(115, 89, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:47:54', '2019-07-01 07:47:54'),
(116, 90, 2, 2600, 2, 'apt.sriwedari', '2019-07-01 07:48:20', '2019-07-01 07:48:20'),
(117, 90, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:48:20', '2019-07-01 07:48:20'),
(118, 90, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:48:20', '2019-07-01 07:48:20'),
(119, 91, 2, 18200, 2, 'apt.sriwedari', '2019-07-01 07:48:45', '2019-07-01 07:48:45'),
(120, 91, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:48:45', '2019-07-01 07:48:45'),
(121, 91, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:48:45', '2019-07-01 07:48:45'),
(122, 92, 2, 7200, 2, 'apt.sriwedari', '2019-07-01 07:49:24', '2019-07-01 07:49:24'),
(123, 92, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:49:24', '2019-07-01 07:49:24'),
(124, 92, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:49:24', '2019-07-01 07:49:24'),
(125, 94, 2, 23200, 2, 'apt.sriwedari', '2019-07-01 07:49:58', '2019-07-01 07:49:58'),
(126, 94, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:49:58', '2019-07-01 07:49:58'),
(127, 94, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:49:58', '2019-07-01 07:49:58'),
(128, 279, 2, 30200, 2, 'apt.sriwedari', '2019-07-01 07:50:15', '2019-07-01 07:50:15'),
(129, 279, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:50:15', '2019-07-01 07:50:15'),
(130, 279, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:50:15', '2019-07-01 07:50:15'),
(131, 95, 2, 2200, 2, 'apt.sriwedari', '2019-07-01 07:50:49', '2019-07-01 07:50:49'),
(132, 95, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:50:49', '2019-07-01 07:50:49'),
(133, 95, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:50:49', '2019-07-01 07:50:49'),
(134, 96, 2, 21200, 2, 'apt.sriwedari', '2019-07-01 07:51:11', '2019-07-01 07:51:11'),
(135, 96, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:51:11', '2019-07-01 07:51:11'),
(136, 96, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:51:11', '2019-07-01 07:51:11'),
(137, 97, 2, 16200, 2, 'apt.sriwedari', '2019-07-01 07:51:35', '2019-07-01 07:51:35'),
(138, 97, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:51:35', '2019-07-01 07:51:35'),
(139, 97, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:51:35', '2019-07-01 07:51:35'),
(140, 98, 2, 17200, 2, 'apt.sriwedari', '2019-07-01 07:52:29', '2019-07-01 07:52:29'),
(141, 98, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:52:29', '2019-07-01 07:52:29'),
(142, 98, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:52:29', '2019-07-01 07:52:29'),
(143, 99, 2, 22700, 2, 'apt.sriwedari', '2019-07-01 07:52:48', '2019-07-01 07:52:48'),
(144, 99, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:52:48', '2019-07-01 07:52:48'),
(145, 99, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:52:48', '2019-07-01 07:52:48'),
(146, 100, 2, 17200, 2, 'apt.sriwedari', '2019-07-01 07:53:17', '2019-07-01 07:53:17'),
(147, 100, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:53:17', '2019-07-01 07:53:17'),
(148, 100, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:53:17', '2019-07-01 07:53:17'),
(149, 101, 2, 12000, 2, 'apt.sriwedari', '2019-07-01 07:53:37', '2019-07-01 07:53:37'),
(150, 101, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:53:37', '2019-07-01 07:53:37'),
(151, 101, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:53:37', '2019-07-01 07:53:37'),
(152, 102, 2, 13500, 2, 'apt.sriwedari', '2019-07-01 07:54:04', '2019-07-01 07:54:04'),
(153, 102, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:04', '2019-07-01 07:54:04'),
(154, 102, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:04', '2019-07-01 07:54:04'),
(155, 103, 2, 13500, 2, 'apt.sriwedari', '2019-07-01 07:54:33', '2019-07-01 07:54:33'),
(156, 103, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:33', '2019-07-01 07:54:33'),
(157, 103, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:33', '2019-07-01 07:54:33'),
(158, 104, 2, 7000, 2, 'apt.sriwedari', '2019-07-01 07:54:57', '2019-07-01 07:54:57'),
(159, 104, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:57', '2019-07-01 07:54:57'),
(160, 104, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:54:57', '2019-07-01 07:54:57'),
(161, 105, 2, 7000, 2, 'apt.sriwedari', '2019-07-01 07:55:18', '2019-07-01 07:55:18'),
(162, 105, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:55:18', '2019-07-01 07:55:18'),
(163, 105, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:55:18', '2019-07-01 07:55:18'),
(164, 106, 2, 2000, 2, 'apt.sriwedari', '2019-07-01 07:55:37', '2019-07-01 07:55:37'),
(165, 106, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:55:37', '2019-07-01 07:55:37'),
(166, 106, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:55:37', '2019-07-01 07:55:37'),
(167, 107, 2, 31200, 2, 'apt.sriwedari', '2019-07-01 07:56:02', '2019-07-01 07:56:02'),
(168, 107, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:02', '2019-07-01 07:56:02'),
(169, 107, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:02', '2019-07-01 07:56:02'),
(170, 108, 2, 500, 2, 'apt.sriwedari', '2019-07-01 07:56:26', '2019-07-01 07:56:26'),
(171, 108, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:26', '2019-07-01 07:56:26'),
(172, 108, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:26', '2019-07-01 07:56:26'),
(173, 109, 2, 11200, 2, 'apt.sriwedari', '2019-07-01 07:56:48', '2019-07-01 07:56:48'),
(174, 109, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:48', '2019-07-01 07:56:48'),
(175, 109, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:56:48', '2019-07-01 07:56:48'),
(176, 110, 2, 10200, 2, 'apt.sriwedari', '2019-07-01 07:57:03', '2019-07-01 07:57:03'),
(177, 110, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:03', '2019-07-01 07:57:03'),
(178, 110, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:03', '2019-07-01 07:57:03'),
(179, 112, 2, 7000, 2, 'apt.sriwedari', '2019-07-01 07:57:27', '2019-07-01 07:57:27'),
(180, 112, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:27', '2019-07-01 07:57:27'),
(181, 112, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:27', '2019-07-01 07:57:27'),
(182, 111, 2, 4500, 2, 'apt.sriwedari', '2019-07-01 07:57:42', '2019-07-01 07:57:49'),
(183, 111, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:42', '2019-07-01 07:57:42'),
(184, 111, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:57:42', '2019-07-01 07:57:42'),
(185, 113, 2, 14200, 2, 'apt.sriwedari', '2019-07-01 07:58:09', '2019-07-01 07:58:09'),
(186, 113, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:58:09', '2019-07-01 07:58:09'),
(187, 113, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:58:09', '2019-07-01 07:58:09'),
(188, 114, 2, 27500, 2, 'apt.sriwedari', '2019-07-01 07:58:33', '2019-07-01 07:58:33'),
(189, 114, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:58:33', '2019-07-01 07:58:33'),
(190, 114, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:58:33', '2019-07-01 07:58:33'),
(191, 115, 2, 3000, 2, 'apt.sriwedari', '2019-07-01 07:59:08', '2019-07-01 07:59:08'),
(192, 115, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:59:08', '2019-07-01 07:59:08'),
(193, 115, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:59:08', '2019-07-01 07:59:08'),
(194, 116, 2, 18700, 2, 'apt.sriwedari', '2019-07-01 07:59:33', '2019-07-01 07:59:33'),
(195, 116, 3, 0, 2, 'apt.sriwedari', '2019-07-01 07:59:33', '2019-07-01 07:59:33'),
(196, 116, 4, 0, 2, 'apt.sriwedari', '2019-07-01 07:59:33', '2019-07-01 07:59:33'),
(197, 117, 2, 7200, 2, 'apt.sriwedari', '2019-07-01 08:00:11', '2019-07-01 08:00:11'),
(198, 117, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:00:11', '2019-07-01 08:00:11'),
(199, 117, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:00:11', '2019-07-01 08:00:11'),
(200, 118, 2, 7500, 2, 'apt.sriwedari', '2019-07-01 08:02:37', '2019-07-01 08:02:37'),
(201, 118, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:02:37', '2019-07-01 08:02:37'),
(202, 118, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:02:37', '2019-07-01 08:02:37'),
(203, 119, 2, 16000, 2, 'apt.sriwedari', '2019-07-01 08:03:15', '2019-07-01 08:03:15'),
(204, 119, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:03:15', '2019-07-01 08:03:15'),
(205, 119, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:03:15', '2019-07-01 08:03:15'),
(206, 120, 2, 17500, 2, 'apt.sriwedari', '2019-07-01 08:03:36', '2019-07-01 08:03:36'),
(207, 120, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:03:36', '2019-07-01 08:03:36'),
(208, 120, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:03:36', '2019-07-01 08:03:36'),
(209, 129, 2, 14700, 2, 'apt.sriwedari', '2019-07-01 08:04:09', '2019-07-01 08:04:09'),
(210, 129, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:04:09', '2019-07-01 08:04:09'),
(211, 129, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:04:09', '2019-07-01 08:04:09'),
(212, 121, 2, 5500, 2, 'apt.sriwedari', '2019-07-01 08:04:36', '2019-07-01 08:04:36'),
(213, 121, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:04:36', '2019-07-01 08:04:36'),
(214, 121, 4, 6000, 2, 'apt.sriwedari', '2019-07-01 08:04:36', '2019-07-01 08:05:18'),
(215, 122, 2, 23700, 2, 'apt.sriwedari', '2019-07-01 08:04:55', '2019-07-01 08:04:55'),
(216, 122, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:04:55', '2019-07-01 08:04:55'),
(217, 122, 4, 24000, 2, 'apt.sriwedari', '2019-07-01 08:04:55', '2019-07-01 08:05:09'),
(218, 123, 2, 5000, 2, 'apt.sriwedari', '2019-07-01 08:05:38', '2019-07-01 08:05:38'),
(219, 123, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:05:38', '2019-07-01 08:05:38'),
(220, 123, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:05:38', '2019-07-01 08:05:38'),
(221, 124, 2, 19700, 2, 'apt.sriwedari', '2019-07-01 08:05:58', '2019-07-01 08:05:58'),
(222, 124, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:05:58', '2019-07-01 08:05:58'),
(223, 124, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:05:58', '2019-07-01 08:05:58'),
(224, 125, 2, 1500, 2, 'apt.sriwedari', '2019-07-01 08:06:25', '2019-07-01 08:06:25'),
(225, 125, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:06:25', '2019-07-01 08:06:25'),
(226, 125, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:06:25', '2019-07-01 08:06:25'),
(227, 126, 2, 2100, 2, 'apt.sriwedari', '2019-07-01 08:06:48', '2019-07-01 08:06:48'),
(228, 126, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:06:48', '2019-07-01 08:06:48'),
(229, 126, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:06:48', '2019-07-01 08:06:48'),
(230, 133, 2, 16300, 2, 'apt.sriwedari', '2019-07-01 08:07:52', '2019-07-01 08:07:52'),
(231, 133, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:07:52', '2019-07-01 08:07:52'),
(232, 133, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:07:52', '2019-07-01 08:07:52'),
(233, 128, 2, 12500, 2, 'apt.sriwedari', '2019-07-01 08:08:19', '2019-07-01 08:08:19'),
(234, 128, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:08:19', '2019-07-01 08:08:19'),
(235, 128, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:08:19', '2019-07-01 08:08:19'),
(236, 130, 2, 16300, 2, 'apt.sriwedari', '2019-07-01 08:08:45', '2019-07-01 08:08:45'),
(237, 130, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:08:45', '2019-07-01 08:08:45'),
(238, 130, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:08:45', '2019-07-01 08:08:45'),
(239, 131, 2, 11500, 2, 'apt.sriwedari', '2019-07-01 08:09:20', '2019-07-01 08:09:20'),
(240, 131, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:20', '2019-07-01 08:09:20'),
(241, 131, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:20', '2019-07-01 08:09:20'),
(242, 132, 2, 11500, 2, 'apt.sriwedari', '2019-07-01 08:09:33', '2019-07-01 08:09:33'),
(243, 132, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:33', '2019-07-01 08:09:33'),
(244, 132, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:33', '2019-07-01 08:09:33'),
(245, 127, 2, 17500, 2, 'apt.sriwedari', '2019-07-01 08:09:51', '2019-07-01 08:09:51'),
(246, 127, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:51', '2019-07-01 08:09:51'),
(247, 127, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:09:51', '2019-07-01 08:09:51'),
(248, 134, 2, 7500, 2, 'apt.sriwedari', '2019-07-01 08:10:07', '2019-07-01 08:10:07'),
(249, 134, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:10:07', '2019-07-01 08:10:07'),
(250, 134, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:10:07', '2019-07-01 08:10:07'),
(251, 135, 2, 4100, 2, 'apt.sriwedari', '2019-07-01 08:10:36', '2019-07-01 08:10:36'),
(252, 135, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:10:36', '2019-07-01 08:10:36'),
(253, 135, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:10:36', '2019-07-01 08:10:36'),
(254, 137, 2, 12200, 2, 'apt.sriwedari', '2019-07-01 08:17:11', '2019-07-01 08:17:11'),
(255, 137, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:17:11', '2019-07-01 08:17:11'),
(256, 137, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:17:11', '2019-07-01 08:17:11'),
(257, 138, 2, 13200, 2, 'apt.sriwedari', '2019-07-01 08:17:43', '2019-07-01 08:17:43'),
(258, 138, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:17:43', '2019-07-01 08:17:43'),
(259, 138, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:17:43', '2019-07-01 08:17:43'),
(260, 136, 2, 15700, 2, 'apt.sriwedari', '2019-07-01 08:18:24', '2019-07-01 08:18:24'),
(261, 136, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:18:24', '2019-07-01 08:18:24'),
(262, 136, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:18:24', '2019-07-01 08:18:24'),
(263, 329, 2, 15500, 2, 'apt.sriwedari', '2019-07-01 08:28:09', '2019-07-01 08:28:09'),
(264, 329, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:28:09', '2019-07-01 08:28:09'),
(265, 329, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:28:09', '2019-07-01 08:28:09'),
(266, 330, 2, 13300, 2, 'apt.sriwedari', '2019-07-01 08:28:41', '2019-07-01 08:28:41'),
(267, 330, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:28:41', '2019-07-01 08:28:41'),
(268, 330, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:28:41', '2019-07-01 08:28:41'),
(269, 331, 2, 20500, 2, 'apt.sriwedari', '2019-07-01 08:29:32', '2019-07-01 08:29:32'),
(270, 331, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:29:32', '2019-07-01 08:29:32'),
(271, 331, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:29:32', '2019-07-01 08:29:32'),
(272, 332, 2, 12000, 2, 'apt.sriwedari', '2019-07-01 08:40:01', '2019-07-01 08:40:01'),
(273, 332, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:40:01', '2019-07-01 08:40:01'),
(274, 332, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:40:01', '2019-07-01 08:40:01'),
(275, 248, 2, 17400, 2, 'apt.sriwedari', '2019-07-01 08:58:54', '2019-07-01 08:58:54'),
(276, 248, 3, 0, 2, 'apt.sriwedari', '2019-07-01 08:58:54', '2019-07-01 08:58:54'),
(277, 248, 4, 0, 2, 'apt.sriwedari', '2019-07-01 08:58:54', '2019-07-01 08:58:54'),
(278, 249, 2, 5700, 2, 'apt.sriwedari', '2019-07-01 09:01:05', '2019-07-01 09:01:05'),
(279, 249, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:01:05', '2019-07-01 09:01:05'),
(280, 249, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:01:05', '2019-07-01 09:01:05'),
(281, 250, 2, 3600, 2, 'apt.sriwedari', '2019-07-01 09:21:56', '2019-07-01 09:21:56'),
(282, 250, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:21:56', '2019-07-01 09:21:56'),
(283, 250, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:21:56', '2019-07-01 09:21:56'),
(284, 251, 2, 8800, 2, 'apt.sriwedari', '2019-07-01 09:25:25', '2019-07-01 09:25:25'),
(285, 251, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:25:25', '2019-07-01 09:25:25'),
(286, 251, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:25:25', '2019-07-01 09:25:25'),
(287, 252, 2, 25500, 2, 'apt.sriwedari', '2019-07-01 09:26:46', '2019-07-01 09:26:46'),
(288, 252, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:26:46', '2019-07-01 09:26:46'),
(289, 252, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:26:46', '2019-07-01 09:26:46'),
(290, 253, 2, 27400, 2, 'apt.sriwedari', '2019-07-01 09:29:39', '2019-07-01 09:29:39'),
(291, 253, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:29:39', '2019-07-01 09:29:39'),
(292, 253, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:29:39', '2019-07-01 09:29:39'),
(293, 254, 2, 33000, 2, 'apt.sriwedari', '2019-07-01 09:29:58', '2019-07-01 09:29:58'),
(294, 254, 3, 0, 2, 'apt.sriwedari', '2019-07-01 09:29:58', '2019-07-01 09:29:58'),
(295, 254, 4, 0, 2, 'apt.sriwedari', '2019-07-01 09:29:58', '2019-07-01 09:29:58'),
(296, 21, 2, 20300, 2, 'apt.sriwedari', '2019-07-01 10:35:56', '2019-07-01 10:35:56'),
(297, 21, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:35:56', '2019-07-01 10:35:56'),
(298, 21, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:35:56', '2019-07-01 10:35:56'),
(299, 22, 2, 1000, 2, 'apt.sriwedari', '2019-07-01 10:36:21', '2019-07-01 10:36:21'),
(300, 22, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:36:21', '2019-07-01 10:36:21'),
(301, 22, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:36:21', '2019-07-01 10:36:21'),
(302, 23, 2, 24700, 2, 'apt.sriwedari', '2019-07-01 10:38:04', '2019-07-01 10:38:04'),
(303, 23, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:38:04', '2019-07-01 10:38:04'),
(304, 23, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:38:04', '2019-07-01 10:38:04'),
(305, 24, 2, 40000, 2, 'apt.sriwedari', '2019-07-01 10:38:22', '2019-07-01 10:38:22'),
(306, 24, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:38:22', '2019-07-01 10:38:22'),
(307, 24, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:38:22', '2019-07-01 10:38:22'),
(308, 5, 2, 1900, 2, 'apt.sriwedari', '2019-07-01 10:43:45', '2019-07-01 10:43:45'),
(309, 5, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:43:45', '2019-07-01 10:43:45'),
(310, 5, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:43:45', '2019-07-01 10:43:45'),
(311, 6, 2, 2700, 2, 'apt.sriwedari', '2019-07-01 10:44:05', '2019-07-01 10:44:05'),
(312, 6, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:05', '2019-07-01 10:44:05'),
(313, 6, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:05', '2019-07-01 10:44:05'),
(314, 25, 2, 12300, 2, 'apt.sriwedari', '2019-07-01 10:44:53', '2019-07-01 10:44:53'),
(315, 25, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:53', '2019-07-01 10:44:53'),
(316, 25, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:53', '2019-07-01 10:44:53'),
(317, 7, 2, 17200, 2, 'apt.sriwedari', '2019-07-01 10:44:54', '2019-07-01 10:44:54'),
(318, 7, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:54', '2019-07-01 10:44:54'),
(319, 7, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:44:54', '2019-07-01 10:44:54'),
(320, 26, 2, 20800, 2, 'apt.sriwedari', '2019-07-01 10:45:12', '2019-07-01 10:45:12'),
(321, 26, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:12', '2019-07-01 10:45:12'),
(322, 26, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:12', '2019-07-01 10:45:12'),
(323, 8, 2, 4700, 2, 'apt.sriwedari', '2019-07-01 10:45:32', '2019-07-01 10:45:32'),
(324, 8, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:32', '2019-07-01 10:45:32'),
(325, 8, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:32', '2019-07-01 10:45:32'),
(326, 27, 2, 4700, 2, 'apt.sriwedari', '2019-07-01 10:45:44', '2019-07-01 10:45:44'),
(327, 27, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:44', '2019-07-01 10:45:44'),
(328, 27, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:45:44', '2019-07-01 10:45:44'),
(329, 9, 2, 12000, 2, 'apt.sriwedari', '2019-07-01 10:46:00', '2019-07-01 10:46:00'),
(330, 9, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:00', '2019-07-01 10:46:00'),
(331, 9, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:00', '2019-07-01 10:46:00'),
(332, 28, 2, 4700, 2, 'apt.sriwedari', '2019-07-01 10:46:02', '2019-07-01 10:46:02'),
(333, 28, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:02', '2019-07-01 10:46:02'),
(334, 28, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:02', '2019-07-01 10:46:02'),
(335, 10, 2, 21000, 2, 'apt.sriwedari', '2019-07-01 10:46:21', '2019-07-01 10:46:21'),
(336, 10, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:21', '2019-07-01 10:46:21'),
(337, 10, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:21', '2019-07-01 10:46:21'),
(338, 29, 2, 2000, 2, 'apt.sriwedari', '2019-07-01 10:46:32', '2019-07-01 10:46:32'),
(339, 29, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:32', '2019-07-01 10:46:32'),
(340, 29, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:32', '2019-07-01 10:46:32'),
(341, 11, 2, 15300, 2, 'apt.sriwedari', '2019-07-01 10:46:50', '2019-07-01 10:46:50'),
(342, 11, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:50', '2019-07-01 10:46:50'),
(343, 11, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:50', '2019-07-01 10:46:50'),
(344, 30, 2, 10000, 2, 'apt.sriwedari', '2019-07-01 10:46:59', '2019-07-01 10:46:59'),
(345, 30, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:59', '2019-07-01 10:46:59'),
(346, 30, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:46:59', '2019-07-01 10:46:59'),
(347, 12, 2, 37500, 2, 'apt.sriwedari', '2019-07-01 10:47:12', '2019-07-01 10:47:12'),
(348, 12, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:12', '2019-07-01 10:47:12'),
(349, 12, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:12', '2019-07-01 10:47:12'),
(350, 31, 2, 7000, 2, 'apt.sriwedari', '2019-07-01 10:47:15', '2019-07-01 10:47:15'),
(351, 31, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:15', '2019-07-01 10:47:15'),
(352, 31, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:15', '2019-07-01 10:47:15'),
(353, 32, 2, 700, 2, 'apt.sriwedari', '2019-07-01 10:47:36', '2019-07-01 10:47:36'),
(354, 32, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:36', '2019-07-01 10:47:36'),
(355, 32, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:36', '2019-07-01 10:47:36'),
(356, 14, 2, 13000, 2, 'apt.sriwedari', '2019-07-01 10:47:44', '2019-07-01 10:47:44'),
(357, 14, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:44', '2019-07-01 10:47:44'),
(358, 14, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:47:44', '2019-07-01 10:47:44'),
(359, 13, 2, 7700, 2, 'apt.sriwedari', '2019-07-01 10:48:06', '2019-07-01 10:48:06'),
(360, 13, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:48:06', '2019-07-01 10:48:06'),
(361, 13, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:48:06', '2019-07-01 10:48:06'),
(362, 15, 2, 12100, 2, 'apt.sriwedari', '2019-07-01 10:49:17', '2019-07-01 10:49:17'),
(363, 15, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:17', '2019-07-01 10:49:17'),
(364, 15, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:17', '2019-07-01 10:49:17'),
(365, 376, 2, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:39', '2019-07-01 10:55:19'),
(366, 376, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:39', '2019-07-01 10:49:39'),
(367, 376, 4, 1500, 2, 'apt.sriwedari', '2019-07-01 10:49:39', '2019-07-01 10:55:19'),
(368, 16, 2, 8200, 2, 'apt.sriwedari', '2019-07-01 10:49:46', '2019-07-01 10:49:46'),
(369, 16, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:46', '2019-07-01 10:49:46'),
(370, 16, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:49:46', '2019-07-01 10:49:46'),
(371, 377, 2, 7000, 2, 'apt.sriwedari', '2019-07-01 10:50:17', '2019-07-01 10:50:17'),
(372, 377, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:50:17', '2019-07-01 10:50:17'),
(373, 377, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:50:17', '2019-07-01 10:50:17'),
(374, 17, 2, 6700, 2, 'apt.sriwedari', '2019-07-01 10:50:29', '2019-07-01 10:50:29'),
(375, 17, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:50:29', '2019-07-01 10:50:29'),
(376, 17, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:50:29', '2019-07-01 10:50:29'),
(377, 378, 2, 3500, 2, 'apt.sriwedari', '2019-07-01 10:51:00', '2019-07-01 10:51:00'),
(378, 378, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:00', '2019-07-01 10:51:00'),
(379, 378, 4, 4000, 2, 'apt.sriwedari', '2019-07-01 10:51:00', '2019-07-01 10:51:09'),
(380, 18, 2, 9200, 2, 'apt.sriwedari', '2019-07-01 10:51:07', '2019-07-01 10:51:07'),
(381, 18, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:07', '2019-07-01 10:51:07'),
(382, 18, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:07', '2019-07-01 10:51:07'),
(383, 19, 2, 22500, 2, 'apt.sriwedari', '2019-07-01 10:51:27', '2019-07-01 10:51:27'),
(384, 19, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:27', '2019-07-01 10:51:27'),
(385, 19, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:27', '2019-07-01 10:51:27'),
(386, 20, 2, 20500, 2, 'apt.sriwedari', '2019-07-01 10:51:47', '2019-07-01 10:51:47'),
(387, 20, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:47', '2019-07-01 10:51:47'),
(388, 20, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:51:47', '2019-07-01 10:51:47'),
(389, 230, 2, 6500, 2, 'apt.sriwedari', '2019-07-01 10:53:53', '2019-07-01 10:53:53'),
(390, 230, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:53:53', '2019-07-01 10:53:53'),
(391, 230, 4, 7000, 2, 'apt.sriwedari', '2019-07-01 10:53:53', '2019-07-01 10:54:55'),
(392, 231, 2, 5800, 2, 'apt.sriwedari', '2019-07-01 10:54:33', '2019-07-01 10:54:33'),
(393, 231, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:54:33', '2019-07-01 10:54:33'),
(394, 231, 4, 6500, 2, 'apt.sriwedari', '2019-07-01 10:54:33', '2019-07-01 10:54:33'),
(395, 232, 2, 37800, 2, 'apt.sriwedari', '2019-07-01 10:56:03', '2019-07-01 10:56:03'),
(396, 232, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:56:03', '2019-07-01 10:56:03'),
(397, 232, 4, 38500, 2, 'apt.sriwedari', '2019-07-01 10:56:03', '2019-07-01 10:56:03'),
(398, 233, 2, 4700, 2, 'apt.sriwedari', '2019-07-01 10:56:30', '2019-07-01 10:56:30'),
(399, 233, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:56:30', '2019-07-01 10:56:30'),
(400, 233, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:56:30', '2019-07-01 10:56:30'),
(401, 234, 2, 18200, 2, 'apt.sriwedari', '2019-07-01 10:57:03', '2019-07-01 10:57:03'),
(402, 234, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:57:03', '2019-07-01 10:57:03'),
(403, 234, 4, 18700, 2, 'apt.sriwedari', '2019-07-01 10:57:03', '2019-07-01 10:57:03'),
(404, 235, 2, 18200, 2, 'apt.sriwedari', '2019-07-01 10:57:17', '2019-07-01 10:57:17'),
(405, 235, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:57:17', '2019-07-01 10:57:17'),
(406, 235, 4, 18700, 2, 'apt.sriwedari', '2019-07-01 10:57:17', '2019-07-01 10:57:31'),
(407, 229, 2, 3800, 2, 'apt.sriwedari', '2019-07-01 10:58:24', '2019-07-01 10:58:24'),
(408, 229, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:58:24', '2019-07-01 10:58:24'),
(409, 229, 4, 4500, 2, 'apt.sriwedari', '2019-07-01 10:58:24', '2019-07-01 10:58:24'),
(410, 379, 2, 25500, 2, 'apt.sriwedari', '2019-07-01 10:59:32', '2019-07-01 10:59:32'),
(411, 379, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:59:32', '2019-07-01 10:59:32'),
(412, 379, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:59:32', '2019-07-01 10:59:32'),
(413, 380, 2, 9000, 2, 'apt.sriwedari', '2019-07-01 10:59:54', '2019-07-01 10:59:54'),
(414, 380, 3, 0, 2, 'apt.sriwedari', '2019-07-01 10:59:54', '2019-07-01 10:59:54'),
(415, 380, 4, 0, 2, 'apt.sriwedari', '2019-07-01 10:59:54', '2019-07-01 10:59:54'),
(416, 382, 2, 18100, 2, 'apt.sriwedari', '2019-07-01 11:01:19', '2019-07-01 11:01:19'),
(417, 382, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:01:19', '2019-07-01 11:01:19'),
(418, 382, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:01:19', '2019-07-01 11:01:19'),
(419, 255, 2, 40900, 2, 'apt.sriwedari', '2019-07-01 11:03:19', '2019-07-01 11:03:19'),
(420, 255, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:19', '2019-07-01 11:03:19'),
(421, 255, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:19', '2019-07-01 11:03:19'),
(422, 383, 2, 10700, 2, 'apt.sriwedari', '2019-07-01 11:03:21', '2019-07-01 11:03:21'),
(423, 383, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:21', '2019-07-01 11:03:21'),
(424, 383, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:21', '2019-07-01 11:03:21'),
(425, 384, 2, 4600, 2, 'apt.sriwedari', '2019-07-01 11:03:45', '2019-07-01 11:03:45'),
(426, 384, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:45', '2019-07-01 11:03:45'),
(427, 384, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:03:45', '2019-07-01 11:03:45'),
(428, 385, 2, 17300, 2, 'apt.sriwedari', '2019-07-01 11:04:19', '2019-07-01 11:04:19'),
(429, 385, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:04:19', '2019-07-01 11:04:19'),
(430, 385, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:04:19', '2019-07-01 11:04:19'),
(431, 386, 2, 11200, 2, 'apt.sriwedari', '2019-07-01 11:04:40', '2019-07-01 11:04:40'),
(432, 386, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:04:40', '2019-07-01 11:04:40'),
(433, 386, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:04:40', '2019-07-01 11:04:40'),
(434, 387, 2, 3000, 2, 'apt.sriwedari', '2019-07-01 11:05:35', '2019-07-01 11:05:35'),
(435, 387, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:05:35', '2019-07-01 11:05:35'),
(436, 387, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:05:35', '2019-07-01 11:05:35'),
(437, 256, 2, 39700, 2, 'apt.sriwedari', '2019-07-01 11:06:05', '2019-07-01 11:06:05'),
(438, 256, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:05', '2019-07-01 11:06:05'),
(439, 256, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:05', '2019-07-01 11:06:05'),
(440, 388, 2, 20100, 2, 'apt.sriwedari', '2019-07-01 11:06:14', '2019-07-01 11:06:14'),
(441, 388, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:14', '2019-07-01 11:06:14'),
(442, 388, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:14', '2019-07-01 11:06:14'),
(443, 257, 2, 40900, 2, 'apt.sriwedari', '2019-07-01 11:06:31', '2019-07-01 11:06:31'),
(444, 257, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:31', '2019-07-01 11:06:31'),
(445, 257, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:06:31', '2019-07-01 11:06:31'),
(446, 389, 2, 5000, 2, 'apt.sriwedari', '2019-07-01 11:07:05', '2019-07-01 11:07:05'),
(447, 389, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:07:05', '2019-07-01 11:07:05'),
(448, 389, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:07:05', '2019-07-01 11:07:05'),
(449, 260, 2, 11500, 2, 'apt.sriwedari', '2019-07-01 11:07:46', '2019-07-01 11:07:46'),
(450, 260, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:07:46', '2019-07-01 11:07:46'),
(451, 260, 4, 12000, 2, 'apt.sriwedari', '2019-07-01 11:07:46', '2019-07-01 11:07:46'),
(452, 261, 2, 6400, 2, 'apt.sriwedari', '2019-07-01 11:09:20', '2019-07-01 11:09:20'),
(453, 261, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:09:20', '2019-07-01 11:09:20'),
(454, 261, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:09:20', '2019-07-01 11:09:20'),
(455, 262, 2, 2000, 2, 'apt.sriwedari', '2019-07-01 11:10:30', '2019-07-01 11:10:30'),
(456, 262, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:10:30', '2019-07-01 11:10:30'),
(457, 262, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:10:30', '2019-07-01 11:10:30'),
(458, 409, 2, 18100, 2, 'apt.sriwedari', '2019-07-01 11:12:26', '2019-07-01 11:13:39'),
(459, 409, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:12:26', '2019-07-01 11:12:26'),
(460, 409, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:12:26', '2019-07-01 11:12:26'),
(461, 263, 2, 6200, 2, 'apt.sriwedari', '2019-07-01 11:15:36', '2019-07-01 11:15:36'),
(462, 263, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:15:36', '2019-07-01 11:15:36'),
(463, 263, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:15:36', '2019-07-01 11:15:36'),
(464, 264, 2, 16800, 2, 'apt.sriwedari', '2019-07-01 11:16:18', '2019-07-01 11:16:18'),
(465, 264, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:16:18', '2019-07-01 11:16:18'),
(466, 264, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:16:18', '2019-07-01 11:16:18'),
(467, 265, 2, 12900, 2, 'apt.sriwedari', '2019-07-01 11:18:02', '2019-07-01 11:18:02'),
(468, 265, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:18:02', '2019-07-01 11:18:02'),
(469, 265, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:18:02', '2019-07-01 11:18:02'),
(470, 266, 2, 15300, 2, 'apt.sriwedari', '2019-07-01 11:18:27', '2019-07-01 11:18:27'),
(471, 266, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:18:27', '2019-07-01 11:18:27'),
(472, 266, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:18:27', '2019-07-01 11:18:27'),
(473, 267, 2, 20800, 2, 'apt.sriwedari', '2019-07-01 11:19:55', '2019-07-01 11:19:55'),
(474, 267, 3, 0, 2, 'apt.sriwedari', '2019-07-01 11:19:55', '2019-07-01 11:19:55'),
(475, 267, 4, 0, 2, 'apt.sriwedari', '2019-07-01 11:19:55', '2019-07-01 11:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) UNSIGNED NOT NULL,
  `distributor_id` int(10) UNSIGNED NOT NULL,
  `distributor_name` varchar(50) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `total_kind` int(11) NOT NULL,
  `total_product` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `distributor_id`, `distributor_name`, `invoice`, `code`, `date`, `total_kind`, `total_product`, `total_price`, `is_valid`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 1, 'distributor', '', '190628000001', '2019-06-28', 1, 20, 60000, 1, 2, 'apt.sriwedari', '2019-06-28 17:47:54', '2019-07-01 21:03:34'),
(2, 1, 'distributor', '', '190628000002', '2019-06-28', 1, 20, 40000, 1, 2, 'apt.sriwedari', '2019-06-28 20:15:52', '2019-07-01 21:03:34'),
(3, 1, 'distributor', '', '190628000003', '2019-06-28', 2, 17, 145000, 1, 2, 'apt.sriwedari', '2019-06-28 20:22:35', '2019-07-01 21:03:34'),
(15, 3, 'Tirta Husada Farma', '', '190630000015', '2019-06-30', 16, 65, 74230, 1, 2, 'apt.sriwedari', '2019-06-30 05:25:04', '2019-07-01 21:03:34'),
(16, 3, 'Tirta Husada Farma', '', '190630000016', '2019-06-30', 12, 76, 408180303, 1, 2, 'apt.sriwedari', '2019-06-30 05:47:01', '2019-07-01 21:03:34'),
(17, 4, 'Sehati', '', '190630000017', '2019-06-30', 66, 480, 138200, 1, 2, 'apt.sriwedari', '2019-06-30 11:36:42', '2019-07-01 21:03:34'),
(18, 4, 'Sehati', '', '190630000018', '2019-06-30', 21, 70, 399000, 1, 2, 'apt.sriwedari', '2019-06-30 21:01:53', '2019-07-01 21:03:34'),
(23, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190630000023', '2019-06-30', 1, 50, 170500, 1, 2, 'apt.sriwedari', '2019-06-30 21:07:06', '2019-07-01 21:03:34'),
(24, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190630000024', '2019-06-30', 6, 48, 162220, 1, 2, 'apt.sriwedari', '2019-06-30 21:14:04', '2019-07-01 21:03:34'),
(25, 4, 'Sehati', '', '190630000025', '2019-06-30', 27, 299, 595800, 1, 2, 'apt.sriwedari', '2019-06-30 21:26:25', '2019-07-01 21:03:34'),
(26, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190630000026', '2019-06-30', 34, 363, 1497319, 1, 2, 'apt.sriwedari', '2019-06-30 23:15:42', '2019-07-01 21:03:34'),
(28, 5, 'Surya Baru', '', '190701000028', '2019-07-01', 11, 14, 167200, 1, 2, 'apt.sriwedari', '2019-07-01 05:30:31', '2019-07-01 21:03:34'),
(29, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190701000029', '2019-07-01', 21, 42, 434893, 1, 1, 'nadhif', '2019-07-01 05:41:43', '2019-07-01 21:03:34'),
(30, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190701000030', '2019-07-01', 14, 35, 460654, 1, 1, 'nadhif', '2019-07-01 06:09:47', '2019-07-01 21:03:34'),
(31, 6, 'CV. Bengawan Multi Trading', '', '190701000031', '2019-07-01', 32, 54, 535677, 1, 1, 'nadhif', '2019-07-01 06:33:39', '2019-07-01 21:03:34'),
(32, 2, 'Sehat Bersama Sejahtera (SBS)', '', '190701000032', '2019-07-01', 13, 29, 234014, 1, 1, 'nadhif', '2019-07-01 08:47:30', '2019-07-01 21:03:34'),
(33, 5, 'Surya Baru', '', '190701000033', '2019-07-01', 1, 12, 12000, 1, 1, 'nadhif', '2019-07-01 21:06:40', '2019-07-01 21:06:40'),
(34, 5, 'Surya Baru', '', '190701000034', '2019-07-01', 1, 12, 144000, 1, 1, 'nadhif', '2019-07-01 21:14:24', '2019-07-01 21:14:24'),
(35, 4, 'Sehati', '123', '190701000035', '2019-07-01', 1, 12, 84000, 1, 1, 'nadhif', '2019-07-01 21:16:22', '2019-07-01 21:16:22'),
(37, 4, 'Sehati', '1234', '190701000037', '2019-07-01', 1, 100, 120000, 1, 1, 'nadhif', '2019-07-01 22:24:30', '2019-07-01 22:55:22'),
(39, 5, 'Surya Baru', '123', '190701000039', '2019-07-01', 1, 12, 12000, 1, 1, 'nadhif', '2019-07-01 22:59:08', '2019-07-01 22:59:43'),
(40, 6, 'CV. Bengawan Multi Trading', '5675', '190701000040', '2019-07-01', 1, 12, 15600, 1, 1, 'nadhif', '2019-07-01 23:03:49', '2019-07-01 23:05:17'),
(41, 4, 'Sehati', '879uhku', '190702000041', '2019-07-02', 1, 12, 14400, 1, 1, 'nadhif', '2019-07-02 17:45:00', '2019-07-02 17:45:00'),
(42, 6, 'CV. Bengawan Multi Trading', 'ewf', '190702000042', '2019-07-02', 2, 24, 26400, 1, 1, 'nadhif', '2019-07-02 17:45:48', '2019-07-02 17:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product`
--

CREATE TABLE `purchase_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `purchase_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `expired` date DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_product`
--

INSERT INTO `purchase_product` (`id`, `purchase_id`, `product_id`, `product_name`, `price`, `stock`, `total`, `expired`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 1, 1, 'paramex', 3000, 20, 60000, '2019-06-28', 2, 'apt.sriwedari', '2019-06-28 17:47:54', '2019-06-29 21:22:26'),
(2, 2, 2, 'oskadon', 2000, 20, 40000, '2019-07-06', 2, 'apt.sriwedari', '2019-06-28 20:15:52', '2019-06-29 21:22:26'),
(3, 3, 3, 'madu', 10000, 12, 120000, '2019-06-28', 2, 'apt.sriwedari', '2019-06-28 20:22:35', '2019-06-29 21:22:26'),
(4, 3, 4, 'jahe', 5000, 5, 25000, '2019-06-28', 2, 'apt.sriwedari', '2019-06-28 20:22:35', '2019-06-29 21:22:26'),
(105, 15, 5, 'Antangin Cair Junior', 1687, 10, 16870, '2020-08-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(106, 15, 6, 'Antangin JRG Cair isi 12', 2390, 24, 57360, '2021-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(107, 15, 7, 'Balsam Elang 40gr', 15584, 2, 31168, '2024-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(108, 15, 8, 'Betadin Solution 5 ml', 4235, 6, 25410, '2022-08-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(109, 15, 9, 'Betadin Solution 15 ml', 10857, 3, 32571, '2022-09-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(110, 15, 10, 'Betadine Solutin 30 ml', 19085, 3, 57255, '2022-09-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(111, 15, 11, 'Dettol Cair 100 ml', 13846, 2, 27692, '2021-12-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(112, 15, 12, 'Dettol Cair 250 ml', 34044, 1, 34044, '2022-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(113, 15, 13, 'Gandapura Elang 30 ml', 6967, 2, 13934, '2022-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(114, 15, 14, 'Gandapura Cair 60 ml', 11825, 1, 11825, '2024-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(115, 15, 15, 'Herocyn Bedak 85 gr', 11000, 2, 22000, '2023-09-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(116, 15, 16, 'Herocyn Bedak Bayi 100 gr', 7425, 2, 14850, '2024-05-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(117, 15, 17, 'Larutan Cap Badak 500 ml', 6061, 4, 24244, '2024-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(118, 15, 18, 'Listerine Greentea 80 ml', 8360, 1, 8360, '2021-01-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(119, 15, 19, 'Listerine Greentea 250 ml', 20460, 1, 20460, '2019-06-30', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(120, 15, 20, 'Listerine Coolmint 250 ml', 18370, 1, 18370, '2020-12-01', 2, 'apt.sriwedari', '2019-06-30 05:37:51', '2019-06-30 05:37:51'),
(637, 23, 229, 'Imboost tab 50 s', 3410, 50, 170500, '2022-05-05', 2, 'apt.sriwedari', '2019-06-30 21:07:06', '2019-06-30 21:07:06'),
(690, 16, 21, 'Listerine Original 250 ml', 18370, 1, 18370, '2020-12-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(691, 16, 22, 'Madurasa sacht', 750, 12, 9000, '2020-12-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(692, 16, 23, 'Minyak Tawon DD 35 ml', 22366, 2, 44732, '2020-12-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(693, 16, 24, 'Minyak Tawon EE 65 ml', 36300, 2, 72600, '2023-07-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(694, 16, 25, 'Minyak Telon Konicare 30 ml', 11165, 2, 22330, '2022-01-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(695, 16, 26, 'Minyak Telon Konicare 60 ml', 18887, 2, 37774, '2022-01-01', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(696, 16, 27, 'Salicyl Talk 75 gr Cito', 4200, 2, 8400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(697, 16, 28, 'Salicyl Talk Parfm 50 gr Cito', 4200, 2, 8400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(698, 16, 29, 'Tolak Angin Anak', 1830, 12, 21960, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(699, 16, 30, 'Bye Bye Fever Anak', 9085, 5, 45425, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(700, 16, 31, 'Bye Bye Fever Baby', 6392, 10, 63920, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(701, 16, 32, 'Hansaplast Jumbo', 475, 24, 11400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:14:39', '2019-07-01 05:14:39'),
(734, 17, 73, 'Verban KB merah 4x5cm', 1000, 50, 50000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(735, 17, 74, 'Larutan Kaki 3 200ml', 3000, 3, 9000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(736, 17, 75, 'MBK Putih', 1625, 12, 19500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(737, 17, 76, 'MBK Super', 2200, 12, 26400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(738, 17, 77, 'Parcok 25ml', 7000, 1, 7000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(739, 17, 78, 'Parcok 75ml', 15000, 1, 15000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(740, 17, 79, 'Anakonidin 60ml', 11300, 1, 11300, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(741, 17, 80, 'Antimo Tab', 4300, 5, 21500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(742, 17, 81, 'Uni Baby Cough', 4800, 3, 14400, '2022-05-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(743, 17, 82, 'Biolysin Syr 60ml', 12000, 2, 24000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(744, 17, 83, 'Bodrexin FB Berdahak syr', 9200, 2, 18400, '2021-03-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 07:45:20'),
(745, 17, 84, 'Bodrexin Demam Syr', 8800, 2, 17600, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(746, 17, 85, 'Dragon MKP 100ml', 28000, 1, 28000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(747, 17, 86, 'Dragon MKP 60ml', 17000, 1, 17000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(748, 17, 87, 'Telon Lang 60ml', 15000, 1, 15000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(749, 17, 88, 'Telon Lang 30ml', 8000, 1, 8000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(750, 17, 89, 'Tolak Angin Cair 12\'', 2666, 12, 31992, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(751, 17, 90, 'Tolak Angin Flu 12\'', 2500, 12, 30000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(752, 17, 91, 'Fitkom Gummy', 18000, 1, 18000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(753, 17, 92, 'Gajah Salicyl Menth 100g', 7000, 2, 14000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(754, 17, 93, 'IPI Vit B12', 4600, 2, 9200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(755, 17, 94, 'Medicated Oil 12ml', 23000, 1, 23000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(756, 17, 95, 'Mixagrip FB tab', 1964, 25, 49100, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 07:50:49'),
(757, 17, 96, 'My Baby Telon Plus 90ml', 21000, 1, 21000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(758, 17, 97, 'My Baby Telon plus 60ml', 16000, 1, 16000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 07:51:35'),
(759, 17, 98, 'Natur E 16\'', 17000, 2, 34000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(760, 17, 99, 'Nellco Spesial 55ml', 22500, 2, 45000, '2022-02-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(761, 17, 100, 'OB Herbal 100ml', 17000, 1, 17000, '2022-02-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(762, 17, 101, 'OB Herbal anak', 11700, 1, 11700, '2021-01-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(763, 17, 102, 'OBH Combi Anak Straw', 13300, 1, 13300, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(764, 17, 103, 'OBH Combi Anak Madu', 13300, 1, 13300, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(765, 17, 104, 'Salonpas Hijau', 6850, 5, 34250, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(766, 17, 105, 'Salonpas Merah', 6900, 5, 34500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(767, 17, 106, 'Sanaflu', 1650, 25, 41250, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(768, 17, 107, 'Scott Emulsion Jrk 200ml', 31000, 2, 62000, '2020-11-01', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(769, 17, 108, 'Sensi Gloves 100\'', 480, 200, 96000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(770, 17, 109, 'Siladex biru 60ml', 11000, 1, 11000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(771, 17, 110, 'Siladex Merah 60ml', 10000, 1, 10000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(772, 17, 111, 'Sutra Mrh 3\'', 4379, 2, 8758, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(773, 17, 112, 'Sutra Htm 3\'', 6500, 2, 13000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(774, 17, 113, 'Tonikum Bayer 100ml', 14000, 1, 14000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(775, 17, 114, 'Tonikum Bayer 330ml', 27000, 1, 27000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(776, 17, 115, 'Ultraflu', 2850, 25, 71250, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(777, 17, 116, 'Vicks F 44 Dws 100ml', 18500, 1, 18500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(778, 17, 117, 'Vicks F44 Dws 27ml', 7000, 1, 7000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(779, 17, 118, 'Vicks F44 Anak 27ml', 7200, 2, 14400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(780, 17, 119, 'Woods Syr Biru 60ml', 15700, 1, 15700, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(781, 17, 120, 'Woods Syr Merah 60ml', 17300, 1, 17300, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(782, 17, 121, 'Farsifen Syr', 10600, 2, 21200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(783, 17, 122, 'Proris Syr', 23500, 2, 47000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(784, 17, 123, 'OBH Itrasal', 4600, 3, 13800, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(785, 17, 124, 'Ikadry Flu 60ml', 19600, 1, 19600, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(786, 17, 125, 'Antimo Ank Straw 5ml 10\'', 1270, 10, 12700, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(787, 17, 126, 'Promag Gazero Cair 6\'', 2000, 6, 12000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(788, 17, 127, 'Madu TJ Panas Dalam 150g', 17000, 2, 34000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(789, 17, 128, 'Anakonidin OBH 60ml', 12300, 1, 12300, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(790, 17, 129, 'Woods Herbal Hijau 60ml', 14500, 1, 14500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(791, 17, 130, 'Vidoran Gummy Frugie', 16000, 1, 16000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(792, 17, 131, 'TJ Joybee Madu Jrk', 11100, 1, 11100, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(793, 17, 132, 'TJ Joybee Madu Straw', 11100, 1, 11100, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(794, 17, 133, 'Madu TJ Kurma 150g', 16000, 2, 32000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(795, 17, 134, 'Anakonidin herbal 30ml', 7200, 1, 7200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(796, 17, 135, 'Rivanol 100ml Cito', 4000, 2, 8000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(797, 17, 136, 'Ikadryl Batuk Merah', 15500, 1, 15500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(798, 17, 137, 'Coparcetin syr', 12000, 2, 24000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(799, 17, 138, 'Bronchitin syr', 13000, 2, 26000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:17:42', '2019-07-01 05:17:42'),
(834, 24, 230, 'Aspilet tab', 5830, 10, 58300, '2021-06-01', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(835, 24, 231, 'bisoprolol 5mg', 520, 30, 15600, '2021-01-01', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(836, 24, 232, 'Imboost kids 60 ml', 34320, 1, 34320, '2021-03-03', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(837, 24, 233, 'Kassa steril medika', 4200, 5, 21000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(838, 24, 234, 'Hirokids blackcurrant 60 ml', 16500, 1, 16500, '2021-02-02', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(839, 24, 235, 'Hirokids jrk 60 ml', 16500, 1, 16500, '2021-02-03', 2, 'apt.sriwedari', '2019-07-01 05:20:43', '2019-07-01 05:20:43'),
(854, 28, 283, 'SGM 1 Ananda 150gr', 13600, 1, 13600, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(855, 28, 284, 'SGM Eksplore 3+', 34850, 1, 34850, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(856, 28, 285, 'Avail Day Use Hijau', 23750, 3, 71250, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(857, 28, 286, 'Avail Pantyliner Hijau', 23750, 2, 47500, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(858, 28, 287, 'Avail Night Use Ungu', 23750, 1, 23750, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(859, 28, 288, 'Diabetasol Vanila 180gr', 39300, 1, 39300, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(860, 28, 289, 'Diabetasol Coklat 180gr', 39300, 1, 39300, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(861, 28, 290, 'Anlene Gold Vanilla 180gr', 38750, 1, 38750, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(862, 28, 291, 'Anlene Gold Coklat 250gr', 38750, 1, 38750, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(863, 28, 292, 'Entrasol QS Vanila 5S', 19650, 1, 19650, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(864, 28, 293, 'Entrasol QS Coklat 5S', 19650, 1, 19650, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 05:34:40', '2019-07-01 05:34:40'),
(1075, 18, 139, 'Combantrin 250 mg tab', 14400, 3, 43200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1076, 18, 140, 'combantrin 125 mg tab', 14000, 3, 42000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1077, 18, 141, 'decolgen tab', 1850, 5, 9250, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1078, 18, 142, 'Enervon C strip', 4500, 5, 22500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1079, 18, 143, 'feminax tab', 2000, 5, 10000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1080, 18, 144, 'Ipi vit A', 4600, 2, 9200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1081, 18, 145, 'Ipi Vit B complex', 4600, 2, 9200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1082, 18, 146, 'Ipi Vit C', 4600, 2, 9200, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1083, 18, 147, 'Napacin tab', 2000, 5, 10000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1084, 18, 148, 'pagoda salep 10 gr', 4700, 2, 9400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1085, 18, 149, 'Salep 88', 9800, 3, 29400, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1086, 18, 88, 'Telon Lang 30ml', 9800, 3, 29400, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1087, 18, 150, 'Vitalong C strip', 5000, 5, 25000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1088, 18, 151, 'Woods Permen', 3500, 6, 21000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 08:02:48'),
(1089, 18, 44, 'Dulcolac tab', 7600, 5, 38000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1090, 18, 152, 'Intunal tab', 2700, 5, 13500, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1091, 18, 153, 'Strepsil Cool', 9000, 2, 18000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1092, 18, 154, 'Strepsil Honey/Kuning', 9000, 2, 18000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1093, 18, 155, 'Ever E 250 amplop', 14000, 2, 28000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1094, 18, 156, 'Strepsil Regular/Merah', 8675, 2, 17350, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1095, 18, 375, 'Alat tensi Omron Hem 7120', 455000, 1, 455000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 07:38:04', '2019-07-01 07:38:04'),
(1096, 25, 236, 'oskadon tab', 1600, 50, 80000, '2021-02-03', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1097, 25, 237, 'fasidol tab', 1700, 10, 17000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1098, 25, 238, 'demacoline tab', 4800, 10, 48000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1099, 25, 239, 'tera - f tab', 3700, 10, 37000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1100, 25, 240, 'lodecon tab', 4000, 10, 40000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1101, 25, 241, 'mixalgin tab', 4800, 10, 48000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1102, 25, 242, 'Bufacaryl tab', 1900, 10, 19000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1103, 25, 243, 'infalgin tab', 3000, 10, 30000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1104, 25, 244, 'Paracetamol 500mg MEF', 2200, 10, 22000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1105, 25, 245, 'farsifen tab', 3800, 10, 38000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1106, 25, 246, 'Dexanta tab', 2000, 10, 20000, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1107, 25, 247, 'Neo Rheumacyl', 8200, 24, 196800, '2019-06-30', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1108, 25, 361, 'New Diatab', 2400, 25, 60000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1109, 25, 362, 'Contrexyn', 800, 25, 20000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1110, 25, 363, 'Laxing', 2860, 25, 71500, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1111, 25, 364, 'Tolak Linu', 2300, 10, 23000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1112, 25, 365, 'Ever E 12S', 26000, 2, 52000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1113, 25, 43, 'Diapet Anak Sacht', 1600, 6, 9600, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1114, 25, 366, 'Antimo Ank Jrk 10s', 1270, 10, 12700, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1115, 25, 367, 'Genoint SK', 5700, 3, 17100, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1116, 25, 368, 'Genoint SM', 8000, 3, 24000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1117, 25, 369, 'Erla SM', 7800, 3, 23400, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1118, 25, 370, 'Betametason SK', 8400, 3, 25200, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1119, 25, 371, 'Kalcinol N', 10200, 3, 30600, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1120, 25, 372, 'Betason N', 12500, 3, 37500, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1121, 25, 373, 'Kalpanax Cr', 10200, 2, 20400, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1122, 25, 374, 'Kapsida', 11500, 2, 23000, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 08:22:53', '2019-07-01 08:22:53'),
(1751, 26, 248, 'Aletrol TM', 15796, 3, 47388, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1752, 26, 249, 'Andalan Pil KB Biru/strip', 10267, 15, 154005, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1753, 26, 250, 'Bodrex Tb New', 3263, 10, 32630, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1754, 26, 251, 'Braito Ori 5ml', 7942, 3, 23826, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1755, 26, 252, 'Cendo Asthenof TM 5ml', 23100, 2, 46200, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1756, 26, 253, 'Cendo Catarlent TM 5ml', 24886, 2, 49772, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1757, 26, 254, 'Cendo Xltrol TM 5ml', 29975, 2, 59950, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1758, 26, 255, 'Cdr EFF-10', 37180, 1, 37180, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1759, 26, 256, 'Cdr Fortos', 36080, 1, 36080, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1760, 26, 257, 'Cdr Fruit', 37180, 1, 37180, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1761, 26, 258, 'Cerebrofort G Org 100ml', 16373, 1, 16373, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1762, 26, 259, 'Cerebrofort G Strw 100 ml', 16377, 1, 16377, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1763, 26, 260, 'Curcuma Plus 60ml', 10450, 3, 31350, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1764, 26, 261, 'Entrostop', 11619, 6, 69714, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1765, 26, 262, 'Entrostop HB Anak', 1680, 6, 10080, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1766, 26, 263, 'Ester C', 5610, 12, 67320, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1767, 26, 264, 'Imbost', 15246, 5, 76230, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1768, 26, 265, 'Insto', 11660, 2, 23320, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1769, 26, 266, 'Microgynon', 13858, 10, 138580, '2021-04-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1770, 26, 267, 'Microlax 5ml', 18883, 3, 56649, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1771, 26, 268, 'Paramex Nyeri Otot Merah', 1540, 25, 38500, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1772, 26, 269, 'Redoxon', 34540, 1, 34540, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1773, 26, 270, 'Rohto Cool 7ml', 14652, 2, 29304, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1774, 26, 271, 'Sakatonik ABC Straw', 12592, 1, 12592, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1775, 26, 272, 'Ultracap', 2316, 25, 57900, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1776, 26, 273, 'Visine', 13607, 2, 27214, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1777, 26, 274, 'Vital Ear Oil', 13970, 2, 27940, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1778, 26, 275, 'masker earloop', 415, 100, 41500, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1779, 26, 276, 'Masker Sensi Headloop', 435, 100, 43500, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1780, 26, 277, 'Tissue Magic Man Hitam', 9900, 1, 9900, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1781, 26, 278, 'Tissue Super Magic Merah', 9900, 1, 9900, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1782, 26, 279, 'Medicated Oil 20ml', 21081, 1, 21081, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1783, 26, 280, 'Medicated Oil 40ml', 33000, 1, 33000, '1940-04-07', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1784, 26, 281, 'Vicks Vaporus', 6687, 12, 80244, '2019-07-01', 2, 'apt.sriwedari', '2019-07-01 11:14:23', '2019-07-01 11:14:23'),
(1869, 32, 376, 'Embalase Resep', 3300, 3, 9900, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1870, 32, 377, 'Anacetine', 6250, 2, 12500, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1871, 32, 378, 'Antasida Susp AFI', 3099, 3, 9297, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1872, 32, 379, 'Batugin 120ml', 22934, 2, 45868, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1873, 32, 380, 'Caviplex Syr 120ml', 7733, 2, 15466, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1874, 32, 382, 'Cerebrofort G Straw 100ml', 16373, 1, 16373, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1875, 32, 383, 'Hufagesic Drop 16ml', 9699, 2, 19398, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1876, 32, 384, 'Itramol', 4099, 3, 12297, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1877, 32, 385, 'Laserin 110ml', 15387, 1, 15387, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1878, 32, 386, 'OBH Combi 100ml', 9918, 2, 19836, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1879, 32, 387, 'Paracetamol Syr Mersi 60ml', 2549, 3, 7647, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1880, 32, 388, 'Sucralfat Susp MEPRO 100ml', 18199, 2, 36398, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1881, 32, 389, 'Zink Syr Mepro', 4549, 3, 13647, '2019-07-01', 1, 'nadhif', '2019-07-01 19:44:49', '2019-07-01 19:44:49'),
(1882, 30, 315, 'Gajah MKP 30ml', 9239, 2, 18478, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1883, 30, 316, 'Gajah MKP 60ml', 17489, 2, 34978, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1884, 30, 317, 'Hot In CRM 120ml', 17765, 1, 17765, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1885, 30, 318, 'Hot In CRM 60ml', 9196, 2, 18392, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1886, 30, 319, 'Kapas Selection', 4392, 12, 52704, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1887, 30, 320, 'Konicare MT 30ml', 12441, 1, 12441, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1888, 30, 321, 'KOnicare MT 60ml', 21248, 2, 42496, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1889, 30, 322, 'Lang MKP 120ml', 36391, 2, 72782, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1890, 30, 323, 'Lang MKP 30ml', 9801, 2, 19602, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1891, 30, 324, 'Madu TJ 150gr', 15642, 2, 31284, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1892, 30, 325, 'Madu TJ 250gr', 23958, 1, 23958, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1893, 30, 326, 'Minyak Kapak 10ml', 12821, 2, 25642, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1894, 30, 327, 'Minyak Kapak 28ml', 30216, 2, 60432, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1895, 30, 328, 'Sari Kurma TJ 250ml', 14850, 2, 29700, '2019-07-01', 1, 'nadhif', '2019-07-01 20:02:56', '2019-07-01 20:02:56'),
(1896, 29, 294, 'Betadine Grg 100ml', 13098, 2, 26196, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1897, 29, 295, 'Betadine Grg 190ml', 23554, 1, 23554, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1898, 29, 296, 'Alkohol 70% 100ml', 3251, 5, 16255, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1899, 29, 297, 'Balsam K3 YLW 20gr', 6600, 2, 13200, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1900, 29, 298, 'Balsem Balpirik Hijau', 7083, 2, 14166, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1901, 29, 299, 'Balsem Balpirik Lvdr 20gr', 7416, 2, 14832, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1902, 29, 300, 'Balsem Balpirik Merah', 7416, 2, 14832, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1903, 29, 301, 'Balsem Geliga 20gr', 7816, 2, 15632, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1904, 29, 302, 'Balsem Geliga 40gr', 15271, 2, 30542, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1905, 29, 303, 'Balsem Lang 20gr', 7816, 2, 15632, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1906, 29, 304, 'Caladine Ltn 60ml', 12928, 2, 25856, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1907, 29, 305, 'Caladine Ltn 95ml', 18181, 2, 36362, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1908, 29, 306, 'Caladine Powder 100gr', 13177, 2, 26354, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1909, 29, 307, 'Fresh Care GT 10ml', 11495, 2, 22990, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1910, 29, 308, 'Fresh Care LVD 10ml', 11495, 2, 22990, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1911, 29, 309, 'Fresh Care MAA Strong 10ml', 11495, 2, 22990, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1912, 29, 310, 'Fresh Care ORG', 11495, 2, 22990, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1913, 29, 311, 'GPU Krim 150gr', 15882, 1, 15882, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1914, 29, 312, 'GPU Krim 60gr', 8988, 1, 8988, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1915, 29, 313, 'Minyak Urut GPU 30ml', 8168, 2, 16336, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1916, 29, 314, 'Minyak Urut GPU 60ml', 14157, 2, 28314, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:02', '2019-07-01 20:03:02'),
(1917, 31, 329, 'Softex Maternity 10s', 15195, 1, 15195, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1918, 31, 330, 'Madurasa Kurma 150gr', 13210, 1, 13210, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1919, 31, 331, 'Madurasa Premium 150gr', 19975, 1, 19975, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1920, 31, 332, 'SUN Tim Ayamsayur', 11835, 1, 11835, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1921, 31, 333, 'Sleek Baby 70ml', 2600, 4, 10400, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1922, 31, 334, 'Mitu Wipes Biru', 7243, 2, 14486, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1923, 31, 335, 'Mitu wipes ungu', 7243, 2, 14486, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1924, 31, 336, 'Ranita Cotton Bud 60', 2810, 5, 14050, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1925, 31, 337, 'Ranita Cottonbud Baby 100', 4625, 6, 27750, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1926, 31, 338, 'Cusson Baby pwd 100gr', 6505, 2, 13010, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1927, 31, 339, 'My Baby Pwd 100gr', 5985, 2, 11970, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1928, 31, 340, 'Rita bedak', 4580, 2, 9160, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1929, 31, 341, 'Mamy poko NB9', 13100, 1, 13100, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1930, 31, 342, 'Mamy poko S11', 15495, 1, 15495, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1931, 31, 343, 'Mamy poko M9', 15495, 1, 15495, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1932, 31, 344, 'Softek DS23cm isi 20', 8640, 1, 8640, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1933, 31, 345, 'Softex DS29cm isi 8+2', 8995, 1, 8995, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1934, 31, 346, 'Tessa TP', 2775, 3, 8325, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1935, 31, 347, 'Sweety pants S9+1', 12160, 1, 12160, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1936, 31, 348, 'Sweety Pant m8+1', 13995, 1, 13995, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1937, 31, 349, 'Sweety Pants L7+1', 13995, 1, 13995, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1938, 31, 350, 'Sweety Pant XL6+1', 14665, 1, 14665, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1939, 31, 351, 'Laurier 22cm 18', 8530, 2, 17060, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1940, 31, 352, 'Laurier 22cm 8', 3750, 2, 7500, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1941, 31, 353, 'SUN beras merah 100gr', 7550, 1, 7550, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1942, 31, 354, 'Tropicana Gula Diabtx', 20545, 1, 20545, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1943, 31, 355, 'Tropicana Gula Diabtx 50', 38310, 1, 38310, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1944, 31, 356, 'Diabetasol Gula 25', 18470, 1, 18470, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1945, 31, 357, 'Diabetasol Gula 50', 25590, 1, 25590, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1946, 31, 358, 'Lifree celana L4', 37600, 1, 37600, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1947, 31, 359, 'Lifree Celana XL3', 37600, 1, 37600, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1948, 31, 360, 'Tessa 250s', 12530, 2, 25060, '2019-07-01', 1, 'nadhif', '2019-07-01 20:03:14', '2019-07-01 20:03:14'),
(1949, 33, 375, 'Alat tensi Omron Hem 7120', 1000, 12, 12000, '2019-07-01', 1, 'nadhif', '2019-07-01 21:06:40', '2019-07-01 21:06:40'),
(1950, 34, 137, 'Coparcetin syr', 12000, 12, 144000, '2019-07-01', 1, 'nadhif', '2019-07-01 21:14:24', '2019-07-01 21:14:24'),
(1951, 35, 43, 'Diapet Anak Sacht', 7000, 12, 84000, '2019-07-01', 1, 'nadhif', '2019-07-01 21:16:22', '2019-07-01 21:16:22'),
(1955, 37, 296, 'Alkohol 70% 100ml', 1200, 100, 120000, '2019-07-01', 1, 'nadhif', '2019-07-01 22:54:03', '2019-07-01 22:54:03'),
(1957, 39, 410, 'telek', 1000, 12, 12000, '2019-07-01', 1, 'nadhif', '2019-07-01 22:59:08', '2019-07-01 22:59:08'),
(1960, 40, 411, 'tem', 1300, 12, 15600, '2019-07-01', 1, 'nadhif', '2019-07-01 23:04:57', '2019-07-01 23:04:57'),
(1961, 41, 412, 'es teh', 1200, 12, 14400, '2019-07-02', 1, 'nadhif', '2019-07-02 17:45:00', '2019-07-02 17:45:00'),
(1962, 42, 375, 'Alat tensi Omron Hem 7120', 1200, 12, 14400, '2019-07-02', 1, 'nadhif', '2019-07-02 17:45:48', '2019-07-02 17:45:48'),
(1963, 42, 125, 'Antimo Ank Straw 5ml 10\'', 1000, 12, 12000, '2019-07-02', 1, 'nadhif', '2019-07-02 17:45:48', '2019-07-02 17:45:48');

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_purchase_daily`
-- (See below for the actual view)
--
CREATE TABLE `report_purchase_daily` (
`date` date
,`transaction` bigint(21)
,`kind` bigint(21)
,`qty` decimal(32,0)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_purchase_distributor`
-- (See below for the actual view)
--
CREATE TABLE `report_purchase_distributor` (
`distributor_name` varchar(50)
,`date` date
,`kind` bigint(21)
,`qty` decimal(32,0)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_purchase_product`
-- (See below for the actual view)
--
CREATE TABLE `report_purchase_product` (
`product_name` varchar(150)
,`date` date
,`stock` decimal(32,0)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sale_daily`
-- (See below for the actual view)
--
CREATE TABLE `report_sale_daily` (
`date` date
,`transaction` bigint(21)
,`kind` bigint(21)
,`qty` decimal(32,0)
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sale_price`
-- (See below for the actual view)
--
CREATE TABLE `report_sale_price` (
`price_name` varchar(50)
,`date` date
,`kind` bigint(21)
,`qty` decimal(32,0)
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sale_product`
-- (See below for the actual view)
--
CREATE TABLE `report_sale_product` (
`product_name` varchar(150)
,`date` date
,`qty` decimal(32,0)
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_sale_sender`
-- (See below for the actual view)
--
CREATE TABLE `report_sale_sender` (
`sender_name` varchar(50)
,`date` date
,`kind` bigint(21)
,`qty` decimal(32,0)
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(30) NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `discount` float NOT NULL,
  `grand_total` float NOT NULL COMMENT 'total-discount',
  `paid` float NOT NULL,
  `changes` float NOT NULL,
  `qty` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  `additional` tinyint(1) NOT NULL,
  `retur` tinyint(1) NOT NULL,
  `price_id` int(11) NOT NULL,
  `price_name` varchar(50) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `invoice`, `sender_id`, `sender_name`, `total`, `discount`, `grand_total`, `paid`, `changes`, `qty`, `kind`, `additional`, `retur`, `price_id`, `price_name`, `user_id`, `username`, `created`, `updated`) VALUES
(1, '190628000001', 0, '', 3000, 0, 3000, 5000, 2000, 1, 1, 0, 0, 1, 'normal', 2, 'apt.sriwedari', '2019-06-28 17:49:05', '2019-06-29 21:22:26'),
(2, '190628000002', 0, '', 3000, 0, 3000, 5000, 2000, 1, 1, 0, 0, 1, 'normal', 2, 'apt.sriwedari', '2019-06-28 18:14:18', '2019-06-29 21:22:26'),
(3, '190628000003', 0, '', 18000, 0, 18000, 20000, 2000, 6, 1, 0, 0, 1, 'normal', 2, 'apt.sriwedari', '2019-06-28 18:33:58', '2019-06-29 21:22:26'),
(4, '190628000004', 0, '', 6000, 2000, 4000, 5000, 1000, 2, 1, 0, 0, 1, 'normal', 2, 'apt.sriwedari', '2019-06-28 18:34:53', '2019-06-29 21:22:26'),
(5, '190628000005', 0, '', 12000, 2000, 10000, 10000, 0, 4, 1, 0, 0, 1, 'normal', 2, 'apt.sriwedari', '2019-06-28 18:36:22', '2019-06-29 21:22:26'),
(6, '190629000006', 0, '', 15000, 0, 15000, 20000, 5000, 5, 1, 0, 1, 1, 'normal', 3, 'kasir', '2019-06-29 15:59:57', '2019-06-29 16:01:42'),
(7, '190629000007', 0, '', 15000, 0, 15000, 20000, 5000, 5, 1, 0, 1, 1, 'normal', 3, 'kasir', '2019-06-29 16:02:16', '2019-06-29 16:02:31'),
(8, '190629000008', 0, '', 15000, 2500, 12500, 20000, 7500, 5, 1, 0, 1, 1, 'normal', 2, 'apt.sriwedari', '2019-06-29 21:23:31', '2019-06-29 21:25:18'),
(9, '190629000009', 0, '', 3000, 0, 3000, 5000, 2000, 1, 1, 0, 0, 1, 'normal', 4, 'Febri', '2019-06-29 21:25:36', '2019-06-29 21:25:36'),
(10, '190701000010', 0, '', 2100, 99, 2001, 2001, 0, 3, 1, 0, 1, 2, 'Normal', 2, 'apt.sriwedari', '2019-07-01 07:21:43', '2019-07-01 23:20:15'),
(11, '190701000011', 0, '', 3600, 0, 3600, 4000, 400, 1, 1, 0, 0, 2, 'Normal', 2, 'apt.sriwedari', '2019-07-01 09:34:23', '2019-07-01 09:34:23'),
(12, '190702000012', 0, '', 2000, 0, 2000, 4000, 2000, 1, 1, 0, 0, 2, 'Normal', 1, 'nadhif', '2019-07-02 17:39:46', '2019-07-02 17:39:46'),
(13, '190702000013', 0, '', 9600, 0, 9600, 20000, 10400, 2, 1, 0, 1, 2, 'Normal', 1, 'nadhif', '2019-07-02 17:40:34', '2019-07-02 17:43:39'),
(14, '190702000014', 0, '', 30500, 0, 30500, 50000, 19500, 3, 3, 0, 0, 2, 'Normal', 1, 'nadhif', '2019-07-02 17:42:35', '2019-07-02 17:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `qty` int(11) NOT NULL,
  `total` float NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`id`, `sale_id`, `product_id`, `product_name`, `price`, `discount`, `qty`, `total`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 1, 1, 'paramex', 3000, 0, 1, 3000, 2, 'apt.sriwedari', '2019-06-28 17:49:05', '2019-06-29 21:22:26'),
(2, 2, 1, 'paramex', 3000, 0, 1, 3000, 2, 'apt.sriwedari', '2019-06-28 18:14:18', '2019-06-29 21:22:26'),
(3, 3, 1, 'paramex', 3000, 0, 6, 18000, 2, 'apt.sriwedari', '2019-06-28 18:33:58', '2019-06-29 21:22:26'),
(4, 4, 1, 'paramex', 3000, 1000, 2, 4000, 2, 'apt.sriwedari', '2019-06-28 18:34:53', '2019-06-29 21:22:26'),
(5, 5, 1, 'paramex', 3000, 500, 4, 10000, 2, 'apt.sriwedari', '2019-06-28 18:36:22', '2019-06-29 21:22:26'),
(6, 6, 1, 'paramex', 3000, 0, 5, 15000, 3, 'kasir', '2019-06-29 15:59:58', '2019-06-29 15:59:58'),
(7, 7, 1, 'paramex', 3000, 0, 5, 15000, 3, 'kasir', '2019-06-29 16:02:16', '2019-06-29 16:02:16'),
(8, 8, 1, 'paramex', 3000, 500, 5, 12500, 2, 'apt.sriwedari', '2019-06-29 21:23:31', '2019-06-29 21:23:31'),
(9, 9, 1, 'paramex', 3000, 0, 1, 3000, 4, 'Febri', '2019-06-29 21:25:36', '2019-06-29 21:25:36'),
(10, 10, 276, 'Masker Sensi Headloop', 700, 33, 3, 2001, 2, 'apt.sriwedari', '2019-07-01 07:21:43', '2019-07-01 07:21:43'),
(11, 11, 250, 'Bodrex Tb New', 3600, 0, 1, 3600, 2, 'apt.sriwedari', '2019-07-01 09:34:23', '2019-07-01 09:34:23'),
(12, 12, 141, 'decolgen tab', 2000, 0, 1, 2000, 1, 'nadhif', '2019-07-02 17:39:46', '2019-07-02 17:39:46'),
(13, 13, 144, 'Ipi vit A', 4800, 0, 2, 9600, 1, 'nadhif', '2019-07-02 17:40:34', '2019-07-02 17:40:34'),
(14, 14, 141, 'decolgen tab', 2000, 0, 1, 2000, 1, 'nadhif', '2019-07-02 17:42:35', '2019-07-02 17:42:35'),
(15, 14, 140, 'combantrin 125 mg tab', 14000, 0, 1, 14000, 1, 'nadhif', '2019-07-02 17:42:35', '2019-07-02 17:42:35'),
(16, 14, 139, 'Combantrin 250 mg tab', 14500, 0, 1, 14500, 1, 'nadhif', '2019-07-02 17:42:35', '2019-07-02 17:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`id`, `name`, `address`, `phone`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 'dokter contoh', 'ngantru', '085085085085', 2, 'apt.sriwedari', '2019-06-28 17:44:14', '2019-06-29 21:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `privilege` int(2) NOT NULL DEFAULT '2',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `privilege`, `is_admin`, `user_id`, `username`, `created`, `updated`) VALUES
(1, 'nadhif', '$2y$10$xb6QnX13zBPZ2KjmX0OxIODUxC9es074TRDjSpcZo/tCqWEq/ihWe', 1, 0, 0, '', '2019-04-12 19:49:44', '2019-07-01 22:38:07'),
(2, 'apt.sriwedari', '$2y$10$T9ydv2WT5dlB.WAuzhMzXe7ZiXrMMrkTucsuPygHiDEAGQHLcMpna', 1, 0, 2, 'admin', '2019-04-14 18:26:03', '2019-06-29 21:22:26'),
(4, 'Febri', '$2y$10$l7z3XpmYKm2E9M2J1ZJbpOLCMmvfSoH/PHcSOMZQz1HI4sKrT4ZUO', 2, 0, 2, 'admin', '2019-06-29 21:19:41', '2019-06-29 21:19:41'),
(5, 'Dhika', '$2y$10$3/SSk6vwKkUIXaWo1kkgE.609c5/qsVoHA/nJEw.NB.VzSVGkdUoa', 2, 0, 2, 'apt.sriwedari', '2019-07-01 10:26:49', '2019-07-01 10:26:49');

-- --------------------------------------------------------

--
-- Structure for view `report_purchase_daily`
--
DROP TABLE IF EXISTS `report_purchase_daily`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_purchase_daily`  AS  select `purchase`.`date` AS `date`,count(distinct `purchase`.`id`) AS `transaction`,count(distinct `purchase_product`.`product_id`) AS `kind`,sum(`purchase_product`.`stock`) AS `qty`,sum(`purchase_product`.`total`) AS `total` from (`purchase_product` join `purchase` on((`purchase`.`id` = `purchase_product`.`purchase_id`))) where (`purchase`.`is_valid` = 1) group by `purchase`.`date` ;

-- --------------------------------------------------------

--
-- Structure for view `report_purchase_distributor`
--
DROP TABLE IF EXISTS `report_purchase_distributor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_purchase_distributor`  AS  select `purchase`.`distributor_name` AS `distributor_name`,`purchase`.`date` AS `date`,count(distinct `purchase_product`.`product_id`) AS `kind`,sum(`purchase_product`.`stock`) AS `qty`,sum(`purchase_product`.`total`) AS `total` from (`purchase_product` join `purchase` on((`purchase`.`id` = `purchase_product`.`purchase_id`))) where (`purchase`.`is_valid` = 1) group by `purchase`.`date`,`purchase`.`distributor_name` ;

-- --------------------------------------------------------

--
-- Structure for view `report_purchase_product`
--
DROP TABLE IF EXISTS `report_purchase_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_purchase_product`  AS  select `pp`.`product_name` AS `product_name`,`p`.`date` AS `date`,sum(`pp`.`stock`) AS `stock`,sum(`pp`.`total`) AS `total` from (`purchase_product` `pp` join `purchase` `p` on((`pp`.`purchase_id` = `p`.`id`))) where (`p`.`is_valid` = 1) group by `p`.`date`,`pp`.`product_name` ;

-- --------------------------------------------------------

--
-- Structure for view `report_sale_daily`
--
DROP TABLE IF EXISTS `report_sale_daily`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sale_daily`  AS  select cast(`sale`.`created` as date) AS `date`,count(distinct `sale`.`id`) AS `transaction`,count(distinct `sale_product`.`product_id`) AS `kind`,sum(`sale_product`.`qty`) AS `qty`,sum(`sale_product`.`total`) AS `total` from (`sale_product` join `sale` on((`sale`.`id` = `sale_product`.`sale_id`))) where (`sale`.`retur` = 0) group by cast(`sale`.`created` as date) ;

-- --------------------------------------------------------

--
-- Structure for view `report_sale_price`
--
DROP TABLE IF EXISTS `report_sale_price`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sale_price`  AS  select `sale`.`price_name` AS `price_name`,cast(`sale`.`created` as date) AS `date`,count(distinct `sale_product`.`product_id`) AS `kind`,sum(`sale_product`.`qty`) AS `qty`,sum(`sale_product`.`total`) AS `total` from (`sale_product` join `sale` on((`sale`.`id` = `sale_product`.`sale_id`))) where (`sale`.`retur` = 0) group by cast(`sale`.`created` as date),`sale`.`price_name` ;

-- --------------------------------------------------------

--
-- Structure for view `report_sale_product`
--
DROP TABLE IF EXISTS `report_sale_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sale_product`  AS  select `sp`.`product_name` AS `product_name`,cast(`s`.`created` as date) AS `date`,sum(`sp`.`qty`) AS `qty`,sum(`sp`.`total`) AS `total` from (`sale_product` `sp` join `sale` `s` on((`sp`.`sale_id` = `s`.`id`))) where (`s`.`retur` = 0) group by cast(`s`.`created` as date),`sp`.`product_name` ;

-- --------------------------------------------------------

--
-- Structure for view `report_sale_sender`
--
DROP TABLE IF EXISTS `report_sale_sender`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_sale_sender`  AS  select `sale`.`sender_name` AS `sender_name`,cast(`sale`.`created` as date) AS `date`,count(distinct `sale_product`.`product_id`) AS `kind`,sum(`sale_product`.`qty`) AS `qty`,sum(`sale_product`.`total`) AS `total` from (`sale_product` join `sale` on((`sale`.`id` = `sale_product`.`sale_id`))) where (`sale`.`retur` = 0) group by cast(`sale`.`created` as date),`sale`.`sender_name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product`
--
ALTER TABLE `purchase_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;
--
-- AUTO_INCREMENT for table `product_price`
--
ALTER TABLE `product_price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `purchase_product`
--
ALTER TABLE `purchase_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1964;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sale_product`
--
ALTER TABLE `sale_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
