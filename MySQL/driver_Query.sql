-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 05:09 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_nina_smolen_wilson_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `d_first_n` varchar(55) NOT NULL,
  `d_last_n` varchar(55) NOT NULL,
  `d_email` varchar(55) NOT NULL,
  `d_dlicense_n` int(11) NOT NULL,
  `d_birthdate_id` int(11) DEFAULT NULL,
  `d_adress_id` int(11) DEFAULT NULL,
  `d_creditcard_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `d_first_n`, `d_last_n`, `d_email`, `d_dlicense_n`, `d_birthdate_id`, `d_adress_id`, `d_creditcard_id`) VALUES
(2, 'Nina', 'Smolen', 'nina@nina.at', 121234, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `d_birthdate_id` (`d_birthdate_id`),
  ADD KEY `d_adress_id` (`d_adress_id`),
  ADD KEY `d_creditcard_id` (`d_creditcard_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`d_birthdate_id`) REFERENCES `d_birthdate` (`d_birthdate_id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`d_adress_id`) REFERENCES `d_adress` (`d_adress_id`),
  ADD CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`d_creditcard_id`) REFERENCES `d_creditcard` (`d_creditcard_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
