-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2018 at 10:00 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `AccountNumber` int(11) NOT NULL,
  `OpenDate` datetime DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `idCustomer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`AccountNumber`, `OpenDate`, `Balance`, `idCustomer`) VALUES
(1, '0000-00-00 00:00:00', 10000000, 1),
(2, '0000-00-00 00:00:00', 50000000, 3),
(3, '0000-00-00 00:00:00', 10000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerNumber` int(11) NOT NULL,
  `firsr_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `BirthDay` datetime DEFAULT NULL,
  `PhoneType` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerNumber`, `firsr_name`, `last_name`, `BirthDay`, `PhoneType`, `PhoneNumber`, `username`, `password`) VALUES
(1, 'luqni', 'baehaqu', '0000-00-00 00:00:00', 'Android', '08677365266', 'luqni', 'password'),
(2, 'bambang', 'pamungkas', '0000-00-00 00:00:00', 'iphone', '0987652722', 'bambang', 'bambang'),
(3, 'kurnia', 'mega', '0000-00-00 00:00:00', 'Iphone', '0897646256', 'kurnia', 'mega'),
(4, 'maulana', 'fikri', '0000-00-00 00:00:00', 'Android', '0931844808', 'maulana', 'fikri'),
(5, 'sutan', 'zeko', '0000-00-00 00:00:00', 'Iphone', '0845252242', 'sutan', 'zeko'),
(6, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `id` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Amounnt` double DEFAULT NULL,
  `AmounntSign` varchar(45) DEFAULT NULL,
  `idAccount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Transaction`
--

INSERT INTO `Transaction` (`id`, `Type`, `Amounnt`, `AmounntSign`, `idAccount`) VALUES
(1, 'top go pay', 100000, 'debit', 1),
(2, 'go food', 100000, 'kredit', 1),
(3, 'tarik tunai', 1000000, 'kredit', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`AccountNumber`),
  ADD KEY `fk_Account_idx` (`idCustomer`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerNumber`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Transaction_1_idx` (`AmounntSign`),
  ADD KEY `fk_Transaction_1_idx1` (`idAccount`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `AccountNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `CustomerNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `fk_Account` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`CustomerNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `fk_Transaction_1` FOREIGN KEY (`idAccount`) REFERENCES `Account` (`AccountNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
