-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 02, 2021 at 03:04 PM
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
-- Database: `ksoft_rensha`
--

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
(6, 7, 2, 7, '3375.00', '0.00', '3375.00', 2, '0000-00-00', '2021-08-02', '2021-08-02 18:03:08');

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
(6);

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
(5, 84, 1, 678, 678, 0, '2021-07-26', '2021-07-26 19:20:45', 1),
(5, 11, 5, 455, 2275, 0, '2021-07-26', '2021-07-26 19:20:45', 1),
(5, 19, 5, 45, 225, 0, '2021-07-26', '2021-07-26 19:20:45', 1),
(6, 70, 1, 125, 125, 0, '2021-08-02', '2021-08-02 18:03:08', 1),
(6, 22, 5, 500, 2500, 0, '2021-08-02', '2021-08-02 18:03:08', 1),
(6, 17, 5, 150, 750, 0, '2021-08-02', '2021-08-02 18:03:08', 1);

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
  `s2s` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_po`
--

INSERT INTO `kp_po` (`po_id`, `req_id`, `sup_id`, `user_id`, `po_date`, `shift`, `amount`, `disc`, `tax_by`, `tax_type`, `tax_perc`, `vatable`, `vat`, `rec_status`, `rec_staff`, `rec_date`, `stock_status`, `grn_status`, `cf_bal`, `refno`, `s2s`) VALUES
(1, 0, 5, 2, '2021-07-12', '0000-00-00', '14360.00', '0.00', 0, 0, 0, '0.00', '0.00', 1, 0, '0000-00-00', 2, 2, '50265.00', '567', 1),
(2, 0, 13, 2, '2021-07-12', '0000-00-00', '4350.00', '0.00', 0, 0, 0, '0.00', '0.00', 1, 0, '0000-00-00', 2, 2, '7500.00', '89', 1),
(3, 0, 7, 2, '2021-04-23', '0000-00-00', '1199.00', '0.00', 1, 1, 0, '1130.03', '68.97', 1, 0, '0000-00-00', 2, 2, '0.00', '3qw', 1),
(4, 0, 12, 2, '2021-07-17', '0000-00-00', '500.00', '0.00', 1, 1, 0, '431.03', '68.97', 1, 0, '0000-00-00', 2, 2, '0.00', 'we', 1),
(5, 0, 1, 2, '2021-07-22', '0000-00-00', '500.00', '0.00', 1, 1, 0, '500.00', '0.00', 1, 0, '0000-00-00', 2, 2, '172000.00', '52', 1),
(6, 0, 7, 2, '2021-07-26', '0000-00-00', '3178.00', '0.00', 1, 1, 0, '3053.45', '124.55', 1, 0, '0000-00-00', 2, 2, '1199.00', '67', 1),
(7, 0, 7, 2, '2021-08-01', '0000-00-00', '3375.00', '0.00', 1, 1, 0, '3012.93', '362.07', 1, 0, '0000-00-00', 2, 2, '4377.00', '12', 1);

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
(7);

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
  `tax_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kp_po_items`
--

INSERT INTO `kp_po_items` (`id`, `req_id`, `po_id`, `item_id`, `uom`, `qty`, `price`, `disc`, `total`, `status`, `rec_qty`, `rec_price`, `rec_total`, `rec_user`, `rec_status`, `s2s`, `day`, `datime`, `vatable`, `vat`, `tax_id`, `tax_type`) VALUES
(90, 0, 1, 14, 0, '1.00', '4560.00', '0.00', '4560.00', 2, '1.00', '4560.00', '4560.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:29', '0.00', '0.00', 0, 0),
(91, 0, 1, 5, 0, '1.00', '2300.00', '0.00', '2300.00', 2, '1.00', '2300.00', '2300.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:38', '0.00', '0.00', 0, 0),
(92, 0, 1, 126, 0, '15.00', '500.00', '0.00', '7500.00', 2, '15.00', '500.00', '7500.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:12:53', '0.00', '0.00', 0, 0),
(93, 0, 2, 8, 0, '5.00', '150.00', '0.00', '750.00', 2, '5.00', '150.00', '750.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:13:55', '0.00', '0.00', 0, 0),
(94, 0, 2, 604, 0, '6.00', '600.00', '0.00', '3600.00', 2, '6.00', '600.00', '3600.00', 2, 1, 1, '2021-07-12', '2021-07-12 05:14:03', '0.00', '0.00', 0, 0),
(95, 0, 3, 6, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:30:51', '431.03', '68.97', 1, 1),
(96, 0, 3, 9, 0, '3.00', '233.00', '0.00', '699.00', 2, '3.00', '233.00', '699.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:31:00', '699.00', '0.00', 2, 1),
(97, 0, 4, 37, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-17', '2021-07-17 16:31:55', '431.03', '68.97', 1, 1),
(98, 0, 5, 69, 0, '1.00', '500.00', '0.00', '500.00', 2, '1.00', '500.00', '500.00', 2, 1, 1, '2021-07-22', '2021-07-22 13:51:30', '500.00', '0.00', 0, 1),
(99, 0, 6, 84, 0, '1.00', '678.00', '0.00', '678.00', 2, '1.00', '678.00', '678.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:20', '584.48', '93.52', 1, 1),
(100, 0, 6, 11, 0, '5.00', '455.00', '0.00', '2275.00', 2, '5.00', '455.00', '2275.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:27', '2275.00', '0.00', 2, 1),
(101, 0, 6, 19, 0, '5.00', '45.00', '0.00', '225.00', 2, '5.00', '45.00', '225.00', 2, 1, 1, '2021-07-26', '2021-07-26 16:20:35', '193.97', '31.03', 1, 1),
(102, 0, 7, 70, 0, '1.00', '125.00', '0.00', '125.00', 2, '1.00', '125.00', '125.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:01:36', '107.76', '17.24', 1, 1),
(103, 0, 7, 22, 0, '5.00', '500.00', '0.00', '2500.00', 2, '5.00', '500.00', '2500.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:01:46', '2155.17', '344.83', 1, 1),
(104, 0, 7, 17, 0, '5.00', '150.00', '0.00', '750.00', 2, '5.00', '150.00', '750.00', 2, 1, 1, '2021-08-02', '2021-08-02 15:02:16', '750.00', '0.00', 2, 1);

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kp_grn`
--
ALTER TABLE `kp_grn`
  ADD PRIMARY KEY (`grn_id`);

--
-- Indexes for table `kp_po_items`
--
ALTER TABLE `kp_po_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kp_po_items`
--
ALTER TABLE `kp_po_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
