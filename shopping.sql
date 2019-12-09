-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2019 at 06:01 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'BAWAL', 'BRAND', '2017-01-24 19:17:37', '08-12-2019 01:21:49 AM'),
(4, 'SHAWL', 'BRAND', '2017-01-24 19:19:32', '08-12-2019 01:15:38 AM'),
(5, 'INNER', 'BRAND', '2017-01-24 19:19:54', '08-12-2019 01:15:58 AM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '42', 1, '2019-12-08 13:51:47', 'COD', NULL),
(8, 4, '24', 1, '2019-12-08 19:21:06', 'COD', 'Delivered'),
(9, 4, '21', 1, '2019-12-09 13:09:05', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 8, 'Delivered', 'MY**************', '2019-12-09 13:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 3, 6, 'PEACH ROY', 'THE DUCK SCARF', 50, 56, '', 'peach roy.png', 'unnamed (22).png', 'pink roy.png', 5, 'In Stock', '2019-12-07 20:10:20', NULL),
(23, 3, 6, 'PINK ROY', 'THE DUCK SCARF', 45, 87, '', 'pink roy.png', 'pink roy.png', 'pink roy.png', 0, 'Out of Stock', '2019-12-08 07:50:29', NULL),
(24, 3, 6, 'SKY BLUE', 'NAELOFAR HIJAB', 60, 90, '', 'unnamed (22).png', 'unnamed (22).png', 'unnamed (22).png', 0, 'In Stock', '2019-12-08 07:52:56', NULL),
(25, 3, 6, 'GLOWING', 'THE DUCK SCARF', 88, 120, '', 'unnamed (23).png', 'unnamed (23).png', 'unnamed (23).png', 8, 'In Stock', '2019-12-08 07:54:22', NULL),
(26, 3, 6, 'BERRY BLUE', 'NAELOFAR HIJAB', 25, 67, '', 'unnamed (24).png', 'unnamed (24).png', 'unnamed (24).png', 9, 'In Stock', '2019-12-08 08:09:45', NULL),
(27, 3, 6, 'LIGHT BLUE', 'THE DUCK SCARF', 65, 78, '', 'unnamed (25).png', 'unnamed (25).png', 'unnamed (25).png', 0, 'Out of Stock', '2019-12-08 08:11:13', NULL),
(28, 3, 6, 'REDDY GREY', 'NAELOFAR HIJAB', 35, 0, '', 'unnamed (26).png', 'unnamed (26).png', 'unnamed (26).png', 0, 'Out of Stock', '2019-12-08 08:13:33', NULL),
(29, 3, 6, 'GREEN ROY', 'THE DUCK SCARF', 29, 0, '', 'unnamed (41).png', 'unnamed (41).png', 'unnamed (41).png', 10, 'In Stock', '2019-12-08 08:26:10', NULL),
(30, 3, 6, 'RED ROY', 'THE DUCK SCARF', 29, 32, '', 'unnamed (44).png', 'unnamed (44).png', 'unnamed (44).png', 8, 'Out of Stock', '2019-12-08 08:31:27', NULL),
(31, 4, 14, 'BLACK WHITE', 'THE DUCK SCARF', 50, 60, '', 'unnamed (10).png', 'unnamed (10).png', 'unnamed (10).png', 0, 'In Stock', '2019-12-08 08:45:20', NULL),
(32, 4, 14, 'BLUE RED', 'THE DUCK SCARF', 57, 67, '', 'unnamed (11).png', 'unnamed (11).png', 'unnamed (11).png', 0, 'In Stock', '2019-12-08 08:46:27', NULL),
(33, 4, 14, 'LIGHT PINK', 'THE DUCK SCARF', 40, 59, '', 'unnamed (12).png', 'unnamed (12).png', 'unnamed (12).png', 10, 'In Stock', '2019-12-08 08:47:42', NULL),
(34, 4, 14, 'LIGHT PEACH', 'THE DUCK SCARF', 30, 0, '', 'unnamed (13).png', 'unnamed (13).png', 'unnamed (13).png', 0, 'In Stock', '2019-12-08 08:49:14', NULL),
(35, 4, 3, 'GLOWING GREY', 'NAELOFAR HIJAB', 47, 0, '', 'unnamed (16).png', 'unnamed (16).png', 'unnamed (16).png', 0, 'In Stock', '2019-12-08 08:51:08', NULL),
(36, 4, 3, 'GLOWING SILVER', 'NAELOFAR HIJAB', 50, 100, '', 'unnamed (17).png', 'unnamed (17).png', 'unnamed (17).png', 0, 'In Stock', '2019-12-08 08:53:17', NULL),
(37, 4, 3, 'GLOWING MAROON', 'NAELOFAR HIJAB', 55, 120, '', 'unnamed (18).png', 'unnamed (18).png', 'unnamed (18).png', 10, 'Out of Stock', '2019-12-08 08:54:39', NULL),
(38, 4, 3, 'GLOWING GOLD', 'NAELOFAR HIJAB', 60, 67, '', 'unnamed (19).png', 'unnamed (19).png', 'unnamed (19).png', 8, 'In Stock', '2019-12-08 08:56:16', NULL),
(39, 4, 3, 'BABY BLUE', 'NAELOFAR HIJAB', 43, 0, '', 'unnamed (20).png', 'unnamed (20).png', 'unnamed (20).png', 0, 'In Stock', '2019-12-08 08:59:02', NULL),
(40, 4, 14, 'PRINTED GREY', 'THE DUCK SCARF', 56, 87, '', 'unnamed (37).png', 'unnamed (37).png', 'unnamed (37).png', 8, 'In Stock', '2019-12-08 09:00:52', NULL),
(41, 4, 14, 'LIGHT PURPLE', 'THE DUCK SCARF', 50, 0, '', 'unnamed (38).png', 'unnamed (38).png', 'unnamed (38).png', 8, 'In Stock', '2019-12-08 09:04:03', NULL),
(42, 5, 9, 'LIGHT BLUE', 'NAELOFAR HIJAB', 15, 0, '', 'unnamed (27).png', 'unnamed (27).png', 'unnamed (27).png', 10, 'In Stock', '2019-12-08 09:05:42', NULL),
(43, 5, 9, 'BLACK', 'NAELOFAR HIJAB', 20, 0, '', 'unnamed (28).png', 'unnamed (28).png', 'unnamed (28).png', 8, 'In Stock', '2019-12-08 09:07:31', NULL),
(44, 5, 9, 'NAVY BLUE', 'NAELOFAR HIJAB', 18, 0, '', 'unnamed (29).png', 'unnamed (29).png', 'unnamed (29).png', 8, 'In Stock', '2019-12-08 09:09:06', NULL),
(45, 5, 9, 'EMERALD GREEN', 'NAELOFAR HIJAB', 15, 0, '', 'unnamed (30).png', 'unnamed (30).png', 'unnamed (30).png', 8, 'In Stock', '2019-12-08 09:11:04', NULL),
(46, 5, 9, 'DUSTY PINK', 'NAELOFAR HIJAB', 15, 30, '', 'unnamed (31).png', 'unnamed (31).png', 'unnamed (31).png', 8, 'In Stock', '2019-12-08 09:12:58', NULL),
(47, 5, 9, 'DARK PURPLE', 'NAELOFAR HIJAB', 16, 0, '', 'unnamed (32).png', 'unnamed (32).png', 'unnamed (32).png', 0, 'Out of Stock', '2019-12-08 09:14:17', NULL),
(48, 5, 9, 'PINK', 'NAELOFAR HIJAB', 20, 0, '', 'unnamed (33).png', 'unnamed (33).png', 'unnamed (33).png', 8, 'Out of Stock', '2019-12-08 09:16:06', NULL),
(49, 5, 9, 'LIGHT GREY', 'NAELOFAR HIJAB', 20, 0, '', 'unnamed (34).png', 'unnamed (34).png', 'unnamed (34).png', 10, 'In Stock', '2019-12-08 09:17:05', NULL),
(50, 5, 9, 'DARK BROWN', 'NAELOFAR HIJAB', 28, 30, '', 'unnamed (36).png', 'unnamed (36).png', 'unnamed (36).png', 0, 'In Stock', '2019-12-08 09:18:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(3, 4, 'SATIN', '2017-01-26 16:29:09', '08-12-2019 01:20:41 AM'),
(4, 4, 'PLAIN', '2017-01-30 16:55:48', '08-12-2019 01:20:59 AM'),
(6, 3, 'PRINTED', '2017-02-04 04:13:00', '08-12-2019 01:22:38 AM'),
(9, 5, 'INNER NECK', '2017-02-04 04:36:45', '08-12-2019 01:23:52 AM'),
(14, 4, 'PRINTED', '2019-12-08 08:42:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'rina_sesta@yahoo.com', 0x3a3a3100000000000000000000000000, '2019-12-08 13:16:31', NULL, 0),
(25, 'rina_sesta@yahoo.com', 0x3a3a3100000000000000000000000000, '2019-12-08 13:17:35', NULL, 0),
(26, 'rina_sesta@yahoo.com', 0x3a3a3100000000000000000000000000, '2019-12-08 13:17:59', NULL, 0),
(27, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-08 13:20:36', '09-12-2019 02:05:03 AM', 1),
(28, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-08 20:38:23', NULL, 1),
(29, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-09 12:35:34', NULL, 1),
(30, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-09 14:08:21', NULL, 1),
(31, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-09 16:40:38', '09-12-2019 10:10:45 PM', 1),
(32, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-09 16:40:59', NULL, 0),
(33, 'wafaa@gmail.com', 0x3a3a3100000000000000000000000000, '2019-12-09 16:41:37', '09-12-2019 10:18:24 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'Wafaa', 'wafaa@gmail.com', 195400680, '070aa66550916626673f492bdbdb655f', 'Universiti Teknologi MARA', 'Selangor', 'Shah Alam', 40450, 'Universiti Teknologi MARA', 'Selangor', 'Shah Alam', 40450, '2019-12-08 13:20:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(2, 4, 29, '2019-12-09 14:09:20'),
(3, 4, 35, '2019-12-09 16:43:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
