-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 04:55 PM
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
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `text_charges` varchar(200) NOT NULL,
  `final_sum` float NOT NULL,
  `drop_off_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `model` varchar(55) NOT NULL,
  `tank` varchar(55) NOT NULL,
  `car_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `type`, `model`, `tank`, `car_category_id`) VALUES
(1, 'Toyota SUV', 'XRV4', 'full', 0),
(2, 'Mercedes Limosine', 'V200', 'full', 0),
(3, 'VW Mini', 'XS3', 'full', 0),
(4, 'BMW Limosine', 'XA-210', 'full', 0),
(5, 'Volvo Family', 'C500', 'full', 0),
(6, 'Nissan Mini', 'MiniMouse', 'full', 0),
(7, 'Toyota Limosine', 'Corolla', 'full', 0),
(8, 'Mazda Mini', '424S', 'full', 0),
(9, 'VW Family', 'Meran', 'full', 0),
(10, 'Jeep SUV', 'SaharaXT', 'full', 0);

-- --------------------------------------------------------

--
-- Table structure for table `car_category`
--

CREATE TABLE `car_category` (
  `car_category_id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_category`
--

INSERT INTO `car_category` (`car_category_id`, `car_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5);

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

-- --------------------------------------------------------

--
-- Table structure for table `drop_off_contact`
--

CREATE TABLE `drop_off_contact` (
  `drop_off_contact_id` int(11) NOT NULL,
  `drop_off_street` varchar(200) NOT NULL,
  `drop_off_zip_code` smallint(5) NOT NULL,
  `drop_off_city` varchar(200) NOT NULL,
  `drop_off_teln` int(11) NOT NULL,
  `drop_off_email` varchar(55) NOT NULL,
  `drop_off_poi` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drop_off_contact`
--

INSERT INTO `drop_off_contact` (`drop_off_contact_id`, `drop_off_street`, `drop_off_zip_code`, `drop_off_city`, `drop_off_teln`, `drop_off_email`, `drop_off_poi`) VALUES
(1, 'Flughafenstraße 1', 2330, 'Schwechat', 2356653, 'hertz@hertz.at', 'airport'),
(2, 'Mariahilferstraße 1', 1060, 'Wien', 15123456, 'hertz2@hertz.at', 'Train station');

-- --------------------------------------------------------

--
-- Table structure for table `drop_off_location`
--

CREATE TABLE `drop_off_location` (
  `drop_off_location_id` int(11) NOT NULL,
  `drop_off_date_time` datetime DEFAULT NULL,
  `fuel_check` varchar(11) NOT NULL,
  `damages_check` varchar(500) NOT NULL,
  `drop_off_contact_id` int(11) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `d_adress`
--

CREATE TABLE `d_adress` (
  `d_adress_id` int(11) NOT NULL,
  `d_street_n` varchar(200) NOT NULL,
  `d_zip_code` smallint(5) NOT NULL,
  `d_city` varchar(55) NOT NULL,
  `d_country` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `d_adress`
--

INSERT INTO `d_adress` (`d_adress_id`, `d_street_n`, `d_zip_code`, `d_city`, `d_country`) VALUES
(1, 'Cuviergasse 15', 1130, 'Wien', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `d_birthdate`
--

CREATE TABLE `d_birthdate` (
  `d_birthdate_id` int(11) NOT NULL,
  `d_birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `d_birthdate`
--

INSERT INTO `d_birthdate` (`d_birthdate_id`, `d_birthdate`) VALUES
(1, '1980-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `d_creditcard`
--

CREATE TABLE `d_creditcard` (
  `d_creditcard_id` int(11) NOT NULL,
  `d_creditcard_no` bigint(16) NOT NULL,
  `d_creditcard_seccode` smallint(3) NOT NULL,
  `d_creditcard_exmonth` smallint(2) NOT NULL,
  `d_creditcard_exyear` smallint(4) NOT NULL,
  `d_creditcard_brand` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `d_creditcard`
--

INSERT INTO `d_creditcard` (`d_creditcard_id`, `d_creditcard_no`, `d_creditcard_seccode`, `d_creditcard_exmonth`, `d_creditcard_exyear`, `d_creditcard_brand`) VALUES
(1, 1234123412341234, 123, 1, 2019, 'MasterCard');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_sum` float NOT NULL,
  `reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pick_up_contact`
--

CREATE TABLE `pick_up_contact` (
  `pick_up_contact_id` int(11) NOT NULL,
  `pick_up_street` varchar(200) NOT NULL,
  `pick_up_zip_code` smallint(5) NOT NULL,
  `pick_up_city` varchar(200) NOT NULL,
  `pick_up_teln` int(11) NOT NULL,
  `pick_up_email` varchar(55) NOT NULL,
  `pick_up_poi` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pick_up_contact`
--

INSERT INTO `pick_up_contact` (`pick_up_contact_id`, `pick_up_street`, `pick_up_zip_code`, `pick_up_city`, `pick_up_teln`, `pick_up_email`, `pick_up_poi`) VALUES
(1, 'Mariahilferstraße 1', 1060, 'Wien', 15123456, 'hertz2@hertz.at', 'Train station'),
(2, 'Flughafenstraße 1', 2340, 'Schwechat', 2345678, 'hertz@hertz.at', 'airport');

-- --------------------------------------------------------

--
-- Table structure for table `pick_up_location`
--

CREATE TABLE `pick_up_location` (
  `pick_up_location_id` int(11) NOT NULL,
  `pick_up_date_time` datetime DEFAULT NULL,
  `pick_up_contact_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pick_up_location`
--

INSERT INTO `pick_up_location` (`pick_up_location_id`, `pick_up_date_time`, `pick_up_contact_id`) VALUES
(1, '2018-01-03 12:11:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rental_res_car`
--

CREATE TABLE `rental_res_car` (
  `rental_id` int(11) NOT NULL,
  `rental_name_contact` varchar(200) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `car_category_id` int(11) DEFAULT NULL,
  `pick_up_location_id` int(11) DEFAULT NULL,
  `drop_off_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `drop_off_location_id` (`drop_off_location_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_category`
--
ALTER TABLE `car_category`
  ADD PRIMARY KEY (`car_category_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `d_birthdate_id` (`d_birthdate_id`),
  ADD KEY `d_adress_id` (`d_adress_id`),
  ADD KEY `d_creditcard_id` (`d_creditcard_id`);

--
-- Indexes for table `drop_off_contact`
--
ALTER TABLE `drop_off_contact`
  ADD PRIMARY KEY (`drop_off_contact_id`);

--
-- Indexes for table `drop_off_location`
--
ALTER TABLE `drop_off_location`
  ADD PRIMARY KEY (`drop_off_location_id`),
  ADD KEY `drop_off_contact_id` (`drop_off_contact_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- Indexes for table `d_adress`
--
ALTER TABLE `d_adress`
  ADD PRIMARY KEY (`d_adress_id`);

--
-- Indexes for table `d_birthdate`
--
ALTER TABLE `d_birthdate`
  ADD PRIMARY KEY (`d_birthdate_id`);

--
-- Indexes for table `d_creditcard`
--
ALTER TABLE `d_creditcard`
  ADD PRIMARY KEY (`d_creditcard_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `pick_up_contact`
--
ALTER TABLE `pick_up_contact`
  ADD PRIMARY KEY (`pick_up_contact_id`);

--
-- Indexes for table `pick_up_location`
--
ALTER TABLE `pick_up_location`
  ADD PRIMARY KEY (`pick_up_location_id`),
  ADD KEY `pick_up_contact_id` (`pick_up_contact_id`);

--
-- Indexes for table `rental_res_car`
--
ALTER TABLE `rental_res_car`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `car_category_id` (`car_category_id`),
  ADD KEY `pick_up_location_id` (`pick_up_location_id`),
  ADD KEY `drop_off_location_id` (`drop_off_location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `additional_charges_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `car_category`
--
ALTER TABLE `car_category`
  MODIFY `car_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drop_off_contact`
--
ALTER TABLE `drop_off_contact`
  MODIFY `drop_off_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drop_off_location`
--
ALTER TABLE `drop_off_location`
  MODIFY `drop_off_location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_adress`
--
ALTER TABLE `d_adress`
  MODIFY `d_adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `d_birthdate`
--
ALTER TABLE `d_birthdate`
  MODIFY `d_birthdate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `d_creditcard`
--
ALTER TABLE `d_creditcard`
  MODIFY `d_creditcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pick_up_contact`
--
ALTER TABLE `pick_up_contact`
  MODIFY `pick_up_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pick_up_location`
--
ALTER TABLE `pick_up_location`
  MODIFY `pick_up_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rental_res_car`
--
ALTER TABLE `rental_res_car`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`drop_off_location_id`) REFERENCES `drop_off_location` (`drop_off_location_id`);

--
-- Constraints for table `car_category`
--
ALTER TABLE `car_category`
  ADD CONSTRAINT `car_category_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`d_birthdate_id`) REFERENCES `d_birthdate` (`d_birthdate_id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`d_adress_id`) REFERENCES `d_adress` (`d_adress_id`),
  ADD CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`d_creditcard_id`) REFERENCES `d_creditcard` (`d_creditcard_id`);

--
-- Constraints for table `drop_off_location`
--
ALTER TABLE `drop_off_location`
  ADD CONSTRAINT `drop_off_location_ibfk_1` FOREIGN KEY (`drop_off_contact_id`) REFERENCES `drop_off_contact` (`drop_off_contact_id`),
  ADD CONSTRAINT `drop_off_location_ibfk_2` FOREIGN KEY (`rental_id`) REFERENCES `rental_res_car` (`rental_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `pick_up_location`
--
ALTER TABLE `pick_up_location`
  ADD CONSTRAINT `pick_up_location_ibfk_1` FOREIGN KEY (`pick_up_contact_id`) REFERENCES `pick_up_contact` (`pick_up_contact_id`);

--
-- Constraints for table `rental_res_car`
--
ALTER TABLE `rental_res_car`
  ADD CONSTRAINT `rental_res_car_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `rental_res_car_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`car_category_id`) REFERENCES `car_category` (`car_category_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`pick_up_location_id`) REFERENCES `pick_up_location` (`pick_up_location_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`drop_off_location_id`) REFERENCES `drop_off_location` (`drop_off_location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
