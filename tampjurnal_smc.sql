-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 10:00 AM
-- Server version: 10.4.27-MariaDB-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khanza`
--

-- --------------------------------------------------------

--
-- Table structure for table `tampjurnal_smc`
--

CREATE TABLE `tampjurnal_smc` (
  `kd_rek` char(15) NOT NULL,
  `nm_rek` varchar(100) DEFAULT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tampjurnal_smc`
--
ALTER TABLE `tampjurnal_smc`
  ADD PRIMARY KEY (`kd_rek`,`user_id`,`ip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
