

CREATE TABLE `kp_backdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backupfilename` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `backupfiledate` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `username` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ipaddress` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_backdb VALUES("1","2021Mar28_100834.sql","2021-03-28 10:08:34","2","::1","2021-03-28 10:08:34");
INSERT INTO kp_backdb VALUES("2","2021Jun11_184802.sql","2021-06-11 18:48:02","2","::1","2021-06-11 18:48:02");





CREATE TABLE `kp_bank_hist` (
  `bank_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_bal` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 595","3390.00","2","0.00","2021-06-10","2021-06-10 16:29:37");
INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 596","1300.00","2","0.00","2021-06-10","2021-06-10 16:33:05");
INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 597","3100.00","2","0.00","2021-06-10","2021-06-10 16:38:46");
INSERT INTO kp_bank_hist VALUES("2","BANK CREDITED BY RECEIPT NO 597","950.00","2","0.00","2021-06-10","2021-06-10 16:38:46");
INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 598","4000.00","2","0.00","2021-06-10","2021-06-10 16:44:53");
INSERT INTO kp_bank_hist VALUES("2","BANK CREDITED BY RECEIPT NO 598","2000.00","2","0.00","2021-06-10","2021-06-10 16:44:53");
INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 599","2000.00","2","4000.00","2021-06-10","2021-06-10 16:59:42");
INSERT INTO kp_bank_hist VALUES("0","BANK CREDITED BY RECEIPT NO 599","1000.00","2","0.00","2021-06-10","2021-06-10 16:59:42");
INSERT INTO kp_bank_hist VALUES("2","AMOUNT ADDED FOR CREDIT PAYMENT FOR SALE NO.586","200.00","2","2000.00","2021-06-10","2021-06-10 17:02:24");
INSERT INTO kp_bank_hist VALUES("1","AMOUNT ADDED FOR CREDIT PAYMENT FOR SALE NO.600","400.00","2","6000.00","2021-06-10","2021-06-10 17:10:15");
INSERT INTO kp_bank_hist VALUES("2","BANK CREDITED BY RECEIPT NO 603","600.00","2","2200.00","2021-06-10","2021-06-10 21:25:06");
INSERT INTO kp_bank_hist VALUES("1","BANK CREDITED BY RECEIPT NO 604","42500.00","2","6400.00","2021-06-11","2021-06-11 11:39:09");





CREATE TABLE `kp_banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `acc_no` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bank_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bal` int(11) NOT NULL,
  `location` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_banks VALUES("1","CASH DRAWER","0000","CASH DRAWER","CASH DRAWER","48900","INHOUSE","1","2019-12-09 16:18:21","2");
INSERT INTO kp_banks VALUES("2","MPESA","886533","MPESA","INHOUSE","2800","INHOUSE","1","2019-12-09 16:22:20","2");
INSERT INTO kp_banks VALUES("3","PETTY CASH","1111","PETTY CASH","INHOUSE","0","INHOUSE","13","2019-12-09 16:37:46","2");
INSERT INTO kp_banks VALUES("4","CREDIT CARDS","2222","CREDIT CARDS","INHOUSE","0","INHOUSE","13","2019-12-09 16:39:43","1");





CREATE TABLE `kp_beba` (
  `beba_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `nid` varchar(22) NOT NULL,
  `location` varchar(22) NOT NULL,
  PRIMARY KEY (`beba_id`),
  UNIQUE KEY `nid` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO kp_beba VALUES("1","test","0716100335","201232","test");





CREATE TABLE `kp_cancelled_items` (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_cancelled_items VALUES("38","171","1","110");
INSERT INTO kp_cancelled_items VALUES("42","77","1","115");
INSERT INTO kp_cancelled_items VALUES("49","165","13","95");
INSERT INTO kp_cancelled_items VALUES("121","178","1","90");
INSERT INTO kp_cancelled_items VALUES("121","174","1","125");
INSERT INTO kp_cancelled_items VALUES("51","180","1","1000");
INSERT INTO kp_cancelled_items VALUES("185","224","4","80");
INSERT INTO kp_cancelled_items VALUES("208","165","2","100");
INSERT INTO kp_cancelled_items VALUES("208","171","4","110");
INSERT INTO kp_cancelled_items VALUES("208","182","2","130");
INSERT INTO kp_cancelled_items VALUES("262","162","1","360");
INSERT INTO kp_cancelled_items VALUES("274","32","1","250");
INSERT INTO kp_cancelled_items VALUES("274","33","1","250");
INSERT INTO kp_cancelled_items VALUES("274","83","1","180");
INSERT INTO kp_cancelled_items VALUES("274","118","1","570");
INSERT INTO kp_cancelled_items VALUES("274","84","1","140");
INSERT INTO kp_cancelled_items VALUES("274","68","3","105");
INSERT INTO kp_cancelled_items VALUES("274","62","2","110");
INSERT INTO kp_cancelled_items VALUES("274","75","2","110");
INSERT INTO kp_cancelled_items VALUES("274","141","1","4760");
INSERT INTO kp_cancelled_items VALUES("274","122","1","520");
INSERT INTO kp_cancelled_items VALUES("274","123","1","550");
INSERT INTO kp_cancelled_items VALUES("274","201","1","155");
INSERT INTO kp_cancelled_items VALUES("274","177","1","55");
INSERT INTO kp_cancelled_items VALUES("274","209","1","350");
INSERT INTO kp_cancelled_items VALUES("274","194","1","260");
INSERT INTO kp_cancelled_items VALUES("274","179","1","1000");
INSERT INTO kp_cancelled_items VALUES("274","14","1","1500");
INSERT INTO kp_cancelled_items VALUES("274","8","1","1560");
INSERT INTO kp_cancelled_items VALUES("274","10","1","1580");
INSERT INTO kp_cancelled_items VALUES("274","138","1","600");
INSERT INTO kp_cancelled_items VALUES("274","139","1","225");
INSERT INTO kp_cancelled_items VALUES("274","220","1","250");
INSERT INTO kp_cancelled_items VALUES("274","225","1","130");
INSERT INTO kp_cancelled_items VALUES("274","37","1","75");
INSERT INTO kp_cancelled_items VALUES("274","167","3","90");
INSERT INTO kp_cancelled_items VALUES("274","136","1","350");
INSERT INTO kp_cancelled_items VALUES("274","77","1","2860");
INSERT INTO kp_cancelled_items VALUES("274","236","1","190");
INSERT INTO kp_cancelled_items VALUES("274","145","1","3570");
INSERT INTO kp_cancelled_items VALUES("274","166","2","55");
INSERT INTO kp_cancelled_items VALUES("274","216","1","100");
INSERT INTO kp_cancelled_items VALUES("274","82","2","110");
INSERT INTO kp_cancelled_items VALUES("274","205","4","50");
INSERT INTO kp_cancelled_items VALUES("274","9","1","1580");
INSERT INTO kp_cancelled_items VALUES("274","54","1","100");
INSERT INTO kp_cancelled_items VALUES("274","135","1","480");
INSERT INTO kp_cancelled_items VALUES("274","58","3","50");
INSERT INTO kp_cancelled_items VALUES("274","238","1","125");
INSERT INTO kp_cancelled_items VALUES("359","259","1","460");
INSERT INTO kp_cancelled_items VALUES("448","159","1","250");
INSERT INTO kp_cancelled_items VALUES("448","166","2","55");
INSERT INTO kp_cancelled_items VALUES("0","5","1","100");
INSERT INTO kp_cancelled_items VALUES("464","165","15","95");





CREATE TABLE `kp_cancelled_sales` (
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_cancelled_sales VALUES("7","2","1","0","2021-03-28","2021-03-28 10:17:28");
INSERT INTO kp_cancelled_sales VALUES("9","2","1","0","2021-03-28","2021-03-28 11:26:55");
INSERT INTO kp_cancelled_sales VALUES("0","2","0","0","2021-03-28","2021-03-28 11:37:06");
INSERT INTO kp_cancelled_sales VALUES("11","1","1","0","2021-03-28","2021-03-28 12:11:41");
INSERT INTO kp_cancelled_sales VALUES("15","2","1","0","2021-03-29","2021-03-29 11:42:53");
INSERT INTO kp_cancelled_sales VALUES("17","2","1","0","2021-03-29","2021-03-29 12:02:14");
INSERT INTO kp_cancelled_sales VALUES("21","2","1","0","2021-03-29","2021-03-29 12:13:23");
INSERT INTO kp_cancelled_sales VALUES("23","2","1","0","2021-03-29","2021-03-29 12:16:28");
INSERT INTO kp_cancelled_sales VALUES("27","2","1","0","2021-03-29","2021-03-29 12:37:43");
INSERT INTO kp_cancelled_sales VALUES("28","2","1","0","2021-03-29","2021-03-29 12:38:07");
INSERT INTO kp_cancelled_sales VALUES("30","2","1","0","2021-03-29","2021-03-29 12:39:43");
INSERT INTO kp_cancelled_sales VALUES("33","2","1","0","2021-03-29","2021-03-29 13:19:39");
INSERT INTO kp_cancelled_sales VALUES("34","2","1","0","2021-03-29","2021-03-29 13:22:02");
INSERT INTO kp_cancelled_sales VALUES("35","2","1","0","2021-03-29","2021-03-29 13:24:45");
INSERT INTO kp_cancelled_sales VALUES("37","2","1","0","2021-03-29","2021-03-29 14:02:11");
INSERT INTO kp_cancelled_sales VALUES("38","2","1","110","2021-03-29","2021-03-29 14:05:17");
INSERT INTO kp_cancelled_sales VALUES("40","2","1","0","2021-03-29","2021-03-29 14:13:49");
INSERT INTO kp_cancelled_sales VALUES("43","2","1","0","2021-03-29","2021-03-29 14:53:59");
INSERT INTO kp_cancelled_sales VALUES("42","2","1","115","2021-03-29","2021-03-29 14:54:14");
INSERT INTO kp_cancelled_sales VALUES("44","2","1","0","2021-03-29","2021-03-29 14:57:12");
INSERT INTO kp_cancelled_sales VALUES("49","2","1","1188","2021-03-29","2021-03-29 15:46:18");
INSERT INTO kp_cancelled_sales VALUES("52","2","1","0","2021-03-29","2021-03-29 15:53:00");
INSERT INTO kp_cancelled_sales VALUES("53","2","1","0","2021-03-29","2021-03-29 15:57:27");
INSERT INTO kp_cancelled_sales VALUES("0","2","0","0","2021-03-29","2021-03-29 16:07:48");
INSERT INTO kp_cancelled_sales VALUES("56","2","1","0","2021-03-29","2021-03-29 17:21:09");
INSERT INTO kp_cancelled_sales VALUES("60","2","1","0","2021-03-29","2021-03-29 17:52:28");
INSERT INTO kp_cancelled_sales VALUES("72","2","1","0","2021-03-30","2021-03-30 11:09:24");
INSERT INTO kp_cancelled_sales VALUES("73","2","1","0","2021-03-30","2021-03-30 11:34:20");
INSERT INTO kp_cancelled_sales VALUES("74","2","1","0","2021-03-30","2021-03-30 11:35:34");
INSERT INTO kp_cancelled_sales VALUES("89","2","1","0","2021-03-30","2021-03-30 16:58:19");
INSERT INTO kp_cancelled_sales VALUES("95","2","1","0","2021-03-30","2021-03-30 17:53:11");
INSERT INTO kp_cancelled_sales VALUES("96","2","1","0","2021-03-30","2021-03-30 17:54:31");
INSERT INTO kp_cancelled_sales VALUES("104","2","1","0","2021-03-31","2021-03-31 08:14:12");
INSERT INTO kp_cancelled_sales VALUES("105","2","1","0","2021-03-31","2021-03-31 08:15:17");
INSERT INTO kp_cancelled_sales VALUES("108","2","1","0","2021-03-31","2021-03-31 08:56:12");
INSERT INTO kp_cancelled_sales VALUES("117","2","1","0","2021-03-31","2021-03-31 17:17:38");
INSERT INTO kp_cancelled_sales VALUES("119","2","1","0","2021-03-31","2021-03-31 17:25:50");
INSERT INTO kp_cancelled_sales VALUES("132","2","1","0","2021-03-31","2021-03-31 18:47:14");
INSERT INTO kp_cancelled_sales VALUES("136","2","1","0","2021-04-01","2021-04-01 09:48:39");
INSERT INTO kp_cancelled_sales VALUES("140","2","1","0","2021-04-01","2021-04-01 10:24:59");
INSERT INTO kp_cancelled_sales VALUES("121","2","1","215","2021-04-01","2021-04-01 11:37:55");
INSERT INTO kp_cancelled_sales VALUES("51","2","1","1000","2021-04-01","2021-04-01 11:38:03");
INSERT INTO kp_cancelled_sales VALUES("48","2","1","0","2021-04-01","2021-04-01 11:38:11");
INSERT INTO kp_cancelled_sales VALUES("46","2","1","0","2021-04-01","2021-04-01 11:38:19");
INSERT INTO kp_cancelled_sales VALUES("145","2","1","0","2021-04-01","2021-04-01 12:22:25");
INSERT INTO kp_cancelled_sales VALUES("150","2","1","0","2021-04-01","2021-04-01 13:50:41");
INSERT INTO kp_cancelled_sales VALUES("155","2","1","0","2021-04-01","2021-04-01 16:27:08");
INSERT INTO kp_cancelled_sales VALUES("162","2","1","0","2021-04-01","2021-04-01 18:09:58");
INSERT INTO kp_cancelled_sales VALUES("176","2","1","0","2021-04-02","2021-04-02 12:49:42");
INSERT INTO kp_cancelled_sales VALUES("183","2","1","0","2021-04-02","2021-04-02 13:32:17");
INSERT INTO kp_cancelled_sales VALUES("185","2","1","320","2021-04-02","2021-04-02 13:50:07");
INSERT INTO kp_cancelled_sales VALUES("195","2","1","0","2021-04-02","2021-04-02 14:57:38");
INSERT INTO kp_cancelled_sales VALUES("201","2","1","0","2021-04-02","2021-04-02 15:49:36");
INSERT INTO kp_cancelled_sales VALUES("202","2","1","0","2021-04-02","2021-04-02 15:56:26");
INSERT INTO kp_cancelled_sales VALUES("206","2","1","0","2021-04-02","2021-04-02 16:18:59");
INSERT INTO kp_cancelled_sales VALUES("208","2","1","900","2021-04-02","2021-04-02 16:47:26");
INSERT INTO kp_cancelled_sales VALUES("220","2","1","0","2021-04-03","2021-04-03 08:27:43");
INSERT INTO kp_cancelled_sales VALUES("221","2","1","0","2021-04-03","2021-04-03 08:29:27");
INSERT INTO kp_cancelled_sales VALUES("229","2","1","0","2021-04-03","2021-04-03 10:55:13");
INSERT INTO kp_cancelled_sales VALUES("230","2","1","0","2021-04-03","2021-04-03 10:56:45");
INSERT INTO kp_cancelled_sales VALUES("235","2","1","0","2021-04-03","2021-04-03 12:23:56");
INSERT INTO kp_cancelled_sales VALUES("244","2","1","0","2021-04-03","2021-04-03 15:57:32");
INSERT INTO kp_cancelled_sales VALUES("248","2","1","0","2021-04-03","2021-04-03 16:29:02");
INSERT INTO kp_cancelled_sales VALUES("262","2","1","360","2021-04-03","2021-04-03 18:17:44");
INSERT INTO kp_cancelled_sales VALUES("274","2","1","18300","2021-04-05","2021-04-05 12:45:55");
INSERT INTO kp_cancelled_sales VALUES("281","2","1","0","2021-04-05","2021-04-05 14:04:47");
INSERT INTO kp_cancelled_sales VALUES("289","2","1","0","2021-04-05","2021-04-05 15:31:31");
INSERT INTO kp_cancelled_sales VALUES("303","2","1","0","2021-04-05","2021-04-05 18:12:58");
INSERT INTO kp_cancelled_sales VALUES("309","2","1","0","2021-04-05","2021-04-05 18:42:30");
INSERT INTO kp_cancelled_sales VALUES("322","2","1","0","2021-04-06","2021-04-06 15:39:02");
INSERT INTO kp_cancelled_sales VALUES("325","2","1","0","2021-04-06","2021-04-06 17:06:10");
INSERT INTO kp_cancelled_sales VALUES("330","2","1","0","2021-04-06","2021-04-06 17:49:07");
INSERT INTO kp_cancelled_sales VALUES("340","2","1","0","2021-04-06","2021-04-06 18:37:21");
INSERT INTO kp_cancelled_sales VALUES("341","2","1","0","2021-04-06","2021-04-06 18:37:45");
INSERT INTO kp_cancelled_sales VALUES("345","2","1","0","2021-04-07","2021-04-07 08:57:29");
INSERT INTO kp_cancelled_sales VALUES("352","2","1","0","2021-04-07","2021-04-07 12:54:11");
INSERT INTO kp_cancelled_sales VALUES("353","2","1","0","2021-04-07","2021-04-07 12:54:35");
INSERT INTO kp_cancelled_sales VALUES("354","2","1","0","2021-04-07","2021-04-07 13:05:13");
INSERT INTO kp_cancelled_sales VALUES("359","2","1","460","2021-04-07","2021-04-07 15:37:31");
INSERT INTO kp_cancelled_sales VALUES("382","2","1","0","2021-04-08","2021-04-08 13:37:57");
INSERT INTO kp_cancelled_sales VALUES("383","2","1","0","2021-04-08","2021-04-08 13:38:15");
INSERT INTO kp_cancelled_sales VALUES("384","2","1","0","2021-04-08","2021-04-08 13:43:33");
INSERT INTO kp_cancelled_sales VALUES("409","2","1","0","2021-04-08","2021-04-08 18:24:30");
INSERT INTO kp_cancelled_sales VALUES("413","2","1","0","2021-04-08","2021-04-08 18:28:24");
INSERT INTO kp_cancelled_sales VALUES("420","2","1","0","2021-04-09","2021-04-09 08:24:26");
INSERT INTO kp_cancelled_sales VALUES("422","2","1","0","2021-04-09","2021-04-09 09:13:10");
INSERT INTO kp_cancelled_sales VALUES("426","2","1","0","2021-04-09","2021-04-09 10:06:08");
INSERT INTO kp_cancelled_sales VALUES("428","2","1","0","2021-04-09","2021-04-09 11:24:25");
INSERT INTO kp_cancelled_sales VALUES("430","2","1","0","2021-04-09","2021-04-09 11:38:11");
INSERT INTO kp_cancelled_sales VALUES("433","2","1","0","2021-04-09","2021-04-09 12:32:58");
INSERT INTO kp_cancelled_sales VALUES("436","2","1","0","2021-04-09","2021-04-09 16:00:46");
INSERT INTO kp_cancelled_sales VALUES("437","2","1","0","2021-04-09","2021-04-09 16:21:21");
INSERT INTO kp_cancelled_sales VALUES("448","2","1","360","2021-04-09","2021-04-09 17:38:37");
INSERT INTO kp_cancelled_sales VALUES("454","2","1","0","2021-04-09","2021-04-09 18:47:46");
INSERT INTO kp_cancelled_sales VALUES("457","2","1","0","2021-04-10","2021-04-10 08:23:09");
INSERT INTO kp_cancelled_sales VALUES("460","2","1","0","2021-04-10","2021-04-10 09:43:58");
INSERT INTO kp_cancelled_sales VALUES("467","2","1","0","2021-04-10","2021-04-10 16:45:28");
INSERT INTO kp_cancelled_sales VALUES("0","2","0","100","2021-04-11","2021-04-11 13:25:18");
INSERT INTO kp_cancelled_sales VALUES("494","2","1","0","2021-04-11","2021-04-11 13:47:10");
INSERT INTO kp_cancelled_sales VALUES("500","2","1","0","2021-04-11","2021-04-11 16:14:32");
INSERT INTO kp_cancelled_sales VALUES("501","2","1","0","2021-04-11","2021-04-11 16:15:31");
INSERT INTO kp_cancelled_sales VALUES("512","2","1","0","2021-04-12","2021-04-12 08:43:39");
INSERT INTO kp_cancelled_sales VALUES("513","2","1","0","2021-04-12","2021-04-12 09:26:28");
INSERT INTO kp_cancelled_sales VALUES("519","2","1","0","2021-04-12","2021-04-12 10:22:17");
INSERT INTO kp_cancelled_sales VALUES("522","2","1","0","2021-04-12","2021-04-12 11:59:00");
INSERT INTO kp_cancelled_sales VALUES("524","2","1","0","2021-04-12","2021-04-12 12:08:35");
INSERT INTO kp_cancelled_sales VALUES("525","2","1","0","2021-04-12","2021-04-12 12:10:17");
INSERT INTO kp_cancelled_sales VALUES("526","2","1","0","2021-04-12","2021-04-12 12:14:41");
INSERT INTO kp_cancelled_sales VALUES("535","2","1","0","2021-04-12","2021-04-12 14:39:30");
INSERT INTO kp_cancelled_sales VALUES("536","2","1","0","2021-04-12","2021-04-12 14:45:23");
INSERT INTO kp_cancelled_sales VALUES("554","2","2","0","2021-04-12","2021-04-12 18:12:22");
INSERT INTO kp_cancelled_sales VALUES("572","2","1","0","2021-04-13","2021-04-13 13:31:32");
INSERT INTO kp_cancelled_sales VALUES("573","2","1","0","2021-04-13","2021-04-13 14:04:09");
INSERT INTO kp_cancelled_sales VALUES("464","2","1","1425","2021-04-13","2021-04-13 14:04:30");
INSERT INTO kp_cancelled_sales VALUES("567","2","1","0","2021-04-13","2021-04-13 14:04:38");
INSERT INTO kp_cancelled_sales VALUES("0","1","0","0","2021-05-22","2021-05-22 13:37:53");
INSERT INTO kp_cancelled_sales VALUES("583","2","1","0","2021-05-22","2021-05-22 13:38:57");
INSERT INTO kp_cancelled_sales VALUES("584","2","1","0","2021-05-22","2021-05-22 13:46:26");





CREATE TABLE `kp_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `cat_description` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `spare3` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_category VALUES("1","COOKING OIL","0","0","0");
INSERT INTO kp_category VALUES("2","SUGAR","","","0");
INSERT INTO kp_category VALUES("3","RICE","","","0");
INSERT INTO kp_category VALUES("4","FLOUR","","","0");
INSERT INTO kp_category VALUES("5","TISSUE","","","0");
INSERT INTO kp_category VALUES("6","SURVIETS","","","0");
INSERT INTO kp_category VALUES("7","BISCUITS","","","0");
INSERT INTO kp_category VALUES("8","SPAGHETTI","","","0");
INSERT INTO kp_category VALUES("9","CHEWING GUM","","","0");
INSERT INTO kp_category VALUES("10","LOLLIPOP ","","","0");
INSERT INTO kp_category VALUES("11","SWEETS","","","0");
INSERT INTO kp_category VALUES("12","MR ENEGRY","","","0");
INSERT INTO kp_category VALUES("13","KITCHEN","","","0");
INSERT INTO kp_category VALUES("14","SOAP","","","0");
INSERT INTO kp_category VALUES("15","BUTTER","","","0");
INSERT INTO kp_category VALUES("16","DRINKS","","","0");
INSERT INTO kp_category VALUES("17","OTHERS","","","0");
INSERT INTO kp_category VALUES("18","PADS","","","0");
INSERT INTO kp_category VALUES("19","DAIPERS","","","0");
INSERT INTO kp_category VALUES("20","TOOTH PASTE","","","0");
INSERT INTO kp_category VALUES("21","DAWA","","","0");
INSERT INTO kp_category VALUES("22","SALT","","","0");





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

INSERT INTO kp_cust_hist VALUES("1","SALE","","595","2","4060.00","0.00","2021-06-10","2021-06-10 16:29:37");
INSERT INTO kp_cust_hist VALUES("1","SALE","","596","2","1500.00","0.00","2021-06-10","2021-06-10 16:33:07");
INSERT INTO kp_cust_hist VALUES("2","SALE","","597","2","4050.00","0.00","2021-06-10","2021-06-10 16:38:46");
INSERT INTO kp_cust_hist VALUES("1","SALE","","598","2","6000.00","0.00","2021-06-10","2021-06-10 16:44:53");
INSERT INTO kp_cust_hist VALUES("1","SALE","","599","2","3000.00","0.00","2021-06-10","2021-06-10 16:59:42");
INSERT INTO kp_cust_hist VALUES("3","CREDIT PAYMENT","","507","2","200.00","0.00","2021-06-10","2021-06-10 17:02:24");
INSERT INTO kp_cust_hist VALUES("2","SALE","","0","2","600.00","0.00","2021-06-10","2021-06-10 17:09:50");
INSERT INTO kp_cust_hist VALUES("2","CREDIT PAYMENT","","508","2","600.00","0.00","2021-06-10","2021-06-10 17:10:15");
INSERT INTO kp_cust_hist VALUES("2","SALE","","603","2","600.00","0.00","2021-06-10","2021-06-10 21:25:06");
INSERT INTO kp_cust_hist VALUES("2","SALE","","604","2","42500.00","0.00","2021-06-11","2021-06-11 11:39:09");





CREATE TABLE `kp_customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alias` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `location` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `del_status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_customers VALUES("1","WALKIN CUSTOMER","","+254000","","","000","0.00","2");
INSERT INTO kp_customers VALUES("2","K-TEN  INVESTMENTS","","+254716100335","","","","200.00","2");
INSERT INTO kp_customers VALUES("3","CUSTOMER TEST","","415263","","","TEST","0.00","2");





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
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`grn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO kp_grn VALUES("1","2","2","3","43980.00","0.00","0.00","2","0000-00-00","2021-03-28","2021-03-28 10:49:56");
INSERT INTO kp_grn VALUES("2","3","2","1","990.00","0.00","0.00","2","0000-00-00","2021-03-28","2021-03-28 11:28:41");
INSERT INTO kp_grn VALUES("3","16","2","5","19600.00","0.00","0.00","2","0000-00-00","2021-04-13","2021-04-13 10:07:15");
INSERT INTO kp_grn VALUES("4","17","2","1","58530.00","0.00","0.00","2","0000-00-00","2021-04-22","2021-04-22 09:10:46");
INSERT INTO kp_grn VALUES("5","14","2","9","5000.00","0.00","0.00","2","0000-00-00","2021-04-22","2021-04-22 09:11:25");
INSERT INTO kp_grn VALUES("6","13","2","8","20200.00","0.00","0.00","2","0000-00-00","2021-04-22","2021-04-22 09:13:27");
INSERT INTO kp_grn VALUES("7","18","2","5","4015.00","0.00","0.00","2","0000-00-00","2021-04-22","2021-04-22 23:34:21");
INSERT INTO kp_grn VALUES("8","18","2","5","26650.00","0.00","0.00","2","0000-00-00","2021-04-22","2021-04-22 23:37:58");
INSERT INTO kp_grn VALUES("10","21","2","1","2000.00","0.00","0.00","2","0000-00-00","2021-06-10","2021-06-10 20:46:00");





CREATE TABLE `kp_grn_hist` (
  `grn_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bal` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_grn_id` (
  `grn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_grn_id VALUES("10");





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

INSERT INTO kp_grn_items VALUES("1","150","10","2340","23400","2","2021-03-28","2021-03-28 10:49:45","1");
INSERT INTO kp_grn_items VALUES("1","18","6","3430","20580","2","2021-03-28","2021-03-28 10:49:48","1");
INSERT INTO kp_grn_items VALUES("2","1","1","990","990","2","2021-03-28","2021-03-28 11:28:35","1");
INSERT INTO kp_grn_items VALUES("3","179","20","980","19600","2","2021-04-13","2021-04-13 10:07:09","1");
INSERT INTO kp_grn_items VALUES("4","2","45","1234","55530","2","2021-04-22","2021-04-22 08:52:13","1");
INSERT INTO kp_grn_items VALUES("4","9","5","600","3000","2","2021-04-22","2021-04-22 08:52:16","1");
INSERT INTO kp_grn_items VALUES("5","269","40","125","5000","2","2021-04-22","2021-04-22 09:11:16","1");
INSERT INTO kp_grn_items VALUES("6","268","10","1500","15000","2","2021-04-22","2021-04-22 09:13:10","1");
INSERT INTO kp_grn_items VALUES("6","265","5","1040","5200","2","2021-04-22","2021-04-22 09:13:15","1");
INSERT INTO kp_grn_items VALUES("7","2","5","545","2725","2","2021-04-22","2021-04-22 23:32:47","1");
INSERT INTO kp_grn_items VALUES("7","281","2","545","1090","2","2021-04-22","2021-04-22 23:33:14","1");
INSERT INTO kp_grn_items VALUES("7","6","2","100","200","2","2021-04-22","2021-04-22 23:34:00","1");
INSERT INTO kp_grn_items VALUES("8","2","3","2350","7050","2","2021-04-22","2021-04-22 23:35:39","1");
INSERT INTO kp_grn_items VALUES("8","281","3","2350","7050","2","2021-04-22","2021-04-22 23:35:40","1");
INSERT INTO kp_grn_items VALUES("8","5","5","2350","11750","2","2021-04-22","2021-04-22 23:35:44","1");
INSERT INTO kp_grn_items VALUES("8","6","3","100","300","2","2021-04-22","2021-04-22 23:35:54","1");
INSERT INTO kp_grn_items VALUES("8","8","5","100","500","2","2021-04-22","2021-04-22 23:35:58","1");
INSERT INTO kp_grn_items VALUES("9","1","5","51","255","2","2021-05-11","2021-05-11 13:05:45","2");
INSERT INTO kp_grn_items VALUES("10","1","4","500","2000","2","2021-06-10","2021-06-10 20:45:52","1");





CREATE TABLE `kp_grn_status` (
  `grn_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_grn_status VALUES("9","2","20","2021-05-11 13:05:40");





CREATE TABLE `kp_item_hist` (
  `item_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_item_hist VALUES("150","ITEM CREATED","2","2021-03-28","2021-03-28 10:20:09");
INSERT INTO kp_item_hist VALUES("151","ITEM CREATED","2","2021-03-28","2021-03-28 11:39:47");
INSERT INTO kp_item_hist VALUES("152","ITEM CREATED","2","2021-03-28","2021-03-28 12:22:31");
INSERT INTO kp_item_hist VALUES("153","ITEM CREATED","2","2021-03-29","2021-03-29 10:37:34");
INSERT INTO kp_item_hist VALUES("154","ITEM CREATED","2","2021-03-29","2021-03-29 10:48:42");
INSERT INTO kp_item_hist VALUES("155","ITEM CREATED","2","2021-03-29","2021-03-29 10:52:02");
INSERT INTO kp_item_hist VALUES("156","ITEM CREATED","2","2021-03-29","2021-03-29 11:09:13");
INSERT INTO kp_item_hist VALUES("157","ITEM CREATED","2","2021-03-29","2021-03-29 11:10:31");
INSERT INTO kp_item_hist VALUES("158","ITEM CREATED","2","2021-03-29","2021-03-29 11:11:41");
INSERT INTO kp_item_hist VALUES("159","ITEM CREATED","2","2021-03-29","2021-03-29 11:12:46");
INSERT INTO kp_item_hist VALUES("160","ITEM CREATED","2","2021-03-29","2021-03-29 11:13:45");
INSERT INTO kp_item_hist VALUES("161","ITEM CREATED","2","2021-03-29","2021-03-29 11:15:09");
INSERT INTO kp_item_hist VALUES("162","ITEM CREATED","2","2021-03-29","2021-03-29 11:16:04");
INSERT INTO kp_item_hist VALUES("163","ITEM CREATED","2","2021-03-29","2021-03-29 11:45:05");
INSERT INTO kp_item_hist VALUES("164","ITEM CREATED","2","2021-03-29","2021-03-29 12:15:05");
INSERT INTO kp_item_hist VALUES("165","ITEM CREATED","2","2021-03-29","2021-03-29 12:17:34");
INSERT INTO kp_item_hist VALUES("166","ITEM CREATED","2","2021-03-29","2021-03-29 12:34:08");
INSERT INTO kp_item_hist VALUES("167","ITEM CREATED","2","2021-03-29","2021-03-29 12:38:42");
INSERT INTO kp_item_hist VALUES("168","ITEM CREATED","2","2021-03-29","2021-03-29 12:40:22");
INSERT INTO kp_item_hist VALUES("169","ITEM CREATED","2","2021-03-29","2021-03-29 12:52:24");
INSERT INTO kp_item_hist VALUES("170","ITEM CREATED","2","2021-03-29","2021-03-29 13:23:42");
INSERT INTO kp_item_hist VALUES("171","ITEM CREATED","2","2021-03-29","2021-03-29 14:03:15");
INSERT INTO kp_item_hist VALUES("172","ITEM CREATED","2","2021-03-29","2021-03-29 14:04:09");
INSERT INTO kp_item_hist VALUES("173","ITEM CREATED","2","2021-03-29","2021-03-29 14:06:16");
INSERT INTO kp_item_hist VALUES("174","ITEM CREATED","2","2021-03-29","2021-03-29 14:58:30");
INSERT INTO kp_item_hist VALUES("175","ITEM CREATED","2","2021-03-29","2021-03-29 14:58:52");
INSERT INTO kp_item_hist VALUES("176","ITEM CREATED","2","2021-03-29","2021-03-29 15:03:20");
INSERT INTO kp_item_hist VALUES("177","ITEM CREATED","2","2021-03-29","2021-03-29 15:04:14");
INSERT INTO kp_item_hist VALUES("178","ITEM CREATED","2","2021-03-29","2021-03-29 15:10:13");
INSERT INTO kp_item_hist VALUES("179","ITEM CREATED","2","2021-03-29","2021-03-29 15:11:07");
INSERT INTO kp_item_hist VALUES("180","ITEM CREATED","2","2021-03-29","2021-03-29 15:11:48");
INSERT INTO kp_item_hist VALUES("181","ITEM CREATED","2","2021-03-29","2021-03-29 15:13:04");
INSERT INTO kp_item_hist VALUES("182","ITEM CREATED","2","2021-03-29","2021-03-29 15:13:54");
INSERT INTO kp_item_hist VALUES("183","ITEM CREATED","2","2021-03-29","2021-03-29 15:19:43");
INSERT INTO kp_item_hist VALUES("184","ITEM CREATED","2","2021-03-29","2021-03-29 15:23:00");
INSERT INTO kp_item_hist VALUES("185","ITEM CREATED","2","2021-03-29","2021-03-29 15:24:29");
INSERT INTO kp_item_hist VALUES("186","ITEM CREATED","2","2021-03-29","2021-03-29 15:25:51");
INSERT INTO kp_item_hist VALUES("187","ITEM CREATED","2","2021-03-29","2021-03-29 15:27:06");
INSERT INTO kp_item_hist VALUES("188","ITEM CREATED","2","2021-03-29","2021-03-29 15:28:06");
INSERT INTO kp_item_hist VALUES("189","ITEM CREATED","2","2021-03-29","2021-03-29 15:28:41");
INSERT INTO kp_item_hist VALUES("190","ITEM CREATED","2","2021-03-29","2021-03-29 15:36:38");
INSERT INTO kp_item_hist VALUES("191","ITEM CREATED","2","2021-03-29","2021-03-29 15:52:13");
INSERT INTO kp_item_hist VALUES("192","ITEM CREATED","2","2021-03-29","2021-03-29 15:54:03");
INSERT INTO kp_item_hist VALUES("193","ITEM CREATED","2","2021-03-29","2021-03-29 16:03:48");
INSERT INTO kp_item_hist VALUES("194","ITEM CREATED","2","2021-03-29","2021-03-29 16:11:04");
INSERT INTO kp_item_hist VALUES("195","ITEM CREATED","2","2021-03-29","2021-03-29 17:14:42");
INSERT INTO kp_item_hist VALUES("196","ITEM CREATED","2","2021-03-29","2021-03-29 17:21:43");
INSERT INTO kp_item_hist VALUES("197","ITEM CREATED","2","2021-03-29","2021-03-29 17:53:03");
INSERT INTO kp_item_hist VALUES("198","ITEM CREATED","2","2021-03-29","2021-03-29 18:23:57");
INSERT INTO kp_item_hist VALUES("199","ITEM CREATED","2","2021-03-29","2021-03-29 18:25:21");
INSERT INTO kp_item_hist VALUES("200","ITEM CREATED","2","2021-03-29","2021-03-29 18:31:30");
INSERT INTO kp_item_hist VALUES("201","ITEM CREATED","2","2021-03-29","2021-03-29 18:31:52");
INSERT INTO kp_item_hist VALUES("202","ITEM CREATED","2","2021-03-29","2021-03-29 18:44:42");
INSERT INTO kp_item_hist VALUES("203","ITEM CREATED","2","2021-03-30","2021-03-30 13:13:08");
INSERT INTO kp_item_hist VALUES("204","ITEM CREATED","2","2021-03-30","2021-03-30 16:58:57");
INSERT INTO kp_item_hist VALUES("205","ITEM CREATED","2","2021-03-31","2021-03-31 08:19:09");
INSERT INTO kp_item_hist VALUES("206","ITEM CREATED","2","2021-03-31","2021-03-31 08:56:59");
INSERT INTO kp_item_hist VALUES("207","ITEM CREATED","2","2021-03-31","2021-03-31 17:27:05");
INSERT INTO kp_item_hist VALUES("208","ITEM CREATED","2","2021-03-31","2021-03-31 17:45:09");
INSERT INTO kp_item_hist VALUES("209","ITEM CREATED","2","2021-03-31","2021-03-31 17:47:46");
INSERT INTO kp_item_hist VALUES("210","ITEM CREATED","2","2021-03-31","2021-03-31 18:04:03");
INSERT INTO kp_item_hist VALUES("211","ITEM CREATED","2","2021-03-31","2021-03-31 18:05:34");
INSERT INTO kp_item_hist VALUES("212","ITEM CREATED","2","2021-04-01","2021-04-01 09:55:58");
INSERT INTO kp_item_hist VALUES("213","ITEM CREATED","2","2021-04-01","2021-04-01 17:04:20");
INSERT INTO kp_item_hist VALUES("214","ITEM CREATED","2","2021-04-01","2021-04-01 17:08:44");
INSERT INTO kp_item_hist VALUES("215","ITEM CREATED","2","2021-04-01","2021-04-01 17:09:09");
INSERT INTO kp_item_hist VALUES("216","ITEM CREATED","2","2021-04-01","2021-04-01 17:18:40");
INSERT INTO kp_item_hist VALUES("217","ITEM CREATED","2","2021-04-01","2021-04-01 17:33:25");
INSERT INTO kp_item_hist VALUES("218","ITEM CREATED","2","2021-04-01","2021-04-01 18:11:30");
INSERT INTO kp_item_hist VALUES("219","ITEM CREATED","2","2021-04-02","2021-04-02 08:05:14");
INSERT INTO kp_item_hist VALUES("220","ITEM CREATED","2","2021-04-02","2021-04-02 08:17:02");
INSERT INTO kp_item_hist VALUES("221","ITEM CREATED","2","2021-04-02","2021-04-02 08:17:02");
INSERT INTO kp_item_hist VALUES("222","ITEM CREATED","2","2021-04-02","2021-04-02 12:50:28");
INSERT INTO kp_item_hist VALUES("223","ITEM CREATED","2","2021-04-02","2021-04-02 12:51:29");
INSERT INTO kp_item_hist VALUES("224","ITEM CREATED","2","2021-04-02","2021-04-02 13:49:28");
INSERT INTO kp_item_hist VALUES("225","ITEM CREATED","2","2021-04-02","2021-04-02 14:44:13");
INSERT INTO kp_item_hist VALUES("226","ITEM CREATED","2","2021-04-02","2021-04-02 14:47:42");
INSERT INTO kp_item_hist VALUES("227","ITEM CREATED","2","2021-04-02","2021-04-02 15:49:18");
INSERT INTO kp_item_hist VALUES("228","ITEM CREATED","2","2021-04-02","2021-04-02 15:56:58");
INSERT INTO kp_item_hist VALUES("229","ITEM CREATED","2","2021-04-02","2021-04-02 16:20:12");
INSERT INTO kp_item_hist VALUES("230","ITEM CREATED","2","2021-04-02","2021-04-02 16:48:24");
INSERT INTO kp_item_hist VALUES("231","ITEM CREATED","2","2021-04-02","2021-04-02 17:53:07");
INSERT INTO kp_item_hist VALUES("232","ITEM CREATED","2","2021-04-03","2021-04-03 08:28:42");
INSERT INTO kp_item_hist VALUES("233","ITEM CREATED","2","2021-04-03","2021-04-03 10:51:39");
INSERT INTO kp_item_hist VALUES("234","ITEM CREATED","2","2021-04-03","2021-04-03 10:54:12");
INSERT INTO kp_item_hist VALUES("235","ITEM CREATED","2","2021-04-03","2021-04-03 11:10:35");
INSERT INTO kp_item_hist VALUES("236","ITEM CREATED","2","2021-04-03","2021-04-03 15:58:52");
INSERT INTO kp_item_hist VALUES("237","ITEM CREATED","2","2021-04-03","2021-04-03 16:41:17");
INSERT INTO kp_item_hist VALUES("238","ITEM CREATED","2","2021-04-05","2021-04-05 12:35:58");
INSERT INTO kp_item_hist VALUES("239","ITEM CREATED","2","2021-04-05","2021-04-05 13:17:05");
INSERT INTO kp_item_hist VALUES("240","ITEM CREATED","2","2021-04-05","2021-04-05 14:05:32");
INSERT INTO kp_item_hist VALUES("241","ITEM CREATED","2","2021-04-05","2021-04-05 14:05:54");
INSERT INTO kp_item_hist VALUES("242","ITEM CREATED","2","2021-04-05","2021-04-05 14:12:41");
INSERT INTO kp_item_hist VALUES("243","ITEM CREATED","2","2021-04-05","2021-04-05 14:14:23");
INSERT INTO kp_item_hist VALUES("244","ITEM CREATED","2","2021-04-05","2021-04-05 14:36:12");
INSERT INTO kp_item_hist VALUES("245","ITEM CREATED","2","2021-04-05","2021-04-05 14:38:21");
INSERT INTO kp_item_hist VALUES("246","ITEM CREATED","2","2021-04-05","2021-04-05 14:46:16");
INSERT INTO kp_item_hist VALUES("247","ITEM CREATED","2","2021-04-05","2021-04-05 14:47:00");
INSERT INTO kp_item_hist VALUES("248","ITEM CREATED","2","2021-04-05","2021-04-05 14:47:56");
INSERT INTO kp_item_hist VALUES("249","ITEM CREATED","2","2021-04-05","2021-04-05 14:50:15");
INSERT INTO kp_item_hist VALUES("250","ITEM CREATED","2","2021-04-05","2021-04-05 15:14:07");
INSERT INTO kp_item_hist VALUES("251","ITEM CREATED","2","2021-04-05","2021-04-05 15:32:11");
INSERT INTO kp_item_hist VALUES("252","ITEM CREATED","2","2021-04-05","2021-04-05 18:12:44");
INSERT INTO kp_item_hist VALUES("253","ITEM CREATED","2","2021-04-05","2021-04-05 18:43:32");
INSERT INTO kp_item_hist VALUES("254","ITEM CREATED","2","2021-04-06","2021-04-06 15:08:40");
INSERT INTO kp_item_hist VALUES("255","ITEM CREATED","2","2021-04-06","2021-04-06 17:07:56");
INSERT INTO kp_item_hist VALUES("256","ITEM CREATED","2","2021-04-06","2021-04-06 17:37:30");
INSERT INTO kp_item_hist VALUES("257","ITEM CREATED","2","2021-04-06","2021-04-06 17:38:11");
INSERT INTO kp_item_hist VALUES("258","ITEM CREATED","2","2021-04-06","2021-04-06 17:40:13");
INSERT INTO kp_item_hist VALUES("259","ITEM CREATED","2","2021-04-06","2021-04-06 17:41:10");
INSERT INTO kp_item_hist VALUES("260","ITEM CREATED","2","2021-04-06","2021-04-06 17:50:50");
INSERT INTO kp_item_hist VALUES("261","ITEM CREATED","2","2021-04-06","2021-04-06 18:39:10");
INSERT INTO kp_item_hist VALUES("262","ITEM CREATED","2","2021-04-07","2021-04-07 08:58:46");
INSERT INTO kp_item_hist VALUES("263","ITEM CREATED","2","2021-04-08","2021-04-08 17:36:37");
INSERT INTO kp_item_hist VALUES("264","ITEM CREATED","2","2021-04-08","2021-04-08 18:20:02");
INSERT INTO kp_item_hist VALUES("265","ITEM CREATED","2","2021-04-08","2021-04-08 18:25:09");
INSERT INTO kp_item_hist VALUES("266","ITEM CREATED","2","2021-04-08","2021-04-08 18:29:02");
INSERT INTO kp_item_hist VALUES("267","ITEM CREATED","2","2021-04-09","2021-04-09 08:26:08");
INSERT INTO kp_item_hist VALUES("268","ITEM CREATED","2","2021-04-09","2021-04-09 08:44:18");
INSERT INTO kp_item_hist VALUES("269","ITEM CREATED","2","2021-04-09","2021-04-09 08:49:58");
INSERT INTO kp_item_hist VALUES("270","ITEM CREATED","2","2021-04-09","2021-04-09 17:25:26");
INSERT INTO kp_item_hist VALUES("271","ITEM CREATED","2","2021-04-09","2021-04-09 17:41:23");
INSERT INTO kp_item_hist VALUES("272","ITEM CREATED","2","2021-04-09","2021-04-09 17:46:14");
INSERT INTO kp_item_hist VALUES("273","ITEM CREATED","2","2021-04-09","2021-04-09 18:48:56");
INSERT INTO kp_item_hist VALUES("274","ITEM CREATED","2","2021-04-10","2021-04-10 09:45:03");
INSERT INTO kp_item_hist VALUES("275","ITEM CREATED","2","2021-04-11","2021-04-11 15:58:19");
INSERT INTO kp_item_hist VALUES("276","ITEM CREATED","2","2021-04-11","2021-04-11 16:15:01");
INSERT INTO kp_item_hist VALUES("277","ITEM CREATED","2","2021-04-11","2021-04-11 16:16:04");
INSERT INTO kp_item_hist VALUES("278","ITEM CREATED","2","2021-04-12","2021-04-12 09:27:22");
INSERT INTO kp_item_hist VALUES("279","ITEM CREATED","2","2021-04-12","2021-04-12 12:04:37");
INSERT INTO kp_item_hist VALUES("280","ITEM CREATED","2","2021-04-12","2021-04-12 18:14:23");
INSERT INTO kp_item_hist VALUES("1","QUANTITY ADJUSTMENT","2","2021-04-22","2021-04-22 23:15:32");
INSERT INTO kp_item_hist VALUES("2","QUANTITY ADJUSTMENT","2","2021-04-22","2021-04-22 23:15:57");
INSERT INTO kp_item_hist VALUES("1","QUANTITY ADJUSTMENT","2","2021-04-25","2021-04-25 11:12:48");
INSERT INTO kp_item_hist VALUES("40","QUANTITY ADJUSTMENT","2","2021-04-25","2021-04-25 13:06:26");
INSERT INTO kp_item_hist VALUES("43","QUANTITY ADJUSTMENT","2","2021-04-25","2021-04-25 13:07:22");





CREATE TABLE `kp_item_history` (
  `item_id` int(11) NOT NULL,
  `transaction` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_item_history VALUES("165","QUANTITY ADJUSTMENT","2","2021-03-30","2021-03-30 17:57:04");
INSERT INTO kp_item_history VALUES("281","ITEM CREATED","2","2021-04-22","2021-04-22 20:43:43");
INSERT INTO kp_item_history VALUES("282","ITEM CREATED","2","2021-04-22","2021-04-22 23:10:05");
INSERT INTO kp_item_history VALUES("283","ITEM CREATED","2","2021-04-22","2021-04-22 23:11:37");
INSERT INTO kp_item_history VALUES("2","REORDER ADJUSTMENT","2","2021-04-22","2021-04-22 23:15:48");
INSERT INTO kp_item_history VALUES("0","QUANTITY ADJUSTMENT","2","2021-04-25","2021-04-25 12:59:57");
INSERT INTO kp_item_history VALUES("43","QUANTITY ADJUSTMENT","2","2021-04-25","2021-04-25 13:01:44");





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

INSERT INTO kp_item_qty_hist VALUES("165","2","22","1000","",""," ","","2021-03-30 17:57:04");
INSERT INTO kp_item_qty_hist VALUES("0","2","0","10","",""," testing","","2021-04-25 12:59:57");
INSERT INTO kp_item_qty_hist VALUES("43","2","0","1000","",""," testing","","2021-04-25 13:01:44");
INSERT INTO kp_item_qty_hist VALUES("40","2","0","10","",""," testing","","2021-04-25 13:06:26");
INSERT INTO kp_item_qty_hist VALUES("43","2","0","10","",""," testing","","2021-04-25 13:07:22");





CREATE TABLE `kp_items` (
  `barcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `uom1` int(11) NOT NULL DEFAULT '2',
  `uom1qty` decimal(10,2) NOT NULL,
  `uom1reorder` decimal(10,2) NOT NULL,
  `uom2` int(11) NOT NULL DEFAULT '2',
  `uom2qty` decimal(10,2) NOT NULL,
  `uom2reorder` decimal(10,2) NOT NULL,
  `uom3` int(11) NOT NULL DEFAULT '2',
  `uom3qty` decimal(10,2) NOT NULL,
  `uom3reorder` decimal(10,2) NOT NULL,
  `uom4` int(11) NOT NULL DEFAULT '2',
  `uom4qty` decimal(10,2) NOT NULL,
  `uom4reorder` decimal(10,2) NOT NULL,
  `uom5` int(11) NOT NULL DEFAULT '2',
  `uom5qty` decimal(10,2) NOT NULL,
  `uom5reorder` decimal(10,2) NOT NULL,
  `uom6` int(11) NOT NULL DEFAULT '2',
  `uom6qty` decimal(10,2) NOT NULL,
  `uom6reorder` decimal(10,2) NOT NULL,
  `uom7` int(11) NOT NULL DEFAULT '2',
  `uom7qty` decimal(10,2) NOT NULL,
  `uom7reorder` decimal(10,2) NOT NULL,
  `uom8` int(11) NOT NULL DEFAULT '2',
  `uom8qty` decimal(10,2) NOT NULL,
  `uom8reorder` decimal(10,2) NOT NULL,
  `uom9` int(11) NOT NULL DEFAULT '2',
  `uom9qty` decimal(10,2) NOT NULL,
  `uom9reorder` decimal(10,2) NOT NULL,
  `uom10` int(11) NOT NULL DEFAULT '2',
  `uom10qty` decimal(10,2) NOT NULL,
  `uom10reorder` decimal(10,2) NOT NULL,
  `uom11` int(11) NOT NULL DEFAULT '2',
  `uom11qty` decimal(10,2) NOT NULL,
  `uom11reorder` decimal(10,2) NOT NULL,
  `uom12` int(11) NOT NULL DEFAULT '2',
  `uom12qty` decimal(10,2) NOT NULL,
  `uom12reorder` decimal(10,2) NOT NULL,
  `uom13` int(11) NOT NULL DEFAULT '2',
  `uom13qty` decimal(10,2) NOT NULL,
  `uom13reorder` decimal(10,2) NOT NULL,
  `uom14` int(11) NOT NULL DEFAULT '2',
  `uom14qty` decimal(10,2) NOT NULL,
  `uom14reorder` decimal(10,2) NOT NULL,
  `uom15` int(11) NOT NULL DEFAULT '2',
  `uom15qty` decimal(10,2) NOT NULL,
  `uom15reorder` decimal(10,2) NOT NULL,
  `uom16` int(11) NOT NULL DEFAULT '2',
  `uom16qty` decimal(10,2) NOT NULL,
  `uom16reorder` decimal(10,2) NOT NULL,
  `uom17` int(11) NOT NULL DEFAULT '2',
  `uom17qty` decimal(10,2) NOT NULL,
  `uom17reorder` decimal(10,2) NOT NULL,
  `uom18` int(11) NOT NULL DEFAULT '2',
  `uom18qty` decimal(10,2) NOT NULL,
  `uom18reorder` decimal(10,2) NOT NULL,
  `uom19` int(11) NOT NULL DEFAULT '2',
  `uom19qty` decimal(10,2) NOT NULL,
  `uom19reorder` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_items VALUES("0","1","","FRESH FRI 5LTRS","1","0","995.00","1000.00","950.00","0","6","0","2","2","0","0","0.00","1","0.00","100.00","Ltrs","2","0","0","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","10.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","2","","FRESH FRI 3LTRS","1","0","0.00","0.00","0.00","5","7","0","2","2","0","0","0.00","1","0.00","0.00","Ltrs","2","0","0","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","10.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","3","","CABRAS 50KG","2","0","0.00","0.00","0.00","0","49","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","4","","CABRAS 25KG","2","0","0.00","0.00","0.00","0","8","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","5","","MR RICE","3","0","0.00","0.00","0.00","0","12","0","2","2","0","0","0.00","1","0.00","0.00","Kgs","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","6","","KANGORE GRADE 1","3","0","0.00","0.00","0.00","0","988","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","7","","KANGORE GRADE 2","3","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","8","","NDOVU NGANO 2KG BALE","4","0","0.00","0.00","0.00","0","900","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","9","","NDOVU NGANO 1KG BALE","4","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","10","","AJAB 2KG BALE","4","0","0.00","0.00","0.00","0","93","0","1","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("4595","11","","AJAB 1KG BALE","4","0","0.00","0.00","0.00","0","20","0","1","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","12","","ORYX 2KG BALE","4","0","0.00","0.00","0.00","0","995","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","13","","ORYX 1KG BALE","4","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","14","","RAHA PREMIER 2KG BALE","4","0","1480.00","1490.00","1440.00","0","985","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","15","","RAHA PREMIER 1KG BALE","4","0","0.00","0.00","0.00","0","950","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","16","","SOKO 2KG BALE","4","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","17","","SOKO 1KG BALE","4","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","18","","HARISI 20LTRS","1","0","0.00","0.00","0.00","0","991","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","19","","HARISI 10L TRS","1","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","20","","SAMLI 10KG","1","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","21","","SAMLI 5KG","1","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","22","","BELLA BALE","5","0","800.00","800.00","760.00","0","200","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","23","","BELLA 10 PAC","5","0","200.00","200.00","190.00","0","10","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","24","","NEPTUNE BALE","5","0","820.00","820.00","800.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","25","","NEPTUNE 10 PAC","5","0","210.00","220.00","200.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","26","","TOILEX BALE","5","0","820.00","820.00","780.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","27","","TOILEX 10 PAC","5","0","205.00","205.00","195.00","0","995","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","28","","ESSY BALE","5","0","600.00","600.00","550.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","29","","ESSY 10 PAC","5","0","150.00","150.00","138.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","30","","ROSSY CARTON","6","0","850.00","850.00","790.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","31","","ROSSY  1/2 CARTON","6","0","425.00","425.00","395.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","32","","NUVITA CARTON","7","0","250.00","250.00","230.00","0","991","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","33","","GINGER CARTON","7","0","250.00","250.00","230.00","0","991","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","34","","NUVITA WAFERE","7","0","290.00","290.00","270.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","35","","DAAWAI","8","0","800.00","800.00","770.00","0","10","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","36","","GAMASHI","8","0","730.00","730.00","680.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","37","","GOMBA","9","0","0.00","0.00","0.00","0","989","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","38","","ICE COOL","9","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","1","0.00","0.00","Pkt","2","0","0","1","7.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","39","","MUGUKA","9","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","40","","MR BERRY","9","0","0.00","0.00","0.00","0","10","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","41","","PINO","9","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","42","","MR BERRY BIGG DADDY","10","0","3000.00","3000.00","2760.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","43","","WHITE MINT POP","11","0","1080.00","1080.00","0.00","0","10","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","44","","PATICO","11","0","1080.00","1080.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","45","","COOL COW","11","0","900.00","900.00","840.00","0","1000","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","46","","TROPICAL 1 KG","11","0","0.00","0.00","0.00","0","998","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","47","","TROPICAL 0.5 KG","11","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","48","","CKL  TOFFEE","11","0","840.00","840.00","780.00","0","100","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","49","","GLUCOSE CARTON 100G","12","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","50","","GLUCOSE CARTON 50G","12","0","0.00","0.00","0.00","0","998","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","1","8.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","51","","GLUCOSE CARTON 10G","12","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","52","","GLUCOSE CARTON 100G","12","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","53","","GLUCOSE CARTON 50G","12","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","54","","GLUCOSE CARTON 10G","12","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","55","","STEELWOOL BALE","13","0","2250.00","2250.00","2150.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","56","","STEELWOOL PCS","13","0","125.00","125.00","108.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","57","","OMO 1KG","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","58","","OMO 500G","14","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","59","","OMO 200G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","60","","OMO 100G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","61","","OMO 45G","14","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","62","","OMO 30G","14","0","0.00","0.00","0.00","0","990","0","2","2","0","0","0.00","1","0.00","0.00","Sachete","2","0","0","1","9.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","63","","OMO 5G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","64","","SUNLIGHT 1KG","14","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","65","","SUNLIGHT 500G","14","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","66","","SUNLIGHT 200G","14","0","0.00","0.00","0.00","0","998","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","67","","SUNLIGHT 90G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","68","","SUNLIGHT 40G","14","0","0.00","0.00","0.00","0","984","0","2","2","0","0","0.00","1","0.00","0.00","Sachete","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","69","","SUNLIGHT 5G","14","0","0.00","0.00","0.00","0","998","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","70","","ARIEL 1KG","14","0","0.00","0.00","0.00","0","56","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","71","","ARIEL 500KG","14","0","0.00","0.00","0.00","0","200","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","72","","ARIEL 200G","14","0","0.00","0.00","0.00","0","56","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","73","","ARIEL 100G","14","0","0.00","0.00","0.00","0","45","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","74","","ARIEL 45G","14","0","0.00","0.00","0.00","0","100","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","75","","ARIEL 30G","14","0","0.00","0.00","0.00","0","56","0","1","2","0","0","0.00","1","0.00","0.00","Sachete","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","76","","MENENGAI  1KG CARTON","14","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","77","","MENENGAI 800G CARTON","14","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","78","","JAMAA 1KG CARTON","14","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","79","","NDUME-1KG CARTON","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","80","","BLUEBAND SATCHETS","15","0","0.00","0.00","0.00","0","50","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","81","","NESCAFE 10G CARTON","16","0","2150.00","2150.00","2000.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","82","","MILO 10G","16","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","83","","MARABA 50G","16","0","0.00","0.00","0.00","0","997","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","84","","MARABA 15G","16","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","85","","CANDLE CARTON","17","0","590.00","590.00","560.00","0","120","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","86","","CANDLE 0.5 CARTON","17","0","290.00","300.00","280.00","0","10","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","87","","ARAMIS 50G CARTON","17","0","0.00","0.00","0.00","0","45","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","88","","ARAMIS 50G DOZEN","17","0","0.00","0.00","0.00","0","56","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","89","","SUNGIRL CARTON","18","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","90","","SUNGIRL 0.5 CARTON","18","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","91","","AWAYS MAX CARTON","18","0","0.00","0.00","0.00","0","100","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","92","","ALWAYS LONG CARTON","18","0","0.00","0.00","0.00","0","99","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","93","","ALWAYS MAX DOZEN","18","0","0.00","0.00","0.00","0","100","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","94","","ALWAYS LONG DOZEN","18","0","0.00","0.00","0.00","0","100","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","95","","ALWAYS MAX DOZEN","18","0","0.00","0.00","0.00","0","200","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","96","","ALWAYS MAX DOZEN","18","0","0.00","0.00","0.00","0","23","0","1","2","0","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","97","","MOFIX XL CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","98","","MOFIX X CARTON","19","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","99","","MOFIX M CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","100","","MOFIX S CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","101","","MOFIX XL PCS","19","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","102","","MOFIX X PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","103","","MOFIX M PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","104","","MOFIX S PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","105","","KISKID XL CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","106","","KISKID X CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","107","","KISKID M CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","108","","KISKID S CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","109","","KISKID XL PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","110","","KISKID X PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","111","","KISKID M PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","112","","KISKID S PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","113","","SOFTCARE XL CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","114","","SOFTCARE X CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","115","","SOFTCARE M CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","116","","SOFTCARE S CARTON","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","117","","SOFTCARE XL PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","118","","SOFTCARE X PCS","19","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","119","","SOFTCARE M PCS","19","0","0.00","0.00","0.00","0","997","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","120","","SOFTCARE S PCS","19","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","121","","COLGATE H 35G","20","0","0.00","0.00","0.00","0","100","0","1","2","0","0","0.00","1","0.00","0.00","DOZEN","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","122","","COLGATE H 15G","20","0","0.00","0.00","0.00","0","500","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","123","","COLGATE N 35G","20","0","0.00","0.00","0.00","0","999","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","124","","COLGATE N 35G","20","0","0.00","0.00","0.00","0","994","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","125","","AQUA CHIL 500ML","16","0","0.00","0.00","0.00","0","12","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","126","","AQUA CHIL 5L","16","0","0.00","0.00","0.00","0","23","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","127","","AQUA CHIL 1L","16","0","0.00","0.00","0.00","0","56","0","1","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","128","","SAWA 250G CARTON","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","129","","GEISHA 125G","14","0","0.00","0.00","0.00","0","997","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","130","","GEISHA 225G","14","0","0.00","0.00","0.00","0","997","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","131","","SUNLIGHT SOAP 175G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","132","","SUNLIGHT SOAP 125G","14","0","0.00","0.00","0.00","0","1000","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","133","","PANADOL ADVANCE ","21","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","134","","PANADOL EXTRA","21","0","0.00","0.00","0.00","0","999","0","2","2","0","0","0.00","1","0.00","0.00","Pkt","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","135","","ENO BOX","21","0","0.00","0.00","0.00","0","996","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","136","","MARA MOJA","21","0","0.00","0.00","0.00","0","995","0","2","2","0","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","137","","KENSALT 1KG","22","0","0.00","0.00","0.00","0","997","0","2","2","0","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","138","","KENSALT 500G","22","0","0.00","0.00","0.00","0","994","0","2","2","0","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","139","","KENSALT 200G","22","0","0.00","0.00","0.00","0","992","0","2","2","0","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","140","RR","CLASSIC FAMILY RICE 25 KG","3","0","2010.00","0.00","2010.00","0","100","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","141","SUG","SUGAR 50KGS","2","0","4650.00","0.00","4640.00","0","987","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","142","MM","MANNA 10KGS","1","0","1370.00","0.00","1370.00","0","1000","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","143","SCL","SOFTCARE GOLD LARGE PCS","19","0","530.00","0.00","530.00","0","1000","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","144","SP","DAWAAT GREEN SPAGHETI 400G(CTN)","8","0","800.00","0.00","780.00","0","20","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","145","NO","NYOTA OIL 20LTRS","1","0","3410.00","0.00","3410.00","0","997","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","146","NVM","NUVITA MILK BICUITS 60G X 5PCS","7","0","245.00","250.00","230.00","0","1000","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","147","NVM","NUVITA MILK BISCUITS 36 X 75GMS","7","0","520.00","550.00","520.00","0","1000","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","148","NVM","NUVITA MILK  BISCUITS 48 X 38GMS","7","0","430.00","435.00","385.00","0","1000","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","149","CG","CRUNCHY GINGER 60GMS","7","0","275.00","280.00","230.00","0","200","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","150","HR","HANAN RICE25KGS(BAG)","3","0","2345.00","2460.00","2340.00","0","109","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","151","","SAUCE","17","0","250.00","250.00","205.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","152","","NYOTA 10L","1","0","1750.00","1760.00","1390.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","153","","SEAGUL 10KG","1","0","1450.00","1450.00","1390.00","0","91","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","154","","SEAGUL 10KG","1","0","1450.00","1450.00","1390.00","0","93","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","155","C00010","NYOTA 10L","1","0","1760.00","1770.00","1490.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","156","CS000400","CHILLIE SAUCE 400G","17","0","40.00","40.00","33.33","0","45","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","157","TS000250","TAMU SAUCE 250GMS","17","0","40.00","40.00","30.42","0","83","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","158","TS000400","T SAUCE 400GMS","17","0","40.00","40.00","33.33","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","159","TC00005","TAMU CHILLIE SAUCE 5L","17","0","250.00","250.00","205.00","0","94","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","160","DW0000500","DRINKING WATER 500ML","0","0","350.00","360.00","320.00","0","96","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","161","DW0005","D WATER 5L","17","0","250.00","250.00","205.00","0","50","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","162","DW00001","D WATER 1L","17","0","350.00","360.00","320.00","0","40","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","163","RS00001","ROYCLE SERCHET","17","0","55.00","55.00","0.00","0","94","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("1235","164","SP0001"," DAWAAT  SPAGHETI 400G ","8","0","41.00","50.00","39.00","0","5","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","165","SG","SUGAR ","2","0","93.50","100.00","92.80","0","776","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","1","49.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","9.00","0.00","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","166","","MACCOFFE","17","0","55.00","55.00","0.00","0","89","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("12365","167",""," PATICO","11","0","90.00","90.00","0.00","0","0","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","168","","FRUIT DROP","11","0","50.00","50.00","0.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","169","","ARAMIS ","17","0","70.00","70.00","0.00","0","56","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","170","","SALAD NYOTA","1","0","180.00","200.00","171.50","0","56","0","2","2","2","0","0.00","1","0.00","0.00","Ltrs","2","0","0","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","10.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","171","HR","HANNAH RICE","0","0","105.00","110.00","93.50","0","90","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","172","","FAHARI","17","0","25.00","25.00","0.00","0","94","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","173","SR00001","SURVITTE-ROSSY","5","0","60.00","60.00","47.00","0","88","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","174","","SOKONI","17","0","125.00","125.00","112.50","0","97","0","2","2","2","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","175","","HANNAH 4PAC","0","0","125.00","125.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","176","","D CHOLOCATE SURCHETS-20G","17","0","105.00","105.00","0.00","0","50","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","177","","D CHOCOLATE SURCHETS -10G","17","0","55.00","55.00","0.00","0","30","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","178","","ROYCLE CUBE","17","0","90.00","90.00","82.33","0","77","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","1","7.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","179","","ANCORN","4","0","1000.00","1050.00","950.00","0","56","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","180","","ANCORN 2KG PAC","4","0","85.00","100.00","79.17","0","63","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("5632","181","","AJAB","4","0","130.83","135.00","128.33","0","10","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","182","","NDOVU","4","0","122.50","135.00","120.00","0","68","0","2","2","2","0","0.00","2","0.00","0.00","Pkts","2","0","0","1","10.00","0.00","2","0.00","0.00","1","10.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","183","","SOKO","4","0","127.50","135.00","124.17","0","95","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","184","MM00001","MARA MOJA","21","0","340.00","350.00","300.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","185","","MAX BLIGHT","17","0","65.00","65.00","0.00","0","98","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","186","","WHITE WASH","14","0","23.00","23.00","0.00","0","77","0","2","2","2","0","0.00","0","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","187","","WHITE WASH","17","0","23.00","23.00","0.00","0","88","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","188","","ZENTA-1KG","14","0","1080.00","1080.00","1050.00","0","96","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","189","","ZENTA-1KG","14","0","115.00","115.00","105.00","0","90","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","190","","CANNAN-2KG","17","0","1360.00","1360.00","0.00","0","10","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","191","","ANCHRN-1KG","4","0","1020.00","1020.00","970.00","0","52","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","192","","ANCORN-1KG PCS","0","0","42.50","45.00","40.42","0","56","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","193","","NDUME","14","0","90.00","90.00","0.00","0","96","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","194","","BAKING POWDER","4","0","260.00","260.00","250.00","0","100","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","195","","DOWNY","14","0","160.00","160.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","196","","JAMAA 1KG","14","0","110.00","115.00","0.00","0","81","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","197","","NESCAFE","16","0","380.00","380.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","198","","TANGAWIZI SCTS","0","0","150.00","150.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","199","","COOLCOW","0","0","75.00","75.00","0.00","0","1000","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","200","","CREAM Y","11","0","120.00","120.00","0.00","0","100","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","201","","MELVIN GINGER","16","0","150.00","155.00","0.00","0","94","0","2","2","2","0","0.00","1","0.00","0.00","Sachete","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","202","","PIKA","1","0","430.00","430.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","203","","NESCAFE DOZEN","16","0","55.00","55.00","0.00","0","82","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","204","","TOOTHBRUSH","17","0","25.00","25.00","0.00","0","98","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","205","","CANBLE -B","17","0","50.00","50.00","47.00","0","12","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","206","","TAMU TOMATO S-PS","17","0","50.00","50.00","0.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","207","","FRYMATE 50G","1","0","560.00","560.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","208","","RHINO KUBWA PCS","17","0","35.00","35.00","0.00","0","85","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","209","","RHINO KUBWA DOZEN","17","0","350.00","350.00","272.50","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","210","","MENENGAI 1KG PC","14","0","145.00","150.00","135.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","211","","MENENGAI 800G PC","14","0","115.00","150.00","120.00","0","91","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","212","","HAPPIC","0","0","200.00","200.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","213","","KIWI-DOZEN","0","0","250.00","250.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","214","","ALWAYS-PINK","0","0","45.00","50.00","0.00","0","12","0","1","2","2","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","215","","PRISTINE-PAD","0","0","30.00","60.00","0.00","0","94","0","2","2","2","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","216","","WAFER-","0","0","100.00","100.00","0.00","0","97","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("12354","217",""," MR BERRY BIGG DADDY-DOZ","0","0","250.00","250.00","0.00","0","5","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","218","","SOMO 10KG","1","0","1140.00","1500.00","0.00","0","97","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","219","","RAHA PREMIUM PC","0","0","100.00","130.00","0.00","0","87","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","220","","ARAMIS 90G","17","0","45.00","50.00","0.00","0","11","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","221","","ARAMIS 90G","17","0","45.00","50.00","0.00","0","46","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","222","","FZAMI Y","3","0","2450.00","2470.00","2330.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","223","","FZAMI-KGS","3","0","98.00","110.00","0.00","0","97","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","224","","BELLA JUMBO","0","0","80.00","80.00","0.00","0","100","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","225","","TROPICAL KSL","0","0","130.00","130.00","0.00","0","95","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","226","","SOSSI","0","0","310.00","350.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","227","","JIK","17","0","170.00","200.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","228","","SINSHINE 10L","1","0","1780.00","2000.00","1720.00","0","98","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","229","","SUNSHINE-10L","0","0","1750.00","2000.00","1720.00","0","97","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","230","","SAVAHA ORANGE-1L","16","0","140.00","140.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","231","","SUPER BRIGHT-POA","0","0","65.00","65.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","232","","SAVVANA 3LTRS","16","0","370.00","380.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","233","FZP0001","FZAMI POA RICE","3","0","2450.00","2480.00","2380.00","0","94","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","234","FZC0009","FZAMI C9","3","0","2450.00","2470.00","2330.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","235","OM00030","OMO 30G*108","14","0","920.00","970.00","880.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","236","","LOLEE","16","0","190.00","200.00","150.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","DOZEN","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","237","","COLGATE 15G","17","0","500.00","530.00","0.00","0","300","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","238","","FIRSTCAP","16","0","120.00","130.00","108.00","0","98","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","239","","SAWA","14","0","40.00","50.00","0.00","0","87","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","240","","HANNAH WIPES","19","0","80.00","100.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","241","","KISSKID WIPES","19","0","65.00","70.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("1239","242","","210 FLOOR BALE","4","0","1520.00","1550.00","1470.00","0","5","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("12391","243","","210 FLOOR PC","4","0","127.00","130.00","122.50","0","0","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","244","TS4000001","TAMU T SAUCE 400G","17","0","850.00","900.00","800.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","245","","TAMU T SAUCE-5L","17","0","870.00","1000.00","820.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","246","","GENJOY D WATER 500ML","16","0","350.00","360.00","320.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","247","","GENJOY D WATER 1L","16","0","350.00","360.00","320.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","248","","GENJOY DWATER 5L","16","0","380.00","420.00","340.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","249","","TAMU CHILLE SAUCE-400GMS","17","0","850.00","900.00","800.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","250","","SALT -2KG","22","0","65.00","70.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","251","","PASCAL MILK","16","0","540.00","560.00","0.00","0","96","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","252","","D CHOCOLATE 500GM","16","0","300.00","300.00","0.00","0","10","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","253","","FZAMI BRAND","3","0","2100.00","2150.00","1980.00","0","90","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","1","9.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","254","","ORYX PC","4","0","95.00","130.00","95.00","0","95","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","255","","INDOMIN CHIKEN F CARTON","17","0","490.00","500.00","475.00","0","93","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","256","HB0001","HUNNY BUNNY-S","19","0","2995.00","3000.00","2850.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","257","","PRETTY BABY-S","19","0","2570.00","2600.00","2450.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","258","","HUNNY BUNN-B","19","0","500.00","510.00","475.00","0","96","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","259","","PRETTY BABY","19","0","450.00","480.00","408.33","0","96","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","260","","PRISTINE  CARTON","18","0","1776.00","1790.00","1440.00","0","98","0","2","2","2","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","261","","GLUCOSE-OUTER","17","0","100.00","110.00","0.00","0","97","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","262","WW0001","WHITE WASH CARTON","14","0","1090.00","1100.00","1030.00","0","99","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","263","FCP","FIRST CAP PCS","16","0","20.00","25.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","264","BG00","BALL GUM","17","0","5.00","5.00","0.00","0","10","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","265","JB0001","JAHAZI BALE","4","0","1100.00","1200.00","1040.00","0","103","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","266","ID00","INDOMIN PCS","17","0","50.00","60.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","267","","AWAYS MAX ","18","0","80.00","100.00","0.00","0","100","0","1","2","2","0","0.00","3","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","268","DF0001","DOLA","4","0","1530.00","1550.00","1500.00","0","26","0","1","2","2","0","0.00","2","0.00","0.00","0","2","0","0","1","10.00","0.00","2","0.00","0.00","1","9.00","0.00","1","10.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","269","NB0001","NYOTA BALES 10PAC","5","0","150.00","150.00","125.00","0","133","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","270","TP001","TOMATO PASTE CARTON","17","0","850.00","1000.00","800.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","271","","HANNAN S","17","0","80.00","90.00","70.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","272","","BAKING PCS","17","0","30.00","40.00","0.00","0","200","0","1","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","273","JH0001","JAHAZI PCS","4","0","115.00","115.00","86.67","0","94","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","274","","PASCAL MIL PCS","0","0","45.00","50.00","41.67","0","94","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","275","","VELOLINE","17","0","90.00","90.00","0.00","0","98","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","276","","SUSSHINE 20L","1","0","3500.00","3750.00","0.00","0","100","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","277","","SUNSHINE20L","1","0","3500.00","3750.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","278","TP0002","TOMATO PASTE PCS","17","0","230.00","250.00","200.00","0","97","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","279","","FAHARI MAJANI","17","0","230.00","0.00","0.00","0","99","0","2","2","2","0","0.00","1","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","280","D0002","DOLA PCS","4","0","130.00","130.00","125.00","0","99","0","2","2","2","0","0.00","2","0.00","0.00","0","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","281","TT","TESTING BALE","9","0","14.00","0.00","12.00","0","3","0","2","2","2","21","0.00","1","19.00","25.00","tts","1","12","5","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","282","TB2","TESTING BALE 1KGS","19","0","14.00","0.00","12.00","0","0","0","2","2","2","432","0.00","1","123.00","2344.00","kgs","1","24","9","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");
INSERT INTO kp_items VALUES("","283","NWF","NDOVU WHEAT FLOUR 1KG","4","0","100.00","0.00","95.00","0","0","0","2","2","2","105","0.00","2","102.00","110.00","kgs","2","0","0","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00","2","0.00","0.00");





CREATE TABLE `kp_items_arch` (
  `barcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_items_portion` (
  `item_id` int(11) NOT NULL,
  `raw_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_logistics` (
  `del_id` int(11) NOT NULL AUTO_INCREMENT,
  `beba_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `means` int(11) DEFAULT NULL,
  `reg` varchar(11) DEFAULT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`del_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO kp_logistics VALUES("1","1","578","100","3","KMCZ102U","2021-06-10","2021-06-10 13:10:48");
INSERT INTO kp_logistics VALUES("2","1","604","500","4","KAT226C","2021-06-11","2021-06-11 11:39:09");





CREATE TABLE `kp_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `link` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` int(11) NOT NULL,
  `sub` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `panel` int(11) NOT NULL,
  `modal` int(11) NOT NULL DEFAULT '2',
  `modal_function` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_menu VALUES("1","DASHBOARD","../dash/","1","2","0","fa fa-th-large","0","1","2","");
INSERT INTO kp_menu VALUES("2","CUSTOMER MANAGER","#","1","1","0","fa fa-users","0","1","2","");
INSERT INTO kp_menu VALUES("3","STAFF MANAGER","#","1","1","0","fa fa-user","0","1","2","");
INSERT INTO kp_menu VALUES("4","Active Staff List","../staff/staff.php","2","2","3","-","0","1","2","");
INSERT INTO kp_menu VALUES("6","Archive Staff List","../staff/arch_staff.php","2","2","3","-","0","1","2","");
INSERT INTO kp_menu VALUES("7","USER MANAGER","#","1","1","0","fas fa-user-tie","0","1","2","");
INSERT INTO kp_menu VALUES("8","Active Users","../users/user.php","2","2","7","-","0","1","2","");
INSERT INTO kp_menu VALUES("9","Archived Users","../users/arch_users.php","2","2","7","-","0","1","2","");
INSERT INTO kp_menu VALUES("10","INVENTORY MANAGER","#","1","1","0","fas fa-dolly-flatbed","0","1","2","");
INSERT INTO kp_menu VALUES("11","Active Product List","../prods/index.php","2","2","10","-","0","1","2","");
INSERT INTO kp_menu VALUES("12","Archived Products","../prods/arch_prods.php","2","2","10","-","0","1","2","");
INSERT INTO kp_menu VALUES("13","Product Categories","../cat/cat.php","2","2","10","-","0","1","2","");
INSERT INTO kp_menu VALUES("14","Inventory","#","2","1","10","-","0","1","2","");
INSERT INTO kp_menu VALUES("15","Stock Adjustments","../invent/stock.php","3","2","14","-","0","1","2","");
INSERT INTO kp_menu VALUES("16","STORE MANAGER","#","1","1","0","fas fa-truck-moving","0","1","2","");
INSERT INTO kp_menu VALUES("17","PURCHASE MANAGER","#","1","1","0","fas fa-shopping-basket","0","1","2","");
INSERT INTO kp_menu VALUES("18","Vendor Manager","#","2","1","17","-","0","1","2","");
INSERT INTO kp_menu VALUES("19","Vendor List","../sup/sup.php","3","2","18","-","0","1","2","");
INSERT INTO kp_menu VALUES("20","Archived Vendors","../sup/arch_sup.php","3","2","18","-","0","1","2","");
INSERT INTO kp_menu VALUES("21","Raise PO","../kugura/init_page.php","2","2","17","-","0","1","2","");
INSERT INTO kp_menu VALUES("22","Receive P.O","../kugura/po_pending.php","2","2","17","-","0","1","2","");
INSERT INTO kp_menu VALUES("23","P.O List","../kugura/po_list.php","2","2","17","-","0","1","2","");
INSERT INTO kp_menu VALUES("24","FINANCE","#","1","1","0","fa fa-donate","0","1","2","");
INSERT INTO kp_menu VALUES("25","Banking","#","2","1","24","-","0","1","2","");
INSERT INTO kp_menu VALUES("26","Active Accounts","../banking/banks.php","3","2","25","-","0","1","2","");
INSERT INTO kp_menu VALUES("27","Closed Accounts","../banking/closed_banks.php","3","2","25","-","0","1","2","");
INSERT INTO kp_menu VALUES("28","REPORTS","#","1","1","0","fa fa-chart-pie","0","1","2","");
INSERT INTO kp_menu VALUES("29","Sales","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("30","Daily Sales","../reports/day_report.php","3","2","29","-","0","1","2","");
INSERT INTO kp_menu VALUES("31","Filtered Sales","../reports/sales_select.php","3","2","29","-","0","1","2","");
INSERT INTO kp_menu VALUES("32","Products","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("33","Products list","../reports/prods_list.php","3","2","32","-","0","1","2","");
INSERT INTO kp_menu VALUES("34","Product Sale Summary","../reports/item_select.php","3","2","32","-","0","1","2","");
INSERT INTO kp_menu VALUES("35","Credit Aging Report","../reports/credit_aging.php","3","1","29","-","0","1","2","");
INSERT INTO kp_menu VALUES("36","Customers","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("37","Customer List","../reports/cust_list.php","3","2","36","-","0","1","2","");
INSERT INTO kp_menu VALUES("38","Customer Statement","../reports/cust_select.php","3","2","36","-","0","1","2","");
INSERT INTO kp_menu VALUES("39","Customer Credit Statement","../reports/cust_cred_select.php","3","2","36","-","0","1","2","");
INSERT INTO kp_menu VALUES("40","Finance","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("41","Petty Cash","#","3","1","40","-","0","1","2","");
INSERT INTO kp_menu VALUES("42","Petty Cash List","../reports/petty_select.php","4","2","41","-","0","1","2","");
INSERT INTO kp_menu VALUES("43","Bills","#","3","1","40","-","0","1","2","");
INSERT INTO kp_menu VALUES("44","Bills List","../reports/bill_select.php","4","2","43","-","0","1","2","");
INSERT INTO kp_menu VALUES("45","Purchases","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("46","Vendor Purchases ","../reports/sup_select.php","3","2","45","-","0","1","2","");
INSERT INTO kp_menu VALUES("47","Users","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("48","Active Users","../reports/active_users.php","3","2","47","-","0","1","2","");
INSERT INTO kp_menu VALUES("49","Logged In Users","../reports/logged_users.php","3","2","47","-","0","1","2","");
INSERT INTO kp_menu VALUES("50","Customer List","../customer/customers.php","2","2","2","-","0","1","2","");
INSERT INTO kp_menu VALUES("51","Archived Customers","../customer/arch_customers.php","2","2","2","-","0","1","2","");
INSERT INTO kp_menu VALUES("52","Cash Drawer","#","2","1","28","-","0","1","2","");
INSERT INTO kp_menu VALUES("53","Daily Cash Box","../reports/daily_cashbox.php","3","2","52","-","0","1","2","");
INSERT INTO kp_menu VALUES("55","Payments","#","2","1","24","-","0","1","2","");
INSERT INTO kp_menu VALUES("56","Supplier Payment","../payment/sup_pay.php","3","2","55","-","0","1","2","");
INSERT INTO kp_menu VALUES("57","Stock Track","../reports/stock_track.php","3","2","32","-","0","1","2","");





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

INSERT INTO kp_note VALUES("1","135","1","2","820.00","820.00","0.00","C","2021-04-23","2021-04-23 00:47:40");





CREATE TABLE `kp_note_id` (
  `note_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_note_id VALUES("1");





CREATE TABLE `kp_note_items` (
  `note_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_pay_id` (
  `pay_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_pay_id VALUES("510");





CREATE TABLE `kp_pay_mode` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) NOT NULL,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `btn_color` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `has_ref` int(11) NOT NULL,
  `has_change` int(11) NOT NULL DEFAULT '2',
  `created_by` int(11) NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` int(11) NOT NULL DEFAULT '2',
  `gate` int(11) NOT NULL DEFAULT '2',
  `tabl` varchar(55) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_pay_mode VALUES("1","1","CASH","#630000","2","1","2","2021-03-22 13:38:06","2","2","");
INSERT INTO kp_pay_mode VALUES("2","2","MPESA","#295218","1","2","2","2021-03-22 13:38:21","2","1","split_message");





CREATE TABLE `kp_petty` (
  `petty_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`petty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_petty_id` (
  `petty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_petty_reprint` (
  `petty_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_by` int(11) NOT NULL,
  `reprint_date` date NOT NULL,
  `datime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_po` (
  `po_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `ord_user` int(11) NOT NULL,
  `ord_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `disc` decimal(10,2) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_perc` int(11) NOT NULL,
  `vatable` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '2',
  `rec_staff` int(11) NOT NULL,
  `rec_date` date NOT NULL,
  `stock_status` int(11) NOT NULL DEFAULT '2',
  `grn_status` int(11) NOT NULL DEFAULT '2',
  `convert_currency` int(11) NOT NULL,
  `currency` varchar(11) NOT NULL,
  `convert_rate` decimal(10,2) NOT NULL,
  `converted_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_po VALUES("2","0","3","2","2021-03-28","43930.00","0.00","0","0","0.00","0.00","1","2","2021-03-28","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("3","0","1","2","2021-03-28","990.00","0.00","1","16","853.45","136.55","1","2","2021-03-28","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("5","0","4","2","2021-04-03","14400.00","0.00","0","0","0.00","0.00","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("8","0","5","2","2021-04-03","30400.00","0.00","0","0","0.00","0.00","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("10","0","6","2","2021-04-05","27930.00","0.00","0","0","0.00","0.00","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("11","0","7","2","2021-04-05","15150.00","0.00","1","16","13060.34","2089.66","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("12","0","3","2","2021-04-08","29795.00","0.00","1","16","25685.34","4109.66","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("13","0","8","2","2021-04-09","20200.00","0.00","0","0","0.00","0.00","1","2","2021-04-22","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("14","0","9","2","2021-04-09","5000.00","0.00","0","0","0.00","0.00","1","2","2021-04-22","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("16","0","5","2","2021-04-13","19600.00","0.00","0","0","0.00","0.00","1","2","2021-04-13","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("17","0","1","2","2021-04-22","58530.00","0.00","1","16","50456.90","8073.10","1","2","2021-04-22","1","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("18","0","5","2","2021-04-22","37225.00","0.00","1","16","32090.52","5134.48","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("19","0","6","2","2021-04-25","500.00","0.00","1","16","431.03","68.97","2","0","0000-00-00","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("20","0","12","2","2021-05-11","255.00","0.00","0","0","0.00","0.00","1","2","2021-05-11","2","2","0","","0.00","0.00");
INSERT INTO kp_po VALUES("21","0","1","2","2021-06-10","2000.00","0.00","1","16","1724.14","275.86","1","2","2021-06-10","1","2","0","","0.00","0.00");





CREATE TABLE `kp_po_id` (
  `po_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_po_id VALUES("21");





CREATE TABLE `kp_po_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `tax` decimal(10,2) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

INSERT INTO kp_po_items VALUES("1","0","2","150","0","10.00","2340.00","5.00","23350.00","1","10.00","2340.00","23400.00","2","1","1","0000-00-00","2021-04-22 09:45:34","3736.00","1","0");
INSERT INTO kp_po_items VALUES("2","0","2","18","0","6.00","3430.00","0.00","20580.00","1","6.00","3430.00","20580.00","2","1","1","0000-00-00","2021-04-22 09:45:34","3292.80","1","0");
INSERT INTO kp_po_items VALUES("3","0","3","1","0","1.00","990.00","0.00","990.00","1","1.00","990.00","990.00","2","1","1","0000-00-00","2021-04-22 09:45:34","136.55","1","1");
INSERT INTO kp_po_items VALUES("4","0","4","233","0","5.00","2380.00","0.00","11900.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("5","0","4","8","0","5.00","1495.00","0.00","7475.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("6","0","4","229","0","5.00","1720.00","0.00","8600.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("7","0","4","234","0","6.00","2330.00","0.00","13980.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("8","0","4","76","0","2.00","2700.00","0.00","5400.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("9","0","4","211","0","2.00","2710.00","0.00","5420.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("10","0","4","141","0","2.00","4640.00","0.00","9280.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("11","0","4","10","0","4.00","1530.00","0.00","6120.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("12","0","4","144","0","7.00","780.00","0.00","5460.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("13","0","4","154","0","6.00","1380.00","0.00","8280.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("14","0","4","26","0","2.00","780.00","0.00","1560.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("15","0","4","166","0","6.00","520.00","0.00","3120.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("16","0","4","188","0","2.00","1050.00","0.00","2100.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("17","0","4","146","0","5.00","230.00","0.00","1150.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("18","0","4","226","0","4.00","1180.00","0.00","4720.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("19","0","5","14","0","10.00","1440.00","0.00","14400.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","2","0");
INSERT INTO kp_po_items VALUES("20","0","6","68","0","5.00","1090.00","0.00","5450.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("21","0","6","47","0","3.00","1490.00","0.00","4470.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("22","0","6","200","0","1.00","1600.00","0.00","1600.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("23","0","6","62","0","5.00","880.00","0.00","4400.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("24","0","8","179","0","32.00","950.00","0.00","30400.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","4864.00","1","0");
INSERT INTO kp_po_items VALUES("25","0","9","77","0","4.00","2700.00","0.00","10800.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("26","0","9","188","0","4.00","1040.00","0.00","4160.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("27","0","9","81","0","1.00","1950.00","0.00","1950.00","2","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","0");
INSERT INTO kp_po_items VALUES("28","0","10","242","0","19.00","1470.00","0.00","27930.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","2","0");
INSERT INTO kp_po_items VALUES("29","0","11","157","0","3.00","730.00","0.00","2190.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","302.07","1","1");
INSERT INTO kp_po_items VALUES("30","0","11","244","0","3.00","800.00","0.00","2400.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","331.03","1","1");
INSERT INTO kp_po_items VALUES("31","0","11","245","0","3.00","820.00","0.00","2460.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","339.31","1","1");
INSERT INTO kp_po_items VALUES("32","0","11","159","0","2.00","820.00","0.00","1640.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","226.21","1","1");
INSERT INTO kp_po_items VALUES("33","0","11","246","0","6.00","320.00","0.00","1920.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","264.83","1","1");
INSERT INTO kp_po_items VALUES("34","0","11","247","0","6.00","320.00","0.00","1920.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","264.83","1","1");
INSERT INTO kp_po_items VALUES("35","0","11","248","0","3.00","340.00","0.00","1020.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","140.69","1","1");
INSERT INTO kp_po_items VALUES("36","0","11","249","0","2.00","800.00","0.00","1600.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","220.69","1","1");
INSERT INTO kp_po_items VALUES("37","0","12","234","0","10.00","2330.00","0.00","23300.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","3213.79","1","1");
INSERT INTO kp_po_items VALUES("38","0","12","186","0","2.00","1030.00","0.00","2060.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","0.00","0","1");
INSERT INTO kp_po_items VALUES("39","0","12","255","0","5.00","475.00","0.00","2375.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","327.59","1","1");
INSERT INTO kp_po_items VALUES("40","0","12","187","0","2.00","1030.00","0.00","2060.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-22 09:45:34","284.14","1","1");
INSERT INTO kp_po_items VALUES("41","0","13","268","0","10.00","1500.00","0.00","15000.00","1","10.00","1500.00","15000.00","2","1","1","0000-00-00","2021-04-22 09:45:34","0.00","2","0");
INSERT INTO kp_po_items VALUES("42","0","13","265","0","5.00","1040.00","0.00","5200.00","1","5.00","1040.00","5200.00","2","1","1","0000-00-00","2021-04-22 09:45:34","0.00","2","0");
INSERT INTO kp_po_items VALUES("43","0","14","269","0","40.00","125.00","0.00","5000.00","1","40.00","125.00","5000.00","2","1","1","0000-00-00","2021-04-22 09:45:34","800.00","1","0");
INSERT INTO kp_po_items VALUES("44","0","16","179","0","20.00","980.00","0.00","19600.00","1","20.00","980.00","19600.00","2","1","1","0000-00-00","2021-04-22 09:45:34","3136.00","1","0");
INSERT INTO kp_po_items VALUES("45","0","17","2","0","45.00","1234.00","0.00","55530.00","1","45.00","1234.00","55530.00","2","1","1","0000-00-00","2021-04-22 09:45:34","0.00","1","0");
INSERT INTO kp_po_items VALUES("46","0","17","9","0","5.00","600.00","0.00","3000.00","1","5.00","600.00","3000.00","2","1","1","0000-00-00","2021-04-22 09:45:34","0.00","2","0");
INSERT INTO kp_po_items VALUES("47","0","18","2","1","5.00","545.00","0.00","2725.00","1","8.00","2350.00","7050.00","2","1","1","0000-00-00","2021-04-22 09:51:12","0.00","0","0");
INSERT INTO kp_po_items VALUES("49","0","18","2","15","2.00","5000.00","0.00","10000.00","1","8.00","2350.00","7050.00","2","2","2","0000-00-00","2021-04-22 10:03:48","0.00","0","0");
INSERT INTO kp_po_items VALUES("50","0","18","281","0","5.00","2350.00","0.00","11750.00","1","5.00","2350.00","7050.00","2","1","1","0000-00-00","2021-04-22 23:24:55","0.00","0","0");
INSERT INTO kp_po_items VALUES("51","0","18","5","0","5.00","2350.00","0.00","11750.00","1","5.00","2350.00","11750.00","2","1","1","0000-00-00","2021-04-22 23:26:05","0.00","0","0");
INSERT INTO kp_po_items VALUES("52","0","18","6","0","5.00","100.00","0.00","500.00","1","5.00","100.00","300.00","2","1","1","0000-00-00","2021-04-22 23:26:57","0.00","0","0");
INSERT INTO kp_po_items VALUES("53","0","18","8","0","5.00","100.00","0.00","500.00","1","5.00","100.00","500.00","2","1","1","0000-00-00","2021-04-22 23:27:13","0.00","0","0");
INSERT INTO kp_po_items VALUES("54","0","19","1","0","5.00","100.00","0.00","500.00","1","0.00","0.00","0.00","0","2","2","0000-00-00","2021-04-25 10:21:46","0.00","0","0");
INSERT INTO kp_po_items VALUES("55","0","20","1","0","5.00","51.00","0.00","255.00","1","5.00","51.00","255.00","2","1","2","0000-00-00","2021-05-11 12:57:36","0.00","0","0");
INSERT INTO kp_po_items VALUES("56","0","21","1","0","4.00","500.00","0.00","2000.00","1","4.00","500.00","2000.00","2","1","1","0000-00-00","2021-06-10 20:45:30","0.00","0","0");





CREATE TABLE `kp_po_status` (
  `po_id` int(11) NOT NULL,
  `po_user_id` int(11) NOT NULL,
  `po_status` int(11) NOT NULL DEFAULT '2',
  `sale_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_qt` (
  `qt_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UOM` decimal(10,2) NOT NULL,
  PRIMARY KEY (`qt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_qt_id` (
  `qt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_qt_items` (
  `qt_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_qt_status` (
  `qt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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

INSERT INTO kp_qty_hist VALUES("1","2","999","5","0","0"," testing","0","2021-04-22 23:15:32");
INSERT INTO kp_qty_hist VALUES("2","2","0","0","0","5"," tt","0","2021-04-22 23:15:48");
INSERT INTO kp_qty_hist VALUES("2","2","0","5","0","0"," tt","0","2021-04-22 23:15:57");
INSERT INTO kp_qty_hist VALUES("1","2","2","2","0","0"," tt","0","2021-04-25 11:12:48");





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
  `shop_id` int(11) NOT NULL,
  UNIQUE KEY `req_id` (`req_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_req VALUES("1","0","566","2","2021-04-13","2","0","0000-00-00","2021-04-13 13:04:44","0","2","0000-00-00","2021-04-13 13:04:44","2","2","3","0");
INSERT INTO kp_req VALUES("2","0","568","2","2021-04-13","2","0","0000-00-00","2021-04-13 13:15:39","0","2","0000-00-00","2021-04-13 13:15:39","2","2","3","0");
INSERT INTO kp_req VALUES("3","0","571","2","2021-04-13","2","0","0000-00-00","2021-04-13 13:29:14","0","2","0000-00-00","2021-04-13 13:29:14","2","2","3","0");
INSERT INTO kp_req VALUES("4","0","574","2","2021-04-13","2","0","0000-00-00","2021-04-13 14:42:14","0","2","0000-00-00","2021-04-13 14:42:14","2","2","3","0");
INSERT INTO kp_req VALUES("5","0","575","2","2021-04-22","2","0","0000-00-00","2021-04-22 22:58:47","0","2","0000-00-00","2021-04-22 22:58:47","2","2","3","0");
INSERT INTO kp_req VALUES("6","0","579","2","2021-04-25","2","0","0000-00-00","2021-04-25 10:29:17","0","2","0000-00-00","2021-04-25 10:29:17","2","2","3","0");
INSERT INTO kp_req VALUES("7","0","581","2","2021-04-25","2","0","0000-00-00","2021-04-25 13:19:10","0","2","0000-00-00","2021-04-25 13:19:10","2","2","3","0");
INSERT INTO kp_req VALUES("8","0","582","2","2021-05-11","2","0","0000-00-00","2021-05-11 12:49:37","0","2","0000-00-00","2021-05-11 12:49:37","2","2","3","0");
INSERT INTO kp_req VALUES("9","0","585","2","2021-05-22","2","0","0000-00-00","2021-05-22 14:16:11","0","2","0000-00-00","2021-05-22 14:16:11","2","2","3","0");
INSERT INTO kp_req VALUES("10","0","587","2","2021-05-22","2","0","0000-00-00","2021-05-22 14:35:20","0","2","0000-00-00","2021-05-22 14:35:20","2","2","3","0");
INSERT INTO kp_req VALUES("11","0","588","2","2021-06-09","2","0","0000-00-00","2021-06-09 16:10:21","0","2","0000-00-00","2021-06-09 16:10:21","2","2","3","0");
INSERT INTO kp_req VALUES("12","0","578","2","2021-06-10","2","0","0000-00-00","2021-06-10 13:10:48","0","2","0000-00-00","2021-06-10 13:10:48","2","2","3","0");





CREATE TABLE `kp_req_id` (
  `req_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_req_id VALUES("12");





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

INSERT INTO kp_req_items VALUES("1","","268","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("1","","246","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("2","","253","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("3","","165","10","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","38","3","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","62","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","68","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","178","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","75","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","121","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","134","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","201","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("4","","236","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("5","","5","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("6","","8","5","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("7","","3","9","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("8","","6","2","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("9","","2","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("10","","2","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("11","","3","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");
INSERT INTO kp_req_items VALUES("12","","92","1","2","0.00","0","0000-00-00 00:00:00","2","0","0","2","2","2","0000-00-00");





CREATE TABLE `kp_req_status` (
  `req_id` int(11) NOT NULL,
  `req_user_id` int(11) NOT NULL,
  `req_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






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

INSERT INTO kp_ret VALUES("1","135","2","2021-04-23","820.00","2021-04-23 00:47:40","2","2","1","test","2","","","","1","0");





CREATE TABLE `kp_ret_id` (
  `ret_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_ret_id VALUES("2");





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

INSERT INTO kp_ret_items VALUES("1","135","144","1.00","820.00","820.00","1","1","ttttt","1","2021-04-23 00:47:17","2","2021-04-23","0000-00-00 00:00:00","test","1","2","");
INSERT INTO kp_ret_items VALUES("2","589","4","1.00","2000.00","2000.00","2","1","testing","1","2021-06-10 20:29:54","0","0000-00-00","0000-00-00 00:00:00","","0","2","");





CREATE TABLE `kp_ret_reprint` (
  `ret_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appr_by` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `kp_ret_status` (
  `ret_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_ret_status VALUES("2","589","2","1","2","2021-06-10 20:29:34");





CREATE TABLE `kp_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(85) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL,
  `access_panel` int(11) NOT NULL,
  `access_dash` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `front_perm` varchar(155) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sys_default` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_roles VALUES("1","SUPERADMIN","ALL RIGHTS","2020-08-13 21:43:24","0000-00-00 00:00:00","3","admin_dash.php","1, 2, 3, 4, 5, 6, 7","2");
INSERT INTO kp_roles VALUES("2","SALES","FOR SALES PERSONS","2020-08-13 21:43:24","0000-00-00 00:00:00","2","admin_dash.php","","2");
INSERT INTO kp_roles VALUES("3","SUPERVISOR","SUPERVISOR HANDLES BOTH BACKEND & SALES","2020-08-13 21:43:24","0000-00-00 00:00:00","3","admin_dash.php","1, 2, 3, 4, 5, 6, 7, 8","2");





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

INSERT INTO kp_sale_cred_pay_hist VALUES("469","577","","2","2","950.00","50.00","900.00","2021-04-23","2021-04-23 00:52:05");
INSERT INTO kp_sale_cred_pay_hist VALUES("470","577","","2","2","900.00","500.00","400.00","2021-04-23","2021-04-23 00:54:04");
INSERT INTO kp_sale_cred_pay_hist VALUES("471","577","","2","2","400.00","100.00","300.00","2021-04-23","2021-04-23 01:07:15");
INSERT INTO kp_sale_cred_pay_hist VALUES("476","586","","2","3","700.00","500.00","200.00","2021-05-22","2021-05-22 14:28:54");
INSERT INTO kp_sale_cred_pay_hist VALUES("498","577","","2","2","300.00","150.00","150.00","2021-06-10","2021-06-10 16:07:31");
INSERT INTO kp_sale_cred_pay_hist VALUES("499","577","","2","2","150.00","150.00","0.00","2021-06-10","2021-06-10 16:08:18");
INSERT INTO kp_sale_cred_pay_hist VALUES("507","586","","2","3","200.00","200.00","0.00","2021-06-10","2021-06-10 17:02:24");
INSERT INTO kp_sale_cred_pay_hist VALUES("508","600","","2","2","800.00","600.00","200.00","2021-06-10","2021-06-10 17:10:15");





CREATE TABLE `kp_sale_id` (
  `sale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_sale_id VALUES("605");





CREATE TABLE `kp_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=latin1;

INSERT INTO kp_sale_items VALUES("1","1","16","0","0.50","1550.00","0.00","775.00","2021-03-22","2","0.00","775.00","0.00","0.00","2","1","2021-03-22 13:35:56");
INSERT INTO kp_sale_items VALUES("2","2","3","0","1.00","4670.00","0.00","4670.00","2021-03-28","2","0.00","4670.00","0.00","644.14","1","1","2021-03-28 09:43:11");
INSERT INTO kp_sale_items VALUES("3","3","18","0","1.00","3550.00","0.00","3550.00","2021-03-28","2","0.00","3550.00","0.00","489.66","1","1","2021-03-28 09:52:18");
INSERT INTO kp_sale_items VALUES("4","4","145","0","2.00","3570.00","0.00","7140.00","2021-03-28","2","3410.00","320.00","0.00","984.83","1","1","2021-03-28 09:55:10");
INSERT INTO kp_sale_items VALUES("5","5","1","0","1.00","995.00","0.00","995.00","2021-03-28","2","950.00","45.00","0.00","137.24","1","1","2021-03-28 10:00:30");
INSERT INTO kp_sale_items VALUES("6","6","32","0","1.00","250.00","0.00","250.00","2021-03-28","2","230.00","20.00","0.00","34.48","1","1","2021-03-28 10:01:18");
INSERT INTO kp_sale_items VALUES("7","8","1","0","1.00","1000.00","0.00","1000.00","0000-00-00","2","950.00","50.00","0.00","137.93","1","1","2021-03-28 11:20:58");
INSERT INTO kp_sale_items VALUES("8","10","153","0","6.00","1450.00","0.00","8700.00","2021-03-29","2","1390.00","360.00","0.00","1200.00","1","1","2021-03-29 11:00:00");
INSERT INTO kp_sale_items VALUES("9","13","78","0","1.00","1080.00","0.00","1080.00","2021-03-29","2","0.00","1080.00","0.00","148.97","1","1","2021-03-29 11:39:24");
INSERT INTO kp_sale_items VALUES("10","14","68","0","1.00","1150.00","0.00","1150.00","2021-03-29","2","0.00","1150.00","0.00","158.62","1","1","2021-03-29 11:41:04");
INSERT INTO kp_sale_items VALUES("11","16","163","0","1.00","55.00","0.00","55.00","2021-03-29","2","0.00","55.00","0.00","7.59","1","1","2021-03-29 11:45:34");
INSERT INTO kp_sale_items VALUES("12","18","33","0","1.00","250.00","0.00","250.00","2021-03-29","2","230.00","20.00","0.00","34.48","1","1","2021-03-29 12:09:38");
INSERT INTO kp_sale_items VALUES("13","19","47","0","1.00","130.00","0.00","130.00","2021-03-29","2","0.00","130.00","0.00","17.93","1","1","2021-03-29 12:11:51");
INSERT INTO kp_sale_items VALUES("14","20","140","0","1.00","2150.00","0.00","2150.00","2021-03-29","2","2010.00","140.00","0.00","0.00","2","1","2021-03-29 12:12:29");
INSERT INTO kp_sale_items VALUES("15","22","164","0","1.00","50.00","0.00","50.00","2021-03-29","2","39.00","11.00","0.00","6.90","1","1","2021-03-29 12:15:45");
INSERT INTO kp_sale_items VALUES("16","24","165","0","1.00","100.00","0.00","100.00","2021-03-29","2","92.80","7.20","0.00","13.79","1","1","2021-03-29 12:18:43");
INSERT INTO kp_sale_items VALUES("17","25","162","0","1.00","360.00","0.00","360.00","2021-03-29","2","320.00","40.00","0.00","49.66","1","1","2021-03-29 12:27:17");
INSERT INTO kp_sale_items VALUES("18","25","160","0","1.00","360.00","0.00","360.00","2021-03-29","2","320.00","40.00","0.00","49.66","1","1","2021-03-29 12:27:26");
INSERT INTO kp_sale_items VALUES("19","26","96","0","6.00","46.00","0.00","276.00","2021-03-29","2","0.00","276.00","0.00","0.00","0","1","2021-03-29 12:32:11");
INSERT INTO kp_sale_items VALUES("20","26","80","0","1.00","105.00","0.00","105.00","2021-03-29","2","0.00","105.00","0.00","14.48","1","1","2021-03-29 12:32:23");
INSERT INTO kp_sale_items VALUES("21","26","47","0","1.00","130.00","0.00","130.00","2021-03-29","2","0.00","130.00","0.00","17.93","1","1","2021-03-29 12:32:49");
INSERT INTO kp_sale_items VALUES("22","26","166","0","1.00","55.00","0.00","55.00","2021-03-29","2","0.00","55.00","0.00","7.59","1","1","2021-03-29 12:34:35");
INSERT INTO kp_sale_items VALUES("23","29","167","0","1.00","90.00","0.00","90.00","2021-03-29","2","0.00","90.00","0.00","12.41","1","1","2021-03-29 12:39:06");
INSERT INTO kp_sale_items VALUES("24","31","168","0","1.00","50.00","0.00","50.00","2021-03-29","2","0.00","50.00","0.00","6.90","1","1","2021-03-29 12:40:58");
INSERT INTO kp_sale_items VALUES("25","32","165","0","6.00","100.00","0.00","600.00","2021-03-29","2","92.80","43.20","0.00","82.76","1","1","2021-03-29 12:50:28");
INSERT INTO kp_sale_items VALUES("26","32","169","0","1.00","70.00","0.00","70.00","2021-03-29","2","0.00","70.00","0.00","9.66","1","1","2021-03-29 12:52:53");
INSERT INTO kp_sale_items VALUES("27","36","170","0","2.00","180.00","0.00","360.00","2021-03-29","2","171.50","17.00","0.00","49.66","1","1","2021-03-29 13:25:33");
INSERT INTO kp_sale_items VALUES("28","39","171","0","1.00","110.00","0.00","110.00","2021-03-29","2","93.50","16.50","0.00","15.17","1","1","2021-03-29 14:06:41");
INSERT INTO kp_sale_items VALUES("29","39","173","0","1.00","60.00","0.00","60.00","2021-03-29","2","47.00","13.00","0.00","8.28","1","1","2021-03-29 14:06:51");
INSERT INTO kp_sale_items VALUES("30","39","172","0","1.00","25.00","0.00","25.00","2021-03-29","2","0.00","25.00","0.00","3.45","1","1","2021-03-29 14:07:02");
INSERT INTO kp_sale_items VALUES("31","41","157","0","5.00","45.00","0.00","225.00","2021-03-29","2","30.42","72.90","0.00","31.03","1","1","2021-03-29 14:45:16");
INSERT INTO kp_sale_items VALUES("32","12","77","0","2.00","115.00","0.00","230.00","2021-03-29","2","0.00","230.00","0.00","31.72","1","1","2021-03-29 14:59:25");
INSERT INTO kp_sale_items VALUES("33","12","175","0","1.00","125.00","0.00","125.00","2021-03-29","2","0.00","125.00","0.00","17.24","1","1","2021-03-29 14:59:34");
INSERT INTO kp_sale_items VALUES("34","12","65","0","1.00","135.00","0.00","135.00","2021-03-29","2","0.00","135.00","0.00","18.62","1","1","2021-03-29 14:59:45");
INSERT INTO kp_sale_items VALUES("35","45","174","0","1.00","125.00","0.00","125.00","2021-03-29","2","112.50","12.50","0.00","0.00","0","1","2021-03-29 15:00:21");
INSERT INTO kp_sale_items VALUES("36","47","179","0","2.00","1000.00","0.00","2000.00","2021-03-29","2","950.00","100.00","0.00","275.86","1","1","2021-03-29 15:37:29");
INSERT INTO kp_sale_items VALUES("37","50","165","0","25.00","95.00","0.00","2375.00","2021-03-29","2","92.80","55.00","0.00","327.59","1","1","2021-03-29 15:48:02");
INSERT INTO kp_sale_items VALUES("38","54","23","0","1.00","200.00","0.00","200.00","2021-03-29","2","190.00","10.00","0.00","27.59","1","1","2021-03-29 15:59:04");
INSERT INTO kp_sale_items VALUES("39","55","192","0","12.00","43.33","0.00","520.00","2021-03-29","2","40.42","34.96","0.00","0.00","2","1","2021-03-29 16:02:15");
INSERT INTO kp_sale_items VALUES("40","55","166","0","1.00","55.00","0.00","55.00","2021-03-29","2","0.00","55.00","0.00","7.59","1","1","2021-03-29 16:02:25");
INSERT INTO kp_sale_items VALUES("41","55","160","0","1.00","360.00","0.00","360.00","2021-03-29","2","320.00","40.00","0.00","49.66","1","1","2021-03-29 16:02:51");
INSERT INTO kp_sale_items VALUES("42","55","37","0","1.00","75.00","0.00","75.00","2021-03-29","2","0.00","75.00","0.00","10.34","1","1","2021-03-29 16:03:02");
INSERT INTO kp_sale_items VALUES("43","55","193","0","1.00","90.00","0.00","90.00","2021-03-29","2","0.00","90.00","0.00","0.00","2","1","2021-03-29 16:04:13");
INSERT INTO kp_sale_items VALUES("44","55","165","0","3.00","100.00","0.00","300.00","2021-03-29","2","92.80","21.60","0.00","41.38","1","1","2021-03-29 16:04:48");
INSERT INTO kp_sale_items VALUES("45","57","196","0","1.00","550.00","0.00","550.00","2021-03-29","2","0.00","550.00","0.00","75.86","1","1","2021-03-29 17:22:44");
INSERT INTO kp_sale_items VALUES("46","57","65","0","2.00","135.00","0.00","270.00","2021-03-29","2","0.00","270.00","0.00","37.24","1","1","2021-03-29 17:23:04");
INSERT INTO kp_sale_items VALUES("47","57","165","0","2.00","100.00","0.00","200.00","2021-03-29","2","92.80","14.40","0.00","27.59","1","1","2021-03-29 17:23:19");
INSERT INTO kp_sale_items VALUES("48","57","182","0","4.00","130.00","0.00","520.00","2021-03-29","2","120.00","40.00","0.00","0.00","2","1","2021-03-29 17:26:52");
INSERT INTO kp_sale_items VALUES("49","58","169","0","1.00","250.00","0.00","250.00","0000-00-00","2","0.00","250.00","0.00","34.48","1","1","2021-03-29 17:32:18");
INSERT INTO kp_sale_items VALUES("50","59","170","0","1.00","190.00","0.00","190.00","2021-03-29","2","171.50","18.50","0.00","26.21","1","1","2021-03-29 17:33:02");
INSERT INTO kp_sale_items VALUES("51","61","197","0","1.00","380.00","0.00","380.00","2021-03-29","2","0.00","380.00","0.00","52.41","1","1","2021-03-29 17:53:29");
INSERT INTO kp_sale_items VALUES("52","62","10","0","2.00","1570.00","0.00","3140.00","2021-03-29","2","0.00","3140.00","0.00","0.00","2","1","2021-03-29 18:01:03");
INSERT INTO kp_sale_items VALUES("53","63","152","0","1.00","1770.00","0.00","1770.00","2021-03-29","2","1390.00","380.00","0.00","244.14","1","1","2021-03-29 18:16:03");
INSERT INTO kp_sale_items VALUES("54","64","179","0","1.00","1000.00","0.00","1000.00","2021-03-29","2","950.00","50.00","0.00","137.93","1","1","2021-03-29 18:19:33");
INSERT INTO kp_sale_items VALUES("55","64","32","0","1.00","250.00","0.00","250.00","2021-03-29","2","230.00","20.00","0.00","34.48","1","1","2021-03-29 18:20:18");
INSERT INTO kp_sale_items VALUES("56","64","38","0","1.00","70.00","0.00","70.00","2021-03-29","2","0.00","70.00","0.00","9.66","1","1","2021-03-29 18:20:43");
INSERT INTO kp_sale_items VALUES("57","64","29","0","1.00","180.00","0.00","180.00","2021-03-29","2","138.00","42.00","0.00","24.83","1","1","2021-03-29 18:20:56");
INSERT INTO kp_sale_items VALUES("58","64","168","0","1.00","50.00","0.00","50.00","2021-03-29","2","0.00","50.00","0.00","6.90","1","1","2021-03-29 18:24:43");
INSERT INTO kp_sale_items VALUES("59","64","199","0","1.00","75.00","0.00","75.00","2021-03-29","2","0.00","75.00","0.00","10.34","1","1","2021-03-29 18:25:46");
INSERT INTO kp_sale_items VALUES("60","64","76","0","6.00","115.00","0.00","690.00","2021-03-29","2","0.00","690.00","0.00","95.17","1","1","2021-03-29 18:29:35");
INSERT INTO kp_sale_items VALUES("61","64","186","0","6.00","24.00","0.00","144.00","2021-03-29","2","0.00","144.00","0.00","0.00","0","1","2021-03-29 18:29:54");
INSERT INTO kp_sale_items VALUES("62","64","174","0","1.00","125.00","0.00","125.00","2021-03-29","2","112.50","12.50","0.00","0.00","0","1","2021-03-29 18:30:43");
INSERT INTO kp_sale_items VALUES("63","64","201","0","1.00","155.00","0.00","155.00","2021-03-29","2","0.00","155.00","0.00","21.38","1","1","2021-03-29 18:32:10");
INSERT INTO kp_sale_items VALUES("64","64","200","0","1.00","125.00","0.00","125.00","2021-03-29","2","0.00","125.00","0.00","17.24","1","1","2021-03-29 18:32:20");
INSERT INTO kp_sale_items VALUES("65","64","33","0","2.00","250.00","0.00","500.00","2021-03-29","2","230.00","40.00","0.00","68.97","1","1","2021-03-29 18:32:55");
INSERT INTO kp_sale_items VALUES("66","64","23","0","1.00","200.00","0.00","200.00","2021-03-29","2","190.00","10.00","0.00","27.59","1","1","2021-03-29 18:34:07");
INSERT INTO kp_sale_items VALUES("67","65","139","0","1.00","225.00","0.00","225.00","2021-03-29","2","0.00","225.00","0.00","0.00","3","1","2021-03-29 18:36:05");
INSERT INTO kp_sale_items VALUES("68","66","18","0","1.00","3550.00","0.00","3550.00","2021-03-29","2","0.00","3550.00","0.00","489.66","1","1","2021-03-29 18:43:56");
INSERT INTO kp_sale_items VALUES("69","67","171","0","1.00","110.00","0.00","110.00","2021-03-29","2","93.50","16.50","0.00","15.17","1","1","2021-03-29 18:50:34");
INSERT INTO kp_sale_items VALUES("70","68","159","0","1.00","250.00","0.00","250.00","2021-03-29","2","205.00","45.00","0.00","34.48","1","1","2021-03-29 18:53:14");
INSERT INTO kp_sale_items VALUES("71","69","178","0","2.00","90.00","0.00","180.00","2021-03-29","2","82.33","15.34","0.00","24.83","1","1","2021-03-29 18:55:44");
INSERT INTO kp_sale_items VALUES("72","70","182","0","1.00","135.00","0.00","135.00","2021-03-29","2","120.00","15.00","0.00","0.00","2","1","2021-03-29 19:01:50");
INSERT INTO kp_sale_items VALUES("73","71","18","0","1.00","3570.00","0.00","3570.00","2021-03-29","2","0.00","3570.00","0.00","492.41","1","1","2021-03-29 19:02:25");
INSERT INTO kp_sale_items VALUES("74","75","14","0","0.50","1490.00","0.00","745.00","2021-03-30","2","1440.00","25.00","0.00","0.00","2","1","2021-03-30 11:39:27");
INSERT INTO kp_sale_items VALUES("75","75","164","0","10.00","41.00","0.00","410.00","2021-03-30","2","39.00","20.00","0.00","56.55","1","1","2021-03-30 11:41:30");
INSERT INTO kp_sale_items VALUES("76","75","37","0","1.00","70.00","0.00","70.00","2021-03-30","2","0.00","70.00","0.00","9.66","1","1","2021-03-30 11:43:32");
INSERT INTO kp_sale_items VALUES("77","75","62","0","1.00","110.00","0.00","110.00","2021-03-30","2","0.00","110.00","0.00","15.17","1","1","2021-03-30 11:43:48");
INSERT INTO kp_sale_items VALUES("78","75","167","0","1.00","90.00","0.00","90.00","2021-03-30","2","0.00","90.00","0.00","12.41","1","1","2021-03-30 11:44:12");
INSERT INTO kp_sale_items VALUES("79","75","176","0","1.00","105.00","0.00","105.00","2021-03-30","2","0.00","105.00","0.00","14.48","1","1","2021-03-30 11:45:28");
INSERT INTO kp_sale_items VALUES("80","76","20","0","6.00","1470.00","0.00","8820.00","0000-00-00","2","0.00","8820.00","0.00","1216.55","1","1","2021-03-30 12:46:29");
INSERT INTO kp_sale_items VALUES("81","77","165","0","13.00","95.38","0.00","1240.00","2021-03-30","2","92.80","33.60","0.00","171.03","1","1","2021-03-30 13:08:59");
INSERT INTO kp_sale_items VALUES("82","78","171","0","1.00","110.00","0.00","110.00","2021-03-30","2","93.50","16.50","0.00","15.17","1","1","2021-03-30 13:10:13");
INSERT INTO kp_sale_items VALUES("83","79","176","0","1.00","105.00","0.00","105.00","2021-03-30","2","0.00","105.00","0.00","14.48","1","1","2021-03-30 13:11:09");
INSERT INTO kp_sale_items VALUES("84","79","165","0","12.50","95.20","0.00","1190.00","2021-03-30","2","92.80","30.00","0.00","164.14","1","1","2021-03-30 13:11:49");
INSERT INTO kp_sale_items VALUES("85","79","203","0","2.00","55.00","0.00","110.00","2021-03-30","2","0.00","110.00","0.00","15.17","1","1","2021-03-30 13:13:34");
INSERT INTO kp_sale_items VALUES("86","80","164","0","10.00","41.00","0.00","410.00","2021-03-30","2","39.00","20.00","0.00","56.55","1","1","2021-03-30 13:14:37");
INSERT INTO kp_sale_items VALUES("87","80","193","0","1.00","90.00","0.00","90.00","2021-03-30","2","0.00","90.00","0.00","0.00","2","1","2021-03-30 13:14:50");
INSERT INTO kp_sale_items VALUES("88","81","153","0","1.00","1470.00","0.00","1470.00","2021-03-30","2","1390.00","80.00","0.00","202.76","1","1","2021-03-30 13:17:25");
INSERT INTO kp_sale_items VALUES("89","82","171","0","1.00","2470.00","0.00","2470.00","2021-03-30","2","93.50","2376.50","0.00","340.69","1","1","2021-03-30 14:24:20");
INSERT INTO kp_sale_items VALUES("90","83","165","0","1.00","100.00","0.00","100.00","2021-03-30","2","92.80","7.20","0.00","13.79","1","1","2021-03-30 14:27:13");
INSERT INTO kp_sale_items VALUES("91","83","5","0","2.00","100.00","0.00","200.00","2021-03-30","2","0.00","200.00","0.00","27.59","1","1","2021-03-30 14:29:18");
INSERT INTO kp_sale_items VALUES("92","83","180","0","1.00","100.00","0.00","100.00","2021-03-30","2","79.17","20.83","0.00","0.00","2","1","2021-03-30 14:30:10");
INSERT INTO kp_sale_items VALUES("93","83","193","0","1.00","100.00","0.00","100.00","2021-03-30","2","0.00","100.00","0.00","0.00","2","1","2021-03-30 14:31:06");
INSERT INTO kp_sale_items VALUES("94","84","23","0","1.00","200.00","0.00","200.00","2021-03-30","2","190.00","10.00","0.00","27.59","1","1","2021-03-30 14:46:19");
INSERT INTO kp_sale_items VALUES("95","85","182","0","3.00","130.00","0.00","390.00","2021-03-30","2","120.00","30.00","0.00","0.00","2","1","2021-03-30 15:44:44");
INSERT INTO kp_sale_items VALUES("96","86","5","0","1.00","100.00","0.00","100.00","2021-03-30","2","0.00","100.00","0.00","13.79","1","1","2021-03-30 16:06:49");
INSERT INTO kp_sale_items VALUES("97","87","37","0","1.00","75.00","0.00","75.00","2021-03-30","2","0.00","75.00","0.00","10.34","1","1","2021-03-30 16:34:29");
INSERT INTO kp_sale_items VALUES("98","88","182","0","2.00","130.00","0.00","260.00","2021-03-30","2","120.00","20.00","0.00","0.00","2","1","2021-03-30 16:53:27");
INSERT INTO kp_sale_items VALUES("99","88","196","0","5.00","110.00","0.00","550.00","2021-03-30","2","0.00","550.00","0.00","75.86","1","1","2021-03-30 16:55:04");
INSERT INTO kp_sale_items VALUES("100","90","5","0","2.00","110.00","0.00","220.00","2021-03-30","2","0.00","220.00","0.00","30.34","1","1","2021-03-30 17:05:02");
INSERT INTO kp_sale_items VALUES("101","90","186","0","1.00","25.00","0.00","25.00","2021-03-30","2","0.00","25.00","0.00","0.00","0","1","2021-03-30 17:05:37");
INSERT INTO kp_sale_items VALUES("102","91","170","0","1.00","180.00","0.00","180.00","2021-03-30","2","171.50","8.50","0.00","24.83","1","1","2021-03-30 17:15:57");
INSERT INTO kp_sale_items VALUES("103","92","165","0","1.00","100.00","0.00","100.00","2021-03-30","2","92.80","7.20","0.00","13.79","1","1","2021-03-30 17:20:33");
INSERT INTO kp_sale_items VALUES("104","92","137","0","1.00","35.00","0.00","35.00","2021-03-30","2","0.00","35.00","0.00","0.00","3","1","2021-03-30 17:21:30");
INSERT INTO kp_sale_items VALUES("105","93","165","0","0.50","100.00","0.00","50.00","2021-03-30","2","92.80","3.60","0.00","6.90","1","1","2021-03-30 17:23:32");
INSERT INTO kp_sale_items VALUES("106","94","173","0","1.00","60.00","0.00","60.00","2021-03-30","2","47.00","13.00","0.00","8.28","1","1","2021-03-30 17:50:23");
INSERT INTO kp_sale_items VALUES("107","97","165","0","25.00","95.20","0.00","2380.00","2021-03-30","2","92.80","60.00","0.00","328.28","1","1","2021-03-30 17:57:16");
INSERT INTO kp_sale_items VALUES("108","98","176","0","1.00","105.00","0.00","105.00","2021-03-30","2","0.00","105.00","0.00","14.48","1","1","2021-03-30 18:07:38");
INSERT INTO kp_sale_items VALUES("109","98","164","0","2.00","50.00","0.00","100.00","2021-03-30","2","39.00","22.00","0.00","13.79","1","1","2021-03-30 18:09:30");
INSERT INTO kp_sale_items VALUES("110","99","179","0","0.50","1000.00","0.00","500.00","2021-03-30","2","950.00","25.00","0.00","68.97","1","1","2021-03-30 18:11:19");
INSERT INTO kp_sale_items VALUES("111","100","68","0","2.00","105.00","0.00","210.00","2021-03-30","2","0.00","210.00","0.00","28.97","1","1","2021-03-30 18:26:11");
INSERT INTO kp_sale_items VALUES("112","101","170","0","0.50","180.00","0.00","90.00","2021-03-30","2","171.50","4.25","0.00","12.41","1","1","2021-03-30 18:41:42");
INSERT INTO kp_sale_items VALUES("113","102","62","0","1.00","105.00","0.00","105.00","2021-03-30","2","0.00","105.00","0.00","14.48","1","1","2021-03-30 18:48:58");
INSERT INTO kp_sale_items VALUES("114","102","68","0","1.00","105.00","0.00","105.00","2021-03-30","2","0.00","105.00","0.00","14.48","1","1","2021-03-30 18:49:20");
INSERT INTO kp_sale_items VALUES("115","102","75","0","1.00","110.00","0.00","110.00","2021-03-30","2","0.00","110.00","0.00","15.17","1","1","2021-03-30 18:49:47");
INSERT INTO kp_sale_items VALUES("116","103","139","0","1.00","225.00","0.00","225.00","2021-03-31","2","0.00","225.00","0.00","0.00","3","1","2021-03-31 08:03:07");
INSERT INTO kp_sale_items VALUES("117","106","205","0","4.00","50.00","0.00","200.00","2021-03-31","2","47.00","12.00","0.00","27.59","1","1","2021-03-31 08:19:49");
INSERT INTO kp_sale_items VALUES("118","107","141","0","1.00","4750.00","0.00","4750.00","2021-03-31","2","4670.00","80.00","0.00","655.17","1","1","2021-03-31 08:31:44");
INSERT INTO kp_sale_items VALUES("119","109","206","0","1.00","50.00","0.00","50.00","2021-03-31","2","0.00","50.00","0.00","6.90","1","1","2021-03-31 08:57:23");
INSERT INTO kp_sale_items VALUES("120","110","168","0","1.00","50.00","0.00","50.00","0000-00-00","2","0.00","50.00","0.00","6.90","1","1","2021-03-31 10:30:55");
INSERT INTO kp_sale_items VALUES("121","111","186","0","6.00","24.00","0.00","144.00","0000-00-00","2","0.00","144.00","0.00","0.00","0","1","2021-03-31 10:47:09");
INSERT INTO kp_sale_items VALUES("122","112","144","0","1.00","810.00","0.00","810.00","2021-03-31","2","780.00","30.00","0.00","111.72","1","1","2021-03-31 10:51:13");
INSERT INTO kp_sale_items VALUES("123","113","14","0","1.00","1480.00","0.00","1480.00","2021-03-31","2","1440.00","40.00","0.00","0.00","2","1","2021-03-31 11:43:20");
INSERT INTO kp_sale_items VALUES("124","114","138","0","1.00","580.00","0.00","580.00","0000-00-00","2","0.00","580.00","0.00","0.00","3","1","2021-03-31 15:07:06");
INSERT INTO kp_sale_items VALUES("125","115","28","0","1.00","600.00","0.00","600.00","0000-00-00","2","550.00","50.00","0.00","82.76","1","1","2021-03-31 16:01:26");
INSERT INTO kp_sale_items VALUES("126","116","180","0","2.00","200.00","0.00","400.00","2021-03-31","2","79.17","241.66","0.00","0.00","2","1","2021-03-31 16:05:33");
INSERT INTO kp_sale_items VALUES("127","118","23","0","1.00","200.00","0.00","200.00","2021-03-31","2","190.00","10.00","0.00","27.59","1","1","2021-03-31 17:21:33");
INSERT INTO kp_sale_items VALUES("128","120","84","0","1.00","135.00","0.00","135.00","2021-03-31","2","0.00","135.00","0.00","18.62","1","1","2021-03-31 17:41:22");
INSERT INTO kp_sale_items VALUES("129","122","23","0","1.00","200.00","0.00","200.00","2021-03-31","2","190.00","10.00","0.00","27.59","1","1","2021-03-31 17:48:09");
INSERT INTO kp_sale_items VALUES("130","123","23","0","1.00","200.00","0.00","200.00","2021-03-31","2","190.00","10.00","0.00","27.59","1","1","2021-03-31 18:02:17");
INSERT INTO kp_sale_items VALUES("131","123","211","0","1.00","145.00","0.00","145.00","2021-03-31","2","135.00","10.00","0.00","20.00","1","1","2021-03-31 18:05:59");
INSERT INTO kp_sale_items VALUES("132","123","65","0","1.00","135.00","0.00","135.00","2021-03-31","2","0.00","135.00","0.00","18.62","1","1","2021-03-31 18:06:13");
INSERT INTO kp_sale_items VALUES("133","123","173","0","1.00","120.00","0.00","120.00","2021-03-31","2","47.00","73.00","0.00","16.55","1","1","2021-03-31 18:06:28");
INSERT INTO kp_sale_items VALUES("134","124","169","0","1.00","70.00","0.00","70.00","2021-03-31","2","0.00","70.00","0.00","9.66","1","1","2021-03-31 18:07:08");
INSERT INTO kp_sale_items VALUES("135","125","187","0","6.00","24.00","0.00","144.00","2021-03-31","2","0.00","144.00","0.00","19.86","1","1","2021-03-31 18:07:56");
INSERT INTO kp_sale_items VALUES("136","126","179","0","0.50","1000.00","0.00","500.00","2021-03-31","2","950.00","25.00","0.00","68.97","1","1","2021-03-31 18:10:05");
INSERT INTO kp_sale_items VALUES("137","126","165","0","4.00","100.00","0.00","400.00","2021-03-31","2","92.80","28.80","0.00","55.17","1","1","2021-03-31 18:10:21");
INSERT INTO kp_sale_items VALUES("138","126","171","0","4.00","110.00","0.00","440.00","2021-03-31","2","93.50","66.00","0.00","60.69","1","1","2021-03-31 18:10:43");
INSERT INTO kp_sale_items VALUES("139","126","170","0","4.00","180.00","0.00","720.00","2021-03-31","2","171.50","34.00","0.00","99.31","1","1","2021-03-31 18:10:58");
INSERT INTO kp_sale_items VALUES("140","127","165","0","20.00","95.00","0.00","1900.00","2021-03-31","2","92.80","44.00","0.00","262.07","1","1","2021-03-31 18:12:16");
INSERT INTO kp_sale_items VALUES("141","127","150","0","1.00","2470.00","0.00","2470.00","2021-03-31","2","2340.00","130.00","0.00","340.69","1","1","2021-03-31 18:12:49");
INSERT INTO kp_sale_items VALUES("142","127","10","0","1.00","1570.00","0.00","1570.00","2021-03-31","2","0.00","1570.00","0.00","0.00","2","1","2021-03-31 18:13:09");
INSERT INTO kp_sale_items VALUES("143","128","179","0","0.50","1000.00","0.00","500.00","2021-03-31","2","950.00","25.00","0.00","68.97","1","1","2021-03-31 18:14:03");
INSERT INTO kp_sale_items VALUES("144","128","156","0","2.00","50.00","0.00","100.00","2021-03-31","2","33.33","33.34","0.00","13.79","1","1","2021-03-31 18:16:36");
INSERT INTO kp_sale_items VALUES("145","129","196","0","1.00","120.00","0.00","120.00","2021-03-31","2","0.00","120.00","0.00","16.55","1","1","2021-03-31 18:17:14");
INSERT INTO kp_sale_items VALUES("146","130","203","0","1.00","55.00","0.00","55.00","2021-03-31","2","0.00","55.00","0.00","7.59","1","1","2021-03-31 18:22:40");
INSERT INTO kp_sale_items VALUES("147","130","205","0","1.00","50.00","0.00","50.00","2021-03-31","2","47.00","3.00","0.00","6.90","1","1","2021-03-31 18:23:47");
INSERT INTO kp_sale_items VALUES("148","130","208","0","2.00","35.00","0.00","70.00","2021-03-31","2","0.00","70.00","0.00","9.66","1","1","2021-03-31 18:24:04");
INSERT INTO kp_sale_items VALUES("149","131","165","0","2.00","100.00","0.00","200.00","2021-03-31","2","92.80","14.40","0.00","27.59","1","1","2021-03-31 18:31:36");
INSERT INTO kp_sale_items VALUES("150","131","5","0","2.00","100.00","0.00","200.00","2021-03-31","2","0.00","200.00","0.00","27.59","1","1","2021-03-31 18:32:08");
INSERT INTO kp_sale_items VALUES("151","131","208","0","1.00","35.00","0.00","35.00","2021-03-31","2","0.00","35.00","0.00","4.83","1","1","2021-03-31 18:32:21");
INSERT INTO kp_sale_items VALUES("152","131","176","0","1.00","105.00","0.00","105.00","2021-03-31","2","0.00","105.00","0.00","14.48","1","1","2021-03-31 18:32:38");
INSERT INTO kp_sale_items VALUES("153","131","186","0","5.00","24.00","0.00","120.00","2021-03-31","2","0.00","120.00","0.00","0.00","0","1","2021-03-31 18:32:57");
INSERT INTO kp_sale_items VALUES("154","133","138","0","1.00","580.00","0.00","580.00","2021-03-31","2","0.00","580.00","0.00","0.00","3","1","2021-03-31 18:47:44");
INSERT INTO kp_sale_items VALUES("155","134","165","0","12.50","144.00","0.00","1800.00","2021-04-01","2","92.80","640.00","0.00","248.28","1","1","2021-04-01 08:29:43");
INSERT INTO kp_sale_items VALUES("156","135","144","0","1.00","820.00","0.00","820.00","2021-04-01","1","780.00","40.00","0.00","113.10","1","1","2021-04-01 09:16:53");
INSERT INTO kp_sale_items VALUES("157","137","179","0","1.00","1000.00","0.00","1000.00","2021-04-01","2","950.00","50.00","0.00","137.93","1","1","2021-04-01 09:49:58");
INSERT INTO kp_sale_items VALUES("158","137","5","0","5.00","100.00","0.00","500.00","2021-04-01","2","0.00","500.00","0.00","68.97","1","1","2021-04-01 09:50:06");
INSERT INTO kp_sale_items VALUES("159","137","189","0","2.00","120.00","0.00","240.00","2021-04-01","2","105.00","30.00","0.00","33.10","1","1","2021-04-01 09:51:19");
INSERT INTO kp_sale_items VALUES("160","137","182","0","1.00","130.00","0.00","130.00","2021-04-01","2","120.00","10.00","0.00","0.00","2","1","2021-04-01 09:51:38");
INSERT INTO kp_sale_items VALUES("161","138","179","0","1.00","1000.00","0.00","1000.00","2021-04-01","2","950.00","50.00","0.00","137.93","1","1","2021-04-01 09:53:49");
INSERT INTO kp_sale_items VALUES("162","138","8","0","1.00","1530.00","0.00","1530.00","2021-04-01","2","0.00","1530.00","0.00","0.00","2","1","2021-04-01 09:54:08");
INSERT INTO kp_sale_items VALUES("163","138","5","0","2.00","100.00","0.00","200.00","2021-04-01","2","0.00","200.00","0.00","27.59","1","1","2021-04-01 09:54:26");
INSERT INTO kp_sale_items VALUES("164","138","165","0","2.00","100.00","0.00","200.00","2021-04-01","2","92.80","14.40","0.00","27.59","1","1","2021-04-01 09:54:41");
INSERT INTO kp_sale_items VALUES("165","138","212","0","1.00","200.00","0.00","200.00","2021-04-01","2","0.00","200.00","0.00","27.59","1","1","2021-04-01 09:56:18");
INSERT INTO kp_sale_items VALUES("166","138","189","0","1.00","120.00","0.00","120.00","2021-04-01","2","105.00","15.00","0.00","16.55","1","1","2021-04-01 09:57:15");
INSERT INTO kp_sale_items VALUES("167","139","5","0","0.50","110.00","0.00","55.00","2021-04-01","2","0.00","55.00","0.00","7.59","1","1","2021-04-01 10:03:41");
INSERT INTO kp_sale_items VALUES("168","141","165","0","1.00","100.00","0.00","100.00","2021-04-01","2","92.80","7.20","0.00","13.79","1","1","2021-04-01 11:28:31");
INSERT INTO kp_sale_items VALUES("169","142","5","0","12.50","86.40","0.00","1080.00","2021-04-01","2","0.00","1080.00","0.00","148.97","1","1","2021-04-01 12:08:54");
INSERT INTO kp_sale_items VALUES("170","143","206","0","1.00","50.00","0.00","50.00","2021-04-01","2","0.00","50.00","0.00","6.90","1","1","2021-04-01 12:10:57");
INSERT INTO kp_sale_items VALUES("171","144","180","0","1.00","100.00","0.00","100.00","2021-04-01","2","79.17","20.83","0.00","0.00","2","1","2021-04-01 12:12:08");
INSERT INTO kp_sale_items VALUES("172","146","165","0","4.00","100.00","0.00","400.00","2021-04-01","2","92.80","28.80","0.00","55.17","1","1","2021-04-01 12:23:28");
INSERT INTO kp_sale_items VALUES("173","146","5","0","4.00","110.00","0.00","440.00","2021-04-01","2","0.00","440.00","0.00","60.69","1","1","2021-04-01 12:23:36");
INSERT INTO kp_sale_items VALUES("174","146","23","0","1.00","200.00","0.00","200.00","2021-04-01","2","190.00","10.00","0.00","27.59","1","1","2021-04-01 12:23:53");
INSERT INTO kp_sale_items VALUES("175","147","203","0","2.00","55.00","0.00","110.00","2021-04-01","2","0.00","110.00","0.00","15.17","1","1","2021-04-01 12:38:59");
INSERT INTO kp_sale_items VALUES("176","147","176","0","1.00","110.00","0.00","110.00","2021-04-01","2","0.00","110.00","0.00","15.17","1","1","2021-04-01 12:39:10");
INSERT INTO kp_sale_items VALUES("177","147","85","0","1.00","590.00","0.00","590.00","2021-04-01","2","560.00","30.00","0.00","81.38","1","1","2021-04-01 12:41:07");
INSERT INTO kp_sale_items VALUES("178","147","9","0","1.00","1550.00","0.00","1550.00","2021-04-01","2","0.00","1550.00","0.00","0.00","2","1","2021-04-01 12:42:29");
INSERT INTO kp_sale_items VALUES("179","148","170","0","3.00","190.00","0.00","570.00","2021-04-01","2","171.50","55.50","0.00","78.62","1","1","2021-04-01 13:01:03");
INSERT INTO kp_sale_items VALUES("180","149","8","0","1.00","1530.00","0.00","1530.00","2021-04-01","2","0.00","1530.00","0.00","0.00","2","1","2021-04-01 13:33:05");
INSERT INTO kp_sale_items VALUES("181","151","141","0","0.50","4760.00","0.00","2380.00","2021-04-01","2","4670.00","45.00","0.00","328.28","1","1","2021-04-01 14:03:48");
INSERT INTO kp_sale_items VALUES("182","152","189","0","1.00","120.00","0.00","120.00","2021-04-01","2","105.00","15.00","0.00","16.55","1","1","2021-04-01 14:31:31");
INSERT INTO kp_sale_items VALUES("183","153","157","0","10.00","42.00","0.00","420.00","2021-04-01","2","30.42","115.80","0.00","57.93","1","1","2021-04-01 15:07:00");
INSERT INTO kp_sale_items VALUES("184","153","156","0","6.00","45.00","0.00","270.00","2021-04-01","2","33.33","70.02","0.00","37.24","1","1","2021-04-01 15:08:48");
INSERT INTO kp_sale_items VALUES("185","154","170","0","0.50","190.00","0.00","95.00","2021-04-01","2","171.50","9.25","0.00","13.10","1","1","2021-04-01 15:40:49");
INSERT INTO kp_sale_items VALUES("186","156","8","0","1.00","1570.00","0.00","1570.00","2021-04-01","2","0.00","1570.00","0.00","0.00","2","1","2021-04-01 16:30:27");
INSERT INTO kp_sale_items VALUES("187","156","10","0","1.00","1580.00","0.00","1580.00","2021-04-01","2","0.00","1580.00","0.00","0.00","2","1","2021-04-01 16:40:25");
INSERT INTO kp_sale_items VALUES("188","156","119","0","1.00","570.00","0.00","570.00","2021-04-01","2","0.00","570.00","0.00","78.62","1","1","2021-04-01 16:40:59");
INSERT INTO kp_sale_items VALUES("189","156","118","0","1.00","570.00","0.00","570.00","2021-04-01","2","0.00","570.00","0.00","78.62","1","1","2021-04-01 16:41:13");
INSERT INTO kp_sale_items VALUES("190","156","76","0","1.00","2750.00","0.00","2750.00","2021-04-01","2","0.00","2750.00","0.00","379.31","1","1","2021-04-01 16:41:42");
INSERT INTO kp_sale_items VALUES("191","156","171","0","1.00","2470.00","0.00","2470.00","2021-04-01","2","93.50","2376.50","0.00","340.69","1","1","2021-04-01 16:42:48");
INSERT INTO kp_sale_items VALUES("192","156","37","0","2.00","75.00","0.00","150.00","2021-04-01","2","0.00","150.00","0.00","20.69","1","1","2021-04-01 16:43:32");
INSERT INTO kp_sale_items VALUES("193","156","39","0","2.00","70.00","0.00","140.00","2021-04-01","2","0.00","140.00","0.00","19.31","1","1","2021-04-01 16:43:41");
INSERT INTO kp_sale_items VALUES("194","156","136","0","1.00","350.00","0.00","350.00","2021-04-01","2","0.00","350.00","0.00","48.28","1","1","2021-04-01 16:43:50");
INSERT INTO kp_sale_items VALUES("195","156","164","0","1.00","820.00","0.00","820.00","2021-04-01","2","39.00","781.00","0.00","113.10","1","1","2021-04-01 16:44:24");
INSERT INTO kp_sale_items VALUES("196","156","176","0","2.00","105.00","0.00","210.00","2021-04-01","2","0.00","210.00","0.00","28.97","1","1","2021-04-01 16:45:55");
INSERT INTO kp_sale_items VALUES("197","156","203","0","2.00","55.00","0.00","110.00","2021-04-01","2","0.00","110.00","0.00","15.17","1","1","2021-04-01 16:48:08");
INSERT INTO kp_sale_items VALUES("198","156","201","0","1.00","155.00","0.00","155.00","2021-04-01","2","0.00","155.00","0.00","21.38","1","1","2021-04-01 16:50:01");
INSERT INTO kp_sale_items VALUES("199","156","84","0","1.00","140.00","0.00","140.00","2021-04-01","2","0.00","140.00","0.00","19.31","1","1","2021-04-01 16:50:54");
INSERT INTO kp_sale_items VALUES("200","157","23","0","1.00","200.00","0.00","200.00","2021-04-01","2","190.00","10.00","0.00","27.59","1","1","2021-04-01 16:51:15");
INSERT INTO kp_sale_items VALUES("201","156","169","0","1.00","250.00","0.00","250.00","2021-04-01","2","0.00","250.00","0.00","34.48","1","1","2021-04-01 16:53:18");
INSERT INTO kp_sale_items VALUES("202","156","138","0","1.00","590.00","0.00","590.00","2021-04-01","2","0.00","590.00","0.00","0.00","3","1","2021-04-01 16:54:18");
INSERT INTO kp_sale_items VALUES("203","156","133","0","1.00","420.00","0.00","420.00","2021-04-01","2","0.00","420.00","0.00","57.93","1","1","2021-04-01 16:56:41");
INSERT INTO kp_sale_items VALUES("204","156","135","0","1.00","480.00","0.00","480.00","2021-04-01","2","0.00","480.00","0.00","66.21","1","1","2021-04-01 16:57:00");
INSERT INTO kp_sale_items VALUES("205","156","209","0","1.00","350.00","0.00","350.00","2021-04-01","2","272.50","77.50","0.00","48.28","1","1","2021-04-01 16:58:00");
INSERT INTO kp_sale_items VALUES("206","156","23","0","2.00","200.00","0.00","400.00","2021-04-01","2","190.00","20.00","0.00","55.17","1","1","2021-04-01 17:00:38");
INSERT INTO kp_sale_items VALUES("207","156","204","0","1.00","240.00","0.00","240.00","2021-04-01","2","0.00","240.00","0.00","33.10","1","1","2021-04-01 17:01:27");
INSERT INTO kp_sale_items VALUES("208","156","174","0","1.00","125.00","0.00","125.00","2021-04-01","2","112.50","12.50","0.00","0.00","0","1","2021-04-01 17:03:43");
INSERT INTO kp_sale_items VALUES("209","158","160","0","1.00","360.00","0.00","360.00","2021-04-01","2","320.00","40.00","0.00","49.66","1","1","2021-04-01 17:06:06");
INSERT INTO kp_sale_items VALUES("210","158","162","0","1.00","360.00","0.00","360.00","2021-04-01","2","320.00","40.00","0.00","49.66","1","1","2021-04-01 17:06:15");
INSERT INTO kp_sale_items VALUES("211","156","215","0","6.00","37.00","0.00","222.00","2021-04-01","2","0.00","222.00","0.00","0.00","3","1","2021-04-01 17:09:44");
INSERT INTO kp_sale_items VALUES("212","156","214","0","6.00","47.00","0.00","282.00","2021-04-01","2","0.00","282.00","0.00","0.00","3","1","2021-04-01 17:11:03");
INSERT INTO kp_sale_items VALUES("213","156","141","0","0.50","4760.00","0.00","2380.00","2021-04-01","2","4670.00","45.00","0.00","328.28","1","1","2021-04-01 17:13:51");
INSERT INTO kp_sale_items VALUES("214","156","185","0","2.00","65.00","0.00","130.00","2021-04-01","2","0.00","130.00","0.00","17.93","1","1","2021-04-01 17:14:51");
INSERT INTO kp_sale_items VALUES("215","156","216","0","2.00","100.00","0.00","200.00","2021-04-01","2","0.00","200.00","0.00","27.59","1","1","2021-04-01 17:18:59");
INSERT INTO kp_sale_items VALUES("216","156","157","0","1.00","810.00","0.00","810.00","2021-04-01","2","30.42","779.58","0.00","111.72","1","1","2021-04-01 17:20:32");
INSERT INTO kp_sale_items VALUES("217","156","213","0","1.00","700.00","0.00","700.00","2021-04-01","2","0.00","700.00","0.00","96.55","1","1","2021-04-01 17:21:12");
INSERT INTO kp_sale_items VALUES("218","156","158","0","1.00","860.00","0.00","860.00","2021-04-01","2","33.33","826.67","0.00","118.62","1","1","2021-04-01 17:22:16");
INSERT INTO kp_sale_items VALUES("219","159","140","0","1.00","2150.00","0.00","2150.00","2021-04-01","2","2010.00","140.00","0.00","0.00","2","1","2021-04-01 17:24:00");
INSERT INTO kp_sale_items VALUES("220","159","200","0","1.00","120.00","0.00","120.00","2021-04-01","2","0.00","120.00","0.00","16.55","1","1","2021-04-01 17:32:30");
INSERT INTO kp_sale_items VALUES("221","159","121","0","1.00","550.00","0.00","550.00","2021-04-01","2","0.00","550.00","0.00","75.86","1","1","2021-04-01 17:32:53");
INSERT INTO kp_sale_items VALUES("222","159","217","0","1.00","250.00","0.00","250.00","2021-04-01","2","0.00","250.00","0.00","34.48","1","1","2021-04-01 17:33:43");
INSERT INTO kp_sale_items VALUES("223","160","33","0","1.00","250.00","0.00","250.00","2021-04-01","2","230.00","20.00","0.00","34.48","1","1","2021-04-01 17:58:37");
INSERT INTO kp_sale_items VALUES("224","160","32","0","1.00","250.00","0.00","250.00","2021-04-01","2","230.00","20.00","0.00","34.48","1","1","2021-04-01 17:58:46");
INSERT INTO kp_sale_items VALUES("225","161","98","0","1.00","520.00","0.00","520.00","2021-04-01","2","0.00","520.00","0.00","71.72","1","1","2021-04-01 18:08:34");
INSERT INTO kp_sale_items VALUES("226","163","218","0","1.00","1440.00","0.00","1440.00","2021-04-01","2","0.00","1440.00","0.00","0.00","2","1","2021-04-01 18:11:50");
INSERT INTO kp_sale_items VALUES("227","164","5","0","1.00","110.00","0.00","110.00","2021-04-01","2","0.00","110.00","0.00","15.17","1","1","2021-04-01 18:12:52");
INSERT INTO kp_sale_items VALUES("228","165","170","0","2.00","180.00","0.00","360.00","2021-04-01","2","171.50","17.00","0.00","49.66","1","1","2021-04-01 18:18:50");
INSERT INTO kp_sale_items VALUES("229","166","5","0","1.50","110.00","0.00","165.00","2021-04-01","2","0.00","165.00","0.00","22.76","1","1","2021-04-01 18:26:16");
INSERT INTO kp_sale_items VALUES("230","167","196","0","1.00","120.00","0.00","120.00","2021-04-01","2","0.00","120.00","0.00","16.55","1","1","2021-04-01 18:27:04");
INSERT INTO kp_sale_items VALUES("231","168","5","0","1.00","100.00","0.00","100.00","2021-04-01","2","0.00","100.00","0.00","13.79","1","1","2021-04-01 19:14:09");
INSERT INTO kp_sale_items VALUES("232","169","181","0","1.00","135.00","0.00","135.00","2021-04-01","2","128.33","6.67","0.00","0.00","2","1","2021-04-01 19:14:35");
INSERT INTO kp_sale_items VALUES("233","170","176","0","1.00","105.00","0.00","105.00","2021-04-01","2","0.00","105.00","0.00","14.48","1","1","2021-04-01 19:15:05");
INSERT INTO kp_sale_items VALUES("234","170","168","0","1.00","50.00","0.00","50.00","2021-04-01","2","0.00","50.00","0.00","6.90","1","1","2021-04-01 19:15:12");
INSERT INTO kp_sale_items VALUES("235","170","75","0","1.00","110.00","0.00","110.00","2021-04-01","2","0.00","110.00","0.00","15.17","1","1","2021-04-01 19:16:56");
INSERT INTO kp_sale_items VALUES("236","171","170","0","2.00","190.00","0.00","380.00","2021-04-02","2","171.50","37.00","0.00","52.41","1","1","2021-04-02 08:04:23");
INSERT INTO kp_sale_items VALUES("237","171","183","0","2.00","130.00","0.00","260.00","2021-04-02","2","124.17","11.66","0.00","0.00","2","1","2021-04-02 08:05:45");
INSERT INTO kp_sale_items VALUES("238","171","219","0","2.00","130.00","0.00","260.00","2021-04-02","2","0.00","260.00","0.00","0.00","2","1","2021-04-02 08:06:03");
INSERT INTO kp_sale_items VALUES("239","171","165","0","3.00","100.00","0.00","300.00","2021-04-02","2","92.80","21.60","0.00","41.38","1","1","2021-04-02 08:06:28");
INSERT INTO kp_sale_items VALUES("240","171","58","0","1.00","155.00","0.00","155.00","2021-04-02","2","0.00","155.00","0.00","21.38","1","1","2021-04-02 08:15:22");
INSERT INTO kp_sale_items VALUES("241","171","221","0","1.00","50.00","0.00","50.00","2021-04-02","2","0.00","50.00","0.00","6.90","1","1","2021-04-02 08:17:29");
INSERT INTO kp_sale_items VALUES("242","171","138","0","1.00","65.00","0.00","65.00","2021-04-02","2","0.00","65.00","0.00","0.00","3","1","2021-04-02 08:20:28");
INSERT INTO kp_sale_items VALUES("243","172","47","0","1.00","130.00","0.00","130.00","2021-04-02","2","0.00","130.00","0.00","17.93","1","1","2021-04-02 08:22:47");
INSERT INTO kp_sale_items VALUES("244","172","176","0","1.00","105.00","0.00","105.00","2021-04-02","2","0.00","105.00","0.00","14.48","1","1","2021-04-02 08:22:57");
INSERT INTO kp_sale_items VALUES("245","173","18","0","1.00","3350.00","0.00","3350.00","2021-04-02","2","0.00","3350.00","0.00","462.07","1","1","2021-04-02 08:27:45");
INSERT INTO kp_sale_items VALUES("246","174","178","0","2.00","90.00","0.00","180.00","2021-04-02","2","82.33","15.34","0.00","24.83","1","1","2021-04-02 08:30:28");
INSERT INTO kp_sale_items VALUES("247","175","8","0","5.00","765.00","0.00","3825.00","2021-04-02","2","0.00","3825.00","0.00","0.00","2","1","2021-04-02 09:47:20");
INSERT INTO kp_sale_items VALUES("248","175","176","0","1.00","105.00","0.00","105.00","2021-04-02","2","0.00","105.00","0.00","14.48","1","1","2021-04-02 09:48:13");
INSERT INTO kp_sale_items VALUES("249","175","78","0","2.00","220.00","0.00","440.00","2021-04-02","2","0.00","440.00","0.00","60.69","1","1","2021-04-02 09:50:40");
INSERT INTO kp_sale_items VALUES("250","175","165","0","10.00","1000.00","0.00","10000.00","2021-04-02","2","92.80","9072.00","0.00","1379.31","1","1","2021-04-02 09:51:37");
INSERT INTO kp_sale_items VALUES("251","177","223","0","3.00","110.00","0.00","330.00","2021-04-02","2","0.00","330.00","0.00","45.52","1","1","2021-04-02 12:52:00");
INSERT INTO kp_sale_items VALUES("252","177","165","0","3.00","100.00","0.00","300.00","2021-04-02","2","92.80","21.60","0.00","41.38","1","1","2021-04-02 12:52:12");
INSERT INTO kp_sale_items VALUES("253","178","23","0","1.00","200.00","0.00","200.00","2021-04-02","2","190.00","10.00","0.00","27.59","1","1","2021-04-02 12:53:56");
INSERT INTO kp_sale_items VALUES("254","178","206","0","1.00","50.00","0.00","50.00","2021-04-02","2","0.00","50.00","0.00","6.90","1","1","2021-04-02 12:54:37");
INSERT INTO kp_sale_items VALUES("255","178","189","0","1.00","120.00","0.00","120.00","2021-04-02","2","105.00","15.00","0.00","16.55","1","1","2021-04-02 12:55:58");
INSERT INTO kp_sale_items VALUES("256","179","153","0","1.00","1470.00","0.00","1470.00","2021-04-02","2","1390.00","80.00","0.00","202.76","1","1","2021-04-02 12:57:04");
INSERT INTO kp_sale_items VALUES("257","180","170","0","2.00","190.00","0.00","380.00","2021-04-02","2","171.50","37.00","0.00","52.41","1","1","2021-04-02 13:01:14");
INSERT INTO kp_sale_items VALUES("258","181","137","0","1.00","65.00","0.00","65.00","2021-04-02","2","0.00","65.00","0.00","0.00","3","1","2021-04-02 13:05:28");
INSERT INTO kp_sale_items VALUES("259","181","208","0","1.00","35.00","0.00","35.00","2021-04-02","2","0.00","35.00","0.00","4.83","1","1","2021-04-02 13:05:41");
INSERT INTO kp_sale_items VALUES("260","182","189","0","1.00","120.00","0.00","120.00","2021-04-02","2","105.00","15.00","0.00","16.55","1","1","2021-04-02 13:13:34");
INSERT INTO kp_sale_items VALUES("261","184","171","0","1.00","2450.00","0.00","2450.00","2021-04-02","2","93.50","2356.50","0.00","337.93","1","1","2021-04-02 13:45:58");
INSERT INTO kp_sale_items VALUES("262","184","8","0","1.00","1550.00","0.00","1550.00","2021-04-02","2","0.00","1550.00","0.00","0.00","2","1","2021-04-02 13:47:57");
INSERT INTO kp_sale_items VALUES("263","184","179","0","1.00","1000.00","0.00","1000.00","2021-04-02","2","950.00","50.00","0.00","137.93","1","1","2021-04-02 13:48:06");
INSERT INTO kp_sale_items VALUES("264","184","224","0","4.00","80.00","0.00","320.00","2021-04-02","2","0.00","320.00","0.00","44.14","1","1","2021-04-02 13:50:25");
INSERT INTO kp_sale_items VALUES("265","184","196","0","4.00","120.00","0.00","480.00","2021-04-02","2","0.00","480.00","0.00","66.21","1","1","2021-04-02 13:50:59");
INSERT INTO kp_sale_items VALUES("266","186","173","0","1.00","60.00","0.00","60.00","2021-04-02","2","47.00","13.00","0.00","8.28","1","1","2021-04-02 14:03:48");
INSERT INTO kp_sale_items VALUES("267","186","164","0","2.00","50.00","0.00","100.00","2021-04-02","2","39.00","22.00","0.00","13.79","1","1","2021-04-02 14:06:32");
INSERT INTO kp_sale_items VALUES("268","187","165","0","4.00","100.00","0.00","400.00","2021-04-02","2","92.80","28.80","0.00","55.17","1","1","2021-04-02 14:15:39");
INSERT INTO kp_sale_items VALUES("269","187","179","0","0.50","1000.00","0.00","500.00","2021-04-02","2","950.00","25.00","0.00","68.97","1","1","2021-04-02 14:15:50");
INSERT INTO kp_sale_items VALUES("270","187","10","0","0.50","1580.00","0.00","790.00","2021-04-02","2","0.00","790.00","0.00","0.00","2","1","2021-04-02 14:16:41");
INSERT INTO kp_sale_items VALUES("271","188","5","0","4.00","110.00","0.00","440.00","2021-04-02","2","0.00","440.00","0.00","60.69","1","1","2021-04-02 14:20:16");
INSERT INTO kp_sale_items VALUES("272","189","196","0","1.00","120.00","0.00","120.00","2021-04-02","2","0.00","120.00","0.00","16.55","1","1","2021-04-02 14:21:59");
INSERT INTO kp_sale_items VALUES("273","190","186","0","2.00","25.00","0.00","50.00","2021-04-02","2","0.00","50.00","0.00","0.00","0","1","2021-04-02 14:23:58");
INSERT INTO kp_sale_items VALUES("274","190","129","0","2.00","46.00","0.00","92.00","2021-04-02","2","0.00","92.00","0.00","12.69","1","1","2021-04-02 14:24:11");
INSERT INTO kp_sale_items VALUES("275","191","172","0","2.00","25.00","0.00","50.00","2021-04-02","2","0.00","50.00","0.00","6.90","1","1","2021-04-02 14:25:32");
INSERT INTO kp_sale_items VALUES("276","192","9","0","0.50","1570.00","0.00","785.00","2021-04-02","2","0.00","785.00","0.00","0.00","2","1","2021-04-02 14:31:10");
INSERT INTO kp_sale_items VALUES("277","192","8","0","0.50","1550.00","0.00","775.00","2021-04-02","2","0.00","775.00","0.00","0.00","2","1","2021-04-02 14:40:07");
INSERT INTO kp_sale_items VALUES("278","192","208","0","1.00","350.00","0.00","350.00","2021-04-02","2","0.00","350.00","0.00","48.28","1","1","2021-04-02 14:40:29");
INSERT INTO kp_sale_items VALUES("279","192","83","0","1.00","180.00","0.00","180.00","2021-04-02","2","0.00","180.00","0.00","24.83","1","1","2021-04-02 14:40:48");
INSERT INTO kp_sale_items VALUES("280","192","176","0","1.00","105.00","0.00","105.00","2021-04-02","2","0.00","105.00","0.00","14.48","1","1","2021-04-02 14:41:25");
INSERT INTO kp_sale_items VALUES("281","192","178","0","1.00","90.00","0.00","90.00","2021-04-02","2","82.33","7.67","0.00","12.41","1","1","2021-04-02 14:41:33");
INSERT INTO kp_sale_items VALUES("282","192","200","0","1.00","120.00","0.00","120.00","2021-04-02","2","0.00","120.00","0.00","16.55","1","1","2021-04-02 14:42:44");
INSERT INTO kp_sale_items VALUES("283","192","168","0","1.00","50.00","0.00","50.00","2021-04-02","2","0.00","50.00","0.00","6.90","1","1","2021-04-02 14:42:54");
INSERT INTO kp_sale_items VALUES("284","192","47","0","1.00","250.00","0.00","250.00","2021-04-02","2","0.00","250.00","0.00","34.48","1","1","2021-04-02 14:43:22");
INSERT INTO kp_sale_items VALUES("285","192","225","0","1.00","130.00","0.00","130.00","2021-04-02","2","0.00","130.00","0.00","17.93","1","1","2021-04-02 14:44:30");
INSERT INTO kp_sale_items VALUES("286","192","84","0","1.00","140.00","0.00","140.00","2021-04-02","2","0.00","140.00","0.00","19.31","1","1","2021-04-02 14:44:47");
INSERT INTO kp_sale_items VALUES("287","192","77","0","1.00","2750.00","0.00","2750.00","2021-04-02","2","0.00","2750.00","0.00","379.31","1","1","2021-04-02 14:45:16");
INSERT INTO kp_sale_items VALUES("288","193","182","0","3.00","130.00","0.00","390.00","2021-04-02","2","120.00","30.00","0.00","0.00","2","1","2021-04-02 14:46:58");
INSERT INTO kp_sale_items VALUES("289","193","192","0","3.00","100.00","0.00","300.00","2021-04-02","2","40.42","178.74","0.00","0.00","2","1","2021-04-02 14:47:08");
INSERT INTO kp_sale_items VALUES("290","193","226","0","1.00","330.00","0.00","330.00","2021-04-02","2","0.00","330.00","0.00","45.52","1","1","2021-04-02 14:48:00");
INSERT INTO kp_sale_items VALUES("291","194","192","0","4.00","100.00","0.00","400.00","2021-04-02","2","40.42","238.32","0.00","0.00","2","1","2021-04-02 14:50:41");
INSERT INTO kp_sale_items VALUES("292","194","182","0","1.00","130.00","0.00","130.00","2021-04-02","2","120.00","10.00","0.00","0.00","2","1","2021-04-02 14:50:55");
INSERT INTO kp_sale_items VALUES("293","194","165","0","3.00","100.00","0.00","300.00","2021-04-02","2","92.80","21.60","0.00","41.38","1","1","2021-04-02 14:51:07");
INSERT INTO kp_sale_items VALUES("294","194","77","0","2.00","120.00","0.00","240.00","2021-04-02","2","0.00","240.00","0.00","33.10","1","1","2021-04-02 14:52:48");
INSERT INTO kp_sale_items VALUES("295","192","139","0","1.00","225.00","0.00","225.00","2021-04-02","2","0.00","225.00","0.00","0.00","3","1","2021-04-02 14:58:06");
INSERT INTO kp_sale_items VALUES("296","192","138","0","0.50","580.00","0.00","290.00","2021-04-02","2","0.00","290.00","0.00","0.00","3","1","2021-04-02 14:58:29");
INSERT INTO kp_sale_items VALUES("297","192","23","0","1.00","200.00","0.00","200.00","2021-04-02","2","190.00","10.00","0.00","27.59","1","1","2021-04-02 14:59:41");
INSERT INTO kp_sale_items VALUES("298","192","165","0","12.50","95.20","0.00","1190.00","2021-04-02","2","92.80","30.00","0.00","164.14","1","1","2021-04-02 15:00:14");
INSERT INTO kp_sale_items VALUES("299","192","68","0","1.00","105.00","0.00","105.00","2021-04-02","2","0.00","105.00","0.00","14.48","1","1","2021-04-02 15:01:15");
INSERT INTO kp_sale_items VALUES("300","192","62","0","1.00","110.00","0.00","110.00","2021-04-02","2","0.00","110.00","0.00","15.17","1","1","2021-04-02 15:01:26");
INSERT INTO kp_sale_items VALUES("301","192","75","0","1.00","110.00","0.00","110.00","2021-04-02","2","0.00","110.00","0.00","15.17","1","1","2021-04-02 15:01:40");
INSERT INTO kp_sale_items VALUES("302","196","170","0","1.00","190.00","0.00","190.00","2021-04-02","2","171.50","18.50","0.00","26.21","1","1","2021-04-02 15:09:57");
INSERT INTO kp_sale_items VALUES("303","197","118","0","1.00","570.00","0.00","570.00","2021-04-02","2","0.00","570.00","0.00","78.62","1","1","2021-04-02 15:14:18");
INSERT INTO kp_sale_items VALUES("304","197","164","0","0.50","820.00","0.00","410.00","2021-04-02","2","39.00","390.50","0.00","56.55","1","1","2021-04-02 15:16:38");
INSERT INTO kp_sale_items VALUES("305","198","179","0","0.50","1000.00","0.00","500.00","2021-04-02","2","950.00","25.00","0.00","68.97","1","1","2021-04-02 15:33:15");
INSERT INTO kp_sale_items VALUES("306","199","195","0","1.00","160.00","0.00","160.00","2021-04-02","2","0.00","160.00","0.00","22.07","1","1","2021-04-02 15:43:11");
INSERT INTO kp_sale_items VALUES("307","200","136","0","1.00","350.00","0.00","350.00","2021-04-02","2","0.00","350.00","0.00","48.28","1","1","2021-04-02 15:47:05");
INSERT INTO kp_sale_items VALUES("308","200","88","0","1.00","250.00","0.00","250.00","2021-04-02","2","0.00","250.00","0.00","34.48","1","1","2021-04-02 15:47:24");
INSERT INTO kp_sale_items VALUES("309","200","227","0","1.00","170.00","0.00","170.00","2021-04-02","2","0.00","170.00","0.00","23.45","1","1","2021-04-02 15:49:51");
INSERT INTO kp_sale_items VALUES("310","203","228","0","1.00","1780.00","0.00","1780.00","2021-04-02","2","1720.00","60.00","0.00","245.52","1","1","2021-04-02 15:57:16");
INSERT INTO kp_sale_items VALUES("311","204","163","0","1.00","55.00","0.00","55.00","2021-04-02","2","0.00","55.00","0.00","7.59","1","1","2021-04-02 15:58:29");
INSERT INTO kp_sale_items VALUES("312","205","165","0","4.00","100.00","0.00","400.00","2021-04-02","2","92.80","28.80","0.00","55.17","1","1","2021-04-02 16:14:17");
INSERT INTO kp_sale_items VALUES("313","205","192","0","3.00","100.00","0.00","300.00","2021-04-02","2","40.42","178.74","0.00","0.00","2","1","2021-04-02 16:14:28");
INSERT INTO kp_sale_items VALUES("314","205","130","0","3.00","86.00","0.00","258.00","2021-04-02","2","0.00","258.00","0.00","35.59","1","1","2021-04-02 16:14:38");
INSERT INTO kp_sale_items VALUES("315","205","182","0","5.00","130.00","0.00","650.00","2021-04-02","2","120.00","50.00","0.00","0.00","2","1","2021-04-02 16:15:48");
INSERT INTO kp_sale_items VALUES("316","205","229","0","1.00","1790.00","0.00","1790.00","2021-04-02","2","1720.00","70.00","0.00","246.90","1","1","2021-04-02 16:20:31");
INSERT INTO kp_sale_items VALUES("317","207","165","0","2.00","100.00","0.00","200.00","2021-04-02","2","92.80","14.40","0.00","27.59","1","1","2021-04-02 16:24:15");
INSERT INTO kp_sale_items VALUES("318","207","192","0","2.00","100.00","0.00","200.00","2021-04-02","2","40.42","119.16","0.00","0.00","2","1","2021-04-02 16:24:29");
INSERT INTO kp_sale_items VALUES("319","207","183","0","1.00","130.00","0.00","130.00","2021-04-02","2","124.17","5.83","0.00","0.00","2","1","2021-04-02 16:24:57");
INSERT INTO kp_sale_items VALUES("320","207","5","0","1.00","100.00","0.00","100.00","2021-04-02","2","0.00","100.00","0.00","13.79","1","1","2021-04-02 16:25:10");
INSERT INTO kp_sale_items VALUES("321","207","170","0","0.50","190.00","0.00","95.00","2021-04-02","2","171.50","9.25","0.00","13.10","1","1","2021-04-02 16:27:56");
INSERT INTO kp_sale_items VALUES("322","209","9","0","1.00","75.00","0.00","75.00","2021-04-02","2","0.00","75.00","0.00","0.00","2","1","2021-04-02 16:46:41");
INSERT INTO kp_sale_items VALUES("323","210","165","0","2.00","100.00","0.00","200.00","2021-04-02","2","92.80","14.40","0.00","27.59","1","1","2021-04-02 16:48:59");
INSERT INTO kp_sale_items VALUES("324","210","182","0","2.00","130.00","0.00","260.00","2021-04-02","2","120.00","20.00","0.00","0.00","2","1","2021-04-02 16:49:11");
INSERT INTO kp_sale_items VALUES("325","210","5","0","4.00","110.00","0.00","440.00","2021-04-02","2","0.00","440.00","0.00","60.69","1","1","2021-04-02 16:49:24");
INSERT INTO kp_sale_items VALUES("326","210","230","0","1.00","140.00","0.00","140.00","2021-04-02","2","0.00","140.00","0.00","19.31","1","1","2021-04-02 16:49:34");
INSERT INTO kp_sale_items VALUES("327","211","224","0","1.00","80.00","0.00","80.00","2021-04-02","2","0.00","80.00","0.00","11.03","1","1","2021-04-02 17:28:14");
INSERT INTO kp_sale_items VALUES("328","212","166","0","1.00","55.00","0.00","55.00","2021-04-02","2","0.00","55.00","0.00","7.59","1","1","2021-04-02 17:51:46");
INSERT INTO kp_sale_items VALUES("329","212","203","0","1.00","55.00","0.00","55.00","2021-04-02","2","0.00","55.00","0.00","7.59","1","1","2021-04-02 17:52:00");
INSERT INTO kp_sale_items VALUES("330","212","231","0","1.00","75.00","0.00","75.00","2021-04-02","2","0.00","75.00","0.00","10.34","1","1","2021-04-02 17:53:30");
INSERT INTO kp_sale_items VALUES("331","213","219","0","4.00","127.00","0.00","508.00","2021-04-02","2","0.00","508.00","0.00","0.00","2","1","2021-04-02 18:00:49");
INSERT INTO kp_sale_items VALUES("332","214","219","0","1.00","130.00","0.00","130.00","2021-04-02","2","0.00","130.00","0.00","0.00","2","1","2021-04-02 18:04:22");
INSERT INTO kp_sale_items VALUES("333","215","10","0","1.00","1570.00","0.00","1570.00","2021-04-02","2","0.00","1570.00","0.00","0.00","2","1","2021-04-02 18:14:06");
INSERT INTO kp_sale_items VALUES("334","215","18","0","1.00","3350.00","0.00","3350.00","2021-04-02","2","0.00","3350.00","0.00","462.07","1","1","2021-04-02 18:14:22");
INSERT INTO kp_sale_items VALUES("335","215","222","0","1.00","2450.00","0.00","2450.00","2021-04-02","2","2330.00","120.00","0.00","337.93","1","1","2021-04-02 18:15:08");
INSERT INTO kp_sale_items VALUES("336","216","165","0","1.00","100.00","0.00","100.00","2021-04-02","2","92.80","7.20","0.00","13.79","1","1","2021-04-02 18:39:43");
INSERT INTO kp_sale_items VALUES("337","217","153","0","1.00","1460.00","0.00","1460.00","2021-04-02","2","1390.00","70.00","0.00","201.38","1","1","2021-04-02 18:56:58");
INSERT INTO kp_sale_items VALUES("338","217","10","0","1.00","1570.00","0.00","1570.00","2021-04-02","2","0.00","1570.00","0.00","0.00","2","1","2021-04-02 18:57:07");
INSERT INTO kp_sale_items VALUES("339","218","229","0","2.00","1790.00","0.00","3580.00","2021-04-02","2","1720.00","140.00","0.00","493.79","1","1","2021-04-02 19:07:56");
INSERT INTO kp_sale_items VALUES("340","219","203","0","1.00","55.00","0.00","55.00","2021-04-03","2","0.00","55.00","0.00","7.59","1","1","2021-04-03 08:25:04");
INSERT INTO kp_sale_items VALUES("341","222","170","0","3.00","190.00","0.00","570.00","2021-04-03","2","171.50","55.50","0.00","78.62","1","1","2021-04-03 08:30:32");
INSERT INTO kp_sale_items VALUES("342","223","23","0","2.00","200.00","0.00","400.00","2021-04-03","2","190.00","20.00","0.00","55.17","1","1","2021-04-03 09:02:21");
INSERT INTO kp_sale_items VALUES("343","224","176","0","1.00","105.00","0.00","105.00","2021-04-03","2","0.00","105.00","0.00","14.48","1","1","2021-04-03 09:06:04");
INSERT INTO kp_sale_items VALUES("344","224","68","0","1.00","105.00","0.00","105.00","2021-04-03","2","0.00","105.00","0.00","14.48","1","1","2021-04-03 09:06:15");
INSERT INTO kp_sale_items VALUES("345","224","62","0","1.00","110.00","0.00","110.00","2021-04-03","2","0.00","110.00","0.00","15.17","1","1","2021-04-03 09:06:26");
INSERT INTO kp_sale_items VALUES("346","224","84","0","1.00","140.00","0.00","140.00","2021-04-03","2","0.00","140.00","0.00","19.31","1","1","2021-04-03 09:06:36");
INSERT INTO kp_sale_items VALUES("347","224","203","0","1.00","55.00","0.00","55.00","2021-04-03","2","0.00","55.00","0.00","7.59","1","1","2021-04-03 09:06:52");
INSERT INTO kp_sale_items VALUES("348","225","84","0","1.00","140.00","0.00","140.00","2021-04-03","2","0.00","140.00","0.00","19.31","1","1","2021-04-03 09:10:44");
INSERT INTO kp_sale_items VALUES("349","225","83","0","1.00","195.00","0.00","195.00","2021-04-03","2","0.00","195.00","0.00","26.90","1","1","2021-04-03 09:10:54");
INSERT INTO kp_sale_items VALUES("350","225","211","0","1.00","115.00","0.00","115.00","2021-04-03","2","120.00","-5.00","0.00","15.86","1","1","2021-04-03 09:12:05");
INSERT INTO kp_sale_items VALUES("351","225","167","0","1.00","90.00","0.00","90.00","2021-04-03","2","0.00","90.00","0.00","12.41","1","1","2021-04-03 09:12:27");
INSERT INTO kp_sale_items VALUES("352","226","159","0","1.00","250.00","0.00","250.00","2021-04-03","2","205.00","45.00","0.00","34.48","1","1","2021-04-03 09:17:57");
INSERT INTO kp_sale_items VALUES("353","227","139","0","1.00","225.00","0.00","225.00","2021-04-03","2","0.00","225.00","0.00","0.00","3","1","2021-04-03 09:59:09");
INSERT INTO kp_sale_items VALUES("354","228","5","0","0.50","110.00","0.00","55.00","2021-04-03","2","0.00","55.00","0.00","7.59","1","1","2021-04-03 10:12:22");
INSERT INTO kp_sale_items VALUES("355","231","141","0","1.00","4750.00","0.00","4750.00","2021-04-03","2","4640.00","110.00","0.00","655.17","1","1","2021-04-03 10:58:17");
INSERT INTO kp_sale_items VALUES("356","232","165","0","1.00","100.00","0.00","100.00","2021-04-03","2","92.80","7.20","0.00","13.79","1","1","2021-04-03 11:36:27");
INSERT INTO kp_sale_items VALUES("357","233","208","0","1.00","35.00","0.00","35.00","2021-04-03","2","0.00","35.00","0.00","4.83","1","1","2021-04-03 11:37:12");
INSERT INTO kp_sale_items VALUES("358","233","37","0","1.00","70.00","0.00","70.00","2021-04-03","2","0.00","70.00","0.00","9.66","1","1","2021-04-03 11:37:27");
INSERT INTO kp_sale_items VALUES("359","234","168","0","1.00","50.00","0.00","50.00","2021-04-03","2","0.00","50.00","0.00","6.90","1","1","2021-04-03 11:38:33");
INSERT INTO kp_sale_items VALUES("360","236","23","0","2.00","200.00","0.00","400.00","2021-04-03","2","190.00","20.00","0.00","55.17","1","1","2021-04-03 12:24:10");
INSERT INTO kp_sale_items VALUES("361","236","179","0","1.00","1000.00","0.00","1000.00","2021-04-03","2","950.00","50.00","0.00","137.93","1","1","2021-04-03 12:24:22");
INSERT INTO kp_sale_items VALUES("362","236","5","0","11.00","105.00","0.00","1155.00","2021-04-03","2","0.00","1050.00","0.00","159.31","1","1","2021-04-03 12:29:57");
INSERT INTO kp_sale_items VALUES("363","236","32","0","1.00","250.00","0.00","250.00","2021-04-03","2","230.00","20.00","0.00","34.48","1","1","2021-04-03 12:31:52");
INSERT INTO kp_sale_items VALUES("364","236","33","0","1.00","250.00","0.00","250.00","2021-04-03","2","230.00","20.00","0.00","34.48","1","1","2021-04-03 12:32:01");
INSERT INTO kp_sale_items VALUES("365","237","5","0","5.00","110.00","0.00","550.00","2021-04-03","2","0.00","550.00","0.00","75.86","1","1","2021-04-03 12:34:06");
INSERT INTO kp_sale_items VALUES("366","237","165","0","5.00","100.00","0.00","500.00","2021-04-03","2","92.80","36.00","0.00","68.97","1","1","2021-04-03 12:37:50");
INSERT INTO kp_sale_items VALUES("367","237","76","0","1.00","145.00","0.00","145.00","2021-04-03","2","0.00","145.00","0.00","20.00","1","1","2021-04-03 12:39:10");
INSERT INTO kp_sale_items VALUES("368","237","65","0","1.00","140.00","0.00","140.00","2021-04-03","2","0.00","140.00","0.00","19.31","1","1","2021-04-03 12:39:34");
INSERT INTO kp_sale_items VALUES("369","237","170","0","4.00","190.00","0.00","760.00","2021-04-03","2","171.50","74.00","0.00","104.83","1","1","2021-04-03 12:39:53");
INSERT INTO kp_sale_items VALUES("370","238","182","0","3.00","130.00","0.00","390.00","2021-04-03","2","120.00","30.00","0.00","0.00","2","1","2021-04-03 12:41:15");
INSERT INTO kp_sale_items VALUES("371","236","165","0","10.00","100.00","0.00","1000.00","2021-04-03","2","92.80","72.00","0.00","137.93","1","1","2021-04-03 12:42:18");
INSERT INTO kp_sale_items VALUES("372","236","188","0","1.00","1100.00","0.00","1100.00","2021-04-03","2","1050.00","50.00","0.00","151.72","1","1","2021-04-03 12:42:29");
INSERT INTO kp_sale_items VALUES("373","239","179","0","1.00","1000.00","0.00","1000.00","2021-04-03","2","950.00","50.00","0.00","137.93","1","1","2021-04-03 12:46:52");
INSERT INTO kp_sale_items VALUES("374","239","141","0","1.00","4750.00","0.00","4750.00","2021-04-03","2","4640.00","110.00","0.00","655.17","1","1","2021-04-03 12:47:06");
INSERT INTO kp_sale_items VALUES("375","239","176","0","1.00","105.00","0.00","105.00","2021-04-03","2","0.00","105.00","0.00","14.48","1","1","2021-04-03 12:48:20");
INSERT INTO kp_sale_items VALUES("376","239","18","0","1.00","3570.00","0.00","3570.00","2021-04-03","2","0.00","3570.00","0.00","492.41","1","1","2021-04-03 12:49:25");
INSERT INTO kp_sale_items VALUES("377","240","10","0","1.00","135.00","0.00","135.00","2021-04-03","2","0.00","135.00","0.00","0.00","2","1","2021-04-03 15:25:12");
INSERT INTO kp_sale_items VALUES("378","240","165","0","1.00","100.00","0.00","100.00","2021-04-03","2","92.80","7.20","0.00","13.79","1","1","2021-04-03 15:25:21");
INSERT INTO kp_sale_items VALUES("379","240","5","0","1.00","100.00","0.00","100.00","2021-04-03","2","0.00","100.00","0.00","13.79","1","1","2021-04-03 15:25:31");
INSERT INTO kp_sale_items VALUES("380","241","118","0","1.00","570.00","0.00","570.00","2021-04-03","2","0.00","570.00","0.00","78.62","1","1","2021-04-03 15:30:38");
INSERT INTO kp_sale_items VALUES("381","242","178","0","2.00","90.00","0.00","180.00","2021-04-03","2","82.33","15.34","0.00","24.83","1","1","2021-04-03 15:48:28");
INSERT INTO kp_sale_items VALUES("382","242","196","0","3.00","110.00","0.00","330.00","2021-04-03","2","0.00","330.00","0.00","45.52","1","1","2021-04-03 15:49:04");
INSERT INTO kp_sale_items VALUES("383","243","165","0","1.00","500.00","0.00","500.00","2021-04-03","2","92.80","407.20","0.00","68.97","1","1","2021-04-03 15:53:40");
INSERT INTO kp_sale_items VALUES("384","243","208","0","1.00","35.00","0.00","35.00","2021-04-03","2","0.00","35.00","0.00","4.83","1","1","2021-04-03 15:54:43");
INSERT INTO kp_sale_items VALUES("385","243","23","0","1.00","200.00","0.00","200.00","2021-04-03","2","190.00","10.00","0.00","27.59","1","1","2021-04-03 15:55:06");
INSERT INTO kp_sale_items VALUES("386","245","236","0","1.00","200.00","0.00","200.00","2021-04-03","2","150.00","50.00","0.00","27.59","1","1","2021-04-03 15:59:14");
INSERT INTO kp_sale_items VALUES("387","246","192","0","1.00","100.00","0.00","100.00","2021-04-03","2","40.42","59.58","0.00","0.00","2","1","2021-04-03 16:01:23");
INSERT INTO kp_sale_items VALUES("388","246","5","0","1.00","110.00","0.00","110.00","2021-04-03","2","0.00","110.00","0.00","15.17","1","1","2021-04-03 16:01:30");
INSERT INTO kp_sale_items VALUES("389","247","179","0","1.00","1000.00","0.00","1000.00","2021-04-03","2","950.00","50.00","0.00","137.93","1","1","2021-04-03 16:25:55");
INSERT INTO kp_sale_items VALUES("390","247","140","0","1.00","2150.00","0.00","2150.00","2021-04-03","2","2010.00","140.00","0.00","0.00","2","1","2021-04-03 16:26:05");
INSERT INTO kp_sale_items VALUES("391","249","233","0","1.00","2450.00","0.00","2450.00","2021-04-03","2","2380.00","70.00","0.00","337.93","1","1","2021-04-03 16:29:45");
INSERT INTO kp_sale_items VALUES("392","250","154","0","1.00","1470.00","0.00","1470.00","2021-04-03","2","1390.00","80.00","0.00","0.00","2","1","2021-04-03 16:36:48");
INSERT INTO kp_sale_items VALUES("393","251","140","0","0.50","2150.00","0.00","1075.00","2021-04-03","2","2010.00","70.00","0.00","0.00","2","1","2021-04-03 16:39:50");
INSERT INTO kp_sale_items VALUES("394","251","122","0","1.00","520.00","0.00","520.00","2021-04-03","2","0.00","520.00","0.00","71.72","1","1","2021-04-03 16:41:35");
INSERT INTO kp_sale_items VALUES("395","252","179","0","1.00","1000.00","0.00","1000.00","2021-04-03","2","950.00","50.00","0.00","137.93","1","1","2021-04-03 16:44:20");
INSERT INTO kp_sale_items VALUES("396","253","236","0","1.00","190.00","0.00","190.00","2021-04-03","2","150.00","40.00","0.00","26.21","1","1","2021-04-03 16:50:11");
INSERT INTO kp_sale_items VALUES("397","254","86","0","1.00","290.00","0.00","290.00","2021-04-03","2","280.00","10.00","0.00","40.00","1","1","2021-04-03 16:53:09");
INSERT INTO kp_sale_items VALUES("398","255","178","0","2.00","90.00","0.00","180.00","2021-04-03","2","82.33","15.34","0.00","24.83","1","1","2021-04-03 16:53:48");
INSERT INTO kp_sale_items VALUES("399","256","27","0","1.00","205.00","0.00","205.00","2021-04-03","2","195.00","10.00","0.00","28.28","1","1","2021-04-03 17:03:10");
INSERT INTO kp_sale_items VALUES("400","256","165","0","1.00","100.00","0.00","100.00","2021-04-03","2","92.80","7.20","0.00","13.79","1","1","2021-04-03 17:03:19");
INSERT INTO kp_sale_items VALUES("401","257","159","0","4.00","250.00","0.00","1000.00","2021-04-03","2","205.00","180.00","0.00","137.93","1","1","2021-04-03 17:07:58");
INSERT INTO kp_sale_items VALUES("402","258","165","0","5.00","100.00","0.00","500.00","2021-04-03","2","92.80","36.00","0.00","68.97","1","1","2021-04-03 17:08:38");
INSERT INTO kp_sale_items VALUES("403","259","164","0","6.00","45.00","0.00","270.00","2021-04-03","2","39.00","36.00","0.00","37.24","1","1","2021-04-03 17:21:32");
INSERT INTO kp_sale_items VALUES("404","260","180","0","4.00","100.00","0.00","400.00","2021-04-03","2","79.17","83.32","0.00","0.00","2","1","2021-04-03 18:14:11");
INSERT INTO kp_sale_items VALUES("405","260","182","0","4.00","130.00","0.00","520.00","2021-04-03","2","120.00","40.00","0.00","0.00","2","1","2021-04-03 18:14:21");
INSERT INTO kp_sale_items VALUES("406","260","5","0","3.00","110.00","0.00","330.00","2021-04-03","2","0.00","330.00","0.00","45.52","1","1","2021-04-03 18:14:33");
INSERT INTO kp_sale_items VALUES("407","260","165","0","4.00","100.00","0.00","400.00","2021-04-03","2","92.80","28.80","0.00","55.17","1","1","2021-04-03 18:14:40");
INSERT INTO kp_sale_items VALUES("408","260","206","0","1.00","70.00","0.00","70.00","2021-04-03","2","0.00","70.00","0.00","9.66","1","1","2021-04-03 18:14:58");
INSERT INTO kp_sale_items VALUES("409","261","165","0","6.00","95.00","0.00","570.00","2021-04-03","2","92.80","13.20","0.00","78.62","1","1","2021-04-03 18:16:17");
INSERT INTO kp_sale_items VALUES("410","263","162","0","1.00","350.00","0.00","350.00","2021-04-03","2","320.00","30.00","0.00","48.28","1","1","2021-04-03 18:18:32");
INSERT INTO kp_sale_items VALUES("411","264","164","0","0.50","820.00","0.00","410.00","2021-04-03","2","39.00","390.50","0.00","56.55","1","1","2021-04-03 18:19:23");
INSERT INTO kp_sale_items VALUES("412","265","206","0","1.00","50.00","0.00","50.00","2021-04-03","2","0.00","50.00","0.00","6.90","1","1","2021-04-03 18:28:40");
INSERT INTO kp_sale_items VALUES("413","266","5","0","2.00","100.00","0.00","200.00","2021-04-03","2","0.00","200.00","0.00","27.59","1","1","2021-04-03 18:43:41");
INSERT INTO kp_sale_items VALUES("414","267","5","0","14.00","100.00","0.00","1400.00","2021-04-03","2","0.00","1400.00","0.00","193.10","1","1","2021-04-03 18:49:52");
INSERT INTO kp_sale_items VALUES("415","268","179","0","1.00","1000.00","0.00","1000.00","2021-04-05","2","950.00","50.00","0.00","137.93","1","1","2021-04-05 09:02:13");
INSERT INTO kp_sale_items VALUES("416","269","187","0","1.00","25.00","0.00","25.00","2021-04-05","2","0.00","25.00","0.00","3.45","1","1","2021-04-05 09:06:26");
INSERT INTO kp_sale_items VALUES("417","270","152","0","1.00","1820.00","0.00","1820.00","2021-04-05","2","1390.00","430.00","0.00","251.03","1","1","2021-04-05 10:43:57");
INSERT INTO kp_sale_items VALUES("418","271","228","0","1.00","1780.00","0.00","1780.00","2021-04-05","2","1720.00","60.00","0.00","245.52","1","1","2021-04-05 10:58:54");
INSERT INTO kp_sale_items VALUES("419","272","188","0","0.50","1120.00","0.00","560.00","2021-04-05","2","1050.00","35.00","0.00","77.24","1","1","2021-04-05 11:09:39");
INSERT INTO kp_sale_items VALUES("420","273","205","0","1.00","50.00","0.00","50.00","2021-04-05","2","47.00","3.00","0.00","6.90","1","1","2021-04-05 11:11:52");
INSERT INTO kp_sale_items VALUES("421","275","154","0","1.00","1470.00","0.00","1470.00","2021-04-05","2","1390.00","80.00","0.00","0.00","2","1","2021-04-05 11:55:23");
INSERT INTO kp_sale_items VALUES("422","276","219","0","3.00","130.00","0.00","390.00","2021-04-05","2","0.00","390.00","0.00","0.00","2","1","2021-04-05 12:10:49");
INSERT INTO kp_sale_items VALUES("423","277","154","0","1.00","1470.00","0.00","1470.00","2021-04-05","2","1390.00","80.00","0.00","0.00","2","1","2021-04-05 12:21:47");
INSERT INTO kp_sale_items VALUES("424","278","160","0","1.00","350.00","0.00","350.00","2021-04-05","2","320.00","30.00","0.00","48.28","1","1","2021-04-05 12:46:59");
INSERT INTO kp_sale_items VALUES("425","278","236","0","1.00","190.00","0.00","190.00","2021-04-05","2","150.00","40.00","0.00","26.21","1","1","2021-04-05 12:47:06");
INSERT INTO kp_sale_items VALUES("426","278","8","0","0.50","1580.00","0.00","790.00","2021-04-05","2","0.00","790.00","0.00","0.00","2","1","2021-04-05 12:47:32");
INSERT INTO kp_sale_items VALUES("427","278","179","0","0.50","1000.00","0.00","500.00","2021-04-05","2","950.00","25.00","0.00","68.97","1","1","2021-04-05 12:47:42");
INSERT INTO kp_sale_items VALUES("428","278","9","0","0.50","1580.00","0.00","790.00","2021-04-05","2","0.00","790.00","0.00","0.00","2","1","2021-04-05 12:48:09");
INSERT INTO kp_sale_items VALUES("429","278","14","0","0.50","2980.00","0.00","1490.00","2021-04-05","2","1440.00","770.00","0.00","0.00","2","1","2021-04-05 12:48:39");
INSERT INTO kp_sale_items VALUES("430","278","157","0","1.00","410.00","0.00","410.00","2021-04-05","2","30.42","379.58","0.00","56.55","1","1","2021-04-05 12:49:14");
INSERT INTO kp_sale_items VALUES("431","278","145","0","1.00","3570.00","0.00","3570.00","2021-04-05","2","3410.00","160.00","0.00","492.41","1","1","2021-04-05 12:49:26");
INSERT INTO kp_sale_items VALUES("432","278","58","0","3.00","50.00","0.00","150.00","2021-04-05","2","0.00","150.00","0.00","20.69","1","1","2021-04-05 12:49:36");
INSERT INTO kp_sale_items VALUES("433","278","169","0","1.00","250.00","0.00","250.00","2021-04-05","2","0.00","250.00","0.00","34.48","1","1","2021-04-05 12:49:52");
INSERT INTO kp_sale_items VALUES("434","278","139","0","1.00","225.00","0.00","225.00","2021-04-05","2","0.00","225.00","0.00","0.00","3","1","2021-04-05 12:50:01");
INSERT INTO kp_sale_items VALUES("435","278","138","0","0.50","600.00","0.00","300.00","2021-04-05","2","0.00","300.00","0.00","0.00","3","1","2021-04-05 12:50:26");
INSERT INTO kp_sale_items VALUES("436","278","238","0","1.00","125.00","0.00","125.00","2021-04-05","2","108.00","17.00","0.00","17.24","1","1","2021-04-05 12:51:05");
INSERT INTO kp_sale_items VALUES("437","278","176","0","2.00","105.00","0.00","210.00","2021-04-05","2","0.00","210.00","0.00","28.97","1","1","2021-04-05 12:52:03");
INSERT INTO kp_sale_items VALUES("438","278","83","0","1.00","180.00","0.00","180.00","2021-04-05","2","0.00","180.00","0.00","24.83","1","1","2021-04-05 12:52:45");
INSERT INTO kp_sale_items VALUES("439","278","84","0","1.00","140.00","0.00","140.00","2021-04-05","2","0.00","140.00","0.00","19.31","1","1","2021-04-05 12:52:54");
INSERT INTO kp_sale_items VALUES("440","278","121","0","1.00","550.00","0.00","550.00","2021-04-05","2","0.00","550.00","0.00","75.86","1","1","2021-04-05 12:53:14");
INSERT INTO kp_sale_items VALUES("441","278","123","0","1.00","520.00","0.00","520.00","2021-04-05","2","0.00","520.00","0.00","71.72","1","1","2021-04-05 12:53:23");
INSERT INTO kp_sale_items VALUES("442","278","201","0","1.00","155.00","0.00","155.00","2021-04-05","2","0.00","155.00","0.00","21.38","1","1","2021-04-05 12:53:35");
INSERT INTO kp_sale_items VALUES("443","278","54","0","1.00","100.00","0.00","100.00","2021-04-05","2","0.00","100.00","0.00","13.79","1","1","2021-04-05 12:53:50");
INSERT INTO kp_sale_items VALUES("444","278","205","0","4.00","50.00","0.00","200.00","2021-04-05","2","47.00","12.00","0.00","27.59","1","1","2021-04-05 12:54:06");
INSERT INTO kp_sale_items VALUES("445","278","118","0","1.00","570.00","0.00","570.00","2021-04-05","2","0.00","570.00","0.00","78.62","1","1","2021-04-05 12:54:31");
INSERT INTO kp_sale_items VALUES("446","278","62","0","2.00","110.00","0.00","220.00","2021-04-05","2","0.00","220.00","0.00","30.34","1","1","2021-04-05 12:55:15");
INSERT INTO kp_sale_items VALUES("447","278","75","0","2.00","110.00","0.00","220.00","2021-04-05","2","0.00","220.00","0.00","30.34","1","1","2021-04-05 12:55:24");
INSERT INTO kp_sale_items VALUES("448","278","68","0","3.00","105.00","0.00","315.00","2021-04-05","2","0.00","315.00","0.00","43.45","1","1","2021-04-05 12:55:43");
INSERT INTO kp_sale_items VALUES("449","278","135","0","1.00","480.00","0.00","480.00","2021-04-05","2","0.00","480.00","0.00","66.21","1","1","2021-04-05 12:56:12");
INSERT INTO kp_sale_items VALUES("450","278","33","0","1.00","250.00","0.00","250.00","2021-04-05","2","230.00","20.00","0.00","34.48","1","1","2021-04-05 12:56:32");
INSERT INTO kp_sale_items VALUES("451","278","32","0","1.00","250.00","0.00","250.00","2021-04-05","2","230.00","20.00","0.00","34.48","1","1","2021-04-05 12:56:41");
INSERT INTO kp_sale_items VALUES("452","278","167","0","3.00","90.00","0.00","270.00","2021-04-05","2","0.00","270.00","0.00","37.24","1","1","2021-04-05 12:56:54");
INSERT INTO kp_sale_items VALUES("453","278","225","0","1.00","130.00","0.00","130.00","2021-04-05","2","0.00","130.00","0.00","17.93","1","1","2021-04-05 12:57:04");
INSERT INTO kp_sale_items VALUES("454","278","82","0","2.00","110.00","0.00","220.00","2021-04-05","2","0.00","220.00","0.00","30.34","1","1","2021-04-05 12:58:22");
INSERT INTO kp_sale_items VALUES("455","278","194","0","1.00","260.00","0.00","260.00","2021-04-05","2","250.00","10.00","0.00","35.86","1","1","2021-04-05 12:58:31");
INSERT INTO kp_sale_items VALUES("456","278","136","0","1.00","350.00","0.00","350.00","2021-04-05","2","0.00","350.00","0.00","48.28","1","1","2021-04-05 12:58:41");
INSERT INTO kp_sale_items VALUES("457","278","141","0","0.50","4780.00","0.00","2390.00","2021-04-05","2","4640.00","70.00","0.00","329.66","1","1","2021-04-05 12:59:10");
INSERT INTO kp_sale_items VALUES("458","278","166","0","2.00","110.00","0.00","220.00","2021-04-05","2","0.00","220.00","0.00","30.34","1","1","2021-04-05 12:59:53");
INSERT INTO kp_sale_items VALUES("459","278","77","0","0.50","2860.00","0.00","1430.00","2021-04-05","2","0.00","1430.00","0.00","197.24","1","1","2021-04-05 13:00:21");
INSERT INTO kp_sale_items VALUES("460","278","37","0","1.00","70.00","0.00","70.00","2021-04-05","2","0.00","70.00","0.00","9.66","1","1","2021-04-05 13:02:54");
INSERT INTO kp_sale_items VALUES("461","278","216","0","1.00","100.00","0.00","100.00","2021-04-05","2","0.00","100.00","0.00","13.79","1","1","2021-04-05 13:03:04");
INSERT INTO kp_sale_items VALUES("462","279","165","0","4.00","100.00","0.00","400.00","2021-04-05","2","92.80","28.80","0.00","55.17","1","1","2021-04-05 13:14:42");
INSERT INTO kp_sale_items VALUES("463","279","239","0","4.00","40.00","0.00","160.00","2021-04-05","2","0.00","160.00","0.00","22.07","1","1","2021-04-05 13:18:06");
INSERT INTO kp_sale_items VALUES("464","280","196","0","1.00","120.00","0.00","120.00","2021-04-05","2","0.00","120.00","0.00","16.55","1","1","2021-04-05 13:42:05");
INSERT INTO kp_sale_items VALUES("465","282","27","0","1.00","205.00","0.00","205.00","2021-04-05","2","195.00","10.00","0.00","28.28","1","1","2021-04-05 14:16:03");
INSERT INTO kp_sale_items VALUES("466","282","167","0","1.00","90.00","0.00","90.00","2021-04-05","2","0.00","90.00","0.00","12.41","1","1","2021-04-05 14:16:17");
INSERT INTO kp_sale_items VALUES("467","283","121","0","1.00","550.00","0.00","550.00","2021-04-05","2","0.00","550.00","0.00","75.86","1","1","2021-04-05 14:33:50");
INSERT INTO kp_sale_items VALUES("468","284","165","0","2.00","100.00","0.00","200.00","2021-04-05","2","92.80","14.40","0.00","27.59","1","1","2021-04-05 15:05:26");
INSERT INTO kp_sale_items VALUES("469","285","188","0","1.00","1080.00","0.00","1080.00","2021-04-05","2","1050.00","30.00","0.00","148.97","1","1","2021-04-05 15:12:04");
INSERT INTO kp_sale_items VALUES("470","286","182","0","2.00","135.00","0.00","270.00","2021-04-05","2","120.00","30.00","0.00","0.00","2","1","2021-04-05 15:13:01");
INSERT INTO kp_sale_items VALUES("471","286","164","0","0.50","820.00","0.00","410.00","2021-04-05","2","39.00","390.50","0.00","56.55","1","1","2021-04-05 15:13:12");
INSERT INTO kp_sale_items VALUES("472","286","250","0","1.00","65.00","0.00","65.00","2021-04-05","2","0.00","65.00","0.00","8.97","1","1","2021-04-05 15:14:27");
INSERT INTO kp_sale_items VALUES("473","287","14","0","1.00","1480.00","0.00","1480.00","2021-04-05","2","1440.00","40.00","0.00","0.00","2","1","2021-04-05 15:18:15");
INSERT INTO kp_sale_items VALUES("474","287","10","0","1.00","1570.00","0.00","1570.00","2021-04-05","2","0.00","1570.00","0.00","0.00","2","1","2021-04-05 15:18:39");
INSERT INTO kp_sale_items VALUES("475","288","170","0","1.00","190.00","0.00","190.00","2021-04-05","2","171.50","18.50","0.00","26.21","1","1","2021-04-05 15:26:59");
INSERT INTO kp_sale_items VALUES("476","290","251","0","1.00","540.00","0.00","540.00","2021-04-05","2","0.00","540.00","0.00","0.00","2","1","2021-04-05 15:32:27");
INSERT INTO kp_sale_items VALUES("477","291","14","0","1.00","1480.00","0.00","1480.00","2021-04-05","2","1440.00","40.00","0.00","0.00","2","1","2021-04-05 15:33:58");
INSERT INTO kp_sale_items VALUES("478","292","14","0","1.00","1480.00","0.00","1480.00","2021-04-05","2","1440.00","40.00","0.00","0.00","2","1","2021-04-05 15:35:23");
INSERT INTO kp_sale_items VALUES("479","293","168","0","1.00","50.00","0.00","50.00","2021-04-05","2","0.00","50.00","0.00","6.90","1","1","2021-04-05 15:43:35");
INSERT INTO kp_sale_items VALUES("480","293","32","0","1.00","250.00","0.00","250.00","2021-04-05","2","230.00","20.00","0.00","34.48","1","1","2021-04-05 15:43:55");
INSERT INTO kp_sale_items VALUES("481","294","139","0","1.00","225.00","0.00","225.00","2021-04-05","2","0.00","225.00","0.00","0.00","3","1","2021-04-05 15:46:19");
INSERT INTO kp_sale_items VALUES("482","295","5","0","2.00","110.00","0.00","220.00","2021-04-05","2","0.00","220.00","0.00","30.34","1","1","2021-04-05 15:47:04");
INSERT INTO kp_sale_items VALUES("483","295","91","0","3.00","75.00","0.00","225.00","2021-04-05","2","0.00","225.00","0.00","0.00","0","1","2021-04-05 15:47:57");
INSERT INTO kp_sale_items VALUES("484","296","69","0","2.00","55.00","0.00","110.00","2021-04-05","2","0.00","110.00","0.00","15.17","1","1","2021-04-05 16:07:29");
INSERT INTO kp_sale_items VALUES("485","297","201","0","1.00","155.00","0.00","155.00","2021-04-05","2","0.00","155.00","0.00","21.38","1","1","2021-04-05 16:13:40");
INSERT INTO kp_sale_items VALUES("486","298","179","0","1.00","1050.00","0.00","1050.00","2021-04-05","2","950.00","100.00","0.00","144.83","1","1","2021-04-05 16:23:03");
INSERT INTO kp_sale_items VALUES("487","299","39","0","1.00","70.00","0.00","70.00","2021-04-05","2","0.00","70.00","0.00","9.66","1","1","2021-04-05 16:35:41");
INSERT INTO kp_sale_items VALUES("488","299","37","0","1.00","75.00","0.00","75.00","2021-04-05","2","0.00","75.00","0.00","10.34","1","1","2021-04-05 16:40:57");
INSERT INTO kp_sale_items VALUES("489","299","85","0","1.00","590.00","0.00","590.00","2021-04-05","2","560.00","30.00","0.00","81.38","1","1","2021-04-05 16:41:22");
INSERT INTO kp_sale_items VALUES("490","300","5","0","1.00","110.00","0.00","110.00","2021-04-05","2","0.00","110.00","0.00","15.17","1","1","2021-04-05 18:06:57");
INSERT INTO kp_sale_items VALUES("491","300","165","0","1.00","100.00","0.00","100.00","2021-04-05","2","92.80","7.20","0.00","13.79","1","1","2021-04-05 18:07:07");
INSERT INTO kp_sale_items VALUES("492","301","92","0","1.00","1270.00","0.00","1270.00","2021-04-05","2","0.00","1270.00","0.00","0.00","0","1","2021-04-05 18:08:34");
INSERT INTO kp_sale_items VALUES("493","302","234","0","0.50","2460.00","0.00","1230.00","2021-04-05","2","2330.00","65.00","0.00","169.66","1","1","2021-04-05 18:11:17");
INSERT INTO kp_sale_items VALUES("494","302","165","0","3.00","100.00","0.00","300.00","2021-04-05","2","92.80","21.60","0.00","41.38","1","1","2021-04-05 18:13:13");
INSERT INTO kp_sale_items VALUES("495","302","252","0","1.00","300.00","0.00","300.00","2021-04-05","2","0.00","300.00","0.00","41.38","1","1","2021-04-05 18:13:22");
INSERT INTO kp_sale_items VALUES("496","302","77","0","1.00","120.00","0.00","120.00","2021-04-05","2","0.00","120.00","0.00","16.55","1","1","2021-04-05 18:13:30");
INSERT INTO kp_sale_items VALUES("497","302","238","0","1.00","125.00","0.00","125.00","2021-04-05","2","108.00","17.00","0.00","17.24","1","1","2021-04-05 18:16:47");
INSERT INTO kp_sale_items VALUES("498","304","170","0","0.50","200.00","0.00","100.00","2021-04-05","2","171.50","14.25","0.00","13.79","1","1","2021-04-05 18:18:39");
INSERT INTO kp_sale_items VALUES("499","305","165","0","1.00","100.00","0.00","100.00","2021-04-05","2","92.80","7.20","0.00","13.79","1","1","2021-04-05 18:19:21");
INSERT INTO kp_sale_items VALUES("500","306","165","0","5.00","100.00","0.00","500.00","2021-04-05","2","92.80","36.00","0.00","68.97","1","1","2021-04-05 18:24:46");
INSERT INTO kp_sale_items VALUES("501","307","14","0","1.00","1490.00","0.00","1490.00","2021-04-05","2","1440.00","50.00","0.00","0.00","2","1","2021-04-05 18:36:16");
INSERT INTO kp_sale_items VALUES("502","308","172","0","1.00","230.00","0.00","230.00","2021-04-05","2","0.00","230.00","0.00","31.72","1","1","2021-04-05 18:40:17");
INSERT INTO kp_sale_items VALUES("503","310","253","0","1.00","2150.00","0.00","2150.00","2021-04-05","2","1980.00","170.00","0.00","296.55","1","1","2021-04-05 18:44:11");
INSERT INTO kp_sale_items VALUES("504","311","205","0","2.00","50.00","0.00","100.00","2021-04-05","2","47.00","6.00","0.00","13.79","1","1","2021-04-05 18:48:17");
INSERT INTO kp_sale_items VALUES("505","312","5","0","1.00","100.00","0.00","100.00","2021-04-05","2","0.00","100.00","0.00","13.79","1","1","2021-04-05 18:53:27");
INSERT INTO kp_sale_items VALUES("506","313","141","0","0.50","4780.00","0.00","2390.00","2021-04-06","2","4640.00","70.00","0.00","329.66","1","1","2021-04-06 08:24:56");
INSERT INTO kp_sale_items VALUES("507","314","233","0","0.50","2500.00","0.00","1250.00","2021-04-06","2","2380.00","60.00","0.00","172.41","1","1","2021-04-06 08:29:15");
INSERT INTO kp_sale_items VALUES("508","314","23","0","1.00","200.00","0.00","200.00","2021-04-06","2","190.00","10.00","0.00","27.59","1","1","2021-04-06 08:29:27");
INSERT INTO kp_sale_items VALUES("509","315","5","0","1.00","110.00","0.00","110.00","2021-04-06","2","0.00","110.00","0.00","15.17","1","1","2021-04-06 08:48:30");
INSERT INTO kp_sale_items VALUES("510","316","186","0","1.00","25.00","0.00","25.00","2021-04-06","2","0.00","25.00","0.00","0.00","0","1","2021-04-06 08:52:53");
INSERT INTO kp_sale_items VALUES("511","317","5","0","18.00","98.00","0.00","1764.00","2021-04-06","2","0.00","1764.00","0.00","243.31","1","1","2021-04-06 09:35:01");
INSERT INTO kp_sale_items VALUES("512","318","203","0","1.00","55.00","0.00","55.00","2021-04-06","2","0.00","55.00","0.00","7.59","1","1","2021-04-06 09:45:51");
INSERT INTO kp_sale_items VALUES("513","319","165","0","5.00","100.00","0.00","500.00","2021-04-06","2","92.80","36.00","0.00","68.97","1","1","2021-04-06 11:31:28");
INSERT INTO kp_sale_items VALUES("514","320","14","0","1.00","1490.00","0.00","1490.00","2021-04-06","2","1440.00","50.00","0.00","0.00","2","1","2021-04-06 13:19:45");
INSERT INTO kp_sale_items VALUES("515","321","18","0","4.00","3600.00","0.00","14400.00","2021-04-06","2","0.00","14400.00","0.00","1986.21","1","1","2021-04-06 15:03:51");
INSERT INTO kp_sale_items VALUES("516","321","12","0","5.00","1170.00","0.00","5850.00","2021-04-06","2","0.00","5850.00","0.00","0.00","2","1","2021-04-06 15:04:19");
INSERT INTO kp_sale_items VALUES("517","321","242","0","5.00","1530.00","0.00","7650.00","2021-04-06","2","1470.00","300.00","0.00","0.00","2","1","2021-04-06 15:04:40");
INSERT INTO kp_sale_items VALUES("518","321","243","0","4.00","127.50","0.00","510.00","2021-04-06","2","122.50","20.00","0.00","70.34","1","1","2021-04-06 15:07:08");
INSERT INTO kp_sale_items VALUES("519","321","254","0","4.00","97.50","0.00","390.00","2021-04-06","2","95.00","10.00","0.00","0.00","2","1","2021-04-06 15:09:10");
INSERT INTO kp_sale_items VALUES("520","321","5","0","7.00","84.00","0.00","588.00","2021-04-06","2","0.00","588.00","0.00","81.10","1","1","2021-04-06 15:09:40");
INSERT INTO kp_sale_items VALUES("521","321","253","0","4.00","2100.00","0.00","8400.00","2021-04-06","2","1980.00","480.00","0.00","1158.62","1","1","2021-04-06 15:10:46");
INSERT INTO kp_sale_items VALUES("522","323","161","0","1.00","350.00","0.00","350.00","2021-04-06","2","205.00","145.00","0.00","48.28","1","1","2021-04-06 16:03:53");
INSERT INTO kp_sale_items VALUES("523","324","233","0","1.00","2450.00","0.00","2450.00","2021-04-06","2","2380.00","70.00","0.00","337.93","1","1","2021-04-06 16:27:40");
INSERT INTO kp_sale_items VALUES("524","326","255","0","1.00","490.00","0.00","490.00","2021-04-06","2","475.00","15.00","0.00","67.59","1","1","2021-04-06 17:08:16");
INSERT INTO kp_sale_items VALUES("525","326","62","0","1.00","110.00","0.00","110.00","2021-04-06","2","0.00","110.00","0.00","15.17","1","1","2021-04-06 17:08:32");
INSERT INTO kp_sale_items VALUES("526","326","68","0","1.00","105.00","0.00","105.00","2021-04-06","2","0.00","105.00","0.00","14.48","1","1","2021-04-06 17:08:42");
INSERT INTO kp_sale_items VALUES("527","326","73","0","1.00","330.00","0.00","330.00","2021-04-06","2","0.00","330.00","0.00","45.52","1","1","2021-04-06 17:08:52");
INSERT INTO kp_sale_items VALUES("528","326","67","0","0.50","230.00","0.00","115.00","2021-04-06","2","0.00","115.00","0.00","15.86","1","1","2021-04-06 17:10:11");
INSERT INTO kp_sale_items VALUES("529","327","234","0","0.50","2460.00","0.00","1230.00","2021-04-06","2","2330.00","65.00","0.00","169.66","1","1","2021-04-06 17:20:35");
INSERT INTO kp_sale_items VALUES("530","328","141","0","0.50","4780.00","0.00","2390.00","2021-04-06","2","4640.00","70.00","0.00","329.66","1","1","2021-04-06 17:26:17");
INSERT INTO kp_sale_items VALUES("531","329","233","0","1.00","2470.00","0.00","2470.00","2021-04-06","2","2380.00","90.00","0.00","340.69","1","1","2021-04-06 17:43:39");
INSERT INTO kp_sale_items VALUES("532","329","255","0","1.00","490.00","0.00","490.00","2021-04-06","2","475.00","15.00","0.00","67.59","1","1","2021-04-06 17:43:49");
INSERT INTO kp_sale_items VALUES("533","329","8","0","0.50","1580.00","0.00","790.00","2021-04-06","2","0.00","790.00","0.00","0.00","2","1","2021-04-06 17:44:57");
INSERT INTO kp_sale_items VALUES("534","331","260","0","2.00","1776.00","0.00","3552.00","2021-04-06","2","1440.00","672.00","0.00","0.00","3","1","2021-04-06 17:51:14");
INSERT INTO kp_sale_items VALUES("535","332","255","0","1.00","490.00","0.00","490.00","2021-04-06","2","475.00","15.00","0.00","67.59","1","1","2021-04-06 17:52:37");
INSERT INTO kp_sale_items VALUES("536","333","165","0","2.00","100.00","0.00","200.00","2021-04-06","2","92.80","14.40","0.00","27.59","1","1","2021-04-06 17:53:02");
INSERT INTO kp_sale_items VALUES("537","334","5","0","1.00","90.00","0.00","90.00","2021-04-06","2","0.00","90.00","0.00","12.41","1","1","2021-04-06 18:00:39");
INSERT INTO kp_sale_items VALUES("538","335","27","0","1.00","205.00","0.00","205.00","2021-04-06","2","195.00","10.00","0.00","28.28","1","1","2021-04-06 18:11:46");
INSERT INTO kp_sale_items VALUES("539","336","233","0","1.00","2470.00","0.00","2470.00","2021-04-06","2","2380.00","90.00","0.00","340.69","1","1","2021-04-06 18:13:21");
INSERT INTO kp_sale_items VALUES("540","337","5","0","5.00","110.00","0.00","550.00","2021-04-06","2","0.00","550.00","0.00","75.86","1","1","2021-04-06 18:14:48");
INSERT INTO kp_sale_items VALUES("541","338","141","0","2.00","4670.00","0.00","9340.00","2021-04-06","2","4640.00","60.00","0.00","1288.28","1","1","2021-04-06 18:23:21");
INSERT INTO kp_sale_items VALUES("542","339","141","0","2.00","4750.00","0.00","9500.00","2021-04-06","2","4640.00","220.00","0.00","1310.34","1","1","2021-04-06 18:29:18");
INSERT INTO kp_sale_items VALUES("543","342","261","0","2.00","100.00","0.00","200.00","2021-04-06","2","0.00","200.00","0.00","27.59","1","1","2021-04-06 18:39:28");
INSERT INTO kp_sale_items VALUES("544","343","165","0","1.00","100.00","0.00","100.00","2021-04-06","2","92.80","7.20","0.00","13.79","1","1","2021-04-06 18:49:00");
INSERT INTO kp_sale_items VALUES("545","344","233","0","1.00","2450.00","0.00","2450.00","2021-04-07","2","2380.00","70.00","0.00","337.93","1","1","2021-04-07 07:58:30");
INSERT INTO kp_sale_items VALUES("546","344","141","0","0.50","4780.00","0.00","2390.00","2021-04-07","2","4640.00","70.00","0.00","329.66","1","1","2021-04-07 07:58:44");
INSERT INTO kp_sale_items VALUES("547","346","262","0","1.00","1090.00","0.00","1090.00","2021-04-07","2","1030.00","60.00","0.00","0.00","2","1","2021-04-07 08:59:21");
INSERT INTO kp_sale_items VALUES("548","347","136","0","1.00","350.00","0.00","350.00","2021-04-07","2","0.00","350.00","0.00","48.28","1","1","2021-04-07 09:03:17");
INSERT INTO kp_sale_items VALUES("549","348","165","0","4.00","100.00","0.00","400.00","2021-04-07","2","92.80","28.80","0.00","55.17","1","1","2021-04-07 09:34:23");
INSERT INTO kp_sale_items VALUES("550","349","154","0","1.00","1470.00","0.00","1470.00","2021-04-07","2","1390.00","80.00","0.00","0.00","2","1","2021-04-07 09:42:44");
INSERT INTO kp_sale_items VALUES("551","350","144","0","0.50","820.00","0.00","410.00","2021-04-07","2","780.00","20.00","0.00","56.55","1","1","2021-04-07 09:44:02");
INSERT INTO kp_sale_items VALUES("552","351","8","0","1.00","1550.00","0.00","1550.00","2021-04-07","2","0.00","1550.00","0.00","0.00","2","1","2021-04-07 09:59:31");
INSERT INTO kp_sale_items VALUES("553","355","165","0","5.00","100.00","0.00","500.00","2021-04-07","2","92.80","36.00","0.00","68.97","1","1","2021-04-07 13:05:51");
INSERT INTO kp_sale_items VALUES("554","355","205","0","3.00","50.00","0.00","150.00","2021-04-07","2","47.00","9.00","0.00","20.69","1","1","2021-04-07 13:06:31");
INSERT INTO kp_sale_items VALUES("555","356","236","0","1.00","190.00","0.00","190.00","2021-04-07","2","150.00","40.00","0.00","26.21","1","1","2021-04-07 13:10:48");
INSERT INTO kp_sale_items VALUES("556","357","188","0","1.00","1100.00","0.00","1100.00","2021-04-07","2","1050.00","50.00","0.00","151.72","1","1","2021-04-07 14:40:17");
INSERT INTO kp_sale_items VALUES("557","358","255","0","1.00","490.00","0.00","490.00","2021-04-07","2","475.00","15.00","0.00","67.59","1","1","2021-04-07 15:24:34");
INSERT INTO kp_sale_items VALUES("558","358","166","0","1.00","55.00","0.00","55.00","2021-04-07","2","0.00","55.00","0.00","7.59","1","1","2021-04-07 15:25:30");
INSERT INTO kp_sale_items VALUES("559","358","37","0","1.00","75.00","0.00","75.00","2021-04-07","2","0.00","75.00","0.00","10.34","1","1","2021-04-07 15:25:44");
INSERT INTO kp_sale_items VALUES("560","358","23","0","1.00","200.00","0.00","200.00","2021-04-07","2","190.00","10.00","0.00","27.59","1","1","2021-04-07 15:26:09");
INSERT INTO kp_sale_items VALUES("561","360","259","0","1.00","450.00","0.00","450.00","2021-04-07","2","408.33","41.67","0.00","62.07","1","1","2021-04-07 15:38:16");
INSERT INTO kp_sale_items VALUES("562","361","170","0","1.00","180.00","0.00","180.00","2021-04-07","2","171.50","8.50","0.00","24.83","1","1","2021-04-07 16:01:32");
INSERT INTO kp_sale_items VALUES("563","362","180","0","2.00","100.00","0.00","200.00","2021-04-07","2","79.17","41.66","0.00","0.00","2","1","2021-04-07 16:13:18");
INSERT INTO kp_sale_items VALUES("564","363","165","0","1.00","100.00","0.00","100.00","2021-04-07","2","92.80","7.20","0.00","13.79","1","1","2021-04-07 16:45:56");
INSERT INTO kp_sale_items VALUES("565","363","5","0","2.00","100.00","0.00","200.00","2021-04-07","2","0.00","200.00","0.00","27.59","1","1","2021-04-07 16:46:16");
INSERT INTO kp_sale_items VALUES("566","363","182","0","1.00","130.00","0.00","130.00","2021-04-07","2","120.00","10.00","0.00","0.00","2","1","2021-04-07 16:46:56");
INSERT INTO kp_sale_items VALUES("567","363","180","0","2.00","100.00","0.00","200.00","2021-04-07","2","79.17","41.66","0.00","0.00","2","1","2021-04-07 16:47:43");
INSERT INTO kp_sale_items VALUES("568","363","137","0","1.00","35.00","0.00","35.00","2021-04-07","2","0.00","35.00","0.00","0.00","3","1","2021-04-07 16:49:58");
INSERT INTO kp_sale_items VALUES("569","363","189","0","1.00","120.00","0.00","120.00","2021-04-07","2","105.00","15.00","0.00","16.55","1","1","2021-04-07 16:54:17");
INSERT INTO kp_sale_items VALUES("570","364","75","0","1.00","110.00","0.00","110.00","2021-04-07","2","0.00","110.00","0.00","15.17","1","1","2021-04-07 16:59:27");
INSERT INTO kp_sale_items VALUES("571","364","74","0","1.00","145.00","0.00","145.00","2021-04-07","2","0.00","145.00","0.00","20.00","1","1","2021-04-07 17:03:01");
INSERT INTO kp_sale_items VALUES("572","364","73","0","1.00","330.00","0.00","330.00","2021-04-07","2","0.00","330.00","0.00","45.52","1","1","2021-04-07 17:03:12");
INSERT INTO kp_sale_items VALUES("573","364","255","0","1.00","490.00","0.00","490.00","2021-04-07","2","475.00","15.00","0.00","67.59","1","1","2021-04-07 17:04:29");
INSERT INTO kp_sale_items VALUES("574","365","37","0","1.00","75.00","0.00","75.00","2021-04-07","2","0.00","75.00","0.00","10.34","1","1","2021-04-07 17:12:07");
INSERT INTO kp_sale_items VALUES("575","366","5","0","1.00","90.00","0.00","90.00","2021-04-07","2","0.00","90.00","0.00","12.41","1","1","2021-04-07 17:37:43");
INSERT INTO kp_sale_items VALUES("576","367","187","0","1.00","25.00","0.00","25.00","2021-04-07","2","0.00","25.00","0.00","3.45","1","1","2021-04-07 17:38:25");
INSERT INTO kp_sale_items VALUES("577","368","208","0","1.00","35.00","0.00","35.00","2021-04-07","2","0.00","35.00","0.00","4.83","1","1","2021-04-07 17:42:34");
INSERT INTO kp_sale_items VALUES("578","368","176","0","1.00","105.00","0.00","105.00","2021-04-07","2","0.00","105.00","0.00","14.48","1","1","2021-04-07 17:43:35");
INSERT INTO kp_sale_items VALUES("579","369","5","0","2.00","100.00","0.00","200.00","2021-04-07","2","0.00","200.00","0.00","27.59","1","1","2021-04-07 17:54:48");
INSERT INTO kp_sale_items VALUES("580","370","141","0","4.00","4750.00","0.00","19000.00","2021-04-07","2","4640.00","440.00","0.00","2620.69","1","1","2021-04-07 18:15:32");
INSERT INTO kp_sale_items VALUES("581","371","234","0","1.00","2470.00","0.00","2470.00","2021-04-07","2","2330.00","140.00","0.00","340.69","1","1","2021-04-07 18:19:11");
INSERT INTO kp_sale_items VALUES("582","372","141","0","0.25","4760.00","0.00","1190.00","2021-04-07","2","4640.00","30.00","0.00","164.14","1","1","2021-04-07 18:22:07");
INSERT INTO kp_sale_items VALUES("583","373","5","0","4.00","110.00","0.00","440.00","2021-04-07","2","0.00","440.00","0.00","60.69","1","1","2021-04-07 18:23:16");
INSERT INTO kp_sale_items VALUES("584","374","253","0","0.50","2100.00","0.00","1050.00","2021-04-07","2","1980.00","60.00","0.00","144.83","1","1","2021-04-07 18:26:24");
INSERT INTO kp_sale_items VALUES("585","374","165","0","2.00","100.00","0.00","200.00","2021-04-07","2","92.80","14.40","0.00","27.59","1","1","2021-04-07 18:26:37");
INSERT INTO kp_sale_items VALUES("586","375","23","0","1.00","200.00","0.00","200.00","2021-04-07","2","190.00","10.00","0.00","27.59","1","1","2021-04-07 18:35:10");
INSERT INTO kp_sale_items VALUES("587","376","194","0","1.00","260.00","0.00","260.00","2021-04-08","2","250.00","10.00","0.00","35.86","1","1","2021-04-08 08:14:40");
INSERT INTO kp_sale_items VALUES("588","377","62","0","1.00","110.00","0.00","110.00","2021-04-08","2","0.00","110.00","0.00","15.17","1","1","2021-04-08 08:37:35");
INSERT INTO kp_sale_items VALUES("589","377","178","0","1.00","90.00","0.00","90.00","2021-04-08","2","82.33","7.67","0.00","12.41","1","1","2021-04-08 08:37:43");
INSERT INTO kp_sale_items VALUES("590","378","66","0","1.00","50.00","0.00","50.00","2021-04-08","2","0.00","50.00","0.00","6.90","1","1","2021-04-08 08:41:21");
INSERT INTO kp_sale_items VALUES("591","379","8","0","1.00","1550.00","0.00","1550.00","0000-00-00","2","0.00","1550.00","0.00","0.00","2","1","2021-04-08 12:39:16");
INSERT INTO kp_sale_items VALUES("592","379","179","0","1.00","1050.00","0.00","1050.00","0000-00-00","2","950.00","100.00","0.00","144.83","1","1","2021-04-08 12:40:11");
INSERT INTO kp_sale_items VALUES("593","379","135","0","1.00","480.00","0.00","480.00","0000-00-00","2","0.00","480.00","0.00","66.21","1","1","2021-04-08 12:41:04");
INSERT INTO kp_sale_items VALUES("594","379","136","0","1.00","350.00","0.00","350.00","0000-00-00","2","0.00","350.00","0.00","48.28","1","1","2021-04-08 12:44:16");
INSERT INTO kp_sale_items VALUES("595","379","119","0","1.00","570.00","0.00","570.00","0000-00-00","2","0.00","570.00","0.00","78.62","1","1","2021-04-08 12:46:00");
INSERT INTO kp_sale_items VALUES("596","380","236","0","1.00","190.00","0.00","190.00","0000-00-00","2","150.00","40.00","0.00","26.21","1","1","2021-04-08 13:18:17");
INSERT INTO kp_sale_items VALUES("597","381","165","0","0.50","100.00","0.00","50.00","2021-04-08","2","92.80","3.60","0.00","6.90","1","1","2021-04-08 13:20:17");
INSERT INTO kp_sale_items VALUES("598","385","23","0","1.00","200.00","0.00","200.00","2021-04-08","2","190.00","10.00","0.00","27.59","1","1","2021-04-08 14:27:18");
INSERT INTO kp_sale_items VALUES("599","386","121","0","1.00","550.00","0.00","550.00","2021-04-08","2","0.00","550.00","0.00","75.86","1","1","2021-04-08 15:10:28");
INSERT INTO kp_sale_items VALUES("600","387","218","0","1.00","1430.00","0.00","1430.00","2021-04-08","2","0.00","1430.00","0.00","0.00","2","1","2021-04-08 15:16:47");
INSERT INTO kp_sale_items VALUES("601","388","23","0","1.00","200.00","0.00","200.00","2021-04-08","2","190.00","10.00","0.00","27.59","1","1","2021-04-08 15:35:00");
INSERT INTO kp_sale_items VALUES("602","389","170","0","1.00","190.00","0.00","190.00","2021-04-08","2","171.50","18.50","0.00","26.21","1","1","2021-04-08 15:35:48");
INSERT INTO kp_sale_items VALUES("603","390","219","0","1.00","130.00","0.00","130.00","2021-04-08","2","0.00","130.00","0.00","0.00","2","1","2021-04-08 15:48:07");
INSERT INTO kp_sale_items VALUES("604","391","176","0","1.00","105.00","0.00","105.00","2021-04-08","2","0.00","105.00","0.00","14.48","1","1","2021-04-08 15:54:07");
INSERT INTO kp_sale_items VALUES("605","391","173","0","1.00","60.00","0.00","60.00","2021-04-08","2","47.00","13.00","0.00","8.28","1","1","2021-04-08 15:54:17");
INSERT INTO kp_sale_items VALUES("606","391","165","0","2.00","100.00","0.00","200.00","2021-04-08","2","92.80","14.40","0.00","27.59","1","1","2021-04-08 15:54:27");
INSERT INTO kp_sale_items VALUES("607","392","236","0","1.00","190.00","0.00","190.00","2021-04-08","2","150.00","40.00","0.00","26.21","1","1","2021-04-08 15:59:28");
INSERT INTO kp_sale_items VALUES("608","393","258","0","1.00","500.00","0.00","500.00","2021-04-08","2","475.00","25.00","0.00","68.97","1","1","2021-04-08 16:36:09");
INSERT INTO kp_sale_items VALUES("609","394","170","0","0.50","200.00","0.00","100.00","0000-00-00","2","171.50","14.25","0.00","13.79","1","1","2021-04-08 17:27:19");
INSERT INTO kp_sale_items VALUES("610","395","196","0","1.00","120.00","0.00","120.00","2021-04-08","2","0.00","120.00","0.00","16.55","1","1","2021-04-08 17:34:07");
INSERT INTO kp_sale_items VALUES("611","395","165","0","1.00","100.00","0.00","100.00","2021-04-08","2","92.80","7.20","0.00","13.79","1","1","2021-04-08 17:34:32");
INSERT INTO kp_sale_items VALUES("612","395","263","0","1.00","20.00","0.00","20.00","2021-04-08","2","0.00","20.00","0.00","2.76","1","1","2021-04-08 17:36:59");
INSERT INTO kp_sale_items VALUES("613","395","66","0","1.00","50.00","0.00","50.00","2021-04-08","2","0.00","50.00","0.00","6.90","1","1","2021-04-08 17:37:24");
INSERT INTO kp_sale_items VALUES("614","395","224","0","1.00","80.00","0.00","80.00","2021-04-08","2","0.00","80.00","0.00","11.03","1","1","2021-04-08 17:37:34");
INSERT INTO kp_sale_items VALUES("615","396","178","0","1.00","90.00","0.00","90.00","0000-00-00","2","82.33","7.67","0.00","12.41","1","1","2021-04-08 17:38:58");
INSERT INTO kp_sale_items VALUES("616","397","179","0","0.50","1140.00","0.00","570.00","0000-00-00","2","950.00","95.00","0.00","78.62","1","1","2021-04-08 17:45:28");
INSERT INTO kp_sale_items VALUES("617","398","251","0","1.00","550.00","0.00","550.00","0000-00-00","2","0.00","550.00","0.00","0.00","2","1","2021-04-08 17:46:30");
INSERT INTO kp_sale_items VALUES("618","399","138","0","1.00","590.00","0.00","590.00","2021-04-08","2","0.00","590.00","0.00","0.00","3","1","2021-04-08 17:49:11");
INSERT INTO kp_sale_items VALUES("619","400","5","0","2.00","110.00","0.00","220.00","2021-04-08","2","0.00","220.00","0.00","30.34","1","1","2021-04-08 17:51:00");
INSERT INTO kp_sale_items VALUES("620","401","5","0","2.00","110.00","0.00","220.00","2021-04-08","2","0.00","220.00","0.00","30.34","1","1","2021-04-08 17:51:26");
INSERT INTO kp_sale_items VALUES("621","402","5","0","1.00","90.00","0.00","90.00","2021-04-08","2","0.00","90.00","0.00","12.41","1","1","2021-04-08 17:53:03");
INSERT INTO kp_sale_items VALUES("622","403","5","0","1.00","90.00","0.00","90.00","2021-04-08","2","0.00","90.00","0.00","12.41","1","1","2021-04-08 17:53:56");
INSERT INTO kp_sale_items VALUES("623","404","178","0","1.00","90.00","0.00","90.00","2021-04-08","2","82.33","7.67","0.00","12.41","1","1","2021-04-08 18:00:13");
INSERT INTO kp_sale_items VALUES("624","405","254","0","1.00","110.00","0.00","110.00","2021-04-08","2","95.00","15.00","0.00","0.00","2","1","2021-04-08 18:05:57");
INSERT INTO kp_sale_items VALUES("625","405","5","0","1.00","110.00","0.00","110.00","2021-04-08","2","0.00","110.00","0.00","15.17","1","1","2021-04-08 18:06:03");
INSERT INTO kp_sale_items VALUES("626","406","27","0","1.00","205.00","0.00","205.00","2021-04-08","2","195.00","10.00","0.00","28.28","1","1","2021-04-08 18:06:39");
INSERT INTO kp_sale_items VALUES("627","407","5","0","0.50","110.00","0.00","55.00","2021-04-08","2","0.00","55.00","0.00","7.59","1","1","2021-04-08 18:19:05");
INSERT INTO kp_sale_items VALUES("628","407","264","0","3.00","5.00","0.00","15.00","2021-04-08","2","0.00","15.00","0.00","2.07","1","1","2021-04-08 18:20:25");
INSERT INTO kp_sale_items VALUES("629","408","23","0","1.00","200.00","0.00","200.00","2021-04-08","2","190.00","10.00","0.00","27.59","1","1","2021-04-08 18:21:50");
INSERT INTO kp_sale_items VALUES("630","410","265","0","1.00","1150.00","0.00","1150.00","2021-04-08","2","1040.00","110.00","0.00","0.00","2","1","2021-04-08 18:25:28");
INSERT INTO kp_sale_items VALUES("631","411","5","0","2.00","100.00","0.00","200.00","2021-04-08","2","0.00","200.00","0.00","27.59","1","1","2021-04-08 18:26:35");
INSERT INTO kp_sale_items VALUES("632","412","219","0","2.00","120.00","0.00","240.00","2021-04-08","2","0.00","240.00","0.00","0.00","2","1","2021-04-08 18:27:47");
INSERT INTO kp_sale_items VALUES("633","414","266","0","1.00","50.00","0.00","50.00","2021-04-08","2","0.00","50.00","0.00","6.90","1","1","2021-04-08 18:29:34");
INSERT INTO kp_sale_items VALUES("634","415","165","0","1.50","100.00","0.00","150.00","2021-04-08","2","92.80","10.80","0.00","20.69","1","1","2021-04-08 18:30:38");
INSERT INTO kp_sale_items VALUES("635","414","164","0","2.00","50.00","0.00","100.00","2021-04-08","2","39.00","22.00","0.00","13.79","1","1","2021-04-08 18:31:02");
INSERT INTO kp_sale_items VALUES("636","416","179","0","0.50","1050.00","0.00","525.00","2021-04-08","2","950.00","50.00","0.00","72.41","1","1","2021-04-08 18:46:04");
INSERT INTO kp_sale_items VALUES("637","417","170","0","0.50","200.00","0.00","100.00","2021-04-08","2","171.50","14.25","0.00","13.79","1","1","2021-04-08 18:51:01");
INSERT INTO kp_sale_items VALUES("638","418","101","0","1.00","520.00","0.00","520.00","2021-04-09","2","0.00","520.00","0.00","71.72","1","1","2021-04-09 08:00:42");
INSERT INTO kp_sale_items VALUES("639","419","165","0","0.25","120.00","0.00","30.00","2021-04-09","2","92.80","6.80","0.00","4.14","1","1","2021-04-09 08:08:55");
INSERT INTO kp_sale_items VALUES("640","421","267","0","1.00","90.00","0.00","90.00","2021-04-09","2","0.00","90.00","0.00","0.00","3","1","2021-04-09 08:26:49");
INSERT INTO kp_sale_items VALUES("641","423","178","0","2.00","90.00","0.00","180.00","2021-04-09","2","82.33","15.34","0.00","24.83","1","1","2021-04-09 09:19:43");
INSERT INTO kp_sale_items VALUES("642","424","164","0","10.00","42.00","0.00","420.00","2021-04-09","2","39.00","30.00","0.00","57.93","1","1","2021-04-09 09:40:48");
INSERT INTO kp_sale_items VALUES("643","425","33","0","1.00","250.00","0.00","250.00","2021-04-09","2","230.00","20.00","0.00","34.48","1","1","2021-04-09 09:51:10");
INSERT INTO kp_sale_items VALUES("644","425","200","0","1.00","120.00","0.00","120.00","2021-04-09","2","0.00","120.00","0.00","16.55","1","1","2021-04-09 09:51:31");
INSERT INTO kp_sale_items VALUES("645","425","46","0","1.00","250.00","0.00","250.00","2021-04-09","2","0.00","250.00","0.00","34.48","1","1","2021-04-09 09:51:48");
INSERT INTO kp_sale_items VALUES("646","425","37","0","1.00","75.00","0.00","75.00","2021-04-09","2","0.00","75.00","0.00","10.34","1","1","2021-04-09 09:51:56");
INSERT INTO kp_sale_items VALUES("647","425","135","0","1.00","480.00","0.00","480.00","2021-04-09","2","0.00","480.00","0.00","66.21","1","1","2021-04-09 09:52:10");
INSERT INTO kp_sale_items VALUES("648","427","166","0","2.00","55.00","0.00","110.00","2021-04-09","2","0.00","110.00","0.00","15.17","1","1","2021-04-09 11:07:31");
INSERT INTO kp_sale_items VALUES("649","427","203","0","2.00","55.00","0.00","110.00","2021-04-09","2","0.00","110.00","0.00","15.17","1","1","2021-04-09 11:07:54");
INSERT INTO kp_sale_items VALUES("650","429","244","0","0.50","860.00","0.00","430.00","2021-04-09","2","800.00","30.00","0.00","59.31","1","1","2021-04-09 11:32:36");
INSERT INTO kp_sale_items VALUES("651","429","119","0","1.00","520.00","0.00","520.00","2021-04-09","2","0.00","520.00","0.00","71.72","1","1","2021-04-09 11:33:03");
INSERT INTO kp_sale_items VALUES("652","429","38","0","2.00","75.00","0.00","150.00","2021-04-09","2","0.00","150.00","0.00","20.69","1","1","2021-04-09 11:33:32");
INSERT INTO kp_sale_items VALUES("653","431","178","0","2.00","90.00","0.00","180.00","2021-04-09","2","82.33","15.34","0.00","24.83","1","1","2021-04-09 11:42:36");
INSERT INTO kp_sale_items VALUES("654","432","165","0","3.00","100.00","0.00","300.00","2021-04-09","2","92.80","21.60","0.00","41.38","1","1","2021-04-09 12:07:32");
INSERT INTO kp_sale_items VALUES("655","434","163","0","2.00","55.00","0.00","110.00","2021-04-09","2","0.00","110.00","0.00","15.17","1","1","2021-04-09 12:45:23");
INSERT INTO kp_sale_items VALUES("656","434","206","0","2.00","90.00","0.00","180.00","2021-04-09","2","0.00","180.00","0.00","24.83","1","1","2021-04-09 12:47:48");
INSERT INTO kp_sale_items VALUES("657","434","178","0","1.00","90.00","0.00","90.00","2021-04-09","2","82.33","7.67","0.00","12.41","1","1","2021-04-09 12:49:20");
INSERT INTO kp_sale_items VALUES("658","435","205","0","1.00","50.00","0.00","50.00","2021-04-09","2","47.00","3.00","0.00","6.90","1","1","2021-04-09 13:58:32");
INSERT INTO kp_sale_items VALUES("659","438","186","0","1.00","25.00","0.00","25.00","2021-04-09","2","0.00","25.00","0.00","0.00","0","1","2021-04-09 16:25:43");
INSERT INTO kp_sale_items VALUES("660","439","170","0","1.00","190.00","0.00","190.00","2021-04-09","2","171.50","18.50","0.00","26.21","1","1","2021-04-09 16:44:32");
INSERT INTO kp_sale_items VALUES("661","440","23","0","1.00","200.00","0.00","200.00","2021-04-09","2","190.00","10.00","0.00","27.59","1","1","2021-04-09 16:51:12");
INSERT INTO kp_sale_items VALUES("662","441","154","0","1.00","1470.00","0.00","1470.00","2021-04-09","2","1390.00","80.00","0.00","0.00","2","1","2021-04-09 16:57:39");
INSERT INTO kp_sale_items VALUES("663","442","268","0","1.00","1530.00","0.00","1530.00","2021-04-09","2","1500.00","30.00","0.00","0.00","2","1","2021-04-09 17:02:26");
INSERT INTO kp_sale_items VALUES("664","443","176","0","1.00","105.00","0.00","105.00","2021-04-09","2","0.00","105.00","0.00","14.48","1","1","2021-04-09 17:20:37");
INSERT INTO kp_sale_items VALUES("665","444","154","0","1.00","1470.00","0.00","1470.00","2021-04-09","2","1390.00","80.00","0.00","0.00","2","1","2021-04-09 17:26:01");
INSERT INTO kp_sale_items VALUES("666","445","270","0","0.25","1000.00","0.00","250.00","2021-04-09","2","800.00","50.00","0.00","34.48","1","1","2021-04-09 17:27:15");
INSERT INTO kp_sale_items VALUES("667","446","170","0","2.00","190.00","0.00","380.00","2021-04-09","2","171.50","37.00","0.00","52.41","1","1","2021-04-09 17:30:03");
INSERT INTO kp_sale_items VALUES("668","446","187","0","2.00","25.00","0.00","50.00","2021-04-09","2","0.00","50.00","0.00","6.90","1","1","2021-04-09 17:30:17");
INSERT INTO kp_sale_items VALUES("669","447","82","0","3.00","110.00","0.00","330.00","2021-04-09","2","0.00","110.00","0.00","45.52","1","1","2021-04-09 17:35:48");
INSERT INTO kp_sale_items VALUES("670","447","176","0","1.50","105.00","0.00","157.50","2021-04-09","2","0.00","105.00","0.00","21.72","1","1","2021-04-09 17:35:56");
INSERT INTO kp_sale_items VALUES("671","447","166","0","2.00","55.00","0.00","110.00","2021-04-09","2","0.00","110.00","0.00","15.17","1","1","2021-04-09 17:39:01");
INSERT INTO kp_sale_items VALUES("672","447","173","0","1.00","60.00","0.00","60.00","2021-04-09","2","47.00","13.00","0.00","8.28","1","1","2021-04-09 17:40:33");
INSERT INTO kp_sale_items VALUES("673","447","271","0","1.00","80.00","0.00","80.00","2021-04-09","2","70.00","10.00","0.00","11.03","1","1","2021-04-09 17:41:39");
INSERT INTO kp_sale_items VALUES("674","447","272","0","1.00","30.00","0.00","30.00","2021-04-09","2","0.00","30.00","0.00","4.14","1","1","2021-04-09 17:46:33");
INSERT INTO kp_sale_items VALUES("675","447","181","0","2.00","135.00","0.00","270.00","2021-04-09","2","128.33","13.34","0.00","0.00","2","1","2021-04-09 17:46:46");
INSERT INTO kp_sale_items VALUES("676","447","172","0","2.00","25.00","0.00","50.00","2021-04-09","2","0.00","50.00","0.00","6.90","1","1","2021-04-09 17:47:15");
INSERT INTO kp_sale_items VALUES("677","449","141","0","0.25","4800.00","0.00","1200.00","2021-04-09","2","4640.00","40.00","0.00","165.52","1","1","2021-04-09 17:54:17");
INSERT INTO kp_sale_items VALUES("678","450","154","0","1.00","1470.00","0.00","1470.00","2021-04-09","2","1390.00","80.00","0.00","0.00","2","1","2021-04-09 17:59:25");
INSERT INTO kp_sale_items VALUES("679","450","253","0","1.00","2150.00","0.00","2150.00","2021-04-09","2","1980.00","170.00","0.00","296.55","1","1","2021-04-09 17:59:34");
INSERT INTO kp_sale_items VALUES("680","451","196","0","1.00","120.00","0.00","120.00","2021-04-09","2","0.00","120.00","0.00","16.55","1","1","2021-04-09 18:15:37");
INSERT INTO kp_sale_items VALUES("681","452","5","0","0.50","120.00","0.00","60.00","2021-04-09","2","0.00","60.00","0.00","8.28","1","1","2021-04-09 18:35:19");
INSERT INTO kp_sale_items VALUES("682","453","27","0","1.00","205.00","0.00","205.00","2021-04-09","2","195.00","10.00","0.00","28.28","1","1","2021-04-09 18:44:58");
INSERT INTO kp_sale_items VALUES("683","455","273","0","2.00","115.00","0.00","230.00","2021-04-09","2","86.67","56.66","0.00","0.00","2","1","2021-04-09 18:49:40");
INSERT INTO kp_sale_items VALUES("684","456","178","0","1.00","90.00","0.00","90.00","2021-04-10","2","82.33","7.67","0.00","12.41","1","1","2021-04-10 08:15:19");
INSERT INTO kp_sale_items VALUES("685","458","178","0","1.00","90.00","0.00","90.00","2021-04-10","2","82.33","7.67","0.00","12.41","1","1","2021-04-10 09:02:10");
INSERT INTO kp_sale_items VALUES("686","459","242","0","1.00","1520.00","0.00","1520.00","2021-04-10","2","1470.00","50.00","0.00","0.00","2","1","2021-04-10 09:30:03");
INSERT INTO kp_sale_items VALUES("687","461","274","0","2.00","50.00","0.00","100.00","2021-04-10","2","41.67","16.66","0.00","0.00","2","1","2021-04-10 09:45:23");
INSERT INTO kp_sale_items VALUES("688","462","165","0","3.00","100.00","0.00","300.00","2021-04-10","2","92.80","21.60","0.00","41.38","1","1","2021-04-10 10:13:38");
INSERT INTO kp_sale_items VALUES("689","462","5","0","5.00","90.00","0.00","450.00","2021-04-10","2","0.00","450.00","0.00","62.07","1","1","2021-04-10 10:13:49");
INSERT INTO kp_sale_items VALUES("690","463","5","0","0.50","110.00","0.00","55.00","2021-04-10","2","0.00","55.00","0.00","7.59","1","1","2021-04-10 10:18:49");
INSERT INTO kp_sale_items VALUES("692","465","273","0","1.00","115.00","0.00","115.00","2021-04-10","2","86.67","28.33","0.00","0.00","2","1","2021-04-10 16:29:36");
INSERT INTO kp_sale_items VALUES("693","466","170","0","3.00","190.00","0.00","570.00","2021-04-10","2","171.50","55.50","0.00","78.62","1","1","2021-04-10 16:44:18");
INSERT INTO kp_sale_items VALUES("694","468","165","0","3.00","100.00","0.00","300.00","2021-04-10","2","92.80","21.60","0.00","41.38","1","1","2021-04-10 16:59:40");
INSERT INTO kp_sale_items VALUES("695","468","5","0","3.00","100.00","0.00","300.00","2021-04-10","2","0.00","300.00","0.00","41.38","1","1","2021-04-10 17:00:16");
INSERT INTO kp_sale_items VALUES("696","468","193","0","1.00","90.00","0.00","90.00","2021-04-10","2","0.00","90.00","0.00","0.00","2","1","2021-04-10 17:01:02");
INSERT INTO kp_sale_items VALUES("697","468","65","0","1.00","135.00","0.00","135.00","2021-04-10","2","0.00","135.00","0.00","18.62","1","1","2021-04-10 17:02:44");
INSERT INTO kp_sale_items VALUES("698","469","77","0","1.00","2750.00","0.00","2750.00","2021-04-10","2","0.00","2750.00","0.00","379.31","1","1","2021-04-10 17:08:53");
INSERT INTO kp_sale_items VALUES("699","470","211","0","1.00","120.00","0.00","120.00","2021-04-10","2","120.00","0.00","0.00","16.55","1","1","2021-04-10 17:11:44");
INSERT INTO kp_sale_items VALUES("700","471","269","0","1.00","150.00","0.00","150.00","2021-04-10","2","125.00","25.00","0.00","20.69","1","1","2021-04-10 17:12:23");
INSERT INTO kp_sale_items VALUES("701","472","181","0","1.00","135.00","0.00","135.00","2021-04-10","2","128.33","6.67","0.00","0.00","2","1","2021-04-10 17:23:46");
INSERT INTO kp_sale_items VALUES("702","473","170","0","0.50","200.00","0.00","100.00","2021-04-10","2","171.50","14.25","0.00","13.79","1","1","2021-04-10 17:25:09");
INSERT INTO kp_sale_items VALUES("703","474","165","0","3.00","100.00","0.00","300.00","2021-04-10","2","92.80","21.60","0.00","41.38","1","1","2021-04-10 17:47:33");
INSERT INTO kp_sale_items VALUES("704","475","164","0","2.00","50.00","0.00","100.00","2021-04-10","2","39.00","22.00","0.00","13.79","1","1","2021-04-10 17:53:48");
INSERT INTO kp_sale_items VALUES("705","476","141","0","1.00","4750.00","0.00","4750.00","2021-04-10","2","4640.00","110.00","0.00","655.17","1","1","2021-04-10 17:58:07");
INSERT INTO kp_sale_items VALUES("706","477","259","0","1.00","450.00","0.00","450.00","2021-04-10","2","408.33","41.67","0.00","62.07","1","1","2021-04-10 18:08:26");
INSERT INTO kp_sale_items VALUES("707","478","225","0","1.00","130.00","0.00","130.00","2021-04-10","2","0.00","130.00","0.00","17.93","1","1","2021-04-10 18:14:26");
INSERT INTO kp_sale_items VALUES("708","479","269","0","1.00","150.00","0.00","150.00","2021-04-10","2","125.00","25.00","0.00","20.69","1","1","2021-04-10 18:16:29");
INSERT INTO kp_sale_items VALUES("709","480","233","0","0.40","2500.00","0.00","1000.00","2021-04-10","2","2380.00","48.00","0.00","137.93","1","1","2021-04-10 18:27:33");
INSERT INTO kp_sale_items VALUES("710","480","265","0","0.50","1560.00","0.00","780.00","2021-04-10","2","1040.00","260.00","0.00","0.00","2","1","2021-04-10 18:30:51");
INSERT INTO kp_sale_items VALUES("711","480","16","0","0.50","1560.00","0.00","780.00","2021-04-10","2","0.00","780.00","0.00","0.00","2","1","2021-04-10 18:31:38");
INSERT INTO kp_sale_items VALUES("712","481","165","0","2.00","100.00","0.00","200.00","2021-04-10","2","92.80","14.40","0.00","27.59","1","1","2021-04-10 18:32:04");
INSERT INTO kp_sale_items VALUES("713","482","23","0","1.00","200.00","0.00","200.00","2021-04-10","2","190.00","10.00","0.00","27.59","1","1","2021-04-10 18:33:06");
INSERT INTO kp_sale_items VALUES("714","482","164","0","2.00","50.00","0.00","100.00","2021-04-10","2","39.00","22.00","0.00","13.79","1","1","2021-04-10 18:33:18");
INSERT INTO kp_sale_items VALUES("715","483","187","0","2.00","25.00","0.00","50.00","2021-04-10","2","0.00","50.00","0.00","6.90","1","1","2021-04-10 18:56:52");
INSERT INTO kp_sale_items VALUES("716","484","32","0","1.00","250.00","0.00","250.00","2021-04-10","2","230.00","20.00","0.00","34.48","1","1","2021-04-10 18:58:22");
INSERT INTO kp_sale_items VALUES("717","484","38","0","1.00","70.00","0.00","70.00","2021-04-10","2","0.00","70.00","0.00","9.66","1","1","2021-04-10 18:58:33");
INSERT INTO kp_sale_items VALUES("718","484","39","0","1.00","70.00","0.00","70.00","2021-04-10","2","0.00","70.00","0.00","9.66","1","1","2021-04-10 18:58:47");
INSERT INTO kp_sale_items VALUES("719","485","179","0","0.50","1060.00","0.00","530.00","2021-04-10","2","950.00","55.00","0.00","73.10","1","1","2021-04-10 19:01:52");
INSERT INTO kp_sale_items VALUES("720","486","239","0","3.00","40.00","0.00","120.00","2021-04-10","2","0.00","120.00","0.00","16.55","1","1","2021-04-10 19:12:14");
INSERT INTO kp_sale_items VALUES("721","487","5","0","2.00","110.00","0.00","220.00","2021-04-10","2","0.00","220.00","0.00","30.34","1","1","2021-04-10 19:16:02");
INSERT INTO kp_sale_items VALUES("722","487","165","0","1.00","100.00","0.00","100.00","2021-04-10","2","92.80","7.20","0.00","13.79","1","1","2021-04-10 19:16:10");
INSERT INTO kp_sale_items VALUES("723","488","5","0","5.00","110.00","0.00","550.00","2021-04-11","2","0.00","550.00","0.00","75.86","1","1","2021-04-11 12:00:44");
INSERT INTO kp_sale_items VALUES("724","488","189","0","2.00","120.00","0.00","240.00","2021-04-11","2","105.00","30.00","0.00","33.10","1","1","2021-04-11 12:00:57");
INSERT INTO kp_sale_items VALUES("725","488","68","0","1.00","110.00","0.00","110.00","2021-04-11","2","0.00","110.00","0.00","15.17","1","1","2021-04-11 12:01:08");
INSERT INTO kp_sale_items VALUES("726","489","251","0","1.00","540.00","0.00","540.00","2021-04-11","2","0.00","540.00","0.00","0.00","2","1","2021-04-11 12:14:56");
INSERT INTO kp_sale_items VALUES("727","490","5","0","2.00","90.00","0.00","180.00","2021-04-11","2","0.00","180.00","0.00","24.83","1","1","2021-04-11 12:43:23");
INSERT INTO kp_sale_items VALUES("728","491","268","0","1.00","1530.00","0.00","1530.00","2021-04-11","2","1500.00","30.00","0.00","0.00","2","1","2021-04-11 13:17:35");
INSERT INTO kp_sale_items VALUES("729","491","152","0","1.00","1800.00","0.00","1800.00","2021-04-11","2","1390.00","410.00","0.00","248.28","1","1","2021-04-11 13:17:44");
INSERT INTO kp_sale_items VALUES("730","492","5","0","1.00","2150.00","0.00","2150.00","2021-04-11","2","0.00","2150.00","0.00","296.55","1","1","2021-04-11 13:27:00");
INSERT INTO kp_sale_items VALUES("731","492","208","0","4.00","35.00","0.00","140.00","2021-04-11","2","0.00","140.00","0.00","19.31","1","1","2021-04-11 13:27:21");
INSERT INTO kp_sale_items VALUES("732","492","33","0","1.00","250.00","0.00","250.00","2021-04-11","2","230.00","20.00","0.00","34.48","1","1","2021-04-11 13:27:31");
INSERT INTO kp_sale_items VALUES("733","492","32","0","1.00","250.00","0.00","250.00","2021-04-11","2","230.00","20.00","0.00","34.48","1","1","2021-04-11 13:27:39");
INSERT INTO kp_sale_items VALUES("734","492","152","0","1.00","1800.00","0.00","1800.00","2021-04-11","2","1390.00","410.00","0.00","248.28","1","1","2021-04-11 13:28:04");
INSERT INTO kp_sale_items VALUES("735","492","75","0","1.00","110.00","0.00","110.00","2021-04-11","2","0.00","110.00","0.00","15.17","1","1","2021-04-11 13:29:46");
INSERT INTO kp_sale_items VALUES("736","492","68","0","1.00","110.00","0.00","110.00","2021-04-11","2","0.00","110.00","0.00","15.17","1","1","2021-04-11 13:30:05");
INSERT INTO kp_sale_items VALUES("737","492","62","0","1.00","105.00","0.00","105.00","2021-04-11","2","0.00","105.00","0.00","14.48","1","1","2021-04-11 13:30:21");
INSERT INTO kp_sale_items VALUES("738","493","181","0","1.00","135.00","0.00","135.00","2021-04-11","2","128.33","6.67","0.00","0.00","2","1","2021-04-11 13:33:21");
INSERT INTO kp_sale_items VALUES("739","493","180","0","1.00","100.00","0.00","100.00","2021-04-11","2","79.17","20.83","0.00","0.00","2","1","2021-04-11 13:33:45");
INSERT INTO kp_sale_items VALUES("740","493","5","0","1.00","90.00","0.00","90.00","2021-04-11","2","0.00","90.00","0.00","12.41","1","1","2021-04-11 13:33:52");
INSERT INTO kp_sale_items VALUES("741","492","176","0","1.00","105.00","0.00","105.00","2021-04-11","2","0.00","105.00","0.00","14.48","1","1","2021-04-11 13:35:37");
INSERT INTO kp_sale_items VALUES("742","492","139","0","1.00","225.00","0.00","225.00","2021-04-11","2","0.00","225.00","0.00","0.00","3","1","2021-04-11 13:35:49");
INSERT INTO kp_sale_items VALUES("743","492","138","0","0.50","580.00","0.00","290.00","2021-04-11","2","0.00","290.00","0.00","0.00","3","1","2021-04-11 13:50:10");
INSERT INTO kp_sale_items VALUES("744","492","188","0","0.50","1090.00","0.00","545.00","2021-04-11","2","1050.00","20.00","0.00","75.17","1","1","2021-04-11 13:57:46");
INSERT INTO kp_sale_items VALUES("745","492","84","0","1.00","140.00","0.00","140.00","2021-04-11","2","0.00","140.00","0.00","19.31","1","1","2021-04-11 13:58:25");
INSERT INTO kp_sale_items VALUES("746","492","269","0","2.00","150.00","0.00","300.00","2021-04-11","2","125.00","50.00","0.00","41.38","1","1","2021-04-11 13:58:43");
INSERT INTO kp_sale_items VALUES("747","492","220","0","1.00","250.00","0.00","250.00","2021-04-11","2","0.00","250.00","0.00","34.48","1","1","2021-04-11 13:59:02");
INSERT INTO kp_sale_items VALUES("748","492","46","0","1.00","250.00","0.00","250.00","2021-04-11","2","0.00","250.00","0.00","34.48","1","1","2021-04-11 13:59:37");
INSERT INTO kp_sale_items VALUES("749","492","200","0","1.00","130.00","0.00","130.00","2021-04-11","2","0.00","130.00","0.00","17.93","1","1","2021-04-11 13:59:47");
INSERT INTO kp_sale_items VALUES("750","492","179","0","0.50","1060.00","0.00","530.00","2021-04-11","2","950.00","55.00","0.00","73.10","1","1","2021-04-11 14:00:06");
INSERT INTO kp_sale_items VALUES("751","492","165","0","19.00","95.60","0.00","1816.40","2021-04-11","2","92.80","53.20","0.00","250.54","1","1","2021-04-11 14:29:52");
INSERT INTO kp_sale_items VALUES("752","492","251","0","1.00","540.00","0.00","540.00","2021-04-11","2","0.00","540.00","0.00","0.00","2","1","2021-04-11 14:30:36");
INSERT INTO kp_sale_items VALUES("753","492","258","0","1.00","500.00","0.00","500.00","2021-04-11","2","475.00","25.00","0.00","68.97","1","1","2021-04-11 14:32:21");
INSERT INTO kp_sale_items VALUES("754","495","244","0","0.50","850.00","0.00","425.00","2021-04-11","2","800.00","25.00","0.00","58.62","1","1","2021-04-11 14:49:16");
INSERT INTO kp_sale_items VALUES("755","495","249","0","0.50","850.00","0.00","425.00","2021-04-11","2","800.00","25.00","0.00","58.62","1","1","2021-04-11 14:49:32");
INSERT INTO kp_sale_items VALUES("756","495","203","0","1.00","385.00","0.00","385.00","2021-04-11","2","0.00","385.00","0.00","53.10","1","1","2021-04-11 14:49:48");
INSERT INTO kp_sale_items VALUES("757","495","270","0","1.00","850.00","0.00","850.00","2021-04-11","2","800.00","50.00","0.00","117.24","1","1","2021-04-11 14:51:05");
INSERT INTO kp_sale_items VALUES("758","496","242","0","1.00","1530.00","0.00","1530.00","2021-04-11","2","1470.00","60.00","0.00","0.00","2","1","2021-04-11 15:04:00");
INSERT INTO kp_sale_items VALUES("759","496","179","0","10.00","1050.00","0.00","10500.00","2021-04-11","2","950.00","1000.00","0.00","1448.28","1","1","2021-04-11 15:04:11");
INSERT INTO kp_sale_items VALUES("760","496","5","0","1.00","2370.00","0.00","2370.00","2021-04-11","2","0.00","2370.00","0.00","326.90","1","1","2021-04-11 15:04:33");
INSERT INTO kp_sale_items VALUES("761","496","152","0","2.00","1800.00","0.00","3600.00","2021-04-11","2","1390.00","410.00","0.00","496.55","1","1","2021-04-11 15:04:45");
INSERT INTO kp_sale_items VALUES("762","496","258","0","1.00","500.00","0.00","500.00","2021-04-11","2","475.00","25.00","0.00","68.97","1","1","2021-04-11 15:05:35");
INSERT INTO kp_sale_items VALUES("763","497","5","0","1.00","2370.00","0.00","2370.00","2021-04-11","2","0.00","2370.00","0.00","326.90","1","1","2021-04-11 15:06:57");
INSERT INTO kp_sale_items VALUES("764","497","152","0","1.00","1800.00","0.00","1800.00","2021-04-11","2","1390.00","410.00","0.00","248.28","1","1","2021-04-11 15:07:12");
INSERT INTO kp_sale_items VALUES("765","497","179","0","1.00","1050.00","0.00","1050.00","2021-04-11","2","950.00","100.00","0.00","144.83","1","1","2021-04-11 15:07:24");
INSERT INTO kp_sale_items VALUES("766","497","242","0","1.00","1530.00","0.00","1530.00","2021-04-11","2","1470.00","60.00","0.00","0.00","2","1","2021-04-11 15:07:38");
INSERT INTO kp_sale_items VALUES("767","497","258","0","1.00","500.00","0.00","500.00","2021-04-11","2","475.00","25.00","0.00","68.97","1","1","2021-04-11 15:07:50");
INSERT INTO kp_sale_items VALUES("768","497","269","0","1.00","850.00","0.00","850.00","2021-04-11","2","125.00","725.00","0.00","117.24","1","1","2021-04-11 15:08:17");
INSERT INTO kp_sale_items VALUES("769","498","144","0","0.50","860.00","0.00","430.00","2021-04-11","2","780.00","40.00","0.00","59.31","1","1","2021-04-11 15:44:20");
INSERT INTO kp_sale_items VALUES("770","499","201","0","1.00","155.00","0.00","155.00","2021-04-11","2","0.00","155.00","0.00","21.38","1","1","2021-04-11 15:55:07");
INSERT INTO kp_sale_items VALUES("771","499","82","0","1.00","105.00","0.00","105.00","2021-04-11","2","0.00","105.00","0.00","14.48","1","1","2021-04-11 15:55:20");
INSERT INTO kp_sale_items VALUES("772","499","239","0","6.00","40.00","0.00","240.00","2021-04-11","2","0.00","240.00","0.00","33.10","1","1","2021-04-11 15:55:48");
INSERT INTO kp_sale_items VALUES("773","499","275","0","1.00","90.00","0.00","90.00","2021-04-11","2","0.00","90.00","0.00","12.41","1","1","2021-04-11 15:58:41");
INSERT INTO kp_sale_items VALUES("774","502","277","0","1.00","3500.00","0.00","3500.00","2021-04-11","2","0.00","3500.00","0.00","482.76","1","1","2021-04-11 16:16:21");
INSERT INTO kp_sale_items VALUES("775","503","275","0","1.00","90.00","0.00","90.00","2021-04-11","2","0.00","90.00","0.00","12.41","1","1","2021-04-11 16:21:30");
INSERT INTO kp_sale_items VALUES("776","504","243","0","5.00","128.00","0.00","640.00","2021-04-11","2","122.50","27.50","0.00","88.28","1","1","2021-04-11 16:29:00");
INSERT INTO kp_sale_items VALUES("777","505","179","0","1.00","1050.00","0.00","1050.00","2021-04-11","2","950.00","100.00","0.00","144.83","1","1","2021-04-11 16:36:26");
INSERT INTO kp_sale_items VALUES("778","506","211","0","4.00","120.00","0.00","480.00","2021-04-11","2","120.00","0.00","0.00","66.21","1","1","2021-04-11 16:38:41");
INSERT INTO kp_sale_items VALUES("779","507","246","0","1.00","360.00","0.00","360.00","2021-04-11","2","320.00","40.00","0.00","49.66","1","1","2021-04-11 16:41:17");
INSERT INTO kp_sale_items VALUES("780","508","211","0","1.00","120.00","0.00","120.00","2021-04-11","2","120.00","0.00","0.00","16.55","1","1","2021-04-11 17:04:38");
INSERT INTO kp_sale_items VALUES("781","508","39","0","1.00","75.00","0.00","75.00","2021-04-11","2","0.00","75.00","0.00","10.34","1","1","2021-04-11 17:04:51");
INSERT INTO kp_sale_items VALUES("782","509","165","0","1.00","1190.00","0.00","1190.00","2021-04-11","2","92.80","1097.20","0.00","164.14","1","1","2021-04-11 17:05:47");
INSERT INTO kp_sale_items VALUES("783","509","253","0","1.00","2150.00","0.00","2150.00","2021-04-11","2","1980.00","170.00","0.00","296.55","1","1","2021-04-11 17:06:00");
INSERT INTO kp_sale_items VALUES("784","509","39","0","1.00","70.00","0.00","70.00","2021-04-11","2","0.00","70.00","0.00","9.66","1","1","2021-04-11 17:07:19");
INSERT INTO kp_sale_items VALUES("785","509","23","0","1.00","200.00","0.00","200.00","2021-04-11","2","190.00","10.00","0.00","27.59","1","1","2021-04-11 17:07:44");
INSERT INTO kp_sale_items VALUES("786","509","121","0","1.00","580.00","0.00","580.00","2021-04-11","2","0.00","580.00","0.00","80.00","1","1","2021-04-11 17:08:01");
INSERT INTO kp_sale_items VALUES("787","509","204","0","1.00","270.00","0.00","270.00","2021-04-11","2","0.00","270.00","0.00","37.24","1","1","2021-04-11 17:08:11");
INSERT INTO kp_sale_items VALUES("788","509","84","0","1.00","145.00","0.00","145.00","2021-04-11","2","0.00","145.00","0.00","20.00","1","1","2021-04-11 17:08:21");
INSERT INTO kp_sale_items VALUES("789","510","70","0","1.00","280.00","0.00","280.00","2021-04-12","2","0.00","280.00","0.00","38.62","1","1","2021-04-12 08:16:52");
INSERT INTO kp_sale_items VALUES("790","510","23","0","1.00","200.00","0.00","200.00","2021-04-12","2","190.00","10.00","0.00","27.59","1","1","2021-04-12 08:17:05");
INSERT INTO kp_sale_items VALUES("791","511","225","0","1.00","130.00","0.00","130.00","2021-04-12","2","0.00","130.00","0.00","17.93","1","1","2021-04-12 08:40:13");
INSERT INTO kp_sale_items VALUES("792","514","255","0","1.00","490.00","0.00","490.00","2021-04-12","2","475.00","15.00","0.00","67.59","1","1","2021-04-12 09:27:58");
INSERT INTO kp_sale_items VALUES("793","514","225","0","1.00","130.00","0.00","130.00","2021-04-12","2","0.00","130.00","0.00","17.93","1","1","2021-04-12 09:28:08");
INSERT INTO kp_sale_items VALUES("794","514","278","0","1.00","230.00","0.00","230.00","2021-04-12","2","200.00","30.00","0.00","31.72","1","1","2021-04-12 09:33:55");
INSERT INTO kp_sale_items VALUES("795","515","208","0","2.00","35.00","0.00","70.00","2021-04-12","2","0.00","70.00","0.00","9.66","1","1","2021-04-12 09:36:18");
INSERT INTO kp_sale_items VALUES("796","515","163","0","1.00","55.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 09:36:27");
INSERT INTO kp_sale_items VALUES("797","516","139","0","1.00","225.00","0.00","225.00","2021-04-12","2","0.00","225.00","0.00","0.00","3","1","2021-04-12 09:46:08");
INSERT INTO kp_sale_items VALUES("798","517","259","0","1.00","450.00","0.00","450.00","2021-04-12","2","408.33","41.67","0.00","62.07","1","1","2021-04-12 09:47:25");
INSERT INTO kp_sale_items VALUES("799","518","5","0","0.50","110.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 10:03:56");
INSERT INTO kp_sale_items VALUES("800","520","274","0","2.00","50.00","0.00","100.00","2021-04-12","2","41.67","16.66","0.00","0.00","2","1","2021-04-12 10:47:13");
INSERT INTO kp_sale_items VALUES("801","521","179","0","1.00","1050.00","0.00","1050.00","2021-04-12","2","950.00","100.00","0.00","144.83","1","1","2021-04-12 11:42:07");
INSERT INTO kp_sale_items VALUES("802","521","170","0","3.00","185.00","0.00","555.00","2021-04-12","2","171.50","40.50","0.00","76.55","1","1","2021-04-12 11:43:05");
INSERT INTO kp_sale_items VALUES("803","521","189","0","1.00","120.00","0.00","120.00","2021-04-12","2","105.00","15.00","0.00","16.55","1","1","2021-04-12 11:44:24");
INSERT INTO kp_sale_items VALUES("804","521","269","0","1.00","150.00","0.00","150.00","2021-04-12","2","125.00","25.00","0.00","20.69","1","1","2021-04-12 11:45:20");
INSERT INTO kp_sale_items VALUES("805","521","208","0","1.00","35.00","0.00","35.00","2021-04-12","2","0.00","35.00","0.00","4.83","1","1","2021-04-12 11:46:17");
INSERT INTO kp_sale_items VALUES("806","521","279","0","1.00","230.00","0.00","230.00","2021-04-12","2","0.00","230.00","0.00","31.72","1","1","2021-04-12 12:05:28");
INSERT INTO kp_sale_items VALUES("807","523","144","0","1.00","850.00","0.00","850.00","2021-04-12","2","780.00","70.00","0.00","117.24","1","1","2021-04-12 12:07:06");
INSERT INTO kp_sale_items VALUES("808","527","261","0","1.00","100.00","0.00","100.00","2021-04-12","2","0.00","100.00","0.00","13.79","1","1","2021-04-12 12:42:45");
INSERT INTO kp_sale_items VALUES("809","528","180","0","2.00","95.00","0.00","190.00","2021-04-12","2","79.17","31.66","0.00","0.00","2","1","2021-04-12 12:52:33");
INSERT INTO kp_sale_items VALUES("810","529","265","0","0.50","1160.00","0.00","580.00","2021-04-12","2","1040.00","60.00","0.00","0.00","2","1","2021-04-12 13:05:33");
INSERT INTO kp_sale_items VALUES("811","530","76","0","0.50","2770.00","0.00","1385.00","2021-04-12","2","0.00","1385.00","0.00","191.03","1","1","2021-04-12 13:12:06");
INSERT INTO kp_sale_items VALUES("812","531","203","0","2.00","55.00","0.00","110.00","2021-04-12","2","0.00","110.00","0.00","15.17","1","1","2021-04-12 13:18:48");
INSERT INTO kp_sale_items VALUES("813","532","88","0","1.00","250.00","0.00","250.00","2021-04-12","2","0.00","250.00","0.00","34.48","1","1","2021-04-12 14:18:20");
INSERT INTO kp_sale_items VALUES("814","533","38","0","1.00","70.00","0.00","70.00","2021-04-12","2","0.00","70.00","0.00","9.66","1","1","2021-04-12 14:24:18");
INSERT INTO kp_sale_items VALUES("815","534","140","0","0.50","2100.00","0.00","1050.00","2021-04-12","2","2010.00","45.00","0.00","0.00","2","1","2021-04-12 14:29:55");
INSERT INTO kp_sale_items VALUES("816","537","186","0","1.00","25.00","0.00","25.00","2021-04-12","2","0.00","25.00","0.00","0.00","0","1","2021-04-12 15:52:34");
INSERT INTO kp_sale_items VALUES("817","538","203","0","1.00","55.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 15:56:55");
INSERT INTO kp_sale_items VALUES("818","539","123","0","5.00","530.00","0.00","2650.00","2021-04-12","2","0.00","2650.00","0.00","365.52","1","1","2021-04-12 16:02:22");
INSERT INTO kp_sale_items VALUES("819","540","170","0","1.50","190.00","0.00","285.00","2021-04-12","2","171.50","27.75","0.00","39.31","1","1","2021-04-12 16:11:38");
INSERT INTO kp_sale_items VALUES("820","541","170","0","2.00","190.00","0.00","380.00","2021-04-12","2","171.50","37.00","0.00","52.41","1","1","2021-04-12 16:13:53");
INSERT INTO kp_sale_items VALUES("821","542","166","0","1.00","55.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 16:32:58");
INSERT INTO kp_sale_items VALUES("822","542","203","0","1.00","55.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 16:33:14");
INSERT INTO kp_sale_items VALUES("823","542","163","0","1.00","55.00","0.00","55.00","2021-04-12","2","0.00","55.00","0.00","7.59","1","1","2021-04-12 16:33:30");
INSERT INTO kp_sale_items VALUES("824","542","255","0","1.00","490.00","0.00","490.00","2021-04-12","2","475.00","15.00","0.00","67.59","1","1","2021-04-12 16:33:39");
INSERT INTO kp_sale_items VALUES("825","542","211","0","1.00","115.00","0.00","115.00","2021-04-12","2","120.00","-5.00","0.00","15.86","1","1","2021-04-12 16:34:11");
INSERT INTO kp_sale_items VALUES("826","543","144","0","0.50","840.00","0.00","420.00","2021-04-12","2","780.00","30.00","0.00","57.93","1","1","2021-04-12 16:37:16");
INSERT INTO kp_sale_items VALUES("827","544","32","0","1.00","250.00","0.00","250.00","2021-04-12","2","230.00","20.00","0.00","34.48","1","1","2021-04-12 16:50:44");
INSERT INTO kp_sale_items VALUES("828","545","170","0","1.00","185.00","0.00","185.00","2021-04-12","2","171.50","13.50","0.00","25.52","1","1","2021-04-12 17:04:05");
INSERT INTO kp_sale_items VALUES("829","546","68","0","3.00","105.00","0.00","315.00","2021-04-12","2","0.00","315.00","0.00","43.45","1","1","2021-04-12 17:07:34");
INSERT INTO kp_sale_items VALUES("830","546","278","0","1.00","250.00","0.00","250.00","2021-04-12","2","200.00","50.00","0.00","34.48","1","1","2021-04-12 17:07:44");
INSERT INTO kp_sale_items VALUES("831","547","178","0","1.00","90.00","0.00","90.00","2021-04-12","2","82.33","7.67","0.00","12.41","1","1","2021-04-12 17:16:14");
INSERT INTO kp_sale_items VALUES("832","548","273","0","2.00","115.00","0.00","230.00","2021-04-12","2","86.67","56.66","0.00","0.00","2","1","2021-04-12 17:40:09");
INSERT INTO kp_sale_items VALUES("833","548","183","0","2.00","130.00","0.00","260.00","2021-04-12","2","124.17","11.66","0.00","0.00","2","1","2021-04-12 17:42:16");
INSERT INTO kp_sale_items VALUES("834","549","5","0","2.00","90.00","0.00","180.00","2021-04-12","2","0.00","180.00","0.00","24.83","1","1","2021-04-12 17:43:32");
INSERT INTO kp_sale_items VALUES("835","550","5","0","4.00","90.00","0.00","360.00","2021-04-12","2","0.00","360.00","0.00","49.66","1","1","2021-04-12 17:47:25");
INSERT INTO kp_sale_items VALUES("836","551","218","0","1.00","1430.00","0.00","1430.00","2021-04-12","2","0.00","1430.00","0.00","0.00","2","1","2021-04-12 17:50:49");
INSERT INTO kp_sale_items VALUES("837","552","269","0","1.00","550.00","0.00","550.00","2021-04-12","2","125.00","425.00","0.00","75.86","1","1","2021-04-12 17:59:14");
INSERT INTO kp_sale_items VALUES("838","553","176","0","1.00","105.00","0.00","105.00","2021-04-12","2","0.00","105.00","0.00","14.48","1","1","2021-04-12 18:00:19");
INSERT INTO kp_sale_items VALUES("839","553","167","0","1.00","90.00","0.00","90.00","2021-04-12","2","0.00","90.00","0.00","12.41","1","1","2021-04-12 18:01:01");
INSERT INTO kp_sale_items VALUES("840","555","280","0","1.00","130.00","0.00","130.00","2021-04-12","2","125.00","5.00","0.00","0.00","2","1","2021-04-12 18:14:51");
INSERT INTO kp_sale_items VALUES("841","555","5","0","1.00","110.00","0.00","110.00","2021-04-12","2","0.00","110.00","0.00","15.17","1","1","2021-04-12 18:15:10");
INSERT INTO kp_sale_items VALUES("842","555","170","0","0.50","190.00","0.00","95.00","2021-04-12","2","171.50","9.25","0.00","13.10","1","1","2021-04-12 18:15:23");
INSERT INTO kp_sale_items VALUES("843","556","5","0","3.00","110.00","0.00","330.00","2021-04-12","2","0.00","330.00","0.00","45.52","1","1","2021-04-12 18:21:59");
INSERT INTO kp_sale_items VALUES("844","557","273","0","1.00","115.00","0.00","115.00","2021-04-12","2","86.67","28.33","0.00","0.00","2","1","2021-04-12 18:24:19");
INSERT INTO kp_sale_items VALUES("845","558","210","0","1.00","145.00","0.00","145.00","2021-04-13","2","135.00","10.00","0.00","20.00","1","1","2021-04-13 08:29:35");
INSERT INTO kp_sale_items VALUES("846","559","278","0","1.00","250.00","0.00","250.00","2021-04-13","2","200.00","50.00","0.00","34.48","1","1","2021-04-13 08:58:35");
INSERT INTO kp_sale_items VALUES("847","560","33","0","1.00","250.00","0.00","250.00","2021-04-13","2","230.00","20.00","0.00","34.48","1","1","2021-04-13 09:24:05");
INSERT INTO kp_sale_items VALUES("848","561","5","0","0.50","110.00","0.00","55.00","2021-04-13","2","0.00","55.00","0.00","7.59","1","1","2021-04-13 10:30:16");
INSERT INTO kp_sale_items VALUES("849","562","274","0","2.00","50.00","0.00","100.00","2021-04-13","2","41.67","16.66","0.00","0.00","2","1","2021-04-13 10:43:52");
INSERT INTO kp_sale_items VALUES("850","563","259","0","1.00","450.00","0.00","450.00","2021-04-13","2","408.33","41.67","0.00","62.07","1","1","2021-04-13 10:53:36");
INSERT INTO kp_sale_items VALUES("851","564","179","0","0.50","1060.00","0.00","530.00","2021-04-13","2","950.00","55.00","0.00","73.10","1","1","2021-04-13 11:05:06");
INSERT INTO kp_sale_items VALUES("852","565","180","0","1.00","90.00","0.00","90.00","2021-04-13","2","79.17","10.83","0.00","0.00","2","1","2021-04-13 11:06:45");
INSERT INTO kp_sale_items VALUES("853","566","268","3","1.00","1530.00","0.00","1530.00","2021-04-13","2","1500.00","30.00","0.00","0.00","2","1","2021-04-13 12:52:34");
INSERT INTO kp_sale_items VALUES("854","566","246","13","1.00","360.00","0.00","360.00","2021-04-13","2","320.00","40.00","0.00","49.66","1","1","2021-04-13 13:02:01");
INSERT INTO kp_sale_items VALUES("856","568","253","5","1.00","2100.00","0.00","2100.00","2021-04-13","2","1980.00","120.00","0.00","289.66","1","1","2021-04-13 13:15:29");
INSERT INTO kp_sale_items VALUES("857","569","50","1","2.00","100.00","0.00","200.00","2021-04-13","2","0.00","100.00","0.00","27.59","1","2","2021-04-13 13:20:25");
INSERT INTO kp_sale_items VALUES("858","570","178","1","2.00","90.00","0.00","180.00","2021-04-13","2","82.33","7.67","0.00","24.83","1","2","2021-04-13 13:26:06");
INSERT INTO kp_sale_items VALUES("859","571","165","1","10.00","100.00","0.00","1000.00","2021-04-13","2","92.80","7.20","0.00","137.93","1","1","2021-04-13 13:28:38");
INSERT INTO kp_sale_items VALUES("867","574","38","1","3.00","70.00","0.00","210.00","2021-04-13","2","0.00","70.00","0.00","28.97","1","1","2021-04-13 14:11:09");
INSERT INTO kp_sale_items VALUES("869","574","62","1","1.00","110.00","0.00","110.00","2021-04-13","2","0.00","110.00","0.00","15.17","1","1","2021-04-13 14:15:27");
INSERT INTO kp_sale_items VALUES("870","574","68","1","1.00","105.00","0.00","105.00","2021-04-13","2","0.00","105.00","0.00","14.48","1","1","2021-04-13 14:19:44");
INSERT INTO kp_sale_items VALUES("871","574","178","1","1.00","90.00","0.00","90.00","2021-04-13","2","82.33","7.67","0.00","12.41","1","1","2021-04-13 14:20:16");
INSERT INTO kp_sale_items VALUES("872","574","75","1","1.00","110.00","0.00","110.00","2021-04-13","2","0.00","110.00","0.00","15.17","1","1","2021-04-13 14:30:18");
INSERT INTO kp_sale_items VALUES("873","574","121","1","1.00","550.00","0.00","550.00","2021-04-13","2","0.00","550.00","0.00","75.86","1","1","2021-04-13 14:33:18");
INSERT INTO kp_sale_items VALUES("874","574","134","1","1.00","420.00","0.00","420.00","2021-04-13","2","0.00","420.00","0.00","57.93","1","1","2021-04-13 14:34:14");
INSERT INTO kp_sale_items VALUES("875","574","201","1","1.00","150.00","0.00","150.00","2021-04-13","2","0.00","150.00","0.00","20.69","1","1","2021-04-13 14:40:05");
INSERT INTO kp_sale_items VALUES("876","574","236","1","1.00","190.00","0.00","190.00","2021-04-13","2","150.00","40.00","0.00","26.21","1","1","2021-04-13 14:41:18");
INSERT INTO kp_sale_items VALUES("878","575","5","0","1.00","140.00","0.00","140.00","2021-04-22","2","0.00","140.00","0.00","19.31","1","1","2021-04-22 22:03:00");
INSERT INTO kp_sale_items VALUES("879","576","18","0","5.00","560.00","0.00","2800.00","2021-04-22","2","0.00","560.00","0.00","386.21","1","1","2021-04-22 22:59:42");
INSERT INTO kp_sale_items VALUES("880","577","1","0","3.00","1200.00","0.00","3600.00","2021-04-23","2","950.00","250.00","0.00","496.55","1","2","2021-04-23 00:49:41");
INSERT INTO kp_sale_items VALUES("881","577","8","0","2.00","1250.00","0.00","2500.00","2021-04-23","2","0.00","1250.00","0.00","0.00","2","2","2021-04-23 00:49:53");
INSERT INTO kp_sale_items VALUES("883","579","8","0","5.00","1030.00","0.00","5150.00","2021-04-25","2","0.00","1030.00","0.00","0.00","2","1","2021-04-25 10:29:10");
INSERT INTO kp_sale_items VALUES("884","581","3","0","9.00","600.00","0.00","5400.00","2021-04-25","2","0.00","600.00","0.00","744.83","1","1","2021-04-25 13:11:34");
INSERT INTO kp_sale_items VALUES("885","582","6","0","2.00","500.00","0.00","1000.00","2021-04-25","2","0.00","500.00","0.00","137.93","1","1","2021-05-11 12:49:26");
INSERT INTO kp_sale_items VALUES("886","585","2","0","1.00","100.00","0.00","100.00","2021-05-22","2","0.00","100.00","0.00","13.79","1","1","2021-05-22 14:14:21");
INSERT INTO kp_sale_items VALUES("887","586","6","0","2.00","200.00","0.00","400.00","2021-05-22","2","0.00","200.00","0.00","55.17","1","2","2021-05-22 14:16:52");
INSERT INTO kp_sale_items VALUES("888","586","129","0","1.00","200.00","0.00","200.00","2021-05-22","2","0.00","200.00","0.00","27.59","1","2","2021-05-22 14:17:05");
INSERT INTO kp_sale_items VALUES("889","586","80","0","2.00","50.00","0.00","100.00","2021-05-22","2","0.00","50.00","0.00","13.79","1","2","2021-05-22 14:17:43");
INSERT INTO kp_sale_items VALUES("890","587","2","0","1.00","200.00","0.00","200.00","2021-05-22","2","0.00","200.00","0.00","27.59","1","1","2021-05-22 14:31:41");
INSERT INTO kp_sale_items VALUES("894","588","3","0","1.00","500.00","0.00","500.00","2021-06-07","2","0.00","500.00","0.00","68.97","1","1","2021-06-09 15:39:41");
INSERT INTO kp_sale_items VALUES("895","578","92","0","1.00","500.00","0.00","500.00","2021-04-23","2","0.00","500.00","0.00","0.00","0","1","2021-06-10 12:54:09");
INSERT INTO kp_sale_items VALUES("896","589","4","0","1.00","2000.00","0.00","2000.00","2021-06-10","1","0.00","2000.00","0.00","275.86","1","1","2021-06-10 13:11:06");
INSERT INTO kp_sale_items VALUES("897","589","8","0","1.00","6000.00","0.00","6000.00","2021-06-10","2","0.00","6000.00","0.00","0.00","2","1","2021-06-10 14:11:55");
INSERT INTO kp_sale_items VALUES("898","589","246","0","5.00","600.00","0.00","3000.00","2021-06-10","2","320.00","280.00","0.00","413.79","1","1","2021-06-10 14:12:11");
INSERT INTO kp_sale_items VALUES("899","589","9","0","6.00","5666.00","0.00","33996.00","2021-06-10","2","0.00","5666.00","0.00","0.00","2","1","2021-06-10 14:12:18");
INSERT INTO kp_sale_items VALUES("900","589","14","0","3.00","2345.00","0.00","7035.00","2021-06-10","2","1440.00","905.00","0.00","0.00","2","1","2021-06-10 14:12:26");
INSERT INTO kp_sale_items VALUES("901","589","173","0","6.00","455.00","5.00","2700.00","2021-06-10","2","47.00","2418.00","0.00","372.41","1","1","2021-06-10 14:12:33");
INSERT INTO kp_sale_items VALUES("902","589","268","0","4.00","4566.00","0.00","18264.00","2021-06-10","2","1500.00","3066.00","0.00","0.00","2","1","2021-06-10 14:12:43");
INSERT INTO kp_sale_items VALUES("903","589","98","0","3.00","1234.00","0.00","3702.00","2021-06-10","2","0.00","1234.00","0.00","510.62","1","1","2021-06-10 14:19:21");
INSERT INTO kp_sale_items VALUES("904","580","6","0","1.00","0.00","0.00","0.00","2021-06-10","2","0.00","0.00","0.00","0.00","1","1","2021-06-10 15:51:14");
INSERT INTO kp_sale_items VALUES("905","580","220","0","1.00","500.00","0.00","500.00","2021-06-10","2","0.00","500.00","0.00","68.97","1","1","2021-06-10 15:51:24");
INSERT INTO kp_sale_items VALUES("906","590","2","0","1.00","600.00","0.00","600.00","2021-06-10","2","0.00","600.00","0.00","82.76","1","1","2021-06-10 15:53:13");
INSERT INTO kp_sale_items VALUES("907","591","4","0","1.00","1000.00","0.00","1000.00","2021-06-10","2","0.00","1000.00","0.00","137.93","1","1","2021-06-10 15:56:47");
INSERT INTO kp_sale_items VALUES("908","591","2","0","3.00","233.00","0.00","699.00","2021-06-10","2","0.00","233.00","0.00","96.41","1","1","2021-06-10 15:56:53");
INSERT INTO kp_sale_items VALUES("909","592","15","0","50.00","1190.00","0.00","59500.00","2021-06-10","2","0.00","1190.00","0.00","0.00","2","1","2021-06-10 16:05:06");
INSERT INTO kp_sale_items VALUES("910","592","64","0","4.00","344.00","0.00","1376.00","2021-06-10","2","0.00","344.00","0.00","189.79","1","1","2021-06-10 16:05:12");
INSERT INTO kp_sale_items VALUES("911","593","7","0","1.00","678.00","0.00","678.00","2021-06-10","2","0.00","678.00","0.00","93.52","1","1","2021-06-10 16:13:07");
INSERT INTO kp_sale_items VALUES("912","594","6","0","6.00","56.00","0.00","336.00","2021-06-10","2","0.00","56.00","0.00","46.34","1","1","2021-06-10 16:24:02");
INSERT INTO kp_sale_items VALUES("913","595","61","0","1.00","60.00","0.00","60.00","2021-06-10","2","0.00","60.00","0.00","8.28","1","1","2021-06-10 16:29:08");
INSERT INTO kp_sale_items VALUES("914","595","78","0","5.00","800.00","0.00","4000.00","2021-06-10","2","0.00","800.00","0.00","551.72","1","1","2021-06-10 16:29:15");
INSERT INTO kp_sale_items VALUES("915","596","14","0","1.00","1500.00","0.00","1500.00","2021-06-10","2","1440.00","60.00","0.00","0.00","2","1","2021-06-10 16:32:49");
INSERT INTO kp_sale_items VALUES("916","597","6","0","6.00","675.00","0.00","4050.00","2021-06-10","2","0.00","675.00","0.00","558.62","1","1","2021-06-10 16:38:34");
INSERT INTO kp_sale_items VALUES("917","598","14","0","4.00","1500.00","0.00","6000.00","2021-06-10","2","1440.00","60.00","0.00","0.00","2","1","2021-06-10 16:44:40");
INSERT INTO kp_sale_items VALUES("918","599","81","0","1.00","3000.00","0.00","3000.00","2021-06-10","2","2000.00","1000.00","0.00","413.79","1","1","2021-06-10 16:58:34");
INSERT INTO kp_sale_items VALUES("919","600","8","0","1.00","800.00","0.00","800.00","2021-06-10","2","0.00","800.00","0.00","0.00","2","2","2021-06-10 17:09:46");
INSERT INTO kp_sale_items VALUES("920","601","10","0","1.00","500.00","0.00","500.00","2021-06-10","2","0.00","500.00","0.00","0.00","2","2","2021-06-10 19:32:44");
INSERT INTO kp_sale_items VALUES("921","603","9","0","1.00","600.00","0.00","600.00","2021-06-10","2","0.00","600.00","0.00","0.00","2","1","2021-06-10 21:19:48");
INSERT INTO kp_sale_items VALUES("922","604","8","0","84.00","500.00","0.00","42000.00","2021-06-10","2","0.00","500.00","0.00","0.00","2","1","2021-06-11 11:07:07");





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
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_sale_payment VALUES("1","1","1","1","1000.00","225.00","775.00","2021-03-22","2021-03-22 13:39:13","0.00","775.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("2","2","1","1","4670.00","0.00","4670.00","2021-03-28","2021-03-28 09:43:23","0.00","4670.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("3","3","2","1","3550.00","0.00","3550.00","2021-03-28","2021-03-28 09:52:34","0.00","3550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("4","4","2","1","7140.00","0.00","7140.00","2021-03-28","2021-03-28 09:55:42","0.00","0.00","1","7140.00","");
INSERT INTO kp_sale_payment VALUES("5","5","2","2","995.00","0.00","995.00","2021-03-28","2021-03-28 10:00:44","0.00","995.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("6","6","2","1","250.00","0.00","250.00","2021-03-28","2021-03-28 10:01:34","0.00","0.00","1","250.00","");
INSERT INTO kp_sale_payment VALUES("7","8","2","1","1000.00","0.00","1000.00","0000-00-00","2021-03-28 11:21:06","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("8","10","2","1","8700.00","0.00","8700.00","2021-03-29","2021-03-29 11:00:44","0.00","8700.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("9","13","2","1","1080.00","0.00","1080.00","2021-03-29","2021-03-29 11:39:51","0.00","1080.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("10","14","2","1","1150.00","0.00","1150.00","2021-03-29","2021-03-29 11:41:13","0.00","1150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("11","16","2","1","55.00","0.00","55.00","2021-03-29","2021-03-29 11:45:45","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("12","18","1","1","250.00","0.00","250.00","2021-03-29","2021-03-29 12:09:45","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("13","19","2","1","130.00","0.00","130.00","2021-03-29","2021-03-29 12:11:59","0.00","130.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("14","20","2","1","2150.00","0.00","2150.00","2021-03-29","2021-03-29 12:12:40","0.00","2150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("15","22","2","1","50.00","0.00","50.00","2021-03-29","2021-03-29 12:15:53","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("16","24","2","1","100.00","0.00","100.00","2021-03-29","2021-03-29 12:18:56","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("17","25","2","1","720.00","0.00","720.00","2021-03-29","2021-03-29 12:27:34","0.00","720.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("18","26","2","1","1000.00","434.00","566.00","2021-03-29","2021-03-29 12:35:07","0.00","566.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("19","29","2","1","90.00","0.00","90.00","2021-03-29","2021-03-29 12:39:15","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("20","31","2","1","50.00","0.00","50.00","2021-03-29","2021-03-29 12:41:05","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("21","32","2","1","1000.00","330.00","670.00","2021-03-29","2021-03-29 12:53:04","0.00","670.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("22","36","2","1","400.00","40.00","360.00","2021-03-29","2021-03-29 13:25:40","0.00","360.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("23","39","2","1","500.00","305.00","195.00","2021-03-29","2021-03-29 14:07:11","0.00","195.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("24","41","2","1","1000.00","775.00","225.00","2021-03-29","2021-03-29 14:45:28","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("25","12","2","1","1000.00","510.00","490.00","2021-03-29","2021-03-29 14:59:52","0.00","490.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("26","45","2","1","200.00","75.00","125.00","2021-03-29","2021-03-29 15:00:30","0.00","125.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("27","47","2","1","2000.00","0.00","2000.00","2021-03-29","2021-03-29 15:38:26","0.00","2000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("28","50","2","1","2375.00","0.00","2375.00","2021-03-29","2021-03-29 15:50:07","0.00","2375.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("29","54","2","1","200.00","0.00","200.00","2021-03-29","2021-03-29 15:59:11","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("30","55","2","1","1400.00","0.00","1400.00","2021-03-29","2021-03-29 16:05:16","0.00","1400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("31","57","2","1","1550.00","10.00","1540.00","2021-03-29","2021-03-29 17:27:09","0.00","1540.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("32","58","2","1","250.00","0.00","250.00","0000-00-00","2021-03-29 17:32:30","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("33","59","2","1","200.00","10.00","190.00","2021-03-29","2021-03-29 17:33:10","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("34","61","2","1","380.00","0.00","380.00","2021-03-29","2021-03-29 17:53:37","0.00","380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("35","62","2","1","3200.00","60.00","3140.00","2021-03-29","2021-03-29 18:01:21","0.00","3140.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("36","63","2","1","1770.00","0.00","1770.00","2021-03-29","2021-03-29 18:16:58","0.00","1770.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("37","64","2","1","4000.00","436.00","3564.00","2021-03-29","2021-03-29 18:35:28","0.00","3564.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("38","65","2","1","225.00","0.00","225.00","2021-03-29","2021-03-29 18:37:14","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("39","66","2","1","4000.00","450.00","3550.00","0000-00-00","2021-03-29 18:45:54","0.00","3550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("40","67","2","1","110.00","0.00","110.00","2021-03-29","2021-03-29 18:51:59","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("41","68","2","1","250.00","0.00","250.00","2021-03-29","2021-03-29 18:53:20","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("42","69","2","1","500.00","320.00","180.00","2021-03-29","2021-03-29 18:55:54","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("43","70","2","1","135.00","0.00","135.00","2021-03-29","2021-03-29 19:02:07","0.00","135.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("44","71","2","1","3570.00","0.00","3570.00","2021-03-29","2021-03-29 19:02:37","0.00","0.00","1","3570.00","");
INSERT INTO kp_sale_payment VALUES("45","75","2","1","1530.00","0.00","1530.00","2021-03-30","2021-03-30 11:46:27","0.00","1530.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("46","76","2","1","8820.00","0.00","8820.00","0000-00-00","2021-03-30 12:47:46","0.00","8820.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("47","77","2","1","1240.00","0.00","1240.00","2021-03-30","2021-03-30 13:09:06","0.00","1240.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("48","78","2","1","150.00","40.00","110.00","2021-03-30","2021-03-30 13:10:21","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("49","79","2","1","1405.00","0.00","1405.00","2021-03-30","2021-03-30 13:14:10","0.00","1405.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("50","80","2","1","500.00","0.00","500.00","2021-03-30","2021-03-30 13:14:56","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("51","81","2","1","1470.00","0.00","1470.00","2021-03-30","2021-03-30 13:17:34","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("52","82","2","2","2600.00","130.00","2470.00","2021-03-30","2021-03-30 14:24:26","0.00","2470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("53","83","2","1","500.00","0.00","500.00","2021-03-30","2021-03-30 14:32:47","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("54","84","2","1","200.00","0.00","200.00","2021-03-30","2021-03-30 14:46:25","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("55","85","2","1","1000.00","610.00","390.00","2021-03-30","2021-03-30 15:46:10","0.00","390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("56","86","2","1","100.00","0.00","100.00","2021-03-30","2021-03-30 16:06:57","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("57","87","2","1","100.00","25.00","75.00","2021-03-30","2021-03-30 16:36:56","0.00","75.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("58","88","2","1","1000.00","190.00","810.00","2021-03-30","2021-03-30 16:55:17","0.00","810.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("59","90","2","1","300.00","55.00","245.00","2021-03-30","2021-03-30 17:09:22","0.00","245.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("60","91","2","1","200.00","20.00","180.00","2021-03-30","2021-03-30 17:16:39","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("61","92","2","1","200.00","65.00","135.00","2021-03-30","2021-03-30 17:22:58","0.00","135.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("62","93","2","1","50.00","0.00","50.00","2021-03-30","2021-03-30 17:23:50","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("63","94","2","1","100.00","40.00","60.00","2021-03-30","2021-03-30 17:50:34","0.00","60.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("64","97","2","1","2380.00","0.00","2380.00","2021-03-30","2021-03-30 17:57:24","0.00","2380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("65","98","2","1","220.00","15.00","205.00","2021-03-30","2021-03-30 18:10:00","0.00","205.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("66","99","2","1","1000.00","500.00","500.00","2021-03-30","2021-03-30 18:11:58","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("67","100","2","1","300.00","90.00","210.00","2021-03-30","2021-03-30 18:26:22","0.00","210.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("68","101","2","1","90.00","0.00","90.00","2021-03-30","2021-03-30 18:41:51","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("69","102","2","1","1000.00","680.00","320.00","2021-03-30","2021-03-30 18:50:30","0.00","320.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("70","103","2","1","1025.00","800.00","225.00","2021-03-31","2021-03-31 08:04:18","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("71","106","2","1","1000.00","800.00","200.00","2021-03-31","2021-03-31 08:19:59","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("72","107","2","1","4750.00","0.00","4750.00","2021-03-31","2021-03-31 08:33:15","0.00","4750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("73","109","2","1","100.00","50.00","50.00","2021-03-31","2021-03-31 08:57:29","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("74","110","2","1","50.00","0.00","50.00","0000-00-00","2021-03-31 10:31:38","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("75","111","2","1","150.00","6.00","144.00","0000-00-00","2021-03-31 10:48:00","0.00","144.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("76","112","2","1","1000.00","190.00","810.00","2021-03-31","2021-03-31 10:51:41","0.00","810.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("77","113","2","1","1480.00","0.00","1480.00","2021-03-31","2021-03-31 11:43:42","0.00","1480.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("78","114","2","1","600.00","20.00","580.00","0000-00-00","2021-03-31 15:07:25","0.00","580.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("79","115","2","1","600.00","0.00","600.00","0000-00-00","2021-03-31 16:01:45","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("80","116","2","1","500.00","100.00","400.00","2021-03-31","2021-03-31 16:06:35","0.00","400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("81","118","2","1","200.00","0.00","200.00","2021-03-31","2021-03-31 17:21:39","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("82","120","2","1","135.00","0.00","135.00","2021-03-31","2021-03-31 17:41:47","0.00","135.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("83","122","2","1","200.00","0.00","200.00","2021-03-31","2021-03-31 17:48:14","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("84","123","2","1","600.00","0.00","600.00","2021-03-31","2021-03-31 18:06:38","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("85","124","2","1","70.00","0.00","70.00","2021-03-31","2021-03-31 18:07:23","0.00","70.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("86","125","2","1","144.00","0.00","144.00","2021-03-31","2021-03-31 18:08:10","0.00","144.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("87","126","2","1","2060.00","0.00","2060.00","2021-03-31","2021-03-31 18:11:06","0.00","2060.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("88","127","2","1","5940.00","0.00","5940.00","2021-03-31","2021-03-31 18:13:17","0.00","5940.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("89","128","2","1","600.00","0.00","600.00","2021-03-31","2021-03-31 18:16:52","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("90","129","2","1","120.00","0.00","120.00","2021-03-31","2021-03-31 18:17:35","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("91","130","2","1","175.00","0.00","175.00","2021-03-31","2021-03-31 18:28:14","0.00","175.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("92","131","2","1","660.00","0.00","660.00","2021-03-31","2021-03-31 18:33:09","0.00","660.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("93","133","2","1","580.00","0.00","580.00","2021-03-31","2021-03-31 18:47:55","0.00","580.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("94","134","2","1","1800.00","0.00","1800.00","2021-04-01","2021-04-01 08:29:54","0.00","1800.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("95","135","2","1","9000.00","8180.00","820.00","2021-04-01","2021-04-01 09:17:32","0.00","820.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("96","137","2","1","2000.00","130.00","1870.00","2021-04-01","2021-04-01 09:52:38","0.00","1870.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("97","138","2","1","3300.00","50.00","3250.00","2021-04-01","2021-04-01 09:58:10","0.00","3250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("98","139","2","1","60.00","5.00","55.00","2021-04-01","2021-04-01 10:03:49","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("99","141","2","1","100.00","0.00","100.00","2021-04-01","2021-04-01 11:28:40","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("100","142","2","1","1100.00","20.00","1080.00","2021-04-01","2021-04-01 12:09:03","0.00","1080.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("101","143","2","1","50.00","0.00","50.00","2021-04-01","2021-04-01 12:11:03","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("102","144","2","1","100.00","0.00","100.00","2021-04-01","2021-04-01 12:12:14","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("103","146","2","1","1100.00","60.00","1040.00","2021-04-01","2021-04-01 12:37:24","0.00","1040.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("104","147","2","1","2360.00","0.00","2360.00","2021-04-01","2021-04-01 12:43:00","0.00","2360.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("105","148","2","1","1000.00","430.00","570.00","2021-04-01","2021-04-01 13:01:11","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("106","149","2","1","1530.00","0.00","1530.00","2021-04-01","2021-04-01 13:50:57","0.00","1530.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("107","151","2","1","2380.00","0.00","2380.00","2021-04-01","2021-04-01 14:03:56","0.00","2380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("108","152","2","1","220.00","100.00","120.00","2021-04-01","2021-04-01 14:31:40","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("109","153","2","1","700.00","10.00","690.00","2021-04-01","2021-04-01 15:09:19","0.00","690.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("110","154","2","1","200.00","105.00","95.00","2021-04-01","2021-04-01 15:41:07","0.00","95.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("111","157","2","1","200.00","0.00","200.00","2021-04-01","2021-04-01 16:51:29","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("112","158","2","1","720.00","0.00","720.00","2021-04-01","2021-04-01 17:06:20","0.00","720.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("113","156","2","1","20100.00","76.00","20024.00","2021-04-01","2021-04-01 17:23:01","0.00","20024.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("114","159","2","1","3070.00","0.00","3070.00","2021-04-01","2021-04-01 17:34:36","0.00","3070.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("115","160","2","1","500.00","0.00","500.00","2021-04-01","2021-04-01 17:59:03","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("116","161","2","1","1020.00","500.00","520.00","2021-04-01","2021-04-01 18:08:41","0.00","520.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("117","163","2","1","2000.00","560.00","1440.00","2021-04-01","2021-04-01 18:11:56","0.00","1440.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("118","164","2","1","110.00","0.00","110.00","2021-04-01","2021-04-01 18:12:57","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("119","165","2","1","500.00","140.00","360.00","2021-04-01","2021-04-01 18:19:21","0.00","360.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("120","166","2","1","200.00","35.00","165.00","2021-04-01","2021-04-01 18:26:23","0.00","165.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("121","167","2","1","120.00","0.00","120.00","2021-04-01","2021-04-01 18:27:10","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("122","168","2","1","100.00","0.00","100.00","2021-04-01","2021-04-01 19:14:15","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("123","169","2","1","135.00","0.00","135.00","2021-04-01","2021-04-01 19:14:41","0.00","135.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("124","170","2","1","265.00","0.00","265.00","2021-04-01","2021-04-01 19:17:04","0.00","265.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("125","171","2","1","1470.00","0.00","1470.00","2021-04-02","2021-04-02 08:20:39","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("126","172","2","1","240.00","5.00","235.00","2021-04-02","2021-04-02 08:23:36","0.00","235.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("127","173","2","1","3550.00","200.00","3350.00","2021-04-02","2021-04-02 08:27:51","0.00","3350.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("128","174","2","1","180.00","0.00","180.00","2021-04-02","2021-04-02 08:31:13","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("129","175","2","1","14370.00","0.00","14370.00","2021-04-02","2021-04-02 09:52:46","0.00","14370.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("130","177","2","1","1000.00","370.00","630.00","2021-04-02","2021-04-02 12:52:51","0.00","630.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("131","178","2","1","500.00","130.00","370.00","2021-04-02","2021-04-02 12:56:21","0.00","370.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("132","179","2","1","1470.00","0.00","1470.00","2021-04-02","2021-04-02 12:58:44","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("133","180","2","1","400.00","20.00","380.00","2021-04-02","2021-04-02 13:02:31","0.00","380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("134","181","2","1","100.00","0.00","100.00","2021-04-02","2021-04-02 13:05:47","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("135","182","2","1","120.00","0.00","120.00","2021-04-02","2021-04-02 13:13:40","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("136","184","2","1","6000.00","200.00","5800.00","2021-04-02","2021-04-02 13:53:01","0.00","5800.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("137","186","2","1","200.00","40.00","160.00","2021-04-02","2021-04-02 14:06:42","0.00","160.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("138","187","2","1","3000.00","1310.00","1690.00","2021-04-02","2021-04-02 14:19:55","0.00","1690.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("139","188","2","1","655.00","215.00","440.00","2021-04-02","2021-04-02 14:20:48","0.00","440.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("140","189","2","1","120.00","0.00","120.00","2021-04-02","2021-04-02 14:22:04","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("141","190","2","1","145.00","3.00","142.00","2021-04-02","2021-04-02 14:24:21","0.00","142.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("142","191","2","1","200.00","150.00","50.00","2021-04-02","2021-04-02 14:26:15","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("143","193","2","1","1500.00","480.00","1020.00","2021-04-02","2021-04-02 14:48:22","0.00","1020.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("144","194","2","1","1070.00","0.00","1070.00","2021-04-02","2021-04-02 14:54:15","0.00","1070.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("145","192","2","1","7955.00","0.00","7955.00","2021-04-02","2021-04-02 15:05:26","0.00","7955.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("146","196","2","1","190.00","0.00","190.00","2021-04-02","2021-04-02 15:10:03","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("147","197","2","1","980.00","0.00","980.00","2021-04-02","2021-04-02 15:17:01","0.00","980.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("148","198","2","1","500.00","0.00","500.00","2021-04-02","2021-04-02 15:33:25","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("149","199","2","1","160.00","0.00","160.00","2021-04-02","2021-04-02 15:43:16","0.00","160.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("150","200","2","1","800.00","30.00","770.00","2021-04-02","2021-04-02 15:50:17","0.00","770.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("151","203","2","1","1780.00","0.00","1780.00","2021-04-02","2021-04-02 15:57:22","0.00","1780.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("152","204","2","1","100.00","45.00","55.00","2021-04-02","2021-04-02 15:58:43","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("153","205","2","1","3400.00","2.00","3398.00","2021-04-02","2021-04-02 16:20:51","0.00","3398.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("154","207","2","1","800.00","75.00","725.00","2021-04-02","2021-04-02 16:28:01","0.00","725.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("155","209","2","1","100.00","25.00","75.00","2021-04-02","2021-04-02 16:46:51","0.00","75.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("156","210","2","1","1050.00","10.00","1040.00","2021-04-02","2021-04-02 16:49:42","0.00","1040.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("157","211","2","1","90.00","10.00","80.00","2021-04-02","2021-04-02 17:28:19","0.00","80.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("158","212","2","1","185.00","0.00","185.00","2021-04-02","2021-04-02 17:57:22","0.00","185.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("159","213","2","1","1000.00","492.00","508.00","2021-04-02","2021-04-02 18:01:36","0.00","508.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("160","214","2","1","200.00","70.00","130.00","2021-04-02","2021-04-02 18:04:29","0.00","130.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("161","215","2","1","7370.00","0.00","7370.00","2021-04-02","2021-04-02 18:15:30","0.00","7370.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("162","216","2","1","100.00","0.00","100.00","2021-04-02","2021-04-02 18:40:10","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("163","217","2","1","3030.00","0.00","3030.00","2021-04-02","2021-04-02 18:57:24","0.00","3030.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("164","218","2","1","3580.00","0.00","3580.00","2021-04-02","2021-04-02 19:08:16","0.00","3580.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("165","219","2","1","55.00","0.00","55.00","2021-04-03","2021-04-03 08:25:12","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("166","222","2","1","1000.00","430.00","570.00","2021-04-03","2021-04-03 08:30:40","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("167","223","2","1","1000.00","600.00","400.00","2021-04-03","2021-04-03 09:02:55","0.00","400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("168","224","2","1","550.00","35.00","515.00","2021-04-03","2021-04-03 09:07:13","0.00","515.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("169","225","2","1","550.00","10.00","540.00","2021-04-03","2021-04-03 09:12:39","0.00","540.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("170","226","2","1","300.00","50.00","250.00","2021-04-03","2021-04-03 09:18:03","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("171","227","2","1","250.00","25.00","225.00","2021-04-03","2021-04-03 09:59:17","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("172","228","2","1","55.00","0.00","55.00","2021-04-03","2021-04-03 10:12:27","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("173","231","2","1","5000.00","250.00","4750.00","2021-04-03","2021-04-03 10:58:25","0.00","4750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("174","232","2","1","100.00","0.00","100.00","2021-04-03","2021-04-03 11:36:35","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("175","233","2","1","140.00","35.00","105.00","2021-04-03","2021-04-03 11:37:43","0.00","105.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("176","234","2","1","50.00","0.00","50.00","2021-04-03","2021-04-03 11:38:38","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("177","237","2","1","2095.00","0.00","2095.00","2021-04-03","2021-04-03 12:40:23","0.00","2095.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("178","238","2","1","390.00","0.00","390.00","2021-04-03","2021-04-03 12:41:21","0.00","390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("179","236","2","1","5155.00","0.00","5155.00","2021-04-03","2021-04-03 12:42:46","0.00","5155.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("180","239","2","1","9500.00","75.00","9425.00","2021-04-03","2021-04-03 13:05:41","0.00","9425.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("181","240","2","1","500.00","165.00","335.00","2021-04-03","2021-04-03 15:25:44","0.00","335.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("182","241","2","1","1000.00","430.00","570.00","2021-04-03","2021-04-03 15:30:45","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("183","242","2","1","1000.00","490.00","510.00","2021-04-03","2021-04-03 15:49:20","0.00","510.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("184","243","2","1","750.00","15.00","735.00","2021-04-03","2021-04-03 15:56:58","0.00","735.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("185","245","2","1","200.00","0.00","200.00","2021-04-03","2021-04-03 15:59:19","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("186","246","2","1","210.00","0.00","210.00","2021-04-03","2021-04-03 16:01:36","0.00","210.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("187","247","2","1","3150.00","0.00","3150.00","2021-04-03","2021-04-03 16:26:25","0.00","3150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("188","249","2","1","3000.00","550.00","2450.00","2021-04-03","2021-04-03 16:29:54","0.00","2450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("189","250","2","1","1570.00","100.00","1470.00","2021-04-03","2021-04-03 16:37:05","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("190","251","2","1","1595.00","0.00","1595.00","2021-04-03","2021-04-03 16:44:02","0.00","1595.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("191","252","2","1","1000.00","0.00","1000.00","2021-04-03","2021-04-03 16:44:27","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("192","253","2","1","190.00","0.00","190.00","2021-04-03","2021-04-03 16:50:38","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("193","255","2","1","500.00","320.00","180.00","2021-04-03","2021-04-03 16:53:55","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("194","254","2","1","290.00","0.00","290.00","2021-04-03","2021-04-03 16:56:33","0.00","290.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("195","256","2","1","310.00","5.00","305.00","2021-04-03","2021-04-03 17:03:27","0.00","305.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("196","257","2","1","1000.00","0.00","1000.00","2021-04-03","2021-04-03 17:08:07","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("197","258","2","1","500.00","0.00","500.00","2021-04-03","2021-04-03 17:09:33","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("198","259","2","1","300.00","30.00","270.00","2021-04-03","2021-04-03 17:21:41","0.00","270.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("199","260","2","1","2000.00","280.00","1720.00","2021-04-03","2021-04-03 18:15:28","0.00","1720.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("200","261","2","1","1000.00","430.00","570.00","2021-04-03","2021-04-03 18:16:24","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("201","263","2","1","400.00","50.00","350.00","2021-04-03","2021-04-03 18:18:40","0.00","350.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("202","264","2","1","420.00","10.00","410.00","2021-04-03","2021-04-03 18:19:34","0.00","410.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("203","265","2","1","50.00","0.00","50.00","2021-04-03","2021-04-03 18:28:47","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("204","266","2","1","200.00","0.00","200.00","2021-04-03","2021-04-03 18:43:54","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("205","267","2","1","1400.00","0.00","1400.00","2021-04-03","2021-04-03 18:49:59","0.00","1400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("206","268","2","1","1000.00","0.00","1000.00","2021-04-05","2021-04-05 09:05:05","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("207","269","2","1","30.00","5.00","25.00","2021-04-05","2021-04-05 09:06:49","0.00","25.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("208","270","2","1","1820.00","0.00","1820.00","2021-04-05","2021-04-05 10:44:13","0.00","1820.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("209","271","2","1","1780.00","0.00","1780.00","2021-04-05","2021-04-05 10:59:03","0.00","1780.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("210","272","2","1","1000.00","440.00","560.00","2021-04-05","2021-04-05 11:09:55","0.00","560.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("211","273","2","1","50.00","0.00","50.00","2021-04-05","2021-04-05 11:11:58","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("212","275","2","1","1500.00","30.00","1470.00","2021-04-05","2021-04-05 11:55:36","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("213","276","2","1","500.00","110.00","390.00","2021-04-05","2021-04-05 12:10:58","0.00","390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("214","277","2","1","1470.00","0.00","1470.00","2021-04-05","2021-04-05 12:22:17","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("215","278","2","1","19000.00","60.00","18940.00","2021-04-05","2021-04-05 13:05:26","0.00","18940.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("216","279","2","1","600.00","40.00","560.00","2021-04-05","2021-04-05 13:19:23","0.00","560.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("217","280","2","1","120.00","0.00","120.00","2021-04-05","2021-04-05 13:42:10","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("218","282","2","1","310.00","15.00","295.00","2021-04-05","2021-04-05 14:17:21","0.00","295.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("219","283","2","1","550.00","0.00","550.00","2021-04-05","2021-04-05 14:34:20","0.00","550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("220","284","2","1","200.00","0.00","200.00","2021-04-05","2021-04-05 15:05:34","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("221","285","2","1","1100.00","20.00","1080.00","2021-04-05","2021-04-05 15:12:10","0.00","1080.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("222","286","2","1","1000.00","255.00","745.00","2021-04-05","2021-04-05 15:14:50","0.00","745.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("223","287","2","1","4000.00","950.00","3050.00","2021-04-05","2021-04-05 15:18:51","0.00","3050.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("224","288","2","1","1000.00","810.00","190.00","2021-04-05","2021-04-05 15:29:43","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("225","290","2","1","550.00","10.00","540.00","2021-04-05","2021-04-05 15:32:33","0.00","540.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("226","291","2","1","1500.00","20.00","1480.00","2021-04-05","2021-04-05 15:34:59","0.00","1480.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("227","292","2","1","1480.00","0.00","1480.00","2021-04-05","2021-04-05 15:35:28","0.00","1480.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("228","293","2","1","500.00","200.00","300.00","2021-04-05","2021-04-05 15:44:48","0.00","300.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("229","294","2","1","225.00","0.00","225.00","2021-04-05","2021-04-05 15:46:31","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("230","295","2","1","450.00","5.00","445.00","2021-04-05","2021-04-05 15:49:09","0.00","445.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("231","296","2","1","110.00","0.00","110.00","2021-04-05","2021-04-05 16:07:35","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("232","297","2","1","170.00","15.00","155.00","2021-04-05","2021-04-05 16:13:47","0.00","155.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("233","298","2","1","1050.00","0.00","1050.00","2021-04-05","2021-04-05 16:23:39","0.00","1050.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("234","299","2","1","735.00","0.00","735.00","2021-04-05","2021-04-05 16:42:57","0.00","735.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("235","300","2","1","1000.00","790.00","210.00","2021-04-05","2021-04-05 18:07:16","0.00","210.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("236","301","2","1","1270.00","0.00","1270.00","2021-04-05","2021-04-05 18:09:15","0.00","1270.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("237","302","2","1","2500.00","425.00","2075.00","2021-04-05","2021-04-05 18:17:41","0.00","2075.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("238","304","2","1","100.00","0.00","100.00","2021-04-05","2021-04-05 18:18:44","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("239","305","2","1","100.00","0.00","100.00","2021-04-05","2021-04-05 18:19:27","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("240","306","2","1","1000.00","500.00","500.00","2021-04-05","2021-04-05 18:25:01","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("241","307","2","1","2000.00","510.00","1490.00","2021-04-05","2021-04-05 18:36:33","0.00","1490.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("242","308","2","1","230.00","0.00","230.00","2021-04-05","2021-04-05 18:40:28","0.00","230.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("243","310","2","1","2200.00","50.00","2150.00","2021-04-05","2021-04-05 18:45:07","0.00","2150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("244","311","2","1","500.00","400.00","100.00","2021-04-05","2021-04-05 18:48:23","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("245","312","2","1","100.00","0.00","100.00","2021-04-05","2021-04-05 18:53:32","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("246","313","2","1","2390.00","0.00","2390.00","2021-04-06","2021-04-06 08:25:09","0.00","2390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("247","314","2","1","1450.00","0.00","1450.00","2021-04-06","2021-04-06 08:29:57","0.00","1450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("248","315","2","1","110.00","0.00","110.00","2021-04-06","2021-04-06 08:48:36","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("249","316","2","1","50.00","25.00","25.00","2021-04-06","2021-04-06 08:52:59","0.00","25.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("250","317","2","1","2000.00","236.00","1764.00","2021-04-06","2021-04-06 09:35:10","0.00","1764.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("251","318","2","1","60.00","5.00","55.00","2021-04-06","2021-04-06 09:46:28","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("252","319","2","1","500.00","0.00","500.00","2021-04-06","2021-04-06 11:37:33","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("253","320","2","1","1490.00","0.00","1490.00","2021-04-06","2021-04-06 13:28:32","0.00","1490.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("254","321","2","1","37788.00","0.00","37788.00","2021-04-06","2021-04-06 15:19:42","0.00","37788.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("255","323","2","1","400.00","50.00","350.00","2021-04-06","2021-04-06 16:03:59","0.00","350.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("256","324","2","1","2450.00","0.00","2450.00","2021-04-06","2021-04-06 16:28:33","0.00","2450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("257","326","2","1","2000.00","850.00","1150.00","2021-04-06","2021-04-06 17:10:42","0.00","1150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("258","327","2","1","1500.00","270.00","1230.00","2021-04-06","2021-04-06 17:21:15","0.00","1230.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("259","328","2","1","2390.00","0.00","2390.00","2021-04-06","2021-04-06 17:28:40","0.00","2390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("260","331","2","1","3552.00","0.00","3552.00","2021-04-06","2021-04-06 17:51:22","0.00","3552.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("261","329","2","1","3750.00","0.00","3750.00","2021-04-06","2021-04-06 17:51:38","0.00","3750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("262","332","2","1","490.00","0.00","490.00","2021-04-06","2021-04-06 17:52:42","0.00","490.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("263","333","2","1","200.00","0.00","200.00","2021-04-06","2021-04-06 17:54:09","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("264","334","2","1","90.00","0.00","90.00","2021-04-06","2021-04-06 18:00:49","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("265","335","2","1","1000.00","795.00","205.00","2021-04-06","2021-04-06 18:11:52","0.00","205.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("266","336","2","1","2470.00","0.00","2470.00","2021-04-06","2021-04-06 18:13:28","0.00","2470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("267","337","2","1","600.00","50.00","550.00","2021-04-06","2021-04-06 18:22:26","0.00","550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("268","338","2","1","9500.00","160.00","9340.00","2021-04-06","2021-04-06 18:27:57","0.00","9340.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("269","339","2","1","9500.00","0.00","9500.00","2021-04-06","2021-04-06 18:29:25","0.00","9500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("270","342","2","1","200.00","0.00","200.00","2021-04-06","2021-04-06 18:39:35","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("271","343","2","1","100.00","0.00","100.00","2021-04-06","2021-04-06 18:49:34","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("272","344","2","1","4840.00","0.00","4840.00","2021-04-07","2021-04-07 07:58:53","0.00","4840.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("273","346","2","1","1090.00","0.00","1090.00","2021-04-07","2021-04-07 09:01:00","0.00","1090.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("274","347","2","1","350.00","0.00","350.00","2021-04-07","2021-04-07 09:03:23","0.00","350.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("275","348","2","1","400.00","0.00","400.00","2021-04-07","2021-04-07 09:34:28","0.00","400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("276","350","2","1","500.00","90.00","410.00","2021-04-07","2021-04-07 09:44:28","0.00","410.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("277","349","2","1","1470.00","0.00","1470.00","2021-04-07","2021-04-07 09:58:12","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("278","351","2","1","1600.00","50.00","1550.00","2021-04-07","2021-04-07 09:59:56","0.00","1550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("279","355","2","1","1000.00","350.00","650.00","2021-04-07","2021-04-07 13:08:31","0.00","650.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("280","356","2","1","200.00","10.00","190.00","2021-04-07","2021-04-07 13:10:56","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("281","357","2","1","1100.00","0.00","1100.00","2021-04-07","2021-04-07 14:40:26","0.00","1100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("282","358","2","1","820.00","0.00","820.00","2021-04-07","2021-04-07 15:28:45","0.00","820.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("283","360","2","1","450.00","0.00","450.00","2021-04-07","2021-04-07 15:38:22","0.00","450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("284","361","2","1","180.00","0.00","180.00","2021-04-07","2021-04-07 16:01:39","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("285","362","2","1","200.00","0.00","200.00","2021-04-07","2021-04-07 16:13:27","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("286","363","2","1","1000.00","215.00","785.00","2021-04-07","2021-04-07 16:54:40","0.00","785.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("287","364","2","1","1075.00","0.00","1075.00","2021-04-07","2021-04-07 17:07:36","0.00","1075.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("288","365","2","1","75.00","0.00","75.00","2021-04-07","2021-04-07 17:12:14","0.00","75.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("289","366","2","1","200.00","110.00","90.00","2021-04-07","2021-04-07 17:37:50","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("290","367","2","1","110.00","85.00","25.00","2021-04-07","2021-04-07 17:38:41","0.00","25.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("291","368","2","1","200.00","60.00","140.00","2021-04-07","2021-04-07 17:43:44","0.00","140.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("292","369","2","1","200.00","0.00","200.00","2021-04-07","2021-04-07 17:54:53","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("293","370","2","1","19000.00","0.00","19000.00","2021-04-07","2021-04-07 18:15:39","0.00","19000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("294","371","2","1","2470.00","0.00","2470.00","2021-04-07","2021-04-07 18:19:17","0.00","2470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("295","372","2","1","1200.00","10.00","1190.00","2021-04-07","2021-04-07 18:22:16","0.00","1190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("296","373","2","1","1000.00","560.00","440.00","2021-04-07","2021-04-07 18:23:25","0.00","440.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("297","374","2","1","1250.00","0.00","1250.00","2021-04-07","2021-04-07 18:27:07","0.00","1250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("298","375","2","1","200.00","0.00","200.00","2021-04-07","2021-04-07 18:35:21","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("299","376","2","1","1000.00","740.00","260.00","2021-04-08","2021-04-08 08:14:47","0.00","260.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("300","377","2","1","200.00","0.00","200.00","2021-04-08","2021-04-08 08:38:11","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("301","378","2","1","50.00","0.00","50.00","2021-04-08","2021-04-08 08:41:28","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("302","379","2","1","4000.00","0.00","4000.00","0000-00-00","2021-04-08 12:46:41","0.00","4000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("303","380","2","1","190.00","0.00","190.00","0000-00-00","2021-04-08 13:18:25","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("304","381","2","1","50.00","0.00","50.00","2021-04-08","2021-04-08 13:20:51","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("305","385","2","1","200.00","0.00","200.00","2021-04-08","2021-04-08 14:27:24","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("306","386","2","1","600.00","50.00","550.00","2021-04-08","2021-04-08 15:10:34","0.00","550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("307","387","2","1","1500.00","70.00","1430.00","2021-04-08","2021-04-08 15:17:21","0.00","1430.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("308","388","2","1","1000.00","800.00","200.00","2021-04-08","2021-04-08 15:35:12","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("309","389","2","1","190.00","0.00","190.00","2021-04-08","2021-04-08 15:35:54","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("310","390","2","1","200.00","70.00","130.00","2021-04-08","2021-04-08 15:48:42","0.00","130.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("311","391","2","1","400.00","35.00","365.00","2021-04-08","2021-04-08 15:55:11","0.00","365.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("312","392","2","1","200.00","10.00","190.00","2021-04-08","2021-04-08 15:59:34","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("313","393","2","1","500.00","0.00","500.00","2021-04-08","2021-04-08 16:36:16","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("314","394","2","1","200.00","100.00","100.00","0000-00-00","2021-04-08 17:27:40","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("315","395","2","1","400.00","30.00","370.00","2021-04-08","2021-04-08 17:37:56","0.00","370.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("316","396","2","1","100.00","10.00","90.00","0000-00-00","2021-04-08 17:39:04","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("317","397","2","1","1000.00","430.00","570.00","0000-00-00","2021-04-08 17:45:52","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("318","398","2","1","1000.00","450.00","550.00","0000-00-00","2021-04-08 17:46:37","0.00","550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("319","399","2","1","1000.00","410.00","590.00","2021-04-08","2021-04-08 17:49:36","0.00","590.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("320","400","2","1","220.00","0.00","220.00","2021-04-08","2021-04-08 17:51:13","0.00","220.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("321","401","2","1","1000.00","780.00","220.00","2021-04-08","2021-04-08 17:52:03","0.00","220.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("322","402","2","1","90.00","0.00","90.00","2021-04-08","2021-04-08 17:53:19","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("323","403","2","1","200.00","110.00","90.00","2021-04-08","2021-04-08 17:54:40","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("324","404","2","1","100.00","10.00","90.00","2021-04-08","2021-04-08 18:00:22","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("325","405","2","1","220.00","0.00","220.00","2021-04-08","2021-04-08 18:06:17","0.00","220.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("326","406","2","1","205.00","0.00","205.00","2021-04-08","2021-04-08 18:06:47","0.00","205.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("327","407","2","1","70.00","0.00","70.00","2021-04-08","2021-04-08 18:20:40","0.00","70.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("328","408","2","1","500.00","300.00","200.00","2021-04-08","2021-04-08 18:21:57","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("329","410","2","1","1150.00","0.00","1150.00","2021-04-08","2021-04-08 18:25:33","0.00","1150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("330","411","2","1","200.00","0.00","200.00","2021-04-08","2021-04-08 18:26:40","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("331","412","2","1","500.00","260.00","240.00","2021-04-08","2021-04-08 18:27:52","0.00","240.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("332","415","2","1","150.00","0.00","150.00","2021-04-08","2021-04-08 18:30:45","0.00","150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("333","414","2","1","150.00","0.00","150.00","2021-04-08","2021-04-08 18:31:07","0.00","150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("334","416","2","1","550.00","25.00","525.00","2021-04-08","2021-04-08 18:46:45","0.00","525.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("335","417","2","1","100.00","0.00","100.00","2021-04-08","2021-04-08 18:51:07","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("336","418","2","1","520.00","0.00","520.00","2021-04-09","2021-04-09 08:00:50","0.00","520.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("337","419","2","1","30.00","0.00","30.00","2021-04-09","2021-04-09 08:10:53","0.00","30.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("338","421","2","1","100.00","10.00","90.00","2021-04-09","2021-04-09 08:26:55","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("339","423","2","1","1000.00","820.00","180.00","2021-04-09","2021-04-09 09:20:05","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("340","424","2","1","420.00","0.00","420.00","2021-04-09","2021-04-09 09:40:56","0.00","420.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("341","425","2","1","1175.00","0.00","1175.00","2021-04-09","2021-04-09 09:52:30","0.00","1175.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("342","427","2","1","220.00","0.00","220.00","2021-04-09","2021-04-09 11:08:21","0.00","220.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("343","429","2","1","1100.00","0.00","1100.00","2021-04-09","2021-04-09 11:34:55","0.00","1100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("344","431","2","1","180.00","0.00","180.00","2021-04-09","2021-04-09 11:42:50","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("345","432","2","1","300.00","0.00","300.00","2021-04-09","2021-04-09 12:07:48","0.00","300.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("346","434","2","1","380.00","0.00","380.00","2021-04-09","2021-04-09 12:51:41","0.00","380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("347","435","2","1","50.00","0.00","50.00","2021-04-09","2021-04-09 13:58:50","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("348","438","2","1","25.00","0.00","25.00","2021-04-09","2021-04-09 16:25:50","0.00","25.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("349","439","2","1","500.00","310.00","190.00","2021-04-09","2021-04-09 16:44:42","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("350","440","2","1","1000.00","800.00","200.00","2021-04-09","2021-04-09 16:51:43","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("351","441","2","1","1470.00","0.00","1470.00","2021-04-09","2021-04-09 16:59:51","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("352","442","2","1","1530.00","0.00","1530.00","2021-04-09","2021-04-09 17:02:32","0.00","1530.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("353","443","2","1","105.00","0.00","105.00","2021-04-09","2021-04-09 17:20:43","0.00","105.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("354","444","2","1","1500.00","30.00","1470.00","2021-04-09","2021-04-09 17:26:08","0.00","1470.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("355","445","2","1","400.00","150.00","250.00","2021-04-09","2021-04-09 17:27:21","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("356","446","2","1","500.00","70.00","430.00","2021-04-09","2021-04-09 17:31:43","0.00","430.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("357","447","2","1","1200.50","113.00","1087.50","2021-04-09","2021-04-09 17:50:56","0.00","1087.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("358","450","2","1","3620.00","0.00","3620.00","2021-04-09","2021-04-09 17:59:41","0.00","3620.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("359","451","2","1","120.00","0.00","120.00","2021-04-09","2021-04-09 18:15:42","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("360","452","2","1","100.00","40.00","60.00","2021-04-09","2021-04-09 18:35:24","0.00","60.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("361","453","2","1","205.00","0.00","205.00","2021-04-09","2021-04-09 18:45:04","0.00","205.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("362","449","2","1","1200.00","0.00","1200.00","2021-04-09","2021-04-09 18:49:18","0.00","1200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("363","455","2","1","1000.00","770.00","230.00","2021-04-09","2021-04-09 18:49:46","0.00","230.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("364","456","2","1","90.00","0.00","90.00","2021-04-10","2021-04-10 08:15:25","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("365","458","2","1","100.00","10.00","90.00","2021-04-10","2021-04-10 09:02:17","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("366","459","2","1","2000.00","480.00","1520.00","2021-04-10","2021-04-10 09:30:09","0.00","1520.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("367","461","2","1","100.00","0.00","100.00","2021-04-10","2021-04-10 09:45:30","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("368","462","2","1","1000.00","250.00","750.00","2021-04-10","2021-04-10 10:14:20","0.00","750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("369","463","2","1","55.00","0.00","55.00","2021-04-10","2021-04-10 10:18:56","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("370","465","2","1","115.00","0.00","115.00","2021-04-10","2021-04-10 16:29:45","0.00","115.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("371","466","2","1","1000.00","430.00","570.00","2021-04-10","2021-04-10 16:44:27","0.00","570.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("372","468","2","1","1300.00","475.00","825.00","2021-04-10","2021-04-10 17:04:15","0.00","825.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("373","469","2","1","2750.00","0.00","2750.00","2021-04-10","2021-04-10 17:09:16","0.00","2750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("374","470","2","1","120.00","0.00","120.00","2021-04-10","2021-04-10 17:11:51","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("375","471","2","1","150.00","0.00","150.00","2021-04-10","2021-04-10 17:12:30","0.00","150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("376","472","2","1","200.00","65.00","135.00","2021-04-10","2021-04-10 17:24:02","0.00","135.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("377","473","2","1","100.00","0.00","100.00","2021-04-10","2021-04-10 17:25:15","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("378","474","2","1","300.00","0.00","300.00","2021-04-10","2021-04-10 17:47:45","0.00","300.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("379","475","2","1","100.00","0.00","100.00","2021-04-10","2021-04-10 17:53:54","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("380","476","2","1","4750.00","0.00","4750.00","2021-04-10","2021-04-10 17:58:13","0.00","4750.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("381","477","2","1","500.00","50.00","450.00","2021-04-10","2021-04-10 18:08:33","0.00","450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("382","478","2","1","130.00","0.00","130.00","2021-04-10","2021-04-10 18:14:32","0.00","130.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("383","479","2","1","150.00","0.00","150.00","2021-04-10","2021-04-10 18:16:35","0.00","150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("384","480","2","1","2560.00","0.00","2560.00","2021-04-10","2021-04-10 18:31:47","0.00","2560.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("385","481","2","1","200.00","0.00","200.00","2021-04-10","2021-04-10 18:32:19","0.00","200.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("386","482","2","1","300.00","0.00","300.00","2021-04-10","2021-04-10 18:33:24","0.00","300.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("387","483","2","1","100.00","50.00","50.00","2021-04-10","2021-04-10 18:56:59","0.00","50.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("388","484","2","1","420.00","30.00","390.00","2021-04-10","2021-04-10 18:58:57","0.00","390.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("389","485","2","1","1000.00","470.00","530.00","2021-04-10","2021-04-10 19:02:32","0.00","530.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("390","486","2","1","550.00","430.00","120.00","2021-04-10","2021-04-10 19:12:56","0.00","120.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("391","487","2","1","340.00","20.00","320.00","2021-04-10","2021-04-10 19:16:18","0.00","320.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("392","488","2","1","900.00","0.00","900.00","2021-04-11","2021-04-11 12:02:15","0.00","900.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("393","489","2","1","1000.00","460.00","540.00","2021-04-11","2021-04-11 12:15:01","0.00","540.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("394","490","2","1","500.00","320.00","180.00","2021-04-11","2021-04-11 12:43:35","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("395","491","2","1","3330.00","0.00","3330.00","2021-04-11","2021-04-11 13:17:50","0.00","3330.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("396","493","2","1","1000.00","675.00","325.00","2021-04-11","2021-04-11 13:33:58","0.00","325.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("397","495","2","1","2085.00","0.00","2085.00","2021-04-11","2021-04-11 14:51:16","0.00","2085.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("398","496","2","1","18500.00","0.00","18500.00","2021-04-11","2021-04-11 15:05:49","0.00","18500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("399","497","2","1","8100.00","0.00","8100.00","2021-04-11","2021-04-11 15:08:30","0.00","8100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("400","492","2","1","10600.40","64.00","10536.40","2021-04-11","2021-04-11 15:16:40","0.00","10536.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("401","498","2","1","430.00","0.00","430.00","2021-04-11","2021-04-11 15:44:26","0.00","430.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("402","499","2","1","1000.00","410.00","590.00","2021-04-11","2021-04-11 16:00:55","0.00","590.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("403","502","2","1","3500.00","0.00","3500.00","2021-04-11","2021-04-11 16:16:28","0.00","3500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("404","503","2","1","90.00","0.00","90.00","2021-04-11","2021-04-11 16:21:35","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("405","504","2","1","1000.00","360.00","640.00","2021-04-11","2021-04-11 16:29:13","0.00","640.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("406","505","2","1","1050.00","0.00","1050.00","2021-04-11","2021-04-11 16:36:33","0.00","1050.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("407","506","2","1","550.00","70.00","480.00","2021-04-11","2021-04-11 16:39:08","0.00","480.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("408","507","2","1","1000.00","640.00","360.00","2021-04-11","2021-04-11 16:41:39","0.00","360.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("409","508","2","1","195.00","0.00","195.00","2021-04-11","2021-04-11 17:04:58","0.00","195.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("410","509","2","1","4605.00","0.00","4605.00","2021-04-11","2021-04-11 17:08:59","0.00","4605.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("411","510","2","1","500.00","20.00","480.00","2021-04-12","2021-04-12 08:17:12","0.00","480.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("412","511","2","1","130.00","0.00","130.00","2021-04-12","2021-04-12 08:40:41","0.00","130.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("413","514","2","1","850.00","0.00","850.00","2021-04-12","2021-04-12 09:34:06","0.00","850.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("414","515","2","1","125.00","0.00","125.00","2021-04-12","2021-04-12 09:36:37","0.00","125.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("415","516","2","1","500.00","275.00","225.00","2021-04-12","2021-04-12 09:46:17","0.00","225.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("416","517","2","1","500.00","50.00","450.00","2021-04-12","2021-04-12 09:47:34","0.00","450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("417","518","2","1","100.00","45.00","55.00","2021-04-12","2021-04-12 10:04:07","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("418","520","2","1","100.00","0.00","100.00","2021-04-12","2021-04-12 10:47:23","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("419","521","2","1","2140.00","0.00","2140.00","2021-04-12","2021-04-12 12:06:01","0.00","2140.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("420","523","2","1","850.00","0.00","850.00","2021-04-12","2021-04-12 12:07:21","0.00","850.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("421","527","2","1","100.00","0.00","100.00","2021-04-12","2021-04-12 12:42:53","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("422","528","2","1","190.00","0.00","190.00","2021-04-12","2021-04-12 12:52:55","0.00","190.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("423","529","2","1","580.00","0.00","580.00","2021-04-12","2021-04-12 13:05:41","0.00","580.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("424","531","2","1","110.00","0.00","110.00","2021-04-12","2021-04-12 13:19:08","0.00","110.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("425","530","2","1","1385.00","0.00","1385.00","2021-04-12","2021-04-12 13:20:03","0.00","1385.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("426","532","2","1","250.00","0.00","250.00","2021-04-12","2021-04-12 14:18:27","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("427","533","2","1","70.00","0.00","70.00","2021-04-12","2021-04-12 14:24:28","0.00","70.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("428","534","2","1","1050.00","0.00","1050.00","2021-04-12","2021-04-12 14:32:42","0.00","1050.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("429","537","2","1","25.00","0.00","25.00","2021-04-12","2021-04-12 15:52:40","0.00","25.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("430","538","2","1","60.00","5.00","55.00","2021-04-12","2021-04-12 15:57:05","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("431","539","2","1","3000.00","350.00","2650.00","2021-04-12","2021-04-12 16:03:39","0.00","2650.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("432","540","2","1","285.00","0.00","285.00","2021-04-12","2021-04-12 16:13:35","0.00","285.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("433","541","2","1","380.00","0.00","380.00","2021-04-12","2021-04-12 16:13:58","0.00","380.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("434","542","2","1","770.00","0.00","770.00","2021-04-12","2021-04-12 16:34:22","0.00","770.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("435","543","2","1","420.00","0.00","420.00","2021-04-12","2021-04-12 16:37:24","0.00","420.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("436","544","2","1","300.00","50.00","250.00","2021-04-12","2021-04-12 16:50:51","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("437","545","2","1","500.00","315.00","185.00","2021-04-12","2021-04-12 17:04:13","0.00","185.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("438","546","2","1","565.00","0.00","565.00","2021-04-12","2021-04-12 17:07:51","0.00","565.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("439","547","2","1","100.00","10.00","90.00","2021-04-12","2021-04-12 17:16:25","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("440","549","2","1","1000.00","820.00","180.00","2021-04-12","2021-04-12 17:43:39","0.00","180.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("441","550","2","1","360.00","0.00","360.00","2021-04-12","2021-04-12 17:47:31","0.00","360.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("442","548","2","1","490.00","0.00","490.00","2021-04-12","2021-04-12 17:49:10","0.00","490.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("443","551","2","1","1430.00","0.00","1430.00","2021-04-12","2021-04-12 17:50:55","0.00","1430.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("444","552","2","1","1000.00","450.00","550.00","2021-04-12","2021-04-12 17:59:22","0.00","550.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("445","553","2","1","200.00","5.00","195.00","2021-04-12","2021-04-12 18:01:17","0.00","195.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("446","555","2","1","335.00","0.00","335.00","2021-04-12","2021-04-12 18:15:41","0.00","335.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("447","556","2","1","400.00","70.00","330.00","2021-04-12","2021-04-12 18:22:11","0.00","330.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("448","557","2","1","1000.00","885.00","115.00","2021-04-12","2021-04-12 18:24:27","0.00","115.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("449","558","2","1","145.00","0.00","145.00","2021-04-13","2021-04-13 08:29:40","0.00","145.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("450","559","2","1","1000.00","750.00","250.00","2021-04-13","2021-04-13 08:58:46","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("451","560","2","1","250.00","0.00","250.00","2021-04-13","2021-04-13 09:24:12","0.00","250.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("452","561","2","1","100.00","45.00","55.00","2021-04-13","2021-04-13 10:30:25","0.00","55.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("453","562","2","1","100.00","0.00","100.00","2021-04-13","2021-04-13 10:43:57","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("454","563","2","1","450.00","0.00","450.00","2021-04-13","2021-04-13 10:53:41","0.00","450.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("455","564","2","1","530.00","0.00","530.00","2021-04-13","2021-04-13 11:05:13","0.00","530.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("456","565","2","1","90.00","0.00","90.00","2021-04-13","2021-04-13 11:06:55","0.00","90.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("459","566","2","1","2000.00","110.00","1890.00","2021-04-13","2021-04-13 13:04:44","0.00","1890.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("460","568","2","1","2100.00","0.00","2100.00","2021-04-13","2021-04-13 13:15:39","0.00","2100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("461","571","2","1","1500.00","500.00","1000.00","2021-04-13","2021-04-13 13:29:14","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("464","574","2","1","1935.00","0.00","1935.00","2021-04-13","2021-04-13 14:42:13","0.00","1935.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("465","575","2","2","150.00","10.00","140.00","2021-04-22","2021-04-22 22:58:47","0.00","140.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("469","577","2","2","50.00","0.00","50.00","2021-04-23","2021-04-23 00:52:05","0.00","50.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("470","577","2","2","500.00","0.00","500.00","2021-04-23","2021-04-23 00:54:04","0.00","500.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("471","577","2","2","100.00","0.00","100.00","2021-04-23","2021-04-23 01:07:15","0.00","100.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("472","579","2","2","6000.00","850.00","5150.00","2021-04-25","2021-04-25 10:29:16","0.00","5150.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("473","581","2","1","5400.00","0.00","5400.00","2021-04-25","2021-04-25 13:19:10","0.00","5400.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("474","582","2","1","1000.00","0.00","1000.00","2021-04-25","2021-05-11 12:49:37","0.00","1000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("475","585","2","1","100.00","0.00","100.00","2021-05-22","2021-05-22 14:16:10","0.00","100.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("476","586","2","3","500.00","0.00","500.00","2021-05-22","2021-05-22 14:28:54","0.00","500.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("478","587","2","2","200.00","0.00","200.00","2021-05-22","2021-05-22 14:35:20","200.00","0.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("479","588","2","1","500.00","0.00","500.00","2021-06-07","2021-06-09 16:10:20","0.00","0.00","1","500.00","OFK746YEM7");
INSERT INTO kp_sale_payment VALUES("480","578","2","1","600.00","0.00","600.00","2021-04-23","2021-06-10 13:10:48","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("481","589","2","1","77000.00","303.00","76697.00","2021-06-10","2021-06-10 15:44:17","0.00","76697.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("482","589","2","1","77000.00","303.00","76697.00","2021-06-10","2021-06-10 15:44:41","0.00","76697.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("483","589","2","1","77000.00","303.00","76697.00","2021-06-10","2021-06-10 15:45:16","0.00","76697.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("484","589","2","1","77000.00","303.00","76697.00","2021-06-10","2021-06-10 15:45:16","0.00","76697.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("485","580","2","2","500.00","0.00","500.00","2021-06-10","2021-06-10 15:51:32","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("486","580","2","2","500.00","0.00","500.00","2021-06-10","2021-06-10 15:51:34","0.00","500.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("487","576","2","1","20000.00","17200.00","2800.00","2021-04-22","2021-06-10 15:52:47","0.00","2800.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("488","576","2","1","20000.00","17200.00","2800.00","2021-04-22","2021-06-10 15:52:47","0.00","2800.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("489","590","2","1","700.00","100.00","600.00","2021-06-10","2021-06-10 15:53:26","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("490","590","2","1","700.00","100.00","600.00","2021-06-10","2021-06-10 15:53:27","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("491","590","2","1","7000.00","6400.00","600.00","2021-06-10","2021-06-10 15:54:48","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("492","590","2","1","7000.00","6400.00","600.00","2021-06-10","2021-06-10 15:54:48","0.00","600.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("493","591","2","2","1699.00","0.00","1699.00","2021-06-10","2021-06-10 15:57:19","1699.00","0.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("494","591","2","2","1699.00","0.00","1699.00","2021-06-10","2021-06-10 15:57:19","1699.00","0.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("495","591","2","2","16000.00","14301.00","1699.00","2021-06-10","2021-06-10 16:01:13","0.00","1699.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("496","591","2","2","5000.00","3301.00","1699.00","2021-06-10","2021-06-10 16:01:57","0.00","1699.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("497","592","2","1","70000.00","9124.00","60876.00","2021-06-10","2021-06-10 16:05:19","0.00","60876.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("498","577","2","2","150.00","0.00","150.00","2021-06-10","2021-06-10 16:07:31","0.00","150.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("499","577","2","2","150.00","0.00","150.00","2021-06-10","2021-06-10 16:08:18","150.00","0.00","2","0.00","");
INSERT INTO kp_sale_payment VALUES("500","593","2","1","678.00","0.00","678.00","2021-06-10","2021-06-10 16:14:25","0.00","177.00","1","501.00","OFK446A1DK,OFK746YEM7");
INSERT INTO kp_sale_payment VALUES("501","594","2","1","336.00","0.00","336.00","2021-06-10","2021-06-10 16:26:56","0.00","33.00","1","303.00","OFK446A1DK,OFK047HTOO,");
INSERT INTO kp_sale_payment VALUES("502","595","2","1","4060.00","0.00","4060.00","2021-06-10","2021-06-10 16:29:37","0.00","3390.00","1","670.00","OFK746YEM7,OFK649HQPA");
INSERT INTO kp_sale_payment VALUES("503","596","2","1","1500.00","0.00","1500.00","2021-06-10","2021-06-10 16:33:06","0.00","1300.00","1","200.00","OFK3482MUR");
INSERT INTO kp_sale_payment VALUES("504","597","2","2","4050.00","0.00","4050.00","2021-06-10","2021-06-10 16:38:46","0.00","3100.00","1","950.00","OFK849PWZ8");
INSERT INTO kp_sale_payment VALUES("505","598","2","1","6000.00","0.00","6000.00","2021-06-10","2021-06-10 16:44:53","0.00","4000.00","1","2000.00","OFK348OZTX");
INSERT INTO kp_sale_payment VALUES("506","599","2","1","3000.00","0.00","3000.00","2021-06-10","2021-06-10 16:59:42","1000.00","2000.00","1","0.00","");
INSERT INTO kp_sale_payment VALUES("507","586","2","3","200.00","0.00","200.00","2021-06-10","2021-06-10 17:02:24","0.00","0.00","2","200.00","OFK94A4OA7");
INSERT INTO kp_sale_payment VALUES("508","600","2","2","600.00","0.00","600.00","2021-06-10","2021-06-10 17:10:15","0.00","400.00","2","200.00","OFK94A4OA7");
INSERT INTO kp_sale_payment VALUES("509","603","2","2","600.00","0.00","600.00","2021-06-10","2021-06-10 21:25:06","0.00","0.00","1","600.00","OFK24BLWRC");
INSERT INTO kp_sale_payment VALUES("510","604","2","2","43000.00","500.00","42500.00","2021-06-10","2021-06-11 11:39:09","0.00","42500.00","1","0.00","");





CREATE TABLE `kp_sale_reprint` (
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appr_by` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_sale_reprint VALUES("1","1","2","2021-03-22","2021-03-22 13:45:52");
INSERT INTO kp_sale_reprint VALUES("1","1","2","2021-03-22","2021-03-22 13:46:21");
INSERT INTO kp_sale_reprint VALUES("1","1","2","2021-03-22","2021-03-22 13:46:42");
INSERT INTO kp_sale_reprint VALUES("116","2","2","2021-03-31","2021-03-31 17:19:11");
INSERT INTO kp_sale_reprint VALUES("103","2","2","2021-03-31","2021-03-31 17:24:06");
INSERT INTO kp_sale_reprint VALUES("113","2","2","2021-03-31","2021-03-31 17:24:32");
INSERT INTO kp_sale_reprint VALUES("109","2","2","2021-03-31","2021-03-31 17:49:05");
INSERT INTO kp_sale_reprint VALUES("135","2","2","2021-04-01","2021-04-01 09:48:49");
INSERT INTO kp_sale_reprint VALUES("134","2","2","2021-04-01","2021-04-01 10:00:12");
INSERT INTO kp_sale_reprint VALUES("171","2","2","2021-04-02","2021-04-02 13:17:06");
INSERT INTO kp_sale_reprint VALUES("173","2","2","2021-04-02","2021-04-02 13:31:35");
INSERT INTO kp_sale_reprint VALUES("177","2","2","2021-04-02","2021-04-02 13:32:28");
INSERT INTO kp_sale_reprint VALUES("251","2","2","2021-04-03","2021-04-03 16:49:30");
INSERT INTO kp_sale_reprint VALUES("321","2","2","2021-04-06","2021-04-06 15:39:12");
INSERT INTO kp_sale_reprint VALUES("350","2","2","2021-04-07","2021-04-07 12:54:45");
INSERT INTO kp_sale_reprint VALUES("368","2","2","2021-04-07","2021-04-07 17:44:26");
INSERT INTO kp_sale_reprint VALUES("378","2","2","2021-04-08","2021-04-08 13:38:27");
INSERT INTO kp_sale_reprint VALUES("376","2","2","2021-04-08","2021-04-08 17:01:23");
INSERT INTO kp_sale_reprint VALUES("434","2","2","2021-04-09","2021-04-09 16:20:56");
INSERT INTO kp_sale_reprint VALUES("468","2","2","2021-04-10","2021-04-10 17:05:30");
INSERT INTO kp_sale_reprint VALUES("468","2","2","2021-04-10","2021-04-10 17:05:56");
INSERT INTO kp_sale_reprint VALUES("468","2","2","2021-04-10","2021-04-10 17:06:19");
INSERT INTO kp_sale_reprint VALUES("571","2","2","2021-04-13","2021-04-13 13:33:09");
INSERT INTO kp_sale_reprint VALUES("571","2","2","2021-04-13","2021-04-13 13:35:26");
INSERT INTO kp_sale_reprint VALUES("570","2","2","2021-04-13","2021-04-13 13:36:20");
INSERT INTO kp_sale_reprint VALUES("570","2","2","2021-04-13","2021-04-13 13:40:03");





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

INSERT INTO kp_sale_status VALUES("601","2","2","0","3","2","0","2021-06-10");
INSERT INTO kp_sale_status VALUES("602","2","1","2","3","1","0","2021-06-10");
INSERT INTO kp_sale_status VALUES("605","2","1","2","3","1","0","2021-06-11");





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
  PRIMARY KEY (`sale_id`),
  KEY `day` (`day`),
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_sales VALUES("1","1","1","775.00","0.00","775.00","1","1","2021-03-22","2021-03-22 13:39:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("2","1","1","4670.00","0.00","4670.00","1","1","2021-03-28","2021-03-28 09:43:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("3","1","2","3550.00","0.00","3550.00","1","1","2021-03-28","2021-03-28 09:52:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("4","1","2","7140.00","0.00","7140.00","1","1","2021-03-28","2021-03-28 09:55:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("5","2","2","995.00","0.00","995.00","1","1","2021-03-28","2021-03-28 10:00:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("6","1","2","250.00","0.00","250.00","1","1","2021-03-28","2021-03-28 10:01:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("8","1","2","1000.00","0.00","1000.00","1","1","0000-00-00","2021-03-28 11:21:06","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("10","1","2","8700.00","0.00","8700.00","1","1","2021-03-29","2021-03-29 11:00:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("12","1","2","490.00","0.00","490.00","1","1","2021-03-29","2021-03-29 14:59:52","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("13","1","2","1080.00","0.00","1080.00","1","1","2021-03-29","2021-03-29 11:39:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("14","1","2","1150.00","0.00","1150.00","1","1","2021-03-29","2021-03-29 11:41:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("16","1","2","55.00","0.00","55.00","1","1","2021-03-29","2021-03-29 11:45:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("18","1","1","250.00","0.00","250.00","1","1","2021-03-29","2021-03-29 12:09:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("19","1","2","130.00","0.00","130.00","1","1","2021-03-29","2021-03-29 12:11:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("20","1","2","2150.00","0.00","2150.00","1","1","2021-03-29","2021-03-29 12:12:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("22","1","2","50.00","0.00","50.00","1","1","2021-03-29","2021-03-29 12:15:53","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("24","1","2","100.00","0.00","100.00","1","1","2021-03-29","2021-03-29 12:18:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("25","1","2","720.00","0.00","720.00","1","1","2021-03-29","2021-03-29 12:27:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("26","1","2","566.00","0.00","566.00","1","1","2021-03-29","2021-03-29 12:35:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("29","1","2","90.00","0.00","90.00","1","1","2021-03-29","2021-03-29 12:39:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("31","1","2","50.00","0.00","50.00","1","1","2021-03-29","2021-03-29 12:41:05","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("32","1","2","670.00","0.00","670.00","1","1","2021-03-29","2021-03-29 12:53:04","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("36","1","2","360.00","0.00","360.00","1","1","2021-03-29","2021-03-29 13:25:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("39","1","2","195.00","0.00","195.00","1","1","2021-03-29","2021-03-29 14:07:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("41","1","2","225.00","0.00","225.00","1","1","2021-03-29","2021-03-29 14:45:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("45","1","2","125.00","0.00","125.00","1","1","2021-03-29","2021-03-29 15:00:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("47","1","2","2000.00","0.00","2000.00","1","1","2021-03-29","2021-03-29 15:38:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("50","1","2","2375.00","0.00","2375.00","1","1","2021-03-29","2021-03-29 15:50:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("54","1","2","200.00","0.00","200.00","1","1","2021-03-29","2021-03-29 15:59:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("55","1","2","1400.00","0.00","1400.00","1","1","2021-03-29","2021-03-29 16:05:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("57","1","2","1540.00","0.00","1540.00","1","1","2021-03-29","2021-03-29 17:27:09","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("58","1","2","250.00","0.00","250.00","1","1","0000-00-00","2021-03-29 17:32:30","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("59","1","2","190.00","0.00","190.00","1","1","2021-03-29","2021-03-29 17:33:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("61","1","2","380.00","0.00","380.00","1","1","2021-03-29","2021-03-29 17:53:37","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("62","1","2","3140.00","0.00","3140.00","1","1","2021-03-29","2021-03-29 18:01:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("63","1","2","1770.00","0.00","1770.00","1","1","2021-03-29","2021-03-29 18:16:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("64","1","2","3564.00","0.00","3564.00","1","1","2021-03-29","2021-03-29 18:35:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("65","1","2","225.00","0.00","225.00","1","1","2021-03-29","2021-03-29 18:37:14","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("66","1","2","3550.00","0.00","3550.00","1","1","0000-00-00","2021-03-29 18:45:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("67","1","2","110.00","0.00","110.00","1","1","2021-03-29","2021-03-29 18:51:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("68","1","2","250.00","0.00","250.00","1","1","2021-03-29","2021-03-29 18:53:20","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("69","1","2","180.00","0.00","180.00","1","1","2021-03-29","2021-03-29 18:55:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("70","1","2","135.00","0.00","135.00","1","1","2021-03-29","2021-03-29 19:02:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("71","1","2","3570.00","0.00","3570.00","1","1","2021-03-29","2021-03-29 19:02:37","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("75","1","2","1530.00","0.00","1530.00","1","1","2021-03-30","2021-03-30 11:46:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("76","1","2","8820.00","0.00","8820.00","1","1","0000-00-00","2021-03-30 12:47:46","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("77","1","2","1240.00","0.00","1240.00","1","1","2021-03-30","2021-03-30 13:09:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("78","1","2","110.00","0.00","110.00","1","1","2021-03-30","2021-03-30 13:10:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("79","1","2","1405.00","0.00","1405.00","1","1","2021-03-30","2021-03-30 13:14:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("80","1","2","500.00","0.00","500.00","1","1","2021-03-30","2021-03-30 13:14:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("81","1","2","1470.00","0.00","1470.00","1","1","2021-03-30","2021-03-30 13:17:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("82","2","2","2470.00","0.00","2470.00","1","1","2021-03-30","2021-03-30 14:24:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("83","1","2","500.00","0.00","500.00","1","1","2021-03-30","2021-03-30 14:32:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("84","1","2","200.00","0.00","200.00","1","1","2021-03-30","2021-03-30 14:46:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("85","1","2","390.00","0.00","390.00","1","1","2021-03-30","2021-03-30 15:46:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("86","1","2","100.00","0.00","100.00","1","1","2021-03-30","2021-03-30 16:06:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("87","1","2","75.00","0.00","75.00","1","1","2021-03-30","2021-03-30 16:36:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("88","1","2","810.00","0.00","810.00","1","1","2021-03-30","2021-03-30 16:55:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("90","1","2","245.00","0.00","245.00","1","1","2021-03-30","2021-03-30 17:09:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("91","1","2","180.00","0.00","180.00","1","1","2021-03-30","2021-03-30 17:16:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("92","1","2","135.00","0.00","135.00","1","1","2021-03-30","2021-03-30 17:22:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("93","1","2","50.00","0.00","50.00","1","1","2021-03-30","2021-03-30 17:23:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("94","1","2","60.00","0.00","60.00","1","1","2021-03-30","2021-03-30 17:50:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("97","1","2","2380.00","0.00","2380.00","1","1","2021-03-30","2021-03-30 17:57:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("98","1","2","205.00","0.00","205.00","1","1","2021-03-30","2021-03-30 18:10:00","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("99","1","2","500.00","0.00","500.00","1","1","2021-03-30","2021-03-30 18:11:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("100","1","2","210.00","0.00","210.00","1","1","2021-03-30","2021-03-30 18:26:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("101","1","2","90.00","0.00","90.00","1","1","2021-03-30","2021-03-30 18:41:52","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("102","1","2","320.00","0.00","320.00","1","1","2021-03-30","2021-03-30 18:50:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("103","1","2","225.00","0.00","225.00","1","1","2021-03-31","2021-03-31 08:04:18","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("106","1","2","200.00","0.00","200.00","1","1","2021-03-31","2021-03-31 08:19:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("107","1","2","4750.00","0.00","4750.00","1","1","2021-03-31","2021-03-31 08:33:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("109","1","2","50.00","0.00","50.00","1","1","2021-03-31","2021-03-31 08:57:29","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("110","1","2","50.00","0.00","50.00","1","1","0000-00-00","2021-03-31 10:31:38","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("111","1","2","144.00","0.00","144.00","1","1","0000-00-00","2021-03-31 10:48:00","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("112","1","2","810.00","0.00","810.00","1","1","2021-03-31","2021-03-31 10:51:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("113","1","2","1480.00","0.00","1480.00","1","1","2021-03-31","2021-03-31 11:43:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("114","1","2","580.00","0.00","580.00","1","1","0000-00-00","2021-03-31 15:07:25","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("115","1","2","600.00","0.00","600.00","1","1","0000-00-00","2021-03-31 16:01:45","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("116","1","2","400.00","0.00","400.00","1","1","2021-03-31","2021-03-31 16:06:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("118","1","2","200.00","0.00","200.00","1","1","2021-03-31","2021-03-31 17:21:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("120","1","2","135.00","0.00","135.00","1","1","2021-03-31","2021-03-31 17:41:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("122","1","2","200.00","0.00","200.00","1","1","2021-03-31","2021-03-31 17:48:14","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("123","1","2","600.00","0.00","600.00","1","1","2021-03-31","2021-03-31 18:06:38","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("124","1","2","70.00","0.00","70.00","1","1","2021-03-31","2021-03-31 18:07:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("125","1","2","144.00","0.00","144.00","1","1","2021-03-31","2021-03-31 18:08:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("126","1","2","2060.00","0.00","2060.00","1","1","2021-03-31","2021-03-31 18:11:06","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("127","1","2","5940.00","0.00","5940.00","1","1","2021-03-31","2021-03-31 18:13:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("128","1","2","600.00","0.00","600.00","1","1","2021-03-31","2021-03-31 18:16:52","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("129","1","2","120.00","0.00","120.00","1","1","2021-03-31","2021-03-31 18:17:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("130","1","2","175.00","0.00","175.00","1","1","2021-03-31","2021-03-31 18:28:14","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("131","1","2","660.00","0.00","660.00","1","1","2021-03-31","2021-03-31 18:33:09","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("133","1","2","580.00","0.00","580.00","1","1","2021-03-31","2021-03-31 18:47:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("134","1","2","1800.00","0.00","1800.00","1","1","2021-04-01","2021-04-01 08:29:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("135","1","2","820.00","0.00","820.00","1","1","2021-04-01","2021-04-01 09:17:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("137","1","2","1870.00","0.00","1870.00","1","1","2021-04-01","2021-04-01 09:52:38","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("138","1","2","3250.00","0.00","3250.00","1","1","2021-04-01","2021-04-01 09:58:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("139","1","2","55.00","0.00","55.00","1","1","2021-04-01","2021-04-01 10:03:49","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("141","1","2","100.00","0.00","100.00","1","1","2021-04-01","2021-04-01 11:28:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("142","1","2","1080.00","0.00","1080.00","1","1","2021-04-01","2021-04-01 12:09:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("143","1","2","50.00","0.00","50.00","1","1","2021-04-01","2021-04-01 12:11:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("144","1","2","100.00","0.00","100.00","1","1","2021-04-01","2021-04-01 12:12:14","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("146","1","2","1040.00","0.00","1040.00","1","1","2021-04-01","2021-04-01 12:37:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("147","1","2","2360.00","0.00","2360.00","1","1","2021-04-01","2021-04-01 12:43:00","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("148","1","2","570.00","0.00","570.00","1","1","2021-04-01","2021-04-01 13:01:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("149","1","2","1530.00","0.00","1530.00","1","1","2021-04-01","2021-04-01 13:50:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("151","1","2","2380.00","0.00","2380.00","1","1","2021-04-01","2021-04-01 14:03:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("152","1","2","120.00","0.00","120.00","1","1","2021-04-01","2021-04-01 14:31:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("153","1","2","690.00","0.00","690.00","1","1","2021-04-01","2021-04-01 15:09:19","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("154","1","2","95.00","0.00","95.00","1","1","2021-04-01","2021-04-01 15:41:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("156","1","2","20024.00","0.00","20024.00","1","1","2021-04-01","2021-04-01 17:23:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("157","1","2","200.00","0.00","200.00","1","1","2021-04-01","2021-04-01 16:51:29","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("158","1","2","720.00","0.00","720.00","1","1","2021-04-01","2021-04-01 17:06:20","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("159","1","2","3070.00","0.00","3070.00","1","1","2021-04-01","2021-04-01 17:34:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("160","1","2","500.00","0.00","500.00","1","1","2021-04-01","2021-04-01 17:59:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("161","1","2","520.00","0.00","520.00","1","1","2021-04-01","2021-04-01 18:08:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("163","1","2","1440.00","0.00","1440.00","1","1","2021-04-01","2021-04-01 18:11:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("164","1","2","110.00","0.00","110.00","1","1","2021-04-01","2021-04-01 18:12:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("165","1","2","360.00","0.00","360.00","1","1","2021-04-01","2021-04-01 18:19:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("166","1","2","165.00","0.00","165.00","1","1","2021-04-01","2021-04-01 18:26:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("167","1","2","120.00","0.00","120.00","1","1","2021-04-01","2021-04-01 18:27:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("168","1","2","100.00","0.00","100.00","1","1","2021-04-01","2021-04-01 19:14:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("169","1","2","135.00","0.00","135.00","1","1","2021-04-01","2021-04-01 19:14:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("170","1","2","265.00","0.00","265.00","1","1","2021-04-01","2021-04-01 19:17:04","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("171","1","2","1470.00","0.00","1470.00","1","1","2021-04-02","2021-04-02 08:20:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("172","1","2","235.00","0.00","235.00","1","1","2021-04-02","2021-04-02 08:23:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("173","1","2","3350.00","0.00","3350.00","1","1","2021-04-02","2021-04-02 08:27:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("174","1","2","180.00","0.00","180.00","1","1","2021-04-02","2021-04-02 08:31:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("175","1","2","14370.00","0.00","14370.00","1","1","2021-04-02","2021-04-02 09:52:46","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("177","1","2","630.00","0.00","630.00","1","1","2021-04-02","2021-04-02 12:52:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("178","1","2","370.00","0.00","370.00","1","1","2021-04-02","2021-04-02 12:56:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("179","1","2","1470.00","0.00","1470.00","1","1","2021-04-02","2021-04-02 12:58:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("180","1","2","380.00","0.00","380.00","1","1","2021-04-02","2021-04-02 13:02:31","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("181","1","2","100.00","0.00","100.00","1","1","2021-04-02","2021-04-02 13:05:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("182","1","2","120.00","0.00","120.00","1","1","2021-04-02","2021-04-02 13:13:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("184","1","2","5800.00","0.00","5800.00","1","1","2021-04-02","2021-04-02 13:53:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("186","1","2","160.00","0.00","160.00","1","1","2021-04-02","2021-04-02 14:06:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("187","1","2","1690.00","0.00","1690.00","1","1","2021-04-02","2021-04-02 14:19:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("188","1","2","440.00","0.00","440.00","1","1","2021-04-02","2021-04-02 14:20:48","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("189","1","2","120.00","0.00","120.00","1","1","2021-04-02","2021-04-02 14:22:04","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("190","1","2","142.00","0.00","142.00","1","1","2021-04-02","2021-04-02 14:24:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("191","1","2","50.00","0.00","50.00","1","1","2021-04-02","2021-04-02 14:26:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("192","1","2","7955.00","0.00","7955.00","1","1","2021-04-02","2021-04-02 15:05:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("193","1","2","1020.00","0.00","1020.00","1","1","2021-04-02","2021-04-02 14:48:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("194","1","2","1070.00","0.00","1070.00","1","1","2021-04-02","2021-04-02 14:54:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("196","1","2","190.00","0.00","190.00","1","1","2021-04-02","2021-04-02 15:10:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("197","1","2","980.00","0.00","980.00","1","1","2021-04-02","2021-04-02 15:17:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("198","1","2","500.00","0.00","500.00","1","1","2021-04-02","2021-04-02 15:33:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("199","1","2","160.00","0.00","160.00","1","1","2021-04-02","2021-04-02 15:43:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("200","1","2","770.00","0.00","770.00","1","1","2021-04-02","2021-04-02 15:50:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("203","1","2","1780.00","0.00","1780.00","1","1","2021-04-02","2021-04-02 15:57:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("204","1","2","55.00","0.00","55.00","1","1","2021-04-02","2021-04-02 15:58:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("205","1","2","3398.00","0.00","3398.00","1","1","2021-04-02","2021-04-02 16:20:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("207","1","2","725.00","0.00","725.00","1","1","2021-04-02","2021-04-02 16:28:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("209","1","2","75.00","0.00","75.00","1","1","2021-04-02","2021-04-02 16:46:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("210","1","2","1040.00","0.00","1040.00","1","1","2021-04-02","2021-04-02 16:49:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("211","1","2","80.00","0.00","80.00","1","1","2021-04-02","2021-04-02 17:28:19","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("212","1","2","185.00","0.00","185.00","1","1","2021-04-02","2021-04-02 17:57:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("213","1","2","508.00","0.00","508.00","1","1","2021-04-02","2021-04-02 18:01:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("214","1","2","130.00","0.00","130.00","1","1","2021-04-02","2021-04-02 18:04:29","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("215","1","2","7370.00","0.00","7370.00","1","1","2021-04-02","2021-04-02 18:15:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("216","1","2","100.00","0.00","100.00","1","1","2021-04-02","2021-04-02 18:40:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("217","1","2","3030.00","0.00","3030.00","1","1","2021-04-02","2021-04-02 18:57:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("218","1","2","3580.00","0.00","3580.00","1","1","2021-04-02","2021-04-02 19:08:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("219","1","2","55.00","0.00","55.00","1","1","2021-04-03","2021-04-03 08:25:12","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("222","1","2","570.00","0.00","570.00","1","1","2021-04-03","2021-04-03 08:30:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("223","1","2","400.00","0.00","400.00","1","1","2021-04-03","2021-04-03 09:02:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("224","1","2","515.00","0.00","515.00","1","1","2021-04-03","2021-04-03 09:07:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("225","1","2","540.00","0.00","540.00","1","1","2021-04-03","2021-04-03 09:12:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("226","1","2","250.00","0.00","250.00","1","1","2021-04-03","2021-04-03 09:18:04","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("227","1","2","225.00","0.00","225.00","1","1","2021-04-03","2021-04-03 09:59:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("228","1","2","55.00","0.00","55.00","1","1","2021-04-03","2021-04-03 10:12:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("231","1","2","4750.00","0.00","4750.00","1","1","2021-04-03","2021-04-03 10:58:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("232","1","2","100.00","0.00","100.00","1","1","2021-04-03","2021-04-03 11:36:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("233","1","2","105.00","0.00","105.00","1","1","2021-04-03","2021-04-03 11:37:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("234","1","2","50.00","0.00","50.00","1","1","2021-04-03","2021-04-03 11:38:38","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("236","1","2","5155.00","0.00","5155.00","1","1","2021-04-03","2021-04-03 12:42:46","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("237","1","2","2095.00","0.00","2095.00","1","1","2021-04-03","2021-04-03 12:40:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("238","1","2","390.00","0.00","390.00","1","1","2021-04-03","2021-04-03 12:41:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("239","1","2","9425.00","0.00","9425.00","1","1","2021-04-03","2021-04-03 13:05:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("240","1","2","335.00","0.00","335.00","1","1","2021-04-03","2021-04-03 15:25:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("241","1","2","570.00","0.00","570.00","1","1","2021-04-03","2021-04-03 15:30:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("242","1","2","510.00","0.00","510.00","1","1","2021-04-03","2021-04-03 15:49:20","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("243","1","2","735.00","0.00","735.00","1","1","2021-04-03","2021-04-03 15:56:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("245","1","2","200.00","0.00","200.00","1","1","2021-04-03","2021-04-03 15:59:19","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("246","1","2","210.00","0.00","210.00","1","1","2021-04-03","2021-04-03 16:01:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("247","1","2","3150.00","0.00","3150.00","1","1","2021-04-03","2021-04-03 16:26:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("249","1","2","2450.00","0.00","2450.00","1","1","2021-04-03","2021-04-03 16:29:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("250","1","2","1470.00","0.00","1470.00","1","1","2021-04-03","2021-04-03 16:37:05","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("251","1","2","1595.00","0.00","1595.00","1","1","2021-04-03","2021-04-03 16:44:02","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("252","1","2","1000.00","0.00","1000.00","1","1","2021-04-03","2021-04-03 16:44:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("253","1","2","190.00","0.00","190.00","1","1","2021-04-03","2021-04-03 16:50:38","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("254","1","2","290.00","0.00","290.00","1","1","2021-04-03","2021-04-03 16:56:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("255","1","2","180.00","0.00","180.00","1","1","2021-04-03","2021-04-03 16:53:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("256","1","2","305.00","0.00","305.00","1","1","2021-04-03","2021-04-03 17:03:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("257","1","2","1000.00","0.00","1000.00","1","1","2021-04-03","2021-04-03 17:08:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("258","1","2","500.00","0.00","500.00","1","1","2021-04-03","2021-04-03 17:09:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("259","1","2","270.00","0.00","270.00","1","1","2021-04-03","2021-04-03 17:21:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("260","1","2","1720.00","0.00","1720.00","1","1","2021-04-03","2021-04-03 18:15:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("261","1","2","570.00","0.00","570.00","1","1","2021-04-03","2021-04-03 18:16:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("263","1","2","350.00","0.00","350.00","1","1","2021-04-03","2021-04-03 18:18:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("264","1","2","410.00","0.00","410.00","1","1","2021-04-03","2021-04-03 18:19:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("265","1","2","50.00","0.00","50.00","1","1","2021-04-03","2021-04-03 18:28:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("266","1","2","200.00","0.00","200.00","1","1","2021-04-03","2021-04-03 18:43:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("267","1","2","1400.00","0.00","1400.00","1","1","2021-04-03","2021-04-03 18:49:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("268","1","2","1000.00","0.00","1000.00","1","1","2021-04-05","2021-04-05 09:05:05","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("269","1","2","25.00","0.00","25.00","1","1","2021-04-05","2021-04-05 09:06:49","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("270","1","2","1820.00","0.00","1820.00","1","1","2021-04-05","2021-04-05 10:44:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("271","1","2","1780.00","0.00","1780.00","1","1","2021-04-05","2021-04-05 10:59:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("272","1","2","560.00","0.00","560.00","1","1","2021-04-05","2021-04-05 11:09:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("273","1","2","50.00","0.00","50.00","1","1","2021-04-05","2021-04-05 11:11:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("275","1","2","1470.00","0.00","1470.00","1","1","2021-04-05","2021-04-05 11:55:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("276","1","2","390.00","0.00","390.00","1","1","2021-04-05","2021-04-05 12:10:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("277","1","2","1470.00","0.00","1470.00","1","1","2021-04-05","2021-04-05 12:22:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("278","1","2","18940.00","0.00","18940.00","1","1","2021-04-05","2021-04-05 13:05:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("279","1","2","560.00","0.00","560.00","1","1","2021-04-05","2021-04-05 13:19:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("280","1","2","120.00","0.00","120.00","1","1","2021-04-05","2021-04-05 13:42:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("282","1","2","295.00","0.00","295.00","1","1","2021-04-05","2021-04-05 14:17:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("283","1","2","550.00","0.00","550.00","1","1","2021-04-05","2021-04-05 14:34:20","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("284","1","2","200.00","0.00","200.00","1","1","2021-04-05","2021-04-05 15:05:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("285","1","2","1080.00","0.00","1080.00","1","1","2021-04-05","2021-04-05 15:12:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("286","1","2","745.00","0.00","745.00","1","1","2021-04-05","2021-04-05 15:14:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("287","1","2","3050.00","0.00","3050.00","1","1","2021-04-05","2021-04-05 15:18:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("288","1","2","190.00","0.00","190.00","1","1","2021-04-05","2021-04-05 15:29:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("290","1","2","540.00","0.00","540.00","1","1","2021-04-05","2021-04-05 15:32:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("291","1","2","1480.00","0.00","1480.00","1","1","2021-04-05","2021-04-05 15:34:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("292","1","2","1480.00","0.00","1480.00","1","1","2021-04-05","2021-04-05 15:35:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("293","1","2","300.00","0.00","300.00","1","1","2021-04-05","2021-04-05 15:44:48","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("294","1","2","225.00","0.00","225.00","1","1","2021-04-05","2021-04-05 15:46:31","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("295","1","2","445.00","0.00","445.00","1","1","2021-04-05","2021-04-05 15:49:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("296","1","2","110.00","0.00","110.00","1","1","2021-04-05","2021-04-05 16:07:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("297","1","2","155.00","0.00","155.00","1","1","2021-04-05","2021-04-05 16:13:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("298","1","2","1050.00","0.00","1050.00","1","1","2021-04-05","2021-04-05 16:23:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("299","1","2","735.00","0.00","735.00","1","1","2021-04-05","2021-04-05 16:42:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("300","1","2","210.00","0.00","210.00","1","1","2021-04-05","2021-04-05 18:07:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("301","1","2","1270.00","0.00","1270.00","1","1","2021-04-05","2021-04-05 18:09:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("302","1","2","2075.00","0.00","2075.00","1","1","2021-04-05","2021-04-05 18:17:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("304","1","2","100.00","0.00","100.00","1","1","2021-04-05","2021-04-05 18:18:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("305","1","2","100.00","0.00","100.00","1","1","2021-04-05","2021-04-05 18:19:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("306","1","2","500.00","0.00","500.00","1","1","2021-04-05","2021-04-05 18:25:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("307","1","2","1490.00","0.00","1490.00","1","1","2021-04-05","2021-04-05 18:36:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("308","1","2","230.00","0.00","230.00","1","1","2021-04-05","2021-04-05 18:40:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("310","1","2","2150.00","0.00","2150.00","1","1","2021-04-05","2021-04-05 18:45:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("311","1","2","100.00","0.00","100.00","1","1","2021-04-05","2021-04-05 18:48:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("312","1","2","100.00","0.00","100.00","1","1","2021-04-05","2021-04-05 18:53:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("313","1","2","2390.00","0.00","2390.00","1","1","2021-04-06","2021-04-06 08:25:09","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("314","1","2","1450.00","0.00","1450.00","1","1","2021-04-06","2021-04-06 08:29:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("315","1","2","110.00","0.00","110.00","1","1","2021-04-06","2021-04-06 08:48:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("316","1","2","25.00","0.00","25.00","1","1","2021-04-06","2021-04-06 08:52:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("317","1","2","1764.00","0.00","1764.00","1","1","2021-04-06","2021-04-06 09:35:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("318","1","2","55.00","0.00","55.00","1","1","2021-04-06","2021-04-06 09:46:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("319","1","2","500.00","0.00","500.00","1","1","2021-04-06","2021-04-06 11:37:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("320","1","2","1490.00","0.00","1490.00","1","1","2021-04-06","2021-04-06 13:28:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("321","1","2","37788.00","0.00","37788.00","1","1","2021-04-06","2021-04-06 15:19:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("323","1","2","350.00","0.00","350.00","1","1","2021-04-06","2021-04-06 16:03:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("324","1","2","2450.00","0.00","2450.00","1","1","2021-04-06","2021-04-06 16:28:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("326","1","2","1150.00","0.00","1150.00","1","1","2021-04-06","2021-04-06 17:10:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("327","1","2","1230.00","0.00","1230.00","1","1","2021-04-06","2021-04-06 17:21:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("328","1","2","2390.00","0.00","2390.00","1","1","2021-04-06","2021-04-06 17:28:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("329","1","2","3750.00","0.00","3750.00","1","1","2021-04-06","2021-04-06 17:51:38","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("331","1","2","3552.00","0.00","3552.00","1","1","2021-04-06","2021-04-06 17:51:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("332","1","2","490.00","0.00","490.00","1","1","2021-04-06","2021-04-06 17:52:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("333","1","2","200.00","0.00","200.00","1","1","2021-04-06","2021-04-06 17:54:09","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("334","1","2","90.00","0.00","90.00","1","1","2021-04-06","2021-04-06 18:00:49","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("335","1","2","205.00","0.00","205.00","1","1","2021-04-06","2021-04-06 18:11:52","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("336","1","2","2470.00","0.00","2470.00","1","1","2021-04-06","2021-04-06 18:13:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("337","1","2","550.00","0.00","550.00","1","1","2021-04-06","2021-04-06 18:22:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("338","1","2","9340.00","0.00","9340.00","1","1","2021-04-06","2021-04-06 18:27:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("339","1","2","9500.00","0.00","9500.00","1","1","2021-04-06","2021-04-06 18:29:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("342","1","2","200.00","0.00","200.00","1","1","2021-04-06","2021-04-06 18:39:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("343","1","2","100.00","0.00","100.00","1","1","2021-04-06","2021-04-06 18:49:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("344","1","2","4840.00","0.00","4840.00","1","1","2021-04-07","2021-04-07 07:58:53","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("346","1","2","1090.00","0.00","1090.00","1","1","2021-04-07","2021-04-07 09:01:00","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("347","1","2","350.00","0.00","350.00","1","1","2021-04-07","2021-04-07 09:03:23","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("348","1","2","400.00","0.00","400.00","1","1","2021-04-07","2021-04-07 09:34:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("349","1","2","1470.00","0.00","1470.00","1","1","2021-04-07","2021-04-07 09:58:12","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("350","1","2","410.00","0.00","410.00","1","1","2021-04-07","2021-04-07 09:44:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("351","1","2","1550.00","0.00","1550.00","1","1","2021-04-07","2021-04-07 09:59:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("355","1","2","650.00","0.00","650.00","1","1","2021-04-07","2021-04-07 13:08:31","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("356","1","2","190.00","0.00","190.00","1","1","2021-04-07","2021-04-07 13:10:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("357","1","2","1100.00","0.00","1100.00","1","1","2021-04-07","2021-04-07 14:40:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("358","1","2","820.00","0.00","820.00","1","1","2021-04-07","2021-04-07 15:28:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("360","1","2","450.00","0.00","450.00","1","1","2021-04-07","2021-04-07 15:38:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("361","1","2","180.00","0.00","180.00","1","1","2021-04-07","2021-04-07 16:01:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("362","1","2","200.00","0.00","200.00","1","1","2021-04-07","2021-04-07 16:13:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("363","1","2","785.00","0.00","785.00","1","1","2021-04-07","2021-04-07 16:54:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("364","1","2","1075.00","0.00","1075.00","1","1","2021-04-07","2021-04-07 17:07:36","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("365","1","2","75.00","0.00","75.00","1","1","2021-04-07","2021-04-07 17:12:14","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("366","1","2","90.00","0.00","90.00","1","1","2021-04-07","2021-04-07 17:37:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("367","1","2","25.00","0.00","25.00","1","1","2021-04-07","2021-04-07 17:38:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("368","1","2","140.00","0.00","140.00","1","1","2021-04-07","2021-04-07 17:43:44","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("369","1","2","200.00","0.00","200.00","1","1","2021-04-07","2021-04-07 17:54:53","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("370","1","2","19000.00","0.00","19000.00","1","1","2021-04-07","2021-04-07 18:15:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("371","1","2","2470.00","0.00","2470.00","1","1","2021-04-07","2021-04-07 18:19:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("372","1","2","1190.00","0.00","1190.00","1","1","2021-04-07","2021-04-07 18:22:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("373","1","2","440.00","0.00","440.00","1","1","2021-04-07","2021-04-07 18:23:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("374","1","2","1250.00","0.00","1250.00","1","1","2021-04-07","2021-04-07 18:27:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("375","1","2","200.00","0.00","200.00","1","1","2021-04-07","2021-04-07 18:35:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("376","1","2","260.00","0.00","260.00","1","1","2021-04-08","2021-04-08 08:14:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("377","1","2","200.00","0.00","200.00","1","1","2021-04-08","2021-04-08 08:38:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("378","1","2","50.00","0.00","50.00","1","1","2021-04-08","2021-04-08 08:41:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("379","1","2","4000.00","0.00","4000.00","1","1","2021-04-08","2021-04-08 12:46:41","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("380","1","2","190.00","0.00","190.00","1","1","2021-04-08","2021-04-08 13:18:25","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("381","1","2","50.00","0.00","50.00","1","1","2021-04-08","2021-04-08 13:20:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("385","1","2","200.00","0.00","200.00","1","1","2021-04-08","2021-04-08 14:27:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("386","1","2","550.00","0.00","550.00","1","1","2021-04-08","2021-04-08 15:10:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("387","1","2","1430.00","0.00","1430.00","1","1","2021-04-08","2021-04-08 15:17:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("388","1","2","200.00","0.00","200.00","1","1","2021-04-08","2021-04-08 15:35:12","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("389","1","2","190.00","0.00","190.00","1","1","2021-04-08","2021-04-08 15:35:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("390","1","2","130.00","0.00","130.00","1","1","2021-04-08","2021-04-08 15:48:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("391","1","2","365.00","0.00","365.00","1","1","2021-04-08","2021-04-08 15:55:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("392","1","2","190.00","0.00","190.00","1","1","2021-04-08","2021-04-08 15:59:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("393","1","2","500.00","0.00","500.00","1","1","2021-04-08","2021-04-08 16:36:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("394","1","2","100.00","0.00","100.00","1","1","2021-04-08","2021-04-08 17:27:40","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("395","1","2","370.00","0.00","370.00","1","1","2021-04-08","2021-04-08 17:37:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("396","1","2","90.00","0.00","90.00","1","1","2021-04-08","2021-04-08 17:39:04","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("397","1","2","570.00","0.00","570.00","1","1","2021-04-08","2021-04-08 17:45:52","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("398","1","2","550.00","0.00","550.00","1","1","2021-04-08","2021-04-08 17:46:37","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("399","1","2","590.00","0.00","590.00","1","1","2021-04-08","2021-04-08 17:49:36","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("400","1","2","220.00","0.00","220.00","1","1","2021-04-08","2021-04-08 17:51:13","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("401","1","2","220.00","0.00","220.00","1","1","2021-04-08","2021-04-08 17:52:03","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("402","1","2","90.00","0.00","90.00","1","1","2021-04-08","2021-04-08 17:53:19","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("403","1","2","90.00","0.00","90.00","1","1","2021-04-08","2021-04-08 17:54:40","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("404","1","2","90.00","0.00","90.00","1","1","2021-04-08","2021-04-08 18:00:22","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("405","1","2","220.00","0.00","220.00","1","1","2021-04-08","2021-04-08 18:06:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("406","1","2","205.00","0.00","205.00","1","1","2021-04-08","2021-04-08 18:06:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("407","1","2","70.00","0.00","70.00","1","1","2021-04-08","2021-04-08 18:20:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("408","1","2","200.00","0.00","200.00","1","1","2021-04-08","2021-04-08 18:21:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("410","1","2","1150.00","0.00","1150.00","1","1","2021-04-08","2021-04-08 18:25:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("411","1","2","200.00","0.00","200.00","1","1","2021-04-08","2021-04-08 18:26:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("412","1","2","240.00","0.00","240.00","1","1","2021-04-08","2021-04-08 18:27:52","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("414","1","2","150.00","0.00","150.00","1","1","2021-04-08","2021-04-08 18:31:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("415","1","2","150.00","0.00","150.00","1","1","2021-04-08","2021-04-08 18:30:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("416","1","2","525.00","0.00","525.00","1","1","2021-04-08","2021-04-08 18:46:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("417","1","2","100.00","0.00","100.00","1","1","2021-04-08","2021-04-08 18:51:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("418","1","2","520.00","0.00","520.00","1","1","2021-04-09","2021-04-09 08:00:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("419","1","2","30.00","0.00","30.00","1","1","2021-04-09","2021-04-09 08:10:53","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("421","1","2","90.00","0.00","90.00","1","1","2021-04-09","2021-04-09 08:26:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("423","1","2","180.00","0.00","180.00","1","1","2021-04-09","2021-04-09 09:20:05","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("424","1","2","420.00","0.00","420.00","1","1","2021-04-09","2021-04-09 09:40:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("425","1","2","1175.00","0.00","1175.00","1","1","2021-04-09","2021-04-09 09:52:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("427","1","2","220.00","0.00","220.00","1","1","2021-04-09","2021-04-09 11:08:21","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("429","1","2","1100.00","0.00","1100.00","1","1","2021-04-09","2021-04-09 11:34:55","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("431","1","2","180.00","0.00","180.00","1","1","2021-04-09","2021-04-09 11:42:50","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("432","1","2","300.00","0.00","300.00","1","1","2021-04-09","2021-04-09 12:07:48","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("434","1","2","380.00","0.00","380.00","1","1","2021-04-09","2021-04-09 12:51:42","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("435","1","2","50.00","0.00","50.00","1","1","2021-04-09","2021-04-09 13:58:50","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("438","1","2","25.00","0.00","25.00","1","1","2021-04-09","2021-04-09 16:25:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("439","1","2","190.00","0.00","190.00","1","1","2021-04-09","2021-04-09 16:44:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("440","1","2","200.00","0.00","200.00","1","1","2021-04-09","2021-04-09 16:51:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("441","1","2","1470.00","0.00","1470.00","1","1","2021-04-09","2021-04-09 16:59:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("442","1","2","1530.00","0.00","1530.00","1","1","2021-04-09","2021-04-09 17:02:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("443","1","2","105.00","0.00","105.00","1","1","2021-04-09","2021-04-09 17:20:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("444","1","2","1470.00","0.00","1470.00","1","1","2021-04-09","2021-04-09 17:26:08","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("445","1","2","250.00","0.00","250.00","1","1","2021-04-09","2021-04-09 17:27:21","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("446","1","2","430.00","0.00","430.00","1","1","2021-04-09","2021-04-09 17:31:43","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("447","1","2","1087.50","0.00","1087.50","1","1","2021-04-09","2021-04-09 17:50:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("449","1","2","1200.00","0.00","1200.00","1","1","2021-04-09","2021-04-09 18:49:18","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("450","1","2","3620.00","0.00","3620.00","1","1","2021-04-09","2021-04-09 17:59:41","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("451","1","2","120.00","0.00","120.00","1","1","2021-04-09","2021-04-09 18:15:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("452","1","2","60.00","0.00","60.00","1","1","2021-04-09","2021-04-09 18:35:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("453","1","2","205.00","0.00","205.00","1","1","2021-04-09","2021-04-09 18:45:04","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("455","1","2","230.00","0.00","230.00","1","1","2021-04-09","2021-04-09 18:49:46","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("456","1","2","90.00","0.00","90.00","1","1","2021-04-10","2021-04-10 08:15:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("458","1","2","90.00","0.00","90.00","1","1","2021-04-10","2021-04-10 09:02:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("459","1","2","1520.00","0.00","1520.00","1","1","2021-04-10","2021-04-10 09:30:09","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("461","1","2","100.00","0.00","100.00","1","1","2021-04-10","2021-04-10 09:45:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("462","1","2","750.00","0.00","750.00","1","1","2021-04-10","2021-04-10 10:14:20","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("463","1","2","55.00","0.00","55.00","1","1","2021-04-10","2021-04-10 10:18:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("465","1","2","115.00","0.00","115.00","1","1","2021-04-10","2021-04-10 16:29:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("466","1","2","570.00","0.00","570.00","1","1","2021-04-10","2021-04-10 16:44:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("468","1","2","825.00","0.00","825.00","1","1","2021-04-10","2021-04-10 17:04:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("469","1","2","2750.00","0.00","2750.00","1","1","2021-04-10","2021-04-10 17:09:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("470","1","2","120.00","0.00","120.00","1","1","2021-04-10","2021-04-10 17:11:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("471","1","2","150.00","0.00","150.00","1","1","2021-04-10","2021-04-10 17:12:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("472","1","2","135.00","0.00","135.00","1","1","2021-04-10","2021-04-10 17:24:02","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("473","1","2","100.00","0.00","100.00","1","1","2021-04-10","2021-04-10 17:25:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("474","1","2","300.00","0.00","300.00","1","1","2021-04-10","2021-04-10 17:47:45","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("475","1","2","100.00","0.00","100.00","1","1","2021-04-10","2021-04-10 17:53:54","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("476","1","2","4750.00","0.00","4750.00","1","1","2021-04-10","2021-04-10 17:58:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("477","1","2","450.00","0.00","450.00","1","1","2021-04-10","2021-04-10 18:08:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("478","1","2","130.00","0.00","130.00","1","1","2021-04-10","2021-04-10 18:14:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("479","1","2","150.00","0.00","150.00","1","1","2021-04-10","2021-04-10 18:16:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("480","1","2","2560.00","0.00","2560.00","1","1","2021-04-10","2021-04-10 18:31:47","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("481","1","2","200.00","0.00","200.00","1","1","2021-04-10","2021-04-10 18:32:19","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("482","1","2","300.00","0.00","300.00","1","1","2021-04-10","2021-04-10 18:33:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("483","1","2","50.00","0.00","50.00","1","1","2021-04-10","2021-04-10 18:56:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("484","1","2","390.00","0.00","390.00","1","1","2021-04-10","2021-04-10 18:58:57","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("485","1","2","530.00","0.00","530.00","1","1","2021-04-10","2021-04-10 19:02:32","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("486","1","2","120.00","0.00","120.00","1","1","2021-04-10","2021-04-10 19:12:56","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("487","1","2","320.00","0.00","320.00","1","1","2021-04-10","2021-04-10 19:16:18","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("488","1","2","900.00","0.00","900.00","1","1","2021-04-11","2021-04-11 12:02:15","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("489","1","2","540.00","0.00","540.00","1","1","2021-04-11","2021-04-11 12:15:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("490","1","2","180.00","0.00","180.00","1","1","2021-04-11","2021-04-11 12:43:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("491","1","2","3330.00","0.00","3330.00","1","1","2021-04-11","2021-04-11 13:17:50","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("492","1","2","10536.40","0.00","10536.40","1","1","2021-04-11","2021-04-11 15:16:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("493","1","2","325.00","0.00","325.00","1","1","2021-04-11","2021-04-11 13:33:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("495","1","2","2085.00","0.00","2085.00","1","1","2021-04-11","2021-04-11 14:51:16","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("496","1","2","18500.00","0.00","18500.00","1","1","2021-04-11","2021-04-11 15:05:49","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("497","1","2","8100.00","0.00","8100.00","1","1","2021-04-11","2021-04-11 15:08:30","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("498","1","2","430.00","0.00","430.00","1","1","2021-04-11","2021-04-11 15:44:26","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("499","1","2","590.00","0.00","590.00","1","1","2021-04-11","2021-04-11 16:00:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("502","1","2","3500.00","0.00","3500.00","1","1","2021-04-11","2021-04-11 16:16:28","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("503","1","2","90.00","0.00","90.00","1","1","2021-04-11","2021-04-11 16:21:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("504","1","2","640.00","0.00","640.00","1","1","2021-04-11","2021-04-11 16:29:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("505","1","2","1050.00","0.00","1050.00","1","1","2021-04-11","2021-04-11 16:36:33","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("506","1","2","480.00","0.00","480.00","1","1","2021-04-11","2021-04-11 16:39:08","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("507","1","2","360.00","0.00","360.00","1","1","2021-04-11","2021-04-11 16:41:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("508","1","2","195.00","0.00","195.00","1","1","2021-04-11","2021-04-11 17:04:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("509","1","2","4605.00","0.00","4605.00","1","1","2021-04-11","2021-04-11 17:08:59","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("510","1","2","480.00","0.00","480.00","1","1","2021-04-12","2021-04-12 08:17:12","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("511","1","2","130.00","0.00","130.00","1","1","2021-04-12","2021-04-12 08:40:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("514","1","2","850.00","0.00","850.00","1","1","2021-04-12","2021-04-12 09:34:06","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("515","1","2","125.00","0.00","125.00","1","1","2021-04-12","2021-04-12 09:36:37","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("516","1","2","225.00","0.00","225.00","1","1","2021-04-12","2021-04-12 09:46:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("517","1","2","450.00","0.00","450.00","1","1","2021-04-12","2021-04-12 09:47:34","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("518","1","2","55.00","0.00","55.00","1","1","2021-04-12","2021-04-12 10:04:07","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("520","1","2","100.00","0.00","100.00","1","1","2021-04-12","2021-04-12 10:47:23","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("521","1","2","2140.00","0.00","2140.00","1","1","2021-04-12","2021-04-12 12:06:01","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("523","1","2","850.00","0.00","850.00","1","1","2021-04-12","2021-04-12 12:07:21","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("527","1","2","100.00","0.00","100.00","1","1","2021-04-12","2021-04-12 12:42:53","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("528","1","2","190.00","0.00","190.00","1","1","2021-04-12","2021-04-12 12:52:55","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("529","1","2","580.00","0.00","580.00","1","1","2021-04-12","2021-04-12 13:05:41","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("530","1","2","1385.00","0.00","1385.00","1","1","2021-04-12","2021-04-12 13:20:03","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("531","1","2","110.00","0.00","110.00","1","1","2021-04-12","2021-04-12 13:19:08","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("532","1","2","250.00","0.00","250.00","1","1","2021-04-12","2021-04-12 14:18:27","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("533","1","2","70.00","0.00","70.00","1","1","2021-04-12","2021-04-12 14:24:28","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("534","1","2","1050.00","0.00","1050.00","1","1","2021-04-12","2021-04-12 14:32:42","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("537","1","2","25.00","0.00","25.00","1","1","2021-04-12","2021-04-12 15:52:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("538","1","2","55.00","0.00","55.00","1","1","2021-04-12","2021-04-12 15:57:05","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("539","1","2","2650.00","0.00","2650.00","1","1","2021-04-12","2021-04-12 16:03:39","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("540","1","2","285.00","0.00","285.00","1","1","2021-04-12","2021-04-12 16:13:35","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("541","1","2","380.00","0.00","380.00","1","1","2021-04-12","2021-04-12 16:13:58","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("542","1","2","770.00","0.00","770.00","1","1","2021-04-12","2021-04-12 16:34:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("543","1","2","420.00","0.00","420.00","1","1","2021-04-12","2021-04-12 16:37:24","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("544","1","2","250.00","0.00","250.00","1","1","2021-04-12","2021-04-12 16:50:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("545","1","2","185.00","0.00","185.00","1","1","2021-04-12","2021-04-12 17:04:13","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("546","1","2","565.00","0.00","565.00","1","1","2021-04-12","2021-04-12 17:07:51","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("547","1","2","90.00","0.00","90.00","1","1","2021-04-12","2021-04-12 17:16:25","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("548","1","2","490.00","0.00","490.00","1","1","2021-04-12","2021-04-12 17:49:10","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("549","1","2","180.00","0.00","180.00","1","1","2021-04-12","2021-04-12 17:43:39","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("550","1","2","360.00","0.00","360.00","1","1","2021-04-12","2021-04-12 17:47:31","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("551","1","2","1430.00","0.00","1430.00","1","1","2021-04-12","2021-04-12 17:50:55","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("552","1","2","550.00","0.00","550.00","1","1","2021-04-12","2021-04-12 17:59:22","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("553","1","2","195.00","0.00","195.00","1","1","2021-04-12","2021-04-12 18:01:17","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("555","1","2","335.00","0.00","335.00","1","1","2021-04-12","2021-04-12 18:15:42","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("556","1","2","330.00","0.00","330.00","1","1","2021-04-12","2021-04-12 18:22:11","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("557","1","2","115.00","0.00","115.00","1","1","2021-04-12","2021-04-12 18:24:27","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("558","1","2","145.00","0.00","145.00","1","1","2021-04-13","2021-04-13 08:29:40","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("559","1","2","250.00","0.00","250.00","1","1","2021-04-13","2021-04-13 08:58:46","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("560","1","2","250.00","0.00","250.00","1","1","2021-04-13","2021-04-13 09:24:12","0","0","","0.00","","0");
INSERT INTO kp_sales VALUES("561","1","2","55.00","0.00","55.00","1","1","2021-04-13","2021-04-13 10:30:25","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("562","1","2","100.00","0.00","100.00","1","1","2021-04-13","2021-04-13 10:43:57","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("563","1","2","450.00","0.00","450.00","1","1","2021-04-13","2021-04-13 10:53:41","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("564","1","2","530.00","0.00","530.00","1","1","2021-04-13","2021-04-13 11:05:14","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("565","1","2","90.00","0.00","90.00","1","1","2021-04-13","2021-04-13 11:06:55","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("566","1","2","1890.00","0.00","1890.00","1","1","2021-04-13","2021-04-13 13:04:44","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("568","1","2","2100.00","0.00","2100.00","1","1","2021-04-13","2021-04-13 13:15:39","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("569","2","2","200.00","0.00","200.00","2","1","2021-04-13","2021-04-13 13:22:26","","0","0.00","200.00","2021-04-13","");
INSERT INTO kp_sales VALUES("570","2","2","180.00","0.00","180.00","2","1","2021-04-13","2021-04-13 13:26:16","","0","0.00","380.00","2021-04-13","");
INSERT INTO kp_sales VALUES("571","1","2","1000.00","0.00","1000.00","1","1","2021-04-13","2021-04-13 13:29:14","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("574","1","2","1935.00","0.00","1935.00","1","1","2021-04-13","2021-04-13 14:42:13","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("575","2","2","140.00","0.00","140.00","1","1","2021-04-22","2021-04-22 22:58:47","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("576","1","2","2800.00","0.00","2800.00","1","1","2021-04-22","2021-06-10 15:52:47","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("577","2","2","6100.00","0.00","6100.00","2","1","2021-04-23","2021-04-23 00:49:57","","0","0.00","6100.00","2021-06-10","");
INSERT INTO kp_sales VALUES("578","1","2","500.00","0.00","600.00","1","1","2021-04-23","2021-06-10 13:10:48","100","2","","0.00","","0");
INSERT INTO kp_sales VALUES("579","2","2","5150.00","0.00","5150.00","1","1","2021-04-25","2021-04-25 10:29:16","0","2","","300.00","","0");
INSERT INTO kp_sales VALUES("580","2","2","500.00","0.00","500.00","1","1","2021-06-10","2021-06-10 15:51:32","0","2","","300.00","","0");
INSERT INTO kp_sales VALUES("581","1","2","5400.00","0.00","5400.00","1","1","2021-04-25","2021-04-25 13:19:10","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("582","1","2","1000.00","0.00","1000.00","1","1","2021-04-25","2021-05-11 12:49:37","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("585","1","2","100.00","0.00","100.00","1","1","2021-05-22","2021-05-22 14:16:10","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("586","3","2","700.00","0.00","700.00","2","1","2021-05-22","2021-05-22 14:27:26","","2","0.00","700.00","2021-06-10","");
INSERT INTO kp_sales VALUES("587","2","2","200.00","0.00","200.00","1","1","2021-05-22","2021-05-22 14:35:20","0","2","","300.00","","0");
INSERT INTO kp_sales VALUES("588","1","2","500.00","0.00","500.00","1","1","2021-06-07","2021-06-09 16:10:20","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("589","1","2","76697.00","0.00","76697.00","1","1","2021-06-10","2021-06-10 15:44:41","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("590","1","2","600.00","0.00","600.00","1","1","2021-06-10","2021-06-10 15:53:26","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("591","2","2","1699.00","0.00","1699.00","1","1","2021-06-10","2021-06-10 15:57:19","0","2","","300.00","","0");
INSERT INTO kp_sales VALUES("592","1","2","60876.00","0.00","60876.00","1","1","2021-06-10","2021-06-10 16:05:19","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("593","1","2","678.00","0.00","678.00","1","1","2021-06-10","2021-06-10 16:14:25","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("594","1","2","336.00","0.00","336.00","1","1","2021-06-10","2021-06-10 16:26:56","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("595","1","2","4060.00","0.00","4060.00","1","1","2021-06-10","2021-06-10 16:29:37","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("596","1","2","1500.00","0.00","1500.00","1","1","2021-06-10","2021-06-10 16:33:07","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("597","2","2","4050.00","0.00","4050.00","1","1","2021-06-10","2021-06-10 16:38:46","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("598","1","2","6000.00","0.00","6000.00","1","1","2021-06-10","2021-06-10 16:44:53","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("599","1","2","3000.00","0.00","3000.00","1","1","2021-06-10","2021-06-10 16:59:42","0","2","","0.00","","0");
INSERT INTO kp_sales VALUES("600","2","2","800.00","0.00","800.00","2","3","2021-06-10","2021-06-10 17:09:50","","0","200.00","800.00","2021-06-10","");
INSERT INTO kp_sales VALUES("603","2","2","600.00","0.00","600.00","1","1","2021-06-10","2021-06-10 21:25:06","0","2","","200.00","","0");
INSERT INTO kp_sales VALUES("604","2","2","42000.00","0.00","42500.00","1","1","2021-06-10","2021-06-11 11:39:09","500","2","","200.00","","0");





CREATE TABLE `kp_sc` (
  `cust_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_sc VALUES("1","0.00","2");
INSERT INTO kp_sc VALUES("2","4000.00","2");





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

INSERT INTO kp_sc_hist VALUES("1","820.00","SALE RETURN","2","1","1","1","","2021-04-23","2021-04-23 00:47:40");
INSERT INTO kp_sc_hist VALUES("2","2000.00","CUSTOMER PAID UPFRONT","2","477","","UP_PAY","","2021-05-22","2021-05-22 14:30:17");
INSERT INTO kp_sc_hist VALUES("2","200.00","CASH SALE PAYMENT","2","587","","1","","2021-05-22","2021-05-22 14:35:20");
INSERT INTO kp_sc_hist VALUES("2","1699.00","CASH SALE PAYMENT","2","591","","1","","2021-06-10","2021-06-10 15:57:19");
INSERT INTO kp_sc_hist VALUES("2","1699.00","CASH SALE PAYMENT","2","591","","1","","2021-06-10","2021-06-10 15:57:19");
INSERT INTO kp_sc_hist VALUES("1","1000.00","CASH SALE PAYMENT","2","599","","1","","2021-06-10","2021-06-10 16:59:42");





CREATE TABLE `kp_settings_gen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `website` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_settings_gen VALUES("1","UTUGI WHOLESALERS","expect more,pay less.","P.O BOX 59090-0010/\n/NBO   ","0719511811","0708571177","utugi.wholesalers@gmail.com","P051813682P","P051813682P","1","2","400200","01192771846000","../../assets/img/logo/UTUGI WHOLESALERS.jpg","");





CREATE TABLE `kp_settings_print` (
  `print_doc` int(11) NOT NULL,
  `show_logo` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `mpesa` int(11) NOT NULL,
  `thankyou_note` varchar(255) NOT NULL,
  UNIQUE KEY `print_doc` (`print_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_settings_print VALUES("1","1","1","1","0","          ");





CREATE TABLE `kp_shift` (
  `shift` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_shift_hist` (
  `shift` date NOT NULL,
  `opening` datetime NOT NULL,
  `open_by` int(11) NOT NULL,
  `closing` datetime NOT NULL,
  `close_by` int(11) NOT NULL,
  `open_ord` int(11) NOT NULL,
  `close_ord` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_shift_stock` (
  `shift` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `opening` int(11) NOT NULL,
  `stock_in` int(11) NOT NULL,
  `stock_out` int(11) NOT NULL,
  `closing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `msg` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_sms VALUES("1","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 13:03:15","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("2","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 13:04:02","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("3","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 13:04:44","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("4","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 13:15:39","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("5","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 13:29:14","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("6","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-13 14:42:13","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("7","+254716100335","Thank you for visiting our store today, We appriciate your business","2","2021-04-22 22:58:47","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("8","+254716100335","Thank you for visiting our store today, We appriciate your business","2","2021-04-25 10:29:16","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("9","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-04-25 13:19:10","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("10","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-05-11 12:49:37","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("11","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-05-22 14:16:10","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("12","+254716100335","YOUR STORE CREDIT  HAVE BEEN RECEIVED. AMOUNT2000","2","2021-05-22 14:30:17","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("13","+254716100335","Thank you for visiting our store today, We appriciate your business","2","2021-05-22 14:35:20","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("14","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-06-09 16:10:20","0000-00-00 00:00:00");
INSERT INTO kp_sms VALUES("15","+254000","Thank you for visiting our store today, We appriciate your business","2","2021-06-10 13:10:48","0000-00-00 00:00:00");





CREATE TABLE `kp_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `staff_user_status` int(11) NOT NULL DEFAULT '2',
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_stock_take` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `closing` int(11) NOT NULL,
  `counted` int(11) NOT NULL,
  `variance` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `comments` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_stock_take VALUES("1","0000-00-00","164","0","5","0","2","","2","2021-05-31","2021-05-31 08:20:48");
INSERT INTO kp_stock_take VALUES("2","0000-00-00","167","0","0","0","2","","2","2021-05-31","2021-05-31 08:21:47");
INSERT INTO kp_stock_take VALUES("3","0000-00-00","242","92","5","0","2","","2","2021-05-31","2021-05-31 08:23:01");
INSERT INTO kp_stock_take VALUES("4","0000-00-00","243","91","0","0","2","","2","2021-05-31","2021-05-31 08:23:07");
INSERT INTO kp_stock_take VALUES("5","0000-00-00","181","95","10","0","2","","2","2021-05-31","2021-05-31 08:23:10");
INSERT INTO kp_stock_take VALUES("6","0000-00-00","11","1000","20","0","2","","2","2021-05-31","2021-05-31 08:23:12");
INSERT INTO kp_stock_take VALUES("8","0000-00-00","92","999","100","0","2","","2","2021-05-31","2021-05-31 08:23:22");
INSERT INTO kp_stock_take VALUES("9","0000-00-00","94","1000","100","0","2","","2","2021-05-31","2021-05-31 08:23:24");
INSERT INTO kp_stock_take VALUES("10","0000-00-00","93","1000","100","0","2","","2","2021-05-31","2021-05-31 08:23:27");
INSERT INTO kp_stock_take VALUES("11","0000-00-00","95","1000","200","0","2","","2","2021-05-31","2021-05-31 08:23:28");
INSERT INTO kp_stock_take VALUES("15","0000-00-00","10","991","94","0","2","","2","2021-05-31","2021-05-31 08:26:52");
INSERT INTO kp_stock_take VALUES("16","0000-00-00","96","994","23","0","2","","2","2021-05-31","2021-05-31 09:04:10");
INSERT INTO kp_stock_take VALUES("17","0000-00-00","214","94","12","0","2","","2","2021-05-31","2021-05-31 09:04:11");
INSERT INTO kp_stock_take VALUES("18","0000-00-00","191","0","52","0","2","","2","2021-05-31","2021-05-31 09:04:12");
INSERT INTO kp_stock_take VALUES("19","0000-00-00","179","44","56","0","2","","2","2021-05-31","2021-05-31 09:04:13");
INSERT INTO kp_stock_take VALUES("20","0000-00-00","180","299","63","0","2","","2","2021-05-31","2021-05-31 09:04:14");
INSERT INTO kp_stock_take VALUES("21","0000-00-00","192","0","56","0","2","","2","2021-05-31","2021-05-31 09:04:15");
INSERT INTO kp_stock_take VALUES("22","0000-00-00","127","1000","56","0","2","","2","2021-05-31","2021-05-31 09:04:16");
INSERT INTO kp_stock_take VALUES("23","0000-00-00","125","1000","12","0","2","","2","2021-05-31","2021-05-31 09:04:28");
INSERT INTO kp_stock_take VALUES("24","0000-00-00","126","1000","23","0","2","","2","2021-05-31","2021-05-31 09:04:30");
INSERT INTO kp_stock_take VALUES("25","0000-00-00","169","95","56","0","2","","2","2021-05-31","2021-05-31 09:04:31");
INSERT INTO kp_stock_take VALUES("26","0000-00-00","87","1000","45","0","2","","2","2021-05-31","2021-05-31 09:04:32");
INSERT INTO kp_stock_take VALUES("27","0000-00-00","88","998","56","0","2","","2","2021-05-31","2021-05-31 09:04:33");
INSERT INTO kp_stock_take VALUES("28","0000-00-00","220","99","12","0","2","","2","2021-05-31","2021-05-31 17:49:18");
INSERT INTO kp_stock_take VALUES("29","0000-00-00","221","99","46","0","2","","2","2021-05-31","2021-05-31 17:49:19");
INSERT INTO kp_stock_take VALUES("30","0000-00-00","73","998","45","0","2","","2","2021-05-31","2021-05-31 17:49:20");
INSERT INTO kp_stock_take VALUES("31","0000-00-00","70","999","56","0","2","","2","2021-05-31","2021-05-31 17:49:21");
INSERT INTO kp_stock_take VALUES("32","0000-00-00","72","1000","56","0","2","","2","2021-05-31","2021-05-31 17:49:22");
INSERT INTO kp_stock_take VALUES("33","0000-00-00","75","992","56","0","2","","2","2021-05-31","2021-05-31 17:50:01");
INSERT INTO kp_stock_take VALUES("34","0000-00-00","74","999","100","0","2","","2","2021-05-31","2021-05-31 17:50:03");
INSERT INTO kp_stock_take VALUES("35","0000-00-00","71","1000","200","0","2","","2","2021-05-31","2021-05-31 17:50:04");
INSERT INTO kp_stock_take VALUES("36","0000-00-00","267","99","100","0","2","","2","2021-05-31","2021-05-31 17:50:05");
INSERT INTO kp_stock_take VALUES("37","0000-00-00","91","997","100","0","2","","2","2021-05-31","2021-05-31 17:50:06");
INSERT INTO kp_stock_take VALUES("38","0000-00-00","272","99","200","0","2","","2","2021-05-31","2021-05-31 17:50:08");
INSERT INTO kp_stock_take VALUES("39","0000-00-00","194","98","100","0","2","","2","2021-05-31","2021-05-31 17:50:10");
INSERT INTO kp_stock_take VALUES("40","0000-00-00","264","97","10","0","2","","2","2021-05-31","2021-05-31 17:50:11");
INSERT INTO kp_stock_take VALUES("41","0000-00-00","23","973","10","0","2","","2","2021-05-31","2021-05-31 17:50:13");
INSERT INTO kp_stock_take VALUES("42","0000-00-00","22","1000","200","0","2","","2","2021-05-31","2021-05-31 17:50:15");
INSERT INTO kp_stock_take VALUES("43","0000-00-00","224","94","100","0","2","","2","2021-05-31","2021-05-31 17:50:16");
INSERT INTO kp_stock_take VALUES("44","0000-00-00","80","997","50","0","2","","2","2021-05-31","2021-05-31 17:50:17");
INSERT INTO kp_stock_take VALUES("45","0000-00-00","4","1000","10","0","2","","2","2021-05-31","2021-05-31 17:50:18");
INSERT INTO kp_stock_take VALUES("46","0000-00-00","3","990","50","0","2","","2","2021-05-31","2021-05-31 17:50:19");
INSERT INTO kp_stock_take VALUES("47","0000-00-00","205","84","12","0","2","","2","2021-05-31","2021-05-31 17:50:20");
INSERT INTO kp_stock_take VALUES("48","0000-00-00","86","999","10","0","2","","2","2021-05-31","2021-05-31 17:50:21");
INSERT INTO kp_stock_take VALUES("49","0000-00-00","85","998","120","0","2","","2","2021-05-31","2021-05-31 17:50:22");
INSERT INTO kp_stock_take VALUES("50","0000-00-00","190","100","10","0","2","","2","2021-05-31","2021-05-31 17:52:30");
INSERT INTO kp_stock_take VALUES("51","0000-00-00","156","92","45","0","2","","2","2021-05-31","2021-05-31 17:52:47");
INSERT INTO kp_stock_take VALUES("52","0000-00-00","48","1000","100","0","2","","2","2021-05-31","2021-05-31 17:52:49");
INSERT INTO kp_stock_take VALUES("53","0000-00-00","140","996","100","0","2","","2","2021-05-31","2021-05-31 17:52:50");
INSERT INTO kp_stock_take VALUES("54","0000-00-00","237","100","300","0","2","","2","2021-05-31","2021-05-31 17:52:52");
INSERT INTO kp_stock_take VALUES("55","0000-00-00","122","999","500","0","2","","2","2021-05-31","2021-05-31 17:52:54");
INSERT INTO kp_stock_take VALUES("56","0000-00-00","121","994","100","0","2","","2","2021-05-31","2021-05-31 17:52:56");
INSERT INTO kp_stock_take VALUES("57","0000-00-00","123","994","999","0","2","","2","2021-05-31","2021-05-31 17:52:59");
INSERT INTO kp_stock_take VALUES("58","0000-00-00","124","1000","994","0","2","","2","2021-05-31","2021-05-31 17:53:02");
INSERT INTO kp_stock_take VALUES("59","0000-00-00","45","1000","1000","0","2","","2","2021-05-31","2021-05-31 17:53:06");
INSERT INTO kp_stock_take VALUES("60","0000-00-00","199","99","1000","0","2","","2","2021-05-31","2021-05-31 17:53:34");
INSERT INTO kp_stock_take VALUES("61","0000-00-00","200","95","100","0","2","","2","2021-05-31","2021-05-31 17:54:01");
INSERT INTO kp_stock_take VALUES("62","0000-00-00","149","1000","200","0","2","","2","2021-05-31","2021-05-31 17:54:02");
INSERT INTO kp_stock_take VALUES("63","0000-00-00","252","99","10","0","2","","2","2021-05-31","2021-05-31 17:54:03");
INSERT INTO kp_stock_take VALUES("64","0000-00-00","177","100","30","0","2","","2","2021-05-31","2021-05-31 17:54:04");
INSERT INTO kp_stock_take VALUES("65","0000-00-00","176","78","50","0","2","","2","2021-05-31","2021-05-31 17:54:05");
INSERT INTO kp_stock_take VALUES("66","0000-00-00","162","97","40","0","2","","2","2021-05-31","2021-05-31 17:54:06");
INSERT INTO kp_stock_take VALUES("67","0000-00-00","161","99","50","0","2","","2","2021-05-31","2021-05-31 17:54:10");
INSERT INTO kp_stock_take VALUES("68","0000-00-00","35","1000","10","0","2","","2","2021-05-31","2021-05-31 17:54:12");
INSERT INTO kp_stock_take VALUES("69","0000-00-00","144","996","20","0","2","","2","2021-05-31","2021-05-31 17:54:15");
INSERT INTO kp_stock_take VALUES("70","0000-00-00","268","107","30","0","2","","2","2021-05-31","2021-05-31 17:54:17");





CREATE TABLE `kp_stock_take_id` (
  `take_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `kp_stock_take_set` (
  `id` int(11) NOT NULL,
  `take_interval` int(11) NOT NULL,
  `last_take` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_stock_take_set VALUES("1","1","2021-05-01","2");





CREATE TABLE `kp_stock_take_status` (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `take_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `take_status` int(11) NOT NULL DEFAULT '2',
  `user_id` int(11) NOT NULL,
  `type` varchar(22) NOT NULL,
  PRIMARY KEY (`stat_id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO kp_stock_take_status VALUES("1","0","2021-05-31","3","2","");





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
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO kp_stock_track VALUES("16","0","1","","0","","1","1","999.50","OUT","2021-03-22","2021-03-22 13:35:56");
INSERT INTO kp_stock_track VALUES("3","0","2","","0","","1","1","999.00","OUT","2021-03-28","2021-03-28 09:43:11");
INSERT INTO kp_stock_track VALUES("18","0","3","","0","","2","1","999.00","OUT","2021-03-28","2021-03-28 09:52:18");
INSERT INTO kp_stock_track VALUES("145","0","4","","0","","2","2","998.00","OUT","2021-03-28","2021-03-28 09:55:10");
INSERT INTO kp_stock_track VALUES("1","0","5","","0","","2","1","999.00","OUT","2021-03-28","2021-03-28 10:00:30");
INSERT INTO kp_stock_track VALUES("32","0","6","","0","","2","1","999.00","OUT","2021-03-28","2021-03-28 10:01:18");
INSERT INTO kp_stock_track VALUES("150","0","","2","0","","2","10","0.00","IN","2021-03-28","2021-03-28 10:49:50");
INSERT INTO kp_stock_track VALUES("18","0","","2","0","","2","6","0.00","IN","2021-03-28","2021-03-28 10:49:53");
INSERT INTO kp_stock_track VALUES("1","0","8","","0","","2","1","998.00","OUT","0000-00-00","2021-03-28 11:20:58");
INSERT INTO kp_stock_track VALUES("1","0","","3","0","","2","1","0.00","IN","2021-03-28","2021-03-28 11:28:38");
INSERT INTO kp_stock_track VALUES("153","0","10","","0","","2","6","94.00","OUT","2021-03-29","2021-03-29 11:00:00");
INSERT INTO kp_stock_track VALUES("78","0","13","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 11:39:24");
INSERT INTO kp_stock_track VALUES("68","0","14","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 11:41:04");
INSERT INTO kp_stock_track VALUES("163","0","16","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 11:45:34");
INSERT INTO kp_stock_track VALUES("33","0","18","","0","","1","1","999.00","OUT","2021-03-29","2021-03-29 12:09:38");
INSERT INTO kp_stock_track VALUES("47","0","19","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 12:11:51");
INSERT INTO kp_stock_track VALUES("140","0","20","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 12:12:29");
INSERT INTO kp_stock_track VALUES("164","0","22","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:15:45");
INSERT INTO kp_stock_track VALUES("165","0","24","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:18:43");
INSERT INTO kp_stock_track VALUES("162","0","25","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:27:17");
INSERT INTO kp_stock_track VALUES("160","0","25","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:27:26");
INSERT INTO kp_stock_track VALUES("96","0","26","","0","","2","6","994.00","OUT","2021-03-29","2021-03-29 12:32:11");
INSERT INTO kp_stock_track VALUES("80","0","26","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 12:32:23");
INSERT INTO kp_stock_track VALUES("47","0","26","","0","","2","1","998.00","OUT","2021-03-29","2021-03-29 12:32:49");
INSERT INTO kp_stock_track VALUES("166","0","26","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:34:35");
INSERT INTO kp_stock_track VALUES("167","0","29","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:39:06");
INSERT INTO kp_stock_track VALUES("168","0","31","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:40:58");
INSERT INTO kp_stock_track VALUES("165","0","32","","0","","2","6","93.00","OUT","2021-03-29","2021-03-29 12:50:28");
INSERT INTO kp_stock_track VALUES("169","0","32","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 12:52:53");
INSERT INTO kp_stock_track VALUES("170","0","36","","0","","2","2","98.00","OUT","2021-03-29","2021-03-29 13:25:33");
INSERT INTO kp_stock_track VALUES("171","0","39","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 14:06:41");
INSERT INTO kp_stock_track VALUES("173","0","39","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 14:06:51");
INSERT INTO kp_stock_track VALUES("172","0","39","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 14:07:02");
INSERT INTO kp_stock_track VALUES("157","0","41","","0","","2","5","95.00","OUT","2021-03-29","2021-03-29 14:45:16");
INSERT INTO kp_stock_track VALUES("77","0","12","","0","","2","2","998.00","OUT","2021-03-29","2021-03-29 14:59:25");
INSERT INTO kp_stock_track VALUES("175","0","12","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 14:59:34");
INSERT INTO kp_stock_track VALUES("65","0","12","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 14:59:45");
INSERT INTO kp_stock_track VALUES("174","0","45","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 15:00:21");
INSERT INTO kp_stock_track VALUES("179","0","47","","0","","2","2","98.00","OUT","2021-03-29","2021-03-29 15:37:29");
INSERT INTO kp_stock_track VALUES("165","0","50","","0","","2","25","67.00","OUT","2021-03-29","2021-03-29 15:48:02");
INSERT INTO kp_stock_track VALUES("23","0","54","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 15:59:04");
INSERT INTO kp_stock_track VALUES("192","0","55","","0","","2","12","88.00","OUT","2021-03-29","2021-03-29 16:02:15");
INSERT INTO kp_stock_track VALUES("166","0","55","","0","","2","1","98.00","OUT","2021-03-29","2021-03-29 16:02:25");
INSERT INTO kp_stock_track VALUES("160","0","55","","0","","2","1","98.00","OUT","2021-03-29","2021-03-29 16:02:51");
INSERT INTO kp_stock_track VALUES("37","0","55","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 16:03:01");
INSERT INTO kp_stock_track VALUES("193","0","55","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 16:04:13");
INSERT INTO kp_stock_track VALUES("165","0","55","","0","","2","3","64.00","OUT","2021-03-29","2021-03-29 16:04:48");
INSERT INTO kp_stock_track VALUES("196","0","57","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 17:22:44");
INSERT INTO kp_stock_track VALUES("65","0","57","","0","","2","2","997.00","OUT","2021-03-29","2021-03-29 17:23:04");
INSERT INTO kp_stock_track VALUES("165","0","57","","0","","2","2","62.00","OUT","2021-03-29","2021-03-29 17:23:19");
INSERT INTO kp_stock_track VALUES("182","0","57","","0","","2","4","96.00","OUT","2021-03-29","2021-03-29 17:26:52");
INSERT INTO kp_stock_track VALUES("169","0","58","","0","","2","1","98.00","OUT","0000-00-00","2021-03-29 17:32:18");
INSERT INTO kp_stock_track VALUES("170","0","59","","0","","2","1","97.00","OUT","2021-03-29","2021-03-29 17:33:02");
INSERT INTO kp_stock_track VALUES("197","0","61","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 17:53:29");
INSERT INTO kp_stock_track VALUES("10","0","62","","0","","2","2","998.00","OUT","2021-03-29","2021-03-29 18:01:03");
INSERT INTO kp_stock_track VALUES("152","0","63","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 18:16:03");
INSERT INTO kp_stock_track VALUES("179","0","64","","0","","2","1","97.00","OUT","2021-03-29","2021-03-29 18:19:33");
INSERT INTO kp_stock_track VALUES("32","0","64","","0","","2","1","998.00","OUT","2021-03-29","2021-03-29 18:20:18");
INSERT INTO kp_stock_track VALUES("38","0","64","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 18:20:43");
INSERT INTO kp_stock_track VALUES("29","0","64","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 18:20:56");
INSERT INTO kp_stock_track VALUES("168","0","64","","0","","2","1","98.00","OUT","2021-03-29","2021-03-29 18:24:43");
INSERT INTO kp_stock_track VALUES("199","0","64","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 18:25:46");
INSERT INTO kp_stock_track VALUES("76","0","64","","0","","2","6","994.00","OUT","2021-03-29","2021-03-29 18:29:35");
INSERT INTO kp_stock_track VALUES("186","0","64","","0","","2","6","94.00","OUT","2021-03-29","2021-03-29 18:29:54");
INSERT INTO kp_stock_track VALUES("174","0","64","","0","","2","1","98.00","OUT","2021-03-29","2021-03-29 18:30:43");
INSERT INTO kp_stock_track VALUES("201","0","64","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 18:32:10");
INSERT INTO kp_stock_track VALUES("200","0","64","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 18:32:20");
INSERT INTO kp_stock_track VALUES("33","0","64","","0","","2","2","997.00","OUT","2021-03-29","2021-03-29 18:32:55");
INSERT INTO kp_stock_track VALUES("23","0","64","","0","","2","1","998.00","OUT","2021-03-29","2021-03-29 18:34:07");
INSERT INTO kp_stock_track VALUES("139","0","65","","0","","2","1","999.00","OUT","2021-03-29","2021-03-29 18:36:05");
INSERT INTO kp_stock_track VALUES("18","0","66","","0","","2","1","1004.00","OUT","2021-03-29","2021-03-29 18:43:56");
INSERT INTO kp_stock_track VALUES("171","0","67","","0","","2","1","98.00","OUT","2021-03-29","2021-03-29 18:50:34");
INSERT INTO kp_stock_track VALUES("159","0","68","","0","","2","1","99.00","OUT","2021-03-29","2021-03-29 18:53:14");
INSERT INTO kp_stock_track VALUES("178","0","69","","0","","2","2","98.00","OUT","2021-03-29","2021-03-29 18:55:44");
INSERT INTO kp_stock_track VALUES("182","0","70","","0","","2","1","95.00","OUT","2021-03-29","2021-03-29 19:01:50");
INSERT INTO kp_stock_track VALUES("18","0","71","","0","","2","1","1003.00","OUT","2021-03-29","2021-03-29 19:02:25");
INSERT INTO kp_stock_track VALUES("14","0","75","","0","","2","1","999.50","OUT","2021-03-30","2021-03-30 11:39:27");
INSERT INTO kp_stock_track VALUES("164","0","75","","0","","2","10","89.00","OUT","2021-03-30","2021-03-30 11:41:30");
INSERT INTO kp_stock_track VALUES("37","0","75","","0","","2","1","998.00","OUT","2021-03-30","2021-03-30 11:43:32");
INSERT INTO kp_stock_track VALUES("62","0","75","","0","","2","1","999.00","OUT","2021-03-30","2021-03-30 11:43:48");
INSERT INTO kp_stock_track VALUES("167","0","75","","0","","2","1","98.00","OUT","2021-03-30","2021-03-30 11:44:12");
INSERT INTO kp_stock_track VALUES("176","0","75","","0","","2","1","99.00","OUT","2021-03-30","2021-03-30 11:45:28");
INSERT INTO kp_stock_track VALUES("20","0","76","","0","","2","6","994.00","OUT","0000-00-00","2021-03-30 12:46:29");
INSERT INTO kp_stock_track VALUES("165","0","77","","0","","2","13","36.00","OUT","2021-03-30","2021-03-30 13:08:59");
INSERT INTO kp_stock_track VALUES("171","0","78","","0","","2","1","97.00","OUT","2021-03-30","2021-03-30 13:10:13");
INSERT INTO kp_stock_track VALUES("176","0","79","","0","","2","1","98.00","OUT","2021-03-30","2021-03-30 13:11:09");
INSERT INTO kp_stock_track VALUES("165","0","79","","0","","2","13","23.50","OUT","2021-03-30","2021-03-30 13:11:49");
INSERT INTO kp_stock_track VALUES("203","0","79","","0","","2","2","98.00","OUT","2021-03-30","2021-03-30 13:13:34");
INSERT INTO kp_stock_track VALUES("164","0","80","","0","","2","10","79.00","OUT","2021-03-30","2021-03-30 13:14:37");
INSERT INTO kp_stock_track VALUES("193","0","80","","0","","2","1","98.00","OUT","2021-03-30","2021-03-30 13:14:50");
INSERT INTO kp_stock_track VALUES("153","0","81","","0","","2","1","93.00","OUT","2021-03-30","2021-03-30 13:17:25");
INSERT INTO kp_stock_track VALUES("171","0","82","","0","","2","1","96.00","OUT","2021-03-30","2021-03-30 14:24:20");
INSERT INTO kp_stock_track VALUES("165","0","83","","0","","2","1","23.00","OUT","2021-03-30","2021-03-30 14:27:13");
INSERT INTO kp_stock_track VALUES("5","0","83","","0","","2","2","998.00","OUT","2021-03-30","2021-03-30 14:29:18");
INSERT INTO kp_stock_track VALUES("180","0","83","","0","","2","1","98.00","OUT","2021-03-30","2021-03-30 14:30:10");
INSERT INTO kp_stock_track VALUES("193","0","83","","0","","2","1","97.00","OUT","2021-03-30","2021-03-30 14:31:06");
INSERT INTO kp_stock_track VALUES("23","0","84","","0","","2","1","997.00","OUT","2021-03-30","2021-03-30 14:46:19");
INSERT INTO kp_stock_track VALUES("182","0","85","","0","","2","3","92.00","OUT","2021-03-30","2021-03-30 15:44:44");
INSERT INTO kp_stock_track VALUES("5","0","86","","0","","2","1","997.00","OUT","2021-03-30","2021-03-30 16:06:49");
INSERT INTO kp_stock_track VALUES("37","0","87","","0","","2","1","997.00","OUT","2021-03-30","2021-03-30 16:34:29");
INSERT INTO kp_stock_track VALUES("182","0","88","","0","","2","2","90.00","OUT","2021-03-30","2021-03-30 16:53:27");
INSERT INTO kp_stock_track VALUES("196","0","88","","0","","2","5","94.00","OUT","2021-03-30","2021-03-30 16:55:04");
INSERT INTO kp_stock_track VALUES("5","0","90","","0","","2","2","995.00","OUT","2021-03-30","2021-03-30 17:05:02");
INSERT INTO kp_stock_track VALUES("186","0","90","","0","","2","1","93.00","OUT","2021-03-30","2021-03-30 17:05:37");
INSERT INTO kp_stock_track VALUES("170","0","91","","0","","2","1","96.00","OUT","2021-03-30","2021-03-30 17:15:57");
INSERT INTO kp_stock_track VALUES("165","0","92","","0","","2","1","22.00","OUT","2021-03-30","2021-03-30 17:20:33");
INSERT INTO kp_stock_track VALUES("137","0","92","","0","","2","1","999.00","OUT","2021-03-30","2021-03-30 17:21:30");
INSERT INTO kp_stock_track VALUES("165","0","93","","0","","2","1","21.50","OUT","2021-03-30","2021-03-30 17:23:32");
INSERT INTO kp_stock_track VALUES("173","0","94","","0","","2","1","98.00","OUT","2021-03-30","2021-03-30 17:50:23");
INSERT INTO kp_stock_track VALUES("165","0","97","","0","","2","25","975.00","OUT","2021-03-30","2021-03-30 17:57:16");
INSERT INTO kp_stock_track VALUES("176","0","98","","0","","2","1","97.00","OUT","2021-03-30","2021-03-30 18:07:38");
INSERT INTO kp_stock_track VALUES("164","0","98","","0","","2","2","77.00","OUT","2021-03-30","2021-03-30 18:09:30");
INSERT INTO kp_stock_track VALUES("179","0","99","","0","","2","1","96.50","OUT","2021-03-30","2021-03-30 18:11:19");
INSERT INTO kp_stock_track VALUES("68","0","100","","0","","2","2","997.00","OUT","2021-03-30","2021-03-30 18:26:11");
INSERT INTO kp_stock_track VALUES("170","0","101","","0","","2","1","95.50","OUT","2021-03-30","2021-03-30 18:41:42");
INSERT INTO kp_stock_track VALUES("62","0","102","","0","","2","1","998.00","OUT","2021-03-30","2021-03-30 18:48:58");
INSERT INTO kp_stock_track VALUES("68","0","102","","0","","2","1","996.00","OUT","2021-03-30","2021-03-30 18:49:20");
INSERT INTO kp_stock_track VALUES("75","0","102","","0","","2","1","999.00","OUT","2021-03-30","2021-03-30 18:49:47");
INSERT INTO kp_stock_track VALUES("139","0","103","","0","","2","1","998.00","OUT","2021-03-31","2021-03-31 08:03:07");
INSERT INTO kp_stock_track VALUES("205","0","106","","0","","2","4","96.00","OUT","2021-03-31","2021-03-31 08:19:49");
INSERT INTO kp_stock_track VALUES("141","0","107","","0","","2","1","999.00","OUT","2021-03-31","2021-03-31 08:31:44");
INSERT INTO kp_stock_track VALUES("206","0","109","","0","","2","1","99.00","OUT","2021-03-31","2021-03-31 08:57:23");
INSERT INTO kp_stock_track VALUES("168","0","110","","0","","2","1","97.00","OUT","0000-00-00","2021-03-31 10:30:55");
INSERT INTO kp_stock_track VALUES("186","0","111","","0","","2","6","87.00","OUT","0000-00-00","2021-03-31 10:47:09");
INSERT INTO kp_stock_track VALUES("144","0","112","","0","","2","1","999.00","OUT","2021-03-31","2021-03-31 10:51:13");
INSERT INTO kp_stock_track VALUES("14","0","113","","0","","2","1","999.00","OUT","2021-03-31","2021-03-31 11:43:20");
INSERT INTO kp_stock_track VALUES("138","0","114","","0","","2","1","999.00","OUT","0000-00-00","2021-03-31 15:07:06");
INSERT INTO kp_stock_track VALUES("28","0","115","","0","","2","1","999.00","OUT","0000-00-00","2021-03-31 16:01:26");
INSERT INTO kp_stock_track VALUES("180","0","116","","0","","2","2","96.00","OUT","2021-03-31","2021-03-31 16:05:33");
INSERT INTO kp_stock_track VALUES("23","0","118","","0","","2","1","996.00","OUT","2021-03-31","2021-03-31 17:21:33");
INSERT INTO kp_stock_track VALUES("84","0","120","","0","","2","1","999.00","OUT","2021-03-31","2021-03-31 17:41:22");
INSERT INTO kp_stock_track VALUES("23","0","122","","0","","2","1","995.00","OUT","2021-03-31","2021-03-31 17:48:09");
INSERT INTO kp_stock_track VALUES("23","0","123","","0","","2","1","994.00","OUT","2021-03-31","2021-03-31 18:02:17");
INSERT INTO kp_stock_track VALUES("211","0","123","","0","","2","1","99.00","OUT","2021-03-31","2021-03-31 18:05:59");
INSERT INTO kp_stock_track VALUES("65","0","123","","0","","2","1","996.00","OUT","2021-03-31","2021-03-31 18:06:13");
INSERT INTO kp_stock_track VALUES("173","0","123","","0","","2","1","97.00","OUT","2021-03-31","2021-03-31 18:06:28");
INSERT INTO kp_stock_track VALUES("169","0","124","","0","","2","1","97.00","OUT","2021-03-31","2021-03-31 18:07:08");
INSERT INTO kp_stock_track VALUES("187","0","125","","0","","2","6","94.00","OUT","2021-03-31","2021-03-31 18:07:56");
INSERT INTO kp_stock_track VALUES("179","0","126","","0","","2","1","95.50","OUT","2021-03-31","2021-03-31 18:10:05");
INSERT INTO kp_stock_track VALUES("165","0","126","","0","","2","4","971.00","OUT","2021-03-31","2021-03-31 18:10:21");
INSERT INTO kp_stock_track VALUES("171","0","126","","0","","2","4","92.00","OUT","2021-03-31","2021-03-31 18:10:43");
INSERT INTO kp_stock_track VALUES("170","0","126","","0","","2","4","92.00","OUT","2021-03-31","2021-03-31 18:10:58");
INSERT INTO kp_stock_track VALUES("165","0","127","","0","","2","20","951.00","OUT","2021-03-31","2021-03-31 18:12:16");
INSERT INTO kp_stock_track VALUES("150","0","127","","0","","2","1","109.00","OUT","2021-03-31","2021-03-31 18:12:49");
INSERT INTO kp_stock_track VALUES("10","0","127","","0","","2","1","997.00","OUT","2021-03-31","2021-03-31 18:13:09");
INSERT INTO kp_stock_track VALUES("179","0","128","","0","","2","1","95.50","OUT","2021-03-31","2021-03-31 18:14:03");
INSERT INTO kp_stock_track VALUES("156","0","128","","0","","2","2","98.00","OUT","2021-03-31","2021-03-31 18:16:36");
INSERT INTO kp_stock_track VALUES("196","0","129","","0","","2","1","93.00","OUT","2021-03-31","2021-03-31 18:17:14");
INSERT INTO kp_stock_track VALUES("203","0","130","","0","","2","1","97.00","OUT","2021-03-31","2021-03-31 18:22:40");
INSERT INTO kp_stock_track VALUES("205","0","130","","0","","2","1","95.00","OUT","2021-03-31","2021-03-31 18:23:47");
INSERT INTO kp_stock_track VALUES("208","0","130","","0","","2","2","98.00","OUT","2021-03-31","2021-03-31 18:24:04");
INSERT INTO kp_stock_track VALUES("165","0","131","","0","","2","2","949.00","OUT","2021-03-31","2021-03-31 18:31:36");
INSERT INTO kp_stock_track VALUES("5","0","131","","0","","2","2","993.00","OUT","2021-03-31","2021-03-31 18:32:08");
INSERT INTO kp_stock_track VALUES("208","0","131","","0","","2","1","97.00","OUT","2021-03-31","2021-03-31 18:32:21");
INSERT INTO kp_stock_track VALUES("176","0","131","","0","","2","1","96.00","OUT","2021-03-31","2021-03-31 18:32:38");
INSERT INTO kp_stock_track VALUES("186","0","131","","0","","2","5","82.00","OUT","2021-03-31","2021-03-31 18:32:57");
INSERT INTO kp_stock_track VALUES("138","0","133","","0","","2","1","998.00","OUT","2021-03-31","2021-03-31 18:47:44");
INSERT INTO kp_stock_track VALUES("165","0","134","","0","","2","13","936.50","OUT","2021-04-01","2021-04-01 08:29:43");
INSERT INTO kp_stock_track VALUES("144","0","135","","0","","2","1","998.00","OUT","2021-04-01","2021-04-01 09:16:53");
INSERT INTO kp_stock_track VALUES("179","0","137","","0","","2","1","95.00","OUT","2021-04-01","2021-04-01 09:49:58");
INSERT INTO kp_stock_track VALUES("5","0","137","","0","","2","5","988.00","OUT","2021-04-01","2021-04-01 09:50:06");
INSERT INTO kp_stock_track VALUES("189","0","137","","0","","2","2","98.00","OUT","2021-04-01","2021-04-01 09:51:19");
INSERT INTO kp_stock_track VALUES("182","0","137","","0","","2","1","89.00","OUT","2021-04-01","2021-04-01 09:51:38");
INSERT INTO kp_stock_track VALUES("179","0","138","","0","","2","1","94.00","OUT","2021-04-01","2021-04-01 09:53:49");
INSERT INTO kp_stock_track VALUES("8","0","138","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 09:54:08");
INSERT INTO kp_stock_track VALUES("5","0","138","","0","","2","2","986.00","OUT","2021-04-01","2021-04-01 09:54:26");
INSERT INTO kp_stock_track VALUES("165","0","138","","0","","2","2","934.00","OUT","2021-04-01","2021-04-01 09:54:41");
INSERT INTO kp_stock_track VALUES("212","0","138","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 09:56:18");
INSERT INTO kp_stock_track VALUES("189","0","138","","0","","2","1","97.00","OUT","2021-04-01","2021-04-01 09:57:15");
INSERT INTO kp_stock_track VALUES("5","0","139","","0","","2","1","985.50","OUT","2021-04-01","2021-04-01 10:03:41");
INSERT INTO kp_stock_track VALUES("165","0","141","","0","","2","1","933.00","OUT","2021-04-01","2021-04-01 11:28:31");
INSERT INTO kp_stock_track VALUES("5","0","142","","0","","2","13","974.50","OUT","2021-04-01","2021-04-01 12:08:54");
INSERT INTO kp_stock_track VALUES("206","0","143","","0","","2","1","98.00","OUT","2021-04-01","2021-04-01 12:10:57");
INSERT INTO kp_stock_track VALUES("180","0","144","","0","","2","1","96.00","OUT","2021-04-01","2021-04-01 12:12:08");
INSERT INTO kp_stock_track VALUES("165","0","146","","0","","2","4","929.00","OUT","2021-04-01","2021-04-01 12:23:28");
INSERT INTO kp_stock_track VALUES("5","0","146","","0","","2","4","970.00","OUT","2021-04-01","2021-04-01 12:23:36");
INSERT INTO kp_stock_track VALUES("23","0","146","","0","","2","1","993.00","OUT","2021-04-01","2021-04-01 12:23:53");
INSERT INTO kp_stock_track VALUES("203","0","147","","0","","2","2","95.00","OUT","2021-04-01","2021-04-01 12:38:59");
INSERT INTO kp_stock_track VALUES("176","0","147","","0","","2","1","95.00","OUT","2021-04-01","2021-04-01 12:39:10");
INSERT INTO kp_stock_track VALUES("85","0","147","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 12:41:07");
INSERT INTO kp_stock_track VALUES("9","0","147","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 12:42:29");
INSERT INTO kp_stock_track VALUES("170","0","148","","0","","2","3","89.00","OUT","2021-04-01","2021-04-01 13:01:03");
INSERT INTO kp_stock_track VALUES("8","0","149","","0","","2","1","998.00","OUT","2021-04-01","2021-04-01 13:33:05");
INSERT INTO kp_stock_track VALUES("141","0","151","","0","","2","1","997.50","OUT","2021-04-01","2021-04-01 14:03:48");
INSERT INTO kp_stock_track VALUES("189","0","152","","0","","2","1","96.00","OUT","2021-04-01","2021-04-01 14:31:31");
INSERT INTO kp_stock_track VALUES("157","0","153","","0","","2","10","85.00","OUT","2021-04-01","2021-04-01 15:07:00");
INSERT INTO kp_stock_track VALUES("156","0","153","","0","","2","6","92.00","OUT","2021-04-01","2021-04-01 15:08:48");
INSERT INTO kp_stock_track VALUES("170","0","154","","0","","2","1","88.50","OUT","2021-04-01","2021-04-01 15:40:49");
INSERT INTO kp_stock_track VALUES("8","0","156","","0","","2","1","997.00","OUT","2021-04-01","2021-04-01 16:30:27");
INSERT INTO kp_stock_track VALUES("10","0","156","","0","","2","1","996.00","OUT","2021-04-01","2021-04-01 16:40:25");
INSERT INTO kp_stock_track VALUES("119","0","156","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 16:40:59");
INSERT INTO kp_stock_track VALUES("118","0","156","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 16:41:13");
INSERT INTO kp_stock_track VALUES("76","0","156","","0","","2","1","993.00","OUT","2021-04-01","2021-04-01 16:41:42");
INSERT INTO kp_stock_track VALUES("171","0","156","","0","","2","1","91.00","OUT","2021-04-01","2021-04-01 16:42:48");
INSERT INTO kp_stock_track VALUES("37","0","156","","0","","2","2","995.00","OUT","2021-04-01","2021-04-01 16:43:32");
INSERT INTO kp_stock_track VALUES("39","0","156","","0","","2","2","998.00","OUT","2021-04-01","2021-04-01 16:43:41");
INSERT INTO kp_stock_track VALUES("136","0","156","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 16:43:50");
INSERT INTO kp_stock_track VALUES("164","0","156","","0","","2","1","76.00","OUT","2021-04-01","2021-04-01 16:44:24");
INSERT INTO kp_stock_track VALUES("176","0","156","","0","","2","2","93.00","OUT","2021-04-01","2021-04-01 16:45:55");
INSERT INTO kp_stock_track VALUES("203","0","156","","0","","2","2","93.00","OUT","2021-04-01","2021-04-01 16:48:08");
INSERT INTO kp_stock_track VALUES("201","0","156","","0","","2","1","98.00","OUT","2021-04-01","2021-04-01 16:50:01");
INSERT INTO kp_stock_track VALUES("84","0","156","","0","","2","1","998.00","OUT","2021-04-01","2021-04-01 16:50:54");
INSERT INTO kp_stock_track VALUES("23","0","157","","0","","2","1","992.00","OUT","2021-04-01","2021-04-01 16:51:15");
INSERT INTO kp_stock_track VALUES("169","0","156","","0","","2","1","96.00","OUT","2021-04-01","2021-04-01 16:53:18");
INSERT INTO kp_stock_track VALUES("138","0","156","","0","","2","1","997.00","OUT","2021-04-01","2021-04-01 16:54:18");
INSERT INTO kp_stock_track VALUES("133","0","156","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 16:56:41");
INSERT INTO kp_stock_track VALUES("135","0","156","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 16:57:00");
INSERT INTO kp_stock_track VALUES("209","0","156","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 16:58:00");
INSERT INTO kp_stock_track VALUES("23","0","156","","0","","2","2","990.00","OUT","2021-04-01","2021-04-01 17:00:38");
INSERT INTO kp_stock_track VALUES("204","0","156","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 17:01:27");
INSERT INTO kp_stock_track VALUES("174","0","156","","0","","2","1","97.00","OUT","2021-04-01","2021-04-01 17:03:43");
INSERT INTO kp_stock_track VALUES("160","0","158","","0","","2","1","97.00","OUT","2021-04-01","2021-04-01 17:06:06");
INSERT INTO kp_stock_track VALUES("162","0","158","","0","","2","1","98.00","OUT","2021-04-01","2021-04-01 17:06:15");
INSERT INTO kp_stock_track VALUES("215","0","156","","0","","2","6","94.00","OUT","2021-04-01","2021-04-01 17:09:44");
INSERT INTO kp_stock_track VALUES("214","0","156","","0","","2","6","94.00","OUT","2021-04-01","2021-04-01 17:11:03");
INSERT INTO kp_stock_track VALUES("141","0","156","","0","","2","1","997.50","OUT","2021-04-01","2021-04-01 17:13:51");
INSERT INTO kp_stock_track VALUES("185","0","156","","0","","2","2","98.00","OUT","2021-04-01","2021-04-01 17:14:51");
INSERT INTO kp_stock_track VALUES("216","0","156","","0","","2","2","98.00","OUT","2021-04-01","2021-04-01 17:18:59");
INSERT INTO kp_stock_track VALUES("157","0","156","","0","","2","1","84.00","OUT","2021-04-01","2021-04-01 17:20:32");
INSERT INTO kp_stock_track VALUES("213","0","156","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 17:21:12");
INSERT INTO kp_stock_track VALUES("158","0","156","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 17:22:16");
INSERT INTO kp_stock_track VALUES("140","0","159","","0","","2","1","997.00","OUT","2021-04-01","2021-04-01 17:24:00");
INSERT INTO kp_stock_track VALUES("200","0","159","","0","","2","1","98.00","OUT","2021-04-01","2021-04-01 17:32:30");
INSERT INTO kp_stock_track VALUES("121","0","159","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 17:32:53");
INSERT INTO kp_stock_track VALUES("217","0","159","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 17:33:43");
INSERT INTO kp_stock_track VALUES("33","0","160","","0","","2","1","996.00","OUT","2021-04-01","2021-04-01 17:58:37");
INSERT INTO kp_stock_track VALUES("32","0","160","","0","","2","1","997.00","OUT","2021-04-01","2021-04-01 17:58:46");
INSERT INTO kp_stock_track VALUES("98","0","161","","0","","2","1","999.00","OUT","2021-04-01","2021-04-01 18:08:34");
INSERT INTO kp_stock_track VALUES("218","0","163","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 18:11:50");
INSERT INTO kp_stock_track VALUES("5","0","164","","0","","2","1","968.00","OUT","2021-04-01","2021-04-01 18:12:52");
INSERT INTO kp_stock_track VALUES("170","0","165","","0","","2","2","86.00","OUT","2021-04-01","2021-04-01 18:18:50");
INSERT INTO kp_stock_track VALUES("5","0","166","","0","","2","2","966.50","OUT","2021-04-01","2021-04-01 18:26:16");
INSERT INTO kp_stock_track VALUES("196","0","167","","0","","2","1","92.00","OUT","2021-04-01","2021-04-01 18:27:04");
INSERT INTO kp_stock_track VALUES("5","0","168","","0","","2","1","965.00","OUT","2021-04-01","2021-04-01 19:14:09");
INSERT INTO kp_stock_track VALUES("181","0","169","","0","","2","1","99.00","OUT","2021-04-01","2021-04-01 19:14:35");
INSERT INTO kp_stock_track VALUES("176","0","170","","0","","2","1","92.00","OUT","2021-04-01","2021-04-01 19:15:05");
INSERT INTO kp_stock_track VALUES("168","0","170","","0","","2","1","96.00","OUT","2021-04-01","2021-04-01 19:15:12");
INSERT INTO kp_stock_track VALUES("75","0","170","","0","","2","1","998.00","OUT","2021-04-01","2021-04-01 19:16:56");
INSERT INTO kp_stock_track VALUES("170","0","171","","0","","2","2","84.00","OUT","2021-04-02","2021-04-02 08:04:23");
INSERT INTO kp_stock_track VALUES("183","0","171","","0","","2","2","98.00","OUT","2021-04-02","2021-04-02 08:05:45");
INSERT INTO kp_stock_track VALUES("219","0","171","","0","","2","2","98.00","OUT","2021-04-02","2021-04-02 08:06:03");
INSERT INTO kp_stock_track VALUES("165","0","171","","0","","2","3","939.00","OUT","2021-04-02","2021-04-02 08:06:28");
INSERT INTO kp_stock_track VALUES("58","0","171","","0","","2","1","999.00","OUT","2021-04-02","2021-04-02 08:15:22");
INSERT INTO kp_stock_track VALUES("221","0","171","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 08:17:29");
INSERT INTO kp_stock_track VALUES("138","0","171","","0","","2","1","996.00","OUT","2021-04-02","2021-04-02 08:20:28");
INSERT INTO kp_stock_track VALUES("47","0","172","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 08:22:47");
INSERT INTO kp_stock_track VALUES("176","0","172","","0","","2","1","91.00","OUT","2021-04-02","2021-04-02 08:22:57");
INSERT INTO kp_stock_track VALUES("18","0","173","","0","","2","1","1002.00","OUT","2021-04-02","2021-04-02 08:27:45");
INSERT INTO kp_stock_track VALUES("178","0","174","","0","","2","2","96.00","OUT","2021-04-02","2021-04-02 08:30:28");
INSERT INTO kp_stock_track VALUES("8","0","175","","0","","2","5","992.00","OUT","2021-04-02","2021-04-02 09:47:20");
INSERT INTO kp_stock_track VALUES("176","0","175","","0","","2","1","90.00","OUT","2021-04-02","2021-04-02 09:48:13");
INSERT INTO kp_stock_track VALUES("78","0","175","","0","","2","2","997.00","OUT","2021-04-02","2021-04-02 09:50:40");
INSERT INTO kp_stock_track VALUES("165","0","175","","0","","2","10","929.00","OUT","2021-04-02","2021-04-02 09:51:37");
INSERT INTO kp_stock_track VALUES("223","0","177","","0","","2","3","97.00","OUT","2021-04-02","2021-04-02 12:52:00");
INSERT INTO kp_stock_track VALUES("165","0","177","","0","","2","3","926.00","OUT","2021-04-02","2021-04-02 12:52:12");
INSERT INTO kp_stock_track VALUES("23","0","178","","0","","2","1","989.00","OUT","2021-04-02","2021-04-02 12:53:56");
INSERT INTO kp_stock_track VALUES("206","0","178","","0","","2","1","97.00","OUT","2021-04-02","2021-04-02 12:54:37");
INSERT INTO kp_stock_track VALUES("189","0","178","","0","","2","1","95.00","OUT","2021-04-02","2021-04-02 12:55:58");
INSERT INTO kp_stock_track VALUES("153","0","179","","0","","2","1","92.00","OUT","2021-04-02","2021-04-02 12:57:04");
INSERT INTO kp_stock_track VALUES("170","0","180","","0","","2","2","82.00","OUT","2021-04-02","2021-04-02 13:01:14");
INSERT INTO kp_stock_track VALUES("137","0","181","","0","","2","1","998.00","OUT","2021-04-02","2021-04-02 13:05:28");
INSERT INTO kp_stock_track VALUES("208","0","181","","0","","2","1","96.00","OUT","2021-04-02","2021-04-02 13:05:41");
INSERT INTO kp_stock_track VALUES("189","0","182","","0","","2","1","94.00","OUT","2021-04-02","2021-04-02 13:13:34");
INSERT INTO kp_stock_track VALUES("171","0","184","","0","","2","1","90.00","OUT","2021-04-02","2021-04-02 13:45:58");
INSERT INTO kp_stock_track VALUES("8","0","184","","0","","2","1","991.00","OUT","2021-04-02","2021-04-02 13:47:57");
INSERT INTO kp_stock_track VALUES("179","0","184","","0","","2","1","93.00","OUT","2021-04-02","2021-04-02 13:48:06");
INSERT INTO kp_stock_track VALUES("224","0","184","","0","","2","4","96.00","OUT","2021-04-02","2021-04-02 13:50:25");
INSERT INTO kp_stock_track VALUES("196","0","184","","0","","2","4","88.00","OUT","2021-04-02","2021-04-02 13:50:59");
INSERT INTO kp_stock_track VALUES("173","0","186","","0","","2","1","96.00","OUT","2021-04-02","2021-04-02 14:03:48");
INSERT INTO kp_stock_track VALUES("164","0","186","","0","","2","2","74.00","OUT","2021-04-02","2021-04-02 14:06:32");
INSERT INTO kp_stock_track VALUES("165","0","187","","0","","2","4","922.00","OUT","2021-04-02","2021-04-02 14:15:39");
INSERT INTO kp_stock_track VALUES("179","0","187","","0","","2","1","92.50","OUT","2021-04-02","2021-04-02 14:15:50");
INSERT INTO kp_stock_track VALUES("10","0","187","","0","","2","1","995.50","OUT","2021-04-02","2021-04-02 14:16:41");
INSERT INTO kp_stock_track VALUES("5","0","188","","0","","2","4","961.00","OUT","2021-04-02","2021-04-02 14:20:16");
INSERT INTO kp_stock_track VALUES("196","0","189","","0","","2","1","87.00","OUT","2021-04-02","2021-04-02 14:21:59");
INSERT INTO kp_stock_track VALUES("186","0","190","","0","","2","2","80.00","OUT","2021-04-02","2021-04-02 14:23:58");
INSERT INTO kp_stock_track VALUES("129","0","190","","0","","2","2","998.00","OUT","2021-04-02","2021-04-02 14:24:11");
INSERT INTO kp_stock_track VALUES("172","0","191","","0","","2","2","97.00","OUT","2021-04-02","2021-04-02 14:25:32");
INSERT INTO kp_stock_track VALUES("9","0","192","","0","","2","1","998.50","OUT","2021-04-02","2021-04-02 14:31:09");
INSERT INTO kp_stock_track VALUES("8","0","192","","0","","2","1","990.50","OUT","2021-04-02","2021-04-02 14:40:07");
INSERT INTO kp_stock_track VALUES("208","0","192","","0","","2","1","95.00","OUT","2021-04-02","2021-04-02 14:40:29");
INSERT INTO kp_stock_track VALUES("83","0","192","","0","","2","1","999.00","OUT","2021-04-02","2021-04-02 14:40:48");
INSERT INTO kp_stock_track VALUES("176","0","192","","0","","2","1","89.00","OUT","2021-04-02","2021-04-02 14:41:25");
INSERT INTO kp_stock_track VALUES("178","0","192","","0","","2","1","95.00","OUT","2021-04-02","2021-04-02 14:41:33");
INSERT INTO kp_stock_track VALUES("200","0","192","","0","","2","1","97.00","OUT","2021-04-02","2021-04-02 14:42:44");
INSERT INTO kp_stock_track VALUES("168","0","192","","0","","2","1","95.00","OUT","2021-04-02","2021-04-02 14:42:54");
INSERT INTO kp_stock_track VALUES("47","0","192","","0","","2","1","996.00","OUT","2021-04-02","2021-04-02 14:43:21");
INSERT INTO kp_stock_track VALUES("225","0","192","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 14:44:30");
INSERT INTO kp_stock_track VALUES("84","0","192","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 14:44:47");
INSERT INTO kp_stock_track VALUES("77","0","192","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 14:45:16");
INSERT INTO kp_stock_track VALUES("182","0","193","","0","","2","3","86.00","OUT","2021-04-02","2021-04-02 14:46:58");
INSERT INTO kp_stock_track VALUES("192","0","193","","0","","2","3","85.00","OUT","2021-04-02","2021-04-02 14:47:08");
INSERT INTO kp_stock_track VALUES("226","0","193","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 14:48:00");
INSERT INTO kp_stock_track VALUES("192","0","194","","0","","2","4","81.00","OUT","2021-04-02","2021-04-02 14:50:41");
INSERT INTO kp_stock_track VALUES("182","0","194","","0","","2","1","85.00","OUT","2021-04-02","2021-04-02 14:50:55");
INSERT INTO kp_stock_track VALUES("165","0","194","","0","","2","3","919.00","OUT","2021-04-02","2021-04-02 14:51:07");
INSERT INTO kp_stock_track VALUES("77","0","194","","0","","2","2","995.00","OUT","2021-04-02","2021-04-02 14:52:48");
INSERT INTO kp_stock_track VALUES("139","0","192","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 14:58:06");
INSERT INTO kp_stock_track VALUES("138","0","192","","0","","2","1","995.50","OUT","2021-04-02","2021-04-02 14:58:29");
INSERT INTO kp_stock_track VALUES("23","0","192","","0","","2","1","988.00","OUT","2021-04-02","2021-04-02 14:59:41");
INSERT INTO kp_stock_track VALUES("165","0","192","","0","","2","13","906.50","OUT","2021-04-02","2021-04-02 15:00:14");
INSERT INTO kp_stock_track VALUES("68","0","192","","0","","2","1","995.00","OUT","2021-04-02","2021-04-02 15:01:15");
INSERT INTO kp_stock_track VALUES("62","0","192","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 15:01:26");
INSERT INTO kp_stock_track VALUES("75","0","192","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 15:01:40");
INSERT INTO kp_stock_track VALUES("170","0","196","","0","","2","1","81.00","OUT","2021-04-02","2021-04-02 15:09:57");
INSERT INTO kp_stock_track VALUES("118","0","197","","0","","2","1","998.00","OUT","2021-04-02","2021-04-02 15:14:18");
INSERT INTO kp_stock_track VALUES("164","0","197","","0","","2","1","73.50","OUT","2021-04-02","2021-04-02 15:16:38");
INSERT INTO kp_stock_track VALUES("179","0","198","","0","","2","1","91.50","OUT","2021-04-02","2021-04-02 15:33:15");
INSERT INTO kp_stock_track VALUES("195","0","199","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 15:43:11");
INSERT INTO kp_stock_track VALUES("136","0","200","","0","","2","1","998.00","OUT","2021-04-02","2021-04-02 15:47:05");
INSERT INTO kp_stock_track VALUES("88","0","200","","0","","2","1","999.00","OUT","2021-04-02","2021-04-02 15:47:24");
INSERT INTO kp_stock_track VALUES("227","0","200","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 15:49:51");
INSERT INTO kp_stock_track VALUES("228","0","203","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 15:57:16");
INSERT INTO kp_stock_track VALUES("163","0","204","","0","","2","1","98.00","OUT","2021-04-02","2021-04-02 15:58:29");
INSERT INTO kp_stock_track VALUES("165","0","205","","0","","2","4","902.00","OUT","2021-04-02","2021-04-02 16:14:17");
INSERT INTO kp_stock_track VALUES("192","0","205","","0","","2","3","78.00","OUT","2021-04-02","2021-04-02 16:14:28");
INSERT INTO kp_stock_track VALUES("130","0","205","","0","","2","3","997.00","OUT","2021-04-02","2021-04-02 16:14:38");
INSERT INTO kp_stock_track VALUES("182","0","205","","0","","2","5","80.00","OUT","2021-04-02","2021-04-02 16:15:48");
INSERT INTO kp_stock_track VALUES("229","0","205","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 16:20:31");
INSERT INTO kp_stock_track VALUES("165","0","207","","0","","2","2","900.00","OUT","2021-04-02","2021-04-02 16:24:15");
INSERT INTO kp_stock_track VALUES("192","0","207","","0","","2","2","76.00","OUT","2021-04-02","2021-04-02 16:24:29");
INSERT INTO kp_stock_track VALUES("183","0","207","","0","","2","1","97.00","OUT","2021-04-02","2021-04-02 16:24:57");
INSERT INTO kp_stock_track VALUES("5","0","207","","0","","2","1","960.00","OUT","2021-04-02","2021-04-02 16:25:10");
INSERT INTO kp_stock_track VALUES("170","0","207","","0","","2","1","79.50","OUT","2021-04-02","2021-04-02 16:27:56");
INSERT INTO kp_stock_track VALUES("9","0","209","","0","","2","1","997.00","OUT","2021-04-02","2021-04-02 16:46:41");
INSERT INTO kp_stock_track VALUES("165","0","210","","0","","2","2","898.00","OUT","2021-04-02","2021-04-02 16:48:59");
INSERT INTO kp_stock_track VALUES("182","0","210","","0","","2","2","78.00","OUT","2021-04-02","2021-04-02 16:49:11");
INSERT INTO kp_stock_track VALUES("5","0","210","","0","","2","4","956.00","OUT","2021-04-02","2021-04-02 16:49:24");
INSERT INTO kp_stock_track VALUES("230","0","210","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 16:49:34");
INSERT INTO kp_stock_track VALUES("224","0","211","","0","","2","1","95.00","OUT","2021-04-02","2021-04-02 17:28:14");
INSERT INTO kp_stock_track VALUES("166","0","212","","0","","2","1","97.00","OUT","2021-04-02","2021-04-02 17:51:46");
INSERT INTO kp_stock_track VALUES("203","0","212","","0","","2","1","92.00","OUT","2021-04-02","2021-04-02 17:52:00");
INSERT INTO kp_stock_track VALUES("231","0","212","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 17:53:30");
INSERT INTO kp_stock_track VALUES("219","0","213","","0","","2","4","94.00","OUT","2021-04-02","2021-04-02 18:00:49");
INSERT INTO kp_stock_track VALUES("219","0","214","","0","","2","1","93.00","OUT","2021-04-02","2021-04-02 18:04:22");
INSERT INTO kp_stock_track VALUES("10","0","215","","0","","2","1","995.00","OUT","2021-04-02","2021-04-02 18:14:06");
INSERT INTO kp_stock_track VALUES("18","0","215","","0","","2","1","1001.00","OUT","2021-04-02","2021-04-02 18:14:22");
INSERT INTO kp_stock_track VALUES("222","0","215","","0","","2","1","99.00","OUT","2021-04-02","2021-04-02 18:15:08");
INSERT INTO kp_stock_track VALUES("165","0","216","","0","","2","1","897.00","OUT","2021-04-02","2021-04-02 18:39:43");
INSERT INTO kp_stock_track VALUES("153","0","217","","0","","2","1","91.00","OUT","2021-04-02","2021-04-02 18:56:58");
INSERT INTO kp_stock_track VALUES("10","0","217","","0","","2","1","994.00","OUT","2021-04-02","2021-04-02 18:57:07");
INSERT INTO kp_stock_track VALUES("229","0","218","","0","","2","2","97.00","OUT","2021-04-02","2021-04-02 19:07:56");
INSERT INTO kp_stock_track VALUES("203","0","219","","0","","2","1","91.00","OUT","2021-04-03","2021-04-03 08:25:04");
INSERT INTO kp_stock_track VALUES("170","0","222","","0","","2","3","77.00","OUT","2021-04-03","2021-04-03 08:30:32");
INSERT INTO kp_stock_track VALUES("23","0","223","","0","","2","2","986.00","OUT","2021-04-03","2021-04-03 09:02:21");
INSERT INTO kp_stock_track VALUES("176","0","224","","0","","2","1","88.00","OUT","2021-04-03","2021-04-03 09:06:04");
INSERT INTO kp_stock_track VALUES("68","0","224","","0","","2","1","994.00","OUT","2021-04-03","2021-04-03 09:06:15");
INSERT INTO kp_stock_track VALUES("62","0","224","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 09:06:26");
INSERT INTO kp_stock_track VALUES("84","0","224","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 09:06:36");
INSERT INTO kp_stock_track VALUES("203","0","224","","0","","2","1","90.00","OUT","2021-04-03","2021-04-03 09:06:52");
INSERT INTO kp_stock_track VALUES("84","0","225","","0","","2","1","995.00","OUT","2021-04-03","2021-04-03 09:10:44");
INSERT INTO kp_stock_track VALUES("83","0","225","","0","","2","1","998.00","OUT","2021-04-03","2021-04-03 09:10:54");
INSERT INTO kp_stock_track VALUES("211","0","225","","0","","2","1","98.00","OUT","2021-04-03","2021-04-03 09:12:05");
INSERT INTO kp_stock_track VALUES("167","0","225","","0","","2","1","97.00","OUT","2021-04-03","2021-04-03 09:12:27");
INSERT INTO kp_stock_track VALUES("159","0","226","","0","","2","1","98.00","OUT","2021-04-03","2021-04-03 09:17:57");
INSERT INTO kp_stock_track VALUES("139","0","227","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 09:59:09");
INSERT INTO kp_stock_track VALUES("5","0","228","","0","","2","1","955.50","OUT","2021-04-03","2021-04-03 10:12:22");
INSERT INTO kp_stock_track VALUES("141","0","231","","0","","2","1","997.00","OUT","2021-04-03","2021-04-03 10:58:17");
INSERT INTO kp_stock_track VALUES("165","0","232","","0","","2","1","896.00","OUT","2021-04-03","2021-04-03 11:36:27");
INSERT INTO kp_stock_track VALUES("208","0","233","","0","","2","1","94.00","OUT","2021-04-03","2021-04-03 11:37:12");
INSERT INTO kp_stock_track VALUES("37","0","233","","0","","2","1","994.00","OUT","2021-04-03","2021-04-03 11:37:27");
INSERT INTO kp_stock_track VALUES("168","0","234","","0","","2","1","94.00","OUT","2021-04-03","2021-04-03 11:38:33");
INSERT INTO kp_stock_track VALUES("23","0","236","","0","","2","2","984.00","OUT","2021-04-03","2021-04-03 12:24:10");
INSERT INTO kp_stock_track VALUES("179","0","236","","0","","2","1","91.00","OUT","2021-04-03","2021-04-03 12:24:22");
INSERT INTO kp_stock_track VALUES("5","0","236","","0","","2","11","945.00","OUT","2021-04-03","2021-04-03 12:29:57");
INSERT INTO kp_stock_track VALUES("32","0","236","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 12:31:52");
INSERT INTO kp_stock_track VALUES("33","0","236","","0","","2","1","995.00","OUT","2021-04-03","2021-04-03 12:32:01");
INSERT INTO kp_stock_track VALUES("5","0","237","","0","","2","5","940.00","OUT","2021-04-03","2021-04-03 12:34:06");
INSERT INTO kp_stock_track VALUES("165","0","237","","0","","2","5","891.00","OUT","2021-04-03","2021-04-03 12:37:50");
INSERT INTO kp_stock_track VALUES("76","0","237","","0","","2","1","992.00","OUT","2021-04-03","2021-04-03 12:39:10");
INSERT INTO kp_stock_track VALUES("65","0","237","","0","","2","1","995.00","OUT","2021-04-03","2021-04-03 12:39:34");
INSERT INTO kp_stock_track VALUES("170","0","237","","0","","2","4","73.00","OUT","2021-04-03","2021-04-03 12:39:53");
INSERT INTO kp_stock_track VALUES("182","0","238","","0","","2","3","75.00","OUT","2021-04-03","2021-04-03 12:41:14");
INSERT INTO kp_stock_track VALUES("165","0","236","","0","","2","10","881.00","OUT","2021-04-03","2021-04-03 12:42:18");
INSERT INTO kp_stock_track VALUES("188","0","236","","0","","2","1","99.00","OUT","2021-04-03","2021-04-03 12:42:29");
INSERT INTO kp_stock_track VALUES("179","0","239","","0","","2","1","90.00","OUT","2021-04-03","2021-04-03 12:46:52");
INSERT INTO kp_stock_track VALUES("141","0","239","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 12:47:06");
INSERT INTO kp_stock_track VALUES("176","0","239","","0","","2","1","87.00","OUT","2021-04-03","2021-04-03 12:48:20");
INSERT INTO kp_stock_track VALUES("18","0","239","","0","","2","1","1000.00","OUT","2021-04-03","2021-04-03 12:49:25");
INSERT INTO kp_stock_track VALUES("10","0","240","","0","","2","1","993.00","OUT","2021-04-03","2021-04-03 15:25:12");
INSERT INTO kp_stock_track VALUES("165","0","240","","0","","2","1","880.00","OUT","2021-04-03","2021-04-03 15:25:21");
INSERT INTO kp_stock_track VALUES("5","0","240","","0","","2","1","939.00","OUT","2021-04-03","2021-04-03 15:25:31");
INSERT INTO kp_stock_track VALUES("118","0","241","","0","","2","1","997.00","OUT","2021-04-03","2021-04-03 15:30:38");
INSERT INTO kp_stock_track VALUES("178","0","242","","0","","2","2","93.00","OUT","2021-04-03","2021-04-03 15:48:28");
INSERT INTO kp_stock_track VALUES("196","0","242","","0","","2","3","84.00","OUT","2021-04-03","2021-04-03 15:49:04");
INSERT INTO kp_stock_track VALUES("165","0","243","","0","","2","1","879.00","OUT","2021-04-03","2021-04-03 15:53:40");
INSERT INTO kp_stock_track VALUES("208","0","243","","0","","2","1","93.00","OUT","2021-04-03","2021-04-03 15:54:43");
INSERT INTO kp_stock_track VALUES("23","0","243","","0","","2","1","983.00","OUT","2021-04-03","2021-04-03 15:55:06");
INSERT INTO kp_stock_track VALUES("236","0","245","","0","","2","1","99.00","OUT","2021-04-03","2021-04-03 15:59:14");
INSERT INTO kp_stock_track VALUES("192","0","246","","0","","2","1","75.00","OUT","2021-04-03","2021-04-03 16:01:23");
INSERT INTO kp_stock_track VALUES("5","0","246","","0","","2","1","938.00","OUT","2021-04-03","2021-04-03 16:01:30");
INSERT INTO kp_stock_track VALUES("179","0","247","","0","","2","1","89.00","OUT","2021-04-03","2021-04-03 16:25:55");
INSERT INTO kp_stock_track VALUES("140","0","247","","0","","2","1","996.00","OUT","2021-04-03","2021-04-03 16:26:05");
INSERT INTO kp_stock_track VALUES("233","0","249","","0","","2","1","99.00","OUT","2021-04-03","2021-04-03 16:29:45");
INSERT INTO kp_stock_track VALUES("154","0","250","","0","","2","1","99.00","OUT","2021-04-03","2021-04-03 16:36:48");
INSERT INTO kp_stock_track VALUES("140","0","251","","0","","2","1","995.50","OUT","2021-04-03","2021-04-03 16:39:50");
INSERT INTO kp_stock_track VALUES("122","0","251","","0","","2","1","999.00","OUT","2021-04-03","2021-04-03 16:41:35");
INSERT INTO kp_stock_track VALUES("179","0","252","","0","","2","1","88.00","OUT","2021-04-03","2021-04-03 16:44:20");
INSERT INTO kp_stock_track VALUES("236","0","253","","0","","2","1","98.00","OUT","2021-04-03","2021-04-03 16:50:11");
INSERT INTO kp_stock_track VALUES("86","0","254","","0","","2","1","999.00","OUT","2021-04-03","2021-04-03 16:53:09");
INSERT INTO kp_stock_track VALUES("178","0","255","","0","","2","2","91.00","OUT","2021-04-03","2021-04-03 16:53:48");
INSERT INTO kp_stock_track VALUES("27","0","256","","0","","2","1","999.00","OUT","2021-04-03","2021-04-03 17:03:10");
INSERT INTO kp_stock_track VALUES("165","0","256","","0","","2","1","878.00","OUT","2021-04-03","2021-04-03 17:03:19");
INSERT INTO kp_stock_track VALUES("159","0","257","","0","","2","4","94.00","OUT","2021-04-03","2021-04-03 17:07:58");
INSERT INTO kp_stock_track VALUES("165","0","258","","0","","2","5","873.00","OUT","2021-04-03","2021-04-03 17:08:38");
INSERT INTO kp_stock_track VALUES("164","0","259","","0","","2","6","68.00","OUT","2021-04-03","2021-04-03 17:21:32");
INSERT INTO kp_stock_track VALUES("180","0","260","","0","","2","4","92.00","OUT","2021-04-03","2021-04-03 18:14:11");
INSERT INTO kp_stock_track VALUES("182","0","260","","0","","2","4","71.00","OUT","2021-04-03","2021-04-03 18:14:21");
INSERT INTO kp_stock_track VALUES("5","0","260","","0","","2","3","935.00","OUT","2021-04-03","2021-04-03 18:14:33");
INSERT INTO kp_stock_track VALUES("165","0","260","","0","","2","4","869.00","OUT","2021-04-03","2021-04-03 18:14:40");
INSERT INTO kp_stock_track VALUES("206","0","260","","0","","2","1","96.00","OUT","2021-04-03","2021-04-03 18:14:58");
INSERT INTO kp_stock_track VALUES("165","0","261","","0","","2","6","863.00","OUT","2021-04-03","2021-04-03 18:16:17");
INSERT INTO kp_stock_track VALUES("162","0","263","","0","","2","1","97.00","OUT","2021-04-03","2021-04-03 18:18:32");
INSERT INTO kp_stock_track VALUES("164","0","264","","0","","2","1","67.50","OUT","2021-04-03","2021-04-03 18:19:23");
INSERT INTO kp_stock_track VALUES("206","0","265","","0","","2","1","95.00","OUT","2021-04-03","2021-04-03 18:28:40");
INSERT INTO kp_stock_track VALUES("5","0","266","","0","","2","2","933.00","OUT","2021-04-03","2021-04-03 18:43:41");
INSERT INTO kp_stock_track VALUES("5","0","267","","0","","2","14","919.00","OUT","2021-04-03","2021-04-03 18:49:52");
INSERT INTO kp_stock_track VALUES("179","0","268","","0","","2","1","87.00","OUT","2021-04-05","2021-04-05 09:02:13");
INSERT INTO kp_stock_track VALUES("187","0","269","","0","","2","1","93.00","OUT","2021-04-05","2021-04-05 09:06:26");
INSERT INTO kp_stock_track VALUES("152","0","270","","0","","2","1","98.00","OUT","2021-04-05","2021-04-05 10:43:57");
INSERT INTO kp_stock_track VALUES("228","0","271","","0","","2","1","98.00","OUT","2021-04-05","2021-04-05 10:58:54");
INSERT INTO kp_stock_track VALUES("188","0","272","","0","","2","1","98.50","OUT","2021-04-05","2021-04-05 11:09:39");
INSERT INTO kp_stock_track VALUES("205","0","273","","0","","2","1","94.00","OUT","2021-04-05","2021-04-05 11:11:52");
INSERT INTO kp_stock_track VALUES("154","0","275","","0","","2","1","98.00","OUT","2021-04-05","2021-04-05 11:55:23");
INSERT INTO kp_stock_track VALUES("219","0","276","","0","","2","3","90.00","OUT","2021-04-05","2021-04-05 12:10:49");
INSERT INTO kp_stock_track VALUES("154","0","277","","0","","2","1","97.00","OUT","2021-04-05","2021-04-05 12:21:47");
INSERT INTO kp_stock_track VALUES("160","0","278","","0","","2","1","96.00","OUT","2021-04-05","2021-04-05 12:46:59");
INSERT INTO kp_stock_track VALUES("236","0","278","","0","","2","1","97.00","OUT","2021-04-05","2021-04-05 12:47:06");
INSERT INTO kp_stock_track VALUES("8","0","278","","0","","2","1","989.50","OUT","2021-04-05","2021-04-05 12:47:32");
INSERT INTO kp_stock_track VALUES("179","0","278","","0","","2","1","85.50","OUT","2021-04-05","2021-04-05 12:47:42");
INSERT INTO kp_stock_track VALUES("9","0","278","","0","","2","1","995.50","OUT","2021-04-05","2021-04-05 12:48:09");
INSERT INTO kp_stock_track VALUES("14","0","278","","0","","2","1","997.50","OUT","2021-04-05","2021-04-05 12:48:39");
INSERT INTO kp_stock_track VALUES("157","0","278","","0","","2","1","83.00","OUT","2021-04-05","2021-04-05 12:49:14");
INSERT INTO kp_stock_track VALUES("145","0","278","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 12:49:26");
INSERT INTO kp_stock_track VALUES("58","0","278","","0","","2","3","996.00","OUT","2021-04-05","2021-04-05 12:49:36");
INSERT INTO kp_stock_track VALUES("169","0","278","","0","","2","1","95.00","OUT","2021-04-05","2021-04-05 12:49:52");
INSERT INTO kp_stock_track VALUES("139","0","278","","0","","2","1","995.00","OUT","2021-04-05","2021-04-05 12:50:01");
INSERT INTO kp_stock_track VALUES("138","0","278","","0","","2","1","995.50","OUT","2021-04-05","2021-04-05 12:50:26");
INSERT INTO kp_stock_track VALUES("238","0","278","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 12:51:05");
INSERT INTO kp_stock_track VALUES("176","0","278","","0","","2","2","85.00","OUT","2021-04-05","2021-04-05 12:52:03");
INSERT INTO kp_stock_track VALUES("83","0","278","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 12:52:45");
INSERT INTO kp_stock_track VALUES("84","0","278","","0","","2","1","994.00","OUT","2021-04-05","2021-04-05 12:52:54");
INSERT INTO kp_stock_track VALUES("121","0","278","","0","","2","1","998.00","OUT","2021-04-05","2021-04-05 12:53:14");
INSERT INTO kp_stock_track VALUES("123","0","278","","0","","2","1","999.00","OUT","2021-04-05","2021-04-05 12:53:23");
INSERT INTO kp_stock_track VALUES("201","0","278","","0","","2","1","97.00","OUT","2021-04-05","2021-04-05 12:53:35");
INSERT INTO kp_stock_track VALUES("54","0","278","","0","","2","1","999.00","OUT","2021-04-05","2021-04-05 12:53:50");
INSERT INTO kp_stock_track VALUES("205","0","278","","0","","2","4","90.00","OUT","2021-04-05","2021-04-05 12:54:06");
INSERT INTO kp_stock_track VALUES("118","0","278","","0","","2","1","996.00","OUT","2021-04-05","2021-04-05 12:54:31");
INSERT INTO kp_stock_track VALUES("62","0","278","","0","","2","2","994.00","OUT","2021-04-05","2021-04-05 12:55:15");
INSERT INTO kp_stock_track VALUES("75","0","278","","0","","2","2","995.00","OUT","2021-04-05","2021-04-05 12:55:24");
INSERT INTO kp_stock_track VALUES("68","0","278","","0","","2","3","991.00","OUT","2021-04-05","2021-04-05 12:55:43");
INSERT INTO kp_stock_track VALUES("135","0","278","","0","","2","1","998.00","OUT","2021-04-05","2021-04-05 12:56:12");
INSERT INTO kp_stock_track VALUES("33","0","278","","0","","2","1","994.00","OUT","2021-04-05","2021-04-05 12:56:32");
INSERT INTO kp_stock_track VALUES("32","0","278","","0","","2","1","995.00","OUT","2021-04-05","2021-04-05 12:56:41");
INSERT INTO kp_stock_track VALUES("167","0","278","","0","","2","3","94.00","OUT","2021-04-05","2021-04-05 12:56:54");
INSERT INTO kp_stock_track VALUES("225","0","278","","0","","2","1","98.00","OUT","2021-04-05","2021-04-05 12:57:04");
INSERT INTO kp_stock_track VALUES("82","0","278","","0","","2","2","998.00","OUT","2021-04-05","2021-04-05 12:58:22");
INSERT INTO kp_stock_track VALUES("194","0","278","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 12:58:31");
INSERT INTO kp_stock_track VALUES("136","0","278","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 12:58:41");
INSERT INTO kp_stock_track VALUES("141","0","278","","0","","2","1","995.50","OUT","2021-04-05","2021-04-05 12:59:10");
INSERT INTO kp_stock_track VALUES("166","0","278","","0","","2","2","95.00","OUT","2021-04-05","2021-04-05 12:59:53");
INSERT INTO kp_stock_track VALUES("77","0","278","","0","","2","1","993.50","OUT","2021-04-05","2021-04-05 13:00:21");
INSERT INTO kp_stock_track VALUES("37","0","278","","0","","2","1","993.00","OUT","2021-04-05","2021-04-05 13:02:54");
INSERT INTO kp_stock_track VALUES("216","0","278","","0","","2","1","97.00","OUT","2021-04-05","2021-04-05 13:03:04");
INSERT INTO kp_stock_track VALUES("165","0","279","","0","","2","4","859.00","OUT","2021-04-05","2021-04-05 13:14:42");
INSERT INTO kp_stock_track VALUES("239","0","279","","0","","2","4","96.00","OUT","2021-04-05","2021-04-05 13:18:06");
INSERT INTO kp_stock_track VALUES("196","0","280","","0","","2","1","83.00","OUT","2021-04-05","2021-04-05 13:42:05");
INSERT INTO kp_stock_track VALUES("27","0","282","","0","","2","1","998.00","OUT","2021-04-05","2021-04-05 14:16:03");
INSERT INTO kp_stock_track VALUES("167","0","282","","0","","2","1","93.00","OUT","2021-04-05","2021-04-05 14:16:17");
INSERT INTO kp_stock_track VALUES("121","0","283","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 14:33:50");
INSERT INTO kp_stock_track VALUES("165","0","284","","0","","2","2","857.00","OUT","2021-04-05","2021-04-05 15:05:26");
INSERT INTO kp_stock_track VALUES("188","0","285","","0","","2","1","97.00","OUT","2021-04-05","2021-04-05 15:12:04");
INSERT INTO kp_stock_track VALUES("182","0","286","","0","","2","2","69.00","OUT","2021-04-05","2021-04-05 15:13:01");
INSERT INTO kp_stock_track VALUES("164","0","286","","0","","2","1","67.50","OUT","2021-04-05","2021-04-05 15:13:12");
INSERT INTO kp_stock_track VALUES("250","0","286","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 15:14:27");
INSERT INTO kp_stock_track VALUES("14","0","287","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 15:18:15");
INSERT INTO kp_stock_track VALUES("10","0","287","","0","","2","1","991.00","OUT","2021-04-05","2021-04-05 15:18:39");
INSERT INTO kp_stock_track VALUES("170","0","288","","0","","2","1","72.00","OUT","2021-04-05","2021-04-05 15:26:59");
INSERT INTO kp_stock_track VALUES("251","0","290","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 15:32:27");
INSERT INTO kp_stock_track VALUES("14","0","291","","0","","2","1","996.00","OUT","2021-04-05","2021-04-05 15:33:58");
INSERT INTO kp_stock_track VALUES("14","0","292","","0","","2","1","995.00","OUT","2021-04-05","2021-04-05 15:35:23");
INSERT INTO kp_stock_track VALUES("168","0","293","","0","","2","1","93.00","OUT","2021-04-05","2021-04-05 15:43:35");
INSERT INTO kp_stock_track VALUES("32","0","293","","0","","2","1","994.00","OUT","2021-04-05","2021-04-05 15:43:55");
INSERT INTO kp_stock_track VALUES("139","0","294","","0","","2","1","994.00","OUT","2021-04-05","2021-04-05 15:46:19");
INSERT INTO kp_stock_track VALUES("5","0","295","","0","","2","2","917.00","OUT","2021-04-05","2021-04-05 15:47:04");
INSERT INTO kp_stock_track VALUES("91","0","295","","0","","2","3","997.00","OUT","2021-04-05","2021-04-05 15:47:57");
INSERT INTO kp_stock_track VALUES("69","0","296","","0","","2","2","998.00","OUT","2021-04-05","2021-04-05 16:07:29");
INSERT INTO kp_stock_track VALUES("201","0","297","","0","","2","1","96.00","OUT","2021-04-05","2021-04-05 16:13:40");
INSERT INTO kp_stock_track VALUES("179","0","298","","0","","2","1","85.00","OUT","2021-04-05","2021-04-05 16:23:03");
INSERT INTO kp_stock_track VALUES("39","0","299","","0","","2","1","997.00","OUT","2021-04-05","2021-04-05 16:35:41");
INSERT INTO kp_stock_track VALUES("37","0","299","","0","","2","1","992.00","OUT","2021-04-05","2021-04-05 16:40:57");
INSERT INTO kp_stock_track VALUES("85","0","299","","0","","2","1","998.00","OUT","2021-04-05","2021-04-05 16:41:22");
INSERT INTO kp_stock_track VALUES("5","0","300","","0","","2","1","916.00","OUT","2021-04-05","2021-04-05 18:06:57");
INSERT INTO kp_stock_track VALUES("165","0","300","","0","","2","1","856.00","OUT","2021-04-05","2021-04-05 18:07:07");
INSERT INTO kp_stock_track VALUES("92","0","301","","0","","2","1","999.00","OUT","2021-04-05","2021-04-05 18:08:34");
INSERT INTO kp_stock_track VALUES("234","0","302","","0","","2","1","99.50","OUT","2021-04-05","2021-04-05 18:11:17");
INSERT INTO kp_stock_track VALUES("165","0","302","","0","","2","3","853.00","OUT","2021-04-05","2021-04-05 18:13:13");
INSERT INTO kp_stock_track VALUES("252","0","302","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 18:13:22");
INSERT INTO kp_stock_track VALUES("77","0","302","","0","","2","1","993.00","OUT","2021-04-05","2021-04-05 18:13:30");
INSERT INTO kp_stock_track VALUES("238","0","302","","0","","2","1","98.00","OUT","2021-04-05","2021-04-05 18:16:47");
INSERT INTO kp_stock_track VALUES("170","0","304","","0","","2","1","71.50","OUT","2021-04-05","2021-04-05 18:18:38");
INSERT INTO kp_stock_track VALUES("165","0","305","","0","","2","1","852.00","OUT","2021-04-05","2021-04-05 18:19:21");
INSERT INTO kp_stock_track VALUES("165","0","306","","0","","2","5","847.00","OUT","2021-04-05","2021-04-05 18:24:46");
INSERT INTO kp_stock_track VALUES("14","0","307","","0","","2","1","994.00","OUT","2021-04-05","2021-04-05 18:36:16");
INSERT INTO kp_stock_track VALUES("172","0","308","","0","","2","1","96.00","OUT","2021-04-05","2021-04-05 18:40:17");
INSERT INTO kp_stock_track VALUES("253","0","310","","0","","2","1","99.00","OUT","2021-04-05","2021-04-05 18:44:11");
INSERT INTO kp_stock_track VALUES("205","0","311","","0","","2","2","88.00","OUT","2021-04-05","2021-04-05 18:48:16");
INSERT INTO kp_stock_track VALUES("5","0","312","","0","","2","1","915.00","OUT","2021-04-05","2021-04-05 18:53:27");
INSERT INTO kp_stock_track VALUES("141","0","313","","0","","2","1","995.50","OUT","2021-04-06","2021-04-06 08:24:56");
INSERT INTO kp_stock_track VALUES("233","0","314","","0","","2","1","97.50","OUT","2021-04-06","2021-04-06 08:29:15");
INSERT INTO kp_stock_track VALUES("23","0","314","","0","","2","1","982.00","OUT","2021-04-06","2021-04-06 08:29:27");
INSERT INTO kp_stock_track VALUES("5","0","315","","0","","2","1","914.00","OUT","2021-04-06","2021-04-06 08:48:30");
INSERT INTO kp_stock_track VALUES("186","0","316","","0","","2","1","79.00","OUT","2021-04-06","2021-04-06 08:52:53");
INSERT INTO kp_stock_track VALUES("5","0","317","","0","","2","18","896.00","OUT","2021-04-06","2021-04-06 09:35:01");
INSERT INTO kp_stock_track VALUES("203","0","318","","0","","2","1","89.00","OUT","2021-04-06","2021-04-06 09:45:51");
INSERT INTO kp_stock_track VALUES("165","0","319","","0","","2","5","841.00","OUT","2021-04-06","2021-04-06 11:31:28");
INSERT INTO kp_stock_track VALUES("14","0","320","","0","","2","1","993.00","OUT","2021-04-06","2021-04-06 13:19:45");
INSERT INTO kp_stock_track VALUES("18","0","321","","0","","2","4","996.00","OUT","2021-04-06","2021-04-06 15:03:51");
INSERT INTO kp_stock_track VALUES("12","0","321","","0","","2","5","995.00","OUT","2021-04-06","2021-04-06 15:04:19");
INSERT INTO kp_stock_track VALUES("242","0","321","","0","","2","5","95.00","OUT","2021-04-06","2021-04-06 15:04:40");
INSERT INTO kp_stock_track VALUES("243","0","321","","0","","2","4","96.00","OUT","2021-04-06","2021-04-06 15:07:08");
INSERT INTO kp_stock_track VALUES("254","0","321","","0","","2","4","96.00","OUT","2021-04-06","2021-04-06 15:09:10");
INSERT INTO kp_stock_track VALUES("5","0","321","","0","","2","7","889.00","OUT","2021-04-06","2021-04-06 15:09:40");
INSERT INTO kp_stock_track VALUES("253","0","321","","0","","2","4","95.00","OUT","2021-04-06","2021-04-06 15:10:46");
INSERT INTO kp_stock_track VALUES("161","0","323","","0","","2","1","99.00","OUT","2021-04-06","2021-04-06 16:03:53");
INSERT INTO kp_stock_track VALUES("233","0","324","","0","","2","1","97.00","OUT","2021-04-06","2021-04-06 16:27:40");
INSERT INTO kp_stock_track VALUES("255","0","326","","0","","2","1","99.00","OUT","2021-04-06","2021-04-06 17:08:16");
INSERT INTO kp_stock_track VALUES("62","0","326","","0","","2","1","993.00","OUT","2021-04-06","2021-04-06 17:08:32");
INSERT INTO kp_stock_track VALUES("68","0","326","","0","","2","1","990.00","OUT","2021-04-06","2021-04-06 17:08:42");
INSERT INTO kp_stock_track VALUES("73","0","326","","0","","2","1","999.00","OUT","2021-04-06","2021-04-06 17:08:52");
INSERT INTO kp_stock_track VALUES("67","0","326","","0","","2","1","999.50","OUT","2021-04-06","2021-04-06 17:10:11");
INSERT INTO kp_stock_track VALUES("234","0","327","","0","","2","1","99.50","OUT","2021-04-06","2021-04-06 17:20:35");
INSERT INTO kp_stock_track VALUES("141","0","328","","0","","2","1","995.50","OUT","2021-04-06","2021-04-06 17:26:17");
INSERT INTO kp_stock_track VALUES("233","0","329","","0","","2","1","96.00","OUT","2021-04-06","2021-04-06 17:43:39");
INSERT INTO kp_stock_track VALUES("255","0","329","","0","","2","1","98.00","OUT","2021-04-06","2021-04-06 17:43:49");
INSERT INTO kp_stock_track VALUES("8","0","329","","0","","2","1","989.50","OUT","2021-04-06","2021-04-06 17:44:57");
INSERT INTO kp_stock_track VALUES("260","0","331","","0","","2","2","98.00","OUT","2021-04-06","2021-04-06 17:51:14");
INSERT INTO kp_stock_track VALUES("255","0","332","","0","","2","1","97.00","OUT","2021-04-06","2021-04-06 17:52:37");
INSERT INTO kp_stock_track VALUES("165","0","333","","0","","2","2","839.00","OUT","2021-04-06","2021-04-06 17:53:02");
INSERT INTO kp_stock_track VALUES("5","0","334","","0","","2","1","888.00","OUT","2021-04-06","2021-04-06 18:00:39");
INSERT INTO kp_stock_track VALUES("27","0","335","","0","","2","1","997.00","OUT","2021-04-06","2021-04-06 18:11:46");
INSERT INTO kp_stock_track VALUES("233","0","336","","0","","2","1","95.00","OUT","2021-04-06","2021-04-06 18:13:21");
INSERT INTO kp_stock_track VALUES("5","0","337","","0","","2","5","883.00","OUT","2021-04-06","2021-04-06 18:14:48");
INSERT INTO kp_stock_track VALUES("141","0","338","","0","","2","2","994.00","OUT","2021-04-06","2021-04-06 18:23:21");
INSERT INTO kp_stock_track VALUES("141","0","339","","0","","2","2","992.00","OUT","2021-04-06","2021-04-06 18:29:18");
INSERT INTO kp_stock_track VALUES("261","0","342","","0","","2","2","98.00","OUT","2021-04-06","2021-04-06 18:39:28");
INSERT INTO kp_stock_track VALUES("165","0","343","","0","","2","1","838.00","OUT","2021-04-06","2021-04-06 18:49:00");
INSERT INTO kp_stock_track VALUES("233","0","344","","0","","2","1","94.00","OUT","2021-04-07","2021-04-07 07:58:30");
INSERT INTO kp_stock_track VALUES("141","0","344","","0","","2","1","991.50","OUT","2021-04-07","2021-04-07 07:58:44");
INSERT INTO kp_stock_track VALUES("262","0","346","","0","","2","1","99.00","OUT","2021-04-07","2021-04-07 08:59:21");
INSERT INTO kp_stock_track VALUES("136","0","347","","0","","2","1","996.00","OUT","2021-04-07","2021-04-07 09:03:17");
INSERT INTO kp_stock_track VALUES("165","0","348","","0","","2","4","834.00","OUT","2021-04-07","2021-04-07 09:34:23");
INSERT INTO kp_stock_track VALUES("154","0","349","","0","","2","1","96.00","OUT","2021-04-07","2021-04-07 09:42:44");
INSERT INTO kp_stock_track VALUES("144","0","350","","0","","2","1","997.50","OUT","2021-04-07","2021-04-07 09:44:02");
INSERT INTO kp_stock_track VALUES("8","0","351","","0","","2","1","989.00","OUT","2021-04-07","2021-04-07 09:59:31");
INSERT INTO kp_stock_track VALUES("165","0","355","","0","","2","5","829.00","OUT","2021-04-07","2021-04-07 13:05:51");
INSERT INTO kp_stock_track VALUES("205","0","355","","0","","2","3","85.00","OUT","2021-04-07","2021-04-07 13:06:31");
INSERT INTO kp_stock_track VALUES("236","0","356","","0","","2","1","96.00","OUT","2021-04-07","2021-04-07 13:10:48");
INSERT INTO kp_stock_track VALUES("188","0","357","","0","","2","1","96.00","OUT","2021-04-07","2021-04-07 14:40:17");
INSERT INTO kp_stock_track VALUES("255","0","358","","0","","2","1","96.00","OUT","2021-04-07","2021-04-07 15:24:34");
INSERT INTO kp_stock_track VALUES("166","0","358","","0","","2","1","94.00","OUT","2021-04-07","2021-04-07 15:25:30");
INSERT INTO kp_stock_track VALUES("37","0","358","","0","","2","1","991.00","OUT","2021-04-07","2021-04-07 15:25:44");
INSERT INTO kp_stock_track VALUES("23","0","358","","0","","2","1","981.00","OUT","2021-04-07","2021-04-07 15:26:09");
INSERT INTO kp_stock_track VALUES("259","0","360","","0","","2","1","99.00","OUT","2021-04-07","2021-04-07 15:38:16");
INSERT INTO kp_stock_track VALUES("170","0","361","","0","","2","1","71.00","OUT","2021-04-07","2021-04-07 16:01:32");
INSERT INTO kp_stock_track VALUES("180","0","362","","0","","2","2","90.00","OUT","2021-04-07","2021-04-07 16:13:18");
INSERT INTO kp_stock_track VALUES("165","0","363","","0","","2","1","828.00","OUT","2021-04-07","2021-04-07 16:45:56");
INSERT INTO kp_stock_track VALUES("5","0","363","","0","","2","2","881.00","OUT","2021-04-07","2021-04-07 16:46:16");
INSERT INTO kp_stock_track VALUES("182","0","363","","0","","2","1","68.00","OUT","2021-04-07","2021-04-07 16:46:56");
INSERT INTO kp_stock_track VALUES("180","0","363","","0","","2","2","88.00","OUT","2021-04-07","2021-04-07 16:47:43");
INSERT INTO kp_stock_track VALUES("137","0","363","","0","","2","1","997.00","OUT","2021-04-07","2021-04-07 16:49:58");
INSERT INTO kp_stock_track VALUES("189","0","363","","0","","2","1","93.00","OUT","2021-04-07","2021-04-07 16:54:17");
INSERT INTO kp_stock_track VALUES("75","0","364","","0","","2","1","994.00","OUT","2021-04-07","2021-04-07 16:59:27");
INSERT INTO kp_stock_track VALUES("74","0","364","","0","","2","1","999.00","OUT","2021-04-07","2021-04-07 17:03:01");
INSERT INTO kp_stock_track VALUES("73","0","364","","0","","2","1","998.00","OUT","2021-04-07","2021-04-07 17:03:12");
INSERT INTO kp_stock_track VALUES("255","0","364","","0","","2","1","95.00","OUT","2021-04-07","2021-04-07 17:04:29");
INSERT INTO kp_stock_track VALUES("37","0","365","","0","","2","1","990.00","OUT","2021-04-07","2021-04-07 17:12:07");
INSERT INTO kp_stock_track VALUES("5","0","366","","0","","2","1","880.00","OUT","2021-04-07","2021-04-07 17:37:43");
INSERT INTO kp_stock_track VALUES("187","0","367","","0","","2","1","92.00","OUT","2021-04-07","2021-04-07 17:38:25");
INSERT INTO kp_stock_track VALUES("208","0","368","","0","","2","1","92.00","OUT","2021-04-07","2021-04-07 17:42:34");
INSERT INTO kp_stock_track VALUES("176","0","368","","0","","2","1","84.00","OUT","2021-04-07","2021-04-07 17:43:35");
INSERT INTO kp_stock_track VALUES("5","0","369","","0","","2","2","878.00","OUT","2021-04-07","2021-04-07 17:54:48");
INSERT INTO kp_stock_track VALUES("141","0","370","","0","","2","4","988.00","OUT","2021-04-07","2021-04-07 18:15:32");
INSERT INTO kp_stock_track VALUES("234","0","371","","0","","2","1","99.00","OUT","2021-04-07","2021-04-07 18:19:11");
INSERT INTO kp_stock_track VALUES("141","0","372","","0","","2","0","987.75","OUT","2021-04-07","2021-04-07 18:22:07");
INSERT INTO kp_stock_track VALUES("5","0","373","","0","","2","4","874.00","OUT","2021-04-07","2021-04-07 18:23:16");
INSERT INTO kp_stock_track VALUES("253","0","374","","0","","2","1","94.50","OUT","2021-04-07","2021-04-07 18:26:24");
INSERT INTO kp_stock_track VALUES("165","0","374","","0","","2","2","826.00","OUT","2021-04-07","2021-04-07 18:26:37");
INSERT INTO kp_stock_track VALUES("23","0","375","","0","","2","1","980.00","OUT","2021-04-07","2021-04-07 18:35:10");
INSERT INTO kp_stock_track VALUES("194","0","376","","0","","2","1","98.00","OUT","2021-04-08","2021-04-08 08:14:40");
INSERT INTO kp_stock_track VALUES("62","0","377","","0","","2","1","992.00","OUT","2021-04-08","2021-04-08 08:37:35");
INSERT INTO kp_stock_track VALUES("178","0","377","","0","","2","1","90.00","OUT","2021-04-08","2021-04-08 08:37:43");
INSERT INTO kp_stock_track VALUES("66","0","378","","0","","2","1","999.00","OUT","2021-04-08","2021-04-08 08:41:21");
INSERT INTO kp_stock_track VALUES("8","0","379","","0","","2","1","988.00","OUT","0000-00-00","2021-04-08 12:39:16");
INSERT INTO kp_stock_track VALUES("179","0","379","","0","","2","1","84.00","OUT","0000-00-00","2021-04-08 12:40:11");
INSERT INTO kp_stock_track VALUES("135","0","379","","0","","2","1","997.00","OUT","0000-00-00","2021-04-08 12:41:04");
INSERT INTO kp_stock_track VALUES("136","0","379","","0","","2","1","995.00","OUT","0000-00-00","2021-04-08 12:44:16");
INSERT INTO kp_stock_track VALUES("119","0","379","","0","","2","1","998.00","OUT","0000-00-00","2021-04-08 12:46:00");
INSERT INTO kp_stock_track VALUES("236","0","380","","0","","2","1","95.00","OUT","0000-00-00","2021-04-08 13:18:17");
INSERT INTO kp_stock_track VALUES("165","0","381","","0","","2","1","825.50","OUT","2021-04-08","2021-04-08 13:20:17");
INSERT INTO kp_stock_track VALUES("23","0","385","","0","","2","1","979.00","OUT","2021-04-08","2021-04-08 14:27:18");
INSERT INTO kp_stock_track VALUES("121","0","386","","0","","2","1","996.00","OUT","2021-04-08","2021-04-08 15:10:28");
INSERT INTO kp_stock_track VALUES("218","0","387","","0","","2","1","98.00","OUT","2021-04-08","2021-04-08 15:16:47");
INSERT INTO kp_stock_track VALUES("23","0","388","","0","","2","1","978.00","OUT","2021-04-08","2021-04-08 15:35:00");
INSERT INTO kp_stock_track VALUES("170","0","389","","0","","2","1","70.00","OUT","2021-04-08","2021-04-08 15:35:48");
INSERT INTO kp_stock_track VALUES("219","0","390","","0","","2","1","89.00","OUT","2021-04-08","2021-04-08 15:48:07");
INSERT INTO kp_stock_track VALUES("176","0","391","","0","","2","1","83.00","OUT","2021-04-08","2021-04-08 15:54:07");
INSERT INTO kp_stock_track VALUES("173","0","391","","0","","2","1","95.00","OUT","2021-04-08","2021-04-08 15:54:17");
INSERT INTO kp_stock_track VALUES("165","0","391","","0","","2","2","824.00","OUT","2021-04-08","2021-04-08 15:54:27");
INSERT INTO kp_stock_track VALUES("236","0","392","","0","","2","1","94.00","OUT","2021-04-08","2021-04-08 15:59:28");
INSERT INTO kp_stock_track VALUES("258","0","393","","0","","2","1","99.00","OUT","2021-04-08","2021-04-08 16:36:09");
INSERT INTO kp_stock_track VALUES("170","0","394","","0","","2","1","69.50","OUT","0000-00-00","2021-04-08 17:27:19");
INSERT INTO kp_stock_track VALUES("196","0","395","","0","","2","1","82.00","OUT","2021-04-08","2021-04-08 17:34:07");
INSERT INTO kp_stock_track VALUES("165","0","395","","0","","2","1","823.00","OUT","2021-04-08","2021-04-08 17:34:32");
INSERT INTO kp_stock_track VALUES("263","0","395","","0","","2","1","99.00","OUT","2021-04-08","2021-04-08 17:36:59");
INSERT INTO kp_stock_track VALUES("66","0","395","","0","","2","1","998.00","OUT","2021-04-08","2021-04-08 17:37:24");
INSERT INTO kp_stock_track VALUES("224","0","395","","0","","2","1","94.00","OUT","2021-04-08","2021-04-08 17:37:34");
INSERT INTO kp_stock_track VALUES("178","0","396","","0","","2","1","89.00","OUT","0000-00-00","2021-04-08 17:38:58");
INSERT INTO kp_stock_track VALUES("179","0","397","","0","","2","1","83.50","OUT","0000-00-00","2021-04-08 17:45:28");
INSERT INTO kp_stock_track VALUES("251","0","398","","0","","2","1","98.00","OUT","0000-00-00","2021-04-08 17:46:30");
INSERT INTO kp_stock_track VALUES("138","0","399","","0","","2","1","995.00","OUT","2021-04-08","2021-04-08 17:49:11");
INSERT INTO kp_stock_track VALUES("5","0","400","","0","","2","2","872.00","OUT","2021-04-08","2021-04-08 17:50:59");
INSERT INTO kp_stock_track VALUES("5","0","401","","0","","2","2","870.00","OUT","2021-04-08","2021-04-08 17:51:26");
INSERT INTO kp_stock_track VALUES("5","0","402","","0","","2","1","869.00","OUT","2021-04-08","2021-04-08 17:53:03");
INSERT INTO kp_stock_track VALUES("5","0","403","","0","","2","1","868.00","OUT","2021-04-08","2021-04-08 17:53:56");
INSERT INTO kp_stock_track VALUES("178","0","404","","0","","2","1","88.00","OUT","2021-04-08","2021-04-08 18:00:13");
INSERT INTO kp_stock_track VALUES("254","0","405","","0","","2","1","95.00","OUT","2021-04-08","2021-04-08 18:05:57");
INSERT INTO kp_stock_track VALUES("5","0","405","","0","","2","1","867.00","OUT","2021-04-08","2021-04-08 18:06:03");
INSERT INTO kp_stock_track VALUES("27","0","406","","0","","2","1","996.00","OUT","2021-04-08","2021-04-08 18:06:39");
INSERT INTO kp_stock_track VALUES("5","0","407","","0","","2","1","866.50","OUT","2021-04-08","2021-04-08 18:19:05");
INSERT INTO kp_stock_track VALUES("264","0","407","","0","","2","3","97.00","OUT","2021-04-08","2021-04-08 18:20:25");
INSERT INTO kp_stock_track VALUES("23","0","408","","0","","2","1","977.00","OUT","2021-04-08","2021-04-08 18:21:50");
INSERT INTO kp_stock_track VALUES("265","0","410","","0","","2","1","99.00","OUT","2021-04-08","2021-04-08 18:25:28");
INSERT INTO kp_stock_track VALUES("5","0","411","","0","","2","2","864.00","OUT","2021-04-08","2021-04-08 18:26:35");
INSERT INTO kp_stock_track VALUES("219","0","412","","0","","2","2","87.00","OUT","2021-04-08","2021-04-08 18:27:47");
INSERT INTO kp_stock_track VALUES("266","0","414","","0","","2","1","99.00","OUT","2021-04-08","2021-04-08 18:29:34");
INSERT INTO kp_stock_track VALUES("165","0","415","","0","","2","2","821.50","OUT","2021-04-08","2021-04-08 18:30:38");
INSERT INTO kp_stock_track VALUES("164","0","414","","0","","2","2","66.00","OUT","2021-04-08","2021-04-08 18:31:02");
INSERT INTO kp_stock_track VALUES("179","0","416","","0","","2","1","83.50","OUT","2021-04-08","2021-04-08 18:46:04");
INSERT INTO kp_stock_track VALUES("170","0","417","","0","","2","1","69.50","OUT","2021-04-08","2021-04-08 18:51:01");
INSERT INTO kp_stock_track VALUES("101","0","418","","0","","2","1","999.00","OUT","2021-04-09","2021-04-09 08:00:42");
INSERT INTO kp_stock_track VALUES("165","0","419","","0","","2","0","821.75","OUT","2021-04-09","2021-04-09 08:08:55");
INSERT INTO kp_stock_track VALUES("267","0","421","","0","","2","1","99.00","OUT","2021-04-09","2021-04-09 08:26:49");
INSERT INTO kp_stock_track VALUES("178","0","423","","0","","2","2","86.00","OUT","2021-04-09","2021-04-09 09:19:43");
INSERT INTO kp_stock_track VALUES("164","0","424","","0","","2","10","56.00","OUT","2021-04-09","2021-04-09 09:40:48");
INSERT INTO kp_stock_track VALUES("33","0","425","","0","","2","1","993.00","OUT","2021-04-09","2021-04-09 09:51:10");
INSERT INTO kp_stock_track VALUES("200","0","425","","0","","2","1","96.00","OUT","2021-04-09","2021-04-09 09:51:31");
INSERT INTO kp_stock_track VALUES("46","0","425","","0","","2","1","999.00","OUT","2021-04-09","2021-04-09 09:51:48");
INSERT INTO kp_stock_track VALUES("37","0","425","","0","","2","1","989.00","OUT","2021-04-09","2021-04-09 09:51:56");
INSERT INTO kp_stock_track VALUES("135","0","425","","0","","2","1","996.00","OUT","2021-04-09","2021-04-09 09:52:10");
INSERT INTO kp_stock_track VALUES("166","0","427","","0","","2","2","92.00","OUT","2021-04-09","2021-04-09 11:07:30");
INSERT INTO kp_stock_track VALUES("203","0","427","","0","","2","2","87.00","OUT","2021-04-09","2021-04-09 11:07:54");
INSERT INTO kp_stock_track VALUES("244","0","429","","0","","2","1","99.50","OUT","2021-04-09","2021-04-09 11:32:36");
INSERT INTO kp_stock_track VALUES("119","0","429","","0","","2","1","997.00","OUT","2021-04-09","2021-04-09 11:33:03");
INSERT INTO kp_stock_track VALUES("38","0","429","","0","","2","2","997.00","OUT","2021-04-09","2021-04-09 11:33:32");
INSERT INTO kp_stock_track VALUES("178","0","431","","0","","2","2","84.00","OUT","2021-04-09","2021-04-09 11:42:36");
INSERT INTO kp_stock_track VALUES("165","0","432","","0","","2","3","819.00","OUT","2021-04-09","2021-04-09 12:07:32");
INSERT INTO kp_stock_track VALUES("163","0","434","","0","","2","2","96.00","OUT","2021-04-09","2021-04-09 12:45:23");
INSERT INTO kp_stock_track VALUES("206","0","434","","0","","2","2","93.00","OUT","2021-04-09","2021-04-09 12:47:48");
INSERT INTO kp_stock_track VALUES("178","0","434","","0","","2","1","83.00","OUT","2021-04-09","2021-04-09 12:49:20");
INSERT INTO kp_stock_track VALUES("205","0","435","","0","","2","1","84.00","OUT","2021-04-09","2021-04-09 13:58:32");
INSERT INTO kp_stock_track VALUES("186","0","438","","0","","2","1","78.00","OUT","2021-04-09","2021-04-09 16:25:43");
INSERT INTO kp_stock_track VALUES("170","0","439","","0","","2","1","69.00","OUT","2021-04-09","2021-04-09 16:44:32");
INSERT INTO kp_stock_track VALUES("23","0","440","","0","","2","1","976.00","OUT","2021-04-09","2021-04-09 16:51:12");
INSERT INTO kp_stock_track VALUES("154","0","441","","0","","2","1","95.00","OUT","2021-04-09","2021-04-09 16:57:39");
INSERT INTO kp_stock_track VALUES("268","0","442","","0","","2","1","99.00","OUT","2021-04-09","2021-04-09 17:02:26");
INSERT INTO kp_stock_track VALUES("176","0","443","","0","","2","1","82.00","OUT","2021-04-09","2021-04-09 17:20:37");
INSERT INTO kp_stock_track VALUES("154","0","444","","0","","2","1","94.00","OUT","2021-04-09","2021-04-09 17:26:01");
INSERT INTO kp_stock_track VALUES("270","0","445","","0","","2","0","99.75","OUT","2021-04-09","2021-04-09 17:27:15");
INSERT INTO kp_stock_track VALUES("170","0","446","","0","","2","2","67.00","OUT","2021-04-09","2021-04-09 17:30:03");
INSERT INTO kp_stock_track VALUES("187","0","446","","0","","2","2","90.00","OUT","2021-04-09","2021-04-09 17:30:17");
INSERT INTO kp_stock_track VALUES("82","0","447","","0","","2","3","995.00","OUT","2021-04-09","2021-04-09 17:35:48");
INSERT INTO kp_stock_track VALUES("176","0","447","","0","","2","2","80.50","OUT","2021-04-09","2021-04-09 17:35:56");
INSERT INTO kp_stock_track VALUES("166","0","447","","0","","2","2","90.00","OUT","2021-04-09","2021-04-09 17:39:01");
INSERT INTO kp_stock_track VALUES("173","0","447","","0","","2","1","94.00","OUT","2021-04-09","2021-04-09 17:40:33");
INSERT INTO kp_stock_track VALUES("271","0","447","","0","","2","1","99.00","OUT","2021-04-09","2021-04-09 17:41:39");
INSERT INTO kp_stock_track VALUES("272","0","447","","0","","2","1","99.00","OUT","2021-04-09","2021-04-09 17:46:33");
INSERT INTO kp_stock_track VALUES("181","0","447","","0","","2","2","97.00","OUT","2021-04-09","2021-04-09 17:46:46");
INSERT INTO kp_stock_track VALUES("172","0","447","","0","","2","2","94.00","OUT","2021-04-09","2021-04-09 17:47:15");
INSERT INTO kp_stock_track VALUES("141","0","449","","0","","2","0","987.75","OUT","2021-04-09","2021-04-09 17:54:17");
INSERT INTO kp_stock_track VALUES("154","0","450","","0","","2","1","93.00","OUT","2021-04-09","2021-04-09 17:59:25");
INSERT INTO kp_stock_track VALUES("253","0","450","","0","","2","1","93.00","OUT","2021-04-09","2021-04-09 17:59:34");
INSERT INTO kp_stock_track VALUES("196","0","451","","0","","2","1","81.00","OUT","2021-04-09","2021-04-09 18:15:37");
INSERT INTO kp_stock_track VALUES("5","0","452","","0","","2","1","863.50","OUT","2021-04-09","2021-04-09 18:35:19");
INSERT INTO kp_stock_track VALUES("27","0","453","","0","","2","1","995.00","OUT","2021-04-09","2021-04-09 18:44:58");
INSERT INTO kp_stock_track VALUES("273","0","455","","0","","2","2","98.00","OUT","2021-04-09","2021-04-09 18:49:39");
INSERT INTO kp_stock_track VALUES("178","0","456","","0","","2","1","82.00","OUT","2021-04-10","2021-04-10 08:15:19");
INSERT INTO kp_stock_track VALUES("178","0","458","","0","","2","1","81.00","OUT","2021-04-10","2021-04-10 09:02:10");
INSERT INTO kp_stock_track VALUES("242","0","459","","0","","2","1","94.00","OUT","2021-04-10","2021-04-10 09:30:03");
INSERT INTO kp_stock_track VALUES("274","0","461","","0","","2","2","98.00","OUT","2021-04-10","2021-04-10 09:45:23");
INSERT INTO kp_stock_track VALUES("165","0","462","","0","","2","3","816.00","OUT","2021-04-10","2021-04-10 10:13:38");
INSERT INTO kp_stock_track VALUES("5","0","462","","0","","2","5","859.00","OUT","2021-04-10","2021-04-10 10:13:49");
INSERT INTO kp_stock_track VALUES("5","0","463","","0","","2","1","858.50","OUT","2021-04-10","2021-04-10 10:18:49");
INSERT INTO kp_stock_track VALUES("273","0","465","","0","","2","1","97.00","OUT","2021-04-10","2021-04-10 16:29:36");
INSERT INTO kp_stock_track VALUES("170","0","466","","0","","2","3","64.00","OUT","2021-04-10","2021-04-10 16:44:18");
INSERT INTO kp_stock_track VALUES("165","0","468","","0","","2","3","798.00","OUT","2021-04-10","2021-04-10 16:59:40");
INSERT INTO kp_stock_track VALUES("5","0","468","","0","","2","3","855.00","OUT","2021-04-10","2021-04-10 17:00:16");
INSERT INTO kp_stock_track VALUES("193","0","468","","0","","2","1","96.00","OUT","2021-04-10","2021-04-10 17:01:02");
INSERT INTO kp_stock_track VALUES("65","0","468","","0","","2","1","994.00","OUT","2021-04-10","2021-04-10 17:02:44");
INSERT INTO kp_stock_track VALUES("77","0","469","","0","","2","1","992.00","OUT","2021-04-10","2021-04-10 17:08:53");
INSERT INTO kp_stock_track VALUES("211","0","470","","0","","2","1","97.00","OUT","2021-04-10","2021-04-10 17:11:44");
INSERT INTO kp_stock_track VALUES("269","0","471","","0","","2","1","99.00","OUT","2021-04-10","2021-04-10 17:12:23");
INSERT INTO kp_stock_track VALUES("181","0","472","","0","","2","1","96.00","OUT","2021-04-10","2021-04-10 17:23:46");
INSERT INTO kp_stock_track VALUES("170","0","473","","0","","2","1","63.50","OUT","2021-04-10","2021-04-10 17:25:09");
INSERT INTO kp_stock_track VALUES("165","0","474","","0","","2","3","795.00","OUT","2021-04-10","2021-04-10 17:47:33");
INSERT INTO kp_stock_track VALUES("164","0","475","","0","","2","2","54.00","OUT","2021-04-10","2021-04-10 17:53:48");
INSERT INTO kp_stock_track VALUES("141","0","476","","0","","2","1","987.00","OUT","2021-04-10","2021-04-10 17:58:07");
INSERT INTO kp_stock_track VALUES("259","0","477","","0","","2","1","98.00","OUT","2021-04-10","2021-04-10 18:08:26");
INSERT INTO kp_stock_track VALUES("225","0","478","","0","","2","1","97.00","OUT","2021-04-10","2021-04-10 18:14:26");
INSERT INTO kp_stock_track VALUES("269","0","479","","0","","2","1","98.00","OUT","2021-04-10","2021-04-10 18:16:29");
INSERT INTO kp_stock_track VALUES("233","0","480","","0","","2","0","93.60","OUT","2021-04-10","2021-04-10 18:27:33");
INSERT INTO kp_stock_track VALUES("265","0","480","","0","","2","1","97.50","OUT","2021-04-10","2021-04-10 18:30:51");
INSERT INTO kp_stock_track VALUES("16","0","480","","0","","2","1","999.50","OUT","2021-04-10","2021-04-10 18:31:38");
INSERT INTO kp_stock_track VALUES("165","0","481","","0","","2","2","793.00","OUT","2021-04-10","2021-04-10 18:32:04");
INSERT INTO kp_stock_track VALUES("23","0","482","","0","","2","1","975.00","OUT","2021-04-10","2021-04-10 18:33:06");
INSERT INTO kp_stock_track VALUES("164","0","482","","0","","2","2","52.00","OUT","2021-04-10","2021-04-10 18:33:18");
INSERT INTO kp_stock_track VALUES("187","0","483","","0","","2","2","88.00","OUT","2021-04-10","2021-04-10 18:56:52");
INSERT INTO kp_stock_track VALUES("32","0","484","","0","","2","1","993.00","OUT","2021-04-10","2021-04-10 18:58:22");
INSERT INTO kp_stock_track VALUES("38","0","484","","0","","2","1","996.00","OUT","2021-04-10","2021-04-10 18:58:33");
INSERT INTO kp_stock_track VALUES("39","0","484","","0","","2","1","996.00","OUT","2021-04-10","2021-04-10 18:58:47");
INSERT INTO kp_stock_track VALUES("179","0","485","","0","","2","1","83.50","OUT","2021-04-10","2021-04-10 19:01:52");
INSERT INTO kp_stock_track VALUES("239","0","486","","0","","2","3","93.00","OUT","2021-04-10","2021-04-10 19:12:14");
INSERT INTO kp_stock_track VALUES("5","0","487","","0","","2","2","853.00","OUT","2021-04-10","2021-04-10 19:16:02");
INSERT INTO kp_stock_track VALUES("165","0","487","","0","","2","1","792.00","OUT","2021-04-10","2021-04-10 19:16:10");
INSERT INTO kp_stock_track VALUES("5","0","488","","0","","2","5","848.00","OUT","2021-04-11","2021-04-11 12:00:44");
INSERT INTO kp_stock_track VALUES("189","0","488","","0","","2","2","91.00","OUT","2021-04-11","2021-04-11 12:00:57");
INSERT INTO kp_stock_track VALUES("68","0","488","","0","","2","1","989.00","OUT","2021-04-11","2021-04-11 12:01:08");
INSERT INTO kp_stock_track VALUES("251","0","489","","0","","2","1","97.00","OUT","2021-04-11","2021-04-11 12:14:56");
INSERT INTO kp_stock_track VALUES("5","0","490","","0","","2","2","846.00","OUT","2021-04-11","2021-04-11 12:43:23");
INSERT INTO kp_stock_track VALUES("268","0","491","","0","","2","1","98.00","OUT","2021-04-11","2021-04-11 13:17:35");
INSERT INTO kp_stock_track VALUES("152","0","491","","0","","2","1","97.00","OUT","2021-04-11","2021-04-11 13:17:44");
INSERT INTO kp_stock_track VALUES("5","0","492","","0","","2","1","846.00","OUT","2021-04-11","2021-04-11 13:27:00");
INSERT INTO kp_stock_track VALUES("208","0","492","","0","","2","4","88.00","OUT","2021-04-11","2021-04-11 13:27:21");
INSERT INTO kp_stock_track VALUES("33","0","492","","0","","2","1","992.00","OUT","2021-04-11","2021-04-11 13:27:31");
INSERT INTO kp_stock_track VALUES("32","0","492","","0","","2","1","992.00","OUT","2021-04-11","2021-04-11 13:27:39");
INSERT INTO kp_stock_track VALUES("152","0","492","","0","","2","1","96.00","OUT","2021-04-11","2021-04-11 13:28:04");
INSERT INTO kp_stock_track VALUES("75","0","492","","0","","2","1","993.00","OUT","2021-04-11","2021-04-11 13:29:46");
INSERT INTO kp_stock_track VALUES("68","0","492","","0","","2","1","988.00","OUT","2021-04-11","2021-04-11 13:30:05");
INSERT INTO kp_stock_track VALUES("62","0","492","","0","","2","1","991.00","OUT","2021-04-11","2021-04-11 13:30:21");
INSERT INTO kp_stock_track VALUES("181","0","493","","0","","2","1","95.00","OUT","2021-04-11","2021-04-11 13:33:21");
INSERT INTO kp_stock_track VALUES("180","0","493","","0","","2","1","87.00","OUT","2021-04-11","2021-04-11 13:33:45");
INSERT INTO kp_stock_track VALUES("5","0","493","","0","","2","1","845.00","OUT","2021-04-11","2021-04-11 13:33:52");
INSERT INTO kp_stock_track VALUES("176","0","492","","0","","2","1","79.00","OUT","2021-04-11","2021-04-11 13:35:37");
INSERT INTO kp_stock_track VALUES("139","0","492","","0","","2","1","993.00","OUT","2021-04-11","2021-04-11 13:35:49");
INSERT INTO kp_stock_track VALUES("138","0","492","","0","","2","1","994.50","OUT","2021-04-11","2021-04-11 13:50:10");
INSERT INTO kp_stock_track VALUES("188","0","492","","0","","2","1","95.50","OUT","2021-04-11","2021-04-11 13:57:46");
INSERT INTO kp_stock_track VALUES("84","0","492","","0","","2","1","993.00","OUT","2021-04-11","2021-04-11 13:58:25");
INSERT INTO kp_stock_track VALUES("269","0","492","","0","","2","2","96.00","OUT","2021-04-11","2021-04-11 13:58:43");
INSERT INTO kp_stock_track VALUES("220","0","492","","0","","2","1","99.00","OUT","2021-04-11","2021-04-11 13:59:02");
INSERT INTO kp_stock_track VALUES("46","0","492","","0","","2","1","998.00","OUT","2021-04-11","2021-04-11 13:59:37");
INSERT INTO kp_stock_track VALUES("200","0","492","","0","","2","1","95.00","OUT","2021-04-11","2021-04-11 13:59:47");
INSERT INTO kp_stock_track VALUES("179","0","492","","0","","2","1","83.50","OUT","2021-04-11","2021-04-11 14:00:06");
INSERT INTO kp_stock_track VALUES("165","0","492","","0","","2","19","773.00","OUT","2021-04-11","2021-04-11 14:29:52");
INSERT INTO kp_stock_track VALUES("251","0","492","","0","","2","1","96.00","OUT","2021-04-11","2021-04-11 14:30:36");
INSERT INTO kp_stock_track VALUES("258","0","492","","0","","2","1","98.00","OUT","2021-04-11","2021-04-11 14:32:21");
INSERT INTO kp_stock_track VALUES("244","0","495","","0","","2","1","99.50","OUT","2021-04-11","2021-04-11 14:49:16");
INSERT INTO kp_stock_track VALUES("249","0","495","","0","","2","1","99.50","OUT","2021-04-11","2021-04-11 14:49:32");
INSERT INTO kp_stock_track VALUES("203","0","495","","0","","2","1","86.00","OUT","2021-04-11","2021-04-11 14:49:48");
INSERT INTO kp_stock_track VALUES("270","0","495","","0","","2","1","99.00","OUT","2021-04-11","2021-04-11 14:51:05");
INSERT INTO kp_stock_track VALUES("242","0","496","","0","","2","1","93.00","OUT","2021-04-11","2021-04-11 15:04:00");
INSERT INTO kp_stock_track VALUES("179","0","496","","0","","2","10","74.00","OUT","2021-04-11","2021-04-11 15:04:11");
INSERT INTO kp_stock_track VALUES("5","0","496","","0","","2","1","844.00","OUT","2021-04-11","2021-04-11 15:04:33");
INSERT INTO kp_stock_track VALUES("152","0","496","","0","","2","2","94.00","OUT","2021-04-11","2021-04-11 15:04:45");
INSERT INTO kp_stock_track VALUES("258","0","496","","0","","2","1","97.00","OUT","2021-04-11","2021-04-11 15:05:35");
INSERT INTO kp_stock_track VALUES("5","0","497","","0","","2","1","843.00","OUT","2021-04-11","2021-04-11 15:06:57");
INSERT INTO kp_stock_track VALUES("152","0","497","","0","","2","1","93.00","OUT","2021-04-11","2021-04-11 15:07:12");
INSERT INTO kp_stock_track VALUES("179","0","497","","0","","2","1","73.00","OUT","2021-04-11","2021-04-11 15:07:24");
INSERT INTO kp_stock_track VALUES("242","0","497","","0","","2","1","92.00","OUT","2021-04-11","2021-04-11 15:07:38");
INSERT INTO kp_stock_track VALUES("258","0","497","","0","","2","1","96.00","OUT","2021-04-11","2021-04-11 15:07:50");
INSERT INTO kp_stock_track VALUES("269","0","497","","0","","2","1","95.00","OUT","2021-04-11","2021-04-11 15:08:17");
INSERT INTO kp_stock_track VALUES("144","0","498","","0","","2","1","997.50","OUT","2021-04-11","2021-04-11 15:44:20");
INSERT INTO kp_stock_track VALUES("201","0","499","","0","","2","1","95.00","OUT","2021-04-11","2021-04-11 15:55:07");
INSERT INTO kp_stock_track VALUES("82","0","499","","0","","2","1","994.00","OUT","2021-04-11","2021-04-11 15:55:20");
INSERT INTO kp_stock_track VALUES("239","0","499","","0","","2","6","87.00","OUT","2021-04-11","2021-04-11 15:55:48");
INSERT INTO kp_stock_track VALUES("275","0","499","","0","","2","1","99.00","OUT","2021-04-11","2021-04-11 15:58:41");
INSERT INTO kp_stock_track VALUES("277","0","502","","0","","2","1","99.00","OUT","2021-04-11","2021-04-11 16:16:21");
INSERT INTO kp_stock_track VALUES("275","0","503","","0","","2","1","98.00","OUT","2021-04-11","2021-04-11 16:21:30");
INSERT INTO kp_stock_track VALUES("243","0","504","","0","","2","5","91.00","OUT","2021-04-11","2021-04-11 16:29:00");
INSERT INTO kp_stock_track VALUES("179","0","505","","0","","2","1","72.00","OUT","2021-04-11","2021-04-11 16:36:26");
INSERT INTO kp_stock_track VALUES("211","0","506","","0","","2","4","93.00","OUT","2021-04-11","2021-04-11 16:38:41");
INSERT INTO kp_stock_track VALUES("246","0","507","","0","","2","1","99.00","OUT","2021-04-11","2021-04-11 16:41:17");
INSERT INTO kp_stock_track VALUES("211","0","508","","0","","2","1","92.00","OUT","2021-04-11","2021-04-11 17:04:38");
INSERT INTO kp_stock_track VALUES("39","0","508","","0","","2","1","995.00","OUT","2021-04-11","2021-04-11 17:04:51");
INSERT INTO kp_stock_track VALUES("165","0","509","","0","","2","1","772.00","OUT","2021-04-11","2021-04-11 17:05:47");
INSERT INTO kp_stock_track VALUES("253","0","509","","0","","2","1","92.00","OUT","2021-04-11","2021-04-11 17:06:00");
INSERT INTO kp_stock_track VALUES("39","0","509","","0","","2","1","994.00","OUT","2021-04-11","2021-04-11 17:07:19");
INSERT INTO kp_stock_track VALUES("23","0","509","","0","","2","1","974.00","OUT","2021-04-11","2021-04-11 17:07:44");
INSERT INTO kp_stock_track VALUES("121","0","509","","0","","2","1","995.00","OUT","2021-04-11","2021-04-11 17:08:01");
INSERT INTO kp_stock_track VALUES("204","0","509","","0","","2","1","98.00","OUT","2021-04-11","2021-04-11 17:08:11");
INSERT INTO kp_stock_track VALUES("84","0","509","","0","","2","1","992.00","OUT","2021-04-11","2021-04-11 17:08:21");
INSERT INTO kp_stock_track VALUES("70","0","510","","0","","2","1","999.00","OUT","2021-04-12","2021-04-12 08:16:52");
INSERT INTO kp_stock_track VALUES("23","0","510","","0","","2","1","973.00","OUT","2021-04-12","2021-04-12 08:17:05");
INSERT INTO kp_stock_track VALUES("225","0","511","","0","","2","1","96.00","OUT","2021-04-12","2021-04-12 08:40:13");
INSERT INTO kp_stock_track VALUES("255","0","514","","0","","2","1","94.00","OUT","2021-04-12","2021-04-12 09:27:58");
INSERT INTO kp_stock_track VALUES("225","0","514","","0","","2","1","95.00","OUT","2021-04-12","2021-04-12 09:28:08");
INSERT INTO kp_stock_track VALUES("278","0","514","","0","","2","1","99.00","OUT","2021-04-12","2021-04-12 09:33:55");
INSERT INTO kp_stock_track VALUES("208","0","515","","0","","2","2","86.00","OUT","2021-04-12","2021-04-12 09:36:18");
INSERT INTO kp_stock_track VALUES("163","0","515","","0","","2","1","95.00","OUT","2021-04-12","2021-04-12 09:36:27");
INSERT INTO kp_stock_track VALUES("139","0","516","","0","","2","1","992.00","OUT","2021-04-12","2021-04-12 09:46:08");
INSERT INTO kp_stock_track VALUES("259","0","517","","0","","2","1","97.00","OUT","2021-04-12","2021-04-12 09:47:25");
INSERT INTO kp_stock_track VALUES("5","0","518","","0","","2","1","842.50","OUT","2021-04-12","2021-04-12 10:03:56");
INSERT INTO kp_stock_track VALUES("274","0","520","","0","","2","2","96.00","OUT","2021-04-12","2021-04-12 10:47:13");
INSERT INTO kp_stock_track VALUES("179","0","521","","0","","2","1","71.00","OUT","2021-04-12","2021-04-12 11:42:07");
INSERT INTO kp_stock_track VALUES("170","0","521","","0","","2","3","61.00","OUT","2021-04-12","2021-04-12 11:43:05");
INSERT INTO kp_stock_track VALUES("189","0","521","","0","","2","1","90.00","OUT","2021-04-12","2021-04-12 11:44:24");
INSERT INTO kp_stock_track VALUES("269","0","521","","0","","2","1","94.00","OUT","2021-04-12","2021-04-12 11:45:20");
INSERT INTO kp_stock_track VALUES("208","0","521","","0","","2","1","85.00","OUT","2021-04-12","2021-04-12 11:46:17");
INSERT INTO kp_stock_track VALUES("279","0","521","","0","","2","1","99.00","OUT","2021-04-12","2021-04-12 12:05:28");
INSERT INTO kp_stock_track VALUES("144","0","523","","0","","2","1","997.00","OUT","2021-04-12","2021-04-12 12:07:06");
INSERT INTO kp_stock_track VALUES("261","0","527","","0","","2","1","97.00","OUT","2021-04-12","2021-04-12 12:42:45");
INSERT INTO kp_stock_track VALUES("180","0","528","","0","","2","2","85.00","OUT","2021-04-12","2021-04-12 12:52:33");
INSERT INTO kp_stock_track VALUES("265","0","529","","0","","2","1","97.50","OUT","2021-04-12","2021-04-12 13:05:33");
INSERT INTO kp_stock_track VALUES("76","0","530","","0","","2","1","991.50","OUT","2021-04-12","2021-04-12 13:12:06");
INSERT INTO kp_stock_track VALUES("203","0","531","","0","","2","2","84.00","OUT","2021-04-12","2021-04-12 13:18:48");
INSERT INTO kp_stock_track VALUES("88","0","532","","0","","2","1","998.00","OUT","2021-04-12","2021-04-12 14:18:20");
INSERT INTO kp_stock_track VALUES("38","0","533","","0","","2","1","995.00","OUT","2021-04-12","2021-04-12 14:24:18");
INSERT INTO kp_stock_track VALUES("140","0","534","","0","","2","1","995.50","OUT","2021-04-12","2021-04-12 14:29:55");
INSERT INTO kp_stock_track VALUES("186","0","537","","0","","2","1","77.00","OUT","2021-04-12","2021-04-12 15:52:34");
INSERT INTO kp_stock_track VALUES("203","0","538","","0","","2","1","83.00","OUT","2021-04-12","2021-04-12 15:56:55");
INSERT INTO kp_stock_track VALUES("123","0","539","","0","","2","5","994.00","OUT","2021-04-12","2021-04-12 16:02:22");
INSERT INTO kp_stock_track VALUES("170","0","540","","0","","2","2","59.50","OUT","2021-04-12","2021-04-12 16:11:38");
INSERT INTO kp_stock_track VALUES("170","0","541","","0","","2","2","58.00","OUT","2021-04-12","2021-04-12 16:13:53");
INSERT INTO kp_stock_track VALUES("166","0","542","","0","","2","1","89.00","OUT","2021-04-12","2021-04-12 16:32:58");
INSERT INTO kp_stock_track VALUES("203","0","542","","0","","2","1","82.00","OUT","2021-04-12","2021-04-12 16:33:14");
INSERT INTO kp_stock_track VALUES("163","0","542","","0","","2","1","94.00","OUT","2021-04-12","2021-04-12 16:33:30");
INSERT INTO kp_stock_track VALUES("255","0","542","","0","","2","1","93.00","OUT","2021-04-12","2021-04-12 16:33:39");
INSERT INTO kp_stock_track VALUES("211","0","542","","0","","2","1","91.00","OUT","2021-04-12","2021-04-12 16:34:11");
INSERT INTO kp_stock_track VALUES("144","0","543","","0","","2","1","996.50","OUT","2021-04-12","2021-04-12 16:37:16");
INSERT INTO kp_stock_track VALUES("32","0","544","","0","","2","1","991.00","OUT","2021-04-12","2021-04-12 16:50:44");
INSERT INTO kp_stock_track VALUES("170","0","545","","0","","2","1","57.00","OUT","2021-04-12","2021-04-12 17:04:05");
INSERT INTO kp_stock_track VALUES("68","0","546","","0","","2","3","985.00","OUT","2021-04-12","2021-04-12 17:07:34");
INSERT INTO kp_stock_track VALUES("278","0","546","","0","","2","1","98.00","OUT","2021-04-12","2021-04-12 17:07:44");
INSERT INTO kp_stock_track VALUES("178","0","547","","0","","2","1","80.00","OUT","2021-04-12","2021-04-12 17:16:14");
INSERT INTO kp_stock_track VALUES("273","0","548","","0","","2","2","95.00","OUT","2021-04-12","2021-04-12 17:40:09");
INSERT INTO kp_stock_track VALUES("183","0","548","","0","","2","2","95.00","OUT","2021-04-12","2021-04-12 17:42:16");
INSERT INTO kp_stock_track VALUES("5","0","549","","0","","2","2","840.00","OUT","2021-04-12","2021-04-12 17:43:32");
INSERT INTO kp_stock_track VALUES("5","0","550","","0","","2","4","836.00","OUT","2021-04-12","2021-04-12 17:47:25");
INSERT INTO kp_stock_track VALUES("218","0","551","","0","","2","1","97.00","OUT","2021-04-12","2021-04-12 17:50:49");
INSERT INTO kp_stock_track VALUES("269","0","552","","0","","2","1","93.00","OUT","2021-04-12","2021-04-12 17:59:14");
INSERT INTO kp_stock_track VALUES("176","0","553","","0","","2","1","78.00","OUT","2021-04-12","2021-04-12 18:00:19");
INSERT INTO kp_stock_track VALUES("167","0","553","","0","","2","1","92.00","OUT","2021-04-12","2021-04-12 18:01:01");
INSERT INTO kp_stock_track VALUES("280","0","555","","0","","2","1","99.00","OUT","2021-04-12","2021-04-12 18:14:51");
INSERT INTO kp_stock_track VALUES("5","0","555","","0","","2","1","835.00","OUT","2021-04-12","2021-04-12 18:15:10");
INSERT INTO kp_stock_track VALUES("170","0","555","","0","","2","1","56.50","OUT","2021-04-12","2021-04-12 18:15:23");
INSERT INTO kp_stock_track VALUES("5","0","556","","0","","2","3","832.00","OUT","2021-04-12","2021-04-12 18:21:59");
INSERT INTO kp_stock_track VALUES("273","0","557","","0","","2","1","94.00","OUT","2021-04-12","2021-04-12 18:24:19");
INSERT INTO kp_stock_track VALUES("210","0","558","","0","","2","1","99.00","OUT","2021-04-13","2021-04-13 08:29:35");
INSERT INTO kp_stock_track VALUES("278","0","559","","0","","2","1","97.00","OUT","2021-04-13","2021-04-13 08:58:35");
INSERT INTO kp_stock_track VALUES("33","0","560","","0","","2","1","991.00","OUT","2021-04-13","2021-04-13 09:24:05");
INSERT INTO kp_stock_track VALUES("179","0","","16","0","","2","20","0.00","IN","2021-04-13","2021-04-13 10:07:12");
INSERT INTO kp_stock_track VALUES("5","0","561","","0","","2","1","831.50","OUT","2021-04-13","2021-04-13 10:30:16");
INSERT INTO kp_stock_track VALUES("274","0","562","","0","","2","2","94.00","OUT","2021-04-13","2021-04-13 10:43:52");
INSERT INTO kp_stock_track VALUES("259","0","563","","0","","2","1","96.00","OUT","2021-04-13","2021-04-13 10:53:36");
INSERT INTO kp_stock_track VALUES("179","0","564","","0","","2","1","43.50","OUT","2021-04-13","2021-04-13 11:05:06");
INSERT INTO kp_stock_track VALUES("180","0","565","","0","","2","1","299.00","OUT","2021-04-13","2021-04-13 11:06:45");
INSERT INTO kp_stock_track VALUES("268","3","566","","0","","0","1","97.00","OUT","2021-04-13","2021-04-13 12:52:34");
INSERT INTO kp_stock_track VALUES("246","13","566","","0","","0","1","98.00","OUT","2021-04-13","2021-04-13 13:02:01");
INSERT INTO kp_stock_track VALUES("253","1","568","","0","","0","1","91.00","OUT","2021-04-13","2021-04-13 13:12:38");
INSERT INTO kp_stock_track VALUES("253","5","568","","0","","2","1","90.00","OUT","2021-04-13","2021-04-13 13:15:29");
INSERT INTO kp_stock_track VALUES("50","1","569","","0","","2","2","998.00","OUT","2021-04-13","2021-04-13 13:20:25");
INSERT INTO kp_stock_track VALUES("178","1","570","","0","","2","2","78.00","OUT","2021-04-13","2021-04-13 13:26:06");
INSERT INTO kp_stock_track VALUES("165","1","571","","0","","2","10","762.00","OUT","2021-04-13","2021-04-13 13:28:38");
INSERT INTO kp_stock_track VALUES("38","1","574","","0","","2","3","992.00","OUT","2021-04-13","2021-04-13 14:11:09");
INSERT INTO kp_stock_track VALUES("62","1","574","","0","","2","1","990.00","OUT","2021-04-13","2021-04-13 14:15:27");
INSERT INTO kp_stock_track VALUES("68","1","574","","0","","2","1","984.00","OUT","2021-04-13","2021-04-13 14:19:43");
INSERT INTO kp_stock_track VALUES("178","1","574","","0","","2","1","77.00","OUT","2021-04-13","2021-04-13 14:20:16");
INSERT INTO kp_stock_track VALUES("75","1","574","","0","","2","1","992.00","OUT","2021-04-13","2021-04-13 14:30:18");
INSERT INTO kp_stock_track VALUES("121","1","574","","0","","2","1","994.00","OUT","2021-04-13","2021-04-13 14:33:18");
INSERT INTO kp_stock_track VALUES("134","1","574","","0","","2","1","999.00","OUT","2021-04-13","2021-04-13 14:34:14");
INSERT INTO kp_stock_track VALUES("201","1","574","","0","","2","1","94.00","OUT","2021-04-13","2021-04-13 14:40:05");
INSERT INTO kp_stock_track VALUES("236","1","574","","0","","2","1","93.00","OUT","2021-04-13","2021-04-13 14:41:18");
INSERT INTO kp_stock_track VALUES("2","0","","17","4","","2","45","0.00","IN","2021-04-22","2021-04-22 09:05:24");
INSERT INTO kp_stock_track VALUES("9","0","","17","4","","2","5","0.00","IN","2021-04-22","2021-04-22 09:07:15");
INSERT INTO kp_stock_track VALUES("269","0","","14","5","","2","40","0.00","IN","2021-04-22","2021-04-22 09:11:21");
INSERT INTO kp_stock_track VALUES("268","0","","13","6","","2","10","0.00","IN","2021-04-22","2021-04-22 09:13:19");
INSERT INTO kp_stock_track VALUES("265","0","","13","6","","2","5","0.00","IN","2021-04-22","2021-04-22 09:13:23");
INSERT INTO kp_stock_track VALUES("5","0","575","","0","","2","1","11.00","OUT","2021-04-22","2021-04-22 22:03:00");
INSERT INTO kp_stock_track VALUES("18","0","576","","0","","2","5","991.00","OUT","2021-04-22","2021-04-22 22:59:42");
INSERT INTO kp_stock_track VALUES("2","0","","18","7","","2","5","0.00","IN","2021-04-22","2021-04-22 23:34:08");
INSERT INTO kp_stock_track VALUES("281","0","","18","7","","2","2","0.00","IN","2021-04-22","2021-04-22 23:34:13");
INSERT INTO kp_stock_track VALUES("6","0","","18","7","","2","2","0.00","IN","2021-04-22","2021-04-22 23:34:16");
INSERT INTO kp_stock_track VALUES("2","0","","18","8","","2","3","0.00","IN","2021-04-22","2021-04-22 23:36:40");
INSERT INTO kp_stock_track VALUES("281","0","","18","8","","2","3","0.00","IN","2021-04-22","2021-04-22 23:36:44");
INSERT INTO kp_stock_track VALUES("5","0","","18","8","","2","5","0.00","IN","2021-04-22","2021-04-22 23:36:47");
INSERT INTO kp_stock_track VALUES("6","0","","18","8","","2","3","0.00","IN","2021-04-22","2021-04-22 23:36:50");
INSERT INTO kp_stock_track VALUES("8","0","","18","8","","2","5","0.00","IN","2021-04-22","2021-04-22 23:36:54");
INSERT INTO kp_stock_track VALUES("1","0","577","","0","","2","3","2.00","OUT","2021-04-23","2021-04-23 00:49:41");
INSERT INTO kp_stock_track VALUES("8","0","577","","0","","2","2","991.00","OUT","2021-04-23","2021-04-23 00:49:53");
INSERT INTO kp_stock_track VALUES("8","0","579","","0","","2","5","986.00","OUT","2021-04-25","2021-04-25 10:29:10");
INSERT INTO kp_stock_track VALUES("3","0","581","","0","","2","9","990.00","OUT","2021-04-25","2021-04-25 13:11:34");
INSERT INTO kp_stock_track VALUES("6","0","582","","0","","2","2","1003.00","OUT","2021-04-25","2021-05-11 12:49:26");
INSERT INTO kp_stock_track VALUES("2","0","585","","0","","2","1","12.00","OUT","2021-05-22","2021-05-22 14:14:21");
INSERT INTO kp_stock_track VALUES("6","0","586","","0","","2","2","1001.00","OUT","2021-05-22","2021-05-22 14:16:52");
INSERT INTO kp_stock_track VALUES("129","0","586","","0","","2","1","997.00","OUT","2021-05-22","2021-05-22 14:17:05");
INSERT INTO kp_stock_track VALUES("80","0","586","","0","","2","2","997.00","OUT","2021-05-22","2021-05-22 14:17:43");
INSERT INTO kp_stock_track VALUES("2","0","587","","0","","2","1","11.00","OUT","2021-05-22","2021-05-22 14:31:41");
INSERT INTO kp_stock_track VALUES("3","0","588","","0","","2","1","49.00","OUT","2021-06-07","2021-06-09 15:39:41");
INSERT INTO kp_stock_track VALUES("92","0","578","","0","","2","1","99.00","OUT","2021-04-23","2021-06-10 12:54:09");
INSERT INTO kp_stock_track VALUES("4","0","589","","0","","2","1","9.00","OUT","2021-06-10","2021-06-10 13:11:06");
INSERT INTO kp_stock_track VALUES("8","0","589","","0","","2","1","985.00","OUT","2021-06-10","2021-06-10 14:11:55");
INSERT INTO kp_stock_track VALUES("246","0","589","","0","","2","5","93.00","OUT","2021-06-10","2021-06-10 14:12:11");
INSERT INTO kp_stock_track VALUES("9","0","589","","0","","2","6","995.00","OUT","2021-06-10","2021-06-10 14:12:18");
INSERT INTO kp_stock_track VALUES("14","0","589","","0","","2","3","990.00","OUT","2021-06-10","2021-06-10 14:12:26");
INSERT INTO kp_stock_track VALUES("173","0","589","","0","","2","6","88.00","OUT","2021-06-10","2021-06-10 14:12:33");
INSERT INTO kp_stock_track VALUES("268","0","589","","0","","2","4","26.00","OUT","2021-06-10","2021-06-10 14:12:43");
INSERT INTO kp_stock_track VALUES("98","0","589","","0","","2","3","996.00","OUT","2021-06-10","2021-06-10 14:19:21");
INSERT INTO kp_stock_track VALUES("6","0","580","","0","","2","1","1000.00","OUT","2021-06-10","2021-06-10 15:51:14");
INSERT INTO kp_stock_track VALUES("220","0","580","","0","","2","1","11.00","OUT","2021-06-10","2021-06-10 15:51:24");
INSERT INTO kp_stock_track VALUES("2","0","590","","0","","2","1","10.00","OUT","2021-06-10","2021-06-10 15:53:12");
INSERT INTO kp_stock_track VALUES("4","0","591","","0","","2","1","8.00","OUT","2021-06-10","2021-06-10 15:56:47");
INSERT INTO kp_stock_track VALUES("2","0","591","","0","","2","3","7.00","OUT","2021-06-10","2021-06-10 15:56:53");
INSERT INTO kp_stock_track VALUES("15","0","592","","0","","2","50","950.00","OUT","2021-06-10","2021-06-10 16:05:06");
INSERT INTO kp_stock_track VALUES("64","0","592","","0","","2","4","996.00","OUT","2021-06-10","2021-06-10 16:05:12");
INSERT INTO kp_stock_track VALUES("7","0","593","","0","","2","1","999.00","OUT","2021-06-10","2021-06-10 16:13:07");
INSERT INTO kp_stock_track VALUES("6","0","594","","0","","2","6","994.00","OUT","2021-06-10","2021-06-10 16:24:02");
INSERT INTO kp_stock_track VALUES("61","0","595","","0","","2","1","999.00","OUT","2021-06-10","2021-06-10 16:29:08");
INSERT INTO kp_stock_track VALUES("78","0","595","","0","","2","5","992.00","OUT","2021-06-10","2021-06-10 16:29:15");
INSERT INTO kp_stock_track VALUES("14","0","596","","0","","2","1","989.00","OUT","2021-06-10","2021-06-10 16:32:49");
INSERT INTO kp_stock_track VALUES("6","0","597","","0","","2","6","988.00","OUT","2021-06-10","2021-06-10 16:38:34");
INSERT INTO kp_stock_track VALUES("14","0","598","","0","","2","4","985.00","OUT","2021-06-10","2021-06-10 16:44:40");
INSERT INTO kp_stock_track VALUES("81","0","599","","0","","2","1","999.00","OUT","2021-06-10","2021-06-10 16:58:34");
INSERT INTO kp_stock_track VALUES("8","0","600","","0","","2","1","984.00","OUT","2021-06-10","2021-06-10 17:09:46");
INSERT INTO kp_stock_track VALUES("10","0","601","","0","","2","1","93.00","OUT","2021-06-10","2021-06-10 19:32:44");
INSERT INTO kp_stock_track VALUES("1","0","","21","10","","2","4","0.00","IN","2021-06-10","2021-06-10 20:45:55");
INSERT INTO kp_stock_track VALUES("9","0","603","","0","","2","1","994.00","OUT","2021-06-10","2021-06-10 21:19:48");
INSERT INTO kp_stock_track VALUES("8","0","604","","0","","2","84","900.00","OUT","2021-06-10","2021-06-11 11:07:07");





CREATE TABLE `kp_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(122) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_sub_cat` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub_desc` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;






CREATE TABLE `kp_suppliers` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `sup_bal` decimal(10,0) NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_suppliers VALUES("1","BETTER DEAL WHOLESALERS LTD","","NA@","P.O BOX","0721211931//0794202498","","P051940403V","P051940403V","2","2","174000");
INSERT INTO kp_suppliers VALUES("2","LEBANONI BUSINESS DISTRIBUTORS LI","","lebanonibslt@gmail.com","P.O BOX828-00516<BR>NAIROBI","00","NAIROBI","P051979163D","P051979163D","2","2","18000");
INSERT INTO kp_suppliers VALUES("3","SALAMA WHOLESALERS LTD","","na@na.com","P.O BOX 6856-00610","0727018550","NAIROBI","P051566385W","P051566385W","2","2","43980");
INSERT INTO kp_suppliers VALUES("4","ZARUQ STORES LTD","","-","","0717470181","EASTLEIGH","P051451292A","P051451292A","2","2","0");
INSERT INTO kp_suppliers VALUES("5","KANICE DIGITAL MILLERS LTD","","-","-","0728385768","-","P051647573W","P051647573W","2","2","50265");
INSERT INTO kp_suppliers VALUES("6","KENBLEST PROCESSORS LTD","","-","","0704535771","-","P051951020S","P051951020S","2","2","0");
INSERT INTO kp_suppliers VALUES("7","GENJOY FOOD PRODUCTS LTD","","-","","0701550231","-","P051216091E","P051216091E","2","2","0");
INSERT INTO kp_suppliers VALUES("8","KUTUI MILLERS","","","","0114731995","","","","2","2","20200");
INSERT INTO kp_suppliers VALUES("9","PATINUM INTERNATIONAL SERVICES LT","","PATINUMIS@GMAIL.COM","","","","P051739819T","P051739819T","2","2","5000");
INSERT INTO kp_suppliers VALUES("10","ytuytu","","ytuyt","ytutyu","ytuytu","","ytuty","uytutyu","0","2","0");
INSERT INTO kp_suppliers VALUES("11","bvn","","vbn","vbnbvn","vnvbn","","vnvbn","vbnvbn","0","2","0");
INSERT INTO kp_suppliers VALUES("12","eve","","fdgfd","gfdg","gfdg","","fdgdfg","fdgdfg","0","2","0");
INSERT INTO kp_suppliers VALUES("13","kten","","kelvingichuri@gmail.com","po box 126","0716100335","","A23456T","A23456T","0","2","0");
INSERT INTO kp_suppliers VALUES("14","KTEN 2","","KELVINGICHURI@GMAIL.COM","PO BOX 126","071532625","","A234567K","A45667J","0","2","0");





CREATE TABLE `kp_tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `code` varchar(11) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_tax VALUES("1","VAT","16","S","2021-03-12 08:54:38","2");
INSERT INTO kp_tax VALUES("2","ZERO RATE","0","Z","2021-03-12 08:54:57","2");
INSERT INTO kp_tax VALUES("3","ECXEMPT","0","E","2021-03-12 08:55:13","2");





CREATE TABLE `kp_thesion` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `grn_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `current_page` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `comp_address` varchar(155) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `day` date NOT NULL,
  `datime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_thesion VALUES("996","0","","0","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","front/ord/order.php","3C-52-82-37-F0-4C","0000-00-00","2021-05-22 13:38:20");
INSERT INTO kp_thesion VALUES("1410","3","admin_dash.php","0","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","10","0","front/ord/zreport_therm.php","3C-52-82-37-F0-4C","2021-06-11","2021-06-11 18:48:01");





CREATE TABLE `kp_uom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(22) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_uom VALUES("1","PIECE","1","2");
INSERT INTO kp_uom VALUES("2","DOZEN","12","2");
INSERT INTO kp_uom VALUES("3","BALE 2KG","12","2");
INSERT INTO kp_uom VALUES("4","BALE 1KG","24","2");
INSERT INTO kp_uom VALUES("5","BAG 25","25","2");
INSERT INTO kp_uom VALUES("6","BAG 50","50","2");
INSERT INTO kp_uom VALUES("7","BALE (D)","6","2");
INSERT INTO kp_uom VALUES("8","CARTON (4 DOZEN)","4","2");
INSERT INTO kp_uom VALUES("9","CARTON (3 DOZEN)","3","2");
INSERT INTO kp_uom VALUES("10","CARTON (2 DOZEN)","2","2");
INSERT INTO kp_uom VALUES("11","PACK (4)","4","2");
INSERT INTO kp_uom VALUES("12","PACK (12)","12","2");
INSERT INTO kp_uom VALUES("13","PACK (24)","24","2");
INSERT INTO kp_uom VALUES("14","20LTRS","20","2");
INSERT INTO kp_uom VALUES("15","10LTRS","10","2");
INSERT INTO kp_uom VALUES("16","PACK (9)","9","2");
INSERT INTO kp_uom VALUES("17","CARTON (12 DOZEN)","12","2");
INSERT INTO kp_uom VALUES("18","CARTON (6 DOZEN)","6","2");
INSERT INTO kp_uom VALUES("19","CARTON (24 DOZEN)","24","2");





CREATE TABLE `kp_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `sys_default` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username` (`username`),
  UNIQUE KEY `user_pin` (`user_pin`),
  UNIQUE KEY `staff_id` (`staff_id`),
  UNIQUE KEY `user_staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_users VALUES("1","1","MICHI","MICHI","","2","2","2020-08-13 21:43:26","0000-00-00 00:00:00","2","","2","2");
INSERT INTO kp_users VALUES("2","5","GABI","gabi","","2","2","2020-08-13 21:43:26","0000-00-00 00:00:00","1","*","2","2");





CREATE TABLE `kp_users_logger` (
  `user_id` int(11) NOT NULL,
  `datime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ip_address` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `mac_address` varchar(33) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-29 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-30 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-03-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-01 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-02 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-02 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-03 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-03 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-03 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-05 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-05 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-06 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-06 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-06 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-07 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-10 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-11 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-12 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-13 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-13 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-13 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-21 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-24 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-04-25 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-11 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-11 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-22 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-25 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-26 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-27 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-27 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-28 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-30 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-30 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-30 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-30 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-05-31 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-05 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-05 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-07 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-07 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-08 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-09 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-10 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-10 00:00:00","","","");
INSERT INTO kp_users_logger VALUES("0","2021-06-10 00:00:00","","","");





CREATE TABLE `split_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO split_message VALUES("1","EDWIN KIPROP KAPKEI","254712234345","OFK045VWVW","1.00","","2530.23","","2020-01-20","5:01pm","2020-06-20 17:41:01","3");
INSERT INTO split_message VALUES("2","LILIAN IRUNGU","254724223840","OFK446A1DK","1.00","","2531.23","","2020-01-20","5:10pm","2020-06-20 17:41:01","1");
INSERT INTO split_message VALUES("3","EDWIN KIPROP KAPKEI","254712234345","OFK646GGYK","1.00","","2532.23","","2020-01-20","5:14pm","2020-06-20 17:41:01","3");
INSERT INTO split_message VALUES("4","EDWIN KIPROP KAPKEI","254712234345","OFK846IO60","2.00","","2534.23","","2020-01-20","5:15pm","2020-06-20 17:41:01","3");
INSERT INTO split_message VALUES("5","EDWIN KIPROP KAPKEI","254712234345","OFK946Y7RV","1.00","","2535.23","","2020-01-20","5:25pm","2020-06-20 17:41:01","3");
INSERT INTO split_message VALUES("6","PETER KABURIA","254722204074","OFK746YEM7","500.00","","3035.23","","2020-01-20","5:25pm","2020-06-20 17:41:01","1");
INSERT INTO split_message VALUES("7","SYLVESTER AKAMA MWAMBA","254748711700","OFK047HTOO","300.00","","3335.23","","2020-01-20","5:37pm","2020-06-20 17:41:01","1");
INSERT INTO split_message VALUES("19","Armingtony Tihali Kweyu","254741040045","OFK3482MUR","200.00","","3536.23","","2020-01-20","5:50pm","2020-06-20 17:50:49","1");
INSERT INTO split_message VALUES("23","EDWIN KIPROP KAPKEI","254712234345","OFK347XWVL","1.00","","3336.23","","2020-01-20","5:47pm","2020-06-20 17:50:49","3");
INSERT INTO split_message VALUES("24","EDWIN KIPROP KAPKEI","254712234345","OFK548JBFD","1.00","","3538.23","","2020-01-20","5:59pm","2020-06-20 18:00:03","1");
INSERT INTO split_message VALUES("25","EDWIN KIPROP KAPKEI","254712234345","OFK248KZUU","2.00","","3540.23","","2020-01-20","6:00pm","2020-06-20 18:00:59","3");
INSERT INTO split_message VALUES("26","THOMAS NJOGU","254722848374","OFK348OZTX","2000.00","","5530.23","","2020-01-20","6:03pm","2020-06-20 18:03:25","1");
INSERT INTO split_message VALUES("27","KELVIN GICHURI MAINA","254716100335","OFK64903CS","1.00","","5531.23","","2020-01-20","6:09pm","2020-06-20 18:09:39","1");
INSERT INTO split_message VALUES("28","ISAIAH CHIERAH","254722675351","OFK649HQPA","170.00","","5701.23","","2020-01-20","6:19pm","2020-06-20 18:19:28","1");
INSERT INTO split_message VALUES("29","NDUCHA ERASTUS","254729608497","OFK849PWZ8","950.00","","6651.23","","2020-01-20","6:23pm","2020-06-20 18:23:58","1");
INSERT INTO split_message VALUES("30","MARILEJEANE CHARLES","254720380212","OFK94A4OA7","200.00","","6851.23","","2020-01-20","6:31pm","2020-06-20 18:32:00","2");
INSERT INTO split_message VALUES("31","NEWTON KINYUA KIANO","254722493938","OFK54B1XR9","920.00","","7771.23","","2020-01-20","6:48pm","2020-06-20 18:49:05","2");
INSERT INTO split_message VALUES("32","DENZEL MWANGI MUGAMBI","254748030588","OFK24BLWRC","600.00","","8371.23","","2020-01-20","6:58pm","2020-06-20 18:58:38","1");



