-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 01, 2021 at 12:22 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kpos_bkei`
--

-- --------------------------------------------------------

--
-- Table structure for table `kp_backdb`
--

CREATE TABLE `kp_backdb` (
  `id` int(11) NOT NULL,
  `backupfilename` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `backupfiledate` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `username` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ipaddress` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_backdb`
--

INSERT INTO `kp_backdb` (`id`, `backupfilename`, `backupfiledate`, `username`, `ipaddress`, `datime`) VALUES
(1, '2021Mar28_100834.sql', '2021-03-28 10:08:34', '2', '::1', '2021-03-28 10:08:34'),
(2, '2021Jul17_192734.sql', '2021-07-17 19:27:34', '2', '::1', '2021-07-17 19:27:34'),
(3, '2021Jul17_192827.sql', '2021-07-17 19:28:27', '2', '::1', '2021-07-17 19:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `kp_banks`
--

CREATE TABLE `kp_banks` (
  `bank_id` int(11) NOT NULL,
  `acc_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `acc_no` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bank_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bal` int(11) NOT NULL,
  `location` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_banks`
--

INSERT INTO `kp_banks` (`bank_id`, `acc_name`, `acc_no`, `bank_name`, `branch`, `bal`, `location`, `created_by`, `datime`, `del_status`) VALUES
(1, 'CASH DRAWER', '0000', 'CASH DRAWER', 'CASH DRAWER', 13198143, 'INHOUSE', 1, '2019-12-09 16:18:21', 2),
(2, 'MPESA', '886533', 'MPESA', 'INHOUSE', 6508620, 'INHOUSE', 1, '2019-12-09 16:22:20', 2),
(3, 'PETTY CASH', '1111', 'PETTY CASH', 'INHOUSE', 3412000, 'INHOUSE', 13, '2019-12-09 16:37:46', 2),
(4, 'CREDIT CARDS', '2222', 'CREDIT CARDS', 'INHOUSE', 9155398, 'INHOUSE', 13, '2019-12-09 16:39:43', 1),
(5, 'BANK ACCOUNT', '000', 'BANK', 'HOME', 192590, '00', 2, '2021-07-06 05:38:12', 2),
(6, 'Rensha Enterprises Limited', '1203698574', 'Sidian bank', 'gpo', 0, 'nairobi', 2, '2021-07-06 08:40:54', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_bank_hist`
--

CREATE TABLE `kp_bank_hist` (
  `bank_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_bal` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_bank_hist`
--

INSERT INTO `kp_bank_hist` (`bank_id`, `transaction`, `amount`, `user_id`, `bank_bal`, `day`, `datime`) VALUES
(1, 'BANK CREDITED BY RECEIPT NO 630', '6000.00', 2, '13191573.00', '2021-08-25', '2021-08-25 15:09:48'),
(1, 'BANK CREDITED BY RECEIPT NO 631', '570.00', 2, '13197573.00', '2021-08-25', '2021-08-25 15:14:06'),
(5, 'AMOUNT ADDED FOR CREDIT PAYMENT FOR SALE NO. 640', '150000.00', 2, '42590.00', '2021-08-30', '2021-08-30 18:06:08'),
(2, 'BANK CREDITED BY RECEIPT NO 641', '1450.00', 2, '6507170.00', '2021-08-30', '2021-08-30 19:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `kp_beba`
--

CREATE TABLE `kp_beba` (
  `beba_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `nid` varchar(22) NOT NULL,
  `location` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_cancelled_items`
--

CREATE TABLE `kp_cancelled_items` (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_cancelled_items`
--

INSERT INTO `kp_cancelled_items` (`sale_id`, `item_id`, `qty`, `price`) VALUES
(38, 171, 1, 110),
(42, 77, 1, 115),
(49, 165, 13, 95),
(121, 178, 1, 90),
(121, 174, 1, 125),
(51, 180, 1, 1000),
(185, 224, 4, 80),
(208, 165, 2, 100),
(208, 171, 4, 110),
(208, 182, 2, 130),
(262, 162, 1, 360),
(274, 32, 1, 250),
(274, 33, 1, 250),
(274, 83, 1, 180),
(274, 118, 1, 570),
(274, 84, 1, 140),
(274, 68, 3, 105),
(274, 62, 2, 110),
(274, 75, 2, 110),
(274, 141, 1, 4760),
(274, 122, 1, 520),
(274, 123, 1, 550),
(274, 201, 1, 155),
(274, 177, 1, 55),
(274, 209, 1, 350),
(274, 194, 1, 260),
(274, 179, 1, 1000),
(274, 14, 1, 1500),
(274, 8, 1, 1560),
(274, 10, 1, 1580),
(274, 138, 1, 600),
(274, 139, 1, 225),
(274, 220, 1, 250),
(274, 225, 1, 130),
(274, 37, 1, 75),
(274, 167, 3, 90),
(274, 136, 1, 350),
(274, 77, 1, 2860),
(274, 236, 1, 190),
(274, 145, 1, 3570),
(274, 166, 2, 55),
(274, 216, 1, 100),
(274, 82, 2, 110),
(274, 205, 4, 50),
(274, 9, 1, 1580),
(274, 54, 1, 100),
(274, 135, 1, 480),
(274, 58, 3, 50),
(274, 238, 1, 125),
(359, 259, 1, 460),
(448, 159, 1, 250),
(448, 166, 2, 55),
(0, 5, 1, 100),
(464, 165, 15, 95),
(595, 26, 1, 1500),
(642, 8, 10, 850),
(642, 14, 21, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `kp_cancelled_sales`
--

CREATE TABLE `kp_cancelled_sales` (
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_cancelled_sales`
--

INSERT INTO `kp_cancelled_sales` (`sale_id`, `user_id`, `cust_id`, `amount`, `day`, `datime`) VALUES
(642, 11, 9, 29500, '2021-08-31', '2021-08-31 10:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `kp_category`
--

CREATE TABLE `kp_category` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cat_description` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `spare3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_category`
--

INSERT INTO `kp_category` (`cat_id`, `name`, `cat_description`, `code`, `spare3`) VALUES
(1, 'SS FITTINGS', 'FITTINGS', 'SSF001', 0),
(2, 'SAFETY', 'SAFETY', 'SFTY001', 0),
(3, 'WELDING', 'WELDING', 'WLD001', 0),
(4, 'STEAM FITTINGS', 'STFTS', 'STMF001', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kp_customers`
--

CREATE TABLE `kp_customers` (
  `cust_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alias` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `location` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `del_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_customers`
--

INSERT INTO `kp_customers` (`cust_id`, `name`, `alias`, `phone`, `address`, `email`, `location`, `bal`, `del_status`) VALUES
(1, 'WALKIN CUSTOMER', '', '+254000', '', '', '000', '1210582.00', 1),
(9, 'AGRO CHEMICAL FOOD CO LIMITED', 'AGRO', 'P000611715C', 'P.O.BOX 18-40107', 'msemo@acfc.co.ke', 'MUHORONI KENYA', '23290.00', 1),
(10, 'PZ CUSSONS eAST AFRICAN LIMITED', 'PZ CUSSONS', '0711570155', '600 W 6th ST ste 400', 'ngumo22@gmail.com', 'INDUSTRIAL AREA', '15100.00', 1),
(11, 'tet', 'tets', '', '', '', '12 meru', '0.00', 1),
(15, 'Karirana', '', '', '', '', 'limuru', '0.00', 1),
(16, 'karirana estates limited', 'karirana', '', 'p.o.box 39-000217', '', 'liMURU, KENYA,', '0.00', 2),
(17, 'GITHUNGURI DAIRY FARMERS COOP SOCIETY LTD', 'FRESHA', '', 'P.O.BOX 3-00216', '', 'GITHUNGURI', '0.00', 2),
(18, 'LIMURU DAIRY FARMERS SOCIETY LTD', 'LINURU DAIRY', '', 'P.O.BOX 8-00217', '', 'LIMURU', '0.00', 2),
(19, 'NEW KENYA CO-OPERATIVE CREAMERIES', 'NEW KCC', '', 'P.O BOX 30131-00100', '', 'NAIROBI', '0.00', 2),
(20, 'THIKA TECHNICAL TRAINING INSTITUTE', 'TTI', '', 'P.O.BOX 91-01000', '', 'THIKA', '0.00', 2),
(21, 'OR POWER 4,INC', 'OR POWER', '', 'P.O. BOX 1566-20117', '', 'NAIVASHA KENYA', '0.00', 2),
(22, 'PZ CUSSONS E.A LIMITED', 'PZ', '', 'P.O. BOX 48597-00200', '', 'NAIROBI', '0.00', 2),
(23, 'AGRO CHEMICAL ', 'AGRO', '', 'P.O.BOX 18-40107', '', 'MUHORONI KENYA', '0.00', 2),
(24, 'ASPENDOS DAIRY LIMITED', 'ASPENDOS', '', 'P.O.BOX 19-10201', '', 'MURANGA', '0.00', 2),
(25, 'MARAMBA TEA FACTORY', 'MARAMBA', '', 'P.O. BOX 1412-00217', '', 'LIMURU', '0.00', 2),
(26, 'TROPIKAL BRANDS (AFRIKA) LTD', 'TROPIKAL', '', 'P.O.BOX 49465-00100', '', 'KASARANI', '0.00', 2),
(27, 'ZIARA DAIRIES LTD', 'ZIARA', '', 'P.O. BOX 27413-00100', '', 'NAIROBI', '0.00', 2),
(28, 'CANON CHEMICALS LIMITED', 'CANON', '', 'P.O.BOX 24336-00100', '', 'NAIROBI', '0.00', 2),
(29, 'KENTEGRA BIOTECHNOLOGY EPZ', 'EPZ', '', 'P.O. BOX 566-00502', '', 'KAREN NAIROBI', '0.00', 2),
(30, 'DODHIA PACKAGING KENYA LTD', 'DODHIA', '', 'P.O.BOX 42571-00100', '', 'NAIROBI', '0.00', 2),
(31, 'KIRINYAGA UNIVERSITY', 'UNI', '', 'P.O. BOX 143', '', 'KERUGOYA', '0.00', 2),
(32, 'ALMASI BOTTLERS LIMITED', 'ALMASI', '', '', '', '', '20000.00', 2),
(33, 'EAST AFRICAN PAPER MILLS LTD', 'EAPM', '', 'P.O. BOX 1404-00606', '', 'SARIT CENTRE NAIROBI', '0.00', 2),
(34, 'INDUSTRIAL AND COMMERCIAL DEV. CORPORATION', 'ICDC', '', 'P.O. BOX 45519', '', 'NAIROBI', '0.00', 2),
(35, 'KENYATTA UNIVERSITY', 'KU', '', 'P.O. BOX 43844-00100', '', 'NAIROBI', '0.00', 2),
(36, 'MAJID AL FUTTAIM HYPERMARKETS LTD', 'MAJID', '', 'P.O. BOX 2012-00621', '', 'NAIROBI', '0.00', 2),
(37, 'TRANSAFRICA PAPER MILLS LTD', 'TAPM', '', 'P.O.BOX 1404-00606', '', 'SARIT CENTRE NAIROBI', '0.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_cust_hist`
--

CREATE TABLE `kp_cust_hist` (
  `cust_id` int(11) NOT NULL,
  `trans` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trans_column` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trans_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `cf_bal` decimal(10,2) NOT NULL,
  `trans_date` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_cust_hist`
--

INSERT INTO `kp_cust_hist` (`cust_id`, `trans`, `trans_column`, `trans_id`, `user_id`, `amount`, `cf_bal`, `trans_date`, `datime`) VALUES
(3, 'SALE', 'sale_id', 629, 2, '470.00', '0.00', '2021-08-25', '2021-08-25 12:07:11'),
(5, 'SALE', 'sale_id', 630, 2, '6000.00', '0.00', '2021-08-25', '2021-08-25 12:09:49'),
(5, 'SALE', 'sale_id', 631, 2, '570.00', '0.00', '2021-08-25', '2021-08-25 12:14:06'),
(1, 'SALE', 'sale_id', 632, 2, '40750.00', '0.00', '2021-08-26', '2021-08-26 12:40:59'),
(1, 'SALE', 'sale_id', 633, 2, '2900.00', '0.00', '2021-08-26', '2021-08-26 12:59:03'),
(1, 'SALE', 'sale_id', 634, 2, '7450.00', '0.00', '2021-08-26', '2021-08-26 13:00:12'),
(7, 'SALE', 'sale_id', 635, 2, '6840.00', '0.00', '2021-08-27', '2021-08-27 11:32:26'),
(7, 'SALE', 'sale_id', 636, 2, '9000.00', '0.00', '2021-08-27', '2021-08-27 11:33:50'),
(7, 'SALE', 'sale_id', 637, 2, '10000.00', '0.00', '2021-08-27', '2021-08-27 11:38:26'),
(7, 'SALE', 'sale_id', 638, 2, '4000.00', '0.00', '2021-08-27', '2021-08-27 11:39:16'),
(7, 'SALE', 'sale_id', 639, 2, '790.00', '0.00', '2021-08-27', '2021-08-27 11:56:45'),
(3, 'SALE', 'sale_id', 640, 2, '157350.00', '0.00', '2021-08-30', '2021-08-30 15:03:48'),
(3, 'CREDIT PAYMENT', 'pay_id', 525, 2, '150000.00', '0.00', '2021-08-30', '2021-08-30 15:06:08'),
(6, 'LPO', 'lpo_id', 17, 2, '93400.00', '0.00', '2021-08-30', '2021-08-30 15:21:29'),
(3, 'SALE', 'sale_id', 641, 2, '1450.00', '0.00', '2021-08-30', '2021-08-30 16:19:49'),
(9, 'SALE', 'sale_id', 644, 11, '11900.00', '0.00', '2021-08-31', '2021-08-31 10:48:00'),
(3, 'SALE', 'sale_id', 643, 2, '8780.00', '0.00', '2021-08-31', '2021-08-31 10:52:32'),
(10, 'SALE', 'sale_id', 645, 2, '7200.00', '0.00', '2021-08-31', '2021-08-31 12:15:00'),
(10, 'SALE', 'sale_id', 646, 2, '7900.00', '0.00', '2021-08-31', '2021-08-31 12:16:14'),
(9, 'SALE', 'sale_id', 647, 2, '790.00', '0.00', '2021-08-31', '2021-08-31 12:17:18'),
(10, 'LPO', 'lpo_id', 18, 11, '5100.00', '0.00', '2021-08-31', '2021-08-31 12:29:09'),
(0, 'SALE', 'sale_id', 649, 11, '5100.00', '0.00', '2021-08-31', '2021-08-31 12:32:51'),
(9, 'SALE', 'sale_id', 650, 2, '10600.00', '0.00', '2021-08-31', '2021-08-31 13:53:34'),
(32, 'SALE', 'sale_id', 652, 11, '20000.00', '0.00', '2021-09-01', '2021-09-01 11:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `kp_grn`
--

CREATE TABLE `kp_grn` (
  `grn_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `status` int(11) DEFAULT '2',
  `pay_day` date NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_grn`
--

INSERT INTO `kp_grn` (`grn_id`, `po_id`, `user_id`, `sup_id`, `amount`, `paid`, `bal`, `status`, `pay_day`, `day`, `datime`) VALUES
(0, 1, 2, 5, '14360.00', '0.00', '14360.00', 2, '0000-00-00', '2021-07-12', '2021-07-12 08:13:07'),
(1, 2, 2, 13, '4350.00', '0.00', '4350.00', 2, '0000-00-00', '2021-07-12', '2021-07-12 08:17:27'),
(2, 3, 2, 7, '1199.00', '0.00', '1199.00', 2, '0000-00-00', '2021-07-17', '2021-07-17 19:31:23'),
(3, 4, 2, 12, '500.00', '0.00', '500.00', 2, '0000-00-00', '2021-07-17', '2021-07-17 19:32:04'),
(4, 5, 2, 1, '500.00', '0.00', '500.00', 2, '0000-00-00', '2021-07-22', '2021-07-22 16:52:26'),
(5, 6, 2, 7, '3178.00', '0.00', '3178.00', 2, '0000-00-00', '2021-07-26', '2021-07-26 19:20:45'),
(6, 7, 2, 7, '3375.00', '0.00', '3375.00', 2, '0000-00-00', '2021-08-02', '2021-08-02 18:03:08'),
(7, 8, 2, 1, '1000.00', '0.00', '1000.00', 2, '0000-00-00', '2021-08-18', '2021-08-18 22:47:57'),
(8, 9, 2, 7, '2975.00', '0.00', '2975.00', 2, '0000-00-00', '2021-08-18', '2021-08-18 22:51:29'),
(9, 10, 2, 4, '219300.00', '0.00', '219300.00', 2, '0000-00-00', '2021-08-30', '2021-08-30 18:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `kp_grn_hist`
--

CREATE TABLE `kp_grn_hist` (
  `grn_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_grn_id`
--

CREATE TABLE `kp_grn_id` (
  `grn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_grn_id`
--

INSERT INTO `kp_grn_id` (`grn_id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Table structure for table `kp_grn_items`
--

CREATE TABLE `kp_grn_items` (
  `grn_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s2s` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_grn_items`
--

INSERT INTO `kp_grn_items` (`grn_id`, `item_id`, `qty`, `price`, `total`, `user_id`, `day`, `datime`, `s2s`) VALUES
(9, 1, 1, 1800, 1800, 0, '2021-08-30', '2021-08-30 18:26:13', 1),
(9, 2, 100, 1750, 175000, 0, '2021-08-30', '2021-08-30 18:26:13', 1),
(9, 3, 50, 850, 42500, 0, '2021-08-30', '2021-08-30 18:26:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_grn_status`
--

CREATE TABLE `kp_grn_status` (
  `grn_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_items`
--

CREATE TABLE `kp_items` (
  `barcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_code` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `max_price` decimal(10,2) NOT NULL,
  `bprice` decimal(10,2) NOT NULL,
  `reorder` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `take` int(11) NOT NULL DEFAULT '2',
  `del_status` int(11) NOT NULL DEFAULT '2',
  `portion` int(11) NOT NULL DEFAULT '2',
  `wprice` int(11) NOT NULL,
  `wqty` decimal(10,2) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `dprice` decimal(10,2) NOT NULL,
  `sprice` decimal(10,2) NOT NULL,
  `uom` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bulk` int(11) NOT NULL DEFAULT '2',
  `pcs` int(11) NOT NULL,
  `break_item` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_items`
--

INSERT INTO `kp_items` (`barcode`, `item_id`, `stock_code`, `name`, `cat_id`, `sub_id`, `base_price`, `max_price`, `bprice`, `reorder`, `qty`, `store`, `take`, `del_status`, `portion`, `wprice`, `wqty`, `tax_id`, `dprice`, `sprice`, `uom`, `bulk`, `pcs`, `break_item`, `img`) VALUES
('0', 1, '', 'SS Caps 1/2\" Gr 316', 1, 0, '0.00', '0.00', '0.00', 20, 0, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '0.00', '', 0, 0, 0, ''),
('', 2, '', 'SS Caps 3/4\" Gr 316', 1, 0, '0.00', '0.00', '0.00', 2, 135, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '0.00', '', 0, 0, 0, ''),
('', 3, '', 'SS Caps 1\" Gr 316', 3, 0, '250.00', '0.00', '250.00', 2, 110, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '250.00', '', 0, 0, 0, ''),
('', 4, '', 'SS Caps 1 1/2\" Gr 316', 3, 0, '500.00', '0.00', '500.00', 2, 10, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '500.00', '', 0, 0, 0, ''),
('', 5, '', 'SS Caps 2\" Gr 316', 2, 0, '620.00', '0.00', '620.00', 2, 31, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '620.00', '', 0, 0, 0, ''),
('', 6, '', 'Clear  Googles', 1, 0, '3200.00', '0.00', '2750.00', 2, 0, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '3400.00', '', 0, 0, 0, ''),
('', 7, '', 'Clear wire braided hose 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 14, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 8, '', 'Clear wire braided hose 1 1/2\" ', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 9, '', 'Clear wire braided hose 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 10, '', 'Clear wire braided hose 2 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 11, '', 'Clear wire braided hose 3\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 12, '', 'Cutting Disk 4\" Makita', 2, 0, '750.00', '0.00', '530.00', 2, 5, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 13, '', 'Cutting Disk 4.5\" ', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 14, '', 'Cutting Disk 7\" SS', 2, 0, '750.00', '0.00', '2500.00', 2, 30, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 15, '', 'Cutting Disk 7\" M/S', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 16, '', 'Cutting Disk 9\" SS', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 17, '', 'Cutting Disk 9\" M/S', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 18, '', 'Dispensable earplugs', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 19, '', 'Dispensable Latex Gloves', 2, 0, '750.00', '0.00', '530.00', 2, 15, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 20, '', 'Diamond grip gloves', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 21, '', 'Dispensable dust masks', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 22, '', 'SS Con Reducer \"4x2\" SCH 10 GR 316', 2, 0, '2790.00', '0.00', '2790.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 23, '', 'SS Con Reducer SCH 10 GR 316', 2, 0, '750.00', '0.00', '530.00', 2, 17, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 24, '', 'SS Con Reducer  SCH 10 GR 316', 2, 0, '750.00', '0.00', '530.00', 2, 15, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 25, '', 'SS Con Reducer  SCH 10 GR 316', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 26, '', 'SS Con Reducer SCH 10 GR 316', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 27, '', 'Cutting Torch Nozel 6', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 28, '', 'Drill bit m6 Hilti', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 29, '', 'SS Bends 3\"', 2, 0, '750.00', '0.00', '530.00', 2, 17, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 30, '', 'SS Bends 4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 31, '', 'SS Bends 5\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 32, '', 'SS Bends 6\"', 2, 0, '750.00', '0.00', '530.00', 2, 11, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 33, '', 'CI Butterfly Valve 2\" LT Blue', 2, 0, '0.00', '0.00', '0.00', 2, 19, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 34, '', 'CI Butterfly Valve 2 1/2\" LT Blue', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 35, '', 'CI Butterfly Valve 3\" LT Blue', 2, 0, '1750.00', '0.00', '1750.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '1750.00', '2', 2, 2, 2, ''),
('', 36, '', 'CI Butterfly Valve 4\" LT Blue', 2, 0, '2240.00', '0.00', '2240.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '224.00', '2', 2, 2, 2, ''),
('', 37, '', 'CI Butterfly Valve 5\" LT Blue', 2, 0, '2880.00', '0.00', '2880.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '2880.00', '2', 2, 2, 2, ''),
('', 38, '', 'CI Butterfly Valve 6\" LT Blue', 2, 0, '3720.00', '0.00', '3720.00', 2, 11, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '3720.00', '2', 2, 2, 2, ''),
('', 39, '', 'SS Ball Valve 3pc', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 40, '', 'Boiler Nozzles 8.00', 2, 0, '750.00', '0.00', '530.00', 2, 10, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 41, '', 'Boiler Nozzles 8.50', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 42, '', 'SS Butterfly Valve 2\" ', 2, 0, '750.00', '0.00', '530.00', 2, 10, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 43, '', 'SS Elbow 1/2\"', 2, 0, '750.00', '0.00', '125.00', 2, 92, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 44, '', 'SS Elbow 3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 45, '', 'SS Elbow 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 46, '', 'SS Elbow 1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 47, '', 'SS Elbow 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 48, '', 'SS Elbow 2 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 49, '', 'SS Elbow 3\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 50, '', 'SS Elbow 4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 51, '', 'SS Elbow 5\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 52, '', 'SS Elbow 6\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 53, '', 'Emery Cloth p.800', 2, 0, '750.00', '0.00', '530.00', 2, 10, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 54, '', 'Emery Cloth p.400', 2, 0, '750.00', '0.00', '530.00', 2, 0, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 55, '', 'Emery Cloth p.600', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 56, '', 'Foot Operated Valve', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 57, '', '9\" Grinding Disk', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '800.00', '2', 2, 2, 2, ''),
('', 58, '', '7\" Grinding Disk', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '0.00', '800.00', '2', 2, 2, 2, ''),
('', 59, '', '4\" Grinding Disk', 2, 0, '750.00', '0.00', '600.00', 2, 20, 0, 2, 2, 2, 500, '2.00', 2, '800.00', '800.00', '2', 2, 2, 2, ''),
('', 60, '', 'Bronze Globe Valve 1/2\"', 2, 0, '1100.00', '0.00', '1100.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '1100.00', '2', 2, 2, 2, ''),
('', 61, '', 'Bronze Globe Valve 3/4\"', 2, 0, '1600.00', '0.00', '1600.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '1600.00', '2', 2, 2, 2, ''),
('', 62, '', 'Bronze Globe Valve 1\"', 2, 0, '2200.00', '0.00', '2200.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '2200.00', '2', 2, 2, 2, ''),
('', 63, '', 'Bronze Globe Valve 1 1/2\"', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 64, '', 'Bronze Globe Valve 2\"', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 65, '', 'C.S Globe Valve 1/2\"  screwed', 2, 0, '3100.00', '0.00', '3100.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '3100.00', '2', 2, 2, 2, ''),
('', 66, '', 'C.S Globe Valve 3/4\"', 2, 0, '3600.00', '0.00', '3600.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '3600.00', '2', 2, 2, 2, ''),
('', 67, '', 'C.S Globe Valve 1\"', 2, 0, '5200.00', '0.00', '5200.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '5200.00', '2', 2, 2, 2, ''),
('', 68, '', 'C.S Globe Valve 1 1/2\"', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 69, '', 'C.S Globe Valve 2\"', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 70, '', 'C.S Globe Valve 2 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 71, '', 'C.S Globe Valve 3\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 72, '', 'hacksaw', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 73, '', 'SS Hex Nipple 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 74, '', 'SS Hex Nipple 3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 75, '', 'SS Hex Nipple 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 76, '', 'SS Hex Nipple 1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 77, '', 'SS Hex Nipple 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 78, '', 'SS Hex Nipple 2 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 79, '', 'SS Hex Nipple 3\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 80, '', 'Hose Clips', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 81, '', 'Milano Rena Shower Kit', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 82, '', 'Milano Classic  W/M Sink Mixer', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 83, '', 'NP5 8210 3M Face Masks', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 84, '', 'Bronze non-return Valve 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 85, '', 'Bronze non-return Valve  3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 86, '', 'Bronze non-return Valve 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 87, '', 'Bronze non-return Valve  1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 88, '', 'Bronze non-return Valve 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 89, '', 'SS non-return Valve 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 90, '', 'SS non-return Valve  3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 91, '', 'SS non-return Valve 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 92, '', 'SS non-return Valve  1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 93, '', 'SS non-return Valve 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 94, '', 'Picking Acid', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 95, '', 'Pedrollo pump', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 96, '', 'Proximity Sensor', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 97, '', 'SS Pipe Crump', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 98, '', 'Silicone', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 99, '', 'Sight Glass', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 100, '', 'C.I Steam Trap Valve 1/2\'', 2, 0, '5300.00', '0.00', '5300.00', 2, 18, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '5300.00', '2', 2, 2, 2, ''),
('', 101, '', 'Steam Trap', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 102, '', 'Steam Bend', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 103, '', 'SS  TPE', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 104, '', 'SS Threaded Socket', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 105, '', 'Triclover', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 106, '', 'Trimmer Line', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 107, '', 'Trimmer Head', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 108, '', 'Triclover Gasket', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 109, '', 'Triclover Union 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 110, '', 'Triclover Union  1 1/2\" ', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 111, '', 'Triclover Union  1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 112, '', 'AL Camlock Part 2\" C', 2, 0, '700.00', '0.00', '700.00', 2, 18, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '700.00', '2', 2, 2, 2, ''),
('', 113, '', 'AL Camlock Part 2\" F', 2, 0, '500.00', '0.00', '500.00', 2, 15, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '500.00', '2', 2, 2, 2, ''),
('', 114, '', 'AL Camlock Part 2 1/2\" C', 2, 0, '810.00', '0.00', '810.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '810.00', '2', 2, 2, 2, ''),
('', 115, '', 'AL Camlock Part 2 1/2\" F', 2, 0, '500.00', '0.00', '500.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '500.00', '2', 2, 2, 2, ''),
('', 116, '', 'AL Camlock Part 3\" F', 2, 0, '850.00', '0.00', '850.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '850.00', '2', 2, 2, 2, ''),
('', 117, '', 'AL Camlock Part 3\" C', 2, 0, '1070.00', '0.00', '1070.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '2.00', '1070.00', '2', 2, 2, 2, ''),
('', 118, '', 'Asbestos Gland Packing 8 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 119, '', 'Asbestos Gland Packing 10 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 120, '', 'Asbestos Gland Packing 14 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 121, '', 'Asbestos Gland Packing 16 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 122, '', 'Asbestos Gland Packing 18 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 123, '', 'Asbestos Gland Packing 20 mm', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 124, '', 'SS Ball Valve 2pc 1/2\" Screw Gr316', 2, 0, '450.00', '0.00', '450.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '450.00', '2', 2, 2, 2, ''),
('', 125, '', 'SS Ball Valve 2pc 3/4\" Screw Gr316', 2, 0, '560.00', '0.00', '560.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '560.00', '2', 2, 2, 2, ''),
('', 126, '', 'SS Ball Valve 2pc 1\" Screw Gr316', 2, 0, '810.00', '0.00', '810.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '810.00', '2', 2, 2, 2, ''),
('', 127, '', 'SS Ball Valve 2pc 1 1/2\" Screw Gr316', 2, 0, '1610.00', '0.00', '1610.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '1610.00', '2', 2, 2, 2, ''),
('', 128, '', 'SS Ball Valve 2pc 2\" Screw Gr316', 2, 0, '2170.00', '0.00', '2170.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '2170.00', '2', 2, 2, 2, ''),
('', 129, '', 'SS Ball Valve 2pc  21/2\" Screw Gr316', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 130, '', 'SS Ball Valve 2pc 3\" Screw Gr316', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 131, '', 'SS Ball Valve 2pc 4\" Screw Gr316', 2, 0, '0.00', '0.00', '0.00', 2, 20, 0, 2, 2, 2, 0, '2.00', 2, '0.00', '0.00', '2', 2, 2, 2, ''),
('', 132, '', 'Belzona 1111', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 133, '', 'SS Barrel Nipple 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 134, '', 'SS Barrel Nipple 3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 135, '', 'SS Barrel Nipple 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 136, '', 'SS Barrel Nipple  1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 137, '', 'SS Barrel Nipple 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 138, '', 'SS Bends 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 139, '', 'SS Bends 3/4\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 140, '', 'SS Bends 1\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 141, '', 'SS Bends  1 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 142, '', 'SS Bends 2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 143, '', 'SS Bends 2 1/2\"', 2, 0, '750.00', '0.00', '530.00', 2, 20, 0, 2, 2, 2, 2, '2.00', 2, '2.00', '2.00', '2', 2, 2, 2, ''),
('', 144, '', 'SAMSUNG', 2, 0, '15000.00', '0.00', '10000.00', 0, 10, 0, 2, 2, 2, 0, '0.00', 2, '0.00', '18000.00', '20', 2, 0, 0, ''),
('', 145, '', 'SAMSUNG TWO', 1, 0, '15000.00', '0.00', '1000.00', 2, 3, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '17000.00', '', 2, 0, 0, ''),
('', 146, '', 'CONICAL RUBBER', 5, 0, '300.00', '0.00', '300.00', 3, 8, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '360.00', 'PCS', 2, 0, 0, ''),
('', 147, '', 'COTTON WASTE', 0, 0, '50.00', '0.00', '50.00', 3, 50, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '125.00', 'kgs', 0, 0, 0, ''),
('', 148, '', 'C.I STEAM TRAP VALVE 3/4\'', 4, 0, '6850.00', '0.00', '6850.00', 0, 0, 0, 2, 2, 2, 0, '0.00', 1, '0.00', '6850.00', '', 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_items_arch`
--

CREATE TABLE `kp_items_arch` (
  `barcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_code` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `max_price` decimal(10,2) NOT NULL,
  `bprice` decimal(10,2) NOT NULL,
  `reorder` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `take` int(11) NOT NULL DEFAULT '2',
  `del_status` int(11) NOT NULL DEFAULT '2',
  `store_id` varchar(155) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `store1_qty` decimal(10,2) NOT NULL,
  `store1_reorder` decimal(10,2) NOT NULL,
  `store2_qty` decimal(10,2) NOT NULL,
  `store2_reorder` decimal(10,2) NOT NULL,
  `store3_qty` decimal(10,2) NOT NULL,
  `store3_reorder` decimal(10,2) NOT NULL,
  `store4_qty` decimal(10,2) NOT NULL,
  `store4_reorder` decimal(10,2) NOT NULL,
  `store5_qty` decimal(10,2) NOT NULL,
  `store5_reorder` decimal(10,2) NOT NULL,
  `store6_qty` decimal(10,2) NOT NULL,
  `store6_reorder` decimal(10,2) NOT NULL,
  `store8_qty` decimal(10,2) NOT NULL,
  `store8_reorder` decimal(10,2) NOT NULL,
  `store9_qty` decimal(10,2) NOT NULL,
  `store10_qty` decimal(10,2) NOT NULL,
  `store10_reorder` decimal(10,2) NOT NULL,
  `portion` int(11) NOT NULL,
  `wprice` int(11) NOT NULL,
  `wqty` decimal(10,2) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `dprice` decimal(10,2) NOT NULL,
  `sprice` decimal(10,2) NOT NULL,
  `uom` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bulk` int(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `break_item` int(11) NOT NULL,
  `uom1` int(11) NOT NULL,
  `uom1qty` decimal(10,2) NOT NULL,
  `uom1reorder` decimal(10,2) NOT NULL,
  `uom2` int(11) NOT NULL,
  `uom2qty` decimal(10,2) NOT NULL,
  `uom2reorder` decimal(10,2) NOT NULL,
  `uom3` int(11) NOT NULL,
  `uom3qty` decimal(10,2) NOT NULL,
  `uom3reorder` decimal(10,2) NOT NULL,
  `uom4` int(11) NOT NULL,
  `uom4qty` decimal(10,2) NOT NULL,
  `uom4reorder` decimal(10,2) NOT NULL,
  `uom5` int(11) NOT NULL,
  `uom5qty` decimal(10,2) NOT NULL,
  `uom5reorder` decimal(10,2) NOT NULL,
  `uom6` int(11) NOT NULL,
  `uom6qty` decimal(10,2) NOT NULL,
  `uom6reorder` decimal(10,2) NOT NULL,
  `uom7` int(11) NOT NULL,
  `uom7qty` decimal(10,2) NOT NULL,
  `uom7reorder` decimal(10,2) NOT NULL,
  `uom8` int(11) NOT NULL,
  `uom8qty` decimal(10,2) NOT NULL,
  `uom8reorder` decimal(10,2) NOT NULL,
  `uom9` int(11) NOT NULL,
  `uom9qty` decimal(10,2) NOT NULL,
  `uom9reorder` decimal(10,2) NOT NULL,
  `uom10` int(11) NOT NULL,
  `uom10qty` decimal(10,2) NOT NULL,
  `uom10reorder` decimal(10,2) NOT NULL,
  `uom11` int(11) NOT NULL,
  `uom11qty` decimal(10,2) NOT NULL,
  `uom11reorder` decimal(10,2) NOT NULL,
  `uom12` int(11) NOT NULL,
  `uom12qty` decimal(10,2) NOT NULL,
  `uom12reorder` decimal(10,2) NOT NULL,
  `uom13` int(11) NOT NULL,
  `uom13qty` decimal(10,2) NOT NULL,
  `uom13reorder` decimal(10,2) NOT NULL,
  `uom14` int(11) NOT NULL,
  `uom14qty` decimal(10,2) NOT NULL,
  `uom14reorder` decimal(10,2) NOT NULL,
  `uom15` int(11) NOT NULL,
  `uom15qty` decimal(10,2) NOT NULL,
  `uom15reorder` decimal(10,2) NOT NULL,
  `uom16` int(11) NOT NULL,
  `uom16qty` decimal(10,2) NOT NULL,
  `uom16reorder` decimal(10,2) NOT NULL,
  `uom17` int(11) NOT NULL,
  `uom17qty` decimal(10,2) NOT NULL,
  `uom17reorder` decimal(10,2) NOT NULL,
  `uom18` int(11) NOT NULL,
  `uom18qty` decimal(10,2) NOT NULL,
  `uom18reorder` decimal(10,2) NOT NULL,
  `uom19` int(11) NOT NULL,
  `uom19qty` decimal(10,2) NOT NULL,
  `uom19reorder` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_items_portion`
--

CREATE TABLE `kp_items_portion` (
  `item_id` int(11) NOT NULL,
  `raw_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_item_hist`
--

CREATE TABLE `kp_item_hist` (
  `item_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_item_history`
--

CREATE TABLE `kp_item_history` (
  `item_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_item_history`
--

INSERT INTO `kp_item_history` (`item_id`, `transaction`, `user_id`, `day`, `datime`) VALUES
(165, 'QUANTITY ADJUSTMENT', 2, '2021-03-30', '2021-03-30 17:57:04'),
(281, 'ITEM CREATED', 2, '2021-04-22', '2021-04-22 20:43:43'),
(282, 'ITEM CREATED', 2, '2021-04-22', '2021-04-22 23:10:05'),
(283, 'ITEM CREATED', 2, '2021-04-22', '2021-04-22 23:11:37'),
(2, 'REORDER ADJUSTMENT', 2, '2021-04-22', '2021-04-22 23:15:48'),
(0, 'QUANTITY ADJUSTMENT', 2, '2021-04-25', '2021-04-25 12:59:57'),
(43, 'QUANTITY ADJUSTMENT', 2, '2021-04-25', '2021-04-25 13:01:44'),
(41, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 08:40:48'),
(42, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 08:46:54'),
(43, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 08:47:35'),
(44, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 08:48:37'),
(45, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 08:49:19'),
(1, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 09:00:19'),
(2, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 09:00:54'),
(3, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 09:01:24'),
(4, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 09:02:00'),
(5, 'ITEM CREATED', 2, '2021-07-05', '2021-07-05 09:02:59'),
(148, 'ITEM CREATED', 6, '2021-08-31', '2021-08-31 15:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `kp_item_qty_hist`
--

CREATE TABLE `kp_item_qty_hist` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `init_qty` int(11) DEFAULT NULL,
  `new_qty` int(11) DEFAULT NULL,
  `init_reorder` int(11) DEFAULT NULL,
  `new_reorder` int(11) DEFAULT NULL,
  `reason` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_item_qty_hist`
--

INSERT INTO `kp_item_qty_hist` (`item_id`, `user_id`, `init_qty`, `new_qty`, `init_reorder`, `new_reorder`, `reason`, `store_id`, `datime`) VALUES
(165, 2, 22, 1000, NULL, NULL, ' ', NULL, '2021-03-30 17:57:04'),
(0, 2, 0, 10, NULL, NULL, ' testing', NULL, '2021-04-25 12:59:57'),
(43, 2, 0, 1000, NULL, NULL, ' testing', NULL, '2021-04-25 13:01:44'),
(40, 2, 0, 10, NULL, NULL, ' testing', NULL, '2021-04-25 13:06:26'),
(43, 2, 0, 10, NULL, NULL, ' testing', NULL, '2021-04-25 13:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `kp_logistics`
--

CREATE TABLE `kp_logistics` (
  `del_id` int(11) NOT NULL,
  `beba_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `means` int(11) DEFAULT NULL,
  `reg` varchar(11) DEFAULT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_lpo`
--

CREATE TABLE `kp_lpo` (
  `lpo_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cf_bal` decimal(10,2) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `tax_perc` int(11) NOT NULL,
  `refno` varchar(55) NOT NULL,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_lpo`
--

INSERT INTO `kp_lpo` (`lpo_id`, `cust_id`, `user_id`, `day`, `amount`, `status`, `datime`, `cf_bal`, `tax_type`, `vatable`, `vat`, `tax_perc`, `refno`, `shop`) VALUES
(1, 2, 2, '2021-07-04', '5300.00', 2, '2021-07-04 09:05:32', '600.00', 1, '4679.31', '620.69', 0, '', 0),
(2, 2, 2, '2021-07-04', '10750.00', 2, '2021-07-04 09:07:27', '600.00', 1, '9818.97', '931.03', 0, '', 0),
(3, 4, 2, '2021-07-04', '5300.00', 2, '2021-07-04 09:18:32', '400.00', 2, '5300.00', '0.00', 0, '', 0),
(4, 2, 2, '2021-07-04', '7800.00', 2, '2021-07-04 09:20:39', '600.00', 2, '7800.00', '1248.00', 0, '', 0),
(5, 2, 2, '2021-07-04', '1477.00', 2, '2021-07-04 18:49:11', '600.00', 1, '1273.28', '203.72', 16, '', 0),
(6, 2, 2, '2021-07-04', '15750.00', 2, '2021-07-04 19:16:59', '18883.00', 1, '15750.00', '0.00', 0, '', 0),
(7, 3, 2, '2021-07-05', '45000.00', 2, '2021-07-05 03:19:16', '50900.00', 2, '45000.00', '7200.00', 16, '', 0),
(8, 2, 2, '2021-07-05', '3000.00', 2, '2021-07-05 03:31:18', '18883.00', 2, '3000.00', '480.00', 16, '', 0),
(9, 2, 2, '2021-07-05', '5600.00', 2, '2021-07-05 09:51:29', '18883.00', 1, '4827.59', '772.41', 16, '', 0),
(10, 1, 2, '2021-07-06', '21000.00', 2, '2021-07-06 04:41:43', '83644.00', 2, '21000.00', '3360.00', 16, '', 0),
(11, 2, 2, '2021-07-06', '15000.00', 2, '2021-07-06 05:44:22', '18883.00', 2, '15000.00', '2400.00', 16, 'LPO/90/80', 0),
(12, 5, 2, '2021-07-06', '21200.00', 2, '2021-07-06 09:28:27', '0.00', 2, '21200.00', '3392.00', 16, 'LPO/12/12', 0),
(13, 5, 2, '2021-04-25', '2736.00', 2, '2021-07-17 15:50:10', '22368.00', 1, '2358.62', '377.38', 0, '', 0),
(14, 5, 2, '2021-07-26', '2342.00', 2, '2021-07-26 16:21:56', '100760.00', 1, '2028.21', '313.79', 0, '', 0),
(15, 5, 2, '2021-08-18', '14592.00', 2, '2021-08-18 19:38:34', '2590761.00', 1, '14214.62', '377.38', 0, '', 0),
(16, 5, 2, '2021-08-18', '17556.00', 2, '2021-08-18 19:45:07', '2590761.00', 1, '17178.62', '377.38', 0, '', 2),
(17, 6, 2, '2021-08-30', '93400.00', 2, '2021-08-30 15:21:28', '0.00', 2, '93400.00', '14944.00', 16, 'lpo/12/31', 1),
(18, 10, 11, '2021-08-31', '5100.00', 2, '2021-08-31 12:29:09', '15100.00', 0, '0.00', '0.00', 0, '44500297082', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_lpo_id`
--

CREATE TABLE `kp_lpo_id` (
  `lpo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_lpo_id`
--

INSERT INTO `kp_lpo_id` (`lpo_id`) VALUES
(18);

-- --------------------------------------------------------

--
-- Table structure for table `kp_lpo_items`
--

CREATE TABLE `kp_lpo_items` (
  `id` int(11) NOT NULL,
  `lpo_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_id` int(11) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_lpo_items`
--

INSERT INTO `kp_lpo_items` (`id`, `lpo_id`, `cust_id`, `item_id`, `qty`, `price`, `total`, `status`, `day`, `datime`, `tax_id`, `tax_type`, `vat`, `vatable`, `shop`) VALUES
(1, 1, 0, 8, 1, 800, 800, 2, '2021-07-03', '2021-07-04 09:02:23', 2, 1, '0.00', '800.00', 0),
(2, 1, 0, 43, 3, 1500, 4500, 2, '2021-07-03', '2021-07-04 09:02:40', 1, 1, '620.69', '3879.31', 0),
(3, 2, 0, 6, 3, 1500, 4500, 2, '2021-07-03', '2021-07-04 09:06:48', 1, 1, '620.69', '3879.31', 0),
(4, 2, 0, 136, 5, 450, 2250, 2, '2021-07-03', '2021-07-04 09:06:55', 1, 1, '310.34', '1939.66', 0),
(5, 2, 0, 9, 2, 2000, 4000, 2, '2021-07-03', '2021-07-04 09:07:03', 2, 1, '0.00', '4000.00', 0),
(7, 3, 0, 136, 3, 1500, 4500, 2, '2021-07-03', '2021-07-04 09:09:46', 1, 2, '0.00', '4500.00', 0),
(8, 3, 0, 9, 2, 400, 800, 2, '2021-07-03', '2021-07-04 09:10:25', 2, 2, '0.00', '800.00', 0),
(9, 4, 0, 35, 4, 1200, 4800, 2, '2021-07-03', '2021-07-04 09:20:04', 1, 2, '768.00', '4800.00', 0),
(10, 4, 0, 18, 1, 3000, 3000, 2, '2021-07-03', '2021-07-04 09:20:28', 1, 2, '480.00', '3000.00', 0),
(11, 5, 0, 6, 1, 657, 657, 2, '2021-07-04', '2021-07-04 18:42:43', 0, 0, '0.00', '0.00', 0),
(12, 5, 0, 24, 1, 820, 820, 2, '2021-07-04', '2021-07-04 18:47:53', 0, 0, '0.00', '0.00', 0),
(13, 6, 0, 16, 1, 5250, 5250, 2, '2021-07-04', '2021-07-04 19:16:35', 2, 1, '0.00', '5250.00', 0),
(14, 6, 0, 17, 1, 10500, 10500, 2, '2021-07-04', '2021-07-04 19:16:43', 2, 1, '0.00', '10500.00', 0),
(15, 7, 0, 1, 2, 5000, 10000, 2, '2021-07-05', '2021-07-05 03:18:09', 0, 0, '0.00', '0.00', 0),
(16, 7, 0, 4, 10, 3500, 35000, 2, '2021-07-05', '2021-07-05 03:18:24', 0, 0, '0.00', '0.00', 0),
(17, 8, 0, 2, 1, 3000, 3000, 2, '2021-07-05', '2021-07-05 03:31:01', 0, 0, '0.00', '0.00', 0),
(18, 9, 0, 5, 1, 5600, 5600, 2, '2021-07-05', '2021-07-05 09:51:11', 0, 0, '0.00', '0.00', 0),
(19, 10, 0, 1, 10, 1500, 15000, 2, '2021-07-06', '2021-07-06 04:40:48', 0, 0, '0.00', '0.00', 0),
(20, 10, 0, 2, 4, 1500, 6000, 2, '2021-07-06', '2021-07-06 04:40:59', 0, 0, '0.00', '0.00', 0),
(21, 11, 0, 2, 1, 15000, 15000, 2, '2021-07-06', '2021-07-06 05:43:07', 0, 0, '0.00', '0.00', 0),
(22, 12, 0, 1607, 5, 1000, 5000, 2, '2021-07-06', '2021-07-06 09:26:24', 0, 0, '0.00', '0.00', 0),
(23, 12, 0, 1395, 5, 1220, 6100, 2, '2021-07-06', '2021-07-06 09:26:52', 0, 0, '0.00', '0.00', 0),
(24, 12, 0, 2259, 10, 1010, 10100, 2, '2021-07-06', '2021-07-06 09:27:25', 0, 0, '0.00', '0.00', 0),
(25, 13, 0, 5, 1, 2736, 2736, 2, '2021-04-25', '2021-07-17 15:49:50', 1, 1, '377.38', '2358.62', 0),
(26, 14, 0, 14, 1, 67, 67, 2, '2021-07-26', '2021-07-26 16:21:42', 2, 1, '0.00', '67.00', 0),
(27, 14, 0, 18, 5, 455, 2275, 2, '2021-07-26', '2021-07-26 16:21:48', 1, 1, '313.79', '1961.21', 0),
(28, 15, 0, 7, 1, 2736, 2736, 2, '2021-08-18', '2021-08-18 19:38:08', 1, 1, '377.38', '2358.62', 0),
(29, 15, 0, 12, 1, 2736, 2736, 2, '2021-08-18', '2021-08-18 19:38:15', 2, 1, '0.00', '2736.00', 0),
(30, 15, 0, 52, 1, 9120, 9120, 2, '2021-08-18', '2021-08-18 19:38:21', 0, 1, '0.00', '9120.00', 0),
(31, 16, 0, 14, 1, 14820, 14820, 2, '2021-08-18', '2021-08-18 19:44:41', 2, 1, '0.00', '14820.00', 2),
(32, 16, 0, 5, 1, 2736, 2736, 2, '2021-08-18', '2021-08-18 19:44:46', 1, 1, '377.38', '2358.62', 2),
(33, 17, 0, 2, 1, 2800, 2800, 2, '2021-08-30', '2021-08-30 15:19:45', 0, 0, '0.00', '0.00', 1),
(34, 17, 0, 1, 25, 1800, 45000, 2, '2021-08-30', '2021-08-30 15:20:04', 0, 0, '0.00', '0.00', 1),
(35, 17, 0, 3, 24, 1900, 45600, 2, '2021-08-30', '2021-08-30 15:20:29', 0, 0, '0.00', '0.00', 1),
(36, 18, 0, 28, 6, 850, 5100, 2, '2021-08-31', '2021-08-31 12:28:17', 0, 0, '0.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_lpo_status`
--

CREATE TABLE `kp_lpo_status` (
  `lpo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_menu`
--

CREATE TABLE `kp_menu` (
  `menu_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `link` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` int(11) NOT NULL,
  `sub` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `modal` int(11) NOT NULL DEFAULT '2',
  `modal_function` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_menu`
--

INSERT INTO `kp_menu` (`menu_id`, `name`, `link`, `level`, `sub`, `parent`, `icon`, `created_by`, `panel`, `modal`, `modal_function`) VALUES
(1, 'DASHBOARD', '../dash/', 1, 2, 0, 'fa fa-th-large', 0, 1, 2, ''),
(2, 'CUSTOMER MANAGER', '#', 1, 1, 0, 'fa fa-users', 0, 1, 2, ''),
(3, 'STAFF MANAGER', '#', 1, 1, 0, 'fa fa-user', 0, 1, 2, ''),
(4, 'Active Staff List', '../staff/staff.php', 2, 2, 3, '-', 0, 1, 2, ''),
(6, 'Archive Staff List', '../staff/arch_staff.php', 2, 2, 3, '-', 0, 1, 2, ''),
(7, 'USER MANAGER', '#', 1, 1, 0, 'fas fa-user-tie', 0, 1, 2, ''),
(8, 'Active Users', '../users/user.php', 2, 2, 7, '-', 0, 1, 2, ''),
(9, 'Archived Users', '../users/arch_users.php', 2, 2, 7, '-', 0, 1, 2, ''),
(10, 'INVENTORY MANAGER', '#', 1, 1, 0, 'fas fa-dolly-flatbed', 0, 1, 2, ''),
(11, 'Active Product List', '../prods/index.php', 2, 2, 10, '-', 0, 1, 2, ''),
(12, 'Archived Products', '../prods/arch_prods.php', 2, 2, 10, '-', 0, 1, 2, ''),
(13, 'Product Categories', '../cat/cat.php', 2, 2, 10, '-', 0, 1, 2, ''),
(14, 'Inventory', '#', 2, 1, 10, '-', 0, 1, 2, ''),
(15, 'Stock Adjustments', '../invent/stock.php', 3, 2, 14, '-', 0, 1, 2, ''),
(16, 'STORE MANAGER', '#', 1, 1, 0, 'fas fa-truck-moving', 0, 1, 2, ''),
(17, 'PURCHASE MANAGER', '#', 1, 1, 0, 'fas fa-shopping-basket', 0, 1, 2, ''),
(18, 'Vendor Manager', '#', 2, 1, 17, '-', 0, 1, 2, ''),
(19, 'Vendor List', '../sup/sup.php', 3, 2, 18, '-', 0, 1, 2, ''),
(20, 'Archived Vendors', '../sup/arch_sup.php', 3, 2, 18, '-', 0, 1, 2, ''),
(21, 'Raise PO', '../kugura/init_page.php', 2, 2, 17, '-', 0, 1, 2, ''),
(22, 'Receive P.O', '../kugura/po_pending.php', 2, 2, 17, '-', 0, 1, 2, ''),
(23, 'P.O List', '../kugura/po_list.php', 2, 2, 17, '-', 0, 1, 2, ''),
(24, 'FINANCE', '#', 1, 1, 0, 'fa fa-donate', 0, 1, 2, ''),
(25, 'Banking', '#', 2, 1, 24, '-', 0, 1, 2, ''),
(26, 'Active Accounts', '../banking/banks.php', 3, 2, 25, '-', 0, 1, 2, ''),
(27, 'Closed Accounts', '../banking/closed_banks.php', 3, 2, 25, '-', 0, 1, 2, ''),
(28, 'REPORTS', '#', 1, 1, 0, 'fa fa-chart-pie', 0, 1, 2, ''),
(29, 'Sales', '../reports/', 2, 2, 28, '-', 0, 1, 2, ''),
(50, 'Customer List', '../customer/customers.php', 2, 2, 2, '-', 0, 1, 2, ''),
(51, 'Archived Customers', '../customer/arch_customers.php', 2, 2, 2, '-', 0, 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_note`
--

CREATE TABLE `kp_note` (
  `note_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `ret_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `cr_amount` decimal(10,2) NOT NULL,
  `dr_amount` decimal(10,2) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `date` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_note`
--

INSERT INTO `kp_note` (`note_id`, `sale_id`, `ret_id`, `user_id`, `amount`, `cr_amount`, `dr_amount`, `type`, `date`, `datime`) VALUES
(1, 135, 1, 2, '820.00', '820.00', '0.00', 'C', '2021-04-23', '2021-04-23 00:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `kp_note_id`
--

CREATE TABLE `kp_note_id` (
  `note_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_note_id`
--

INSERT INTO `kp_note_id` (`note_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_note_items`
--

CREATE TABLE `kp_note_items` (
  `note_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_pay_id`
--

CREATE TABLE `kp_pay_id` (
  `pay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_pay_id`
--

INSERT INTO `kp_pay_id` (`pay_id`) VALUES
(526);

-- --------------------------------------------------------

--
-- Table structure for table `kp_pay_mode`
--

CREATE TABLE `kp_pay_mode` (
  `pay_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `btn_color` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `has_ref` int(11) NOT NULL,
  `has_change` int(11) NOT NULL DEFAULT '2',
  `created_by` int(11) NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_pay_mode`
--

INSERT INTO `kp_pay_mode` (`pay_id`, `bank_id`, `name`, `btn_color`, `has_ref`, `has_change`, `created_by`, `datime`, `del_status`) VALUES
(1, 1, 'CASH', '#630000', 2, 1, 2, '2021-03-22 10:38:06', 2),
(2, 2, 'MPESA', '#295218', 1, 2, 2, '2021-03-22 10:38:21', 2),
(3, 5, 'CHEQUE', '#0000FF', 1, 2, 2, '2021-07-06 05:38:51', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_petty`
--

CREATE TABLE `kp_petty` (
  `petty_id` int(11) NOT NULL,
  `note_id` int(11) DEFAULT NULL,
  `description` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `recipient` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `recipient_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `recipient_phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `company` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `amount_given` decimal(10,2) DEFAULT NULL,
  `amount_used` decimal(10,2) DEFAULT NULL,
  `change_given` decimal(10,2) DEFAULT NULL,
  `change_by` int(11) DEFAULT NULL,
  `raise_by` int(11) DEFAULT NULL,
  `app_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bank_bal` decimal(10,2) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_petty_id`
--

CREATE TABLE `kp_petty_id` (
  `petty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_petty_reprint`
--

CREATE TABLE `kp_petty_reprint` (
  `petty_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_by` int(11) NOT NULL,
  `reprint_date` date NOT NULL,
  `datime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_po`
--

CREATE TABLE `kp_po` (
  `po_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `shift` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `disc` decimal(10,2) NOT NULL,
  `tax_by` int(11) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_perc` int(11) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '2',
  `rec_staff` int(11) NOT NULL,
  `rec_date` date NOT NULL,
  `stock_status` int(11) NOT NULL DEFAULT '2',
  `grn_status` int(11) NOT NULL DEFAULT '2',
  `cf_bal` decimal(10,2) NOT NULL,
  `refno` varchar(55) NOT NULL,
  `s2s` int(11) NOT NULL DEFAULT '2',
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_po`
--

INSERT INTO `kp_po` (`po_id`, `req_id`, `sup_id`, `user_id`, `po_date`, `shift`, `amount`, `disc`, `tax_by`, `tax_type`, `tax_perc`, `vatable`, `vat`, `rec_status`, `rec_staff`, `rec_date`, `stock_status`, `grn_status`, `cf_bal`, `refno`, `s2s`, `shop`) VALUES
(1, 0, 5, 2, '2021-07-12', '0000-00-00', '14360.00', '0.00', 0, 0, 0, '0.00', '0.00', 1, 0, '0000-00-00', 2, 2, '50265.00', '567', 1, 0),
(2, 0, 13, 2, '2021-07-12', '0000-00-00', '4350.00', '0.00', 0, 0, 0, '0.00', '0.00', 1, 0, '0000-00-00', 2, 2, '7500.00', '89', 1, 0),
(3, 0, 7, 2, '2021-04-23', '0000-00-00', '1199.00', '0.00', 1, 1, 0, '1130.03', '68.97', 1, 0, '0000-00-00', 2, 2, '0.00', '3qw', 1, 0),
(4, 0, 12, 2, '2021-07-17', '0000-00-00', '500.00', '0.00', 1, 1, 0, '431.03', '68.97', 1, 0, '0000-00-00', 2, 2, '0.00', 'we', 1, 0),
(5, 0, 1, 2, '2021-07-22', '0000-00-00', '500.00', '0.00', 1, 1, 0, '500.00', '0.00', 1, 0, '0000-00-00', 2, 2, '172000.00', '52', 1, 0),
(6, 0, 7, 2, '2021-07-26', '0000-00-00', '3178.00', '0.00', 1, 1, 0, '3053.45', '124.55', 1, 0, '0000-00-00', 2, 2, '1199.00', '67', 1, 0),
(7, 0, 7, 2, '2021-08-01', '0000-00-00', '3375.00', '0.00', 1, 1, 0, '3012.93', '362.07', 1, 0, '0000-00-00', 2, 2, '4377.00', '12', 1, 0),
(8, 0, 1, 2, '2021-08-18', '0000-00-00', '1000.00', '0.00', 1, 1, 0, '931.03', '68.97', 1, 0, '0000-00-00', 2, 2, '172500.00', '500', 1, 0),
(9, 0, 7, 2, '2021-08-18', '0000-00-00', '2975.00', '0.00', 1, 1, 0, '2975.00', '0.00', 1, 0, '0000-00-00', 2, 2, '7752.00', '700', 1, 0),
(10, 0, 4, 2, '2021-08-30', '0000-00-00', '219300.00', '0.00', 0, 0, 0, '0.00', '0.00', 1, 0, '0000-00-00', 2, 2, '14400.00', 'rpt180045', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kp_po_id`
--

CREATE TABLE `kp_po_id` (
  `po_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_po_id`
--

INSERT INTO `kp_po_id` (`po_id`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `kp_po_items`
--

CREATE TABLE `kp_po_items` (
  `id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `disc` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `rec_qty` decimal(10,2) NOT NULL,
  `rec_price` decimal(10,2) NOT NULL,
  `rec_total` decimal(10,2) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '2',
  `s2s` int(11) NOT NULL DEFAULT '2',
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_po_items`
--

INSERT INTO `kp_po_items` (`id`, `req_id`, `po_id`, `item_id`, `uom`, `qty`, `price`, `disc`, `total`, `status`, `rec_qty`, `rec_price`, `rec_total`, `rec_user`, `rec_status`, `s2s`, `day`, `datime`, `vatable`, `vat`, `tax_id`, `tax_type`, `shop`) VALUES
(90, 0, 1, 14, 0, '1.00', '4560.00', '0.00', '4560.00', 2, '1.00', '4560.00', '4560.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:29', '0.00', '0.00', 0, 0, 0),
(91, 0, 1, 5, 0, '1.00', '2300.00', '0.00', '2300.00', 2, '1.00', '2300.00', '2300.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:38', '0.00', '0.00', 0, 0, 0),
(92, 0, 1, 126, 0, '15.00', '500.00', '0.00', '7500.00', 2, '15.00', '500.00', '7500.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:53', '0.00', '0.00', 0, 0, 0),
(93, 0, 2, 8, 0, '5.00', '150.00', '0.00', '750.00', 2, '5.00', '150.00', '750.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:13:55', '0.00', '0.00', 0, 0, 0),
(94, 0, 2, 604, 0, '6.00', '600.00', '0.00', '3600.00', 2, '6.00', '600.00', '3600.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:14:03', '0.00', '0.00', 0, 0, 0),
(95, 0, 3, 6, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:30:51', '431.03', '68.97', 1, 1, 0),
(96, 0, 3, 9, 0, '3.00', '233.00', '0.00', '699.00', 2, '3.00', '233.00', '699.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:31:00', '699.00', '0.00', 2, 1, 0),
(97, 0, 4, 37, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:31:55', '431.03', '68.97', 1, 1, 0),
(98, 0, 5, 69, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-22', '2021-07-22 13:51:30', '500.00', '0.00', 0, 1, 0),
(99, 0, 6, 84, 0, '1.00', '678.00', '0.00', '678.00', 2, '1.00', '678.00', '678.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:20', '584.48', '93.52', 1, 1, 0),
(100, 0, 6, 11, 0, '5.00', '455.00', '0.00', '2275.00', 2, '5.00', '455.00', '2275.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:27', '2275.00', '0.00', 2, 1, 0),
(101, 0, 6, 19, 0, '5.00', '45.00', '0.00', '225.00', 2, '5.00', '45.00', '225.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:35', '193.97', '31.03', 1, 1, 0),
(102, 0, 7, 70, 0, '1.00', '125.00', '0.00', '125.00', 2, '1.00', '125.00', '125.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:01:36', '107.76', '17.24', 1, 1, 0),
(103, 0, 7, 22, 0, '5.00', '500.00', '0.00', '2500.00', 2, '5.00', '500.00', '2500.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:01:46', '2155.17', '344.83', 1, 1, 0),
(104, 0, 7, 17, 0, '5.00', '150.00', '0.00', '750.00', 2, '5.00', '150.00', '750.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:02:16', '750.00', '0.00', 2, 1, 0),
(105, 0, 8, 4, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-08-18', '2021-08-18 19:47:15', '431.03', '68.97', 1, 1, 0),
(106, 0, 8, 174, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-08-18', '2021-08-18 19:47:28', '500.00', '0.00', 0, 1, 0),
(107, 0, 9, 118, 0, '1.00', '700.00', '0.00', '700.00', 2, '1.00', '700.00', '700.00', 2, 1, 1, '2021-08-18', '2021-08-18 19:50:52', '700.00', '0.00', 0, 1, 2),
(108, 0, 9, 11, 0, '5.00', '455.00', '0.00', '2275.00', 2, '5.00', '455.00', '2275.00', 2, 1, 1, '2021-08-18', '2021-08-18 19:51:01', '2275.00', '0.00', 2, 1, 2),
(109, 0, 10, 1, 0, '1.00', '1800.00', '0.00', '1800.00', 2, '1.00', '1800.00', '1800.00', 2, 1, 1, '2021-08-30', '2021-08-30 15:22:49', '0.00', '0.00', 0, 0, 1),
(110, 0, 10, 2, 0, '100.00', '1750.00', '0.00', '175000.00', 2, '100.00', '1750.00', '175000.00', 2, 1, 1, '2021-08-30', '2021-08-30 15:23:09', '0.00', '0.00', 0, 0, 1),
(111, 0, 10, 3, 0, '50.00', '850.00', '0.00', '42500.00', 2, '50.00', '850.00', '42500.00', 2, 1, 1, '2021-08-30', '2021-08-30 15:23:30', '0.00', '0.00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_po_status`
--

CREATE TABLE `kp_po_status` (
  `po_id` int(11) NOT NULL,
  `po_user_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `po_status` int(11) NOT NULL DEFAULT '2',
  `sale_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_qt`
--

CREATE TABLE `kp_qt` (
  `qt_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UOM` decimal(10,2) NOT NULL,
  `cf_bal` decimal(10,2) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `tax_perc` int(11) NOT NULL,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_qt`
--

INSERT INTO `kp_qt` (`qt_id`, `cust_id`, `user_id`, `day`, `amount`, `status`, `datime`, `UOM`, `cf_bal`, `tax_type`, `vatable`, `vat`, `tax_perc`, `shop`) VALUES
(1, 1, 2, '2021-06-29', '600.00', 2, '2021-06-29 08:05:55', '0.00', '8000.00', 0, '0.00', '0.00', 0, 0),
(2, 3, 2, '2021-06-29', '182500.00', 2, '2021-06-29 08:11:06', '0.00', '50900.00', 0, '0.00', '0.00', 0, 0),
(3, 1, 2, '2021-06-29', '580.00', 2, '2021-06-29 09:11:30', '0.00', '8000.00', 2, '500.00', '80.00', 16, 0),
(4, 3, 1, '2021-06-29', '2311.00', 2, '2021-06-29 09:16:17', '0.00', '50900.00', 1, '1992.24', '318.76', 16, 0),
(6, 2, 2, '2021-07-01', '11600.00', 2, '2021-07-01 11:31:09', '0.00', '4078.00', 2, '10000.00', '1600.00', 16, 0),
(7, 2, 2, '2021-07-01', '281300.00', 2, '2021-07-01 12:25:36', '0.00', '38883.00', 2, '242500.00', '38800.00', 16, 0),
(8, 2, 2, '2021-07-05', '38280.00', 2, '2021-07-05 09:49:01', '0.00', '18883.00', 2, '33000.00', '5280.00', 16, 0),
(9, 5, 2, '2021-07-14', '34420.00', 2, '2021-07-13 21:12:52', '0.00', '0.00', 1, '29672.41', '4747.59', 16, 0),
(10, 5, 2, '2021-07-06', '20288.40', 2, '2021-07-06 09:15:21', '0.00', '0.00', 2, '17490.00', '2798.40', 16, 0),
(11, 5, 2, '2021-07-15', '8378.00', 2, '2021-07-15 06:06:29', '0.00', '0.00', 1, '7222.41', '1155.59', 16, 0),
(12, 5, 2, '2021-07-17', '30096.00', 2, '2021-07-17 15:39:12', '0.00', '22368.00', 1, '25944.83', '4151.17', 16, 0),
(13, 2, 2, '2021-07-17', '69540.00', 2, '2021-07-17 15:49:02', '0.00', '18883.00', 1, '59948.28', '9591.72', 16, 0),
(14, 4, 2, '2021-07-22', '8550.00', 2, '2021-07-22 07:30:21', '0.00', '11970.00', 1, '7370.69', '1179.31', 16, 0),
(15, 5, 2, '2021-08-03', '2500.00', 2, '2021-08-03 08:15:15', '0.00', '100760.00', 1, '2155.17', '344.83', 16, 0),
(16, 2, 2, '2021-08-03', '13680.00', 2, '2021-08-03 08:17:26', '0.00', '40683.00', 1, '11793.10', '1886.90', 16, 0),
(17, 5, 2, '2021-08-17', '8719.00', 2, '2021-08-17 08:14:22', '0.00', '2579988.00', 1, '7516.38', '1202.62', 16, 0),
(18, 3, 2, '2021-08-17', '15955.00', 2, '2021-08-17 08:21:54', '0.00', '0.00', 1, '13754.31', '2200.69', 16, 0),
(20, 6, 2, '2021-08-17', '169860.00', 2, '2021-08-17 10:48:09', '0.00', '0.00', 1, '146431.03', '23428.97', 16, 0),
(22, 3, 2, '2021-08-17', '62016.00', 2, '2021-08-17 16:24:44', '0.00', '0.00', 1, '53462.07', '8553.93', 16, 0),
(23, 2, 2, '2021-08-17', '44574.00', 2, '2021-08-17 16:26:41', '0.00', '40683.00', 0, '38425.86', '6148.14', 16, 0),
(24, 5, 2, '2021-08-18', '19152.00', 2, '2021-08-18 19:32:51', '0.00', '2590761.00', 0, '0.00', '0.00', 0, 2),
(25, 1, 2, '2021-08-26', '468060.00', 2, '2021-08-26 13:10:11', '0.00', '1210582.00', 0, '403500.00', '64560.00', 16, 2),
(26, 6, 2, '2021-08-30', '141288.00', 2, '2021-08-30 15:16:32', '0.00', '0.00', 0, '121800.00', '19488.00', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kp_qty_hist`
--

CREATE TABLE `kp_qty_hist` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `init_qty` int(11) NOT NULL,
  `new_qty` int(11) NOT NULL,
  `init_reorder` int(11) NOT NULL,
  `new_reorder` int(11) NOT NULL,
  `reason` varchar(150) NOT NULL,
  `store_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_qty_hist`
--

INSERT INTO `kp_qty_hist` (`item_id`, `user_id`, `init_qty`, `new_qty`, `init_reorder`, `new_reorder`, `reason`, `store_id`, `datime`) VALUES
(1, 2, 999, 5, 0, 0, ' testing', 0, '2021-04-22 23:15:32'),
(2, 2, 0, 0, 0, 5, ' tt', 0, '2021-04-22 23:15:48'),
(2, 2, 0, 5, 0, 0, ' tt', 0, '2021-04-22 23:15:57'),
(1, 2, 2, 2, 0, 0, ' tt', 0, '2021-04-25 11:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `kp_qt_id`
--

CREATE TABLE `kp_qt_id` (
  `qt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_qt_id`
--

INSERT INTO `kp_qt_id` (`qt_id`) VALUES
(26);

-- --------------------------------------------------------

--
-- Table structure for table `kp_qt_items`
--

CREATE TABLE `kp_qt_items` (
  `id` int(11) NOT NULL,
  `qt_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `shop` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_qt_items`
--

INSERT INTO `kp_qt_items` (`id`, `qt_id`, `item_id`, `qty`, `price`, `total`, `status`, `shop`, `datime`) VALUES
(1, 1, 1, 2, 300, 600, 1, 0, '0000-00-00 00:00:00'),
(2, 2, 1, 5, 10000, 50000, 1, 0, '0000-00-00 00:00:00'),
(3, 2, 3, 5, 2500, 12500, 1, 0, '0000-00-00 00:00:00'),
(4, 2, 5, 6, 20000, 120000, 1, 0, '0000-00-00 00:00:00'),
(5, 3, 1, 5, 100, 500, 1, 0, '0000-00-00 00:00:00'),
(6, 4, 1, 5, 455, 2275, 1, 0, '0000-00-00 00:00:00'),
(7, 4, 3, 3, 12, 36, 1, 0, '0000-00-00 00:00:00'),
(8, 6, 4, 5, 2000, 10000, 1, 0, '0000-00-00 00:00:00'),
(9, 7, 1, 5, 44000, 220000, 1, 0, '0000-00-00 00:00:00'),
(10, 7, 4, 3, 2500, 7500, 1, 0, '0000-00-00 00:00:00'),
(11, 7, 6, 5, 3000, 15000, 1, 0, '0000-00-00 00:00:00'),
(12, 8, 2, 10, 1800, 18000, 1, 0, '0000-00-00 00:00:00'),
(13, 8, 1, 5, 1500, 7500, 1, 0, '0000-00-00 00:00:00'),
(14, 8, 3, 3, 2500, 7500, 1, 0, '0000-00-00 00:00:00'),
(15, 10, 1395, 2, 1220, 2440, 1, 0, '0000-00-00 00:00:00'),
(16, 10, 2259, 5, 1010, 5050, 1, 0, '0000-00-00 00:00:00'),
(17, 10, 1607, 10, 1000, 10000, 1, 0, '0000-00-00 00:00:00'),
(18, 9, 2, 5, 455, 2275, 1, 0, '0000-00-00 00:00:00'),
(19, 9, 3, 54, 545, 29430, 1, 0, '0000-00-00 00:00:00'),
(20, 9, 5, 5, 543, 2715, 1, 0, '0000-00-00 00:00:00'),
(21, 11, 1, 5, 34, 170, 1, 0, '0000-00-00 00:00:00'),
(22, 11, 4, 3, 2736, 8208, 1, 0, '0000-00-00 00:00:00'),
(23, 12, 2, 5, 2736, 13680, 1, 0, '0000-00-00 00:00:00'),
(24, 12, 4, 6, 2736, 16416, 1, 0, '0000-00-00 00:00:00'),
(25, 13, 1, 5, 1710, 8550, 1, 0, '0000-00-00 00:00:00'),
(26, 13, 3, 5, 3990, 19950, 1, 0, '0000-00-00 00:00:00'),
(27, 13, 5, 3, 2736, 8208, 1, 0, '0000-00-00 00:00:00'),
(28, 13, 9, 12, 2736, 32832, 1, 0, '0000-00-00 00:00:00'),
(29, 14, 1, 5, 1710, 8550, 1, 0, '0000-00-00 00:00:00'),
(30, 15, 1, 5, 500, 2500, 1, 0, '0000-00-00 00:00:00'),
(31, 16, 4, 5, 2736, 13680, 1, 0, '0000-00-00 00:00:00'),
(32, 17, 2, 5, 344, 1720, 1, 0, '0000-00-00 00:00:00'),
(33, 17, 4, 3, 2333, 6999, 1, 0, '0000-00-00 00:00:00'),
(34, 18, 3, 5, 455, 2275, 1, 0, '0000-00-00 00:00:00'),
(35, 18, 6, 5, 2736, 13680, 1, 0, '0000-00-00 00:00:00'),
(36, 20, 3, 6, 3990, 23940, 1, 0, '0000-00-00 00:00:00'),
(37, 20, 5, 6, 2736, 16416, 1, 0, '0000-00-00 00:00:00'),
(38, 20, 11, 4, 2736, 10944, 1, 0, '0000-00-00 00:00:00'),
(39, 20, 14, 8, 14820, 118560, 1, 0, '0000-00-00 00:00:00'),
(40, 22, 4, 4, 2736, 10944, 1, 0, '0000-00-00 00:00:00'),
(41, 22, 19, 5, 912, 4560, 1, 0, '0000-00-00 00:00:00'),
(42, 22, 13, 6, 2736, 16416, 1, 0, '0000-00-00 00:00:00'),
(43, 22, 2, 3, 2736, 8208, 1, 0, '0000-00-00 00:00:00'),
(44, 22, 7, 5, 2736, 13680, 1, 0, '0000-00-00 00:00:00'),
(45, 22, 10, 3, 2736, 8208, 1, 0, '0000-00-00 00:00:00'),
(46, 23, 3, 5, 3990, 19950, 1, 0, '0000-00-00 00:00:00'),
(47, 23, 4, 4, 2736, 10944, 1, 0, '0000-00-00 00:00:00'),
(48, 23, 8, 5, 2736, 13680, 1, 0, '0000-00-00 00:00:00'),
(49, 24, 2, 5, 2736, 13680, 1, 2, '0000-00-00 00:00:00'),
(50, 24, 7, 2, 2736, 5472, 1, 2, '0000-00-00 00:00:00'),
(51, 25, 1, 5, 1500, 7500, 1, 2, '2021-08-26 16:09:35'),
(52, 25, 2, 220, 1800, 396000, 1, 2, '2021-08-26 16:09:52'),
(53, 26, 1, 20, 350, 7000, 1, 1, '2021-08-30 18:14:30'),
(54, 26, 2, 100, 750, 75000, 1, 1, '2021-08-30 18:14:44'),
(55, 26, 4, 14, 1200, 16800, 1, 1, '2021-08-30 18:15:06'),
(56, 26, 6, 10, 800, 8000, 1, 1, '2021-08-30 18:15:18'),
(57, 26, 7, 10, 1500, 15000, 1, 1, '2021-08-30 18:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `kp_qt_status`
--

CREATE TABLE `kp_qt_status` (
  `qt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_req`
--

CREATE TABLE `kp_req` (
  `req_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `req_user` int(11) NOT NULL,
  `req_date` date NOT NULL,
  `issue_status` int(11) NOT NULL DEFAULT '2',
  `issue_user` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `issue_datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rec_status` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL DEFAULT '2',
  `rec_date` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `req_status` int(11) NOT NULL DEFAULT '2',
  `s2s` int(11) NOT NULL DEFAULT '2',
  `req_type` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_req`
--

INSERT INTO `kp_req` (`req_id`, `store_id`, `sale_id`, `req_user`, `req_date`, `issue_status`, `issue_user`, `issue_date`, `issue_datime`, `rec_status`, `rec_user`, `rec_date`, `req_status`, `s2s`, `req_type`, `shop_id`) VALUES
(1, 0, 566, 2, '2021-04-13', 2, 0, '0000-00-00', '2021-04-13 13:04:44', 0, 2, '0000-00-00', 2, 2, 3, 0),
(2, 0, 568, 2, '2021-04-13', 2, 0, '0000-00-00', '2021-04-13 13:15:39', 0, 2, '0000-00-00', 2, 2, 3, 0),
(3, 0, 571, 2, '2021-04-13', 2, 0, '0000-00-00', '2021-04-13 13:29:14', 0, 2, '0000-00-00', 2, 2, 3, 0),
(4, 0, 574, 2, '2021-04-13', 2, 0, '0000-00-00', '2021-04-13 14:42:14', 0, 2, '0000-00-00', 2, 2, 3, 0),
(5, 0, 575, 2, '2021-04-22', 2, 0, '0000-00-00', '2021-04-22 22:58:47', 0, 2, '0000-00-00', 2, 2, 3, 0),
(6, 0, 579, 2, '2021-04-25', 2, 0, '0000-00-00', '2021-04-25 10:29:17', 0, 2, '0000-00-00', 2, 2, 3, 0),
(7, 0, 581, 2, '2021-04-25', 2, 0, '0000-00-00', '2021-04-25 13:19:10', 0, 2, '0000-00-00', 2, 2, 3, 0),
(8, 0, 582, 2, '2021-05-11', 2, 0, '0000-00-00', '2021-05-11 12:49:37', 0, 2, '0000-00-00', 2, 2, 3, 0),
(9, 0, 585, 2, '2021-05-22', 2, 0, '0000-00-00', '2021-05-22 14:16:11', 0, 2, '0000-00-00', 2, 2, 3, 0),
(10, 0, 587, 2, '2021-05-22', 2, 0, '0000-00-00', '2021-05-22 14:35:20', 0, 2, '0000-00-00', 2, 2, 3, 0),
(11, 0, 588, 2, '2021-06-07', 2, 0, '0000-00-00', '2021-06-07 11:54:12', 0, 2, '0000-00-00', 2, 2, 3, 0),
(12, 0, 589, 2, '2021-06-07', 2, 0, '0000-00-00', '2021-06-07 12:06:14', 0, 2, '0000-00-00', 2, 2, 3, 0),
(13, 0, 593, 2, '2021-06-11', 2, 0, '0000-00-00', '2021-06-11 08:46:32', 0, 2, '0000-00-00', 2, 2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kp_req_id`
--

CREATE TABLE `kp_req_id` (
  `req_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_req_id`
--

INSERT INTO `kp_req_id` (`req_id`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `kp_req_items`
--

CREATE TABLE `kp_req_items` (
  `req_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `req_qty` int(11) NOT NULL,
  `req_user` int(11) NOT NULL,
  `issue_qty` decimal(10,2) NOT NULL,
  `issue_user` int(11) NOT NULL,
  `issue_time` datetime NOT NULL,
  `issue_status` int(11) NOT NULL DEFAULT '2',
  `rec_qty` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `req_status` int(11) NOT NULL DEFAULT '2',
  `rec_status` int(11) NOT NULL DEFAULT '2',
  `s2s` int(11) NOT NULL DEFAULT '2',
  `req_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_req_items`
--

INSERT INTO `kp_req_items` (`req_id`, `sale_id`, `item_id`, `req_qty`, `req_user`, `issue_qty`, `issue_user`, `issue_time`, `issue_status`, `rec_qty`, `rec_user`, `req_status`, `rec_status`, `s2s`, `req_date`) VALUES
(1, NULL, 268, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(1, NULL, 246, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(2, NULL, 253, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(3, NULL, 165, 10, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 38, 3, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 62, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 68, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 178, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 75, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 121, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 134, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 201, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(4, NULL, 236, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(5, NULL, 5, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(6, NULL, 8, 5, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(7, NULL, 3, 9, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(8, NULL, 6, 2, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(9, NULL, 2, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(10, NULL, 2, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(11, NULL, 14, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(11, NULL, 8, 1, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(11, NULL, 27, 5, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(12, NULL, 14, 2, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(12, NULL, 27, 5, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(13, NULL, 8, 10, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00'),
(13, NULL, 1, 5, 2, '0.00', 0, '0000-00-00 00:00:00', 2, 0, 0, 2, 2, 2, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `kp_req_status`
--

CREATE TABLE `kp_req_status` (
  `req_id` int(11) NOT NULL,
  `req_user_id` int(11) NOT NULL,
  `req_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_ret`
--

CREATE TABLE `kp_ret` (
  `ret_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `ret_user` int(11) NOT NULL,
  `ret_date` date NOT NULL,
  `ret_amount` decimal(10,2) NOT NULL,
  `ret_datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `app_status` int(11) NOT NULL DEFAULT '2',
  `app_user` int(11) DEFAULT NULL,
  `app_decision` int(11) DEFAULT NULL,
  `app_comment` varchar(250) DEFAULT NULL,
  `store_status` int(11) NOT NULL DEFAULT '2',
  `accept_user` int(11) DEFAULT NULL,
  `accept_date` date DEFAULT NULL,
  `accept_comment` varchar(100) DEFAULT NULL,
  `cust_id` int(11) NOT NULL,
  `cf_bal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_ret`
--

INSERT INTO `kp_ret` (`ret_id`, `sale_id`, `ret_user`, `ret_date`, `ret_amount`, `ret_datime`, `app_status`, `app_user`, `app_decision`, `app_comment`, `store_status`, `accept_user`, `accept_date`, `accept_comment`, `cust_id`, `cf_bal`) VALUES
(1, 135, 2, '2021-04-23', '820.00', '2021-04-23 00:47:40', 2, 2, 1, 'test', 2, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kp_ret_id`
--

CREATE TABLE `kp_ret_id` (
  `ret_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_ret_id`
--

INSERT INTO `kp_ret_id` (`ret_id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `kp_ret_items`
--

CREATE TABLE `kp_ret_items` (
  `ret_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `ret_status` int(11) NOT NULL DEFAULT '2',
  `prod_status` int(11) DEFAULT NULL,
  `ret_user_comment` varchar(55) NOT NULL,
  `reason` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `app_by` int(11) NOT NULL,
  `app_date` date NOT NULL,
  `app_datime` datetime NOT NULL,
  `app_comments` varchar(155) NOT NULL,
  `app_decision` int(11) NOT NULL,
  `store_status` int(11) NOT NULL DEFAULT '2',
  `accept_comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_ret_items`
--

INSERT INTO `kp_ret_items` (`ret_id`, `sale_id`, `item_id`, `qty`, `price`, `total`, `ret_status`, `prod_status`, `ret_user_comment`, `reason`, `datime`, `app_by`, `app_date`, `app_datime`, `app_comments`, `app_decision`, `store_status`, `accept_comment`) VALUES
(1, 135, 144, '1.00', '820.00', '820.00', 1, 1, 'ttttt', 1, '2021-04-23 00:47:17', 2, '2021-04-23', '0000-00-00 00:00:00', 'test', 1, 2, ''),
(4, 601, 2, '1.00', '1889.00', '1889.00', 2, 1, 'fgthhghghgg', 1, '2021-07-01 12:31:21', 0, '0000-00-00', '0000-00-00 00:00:00', '', 0, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_ret_reprint`
--

CREATE TABLE `kp_ret_reprint` (
  `ret_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appr_by` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kp_ret_status`
--

CREATE TABLE `kp_ret_status` (
  `ret_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_ret_status`
--

INSERT INTO `kp_ret_status` (`ret_id`, `sale_id`, `user_id`, `cust_id`, `status`, `datime`) VALUES
(2, 66, 2, 1, 2, '2021-06-10 10:09:42'),
(3, 603, 2, 2, 2, '2021-07-01 12:29:58'),
(4, 601, 2, 2, 2, '2021-07-01 12:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `kp_roles`
--

CREATE TABLE `kp_roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(85) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL,
  `access_panel` int(11) NOT NULL,
  `access_dash` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `front_perm` varchar(155) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sys_default` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_roles`
--

INSERT INTO `kp_roles` (`role_id`, `name`, `description`, `creation_date`, `last_update`, `access_panel`, `access_dash`, `front_perm`, `sys_default`) VALUES
(1, 'SUPERADMIN', 'ALL RIGHTS', '2020-08-13 18:43:24', '0000-00-00 00:00:00', 3, 'admin_dash.php', '1, 2, 3, 4, 5, 6, 7', 2),
(2, 'SALES', 'FOR SALES PERSONS', '2020-08-13 18:43:24', '0000-00-00 00:00:00', 2, 'admin_dash.php', '', 2),
(3, 'SUPERVISOR', 'SUPERVISOR HANDLES BOTH BACKEND & SALES', '2020-08-13 18:43:24', '0000-00-00 00:00:00', 3, 'admin_dash.php', '1, 2, 3, 4, 5, 6, 7, 8', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_sales`
--

CREATE TABLE `kp_sales` (
  `sale_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_amount` decimal(10,2) NOT NULL,
  `disc` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `type` int(11) NOT NULL,
  `pay_status` int(11) NOT NULL DEFAULT '2',
  `day` date DEFAULT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery` int(11) DEFAULT NULL,
  `mktr` int(11) NOT NULL,
  `sale_bal` decimal(10,2) DEFAULT NULL,
  `cf_bal` decimal(10,2) DEFAULT NULL,
  `pay_day` date DEFAULT NULL,
  `refno` varchar(11) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sales`
--

INSERT INTO `kp_sales` (`sale_id`, `cust_id`, `user_id`, `sale_amount`, `disc`, `total_amount`, `type`, `pay_status`, `day`, `datime`, `delivery`, `mktr`, `sale_bal`, `cf_bal`, `pay_day`, `refno`, `tax_type`, `vatable`, `vat`, `shop`) VALUES
(1, 1, 1, '775.00', '0.00', '775.00', 1, 1, '2021-03-22', '2021-03-22 10:39:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(2, 1, 1, '4670.00', '0.00', '4670.00', 1, 1, '2021-03-28', '2021-03-28 06:43:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(3, 1, 2, '3550.00', '0.00', '3550.00', 1, 1, '2021-03-28', '2021-03-28 06:52:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(4, 1, 2, '7140.00', '0.00', '7140.00', 1, 1, '2021-03-28', '2021-03-28 06:55:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(5, 2, 2, '995.00', '0.00', '995.00', 1, 1, '2021-03-28', '2021-03-28 07:00:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(6, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-03-28', '2021-03-28 07:01:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(8, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '0000-00-00', '2021-03-28 08:21:06', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(10, 1, 2, '8700.00', '0.00', '8700.00', 1, 1, '2021-03-29', '2021-03-29 08:00:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(12, 1, 2, '490.00', '0.00', '490.00', 1, 1, '2021-03-29', '2021-03-29 11:59:52', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(13, 1, 2, '1080.00', '0.00', '1080.00', 1, 1, '2021-03-29', '2021-03-29 08:39:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(14, 1, 2, '1150.00', '0.00', '1150.00', 1, 1, '2021-03-29', '2021-03-29 08:41:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(16, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-03-29', '2021-03-29 08:45:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(18, 1, 1, '250.00', '0.00', '250.00', 1, 1, '2021-03-29', '2021-03-29 09:09:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(19, 1, 2, '130.00', '0.00', '130.00', 1, 1, '2021-03-29', '2021-03-29 09:11:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(20, 1, 2, '2150.00', '0.00', '2150.00', 1, 1, '2021-03-29', '2021-03-29 09:12:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(22, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-03-29', '2021-03-29 09:15:53', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(24, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-03-29', '2021-03-29 09:18:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(25, 1, 2, '720.00', '0.00', '720.00', 1, 1, '2021-03-29', '2021-03-29 09:27:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(26, 1, 2, '566.00', '0.00', '566.00', 1, 1, '2021-03-29', '2021-03-29 09:35:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(29, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-03-29', '2021-03-29 09:39:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(31, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-03-29', '2021-03-29 09:41:05', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(32, 1, 2, '670.00', '0.00', '670.00', 1, 1, '2021-03-29', '2021-03-29 09:53:04', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(36, 1, 2, '360.00', '0.00', '360.00', 1, 1, '2021-03-29', '2021-03-29 10:25:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(39, 1, 2, '195.00', '0.00', '195.00', 1, 1, '2021-03-29', '2021-03-29 11:07:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(41, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-03-29', '2021-03-29 11:45:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(45, 1, 2, '125.00', '0.00', '125.00', 1, 1, '2021-03-29', '2021-03-29 12:00:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(47, 1, 2, '2000.00', '0.00', '2000.00', 1, 1, '2021-03-29', '2021-03-29 12:38:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(50, 1, 2, '2375.00', '0.00', '2375.00', 1, 1, '2021-03-29', '2021-03-29 12:50:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(54, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-03-29', '2021-03-29 12:59:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(55, 1, 2, '1400.00', '0.00', '1400.00', 1, 1, '2021-03-29', '2021-03-29 13:05:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(57, 1, 2, '1540.00', '0.00', '1540.00', 1, 1, '2021-03-29', '2021-03-29 14:27:09', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(58, 1, 2, '250.00', '0.00', '250.00', 1, 1, '0000-00-00', '2021-03-29 14:32:30', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(59, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-03-29', '2021-03-29 14:33:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(61, 1, 2, '380.00', '0.00', '380.00', 1, 1, '2021-03-29', '2021-03-29 14:53:37', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(62, 1, 2, '3140.00', '0.00', '3140.00', 1, 1, '2021-03-29', '2021-03-29 15:01:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(63, 1, 2, '1770.00', '0.00', '1770.00', 1, 1, '2021-03-29', '2021-03-29 15:16:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(64, 1, 2, '3564.00', '0.00', '3564.00', 1, 1, '2021-03-29', '2021-03-29 15:35:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(65, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-03-29', '2021-03-29 15:37:14', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(66, 1, 2, '3550.00', '0.00', '3550.00', 1, 1, '0000-00-00', '2021-03-29 15:45:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(67, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-03-29', '2021-03-29 15:51:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(68, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-03-29', '2021-03-29 15:53:20', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(69, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-03-29', '2021-03-29 15:55:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(70, 1, 2, '135.00', '0.00', '135.00', 1, 1, '2021-03-29', '2021-03-29 16:02:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(71, 1, 2, '3570.00', '0.00', '3570.00', 1, 1, '2021-03-29', '2021-03-29 16:02:37', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(75, 1, 2, '1530.00', '0.00', '1530.00', 1, 1, '2021-03-30', '2021-03-30 08:46:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(76, 1, 2, '8820.00', '0.00', '8820.00', 1, 1, '0000-00-00', '2021-03-30 09:47:46', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(77, 1, 2, '1240.00', '0.00', '1240.00', 1, 1, '2021-03-30', '2021-03-30 10:09:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(78, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-03-30', '2021-03-30 10:10:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(79, 1, 2, '1405.00', '0.00', '1405.00', 1, 1, '2021-03-30', '2021-03-30 10:14:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(80, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-03-30', '2021-03-30 10:14:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(81, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-03-30', '2021-03-30 10:17:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(82, 2, 2, '2470.00', '0.00', '2470.00', 1, 1, '2021-03-30', '2021-03-30 11:24:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(83, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-03-30', '2021-03-30 11:32:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(84, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-03-30', '2021-03-30 11:46:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(85, 1, 2, '390.00', '0.00', '390.00', 1, 1, '2021-03-30', '2021-03-30 12:46:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(86, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-03-30', '2021-03-30 13:06:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(87, 1, 2, '75.00', '0.00', '75.00', 1, 1, '2021-03-30', '2021-03-30 13:36:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(88, 1, 2, '810.00', '0.00', '810.00', 1, 1, '2021-03-30', '2021-03-30 13:55:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(90, 1, 2, '245.00', '0.00', '245.00', 1, 1, '2021-03-30', '2021-03-30 14:09:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(91, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-03-30', '2021-03-30 14:16:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(92, 1, 2, '135.00', '0.00', '135.00', 1, 1, '2021-03-30', '2021-03-30 14:22:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(93, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-03-30', '2021-03-30 14:23:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(94, 1, 2, '60.00', '0.00', '60.00', 1, 1, '2021-03-30', '2021-03-30 14:50:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(97, 1, 2, '2380.00', '0.00', '2380.00', 1, 1, '2021-03-30', '2021-03-30 14:57:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(98, 1, 2, '205.00', '0.00', '205.00', 1, 1, '2021-03-30', '2021-03-30 15:10:00', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(99, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-03-30', '2021-03-30 15:11:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(100, 1, 2, '210.00', '0.00', '210.00', 1, 1, '2021-03-30', '2021-03-30 15:26:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(101, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-03-30', '2021-03-30 15:41:52', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(102, 1, 2, '320.00', '0.00', '320.00', 1, 1, '2021-03-30', '2021-03-30 15:50:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(103, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-03-31', '2021-03-31 05:04:18', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(106, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-03-31', '2021-03-31 05:19:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(107, 1, 2, '4750.00', '0.00', '4750.00', 1, 1, '2021-03-31', '2021-03-31 05:33:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(109, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-03-31', '2021-03-31 05:57:29', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(110, 1, 2, '50.00', '0.00', '50.00', 1, 1, '0000-00-00', '2021-03-31 07:31:38', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(111, 1, 2, '144.00', '0.00', '144.00', 1, 1, '0000-00-00', '2021-03-31 07:48:00', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(112, 1, 2, '810.00', '0.00', '810.00', 1, 1, '2021-03-31', '2021-03-31 07:51:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(113, 1, 2, '1480.00', '0.00', '1480.00', 1, 1, '2021-03-31', '2021-03-31 08:43:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(114, 1, 2, '580.00', '0.00', '580.00', 1, 1, '0000-00-00', '2021-03-31 12:07:25', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(115, 1, 2, '600.00', '0.00', '600.00', 1, 1, '0000-00-00', '2021-03-31 13:01:45', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(116, 1, 2, '400.00', '0.00', '400.00', 1, 1, '2021-03-31', '2021-03-31 13:06:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(118, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-03-31', '2021-03-31 14:21:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(120, 1, 2, '135.00', '0.00', '135.00', 1, 1, '2021-03-31', '2021-03-31 14:41:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(122, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-03-31', '2021-03-31 14:48:14', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(123, 1, 2, '600.00', '0.00', '600.00', 1, 1, '2021-03-31', '2021-03-31 15:06:38', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(124, 1, 2, '70.00', '0.00', '70.00', 1, 1, '2021-03-31', '2021-03-31 15:07:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(125, 1, 2, '144.00', '0.00', '144.00', 1, 1, '2021-03-31', '2021-03-31 15:08:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(126, 1, 2, '2060.00', '0.00', '2060.00', 1, 1, '2021-03-31', '2021-03-31 15:11:06', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(127, 1, 2, '5940.00', '0.00', '5940.00', 1, 1, '2021-03-31', '2021-03-31 15:13:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(128, 1, 2, '600.00', '0.00', '600.00', 1, 1, '2021-03-31', '2021-03-31 15:16:52', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(129, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-03-31', '2021-03-31 15:17:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(130, 1, 2, '175.00', '0.00', '175.00', 1, 1, '2021-03-31', '2021-03-31 15:28:14', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(131, 1, 2, '660.00', '0.00', '660.00', 1, 1, '2021-03-31', '2021-03-31 15:33:09', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(133, 1, 2, '580.00', '0.00', '580.00', 1, 1, '2021-03-31', '2021-03-31 15:47:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(134, 1, 2, '1800.00', '0.00', '1800.00', 1, 1, '2021-04-01', '2021-04-01 05:29:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(135, 1, 2, '820.00', '0.00', '820.00', 1, 1, '2021-04-01', '2021-04-01 06:17:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(137, 1, 2, '1870.00', '0.00', '1870.00', 1, 1, '2021-04-01', '2021-04-01 06:52:38', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(138, 1, 2, '3250.00', '0.00', '3250.00', 1, 1, '2021-04-01', '2021-04-01 06:58:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(139, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-01', '2021-04-01 07:03:49', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(141, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-01', '2021-04-01 08:28:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(142, 1, 2, '1080.00', '0.00', '1080.00', 1, 1, '2021-04-01', '2021-04-01 09:09:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(143, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-01', '2021-04-01 09:11:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(144, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-01', '2021-04-01 09:12:14', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(146, 1, 2, '1040.00', '0.00', '1040.00', 1, 1, '2021-04-01', '2021-04-01 09:37:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(147, 1, 2, '2360.00', '0.00', '2360.00', 1, 1, '2021-04-01', '2021-04-01 09:43:00', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(148, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-01', '2021-04-01 10:01:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(149, 1, 2, '1530.00', '0.00', '1530.00', 1, 1, '2021-04-01', '2021-04-01 10:50:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(151, 1, 2, '2380.00', '0.00', '2380.00', 1, 1, '2021-04-01', '2021-04-01 11:03:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(152, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-01', '2021-04-01 11:31:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(153, 1, 2, '690.00', '0.00', '690.00', 1, 1, '2021-04-01', '2021-04-01 12:09:19', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(154, 1, 2, '95.00', '0.00', '95.00', 1, 1, '2021-04-01', '2021-04-01 12:41:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(156, 1, 2, '20024.00', '0.00', '20024.00', 1, 1, '2021-04-01', '2021-04-01 14:23:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(157, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-01', '2021-04-01 13:51:29', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(158, 1, 2, '720.00', '0.00', '720.00', 1, 1, '2021-04-01', '2021-04-01 14:06:20', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(159, 1, 2, '3070.00', '0.00', '3070.00', 1, 1, '2021-04-01', '2021-04-01 14:34:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(160, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-01', '2021-04-01 14:59:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(161, 1, 2, '520.00', '0.00', '520.00', 1, 1, '2021-04-01', '2021-04-01 15:08:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(163, 1, 2, '1440.00', '0.00', '1440.00', 1, 1, '2021-04-01', '2021-04-01 15:11:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(164, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-04-01', '2021-04-01 15:12:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(165, 1, 2, '360.00', '0.00', '360.00', 1, 1, '2021-04-01', '2021-04-01 15:19:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(166, 1, 2, '165.00', '0.00', '165.00', 1, 1, '2021-04-01', '2021-04-01 15:26:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(167, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-01', '2021-04-01 15:27:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(168, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-01', '2021-04-01 16:14:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(169, 1, 2, '135.00', '0.00', '135.00', 1, 1, '2021-04-01', '2021-04-01 16:14:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(170, 1, 2, '265.00', '0.00', '265.00', 1, 1, '2021-04-01', '2021-04-01 16:17:04', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(171, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-02', '2021-04-02 05:20:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(172, 1, 2, '235.00', '0.00', '235.00', 1, 1, '2021-04-02', '2021-04-02 05:23:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(173, 1, 2, '3350.00', '0.00', '3350.00', 1, 1, '2021-04-02', '2021-04-02 05:27:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(174, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-02', '2021-04-02 05:31:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(175, 1, 2, '14370.00', '0.00', '14370.00', 1, 1, '2021-04-02', '2021-04-02 06:52:46', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(177, 1, 2, '630.00', '0.00', '630.00', 1, 1, '2021-04-02', '2021-04-02 09:52:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(178, 1, 2, '370.00', '0.00', '370.00', 1, 1, '2021-04-02', '2021-04-02 09:56:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(179, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-02', '2021-04-02 09:58:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(180, 1, 2, '380.00', '0.00', '380.00', 1, 1, '2021-04-02', '2021-04-02 10:02:31', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(181, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-02', '2021-04-02 10:05:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(182, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-02', '2021-04-02 10:13:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(184, 1, 2, '5800.00', '0.00', '5800.00', 1, 1, '2021-04-02', '2021-04-02 10:53:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(186, 1, 2, '160.00', '0.00', '160.00', 1, 1, '2021-04-02', '2021-04-02 11:06:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(187, 1, 2, '1690.00', '0.00', '1690.00', 1, 1, '2021-04-02', '2021-04-02 11:19:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(188, 1, 2, '440.00', '0.00', '440.00', 1, 1, '2021-04-02', '2021-04-02 11:20:48', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(189, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-02', '2021-04-02 11:22:04', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(190, 1, 2, '142.00', '0.00', '142.00', 1, 1, '2021-04-02', '2021-04-02 11:24:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(191, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-02', '2021-04-02 11:26:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(192, 1, 2, '7955.00', '0.00', '7955.00', 1, 1, '2021-04-02', '2021-04-02 12:05:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(193, 1, 2, '1020.00', '0.00', '1020.00', 1, 1, '2021-04-02', '2021-04-02 11:48:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(194, 1, 2, '1070.00', '0.00', '1070.00', 1, 1, '2021-04-02', '2021-04-02 11:54:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(196, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-02', '2021-04-02 12:10:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(197, 1, 2, '980.00', '0.00', '980.00', 1, 1, '2021-04-02', '2021-04-02 12:17:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(198, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-02', '2021-04-02 12:33:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(199, 1, 2, '160.00', '0.00', '160.00', 1, 1, '2021-04-02', '2021-04-02 12:43:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(200, 1, 2, '770.00', '0.00', '770.00', 1, 1, '2021-04-02', '2021-04-02 12:50:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(203, 1, 2, '1780.00', '0.00', '1780.00', 1, 1, '2021-04-02', '2021-04-02 12:57:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(204, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-02', '2021-04-02 12:58:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(205, 1, 2, '3398.00', '0.00', '3398.00', 1, 1, '2021-04-02', '2021-04-02 13:20:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(207, 1, 2, '725.00', '0.00', '725.00', 1, 1, '2021-04-02', '2021-04-02 13:28:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(209, 1, 2, '75.00', '0.00', '75.00', 1, 1, '2021-04-02', '2021-04-02 13:46:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(210, 1, 2, '1040.00', '0.00', '1040.00', 1, 1, '2021-04-02', '2021-04-02 13:49:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(211, 1, 2, '80.00', '0.00', '80.00', 1, 1, '2021-04-02', '2021-04-02 14:28:19', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(212, 1, 2, '185.00', '0.00', '185.00', 1, 1, '2021-04-02', '2021-04-02 14:57:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(213, 1, 2, '508.00', '0.00', '508.00', 1, 1, '2021-04-02', '2021-04-02 15:01:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(214, 1, 2, '130.00', '0.00', '130.00', 1, 1, '2021-04-02', '2021-04-02 15:04:29', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(215, 1, 2, '7370.00', '0.00', '7370.00', 1, 1, '2021-04-02', '2021-04-02 15:15:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(216, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-02', '2021-04-02 15:40:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(217, 1, 2, '3030.00', '0.00', '3030.00', 1, 1, '2021-04-02', '2021-04-02 15:57:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(218, 1, 2, '3580.00', '0.00', '3580.00', 1, 1, '2021-04-02', '2021-04-02 16:08:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(219, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-03', '2021-04-03 05:25:12', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(222, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-03', '2021-04-03 05:30:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(223, 1, 2, '400.00', '0.00', '400.00', 1, 1, '2021-04-03', '2021-04-03 06:02:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(224, 1, 2, '515.00', '0.00', '515.00', 1, 1, '2021-04-03', '2021-04-03 06:07:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(225, 1, 2, '540.00', '0.00', '540.00', 1, 1, '2021-04-03', '2021-04-03 06:12:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(226, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-03', '2021-04-03 06:18:04', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(227, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-04-03', '2021-04-03 06:59:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(228, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-03', '2021-04-03 07:12:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(231, 1, 2, '4750.00', '0.00', '4750.00', 1, 1, '2021-04-03', '2021-04-03 07:58:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(232, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-03', '2021-04-03 08:36:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(233, 1, 2, '105.00', '0.00', '105.00', 1, 1, '2021-04-03', '2021-04-03 08:37:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(234, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-03', '2021-04-03 08:38:38', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(236, 1, 2, '5155.00', '0.00', '5155.00', 1, 1, '2021-04-03', '2021-04-03 09:42:46', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(237, 1, 2, '2095.00', '0.00', '2095.00', 1, 1, '2021-04-03', '2021-04-03 09:40:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(238, 1, 2, '390.00', '0.00', '390.00', 1, 1, '2021-04-03', '2021-04-03 09:41:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(239, 1, 2, '9425.00', '0.00', '9425.00', 1, 1, '2021-04-03', '2021-04-03 10:05:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(240, 1, 2, '335.00', '0.00', '335.00', 1, 1, '2021-04-03', '2021-04-03 12:25:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(241, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-03', '2021-04-03 12:30:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(242, 1, 2, '510.00', '0.00', '510.00', 1, 1, '2021-04-03', '2021-04-03 12:49:20', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(243, 1, 2, '735.00', '0.00', '735.00', 1, 1, '2021-04-03', '2021-04-03 12:56:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(245, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-03', '2021-04-03 12:59:19', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(246, 1, 2, '210.00', '0.00', '210.00', 1, 1, '2021-04-03', '2021-04-03 13:01:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(247, 1, 2, '3150.00', '0.00', '3150.00', 1, 1, '2021-04-03', '2021-04-03 13:26:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(249, 1, 2, '2450.00', '0.00', '2450.00', 1, 1, '2021-04-03', '2021-04-03 13:29:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(250, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-03', '2021-04-03 13:37:05', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(251, 1, 2, '1595.00', '0.00', '1595.00', 1, 1, '2021-04-03', '2021-04-03 13:44:02', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(252, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '2021-04-03', '2021-04-03 13:44:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(253, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-03', '2021-04-03 13:50:38', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(254, 1, 2, '290.00', '0.00', '290.00', 1, 1, '2021-04-03', '2021-04-03 13:56:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(255, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-03', '2021-04-03 13:53:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(256, 1, 2, '305.00', '0.00', '305.00', 1, 1, '2021-04-03', '2021-04-03 14:03:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(257, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '2021-04-03', '2021-04-03 14:08:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(258, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-03', '2021-04-03 14:09:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(259, 1, 2, '270.00', '0.00', '270.00', 1, 1, '2021-04-03', '2021-04-03 14:21:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(260, 1, 2, '1720.00', '0.00', '1720.00', 1, 1, '2021-04-03', '2021-04-03 15:15:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(261, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-03', '2021-04-03 15:16:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(263, 1, 2, '350.00', '0.00', '350.00', 1, 1, '2021-04-03', '2021-04-03 15:18:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(264, 1, 2, '410.00', '0.00', '410.00', 1, 1, '2021-04-03', '2021-04-03 15:19:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(265, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-03', '2021-04-03 15:28:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(266, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-03', '2021-04-03 15:43:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(267, 1, 2, '1400.00', '0.00', '1400.00', 1, 1, '2021-04-03', '2021-04-03 15:49:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(268, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '2021-04-05', '2021-04-05 06:05:05', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(269, 1, 2, '25.00', '0.00', '25.00', 1, 1, '2021-04-05', '2021-04-05 06:06:49', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(270, 1, 2, '1820.00', '0.00', '1820.00', 1, 1, '2021-04-05', '2021-04-05 07:44:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(271, 1, 2, '1780.00', '0.00', '1780.00', 1, 1, '2021-04-05', '2021-04-05 07:59:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(272, 1, 2, '560.00', '0.00', '560.00', 1, 1, '2021-04-05', '2021-04-05 08:09:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(273, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-05', '2021-04-05 08:11:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(275, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-05', '2021-04-05 08:55:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(276, 1, 2, '390.00', '0.00', '390.00', 1, 1, '2021-04-05', '2021-04-05 09:10:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(277, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-05', '2021-04-05 09:22:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(278, 1, 2, '18940.00', '0.00', '18940.00', 1, 1, '2021-04-05', '2021-04-05 10:05:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(279, 1, 2, '560.00', '0.00', '560.00', 1, 1, '2021-04-05', '2021-04-05 10:19:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(280, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-05', '2021-04-05 10:42:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(282, 1, 2, '295.00', '0.00', '295.00', 1, 1, '2021-04-05', '2021-04-05 11:17:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(283, 1, 2, '550.00', '0.00', '550.00', 1, 1, '2021-04-05', '2021-04-05 11:34:20', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(284, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-05', '2021-04-05 12:05:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(285, 1, 2, '1080.00', '0.00', '1080.00', 1, 1, '2021-04-05', '2021-04-05 12:12:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(286, 1, 2, '745.00', '0.00', '745.00', 1, 1, '2021-04-05', '2021-04-05 12:14:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(287, 1, 2, '3050.00', '0.00', '3050.00', 1, 1, '2021-04-05', '2021-04-05 12:18:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(288, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-05', '2021-04-05 12:29:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(290, 1, 2, '540.00', '0.00', '540.00', 1, 1, '2021-04-05', '2021-04-05 12:32:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(291, 1, 2, '1480.00', '0.00', '1480.00', 1, 1, '2021-04-05', '2021-04-05 12:34:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(292, 1, 2, '1480.00', '0.00', '1480.00', 1, 1, '2021-04-05', '2021-04-05 12:35:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(293, 1, 2, '300.00', '0.00', '300.00', 1, 1, '2021-04-05', '2021-04-05 12:44:48', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(294, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-04-05', '2021-04-05 12:46:31', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(295, 1, 2, '445.00', '0.00', '445.00', 1, 1, '2021-04-05', '2021-04-05 12:49:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(296, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-04-05', '2021-04-05 13:07:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(297, 1, 2, '155.00', '0.00', '155.00', 1, 1, '2021-04-05', '2021-04-05 13:13:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(298, 1, 2, '1050.00', '0.00', '1050.00', 1, 1, '2021-04-05', '2021-04-05 13:23:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(299, 1, 2, '735.00', '0.00', '735.00', 1, 1, '2021-04-05', '2021-04-05 13:42:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(300, 1, 2, '210.00', '0.00', '210.00', 1, 1, '2021-04-05', '2021-04-05 15:07:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(301, 1, 2, '1270.00', '0.00', '1270.00', 1, 1, '2021-04-05', '2021-04-05 15:09:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(302, 1, 2, '2075.00', '0.00', '2075.00', 1, 1, '2021-04-05', '2021-04-05 15:17:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(304, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-05', '2021-04-05 15:18:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(305, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-05', '2021-04-05 15:19:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(306, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-05', '2021-04-05 15:25:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(307, 1, 2, '1490.00', '0.00', '1490.00', 1, 1, '2021-04-05', '2021-04-05 15:36:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(308, 1, 2, '230.00', '0.00', '230.00', 1, 1, '2021-04-05', '2021-04-05 15:40:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(310, 1, 2, '2150.00', '0.00', '2150.00', 1, 1, '2021-04-05', '2021-04-05 15:45:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(311, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-05', '2021-04-05 15:48:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(312, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-05', '2021-04-05 15:53:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(313, 1, 2, '2390.00', '0.00', '2390.00', 1, 1, '2021-04-06', '2021-04-06 05:25:09', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(314, 1, 2, '1450.00', '0.00', '1450.00', 1, 1, '2021-04-06', '2021-04-06 05:29:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(315, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-04-06', '2021-04-06 05:48:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(316, 1, 2, '25.00', '0.00', '25.00', 1, 1, '2021-04-06', '2021-04-06 05:52:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(317, 1, 2, '1764.00', '0.00', '1764.00', 1, 1, '2021-04-06', '2021-04-06 06:35:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(318, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-06', '2021-04-06 06:46:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(319, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-06', '2021-04-06 08:37:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(320, 1, 2, '1490.00', '0.00', '1490.00', 1, 1, '2021-04-06', '2021-04-06 10:28:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(321, 1, 2, '37788.00', '0.00', '37788.00', 1, 1, '2021-04-06', '2021-04-06 12:19:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(323, 1, 2, '350.00', '0.00', '350.00', 1, 1, '2021-04-06', '2021-04-06 13:03:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(324, 1, 2, '2450.00', '0.00', '2450.00', 1, 1, '2021-04-06', '2021-04-06 13:28:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(326, 1, 2, '1150.00', '0.00', '1150.00', 1, 1, '2021-04-06', '2021-04-06 14:10:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(327, 1, 2, '1230.00', '0.00', '1230.00', 1, 1, '2021-04-06', '2021-04-06 14:21:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(328, 1, 2, '2390.00', '0.00', '2390.00', 1, 1, '2021-04-06', '2021-04-06 14:28:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(329, 1, 2, '3750.00', '0.00', '3750.00', 1, 1, '2021-04-06', '2021-04-06 14:51:38', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(331, 1, 2, '3552.00', '0.00', '3552.00', 1, 1, '2021-04-06', '2021-04-06 14:51:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(332, 1, 2, '490.00', '0.00', '490.00', 1, 1, '2021-04-06', '2021-04-06 14:52:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(333, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-06', '2021-04-06 14:54:09', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(334, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-06', '2021-04-06 15:00:49', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(335, 1, 2, '205.00', '0.00', '205.00', 1, 1, '2021-04-06', '2021-04-06 15:11:52', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(336, 1, 2, '2470.00', '0.00', '2470.00', 1, 1, '2021-04-06', '2021-04-06 15:13:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(337, 1, 2, '550.00', '0.00', '550.00', 1, 1, '2021-04-06', '2021-04-06 15:22:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(338, 1, 2, '9340.00', '0.00', '9340.00', 1, 1, '2021-04-06', '2021-04-06 15:27:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(339, 1, 2, '9500.00', '0.00', '9500.00', 1, 1, '2021-04-06', '2021-04-06 15:29:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(342, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-06', '2021-04-06 15:39:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(343, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-06', '2021-04-06 15:49:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(344, 1, 2, '4840.00', '0.00', '4840.00', 1, 1, '2021-04-07', '2021-04-07 04:58:53', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(346, 1, 2, '1090.00', '0.00', '1090.00', 1, 1, '2021-04-07', '2021-04-07 06:01:00', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(347, 1, 2, '350.00', '0.00', '350.00', 1, 1, '2021-04-07', '2021-04-07 06:03:23', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(348, 1, 2, '400.00', '0.00', '400.00', 1, 1, '2021-04-07', '2021-04-07 06:34:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(349, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-07', '2021-04-07 06:58:12', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(350, 1, 2, '410.00', '0.00', '410.00', 1, 1, '2021-04-07', '2021-04-07 06:44:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(351, 1, 2, '1550.00', '0.00', '1550.00', 1, 1, '2021-04-07', '2021-04-07 06:59:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(355, 1, 2, '650.00', '0.00', '650.00', 1, 1, '2021-04-07', '2021-04-07 10:08:31', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(356, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-07', '2021-04-07 10:10:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(357, 1, 2, '1100.00', '0.00', '1100.00', 1, 1, '2021-04-07', '2021-04-07 11:40:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(358, 1, 2, '820.00', '0.00', '820.00', 1, 1, '2021-04-07', '2021-04-07 12:28:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(360, 1, 2, '450.00', '0.00', '450.00', 1, 1, '2021-04-07', '2021-04-07 12:38:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(361, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-07', '2021-04-07 13:01:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(362, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-07', '2021-04-07 13:13:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(363, 1, 2, '785.00', '0.00', '785.00', 1, 1, '2021-04-07', '2021-04-07 13:54:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(364, 1, 2, '1075.00', '0.00', '1075.00', 1, 1, '2021-04-07', '2021-04-07 14:07:36', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(365, 1, 2, '75.00', '0.00', '75.00', 1, 1, '2021-04-07', '2021-04-07 14:12:14', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(366, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-07', '2021-04-07 14:37:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(367, 1, 2, '25.00', '0.00', '25.00', 1, 1, '2021-04-07', '2021-04-07 14:38:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(368, 1, 2, '140.00', '0.00', '140.00', 1, 1, '2021-04-07', '2021-04-07 14:43:44', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(369, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-07', '2021-04-07 14:54:53', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(370, 1, 2, '19000.00', '0.00', '19000.00', 1, 1, '2021-04-07', '2021-04-07 15:15:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(371, 1, 2, '2470.00', '0.00', '2470.00', 1, 1, '2021-04-07', '2021-04-07 15:19:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(372, 1, 2, '1190.00', '0.00', '1190.00', 1, 1, '2021-04-07', '2021-04-07 15:22:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(373, 1, 2, '440.00', '0.00', '440.00', 1, 1, '2021-04-07', '2021-04-07 15:23:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(374, 1, 2, '1250.00', '0.00', '1250.00', 1, 1, '2021-04-07', '2021-04-07 15:27:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(375, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-07', '2021-04-07 15:35:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(376, 1, 2, '260.00', '0.00', '260.00', 1, 1, '2021-04-08', '2021-04-08 05:14:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(377, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-08', '2021-04-08 05:38:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(378, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-08', '2021-04-08 05:41:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(379, 1, 2, '4000.00', '0.00', '4000.00', 1, 1, '2021-04-08', '2021-04-08 09:46:41', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(380, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-08', '2021-04-08 10:18:25', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(381, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-08', '2021-04-08 10:20:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(385, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-08', '2021-04-08 11:27:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(386, 1, 2, '550.00', '0.00', '550.00', 1, 1, '2021-04-08', '2021-04-08 12:10:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(387, 1, 2, '1430.00', '0.00', '1430.00', 1, 1, '2021-04-08', '2021-04-08 12:17:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(388, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-08', '2021-04-08 12:35:12', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(389, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-08', '2021-04-08 12:35:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(390, 1, 2, '130.00', '0.00', '130.00', 1, 1, '2021-04-08', '2021-04-08 12:48:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(391, 1, 2, '365.00', '0.00', '365.00', 1, 1, '2021-04-08', '2021-04-08 12:55:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(392, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-08', '2021-04-08 12:59:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(393, 1, 2, '500.00', '0.00', '500.00', 1, 1, '2021-04-08', '2021-04-08 13:36:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(394, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-08', '2021-04-08 14:27:40', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(395, 1, 2, '370.00', '0.00', '370.00', 1, 1, '2021-04-08', '2021-04-08 14:37:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(396, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-08', '2021-04-08 14:39:04', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(397, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-08', '2021-04-08 14:45:52', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(398, 1, 2, '550.00', '0.00', '550.00', 1, 1, '2021-04-08', '2021-04-08 14:46:37', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(399, 1, 2, '590.00', '0.00', '590.00', 1, 1, '2021-04-08', '2021-04-08 14:49:36', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(400, 1, 2, '220.00', '0.00', '220.00', 1, 1, '2021-04-08', '2021-04-08 14:51:13', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(401, 1, 2, '220.00', '0.00', '220.00', 1, 1, '2021-04-08', '2021-04-08 14:52:03', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(402, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-08', '2021-04-08 14:53:19', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(403, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-08', '2021-04-08 14:54:40', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(404, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-08', '2021-04-08 15:00:22', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(405, 1, 2, '220.00', '0.00', '220.00', 1, 1, '2021-04-08', '2021-04-08 15:06:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(406, 1, 2, '205.00', '0.00', '205.00', 1, 1, '2021-04-08', '2021-04-08 15:06:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(407, 1, 2, '70.00', '0.00', '70.00', 1, 1, '2021-04-08', '2021-04-08 15:20:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(408, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-08', '2021-04-08 15:21:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(410, 1, 2, '1150.00', '0.00', '1150.00', 1, 1, '2021-04-08', '2021-04-08 15:25:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(411, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-08', '2021-04-08 15:26:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(412, 1, 2, '240.00', '0.00', '240.00', 1, 1, '2021-04-08', '2021-04-08 15:27:52', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(414, 1, 2, '150.00', '0.00', '150.00', 1, 1, '2021-04-08', '2021-04-08 15:31:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(415, 1, 2, '150.00', '0.00', '150.00', 1, 1, '2021-04-08', '2021-04-08 15:30:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(416, 1, 2, '525.00', '0.00', '525.00', 1, 1, '2021-04-08', '2021-04-08 15:46:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(417, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-08', '2021-04-08 15:51:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(418, 1, 2, '520.00', '0.00', '520.00', 1, 1, '2021-04-09', '2021-04-09 05:00:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(419, 1, 2, '30.00', '0.00', '30.00', 1, 1, '2021-04-09', '2021-04-09 05:10:53', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(421, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-09', '2021-04-09 05:26:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(423, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-09', '2021-04-09 06:20:05', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(424, 1, 2, '420.00', '0.00', '420.00', 1, 1, '2021-04-09', '2021-04-09 06:40:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(425, 1, 2, '1175.00', '0.00', '1175.00', 1, 1, '2021-04-09', '2021-04-09 06:52:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(427, 1, 2, '220.00', '0.00', '220.00', 1, 1, '2021-04-09', '2021-04-09 08:08:21', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(429, 1, 2, '1100.00', '0.00', '1100.00', 1, 1, '2021-04-09', '2021-04-09 08:34:55', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(431, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-09', '2021-04-09 08:42:50', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(432, 1, 2, '300.00', '0.00', '300.00', 1, 1, '2021-04-09', '2021-04-09 09:07:48', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(434, 1, 2, '380.00', '0.00', '380.00', 1, 1, '2021-04-09', '2021-04-09 09:51:42', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(435, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-09', '2021-04-09 10:58:50', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(438, 1, 2, '25.00', '0.00', '25.00', 1, 1, '2021-04-09', '2021-04-09 13:25:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(439, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-09', '2021-04-09 13:44:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(440, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-09', '2021-04-09 13:51:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(441, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-09', '2021-04-09 13:59:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(442, 1, 2, '1530.00', '0.00', '1530.00', 1, 1, '2021-04-09', '2021-04-09 14:02:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(443, 1, 2, '105.00', '0.00', '105.00', 1, 1, '2021-04-09', '2021-04-09 14:20:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(444, 1, 2, '1470.00', '0.00', '1470.00', 1, 1, '2021-04-09', '2021-04-09 14:26:08', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(445, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-09', '2021-04-09 14:27:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(446, 1, 2, '430.00', '0.00', '430.00', 1, 1, '2021-04-09', '2021-04-09 14:31:43', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(447, 1, 2, '1087.50', '0.00', '1087.50', 1, 1, '2021-04-09', '2021-04-09 14:50:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(449, 1, 2, '1200.00', '0.00', '1200.00', 1, 1, '2021-04-09', '2021-04-09 15:49:18', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(450, 1, 2, '3620.00', '0.00', '3620.00', 1, 1, '2021-04-09', '2021-04-09 14:59:41', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(451, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-09', '2021-04-09 15:15:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(452, 1, 2, '60.00', '0.00', '60.00', 1, 1, '2021-04-09', '2021-04-09 15:35:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(453, 1, 2, '205.00', '0.00', '205.00', 1, 1, '2021-04-09', '2021-04-09 15:45:04', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(455, 1, 2, '230.00', '0.00', '230.00', 1, 1, '2021-04-09', '2021-04-09 15:49:46', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(456, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-10', '2021-04-10 05:15:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(458, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-10', '2021-04-10 06:02:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(459, 1, 2, '1520.00', '0.00', '1520.00', 1, 1, '2021-04-10', '2021-04-10 06:30:09', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(461, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-10', '2021-04-10 06:45:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0);
INSERT INTO `kp_sales` (`sale_id`, `cust_id`, `user_id`, `sale_amount`, `disc`, `total_amount`, `type`, `pay_status`, `day`, `datime`, `delivery`, `mktr`, `sale_bal`, `cf_bal`, `pay_day`, `refno`, `tax_type`, `vatable`, `vat`, `shop`) VALUES
(462, 1, 2, '750.00', '0.00', '750.00', 1, 1, '2021-04-10', '2021-04-10 07:14:20', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(463, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-10', '2021-04-10 07:18:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(465, 1, 2, '115.00', '0.00', '115.00', 1, 1, '2021-04-10', '2021-04-10 13:29:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(466, 1, 2, '570.00', '0.00', '570.00', 1, 1, '2021-04-10', '2021-04-10 13:44:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(468, 1, 2, '825.00', '0.00', '825.00', 1, 1, '2021-04-10', '2021-04-10 14:04:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(469, 1, 2, '2750.00', '0.00', '2750.00', 1, 1, '2021-04-10', '2021-04-10 14:09:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(470, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-10', '2021-04-10 14:11:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(471, 1, 2, '150.00', '0.00', '150.00', 1, 1, '2021-04-10', '2021-04-10 14:12:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(472, 1, 2, '135.00', '0.00', '135.00', 1, 1, '2021-04-10', '2021-04-10 14:24:02', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(473, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-10', '2021-04-10 14:25:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(474, 1, 2, '300.00', '0.00', '300.00', 1, 1, '2021-04-10', '2021-04-10 14:47:45', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(475, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-10', '2021-04-10 14:53:54', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(476, 1, 2, '4750.00', '0.00', '4750.00', 1, 1, '2021-04-10', '2021-04-10 14:58:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(477, 1, 2, '450.00', '0.00', '450.00', 1, 1, '2021-04-10', '2021-04-10 15:08:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(478, 1, 2, '130.00', '0.00', '130.00', 1, 1, '2021-04-10', '2021-04-10 15:14:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(479, 1, 2, '150.00', '0.00', '150.00', 1, 1, '2021-04-10', '2021-04-10 15:16:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(480, 1, 2, '2560.00', '0.00', '2560.00', 1, 1, '2021-04-10', '2021-04-10 15:31:47', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(481, 1, 2, '200.00', '0.00', '200.00', 1, 1, '2021-04-10', '2021-04-10 15:32:19', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(482, 1, 2, '300.00', '0.00', '300.00', 1, 1, '2021-04-10', '2021-04-10 15:33:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(483, 1, 2, '50.00', '0.00', '50.00', 1, 1, '2021-04-10', '2021-04-10 15:56:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(484, 1, 2, '390.00', '0.00', '390.00', 1, 1, '2021-04-10', '2021-04-10 15:58:57', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(485, 1, 2, '530.00', '0.00', '530.00', 1, 1, '2021-04-10', '2021-04-10 16:02:32', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(486, 1, 2, '120.00', '0.00', '120.00', 1, 1, '2021-04-10', '2021-04-10 16:12:56', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(487, 1, 2, '320.00', '0.00', '320.00', 1, 1, '2021-04-10', '2021-04-10 16:16:18', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(488, 1, 2, '900.00', '0.00', '900.00', 1, 1, '2021-04-11', '2021-04-11 09:02:15', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(489, 1, 2, '540.00', '0.00', '540.00', 1, 1, '2021-04-11', '2021-04-11 09:15:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(490, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-11', '2021-04-11 09:43:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(491, 1, 2, '3330.00', '0.00', '3330.00', 1, 1, '2021-04-11', '2021-04-11 10:17:50', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(492, 1, 2, '10536.40', '0.00', '10536.40', 1, 1, '2021-04-11', '2021-04-11 12:16:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(493, 1, 2, '325.00', '0.00', '325.00', 1, 1, '2021-04-11', '2021-04-11 10:33:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(495, 1, 2, '2085.00', '0.00', '2085.00', 1, 1, '2021-04-11', '2021-04-11 11:51:16', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(496, 1, 2, '18500.00', '0.00', '18500.00', 1, 1, '2021-04-11', '2021-04-11 12:05:49', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(497, 1, 2, '8100.00', '0.00', '8100.00', 1, 1, '2021-04-11', '2021-04-11 12:08:30', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(498, 1, 2, '430.00', '0.00', '430.00', 1, 1, '2021-04-11', '2021-04-11 12:44:26', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(499, 1, 2, '590.00', '0.00', '590.00', 1, 1, '2021-04-11', '2021-04-11 13:00:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(502, 1, 2, '3500.00', '0.00', '3500.00', 1, 1, '2021-04-11', '2021-04-11 13:16:28', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(503, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-11', '2021-04-11 13:21:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(504, 1, 2, '640.00', '0.00', '640.00', 1, 1, '2021-04-11', '2021-04-11 13:29:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(505, 1, 2, '1050.00', '0.00', '1050.00', 1, 1, '2021-04-11', '2021-04-11 13:36:33', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(506, 1, 2, '480.00', '0.00', '480.00', 1, 1, '2021-04-11', '2021-04-11 13:39:08', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(507, 1, 2, '360.00', '0.00', '360.00', 1, 1, '2021-04-11', '2021-04-11 13:41:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(508, 1, 2, '195.00', '0.00', '195.00', 1, 1, '2021-04-11', '2021-04-11 14:04:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(509, 1, 2, '4605.00', '0.00', '4605.00', 1, 1, '2021-04-11', '2021-04-11 14:08:59', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(510, 1, 2, '480.00', '0.00', '480.00', 1, 1, '2021-04-12', '2021-04-12 05:17:12', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(511, 1, 2, '130.00', '0.00', '130.00', 1, 1, '2021-04-12', '2021-04-12 05:40:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(514, 1, 2, '850.00', '0.00', '850.00', 1, 1, '2021-04-12', '2021-04-12 06:34:06', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(515, 1, 2, '125.00', '0.00', '125.00', 1, 1, '2021-04-12', '2021-04-12 06:36:37', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(516, 1, 2, '225.00', '0.00', '225.00', 1, 1, '2021-04-12', '2021-04-12 06:46:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(517, 1, 2, '450.00', '0.00', '450.00', 1, 1, '2021-04-12', '2021-04-12 06:47:34', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(518, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-12', '2021-04-12 07:04:07', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(520, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-12', '2021-04-12 07:47:23', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(521, 1, 2, '2140.00', '0.00', '2140.00', 1, 1, '2021-04-12', '2021-04-12 09:06:01', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(523, 1, 2, '850.00', '0.00', '850.00', 1, 1, '2021-04-12', '2021-04-12 09:07:21', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(527, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-12', '2021-04-12 09:42:53', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(528, 1, 2, '190.00', '0.00', '190.00', 1, 1, '2021-04-12', '2021-04-12 09:52:55', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(529, 1, 2, '580.00', '0.00', '580.00', 1, 1, '2021-04-12', '2021-04-12 10:05:41', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(530, 1, 2, '1385.00', '0.00', '1385.00', 1, 1, '2021-04-12', '2021-04-12 10:20:03', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(531, 1, 2, '110.00', '0.00', '110.00', 1, 1, '2021-04-12', '2021-04-12 10:19:08', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(532, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-12', '2021-04-12 11:18:27', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(533, 1, 2, '70.00', '0.00', '70.00', 1, 1, '2021-04-12', '2021-04-12 11:24:28', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(534, 1, 2, '1050.00', '0.00', '1050.00', 1, 1, '2021-04-12', '2021-04-12 11:32:42', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(537, 1, 2, '25.00', '0.00', '25.00', 1, 1, '2021-04-12', '2021-04-12 12:52:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(538, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-12', '2021-04-12 12:57:05', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(539, 1, 2, '2650.00', '0.00', '2650.00', 1, 1, '2021-04-12', '2021-04-12 13:03:39', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(540, 1, 2, '285.00', '0.00', '285.00', 1, 1, '2021-04-12', '2021-04-12 13:13:35', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(541, 1, 2, '380.00', '0.00', '380.00', 1, 1, '2021-04-12', '2021-04-12 13:13:58', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(542, 1, 2, '770.00', '0.00', '770.00', 1, 1, '2021-04-12', '2021-04-12 13:34:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(543, 1, 2, '420.00', '0.00', '420.00', 1, 1, '2021-04-12', '2021-04-12 13:37:24', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(544, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-12', '2021-04-12 13:50:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(545, 1, 2, '185.00', '0.00', '185.00', 1, 1, '2021-04-12', '2021-04-12 14:04:13', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(546, 1, 2, '565.00', '0.00', '565.00', 1, 1, '2021-04-12', '2021-04-12 14:07:51', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(547, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-12', '2021-04-12 14:16:25', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(548, 1, 2, '490.00', '0.00', '490.00', 1, 1, '2021-04-12', '2021-04-12 14:49:10', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(549, 1, 2, '180.00', '0.00', '180.00', 1, 1, '2021-04-12', '2021-04-12 14:43:39', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(550, 1, 2, '360.00', '0.00', '360.00', 1, 1, '2021-04-12', '2021-04-12 14:47:31', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(551, 1, 2, '1430.00', '0.00', '1430.00', 1, 1, '2021-04-12', '2021-04-12 14:50:55', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(552, 1, 2, '550.00', '0.00', '550.00', 1, 1, '2021-04-12', '2021-04-12 14:59:22', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(553, 1, 2, '195.00', '0.00', '195.00', 1, 1, '2021-04-12', '2021-04-12 15:01:17', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(555, 1, 2, '335.00', '0.00', '335.00', 1, 1, '2021-04-12', '2021-04-12 15:15:42', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(556, 1, 2, '330.00', '0.00', '330.00', 1, 1, '2021-04-12', '2021-04-12 15:22:11', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(557, 1, 2, '115.00', '0.00', '115.00', 1, 1, '2021-04-12', '2021-04-12 15:24:27', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(558, 1, 2, '145.00', '0.00', '145.00', 1, 1, '2021-04-13', '2021-04-13 05:29:40', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(559, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-13', '2021-04-13 05:58:46', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(560, 1, 2, '250.00', '0.00', '250.00', 1, 1, '2021-04-13', '2021-04-13 06:24:12', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(561, 1, 2, '55.00', '0.00', '55.00', 1, 1, '2021-04-13', '2021-04-13 07:30:25', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(562, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-04-13', '2021-04-13 07:43:57', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(563, 1, 2, '450.00', '0.00', '450.00', 1, 1, '2021-04-13', '2021-04-13 07:53:41', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(564, 1, 2, '530.00', '0.00', '530.00', 1, 1, '2021-04-13', '2021-04-13 08:05:14', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(565, 1, 2, '90.00', '0.00', '90.00', 1, 1, '2021-04-13', '2021-04-13 08:06:55', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(566, 1, 2, '1890.00', '0.00', '1890.00', 1, 1, '2021-04-13', '2021-04-13 10:04:44', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(568, 1, 2, '2100.00', '0.00', '2100.00', 1, 1, '2021-04-13', '2021-04-13 10:15:39', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(569, 2, 2, '200.00', '0.00', '200.00', 2, 1, '2021-04-13', '2021-04-13 10:22:26', NULL, 0, '0.00', '200.00', '2021-04-13', '', 0, '0.00', '0.00', 0),
(570, 2, 2, '180.00', '0.00', '180.00', 2, 1, '2021-04-13', '2021-04-13 10:26:16', NULL, 0, '0.00', '380.00', '2021-04-13', '', 0, '0.00', '0.00', 0),
(571, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '2021-04-13', '2021-04-13 10:29:14', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(574, 1, 2, '1935.00', '0.00', '1935.00', 1, 1, '2021-04-13', '2021-04-13 11:42:13', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(575, 2, 2, '140.00', '0.00', '140.00', 1, 1, '2021-04-22', '2021-04-22 19:58:47', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(576, 1, 2, '80776.00', '0.00', '80776.00', 2, 2, '2021-04-22', '2021-07-15 06:20:08', NULL, 2, '80776.00', '1022156.00', NULL, '', 1, '69634.48', '11141.52', 0),
(577, 2, 2, '6100.00', '0.00', '6100.00', 2, 1, '2021-04-23', '2021-04-22 21:49:57', NULL, 0, '0.00', '6100.00', '2021-07-01', '', 0, '0.00', '0.00', 0),
(579, 2, 2, '5150.00', '0.00', '5150.00', 1, 1, '2021-04-25', '2021-04-25 07:29:16', 0, 2, NULL, '300.00', NULL, '0', 0, '0.00', '0.00', 0),
(580, 2, 2, '76608.00', '0.00', '76608.00', 1, 1, '2021-04-25', '2021-07-17 15:36:45', 0, 2, NULL, '18883.00', NULL, '0', 0, '0.00', '0.00', 0),
(581, 1, 2, '5400.00', '0.00', '5400.00', 1, 1, '2021-04-25', '2021-04-25 10:19:10', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(582, 1, 2, '1000.00', '0.00', '1000.00', 1, 1, '2021-04-25', '2021-05-11 09:49:37', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(585, 1, 2, '100.00', '0.00', '100.00', 1, 1, '2021-05-22', '2021-05-22 11:16:10', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(586, 3, 2, '700.00', '0.00', '700.00', 2, 1, '2021-05-22', '2021-05-22 11:27:26', NULL, 2, '0.00', '700.00', '2021-07-06', '', 0, '0.00', '0.00', 0),
(587, 2, 2, '200.00', '0.00', '200.00', 1, 1, '2021-05-22', '2021-05-22 11:35:20', 0, 2, NULL, '300.00', NULL, '0', 0, '0.00', '0.00', 0),
(588, 3, 2, '20000.00', '0.00', '20000.00', 1, 1, '2021-06-07', '2021-06-07 11:54:12', 0, 1, NULL, '200.00', NULL, '0', 0, '0.00', '0.00', 0),
(589, 1, 2, '8500.00', '0.00', '8500.00', 1, 1, '2021-06-07', '2021-06-07 12:06:14', 0, 2, NULL, '8000.00', NULL, '0', 0, '0.00', '0.00', 0),
(590, 3, 2, '2000.00', '0.00', '2000.00', 2, 1, '2021-06-07', '2021-06-07 12:10:29', NULL, 0, '0.00', '2200.00', '2021-07-06', '', 0, '0.00', '0.00', 0),
(591, 1, 2, '8000.00', '0.00', '8000.00', 2, 2, '2021-06-07', '2021-06-07 11:56:25', NULL, 0, '8000.00', '8000.00', NULL, '', 0, '0.00', '0.00', 0),
(592, 3, 2, '47500.00', '0.00', '47500.00', 2, 1, '2021-06-10', '2021-06-10 10:00:01', NULL, 0, '0.00', '49700.00', '2021-07-06', '', 0, '0.00', '0.00', 0),
(593, 3, 2, '10000.00', '0.00', '10000.00', 1, 1, '2021-06-11', '2021-06-11 08:46:32', 0, 2, NULL, '49700.00', NULL, '0', 0, '0.00', '0.00', 0),
(594, 3, 2, '1200.00', '0.00', '1200.00', 2, 1, '2021-06-11', '2021-06-11 08:47:41', NULL, 0, '0.00', '50900.00', '2021-07-06', '', 0, '0.00', '0.00', 0),
(597, 3, 2, '15000.00', '0.00', '15000.00', 1, 1, '2021-07-15', '2021-07-15 07:08:09', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(598, 3, 2, '11856.00', '0.00', '11856.00', 1, 1, '2021-07-15', '2021-07-15 07:10:21', 0, 0, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(599, 1, 2, '75644.00', '0.00', '75644.00', 2, 2, '2021-07-01', '2021-07-01 10:11:03', NULL, 2, '75644.00', '83644.00', NULL, '', 0, '0.00', '0.00', 0),
(600, 2, 2, '1889.00', '0.00', '1889.00', 2, 1, '2021-07-01', '2021-07-01 10:13:52', NULL, 0, '0.00', '2189.00', '2021-07-01', '', 0, '0.00', '0.00', 0),
(601, 2, 2, '1889.00', '0.00', '1889.00', 2, 1, '2021-07-01', '2021-07-01 10:14:53', NULL, 0, '0.00', '4078.00', '2021-07-01', '', 0, '0.00', '0.00', 0),
(602, 1, 2, '14838.00', '0.00', '14838.00', 1, 1, '2021-07-01', '2021-07-15 07:16:38', 0, 2, NULL, '1022156.00', NULL, '0', 0, '0.00', '0.00', 0),
(603, 2, 2, '34805.00', '0.00', '34805.00', 2, 3, '2021-07-01', '2021-07-01 12:04:01', NULL, 0, '18883.00', '38883.00', '2021-07-01', '', 0, '0.00', '0.00', 0),
(604, 2, 2, '21800.00', '0.00', '21800.00', 2, 2, '2021-07-05', '2021-07-17 16:27:01', NULL, 0, '21800.00', '40683.00', NULL, '', 1, '18793.10', '3006.90', 0),
(605, 5, 2, '22368.00', '0.00', '22368.00', 2, 2, '2021-07-15', '2021-07-15 06:13:36', NULL, 0, '22368.00', '22368.00', NULL, '', 1, '19282.76', '3085.24', 0),
(606, 0, 2, '21200.00', '0.00', '21200.00', 2, 2, '2021-07-06', '2021-07-17 16:22:15', NULL, 2, '21200.00', '21200.00', NULL, '', 1, '18275.86', '2924.14', 0),
(607, 1, 2, '63840.00', '0.00', '63840.00', 1, 1, '2021-07-12', '2021-07-12 05:02:18', 0, 2, NULL, '83644.00', NULL, '0', 0, '0.00', '0.00', 0),
(608, 4, 2, '11970.00', '0.00', '11970.00', 2, 2, '2021-07-06', '2021-07-17 16:26:42', NULL, 0, '11970.00', '11970.00', NULL, '', 0, '11970.00', '0.00', 0),
(609, 1, 2, '20.00', '0.00', '20.00', 1, 1, '2021-07-12', '2021-07-12 06:18:37', 0, 2, NULL, '83644.00', NULL, '0', 0, '0.00', '0.00', 0),
(610, 5, 1, '17000.00', '0.00', '17000.00', 1, 1, '2021-07-12', '2021-07-12 06:22:07', 0, 1, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(611, 5, 2, '42824.00', '0.00', '42824.00', 2, 2, '2021-07-13', '2021-07-17 16:26:18', NULL, 2, '42824.00', '98024.00', NULL, '', 0, '0.00', '0.00', 0),
(612, 1, 2, '46059.00', '0.00', '46059.00', 2, 2, '2021-07-13', '2021-07-17 15:04:18', NULL, 2, '46059.00', '1159482.00', NULL, '', 1, '39706.03', '6352.97', 0),
(613, 1, 2, '91267.00', '0.00', '91267.00', 2, 2, '2021-07-13', '2021-07-17 14:52:25', NULL, 2, '91267.00', '1113423.00', NULL, '', 1, '78678.45', '12588.55', 0),
(614, 1, 2, '857736.00', '0.00', '857736.00', 2, 2, '2021-07-13', '2021-07-13 20:31:10', NULL, 2, '857736.00', '941380.00', NULL, '', 1, '739427.59', '118308.41', 0),
(616, 3, 2, '4640.00', '0.00', '4640.00', 1, 1, '2021-07-15', '2021-07-15 07:22:32', 0, 2, NULL, '0.00', NULL, '0', 0, '0.00', '0.00', 0),
(617, 5, 2, '32832.00', '0.00', '32832.00', 2, 2, '2021-07-17', '2021-07-17 16:08:54', NULL, 0, '32832.00', '55200.00', NULL, '', 1, '28303.45', '4528.55', 0),
(618, 5, 2, '3648.00', '0.00', '3648.00', 1, 1, '2021-07-22', '2021-07-23 19:55:33', 0, 2, NULL, '100760.00', NULL, '0', 2, '3648.00', '583.68', 0),
(619, 0, 2, '3000.00', '0.00', '3000.00', 2, 2, '2021-07-22', '2021-07-22 07:31:04', NULL, 2, '3000.00', '3000.00', NULL, '', 1, '2586.21', '413.79', 0),
(621, 1, 2, '2736.00', '0.00', '2736.00', 1, 1, '2021-07-22', '2021-07-22 13:26:14', 0, 2, NULL, '1159482.00', NULL, '0', 0, '0.00', '0.00', 0),
(622, 1, 2, '2736.00', '0.00', '2736.00', 1, 1, '2021-07-22', '2021-07-22 13:27:31', 0, 2, NULL, '1159482.00', NULL, '0', 0, '0.00', '0.00', 0),
(623, 5, 2, '2736.00', '0.00', '2736.00', 2, 2, '2021-07-22', '2021-07-22 13:28:52', NULL, 0, '2736.00', '100760.00', NULL, '', 1, '2358.62', '377.38', 0),
(624, 1, 2, '80.00', '0.00', '80.00', 1, 1, '2021-07-23', '2021-07-23 19:54:55', 0, 2, NULL, '1159482.00', NULL, '0', 1, '68.97', '11.03', 0),
(625, 5, 2, '2479228.00', '0.00', '2479228.00', 2, 2, '2021-08-06', '2021-08-06 11:53:00', NULL, 0, '2479228.00', '2579988.00', NULL, '', 1, '2137265.52', '341962.48', 0),
(626, 5, 2, '14764.00', '0.00', '14764.00', 1, 1, '2021-08-18', '2021-08-18 19:01:30', 0, 2, NULL, '2579988.00', NULL, '0', 1, '12727.59', '2036.41', 1),
(627, 4, 2, '34884.00', '0.00', '34884.00', 2, 2, '2021-08-18', '2021-08-18 19:19:11', NULL, 0, '34884.00', '46854.00', NULL, '', 1, '30072.41', '4811.59', 0),
(628, 5, 2, '10773.00', '0.00', '10773.00', 2, 2, '2021-08-18', '2021-08-18 19:21:26', NULL, 0, '10773.00', '2590761.00', NULL, '', 1, '9287.07', '1485.93', 2),
(629, 3, 2, '470.00', '0.00', '470.00', 2, 1, '2021-08-25', '2021-08-25 12:07:11', NULL, 0, '0.00', '470.00', '2021-08-30', '', 0, '0.00', '0.00', 2),
(630, 5, 2, '6000.00', '0.00', '6000.00', 1, 1, '2021-08-25', '2021-08-25 12:09:49', 0, 2, NULL, '2590761.00', NULL, '0', 0, '0.00', '0.00', 2),
(631, 5, 2, '570.00', '0.00', '570.00', 1, 1, '2021-08-25', '2021-08-25 12:14:06', 0, 2, NULL, '2590761.00', NULL, '0', 0, '0.00', '0.00', 1),
(632, 1, 2, '40750.00', '0.00', '40750.00', 2, 2, '2021-08-26', '2021-08-26 12:40:59', NULL, 0, '40750.00', '1200232.00', NULL, '', 2, '40750.00', '6520.00', 2),
(633, 1, 2, '2900.00', '0.00', '2900.00', 2, 2, '2021-08-26', '2021-08-26 12:59:02', NULL, 0, '2900.00', '1203132.00', NULL, '', 0, '0.00', '0.00', 2),
(634, 1, 2, '7450.00', '0.00', '7450.00', 2, 2, '2021-08-26', '2021-08-26 13:00:12', NULL, 0, '7450.00', '1210582.00', NULL, '', 2, '7450.00', '1192.00', 2),
(635, 7, 2, '6840.00', '0.00', '6840.00', 2, 2, '2021-08-27', '2021-08-27 11:32:26', NULL, 0, '6840.00', '6840.00', NULL, '', 0, '0.00', '0.00', 1),
(636, 7, 2, '9000.00', '0.00', '9000.00', 2, 2, '2021-08-27', '2021-08-27 11:33:50', NULL, 0, '9000.00', '15840.00', NULL, '', 0, '0.00', '0.00', 1),
(637, 7, 2, '10000.00', '0.00', '10000.00', 2, 2, '2021-08-27', '2021-08-27 11:38:26', NULL, 0, '10000.00', '25840.00', NULL, '', 2, '10000.00', '1600.00', 1),
(638, 7, 2, '4000.00', '0.00', '4000.00', 2, 2, '2021-08-27', '2021-08-27 11:39:16', NULL, 0, '4000.00', '29840.00', NULL, '', 2, '4000.00', '640.00', 1),
(639, 7, 2, '790.00', '0.00', '790.00', 2, 2, '2021-08-27', '2021-08-27 11:56:45', NULL, 0, '790.00', '30630.00', NULL, '', 2, '790.00', '126.40', 2),
(640, 3, 2, '157350.00', '0.00', '157350.00', 2, 3, '2021-08-30', '2021-08-30 15:03:48', NULL, 0, '7820.00', '157820.00', '2021-08-30', '', 2, '157350.00', '25176.00', 1),
(641, 3, 2, '1450.00', '0.00', '1450.00', 1, 1, '2021-08-30', '2021-08-30 16:19:49', 0, 2, NULL, '7820.00', NULL, '0', 2, '1450.00', '232.00', 2),
(643, 3, 2, '8780.00', '0.00', '8780.00', 2, 2, '2021-08-31', '2021-08-31 10:52:32', NULL, 0, '8780.00', '16600.00', NULL, '', 2, '780.00', '124.80', 2),
(644, 9, 11, '11900.00', '0.00', '11900.00', 2, 2, '2021-08-31', '2021-08-31 10:48:00', NULL, 0, '11900.00', '11900.00', NULL, '', 2, '11900.00', '1904.00', 1),
(645, 10, 2, '7200.00', '0.00', '7200.00', 2, 2, '2021-08-31', '2021-08-31 12:15:00', NULL, 0, '7200.00', '7200.00', NULL, '', 2, '0.00', '0.00', 2),
(646, 10, 2, '7900.00', '0.00', '7900.00', 2, 2, '2021-08-31', '2021-08-31 12:16:14', NULL, 0, '7900.00', '15100.00', NULL, '', 2, '7900.00', '1264.00', 2),
(647, 9, 2, '790.00', '0.00', '790.00', 2, 2, '2021-08-31', '2021-08-31 12:17:17', NULL, 0, '790.00', '12690.00', NULL, '', 2, '790.00', '126.40', 2),
(649, 0, 11, '5100.00', '0.00', '5100.00', 2, 2, '2021-08-31', '2021-08-31 12:32:51', NULL, 11, '5100.00', '5100.00', NULL, '', 2, '5100.00', '816.00', 1),
(650, 9, 2, '10600.00', '0.00', '10600.00', 2, 2, '2021-08-31', '2021-08-31 13:53:34', NULL, 0, '10600.00', '23290.00', NULL, '', 0, '10600.00', '0.00', 1),
(652, 32, 11, '20000.00', '0.00', '20000.00', 2, 2, '2021-09-01', '2021-09-01 11:33:37', NULL, 0, '20000.00', '20000.00', NULL, '', 2, '20000.00', '3200.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_cred_pay_hist`
--

CREATE TABLE `kp_sale_cred_pay_hist` (
  `pay_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `note_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sale_bal` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `cf_bal` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sale_cred_pay_hist`
--

INSERT INTO `kp_sale_cred_pay_hist` (`pay_id`, `sale_id`, `note_id`, `user_id`, `cust_id`, `sale_bal`, `amount`, `cf_bal`, `day`, `datime`) VALUES
(469, 577, NULL, 2, 2, '950.00', '50.00', '900.00', '2021-04-23', '2021-04-23 00:52:05'),
(470, 577, NULL, 2, 2, '900.00', '500.00', '400.00', '2021-04-23', '2021-04-23 00:54:04'),
(471, 577, NULL, 2, 2, '400.00', '100.00', '300.00', '2021-04-23', '2021-04-23 01:07:15'),
(476, 586, NULL, 2, 3, '700.00', '500.00', '200.00', '2021-05-22', '2021-05-22 14:28:54'),
(487, 577, NULL, 2, 2, '300.00', '300.00', '38583.00', '2021-07-01', '2021-07-01 12:48:34'),
(487, 600, NULL, 2, 2, '1889.00', '1889.00', '36694.00', '2021-07-01', '2021-07-01 12:48:34'),
(487, 601, NULL, 2, 2, '1889.00', '1889.00', '34805.00', '2021-07-01', '2021-07-01 12:48:34'),
(487, 603, NULL, 2, 2, '34805.00', '15922.00', '18883.00', '2021-07-01', '2021-07-01 12:48:34'),
(488, 586, NULL, 2, 3, '200.00', '200.00', '50700.00', '2021-07-06', '2021-07-06 04:39:17'),
(489, 590, NULL, 2, 3, '2000.00', '2000.00', '48700.00', '2021-07-06', '2021-07-06 05:39:24'),
(489, 592, NULL, 2, 3, '47500.00', '8700.00', '40000.00', '2021-07-06', '2021-07-06 05:39:24'),
(490, 592, NULL, 2, 3, '38800.00', '1254.00', '38746.00', '2021-07-06', '2021-07-06 06:28:31'),
(492, 592, NULL, 2, 3, '37546.00', '46.00', '38700.00', '2021-07-06', '2021-07-06 06:32:36'),
(493, 592, NULL, 2, 3, '37500.00', '700.00', '38000.00', '2021-07-06', '2021-07-06 06:37:13'),
(494, 592, NULL, 2, 3, '36800.00', '500.00', '37500.00', '2021-07-06', '2021-07-06 06:47:14'),
(495, 592, NULL, 2, 3, '36300.00', '4500.00', '33000.00', '2021-07-06', '2021-07-06 06:48:37'),
(496, 592, NULL, 2, 3, '31800.00', '11000.00', '22000.00', '2021-07-06', '2021-07-06 10:02:19'),
(497, 592, NULL, 2, 3, '20800.00', '20800.00', '1200.00', '2021-07-06', '2021-07-06 10:05:54'),
(497, 594, NULL, 2, 3, '1200.00', '90.00', '1110.00', '2021-07-06', '2021-07-06 10:05:54'),
(498, 594, NULL, 2, 3, '1110.00', '500.00', '610.00', '2021-07-06', '2021-07-06 10:09:26'),
(499, 594, NULL, 2, 3, '610.00', '610.00', '0.00', '2021-07-06', '2021-07-06 10:09:54'),
(525, 629, NULL, 2, 3, '470.00', '470.00', '157350.00', '2021-08-30', '2021-08-30 18:06:08'),
(525, 640, NULL, 2, 3, '157350.00', '149530.00', '7820.00', '2021-08-30', '2021-08-30 18:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_id`
--

CREATE TABLE `kp_sale_id` (
  `sale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sale_id`
--

INSERT INTO `kp_sale_id` (`sale_id`) VALUES
(652);

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_items`
--

CREATE TABLE `kp_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `disc` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `ret_status` int(11) NOT NULL DEFAULT '2',
  `bprice` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sale_items`
--

INSERT INTO `kp_sale_items` (`id`, `sale_id`, `item_id`, `uom`, `qty`, `price`, `disc`, `total`, `day`, `ret_status`, `bprice`, `profit`, `commission`, `tax`, `tax_id`, `type`, `datime`, `shop`) VALUES
(1, 1, 16, 0, '0.50', '1550.00', '0.00', '775.00', '2021-03-22', 2, '0.00', '775.00', '0.00', '0.00', 2, 1, '2021-03-22 10:35:56', 0),
(2, 2, 3, 0, '1.00', '4670.00', '0.00', '4670.00', '2021-03-28', 2, '0.00', '4670.00', '0.00', '644.14', 1, 1, '2021-03-28 06:43:11', 0),
(3, 3, 18, 0, '1.00', '3550.00', '0.00', '3550.00', '2021-03-28', 2, '0.00', '3550.00', '0.00', '489.66', 1, 1, '2021-03-28 06:52:18', 0),
(4, 4, 145, 0, '2.00', '3570.00', '0.00', '7140.00', '2021-03-28', 2, '3410.00', '320.00', '0.00', '984.83', 1, 1, '2021-03-28 06:55:10', 0),
(5, 5, 1, 0, '1.00', '995.00', '0.00', '995.00', '2021-03-28', 2, '950.00', '45.00', '0.00', '137.24', 1, 1, '2021-03-28 07:00:30', 0),
(6, 6, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-03-28', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-03-28 07:01:18', 0),
(7, 8, 1, 0, '1.00', '1000.00', '0.00', '1000.00', '0000-00-00', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-03-28 08:20:58', 0),
(8, 10, 153, 0, '6.00', '1450.00', '0.00', '8700.00', '2021-03-29', 2, '1390.00', '360.00', '0.00', '1200.00', 1, 1, '2021-03-29 08:00:00', 0),
(9, 13, 78, 0, '1.00', '1080.00', '0.00', '1080.00', '2021-03-29', 2, '0.00', '1080.00', '0.00', '148.97', 1, 1, '2021-03-29 08:39:24', 0),
(10, 14, 68, 0, '1.00', '1150.00', '0.00', '1150.00', '2021-03-29', 2, '0.00', '1150.00', '0.00', '158.62', 1, 1, '2021-03-29 08:41:04', 0),
(11, 16, 163, 0, '1.00', '55.00', '0.00', '55.00', '2021-03-29', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-03-29 08:45:34', 0),
(12, 18, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-03-29', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-03-29 09:09:38', 0),
(13, 19, 47, 0, '1.00', '130.00', '0.00', '130.00', '2021-03-29', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-03-29 09:11:51', 0),
(14, 20, 140, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-03-29', 2, '2010.00', '140.00', '0.00', '0.00', 2, 1, '2021-03-29 09:12:29', 0),
(15, 22, 164, 0, '1.00', '50.00', '0.00', '50.00', '2021-03-29', 2, '39.00', '11.00', '0.00', '6.90', 1, 1, '2021-03-29 09:15:45', 0),
(16, 24, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-29', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-03-29 09:18:43', 0),
(17, 25, 162, 0, '1.00', '360.00', '0.00', '360.00', '2021-03-29', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-03-29 09:27:17', 0),
(18, 25, 160, 0, '1.00', '360.00', '0.00', '360.00', '2021-03-29', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-03-29 09:27:26', 0),
(19, 26, 96, 0, '6.00', '46.00', '0.00', '276.00', '2021-03-29', 2, '0.00', '276.00', '0.00', '0.00', 0, 1, '2021-03-29 09:32:11', 0),
(20, 26, 80, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-29', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-29 09:32:23', 0),
(21, 26, 47, 0, '1.00', '130.00', '0.00', '130.00', '2021-03-29', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-03-29 09:32:49', 0),
(22, 26, 166, 0, '1.00', '55.00', '0.00', '55.00', '2021-03-29', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-03-29 09:34:35', 0),
(23, 29, 167, 0, '1.00', '90.00', '0.00', '90.00', '2021-03-29', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-03-29 09:39:06', 0),
(24, 31, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-03-29', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-03-29 09:40:58', 0),
(25, 32, 165, 0, '6.00', '100.00', '0.00', '600.00', '2021-03-29', 2, '92.80', '43.20', '0.00', '82.76', 1, 1, '2021-03-29 09:50:28', 0),
(26, 32, 169, 0, '1.00', '70.00', '0.00', '70.00', '2021-03-29', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-03-29 09:52:53', 0),
(27, 36, 170, 0, '2.00', '180.00', '0.00', '360.00', '2021-03-29', 2, '171.50', '17.00', '0.00', '49.66', 1, 1, '2021-03-29 10:25:33', 0),
(28, 39, 171, 0, '1.00', '110.00', '0.00', '110.00', '2021-03-29', 2, '93.50', '16.50', '0.00', '15.17', 1, 1, '2021-03-29 11:06:41', 0),
(29, 39, 173, 0, '1.00', '60.00', '0.00', '60.00', '2021-03-29', 2, '47.00', '13.00', '0.00', '8.28', 1, 1, '2021-03-29 11:06:51', 0),
(30, 39, 172, 0, '1.00', '25.00', '0.00', '25.00', '2021-03-29', 2, '0.00', '25.00', '0.00', '3.45', 1, 1, '2021-03-29 11:07:02', 0),
(31, 41, 157, 0, '5.00', '45.00', '0.00', '225.00', '2021-03-29', 2, '30.42', '72.90', '0.00', '31.03', 1, 1, '2021-03-29 11:45:16', 0),
(32, 12, 77, 0, '2.00', '115.00', '0.00', '230.00', '2021-03-29', 2, '0.00', '230.00', '0.00', '31.72', 1, 1, '2021-03-29 11:59:25', 0),
(33, 12, 175, 0, '1.00', '125.00', '0.00', '125.00', '2021-03-29', 2, '0.00', '125.00', '0.00', '17.24', 1, 1, '2021-03-29 11:59:34', 0),
(34, 12, 65, 0, '1.00', '135.00', '0.00', '135.00', '2021-03-29', 2, '0.00', '135.00', '0.00', '18.62', 1, 1, '2021-03-29 11:59:45', 0),
(35, 45, 174, 0, '1.00', '125.00', '0.00', '125.00', '2021-03-29', 2, '112.50', '12.50', '0.00', '0.00', 0, 1, '2021-03-29 12:00:21', 0),
(36, 47, 179, 0, '2.00', '1000.00', '0.00', '2000.00', '2021-03-29', 2, '950.00', '100.00', '0.00', '275.86', 1, 1, '2021-03-29 12:37:29', 0),
(37, 50, 165, 0, '25.00', '95.00', '0.00', '2375.00', '2021-03-29', 2, '92.80', '55.00', '0.00', '327.59', 1, 1, '2021-03-29 12:48:02', 0),
(38, 54, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-29', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-29 12:59:04', 0),
(39, 55, 192, 0, '12.00', '43.33', '0.00', '520.00', '2021-03-29', 2, '40.42', '34.96', '0.00', '0.00', 2, 1, '2021-03-29 13:02:15', 0),
(40, 55, 166, 0, '1.00', '55.00', '0.00', '55.00', '2021-03-29', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-03-29 13:02:25', 0),
(41, 55, 160, 0, '1.00', '360.00', '0.00', '360.00', '2021-03-29', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-03-29 13:02:51', 0),
(42, 55, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-03-29', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-03-29 13:03:02', 0),
(43, 55, 193, 0, '1.00', '90.00', '0.00', '90.00', '2021-03-29', 2, '0.00', '90.00', '0.00', '0.00', 2, 1, '2021-03-29 13:04:13', 0),
(44, 55, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-03-29', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-03-29 13:04:48', 0),
(45, 57, 196, 0, '1.00', '550.00', '0.00', '550.00', '2021-03-29', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-03-29 14:22:44', 0),
(46, 57, 65, 0, '2.00', '135.00', '0.00', '270.00', '2021-03-29', 2, '0.00', '270.00', '0.00', '37.24', 1, 1, '2021-03-29 14:23:04', 0),
(47, 57, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-03-29', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-03-29 14:23:19', 0),
(48, 57, 182, 0, '4.00', '130.00', '0.00', '520.00', '2021-03-29', 2, '120.00', '40.00', '0.00', '0.00', 2, 1, '2021-03-29 14:26:52', 0),
(49, 58, 169, 0, '1.00', '250.00', '0.00', '250.00', '0000-00-00', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-03-29 14:32:18', 0),
(50, 59, 170, 0, '1.00', '190.00', '0.00', '190.00', '2021-03-29', 2, '171.50', '18.50', '0.00', '26.21', 1, 1, '2021-03-29 14:33:02', 0),
(51, 61, 197, 0, '1.00', '380.00', '0.00', '380.00', '2021-03-29', 2, '0.00', '380.00', '0.00', '52.41', 1, 1, '2021-03-29 14:53:29', 0),
(52, 62, 10, 0, '2.00', '1570.00', '0.00', '3140.00', '2021-03-29', 2, '0.00', '3140.00', '0.00', '0.00', 2, 1, '2021-03-29 15:01:03', 0),
(53, 63, 152, 0, '1.00', '1770.00', '0.00', '1770.00', '2021-03-29', 2, '1390.00', '380.00', '0.00', '244.14', 1, 1, '2021-03-29 15:16:03', 0),
(54, 64, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-03-29', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-03-29 15:19:33', 0),
(55, 64, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-03-29', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-03-29 15:20:18', 0),
(56, 64, 38, 0, '1.00', '70.00', '0.00', '70.00', '2021-03-29', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-03-29 15:20:43', 0),
(57, 64, 29, 0, '1.00', '180.00', '0.00', '180.00', '2021-03-29', 2, '138.00', '42.00', '0.00', '24.83', 1, 1, '2021-03-29 15:20:56', 0),
(58, 64, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-03-29', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-03-29 15:24:43', 0),
(59, 64, 199, 0, '1.00', '75.00', '0.00', '75.00', '2021-03-29', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-03-29 15:25:46', 0),
(60, 64, 76, 0, '6.00', '115.00', '0.00', '690.00', '2021-03-29', 2, '0.00', '690.00', '0.00', '95.17', 1, 1, '2021-03-29 15:29:35', 0),
(61, 64, 186, 0, '6.00', '24.00', '0.00', '144.00', '2021-03-29', 2, '0.00', '144.00', '0.00', '0.00', 0, 1, '2021-03-29 15:29:54', 0),
(62, 64, 174, 0, '1.00', '125.00', '0.00', '125.00', '2021-03-29', 2, '112.50', '12.50', '0.00', '0.00', 0, 1, '2021-03-29 15:30:43', 0),
(63, 64, 201, 0, '1.00', '155.00', '0.00', '155.00', '2021-03-29', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-03-29 15:32:10', 0),
(64, 64, 200, 0, '1.00', '125.00', '0.00', '125.00', '2021-03-29', 2, '0.00', '125.00', '0.00', '17.24', 1, 1, '2021-03-29 15:32:20', 0),
(65, 64, 33, 0, '2.00', '250.00', '0.00', '500.00', '2021-03-29', 2, '230.00', '40.00', '0.00', '68.97', 1, 1, '2021-03-29 15:32:55', 0),
(66, 64, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-29', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-29 15:34:07', 0),
(67, 65, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-03-29', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-03-29 15:36:05', 0),
(68, 66, 18, 0, '1.00', '3550.00', '0.00', '3550.00', '2021-03-29', 2, '0.00', '3550.00', '0.00', '489.66', 1, 1, '2021-03-29 15:43:56', 0),
(69, 67, 171, 0, '1.00', '110.00', '0.00', '110.00', '2021-03-29', 2, '93.50', '16.50', '0.00', '15.17', 1, 1, '2021-03-29 15:50:34', 0),
(70, 68, 159, 0, '1.00', '250.00', '0.00', '250.00', '2021-03-29', 2, '205.00', '45.00', '0.00', '34.48', 1, 1, '2021-03-29 15:53:14', 0),
(71, 69, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-03-29', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-03-29 15:55:44', 0),
(72, 70, 182, 0, '1.00', '135.00', '0.00', '135.00', '2021-03-29', 2, '120.00', '15.00', '0.00', '0.00', 2, 1, '2021-03-29 16:01:50', 0),
(73, 71, 18, 0, '1.00', '3570.00', '0.00', '3570.00', '2021-03-29', 2, '0.00', '3570.00', '0.00', '492.41', 1, 1, '2021-03-29 16:02:25', 0),
(74, 75, 14, 0, '0.50', '1490.00', '0.00', '745.00', '2021-03-30', 2, '1440.00', '25.00', '0.00', '0.00', 2, 1, '2021-03-30 08:39:27', 0),
(75, 75, 164, 0, '10.00', '41.00', '0.00', '410.00', '2021-03-30', 2, '39.00', '20.00', '0.00', '56.55', 1, 1, '2021-03-30 08:41:30', 0),
(76, 75, 37, 0, '1.00', '70.00', '0.00', '70.00', '2021-03-30', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-03-30 08:43:32', 0),
(77, 75, 62, 0, '1.00', '110.00', '0.00', '110.00', '2021-03-30', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-03-30 08:43:48', 0),
(78, 75, 167, 0, '1.00', '90.00', '0.00', '90.00', '2021-03-30', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-03-30 08:44:12', 0),
(79, 75, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-30', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-30 08:45:28', 0),
(80, 76, 20, 0, '6.00', '1470.00', '0.00', '8820.00', '0000-00-00', 2, '0.00', '8820.00', '0.00', '1216.55', 1, 1, '2021-03-30 09:46:29', 0),
(81, 77, 165, 0, '13.00', '95.38', '0.00', '1240.00', '2021-03-30', 2, '92.80', '33.60', '0.00', '171.03', 1, 1, '2021-03-30 10:08:59', 0),
(82, 78, 171, 0, '1.00', '110.00', '0.00', '110.00', '2021-03-30', 2, '93.50', '16.50', '0.00', '15.17', 1, 1, '2021-03-30 10:10:13', 0),
(83, 79, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-30', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-30 10:11:09', 0),
(84, 79, 165, 0, '12.50', '95.20', '0.00', '1190.00', '2021-03-30', 2, '92.80', '30.00', '0.00', '164.14', 1, 1, '2021-03-30 10:11:49', 0),
(85, 79, 203, 0, '2.00', '55.00', '0.00', '110.00', '2021-03-30', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-03-30 10:13:34', 0),
(86, 80, 164, 0, '10.00', '41.00', '0.00', '410.00', '2021-03-30', 2, '39.00', '20.00', '0.00', '56.55', 1, 1, '2021-03-30 10:14:37', 0),
(87, 80, 193, 0, '1.00', '90.00', '0.00', '90.00', '2021-03-30', 2, '0.00', '90.00', '0.00', '0.00', 2, 1, '2021-03-30 10:14:50', 0),
(88, 81, 153, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-03-30', 2, '1390.00', '80.00', '0.00', '202.76', 1, 1, '2021-03-30 10:17:25', 0),
(89, 82, 171, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-03-30', 2, '93.50', '2376.50', '0.00', '340.69', 1, 1, '2021-03-30 11:24:20', 0),
(90, 83, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-30', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-03-30 11:27:13', 0),
(91, 83, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-03-30', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-03-30 11:29:18', 0),
(92, 83, 180, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-30', 2, '79.17', '20.83', '0.00', '0.00', 2, 1, '2021-03-30 11:30:10', 0),
(93, 83, 193, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-30', 2, '0.00', '100.00', '0.00', '0.00', 2, 1, '2021-03-30 11:31:06', 0),
(94, 84, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-30', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-30 11:46:19', 0),
(95, 85, 182, 0, '3.00', '130.00', '0.00', '390.00', '2021-03-30', 2, '120.00', '30.00', '0.00', '0.00', 2, 1, '2021-03-30 12:44:44', 0),
(96, 86, 5, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-30', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-03-30 13:06:49', 0),
(97, 87, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-03-30', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-03-30 13:34:29', 0),
(98, 88, 182, 0, '2.00', '130.00', '0.00', '260.00', '2021-03-30', 2, '120.00', '20.00', '0.00', '0.00', 2, 1, '2021-03-30 13:53:27', 0),
(99, 88, 196, 0, '5.00', '110.00', '0.00', '550.00', '2021-03-30', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-03-30 13:55:04', 0),
(100, 90, 5, 0, '2.00', '110.00', '0.00', '220.00', '2021-03-30', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-03-30 14:05:02', 0),
(101, 90, 186, 0, '1.00', '25.00', '0.00', '25.00', '2021-03-30', 2, '0.00', '25.00', '0.00', '0.00', 0, 1, '2021-03-30 14:05:37', 0),
(102, 91, 170, 0, '1.00', '180.00', '0.00', '180.00', '2021-03-30', 2, '171.50', '8.50', '0.00', '24.83', 1, 1, '2021-03-30 14:15:57', 0),
(103, 92, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-03-30', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-03-30 14:20:33', 0),
(104, 92, 137, 0, '1.00', '35.00', '0.00', '35.00', '2021-03-30', 2, '0.00', '35.00', '0.00', '0.00', 3, 1, '2021-03-30 14:21:30', 0),
(105, 93, 165, 0, '0.50', '100.00', '0.00', '50.00', '2021-03-30', 2, '92.80', '3.60', '0.00', '6.90', 1, 1, '2021-03-30 14:23:32', 0),
(106, 94, 173, 0, '1.00', '60.00', '0.00', '60.00', '2021-03-30', 2, '47.00', '13.00', '0.00', '8.28', 1, 1, '2021-03-30 14:50:23', 0),
(107, 97, 165, 0, '25.00', '95.20', '0.00', '2380.00', '2021-03-30', 2, '92.80', '60.00', '0.00', '328.28', 1, 1, '2021-03-30 14:57:16', 0),
(108, 98, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-30', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-30 15:07:38', 0),
(109, 98, 164, 0, '2.00', '50.00', '0.00', '100.00', '2021-03-30', 2, '39.00', '22.00', '0.00', '13.79', 1, 1, '2021-03-30 15:09:30', 0),
(110, 99, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-03-30', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-03-30 15:11:19', 0),
(111, 100, 68, 0, '2.00', '105.00', '0.00', '210.00', '2021-03-30', 2, '0.00', '210.00', '0.00', '28.97', 1, 1, '2021-03-30 15:26:11', 0),
(112, 101, 170, 0, '0.50', '180.00', '0.00', '90.00', '2021-03-30', 2, '171.50', '4.25', '0.00', '12.41', 1, 1, '2021-03-30 15:41:42', 0),
(113, 102, 62, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-30', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-30 15:48:58', 0),
(114, 102, 68, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-30', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-30 15:49:20', 0),
(115, 102, 75, 0, '1.00', '110.00', '0.00', '110.00', '2021-03-30', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-03-30 15:49:47', 0),
(116, 103, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-03-31', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-03-31 05:03:07', 0),
(117, 106, 205, 0, '4.00', '50.00', '0.00', '200.00', '2021-03-31', 2, '47.00', '12.00', '0.00', '27.59', 1, 1, '2021-03-31 05:19:49', 0),
(118, 107, 141, 0, '1.00', '4750.00', '0.00', '4750.00', '2021-03-31', 2, '4670.00', '80.00', '0.00', '655.17', 1, 1, '2021-03-31 05:31:44', 0),
(119, 109, 206, 0, '1.00', '50.00', '0.00', '50.00', '2021-03-31', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-03-31 05:57:23', 0),
(120, 110, 168, 0, '1.00', '50.00', '0.00', '50.00', '0000-00-00', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-03-31 07:30:55', 0),
(121, 111, 186, 0, '6.00', '24.00', '0.00', '144.00', '0000-00-00', 2, '0.00', '144.00', '0.00', '0.00', 0, 1, '2021-03-31 07:47:09', 0),
(122, 112, 144, 0, '1.00', '810.00', '0.00', '810.00', '2021-03-31', 2, '780.00', '30.00', '0.00', '111.72', 1, 1, '2021-03-31 07:51:13', 0),
(123, 113, 14, 0, '1.00', '1480.00', '0.00', '1480.00', '2021-03-31', 2, '1440.00', '40.00', '0.00', '0.00', 2, 1, '2021-03-31 08:43:20', 0),
(124, 114, 138, 0, '1.00', '580.00', '0.00', '580.00', '0000-00-00', 2, '0.00', '580.00', '0.00', '0.00', 3, 1, '2021-03-31 12:07:06', 0),
(125, 115, 28, 0, '1.00', '600.00', '0.00', '600.00', '0000-00-00', 2, '550.00', '50.00', '0.00', '82.76', 1, 1, '2021-03-31 13:01:26', 0),
(126, 116, 180, 0, '2.00', '200.00', '0.00', '400.00', '2021-03-31', 2, '79.17', '241.66', '0.00', '0.00', 2, 1, '2021-03-31 13:05:33', 0),
(127, 118, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-31', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-31 14:21:33', 0),
(128, 120, 84, 0, '1.00', '135.00', '0.00', '135.00', '2021-03-31', 2, '0.00', '135.00', '0.00', '18.62', 1, 1, '2021-03-31 14:41:22', 0),
(129, 122, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-31', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-31 14:48:09', 0),
(130, 123, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-03-31', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-03-31 15:02:17', 0),
(131, 123, 211, 0, '1.00', '145.00', '0.00', '145.00', '2021-03-31', 2, '135.00', '10.00', '0.00', '20.00', 1, 1, '2021-03-31 15:05:59', 0),
(132, 123, 65, 0, '1.00', '135.00', '0.00', '135.00', '2021-03-31', 2, '0.00', '135.00', '0.00', '18.62', 1, 1, '2021-03-31 15:06:13', 0),
(133, 123, 173, 0, '1.00', '120.00', '0.00', '120.00', '2021-03-31', 2, '47.00', '73.00', '0.00', '16.55', 1, 1, '2021-03-31 15:06:28', 0),
(134, 124, 169, 0, '1.00', '70.00', '0.00', '70.00', '2021-03-31', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-03-31 15:07:08', 0),
(135, 125, 187, 0, '6.00', '24.00', '0.00', '144.00', '2021-03-31', 2, '0.00', '144.00', '0.00', '19.86', 1, 1, '2021-03-31 15:07:56', 0),
(136, 126, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-03-31', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-03-31 15:10:05', 0),
(137, 126, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-03-31', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-03-31 15:10:21', 0),
(138, 126, 171, 0, '4.00', '110.00', '0.00', '440.00', '2021-03-31', 2, '93.50', '66.00', '0.00', '60.69', 1, 1, '2021-03-31 15:10:43', 0),
(139, 126, 170, 0, '4.00', '180.00', '0.00', '720.00', '2021-03-31', 2, '171.50', '34.00', '0.00', '99.31', 1, 1, '2021-03-31 15:10:58', 0),
(140, 127, 165, 0, '20.00', '95.00', '0.00', '1900.00', '2021-03-31', 2, '92.80', '44.00', '0.00', '262.07', 1, 1, '2021-03-31 15:12:16', 0),
(141, 127, 150, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-03-31', 2, '2340.00', '130.00', '0.00', '340.69', 1, 1, '2021-03-31 15:12:49', 0),
(142, 127, 10, 0, '1.00', '1570.00', '0.00', '1570.00', '2021-03-31', 2, '0.00', '1570.00', '0.00', '0.00', 2, 1, '2021-03-31 15:13:09', 0),
(143, 128, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-03-31', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-03-31 15:14:03', 0),
(144, 128, 156, 0, '2.00', '50.00', '0.00', '100.00', '2021-03-31', 2, '33.33', '33.34', '0.00', '13.79', 1, 1, '2021-03-31 15:16:36', 0),
(145, 129, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-03-31', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-03-31 15:17:14', 0),
(146, 130, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-03-31', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-03-31 15:22:40', 0),
(147, 130, 205, 0, '1.00', '50.00', '0.00', '50.00', '2021-03-31', 2, '47.00', '3.00', '0.00', '6.90', 1, 1, '2021-03-31 15:23:47', 0),
(148, 130, 208, 0, '2.00', '35.00', '0.00', '70.00', '2021-03-31', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-03-31 15:24:04', 0),
(149, 131, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-03-31', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-03-31 15:31:36', 0),
(150, 131, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-03-31', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-03-31 15:32:08', 0),
(151, 131, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-03-31', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-03-31 15:32:21', 0),
(152, 131, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-03-31', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-03-31 15:32:38', 0),
(153, 131, 186, 0, '5.00', '24.00', '0.00', '120.00', '2021-03-31', 2, '0.00', '120.00', '0.00', '0.00', 0, 1, '2021-03-31 15:32:57', 0),
(154, 133, 138, 0, '1.00', '580.00', '0.00', '580.00', '2021-03-31', 2, '0.00', '580.00', '0.00', '0.00', 3, 1, '2021-03-31 15:47:44', 0),
(155, 134, 165, 0, '12.50', '144.00', '0.00', '1800.00', '2021-04-01', 2, '92.80', '640.00', '0.00', '248.28', 1, 1, '2021-04-01 05:29:43', 0),
(156, 135, 144, 0, '1.00', '820.00', '0.00', '820.00', '2021-04-01', 1, '780.00', '40.00', '0.00', '113.10', 1, 1, '2021-04-01 06:16:53', 0),
(157, 137, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-01', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-01 06:49:58', 0),
(158, 137, 5, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-01', 2, '0.00', '500.00', '0.00', '68.97', 1, 1, '2021-04-01 06:50:06', 0),
(159, 137, 189, 0, '2.00', '120.00', '0.00', '240.00', '2021-04-01', 2, '105.00', '30.00', '0.00', '33.10', 1, 1, '2021-04-01 06:51:19', 0),
(160, 137, 182, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-01', 2, '120.00', '10.00', '0.00', '0.00', 2, 1, '2021-04-01 06:51:38', 0),
(161, 138, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-01', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-01 06:53:49', 0),
(162, 138, 8, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-01', 2, '0.00', '1530.00', '0.00', '0.00', 2, 1, '2021-04-01 06:54:08', 0),
(163, 138, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-01', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-01 06:54:26', 0),
(164, 138, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-01', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-01 06:54:41', 0),
(165, 138, 212, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-01', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-01 06:56:18', 0),
(166, 138, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-01', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-01 06:57:15', 0),
(167, 139, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-01', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-01 07:03:41', 0),
(168, 141, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-01', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-01 08:28:31', 0),
(169, 142, 5, 0, '12.50', '86.40', '0.00', '1080.00', '2021-04-01', 2, '0.00', '1080.00', '0.00', '148.97', 1, 1, '2021-04-01 09:08:54', 0),
(170, 143, 206, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-01', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-01 09:10:57', 0),
(171, 144, 180, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-01', 2, '79.17', '20.83', '0.00', '0.00', 2, 1, '2021-04-01 09:12:08', 0),
(172, 146, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-01', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-01 09:23:28', 0),
(173, 146, 5, 0, '4.00', '110.00', '0.00', '440.00', '2021-04-01', 2, '0.00', '440.00', '0.00', '60.69', 1, 1, '2021-04-01 09:23:36', 0),
(174, 146, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-01', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-01 09:23:53', 0),
(175, 147, 203, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-01', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-01 09:38:59', 0),
(176, 147, 176, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-01', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-01 09:39:10', 0),
(177, 147, 85, 0, '1.00', '590.00', '0.00', '590.00', '2021-04-01', 2, '560.00', '30.00', '0.00', '81.38', 1, 1, '2021-04-01 09:41:07', 0),
(178, 147, 9, 0, '1.00', '1550.00', '0.00', '1550.00', '2021-04-01', 2, '0.00', '1550.00', '0.00', '0.00', 2, 1, '2021-04-01 09:42:29', 0),
(179, 148, 170, 0, '3.00', '190.00', '0.00', '570.00', '2021-04-01', 2, '171.50', '55.50', '0.00', '78.62', 1, 1, '2021-04-01 10:01:03', 0),
(180, 149, 8, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-01', 2, '0.00', '1530.00', '0.00', '0.00', 2, 1, '2021-04-01 10:33:05', 0),
(181, 151, 141, 0, '0.50', '4760.00', '0.00', '2380.00', '2021-04-01', 2, '4670.00', '45.00', '0.00', '328.28', 1, 1, '2021-04-01 11:03:48', 0),
(182, 152, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-01', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-01 11:31:31', 0),
(183, 153, 157, 0, '10.00', '42.00', '0.00', '420.00', '2021-04-01', 2, '30.42', '115.80', '0.00', '57.93', 1, 1, '2021-04-01 12:07:00', 0),
(184, 153, 156, 0, '6.00', '45.00', '0.00', '270.00', '2021-04-01', 2, '33.33', '70.02', '0.00', '37.24', 1, 1, '2021-04-01 12:08:48', 0),
(185, 154, 170, 0, '0.50', '190.00', '0.00', '95.00', '2021-04-01', 2, '171.50', '9.25', '0.00', '13.10', 1, 1, '2021-04-01 12:40:49', 0),
(186, 156, 8, 0, '1.00', '1570.00', '0.00', '1570.00', '2021-04-01', 2, '0.00', '1570.00', '0.00', '0.00', 2, 1, '2021-04-01 13:30:27', 0),
(187, 156, 10, 0, '1.00', '1580.00', '0.00', '1580.00', '2021-04-01', 2, '0.00', '1580.00', '0.00', '0.00', 2, 1, '2021-04-01 13:40:25', 0),
(188, 156, 119, 0, '1.00', '570.00', '0.00', '570.00', '2021-04-01', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-01 13:40:59', 0),
(189, 156, 118, 0, '1.00', '570.00', '0.00', '570.00', '2021-04-01', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-01 13:41:13', 0),
(190, 156, 76, 0, '1.00', '2750.00', '0.00', '2750.00', '2021-04-01', 2, '0.00', '2750.00', '0.00', '379.31', 1, 1, '2021-04-01 13:41:42', 0),
(191, 156, 171, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-04-01', 2, '93.50', '2376.50', '0.00', '340.69', 1, 1, '2021-04-01 13:42:48', 0),
(192, 156, 37, 0, '2.00', '75.00', '0.00', '150.00', '2021-04-01', 2, '0.00', '150.00', '0.00', '20.69', 1, 1, '2021-04-01 13:43:32', 0),
(193, 156, 39, 0, '2.00', '70.00', '0.00', '140.00', '2021-04-01', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-01 13:43:41', 0),
(194, 156, 136, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-01', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-01 13:43:50', 0),
(195, 156, 164, 0, '1.00', '820.00', '0.00', '820.00', '2021-04-01', 2, '39.00', '781.00', '0.00', '113.10', 1, 1, '2021-04-01 13:44:24', 0),
(196, 156, 176, 0, '2.00', '105.00', '0.00', '210.00', '2021-04-01', 2, '0.00', '210.00', '0.00', '28.97', 1, 1, '2021-04-01 13:45:55', 0),
(197, 156, 203, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-01', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-01 13:48:08', 0),
(198, 156, 201, 0, '1.00', '155.00', '0.00', '155.00', '2021-04-01', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-04-01 13:50:01', 0),
(199, 156, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-01', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-01 13:50:54', 0),
(200, 157, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-01', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-01 13:51:15', 0),
(201, 156, 169, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-01', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-01 13:53:18', 0),
(202, 156, 138, 0, '1.00', '590.00', '0.00', '590.00', '2021-04-01', 2, '0.00', '590.00', '0.00', '0.00', 3, 1, '2021-04-01 13:54:18', 0),
(203, 156, 133, 0, '1.00', '420.00', '0.00', '420.00', '2021-04-01', 2, '0.00', '420.00', '0.00', '57.93', 1, 1, '2021-04-01 13:56:41', 0),
(204, 156, 135, 0, '1.00', '480.00', '0.00', '480.00', '2021-04-01', 2, '0.00', '480.00', '0.00', '66.21', 1, 1, '2021-04-01 13:57:00', 0),
(205, 156, 209, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-01', 2, '272.50', '77.50', '0.00', '48.28', 1, 1, '2021-04-01 13:58:00', 0),
(206, 156, 23, 0, '2.00', '200.00', '0.00', '400.00', '2021-04-01', 2, '190.00', '20.00', '0.00', '55.17', 1, 1, '2021-04-01 14:00:38', 0),
(207, 156, 204, 0, '1.00', '240.00', '0.00', '240.00', '2021-04-01', 2, '0.00', '240.00', '0.00', '33.10', 1, 1, '2021-04-01 14:01:27', 0),
(208, 156, 174, 0, '1.00', '125.00', '0.00', '125.00', '2021-04-01', 2, '112.50', '12.50', '0.00', '0.00', 0, 1, '2021-04-01 14:03:43', 0),
(209, 158, 160, 0, '1.00', '360.00', '0.00', '360.00', '2021-04-01', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-04-01 14:06:06', 0),
(210, 158, 162, 0, '1.00', '360.00', '0.00', '360.00', '2021-04-01', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-04-01 14:06:15', 0),
(211, 156, 215, 0, '6.00', '37.00', '0.00', '222.00', '2021-04-01', 2, '0.00', '222.00', '0.00', '0.00', 3, 1, '2021-04-01 14:09:44', 0),
(212, 156, 214, 0, '6.00', '47.00', '0.00', '282.00', '2021-04-01', 2, '0.00', '282.00', '0.00', '0.00', 3, 1, '2021-04-01 14:11:03', 0),
(213, 156, 141, 0, '0.50', '4760.00', '0.00', '2380.00', '2021-04-01', 2, '4670.00', '45.00', '0.00', '328.28', 1, 1, '2021-04-01 14:13:51', 0),
(214, 156, 185, 0, '2.00', '65.00', '0.00', '130.00', '2021-04-01', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-01 14:14:51', 0),
(215, 156, 216, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-01', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-01 14:18:59', 0),
(216, 156, 157, 0, '1.00', '810.00', '0.00', '810.00', '2021-04-01', 2, '30.42', '779.58', '0.00', '111.72', 1, 1, '2021-04-01 14:20:32', 0),
(217, 156, 213, 0, '1.00', '700.00', '0.00', '700.00', '2021-04-01', 2, '0.00', '700.00', '0.00', '96.55', 1, 1, '2021-04-01 14:21:12', 0),
(218, 156, 158, 0, '1.00', '860.00', '0.00', '860.00', '2021-04-01', 2, '33.33', '826.67', '0.00', '118.62', 1, 1, '2021-04-01 14:22:16', 0),
(219, 159, 140, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-01', 2, '2010.00', '140.00', '0.00', '0.00', 2, 1, '2021-04-01 14:24:00', 0),
(220, 159, 200, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-01', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-01 14:32:30', 0),
(221, 159, 121, 0, '1.00', '550.00', '0.00', '550.00', '2021-04-01', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-01 14:32:53', 0),
(222, 159, 217, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-01', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-01 14:33:43', 0),
(223, 160, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-01', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-01 14:58:37', 0),
(224, 160, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-01', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-01 14:58:46', 0),
(225, 161, 98, 0, '1.00', '520.00', '0.00', '520.00', '2021-04-01', 2, '0.00', '520.00', '0.00', '71.72', 1, 1, '2021-04-01 15:08:34', 0),
(226, 163, 218, 0, '1.00', '1440.00', '0.00', '1440.00', '2021-04-01', 2, '0.00', '1440.00', '0.00', '0.00', 2, 1, '2021-04-01 15:11:50', 0),
(227, 164, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-01', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-01 15:12:52', 0),
(228, 165, 170, 0, '2.00', '180.00', '0.00', '360.00', '2021-04-01', 2, '171.50', '17.00', '0.00', '49.66', 1, 1, '2021-04-01 15:18:50', 0),
(229, 166, 5, 0, '1.50', '110.00', '0.00', '165.00', '2021-04-01', 2, '0.00', '165.00', '0.00', '22.76', 1, 1, '2021-04-01 15:26:16', 0),
(230, 167, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-01', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-01 15:27:04', 0),
(231, 168, 5, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-01', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-01 16:14:09', 0),
(232, 169, 181, 0, '1.00', '135.00', '0.00', '135.00', '2021-04-01', 2, '128.33', '6.67', '0.00', '0.00', 2, 1, '2021-04-01 16:14:35', 0),
(233, 170, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-01', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-01 16:15:05', 0),
(234, 170, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-01', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-01 16:15:12', 0),
(235, 170, 75, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-01', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-01 16:16:56', 0),
(236, 171, 170, 0, '2.00', '190.00', '0.00', '380.00', '2021-04-02', 2, '171.50', '37.00', '0.00', '52.41', 1, 1, '2021-04-02 05:04:23', 0),
(237, 171, 183, 0, '2.00', '130.00', '0.00', '260.00', '2021-04-02', 2, '124.17', '11.66', '0.00', '0.00', 2, 1, '2021-04-02 05:05:45', 0),
(238, 171, 219, 0, '2.00', '130.00', '0.00', '260.00', '2021-04-02', 2, '0.00', '260.00', '0.00', '0.00', 2, 1, '2021-04-02 05:06:03', 0),
(239, 171, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-02', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-02 05:06:28', 0),
(240, 171, 58, 0, '1.00', '155.00', '0.00', '155.00', '2021-04-02', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-04-02 05:15:22', 0),
(241, 171, 221, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-02', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-02 05:17:29', 0),
(242, 171, 138, 0, '1.00', '65.00', '0.00', '65.00', '2021-04-02', 2, '0.00', '65.00', '0.00', '0.00', 3, 1, '2021-04-02 05:20:28', 0),
(243, 172, 47, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-02', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-02 05:22:47', 0),
(244, 172, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-02', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-02 05:22:57', 0),
(245, 173, 18, 0, '1.00', '3350.00', '0.00', '3350.00', '2021-04-02', 2, '0.00', '3350.00', '0.00', '462.07', 1, 1, '2021-04-02 05:27:45', 0),
(246, 174, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-02', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-04-02 05:30:28', 0),
(247, 175, 8, 0, '5.00', '765.00', '0.00', '3825.00', '2021-04-02', 2, '0.00', '3825.00', '0.00', '0.00', 2, 1, '2021-04-02 06:47:20', 0),
(248, 175, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-02', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-02 06:48:13', 0),
(249, 175, 78, 0, '2.00', '220.00', '0.00', '440.00', '2021-04-02', 2, '0.00', '440.00', '0.00', '60.69', 1, 1, '2021-04-02 06:50:40', 0),
(250, 175, 165, 0, '10.00', '1000.00', '0.00', '10000.00', '2021-04-02', 2, '92.80', '9072.00', '0.00', '1379.31', 1, 1, '2021-04-02 06:51:37', 0),
(251, 177, 223, 0, '3.00', '110.00', '0.00', '330.00', '2021-04-02', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-02 09:52:00', 0),
(252, 177, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-02', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-02 09:52:12', 0),
(253, 178, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-02', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-02 09:53:56', 0),
(254, 178, 206, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-02', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-02 09:54:37', 0),
(255, 178, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-02', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-02 09:55:58', 0),
(256, 179, 153, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-02', 2, '1390.00', '80.00', '0.00', '202.76', 1, 1, '2021-04-02 09:57:04', 0),
(257, 180, 170, 0, '2.00', '190.00', '0.00', '380.00', '2021-04-02', 2, '171.50', '37.00', '0.00', '52.41', 1, 1, '2021-04-02 10:01:14', 0),
(258, 181, 137, 0, '1.00', '65.00', '0.00', '65.00', '2021-04-02', 2, '0.00', '65.00', '0.00', '0.00', 3, 1, '2021-04-02 10:05:28', 0),
(259, 181, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-02', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-04-02 10:05:41', 0),
(260, 182, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-02', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-02 10:13:34', 0),
(261, 184, 171, 0, '1.00', '2450.00', '0.00', '2450.00', '2021-04-02', 2, '93.50', '2356.50', '0.00', '337.93', 1, 1, '2021-04-02 10:45:58', 0),
(262, 184, 8, 0, '1.00', '1550.00', '0.00', '1550.00', '2021-04-02', 2, '0.00', '1550.00', '0.00', '0.00', 2, 1, '2021-04-02 10:47:57', 0),
(263, 184, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-02', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-02 10:48:06', 0),
(264, 184, 224, 0, '4.00', '80.00', '0.00', '320.00', '2021-04-02', 2, '0.00', '320.00', '0.00', '44.14', 1, 1, '2021-04-02 10:50:25', 0),
(265, 184, 196, 0, '4.00', '120.00', '0.00', '480.00', '2021-04-02', 2, '0.00', '480.00', '0.00', '66.21', 1, 1, '2021-04-02 10:50:59', 0),
(266, 186, 173, 0, '1.00', '60.00', '0.00', '60.00', '2021-04-02', 2, '47.00', '13.00', '0.00', '8.28', 1, 1, '2021-04-02 11:03:48', 0),
(267, 186, 164, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-02', 2, '39.00', '22.00', '0.00', '13.79', 1, 1, '2021-04-02 11:06:32', 0),
(268, 187, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-02', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-02 11:15:39', 0),
(269, 187, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-04-02', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-02 11:15:50', 0),
(270, 187, 10, 0, '0.50', '1580.00', '0.00', '790.00', '2021-04-02', 2, '0.00', '790.00', '0.00', '0.00', 2, 1, '2021-04-02 11:16:41', 0),
(271, 188, 5, 0, '4.00', '110.00', '0.00', '440.00', '2021-04-02', 2, '0.00', '440.00', '0.00', '60.69', 1, 1, '2021-04-02 11:20:16', 0),
(272, 189, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-02', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-02 11:21:59', 0),
(273, 190, 186, 0, '2.00', '25.00', '0.00', '50.00', '2021-04-02', 2, '0.00', '50.00', '0.00', '0.00', 0, 1, '2021-04-02 11:23:58', 0),
(274, 190, 129, 0, '2.00', '46.00', '0.00', '92.00', '2021-04-02', 2, '0.00', '92.00', '0.00', '12.69', 1, 1, '2021-04-02 11:24:11', 0),
(275, 191, 172, 0, '2.00', '25.00', '0.00', '50.00', '2021-04-02', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-02 11:25:32', 0),
(276, 192, 9, 0, '0.50', '1570.00', '0.00', '785.00', '2021-04-02', 2, '0.00', '785.00', '0.00', '0.00', 2, 1, '2021-04-02 11:31:10', 0),
(277, 192, 8, 0, '0.50', '1550.00', '0.00', '775.00', '2021-04-02', 2, '0.00', '775.00', '0.00', '0.00', 2, 1, '2021-04-02 11:40:07', 0),
(278, 192, 208, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-02', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-02 11:40:29', 0),
(279, 192, 83, 0, '1.00', '180.00', '0.00', '180.00', '2021-04-02', 2, '0.00', '180.00', '0.00', '24.83', 1, 1, '2021-04-02 11:40:48', 0),
(280, 192, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-02', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-02 11:41:25', 0),
(281, 192, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-02', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-02 11:41:33', 0),
(282, 192, 200, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-02', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-02 11:42:44', 0),
(283, 192, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-02', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-02 11:42:54', 0),
(284, 192, 47, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-02', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-02 11:43:22', 0),
(285, 192, 225, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-02', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-02 11:44:30', 0),
(286, 192, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-02', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-02 11:44:47', 0),
(287, 192, 77, 0, '1.00', '2750.00', '0.00', '2750.00', '2021-04-02', 2, '0.00', '2750.00', '0.00', '379.31', 1, 1, '2021-04-02 11:45:16', 0),
(288, 193, 182, 0, '3.00', '130.00', '0.00', '390.00', '2021-04-02', 2, '120.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-02 11:46:58', 0),
(289, 193, 192, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-02', 2, '40.42', '178.74', '0.00', '0.00', 2, 1, '2021-04-02 11:47:08', 0),
(290, 193, 226, 0, '1.00', '330.00', '0.00', '330.00', '2021-04-02', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-02 11:48:00', 0),
(291, 194, 192, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-02', 2, '40.42', '238.32', '0.00', '0.00', 2, 1, '2021-04-02 11:50:41', 0),
(292, 194, 182, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-02', 2, '120.00', '10.00', '0.00', '0.00', 2, 1, '2021-04-02 11:50:55', 0),
(293, 194, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-02', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-02 11:51:07', 0),
(294, 194, 77, 0, '2.00', '120.00', '0.00', '240.00', '2021-04-02', 2, '0.00', '240.00', '0.00', '33.10', 1, 1, '2021-04-02 11:52:48', 0),
(295, 192, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-02', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-02 11:58:06', 0),
(296, 192, 138, 0, '0.50', '580.00', '0.00', '290.00', '2021-04-02', 2, '0.00', '290.00', '0.00', '0.00', 3, 1, '2021-04-02 11:58:29', 0),
(297, 192, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-02', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-02 11:59:41', 0),
(298, 192, 165, 0, '12.50', '95.20', '0.00', '1190.00', '2021-04-02', 2, '92.80', '30.00', '0.00', '164.14', 1, 1, '2021-04-02 12:00:14', 0),
(299, 192, 68, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-02', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-02 12:01:15', 0),
(300, 192, 62, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-02', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-02 12:01:26', 0),
(301, 192, 75, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-02', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-02 12:01:40', 0),
(302, 196, 170, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-02', 2, '171.50', '18.50', '0.00', '26.21', 1, 1, '2021-04-02 12:09:57', 0),
(303, 197, 118, 0, '1.00', '570.00', '0.00', '570.00', '2021-04-02', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-02 12:14:18', 0),
(304, 197, 164, 0, '0.50', '820.00', '0.00', '410.00', '2021-04-02', 2, '39.00', '390.50', '0.00', '56.55', 1, 1, '2021-04-02 12:16:38', 0),
(305, 198, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-04-02', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-02 12:33:15', 0),
(306, 199, 195, 0, '1.00', '160.00', '0.00', '160.00', '2021-04-02', 2, '0.00', '160.00', '0.00', '22.07', 1, 1, '2021-04-02 12:43:11', 0),
(307, 200, 136, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-02', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-02 12:47:05', 0),
(308, 200, 88, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-02', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-02 12:47:24', 0),
(309, 200, 227, 0, '1.00', '170.00', '0.00', '170.00', '2021-04-02', 2, '0.00', '170.00', '0.00', '23.45', 1, 1, '2021-04-02 12:49:51', 0),
(310, 203, 228, 0, '1.00', '1780.00', '0.00', '1780.00', '2021-04-02', 2, '1720.00', '60.00', '0.00', '245.52', 1, 1, '2021-04-02 12:57:16', 0),
(311, 204, 163, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-02', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-02 12:58:29', 0),
(312, 205, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-02', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-02 13:14:17', 0),
(313, 205, 192, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-02', 2, '40.42', '178.74', '0.00', '0.00', 2, 1, '2021-04-02 13:14:28', 0),
(314, 205, 130, 0, '3.00', '86.00', '0.00', '258.00', '2021-04-02', 2, '0.00', '258.00', '0.00', '35.59', 1, 1, '2021-04-02 13:14:38', 0),
(315, 205, 182, 0, '5.00', '130.00', '0.00', '650.00', '2021-04-02', 2, '120.00', '50.00', '0.00', '0.00', 2, 1, '2021-04-02 13:15:48', 0),
(316, 205, 229, 0, '1.00', '1790.00', '0.00', '1790.00', '2021-04-02', 2, '1720.00', '70.00', '0.00', '246.90', 1, 1, '2021-04-02 13:20:31', 0),
(317, 207, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-02', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-02 13:24:15', 0),
(318, 207, 192, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-02', 2, '40.42', '119.16', '0.00', '0.00', 2, 1, '2021-04-02 13:24:29', 0),
(319, 207, 183, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-02', 2, '124.17', '5.83', '0.00', '0.00', 2, 1, '2021-04-02 13:24:57', 0),
(320, 207, 5, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-02', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-02 13:25:10', 0),
(321, 207, 170, 0, '0.50', '190.00', '0.00', '95.00', '2021-04-02', 2, '171.50', '9.25', '0.00', '13.10', 1, 1, '2021-04-02 13:27:56', 0),
(322, 209, 9, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-02', 2, '0.00', '75.00', '0.00', '0.00', 2, 1, '2021-04-02 13:46:41', 0),
(323, 210, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-02', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-02 13:48:59', 0),
(324, 210, 182, 0, '2.00', '130.00', '0.00', '260.00', '2021-04-02', 2, '120.00', '20.00', '0.00', '0.00', 2, 1, '2021-04-02 13:49:11', 0),
(325, 210, 5, 0, '4.00', '110.00', '0.00', '440.00', '2021-04-02', 2, '0.00', '440.00', '0.00', '60.69', 1, 1, '2021-04-02 13:49:24', 0),
(326, 210, 230, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-02', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-02 13:49:34', 0),
(327, 211, 224, 0, '1.00', '80.00', '0.00', '80.00', '2021-04-02', 2, '0.00', '80.00', '0.00', '11.03', 1, 1, '2021-04-02 14:28:14', 0),
(328, 212, 166, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-02', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-02 14:51:46', 0),
(329, 212, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-02', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-02 14:52:00', 0),
(330, 212, 231, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-02', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-02 14:53:30', 0),
(331, 213, 219, 0, '4.00', '127.00', '0.00', '508.00', '2021-04-02', 2, '0.00', '508.00', '0.00', '0.00', 2, 1, '2021-04-02 15:00:49', 0),
(332, 214, 219, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-02', 2, '0.00', '130.00', '0.00', '0.00', 2, 1, '2021-04-02 15:04:22', 0),
(333, 215, 10, 0, '1.00', '1570.00', '0.00', '1570.00', '2021-04-02', 2, '0.00', '1570.00', '0.00', '0.00', 2, 1, '2021-04-02 15:14:06', 0),
(334, 215, 18, 0, '1.00', '3350.00', '0.00', '3350.00', '2021-04-02', 2, '0.00', '3350.00', '0.00', '462.07', 1, 1, '2021-04-02 15:14:22', 0),
(335, 215, 222, 0, '1.00', '2450.00', '0.00', '2450.00', '2021-04-02', 2, '2330.00', '120.00', '0.00', '337.93', 1, 1, '2021-04-02 15:15:08', 0),
(336, 216, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-02', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-02 15:39:43', 0),
(337, 217, 153, 0, '1.00', '1460.00', '0.00', '1460.00', '2021-04-02', 2, '1390.00', '70.00', '0.00', '201.38', 1, 1, '2021-04-02 15:56:58', 0),
(338, 217, 10, 0, '1.00', '1570.00', '0.00', '1570.00', '2021-04-02', 2, '0.00', '1570.00', '0.00', '0.00', 2, 1, '2021-04-02 15:57:07', 0),
(339, 218, 229, 0, '2.00', '1790.00', '0.00', '3580.00', '2021-04-02', 2, '1720.00', '140.00', '0.00', '493.79', 1, 1, '2021-04-02 16:07:56', 0),
(340, 219, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-03', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-03 05:25:04', 0),
(341, 222, 170, 0, '3.00', '190.00', '0.00', '570.00', '2021-04-03', 2, '171.50', '55.50', '0.00', '78.62', 1, 1, '2021-04-03 05:30:32', 0),
(342, 223, 23, 0, '2.00', '200.00', '0.00', '400.00', '2021-04-03', 2, '190.00', '20.00', '0.00', '55.17', 1, 1, '2021-04-03 06:02:21', 0),
(343, 224, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-03', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-03 06:06:04', 0),
(344, 224, 68, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-03', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-03 06:06:15', 0),
(345, 224, 62, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-03', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-03 06:06:26', 0),
(346, 224, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-03', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-03 06:06:36', 0),
(347, 224, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-03', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-03 06:06:52', 0),
(348, 225, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-03', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-03 06:10:44', 0),
(349, 225, 83, 0, '1.00', '195.00', '0.00', '195.00', '2021-04-03', 2, '0.00', '195.00', '0.00', '26.90', 1, 1, '2021-04-03 06:10:54', 0),
(350, 225, 211, 0, '1.00', '115.00', '0.00', '115.00', '2021-04-03', 2, '120.00', '-5.00', '0.00', '15.86', 1, 1, '2021-04-03 06:12:05', 0),
(351, 225, 167, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-03', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-03 06:12:27', 0),
(352, 226, 159, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-03', 2, '205.00', '45.00', '0.00', '34.48', 1, 1, '2021-04-03 06:17:57', 0),
(353, 227, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-03', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-03 06:59:09', 0),
(354, 228, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-03', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-03 07:12:22', 0),
(355, 231, 141, 0, '1.00', '4750.00', '0.00', '4750.00', '2021-04-03', 2, '4640.00', '110.00', '0.00', '655.17', 1, 1, '2021-04-03 07:58:17', 0),
(356, 232, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-03', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-03 08:36:27', 0),
(357, 233, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-03', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-04-03 08:37:12', 0),
(358, 233, 37, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-03', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-03 08:37:27', 0),
(359, 234, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-03', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-03 08:38:33', 0),
(360, 236, 23, 0, '2.00', '200.00', '0.00', '400.00', '2021-04-03', 2, '190.00', '20.00', '0.00', '55.17', 1, 1, '2021-04-03 09:24:10', 0),
(361, 236, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-03', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-03 09:24:22', 0),
(362, 236, 5, 0, '11.00', '105.00', '0.00', '1155.00', '2021-04-03', 2, '0.00', '1050.00', '0.00', '159.31', 1, 1, '2021-04-03 09:29:57', 0),
(363, 236, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-03', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-03 09:31:52', 0);
INSERT INTO `kp_sale_items` (`id`, `sale_id`, `item_id`, `uom`, `qty`, `price`, `disc`, `total`, `day`, `ret_status`, `bprice`, `profit`, `commission`, `tax`, `tax_id`, `type`, `datime`, `shop`) VALUES
(364, 236, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-03', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-03 09:32:01', 0),
(365, 237, 5, 0, '5.00', '110.00', '0.00', '550.00', '2021-04-03', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-03 09:34:06', 0),
(366, 237, 165, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-03', 2, '92.80', '36.00', '0.00', '68.97', 1, 1, '2021-04-03 09:37:50', 0),
(367, 237, 76, 0, '1.00', '145.00', '0.00', '145.00', '2021-04-03', 2, '0.00', '145.00', '0.00', '20.00', 1, 1, '2021-04-03 09:39:10', 0),
(368, 237, 65, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-03', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-03 09:39:34', 0),
(369, 237, 170, 0, '4.00', '190.00', '0.00', '760.00', '2021-04-03', 2, '171.50', '74.00', '0.00', '104.83', 1, 1, '2021-04-03 09:39:53', 0),
(370, 238, 182, 0, '3.00', '130.00', '0.00', '390.00', '2021-04-03', 2, '120.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-03 09:41:15', 0),
(371, 236, 165, 0, '10.00', '100.00', '0.00', '1000.00', '2021-04-03', 2, '92.80', '72.00', '0.00', '137.93', 1, 1, '2021-04-03 09:42:18', 0),
(372, 236, 188, 0, '1.00', '1100.00', '0.00', '1100.00', '2021-04-03', 2, '1050.00', '50.00', '0.00', '151.72', 1, 1, '2021-04-03 09:42:29', 0),
(373, 239, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-03', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-03 09:46:52', 0),
(374, 239, 141, 0, '1.00', '4750.00', '0.00', '4750.00', '2021-04-03', 2, '4640.00', '110.00', '0.00', '655.17', 1, 1, '2021-04-03 09:47:06', 0),
(375, 239, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-03', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-03 09:48:20', 0),
(376, 239, 18, 0, '1.00', '3570.00', '0.00', '3570.00', '2021-04-03', 2, '0.00', '3570.00', '0.00', '492.41', 1, 1, '2021-04-03 09:49:25', 0),
(377, 240, 10, 0, '1.00', '135.00', '0.00', '135.00', '2021-04-03', 2, '0.00', '135.00', '0.00', '0.00', 2, 1, '2021-04-03 12:25:12', 0),
(378, 240, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-03', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-03 12:25:21', 0),
(379, 240, 5, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-03', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-03 12:25:31', 0),
(380, 241, 118, 0, '1.00', '570.00', '0.00', '570.00', '2021-04-03', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-03 12:30:38', 0),
(381, 242, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-03', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-04-03 12:48:28', 0),
(382, 242, 196, 0, '3.00', '110.00', '0.00', '330.00', '2021-04-03', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-03 12:49:04', 0),
(383, 243, 165, 0, '1.00', '500.00', '0.00', '500.00', '2021-04-03', 2, '92.80', '407.20', '0.00', '68.97', 1, 1, '2021-04-03 12:53:40', 0),
(384, 243, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-03', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-04-03 12:54:43', 0),
(385, 243, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-03', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-03 12:55:06', 0),
(386, 245, 236, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-03', 2, '150.00', '50.00', '0.00', '27.59', 1, 1, '2021-04-03 12:59:14', 0),
(387, 246, 192, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-03', 2, '40.42', '59.58', '0.00', '0.00', 2, 1, '2021-04-03 13:01:23', 0),
(388, 246, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-03', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-03 13:01:30', 0),
(389, 247, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-03', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-03 13:25:55', 0),
(390, 247, 140, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-03', 2, '2010.00', '140.00', '0.00', '0.00', 2, 1, '2021-04-03 13:26:05', 0),
(391, 249, 233, 0, '1.00', '2450.00', '0.00', '2450.00', '2021-04-03', 2, '2380.00', '70.00', '0.00', '337.93', 1, 1, '2021-04-03 13:29:45', 0),
(392, 250, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-03', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-03 13:36:48', 0),
(393, 251, 140, 0, '0.50', '2150.00', '0.00', '1075.00', '2021-04-03', 2, '2010.00', '70.00', '0.00', '0.00', 2, 1, '2021-04-03 13:39:50', 0),
(394, 251, 122, 0, '1.00', '520.00', '0.00', '520.00', '2021-04-03', 2, '0.00', '520.00', '0.00', '71.72', 1, 1, '2021-04-03 13:41:35', 0),
(395, 252, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-03', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-03 13:44:20', 0),
(396, 253, 236, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-03', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-03 13:50:11', 0),
(397, 254, 86, 0, '1.00', '290.00', '0.00', '290.00', '2021-04-03', 2, '280.00', '10.00', '0.00', '40.00', 1, 1, '2021-04-03 13:53:09', 0),
(398, 255, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-03', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-04-03 13:53:48', 0),
(399, 256, 27, 0, '1.00', '205.00', '0.00', '205.00', '2021-04-03', 2, '195.00', '10.00', '0.00', '28.28', 1, 1, '2021-04-03 14:03:10', 0),
(400, 256, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-03', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-03 14:03:19', 0),
(401, 257, 159, 0, '4.00', '250.00', '0.00', '1000.00', '2021-04-03', 2, '205.00', '180.00', '0.00', '137.93', 1, 1, '2021-04-03 14:07:58', 0),
(402, 258, 165, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-03', 2, '92.80', '36.00', '0.00', '68.97', 1, 1, '2021-04-03 14:08:38', 0),
(403, 259, 164, 0, '6.00', '45.00', '0.00', '270.00', '2021-04-03', 2, '39.00', '36.00', '0.00', '37.24', 1, 1, '2021-04-03 14:21:32', 0),
(404, 260, 180, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-03', 2, '79.17', '83.32', '0.00', '0.00', 2, 1, '2021-04-03 15:14:11', 0),
(405, 260, 182, 0, '4.00', '130.00', '0.00', '520.00', '2021-04-03', 2, '120.00', '40.00', '0.00', '0.00', 2, 1, '2021-04-03 15:14:21', 0),
(406, 260, 5, 0, '3.00', '110.00', '0.00', '330.00', '2021-04-03', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-03 15:14:33', 0),
(407, 260, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-03', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-03 15:14:40', 0),
(408, 260, 206, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-03', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-03 15:14:58', 0),
(409, 261, 165, 0, '6.00', '95.00', '0.00', '570.00', '2021-04-03', 2, '92.80', '13.20', '0.00', '78.62', 1, 1, '2021-04-03 15:16:17', 0),
(410, 263, 162, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-03', 2, '320.00', '30.00', '0.00', '48.28', 1, 1, '2021-04-03 15:18:32', 0),
(411, 264, 164, 0, '0.50', '820.00', '0.00', '410.00', '2021-04-03', 2, '39.00', '390.50', '0.00', '56.55', 1, 1, '2021-04-03 15:19:23', 0),
(412, 265, 206, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-03', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-03 15:28:40', 0),
(413, 266, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-03', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-03 15:43:41', 0),
(414, 267, 5, 0, '14.00', '100.00', '0.00', '1400.00', '2021-04-03', 2, '0.00', '1400.00', '0.00', '193.10', 1, 1, '2021-04-03 15:49:52', 0),
(415, 268, 179, 0, '1.00', '1000.00', '0.00', '1000.00', '2021-04-05', 2, '950.00', '50.00', '0.00', '137.93', 1, 1, '2021-04-05 06:02:13', 0),
(416, 269, 187, 0, '1.00', '25.00', '0.00', '25.00', '2021-04-05', 2, '0.00', '25.00', '0.00', '3.45', 1, 1, '2021-04-05 06:06:26', 0),
(417, 270, 152, 0, '1.00', '1820.00', '0.00', '1820.00', '2021-04-05', 2, '1390.00', '430.00', '0.00', '251.03', 1, 1, '2021-04-05 07:43:57', 0),
(418, 271, 228, 0, '1.00', '1780.00', '0.00', '1780.00', '2021-04-05', 2, '1720.00', '60.00', '0.00', '245.52', 1, 1, '2021-04-05 07:58:54', 0),
(419, 272, 188, 0, '0.50', '1120.00', '0.00', '560.00', '2021-04-05', 2, '1050.00', '35.00', '0.00', '77.24', 1, 1, '2021-04-05 08:09:39', 0),
(420, 273, 205, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-05', 2, '47.00', '3.00', '0.00', '6.90', 1, 1, '2021-04-05 08:11:52', 0),
(421, 275, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-05', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-05 08:55:23', 0),
(422, 276, 219, 0, '3.00', '130.00', '0.00', '390.00', '2021-04-05', 2, '0.00', '390.00', '0.00', '0.00', 2, 1, '2021-04-05 09:10:49', 0),
(423, 277, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-05', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-05 09:21:47', 0),
(424, 278, 160, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-05', 2, '320.00', '30.00', '0.00', '48.28', 1, 1, '2021-04-05 09:46:59', 0),
(425, 278, 236, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-05', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-05 09:47:06', 0),
(426, 278, 8, 0, '0.50', '1580.00', '0.00', '790.00', '2021-04-05', 2, '0.00', '790.00', '0.00', '0.00', 2, 1, '2021-04-05 09:47:32', 0),
(427, 278, 179, 0, '0.50', '1000.00', '0.00', '500.00', '2021-04-05', 2, '950.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-05 09:47:42', 0),
(428, 278, 9, 0, '0.50', '1580.00', '0.00', '790.00', '2021-04-05', 2, '0.00', '790.00', '0.00', '0.00', 2, 1, '2021-04-05 09:48:09', 0),
(429, 278, 14, 0, '0.50', '2980.00', '0.00', '1490.00', '2021-04-05', 2, '1440.00', '770.00', '0.00', '0.00', 2, 1, '2021-04-05 09:48:39', 0),
(430, 278, 157, 0, '1.00', '410.00', '0.00', '410.00', '2021-04-05', 2, '30.42', '379.58', '0.00', '56.55', 1, 1, '2021-04-05 09:49:14', 0),
(431, 278, 145, 0, '1.00', '3570.00', '0.00', '3570.00', '2021-04-05', 2, '3410.00', '160.00', '0.00', '492.41', 1, 1, '2021-04-05 09:49:26', 0),
(432, 278, 58, 0, '3.00', '50.00', '0.00', '150.00', '2021-04-05', 2, '0.00', '150.00', '0.00', '20.69', 1, 1, '2021-04-05 09:49:36', 0),
(433, 278, 169, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-05', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-05 09:49:52', 0),
(434, 278, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-05', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-05 09:50:01', 0),
(435, 278, 138, 0, '0.50', '600.00', '0.00', '300.00', '2021-04-05', 2, '0.00', '300.00', '0.00', '0.00', 3, 1, '2021-04-05 09:50:26', 0),
(436, 278, 238, 0, '1.00', '125.00', '0.00', '125.00', '2021-04-05', 2, '108.00', '17.00', '0.00', '17.24', 1, 1, '2021-04-05 09:51:05', 0),
(437, 278, 176, 0, '2.00', '105.00', '0.00', '210.00', '2021-04-05', 2, '0.00', '210.00', '0.00', '28.97', 1, 1, '2021-04-05 09:52:03', 0),
(438, 278, 83, 0, '1.00', '180.00', '0.00', '180.00', '2021-04-05', 2, '0.00', '180.00', '0.00', '24.83', 1, 1, '2021-04-05 09:52:45', 0),
(439, 278, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-05', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-05 09:52:54', 0),
(440, 278, 121, 0, '1.00', '550.00', '0.00', '550.00', '2021-04-05', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-05 09:53:14', 0),
(441, 278, 123, 0, '1.00', '520.00', '0.00', '520.00', '2021-04-05', 2, '0.00', '520.00', '0.00', '71.72', 1, 1, '2021-04-05 09:53:23', 0),
(442, 278, 201, 0, '1.00', '155.00', '0.00', '155.00', '2021-04-05', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-04-05 09:53:35', 0),
(443, 278, 54, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-05', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-05 09:53:50', 0),
(444, 278, 205, 0, '4.00', '50.00', '0.00', '200.00', '2021-04-05', 2, '47.00', '12.00', '0.00', '27.59', 1, 1, '2021-04-05 09:54:06', 0),
(445, 278, 118, 0, '1.00', '570.00', '0.00', '570.00', '2021-04-05', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-05 09:54:31', 0),
(446, 278, 62, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-05', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-05 09:55:15', 0),
(447, 278, 75, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-05', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-05 09:55:24', 0),
(448, 278, 68, 0, '3.00', '105.00', '0.00', '315.00', '2021-04-05', 2, '0.00', '315.00', '0.00', '43.45', 1, 1, '2021-04-05 09:55:43', 0),
(449, 278, 135, 0, '1.00', '480.00', '0.00', '480.00', '2021-04-05', 2, '0.00', '480.00', '0.00', '66.21', 1, 1, '2021-04-05 09:56:12', 0),
(450, 278, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-05', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-05 09:56:32', 0),
(451, 278, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-05', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-05 09:56:41', 0),
(452, 278, 167, 0, '3.00', '90.00', '0.00', '270.00', '2021-04-05', 2, '0.00', '270.00', '0.00', '37.24', 1, 1, '2021-04-05 09:56:54', 0),
(453, 278, 225, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-05', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-05 09:57:04', 0),
(454, 278, 82, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-05', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-05 09:58:22', 0),
(455, 278, 194, 0, '1.00', '260.00', '0.00', '260.00', '2021-04-05', 2, '250.00', '10.00', '0.00', '35.86', 1, 1, '2021-04-05 09:58:31', 0),
(456, 278, 136, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-05', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-05 09:58:41', 0),
(457, 278, 141, 0, '0.50', '4780.00', '0.00', '2390.00', '2021-04-05', 2, '4640.00', '70.00', '0.00', '329.66', 1, 1, '2021-04-05 09:59:10', 0),
(458, 278, 166, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-05', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-05 09:59:53', 0),
(459, 278, 77, 0, '0.50', '2860.00', '0.00', '1430.00', '2021-04-05', 2, '0.00', '1430.00', '0.00', '197.24', 1, 1, '2021-04-05 10:00:21', 0),
(460, 278, 37, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-05', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-05 10:02:54', 0),
(461, 278, 216, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-05', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-05 10:03:04', 0),
(462, 279, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-05', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-05 10:14:42', 0),
(463, 279, 239, 0, '4.00', '40.00', '0.00', '160.00', '2021-04-05', 2, '0.00', '160.00', '0.00', '22.07', 1, 1, '2021-04-05 10:18:06', 0),
(464, 280, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-05', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-05 10:42:05', 0),
(465, 282, 27, 0, '1.00', '205.00', '0.00', '205.00', '2021-04-05', 2, '195.00', '10.00', '0.00', '28.28', 1, 1, '2021-04-05 11:16:03', 0),
(466, 282, 167, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-05', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-05 11:16:17', 0),
(467, 283, 121, 0, '1.00', '550.00', '0.00', '550.00', '2021-04-05', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-05 11:33:50', 0),
(468, 284, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-05', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-05 12:05:26', 0),
(469, 285, 188, 0, '1.00', '1080.00', '0.00', '1080.00', '2021-04-05', 2, '1050.00', '30.00', '0.00', '148.97', 1, 1, '2021-04-05 12:12:04', 0),
(470, 286, 182, 0, '2.00', '135.00', '0.00', '270.00', '2021-04-05', 2, '120.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-05 12:13:01', 0),
(471, 286, 164, 0, '0.50', '820.00', '0.00', '410.00', '2021-04-05', 2, '39.00', '390.50', '0.00', '56.55', 1, 1, '2021-04-05 12:13:12', 0),
(472, 286, 250, 0, '1.00', '65.00', '0.00', '65.00', '2021-04-05', 2, '0.00', '65.00', '0.00', '8.97', 1, 1, '2021-04-05 12:14:27', 0),
(473, 287, 14, 0, '1.00', '1480.00', '0.00', '1480.00', '2021-04-05', 2, '1440.00', '40.00', '0.00', '0.00', 2, 1, '2021-04-05 12:18:15', 0),
(474, 287, 10, 0, '1.00', '1570.00', '0.00', '1570.00', '2021-04-05', 2, '0.00', '1570.00', '0.00', '0.00', 2, 1, '2021-04-05 12:18:39', 0),
(475, 288, 170, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-05', 2, '171.50', '18.50', '0.00', '26.21', 1, 1, '2021-04-05 12:26:59', 0),
(476, 290, 251, 0, '1.00', '540.00', '0.00', '540.00', '2021-04-05', 2, '0.00', '540.00', '0.00', '0.00', 2, 1, '2021-04-05 12:32:27', 0),
(477, 291, 14, 0, '1.00', '1480.00', '0.00', '1480.00', '2021-04-05', 2, '1440.00', '40.00', '0.00', '0.00', 2, 1, '2021-04-05 12:33:58', 0),
(478, 292, 14, 0, '1.00', '1480.00', '0.00', '1480.00', '2021-04-05', 2, '1440.00', '40.00', '0.00', '0.00', 2, 1, '2021-04-05 12:35:23', 0),
(479, 293, 168, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-05', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-05 12:43:35', 0),
(480, 293, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-05', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-05 12:43:55', 0),
(481, 294, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-05', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-05 12:46:19', 0),
(482, 295, 5, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-05', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-05 12:47:04', 0),
(483, 295, 91, 0, '3.00', '75.00', '0.00', '225.00', '2021-04-05', 2, '0.00', '225.00', '0.00', '0.00', 0, 1, '2021-04-05 12:47:57', 0),
(484, 296, 69, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-05', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-05 13:07:29', 0),
(485, 297, 201, 0, '1.00', '155.00', '0.00', '155.00', '2021-04-05', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-04-05 13:13:40', 0),
(486, 298, 179, 0, '1.00', '1050.00', '0.00', '1050.00', '2021-04-05', 2, '950.00', '100.00', '0.00', '144.83', 1, 1, '2021-04-05 13:23:03', 0),
(487, 299, 39, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-05', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-05 13:35:41', 0),
(488, 299, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-05', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-05 13:40:57', 0),
(489, 299, 85, 0, '1.00', '590.00', '0.00', '590.00', '2021-04-05', 2, '560.00', '30.00', '0.00', '81.38', 1, 1, '2021-04-05 13:41:22', 0),
(490, 300, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-05', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-05 15:06:57', 0),
(491, 300, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-05', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-05 15:07:07', 0),
(492, 301, 92, 0, '1.00', '1270.00', '0.00', '1270.00', '2021-04-05', 2, '0.00', '1270.00', '0.00', '0.00', 0, 1, '2021-04-05 15:08:34', 0),
(493, 302, 234, 0, '0.50', '2460.00', '0.00', '1230.00', '2021-04-05', 2, '2330.00', '65.00', '0.00', '169.66', 1, 1, '2021-04-05 15:11:17', 0),
(494, 302, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-05', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-05 15:13:13', 0),
(495, 302, 252, 0, '1.00', '300.00', '0.00', '300.00', '2021-04-05', 2, '0.00', '300.00', '0.00', '41.38', 1, 1, '2021-04-05 15:13:22', 0),
(496, 302, 77, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-05', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-05 15:13:30', 0),
(497, 302, 238, 0, '1.00', '125.00', '0.00', '125.00', '2021-04-05', 2, '108.00', '17.00', '0.00', '17.24', 1, 1, '2021-04-05 15:16:47', 0),
(498, 304, 170, 0, '0.50', '200.00', '0.00', '100.00', '2021-04-05', 2, '171.50', '14.25', '0.00', '13.79', 1, 1, '2021-04-05 15:18:39', 0),
(499, 305, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-05', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-05 15:19:21', 0),
(500, 306, 165, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-05', 2, '92.80', '36.00', '0.00', '68.97', 1, 1, '2021-04-05 15:24:46', 0),
(501, 307, 14, 0, '1.00', '1490.00', '0.00', '1490.00', '2021-04-05', 2, '1440.00', '50.00', '0.00', '0.00', 2, 1, '2021-04-05 15:36:16', 0),
(502, 308, 172, 0, '1.00', '230.00', '0.00', '230.00', '2021-04-05', 2, '0.00', '230.00', '0.00', '31.72', 1, 1, '2021-04-05 15:40:17', 0),
(503, 310, 253, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-05', 2, '1980.00', '170.00', '0.00', '296.55', 1, 1, '2021-04-05 15:44:11', 0),
(504, 311, 205, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-05', 2, '47.00', '6.00', '0.00', '13.79', 1, 1, '2021-04-05 15:48:17', 0),
(505, 312, 5, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-05', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-05 15:53:27', 0),
(506, 313, 141, 0, '0.50', '4780.00', '0.00', '2390.00', '2021-04-06', 2, '4640.00', '70.00', '0.00', '329.66', 1, 1, '2021-04-06 05:24:56', 0),
(507, 314, 233, 0, '0.50', '2500.00', '0.00', '1250.00', '2021-04-06', 2, '2380.00', '60.00', '0.00', '172.41', 1, 1, '2021-04-06 05:29:15', 0),
(508, 314, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-06', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-06 05:29:27', 0),
(509, 315, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-06', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-06 05:48:30', 0),
(510, 316, 186, 0, '1.00', '25.00', '0.00', '25.00', '2021-04-06', 2, '0.00', '25.00', '0.00', '0.00', 0, 1, '2021-04-06 05:52:53', 0),
(511, 317, 5, 0, '18.00', '98.00', '0.00', '1764.00', '2021-04-06', 2, '0.00', '1764.00', '0.00', '243.31', 1, 1, '2021-04-06 06:35:01', 0),
(512, 318, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-06', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-06 06:45:51', 0),
(513, 319, 165, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-06', 2, '92.80', '36.00', '0.00', '68.97', 1, 1, '2021-04-06 08:31:28', 0),
(514, 320, 14, 0, '1.00', '1490.00', '0.00', '1490.00', '2021-04-06', 2, '1440.00', '50.00', '0.00', '0.00', 2, 1, '2021-04-06 10:19:45', 0),
(515, 321, 18, 0, '4.00', '3600.00', '0.00', '14400.00', '2021-04-06', 2, '0.00', '14400.00', '0.00', '1986.21', 1, 1, '2021-04-06 12:03:51', 0),
(516, 321, 12, 0, '5.00', '1170.00', '0.00', '5850.00', '2021-04-06', 2, '0.00', '5850.00', '0.00', '0.00', 2, 1, '2021-04-06 12:04:19', 0),
(517, 321, 242, 0, '5.00', '1530.00', '0.00', '7650.00', '2021-04-06', 2, '1470.00', '300.00', '0.00', '0.00', 2, 1, '2021-04-06 12:04:40', 0),
(518, 321, 243, 0, '4.00', '127.50', '0.00', '510.00', '2021-04-06', 2, '122.50', '20.00', '0.00', '70.34', 1, 1, '2021-04-06 12:07:08', 0),
(519, 321, 254, 0, '4.00', '97.50', '0.00', '390.00', '2021-04-06', 2, '95.00', '10.00', '0.00', '0.00', 2, 1, '2021-04-06 12:09:10', 0),
(520, 321, 5, 0, '7.00', '84.00', '0.00', '588.00', '2021-04-06', 2, '0.00', '588.00', '0.00', '81.10', 1, 1, '2021-04-06 12:09:40', 0),
(521, 321, 253, 0, '4.00', '2100.00', '0.00', '8400.00', '2021-04-06', 2, '1980.00', '480.00', '0.00', '1158.62', 1, 1, '2021-04-06 12:10:46', 0),
(522, 323, 161, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-06', 2, '205.00', '145.00', '0.00', '48.28', 1, 1, '2021-04-06 13:03:53', 0),
(523, 324, 233, 0, '1.00', '2450.00', '0.00', '2450.00', '2021-04-06', 2, '2380.00', '70.00', '0.00', '337.93', 1, 1, '2021-04-06 13:27:40', 0),
(524, 326, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-06', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-06 14:08:16', 0),
(525, 326, 62, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-06', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-06 14:08:32', 0),
(526, 326, 68, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-06', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-06 14:08:42', 0),
(527, 326, 73, 0, '1.00', '330.00', '0.00', '330.00', '2021-04-06', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-06 14:08:52', 0),
(528, 326, 67, 0, '0.50', '230.00', '0.00', '115.00', '2021-04-06', 2, '0.00', '115.00', '0.00', '15.86', 1, 1, '2021-04-06 14:10:11', 0),
(529, 327, 234, 0, '0.50', '2460.00', '0.00', '1230.00', '2021-04-06', 2, '2330.00', '65.00', '0.00', '169.66', 1, 1, '2021-04-06 14:20:35', 0),
(530, 328, 141, 0, '0.50', '4780.00', '0.00', '2390.00', '2021-04-06', 2, '4640.00', '70.00', '0.00', '329.66', 1, 1, '2021-04-06 14:26:17', 0),
(531, 329, 233, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-04-06', 2, '2380.00', '90.00', '0.00', '340.69', 1, 1, '2021-04-06 14:43:39', 0),
(532, 329, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-06', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-06 14:43:49', 0),
(533, 329, 8, 0, '0.50', '1580.00', '0.00', '790.00', '2021-04-06', 2, '0.00', '790.00', '0.00', '0.00', 2, 1, '2021-04-06 14:44:57', 0),
(534, 331, 260, 0, '2.00', '1776.00', '0.00', '3552.00', '2021-04-06', 2, '1440.00', '672.00', '0.00', '0.00', 3, 1, '2021-04-06 14:51:14', 0),
(535, 332, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-06', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-06 14:52:37', 0),
(536, 333, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-06', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-06 14:53:02', 0),
(537, 334, 5, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-06', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-06 15:00:39', 0),
(538, 335, 27, 0, '1.00', '205.00', '0.00', '205.00', '2021-04-06', 2, '195.00', '10.00', '0.00', '28.28', 1, 1, '2021-04-06 15:11:46', 0),
(539, 336, 233, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-04-06', 2, '2380.00', '90.00', '0.00', '340.69', 1, 1, '2021-04-06 15:13:21', 0),
(540, 337, 5, 0, '5.00', '110.00', '0.00', '550.00', '2021-04-06', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-06 15:14:48', 0),
(541, 338, 141, 0, '2.00', '4670.00', '0.00', '9340.00', '2021-04-06', 2, '4640.00', '60.00', '0.00', '1288.28', 1, 1, '2021-04-06 15:23:21', 0),
(542, 339, 141, 0, '2.00', '4750.00', '0.00', '9500.00', '2021-04-06', 2, '4640.00', '220.00', '0.00', '1310.34', 1, 1, '2021-04-06 15:29:18', 0),
(543, 342, 261, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-06', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-06 15:39:28', 0),
(544, 343, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-06', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-06 15:49:00', 0),
(545, 344, 233, 0, '1.00', '2450.00', '0.00', '2450.00', '2021-04-07', 2, '2380.00', '70.00', '0.00', '337.93', 1, 1, '2021-04-07 04:58:30', 0),
(546, 344, 141, 0, '0.50', '4780.00', '0.00', '2390.00', '2021-04-07', 2, '4640.00', '70.00', '0.00', '329.66', 1, 1, '2021-04-07 04:58:44', 0),
(547, 346, 262, 0, '1.00', '1090.00', '0.00', '1090.00', '2021-04-07', 2, '1030.00', '60.00', '0.00', '0.00', 2, 1, '2021-04-07 05:59:21', 0),
(548, 347, 136, 0, '1.00', '350.00', '0.00', '350.00', '2021-04-07', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-07 06:03:17', 0),
(549, 348, 165, 0, '4.00', '100.00', '0.00', '400.00', '2021-04-07', 2, '92.80', '28.80', '0.00', '55.17', 1, 1, '2021-04-07 06:34:23', 0),
(550, 349, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-07', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-07 06:42:44', 0),
(551, 350, 144, 0, '0.50', '820.00', '0.00', '410.00', '2021-04-07', 2, '780.00', '20.00', '0.00', '56.55', 1, 1, '2021-04-07 06:44:02', 0),
(552, 351, 8, 0, '1.00', '1550.00', '0.00', '1550.00', '2021-04-07', 2, '0.00', '1550.00', '0.00', '0.00', 2, 1, '2021-04-07 06:59:31', 0),
(553, 355, 165, 0, '5.00', '100.00', '0.00', '500.00', '2021-04-07', 2, '92.80', '36.00', '0.00', '68.97', 1, 1, '2021-04-07 10:05:51', 0),
(554, 355, 205, 0, '3.00', '50.00', '0.00', '150.00', '2021-04-07', 2, '47.00', '9.00', '0.00', '20.69', 1, 1, '2021-04-07 10:06:31', 0),
(555, 356, 236, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-07', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-07 10:10:48', 0),
(556, 357, 188, 0, '1.00', '1100.00', '0.00', '1100.00', '2021-04-07', 2, '1050.00', '50.00', '0.00', '151.72', 1, 1, '2021-04-07 11:40:17', 0),
(557, 358, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-07', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-07 12:24:34', 0),
(558, 358, 166, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-07', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-07 12:25:30', 0),
(559, 358, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-07', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-07 12:25:44', 0),
(560, 358, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-07', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-07 12:26:09', 0),
(561, 360, 259, 0, '1.00', '450.00', '0.00', '450.00', '2021-04-07', 2, '408.33', '41.67', '0.00', '62.07', 1, 1, '2021-04-07 12:38:16', 0),
(562, 361, 170, 0, '1.00', '180.00', '0.00', '180.00', '2021-04-07', 2, '171.50', '8.50', '0.00', '24.83', 1, 1, '2021-04-07 13:01:32', 0),
(563, 362, 180, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-07', 2, '79.17', '41.66', '0.00', '0.00', 2, 1, '2021-04-07 13:13:18', 0),
(564, 363, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-07', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-07 13:45:56', 0),
(565, 363, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-07', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-07 13:46:16', 0),
(566, 363, 182, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-07', 2, '120.00', '10.00', '0.00', '0.00', 2, 1, '2021-04-07 13:46:56', 0),
(567, 363, 180, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-07', 2, '79.17', '41.66', '0.00', '0.00', 2, 1, '2021-04-07 13:47:43', 0),
(568, 363, 137, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-07', 2, '0.00', '35.00', '0.00', '0.00', 3, 1, '2021-04-07 13:49:58', 0),
(569, 363, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-07', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-07 13:54:17', 0),
(570, 364, 75, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-07', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-07 13:59:27', 0),
(571, 364, 74, 0, '1.00', '145.00', '0.00', '145.00', '2021-04-07', 2, '0.00', '145.00', '0.00', '20.00', 1, 1, '2021-04-07 14:03:01', 0),
(572, 364, 73, 0, '1.00', '330.00', '0.00', '330.00', '2021-04-07', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-07 14:03:12', 0),
(573, 364, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-07', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-07 14:04:29', 0),
(574, 365, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-07', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-07 14:12:07', 0),
(575, 366, 5, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-07', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-07 14:37:43', 0),
(576, 367, 187, 0, '1.00', '25.00', '0.00', '25.00', '2021-04-07', 2, '0.00', '25.00', '0.00', '3.45', 1, 1, '2021-04-07 14:38:25', 0),
(577, 368, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-07', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-04-07 14:42:34', 0),
(578, 368, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-07', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-07 14:43:35', 0),
(579, 369, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-07', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-07 14:54:48', 0),
(580, 370, 141, 0, '4.00', '4750.00', '0.00', '19000.00', '2021-04-07', 2, '4640.00', '440.00', '0.00', '2620.69', 1, 1, '2021-04-07 15:15:32', 0),
(581, 371, 234, 0, '1.00', '2470.00', '0.00', '2470.00', '2021-04-07', 2, '2330.00', '140.00', '0.00', '340.69', 1, 1, '2021-04-07 15:19:11', 0),
(582, 372, 141, 0, '0.25', '4760.00', '0.00', '1190.00', '2021-04-07', 2, '4640.00', '30.00', '0.00', '164.14', 1, 1, '2021-04-07 15:22:07', 0),
(583, 373, 5, 0, '4.00', '110.00', '0.00', '440.00', '2021-04-07', 2, '0.00', '440.00', '0.00', '60.69', 1, 1, '2021-04-07 15:23:16', 0),
(584, 374, 253, 0, '0.50', '2100.00', '0.00', '1050.00', '2021-04-07', 2, '1980.00', '60.00', '0.00', '144.83', 1, 1, '2021-04-07 15:26:24', 0),
(585, 374, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-07', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-07 15:26:37', 0),
(586, 375, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-07', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-07 15:35:10', 0),
(587, 376, 194, 0, '1.00', '260.00', '0.00', '260.00', '2021-04-08', 2, '250.00', '10.00', '0.00', '35.86', 1, 1, '2021-04-08 05:14:40', 0),
(588, 377, 62, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-08', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-08 05:37:35', 0),
(589, 377, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-08', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-08 05:37:43', 0),
(590, 378, 66, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-08', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-08 05:41:21', 0),
(591, 379, 8, 0, '1.00', '1550.00', '0.00', '1550.00', '0000-00-00', 2, '0.00', '1550.00', '0.00', '0.00', 2, 1, '2021-04-08 09:39:16', 0),
(592, 379, 179, 0, '1.00', '1050.00', '0.00', '1050.00', '0000-00-00', 2, '950.00', '100.00', '0.00', '144.83', 1, 1, '2021-04-08 09:40:11', 0),
(593, 379, 135, 0, '1.00', '480.00', '0.00', '480.00', '0000-00-00', 2, '0.00', '480.00', '0.00', '66.21', 1, 1, '2021-04-08 09:41:04', 0),
(594, 379, 136, 0, '1.00', '350.00', '0.00', '350.00', '0000-00-00', 2, '0.00', '350.00', '0.00', '48.28', 1, 1, '2021-04-08 09:44:16', 0),
(595, 379, 119, 0, '1.00', '570.00', '0.00', '570.00', '0000-00-00', 2, '0.00', '570.00', '0.00', '78.62', 1, 1, '2021-04-08 09:46:00', 0),
(596, 380, 236, 0, '1.00', '190.00', '0.00', '190.00', '0000-00-00', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-08 10:18:17', 0),
(597, 381, 165, 0, '0.50', '100.00', '0.00', '50.00', '2021-04-08', 2, '92.80', '3.60', '0.00', '6.90', 1, 1, '2021-04-08 10:20:17', 0),
(598, 385, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-08', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-08 11:27:18', 0),
(599, 386, 121, 0, '1.00', '550.00', '0.00', '550.00', '2021-04-08', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-08 12:10:28', 0),
(600, 387, 218, 0, '1.00', '1430.00', '0.00', '1430.00', '2021-04-08', 2, '0.00', '1430.00', '0.00', '0.00', 2, 1, '2021-04-08 12:16:47', 0),
(601, 388, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-08', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-08 12:35:00', 0),
(602, 389, 170, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-08', 2, '171.50', '18.50', '0.00', '26.21', 1, 1, '2021-04-08 12:35:48', 0),
(603, 390, 219, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-08', 2, '0.00', '130.00', '0.00', '0.00', 2, 1, '2021-04-08 12:48:07', 0),
(604, 391, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-08', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-08 12:54:07', 0),
(605, 391, 173, 0, '1.00', '60.00', '0.00', '60.00', '2021-04-08', 2, '47.00', '13.00', '0.00', '8.28', 1, 1, '2021-04-08 12:54:17', 0),
(606, 391, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-08', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-08 12:54:27', 0),
(607, 392, 236, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-08', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-08 12:59:28', 0),
(608, 393, 258, 0, '1.00', '500.00', '0.00', '500.00', '2021-04-08', 2, '475.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-08 13:36:09', 0),
(609, 394, 170, 0, '0.50', '200.00', '0.00', '100.00', '0000-00-00', 2, '171.50', '14.25', '0.00', '13.79', 1, 1, '2021-04-08 14:27:19', 0),
(610, 395, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-08', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-08 14:34:07', 0),
(611, 395, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-08', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-08 14:34:32', 0),
(612, 395, 263, 0, '1.00', '20.00', '0.00', '20.00', '2021-04-08', 2, '0.00', '20.00', '0.00', '2.76', 1, 1, '2021-04-08 14:36:59', 0),
(613, 395, 66, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-08', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-08 14:37:24', 0),
(614, 395, 224, 0, '1.00', '80.00', '0.00', '80.00', '2021-04-08', 2, '0.00', '80.00', '0.00', '11.03', 1, 1, '2021-04-08 14:37:34', 0),
(615, 396, 178, 0, '1.00', '90.00', '0.00', '90.00', '0000-00-00', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-08 14:38:58', 0),
(616, 397, 179, 0, '0.50', '1140.00', '0.00', '570.00', '0000-00-00', 2, '950.00', '95.00', '0.00', '78.62', 1, 1, '2021-04-08 14:45:28', 0),
(617, 398, 251, 0, '1.00', '550.00', '0.00', '550.00', '0000-00-00', 2, '0.00', '550.00', '0.00', '0.00', 2, 1, '2021-04-08 14:46:30', 0),
(618, 399, 138, 0, '1.00', '590.00', '0.00', '590.00', '2021-04-08', 2, '0.00', '590.00', '0.00', '0.00', 3, 1, '2021-04-08 14:49:11', 0),
(619, 400, 5, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-08', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-08 14:51:00', 0),
(620, 401, 5, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-08', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-08 14:51:26', 0),
(621, 402, 5, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-08', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-08 14:53:03', 0),
(622, 403, 5, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-08', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-08 14:53:56', 0),
(623, 404, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-08', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-08 15:00:13', 0),
(624, 405, 254, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-08', 2, '95.00', '15.00', '0.00', '0.00', 2, 1, '2021-04-08 15:05:57', 0),
(625, 405, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-08', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-08 15:06:03', 0),
(626, 406, 27, 0, '1.00', '205.00', '0.00', '205.00', '2021-04-08', 2, '195.00', '10.00', '0.00', '28.28', 1, 1, '2021-04-08 15:06:39', 0),
(627, 407, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-08', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-08 15:19:05', 0),
(628, 407, 264, 0, '3.00', '5.00', '0.00', '15.00', '2021-04-08', 2, '0.00', '15.00', '0.00', '2.07', 1, 1, '2021-04-08 15:20:25', 0),
(629, 408, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-08', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-08 15:21:50', 0),
(630, 410, 265, 0, '1.00', '1150.00', '0.00', '1150.00', '2021-04-08', 2, '1040.00', '110.00', '0.00', '0.00', 2, 1, '2021-04-08 15:25:28', 0),
(631, 411, 5, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-08', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-04-08 15:26:35', 0),
(632, 412, 219, 0, '2.00', '120.00', '0.00', '240.00', '2021-04-08', 2, '0.00', '240.00', '0.00', '0.00', 2, 1, '2021-04-08 15:27:47', 0),
(633, 414, 266, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-08', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-08 15:29:34', 0),
(634, 415, 165, 0, '1.50', '100.00', '0.00', '150.00', '2021-04-08', 2, '92.80', '10.80', '0.00', '20.69', 1, 1, '2021-04-08 15:30:38', 0),
(635, 414, 164, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-08', 2, '39.00', '22.00', '0.00', '13.79', 1, 1, '2021-04-08 15:31:02', 0),
(636, 416, 179, 0, '0.50', '1050.00', '0.00', '525.00', '2021-04-08', 2, '950.00', '50.00', '0.00', '72.41', 1, 1, '2021-04-08 15:46:04', 0),
(637, 417, 170, 0, '0.50', '200.00', '0.00', '100.00', '2021-04-08', 2, '171.50', '14.25', '0.00', '13.79', 1, 1, '2021-04-08 15:51:01', 0),
(638, 418, 101, 0, '1.00', '520.00', '0.00', '520.00', '2021-04-09', 2, '0.00', '520.00', '0.00', '71.72', 1, 1, '2021-04-09 05:00:42', 0),
(639, 419, 165, 0, '0.25', '120.00', '0.00', '30.00', '2021-04-09', 2, '92.80', '6.80', '0.00', '4.14', 1, 1, '2021-04-09 05:08:55', 0),
(640, 421, 267, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-09', 2, '0.00', '90.00', '0.00', '0.00', 3, 1, '2021-04-09 05:26:49', 0),
(641, 423, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-09', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-04-09 06:19:43', 0),
(642, 424, 164, 0, '10.00', '42.00', '0.00', '420.00', '2021-04-09', 2, '39.00', '30.00', '0.00', '57.93', 1, 1, '2021-04-09 06:40:48', 0),
(643, 425, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-09', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-09 06:51:10', 0),
(644, 425, 200, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-09', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-09 06:51:31', 0),
(645, 425, 46, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-09', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-09 06:51:48', 0),
(646, 425, 37, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-09', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-09 06:51:56', 0),
(647, 425, 135, 0, '1.00', '480.00', '0.00', '480.00', '2021-04-09', 2, '0.00', '480.00', '0.00', '66.21', 1, 1, '2021-04-09 06:52:10', 0),
(648, 427, 166, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-09', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-09 08:07:31', 0),
(649, 427, 203, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-09', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-09 08:07:54', 0),
(650, 429, 244, 0, '0.50', '860.00', '0.00', '430.00', '2021-04-09', 2, '800.00', '30.00', '0.00', '59.31', 1, 1, '2021-04-09 08:32:36', 0),
(651, 429, 119, 0, '1.00', '520.00', '0.00', '520.00', '2021-04-09', 2, '0.00', '520.00', '0.00', '71.72', 1, 1, '2021-04-09 08:33:03', 0),
(652, 429, 38, 0, '2.00', '75.00', '0.00', '150.00', '2021-04-09', 2, '0.00', '150.00', '0.00', '20.69', 1, 1, '2021-04-09 08:33:32', 0),
(653, 431, 178, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-09', 2, '82.33', '15.34', '0.00', '24.83', 1, 1, '2021-04-09 08:42:36', 0),
(654, 432, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-09', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-09 09:07:32', 0),
(655, 434, 163, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-09', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-09 09:45:23', 0),
(656, 434, 206, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-09', 2, '0.00', '180.00', '0.00', '24.83', 1, 1, '2021-04-09 09:47:48', 0),
(657, 434, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-09', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-09 09:49:20', 0),
(658, 435, 205, 0, '1.00', '50.00', '0.00', '50.00', '2021-04-09', 2, '47.00', '3.00', '0.00', '6.90', 1, 1, '2021-04-09 10:58:32', 0),
(659, 438, 186, 0, '1.00', '25.00', '0.00', '25.00', '2021-04-09', 2, '0.00', '25.00', '0.00', '0.00', 0, 1, '2021-04-09 13:25:43', 0),
(660, 439, 170, 0, '1.00', '190.00', '0.00', '190.00', '2021-04-09', 2, '171.50', '18.50', '0.00', '26.21', 1, 1, '2021-04-09 13:44:32', 0),
(661, 440, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-09', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-09 13:51:12', 0),
(662, 441, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-09', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-09 13:57:39', 0),
(663, 442, 268, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-09', 2, '1500.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-09 14:02:26', 0),
(664, 443, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-09', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-09 14:20:37', 0),
(665, 444, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-09', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-09 14:26:01', 0),
(666, 445, 270, 0, '0.25', '1000.00', '0.00', '250.00', '2021-04-09', 2, '800.00', '50.00', '0.00', '34.48', 1, 1, '2021-04-09 14:27:15', 0),
(667, 446, 170, 0, '2.00', '190.00', '0.00', '380.00', '2021-04-09', 2, '171.50', '37.00', '0.00', '52.41', 1, 1, '2021-04-09 14:30:03', 0),
(668, 446, 187, 0, '2.00', '25.00', '0.00', '50.00', '2021-04-09', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-09 14:30:17', 0),
(669, 447, 82, 0, '3.00', '110.00', '0.00', '330.00', '2021-04-09', 2, '0.00', '110.00', '0.00', '45.52', 1, 1, '2021-04-09 14:35:48', 0),
(670, 447, 176, 0, '1.50', '105.00', '0.00', '157.50', '2021-04-09', 2, '0.00', '105.00', '0.00', '21.72', 1, 1, '2021-04-09 14:35:56', 0),
(671, 447, 166, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-09', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-09 14:39:01', 0),
(672, 447, 173, 0, '1.00', '60.00', '0.00', '60.00', '2021-04-09', 2, '47.00', '13.00', '0.00', '8.28', 1, 1, '2021-04-09 14:40:33', 0),
(673, 447, 271, 0, '1.00', '80.00', '0.00', '80.00', '2021-04-09', 2, '70.00', '10.00', '0.00', '11.03', 1, 1, '2021-04-09 14:41:39', 0),
(674, 447, 272, 0, '1.00', '30.00', '0.00', '30.00', '2021-04-09', 2, '0.00', '30.00', '0.00', '4.14', 1, 1, '2021-04-09 14:46:33', 0),
(675, 447, 181, 0, '2.00', '135.00', '0.00', '270.00', '2021-04-09', 2, '128.33', '13.34', '0.00', '0.00', 2, 1, '2021-04-09 14:46:46', 0),
(676, 447, 172, 0, '2.00', '25.00', '0.00', '50.00', '2021-04-09', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-09 14:47:15', 0),
(677, 449, 141, 0, '0.25', '4800.00', '0.00', '1200.00', '2021-04-09', 2, '4640.00', '40.00', '0.00', '165.52', 1, 1, '2021-04-09 14:54:17', 0),
(678, 450, 154, 0, '1.00', '1470.00', '0.00', '1470.00', '2021-04-09', 2, '1390.00', '80.00', '0.00', '0.00', 2, 1, '2021-04-09 14:59:25', 0),
(679, 450, 253, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-09', 2, '1980.00', '170.00', '0.00', '296.55', 1, 1, '2021-04-09 14:59:34', 0),
(680, 451, 196, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-09', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-09 15:15:37', 0),
(681, 452, 5, 0, '0.50', '120.00', '0.00', '60.00', '2021-04-09', 2, '0.00', '60.00', '0.00', '8.28', 1, 1, '2021-04-09 15:35:19', 0),
(682, 453, 27, 0, '1.00', '205.00', '0.00', '205.00', '2021-04-09', 2, '195.00', '10.00', '0.00', '28.28', 1, 1, '2021-04-09 15:44:58', 0),
(683, 455, 273, 0, '2.00', '115.00', '0.00', '230.00', '2021-04-09', 2, '86.67', '56.66', '0.00', '0.00', 2, 1, '2021-04-09 15:49:40', 0),
(684, 456, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-10', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-10 05:15:19', 0),
(685, 458, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-10', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-10 06:02:10', 0),
(686, 459, 242, 0, '1.00', '1520.00', '0.00', '1520.00', '2021-04-10', 2, '1470.00', '50.00', '0.00', '0.00', 2, 1, '2021-04-10 06:30:03', 0),
(687, 461, 274, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-10', 2, '41.67', '16.66', '0.00', '0.00', 2, 1, '2021-04-10 06:45:23', 0),
(688, 462, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-10', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-10 07:13:38', 0),
(689, 462, 5, 0, '5.00', '90.00', '0.00', '450.00', '2021-04-10', 2, '0.00', '450.00', '0.00', '62.07', 1, 1, '2021-04-10 07:13:49', 0),
(690, 463, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-10', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-10 07:18:49', 0),
(692, 465, 273, 0, '1.00', '115.00', '0.00', '115.00', '2021-04-10', 2, '86.67', '28.33', '0.00', '0.00', 2, 1, '2021-04-10 13:29:36', 0),
(693, 466, 170, 0, '3.00', '190.00', '0.00', '570.00', '2021-04-10', 2, '171.50', '55.50', '0.00', '78.62', 1, 1, '2021-04-10 13:44:18', 0),
(694, 468, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-10', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-10 13:59:40', 0),
(695, 468, 5, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-10', 2, '0.00', '300.00', '0.00', '41.38', 1, 1, '2021-04-10 14:00:16', 0),
(696, 468, 193, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-10', 2, '0.00', '90.00', '0.00', '0.00', 2, 1, '2021-04-10 14:01:02', 0),
(697, 468, 65, 0, '1.00', '135.00', '0.00', '135.00', '2021-04-10', 2, '0.00', '135.00', '0.00', '18.62', 1, 1, '2021-04-10 14:02:44', 0),
(698, 469, 77, 0, '1.00', '2750.00', '0.00', '2750.00', '2021-04-10', 2, '0.00', '2750.00', '0.00', '379.31', 1, 1, '2021-04-10 14:08:53', 0),
(699, 470, 211, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-10', 2, '120.00', '0.00', '0.00', '16.55', 1, 1, '2021-04-10 14:11:44', 0),
(700, 471, 269, 0, '1.00', '150.00', '0.00', '150.00', '2021-04-10', 2, '125.00', '25.00', '0.00', '20.69', 1, 1, '2021-04-10 14:12:23', 0),
(701, 472, 181, 0, '1.00', '135.00', '0.00', '135.00', '2021-04-10', 2, '128.33', '6.67', '0.00', '0.00', 2, 1, '2021-04-10 14:23:46', 0),
(702, 473, 170, 0, '0.50', '200.00', '0.00', '100.00', '2021-04-10', 2, '171.50', '14.25', '0.00', '13.79', 1, 1, '2021-04-10 14:25:09', 0),
(703, 474, 165, 0, '3.00', '100.00', '0.00', '300.00', '2021-04-10', 2, '92.80', '21.60', '0.00', '41.38', 1, 1, '2021-04-10 14:47:33', 0),
(704, 475, 164, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-10', 2, '39.00', '22.00', '0.00', '13.79', 1, 1, '2021-04-10 14:53:48', 0),
(705, 476, 141, 0, '1.00', '4750.00', '0.00', '4750.00', '2021-04-10', 2, '4640.00', '110.00', '0.00', '655.17', 1, 1, '2021-04-10 14:58:07', 0),
(706, 477, 259, 0, '1.00', '450.00', '0.00', '450.00', '2021-04-10', 2, '408.33', '41.67', '0.00', '62.07', 1, 1, '2021-04-10 15:08:26', 0),
(707, 478, 225, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-10', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-10 15:14:26', 0),
(708, 479, 269, 0, '1.00', '150.00', '0.00', '150.00', '2021-04-10', 2, '125.00', '25.00', '0.00', '20.69', 1, 1, '2021-04-10 15:16:29', 0),
(709, 480, 233, 0, '0.40', '2500.00', '0.00', '1000.00', '2021-04-10', 2, '2380.00', '48.00', '0.00', '137.93', 1, 1, '2021-04-10 15:27:33', 0),
(710, 480, 265, 0, '0.50', '1560.00', '0.00', '780.00', '2021-04-10', 2, '1040.00', '260.00', '0.00', '0.00', 2, 1, '2021-04-10 15:30:51', 0),
(711, 480, 16, 0, '0.50', '1560.00', '0.00', '780.00', '2021-04-10', 2, '0.00', '780.00', '0.00', '0.00', 2, 1, '2021-04-10 15:31:38', 0),
(712, 481, 165, 0, '2.00', '100.00', '0.00', '200.00', '2021-04-10', 2, '92.80', '14.40', '0.00', '27.59', 1, 1, '2021-04-10 15:32:04', 0),
(713, 482, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-10', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-10 15:33:06', 0),
(714, 482, 164, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-10', 2, '39.00', '22.00', '0.00', '13.79', 1, 1, '2021-04-10 15:33:18', 0),
(715, 483, 187, 0, '2.00', '25.00', '0.00', '50.00', '2021-04-10', 2, '0.00', '50.00', '0.00', '6.90', 1, 1, '2021-04-10 15:56:52', 0),
(716, 484, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-10', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-10 15:58:22', 0),
(717, 484, 38, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-10', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-10 15:58:33', 0),
(718, 484, 39, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-10', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-10 15:58:47', 0),
(719, 485, 179, 0, '0.50', '1060.00', '0.00', '530.00', '2021-04-10', 2, '950.00', '55.00', '0.00', '73.10', 1, 1, '2021-04-10 16:01:52', 0),
(720, 486, 239, 0, '3.00', '40.00', '0.00', '120.00', '2021-04-10', 2, '0.00', '120.00', '0.00', '16.55', 1, 1, '2021-04-10 16:12:14', 0),
(721, 487, 5, 0, '2.00', '110.00', '0.00', '220.00', '2021-04-10', 2, '0.00', '220.00', '0.00', '30.34', 1, 1, '2021-04-10 16:16:02', 0),
(722, 487, 165, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-10', 2, '92.80', '7.20', '0.00', '13.79', 1, 1, '2021-04-10 16:16:10', 0),
(723, 488, 5, 0, '5.00', '110.00', '0.00', '550.00', '2021-04-11', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-11 09:00:44', 0),
(724, 488, 189, 0, '2.00', '120.00', '0.00', '240.00', '2021-04-11', 2, '105.00', '30.00', '0.00', '33.10', 1, 1, '2021-04-11 09:00:57', 0);
INSERT INTO `kp_sale_items` (`id`, `sale_id`, `item_id`, `uom`, `qty`, `price`, `disc`, `total`, `day`, `ret_status`, `bprice`, `profit`, `commission`, `tax`, `tax_id`, `type`, `datime`, `shop`) VALUES
(725, 488, 68, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-11', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-11 09:01:08', 0),
(726, 489, 251, 0, '1.00', '540.00', '0.00', '540.00', '2021-04-11', 2, '0.00', '540.00', '0.00', '0.00', 2, 1, '2021-04-11 09:14:56', 0),
(727, 490, 5, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-11', 2, '0.00', '180.00', '0.00', '24.83', 1, 1, '2021-04-11 09:43:23', 0),
(728, 491, 268, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-11', 2, '1500.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-11 10:17:35', 0),
(729, 491, 152, 0, '1.00', '1800.00', '0.00', '1800.00', '2021-04-11', 2, '1390.00', '410.00', '0.00', '248.28', 1, 1, '2021-04-11 10:17:44', 0),
(730, 492, 5, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-11', 2, '0.00', '2150.00', '0.00', '296.55', 1, 1, '2021-04-11 10:27:00', 0),
(731, 492, 208, 0, '4.00', '35.00', '0.00', '140.00', '2021-04-11', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-11 10:27:21', 0),
(732, 492, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-11', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-11 10:27:31', 0),
(733, 492, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-11', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-11 10:27:39', 0),
(734, 492, 152, 0, '1.00', '1800.00', '0.00', '1800.00', '2021-04-11', 2, '1390.00', '410.00', '0.00', '248.28', 1, 1, '2021-04-11 10:28:04', 0),
(735, 492, 75, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-11', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-11 10:29:46', 0),
(736, 492, 68, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-11', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-11 10:30:05', 0),
(737, 492, 62, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-11', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-11 10:30:21', 0),
(738, 493, 181, 0, '1.00', '135.00', '0.00', '135.00', '2021-04-11', 2, '128.33', '6.67', '0.00', '0.00', 2, 1, '2021-04-11 10:33:21', 0),
(739, 493, 180, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-11', 2, '79.17', '20.83', '0.00', '0.00', 2, 1, '2021-04-11 10:33:45', 0),
(740, 493, 5, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-11', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-11 10:33:52', 0),
(741, 492, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-11', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-11 10:35:37', 0),
(742, 492, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-11', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-11 10:35:49', 0),
(743, 492, 138, 0, '0.50', '580.00', '0.00', '290.00', '2021-04-11', 2, '0.00', '290.00', '0.00', '0.00', 3, 1, '2021-04-11 10:50:10', 0),
(744, 492, 188, 0, '0.50', '1090.00', '0.00', '545.00', '2021-04-11', 2, '1050.00', '20.00', '0.00', '75.17', 1, 1, '2021-04-11 10:57:46', 0),
(745, 492, 84, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-11', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-11 10:58:25', 0),
(746, 492, 269, 0, '2.00', '150.00', '0.00', '300.00', '2021-04-11', 2, '125.00', '50.00', '0.00', '41.38', 1, 1, '2021-04-11 10:58:43', 0),
(747, 492, 220, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-11', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-11 10:59:02', 0),
(748, 492, 46, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-11', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-11 10:59:37', 0),
(749, 492, 200, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-11', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-11 10:59:47', 0),
(750, 492, 179, 0, '0.50', '1060.00', '0.00', '530.00', '2021-04-11', 2, '950.00', '55.00', '0.00', '73.10', 1, 1, '2021-04-11 11:00:06', 0),
(751, 492, 165, 0, '19.00', '95.60', '0.00', '1816.40', '2021-04-11', 2, '92.80', '53.20', '0.00', '250.54', 1, 1, '2021-04-11 11:29:52', 0),
(752, 492, 251, 0, '1.00', '540.00', '0.00', '540.00', '2021-04-11', 2, '0.00', '540.00', '0.00', '0.00', 2, 1, '2021-04-11 11:30:36', 0),
(753, 492, 258, 0, '1.00', '500.00', '0.00', '500.00', '2021-04-11', 2, '475.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-11 11:32:21', 0),
(754, 495, 244, 0, '0.50', '850.00', '0.00', '425.00', '2021-04-11', 2, '800.00', '25.00', '0.00', '58.62', 1, 1, '2021-04-11 11:49:16', 0),
(755, 495, 249, 0, '0.50', '850.00', '0.00', '425.00', '2021-04-11', 2, '800.00', '25.00', '0.00', '58.62', 1, 1, '2021-04-11 11:49:32', 0),
(756, 495, 203, 0, '1.00', '385.00', '0.00', '385.00', '2021-04-11', 2, '0.00', '385.00', '0.00', '53.10', 1, 1, '2021-04-11 11:49:48', 0),
(757, 495, 270, 0, '1.00', '850.00', '0.00', '850.00', '2021-04-11', 2, '800.00', '50.00', '0.00', '117.24', 1, 1, '2021-04-11 11:51:05', 0),
(758, 496, 242, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-11', 2, '1470.00', '60.00', '0.00', '0.00', 2, 1, '2021-04-11 12:04:00', 0),
(759, 496, 179, 0, '10.00', '1050.00', '0.00', '10500.00', '2021-04-11', 2, '950.00', '1000.00', '0.00', '1448.28', 1, 1, '2021-04-11 12:04:11', 0),
(760, 496, 5, 0, '1.00', '2370.00', '0.00', '2370.00', '2021-04-11', 2, '0.00', '2370.00', '0.00', '326.90', 1, 1, '2021-04-11 12:04:33', 0),
(761, 496, 152, 0, '2.00', '1800.00', '0.00', '3600.00', '2021-04-11', 2, '1390.00', '410.00', '0.00', '496.55', 1, 1, '2021-04-11 12:04:45', 0),
(762, 496, 258, 0, '1.00', '500.00', '0.00', '500.00', '2021-04-11', 2, '475.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-11 12:05:35', 0),
(763, 497, 5, 0, '1.00', '2370.00', '0.00', '2370.00', '2021-04-11', 2, '0.00', '2370.00', '0.00', '326.90', 1, 1, '2021-04-11 12:06:57', 0),
(764, 497, 152, 0, '1.00', '1800.00', '0.00', '1800.00', '2021-04-11', 2, '1390.00', '410.00', '0.00', '248.28', 1, 1, '2021-04-11 12:07:12', 0),
(765, 497, 179, 0, '1.00', '1050.00', '0.00', '1050.00', '2021-04-11', 2, '950.00', '100.00', '0.00', '144.83', 1, 1, '2021-04-11 12:07:24', 0),
(766, 497, 242, 0, '1.00', '1530.00', '0.00', '1530.00', '2021-04-11', 2, '1470.00', '60.00', '0.00', '0.00', 2, 1, '2021-04-11 12:07:38', 0),
(767, 497, 258, 0, '1.00', '500.00', '0.00', '500.00', '2021-04-11', 2, '475.00', '25.00', '0.00', '68.97', 1, 1, '2021-04-11 12:07:50', 0),
(768, 497, 269, 0, '1.00', '850.00', '0.00', '850.00', '2021-04-11', 2, '125.00', '725.00', '0.00', '117.24', 1, 1, '2021-04-11 12:08:17', 0),
(769, 498, 144, 0, '0.50', '860.00', '0.00', '430.00', '2021-04-11', 2, '780.00', '40.00', '0.00', '59.31', 1, 1, '2021-04-11 12:44:20', 0),
(770, 499, 201, 0, '1.00', '155.00', '0.00', '155.00', '2021-04-11', 2, '0.00', '155.00', '0.00', '21.38', 1, 1, '2021-04-11 12:55:07', 0),
(771, 499, 82, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-11', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-11 12:55:20', 0),
(772, 499, 239, 0, '6.00', '40.00', '0.00', '240.00', '2021-04-11', 2, '0.00', '240.00', '0.00', '33.10', 1, 1, '2021-04-11 12:55:48', 0),
(773, 499, 275, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-11', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-11 12:58:41', 0),
(774, 502, 277, 0, '1.00', '3500.00', '0.00', '3500.00', '2021-04-11', 2, '0.00', '3500.00', '0.00', '482.76', 1, 1, '2021-04-11 13:16:21', 0),
(775, 503, 275, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-11', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-11 13:21:30', 0),
(776, 504, 243, 0, '5.00', '128.00', '0.00', '640.00', '2021-04-11', 2, '122.50', '27.50', '0.00', '88.28', 1, 1, '2021-04-11 13:29:00', 0),
(777, 505, 179, 0, '1.00', '1050.00', '0.00', '1050.00', '2021-04-11', 2, '950.00', '100.00', '0.00', '144.83', 1, 1, '2021-04-11 13:36:26', 0),
(778, 506, 211, 0, '4.00', '120.00', '0.00', '480.00', '2021-04-11', 2, '120.00', '0.00', '0.00', '66.21', 1, 1, '2021-04-11 13:38:41', 0),
(779, 507, 246, 0, '1.00', '360.00', '0.00', '360.00', '2021-04-11', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-04-11 13:41:17', 0),
(780, 508, 211, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-11', 2, '120.00', '0.00', '0.00', '16.55', 1, 1, '2021-04-11 14:04:38', 0),
(781, 508, 39, 0, '1.00', '75.00', '0.00', '75.00', '2021-04-11', 2, '0.00', '75.00', '0.00', '10.34', 1, 1, '2021-04-11 14:04:51', 0),
(782, 509, 165, 0, '1.00', '1190.00', '0.00', '1190.00', '2021-04-11', 2, '92.80', '1097.20', '0.00', '164.14', 1, 1, '2021-04-11 14:05:47', 0),
(783, 509, 253, 0, '1.00', '2150.00', '0.00', '2150.00', '2021-04-11', 2, '1980.00', '170.00', '0.00', '296.55', 1, 1, '2021-04-11 14:06:00', 0),
(784, 509, 39, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-11', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-11 14:07:19', 0),
(785, 509, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-11', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-11 14:07:44', 0),
(786, 509, 121, 0, '1.00', '580.00', '0.00', '580.00', '2021-04-11', 2, '0.00', '580.00', '0.00', '80.00', 1, 1, '2021-04-11 14:08:01', 0),
(787, 509, 204, 0, '1.00', '270.00', '0.00', '270.00', '2021-04-11', 2, '0.00', '270.00', '0.00', '37.24', 1, 1, '2021-04-11 14:08:11', 0),
(788, 509, 84, 0, '1.00', '145.00', '0.00', '145.00', '2021-04-11', 2, '0.00', '145.00', '0.00', '20.00', 1, 1, '2021-04-11 14:08:21', 0),
(789, 510, 70, 0, '1.00', '280.00', '0.00', '280.00', '2021-04-12', 2, '0.00', '280.00', '0.00', '38.62', 1, 1, '2021-04-12 05:16:52', 0),
(790, 510, 23, 0, '1.00', '200.00', '0.00', '200.00', '2021-04-12', 2, '190.00', '10.00', '0.00', '27.59', 1, 1, '2021-04-12 05:17:05', 0),
(791, 511, 225, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-12', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-12 05:40:13', 0),
(792, 514, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-12', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-12 06:27:58', 0),
(793, 514, 225, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-12', 2, '0.00', '130.00', '0.00', '17.93', 1, 1, '2021-04-12 06:28:08', 0),
(794, 514, 278, 0, '1.00', '230.00', '0.00', '230.00', '2021-04-12', 2, '200.00', '30.00', '0.00', '31.72', 1, 1, '2021-04-12 06:33:55', 0),
(795, 515, 208, 0, '2.00', '35.00', '0.00', '70.00', '2021-04-12', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-12 06:36:18', 0),
(796, 515, 163, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 06:36:27', 0),
(797, 516, 139, 0, '1.00', '225.00', '0.00', '225.00', '2021-04-12', 2, '0.00', '225.00', '0.00', '0.00', 3, 1, '2021-04-12 06:46:08', 0),
(798, 517, 259, 0, '1.00', '450.00', '0.00', '450.00', '2021-04-12', 2, '408.33', '41.67', '0.00', '62.07', 1, 1, '2021-04-12 06:47:25', 0),
(799, 518, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 07:03:56', 0),
(800, 520, 274, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-12', 2, '41.67', '16.66', '0.00', '0.00', 2, 1, '2021-04-12 07:47:13', 0),
(801, 521, 179, 0, '1.00', '1050.00', '0.00', '1050.00', '2021-04-12', 2, '950.00', '100.00', '0.00', '144.83', 1, 1, '2021-04-12 08:42:07', 0),
(802, 521, 170, 0, '3.00', '185.00', '0.00', '555.00', '2021-04-12', 2, '171.50', '40.50', '0.00', '76.55', 1, 1, '2021-04-12 08:43:05', 0),
(803, 521, 189, 0, '1.00', '120.00', '0.00', '120.00', '2021-04-12', 2, '105.00', '15.00', '0.00', '16.55', 1, 1, '2021-04-12 08:44:24', 0),
(804, 521, 269, 0, '1.00', '150.00', '0.00', '150.00', '2021-04-12', 2, '125.00', '25.00', '0.00', '20.69', 1, 1, '2021-04-12 08:45:20', 0),
(805, 521, 208, 0, '1.00', '35.00', '0.00', '35.00', '2021-04-12', 2, '0.00', '35.00', '0.00', '4.83', 1, 1, '2021-04-12 08:46:17', 0),
(806, 521, 279, 0, '1.00', '230.00', '0.00', '230.00', '2021-04-12', 2, '0.00', '230.00', '0.00', '31.72', 1, 1, '2021-04-12 09:05:28', 0),
(807, 523, 144, 0, '1.00', '850.00', '0.00', '850.00', '2021-04-12', 2, '780.00', '70.00', '0.00', '117.24', 1, 1, '2021-04-12 09:07:06', 0),
(808, 527, 261, 0, '1.00', '100.00', '0.00', '100.00', '2021-04-12', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-04-12 09:42:45', 0),
(809, 528, 180, 0, '2.00', '95.00', '0.00', '190.00', '2021-04-12', 2, '79.17', '31.66', '0.00', '0.00', 2, 1, '2021-04-12 09:52:33', 0),
(810, 529, 265, 0, '0.50', '1160.00', '0.00', '580.00', '2021-04-12', 2, '1040.00', '60.00', '0.00', '0.00', 2, 1, '2021-04-12 10:05:33', 0),
(811, 530, 76, 0, '0.50', '2770.00', '0.00', '1385.00', '2021-04-12', 2, '0.00', '1385.00', '0.00', '191.03', 1, 1, '2021-04-12 10:12:06', 0),
(812, 531, 203, 0, '2.00', '55.00', '0.00', '110.00', '2021-04-12', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-12 10:18:48', 0),
(813, 532, 88, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-12', 2, '0.00', '250.00', '0.00', '34.48', 1, 1, '2021-04-12 11:18:20', 0),
(814, 533, 38, 0, '1.00', '70.00', '0.00', '70.00', '2021-04-12', 2, '0.00', '70.00', '0.00', '9.66', 1, 1, '2021-04-12 11:24:18', 0),
(815, 534, 140, 0, '0.50', '2100.00', '0.00', '1050.00', '2021-04-12', 2, '2010.00', '45.00', '0.00', '0.00', 2, 1, '2021-04-12 11:29:55', 0),
(816, 537, 186, 0, '1.00', '25.00', '0.00', '25.00', '2021-04-12', 2, '0.00', '25.00', '0.00', '0.00', 0, 1, '2021-04-12 12:52:34', 0),
(817, 538, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 12:56:55', 0),
(818, 539, 123, 0, '5.00', '530.00', '0.00', '2650.00', '2021-04-12', 2, '0.00', '2650.00', '0.00', '365.52', 1, 1, '2021-04-12 13:02:22', 0),
(819, 540, 170, 0, '1.50', '190.00', '0.00', '285.00', '2021-04-12', 2, '171.50', '27.75', '0.00', '39.31', 1, 1, '2021-04-12 13:11:38', 0),
(820, 541, 170, 0, '2.00', '190.00', '0.00', '380.00', '2021-04-12', 2, '171.50', '37.00', '0.00', '52.41', 1, 1, '2021-04-12 13:13:53', 0),
(821, 542, 166, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 13:32:58', 0),
(822, 542, 203, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 13:33:14', 0),
(823, 542, 163, 0, '1.00', '55.00', '0.00', '55.00', '2021-04-12', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-12 13:33:30', 0),
(824, 542, 255, 0, '1.00', '490.00', '0.00', '490.00', '2021-04-12', 2, '475.00', '15.00', '0.00', '67.59', 1, 1, '2021-04-12 13:33:39', 0),
(825, 542, 211, 0, '1.00', '115.00', '0.00', '115.00', '2021-04-12', 2, '120.00', '-5.00', '0.00', '15.86', 1, 1, '2021-04-12 13:34:11', 0),
(826, 543, 144, 0, '0.50', '840.00', '0.00', '420.00', '2021-04-12', 2, '780.00', '30.00', '0.00', '57.93', 1, 1, '2021-04-12 13:37:16', 0),
(827, 544, 32, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-12', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-12 13:50:44', 0),
(828, 545, 170, 0, '1.00', '185.00', '0.00', '185.00', '2021-04-12', 2, '171.50', '13.50', '0.00', '25.52', 1, 1, '2021-04-12 14:04:05', 0),
(829, 546, 68, 0, '3.00', '105.00', '0.00', '315.00', '2021-04-12', 2, '0.00', '315.00', '0.00', '43.45', 1, 1, '2021-04-12 14:07:34', 0),
(830, 546, 278, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-12', 2, '200.00', '50.00', '0.00', '34.48', 1, 1, '2021-04-12 14:07:44', 0),
(831, 547, 178, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-12', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-12 14:16:14', 0),
(832, 548, 273, 0, '2.00', '115.00', '0.00', '230.00', '2021-04-12', 2, '86.67', '56.66', '0.00', '0.00', 2, 1, '2021-04-12 14:40:09', 0),
(833, 548, 183, 0, '2.00', '130.00', '0.00', '260.00', '2021-04-12', 2, '124.17', '11.66', '0.00', '0.00', 2, 1, '2021-04-12 14:42:16', 0),
(834, 549, 5, 0, '2.00', '90.00', '0.00', '180.00', '2021-04-12', 2, '0.00', '180.00', '0.00', '24.83', 1, 1, '2021-04-12 14:43:32', 0),
(835, 550, 5, 0, '4.00', '90.00', '0.00', '360.00', '2021-04-12', 2, '0.00', '360.00', '0.00', '49.66', 1, 1, '2021-04-12 14:47:25', 0),
(836, 551, 218, 0, '1.00', '1430.00', '0.00', '1430.00', '2021-04-12', 2, '0.00', '1430.00', '0.00', '0.00', 2, 1, '2021-04-12 14:50:49', 0),
(837, 552, 269, 0, '1.00', '550.00', '0.00', '550.00', '2021-04-12', 2, '125.00', '425.00', '0.00', '75.86', 1, 1, '2021-04-12 14:59:14', 0),
(838, 553, 176, 0, '1.00', '105.00', '0.00', '105.00', '2021-04-12', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-12 15:00:19', 0),
(839, 553, 167, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-12', 2, '0.00', '90.00', '0.00', '12.41', 1, 1, '2021-04-12 15:01:01', 0),
(840, 555, 280, 0, '1.00', '130.00', '0.00', '130.00', '2021-04-12', 2, '125.00', '5.00', '0.00', '0.00', 2, 1, '2021-04-12 15:14:51', 0),
(841, 555, 5, 0, '1.00', '110.00', '0.00', '110.00', '2021-04-12', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-12 15:15:10', 0),
(842, 555, 170, 0, '0.50', '190.00', '0.00', '95.00', '2021-04-12', 2, '171.50', '9.25', '0.00', '13.10', 1, 1, '2021-04-12 15:15:23', 0),
(843, 556, 5, 0, '3.00', '110.00', '0.00', '330.00', '2021-04-12', 2, '0.00', '330.00', '0.00', '45.52', 1, 1, '2021-04-12 15:21:59', 0),
(844, 557, 273, 0, '1.00', '115.00', '0.00', '115.00', '2021-04-12', 2, '86.67', '28.33', '0.00', '0.00', 2, 1, '2021-04-12 15:24:19', 0),
(845, 558, 210, 0, '1.00', '145.00', '0.00', '145.00', '2021-04-13', 2, '135.00', '10.00', '0.00', '20.00', 1, 1, '2021-04-13 05:29:35', 0),
(846, 559, 278, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-13', 2, '200.00', '50.00', '0.00', '34.48', 1, 1, '2021-04-13 05:58:35', 0),
(847, 560, 33, 0, '1.00', '250.00', '0.00', '250.00', '2021-04-13', 2, '230.00', '20.00', '0.00', '34.48', 1, 1, '2021-04-13 06:24:05', 0),
(848, 561, 5, 0, '0.50', '110.00', '0.00', '55.00', '2021-04-13', 2, '0.00', '55.00', '0.00', '7.59', 1, 1, '2021-04-13 07:30:16', 0),
(849, 562, 274, 0, '2.00', '50.00', '0.00', '100.00', '2021-04-13', 2, '41.67', '16.66', '0.00', '0.00', 2, 1, '2021-04-13 07:43:52', 0),
(850, 563, 259, 0, '1.00', '450.00', '0.00', '450.00', '2021-04-13', 2, '408.33', '41.67', '0.00', '62.07', 1, 1, '2021-04-13 07:53:36', 0),
(851, 564, 179, 0, '0.50', '1060.00', '0.00', '530.00', '2021-04-13', 2, '950.00', '55.00', '0.00', '73.10', 1, 1, '2021-04-13 08:05:06', 0),
(852, 565, 180, 0, '1.00', '90.00', '0.00', '90.00', '2021-04-13', 2, '79.17', '10.83', '0.00', '0.00', 2, 1, '2021-04-13 08:06:45', 0),
(853, 566, 268, 3, '1.00', '1530.00', '0.00', '1530.00', '2021-04-13', 2, '1500.00', '30.00', '0.00', '0.00', 2, 1, '2021-04-13 09:52:34', 0),
(854, 566, 246, 13, '1.00', '360.00', '0.00', '360.00', '2021-04-13', 2, '320.00', '40.00', '0.00', '49.66', 1, 1, '2021-04-13 10:02:01', 0),
(856, 568, 253, 5, '1.00', '2100.00', '0.00', '2100.00', '2021-04-13', 2, '1980.00', '120.00', '0.00', '289.66', 1, 1, '2021-04-13 10:15:29', 0),
(857, 569, 50, 1, '2.00', '100.00', '0.00', '200.00', '2021-04-13', 2, '0.00', '100.00', '0.00', '27.59', 1, 2, '2021-04-13 10:20:25', 0),
(858, 570, 178, 1, '2.00', '90.00', '0.00', '180.00', '2021-04-13', 2, '82.33', '7.67', '0.00', '24.83', 1, 2, '2021-04-13 10:26:06', 0),
(859, 571, 165, 1, '10.00', '100.00', '0.00', '1000.00', '2021-04-13', 2, '92.80', '7.20', '0.00', '137.93', 1, 1, '2021-04-13 10:28:38', 0),
(867, 574, 38, 1, '3.00', '70.00', '0.00', '210.00', '2021-04-13', 2, '0.00', '70.00', '0.00', '28.97', 1, 1, '2021-04-13 11:11:09', 0),
(869, 574, 62, 1, '1.00', '110.00', '0.00', '110.00', '2021-04-13', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-13 11:15:27', 0),
(870, 574, 68, 1, '1.00', '105.00', '0.00', '105.00', '2021-04-13', 2, '0.00', '105.00', '0.00', '14.48', 1, 1, '2021-04-13 11:19:44', 0),
(871, 574, 178, 1, '1.00', '90.00', '0.00', '90.00', '2021-04-13', 2, '82.33', '7.67', '0.00', '12.41', 1, 1, '2021-04-13 11:20:16', 0),
(872, 574, 75, 1, '1.00', '110.00', '0.00', '110.00', '2021-04-13', 2, '0.00', '110.00', '0.00', '15.17', 1, 1, '2021-04-13 11:30:18', 0),
(873, 574, 121, 1, '1.00', '550.00', '0.00', '550.00', '2021-04-13', 2, '0.00', '550.00', '0.00', '75.86', 1, 1, '2021-04-13 11:33:18', 0),
(874, 574, 134, 1, '1.00', '420.00', '0.00', '420.00', '2021-04-13', 2, '0.00', '420.00', '0.00', '57.93', 1, 1, '2021-04-13 11:34:14', 0),
(875, 574, 201, 1, '1.00', '150.00', '0.00', '150.00', '2021-04-13', 2, '0.00', '150.00', '0.00', '20.69', 1, 1, '2021-04-13 11:40:05', 0),
(876, 574, 236, 1, '1.00', '190.00', '0.00', '190.00', '2021-04-13', 2, '150.00', '40.00', '0.00', '26.21', 1, 1, '2021-04-13 11:41:18', 0),
(878, 575, 5, 0, '1.00', '140.00', '0.00', '140.00', '2021-04-22', 2, '0.00', '140.00', '0.00', '19.31', 1, 1, '2021-04-22 19:03:00', 0),
(879, 576, 18, 0, '5.00', '560.00', '0.00', '2800.00', '2021-04-22', 2, '0.00', '560.00', '0.00', '386.21', 1, 2, '2021-04-22 19:59:42', 0),
(880, 577, 1, 0, '3.00', '1200.00', '0.00', '3600.00', '2021-04-23', 2, '950.00', '250.00', '0.00', '496.55', 1, 2, '2021-04-22 21:49:41', 0),
(881, 577, 8, 0, '2.00', '1250.00', '0.00', '2500.00', '2021-04-23', 2, '0.00', '1250.00', '0.00', '0.00', 2, 2, '2021-04-22 21:49:53', 0),
(883, 579, 8, 0, '5.00', '1030.00', '0.00', '5150.00', '2021-04-25', 2, '0.00', '1030.00', '0.00', '0.00', 2, 1, '2021-04-25 07:29:10', 0),
(884, 581, 3, 0, '9.00', '600.00', '0.00', '5400.00', '2021-04-25', 2, '0.00', '600.00', '0.00', '744.83', 1, 1, '2021-04-25 10:11:34', 0),
(885, 582, 6, 0, '2.00', '500.00', '0.00', '1000.00', '2021-04-25', 2, '0.00', '500.00', '0.00', '137.93', 1, 1, '2021-05-11 09:49:26', 0),
(886, 585, 2, 0, '1.00', '100.00', '0.00', '100.00', '2021-05-22', 2, '0.00', '100.00', '0.00', '13.79', 1, 1, '2021-05-22 11:14:21', 0),
(887, 586, 6, 0, '2.00', '200.00', '0.00', '400.00', '2021-05-22', 2, '0.00', '200.00', '0.00', '55.17', 1, 2, '2021-05-22 11:16:52', 0),
(888, 586, 129, 0, '1.00', '200.00', '0.00', '200.00', '2021-05-22', 2, '0.00', '200.00', '0.00', '27.59', 1, 2, '2021-05-22 11:17:05', 0),
(889, 586, 80, 0, '2.00', '50.00', '0.00', '100.00', '2021-05-22', 2, '0.00', '50.00', '0.00', '13.79', 1, 2, '2021-05-22 11:17:43', 0),
(890, 587, 2, 0, '1.00', '200.00', '0.00', '200.00', '2021-05-22', 2, '0.00', '200.00', '0.00', '27.59', 1, 1, '2021-05-22 11:31:41', 0),
(892, 588, 14, 0, '1.00', '2000.00', '0.00', '2000.00', '2021-06-07', 2, '1440.00', '560.00', '0.00', '0.00', 2, 1, '2021-06-07 11:51:54', 0),
(893, 588, 8, 0, '1.00', '3000.00', '0.00', '3000.00', '2021-06-07', 2, '0.00', '3000.00', '0.00', '0.00', 2, 1, '2021-06-07 11:52:24', 0),
(894, 588, 27, 0, '5.00', '3000.00', '0.00', '15000.00', '2021-06-07', 2, '195.00', '2805.00', '0.00', '2068.97', 1, 1, '2021-06-07 11:53:05', 0),
(895, 591, 8, 0, '1.00', '2000.00', '0.00', '2000.00', '2021-06-07', 2, '0.00', '2000.00', '0.00', '0.00', 2, 2, '2021-06-07 11:55:33', 0),
(896, 591, 2, 0, '2.00', '3000.00', '0.00', '6000.00', '2021-06-07', 2, '0.00', '3000.00', '0.00', '827.59', 1, 2, '2021-06-07 11:56:07', 0),
(897, 589, 14, 0, '2.00', '3000.00', '0.00', '6000.00', '2021-06-07', 2, '1440.00', '1560.00', '0.00', '0.00', 2, 1, '2021-06-07 12:04:47', 0),
(898, 589, 27, 0, '5.00', '500.00', '0.00', '2500.00', '2021-06-07', 2, '195.00', '305.00', '0.00', '344.83', 1, 1, '2021-06-07 12:05:31', 0),
(899, 590, 8, 0, '1.00', '2000.00', '0.00', '2000.00', '2021-06-07', 2, '0.00', '2000.00', '0.00', '0.00', 2, 2, '2021-06-07 12:08:09', 0),
(900, 592, 3, 0, '1.00', '2500.00', '0.00', '2500.00', '2021-06-10', 2, '0.00', '2500.00', '0.00', '344.83', 1, 2, '2021-06-10 09:57:58', 0),
(901, 592, 4, 0, '1.00', '2000.00', '0.00', '2000.00', '2021-06-10', 2, '0.00', '2000.00', '0.00', '275.86', 1, 2, '2021-06-10 09:58:12', 0),
(902, 592, 9, 0, '10.00', '1500.00', '0.00', '15000.00', '2021-06-10', 2, '0.00', '1500.00', '0.00', '0.00', 2, 2, '2021-06-10 09:58:27', 0),
(903, 592, 8, 0, '10.00', '1800.00', '0.00', '18000.00', '2021-06-10', 2, '0.00', '1800.00', '0.00', '0.00', 2, 2, '2021-06-10 09:58:43', 0),
(904, 592, 26, 0, '10.00', '1000.00', '0.00', '10000.00', '2021-06-10', 2, '780.00', '220.00', '0.00', '1379.31', 1, 2, '2021-06-10 09:59:44', 0),
(905, 593, 8, 0, '10.00', '500.00', '0.00', '5000.00', '2021-06-11', 2, '0.00', '500.00', '0.00', '0.00', 2, 1, '2021-06-11 08:44:50', 0),
(906, 593, 1, 0, '5.00', '1000.00', '0.00', '5000.00', '2021-06-11', 2, '950.00', '50.00', '0.00', '689.66', 1, 1, '2021-06-11 08:45:36', 0),
(907, 594, 26, 0, '1.00', '1200.00', '0.00', '1200.00', '2021-06-11', 2, '780.00', '420.00', '0.00', '165.52', 1, 2, '2021-06-11 08:47:29', 0),
(910, 597, 8, 0, '2.00', '5000.00', '220.00', '10000.00', '2021-06-17', 2, '0.00', '4780.00', '0.00', '0.00', 2, 1, '2021-06-17 11:32:27', 0),
(911, 597, 26, 0, '5.00', '1000.00', '0.00', '5000.00', '2021-06-17', 2, '780.00', '220.00', '0.00', '689.66', 1, 1, '2021-06-17 11:46:21', 0),
(914, 599, 2, 0, '2.00', '1889.00', '0.00', '3778.00', '2021-07-01', 2, '0.00', '1889.00', '0.00', '521.10', 1, 2, '2021-07-01 10:04:17', 0),
(915, 599, 21, 0, '8.00', '5702.00', '0.00', '45616.00', '2021-07-01', 2, '0.00', '5702.00', '0.00', '6291.86', 1, 2, '2021-07-01 10:05:10', 0),
(916, 599, 13, 0, '5.00', '5250.00', '0.00', '26250.00', '2021-07-01', 2, '0.00', '5250.00', '0.00', '0.00', 2, 2, '2021-07-01 10:05:51', 0),
(917, 600, 2, 0, '1.00', '1889.00', '0.00', '1889.00', '2021-07-01', 2, '0.00', '1889.00', '0.00', '260.55', 1, 2, '2021-07-01 10:13:44', 0),
(918, 601, 2, 0, '1.00', '1889.00', '0.00', '1889.00', '2021-07-01', 1, '0.00', '1889.00', '0.00', '260.55', 1, 2, '2021-07-01 10:14:47', 0),
(919, 602, 1, 0, '2.00', '2888.00', '0.00', '5776.00', '2021-07-01', 2, '950.00', '1938.00', '0.00', '796.69', 1, 1, '2021-07-01 11:37:39', 0),
(920, 602, 21, 0, '1.00', '5702.00', '0.00', '5702.00', '2021-07-01', 2, '0.00', '5702.00', '0.00', '786.48', 1, 1, '2021-07-01 11:38:41', 0),
(921, 602, 29, 0, '4.00', '840.00', '0.00', '3360.00', '2021-07-01', 2, '138.00', '702.00', '0.00', '463.45', 1, 1, '2021-07-01 11:50:51', 0),
(922, 603, 1, 0, '1.00', '2888.00', '0.00', '2888.00', '2021-07-01', 2, '950.00', '1938.00', '0.00', '398.34', 1, 2, '2021-07-01 12:00:05', 0),
(923, 603, 16, 0, '5.00', '5250.00', '0.00', '26250.00', '2021-07-01', 2, '0.00', '5250.00', '0.00', '0.00', 2, 2, '2021-07-01 12:01:30', 0),
(924, 603, 2, 0, '3.00', '1889.00', '0.00', '5667.00', '2021-07-01', 2, '0.00', '1889.00', '0.00', '781.66', 1, 2, '2021-07-01 12:03:09', 0),
(930, 604, 4, 0, '1.00', '800.00', '0.00', '800.00', '2021-07-05', 2, '500.00', '300.00', '0.00', '0.00', 2, 2, '2021-07-05 09:34:50', 0),
(931, 604, 1, 0, '14.00', '1500.00', '0.00', '21000.00', '2021-07-06', 2, '1000.00', '500.00', '0.00', '0.00', 2, 2, '2021-07-06 05:49:58', 0),
(932, 605, 2351, 0, '1.00', '650.00', '50.00', '600.00', '2021-07-06', 2, '0.00', '600.00', '0.00', '0.00', 0, 2, '2021-07-06 09:35:10', 0),
(933, 605, 2194, 0, '5.00', '2320.00', '20.00', '11500.00', '2021-07-06', 2, '0.00', '11500.00', '0.00', '0.00', 0, 2, '2021-07-06 09:35:55', 0),
(934, 605, 1177, 0, '5.00', '228.00', '0.00', '1140.00', '2021-07-06', 2, '0.00', '228.00', '0.00', '0.00', 0, 2, '2021-07-06 09:36:15', 0),
(935, 605, 2259, 0, '7.00', '776.00', '32.00', '5208.00', '2021-07-06', 2, '0.00', '5208.00', '0.00', '0.00', 0, 2, '2021-07-06 09:37:00', 0),
(936, 605, 2260, 0, '4.00', '992.00', '12.00', '3920.00', '2021-07-06', 2, '0.00', '3920.00', '0.00', '0.00', 0, 2, '2021-07-06 09:37:23', 0),
(937, 606, 1607, 0, '5.00', '1000.00', '0.00', '5000.00', '2021-07-06', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-06 09:50:39', 0),
(938, 606, 1395, 0, '5.00', '1220.00', '0.00', '6100.00', '2021-07-06', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-06 09:50:39', 0),
(939, 606, 2259, 0, '10.00', '1010.00', '0.00', '10100.00', '2021-07-06', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-06 09:50:39', 0),
(940, 598, 4, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-06', 2, '0.00', '2736.00', '0.00', '377.38', 1, 1, '2021-07-06 09:59:13', 0),
(941, 598, 52, 0, '1.00', '9120.00', '0.00', '9120.00', '2021-07-06', 2, '0.00', '9120.00', '0.00', '0.00', 0, 1, '2021-07-06 10:20:19', 0),
(942, 607, 1933, 0, '20.00', '570.00', '0.00', '11400.00', '2021-07-06', 2, '0.00', '570.00', '0.00', '0.00', 0, 1, '2021-07-06 10:29:07', 0),
(943, 608, 1, 0, '7.00', '1710.00', '0.00', '11970.00', '2021-07-06', 2, '950.00', '760.00', '0.00', '1651.03', 1, 2, '2021-07-06 10:44:36', 0),
(944, 607, 69, 0, '1.00', '52440.00', '0.00', '52440.00', '2021-07-12', 2, '0.00', '52440.00', '0.00', '0.00', 0, 1, '2021-07-12 04:53:08', 0),
(945, 609, 9, 0, '1.00', '20.00', '0.00', '20.00', '2021-07-12', 2, '0.00', '20.00', '0.00', '0.00', 2, 1, '2021-07-12 06:18:26', 0),
(946, 610, 9, 0, '1.00', '5000.00', '0.00', '5000.00', '2021-07-12', 2, '0.00', '5000.00', '0.00', '0.00', 2, 1, '2021-07-12 06:21:45', 0),
(947, 610, 13, 0, '2.00', '6000.00', '0.00', '12000.00', '2021-07-12', 2, '0.00', '6000.00', '0.00', '0.00', 2, 1, '2021-07-12 06:21:58', 0),
(948, 611, 115, 0, '1.00', '45.00', '0.00', '45.00', '2021-07-13', 2, '0.00', '45.00', '0.00', '0.00', 0, 2, '2021-07-13 15:39:53', 0),
(949, 612, 4, 0, '1.00', '6789.00', '0.00', '6789.00', '2021-07-13', 2, '0.00', '6789.00', '0.00', '936.41', 1, 2, '2021-07-13 19:31:33', 0),
(950, 612, 14, 0, '5.00', '654.00', '0.00', '3270.00', '2021-07-13', 2, '1440.00', '-786.00', '0.00', '0.00', 2, 2, '2021-07-13 19:31:44', 0),
(951, 612, 11, 0, '6.00', '6000.00', '0.00', '36000.00', '2021-07-13', 2, '0.00', '6000.00', '0.00', '0.00', 2, 2, '2021-07-13 19:31:53', 0),
(952, 611, 6, 0, '56.00', '680.00', '0.00', '38080.00', '2021-07-13', 2, '0.00', '680.00', '0.00', '5252.41', 1, 2, '2021-07-13 20:04:13', 0),
(953, 611, 72, 0, '5.00', '600.00', '0.00', '3000.00', '2021-07-13', 2, '0.00', '600.00', '0.00', '413.79', 1, 2, '2021-07-13 20:04:22', 0),
(954, 613, 7, 0, '1.00', '67.00', '0.00', '67.00', '2021-07-13', 2, '0.00', '67.00', '0.00', '9.24', 1, 2, '2021-07-13 20:17:30', 0),
(955, 613, 6, 0, '5.00', '2736.00', '0.00', '13680.00', '2021-07-13', 2, '0.00', '2736.00', '0.00', '1886.90', 1, 2, '2021-07-13 20:17:36', 0),
(956, 614, 462, 0, '1.00', '2280.00', '0.00', '2280.00', '2021-07-13', 2, '0.00', '2280.00', '0.00', '0.00', 0, 2, '2021-07-13 20:27:19', 0),
(957, 614, 601, 0, '67.00', '12768.00', '0.00', '855456.00', '2021-07-13', 2, '0.00', '12768.00', '0.00', '0.00', 0, 2, '2021-07-13 20:27:25', 0),
(958, 576, 7, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-04-22', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-07-15 06:19:55', 0),
(959, 576, 71, 0, '1.00', '75240.00', '0.00', '75240.00', '2021-04-22', 2, '0.00', '75240.00', '0.00', '0.00', 0, 2, '2021-07-15 06:20:02', 0),
(960, 611, 121, 0, '1.00', '103.00', '0.00', '103.00', '2021-07-15', 2, '0.00', '103.00', '0.00', '14.21', 1, 2, '2021-07-15 06:54:45', 0),
(961, 611, 178, 0, '2.00', '798.00', '0.00', '1596.00', '2021-07-15', 2, '0.00', '798.00', '0.00', '0.00', 0, 2, '2021-07-15 06:57:41', 0),
(962, 616, 120, 0, '1.00', '80.00', '0.00', '80.00', '2021-07-15', 2, '0.00', '80.00', '0.00', '0.00', 0, 1, '2021-07-15 07:22:16', 0),
(963, 616, 21, 0, '5.00', '912.00', '0.00', '4560.00', '2021-07-15', 2, '0.00', '912.00', '0.00', '628.97', 1, 1, '2021-07-15 07:22:23', 0),
(964, 613, 267, 0, '1.00', '77520.00', '0.00', '77520.00', '2021-07-13', 2, '0.00', '77520.00', '0.00', '0.00', 0, 2, '2021-07-17 14:52:20', 0),
(965, 580, 70, 0, '1.00', '68400.00', '0.00', '68400.00', '2021-04-25', 2, '0.00', '68400.00', '0.00', '9434.48', 1, 1, '2021-07-17 15:33:40', 0),
(966, 580, 9, 0, '3.00', '2736.00', '0.00', '8208.00', '2021-04-25', 2, '0.00', '2736.00', '0.00', '0.00', 2, 1, '2021-07-17 15:33:49', 0),
(967, 617, 4, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-17', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-07-17 16:08:25', 0),
(968, 617, 2, 0, '10.00', '2736.00', '0.00', '27360.00', '2021-07-17', 2, '0.00', '27360.00', '0.00', '3773.79', 1, 2, '2021-07-17 16:08:30', 0),
(969, 617, 19, 0, '3.00', '912.00', '0.00', '2736.00', '2021-07-17', 2, '0.00', '912.00', '0.00', '377.38', 1, 2, '2021-07-17 16:08:46', 0),
(970, 618, 5, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-22', 2, '0.00', '2736.00', '0.00', '377.38', 1, 1, '2021-07-22 04:48:56', 0),
(971, 618, 18, 0, '1.00', '912.00', '0.00', '912.00', '2021-07-22', 2, '0.00', '912.00', '0.00', '125.79', 1, 1, '2021-07-22 04:49:05', 0),
(972, 619, 2, 0, '1.00', '3000.00', '0.00', '3000.00', '2021-07-22', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-22 07:30:53', 0),
(973, 620, 1, 0, '10.00', '1500.00', '0.00', '15000.00', '2021-07-22', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-22 07:34:14', 0),
(974, 620, 2, 0, '4.00', '1500.00', '0.00', '6000.00', '2021-07-22', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-07-22 07:34:14', 0),
(975, 621, 6, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-22', 2, '500.00', '2236.00', '0.00', '377.38', 1, 1, '2021-07-22 13:25:53', 0),
(976, 622, 5, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-22', 2, '0.00', '2736.00', '0.00', '377.38', 1, 1, '2021-07-22 13:27:20', 0),
(977, 623, 4, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-07-22', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-07-22 13:28:34', 0),
(978, 624, 120, 0, '1.00', '80.00', '0.00', '80.00', '2021-07-23', 2, '0.00', '80.00', '0.00', '0.00', 0, 1, '2021-07-23 19:40:54', 0),
(979, 625, 7, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-08-06 09:07:02', 0),
(980, 625, 3, 0, '3.00', '3990.00', '0.00', '11970.00', '2021-08-06', 2, '0.00', '3990.00', '0.00', '1651.03', 1, 2, '2021-08-06 09:07:14', 0),
(981, 625, 4, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-08-06 09:07:32', 0),
(982, 625, 8, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '150.00', '2586.00', '0.00', '0.00', 2, 2, '2021-08-06 09:07:37', 0),
(983, 625, 9, 0, '2.00', '2736.00', '0.00', '5472.00', '2021-08-06', 2, '233.00', '2503.00', '0.00', '0.00', 2, 2, '2021-08-06 09:07:43', 0),
(984, 625, 69, 0, '1.00', '52440.00', '0.00', '52440.00', '2021-08-06', 2, '500.00', '51940.00', '0.00', '0.00', 0, 2, '2021-08-06 09:08:05', 0),
(985, 625, 70, 0, '1.00', '68400.00', '0.00', '68400.00', '2021-08-06', 2, '125.00', '68275.00', '0.00', '9434.48', 1, 2, '2021-08-06 09:08:11', 0),
(986, 625, 71, 0, '1.00', '75240.00', '0.00', '75240.00', '2021-08-06', 2, '0.00', '75240.00', '0.00', '0.00', 0, 2, '2021-08-06 09:08:16', 0),
(987, 625, 12, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '0.00', 2, 2, '2021-08-06 09:08:25', 0),
(988, 625, 76, 0, '11.00', '148200.00', '0.00', '1630200.00', '2021-08-06', 2, '0.00', '148200.00', '0.00', '0.00', 0, 2, '2021-08-06 09:10:04', 0),
(989, 625, 77, 0, '2.00', '171000.00', '0.00', '342000.00', '2021-08-06', 2, '0.00', '171000.00', '0.00', '47172.41', 1, 2, '2021-08-06 09:10:11', 0),
(990, 625, 103, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '377.38', 1, 2, '2021-08-06 09:10:28', 0),
(991, 625, 114, 0, '2.00', '2280.00', '0.00', '4560.00', '2021-08-06', 2, '0.00', '2280.00', '0.00', '628.97', 1, 2, '2021-08-06 09:10:45', 0),
(992, 625, 120, 0, '1.00', '80.00', '0.00', '80.00', '2021-08-06', 2, '0.00', '80.00', '0.00', '0.00', 0, 2, '2021-08-06 09:11:11', 0),
(993, 625, 121, 0, '1.00', '103.00', '0.00', '103.00', '2021-08-06', 2, '0.00', '103.00', '0.00', '14.21', 1, 2, '2021-08-06 09:11:20', 0),
(994, 625, 122, 0, '1.00', '114.00', '0.00', '114.00', '2021-08-06', 2, '0.00', '114.00', '0.00', '0.00', 0, 2, '2021-08-06 09:11:29', 0),
(995, 625, 123, 0, '1.00', '137.00', '0.00', '137.00', '2021-08-06', 2, '0.00', '137.00', '0.00', '18.90', 1, 2, '2021-08-06 09:11:38', 0),
(996, 625, 2, 0, '2.00', '2736.00', '0.00', '5472.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '754.76', 1, 2, '2021-08-06 09:11:43', 0),
(997, 625, 13, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '2736.00', '0.00', '0.00', 2, 2, '2021-08-06 09:11:48', 0),
(998, 625, 14, 0, '1.00', '14820.00', '0.00', '14820.00', '2021-08-06', 2, '1440.00', '13380.00', '0.00', '0.00', 2, 2, '2021-08-06 09:11:58', 0),
(999, 625, 38, 0, '1.00', '4104.00', '0.00', '4104.00', '2021-08-06', 2, '0.00', '4104.00', '0.00', '566.07', 1, 2, '2021-08-06 09:13:26', 0),
(1000, 625, 72, 0, '1.00', '125400.00', '0.00', '125400.00', '2021-08-06', 2, '0.00', '125400.00', '0.00', '17296.55', 1, 2, '2021-08-06 09:13:49', 0),
(1001, 625, 31, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-06', 2, '395.00', '2341.00', '0.00', '377.38', 1, 2, '2021-08-06 09:13:59', 0),
(1002, 625, 15, 0, '1.00', '627.00', '0.00', '627.00', '2021-08-06', 2, '0.00', '627.00', '0.00', '0.00', 2, 2, '2021-08-06 09:14:15', 0),
(1003, 625, 20, 0, '3.00', '912.00', '0.00', '2736.00', '2021-08-06', 2, '0.00', '912.00', '0.00', '377.38', 1, 2, '2021-08-06 11:49:42', 0),
(1004, 625, 312, 0, '1.00', '570.00', '0.00', '570.00', '2021-08-06', 2, '0.00', '570.00', '0.00', '0.00', 0, 2, '2021-08-06 11:50:35', 0),
(1005, 625, 52, 0, '1.00', '9120.00', '0.00', '9120.00', '2021-08-06', 2, '0.00', '9120.00', '0.00', '0.00', 0, 2, '2021-08-06 11:50:44', 0),
(1006, 625, 29, 0, '1.00', '102600.00', '0.00', '102600.00', '2021-08-06', 2, '138.00', '102462.00', '0.00', '14151.72', 1, 2, '2021-08-06 11:51:17', 0),
(1007, 625, 41, 0, '1.00', '2280.00', '0.00', '2280.00', '2021-08-06', 2, '0.00', '2280.00', '0.00', '0.00', 0, 2, '2021-08-06 11:51:27', 0),
(1008, 625, 173, 0, '1.00', '1596.00', '0.00', '1596.00', '2021-08-06', 2, '0.00', '1596.00', '0.00', '220.14', 1, 2, '2021-08-06 11:51:46', 0),
(1009, 625, 186, 0, '1.00', '35.00', '0.00', '35.00', '2021-08-06', 2, '0.00', '35.00', '0.00', '4.83', 1, 2, '2021-08-06 11:52:06', 0),
(1010, 626, 5, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-18', 2, '0.00', '2736.00', '0.00', '377.38', 1, 1, '2021-08-18 18:55:12', 1),
(1011, 626, 19, 0, '8.00', '912.00', '0.00', '7296.00', '2021-08-18', 2, '45.00', '867.00', '0.00', '1006.34', 1, 1, '2021-08-18 18:55:53', 1),
(1013, 626, 21, 0, '1.00', '912.00', '0.00', '912.00', '2021-08-18', 2, '0.00', '912.00', '0.00', '125.79', 1, 1, '2021-08-18 18:57:24', 1),
(1014, 626, 120, 0, '5.00', '80.00', '0.00', '400.00', '2021-08-18', 2, '0.00', '80.00', '0.00', '0.00', 0, 1, '2021-08-18 18:57:36', 1),
(1015, 626, 508, 0, '1.00', '3420.00', '0.00', '3420.00', '2021-08-18', 2, '0.00', '3420.00', '0.00', '0.00', 0, 1, '2021-08-18 18:57:41', 1),
(1016, 627, 84, 0, '1.00', '12768.00', '0.00', '12768.00', '2021-08-18', 2, '678.00', '12090.00', '0.00', '1761.10', 1, 2, '2021-08-18 19:18:46', 2),
(1017, 627, 21, 0, '1.00', '912.00', '0.00', '912.00', '2021-08-18', 2, '0.00', '912.00', '0.00', '125.79', 1, 2, '2021-08-18 19:18:51', 2),
(1018, 627, 14, 0, '1.00', '14820.00', '0.00', '14820.00', '2021-08-18', 2, '1440.00', '13380.00', '0.00', '0.00', 2, 2, '2021-08-18 19:18:56', 2),
(1019, 627, 17, 0, '7.00', '912.00', '0.00', '6384.00', '2021-08-18', 2, '150.00', '762.00', '0.00', '0.00', 2, 2, '2021-08-18 19:19:03', 2),
(1020, 628, 8, 0, '1.00', '2736.00', '0.00', '2736.00', '2021-08-18', 2, '150.00', '2586.00', '0.00', '0.00', 2, 2, '2021-08-18 19:21:10', 2),
(1021, 628, 21, 0, '4.00', '912.00', '0.00', '3648.00', '2021-08-18', 2, '0.00', '912.00', '0.00', '503.17', 1, 2, '2021-08-18 19:21:15', 2),
(1022, 628, 15, 0, '7.00', '627.00', '0.00', '4389.00', '2021-08-18', 2, '0.00', '627.00', '0.00', '0.00', 2, 2, '2021-08-18 19:21:22', 2),
(1023, 629, 1391, 0, '1.00', '470.00', '0.00', '470.00', '2021-08-25', 2, '0.00', '470.00', '0.00', '0.00', 0, 2, '2021-08-25 12:06:56', 2),
(1024, 630, 34, 0, '1.00', '6000.00', '0.00', '6000.00', '2021-08-25', 2, '270.00', '5730.00', '0.00', '827.59', 1, 1, '2021-08-25 12:09:30', 2),
(1025, 631, 332, 0, '1.00', '570.00', '0.00', '570.00', '2021-08-25', 2, '0.00', '570.00', '0.00', '0.00', 0, 1, '2021-08-25 12:13:50', 1),
(1026, 632, 1, 0, '5.00', '1450.00', '0.00', '7250.00', '2021-08-26', 2, '1000.00', '450.00', '0.00', '1000.00', 1, 2, '2021-08-26 12:40:06', 2),
(1027, 632, 2, 0, '10.00', '2500.00', '0.00', '25000.00', '2021-08-26', 2, '2000.00', '500.00', '0.00', '3448.28', 1, 2, '2021-08-26 12:40:25', 2),
(1028, 632, 4, 0, '10.00', '850.00', '0.00', '8500.00', '2021-08-26', 2, '350.00', '500.00', '0.00', '1172.41', 1, 2, '2021-08-26 12:40:38', 2),
(1029, 633, 1, 0, '2.00', '1450.00', '0.00', '2900.00', '2021-08-26', 2, '1000.00', '450.00', '0.00', '400.00', 1, 2, '2021-08-26 12:58:55', 2),
(1030, 634, 1, 0, '1.00', '1450.00', '0.00', '1450.00', '2021-08-26', 2, '1000.00', '450.00', '0.00', '200.00', 1, 2, '2021-08-26 12:59:41', 2),
(1031, 634, 2, 0, '1.00', '2500.00', '0.00', '2500.00', '2021-08-26', 2, '2000.00', '500.00', '0.00', '344.83', 1, 2, '2021-08-26 12:59:50', 2),
(1032, 634, 3, 0, '2.00', '1750.00', '0.00', '3500.00', '2021-08-26', 2, '1200.00', '550.00', '0.00', '482.76', 1, 2, '2021-08-26 12:59:59', 2),
(1033, 635, 23, 0, '3.00', '780.00', '0.00', '2340.00', '2021-08-27', 2, '530.00', '250.00', '0.00', '0.00', 2, 2, '2021-08-27 11:32:00', 1),
(1034, 635, 19, 0, '5.00', '900.00', '0.00', '4500.00', '2021-08-27', 2, '530.00', '370.00', '0.00', '0.00', 2, 2, '2021-08-27 11:32:21', 1),
(1035, 636, 38, 0, '9.00', '1000.00', '0.00', '9000.00', '2021-08-27', 2, '530.00', '470.00', '0.00', '0.00', 2, 2, '2021-08-27 11:33:26', 1),
(1036, 637, 7, 0, '5.00', '2000.00', '0.00', '10000.00', '2021-08-27', 2, '530.00', '1470.00', '0.00', '0.00', 2, 2, '2021-08-27 11:37:57', 1),
(1037, 638, 54, 0, '5.00', '800.00', '0.00', '4000.00', '2021-08-27', 2, '530.00', '270.00', '0.00', '0.00', 2, 2, '2021-08-27 11:39:07', 1),
(1038, 639, 33, 0, '1.00', '790.00', '0.00', '790.00', '2021-08-27', 2, '530.00', '260.00', '0.00', '0.00', 2, 2, '2021-08-27 11:56:29', 2),
(1039, 640, 1, 0, '1.00', '1450.00', '0.00', '1450.00', '2021-08-30', 2, '1000.00', '450.00', '0.00', '200.00', 1, 2, '2021-08-30 15:02:19', 1),
(1040, 640, 2, 0, '54.00', '2500.00', '0.00', '135000.00', '2021-08-30', 2, '2000.00', '500.00', '0.00', '18620.69', 1, 2, '2021-08-30 15:02:34', 1),
(1041, 640, 3, 0, '10.00', '1750.00', '0.00', '17500.00', '2021-08-30', 2, '1200.00', '550.00', '0.00', '2413.79', 1, 2, '2021-08-30 15:02:47', 1),
(1042, 640, 4, 0, '4.00', '850.00', '0.00', '3400.00', '2021-08-30', 2, '350.00', '500.00', '0.00', '468.97', 1, 2, '2021-08-30 15:03:03', 1),
(1043, 641, 1, 0, '1.00', '1450.00', '0.00', '1450.00', '2021-08-30', 2, '1800.00', '-350.00', '0.00', '200.00', 1, 1, '2021-08-30 16:17:41', 2),
(1046, 643, 7, 0, '1.00', '780.00', '0.00', '780.00', '2021-08-31', 2, '530.00', '250.00', '0.00', '0.00', 2, 2, '2021-08-31 10:44:57', 2),
(1047, 644, 1, 0, '1.00', '750.00', '0.00', '750.00', '2021-08-31', 2, '0.00', '750.00', '0.00', '103.45', 1, 2, '2021-08-31 10:47:01', 1),
(1048, 644, 24, 0, '5.00', '790.00', '0.00', '3950.00', '2021-08-31', 2, '530.00', '260.00', '0.00', '0.00', 2, 2, '2021-08-31 10:47:20', 1),
(1049, 644, 32, 0, '9.00', '800.00', '0.00', '7200.00', '2021-08-31', 2, '530.00', '270.00', '0.00', '0.00', 2, 2, '2021-08-31 10:47:36', 1),
(1050, 643, 42, 0, '10.00', '800.00', '0.00', '8000.00', '2021-08-31', 2, '530.00', '270.00', '0.00', '0.00', 2, 2, '2021-08-31 10:51:51', 2),
(1051, 645, 54, 0, '9.00', '800.00', '0.00', '7200.00', '2021-08-31', 2, '530.00', '270.00', '0.00', '0.00', 2, 2, '2021-08-31 12:14:49', 2),
(1052, 646, 53, 0, '10.00', '790.00', '0.00', '7900.00', '2021-08-31', 2, '530.00', '260.00', '0.00', '0.00', 2, 2, '2021-08-31 12:16:04', 2),
(1053, 647, 5, 0, '1.00', '790.00', '0.00', '790.00', '2021-08-31', 2, '620.00', '170.00', '0.00', '108.97', 1, 2, '2021-08-31 12:17:06', 2),
(1054, 649, 28, 0, '6.00', '850.00', '0.00', '5100.00', '2021-08-31', 2, NULL, NULL, NULL, '0.00', 0, NULL, '2021-08-31 12:32:20', 0),
(1056, 650, 100, 0, '2.00', '5300.00', '0.00', '10600.00', '2021-08-31', 2, '5300.00', '0.00', '0.00', '0.00', 2, 2, '2021-08-31 13:53:27', 1),
(1057, 652, 40, 0, '10.00', '2000.00', '0.00', '20000.00', '2021-09-01', 2, '530.00', '1470.00', '0.00', '0.00', 2, 2, '2021-09-01 11:33:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_payment`
--

CREATE TABLE `kp_sale_payment` (
  `pay_id` int(11) NOT NULL,
  `sale_id` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `tendered` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `paid_total` decimal(10,2) NOT NULL,
  `pay_date` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modesc` decimal(10,2) NOT NULL,
  `mode1` decimal(10,2) NOT NULL,
  `type` int(11) NOT NULL,
  `mode2` decimal(10,2) NOT NULL,
  `moderef2` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `mode3` decimal(10,2) NOT NULL,
  `moderef3` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_sale_payment`
--

INSERT INTO `kp_sale_payment` (`pay_id`, `sale_id`, `user_id`, `cust_id`, `tendered`, `balance`, `paid_total`, `pay_date`, `datime`, `modesc`, `mode1`, `type`, `mode2`, `moderef2`, `mode3`, `moderef3`) VALUES
(1, '1', 1, 1, '1000.00', '225.00', '775.00', '2021-03-22', '2021-03-22 10:39:13', '0.00', '775.00', 1, '0.00', '', '0.00', ''),
(2, '2', 1, 1, '4670.00', '0.00', '4670.00', '2021-03-28', '2021-03-28 06:43:23', '0.00', '4670.00', 1, '0.00', '', '0.00', ''),
(3, '3', 2, 1, '3550.00', '0.00', '3550.00', '2021-03-28', '2021-03-28 06:52:34', '0.00', '3550.00', 1, '0.00', '', '0.00', ''),
(4, '4', 2, 1, '7140.00', '0.00', '7140.00', '2021-03-28', '2021-03-28 06:55:42', '0.00', '0.00', 1, '7140.00', '', '0.00', ''),
(5, '5', 2, 2, '995.00', '0.00', '995.00', '2021-03-28', '2021-03-28 07:00:44', '0.00', '995.00', 1, '0.00', '', '0.00', ''),
(6, '6', 2, 1, '250.00', '0.00', '250.00', '2021-03-28', '2021-03-28 07:01:34', '0.00', '0.00', 1, '250.00', '', '0.00', ''),
(7, '8', 2, 1, '1000.00', '0.00', '1000.00', '0000-00-00', '2021-03-28 08:21:06', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(8, '10', 2, 1, '8700.00', '0.00', '8700.00', '2021-03-29', '2021-03-29 08:00:44', '0.00', '8700.00', 1, '0.00', '', '0.00', ''),
(9, '13', 2, 1, '1080.00', '0.00', '1080.00', '2021-03-29', '2021-03-29 08:39:51', '0.00', '1080.00', 1, '0.00', '', '0.00', ''),
(10, '14', 2, 1, '1150.00', '0.00', '1150.00', '2021-03-29', '2021-03-29 08:41:13', '0.00', '1150.00', 1, '0.00', '', '0.00', ''),
(11, '16', 2, 1, '55.00', '0.00', '55.00', '2021-03-29', '2021-03-29 08:45:45', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(12, '18', 1, 1, '250.00', '0.00', '250.00', '2021-03-29', '2021-03-29 09:09:45', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(13, '19', 2, 1, '130.00', '0.00', '130.00', '2021-03-29', '2021-03-29 09:11:59', '0.00', '130.00', 1, '0.00', '', '0.00', ''),
(14, '20', 2, 1, '2150.00', '0.00', '2150.00', '2021-03-29', '2021-03-29 09:12:40', '0.00', '2150.00', 1, '0.00', '', '0.00', ''),
(15, '22', 2, 1, '50.00', '0.00', '50.00', '2021-03-29', '2021-03-29 09:15:53', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(16, '24', 2, 1, '100.00', '0.00', '100.00', '2021-03-29', '2021-03-29 09:18:56', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(17, '25', 2, 1, '720.00', '0.00', '720.00', '2021-03-29', '2021-03-29 09:27:34', '0.00', '720.00', 1, '0.00', '', '0.00', ''),
(18, '26', 2, 1, '1000.00', '434.00', '566.00', '2021-03-29', '2021-03-29 09:35:07', '0.00', '566.00', 1, '0.00', '', '0.00', ''),
(19, '29', 2, 1, '90.00', '0.00', '90.00', '2021-03-29', '2021-03-29 09:39:15', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(20, '31', 2, 1, '50.00', '0.00', '50.00', '2021-03-29', '2021-03-29 09:41:05', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(21, '32', 2, 1, '1000.00', '330.00', '670.00', '2021-03-29', '2021-03-29 09:53:04', '0.00', '670.00', 1, '0.00', '', '0.00', ''),
(22, '36', 2, 1, '400.00', '40.00', '360.00', '2021-03-29', '2021-03-29 10:25:40', '0.00', '360.00', 1, '0.00', '', '0.00', ''),
(23, '39', 2, 1, '500.00', '305.00', '195.00', '2021-03-29', '2021-03-29 11:07:11', '0.00', '195.00', 1, '0.00', '', '0.00', ''),
(24, '41', 2, 1, '1000.00', '775.00', '225.00', '2021-03-29', '2021-03-29 11:45:28', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(25, '12', 2, 1, '1000.00', '510.00', '490.00', '2021-03-29', '2021-03-29 11:59:52', '0.00', '490.00', 1, '0.00', '', '0.00', ''),
(26, '45', 2, 1, '200.00', '75.00', '125.00', '2021-03-29', '2021-03-29 12:00:30', '0.00', '125.00', 1, '0.00', '', '0.00', ''),
(27, '47', 2, 1, '2000.00', '0.00', '2000.00', '2021-03-29', '2021-03-29 12:38:26', '0.00', '2000.00', 1, '0.00', '', '0.00', ''),
(28, '50', 2, 1, '2375.00', '0.00', '2375.00', '2021-03-29', '2021-03-29 12:50:07', '0.00', '2375.00', 1, '0.00', '', '0.00', ''),
(29, '54', 2, 1, '200.00', '0.00', '200.00', '2021-03-29', '2021-03-29 12:59:11', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(30, '55', 2, 1, '1400.00', '0.00', '1400.00', '2021-03-29', '2021-03-29 13:05:16', '0.00', '1400.00', 1, '0.00', '', '0.00', ''),
(31, '57', 2, 1, '1550.00', '10.00', '1540.00', '2021-03-29', '2021-03-29 14:27:09', '0.00', '1540.00', 1, '0.00', '', '0.00', ''),
(32, '58', 2, 1, '250.00', '0.00', '250.00', '0000-00-00', '2021-03-29 14:32:30', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(33, '59', 2, 1, '200.00', '10.00', '190.00', '2021-03-29', '2021-03-29 14:33:10', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(34, '61', 2, 1, '380.00', '0.00', '380.00', '2021-03-29', '2021-03-29 14:53:37', '0.00', '380.00', 1, '0.00', '', '0.00', ''),
(35, '62', 2, 1, '3200.00', '60.00', '3140.00', '2021-03-29', '2021-03-29 15:01:21', '0.00', '3140.00', 1, '0.00', '', '0.00', ''),
(36, '63', 2, 1, '1770.00', '0.00', '1770.00', '2021-03-29', '2021-03-29 15:16:58', '0.00', '1770.00', 1, '0.00', '', '0.00', ''),
(37, '64', 2, 1, '4000.00', '436.00', '3564.00', '2021-03-29', '2021-03-29 15:35:28', '0.00', '3564.00', 1, '0.00', '', '0.00', ''),
(38, '65', 2, 1, '225.00', '0.00', '225.00', '2021-03-29', '2021-03-29 15:37:14', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(39, '66', 2, 1, '4000.00', '450.00', '3550.00', '0000-00-00', '2021-03-29 15:45:54', '0.00', '3550.00', 1, '0.00', '', '0.00', ''),
(40, '67', 2, 1, '110.00', '0.00', '110.00', '2021-03-29', '2021-03-29 15:51:59', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(41, '68', 2, 1, '250.00', '0.00', '250.00', '2021-03-29', '2021-03-29 15:53:20', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(42, '69', 2, 1, '500.00', '320.00', '180.00', '2021-03-29', '2021-03-29 15:55:54', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(43, '70', 2, 1, '135.00', '0.00', '135.00', '2021-03-29', '2021-03-29 16:02:07', '0.00', '135.00', 1, '0.00', '', '0.00', ''),
(44, '71', 2, 1, '3570.00', '0.00', '3570.00', '2021-03-29', '2021-03-29 16:02:37', '0.00', '0.00', 1, '3570.00', '', '0.00', ''),
(45, '75', 2, 1, '1530.00', '0.00', '1530.00', '2021-03-30', '2021-03-30 08:46:27', '0.00', '1530.00', 1, '0.00', '', '0.00', ''),
(46, '76', 2, 1, '8820.00', '0.00', '8820.00', '0000-00-00', '2021-03-30 09:47:46', '0.00', '8820.00', 1, '0.00', '', '0.00', ''),
(47, '77', 2, 1, '1240.00', '0.00', '1240.00', '2021-03-30', '2021-03-30 10:09:06', '0.00', '1240.00', 1, '0.00', '', '0.00', ''),
(48, '78', 2, 1, '150.00', '40.00', '110.00', '2021-03-30', '2021-03-30 10:10:21', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(49, '79', 2, 1, '1405.00', '0.00', '1405.00', '2021-03-30', '2021-03-30 10:14:10', '0.00', '1405.00', 1, '0.00', '', '0.00', ''),
(50, '80', 2, 1, '500.00', '0.00', '500.00', '2021-03-30', '2021-03-30 10:14:56', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(51, '81', 2, 1, '1470.00', '0.00', '1470.00', '2021-03-30', '2021-03-30 10:17:34', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(52, '82', 2, 2, '2600.00', '130.00', '2470.00', '2021-03-30', '2021-03-30 11:24:26', '0.00', '2470.00', 1, '0.00', '', '0.00', ''),
(53, '83', 2, 1, '500.00', '0.00', '500.00', '2021-03-30', '2021-03-30 11:32:47', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(54, '84', 2, 1, '200.00', '0.00', '200.00', '2021-03-30', '2021-03-30 11:46:25', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(55, '85', 2, 1, '1000.00', '610.00', '390.00', '2021-03-30', '2021-03-30 12:46:10', '0.00', '390.00', 1, '0.00', '', '0.00', ''),
(56, '86', 2, 1, '100.00', '0.00', '100.00', '2021-03-30', '2021-03-30 13:06:57', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(57, '87', 2, 1, '100.00', '25.00', '75.00', '2021-03-30', '2021-03-30 13:36:56', '0.00', '75.00', 1, '0.00', '', '0.00', ''),
(58, '88', 2, 1, '1000.00', '190.00', '810.00', '2021-03-30', '2021-03-30 13:55:17', '0.00', '810.00', 1, '0.00', '', '0.00', ''),
(59, '90', 2, 1, '300.00', '55.00', '245.00', '2021-03-30', '2021-03-30 14:09:22', '0.00', '245.00', 1, '0.00', '', '0.00', ''),
(60, '91', 2, 1, '200.00', '20.00', '180.00', '2021-03-30', '2021-03-30 14:16:39', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(61, '92', 2, 1, '200.00', '65.00', '135.00', '2021-03-30', '2021-03-30 14:22:58', '0.00', '135.00', 1, '0.00', '', '0.00', ''),
(62, '93', 2, 1, '50.00', '0.00', '50.00', '2021-03-30', '2021-03-30 14:23:50', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(63, '94', 2, 1, '100.00', '40.00', '60.00', '2021-03-30', '2021-03-30 14:50:34', '0.00', '60.00', 1, '0.00', '', '0.00', ''),
(64, '97', 2, 1, '2380.00', '0.00', '2380.00', '2021-03-30', '2021-03-30 14:57:24', '0.00', '2380.00', 1, '0.00', '', '0.00', ''),
(65, '98', 2, 1, '220.00', '15.00', '205.00', '2021-03-30', '2021-03-30 15:10:00', '0.00', '205.00', 1, '0.00', '', '0.00', ''),
(66, '99', 2, 1, '1000.00', '500.00', '500.00', '2021-03-30', '2021-03-30 15:11:58', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(67, '100', 2, 1, '300.00', '90.00', '210.00', '2021-03-30', '2021-03-30 15:26:22', '0.00', '210.00', 1, '0.00', '', '0.00', ''),
(68, '101', 2, 1, '90.00', '0.00', '90.00', '2021-03-30', '2021-03-30 15:41:51', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(69, '102', 2, 1, '1000.00', '680.00', '320.00', '2021-03-30', '2021-03-30 15:50:30', '0.00', '320.00', 1, '0.00', '', '0.00', ''),
(70, '103', 2, 1, '1025.00', '800.00', '225.00', '2021-03-31', '2021-03-31 05:04:18', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(71, '106', 2, 1, '1000.00', '800.00', '200.00', '2021-03-31', '2021-03-31 05:19:59', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(72, '107', 2, 1, '4750.00', '0.00', '4750.00', '2021-03-31', '2021-03-31 05:33:15', '0.00', '4750.00', 1, '0.00', '', '0.00', ''),
(73, '109', 2, 1, '100.00', '50.00', '50.00', '2021-03-31', '2021-03-31 05:57:29', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(74, '110', 2, 1, '50.00', '0.00', '50.00', '0000-00-00', '2021-03-31 07:31:38', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(75, '111', 2, 1, '150.00', '6.00', '144.00', '0000-00-00', '2021-03-31 07:48:00', '0.00', '144.00', 1, '0.00', '', '0.00', ''),
(76, '112', 2, 1, '1000.00', '190.00', '810.00', '2021-03-31', '2021-03-31 07:51:41', '0.00', '810.00', 1, '0.00', '', '0.00', ''),
(77, '113', 2, 1, '1480.00', '0.00', '1480.00', '2021-03-31', '2021-03-31 08:43:42', '0.00', '1480.00', 1, '0.00', '', '0.00', ''),
(78, '114', 2, 1, '600.00', '20.00', '580.00', '0000-00-00', '2021-03-31 12:07:25', '0.00', '580.00', 1, '0.00', '', '0.00', ''),
(79, '115', 2, 1, '600.00', '0.00', '600.00', '0000-00-00', '2021-03-31 13:01:45', '0.00', '600.00', 1, '0.00', '', '0.00', ''),
(80, '116', 2, 1, '500.00', '100.00', '400.00', '2021-03-31', '2021-03-31 13:06:35', '0.00', '400.00', 1, '0.00', '', '0.00', ''),
(81, '118', 2, 1, '200.00', '0.00', '200.00', '2021-03-31', '2021-03-31 14:21:39', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(82, '120', 2, 1, '135.00', '0.00', '135.00', '2021-03-31', '2021-03-31 14:41:47', '0.00', '135.00', 1, '0.00', '', '0.00', ''),
(83, '122', 2, 1, '200.00', '0.00', '200.00', '2021-03-31', '2021-03-31 14:48:14', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(84, '123', 2, 1, '600.00', '0.00', '600.00', '2021-03-31', '2021-03-31 15:06:38', '0.00', '600.00', 1, '0.00', '', '0.00', ''),
(85, '124', 2, 1, '70.00', '0.00', '70.00', '2021-03-31', '2021-03-31 15:07:23', '0.00', '70.00', 1, '0.00', '', '0.00', ''),
(86, '125', 2, 1, '144.00', '0.00', '144.00', '2021-03-31', '2021-03-31 15:08:10', '0.00', '144.00', 1, '0.00', '', '0.00', ''),
(87, '126', 2, 1, '2060.00', '0.00', '2060.00', '2021-03-31', '2021-03-31 15:11:06', '0.00', '2060.00', 1, '0.00', '', '0.00', ''),
(88, '127', 2, 1, '5940.00', '0.00', '5940.00', '2021-03-31', '2021-03-31 15:13:17', '0.00', '5940.00', 1, '0.00', '', '0.00', ''),
(89, '128', 2, 1, '600.00', '0.00', '600.00', '2021-03-31', '2021-03-31 15:16:52', '0.00', '600.00', 1, '0.00', '', '0.00', ''),
(90, '129', 2, 1, '120.00', '0.00', '120.00', '2021-03-31', '2021-03-31 15:17:35', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(91, '130', 2, 1, '175.00', '0.00', '175.00', '2021-03-31', '2021-03-31 15:28:14', '0.00', '175.00', 1, '0.00', '', '0.00', ''),
(92, '131', 2, 1, '660.00', '0.00', '660.00', '2021-03-31', '2021-03-31 15:33:09', '0.00', '660.00', 1, '0.00', '', '0.00', ''),
(93, '133', 2, 1, '580.00', '0.00', '580.00', '2021-03-31', '2021-03-31 15:47:55', '0.00', '580.00', 1, '0.00', '', '0.00', ''),
(94, '134', 2, 1, '1800.00', '0.00', '1800.00', '2021-04-01', '2021-04-01 05:29:54', '0.00', '1800.00', 1, '0.00', '', '0.00', ''),
(95, '135', 2, 1, '9000.00', '8180.00', '820.00', '2021-04-01', '2021-04-01 06:17:32', '0.00', '820.00', 1, '0.00', '', '0.00', ''),
(96, '137', 2, 1, '2000.00', '130.00', '1870.00', '2021-04-01', '2021-04-01 06:52:38', '0.00', '1870.00', 1, '0.00', '', '0.00', ''),
(97, '138', 2, 1, '3300.00', '50.00', '3250.00', '2021-04-01', '2021-04-01 06:58:10', '0.00', '3250.00', 1, '0.00', '', '0.00', ''),
(98, '139', 2, 1, '60.00', '5.00', '55.00', '2021-04-01', '2021-04-01 07:03:49', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(99, '141', 2, 1, '100.00', '0.00', '100.00', '2021-04-01', '2021-04-01 08:28:40', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(100, '142', 2, 1, '1100.00', '20.00', '1080.00', '2021-04-01', '2021-04-01 09:09:03', '0.00', '1080.00', 1, '0.00', '', '0.00', ''),
(101, '143', 2, 1, '50.00', '0.00', '50.00', '2021-04-01', '2021-04-01 09:11:03', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(102, '144', 2, 1, '100.00', '0.00', '100.00', '2021-04-01', '2021-04-01 09:12:14', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(103, '146', 2, 1, '1100.00', '60.00', '1040.00', '2021-04-01', '2021-04-01 09:37:24', '0.00', '1040.00', 1, '0.00', '', '0.00', ''),
(104, '147', 2, 1, '2360.00', '0.00', '2360.00', '2021-04-01', '2021-04-01 09:43:00', '0.00', '2360.00', 1, '0.00', '', '0.00', ''),
(105, '148', 2, 1, '1000.00', '430.00', '570.00', '2021-04-01', '2021-04-01 10:01:11', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(106, '149', 2, 1, '1530.00', '0.00', '1530.00', '2021-04-01', '2021-04-01 10:50:57', '0.00', '1530.00', 1, '0.00', '', '0.00', ''),
(107, '151', 2, 1, '2380.00', '0.00', '2380.00', '2021-04-01', '2021-04-01 11:03:56', '0.00', '2380.00', 1, '0.00', '', '0.00', ''),
(108, '152', 2, 1, '220.00', '100.00', '120.00', '2021-04-01', '2021-04-01 11:31:40', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(109, '153', 2, 1, '700.00', '10.00', '690.00', '2021-04-01', '2021-04-01 12:09:19', '0.00', '690.00', 1, '0.00', '', '0.00', ''),
(110, '154', 2, 1, '200.00', '105.00', '95.00', '2021-04-01', '2021-04-01 12:41:07', '0.00', '95.00', 1, '0.00', '', '0.00', ''),
(111, '157', 2, 1, '200.00', '0.00', '200.00', '2021-04-01', '2021-04-01 13:51:29', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(112, '158', 2, 1, '720.00', '0.00', '720.00', '2021-04-01', '2021-04-01 14:06:20', '0.00', '720.00', 1, '0.00', '', '0.00', ''),
(113, '156', 2, 1, '20100.00', '76.00', '20024.00', '2021-04-01', '2021-04-01 14:23:01', '0.00', '20024.00', 1, '0.00', '', '0.00', ''),
(114, '159', 2, 1, '3070.00', '0.00', '3070.00', '2021-04-01', '2021-04-01 14:34:36', '0.00', '3070.00', 1, '0.00', '', '0.00', ''),
(115, '160', 2, 1, '500.00', '0.00', '500.00', '2021-04-01', '2021-04-01 14:59:03', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(116, '161', 2, 1, '1020.00', '500.00', '520.00', '2021-04-01', '2021-04-01 15:08:41', '0.00', '520.00', 1, '0.00', '', '0.00', ''),
(117, '163', 2, 1, '2000.00', '560.00', '1440.00', '2021-04-01', '2021-04-01 15:11:56', '0.00', '1440.00', 1, '0.00', '', '0.00', ''),
(118, '164', 2, 1, '110.00', '0.00', '110.00', '2021-04-01', '2021-04-01 15:12:57', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(119, '165', 2, 1, '500.00', '140.00', '360.00', '2021-04-01', '2021-04-01 15:19:21', '0.00', '360.00', 1, '0.00', '', '0.00', ''),
(120, '166', 2, 1, '200.00', '35.00', '165.00', '2021-04-01', '2021-04-01 15:26:23', '0.00', '165.00', 1, '0.00', '', '0.00', ''),
(121, '167', 2, 1, '120.00', '0.00', '120.00', '2021-04-01', '2021-04-01 15:27:10', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(122, '168', 2, 1, '100.00', '0.00', '100.00', '2021-04-01', '2021-04-01 16:14:15', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(123, '169', 2, 1, '135.00', '0.00', '135.00', '2021-04-01', '2021-04-01 16:14:41', '0.00', '135.00', 1, '0.00', '', '0.00', ''),
(124, '170', 2, 1, '265.00', '0.00', '265.00', '2021-04-01', '2021-04-01 16:17:04', '0.00', '265.00', 1, '0.00', '', '0.00', ''),
(125, '171', 2, 1, '1470.00', '0.00', '1470.00', '2021-04-02', '2021-04-02 05:20:39', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(126, '172', 2, 1, '240.00', '5.00', '235.00', '2021-04-02', '2021-04-02 05:23:36', '0.00', '235.00', 1, '0.00', '', '0.00', ''),
(127, '173', 2, 1, '3550.00', '200.00', '3350.00', '2021-04-02', '2021-04-02 05:27:51', '0.00', '3350.00', 1, '0.00', '', '0.00', ''),
(128, '174', 2, 1, '180.00', '0.00', '180.00', '2021-04-02', '2021-04-02 05:31:13', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(129, '175', 2, 1, '14370.00', '0.00', '14370.00', '2021-04-02', '2021-04-02 06:52:46', '0.00', '14370.00', 1, '0.00', '', '0.00', ''),
(130, '177', 2, 1, '1000.00', '370.00', '630.00', '2021-04-02', '2021-04-02 09:52:51', '0.00', '630.00', 1, '0.00', '', '0.00', ''),
(131, '178', 2, 1, '500.00', '130.00', '370.00', '2021-04-02', '2021-04-02 09:56:21', '0.00', '370.00', 1, '0.00', '', '0.00', ''),
(132, '179', 2, 1, '1470.00', '0.00', '1470.00', '2021-04-02', '2021-04-02 09:58:44', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(133, '180', 2, 1, '400.00', '20.00', '380.00', '2021-04-02', '2021-04-02 10:02:31', '0.00', '380.00', 1, '0.00', '', '0.00', ''),
(134, '181', 2, 1, '100.00', '0.00', '100.00', '2021-04-02', '2021-04-02 10:05:47', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(135, '182', 2, 1, '120.00', '0.00', '120.00', '2021-04-02', '2021-04-02 10:13:40', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(136, '184', 2, 1, '6000.00', '200.00', '5800.00', '2021-04-02', '2021-04-02 10:53:01', '0.00', '5800.00', 1, '0.00', '', '0.00', ''),
(137, '186', 2, 1, '200.00', '40.00', '160.00', '2021-04-02', '2021-04-02 11:06:42', '0.00', '160.00', 1, '0.00', '', '0.00', ''),
(138, '187', 2, 1, '3000.00', '1310.00', '1690.00', '2021-04-02', '2021-04-02 11:19:55', '0.00', '1690.00', 1, '0.00', '', '0.00', ''),
(139, '188', 2, 1, '655.00', '215.00', '440.00', '2021-04-02', '2021-04-02 11:20:48', '0.00', '440.00', 1, '0.00', '', '0.00', ''),
(140, '189', 2, 1, '120.00', '0.00', '120.00', '2021-04-02', '2021-04-02 11:22:04', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(141, '190', 2, 1, '145.00', '3.00', '142.00', '2021-04-02', '2021-04-02 11:24:21', '0.00', '142.00', 1, '0.00', '', '0.00', ''),
(142, '191', 2, 1, '200.00', '150.00', '50.00', '2021-04-02', '2021-04-02 11:26:15', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(143, '193', 2, 1, '1500.00', '480.00', '1020.00', '2021-04-02', '2021-04-02 11:48:22', '0.00', '1020.00', 1, '0.00', '', '0.00', ''),
(144, '194', 2, 1, '1070.00', '0.00', '1070.00', '2021-04-02', '2021-04-02 11:54:15', '0.00', '1070.00', 1, '0.00', '', '0.00', ''),
(145, '192', 2, 1, '7955.00', '0.00', '7955.00', '2021-04-02', '2021-04-02 12:05:26', '0.00', '7955.00', 1, '0.00', '', '0.00', ''),
(146, '196', 2, 1, '190.00', '0.00', '190.00', '2021-04-02', '2021-04-02 12:10:03', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(147, '197', 2, 1, '980.00', '0.00', '980.00', '2021-04-02', '2021-04-02 12:17:01', '0.00', '980.00', 1, '0.00', '', '0.00', ''),
(148, '198', 2, 1, '500.00', '0.00', '500.00', '2021-04-02', '2021-04-02 12:33:25', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(149, '199', 2, 1, '160.00', '0.00', '160.00', '2021-04-02', '2021-04-02 12:43:16', '0.00', '160.00', 1, '0.00', '', '0.00', ''),
(150, '200', 2, 1, '800.00', '30.00', '770.00', '2021-04-02', '2021-04-02 12:50:17', '0.00', '770.00', 1, '0.00', '', '0.00', ''),
(151, '203', 2, 1, '1780.00', '0.00', '1780.00', '2021-04-02', '2021-04-02 12:57:22', '0.00', '1780.00', 1, '0.00', '', '0.00', ''),
(152, '204', 2, 1, '100.00', '45.00', '55.00', '2021-04-02', '2021-04-02 12:58:43', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(153, '205', 2, 1, '3400.00', '2.00', '3398.00', '2021-04-02', '2021-04-02 13:20:51', '0.00', '3398.00', 1, '0.00', '', '0.00', ''),
(154, '207', 2, 1, '800.00', '75.00', '725.00', '2021-04-02', '2021-04-02 13:28:01', '0.00', '725.00', 1, '0.00', '', '0.00', ''),
(155, '209', 2, 1, '100.00', '25.00', '75.00', '2021-04-02', '2021-04-02 13:46:51', '0.00', '75.00', 1, '0.00', '', '0.00', ''),
(156, '210', 2, 1, '1050.00', '10.00', '1040.00', '2021-04-02', '2021-04-02 13:49:42', '0.00', '1040.00', 1, '0.00', '', '0.00', ''),
(157, '211', 2, 1, '90.00', '10.00', '80.00', '2021-04-02', '2021-04-02 14:28:19', '0.00', '80.00', 1, '0.00', '', '0.00', ''),
(158, '212', 2, 1, '185.00', '0.00', '185.00', '2021-04-02', '2021-04-02 14:57:22', '0.00', '185.00', 1, '0.00', '', '0.00', ''),
(159, '213', 2, 1, '1000.00', '492.00', '508.00', '2021-04-02', '2021-04-02 15:01:36', '0.00', '508.00', 1, '0.00', '', '0.00', ''),
(160, '214', 2, 1, '200.00', '70.00', '130.00', '2021-04-02', '2021-04-02 15:04:29', '0.00', '130.00', 1, '0.00', '', '0.00', ''),
(161, '215', 2, 1, '7370.00', '0.00', '7370.00', '2021-04-02', '2021-04-02 15:15:30', '0.00', '7370.00', 1, '0.00', '', '0.00', ''),
(162, '216', 2, 1, '100.00', '0.00', '100.00', '2021-04-02', '2021-04-02 15:40:10', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(163, '217', 2, 1, '3030.00', '0.00', '3030.00', '2021-04-02', '2021-04-02 15:57:24', '0.00', '3030.00', 1, '0.00', '', '0.00', ''),
(164, '218', 2, 1, '3580.00', '0.00', '3580.00', '2021-04-02', '2021-04-02 16:08:16', '0.00', '3580.00', 1, '0.00', '', '0.00', ''),
(165, '219', 2, 1, '55.00', '0.00', '55.00', '2021-04-03', '2021-04-03 05:25:12', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(166, '222', 2, 1, '1000.00', '430.00', '570.00', '2021-04-03', '2021-04-03 05:30:40', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(167, '223', 2, 1, '1000.00', '600.00', '400.00', '2021-04-03', '2021-04-03 06:02:55', '0.00', '400.00', 1, '0.00', '', '0.00', ''),
(168, '224', 2, 1, '550.00', '35.00', '515.00', '2021-04-03', '2021-04-03 06:07:13', '0.00', '515.00', 1, '0.00', '', '0.00', ''),
(169, '225', 2, 1, '550.00', '10.00', '540.00', '2021-04-03', '2021-04-03 06:12:39', '0.00', '540.00', 1, '0.00', '', '0.00', ''),
(170, '226', 2, 1, '300.00', '50.00', '250.00', '2021-04-03', '2021-04-03 06:18:03', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(171, '227', 2, 1, '250.00', '25.00', '225.00', '2021-04-03', '2021-04-03 06:59:17', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(172, '228', 2, 1, '55.00', '0.00', '55.00', '2021-04-03', '2021-04-03 07:12:27', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(173, '231', 2, 1, '5000.00', '250.00', '4750.00', '2021-04-03', '2021-04-03 07:58:25', '0.00', '4750.00', 1, '0.00', '', '0.00', ''),
(174, '232', 2, 1, '100.00', '0.00', '100.00', '2021-04-03', '2021-04-03 08:36:35', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(175, '233', 2, 1, '140.00', '35.00', '105.00', '2021-04-03', '2021-04-03 08:37:43', '0.00', '105.00', 1, '0.00', '', '0.00', ''),
(176, '234', 2, 1, '50.00', '0.00', '50.00', '2021-04-03', '2021-04-03 08:38:38', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(177, '237', 2, 1, '2095.00', '0.00', '2095.00', '2021-04-03', '2021-04-03 09:40:23', '0.00', '2095.00', 1, '0.00', '', '0.00', ''),
(178, '238', 2, 1, '390.00', '0.00', '390.00', '2021-04-03', '2021-04-03 09:41:21', '0.00', '390.00', 1, '0.00', '', '0.00', ''),
(179, '236', 2, 1, '5155.00', '0.00', '5155.00', '2021-04-03', '2021-04-03 09:42:46', '0.00', '5155.00', 1, '0.00', '', '0.00', ''),
(180, '239', 2, 1, '9500.00', '75.00', '9425.00', '2021-04-03', '2021-04-03 10:05:41', '0.00', '9425.00', 1, '0.00', '', '0.00', ''),
(181, '240', 2, 1, '500.00', '165.00', '335.00', '2021-04-03', '2021-04-03 12:25:44', '0.00', '335.00', 1, '0.00', '', '0.00', ''),
(182, '241', 2, 1, '1000.00', '430.00', '570.00', '2021-04-03', '2021-04-03 12:30:45', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(183, '242', 2, 1, '1000.00', '490.00', '510.00', '2021-04-03', '2021-04-03 12:49:20', '0.00', '510.00', 1, '0.00', '', '0.00', ''),
(184, '243', 2, 1, '750.00', '15.00', '735.00', '2021-04-03', '2021-04-03 12:56:58', '0.00', '735.00', 1, '0.00', '', '0.00', ''),
(185, '245', 2, 1, '200.00', '0.00', '200.00', '2021-04-03', '2021-04-03 12:59:19', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(186, '246', 2, 1, '210.00', '0.00', '210.00', '2021-04-03', '2021-04-03 13:01:36', '0.00', '210.00', 1, '0.00', '', '0.00', ''),
(187, '247', 2, 1, '3150.00', '0.00', '3150.00', '2021-04-03', '2021-04-03 13:26:25', '0.00', '3150.00', 1, '0.00', '', '0.00', ''),
(188, '249', 2, 1, '3000.00', '550.00', '2450.00', '2021-04-03', '2021-04-03 13:29:54', '0.00', '2450.00', 1, '0.00', '', '0.00', ''),
(189, '250', 2, 1, '1570.00', '100.00', '1470.00', '2021-04-03', '2021-04-03 13:37:05', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(190, '251', 2, 1, '1595.00', '0.00', '1595.00', '2021-04-03', '2021-04-03 13:44:02', '0.00', '1595.00', 1, '0.00', '', '0.00', ''),
(191, '252', 2, 1, '1000.00', '0.00', '1000.00', '2021-04-03', '2021-04-03 13:44:27', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(192, '253', 2, 1, '190.00', '0.00', '190.00', '2021-04-03', '2021-04-03 13:50:38', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(193, '255', 2, 1, '500.00', '320.00', '180.00', '2021-04-03', '2021-04-03 13:53:55', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(194, '254', 2, 1, '290.00', '0.00', '290.00', '2021-04-03', '2021-04-03 13:56:33', '0.00', '290.00', 1, '0.00', '', '0.00', ''),
(195, '256', 2, 1, '310.00', '5.00', '305.00', '2021-04-03', '2021-04-03 14:03:27', '0.00', '305.00', 1, '0.00', '', '0.00', ''),
(196, '257', 2, 1, '1000.00', '0.00', '1000.00', '2021-04-03', '2021-04-03 14:08:07', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(197, '258', 2, 1, '500.00', '0.00', '500.00', '2021-04-03', '2021-04-03 14:09:33', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(198, '259', 2, 1, '300.00', '30.00', '270.00', '2021-04-03', '2021-04-03 14:21:41', '0.00', '270.00', 1, '0.00', '', '0.00', ''),
(199, '260', 2, 1, '2000.00', '280.00', '1720.00', '2021-04-03', '2021-04-03 15:15:28', '0.00', '1720.00', 1, '0.00', '', '0.00', ''),
(200, '261', 2, 1, '1000.00', '430.00', '570.00', '2021-04-03', '2021-04-03 15:16:24', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(201, '263', 2, 1, '400.00', '50.00', '350.00', '2021-04-03', '2021-04-03 15:18:40', '0.00', '350.00', 1, '0.00', '', '0.00', ''),
(202, '264', 2, 1, '420.00', '10.00', '410.00', '2021-04-03', '2021-04-03 15:19:34', '0.00', '410.00', 1, '0.00', '', '0.00', ''),
(203, '265', 2, 1, '50.00', '0.00', '50.00', '2021-04-03', '2021-04-03 15:28:47', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(204, '266', 2, 1, '200.00', '0.00', '200.00', '2021-04-03', '2021-04-03 15:43:54', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(205, '267', 2, 1, '1400.00', '0.00', '1400.00', '2021-04-03', '2021-04-03 15:49:59', '0.00', '1400.00', 1, '0.00', '', '0.00', ''),
(206, '268', 2, 1, '1000.00', '0.00', '1000.00', '2021-04-05', '2021-04-05 06:05:05', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(207, '269', 2, 1, '30.00', '5.00', '25.00', '2021-04-05', '2021-04-05 06:06:49', '0.00', '25.00', 1, '0.00', '', '0.00', ''),
(208, '270', 2, 1, '1820.00', '0.00', '1820.00', '2021-04-05', '2021-04-05 07:44:13', '0.00', '1820.00', 1, '0.00', '', '0.00', ''),
(209, '271', 2, 1, '1780.00', '0.00', '1780.00', '2021-04-05', '2021-04-05 07:59:03', '0.00', '1780.00', 1, '0.00', '', '0.00', ''),
(210, '272', 2, 1, '1000.00', '440.00', '560.00', '2021-04-05', '2021-04-05 08:09:55', '0.00', '560.00', 1, '0.00', '', '0.00', ''),
(211, '273', 2, 1, '50.00', '0.00', '50.00', '2021-04-05', '2021-04-05 08:11:58', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(212, '275', 2, 1, '1500.00', '30.00', '1470.00', '2021-04-05', '2021-04-05 08:55:36', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(213, '276', 2, 1, '500.00', '110.00', '390.00', '2021-04-05', '2021-04-05 09:10:58', '0.00', '390.00', 1, '0.00', '', '0.00', ''),
(214, '277', 2, 1, '1470.00', '0.00', '1470.00', '2021-04-05', '2021-04-05 09:22:17', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(215, '278', 2, 1, '19000.00', '60.00', '18940.00', '2021-04-05', '2021-04-05 10:05:26', '0.00', '18940.00', 1, '0.00', '', '0.00', ''),
(216, '279', 2, 1, '600.00', '40.00', '560.00', '2021-04-05', '2021-04-05 10:19:23', '0.00', '560.00', 1, '0.00', '', '0.00', ''),
(217, '280', 2, 1, '120.00', '0.00', '120.00', '2021-04-05', '2021-04-05 10:42:10', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(218, '282', 2, 1, '310.00', '15.00', '295.00', '2021-04-05', '2021-04-05 11:17:21', '0.00', '295.00', 1, '0.00', '', '0.00', ''),
(219, '283', 2, 1, '550.00', '0.00', '550.00', '2021-04-05', '2021-04-05 11:34:20', '0.00', '550.00', 1, '0.00', '', '0.00', ''),
(220, '284', 2, 1, '200.00', '0.00', '200.00', '2021-04-05', '2021-04-05 12:05:34', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(221, '285', 2, 1, '1100.00', '20.00', '1080.00', '2021-04-05', '2021-04-05 12:12:10', '0.00', '1080.00', 1, '0.00', '', '0.00', ''),
(222, '286', 2, 1, '1000.00', '255.00', '745.00', '2021-04-05', '2021-04-05 12:14:50', '0.00', '745.00', 1, '0.00', '', '0.00', ''),
(223, '287', 2, 1, '4000.00', '950.00', '3050.00', '2021-04-05', '2021-04-05 12:18:51', '0.00', '3050.00', 1, '0.00', '', '0.00', ''),
(224, '288', 2, 1, '1000.00', '810.00', '190.00', '2021-04-05', '2021-04-05 12:29:43', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(225, '290', 2, 1, '550.00', '10.00', '540.00', '2021-04-05', '2021-04-05 12:32:33', '0.00', '540.00', 1, '0.00', '', '0.00', ''),
(226, '291', 2, 1, '1500.00', '20.00', '1480.00', '2021-04-05', '2021-04-05 12:34:59', '0.00', '1480.00', 1, '0.00', '', '0.00', ''),
(227, '292', 2, 1, '1480.00', '0.00', '1480.00', '2021-04-05', '2021-04-05 12:35:28', '0.00', '1480.00', 1, '0.00', '', '0.00', ''),
(228, '293', 2, 1, '500.00', '200.00', '300.00', '2021-04-05', '2021-04-05 12:44:48', '0.00', '300.00', 1, '0.00', '', '0.00', ''),
(229, '294', 2, 1, '225.00', '0.00', '225.00', '2021-04-05', '2021-04-05 12:46:31', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(230, '295', 2, 1, '450.00', '5.00', '445.00', '2021-04-05', '2021-04-05 12:49:09', '0.00', '445.00', 1, '0.00', '', '0.00', ''),
(231, '296', 2, 1, '110.00', '0.00', '110.00', '2021-04-05', '2021-04-05 13:07:35', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(232, '297', 2, 1, '170.00', '15.00', '155.00', '2021-04-05', '2021-04-05 13:13:47', '0.00', '155.00', 1, '0.00', '', '0.00', ''),
(233, '298', 2, 1, '1050.00', '0.00', '1050.00', '2021-04-05', '2021-04-05 13:23:39', '0.00', '1050.00', 1, '0.00', '', '0.00', ''),
(234, '299', 2, 1, '735.00', '0.00', '735.00', '2021-04-05', '2021-04-05 13:42:57', '0.00', '735.00', 1, '0.00', '', '0.00', ''),
(235, '300', 2, 1, '1000.00', '790.00', '210.00', '2021-04-05', '2021-04-05 15:07:16', '0.00', '210.00', 1, '0.00', '', '0.00', ''),
(236, '301', 2, 1, '1270.00', '0.00', '1270.00', '2021-04-05', '2021-04-05 15:09:15', '0.00', '1270.00', 1, '0.00', '', '0.00', ''),
(237, '302', 2, 1, '2500.00', '425.00', '2075.00', '2021-04-05', '2021-04-05 15:17:41', '0.00', '2075.00', 1, '0.00', '', '0.00', ''),
(238, '304', 2, 1, '100.00', '0.00', '100.00', '2021-04-05', '2021-04-05 15:18:44', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(239, '305', 2, 1, '100.00', '0.00', '100.00', '2021-04-05', '2021-04-05 15:19:27', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(240, '306', 2, 1, '1000.00', '500.00', '500.00', '2021-04-05', '2021-04-05 15:25:01', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(241, '307', 2, 1, '2000.00', '510.00', '1490.00', '2021-04-05', '2021-04-05 15:36:33', '0.00', '1490.00', 1, '0.00', '', '0.00', ''),
(242, '308', 2, 1, '230.00', '0.00', '230.00', '2021-04-05', '2021-04-05 15:40:28', '0.00', '230.00', 1, '0.00', '', '0.00', ''),
(243, '310', 2, 1, '2200.00', '50.00', '2150.00', '2021-04-05', '2021-04-05 15:45:07', '0.00', '2150.00', 1, '0.00', '', '0.00', ''),
(244, '311', 2, 1, '500.00', '400.00', '100.00', '2021-04-05', '2021-04-05 15:48:23', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(245, '312', 2, 1, '100.00', '0.00', '100.00', '2021-04-05', '2021-04-05 15:53:32', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(246, '313', 2, 1, '2390.00', '0.00', '2390.00', '2021-04-06', '2021-04-06 05:25:09', '0.00', '2390.00', 1, '0.00', '', '0.00', ''),
(247, '314', 2, 1, '1450.00', '0.00', '1450.00', '2021-04-06', '2021-04-06 05:29:57', '0.00', '1450.00', 1, '0.00', '', '0.00', ''),
(248, '315', 2, 1, '110.00', '0.00', '110.00', '2021-04-06', '2021-04-06 05:48:36', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(249, '316', 2, 1, '50.00', '25.00', '25.00', '2021-04-06', '2021-04-06 05:52:59', '0.00', '25.00', 1, '0.00', '', '0.00', ''),
(250, '317', 2, 1, '2000.00', '236.00', '1764.00', '2021-04-06', '2021-04-06 06:35:10', '0.00', '1764.00', 1, '0.00', '', '0.00', ''),
(251, '318', 2, 1, '60.00', '5.00', '55.00', '2021-04-06', '2021-04-06 06:46:28', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(252, '319', 2, 1, '500.00', '0.00', '500.00', '2021-04-06', '2021-04-06 08:37:33', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(253, '320', 2, 1, '1490.00', '0.00', '1490.00', '2021-04-06', '2021-04-06 10:28:32', '0.00', '1490.00', 1, '0.00', '', '0.00', ''),
(254, '321', 2, 1, '37788.00', '0.00', '37788.00', '2021-04-06', '2021-04-06 12:19:42', '0.00', '37788.00', 1, '0.00', '', '0.00', ''),
(255, '323', 2, 1, '400.00', '50.00', '350.00', '2021-04-06', '2021-04-06 13:03:59', '0.00', '350.00', 1, '0.00', '', '0.00', ''),
(256, '324', 2, 1, '2450.00', '0.00', '2450.00', '2021-04-06', '2021-04-06 13:28:33', '0.00', '2450.00', 1, '0.00', '', '0.00', ''),
(257, '326', 2, 1, '2000.00', '850.00', '1150.00', '2021-04-06', '2021-04-06 14:10:42', '0.00', '1150.00', 1, '0.00', '', '0.00', ''),
(258, '327', 2, 1, '1500.00', '270.00', '1230.00', '2021-04-06', '2021-04-06 14:21:15', '0.00', '1230.00', 1, '0.00', '', '0.00', ''),
(259, '328', 2, 1, '2390.00', '0.00', '2390.00', '2021-04-06', '2021-04-06 14:28:40', '0.00', '2390.00', 1, '0.00', '', '0.00', ''),
(260, '331', 2, 1, '3552.00', '0.00', '3552.00', '2021-04-06', '2021-04-06 14:51:22', '0.00', '3552.00', 1, '0.00', '', '0.00', ''),
(261, '329', 2, 1, '3750.00', '0.00', '3750.00', '2021-04-06', '2021-04-06 14:51:38', '0.00', '3750.00', 1, '0.00', '', '0.00', ''),
(262, '332', 2, 1, '490.00', '0.00', '490.00', '2021-04-06', '2021-04-06 14:52:42', '0.00', '490.00', 1, '0.00', '', '0.00', ''),
(263, '333', 2, 1, '200.00', '0.00', '200.00', '2021-04-06', '2021-04-06 14:54:09', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(264, '334', 2, 1, '90.00', '0.00', '90.00', '2021-04-06', '2021-04-06 15:00:49', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(265, '335', 2, 1, '1000.00', '795.00', '205.00', '2021-04-06', '2021-04-06 15:11:52', '0.00', '205.00', 1, '0.00', '', '0.00', ''),
(266, '336', 2, 1, '2470.00', '0.00', '2470.00', '2021-04-06', '2021-04-06 15:13:28', '0.00', '2470.00', 1, '0.00', '', '0.00', ''),
(267, '337', 2, 1, '600.00', '50.00', '550.00', '2021-04-06', '2021-04-06 15:22:26', '0.00', '550.00', 1, '0.00', '', '0.00', ''),
(268, '338', 2, 1, '9500.00', '160.00', '9340.00', '2021-04-06', '2021-04-06 15:27:57', '0.00', '9340.00', 1, '0.00', '', '0.00', ''),
(269, '339', 2, 1, '9500.00', '0.00', '9500.00', '2021-04-06', '2021-04-06 15:29:25', '0.00', '9500.00', 1, '0.00', '', '0.00', ''),
(270, '342', 2, 1, '200.00', '0.00', '200.00', '2021-04-06', '2021-04-06 15:39:35', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(271, '343', 2, 1, '100.00', '0.00', '100.00', '2021-04-06', '2021-04-06 15:49:34', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(272, '344', 2, 1, '4840.00', '0.00', '4840.00', '2021-04-07', '2021-04-07 04:58:53', '0.00', '4840.00', 1, '0.00', '', '0.00', ''),
(273, '346', 2, 1, '1090.00', '0.00', '1090.00', '2021-04-07', '2021-04-07 06:01:00', '0.00', '1090.00', 1, '0.00', '', '0.00', ''),
(274, '347', 2, 1, '350.00', '0.00', '350.00', '2021-04-07', '2021-04-07 06:03:23', '0.00', '350.00', 1, '0.00', '', '0.00', ''),
(275, '348', 2, 1, '400.00', '0.00', '400.00', '2021-04-07', '2021-04-07 06:34:28', '0.00', '400.00', 1, '0.00', '', '0.00', ''),
(276, '350', 2, 1, '500.00', '90.00', '410.00', '2021-04-07', '2021-04-07 06:44:28', '0.00', '410.00', 1, '0.00', '', '0.00', ''),
(277, '349', 2, 1, '1470.00', '0.00', '1470.00', '2021-04-07', '2021-04-07 06:58:12', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(278, '351', 2, 1, '1600.00', '50.00', '1550.00', '2021-04-07', '2021-04-07 06:59:56', '0.00', '1550.00', 1, '0.00', '', '0.00', ''),
(279, '355', 2, 1, '1000.00', '350.00', '650.00', '2021-04-07', '2021-04-07 10:08:31', '0.00', '650.00', 1, '0.00', '', '0.00', ''),
(280, '356', 2, 1, '200.00', '10.00', '190.00', '2021-04-07', '2021-04-07 10:10:56', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(281, '357', 2, 1, '1100.00', '0.00', '1100.00', '2021-04-07', '2021-04-07 11:40:26', '0.00', '1100.00', 1, '0.00', '', '0.00', ''),
(282, '358', 2, 1, '820.00', '0.00', '820.00', '2021-04-07', '2021-04-07 12:28:45', '0.00', '820.00', 1, '0.00', '', '0.00', ''),
(283, '360', 2, 1, '450.00', '0.00', '450.00', '2021-04-07', '2021-04-07 12:38:22', '0.00', '450.00', 1, '0.00', '', '0.00', ''),
(284, '361', 2, 1, '180.00', '0.00', '180.00', '2021-04-07', '2021-04-07 13:01:39', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(285, '362', 2, 1, '200.00', '0.00', '200.00', '2021-04-07', '2021-04-07 13:13:27', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(286, '363', 2, 1, '1000.00', '215.00', '785.00', '2021-04-07', '2021-04-07 13:54:40', '0.00', '785.00', 1, '0.00', '', '0.00', ''),
(287, '364', 2, 1, '1075.00', '0.00', '1075.00', '2021-04-07', '2021-04-07 14:07:36', '0.00', '1075.00', 1, '0.00', '', '0.00', ''),
(288, '365', 2, 1, '75.00', '0.00', '75.00', '2021-04-07', '2021-04-07 14:12:14', '0.00', '75.00', 1, '0.00', '', '0.00', ''),
(289, '366', 2, 1, '200.00', '110.00', '90.00', '2021-04-07', '2021-04-07 14:37:50', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(290, '367', 2, 1, '110.00', '85.00', '25.00', '2021-04-07', '2021-04-07 14:38:41', '0.00', '25.00', 1, '0.00', '', '0.00', ''),
(291, '368', 2, 1, '200.00', '60.00', '140.00', '2021-04-07', '2021-04-07 14:43:44', '0.00', '140.00', 1, '0.00', '', '0.00', ''),
(292, '369', 2, 1, '200.00', '0.00', '200.00', '2021-04-07', '2021-04-07 14:54:53', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(293, '370', 2, 1, '19000.00', '0.00', '19000.00', '2021-04-07', '2021-04-07 15:15:39', '0.00', '19000.00', 1, '0.00', '', '0.00', ''),
(294, '371', 2, 1, '2470.00', '0.00', '2470.00', '2021-04-07', '2021-04-07 15:19:17', '0.00', '2470.00', 1, '0.00', '', '0.00', ''),
(295, '372', 2, 1, '1200.00', '10.00', '1190.00', '2021-04-07', '2021-04-07 15:22:16', '0.00', '1190.00', 1, '0.00', '', '0.00', ''),
(296, '373', 2, 1, '1000.00', '560.00', '440.00', '2021-04-07', '2021-04-07 15:23:25', '0.00', '440.00', 1, '0.00', '', '0.00', ''),
(297, '374', 2, 1, '1250.00', '0.00', '1250.00', '2021-04-07', '2021-04-07 15:27:07', '0.00', '1250.00', 1, '0.00', '', '0.00', ''),
(298, '375', 2, 1, '200.00', '0.00', '200.00', '2021-04-07', '2021-04-07 15:35:21', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(299, '376', 2, 1, '1000.00', '740.00', '260.00', '2021-04-08', '2021-04-08 05:14:47', '0.00', '260.00', 1, '0.00', '', '0.00', ''),
(300, '377', 2, 1, '200.00', '0.00', '200.00', '2021-04-08', '2021-04-08 05:38:11', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(301, '378', 2, 1, '50.00', '0.00', '50.00', '2021-04-08', '2021-04-08 05:41:28', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(302, '379', 2, 1, '4000.00', '0.00', '4000.00', '0000-00-00', '2021-04-08 09:46:41', '0.00', '4000.00', 1, '0.00', '', '0.00', ''),
(303, '380', 2, 1, '190.00', '0.00', '190.00', '0000-00-00', '2021-04-08 10:18:25', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(304, '381', 2, 1, '50.00', '0.00', '50.00', '2021-04-08', '2021-04-08 10:20:51', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(305, '385', 2, 1, '200.00', '0.00', '200.00', '2021-04-08', '2021-04-08 11:27:24', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(306, '386', 2, 1, '600.00', '50.00', '550.00', '2021-04-08', '2021-04-08 12:10:34', '0.00', '550.00', 1, '0.00', '', '0.00', ''),
(307, '387', 2, 1, '1500.00', '70.00', '1430.00', '2021-04-08', '2021-04-08 12:17:21', '0.00', '1430.00', 1, '0.00', '', '0.00', ''),
(308, '388', 2, 1, '1000.00', '800.00', '200.00', '2021-04-08', '2021-04-08 12:35:12', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(309, '389', 2, 1, '190.00', '0.00', '190.00', '2021-04-08', '2021-04-08 12:35:54', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(310, '390', 2, 1, '200.00', '70.00', '130.00', '2021-04-08', '2021-04-08 12:48:42', '0.00', '130.00', 1, '0.00', '', '0.00', ''),
(311, '391', 2, 1, '400.00', '35.00', '365.00', '2021-04-08', '2021-04-08 12:55:11', '0.00', '365.00', 1, '0.00', '', '0.00', ''),
(312, '392', 2, 1, '200.00', '10.00', '190.00', '2021-04-08', '2021-04-08 12:59:34', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(313, '393', 2, 1, '500.00', '0.00', '500.00', '2021-04-08', '2021-04-08 13:36:16', '0.00', '500.00', 1, '0.00', '', '0.00', ''),
(314, '394', 2, 1, '200.00', '100.00', '100.00', '0000-00-00', '2021-04-08 14:27:40', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(315, '395', 2, 1, '400.00', '30.00', '370.00', '2021-04-08', '2021-04-08 14:37:56', '0.00', '370.00', 1, '0.00', '', '0.00', ''),
(316, '396', 2, 1, '100.00', '10.00', '90.00', '0000-00-00', '2021-04-08 14:39:04', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(317, '397', 2, 1, '1000.00', '430.00', '570.00', '0000-00-00', '2021-04-08 14:45:52', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(318, '398', 2, 1, '1000.00', '450.00', '550.00', '0000-00-00', '2021-04-08 14:46:37', '0.00', '550.00', 1, '0.00', '', '0.00', ''),
(319, '399', 2, 1, '1000.00', '410.00', '590.00', '2021-04-08', '2021-04-08 14:49:36', '0.00', '590.00', 1, '0.00', '', '0.00', ''),
(320, '400', 2, 1, '220.00', '0.00', '220.00', '2021-04-08', '2021-04-08 14:51:13', '0.00', '220.00', 1, '0.00', '', '0.00', ''),
(321, '401', 2, 1, '1000.00', '780.00', '220.00', '2021-04-08', '2021-04-08 14:52:03', '0.00', '220.00', 1, '0.00', '', '0.00', ''),
(322, '402', 2, 1, '90.00', '0.00', '90.00', '2021-04-08', '2021-04-08 14:53:19', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(323, '403', 2, 1, '200.00', '110.00', '90.00', '2021-04-08', '2021-04-08 14:54:40', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(324, '404', 2, 1, '100.00', '10.00', '90.00', '2021-04-08', '2021-04-08 15:00:22', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(325, '405', 2, 1, '220.00', '0.00', '220.00', '2021-04-08', '2021-04-08 15:06:17', '0.00', '220.00', 1, '0.00', '', '0.00', ''),
(326, '406', 2, 1, '205.00', '0.00', '205.00', '2021-04-08', '2021-04-08 15:06:47', '0.00', '205.00', 1, '0.00', '', '0.00', ''),
(327, '407', 2, 1, '70.00', '0.00', '70.00', '2021-04-08', '2021-04-08 15:20:40', '0.00', '70.00', 1, '0.00', '', '0.00', ''),
(328, '408', 2, 1, '500.00', '300.00', '200.00', '2021-04-08', '2021-04-08 15:21:57', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(329, '410', 2, 1, '1150.00', '0.00', '1150.00', '2021-04-08', '2021-04-08 15:25:33', '0.00', '1150.00', 1, '0.00', '', '0.00', ''),
(330, '411', 2, 1, '200.00', '0.00', '200.00', '2021-04-08', '2021-04-08 15:26:40', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(331, '412', 2, 1, '500.00', '260.00', '240.00', '2021-04-08', '2021-04-08 15:27:52', '0.00', '240.00', 1, '0.00', '', '0.00', ''),
(332, '415', 2, 1, '150.00', '0.00', '150.00', '2021-04-08', '2021-04-08 15:30:45', '0.00', '150.00', 1, '0.00', '', '0.00', ''),
(333, '414', 2, 1, '150.00', '0.00', '150.00', '2021-04-08', '2021-04-08 15:31:07', '0.00', '150.00', 1, '0.00', '', '0.00', ''),
(334, '416', 2, 1, '550.00', '25.00', '525.00', '2021-04-08', '2021-04-08 15:46:45', '0.00', '525.00', 1, '0.00', '', '0.00', ''),
(335, '417', 2, 1, '100.00', '0.00', '100.00', '2021-04-08', '2021-04-08 15:51:07', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(336, '418', 2, 1, '520.00', '0.00', '520.00', '2021-04-09', '2021-04-09 05:00:50', '0.00', '520.00', 1, '0.00', '', '0.00', ''),
(337, '419', 2, 1, '30.00', '0.00', '30.00', '2021-04-09', '2021-04-09 05:10:53', '0.00', '30.00', 1, '0.00', '', '0.00', ''),
(338, '421', 2, 1, '100.00', '10.00', '90.00', '2021-04-09', '2021-04-09 05:26:55', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(339, '423', 2, 1, '1000.00', '820.00', '180.00', '2021-04-09', '2021-04-09 06:20:05', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(340, '424', 2, 1, '420.00', '0.00', '420.00', '2021-04-09', '2021-04-09 06:40:56', '0.00', '420.00', 1, '0.00', '', '0.00', ''),
(341, '425', 2, 1, '1175.00', '0.00', '1175.00', '2021-04-09', '2021-04-09 06:52:30', '0.00', '1175.00', 1, '0.00', '', '0.00', ''),
(342, '427', 2, 1, '220.00', '0.00', '220.00', '2021-04-09', '2021-04-09 08:08:21', '0.00', '220.00', 1, '0.00', '', '0.00', ''),
(343, '429', 2, 1, '1100.00', '0.00', '1100.00', '2021-04-09', '2021-04-09 08:34:55', '0.00', '1100.00', 1, '0.00', '', '0.00', ''),
(344, '431', 2, 1, '180.00', '0.00', '180.00', '2021-04-09', '2021-04-09 08:42:50', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(345, '432', 2, 1, '300.00', '0.00', '300.00', '2021-04-09', '2021-04-09 09:07:48', '0.00', '300.00', 1, '0.00', '', '0.00', ''),
(346, '434', 2, 1, '380.00', '0.00', '380.00', '2021-04-09', '2021-04-09 09:51:41', '0.00', '380.00', 1, '0.00', '', '0.00', ''),
(347, '435', 2, 1, '50.00', '0.00', '50.00', '2021-04-09', '2021-04-09 10:58:50', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(348, '438', 2, 1, '25.00', '0.00', '25.00', '2021-04-09', '2021-04-09 13:25:50', '0.00', '25.00', 1, '0.00', '', '0.00', ''),
(349, '439', 2, 1, '500.00', '310.00', '190.00', '2021-04-09', '2021-04-09 13:44:42', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(350, '440', 2, 1, '1000.00', '800.00', '200.00', '2021-04-09', '2021-04-09 13:51:43', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(351, '441', 2, 1, '1470.00', '0.00', '1470.00', '2021-04-09', '2021-04-09 13:59:51', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(352, '442', 2, 1, '1530.00', '0.00', '1530.00', '2021-04-09', '2021-04-09 14:02:32', '0.00', '1530.00', 1, '0.00', '', '0.00', ''),
(353, '443', 2, 1, '105.00', '0.00', '105.00', '2021-04-09', '2021-04-09 14:20:43', '0.00', '105.00', 1, '0.00', '', '0.00', ''),
(354, '444', 2, 1, '1500.00', '30.00', '1470.00', '2021-04-09', '2021-04-09 14:26:08', '0.00', '1470.00', 1, '0.00', '', '0.00', ''),
(355, '445', 2, 1, '400.00', '150.00', '250.00', '2021-04-09', '2021-04-09 14:27:21', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(356, '446', 2, 1, '500.00', '70.00', '430.00', '2021-04-09', '2021-04-09 14:31:43', '0.00', '430.00', 1, '0.00', '', '0.00', ''),
(357, '447', 2, 1, '1200.50', '113.00', '1087.50', '2021-04-09', '2021-04-09 14:50:56', '0.00', '1087.00', 1, '0.00', '', '0.00', ''),
(358, '450', 2, 1, '3620.00', '0.00', '3620.00', '2021-04-09', '2021-04-09 14:59:41', '0.00', '3620.00', 1, '0.00', '', '0.00', ''),
(359, '451', 2, 1, '120.00', '0.00', '120.00', '2021-04-09', '2021-04-09 15:15:42', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(360, '452', 2, 1, '100.00', '40.00', '60.00', '2021-04-09', '2021-04-09 15:35:24', '0.00', '60.00', 1, '0.00', '', '0.00', ''),
(361, '453', 2, 1, '205.00', '0.00', '205.00', '2021-04-09', '2021-04-09 15:45:04', '0.00', '205.00', 1, '0.00', '', '0.00', ''),
(362, '449', 2, 1, '1200.00', '0.00', '1200.00', '2021-04-09', '2021-04-09 15:49:18', '0.00', '1200.00', 1, '0.00', '', '0.00', ''),
(363, '455', 2, 1, '1000.00', '770.00', '230.00', '2021-04-09', '2021-04-09 15:49:46', '0.00', '230.00', 1, '0.00', '', '0.00', ''),
(364, '456', 2, 1, '90.00', '0.00', '90.00', '2021-04-10', '2021-04-10 05:15:25', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(365, '458', 2, 1, '100.00', '10.00', '90.00', '2021-04-10', '2021-04-10 06:02:17', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(366, '459', 2, 1, '2000.00', '480.00', '1520.00', '2021-04-10', '2021-04-10 06:30:09', '0.00', '1520.00', 1, '0.00', '', '0.00', ''),
(367, '461', 2, 1, '100.00', '0.00', '100.00', '2021-04-10', '2021-04-10 06:45:30', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(368, '462', 2, 1, '1000.00', '250.00', '750.00', '2021-04-10', '2021-04-10 07:14:20', '0.00', '750.00', 1, '0.00', '', '0.00', ''),
(369, '463', 2, 1, '55.00', '0.00', '55.00', '2021-04-10', '2021-04-10 07:18:56', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(370, '465', 2, 1, '115.00', '0.00', '115.00', '2021-04-10', '2021-04-10 13:29:45', '0.00', '115.00', 1, '0.00', '', '0.00', ''),
(371, '466', 2, 1, '1000.00', '430.00', '570.00', '2021-04-10', '2021-04-10 13:44:27', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(372, '468', 2, 1, '1300.00', '475.00', '825.00', '2021-04-10', '2021-04-10 14:04:15', '0.00', '825.00', 1, '0.00', '', '0.00', ''),
(373, '469', 2, 1, '2750.00', '0.00', '2750.00', '2021-04-10', '2021-04-10 14:09:16', '0.00', '2750.00', 1, '0.00', '', '0.00', ''),
(374, '470', 2, 1, '120.00', '0.00', '120.00', '2021-04-10', '2021-04-10 14:11:51', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(375, '471', 2, 1, '150.00', '0.00', '150.00', '2021-04-10', '2021-04-10 14:12:30', '0.00', '150.00', 1, '0.00', '', '0.00', ''),
(376, '472', 2, 1, '200.00', '65.00', '135.00', '2021-04-10', '2021-04-10 14:24:02', '0.00', '135.00', 1, '0.00', '', '0.00', ''),
(377, '473', 2, 1, '100.00', '0.00', '100.00', '2021-04-10', '2021-04-10 14:25:15', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(378, '474', 2, 1, '300.00', '0.00', '300.00', '2021-04-10', '2021-04-10 14:47:45', '0.00', '300.00', 1, '0.00', '', '0.00', ''),
(379, '475', 2, 1, '100.00', '0.00', '100.00', '2021-04-10', '2021-04-10 14:53:54', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(380, '476', 2, 1, '4750.00', '0.00', '4750.00', '2021-04-10', '2021-04-10 14:58:13', '0.00', '4750.00', 1, '0.00', '', '0.00', ''),
(381, '477', 2, 1, '500.00', '50.00', '450.00', '2021-04-10', '2021-04-10 15:08:33', '0.00', '450.00', 1, '0.00', '', '0.00', ''),
(382, '478', 2, 1, '130.00', '0.00', '130.00', '2021-04-10', '2021-04-10 15:14:32', '0.00', '130.00', 1, '0.00', '', '0.00', ''),
(383, '479', 2, 1, '150.00', '0.00', '150.00', '2021-04-10', '2021-04-10 15:16:35', '0.00', '150.00', 1, '0.00', '', '0.00', ''),
(384, '480', 2, 1, '2560.00', '0.00', '2560.00', '2021-04-10', '2021-04-10 15:31:47', '0.00', '2560.00', 1, '0.00', '', '0.00', ''),
(385, '481', 2, 1, '200.00', '0.00', '200.00', '2021-04-10', '2021-04-10 15:32:19', '0.00', '200.00', 1, '0.00', '', '0.00', ''),
(386, '482', 2, 1, '300.00', '0.00', '300.00', '2021-04-10', '2021-04-10 15:33:24', '0.00', '300.00', 1, '0.00', '', '0.00', '');
INSERT INTO `kp_sale_payment` (`pay_id`, `sale_id`, `user_id`, `cust_id`, `tendered`, `balance`, `paid_total`, `pay_date`, `datime`, `modesc`, `mode1`, `type`, `mode2`, `moderef2`, `mode3`, `moderef3`) VALUES
(387, '483', 2, 1, '100.00', '50.00', '50.00', '2021-04-10', '2021-04-10 15:56:59', '0.00', '50.00', 1, '0.00', '', '0.00', ''),
(388, '484', 2, 1, '420.00', '30.00', '390.00', '2021-04-10', '2021-04-10 15:58:57', '0.00', '390.00', 1, '0.00', '', '0.00', ''),
(389, '485', 2, 1, '1000.00', '470.00', '530.00', '2021-04-10', '2021-04-10 16:02:32', '0.00', '530.00', 1, '0.00', '', '0.00', ''),
(390, '486', 2, 1, '550.00', '430.00', '120.00', '2021-04-10', '2021-04-10 16:12:56', '0.00', '120.00', 1, '0.00', '', '0.00', ''),
(391, '487', 2, 1, '340.00', '20.00', '320.00', '2021-04-10', '2021-04-10 16:16:18', '0.00', '320.00', 1, '0.00', '', '0.00', ''),
(392, '488', 2, 1, '900.00', '0.00', '900.00', '2021-04-11', '2021-04-11 09:02:15', '0.00', '900.00', 1, '0.00', '', '0.00', ''),
(393, '489', 2, 1, '1000.00', '460.00', '540.00', '2021-04-11', '2021-04-11 09:15:01', '0.00', '540.00', 1, '0.00', '', '0.00', ''),
(394, '490', 2, 1, '500.00', '320.00', '180.00', '2021-04-11', '2021-04-11 09:43:35', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(395, '491', 2, 1, '3330.00', '0.00', '3330.00', '2021-04-11', '2021-04-11 10:17:50', '0.00', '3330.00', 1, '0.00', '', '0.00', ''),
(396, '493', 2, 1, '1000.00', '675.00', '325.00', '2021-04-11', '2021-04-11 10:33:58', '0.00', '325.00', 1, '0.00', '', '0.00', ''),
(397, '495', 2, 1, '2085.00', '0.00', '2085.00', '2021-04-11', '2021-04-11 11:51:16', '0.00', '2085.00', 1, '0.00', '', '0.00', ''),
(398, '496', 2, 1, '18500.00', '0.00', '18500.00', '2021-04-11', '2021-04-11 12:05:49', '0.00', '18500.00', 1, '0.00', '', '0.00', ''),
(399, '497', 2, 1, '8100.00', '0.00', '8100.00', '2021-04-11', '2021-04-11 12:08:30', '0.00', '8100.00', 1, '0.00', '', '0.00', ''),
(400, '492', 2, 1, '10600.40', '64.00', '10536.40', '2021-04-11', '2021-04-11 12:16:40', '0.00', '10536.00', 1, '0.00', '', '0.00', ''),
(401, '498', 2, 1, '430.00', '0.00', '430.00', '2021-04-11', '2021-04-11 12:44:26', '0.00', '430.00', 1, '0.00', '', '0.00', ''),
(402, '499', 2, 1, '1000.00', '410.00', '590.00', '2021-04-11', '2021-04-11 13:00:55', '0.00', '590.00', 1, '0.00', '', '0.00', ''),
(403, '502', 2, 1, '3500.00', '0.00', '3500.00', '2021-04-11', '2021-04-11 13:16:28', '0.00', '3500.00', 1, '0.00', '', '0.00', ''),
(404, '503', 2, 1, '90.00', '0.00', '90.00', '2021-04-11', '2021-04-11 13:21:35', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(405, '504', 2, 1, '1000.00', '360.00', '640.00', '2021-04-11', '2021-04-11 13:29:13', '0.00', '640.00', 1, '0.00', '', '0.00', ''),
(406, '505', 2, 1, '1050.00', '0.00', '1050.00', '2021-04-11', '2021-04-11 13:36:33', '0.00', '1050.00', 1, '0.00', '', '0.00', ''),
(407, '506', 2, 1, '550.00', '70.00', '480.00', '2021-04-11', '2021-04-11 13:39:08', '0.00', '480.00', 1, '0.00', '', '0.00', ''),
(408, '507', 2, 1, '1000.00', '640.00', '360.00', '2021-04-11', '2021-04-11 13:41:39', '0.00', '360.00', 1, '0.00', '', '0.00', ''),
(409, '508', 2, 1, '195.00', '0.00', '195.00', '2021-04-11', '2021-04-11 14:04:58', '0.00', '195.00', 1, '0.00', '', '0.00', ''),
(410, '509', 2, 1, '4605.00', '0.00', '4605.00', '2021-04-11', '2021-04-11 14:08:59', '0.00', '4605.00', 1, '0.00', '', '0.00', ''),
(411, '510', 2, 1, '500.00', '20.00', '480.00', '2021-04-12', '2021-04-12 05:17:12', '0.00', '480.00', 1, '0.00', '', '0.00', ''),
(412, '511', 2, 1, '130.00', '0.00', '130.00', '2021-04-12', '2021-04-12 05:40:41', '0.00', '130.00', 1, '0.00', '', '0.00', ''),
(413, '514', 2, 1, '850.00', '0.00', '850.00', '2021-04-12', '2021-04-12 06:34:06', '0.00', '850.00', 1, '0.00', '', '0.00', ''),
(414, '515', 2, 1, '125.00', '0.00', '125.00', '2021-04-12', '2021-04-12 06:36:37', '0.00', '125.00', 1, '0.00', '', '0.00', ''),
(415, '516', 2, 1, '500.00', '275.00', '225.00', '2021-04-12', '2021-04-12 06:46:17', '0.00', '225.00', 1, '0.00', '', '0.00', ''),
(416, '517', 2, 1, '500.00', '50.00', '450.00', '2021-04-12', '2021-04-12 06:47:34', '0.00', '450.00', 1, '0.00', '', '0.00', ''),
(417, '518', 2, 1, '100.00', '45.00', '55.00', '2021-04-12', '2021-04-12 07:04:07', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(418, '520', 2, 1, '100.00', '0.00', '100.00', '2021-04-12', '2021-04-12 07:47:23', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(419, '521', 2, 1, '2140.00', '0.00', '2140.00', '2021-04-12', '2021-04-12 09:06:01', '0.00', '2140.00', 1, '0.00', '', '0.00', ''),
(420, '523', 2, 1, '850.00', '0.00', '850.00', '2021-04-12', '2021-04-12 09:07:21', '0.00', '850.00', 1, '0.00', '', '0.00', ''),
(421, '527', 2, 1, '100.00', '0.00', '100.00', '2021-04-12', '2021-04-12 09:42:53', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(422, '528', 2, 1, '190.00', '0.00', '190.00', '2021-04-12', '2021-04-12 09:52:55', '0.00', '190.00', 1, '0.00', '', '0.00', ''),
(423, '529', 2, 1, '580.00', '0.00', '580.00', '2021-04-12', '2021-04-12 10:05:41', '0.00', '580.00', 1, '0.00', '', '0.00', ''),
(424, '531', 2, 1, '110.00', '0.00', '110.00', '2021-04-12', '2021-04-12 10:19:08', '0.00', '110.00', 1, '0.00', '', '0.00', ''),
(425, '530', 2, 1, '1385.00', '0.00', '1385.00', '2021-04-12', '2021-04-12 10:20:03', '0.00', '1385.00', 1, '0.00', '', '0.00', ''),
(426, '532', 2, 1, '250.00', '0.00', '250.00', '2021-04-12', '2021-04-12 11:18:27', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(427, '533', 2, 1, '70.00', '0.00', '70.00', '2021-04-12', '2021-04-12 11:24:28', '0.00', '70.00', 1, '0.00', '', '0.00', ''),
(428, '534', 2, 1, '1050.00', '0.00', '1050.00', '2021-04-12', '2021-04-12 11:32:42', '0.00', '1050.00', 1, '0.00', '', '0.00', ''),
(429, '537', 2, 1, '25.00', '0.00', '25.00', '2021-04-12', '2021-04-12 12:52:40', '0.00', '25.00', 1, '0.00', '', '0.00', ''),
(430, '538', 2, 1, '60.00', '5.00', '55.00', '2021-04-12', '2021-04-12 12:57:05', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(431, '539', 2, 1, '3000.00', '350.00', '2650.00', '2021-04-12', '2021-04-12 13:03:39', '0.00', '2650.00', 1, '0.00', '', '0.00', ''),
(432, '540', 2, 1, '285.00', '0.00', '285.00', '2021-04-12', '2021-04-12 13:13:35', '0.00', '285.00', 1, '0.00', '', '0.00', ''),
(433, '541', 2, 1, '380.00', '0.00', '380.00', '2021-04-12', '2021-04-12 13:13:58', '0.00', '380.00', 1, '0.00', '', '0.00', ''),
(434, '542', 2, 1, '770.00', '0.00', '770.00', '2021-04-12', '2021-04-12 13:34:22', '0.00', '770.00', 1, '0.00', '', '0.00', ''),
(435, '543', 2, 1, '420.00', '0.00', '420.00', '2021-04-12', '2021-04-12 13:37:24', '0.00', '420.00', 1, '0.00', '', '0.00', ''),
(436, '544', 2, 1, '300.00', '50.00', '250.00', '2021-04-12', '2021-04-12 13:50:51', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(437, '545', 2, 1, '500.00', '315.00', '185.00', '2021-04-12', '2021-04-12 14:04:13', '0.00', '185.00', 1, '0.00', '', '0.00', ''),
(438, '546', 2, 1, '565.00', '0.00', '565.00', '2021-04-12', '2021-04-12 14:07:51', '0.00', '565.00', 1, '0.00', '', '0.00', ''),
(439, '547', 2, 1, '100.00', '10.00', '90.00', '2021-04-12', '2021-04-12 14:16:25', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(440, '549', 2, 1, '1000.00', '820.00', '180.00', '2021-04-12', '2021-04-12 14:43:39', '0.00', '180.00', 1, '0.00', '', '0.00', ''),
(441, '550', 2, 1, '360.00', '0.00', '360.00', '2021-04-12', '2021-04-12 14:47:31', '0.00', '360.00', 1, '0.00', '', '0.00', ''),
(442, '548', 2, 1, '490.00', '0.00', '490.00', '2021-04-12', '2021-04-12 14:49:10', '0.00', '490.00', 1, '0.00', '', '0.00', ''),
(443, '551', 2, 1, '1430.00', '0.00', '1430.00', '2021-04-12', '2021-04-12 14:50:55', '0.00', '1430.00', 1, '0.00', '', '0.00', ''),
(444, '552', 2, 1, '1000.00', '450.00', '550.00', '2021-04-12', '2021-04-12 14:59:22', '0.00', '550.00', 1, '0.00', '', '0.00', ''),
(445, '553', 2, 1, '200.00', '5.00', '195.00', '2021-04-12', '2021-04-12 15:01:17', '0.00', '195.00', 1, '0.00', '', '0.00', ''),
(446, '555', 2, 1, '335.00', '0.00', '335.00', '2021-04-12', '2021-04-12 15:15:41', '0.00', '335.00', 1, '0.00', '', '0.00', ''),
(447, '556', 2, 1, '400.00', '70.00', '330.00', '2021-04-12', '2021-04-12 15:22:11', '0.00', '330.00', 1, '0.00', '', '0.00', ''),
(448, '557', 2, 1, '1000.00', '885.00', '115.00', '2021-04-12', '2021-04-12 15:24:27', '0.00', '115.00', 1, '0.00', '', '0.00', ''),
(449, '558', 2, 1, '145.00', '0.00', '145.00', '2021-04-13', '2021-04-13 05:29:40', '0.00', '145.00', 1, '0.00', '', '0.00', ''),
(450, '559', 2, 1, '1000.00', '750.00', '250.00', '2021-04-13', '2021-04-13 05:58:46', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(451, '560', 2, 1, '250.00', '0.00', '250.00', '2021-04-13', '2021-04-13 06:24:12', '0.00', '250.00', 1, '0.00', '', '0.00', ''),
(452, '561', 2, 1, '100.00', '45.00', '55.00', '2021-04-13', '2021-04-13 07:30:25', '0.00', '55.00', 1, '0.00', '', '0.00', ''),
(453, '562', 2, 1, '100.00', '0.00', '100.00', '2021-04-13', '2021-04-13 07:43:57', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(454, '563', 2, 1, '450.00', '0.00', '450.00', '2021-04-13', '2021-04-13 07:53:41', '0.00', '450.00', 1, '0.00', '', '0.00', ''),
(455, '564', 2, 1, '530.00', '0.00', '530.00', '2021-04-13', '2021-04-13 08:05:13', '0.00', '530.00', 1, '0.00', '', '0.00', ''),
(456, '565', 2, 1, '90.00', '0.00', '90.00', '2021-04-13', '2021-04-13 08:06:55', '0.00', '90.00', 1, '0.00', '', '0.00', ''),
(459, '566', 2, 1, '2000.00', '110.00', '1890.00', '2021-04-13', '2021-04-13 10:04:44', '0.00', '1890.00', 1, '0.00', '', '0.00', ''),
(460, '568', 2, 1, '2100.00', '0.00', '2100.00', '2021-04-13', '2021-04-13 10:15:39', '0.00', '2100.00', 1, '0.00', '', '0.00', ''),
(461, '571', 2, 1, '1500.00', '500.00', '1000.00', '2021-04-13', '2021-04-13 10:29:14', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(464, '574', 2, 1, '1935.00', '0.00', '1935.00', '2021-04-13', '2021-04-13 11:42:13', '0.00', '1935.00', 1, '0.00', '', '0.00', ''),
(465, '575', 2, 2, '150.00', '10.00', '140.00', '2021-04-22', '2021-04-22 19:58:47', '0.00', '140.00', 1, '0.00', '', '0.00', ''),
(469, '577', 2, 2, '50.00', '0.00', '50.00', '2021-04-23', '2021-04-22 21:52:05', '0.00', '50.00', 2, '0.00', '', '0.00', ''),
(470, '577', 2, 2, '500.00', '0.00', '500.00', '2021-04-23', '2021-04-22 21:54:04', '0.00', '500.00', 2, '0.00', '', '0.00', ''),
(471, '577', 2, 2, '100.00', '0.00', '100.00', '2021-04-23', '2021-04-22 22:07:15', '0.00', '100.00', 2, '0.00', '', '0.00', ''),
(472, '579', 2, 2, '6000.00', '850.00', '5150.00', '2021-04-25', '2021-04-25 07:29:16', '0.00', '5150.00', 1, '0.00', '', '0.00', ''),
(473, '581', 2, 1, '5400.00', '0.00', '5400.00', '2021-04-25', '2021-04-25 10:19:10', '0.00', '5400.00', 1, '0.00', '', '0.00', ''),
(474, '582', 2, 1, '1000.00', '0.00', '1000.00', '2021-04-25', '2021-05-11 09:49:37', '0.00', '1000.00', 1, '0.00', '', '0.00', ''),
(475, '585', 2, 1, '100.00', '0.00', '100.00', '2021-05-22', '2021-05-22 11:16:10', '0.00', '100.00', 1, '0.00', '', '0.00', ''),
(476, '586', 2, 3, '500.00', '0.00', '500.00', '2021-05-22', '2021-05-22 11:28:54', '0.00', '500.00', 2, '0.00', '', '0.00', ''),
(478, '587', 2, 2, '200.00', '0.00', '200.00', '2021-05-22', '2021-05-22 11:35:20', '200.00', '0.00', 1, '0.00', '', '0.00', ''),
(480, '588', 2, 3, '20000.00', '0.00', '20000.00', '2021-06-07', '2021-06-07 11:54:12', '0.00', '20000.00', 1, '0.00', '', '0.00', ''),
(481, '589', 2, 1, '8500.00', '0.00', '8500.00', '2021-06-07', '2021-06-07 12:06:14', '0.00', '8500.00', 1, '0.00', '', '0.00', ''),
(482, '593', 2, 3, '10000.00', '0.00', '10000.00', '2021-06-11', '2021-06-11 08:46:32', '0.00', '10000.00', 1, '0.00', '', '0.00', ''),
(483, '597', 2, 3, '9780.00', '0.00', '9780.00', '2021-06-17', '2021-06-17 11:52:05', '0.00', '9780.00', 1, '0.00', '', '0.00', ''),
(484, '602', 2, 1, '14838.00', '0.00', '14838.00', '2021-07-01', '2021-07-01 11:57:26', '0.00', '0.00', 1, '14838.00', '0hgjkkjkhj', '0.00', ''),
(485, '602', 2, 1, '14838.00', '0.00', '14838.00', '2021-07-01', '2021-07-01 11:57:56', '0.00', '14838.00', 1, '0.00', '', '0.00', ''),
(486, '602', 2, 1, '14838.00', '0.00', '14838.00', '2021-07-01', '2021-07-01 11:59:02', '0.00', '0.00', 1, '14838.00', '0hgjkkjkhj', '0.00', ''),
(487, '577, 600, 601, 603', 2, 2, '20000.00', '0.00', '20000.00', '2021-07-01', '2021-07-01 12:48:34', '0.00', '20000.00', 2, '0.00', '', '0.00', ''),
(488, '586', 2, 3, '200.00', '0.00', '200.00', '2021-07-06', '2021-07-06 04:39:17', '0.00', '200.00', 2, '0.00', '', '0.00', ''),
(489, '590, 592', 2, 3, '10700.00', '0.00', '10700.00', '2021-07-06', '2021-07-06 05:39:24', '0.00', '0.00', 2, '0.00', '', '10700.00', '45'),
(490, '592', 2, 3, '1254.00', '0.00', '1254.00', '2021-07-06', '2021-07-06 06:28:31', '0.00', '0.00', 2, '1254.00', '', '0.00', ''),
(492, '592', 2, 3, '46.00', '0.00', '46.00', '2021-07-06', '2021-07-06 06:32:36', '0.00', '46.00', 2, '0.00', '', '0.00', ''),
(493, '592', 2, 3, '700.00', '0.00', '700.00', '2021-07-06', '2021-07-06 06:37:13', '0.00', '700.00', 2, '0.00', '', '0.00', ''),
(494, '592', 2, 3, '500.00', '0.00', '500.00', '2021-07-06', '2021-07-06 06:47:14', '0.00', '500.00', 2, '0.00', '', '0.00', ''),
(495, '592', 2, 3, '4500.00', '0.00', '4500.00', '2021-07-06', '2021-07-06 06:48:37', '0.00', '500.00', 2, '1000.00', '', '3000.00', ''),
(496, '592', 2, 3, '11000.00', '0.00', '11000.00', '2021-07-06', '2021-07-06 10:02:19', '0.00', '0.00', 2, '0.00', '', '11000.00', '0FDFDFDF'),
(497, '592, 594', 2, 3, '20890.00', '0.00', '20890.00', '2021-07-06', '2021-07-06 10:05:54', '0.00', '0.00', 2, '0.00', '', '20890.00', 'THFTTRTEFB'),
(498, '594', 2, 3, '500.00', '0.00', '500.00', '2021-07-06', '2021-07-06 10:09:26', '0.00', '0.00', 2, '500.00', '0hgjkkjkhj', '0.00', ''),
(499, '594', 2, 3, '610.00', '0.00', '610.00', '2021-07-06', '2021-07-06 10:09:54', '0.00', '610.00', 2, '0.00', '', '0.00', ''),
(503, '607', 2, 1, '13224.00', '1824.00', '11400.00', '2021-07-06', '2021-07-06 10:30:04', '0.00', '11400.00', 1, '0.00', '', '0.00', ''),
(504, '607', 2, 1, '11400.00', '0.00', '11400.00', '2021-07-06', '2021-07-06 10:30:42', '0.00', '11400.00', 1, '0.00', '', '0.00', ''),
(505, '607', 2, 1, '11400.00', '0.00', '11400.00', '2021-07-06', '2021-07-06 10:31:15', '0.00', '0.00', 1, '11400.00', '0hgjkkjkhj', '0.00', ''),
(506, '607', 2, 1, '11400.00', '0.00', '11400.00', '2021-07-06', '2021-07-06 10:31:44', '0.00', '11400.00', 1, '0.00', '', '0.00', ''),
(507, '607', 2, 1, '63840.00', '0.00', '63840.00', '2021-07-12', '2021-07-12 04:53:24', '0.00', '0.00', 1, '63840.00', '', '0.00', ''),
(508, '607', 2, 1, '63840.00', '0.00', '63840.00', '2021-07-12', '2021-07-12 05:02:18', '0.00', '63840.00', 1, '0.00', '', '0.00', ''),
(509, '607', 2, 1, '63840.00', '0.00', '63840.00', '2021-07-12', '2021-07-12 05:04:58', '0.00', '63840.00', 1, '0.00', '', '0.00', ''),
(510, '609', 2, 1, '50.00', '30.00', '20.00', '2021-07-12', '2021-07-12 06:18:37', '0.00', '20.00', 1, '0.00', '', '0.00', ''),
(511, '610', 1, 5, '18000.00', '1000.00', '17000.00', '2021-07-12', '2021-07-12 06:22:07', '0.00', '17000.00', 1, '0.00', '', '0.00', ''),
(512, '597', 2, 3, '15000.00', '0.00', '15000.00', '2021-07-15', '2021-07-15 07:08:09', '0.00', '15000.00', 1, '0.00', '', '0.00', ''),
(513, '598', 2, 3, '12000.00', '144.00', '11856.00', '2021-07-15', '2021-07-15 07:10:21', '0.00', '11856.00', 1, '0.00', '', '0.00', ''),
(514, '602', 2, 1, '15000.00', '162.00', '14838.00', '2021-07-01', '2021-07-15 07:16:38', '0.00', '14838.00', 1, '0.00', '', '0.00', ''),
(515, '616', 2, 3, '56000.00', '51360.00', '4640.00', '2021-07-15', '2021-07-15 07:22:32', '0.00', '4640.00', 1, '0.00', '', '0.00', ''),
(516, '580', 2, 2, '100000.00', '23392.00', '76608.00', '2021-04-25', '2021-07-17 15:36:45', '0.00', '76608.00', 1, '0.00', '', '0.00', ''),
(517, '621', 2, 1, '3000.00', '264.00', '2736.00', '2021-07-22', '2021-07-22 13:26:14', '0.00', '2736.00', 1, '0.00', '', '0.00', ''),
(518, '622', 2, 1, '3000.00', '264.00', '2736.00', '2021-07-22', '2021-07-22 13:27:30', '0.00', '2736.00', 1, '0.00', '', '0.00', ''),
(519, '624', 2, 1, '80.00', '0.00', '80.00', '2021-07-23', '2021-07-23 19:54:55', '0.00', '80.00', 1, '0.00', '', '0.00', ''),
(520, '618', 2, 5, '4000.00', '352.00', '3648.00', '2021-07-22', '2021-07-23 19:55:33', '0.00', '3648.00', 1, '0.00', '', '0.00', ''),
(521, '626', 2, 5, '15000.00', '236.00', '14764.00', '2021-08-18', '2021-08-18 19:00:56', '0.00', '14764.00', 1, '0.00', '', '0.00', ''),
(522, '626', 2, 5, '15000.00', '236.00', '14764.00', '2021-08-18', '2021-08-18 19:01:30', '0.00', '14764.00', 1, '0.00', '', '0.00', ''),
(523, '630', 2, 5, '6000.00', '0.00', '6000.00', '2021-08-25', '2021-08-25 12:09:48', '0.00', '6000.00', 1, '0.00', '', '0.00', ''),
(524, '631', 2, 5, '570.00', '0.00', '570.00', '2021-08-25', '2021-08-25 12:14:06', '0.00', '570.00', 1, '0.00', '', '0.00', ''),
(525, '629, 640', 2, 3, '150000.00', '0.00', '150000.00', '2021-08-30', '2021-08-30 15:06:08', '0.00', '0.00', 2, '0.00', '', '150000.00', '0kilu45'),
(526, '641', 2, 3, '1450.00', '0.00', '1450.00', '2021-08-30', '2021-08-30 16:19:49', '0.00', '0.00', 1, '1450.00', '0ihihjjjghjkh', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_reprint`
--

CREATE TABLE `kp_sale_reprint` (
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appr_by` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sale_reprint`
--

INSERT INTO `kp_sale_reprint` (`sale_id`, `user_id`, `appr_by`, `day`, `datime`) VALUES
(1, 1, 2, '2021-03-22', '2021-03-22 13:45:52'),
(1, 1, 2, '2021-03-22', '2021-03-22 13:46:21'),
(1, 1, 2, '2021-03-22', '2021-03-22 13:46:42'),
(116, 2, 2, '2021-03-31', '2021-03-31 17:19:11'),
(103, 2, 2, '2021-03-31', '2021-03-31 17:24:06'),
(113, 2, 2, '2021-03-31', '2021-03-31 17:24:32'),
(109, 2, 2, '2021-03-31', '2021-03-31 17:49:05'),
(135, 2, 2, '2021-04-01', '2021-04-01 09:48:49'),
(134, 2, 2, '2021-04-01', '2021-04-01 10:00:12'),
(171, 2, 2, '2021-04-02', '2021-04-02 13:17:06'),
(173, 2, 2, '2021-04-02', '2021-04-02 13:31:35'),
(177, 2, 2, '2021-04-02', '2021-04-02 13:32:28'),
(251, 2, 2, '2021-04-03', '2021-04-03 16:49:30'),
(321, 2, 2, '2021-04-06', '2021-04-06 15:39:12'),
(350, 2, 2, '2021-04-07', '2021-04-07 12:54:45'),
(368, 2, 2, '2021-04-07', '2021-04-07 17:44:26'),
(378, 2, 2, '2021-04-08', '2021-04-08 13:38:27'),
(376, 2, 2, '2021-04-08', '2021-04-08 17:01:23'),
(434, 2, 2, '2021-04-09', '2021-04-09 16:20:56'),
(468, 2, 2, '2021-04-10', '2021-04-10 17:05:30'),
(468, 2, 2, '2021-04-10', '2021-04-10 17:05:56'),
(468, 2, 2, '2021-04-10', '2021-04-10 17:06:19'),
(571, 2, 2, '2021-04-13', '2021-04-13 13:33:09'),
(571, 2, 2, '2021-04-13', '2021-04-13 13:35:26'),
(570, 2, 2, '2021-04-13', '2021-04-13 13:36:20'),
(570, 2, 2, '2021-04-13', '2021-04-13 13:40:03'),
(609, 2, 2, '2021-07-12', '2021-07-12 09:19:14'),
(607, 2, 2, '2021-07-12', '2021-07-12 09:20:16'),
(617, 2, 2, '2021-07-17', '2021-07-17 19:16:58'),
(617, 2, 2, '2021-07-17', '2021-07-17 19:18:22'),
(646, 2, 2, '2021-08-31', '2021-08-31 15:35:30'),
(643, 2, 2, '2021-08-31', '2021-08-31 15:36:47'),
(645, 2, 2, '2021-08-31', '2021-08-31 15:37:44'),
(647, 2, 2, '2021-08-31', '2021-08-31 15:43:32'),
(645, 2, 2, '2021-08-31', '2021-08-31 15:52:44'),
(647, 2, 2, '2021-08-31', '2021-08-31 16:02:59'),
(646, 2, 2, '2021-08-31', '2021-08-31 16:16:28'),
(646, 2, 2, '2021-08-31', '2021-08-31 16:21:16'),
(646, 2, 2, '2021-08-31', '2021-08-31 16:30:33'),
(646, 2, 2, '2021-08-31', '2021-08-31 16:34:17'),
(650, 2, 2, '2021-08-31', '2021-08-31 16:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `kp_sale_status`
--

CREATE TABLE `kp_sale_status` (
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `mkt` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sale_status`
--

INSERT INTO `kp_sale_status` (`sale_id`, `user_id`, `cust_id`, `mkt`, `status`, `type`, `price`, `day`) VALUES
(620, 2, 0, 2, 3, 2, 0, '2021-07-22'),
(648, 11, 10, 0, 2, 2, 0, '2021-08-31'),
(651, 7, 1, 0, 2, 2, 0, '2021-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `kp_sc`
--

CREATE TABLE `kp_sc` (
  `cust_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sc`
--

INSERT INTO `kp_sc` (`cust_id`, `amount`, `status`) VALUES
(1, '820.00', 2),
(2, '1800.00', 2),
(3, '30500.00', 2),
(5, '50000.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_sc_hist`
--

CREATE TABLE `kp_sc_hist` (
  `cust_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `trans` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `ret_id` int(11) DEFAULT NULL,
  `trans_type` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `reason` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_sc_hist`
--

INSERT INTO `kp_sc_hist` (`cust_id`, `amount`, `trans`, `user_id`, `trans_id`, `ret_id`, `trans_type`, `reason`, `day`, `datime`) VALUES
(1, '820.00', 'SALE RETURN', 2, 1, 1, '1', NULL, '2021-04-23', '2021-04-22 21:47:40'),
(2, '2000.00', 'CUSTOMER PAID UPFRONT', 2, 477, NULL, 'UP_PAY', NULL, '2021-05-22', '2021-05-22 11:30:17'),
(2, '200.00', 'CASH SALE PAYMENT', 2, 587, NULL, '1', NULL, '2021-05-22', '2021-05-22 11:35:20'),
(3, '500.00', 'CUSTOMER PAID UPFRONT', 2, 479, NULL, 'UP_PAY', NULL, '2021-06-07', '2021-06-07 08:09:58'),
(5, '50000.00', 'CUSTOMER PAID UPFRONT', 2, 500, NULL, 'UP_PAY', NULL, '2021-07-06', '2021-07-06 10:24:56'),
(3, '30000.00', 'CUSTOMER PAID UPFRONT', 2, 501, NULL, 'UP_PAY', NULL, '2021-07-06', '2021-07-06 10:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `kp_settings_gen`
--

CREATE TABLE `kp_settings_gen` (
  `id` int(11) NOT NULL,
  `company_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_tag` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone1` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone2` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kra_pin` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `vat` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tax_type` int(11) NOT NULL,
  `mpesa` int(11) NOT NULL,
  `mpesa_no` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mpesa_account` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image_path` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `website` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_settings_gen`
--

INSERT INTO `kp_settings_gen` (`id`, `company_name`, `company_tag`, `address`, `phone1`, `phone2`, `email`, `kra_pin`, `vat`, `tax_type`, `mpesa`, `mpesa_no`, `mpesa_account`, `image_path`, `website`) VALUES
(1, 'BIIKEI TRADING LTD', 'BIIKEI', 'P.O BOX 5434-00200\r\nNBO  ,Kenya    ', '0722889200', '0736384402', 'biikeitrading@gmail.com', 'P051564572N', 'P051564572N', 1, 1, '0722889200', '', '../../assets/img/logo/BIIKEI TRADING LTD.png', ''),
(2, 'JIMFRA TRADING CO LTD', 'JIMFRA', 'P.O BOX 5434-00200\r\nNBO  ,KENYA   ', '0723625776', '0736384402', 'jimfratradingltd@gmail.com', 'P051619878F', '', 1, 1, '0722889200', '', '../../assets/img/logo/jmfra.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_settings_print`
--

CREATE TABLE `kp_settings_print` (
  `print_doc` int(11) NOT NULL,
  `show_logo` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `mpesa` int(11) NOT NULL,
  `thankyou_note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_settings_print`
--

INSERT INTO `kp_settings_print` (`print_doc`, `show_logo`, `pin`, `tax`, `mpesa`, `thankyou_note`) VALUES
(1, 1, 1, 1, 0, '          ');

-- --------------------------------------------------------

--
-- Table structure for table `kp_shift`
--

CREATE TABLE `kp_shift` (
  `shift` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_shift_hist`
--

CREATE TABLE `kp_shift_hist` (
  `shift` date NOT NULL,
  `opening` datetime NOT NULL,
  `open_by` int(11) NOT NULL,
  `closing` datetime NOT NULL,
  `close_by` int(11) NOT NULL,
  `open_ord` int(11) NOT NULL,
  `close_ord` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_shift_stock`
--

CREATE TABLE `kp_shift_stock` (
  `shift` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `opening` int(11) NOT NULL,
  `stock_in` int(11) NOT NULL,
  `stock_out` int(11) NOT NULL,
  `closing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_sms`
--

CREATE TABLE `kp_sms` (
  `id` int(11) NOT NULL,
  `phone` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `msg` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_sms`
--

INSERT INTO `kp_sms` (`id`, `phone`, `msg`, `status`, `datime`, `sendtime`) VALUES
(1, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 10:03:15', '0000-00-00 00:00:00'),
(2, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 10:04:02', '0000-00-00 00:00:00'),
(3, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 10:04:44', '0000-00-00 00:00:00'),
(4, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 10:15:39', '0000-00-00 00:00:00'),
(5, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 10:29:14', '0000-00-00 00:00:00'),
(6, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-13 11:42:13', '0000-00-00 00:00:00'),
(7, '+254716100335', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-22 19:58:47', '0000-00-00 00:00:00'),
(8, '+254716100335', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-25 07:29:16', '0000-00-00 00:00:00'),
(9, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-04-25 10:19:10', '0000-00-00 00:00:00'),
(10, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-05-11 09:49:37', '0000-00-00 00:00:00'),
(11, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-05-22 11:16:10', '0000-00-00 00:00:00'),
(12, '+254716100335', 'YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT2000', 2, '2021-05-22 11:30:17', '0000-00-00 00:00:00'),
(13, '+254716100335', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-05-22 11:35:20', '0000-00-00 00:00:00'),
(14, '415263', 'YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT500', 2, '2021-06-07 08:09:58', '0000-00-00 00:00:00'),
(15, '415263', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-06-07 11:54:12', '0000-00-00 00:00:00'),
(16, '+254000', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-06-07 12:06:14', '0000-00-00 00:00:00'),
(17, '415263', 'Thank you for visiting our store today, We appriciate your business', 2, '2021-06-11 08:46:32', '0000-00-00 00:00:00'),
(18, '0720415326', 'YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT50000', 2, '2021-07-06 10:24:56', '0000-00-00 00:00:00'),
(19, '415263', 'YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT30000', 2, '2021-07-06 10:25:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kp_staff`
--

CREATE TABLE `kp_staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_nid` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_nck_no` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_email` varchar(44) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_address` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_cv` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_photo` varchar(99) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_phone` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_nssf` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_nhif` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kra_pin` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kin_name` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kin_phone` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kin_relationship` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kin_address` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_kin_residence` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_hire_date` datetime NOT NULL,
  `staff_updated_date` datetime NOT NULL,
  `staff_residence` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_del_status` int(11) NOT NULL DEFAULT '2',
  `staff_user_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_staff`
--

INSERT INTO `kp_staff` (`staff_id`, `staff_name`, `staff_nid`, `staff_nck_no`, `staff_email`, `staff_address`, `staff_cv`, `staff_photo`, `staff_phone`, `staff_nssf`, `staff_nhif`, `staff_kra_pin`, `staff_kin_name`, `staff_kin_phone`, `staff_kin_relationship`, `staff_kin_address`, `staff_kin_residence`, `staff_hire_date`, `staff_updated_date`, `staff_residence`, `staff_del_status`, `staff_user_status`) VALUES
(6, 'JAMES', '28296441', '', 'jaysoncool98@gmail.com', '', '', '', '0738387695', '', '', '', '', '', '', '', '', '2021-08-27 15:17:10', '0000-00-00 00:00:00', '', 2, 2),
(7, 'ERICK', '36529667', '', 'ericknjuki11@gmail.com', '', '', '', '0795081264', '', '', '', '', '', '', '', '', '2021-08-27 15:20:21', '0000-00-00 00:00:00', '', 2, 2),
(9, 'EVALYNE', '20091616', '', 'evalyne@gmail.com', '', '', '', '0720141546', '', '', '', '', '', '', '', '', '2021-08-27 15:36:27', '0000-00-00 00:00:00', '', 2, 2),
(10, 'DICKSON', '12543158', '', 'dickson@gmail.com', '', '', '', '0722889200', '', '', '', '', '', '', '', '', '2021-08-27 15:55:32', '0000-00-00 00:00:00', '', 2, 2),
(11, 'JOHN', '23431633', '', 'john@gmail.com', '', '', '', '0723625776', '', '', '', '', '', '', '', '', '2021-08-31 13:10:34', '0000-00-00 00:00:00', '', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_stock_take`
--

CREATE TABLE `kp_stock_take` (
  `id` int(11) NOT NULL,
  `shift` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `closing` int(11) NOT NULL,
  `counted` int(11) NOT NULL,
  `variance` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `comments` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_stock_take`
--

INSERT INTO `kp_stock_take` (`id`, `shift`, `item_id`, `closing`, `counted`, `variance`, `status`, `comments`, `user_id`, `day`, `datime`) VALUES
(1, '0000-00-00', 164, 0, 5, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:20:48'),
(2, '0000-00-00', 167, 0, 0, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:21:47'),
(3, '0000-00-00', 242, 92, 5, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:01'),
(4, '0000-00-00', 243, 91, 0, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:07'),
(5, '0000-00-00', 181, 95, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:10'),
(6, '0000-00-00', 11, 1000, 20, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:12'),
(8, '0000-00-00', 92, 999, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:22'),
(9, '0000-00-00', 94, 1000, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:24'),
(10, '0000-00-00', 93, 1000, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:27'),
(11, '0000-00-00', 95, 1000, 200, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:23:28'),
(15, '0000-00-00', 10, 991, 94, 0, 2, '', 2, '2021-05-31', '2021-05-31 08:26:52'),
(16, '0000-00-00', 96, 994, 23, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:10'),
(17, '0000-00-00', 214, 94, 12, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:11'),
(18, '0000-00-00', 191, 0, 52, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:12'),
(19, '0000-00-00', 179, 44, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:13'),
(20, '0000-00-00', 180, 299, 63, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:14'),
(21, '0000-00-00', 192, 0, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:15'),
(22, '0000-00-00', 127, 1000, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:16'),
(23, '0000-00-00', 125, 1000, 12, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:28'),
(24, '0000-00-00', 126, 1000, 23, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:30'),
(25, '0000-00-00', 169, 95, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:31'),
(26, '0000-00-00', 87, 1000, 45, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:32'),
(27, '0000-00-00', 88, 998, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 09:04:33'),
(28, '0000-00-00', 220, 99, 12, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:49:18'),
(29, '0000-00-00', 221, 99, 46, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:49:19'),
(30, '0000-00-00', 73, 998, 45, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:49:20'),
(31, '0000-00-00', 70, 999, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:49:21'),
(32, '0000-00-00', 72, 1000, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:49:22'),
(33, '0000-00-00', 75, 992, 56, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:01'),
(34, '0000-00-00', 74, 999, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:03'),
(35, '0000-00-00', 71, 1000, 200, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:04'),
(36, '0000-00-00', 267, 99, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:05'),
(37, '0000-00-00', 91, 997, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:06'),
(38, '0000-00-00', 272, 99, 200, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:08'),
(39, '0000-00-00', 194, 98, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:10'),
(40, '0000-00-00', 264, 97, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:11'),
(41, '0000-00-00', 23, 973, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:13'),
(42, '0000-00-00', 22, 1000, 200, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:15'),
(43, '0000-00-00', 224, 94, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:16'),
(44, '0000-00-00', 80, 997, 50, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:17'),
(45, '0000-00-00', 4, 1000, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:18'),
(46, '0000-00-00', 3, 990, 50, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:19'),
(47, '0000-00-00', 205, 84, 12, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:20'),
(48, '0000-00-00', 86, 999, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:21'),
(49, '0000-00-00', 85, 998, 120, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:50:22'),
(50, '0000-00-00', 190, 100, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:30'),
(51, '0000-00-00', 156, 92, 45, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:47'),
(52, '0000-00-00', 48, 1000, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:49'),
(53, '0000-00-00', 140, 996, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:50'),
(54, '0000-00-00', 237, 100, 300, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:52'),
(55, '0000-00-00', 122, 999, 500, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:54'),
(56, '0000-00-00', 121, 994, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:56'),
(57, '0000-00-00', 123, 994, 999, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:52:59'),
(58, '0000-00-00', 124, 1000, 994, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:53:02'),
(59, '0000-00-00', 45, 1000, 1000, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:53:06'),
(60, '0000-00-00', 199, 99, 1000, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:53:34'),
(61, '0000-00-00', 200, 95, 100, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:01'),
(62, '0000-00-00', 149, 1000, 200, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:02'),
(63, '0000-00-00', 252, 99, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:03'),
(64, '0000-00-00', 177, 100, 30, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:04'),
(65, '0000-00-00', 176, 78, 50, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:05'),
(66, '0000-00-00', 162, 97, 40, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:06'),
(67, '0000-00-00', 161, 99, 50, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:10'),
(68, '0000-00-00', 35, 1000, 10, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:12'),
(69, '0000-00-00', 144, 996, 20, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:15'),
(70, '0000-00-00', 268, 107, 30, 0, 2, '', 2, '2021-05-31', '2021-05-31 17:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `kp_stock_take_id`
--

CREATE TABLE `kp_stock_take_id` (
  `take_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_stock_take_set`
--

CREATE TABLE `kp_stock_take_set` (
  `id` int(11) NOT NULL,
  `take_interval` int(11) NOT NULL,
  `last_take` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_stock_take_set`
--

INSERT INTO `kp_stock_take_set` (`id`, `take_interval`, `last_take`, `take_status`) VALUES
(1, 1, '2021-05-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_stock_take_status`
--

CREATE TABLE `kp_stock_take_status` (
  `stat_id` int(11) NOT NULL,
  `take_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2',
  `user_id` int(11) NOT NULL,
  `type` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_stock_take_status`
--

INSERT INTO `kp_stock_take_status` (`stat_id`, `take_id`, `day`, `take_status`, `user_id`, `type`) VALUES
(1, 0, '2021-05-31', 3, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `kp_stock_track`
--

CREATE TABLE `kp_stock_track` (
  `item_id` int(11) NOT NULL,
  `uom` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `grn_id` int(11) NOT NULL,
  `ret_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `stock_bal` decimal(10,2) NOT NULL,
  `status` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `day` date DEFAULT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_stock_track`
--

INSERT INTO `kp_stock_track` (`item_id`, `uom`, `sale_id`, `po_id`, `grn_id`, `ret_id`, `user_id`, `qty`, `stock_bal`, `status`, `day`, `datime`, `shop`) VALUES
(16, 0, 1, NULL, 0, NULL, 1, 1, '999.50', 'OUT', '2021-03-22', '2021-03-22 13:35:56', 0),
(3, 0, 2, NULL, 0, NULL, 1, 1, '999.00', 'OUT', '2021-03-28', '2021-03-28 09:43:11', 0),
(18, 0, 3, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-28', '2021-03-28 09:52:18', 0),
(145, 0, 4, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-03-28', '2021-03-28 09:55:10', 0),
(1, 0, 5, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-28', '2021-03-28 10:00:30', 0),
(32, 0, 6, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-28', '2021-03-28 10:01:18', 0),
(150, 0, NULL, 2, 0, NULL, 2, 10, '0.00', 'IN', '2021-03-28', '2021-03-28 10:49:50', 0),
(18, 0, NULL, 2, 0, NULL, 2, 6, '0.00', 'IN', '2021-03-28', '2021-03-28 10:49:53', 0),
(1, 0, 8, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '0000-00-00', '2021-03-28 11:20:58', 0),
(1, 0, NULL, 3, 0, NULL, 2, 1, '0.00', 'IN', '2021-03-28', '2021-03-28 11:28:38', 0),
(153, 0, 10, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-03-29', '2021-03-29 11:00:00', 0),
(78, 0, 13, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 11:39:24', 0),
(68, 0, 14, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 11:41:04', 0),
(163, 0, 16, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 11:45:34', 0),
(33, 0, 18, NULL, 0, NULL, 1, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 12:09:38', 0),
(47, 0, 19, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 12:11:51', 0),
(140, 0, 20, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 12:12:29', 0),
(164, 0, 22, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:15:45', 0),
(165, 0, 24, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:18:43', 0),
(162, 0, 25, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:27:17', 0),
(160, 0, 25, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:27:26', 0),
(96, 0, 26, NULL, 0, NULL, 2, 6, '994.00', 'OUT', '2021-03-29', '2021-03-29 12:32:11', 0),
(80, 0, 26, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 12:32:23', 0),
(47, 0, 26, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-29', '2021-03-29 12:32:49', 0),
(166, 0, 26, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:34:35', 0),
(167, 0, 29, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:39:06', 0),
(168, 0, 31, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:40:58', 0),
(165, 0, 32, NULL, 0, NULL, 2, 6, '93.00', 'OUT', '2021-03-29', '2021-03-29 12:50:28', 0),
(169, 0, 32, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 12:52:53', 0),
(170, 0, 36, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-29', '2021-03-29 13:25:33', 0),
(171, 0, 39, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 14:06:41', 0),
(173, 0, 39, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 14:06:51', 0),
(172, 0, 39, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 14:07:02', 0),
(157, 0, 41, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-03-29', '2021-03-29 14:45:16', 0),
(77, 0, 12, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-03-29', '2021-03-29 14:59:25', 0),
(175, 0, 12, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 14:59:34', 0),
(65, 0, 12, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 14:59:45', 0),
(174, 0, 45, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 15:00:21', 0),
(179, 0, 47, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-29', '2021-03-29 15:37:29', 0),
(165, 0, 50, NULL, 0, NULL, 2, 25, '67.00', 'OUT', '2021-03-29', '2021-03-29 15:48:02', 0),
(23, 0, 54, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 15:59:04', 0),
(192, 0, 55, NULL, 0, NULL, 2, 12, '88.00', 'OUT', '2021-03-29', '2021-03-29 16:02:15', 0),
(166, 0, 55, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-29', '2021-03-29 16:02:25', 0),
(160, 0, 55, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-29', '2021-03-29 16:02:51', 0),
(37, 0, 55, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 16:03:01', 0),
(193, 0, 55, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 16:04:13', 0),
(165, 0, 55, NULL, 0, NULL, 2, 3, '64.00', 'OUT', '2021-03-29', '2021-03-29 16:04:48', 0),
(196, 0, 57, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 17:22:44', 0),
(65, 0, 57, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-03-29', '2021-03-29 17:23:04', 0),
(165, 0, 57, NULL, 0, NULL, 2, 2, '62.00', 'OUT', '2021-03-29', '2021-03-29 17:23:19', 0),
(182, 0, 57, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-03-29', '2021-03-29 17:26:52', 0),
(169, 0, 58, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '0000-00-00', '2021-03-29 17:32:18', 0),
(170, 0, 59, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-29', '2021-03-29 17:33:02', 0),
(197, 0, 61, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 17:53:29', 0),
(10, 0, 62, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-03-29', '2021-03-29 18:01:03', 0),
(152, 0, 63, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 18:16:03', 0),
(179, 0, 64, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-29', '2021-03-29 18:19:33', 0),
(32, 0, 64, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-29', '2021-03-29 18:20:18', 0),
(38, 0, 64, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 18:20:43', 0),
(29, 0, 64, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 18:20:56', 0),
(168, 0, 64, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-29', '2021-03-29 18:24:43', 0),
(199, 0, 64, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 18:25:46', 0),
(76, 0, 64, NULL, 0, NULL, 2, 6, '994.00', 'OUT', '2021-03-29', '2021-03-29 18:29:35', 0),
(186, 0, 64, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-03-29', '2021-03-29 18:29:54', 0),
(174, 0, 64, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-29', '2021-03-29 18:30:43', 0),
(201, 0, 64, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 18:32:10', 0),
(200, 0, 64, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 18:32:20', 0),
(33, 0, 64, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-03-29', '2021-03-29 18:32:55', 0),
(23, 0, 64, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-29', '2021-03-29 18:34:07', 0),
(139, 0, 65, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-29', '2021-03-29 18:36:05', 0),
(18, 0, 66, NULL, 0, NULL, 2, 1, '1004.00', 'OUT', '2021-03-29', '2021-03-29 18:43:56', 0),
(171, 0, 67, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-29', '2021-03-29 18:50:34', 0),
(159, 0, 68, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-29', '2021-03-29 18:53:14', 0),
(178, 0, 69, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-29', '2021-03-29 18:55:44', 0),
(182, 0, 70, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-03-29', '2021-03-29 19:01:50', 0),
(18, 0, 71, NULL, 0, NULL, 2, 1, '1003.00', 'OUT', '2021-03-29', '2021-03-29 19:02:25', 0),
(14, 0, 75, NULL, 0, NULL, 2, 1, '999.50', 'OUT', '2021-03-30', '2021-03-30 11:39:27', 0),
(164, 0, 75, NULL, 0, NULL, 2, 10, '89.00', 'OUT', '2021-03-30', '2021-03-30 11:41:30', 0),
(37, 0, 75, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-30', '2021-03-30 11:43:32', 0),
(62, 0, 75, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-30', '2021-03-30 11:43:48', 0),
(167, 0, 75, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-30', '2021-03-30 11:44:12', 0),
(176, 0, 75, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-30', '2021-03-30 11:45:28', 0),
(20, 0, 76, NULL, 0, NULL, 2, 6, '994.00', 'OUT', '0000-00-00', '2021-03-30 12:46:29', 0),
(165, 0, 77, NULL, 0, NULL, 2, 13, '36.00', 'OUT', '2021-03-30', '2021-03-30 13:08:59', 0),
(171, 0, 78, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-30', '2021-03-30 13:10:13', 0),
(176, 0, 79, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-30', '2021-03-30 13:11:09', 0),
(165, 0, 79, NULL, 0, NULL, 2, 13, '23.50', 'OUT', '2021-03-30', '2021-03-30 13:11:49', 0),
(203, 0, 79, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-30', '2021-03-30 13:13:34', 0),
(164, 0, 80, NULL, 0, NULL, 2, 10, '79.00', 'OUT', '2021-03-30', '2021-03-30 13:14:37', 0),
(193, 0, 80, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-30', '2021-03-30 13:14:50', 0),
(153, 0, 81, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-03-30', '2021-03-30 13:17:25', 0),
(171, 0, 82, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-03-30', '2021-03-30 14:24:20', 0),
(165, 0, 83, NULL, 0, NULL, 2, 1, '23.00', 'OUT', '2021-03-30', '2021-03-30 14:27:13', 0),
(5, 0, 83, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-03-30', '2021-03-30 14:29:18', 0),
(180, 0, 83, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-30', '2021-03-30 14:30:10', 0),
(193, 0, 83, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-30', '2021-03-30 14:31:06', 0),
(23, 0, 84, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-03-30', '2021-03-30 14:46:19', 0),
(182, 0, 85, NULL, 0, NULL, 2, 3, '92.00', 'OUT', '2021-03-30', '2021-03-30 15:44:44', 0),
(5, 0, 86, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-03-30', '2021-03-30 16:06:49', 0),
(37, 0, 87, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-03-30', '2021-03-30 16:34:29', 0),
(182, 0, 88, NULL, 0, NULL, 2, 2, '90.00', 'OUT', '2021-03-30', '2021-03-30 16:53:27', 0),
(196, 0, 88, NULL, 0, NULL, 2, 5, '94.00', 'OUT', '2021-03-30', '2021-03-30 16:55:04', 0),
(5, 0, 90, NULL, 0, NULL, 2, 2, '995.00', 'OUT', '2021-03-30', '2021-03-30 17:05:02', 0),
(186, 0, 90, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-03-30', '2021-03-30 17:05:37', 0),
(170, 0, 91, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-03-30', '2021-03-30 17:15:57', 0),
(165, 0, 92, NULL, 0, NULL, 2, 1, '22.00', 'OUT', '2021-03-30', '2021-03-30 17:20:33', 0),
(137, 0, 92, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-30', '2021-03-30 17:21:30', 0),
(165, 0, 93, NULL, 0, NULL, 2, 1, '21.50', 'OUT', '2021-03-30', '2021-03-30 17:23:32', 0),
(173, 0, 94, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-03-30', '2021-03-30 17:50:23', 0),
(165, 0, 97, NULL, 0, NULL, 2, 25, '975.00', 'OUT', '2021-03-30', '2021-03-30 17:57:16', 0),
(176, 0, 98, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-30', '2021-03-30 18:07:38', 0),
(164, 0, 98, NULL, 0, NULL, 2, 2, '77.00', 'OUT', '2021-03-30', '2021-03-30 18:09:30', 0),
(179, 0, 99, NULL, 0, NULL, 2, 1, '96.50', 'OUT', '2021-03-30', '2021-03-30 18:11:19', 0),
(68, 0, 100, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-03-30', '2021-03-30 18:26:11', 0),
(170, 0, 101, NULL, 0, NULL, 2, 1, '95.50', 'OUT', '2021-03-30', '2021-03-30 18:41:42', 0),
(62, 0, 102, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-30', '2021-03-30 18:48:58', 0),
(68, 0, 102, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-03-30', '2021-03-30 18:49:20', 0),
(75, 0, 102, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-30', '2021-03-30 18:49:47', 0),
(139, 0, 103, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-31', '2021-03-31 08:03:07', 0),
(205, 0, 106, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-03-31', '2021-03-31 08:19:49', 0),
(141, 0, 107, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-31', '2021-03-31 08:31:44', 0),
(206, 0, 109, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-31', '2021-03-31 08:57:23', 0),
(168, 0, 110, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '0000-00-00', '2021-03-31 10:30:55', 0),
(186, 0, 111, NULL, 0, NULL, 2, 6, '87.00', 'OUT', '0000-00-00', '2021-03-31 10:47:09', 0),
(144, 0, 112, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-31', '2021-03-31 10:51:13', 0),
(14, 0, 113, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-31', '2021-03-31 11:43:20', 0),
(138, 0, 114, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '0000-00-00', '2021-03-31 15:07:06', 0),
(28, 0, 115, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '0000-00-00', '2021-03-31 16:01:26', 0),
(180, 0, 116, NULL, 0, NULL, 2, 2, '96.00', 'OUT', '2021-03-31', '2021-03-31 16:05:33', 0),
(23, 0, 118, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-03-31', '2021-03-31 17:21:33', 0),
(84, 0, 120, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-03-31', '2021-03-31 17:41:22', 0),
(23, 0, 122, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-03-31', '2021-03-31 17:48:09', 0),
(23, 0, 123, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-03-31', '2021-03-31 18:02:17', 0),
(211, 0, 123, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-03-31', '2021-03-31 18:05:59', 0),
(65, 0, 123, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-03-31', '2021-03-31 18:06:13', 0),
(173, 0, 123, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-31', '2021-03-31 18:06:28', 0),
(169, 0, 124, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-31', '2021-03-31 18:07:08', 0),
(187, 0, 125, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-03-31', '2021-03-31 18:07:56', 0),
(179, 0, 126, NULL, 0, NULL, 2, 1, '95.50', 'OUT', '2021-03-31', '2021-03-31 18:10:05', 0),
(165, 0, 126, NULL, 0, NULL, 2, 4, '971.00', 'OUT', '2021-03-31', '2021-03-31 18:10:21', 0),
(171, 0, 126, NULL, 0, NULL, 2, 4, '92.00', 'OUT', '2021-03-31', '2021-03-31 18:10:43', 0),
(170, 0, 126, NULL, 0, NULL, 2, 4, '92.00', 'OUT', '2021-03-31', '2021-03-31 18:10:58', 0),
(165, 0, 127, NULL, 0, NULL, 2, 20, '951.00', 'OUT', '2021-03-31', '2021-03-31 18:12:16', 0),
(150, 0, 127, NULL, 0, NULL, 2, 1, '109.00', 'OUT', '2021-03-31', '2021-03-31 18:12:49', 0),
(10, 0, 127, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-03-31', '2021-03-31 18:13:09', 0),
(179, 0, 128, NULL, 0, NULL, 2, 1, '95.50', 'OUT', '2021-03-31', '2021-03-31 18:14:03', 0),
(156, 0, 128, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-31', '2021-03-31 18:16:36', 0),
(196, 0, 129, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-03-31', '2021-03-31 18:17:14', 0),
(203, 0, 130, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-31', '2021-03-31 18:22:40', 0),
(205, 0, 130, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-03-31', '2021-03-31 18:23:47', 0),
(208, 0, 130, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-03-31', '2021-03-31 18:24:04', 0),
(165, 0, 131, NULL, 0, NULL, 2, 2, '949.00', 'OUT', '2021-03-31', '2021-03-31 18:31:36', 0),
(5, 0, 131, NULL, 0, NULL, 2, 2, '993.00', 'OUT', '2021-03-31', '2021-03-31 18:32:08', 0),
(208, 0, 131, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-03-31', '2021-03-31 18:32:21', 0),
(176, 0, 131, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-03-31', '2021-03-31 18:32:38', 0),
(186, 0, 131, NULL, 0, NULL, 2, 5, '82.00', 'OUT', '2021-03-31', '2021-03-31 18:32:57', 0),
(138, 0, 133, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-03-31', '2021-03-31 18:47:44', 0),
(165, 0, 134, NULL, 0, NULL, 2, 13, '936.50', 'OUT', '2021-04-01', '2021-04-01 08:29:43', 0),
(144, 0, 135, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-01', '2021-04-01 09:16:53', 0),
(179, 0, 137, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-01', '2021-04-01 09:49:58', 0),
(5, 0, 137, NULL, 0, NULL, 2, 5, '988.00', 'OUT', '2021-04-01', '2021-04-01 09:50:06', 0),
(189, 0, 137, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-01', '2021-04-01 09:51:19', 0),
(182, 0, 137, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-01', '2021-04-01 09:51:38', 0),
(179, 0, 138, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-01', '2021-04-01 09:53:49', 0),
(8, 0, 138, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 09:54:08', 0),
(5, 0, 138, NULL, 0, NULL, 2, 2, '986.00', 'OUT', '2021-04-01', '2021-04-01 09:54:26', 0),
(165, 0, 138, NULL, 0, NULL, 2, 2, '934.00', 'OUT', '2021-04-01', '2021-04-01 09:54:41', 0),
(212, 0, 138, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 09:56:18', 0),
(189, 0, 138, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-01', '2021-04-01 09:57:15', 0),
(5, 0, 139, NULL, 0, NULL, 2, 1, '985.50', 'OUT', '2021-04-01', '2021-04-01 10:03:41', 0),
(165, 0, 141, NULL, 0, NULL, 2, 1, '933.00', 'OUT', '2021-04-01', '2021-04-01 11:28:31', 0),
(5, 0, 142, NULL, 0, NULL, 2, 13, '974.50', 'OUT', '2021-04-01', '2021-04-01 12:08:54', 0),
(206, 0, 143, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-01', '2021-04-01 12:10:57', 0),
(180, 0, 144, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-01', '2021-04-01 12:12:08', 0),
(165, 0, 146, NULL, 0, NULL, 2, 4, '929.00', 'OUT', '2021-04-01', '2021-04-01 12:23:28', 0),
(5, 0, 146, NULL, 0, NULL, 2, 4, '970.00', 'OUT', '2021-04-01', '2021-04-01 12:23:36', 0),
(23, 0, 146, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-01', '2021-04-01 12:23:53', 0),
(203, 0, 147, NULL, 0, NULL, 2, 2, '95.00', 'OUT', '2021-04-01', '2021-04-01 12:38:59', 0),
(176, 0, 147, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-01', '2021-04-01 12:39:10', 0),
(85, 0, 147, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 12:41:07', 0),
(9, 0, 147, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 12:42:29', 0),
(170, 0, 148, NULL, 0, NULL, 2, 3, '89.00', 'OUT', '2021-04-01', '2021-04-01 13:01:03', 0),
(8, 0, 149, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-01', '2021-04-01 13:33:05', 0),
(141, 0, 151, NULL, 0, NULL, 2, 1, '997.50', 'OUT', '2021-04-01', '2021-04-01 14:03:48', 0),
(189, 0, 152, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-01', '2021-04-01 14:31:31', 0),
(157, 0, 153, NULL, 0, NULL, 2, 10, '85.00', 'OUT', '2021-04-01', '2021-04-01 15:07:00', 0),
(156, 0, 153, NULL, 0, NULL, 2, 6, '92.00', 'OUT', '2021-04-01', '2021-04-01 15:08:48', 0),
(170, 0, 154, NULL, 0, NULL, 2, 1, '88.50', 'OUT', '2021-04-01', '2021-04-01 15:40:49', 0),
(8, 0, 156, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-01', '2021-04-01 16:30:27', 0),
(10, 0, 156, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-01', '2021-04-01 16:40:25', 0),
(119, 0, 156, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 16:40:59', 0),
(118, 0, 156, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 16:41:13', 0),
(76, 0, 156, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-01', '2021-04-01 16:41:42', 0),
(171, 0, 156, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-01', '2021-04-01 16:42:48', 0),
(37, 0, 156, NULL, 0, NULL, 2, 2, '995.00', 'OUT', '2021-04-01', '2021-04-01 16:43:32', 0),
(39, 0, 156, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-04-01', '2021-04-01 16:43:41', 0),
(136, 0, 156, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 16:43:50', 0),
(164, 0, 156, NULL, 0, NULL, 2, 1, '76.00', 'OUT', '2021-04-01', '2021-04-01 16:44:24', 0),
(176, 0, 156, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-04-01', '2021-04-01 16:45:55', 0),
(203, 0, 156, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-04-01', '2021-04-01 16:48:08', 0),
(201, 0, 156, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-01', '2021-04-01 16:50:01', 0),
(84, 0, 156, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-01', '2021-04-01 16:50:54', 0),
(23, 0, 157, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-01', '2021-04-01 16:51:15', 0),
(169, 0, 156, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-01', '2021-04-01 16:53:18', 0),
(138, 0, 156, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-01', '2021-04-01 16:54:18', 0),
(133, 0, 156, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 16:56:41', 0),
(135, 0, 156, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 16:57:00', 0),
(209, 0, 156, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 16:58:00', 0),
(23, 0, 156, NULL, 0, NULL, 2, 2, '990.00', 'OUT', '2021-04-01', '2021-04-01 17:00:38', 0),
(204, 0, 156, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 17:01:27', 0),
(174, 0, 156, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-01', '2021-04-01 17:03:43', 0),
(160, 0, 158, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-01', '2021-04-01 17:06:06', 0),
(162, 0, 158, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-01', '2021-04-01 17:06:15', 0),
(215, 0, 156, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-04-01', '2021-04-01 17:09:44', 0),
(214, 0, 156, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-04-01', '2021-04-01 17:11:03', 0),
(141, 0, 156, NULL, 0, NULL, 2, 1, '997.50', 'OUT', '2021-04-01', '2021-04-01 17:13:51', 0),
(185, 0, 156, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-01', '2021-04-01 17:14:51', 0),
(216, 0, 156, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-01', '2021-04-01 17:18:59', 0),
(157, 0, 156, NULL, 0, NULL, 2, 1, '84.00', 'OUT', '2021-04-01', '2021-04-01 17:20:32', 0),
(213, 0, 156, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 17:21:12', 0),
(158, 0, 156, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 17:22:16', 0),
(140, 0, 159, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-01', '2021-04-01 17:24:00', 0),
(200, 0, 159, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-01', '2021-04-01 17:32:30', 0),
(121, 0, 159, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 17:32:53', 0),
(217, 0, 159, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 17:33:43', 0),
(33, 0, 160, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-01', '2021-04-01 17:58:37', 0),
(32, 0, 160, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-01', '2021-04-01 17:58:46', 0),
(98, 0, 161, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-01', '2021-04-01 18:08:34', 0),
(218, 0, 163, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 18:11:50', 0),
(5, 0, 164, NULL, 0, NULL, 2, 1, '968.00', 'OUT', '2021-04-01', '2021-04-01 18:12:52', 0),
(170, 0, 165, NULL, 0, NULL, 2, 2, '86.00', 'OUT', '2021-04-01', '2021-04-01 18:18:50', 0),
(5, 0, 166, NULL, 0, NULL, 2, 2, '966.50', 'OUT', '2021-04-01', '2021-04-01 18:26:16', 0),
(196, 0, 167, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-01', '2021-04-01 18:27:04', 0),
(5, 0, 168, NULL, 0, NULL, 2, 1, '965.00', 'OUT', '2021-04-01', '2021-04-01 19:14:09', 0),
(181, 0, 169, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-01', '2021-04-01 19:14:35', 0),
(176, 0, 170, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-01', '2021-04-01 19:15:05', 0),
(168, 0, 170, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-01', '2021-04-01 19:15:12', 0),
(75, 0, 170, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-01', '2021-04-01 19:16:56', 0),
(170, 0, 171, NULL, 0, NULL, 2, 2, '84.00', 'OUT', '2021-04-02', '2021-04-02 08:04:23', 0),
(183, 0, 171, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-02', '2021-04-02 08:05:45', 0),
(219, 0, 171, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-02', '2021-04-02 08:06:03', 0),
(165, 0, 171, NULL, 0, NULL, 2, 3, '939.00', 'OUT', '2021-04-02', '2021-04-02 08:06:28', 0),
(58, 0, 171, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-02', '2021-04-02 08:15:22', 0),
(221, 0, 171, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 08:17:29', 0),
(138, 0, 171, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-02', '2021-04-02 08:20:28', 0),
(47, 0, 172, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 08:22:47', 0),
(176, 0, 172, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-02', '2021-04-02 08:22:57', 0),
(18, 0, 173, NULL, 0, NULL, 2, 1, '1002.00', 'OUT', '2021-04-02', '2021-04-02 08:27:45', 0),
(178, 0, 174, NULL, 0, NULL, 2, 2, '96.00', 'OUT', '2021-04-02', '2021-04-02 08:30:28', 0),
(8, 0, 175, NULL, 0, NULL, 2, 5, '992.00', 'OUT', '2021-04-02', '2021-04-02 09:47:20', 0),
(176, 0, 175, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-02', '2021-04-02 09:48:13', 0),
(78, 0, 175, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-04-02', '2021-04-02 09:50:40', 0),
(165, 0, 175, NULL, 0, NULL, 2, 10, '929.00', 'OUT', '2021-04-02', '2021-04-02 09:51:37', 0),
(223, 0, 177, NULL, 0, NULL, 2, 3, '97.00', 'OUT', '2021-04-02', '2021-04-02 12:52:00', 0),
(165, 0, 177, NULL, 0, NULL, 2, 3, '926.00', 'OUT', '2021-04-02', '2021-04-02 12:52:12', 0),
(23, 0, 178, NULL, 0, NULL, 2, 1, '989.00', 'OUT', '2021-04-02', '2021-04-02 12:53:56', 0),
(206, 0, 178, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-02', '2021-04-02 12:54:37', 0),
(189, 0, 178, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-02', '2021-04-02 12:55:58', 0),
(153, 0, 179, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-02', '2021-04-02 12:57:04', 0),
(170, 0, 180, NULL, 0, NULL, 2, 2, '82.00', 'OUT', '2021-04-02', '2021-04-02 13:01:14', 0),
(137, 0, 181, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-02', '2021-04-02 13:05:28', 0),
(208, 0, 181, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-02', '2021-04-02 13:05:41', 0),
(189, 0, 182, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-02', '2021-04-02 13:13:34', 0),
(171, 0, 184, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-02', '2021-04-02 13:45:58', 0),
(8, 0, 184, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-02', '2021-04-02 13:47:57', 0),
(179, 0, 184, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-02', '2021-04-02 13:48:06', 0),
(224, 0, 184, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-04-02', '2021-04-02 13:50:25', 0),
(196, 0, 184, NULL, 0, NULL, 2, 4, '88.00', 'OUT', '2021-04-02', '2021-04-02 13:50:59', 0),
(173, 0, 186, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-02', '2021-04-02 14:03:48', 0),
(164, 0, 186, NULL, 0, NULL, 2, 2, '74.00', 'OUT', '2021-04-02', '2021-04-02 14:06:32', 0),
(165, 0, 187, NULL, 0, NULL, 2, 4, '922.00', 'OUT', '2021-04-02', '2021-04-02 14:15:39', 0),
(179, 0, 187, NULL, 0, NULL, 2, 1, '92.50', 'OUT', '2021-04-02', '2021-04-02 14:15:50', 0),
(10, 0, 187, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-02', '2021-04-02 14:16:41', 0),
(5, 0, 188, NULL, 0, NULL, 2, 4, '961.00', 'OUT', '2021-04-02', '2021-04-02 14:20:16', 0),
(196, 0, 189, NULL, 0, NULL, 2, 1, '87.00', 'OUT', '2021-04-02', '2021-04-02 14:21:59', 0),
(186, 0, 190, NULL, 0, NULL, 2, 2, '80.00', 'OUT', '2021-04-02', '2021-04-02 14:23:58', 0),
(129, 0, 190, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-04-02', '2021-04-02 14:24:11', 0),
(172, 0, 191, NULL, 0, NULL, 2, 2, '97.00', 'OUT', '2021-04-02', '2021-04-02 14:25:32', 0),
(9, 0, 192, NULL, 0, NULL, 2, 1, '998.50', 'OUT', '2021-04-02', '2021-04-02 14:31:09', 0),
(8, 0, 192, NULL, 0, NULL, 2, 1, '990.50', 'OUT', '2021-04-02', '2021-04-02 14:40:07', 0),
(208, 0, 192, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-02', '2021-04-02 14:40:29', 0),
(83, 0, 192, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-02', '2021-04-02 14:40:48', 0),
(176, 0, 192, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-02', '2021-04-02 14:41:25', 0),
(178, 0, 192, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-02', '2021-04-02 14:41:33', 0),
(200, 0, 192, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-02', '2021-04-02 14:42:44', 0),
(168, 0, 192, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-02', '2021-04-02 14:42:54', 0),
(47, 0, 192, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-02', '2021-04-02 14:43:21', 0),
(225, 0, 192, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 14:44:30', 0),
(84, 0, 192, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 14:44:47', 0),
(77, 0, 192, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 14:45:16', 0),
(182, 0, 193, NULL, 0, NULL, 2, 3, '86.00', 'OUT', '2021-04-02', '2021-04-02 14:46:58', 0),
(192, 0, 193, NULL, 0, NULL, 2, 3, '85.00', 'OUT', '2021-04-02', '2021-04-02 14:47:08', 0),
(226, 0, 193, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 14:48:00', 0),
(192, 0, 194, NULL, 0, NULL, 2, 4, '81.00', 'OUT', '2021-04-02', '2021-04-02 14:50:41', 0),
(182, 0, 194, NULL, 0, NULL, 2, 1, '85.00', 'OUT', '2021-04-02', '2021-04-02 14:50:55', 0),
(165, 0, 194, NULL, 0, NULL, 2, 3, '919.00', 'OUT', '2021-04-02', '2021-04-02 14:51:07', 0),
(77, 0, 194, NULL, 0, NULL, 2, 2, '995.00', 'OUT', '2021-04-02', '2021-04-02 14:52:48', 0),
(139, 0, 192, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 14:58:06', 0),
(138, 0, 192, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-02', '2021-04-02 14:58:29', 0),
(23, 0, 192, NULL, 0, NULL, 2, 1, '988.00', 'OUT', '2021-04-02', '2021-04-02 14:59:41', 0),
(165, 0, 192, NULL, 0, NULL, 2, 13, '906.50', 'OUT', '2021-04-02', '2021-04-02 15:00:14', 0),
(68, 0, 192, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-02', '2021-04-02 15:01:15', 0),
(62, 0, 192, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 15:01:26', 0),
(75, 0, 192, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 15:01:40', 0),
(170, 0, 196, NULL, 0, NULL, 2, 1, '81.00', 'OUT', '2021-04-02', '2021-04-02 15:09:57', 0),
(118, 0, 197, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-02', '2021-04-02 15:14:18', 0),
(164, 0, 197, NULL, 0, NULL, 2, 1, '73.50', 'OUT', '2021-04-02', '2021-04-02 15:16:38', 0),
(179, 0, 198, NULL, 0, NULL, 2, 1, '91.50', 'OUT', '2021-04-02', '2021-04-02 15:33:15', 0),
(195, 0, 199, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 15:43:11', 0),
(136, 0, 200, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-02', '2021-04-02 15:47:05', 0),
(88, 0, 200, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-02', '2021-04-02 15:47:24', 0),
(227, 0, 200, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 15:49:51', 0),
(228, 0, 203, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 15:57:16', 0),
(163, 0, 204, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-02', '2021-04-02 15:58:29', 0),
(165, 0, 205, NULL, 0, NULL, 2, 4, '902.00', 'OUT', '2021-04-02', '2021-04-02 16:14:17', 0),
(192, 0, 205, NULL, 0, NULL, 2, 3, '78.00', 'OUT', '2021-04-02', '2021-04-02 16:14:28', 0),
(130, 0, 205, NULL, 0, NULL, 2, 3, '997.00', 'OUT', '2021-04-02', '2021-04-02 16:14:38', 0),
(182, 0, 205, NULL, 0, NULL, 2, 5, '80.00', 'OUT', '2021-04-02', '2021-04-02 16:15:48', 0),
(229, 0, 205, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 16:20:31', 0),
(165, 0, 207, NULL, 0, NULL, 2, 2, '900.00', 'OUT', '2021-04-02', '2021-04-02 16:24:15', 0),
(192, 0, 207, NULL, 0, NULL, 2, 2, '76.00', 'OUT', '2021-04-02', '2021-04-02 16:24:29', 0),
(183, 0, 207, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-02', '2021-04-02 16:24:57', 0),
(5, 0, 207, NULL, 0, NULL, 2, 1, '960.00', 'OUT', '2021-04-02', '2021-04-02 16:25:10', 0),
(170, 0, 207, NULL, 0, NULL, 2, 1, '79.50', 'OUT', '2021-04-02', '2021-04-02 16:27:56', 0),
(9, 0, 209, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-02', '2021-04-02 16:46:41', 0),
(165, 0, 210, NULL, 0, NULL, 2, 2, '898.00', 'OUT', '2021-04-02', '2021-04-02 16:48:59', 0),
(182, 0, 210, NULL, 0, NULL, 2, 2, '78.00', 'OUT', '2021-04-02', '2021-04-02 16:49:11', 0),
(5, 0, 210, NULL, 0, NULL, 2, 4, '956.00', 'OUT', '2021-04-02', '2021-04-02 16:49:24', 0),
(230, 0, 210, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 16:49:34', 0),
(224, 0, 211, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-02', '2021-04-02 17:28:14', 0),
(166, 0, 212, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-02', '2021-04-02 17:51:46', 0),
(203, 0, 212, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-02', '2021-04-02 17:52:00', 0),
(231, 0, 212, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 17:53:30', 0),
(219, 0, 213, NULL, 0, NULL, 2, 4, '94.00', 'OUT', '2021-04-02', '2021-04-02 18:00:49', 0),
(219, 0, 214, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-02', '2021-04-02 18:04:22', 0),
(10, 0, 215, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-02', '2021-04-02 18:14:06', 0),
(18, 0, 215, NULL, 0, NULL, 2, 1, '1001.00', 'OUT', '2021-04-02', '2021-04-02 18:14:22', 0),
(222, 0, 215, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-02', '2021-04-02 18:15:08', 0),
(165, 0, 216, NULL, 0, NULL, 2, 1, '897.00', 'OUT', '2021-04-02', '2021-04-02 18:39:43', 0),
(153, 0, 217, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-02', '2021-04-02 18:56:58', 0),
(10, 0, 217, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-02', '2021-04-02 18:57:07', 0),
(229, 0, 218, NULL, 0, NULL, 2, 2, '97.00', 'OUT', '2021-04-02', '2021-04-02 19:07:56', 0),
(203, 0, 219, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-03', '2021-04-03 08:25:04', 0),
(170, 0, 222, NULL, 0, NULL, 2, 3, '77.00', 'OUT', '2021-04-03', '2021-04-03 08:30:32', 0),
(23, 0, 223, NULL, 0, NULL, 2, 2, '986.00', 'OUT', '2021-04-03', '2021-04-03 09:02:21', 0),
(176, 0, 224, NULL, 0, NULL, 2, 1, '88.00', 'OUT', '2021-04-03', '2021-04-03 09:06:04', 0),
(68, 0, 224, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-03', '2021-04-03 09:06:15', 0),
(62, 0, 224, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 09:06:26', 0),
(84, 0, 224, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 09:06:36', 0),
(203, 0, 224, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-03', '2021-04-03 09:06:52', 0),
(84, 0, 225, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-03', '2021-04-03 09:10:44', 0),
(83, 0, 225, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-03', '2021-04-03 09:10:54', 0),
(211, 0, 225, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-03', '2021-04-03 09:12:05', 0),
(167, 0, 225, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-03', '2021-04-03 09:12:27', 0),
(159, 0, 226, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-03', '2021-04-03 09:17:57', 0),
(139, 0, 227, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 09:59:09', 0),
(5, 0, 228, NULL, 0, NULL, 2, 1, '955.50', 'OUT', '2021-04-03', '2021-04-03 10:12:22', 0),
(141, 0, 231, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-03', '2021-04-03 10:58:17', 0),
(165, 0, 232, NULL, 0, NULL, 2, 1, '896.00', 'OUT', '2021-04-03', '2021-04-03 11:36:27', 0),
(208, 0, 233, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-03', '2021-04-03 11:37:12', 0),
(37, 0, 233, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-03', '2021-04-03 11:37:27', 0),
(168, 0, 234, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-03', '2021-04-03 11:38:33', 0),
(23, 0, 236, NULL, 0, NULL, 2, 2, '984.00', 'OUT', '2021-04-03', '2021-04-03 12:24:10', 0),
(179, 0, 236, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-03', '2021-04-03 12:24:22', 0),
(5, 0, 236, NULL, 0, NULL, 2, 11, '945.00', 'OUT', '2021-04-03', '2021-04-03 12:29:57', 0),
(32, 0, 236, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 12:31:52', 0),
(33, 0, 236, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-03', '2021-04-03 12:32:01', 0),
(5, 0, 237, NULL, 0, NULL, 2, 5, '940.00', 'OUT', '2021-04-03', '2021-04-03 12:34:06', 0),
(165, 0, 237, NULL, 0, NULL, 2, 5, '891.00', 'OUT', '2021-04-03', '2021-04-03 12:37:50', 0),
(76, 0, 237, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-03', '2021-04-03 12:39:10', 0),
(65, 0, 237, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-03', '2021-04-03 12:39:34', 0),
(170, 0, 237, NULL, 0, NULL, 2, 4, '73.00', 'OUT', '2021-04-03', '2021-04-03 12:39:53', 0),
(182, 0, 238, NULL, 0, NULL, 2, 3, '75.00', 'OUT', '2021-04-03', '2021-04-03 12:41:14', 0),
(165, 0, 236, NULL, 0, NULL, 2, 10, '881.00', 'OUT', '2021-04-03', '2021-04-03 12:42:18', 0),
(188, 0, 236, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-03', '2021-04-03 12:42:29', 0),
(179, 0, 239, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-03', '2021-04-03 12:46:52', 0),
(141, 0, 239, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 12:47:06', 0),
(176, 0, 239, NULL, 0, NULL, 2, 1, '87.00', 'OUT', '2021-04-03', '2021-04-03 12:48:20', 0),
(18, 0, 239, NULL, 0, NULL, 2, 1, '1000.00', 'OUT', '2021-04-03', '2021-04-03 12:49:25', 0),
(10, 0, 240, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-03', '2021-04-03 15:25:12', 0),
(165, 0, 240, NULL, 0, NULL, 2, 1, '880.00', 'OUT', '2021-04-03', '2021-04-03 15:25:21', 0),
(5, 0, 240, NULL, 0, NULL, 2, 1, '939.00', 'OUT', '2021-04-03', '2021-04-03 15:25:31', 0),
(118, 0, 241, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-03', '2021-04-03 15:30:38', 0),
(178, 0, 242, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-04-03', '2021-04-03 15:48:28', 0),
(196, 0, 242, NULL, 0, NULL, 2, 3, '84.00', 'OUT', '2021-04-03', '2021-04-03 15:49:04', 0),
(165, 0, 243, NULL, 0, NULL, 2, 1, '879.00', 'OUT', '2021-04-03', '2021-04-03 15:53:40', 0),
(208, 0, 243, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-03', '2021-04-03 15:54:43', 0),
(23, 0, 243, NULL, 0, NULL, 2, 1, '983.00', 'OUT', '2021-04-03', '2021-04-03 15:55:06', 0),
(236, 0, 245, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-03', '2021-04-03 15:59:14', 0),
(192, 0, 246, NULL, 0, NULL, 2, 1, '75.00', 'OUT', '2021-04-03', '2021-04-03 16:01:23', 0),
(5, 0, 246, NULL, 0, NULL, 2, 1, '938.00', 'OUT', '2021-04-03', '2021-04-03 16:01:30', 0),
(179, 0, 247, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-03', '2021-04-03 16:25:55', 0),
(140, 0, 247, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-03', '2021-04-03 16:26:05', 0),
(233, 0, 249, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-03', '2021-04-03 16:29:45', 0),
(154, 0, 250, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-03', '2021-04-03 16:36:48', 0),
(140, 0, 251, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-03', '2021-04-03 16:39:50', 0),
(122, 0, 251, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-03', '2021-04-03 16:41:35', 0),
(179, 0, 252, NULL, 0, NULL, 2, 1, '88.00', 'OUT', '2021-04-03', '2021-04-03 16:44:20', 0),
(236, 0, 253, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-03', '2021-04-03 16:50:11', 0),
(86, 0, 254, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-03', '2021-04-03 16:53:09', 0),
(178, 0, 255, NULL, 0, NULL, 2, 2, '91.00', 'OUT', '2021-04-03', '2021-04-03 16:53:48', 0),
(27, 0, 256, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-03', '2021-04-03 17:03:10', 0),
(165, 0, 256, NULL, 0, NULL, 2, 1, '878.00', 'OUT', '2021-04-03', '2021-04-03 17:03:19', 0),
(159, 0, 257, NULL, 0, NULL, 2, 4, '94.00', 'OUT', '2021-04-03', '2021-04-03 17:07:58', 0),
(165, 0, 258, NULL, 0, NULL, 2, 5, '873.00', 'OUT', '2021-04-03', '2021-04-03 17:08:38', 0),
(164, 0, 259, NULL, 0, NULL, 2, 6, '68.00', 'OUT', '2021-04-03', '2021-04-03 17:21:32', 0),
(180, 0, 260, NULL, 0, NULL, 2, 4, '92.00', 'OUT', '2021-04-03', '2021-04-03 18:14:11', 0),
(182, 0, 260, NULL, 0, NULL, 2, 4, '71.00', 'OUT', '2021-04-03', '2021-04-03 18:14:21', 0),
(5, 0, 260, NULL, 0, NULL, 2, 3, '935.00', 'OUT', '2021-04-03', '2021-04-03 18:14:33', 0),
(165, 0, 260, NULL, 0, NULL, 2, 4, '869.00', 'OUT', '2021-04-03', '2021-04-03 18:14:40', 0),
(206, 0, 260, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-03', '2021-04-03 18:14:58', 0),
(165, 0, 261, NULL, 0, NULL, 2, 6, '863.00', 'OUT', '2021-04-03', '2021-04-03 18:16:17', 0),
(162, 0, 263, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-03', '2021-04-03 18:18:32', 0),
(164, 0, 264, NULL, 0, NULL, 2, 1, '67.50', 'OUT', '2021-04-03', '2021-04-03 18:19:23', 0),
(206, 0, 265, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-03', '2021-04-03 18:28:40', 0),
(5, 0, 266, NULL, 0, NULL, 2, 2, '933.00', 'OUT', '2021-04-03', '2021-04-03 18:43:41', 0),
(5, 0, 267, NULL, 0, NULL, 2, 14, '919.00', 'OUT', '2021-04-03', '2021-04-03 18:49:52', 0),
(179, 0, 268, NULL, 0, NULL, 2, 1, '87.00', 'OUT', '2021-04-05', '2021-04-05 09:02:13', 0),
(187, 0, 269, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-05', '2021-04-05 09:06:26', 0),
(152, 0, 270, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-05', '2021-04-05 10:43:57', 0),
(228, 0, 271, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-05', '2021-04-05 10:58:54', 0),
(188, 0, 272, NULL, 0, NULL, 2, 1, '98.50', 'OUT', '2021-04-05', '2021-04-05 11:09:39', 0),
(205, 0, 273, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-05', '2021-04-05 11:11:52', 0),
(154, 0, 275, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-05', '2021-04-05 11:55:23', 0),
(219, 0, 276, NULL, 0, NULL, 2, 3, '90.00', 'OUT', '2021-04-05', '2021-04-05 12:10:49', 0),
(154, 0, 277, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-05', '2021-04-05 12:21:47', 0),
(160, 0, 278, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-05', '2021-04-05 12:46:59', 0),
(236, 0, 278, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-05', '2021-04-05 12:47:06', 0),
(8, 0, 278, NULL, 0, NULL, 2, 1, '989.50', 'OUT', '2021-04-05', '2021-04-05 12:47:32', 0),
(179, 0, 278, NULL, 0, NULL, 2, 1, '85.50', 'OUT', '2021-04-05', '2021-04-05 12:47:42', 0),
(9, 0, 278, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-05', '2021-04-05 12:48:09', 0),
(14, 0, 278, NULL, 0, NULL, 2, 1, '997.50', 'OUT', '2021-04-05', '2021-04-05 12:48:39', 0),
(157, 0, 278, NULL, 0, NULL, 2, 1, '83.00', 'OUT', '2021-04-05', '2021-04-05 12:49:14', 0),
(145, 0, 278, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 12:49:26', 0),
(58, 0, 278, NULL, 0, NULL, 2, 3, '996.00', 'OUT', '2021-04-05', '2021-04-05 12:49:36', 0),
(169, 0, 278, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-05', '2021-04-05 12:49:52', 0),
(139, 0, 278, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-05', '2021-04-05 12:50:01', 0),
(138, 0, 278, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-05', '2021-04-05 12:50:26', 0),
(238, 0, 278, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 12:51:05', 0),
(176, 0, 278, NULL, 0, NULL, 2, 2, '85.00', 'OUT', '2021-04-05', '2021-04-05 12:52:03', 0),
(83, 0, 278, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 12:52:45', 0),
(84, 0, 278, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-05', '2021-04-05 12:52:54', 0),
(121, 0, 278, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-05', '2021-04-05 12:53:14', 0),
(123, 0, 278, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-05', '2021-04-05 12:53:23', 0),
(201, 0, 278, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-05', '2021-04-05 12:53:35', 0),
(54, 0, 278, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-05', '2021-04-05 12:53:50', 0),
(205, 0, 278, NULL, 0, NULL, 2, 4, '90.00', 'OUT', '2021-04-05', '2021-04-05 12:54:06', 0),
(118, 0, 278, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-05', '2021-04-05 12:54:31', 0),
(62, 0, 278, NULL, 0, NULL, 2, 2, '994.00', 'OUT', '2021-04-05', '2021-04-05 12:55:15', 0),
(75, 0, 278, NULL, 0, NULL, 2, 2, '995.00', 'OUT', '2021-04-05', '2021-04-05 12:55:24', 0),
(68, 0, 278, NULL, 0, NULL, 2, 3, '991.00', 'OUT', '2021-04-05', '2021-04-05 12:55:43', 0),
(135, 0, 278, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-05', '2021-04-05 12:56:12', 0),
(33, 0, 278, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-05', '2021-04-05 12:56:32', 0),
(32, 0, 278, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-05', '2021-04-05 12:56:41', 0),
(167, 0, 278, NULL, 0, NULL, 2, 3, '94.00', 'OUT', '2021-04-05', '2021-04-05 12:56:54', 0),
(225, 0, 278, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-05', '2021-04-05 12:57:04', 0),
(82, 0, 278, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-04-05', '2021-04-05 12:58:22', 0),
(194, 0, 278, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 12:58:31', 0),
(136, 0, 278, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 12:58:41', 0),
(141, 0, 278, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-05', '2021-04-05 12:59:10', 0),
(166, 0, 278, NULL, 0, NULL, 2, 2, '95.00', 'OUT', '2021-04-05', '2021-04-05 12:59:53', 0),
(77, 0, 278, NULL, 0, NULL, 2, 1, '993.50', 'OUT', '2021-04-05', '2021-04-05 13:00:21', 0),
(37, 0, 278, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-05', '2021-04-05 13:02:54', 0),
(216, 0, 278, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-05', '2021-04-05 13:03:04', 0),
(165, 0, 279, NULL, 0, NULL, 2, 4, '859.00', 'OUT', '2021-04-05', '2021-04-05 13:14:42', 0),
(239, 0, 279, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-04-05', '2021-04-05 13:18:06', 0),
(196, 0, 280, NULL, 0, NULL, 2, 1, '83.00', 'OUT', '2021-04-05', '2021-04-05 13:42:05', 0),
(27, 0, 282, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-05', '2021-04-05 14:16:03', 0),
(167, 0, 282, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-05', '2021-04-05 14:16:17', 0),
(121, 0, 283, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 14:33:50', 0),
(165, 0, 284, NULL, 0, NULL, 2, 2, '857.00', 'OUT', '2021-04-05', '2021-04-05 15:05:26', 0),
(188, 0, 285, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-05', '2021-04-05 15:12:04', 0),
(182, 0, 286, NULL, 0, NULL, 2, 2, '69.00', 'OUT', '2021-04-05', '2021-04-05 15:13:01', 0),
(164, 0, 286, NULL, 0, NULL, 2, 1, '67.50', 'OUT', '2021-04-05', '2021-04-05 15:13:12', 0),
(250, 0, 286, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 15:14:27', 0),
(14, 0, 287, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 15:18:15', 0),
(10, 0, 287, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-05', '2021-04-05 15:18:39', 0),
(170, 0, 288, NULL, 0, NULL, 2, 1, '72.00', 'OUT', '2021-04-05', '2021-04-05 15:26:59', 0),
(251, 0, 290, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 15:32:27', 0),
(14, 0, 291, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-05', '2021-04-05 15:33:58', 0),
(14, 0, 292, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-05', '2021-04-05 15:35:23', 0),
(168, 0, 293, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-05', '2021-04-05 15:43:35', 0),
(32, 0, 293, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-05', '2021-04-05 15:43:55', 0),
(139, 0, 294, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-05', '2021-04-05 15:46:19', 0),
(5, 0, 295, NULL, 0, NULL, 2, 2, '917.00', 'OUT', '2021-04-05', '2021-04-05 15:47:04', 0),
(91, 0, 295, NULL, 0, NULL, 2, 3, '997.00', 'OUT', '2021-04-05', '2021-04-05 15:47:57', 0),
(69, 0, 296, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-04-05', '2021-04-05 16:07:29', 0),
(201, 0, 297, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-05', '2021-04-05 16:13:40', 0),
(179, 0, 298, NULL, 0, NULL, 2, 1, '85.00', 'OUT', '2021-04-05', '2021-04-05 16:23:03', 0),
(39, 0, 299, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-05', '2021-04-05 16:35:41', 0),
(37, 0, 299, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-05', '2021-04-05 16:40:57', 0),
(85, 0, 299, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-05', '2021-04-05 16:41:22', 0),
(5, 0, 300, NULL, 0, NULL, 2, 1, '916.00', 'OUT', '2021-04-05', '2021-04-05 18:06:57', 0),
(165, 0, 300, NULL, 0, NULL, 2, 1, '856.00', 'OUT', '2021-04-05', '2021-04-05 18:07:07', 0),
(92, 0, 301, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-05', '2021-04-05 18:08:34', 0),
(234, 0, 302, NULL, 0, NULL, 2, 1, '99.50', 'OUT', '2021-04-05', '2021-04-05 18:11:17', 0),
(165, 0, 302, NULL, 0, NULL, 2, 3, '853.00', 'OUT', '2021-04-05', '2021-04-05 18:13:13', 0),
(252, 0, 302, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 18:13:22', 0),
(77, 0, 302, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-05', '2021-04-05 18:13:30', 0),
(238, 0, 302, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-05', '2021-04-05 18:16:47', 0),
(170, 0, 304, NULL, 0, NULL, 2, 1, '71.50', 'OUT', '2021-04-05', '2021-04-05 18:18:38', 0),
(165, 0, 305, NULL, 0, NULL, 2, 1, '852.00', 'OUT', '2021-04-05', '2021-04-05 18:19:21', 0),
(165, 0, 306, NULL, 0, NULL, 2, 5, '847.00', 'OUT', '2021-04-05', '2021-04-05 18:24:46', 0),
(14, 0, 307, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-05', '2021-04-05 18:36:16', 0),
(172, 0, 308, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-05', '2021-04-05 18:40:17', 0),
(253, 0, 310, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-05', '2021-04-05 18:44:11', 0),
(205, 0, 311, NULL, 0, NULL, 2, 2, '88.00', 'OUT', '2021-04-05', '2021-04-05 18:48:16', 0),
(5, 0, 312, NULL, 0, NULL, 2, 1, '915.00', 'OUT', '2021-04-05', '2021-04-05 18:53:27', 0),
(141, 0, 313, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-06', '2021-04-06 08:24:56', 0),
(233, 0, 314, NULL, 0, NULL, 2, 1, '97.50', 'OUT', '2021-04-06', '2021-04-06 08:29:15', 0),
(23, 0, 314, NULL, 0, NULL, 2, 1, '982.00', 'OUT', '2021-04-06', '2021-04-06 08:29:27', 0),
(5, 0, 315, NULL, 0, NULL, 2, 1, '914.00', 'OUT', '2021-04-06', '2021-04-06 08:48:30', 0),
(186, 0, 316, NULL, 0, NULL, 2, 1, '79.00', 'OUT', '2021-04-06', '2021-04-06 08:52:53', 0),
(5, 0, 317, NULL, 0, NULL, 2, 18, '896.00', 'OUT', '2021-04-06', '2021-04-06 09:35:01', 0),
(203, 0, 318, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-06', '2021-04-06 09:45:51', 0),
(165, 0, 319, NULL, 0, NULL, 2, 5, '841.00', 'OUT', '2021-04-06', '2021-04-06 11:31:28', 0),
(14, 0, 320, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-06', '2021-04-06 13:19:45', 0),
(18, 0, 321, NULL, 0, NULL, 2, 4, '996.00', 'OUT', '2021-04-06', '2021-04-06 15:03:51', 0),
(12, 0, 321, NULL, 0, NULL, 2, 5, '995.00', 'OUT', '2021-04-06', '2021-04-06 15:04:19', 0),
(242, 0, 321, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-04-06', '2021-04-06 15:04:40', 0),
(243, 0, 321, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-04-06', '2021-04-06 15:07:08', 0),
(254, 0, 321, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-04-06', '2021-04-06 15:09:10', 0),
(5, 0, 321, NULL, 0, NULL, 2, 7, '889.00', 'OUT', '2021-04-06', '2021-04-06 15:09:40', 0),
(253, 0, 321, NULL, 0, NULL, 2, 4, '95.00', 'OUT', '2021-04-06', '2021-04-06 15:10:46', 0),
(161, 0, 323, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-06', '2021-04-06 16:03:53', 0),
(233, 0, 324, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-06', '2021-04-06 16:27:40', 0),
(255, 0, 326, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-06', '2021-04-06 17:08:16', 0),
(62, 0, 326, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-06', '2021-04-06 17:08:32', 0),
(68, 0, 326, NULL, 0, NULL, 2, 1, '990.00', 'OUT', '2021-04-06', '2021-04-06 17:08:42', 0),
(73, 0, 326, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-06', '2021-04-06 17:08:52', 0),
(67, 0, 326, NULL, 0, NULL, 2, 1, '999.50', 'OUT', '2021-04-06', '2021-04-06 17:10:11', 0),
(234, 0, 327, NULL, 0, NULL, 2, 1, '99.50', 'OUT', '2021-04-06', '2021-04-06 17:20:35', 0),
(141, 0, 328, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-06', '2021-04-06 17:26:17', 0),
(233, 0, 329, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-06', '2021-04-06 17:43:39', 0),
(255, 0, 329, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-06', '2021-04-06 17:43:49', 0),
(8, 0, 329, NULL, 0, NULL, 2, 1, '989.50', 'OUT', '2021-04-06', '2021-04-06 17:44:57', 0),
(260, 0, 331, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-06', '2021-04-06 17:51:14', 0),
(255, 0, 332, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-06', '2021-04-06 17:52:37', 0),
(165, 0, 333, NULL, 0, NULL, 2, 2, '839.00', 'OUT', '2021-04-06', '2021-04-06 17:53:02', 0),
(5, 0, 334, NULL, 0, NULL, 2, 1, '888.00', 'OUT', '2021-04-06', '2021-04-06 18:00:39', 0),
(27, 0, 335, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-06', '2021-04-06 18:11:46', 0),
(233, 0, 336, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-06', '2021-04-06 18:13:21', 0),
(5, 0, 337, NULL, 0, NULL, 2, 5, '883.00', 'OUT', '2021-04-06', '2021-04-06 18:14:48', 0),
(141, 0, 338, NULL, 0, NULL, 2, 2, '994.00', 'OUT', '2021-04-06', '2021-04-06 18:23:21', 0),
(141, 0, 339, NULL, 0, NULL, 2, 2, '992.00', 'OUT', '2021-04-06', '2021-04-06 18:29:18', 0),
(261, 0, 342, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-06', '2021-04-06 18:39:28', 0),
(165, 0, 343, NULL, 0, NULL, 2, 1, '838.00', 'OUT', '2021-04-06', '2021-04-06 18:49:00', 0),
(233, 0, 344, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-07', '2021-04-07 07:58:30', 0),
(141, 0, 344, NULL, 0, NULL, 2, 1, '991.50', 'OUT', '2021-04-07', '2021-04-07 07:58:44', 0),
(262, 0, 346, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-07', '2021-04-07 08:59:21', 0),
(136, 0, 347, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-07', '2021-04-07 09:03:17', 0),
(165, 0, 348, NULL, 0, NULL, 2, 4, '834.00', 'OUT', '2021-04-07', '2021-04-07 09:34:23', 0),
(154, 0, 349, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-07', '2021-04-07 09:42:44', 0),
(144, 0, 350, NULL, 0, NULL, 2, 1, '997.50', 'OUT', '2021-04-07', '2021-04-07 09:44:02', 0);
INSERT INTO `kp_stock_track` (`item_id`, `uom`, `sale_id`, `po_id`, `grn_id`, `ret_id`, `user_id`, `qty`, `stock_bal`, `status`, `day`, `datime`, `shop`) VALUES
(8, 0, 351, NULL, 0, NULL, 2, 1, '989.00', 'OUT', '2021-04-07', '2021-04-07 09:59:31', 0),
(165, 0, 355, NULL, 0, NULL, 2, 5, '829.00', 'OUT', '2021-04-07', '2021-04-07 13:05:51', 0),
(205, 0, 355, NULL, 0, NULL, 2, 3, '85.00', 'OUT', '2021-04-07', '2021-04-07 13:06:31', 0),
(236, 0, 356, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-07', '2021-04-07 13:10:48', 0),
(188, 0, 357, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-07', '2021-04-07 14:40:17', 0),
(255, 0, 358, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-07', '2021-04-07 15:24:34', 0),
(166, 0, 358, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-07', '2021-04-07 15:25:30', 0),
(37, 0, 358, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-07', '2021-04-07 15:25:44', 0),
(23, 0, 358, NULL, 0, NULL, 2, 1, '981.00', 'OUT', '2021-04-07', '2021-04-07 15:26:09', 0),
(259, 0, 360, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-07', '2021-04-07 15:38:16', 0),
(170, 0, 361, NULL, 0, NULL, 2, 1, '71.00', 'OUT', '2021-04-07', '2021-04-07 16:01:32', 0),
(180, 0, 362, NULL, 0, NULL, 2, 2, '90.00', 'OUT', '2021-04-07', '2021-04-07 16:13:18', 0),
(165, 0, 363, NULL, 0, NULL, 2, 1, '828.00', 'OUT', '2021-04-07', '2021-04-07 16:45:56', 0),
(5, 0, 363, NULL, 0, NULL, 2, 2, '881.00', 'OUT', '2021-04-07', '2021-04-07 16:46:16', 0),
(182, 0, 363, NULL, 0, NULL, 2, 1, '68.00', 'OUT', '2021-04-07', '2021-04-07 16:46:56', 0),
(180, 0, 363, NULL, 0, NULL, 2, 2, '88.00', 'OUT', '2021-04-07', '2021-04-07 16:47:43', 0),
(137, 0, 363, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-07', '2021-04-07 16:49:58', 0),
(189, 0, 363, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-07', '2021-04-07 16:54:17', 0),
(75, 0, 364, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-07', '2021-04-07 16:59:27', 0),
(74, 0, 364, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-07', '2021-04-07 17:03:01', 0),
(73, 0, 364, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-07', '2021-04-07 17:03:12', 0),
(255, 0, 364, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-07', '2021-04-07 17:04:29', 0),
(37, 0, 365, NULL, 0, NULL, 2, 1, '990.00', 'OUT', '2021-04-07', '2021-04-07 17:12:07', 0),
(5, 0, 366, NULL, 0, NULL, 2, 1, '880.00', 'OUT', '2021-04-07', '2021-04-07 17:37:43', 0),
(187, 0, 367, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-07', '2021-04-07 17:38:25', 0),
(208, 0, 368, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-07', '2021-04-07 17:42:34', 0),
(176, 0, 368, NULL, 0, NULL, 2, 1, '84.00', 'OUT', '2021-04-07', '2021-04-07 17:43:35', 0),
(5, 0, 369, NULL, 0, NULL, 2, 2, '878.00', 'OUT', '2021-04-07', '2021-04-07 17:54:48', 0),
(141, 0, 370, NULL, 0, NULL, 2, 4, '988.00', 'OUT', '2021-04-07', '2021-04-07 18:15:32', 0),
(234, 0, 371, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-07', '2021-04-07 18:19:11', 0),
(141, 0, 372, NULL, 0, NULL, 2, 0, '987.75', 'OUT', '2021-04-07', '2021-04-07 18:22:07', 0),
(5, 0, 373, NULL, 0, NULL, 2, 4, '874.00', 'OUT', '2021-04-07', '2021-04-07 18:23:16', 0),
(253, 0, 374, NULL, 0, NULL, 2, 1, '94.50', 'OUT', '2021-04-07', '2021-04-07 18:26:24', 0),
(165, 0, 374, NULL, 0, NULL, 2, 2, '826.00', 'OUT', '2021-04-07', '2021-04-07 18:26:37', 0),
(23, 0, 375, NULL, 0, NULL, 2, 1, '980.00', 'OUT', '2021-04-07', '2021-04-07 18:35:10', 0),
(194, 0, 376, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-08', '2021-04-08 08:14:40', 0),
(62, 0, 377, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-08', '2021-04-08 08:37:35', 0),
(178, 0, 377, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-08', '2021-04-08 08:37:43', 0),
(66, 0, 378, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-08', '2021-04-08 08:41:21', 0),
(8, 0, 379, NULL, 0, NULL, 2, 1, '988.00', 'OUT', '0000-00-00', '2021-04-08 12:39:16', 0),
(179, 0, 379, NULL, 0, NULL, 2, 1, '84.00', 'OUT', '0000-00-00', '2021-04-08 12:40:11', 0),
(135, 0, 379, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '0000-00-00', '2021-04-08 12:41:04', 0),
(136, 0, 379, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '0000-00-00', '2021-04-08 12:44:16', 0),
(119, 0, 379, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '0000-00-00', '2021-04-08 12:46:00', 0),
(236, 0, 380, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '0000-00-00', '2021-04-08 13:18:17', 0),
(165, 0, 381, NULL, 0, NULL, 2, 1, '825.50', 'OUT', '2021-04-08', '2021-04-08 13:20:17', 0),
(23, 0, 385, NULL, 0, NULL, 2, 1, '979.00', 'OUT', '2021-04-08', '2021-04-08 14:27:18', 0),
(121, 0, 386, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-08', '2021-04-08 15:10:28', 0),
(218, 0, 387, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-08', '2021-04-08 15:16:47', 0),
(23, 0, 388, NULL, 0, NULL, 2, 1, '978.00', 'OUT', '2021-04-08', '2021-04-08 15:35:00', 0),
(170, 0, 389, NULL, 0, NULL, 2, 1, '70.00', 'OUT', '2021-04-08', '2021-04-08 15:35:48', 0),
(219, 0, 390, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-08', '2021-04-08 15:48:07', 0),
(176, 0, 391, NULL, 0, NULL, 2, 1, '83.00', 'OUT', '2021-04-08', '2021-04-08 15:54:07', 0),
(173, 0, 391, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-08', '2021-04-08 15:54:17', 0),
(165, 0, 391, NULL, 0, NULL, 2, 2, '824.00', 'OUT', '2021-04-08', '2021-04-08 15:54:27', 0),
(236, 0, 392, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-08', '2021-04-08 15:59:28', 0),
(258, 0, 393, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-08', '2021-04-08 16:36:09', 0),
(170, 0, 394, NULL, 0, NULL, 2, 1, '69.50', 'OUT', '0000-00-00', '2021-04-08 17:27:19', 0),
(196, 0, 395, NULL, 0, NULL, 2, 1, '82.00', 'OUT', '2021-04-08', '2021-04-08 17:34:07', 0),
(165, 0, 395, NULL, 0, NULL, 2, 1, '823.00', 'OUT', '2021-04-08', '2021-04-08 17:34:32', 0),
(263, 0, 395, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-08', '2021-04-08 17:36:59', 0),
(66, 0, 395, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-08', '2021-04-08 17:37:24', 0),
(224, 0, 395, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-08', '2021-04-08 17:37:34', 0),
(178, 0, 396, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '0000-00-00', '2021-04-08 17:38:58', 0),
(179, 0, 397, NULL, 0, NULL, 2, 1, '83.50', 'OUT', '0000-00-00', '2021-04-08 17:45:28', 0),
(251, 0, 398, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '0000-00-00', '2021-04-08 17:46:30', 0),
(138, 0, 399, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-08', '2021-04-08 17:49:11', 0),
(5, 0, 400, NULL, 0, NULL, 2, 2, '872.00', 'OUT', '2021-04-08', '2021-04-08 17:50:59', 0),
(5, 0, 401, NULL, 0, NULL, 2, 2, '870.00', 'OUT', '2021-04-08', '2021-04-08 17:51:26', 0),
(5, 0, 402, NULL, 0, NULL, 2, 1, '869.00', 'OUT', '2021-04-08', '2021-04-08 17:53:03', 0),
(5, 0, 403, NULL, 0, NULL, 2, 1, '868.00', 'OUT', '2021-04-08', '2021-04-08 17:53:56', 0),
(178, 0, 404, NULL, 0, NULL, 2, 1, '88.00', 'OUT', '2021-04-08', '2021-04-08 18:00:13', 0),
(254, 0, 405, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-08', '2021-04-08 18:05:57', 0),
(5, 0, 405, NULL, 0, NULL, 2, 1, '867.00', 'OUT', '2021-04-08', '2021-04-08 18:06:03', 0),
(27, 0, 406, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-08', '2021-04-08 18:06:39', 0),
(5, 0, 407, NULL, 0, NULL, 2, 1, '866.50', 'OUT', '2021-04-08', '2021-04-08 18:19:05', 0),
(264, 0, 407, NULL, 0, NULL, 2, 3, '97.00', 'OUT', '2021-04-08', '2021-04-08 18:20:25', 0),
(23, 0, 408, NULL, 0, NULL, 2, 1, '977.00', 'OUT', '2021-04-08', '2021-04-08 18:21:50', 0),
(265, 0, 410, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-08', '2021-04-08 18:25:28', 0),
(5, 0, 411, NULL, 0, NULL, 2, 2, '864.00', 'OUT', '2021-04-08', '2021-04-08 18:26:35', 0),
(219, 0, 412, NULL, 0, NULL, 2, 2, '87.00', 'OUT', '2021-04-08', '2021-04-08 18:27:47', 0),
(266, 0, 414, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-08', '2021-04-08 18:29:34', 0),
(165, 0, 415, NULL, 0, NULL, 2, 2, '821.50', 'OUT', '2021-04-08', '2021-04-08 18:30:38', 0),
(164, 0, 414, NULL, 0, NULL, 2, 2, '66.00', 'OUT', '2021-04-08', '2021-04-08 18:31:02', 0),
(179, 0, 416, NULL, 0, NULL, 2, 1, '83.50', 'OUT', '2021-04-08', '2021-04-08 18:46:04', 0),
(170, 0, 417, NULL, 0, NULL, 2, 1, '69.50', 'OUT', '2021-04-08', '2021-04-08 18:51:01', 0),
(101, 0, 418, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-09', '2021-04-09 08:00:42', 0),
(165, 0, 419, NULL, 0, NULL, 2, 0, '821.75', 'OUT', '2021-04-09', '2021-04-09 08:08:55', 0),
(267, 0, 421, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-09', '2021-04-09 08:26:49', 0),
(178, 0, 423, NULL, 0, NULL, 2, 2, '86.00', 'OUT', '2021-04-09', '2021-04-09 09:19:43', 0),
(164, 0, 424, NULL, 0, NULL, 2, 10, '56.00', 'OUT', '2021-04-09', '2021-04-09 09:40:48', 0),
(33, 0, 425, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-09', '2021-04-09 09:51:10', 0),
(200, 0, 425, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-09', '2021-04-09 09:51:31', 0),
(46, 0, 425, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-09', '2021-04-09 09:51:48', 0),
(37, 0, 425, NULL, 0, NULL, 2, 1, '989.00', 'OUT', '2021-04-09', '2021-04-09 09:51:56', 0),
(135, 0, 425, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-09', '2021-04-09 09:52:10', 0),
(166, 0, 427, NULL, 0, NULL, 2, 2, '92.00', 'OUT', '2021-04-09', '2021-04-09 11:07:30', 0),
(203, 0, 427, NULL, 0, NULL, 2, 2, '87.00', 'OUT', '2021-04-09', '2021-04-09 11:07:54', 0),
(244, 0, 429, NULL, 0, NULL, 2, 1, '99.50', 'OUT', '2021-04-09', '2021-04-09 11:32:36', 0),
(119, 0, 429, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-09', '2021-04-09 11:33:03', 0),
(38, 0, 429, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-04-09', '2021-04-09 11:33:32', 0),
(178, 0, 431, NULL, 0, NULL, 2, 2, '84.00', 'OUT', '2021-04-09', '2021-04-09 11:42:36', 0),
(165, 0, 432, NULL, 0, NULL, 2, 3, '819.00', 'OUT', '2021-04-09', '2021-04-09 12:07:32', 0),
(163, 0, 434, NULL, 0, NULL, 2, 2, '96.00', 'OUT', '2021-04-09', '2021-04-09 12:45:23', 0),
(206, 0, 434, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-04-09', '2021-04-09 12:47:48', 0),
(178, 0, 434, NULL, 0, NULL, 2, 1, '83.00', 'OUT', '2021-04-09', '2021-04-09 12:49:20', 0),
(205, 0, 435, NULL, 0, NULL, 2, 1, '84.00', 'OUT', '2021-04-09', '2021-04-09 13:58:32', 0),
(186, 0, 438, NULL, 0, NULL, 2, 1, '78.00', 'OUT', '2021-04-09', '2021-04-09 16:25:43', 0),
(170, 0, 439, NULL, 0, NULL, 2, 1, '69.00', 'OUT', '2021-04-09', '2021-04-09 16:44:32', 0),
(23, 0, 440, NULL, 0, NULL, 2, 1, '976.00', 'OUT', '2021-04-09', '2021-04-09 16:51:12', 0),
(154, 0, 441, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-09', '2021-04-09 16:57:39', 0),
(268, 0, 442, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-09', '2021-04-09 17:02:26', 0),
(176, 0, 443, NULL, 0, NULL, 2, 1, '82.00', 'OUT', '2021-04-09', '2021-04-09 17:20:37', 0),
(154, 0, 444, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-09', '2021-04-09 17:26:01', 0),
(270, 0, 445, NULL, 0, NULL, 2, 0, '99.75', 'OUT', '2021-04-09', '2021-04-09 17:27:15', 0),
(170, 0, 446, NULL, 0, NULL, 2, 2, '67.00', 'OUT', '2021-04-09', '2021-04-09 17:30:03', 0),
(187, 0, 446, NULL, 0, NULL, 2, 2, '90.00', 'OUT', '2021-04-09', '2021-04-09 17:30:17', 0),
(82, 0, 447, NULL, 0, NULL, 2, 3, '995.00', 'OUT', '2021-04-09', '2021-04-09 17:35:48', 0),
(176, 0, 447, NULL, 0, NULL, 2, 2, '80.50', 'OUT', '2021-04-09', '2021-04-09 17:35:56', 0),
(166, 0, 447, NULL, 0, NULL, 2, 2, '90.00', 'OUT', '2021-04-09', '2021-04-09 17:39:01', 0),
(173, 0, 447, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-09', '2021-04-09 17:40:33', 0),
(271, 0, 447, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-09', '2021-04-09 17:41:39', 0),
(272, 0, 447, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-09', '2021-04-09 17:46:33', 0),
(181, 0, 447, NULL, 0, NULL, 2, 2, '97.00', 'OUT', '2021-04-09', '2021-04-09 17:46:46', 0),
(172, 0, 447, NULL, 0, NULL, 2, 2, '94.00', 'OUT', '2021-04-09', '2021-04-09 17:47:15', 0),
(141, 0, 449, NULL, 0, NULL, 2, 0, '987.75', 'OUT', '2021-04-09', '2021-04-09 17:54:17', 0),
(154, 0, 450, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-09', '2021-04-09 17:59:25', 0),
(253, 0, 450, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-09', '2021-04-09 17:59:34', 0),
(196, 0, 451, NULL, 0, NULL, 2, 1, '81.00', 'OUT', '2021-04-09', '2021-04-09 18:15:37', 0),
(5, 0, 452, NULL, 0, NULL, 2, 1, '863.50', 'OUT', '2021-04-09', '2021-04-09 18:35:19', 0),
(27, 0, 453, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-09', '2021-04-09 18:44:58', 0),
(273, 0, 455, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-09', '2021-04-09 18:49:39', 0),
(178, 0, 456, NULL, 0, NULL, 2, 1, '82.00', 'OUT', '2021-04-10', '2021-04-10 08:15:19', 0),
(178, 0, 458, NULL, 0, NULL, 2, 1, '81.00', 'OUT', '2021-04-10', '2021-04-10 09:02:10', 0),
(242, 0, 459, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-10', '2021-04-10 09:30:03', 0),
(274, 0, 461, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-04-10', '2021-04-10 09:45:23', 0),
(165, 0, 462, NULL, 0, NULL, 2, 3, '816.00', 'OUT', '2021-04-10', '2021-04-10 10:13:38', 0),
(5, 0, 462, NULL, 0, NULL, 2, 5, '859.00', 'OUT', '2021-04-10', '2021-04-10 10:13:49', 0),
(5, 0, 463, NULL, 0, NULL, 2, 1, '858.50', 'OUT', '2021-04-10', '2021-04-10 10:18:49', 0),
(273, 0, 465, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-10', '2021-04-10 16:29:36', 0),
(170, 0, 466, NULL, 0, NULL, 2, 3, '64.00', 'OUT', '2021-04-10', '2021-04-10 16:44:18', 0),
(165, 0, 468, NULL, 0, NULL, 2, 3, '798.00', 'OUT', '2021-04-10', '2021-04-10 16:59:40', 0),
(5, 0, 468, NULL, 0, NULL, 2, 3, '855.00', 'OUT', '2021-04-10', '2021-04-10 17:00:16', 0),
(193, 0, 468, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-10', '2021-04-10 17:01:02', 0),
(65, 0, 468, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-10', '2021-04-10 17:02:44', 0),
(77, 0, 469, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-10', '2021-04-10 17:08:53', 0),
(211, 0, 470, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-10', '2021-04-10 17:11:44', 0),
(269, 0, 471, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-10', '2021-04-10 17:12:23', 0),
(181, 0, 472, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-10', '2021-04-10 17:23:46', 0),
(170, 0, 473, NULL, 0, NULL, 2, 1, '63.50', 'OUT', '2021-04-10', '2021-04-10 17:25:09', 0),
(165, 0, 474, NULL, 0, NULL, 2, 3, '795.00', 'OUT', '2021-04-10', '2021-04-10 17:47:33', 0),
(164, 0, 475, NULL, 0, NULL, 2, 2, '54.00', 'OUT', '2021-04-10', '2021-04-10 17:53:48', 0),
(141, 0, 476, NULL, 0, NULL, 2, 1, '987.00', 'OUT', '2021-04-10', '2021-04-10 17:58:07', 0),
(259, 0, 477, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-10', '2021-04-10 18:08:26', 0),
(225, 0, 478, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-10', '2021-04-10 18:14:26', 0),
(269, 0, 479, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-10', '2021-04-10 18:16:29', 0),
(233, 0, 480, NULL, 0, NULL, 2, 0, '93.60', 'OUT', '2021-04-10', '2021-04-10 18:27:33', 0),
(265, 0, 480, NULL, 0, NULL, 2, 1, '97.50', 'OUT', '2021-04-10', '2021-04-10 18:30:51', 0),
(16, 0, 480, NULL, 0, NULL, 2, 1, '999.50', 'OUT', '2021-04-10', '2021-04-10 18:31:38', 0),
(165, 0, 481, NULL, 0, NULL, 2, 2, '793.00', 'OUT', '2021-04-10', '2021-04-10 18:32:04', 0),
(23, 0, 482, NULL, 0, NULL, 2, 1, '975.00', 'OUT', '2021-04-10', '2021-04-10 18:33:06', 0),
(164, 0, 482, NULL, 0, NULL, 2, 2, '52.00', 'OUT', '2021-04-10', '2021-04-10 18:33:18', 0),
(187, 0, 483, NULL, 0, NULL, 2, 2, '88.00', 'OUT', '2021-04-10', '2021-04-10 18:56:52', 0),
(32, 0, 484, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-10', '2021-04-10 18:58:22', 0),
(38, 0, 484, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-10', '2021-04-10 18:58:33', 0),
(39, 0, 484, NULL, 0, NULL, 2, 1, '996.00', 'OUT', '2021-04-10', '2021-04-10 18:58:47', 0),
(179, 0, 485, NULL, 0, NULL, 2, 1, '83.50', 'OUT', '2021-04-10', '2021-04-10 19:01:52', 0),
(239, 0, 486, NULL, 0, NULL, 2, 3, '93.00', 'OUT', '2021-04-10', '2021-04-10 19:12:14', 0),
(5, 0, 487, NULL, 0, NULL, 2, 2, '853.00', 'OUT', '2021-04-10', '2021-04-10 19:16:02', 0),
(165, 0, 487, NULL, 0, NULL, 2, 1, '792.00', 'OUT', '2021-04-10', '2021-04-10 19:16:10', 0),
(5, 0, 488, NULL, 0, NULL, 2, 5, '848.00', 'OUT', '2021-04-11', '2021-04-11 12:00:44', 0),
(189, 0, 488, NULL, 0, NULL, 2, 2, '91.00', 'OUT', '2021-04-11', '2021-04-11 12:00:57', 0),
(68, 0, 488, NULL, 0, NULL, 2, 1, '989.00', 'OUT', '2021-04-11', '2021-04-11 12:01:08', 0),
(251, 0, 489, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-11', '2021-04-11 12:14:56', 0),
(5, 0, 490, NULL, 0, NULL, 2, 2, '846.00', 'OUT', '2021-04-11', '2021-04-11 12:43:23', 0),
(268, 0, 491, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-11', '2021-04-11 13:17:35', 0),
(152, 0, 491, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-11', '2021-04-11 13:17:44', 0),
(5, 0, 492, NULL, 0, NULL, 2, 1, '846.00', 'OUT', '2021-04-11', '2021-04-11 13:27:00', 0),
(208, 0, 492, NULL, 0, NULL, 2, 4, '88.00', 'OUT', '2021-04-11', '2021-04-11 13:27:21', 0),
(33, 0, 492, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-11', '2021-04-11 13:27:31', 0),
(32, 0, 492, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-11', '2021-04-11 13:27:39', 0),
(152, 0, 492, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-11', '2021-04-11 13:28:04', 0),
(75, 0, 492, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-11', '2021-04-11 13:29:46', 0),
(68, 0, 492, NULL, 0, NULL, 2, 1, '988.00', 'OUT', '2021-04-11', '2021-04-11 13:30:05', 0),
(62, 0, 492, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-11', '2021-04-11 13:30:21', 0),
(181, 0, 493, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-11', '2021-04-11 13:33:21', 0),
(180, 0, 493, NULL, 0, NULL, 2, 1, '87.00', 'OUT', '2021-04-11', '2021-04-11 13:33:45', 0),
(5, 0, 493, NULL, 0, NULL, 2, 1, '845.00', 'OUT', '2021-04-11', '2021-04-11 13:33:52', 0),
(176, 0, 492, NULL, 0, NULL, 2, 1, '79.00', 'OUT', '2021-04-11', '2021-04-11 13:35:37', 0),
(139, 0, 492, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-11', '2021-04-11 13:35:49', 0),
(138, 0, 492, NULL, 0, NULL, 2, 1, '994.50', 'OUT', '2021-04-11', '2021-04-11 13:50:10', 0),
(188, 0, 492, NULL, 0, NULL, 2, 1, '95.50', 'OUT', '2021-04-11', '2021-04-11 13:57:46', 0),
(84, 0, 492, NULL, 0, NULL, 2, 1, '993.00', 'OUT', '2021-04-11', '2021-04-11 13:58:25', 0),
(269, 0, 492, NULL, 0, NULL, 2, 2, '96.00', 'OUT', '2021-04-11', '2021-04-11 13:58:43', 0),
(220, 0, 492, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-11', '2021-04-11 13:59:02', 0),
(46, 0, 492, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-11', '2021-04-11 13:59:37', 0),
(200, 0, 492, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-11', '2021-04-11 13:59:47', 0),
(179, 0, 492, NULL, 0, NULL, 2, 1, '83.50', 'OUT', '2021-04-11', '2021-04-11 14:00:06', 0),
(165, 0, 492, NULL, 0, NULL, 2, 19, '773.00', 'OUT', '2021-04-11', '2021-04-11 14:29:52', 0),
(251, 0, 492, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-11', '2021-04-11 14:30:36', 0),
(258, 0, 492, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-11', '2021-04-11 14:32:21', 0),
(244, 0, 495, NULL, 0, NULL, 2, 1, '99.50', 'OUT', '2021-04-11', '2021-04-11 14:49:16', 0),
(249, 0, 495, NULL, 0, NULL, 2, 1, '99.50', 'OUT', '2021-04-11', '2021-04-11 14:49:32', 0),
(203, 0, 495, NULL, 0, NULL, 2, 1, '86.00', 'OUT', '2021-04-11', '2021-04-11 14:49:48', 0),
(270, 0, 495, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-11', '2021-04-11 14:51:05', 0),
(242, 0, 496, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-11', '2021-04-11 15:04:00', 0),
(179, 0, 496, NULL, 0, NULL, 2, 10, '74.00', 'OUT', '2021-04-11', '2021-04-11 15:04:11', 0),
(5, 0, 496, NULL, 0, NULL, 2, 1, '844.00', 'OUT', '2021-04-11', '2021-04-11 15:04:33', 0),
(152, 0, 496, NULL, 0, NULL, 2, 2, '94.00', 'OUT', '2021-04-11', '2021-04-11 15:04:45', 0),
(258, 0, 496, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-11', '2021-04-11 15:05:35', 0),
(5, 0, 497, NULL, 0, NULL, 2, 1, '843.00', 'OUT', '2021-04-11', '2021-04-11 15:06:57', 0),
(152, 0, 497, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-11', '2021-04-11 15:07:12', 0),
(179, 0, 497, NULL, 0, NULL, 2, 1, '73.00', 'OUT', '2021-04-11', '2021-04-11 15:07:24', 0),
(242, 0, 497, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-11', '2021-04-11 15:07:38', 0),
(258, 0, 497, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-11', '2021-04-11 15:07:50', 0),
(269, 0, 497, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-11', '2021-04-11 15:08:17', 0),
(144, 0, 498, NULL, 0, NULL, 2, 1, '997.50', 'OUT', '2021-04-11', '2021-04-11 15:44:20', 0),
(201, 0, 499, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-11', '2021-04-11 15:55:07', 0),
(82, 0, 499, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-11', '2021-04-11 15:55:20', 0),
(239, 0, 499, NULL, 0, NULL, 2, 6, '87.00', 'OUT', '2021-04-11', '2021-04-11 15:55:48', 0),
(275, 0, 499, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-11', '2021-04-11 15:58:41', 0),
(277, 0, 502, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-11', '2021-04-11 16:16:21', 0),
(275, 0, 503, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-11', '2021-04-11 16:21:30', 0),
(243, 0, 504, NULL, 0, NULL, 2, 5, '91.00', 'OUT', '2021-04-11', '2021-04-11 16:29:00', 0),
(179, 0, 505, NULL, 0, NULL, 2, 1, '72.00', 'OUT', '2021-04-11', '2021-04-11 16:36:26', 0),
(211, 0, 506, NULL, 0, NULL, 2, 4, '93.00', 'OUT', '2021-04-11', '2021-04-11 16:38:41', 0),
(246, 0, 507, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-11', '2021-04-11 16:41:17', 0),
(211, 0, 508, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-11', '2021-04-11 17:04:38', 0),
(39, 0, 508, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-11', '2021-04-11 17:04:51', 0),
(165, 0, 509, NULL, 0, NULL, 2, 1, '772.00', 'OUT', '2021-04-11', '2021-04-11 17:05:47', 0),
(253, 0, 509, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-11', '2021-04-11 17:06:00', 0),
(39, 0, 509, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-11', '2021-04-11 17:07:19', 0),
(23, 0, 509, NULL, 0, NULL, 2, 1, '974.00', 'OUT', '2021-04-11', '2021-04-11 17:07:44', 0),
(121, 0, 509, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-11', '2021-04-11 17:08:01', 0),
(204, 0, 509, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-11', '2021-04-11 17:08:11', 0),
(84, 0, 509, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-11', '2021-04-11 17:08:21', 0),
(70, 0, 510, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-12', '2021-04-12 08:16:52', 0),
(23, 0, 510, NULL, 0, NULL, 2, 1, '973.00', 'OUT', '2021-04-12', '2021-04-12 08:17:05', 0),
(225, 0, 511, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-12', '2021-04-12 08:40:13', 0),
(255, 0, 514, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-12', '2021-04-12 09:27:58', 0),
(225, 0, 514, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-12', '2021-04-12 09:28:08', 0),
(278, 0, 514, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-12', '2021-04-12 09:33:55', 0),
(208, 0, 515, NULL, 0, NULL, 2, 2, '86.00', 'OUT', '2021-04-12', '2021-04-12 09:36:18', 0),
(163, 0, 515, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-04-12', '2021-04-12 09:36:27', 0),
(139, 0, 516, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-12', '2021-04-12 09:46:08', 0),
(259, 0, 517, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-12', '2021-04-12 09:47:25', 0),
(5, 0, 518, NULL, 0, NULL, 2, 1, '842.50', 'OUT', '2021-04-12', '2021-04-12 10:03:56', 0),
(274, 0, 520, NULL, 0, NULL, 2, 2, '96.00', 'OUT', '2021-04-12', '2021-04-12 10:47:13', 0),
(179, 0, 521, NULL, 0, NULL, 2, 1, '71.00', 'OUT', '2021-04-12', '2021-04-12 11:42:07', 0),
(170, 0, 521, NULL, 0, NULL, 2, 3, '61.00', 'OUT', '2021-04-12', '2021-04-12 11:43:05', 0),
(189, 0, 521, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-12', '2021-04-12 11:44:24', 0),
(269, 0, 521, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-12', '2021-04-12 11:45:20', 0),
(208, 0, 521, NULL, 0, NULL, 2, 1, '85.00', 'OUT', '2021-04-12', '2021-04-12 11:46:17', 0),
(279, 0, 521, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-12', '2021-04-12 12:05:28', 0),
(144, 0, 523, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-04-12', '2021-04-12 12:07:06', 0),
(261, 0, 527, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-12', '2021-04-12 12:42:45', 0),
(180, 0, 528, NULL, 0, NULL, 2, 2, '85.00', 'OUT', '2021-04-12', '2021-04-12 12:52:33', 0),
(265, 0, 529, NULL, 0, NULL, 2, 1, '97.50', 'OUT', '2021-04-12', '2021-04-12 13:05:33', 0),
(76, 0, 530, NULL, 0, NULL, 2, 1, '991.50', 'OUT', '2021-04-12', '2021-04-12 13:12:06', 0),
(203, 0, 531, NULL, 0, NULL, 2, 2, '84.00', 'OUT', '2021-04-12', '2021-04-12 13:18:48', 0),
(88, 0, 532, NULL, 0, NULL, 2, 1, '998.00', 'OUT', '2021-04-12', '2021-04-12 14:18:20', 0),
(38, 0, 533, NULL, 0, NULL, 2, 1, '995.00', 'OUT', '2021-04-12', '2021-04-12 14:24:18', 0),
(140, 0, 534, NULL, 0, NULL, 2, 1, '995.50', 'OUT', '2021-04-12', '2021-04-12 14:29:55', 0),
(186, 0, 537, NULL, 0, NULL, 2, 1, '77.00', 'OUT', '2021-04-12', '2021-04-12 15:52:34', 0),
(203, 0, 538, NULL, 0, NULL, 2, 1, '83.00', 'OUT', '2021-04-12', '2021-04-12 15:56:55', 0),
(123, 0, 539, NULL, 0, NULL, 2, 5, '994.00', 'OUT', '2021-04-12', '2021-04-12 16:02:22', 0),
(170, 0, 540, NULL, 0, NULL, 2, 2, '59.50', 'OUT', '2021-04-12', '2021-04-12 16:11:38', 0),
(170, 0, 541, NULL, 0, NULL, 2, 2, '58.00', 'OUT', '2021-04-12', '2021-04-12 16:13:53', 0),
(166, 0, 542, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-04-12', '2021-04-12 16:32:58', 0),
(203, 0, 542, NULL, 0, NULL, 2, 1, '82.00', 'OUT', '2021-04-12', '2021-04-12 16:33:14', 0),
(163, 0, 542, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-12', '2021-04-12 16:33:30', 0),
(255, 0, 542, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-12', '2021-04-12 16:33:39', 0),
(211, 0, 542, NULL, 0, NULL, 2, 1, '91.00', 'OUT', '2021-04-12', '2021-04-12 16:34:11', 0),
(144, 0, 543, NULL, 0, NULL, 2, 1, '996.50', 'OUT', '2021-04-12', '2021-04-12 16:37:16', 0),
(32, 0, 544, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-12', '2021-04-12 16:50:44', 0),
(170, 0, 545, NULL, 0, NULL, 2, 1, '57.00', 'OUT', '2021-04-12', '2021-04-12 17:04:05', 0),
(68, 0, 546, NULL, 0, NULL, 2, 3, '985.00', 'OUT', '2021-04-12', '2021-04-12 17:07:34', 0),
(278, 0, 546, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-12', '2021-04-12 17:07:44', 0),
(178, 0, 547, NULL, 0, NULL, 2, 1, '80.00', 'OUT', '2021-04-12', '2021-04-12 17:16:14', 0),
(273, 0, 548, NULL, 0, NULL, 2, 2, '95.00', 'OUT', '2021-04-12', '2021-04-12 17:40:09', 0),
(183, 0, 548, NULL, 0, NULL, 2, 2, '95.00', 'OUT', '2021-04-12', '2021-04-12 17:42:16', 0),
(5, 0, 549, NULL, 0, NULL, 2, 2, '840.00', 'OUT', '2021-04-12', '2021-04-12 17:43:32', 0),
(5, 0, 550, NULL, 0, NULL, 2, 4, '836.00', 'OUT', '2021-04-12', '2021-04-12 17:47:25', 0),
(218, 0, 551, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-12', '2021-04-12 17:50:49', 0),
(269, 0, 552, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-12', '2021-04-12 17:59:14', 0),
(176, 0, 553, NULL, 0, NULL, 2, 1, '78.00', 'OUT', '2021-04-12', '2021-04-12 18:00:19', 0),
(167, 0, 553, NULL, 0, NULL, 2, 1, '92.00', 'OUT', '2021-04-12', '2021-04-12 18:01:01', 0),
(280, 0, 555, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-12', '2021-04-12 18:14:51', 0),
(5, 0, 555, NULL, 0, NULL, 2, 1, '835.00', 'OUT', '2021-04-12', '2021-04-12 18:15:10', 0),
(170, 0, 555, NULL, 0, NULL, 2, 1, '56.50', 'OUT', '2021-04-12', '2021-04-12 18:15:23', 0),
(5, 0, 556, NULL, 0, NULL, 2, 3, '832.00', 'OUT', '2021-04-12', '2021-04-12 18:21:59', 0),
(273, 0, 557, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-12', '2021-04-12 18:24:19', 0),
(210, 0, 558, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-13', '2021-04-13 08:29:35', 0),
(278, 0, 559, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-04-13', '2021-04-13 08:58:35', 0),
(33, 0, 560, NULL, 0, NULL, 2, 1, '991.00', 'OUT', '2021-04-13', '2021-04-13 09:24:05', 0),
(179, 0, NULL, 16, 0, NULL, 2, 20, '0.00', 'IN', '2021-04-13', '2021-04-13 10:07:12', 0),
(5, 0, 561, NULL, 0, NULL, 2, 1, '831.50', 'OUT', '2021-04-13', '2021-04-13 10:30:16', 0),
(274, 0, 562, NULL, 0, NULL, 2, 2, '94.00', 'OUT', '2021-04-13', '2021-04-13 10:43:52', 0),
(259, 0, 563, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-04-13', '2021-04-13 10:53:36', 0),
(179, 0, 564, NULL, 0, NULL, 2, 1, '43.50', 'OUT', '2021-04-13', '2021-04-13 11:05:06', 0),
(180, 0, 565, NULL, 0, NULL, 2, 1, '299.00', 'OUT', '2021-04-13', '2021-04-13 11:06:45', 0),
(268, 3, 566, NULL, 0, NULL, 0, 1, '97.00', 'OUT', '2021-04-13', '2021-04-13 12:52:34', 0),
(246, 13, 566, NULL, 0, NULL, 0, 1, '98.00', 'OUT', '2021-04-13', '2021-04-13 13:02:01', 0),
(253, 1, 568, NULL, 0, NULL, 0, 1, '91.00', 'OUT', '2021-04-13', '2021-04-13 13:12:38', 0),
(253, 5, 568, NULL, 0, NULL, 2, 1, '90.00', 'OUT', '2021-04-13', '2021-04-13 13:15:29', 0),
(50, 1, 569, NULL, 0, NULL, 2, 2, '998.00', 'OUT', '2021-04-13', '2021-04-13 13:20:25', 0),
(178, 1, 570, NULL, 0, NULL, 2, 2, '78.00', 'OUT', '2021-04-13', '2021-04-13 13:26:06', 0),
(165, 1, 571, NULL, 0, NULL, 2, 10, '762.00', 'OUT', '2021-04-13', '2021-04-13 13:28:38', 0),
(38, 1, 574, NULL, 0, NULL, 2, 3, '992.00', 'OUT', '2021-04-13', '2021-04-13 14:11:09', 0),
(62, 1, 574, NULL, 0, NULL, 2, 1, '990.00', 'OUT', '2021-04-13', '2021-04-13 14:15:27', 0),
(68, 1, 574, NULL, 0, NULL, 2, 1, '984.00', 'OUT', '2021-04-13', '2021-04-13 14:19:43', 0),
(178, 1, 574, NULL, 0, NULL, 2, 1, '77.00', 'OUT', '2021-04-13', '2021-04-13 14:20:16', 0),
(75, 1, 574, NULL, 0, NULL, 2, 1, '992.00', 'OUT', '2021-04-13', '2021-04-13 14:30:18', 0),
(121, 1, 574, NULL, 0, NULL, 2, 1, '994.00', 'OUT', '2021-04-13', '2021-04-13 14:33:18', 0),
(134, 1, 574, NULL, 0, NULL, 2, 1, '999.00', 'OUT', '2021-04-13', '2021-04-13 14:34:14', 0),
(201, 1, 574, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-04-13', '2021-04-13 14:40:05', 0),
(236, 1, 574, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-04-13', '2021-04-13 14:41:18', 0),
(2, 0, NULL, 17, 4, NULL, 2, 45, '0.00', 'IN', '2021-04-22', '2021-04-22 09:05:24', 0),
(9, 0, NULL, 17, 4, NULL, 2, 5, '0.00', 'IN', '2021-04-22', '2021-04-22 09:07:15', 0),
(269, 0, NULL, 14, 5, NULL, 2, 40, '0.00', 'IN', '2021-04-22', '2021-04-22 09:11:21', 0),
(268, 0, NULL, 13, 6, NULL, 2, 10, '0.00', 'IN', '2021-04-22', '2021-04-22 09:13:19', 0),
(265, 0, NULL, 13, 6, NULL, 2, 5, '0.00', 'IN', '2021-04-22', '2021-04-22 09:13:23', 0),
(5, 0, 575, NULL, 0, NULL, 2, 1, '11.00', 'OUT', '2021-04-22', '2021-04-22 22:03:00', 0),
(18, 0, 576, NULL, 0, NULL, 2, 5, '991.00', 'OUT', '2021-04-22', '2021-04-22 22:59:42', 0),
(2, 0, NULL, 18, 7, NULL, 2, 5, '0.00', 'IN', '2021-04-22', '2021-04-22 23:34:08', 0),
(281, 0, NULL, 18, 7, NULL, 2, 2, '0.00', 'IN', '2021-04-22', '2021-04-22 23:34:13', 0),
(6, 0, NULL, 18, 7, NULL, 2, 2, '0.00', 'IN', '2021-04-22', '2021-04-22 23:34:16', 0),
(2, 0, NULL, 18, 8, NULL, 2, 3, '0.00', 'IN', '2021-04-22', '2021-04-22 23:36:40', 0),
(281, 0, NULL, 18, 8, NULL, 2, 3, '0.00', 'IN', '2021-04-22', '2021-04-22 23:36:44', 0),
(5, 0, NULL, 18, 8, NULL, 2, 5, '0.00', 'IN', '2021-04-22', '2021-04-22 23:36:47', 0),
(6, 0, NULL, 18, 8, NULL, 2, 3, '0.00', 'IN', '2021-04-22', '2021-04-22 23:36:50', 0),
(8, 0, NULL, 18, 8, NULL, 2, 5, '0.00', 'IN', '2021-04-22', '2021-04-22 23:36:54', 0),
(1, 0, 577, NULL, 0, NULL, 2, 3, '2.00', 'OUT', '2021-04-23', '2021-04-23 00:49:41', 0),
(8, 0, 577, NULL, 0, NULL, 2, 2, '991.00', 'OUT', '2021-04-23', '2021-04-23 00:49:53', 0),
(8, 0, 579, NULL, 0, NULL, 2, 5, '986.00', 'OUT', '2021-04-25', '2021-04-25 10:29:10', 0),
(3, 0, 581, NULL, 0, NULL, 2, 9, '990.00', 'OUT', '2021-04-25', '2021-04-25 13:11:34', 0),
(6, 0, 582, NULL, 0, NULL, 2, 2, '1003.00', 'OUT', '2021-04-25', '2021-05-11 12:49:26', 0),
(2, 0, 585, NULL, 0, NULL, 2, 1, '12.00', 'OUT', '2021-05-22', '2021-05-22 14:14:21', 0),
(6, 0, 586, NULL, 0, NULL, 2, 2, '1001.00', 'OUT', '2021-05-22', '2021-05-22 14:16:52', 0),
(129, 0, 586, NULL, 0, NULL, 2, 1, '997.00', 'OUT', '2021-05-22', '2021-05-22 14:17:05', 0),
(80, 0, 586, NULL, 0, NULL, 2, 2, '997.00', 'OUT', '2021-05-22', '2021-05-22 14:17:43', 0),
(2, 0, 587, NULL, 0, NULL, 2, 1, '11.00', 'OUT', '2021-05-22', '2021-05-22 14:31:41', 0),
(14, 0, NULL, 5, 10, NULL, 2, 10, '0.00', 'IN', '2021-06-07', '2021-06-07 07:56:07', 0),
(14, 0, 588, NULL, 0, NULL, 2, 1, '1002.00', 'OUT', '2021-06-07', '2021-06-07 11:51:54', 0),
(8, 0, 588, NULL, 0, NULL, 2, 1, '985.00', 'OUT', '2021-06-07', '2021-06-07 11:52:24', 0),
(27, 0, 588, NULL, 0, NULL, 2, 5, '990.00', 'OUT', '2021-06-07', '2021-06-07 11:53:05', 0),
(8, 0, 591, NULL, 0, NULL, 2, 1, '984.00', 'OUT', '2021-06-07', '2021-06-07 11:55:33', 0),
(2, 0, 591, NULL, 0, NULL, 2, 2, '9.00', 'OUT', '2021-06-07', '2021-06-07 11:56:07', 0),
(14, 0, 589, NULL, 0, NULL, 2, 2, '1000.00', 'OUT', '2021-06-07', '2021-06-07 12:04:47', 0),
(27, 0, 589, NULL, 0, NULL, 2, 5, '985.00', 'OUT', '2021-06-07', '2021-06-07 12:05:31', 0),
(8, 0, 590, NULL, 0, NULL, 2, 1, '983.00', 'OUT', '2021-06-07', '2021-06-07 12:08:09', 0),
(1, 0, NULL, 21, 11, NULL, 2, 10, '0.00', 'IN', '2021-06-07', '2021-06-07 12:16:09', 0),
(3, 0, NULL, 21, 11, NULL, 2, 50, '0.00', 'IN', '2021-06-07', '2021-06-07 12:16:14', 0),
(3, 0, 592, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-06-10', '2021-06-10 09:57:58', 0),
(4, 0, 592, NULL, 0, NULL, 2, 1, '9.00', 'OUT', '2021-06-10', '2021-06-10 09:58:12', 0),
(9, 0, 592, NULL, 0, NULL, 2, 10, '991.00', 'OUT', '2021-06-10', '2021-06-10 09:58:27', 0),
(8, 0, 592, NULL, 0, NULL, 2, 10, '973.00', 'OUT', '2021-06-10', '2021-06-10 09:58:43', 0),
(26, 0, 592, NULL, 0, NULL, 2, 10, '990.00', 'OUT', '2021-06-10', '2021-06-10 09:59:44', 0),
(8, 0, 593, NULL, 0, NULL, 2, 10, '963.00', 'OUT', '2021-06-11', '2021-06-11 08:44:50', 0),
(1, 0, 593, NULL, 0, NULL, 2, 5, '7.00', 'OUT', '2021-06-11', '2021-06-11 08:45:36', 0),
(26, 0, 594, NULL, 0, NULL, 2, 1, '989.00', 'OUT', '2021-06-11', '2021-06-11 08:47:29', 0),
(8, 0, 597, NULL, 0, NULL, 2, 2, '99.00', 'OUT', '2021-06-17', '2021-06-17 11:32:27', 0),
(26, 0, 597, NULL, 0, NULL, 2, 5, '984.00', 'OUT', '2021-06-17', '2021-06-17 11:46:21', 0),
(2, 0, 599, NULL, 0, NULL, 2, 2, '1888.00', 'OUT', '2021-07-01', '2021-07-01 10:04:17', 0),
(21, 0, 599, NULL, 0, NULL, 2, 8, '5694.00', 'OUT', '2021-07-01', '2021-07-01 10:05:10', 0),
(13, 0, 599, NULL, 0, NULL, 2, 5, '5245.00', 'OUT', '2021-07-01', '2021-07-01 10:05:51', 0),
(2, 0, 600, NULL, 0, NULL, 2, 1, '1887.00', 'OUT', '2021-07-01', '2021-07-01 10:13:44', 0),
(2, 0, 601, NULL, 0, NULL, 2, 1, '1886.00', 'OUT', '2021-07-01', '2021-07-01 10:14:47', 0),
(1, 0, 602, NULL, 0, NULL, 2, 2, '2886.00', 'OUT', '2021-07-01', '2021-07-01 11:37:39', 0),
(21, 0, 602, NULL, 0, NULL, 2, 1, '5693.00', 'OUT', '2021-07-01', '2021-07-01 11:38:41', 0),
(29, 0, 602, NULL, 0, NULL, 2, 4, '836.00', 'OUT', '2021-07-01', '2021-07-01 11:50:51', 0),
(1, 0, 603, NULL, 0, NULL, 2, 1, '2885.00', 'OUT', '2021-07-01', '2021-07-01 12:00:05', 0),
(16, 0, 603, NULL, 0, NULL, 2, 5, '5245.00', 'OUT', '2021-07-01', '2021-07-01 12:01:30', 0),
(2, 0, 603, NULL, 0, NULL, 2, 3, '1883.00', 'OUT', '2021-07-01', '2021-07-01 12:03:09', 0),
(4, 0, 604, NULL, 0, NULL, 2, 1, '49.00', 'OUT', '2021-07-05', '2021-07-05 09:34:50', 0),
(1, 0, 604, NULL, 0, NULL, 2, 14, '16.00', 'OUT', '2021-07-06', '2021-07-06 05:49:58', 0),
(1, 0, NULL, 25, 13, NULL, 2, 5, '0.00', 'IN', '2021-07-06', '2021-07-06 09:01:20', 0),
(2, 0, NULL, 25, 13, NULL, 2, 5, '0.00', 'IN', '2021-07-06', '2021-07-06 09:01:25', 0),
(3, 0, NULL, 25, 13, NULL, 2, 5, '0.00', 'IN', '2021-07-06', '2021-07-06 09:01:29', 0),
(2351, 0, 605, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-06', '2021-07-06 09:35:10', 0),
(2194, 0, 605, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-07-06', '2021-07-06 09:35:55', 0),
(1177, 0, 605, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-07-06', '2021-07-06 09:36:15', 0),
(2259, 0, 605, NULL, 0, NULL, 2, 7, '93.00', 'OUT', '2021-07-06', '2021-07-06 09:37:00', 0),
(2260, 0, 605, NULL, 0, NULL, 2, 4, '96.00', 'OUT', '2021-07-06', '2021-07-06 09:37:23', 0),
(4, 0, 598, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-06', '2021-07-06 09:59:13', 0),
(52, 0, 598, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-06', '2021-07-06 10:20:19', 0),
(1933, 0, 607, NULL, 0, NULL, 2, 20, '80.00', 'OUT', '2021-07-06', '2021-07-06 10:29:07', 0),
(1, 0, 608, NULL, 0, NULL, 2, 7, '113.00', 'OUT', '2021-07-06', '2021-07-06 10:44:36', 0),
(69, 0, 607, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-12', '2021-07-12 07:53:08', 0),
(9, 0, 609, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-12', '2021-07-12 09:18:26', 0),
(9, 0, 610, NULL, 0, NULL, 1, 1, '98.00', 'OUT', '2021-07-12', '2021-07-12 09:21:45', 0),
(13, 0, 610, NULL, 0, NULL, 1, 2, '98.00', 'OUT', '2021-07-12', '2021-07-12 09:21:58', 0),
(115, 0, 611, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-13', '2021-07-13 18:39:53', 0),
(4, 0, 612, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-07-13', '2021-07-13 22:31:33', 0),
(14, 0, 612, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-07-13', '2021-07-13 22:31:44', 0),
(11, 0, 612, NULL, 0, NULL, 2, 6, '94.00', 'OUT', '2021-07-13', '2021-07-13 22:31:53', 0),
(6, 0, 611, NULL, 0, NULL, 2, 56, '44.00', 'OUT', '2021-07-13', '2021-07-13 23:04:13', 0),
(72, 0, 611, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-07-13', '2021-07-13 23:04:22', 0),
(7, 0, 613, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-13', '2021-07-13 23:17:30', 0),
(6, 0, 613, NULL, 0, NULL, 2, 5, '39.00', 'OUT', '2021-07-13', '2021-07-13 23:17:36', 0),
(462, 0, 614, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-13', '2021-07-13 23:27:19', 0),
(601, 0, 614, NULL, 0, NULL, 2, 67, '33.00', 'OUT', '2021-07-13', '2021-07-13 23:27:25', 0),
(7, 0, 576, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-04-22', '2021-07-15 09:19:55', 0),
(71, 0, 576, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-22', '2021-07-15 09:20:02', 0),
(121, 0, 611, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-15', '2021-07-15 09:54:44', 0),
(178, 0, 611, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-07-15', '2021-07-15 09:57:41', 0),
(120, 0, 616, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-15', '2021-07-15 10:22:16', 0),
(21, 0, 616, NULL, 0, NULL, 2, 5, '95.00', 'OUT', '2021-07-15', '2021-07-15 10:22:23', 0),
(267, 0, 613, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-13', '2021-07-17 17:52:20', 0),
(70, 0, 580, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-04-25', '2021-07-17 18:33:40', 0),
(9, 0, 580, NULL, 0, NULL, 2, 3, '95.00', 'OUT', '2021-04-25', '2021-07-17 18:33:49', 0),
(4, 0, 617, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-07-17', '2021-07-17 19:08:25', 0),
(2, 0, 617, NULL, 0, NULL, 2, 10, '95.00', 'OUT', '2021-07-17', '2021-07-17 19:08:30', 0),
(19, 0, 617, NULL, 0, NULL, 2, 3, '97.00', 'OUT', '2021-07-17', '2021-07-17 19:08:46', 0),
(5, 0, 618, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-22', '2021-07-22 07:48:56', 0),
(18, 0, 618, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-07-22', '2021-07-22 07:49:05', 0),
(6, 0, 621, NULL, 0, NULL, 2, 1, '38.00', 'OUT', '2021-07-22', '2021-07-22 16:25:53', 0),
(5, 0, 622, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-07-22', '2021-07-22 16:27:20', 0),
(4, 0, 623, NULL, 0, NULL, 2, 1, '96.00', 'OUT', '2021-07-22', '2021-07-22 16:28:34', 0),
(120, 0, 624, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-07-23', '2021-07-23 22:40:54', 0),
(7, 0, 625, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-08-06', '2021-08-06 12:07:02', 0),
(3, 0, 625, NULL, 0, NULL, 2, 3, '102.00', 'OUT', '2021-08-06', '2021-08-06 12:07:14', 0),
(4, 0, 625, NULL, 0, NULL, 2, 1, '95.00', 'OUT', '2021-08-06', '2021-08-06 12:07:32', 0),
(8, 0, 625, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:07:37', 0),
(9, 0, 625, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-08-06', '2021-08-06 12:07:43', 0),
(69, 0, 625, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:08:05', 0),
(70, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:08:11', 0),
(71, 0, 625, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:08:16', 0),
(12, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:08:25', 0),
(76, 0, 625, NULL, 0, NULL, 2, 11, '89.00', 'OUT', '2021-08-06', '2021-08-06 12:10:04', 0),
(77, 0, 625, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:10:11', 0),
(103, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:10:28', 0),
(114, 0, 625, NULL, 0, NULL, 2, 2, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:10:45', 0),
(120, 0, 625, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-08-06', '2021-08-06 12:11:11', 0),
(121, 0, 625, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-08-06', '2021-08-06 12:11:20', 0),
(122, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:11:29', 0),
(123, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:11:38', 0),
(2, 0, 625, NULL, 0, NULL, 2, 2, '93.00', 'OUT', '2021-08-06', '2021-08-06 12:11:43', 0),
(13, 0, 625, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-08-06', '2021-08-06 12:11:48', 0),
(14, 0, 625, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-08-06', '2021-08-06 12:11:58', 0),
(38, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:13:26', 0),
(72, 0, 625, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-08-06', '2021-08-06 12:13:49', 0),
(31, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:13:59', 0),
(15, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 12:14:15', 0),
(20, 0, 625, NULL, 0, NULL, 2, 3, '97.00', 'OUT', '2021-08-06', '2021-08-06 14:49:42', 0),
(312, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 14:50:35', 0),
(52, 0, 625, NULL, 0, NULL, 2, 1, '98.00', 'OUT', '2021-08-06', '2021-08-06 14:50:44', 0),
(29, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 14:51:17', 0),
(41, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 14:51:27', 0),
(173, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 14:51:46', 0),
(186, 0, 625, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-06', '2021-08-06 14:52:06', 0),
(5, 0, 626, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-08-18', '2021-08-18 21:55:12', 1),
(19, 0, 626, NULL, 0, NULL, 2, 8, '94.00', 'OUT', '2021-08-18', '2021-08-18 21:55:53', 1),
(21, 0, 626, NULL, 0, NULL, 2, 1, '94.00', 'OUT', '2021-08-18', '2021-08-18 21:57:24', 1),
(120, 0, 626, NULL, 0, NULL, 2, 5, '92.00', 'OUT', '2021-08-18', '2021-08-18 21:57:36', 1),
(508, 0, 626, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-18', '2021-08-18 21:57:41', 1),
(84, 0, 627, NULL, 0, NULL, 2, 1, '100.00', 'OUT', '2021-08-18', '2021-08-18 22:18:46', 2),
(21, 0, 627, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-08-18', '2021-08-18 22:18:51', 2),
(14, 0, 627, NULL, 0, NULL, 2, 1, '93.00', 'OUT', '2021-08-18', '2021-08-18 22:18:56', 2),
(17, 0, 627, NULL, 0, NULL, 2, 7, '98.00', 'OUT', '2021-08-18', '2021-08-18 22:19:03', 2),
(8, 0, 628, NULL, 0, NULL, 2, 1, '97.00', 'OUT', '2021-08-18', '2021-08-18 22:21:10', 2),
(21, 0, 628, NULL, 0, NULL, 2, 4, '89.00', 'OUT', '2021-08-18', '2021-08-18 22:21:15', 2),
(15, 0, 628, NULL, 0, NULL, 2, 7, '92.00', 'OUT', '2021-08-18', '2021-08-18 22:21:22', 2),
(1391, 0, 629, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-25', '2021-08-25 15:06:56', 2),
(34, 0, 630, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-25', '2021-08-25 15:09:30', 2),
(332, 0, 631, NULL, 0, NULL, 2, 1, '99.00', 'OUT', '2021-08-25', '2021-08-25 15:13:50', 1),
(1, 0, 632, NULL, 0, NULL, 2, 5, '5.00', 'OUT', '2021-08-26', '2021-08-26 15:40:06', 2),
(2, 0, 632, NULL, 0, NULL, 2, 10, '90.00', 'OUT', '2021-08-26', '2021-08-26 15:40:25', 2),
(4, 0, 632, NULL, 0, NULL, 2, 10, '14.00', 'OUT', '2021-08-26', '2021-08-26 15:40:38', 2),
(1, 0, 633, NULL, 0, NULL, 2, 2, '3.00', 'OUT', '2021-08-26', '2021-08-26 15:58:55', 2),
(1, 0, 634, NULL, 0, NULL, 2, 1, '2.00', 'OUT', '2021-08-26', '2021-08-26 15:59:41', 2),
(2, 0, 634, NULL, 0, NULL, 2, 1, '89.00', 'OUT', '2021-08-26', '2021-08-26 15:59:50', 2),
(3, 0, 634, NULL, 0, NULL, 2, 2, '70.00', 'OUT', '2021-08-26', '2021-08-26 15:59:59', 2),
(23, 0, 635, NULL, 0, NULL, 2, 3, '17.00', 'OUT', '2021-08-27', '2021-08-27 14:32:00', 1),
(19, 0, 635, NULL, 0, NULL, 2, 5, '15.00', 'OUT', '2021-08-27', '2021-08-27 14:32:21', 1),
(38, 0, 636, NULL, 0, NULL, 2, 9, '11.00', 'OUT', '2021-08-27', '2021-08-27 14:33:26', 1),
(7, 0, 637, NULL, 0, NULL, 2, 5, '15.00', 'OUT', '2021-08-27', '2021-08-27 14:37:57', 1),
(54, 0, 638, NULL, 0, NULL, 2, 5, '9.00', 'OUT', '2021-08-27', '2021-08-27 14:39:07', 1),
(33, 0, 639, NULL, 0, NULL, 2, 1, '19.00', 'OUT', '2021-08-27', '2021-08-27 14:56:29', 2),
(1, 0, 640, NULL, 0, NULL, 2, 1, '1.00', 'OUT', '2021-08-30', '2021-08-30 18:02:19', 1),
(2, 0, 640, NULL, 0, NULL, 2, 54, '35.00', 'OUT', '2021-08-30', '2021-08-30 18:02:34', 1),
(3, 0, 640, NULL, 0, NULL, 2, 10, '60.00', 'OUT', '2021-08-30', '2021-08-30 18:02:47', 1),
(4, 0, 640, NULL, 0, NULL, 2, 4, '10.00', 'OUT', '2021-08-30', '2021-08-30 18:03:03', 1),
(1, 0, 641, NULL, 0, NULL, 2, 1, '1.00', 'OUT', '2021-08-30', '2021-08-30 19:17:41', 2),
(7, 0, 643, NULL, 0, NULL, 2, 1, '14.00', 'OUT', '2021-08-31', '2021-08-31 13:44:57', 2),
(1, 0, 644, NULL, 0, NULL, 11, 1, '0.00', 'OUT', '2021-08-31', '2021-08-31 13:47:01', 1),
(24, 0, 644, NULL, 0, NULL, 11, 5, '15.00', 'OUT', '2021-08-31', '2021-08-31 13:47:20', 1),
(32, 0, 644, NULL, 0, NULL, 11, 9, '11.00', 'OUT', '2021-08-31', '2021-08-31 13:47:36', 1),
(42, 0, 643, NULL, 0, NULL, 2, 10, '10.00', 'OUT', '2021-08-31', '2021-08-31 13:51:51', 2),
(54, 0, 645, NULL, 0, NULL, 2, 9, '0.00', 'OUT', '2021-08-31', '2021-08-31 15:14:49', 2),
(53, 0, 646, NULL, 0, NULL, 2, 10, '10.00', 'OUT', '2021-08-31', '2021-08-31 15:16:04', 2),
(5, 0, 647, NULL, 0, NULL, 2, 1, '31.00', 'OUT', '2021-08-31', '2021-08-31 15:17:06', 2),
(100, 0, 650, NULL, 0, NULL, 2, 2, '18.00', 'OUT', '2021-08-31', '2021-08-31 16:53:27', 1),
(40, 0, 652, NULL, 0, NULL, 11, 10, '10.00', 'OUT', '2021-09-01', '2021-09-01 14:33:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_store`
--

CREATE TABLE `kp_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(122) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_sub_cat`
--

CREATE TABLE `kp_sub_cat` (
  `sub_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub_desc` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kp_suppliers`
--

CREATE TABLE `kp_suppliers` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_alias` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_email` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_address` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_phone` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_location` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_pin` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sup_vat` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `del_status` int(11) NOT NULL DEFAULT '2',
  `sup_bal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_suppliers`
--

INSERT INTO `kp_suppliers` (`sup_id`, `sup_name`, `sup_alias`, `sup_email`, `sup_address`, `sup_phone`, `sup_location`, `sup_pin`, `sup_vat`, `created_by`, `del_status`, `sup_bal`) VALUES
(1, 'BETTER DEAL WHOLESALERS LTD', '', 'NA@', 'P.O BOX', '0721211931//0794202498', '', 'P051940403V', 'P051940403V', 2, 2, '173500'),
(2, 'LEBANONI BUSINESS DISTRIBUTORS LI', '', 'lebanonibslt@gmail.com', 'P.O BOX828-00516<BR>NAIROBI', '00', 'NAIROBI', 'P051979163D', 'P051979163D', 2, 2, '18000'),
(3, 'SALAMA WHOLESALERS LTD', '', 'na@na.com', 'P.O BOX 6856-00610', '0727018550', 'NAIROBI', 'P051566385W', 'P051566385W', 2, 2, '43980'),
(4, 'ZARUQ STORES LTD', '', '-', '', '0717470181', 'EASTLEIGH', 'P051451292A', 'P051451292A', 2, 2, '233700'),
(5, 'KANICE DIGITAL MILLERS LTD', '', '-', '-', '0728385768', '-', 'P051647573W', 'P051647573W', 2, 2, '64625'),
(6, 'KENBLEST PROCESSORS LTD', '', '-', '', '0704535771', '-', 'P051951020S', 'P051951020S', 2, 2, '0'),
(7, 'GENJOY FOOD PRODUCTS LTD', '', '-', '', '0701550231', '-', 'P051216091E', 'P051216091E', 2, 2, '10727'),
(8, 'KUTUI MILLERS', '', '', '', '0114731995', '', '', '', 2, 2, '20200'),
(9, 'PATINUM INTERNATIONAL SERVICES LT', '', 'PATINUMIS@GMAIL.COM', '', '', '', 'P051739819T', 'P051739819T', 2, 2, '5000'),
(10, 'ytuytu', '', 'ytuyt', 'ytutyu', 'ytuytu', '', 'ytuty', 'uytutyu', 0, 2, '0'),
(11, 'bvn', '', 'vbn', 'vbnbvn', 'vnvbn', '', 'vnvbn', 'vbnvbn', 0, 2, '0'),
(12, 'eve', '', 'fdgfd', 'gfdg', 'gfdg', '', 'fdgdfg', 'fdgdfg', 0, 2, '500'),
(13, 'JOSLAB', '', 'INFO@JOSLAB.CO.KE', '1230', '071111111', '', '', '', 0, 2, '11850');

-- --------------------------------------------------------

--
-- Table structure for table `kp_tax`
--

CREATE TABLE `kp_tax` (
  `tax_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_tax`
--

INSERT INTO `kp_tax` (`tax_id`, `name`, `percent`, `code`, `datime`, `user_id`) VALUES
(1, 'VAT', 16, 'S', '2021-03-12 08:54:38', 2),
(2, 'ZERO RATE', 0, 'Z', '2021-03-12 08:54:57', 2),
(3, 'ECXEMPT', 0, 'E', '2021-03-12 08:55:13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_thesion`
--

CREATE TABLE `kp_thesion` (
  `session_id` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `dashboard` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `shop` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `mkt` int(11) NOT NULL,
  `sale_type` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `ret_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `petty_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `qt_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `lpo_id` int(11) NOT NULL,
  `grn_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `current_page` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `comp_address` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_thesion`
--

INSERT INTO `kp_thesion` (`session_id`, `panel`, `dashboard`, `shop`, `user_id`, `sale_id`, `staff_id`, `mkt`, `sale_type`, `cust_id`, `po_id`, `ret_id`, `req_id`, `sup_id`, `petty_id`, `bill_id`, `store_id`, `qt_id`, `trans_id`, `lpo_id`, `grn_id`, `price`, `current_page`, `comp_address`, `day`) VALUES
(428, 2, 'admin_dash.php', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'front/dash/admin_dash.php', '90-B1-1C-69-FC-78', '2021-08-27'),
(440, 3, 'admin_dash.php', 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'back/dash/admin_dash.php', '90-B1-1C-69-FC-78', '2021-08-27'),
(677, 2, 'admin_dash.php', 1, 7, 651, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'front/ord/order.php', '90-B1-1C-69-FC-78', '2021-09-01'),
(691, 2, 'admin_dash.php', 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'front/dash/admin_dash.php', '90-B1-1C-69-FC-78', '2021-09-01'),
(696, 3, 'admin_dash.php', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'back/prods/index.php', '90-B1-1C-69-FC-78', '2021-09-01'),
(715, 3, 'admin_dash.php', 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'back/customer/customers.php', '90-B1-1C-69-FC-78', '2021-09-01'),
(743, 3, 'admin_dash.php', 2, 11, 652, 0, 0, 2, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'front/print/print_credit.php', '90-B1-1C-69-FC-78', '2021-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `kp_uom`
--

CREATE TABLE `kp_uom` (
  `uom_id` int(11) NOT NULL,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_uom`
--

INSERT INTO `kp_uom` (`uom_id`, `name`, `qty`, `user_id`) VALUES
(1, 'PIECE', 1, 2),
(2, 'DOZEN', 12, 2),
(3, 'BALE 2KG', 12, 2),
(4, 'BALE 1KG', 24, 2),
(5, 'BAG 25', 25, 2),
(6, 'BAG 50', 50, 2),
(7, 'BALE (D)', 6, 2),
(8, 'CARTON (4 DOZEN)', 4, 2),
(9, 'CARTON (3 DOZEN)', 3, 2),
(10, 'CARTON (2 DOZEN)', 2, 2),
(11, 'PACK (4)', 4, 2),
(12, 'PACK (12)', 12, 2),
(13, 'PACK (24)', 24, 2),
(14, '20LTRS', 20, 2),
(15, '10LTRS', 10, 2),
(16, 'PACK (9)', 9, 2),
(17, 'CARTON (12 DOZEN)', 12, 2),
(18, 'CARTON (6 DOZEN)', 6, 2),
(19, 'CARTON (24 DOZEN)', 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_users`
--

CREATE TABLE `kp_users` (
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `username` varchar(44) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cabi` varchar(99) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_pin` int(11) DEFAULT NULL,
  `log_status` int(11) NOT NULL DEFAULT '2',
  `work_status` int(11) NOT NULL DEFAULT '2',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role_id` int(11) NOT NULL,
  `permissions` varchar(85) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_del_status` int(11) NOT NULL DEFAULT '2',
  `sys_default` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_users`
--

INSERT INTO `kp_users` (`user_id`, `staff_id`, `username`, `cabi`, `user_pin`, `log_status`, `work_status`, `last_login`, `last_modified`, `role_id`, `permissions`, `staff_del_status`, `sys_default`) VALUES
(2, 5, 'GABI', 'gabi', NULL, 2, 2, '2020-08-13 18:43:26', '0000-00-00 00:00:00', 1, '1, 2, 50, 51, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 2', 2, 2),
(6, 6, 'James', '1234', NULL, 2, 2, '2021-08-27 12:18:10', '0000-00-00 00:00:00', 3, '1, 2, 50, 51, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23', 2, 2),
(7, 7, 'Erick', '1012710127', NULL, 2, 2, '2021-08-27 12:21:11', '0000-00-00 00:00:00', 2, '2, 50, 51, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23', 2, 2),
(9, 9, 'Evalyne', 'evalyne', NULL, 2, 2, '2021-08-27 12:36:52', '0000-00-00 00:00:00', 2, '', 2, 2),
(10, 10, 'Dickson', 'mbogonye1970', NULL, 2, 2, '2021-08-27 12:56:38', '0000-00-00 00:00:00', 1, '1, 2, 50, 51, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 2', 2, 2),
(11, 11, 'John', 'reported2021', NULL, 2, 2, '2021-08-31 10:11:41', '0000-00-00 00:00:00', 3, '1, 2, 50, 51, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 2', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kp_users_logger`
--

CREATE TABLE `kp_users_logger` (
  `user_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ip_address` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `mac_address` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `kp_users_logger`
--

INSERT INTO `kp_users_logger` (`user_id`, `datime`, `description`, `ip_address`, `mac_address`) VALUES
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-22 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-24 00:00:00', '', '', ''),
(0, '2021-03-26 00:00:00', '', '', ''),
(0, '2021-03-26 00:00:00', '', '', ''),
(0, '2021-03-26 00:00:00', '', '', ''),
(0, '2021-03-26 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-28 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-29 00:00:00', '', '', ''),
(0, '2021-03-30 00:00:00', '', '', ''),
(0, '2021-03-31 00:00:00', '', '', ''),
(0, '2021-03-31 00:00:00', '', '', ''),
(0, '2021-03-31 00:00:00', '', '', ''),
(0, '2021-03-31 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-01 00:00:00', '', '', ''),
(0, '2021-04-02 00:00:00', '', '', ''),
(0, '2021-04-02 00:00:00', '', '', ''),
(0, '2021-04-03 00:00:00', '', '', ''),
(0, '2021-04-03 00:00:00', '', '', ''),
(0, '2021-04-03 00:00:00', '', '', ''),
(0, '2021-04-05 00:00:00', '', '', ''),
(0, '2021-04-05 00:00:00', '', '', ''),
(0, '2021-04-06 00:00:00', '', '', ''),
(0, '2021-04-06 00:00:00', '', '', ''),
(0, '2021-04-06 00:00:00', '', '', ''),
(0, '2021-04-07 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-08 00:00:00', '', '', ''),
(0, '2021-04-09 00:00:00', '', '', ''),
(0, '2021-04-09 00:00:00', '', '', ''),
(0, '2021-04-09 00:00:00', '', '', ''),
(0, '2021-04-09 00:00:00', '', '', ''),
(0, '2021-04-10 00:00:00', '', '', ''),
(0, '2021-04-11 00:00:00', '', '', ''),
(0, '2021-04-12 00:00:00', '', '', ''),
(0, '2021-04-13 00:00:00', '', '', ''),
(0, '2021-04-13 00:00:00', '', '', ''),
(0, '2021-04-13 00:00:00', '', '', ''),
(0, '2021-04-21 00:00:00', '', '', ''),
(0, '2021-04-24 00:00:00', '', '', ''),
(0, '2021-04-25 00:00:00', '', '', ''),
(0, '2021-05-11 00:00:00', '', '', ''),
(0, '2021-05-11 00:00:00', '', '', ''),
(0, '2021-05-22 00:00:00', '', '', ''),
(0, '2021-05-22 00:00:00', '', '', ''),
(0, '2021-05-22 00:00:00', '', '', ''),
(0, '2021-05-25 00:00:00', '', '', ''),
(0, '2021-05-26 00:00:00', '', '', ''),
(0, '2021-05-26 00:00:00', '', '', ''),
(0, '2021-05-26 00:00:00', '', '', ''),
(0, '2021-05-27 00:00:00', '', '', ''),
(0, '2021-05-27 00:00:00', '', '', ''),
(0, '2021-05-28 00:00:00', '', '', ''),
(0, '2021-05-28 00:00:00', '', '', ''),
(0, '2021-05-30 00:00:00', '', '', ''),
(0, '2021-05-30 00:00:00', '', '', ''),
(0, '2021-05-30 00:00:00', '', '', ''),
(0, '2021-05-30 00:00:00', '', '', ''),
(0, '2021-05-31 00:00:00', '', '', ''),
(0, '2021-05-31 00:00:00', '', '', ''),
(0, '2021-06-05 00:00:00', '', '', ''),
(0, '2021-06-05 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-07 00:00:00', '', '', ''),
(0, '2021-06-09 00:00:00', '', '', ''),
(0, '2021-06-09 00:00:00', '', '', ''),
(0, '2021-06-09 00:00:00', '', '', ''),
(0, '2021-06-09 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-10 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-11 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-17 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-06-29 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-01 00:00:00', '', '', ''),
(0, '2021-07-04 00:00:00', '', '', ''),
(0, '2021-07-04 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-05 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-06 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-12 00:00:00', '', '', ''),
(0, '2021-07-13 00:00:00', '', '', ''),
(0, '2021-07-15 00:00:00', '', '', ''),
(0, '2021-07-15 00:00:00', '', '', ''),
(0, '2021-07-17 00:00:00', '', '', ''),
(0, '2021-07-17 00:00:00', '', '', ''),
(0, '2021-07-17 00:00:00', '', '', ''),
(0, '2021-07-17 00:00:00', '', '', ''),
(0, '2021-07-22 00:00:00', '', '', ''),
(0, '2021-07-22 00:00:00', '', '', ''),
(0, '2021-07-26 00:00:00', '', '', ''),
(0, '2021-07-26 00:00:00', '', '', ''),
(0, '2021-08-02 00:00:00', '', '', ''),
(0, '2021-08-02 00:00:00', '', '', ''),
(0, '2021-08-03 00:00:00', '', '', ''),
(0, '2021-08-03 00:00:00', '', '', ''),
(0, '2021-08-06 00:00:00', '', '', ''),
(0, '2021-08-13 00:00:00', '', '', ''),
(0, '2021-08-13 00:00:00', '', '', ''),
(0, '2021-08-16 00:00:00', '', '', ''),
(0, '2021-08-16 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-17 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-18 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-20 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-24 00:00:00', '', '', ''),
(0, '2021-08-25 00:00:00', '', '', ''),
(0, '2021-08-25 00:00:00', '', '', ''),
(0, '2021-08-25 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-26 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-27 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-30 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-08-31 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', ''),
(0, '2021-09-01 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `split_message`
--

CREATE TABLE `split_message` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `phone` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `amount` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `account` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `balance` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cost` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `time` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `split_message`
--

INSERT INTO `split_message` (`id`, `name`, `phone`, `code`, `amount`, `account`, `balance`, `cost`, `date`, `time`, `timestamp`, `status`) VALUES
(1, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK045VWVW', '1.00', '', '2530.23', '', '2020-01-20', '5:01pm', '2020-06-20 14:41:01', 3),
(2, 'LILIAN IRUNGU', '254724223840', 'OFK446A1DK', '1.00', '', '2531.23', '', '2020-01-20', '5:10pm', '2020-06-20 14:41:01', 1),
(3, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK646GGYK', '1.00', '', '2532.23', '', '2020-01-20', '5:14pm', '2020-06-20 14:41:01', 3),
(4, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK846IO60', '2.00', '', '2534.23', '', '2020-01-20', '5:15pm', '2020-06-20 14:41:01', 3),
(5, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK946Y7RV', '1.00', '', '2535.23', '', '2020-01-20', '5:25pm', '2020-06-20 14:41:01', 3),
(6, 'PETER KABURIA', '254722204074', 'OFK746YEM7', '500.00', '', '3035.23', '', '2020-01-20', '5:25pm', '2020-06-20 14:41:01', 1),
(7, 'SYLVESTER AKAMA MWAMBA', '254748711700', 'OFK047HTOO', '300.00', '', '3335.23', '', '2020-01-20', '5:37pm', '2020-06-20 14:41:01', 1),
(19, 'Armingtony Tihali Kweyu', '254741040045', 'OFK3482MUR', '200.00', '', '3536.23', '', '2020-01-20', '5:50pm', '2020-06-20 14:50:49', 1),
(23, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK347XWVL', '1.00', '', '3336.23', '', '2020-01-20', '5:47pm', '2020-06-20 14:50:49', 3),
(24, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK548JBFD', '1.00', '', '3538.23', '', '2020-01-20', '5:59pm', '2020-06-20 15:00:03', 1),
(25, 'EDWIN KIPROP KAPKEI', '254712234345', 'OFK248KZUU', '2.00', '', '3540.23', '', '2020-01-20', '6:00pm', '2020-06-20 15:00:59', 3),
(26, 'THOMAS NJOGU', '254722848374', 'OFK348OZTX', '2000.00', '', '5530.23', '', '2020-01-20', '6:03pm', '2020-06-20 15:03:25', 1),
(27, 'KELVIN GICHURI MAINA', '254716100335', 'OFK64903CS', '1.00', '', '5531.23', '', '2020-01-20', '6:09pm', '2020-06-20 15:09:39', 1),
(28, 'ISAIAH CHIERAH', '254722675351', 'OFK649HQPA', '170.00', '', '5701.23', '', '2020-01-20', '6:19pm', '2020-06-20 15:19:28', 1),
(29, 'NDUCHA ERASTUS', '254729608497', 'OFK849PWZ8', '950.00', '', '6651.23', '', '2020-01-20', '6:23pm', '2020-06-20 15:23:58', 1),
(30, 'MARILEJEANE CHARLES', '254720380212', 'OFK94A4OA7', '200.00', '', '6851.23', '', '2020-01-20', '6:31pm', '2020-06-20 15:32:00', 1),
(31, 'NEWTON KINYUA KIANO', '254722493938', 'OFK54B1XR9', '920.00', '', '7771.23', '', '2020-01-20', '6:48pm', '2020-06-20 15:49:05', 1),
(32, 'DENZEL MWANGI MUGAMBI', '254748030588', 'OFK24BLWRC', '600.00', '', '8371.23', '', '2020-01-20', '6:58pm', '2020-06-20 15:58:38', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_backdb`
--
ALTER TABLE `kp_backdb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_banks`
--
ALTER TABLE `kp_banks`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `kp_beba`
--
ALTER TABLE `kp_beba`
  ADD PRIMARY KEY (`beba_id`),
  ADD UNIQUE KEY `nid` (`nid`);

--
-- Indexes for table `kp_category`
--
ALTER TABLE `kp_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `kp_customers`
--
ALTER TABLE `kp_customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `kp_grn`
--
ALTER TABLE `kp_grn`
  ADD PRIMARY KEY (`grn_id`);

--
-- Indexes for table `kp_items`
--
ALTER TABLE `kp_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `kp_items_arch`
--
ALTER TABLE `kp_items_arch`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `kp_logistics`
--
ALTER TABLE `kp_logistics`
  ADD PRIMARY KEY (`del_id`);

--
-- Indexes for table `kp_lpo`
--
ALTER TABLE `kp_lpo`
  ADD PRIMARY KEY (`lpo_id`);

--
-- Indexes for table `kp_lpo_items`
--
ALTER TABLE `kp_lpo_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lpo_id` (`lpo_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `kp_menu`
--
ALTER TABLE `kp_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `kp_pay_mode`
--
ALTER TABLE `kp_pay_mode`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `kp_petty`
--
ALTER TABLE `kp_petty`
  ADD PRIMARY KEY (`petty_id`);

--
-- Indexes for table `kp_po_items`
--
ALTER TABLE `kp_po_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_qt`
--
ALTER TABLE `kp_qt`
  ADD PRIMARY KEY (`qt_id`);

--
-- Indexes for table `kp_qt_items`
--
ALTER TABLE `kp_qt_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_req`
--
ALTER TABLE `kp_req`
  ADD UNIQUE KEY `req_id` (`req_id`);

--
-- Indexes for table `kp_roles`
--
ALTER TABLE `kp_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `kp_sales`
--
ALTER TABLE `kp_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `day` (`day`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `kp_sale_items`
--
ALTER TABLE `kp_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `kp_sale_payment`
--
ALTER TABLE `kp_sale_payment`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `kp_sc`
--
ALTER TABLE `kp_sc`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `cust_id` (`cust_id`);

--
-- Indexes for table `kp_settings_gen`
--
ALTER TABLE `kp_settings_gen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_settings_print`
--
ALTER TABLE `kp_settings_print`
  ADD UNIQUE KEY `print_doc` (`print_doc`);

--
-- Indexes for table `kp_sms`
--
ALTER TABLE `kp_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_staff`
--
ALTER TABLE `kp_staff`
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `kp_stock_take`
--
ALTER TABLE `kp_stock_take`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_stock_take_set`
--
ALTER TABLE `kp_stock_take_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kp_stock_take_status`
--
ALTER TABLE `kp_stock_take_status`
  ADD PRIMARY KEY (`stat_id`),
  ADD UNIQUE KEY `day` (`day`);

--
-- Indexes for table `kp_store`
--
ALTER TABLE `kp_store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `kp_sub_cat`
--
ALTER TABLE `kp_sub_cat`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `kp_suppliers`
--
ALTER TABLE `kp_suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `kp_tax`
--
ALTER TABLE `kp_tax`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `kp_thesion`
--
ALTER TABLE `kp_thesion`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `kp_uom`
--
ALTER TABLE `kp_uom`
  ADD PRIMARY KEY (`uom_id`);

--
-- Indexes for table `kp_users`
--
ALTER TABLE `kp_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_username` (`username`),
  ADD UNIQUE KEY `user_pin` (`user_pin`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `user_staff_id` (`staff_id`);

--
-- Indexes for table `split_message`
--
ALTER TABLE `split_message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kp_backdb`
--
ALTER TABLE `kp_backdb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_banks`
--
ALTER TABLE `kp_banks`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kp_beba`
--
ALTER TABLE `kp_beba`
  MODIFY `beba_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_category`
--
ALTER TABLE `kp_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kp_customers`
--
ALTER TABLE `kp_customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `kp_items`
--
ALTER TABLE `kp_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `kp_items_arch`
--
ALTER TABLE `kp_items_arch`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_logistics`
--
ALTER TABLE `kp_logistics`
  MODIFY `del_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_lpo_items`
--
ALTER TABLE `kp_lpo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `kp_menu`
--
ALTER TABLE `kp_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `kp_pay_mode`
--
ALTER TABLE `kp_pay_mode`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_petty`
--
ALTER TABLE `kp_petty`
  MODIFY `petty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_po_items`
--
ALTER TABLE `kp_po_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `kp_qt_items`
--
ALTER TABLE `kp_qt_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `kp_roles`
--
ALTER TABLE `kp_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_sale_items`
--
ALTER TABLE `kp_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1058;

--
-- AUTO_INCREMENT for table `kp_settings_gen`
--
ALTER TABLE `kp_settings_gen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kp_sms`
--
ALTER TABLE `kp_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kp_staff`
--
ALTER TABLE `kp_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kp_stock_take`
--
ALTER TABLE `kp_stock_take`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `kp_stock_take_status`
--
ALTER TABLE `kp_stock_take_status`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kp_store`
--
ALTER TABLE `kp_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_sub_cat`
--
ALTER TABLE `kp_sub_cat`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kp_suppliers`
--
ALTER TABLE `kp_suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kp_tax`
--
ALTER TABLE `kp_tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kp_thesion`
--
ALTER TABLE `kp_thesion`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=802;

--
-- AUTO_INCREMENT for table `kp_uom`
--
ALTER TABLE `kp_uom`
  MODIFY `uom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kp_users`
--
ALTER TABLE `kp_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `split_message`
--
ALTER TABLE `split_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
