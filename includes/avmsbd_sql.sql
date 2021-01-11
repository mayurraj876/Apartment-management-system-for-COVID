-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2020 at 07:25 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(5) NOT NULL,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` char(45) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin user', 'admin', 7898799797, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2020-03-28 06:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `tblowner`
--

CREATE TABLE `tblowner` (
  `ID` int(5) NOT NULL,
  `Ownername` varchar(120) NOT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Apartment` varchar(120) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblowner`
--

INSERT INTO `tblowner` (`ID`, `Ownername`, `MobileNumber`, `Address`, `Apartment`, `email`, `password`, `EnterDate`, `remark`, `outtime`) VALUES
(4, 'test16', 0, 'bangalore', '105', 'test16@gmail.com', 'testpass', '2020-04-13 10:22:52', NULL, NULL),
(5, 'test20', 0, NULL, '108', '', '', '2020-04-13 10:30:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblqua`
--

CREATE TABLE `tblqua` (
  `ID` int(5) NOT NULL,
  `Quarantinename` varchar(120) NOT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Apartment` varchar(120) NOT NULL,
  `status` varchar(50) NOT NULL,
  `startdate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblqua`
--

INSERT INTO `tblqua` (`ID`, `Quarantinename`, `MobileNumber`, `Apartment`, `status`, `startdate`, `remark`, `enddate`) VALUES
(1, 'mayur', 4567891230, '101', '', '2020-03-29 07:58:49', '', '2020-04-30'),
(2, 'test13', 1236547895, '102', '', '2020-04-13 04:57:30', NULL, NULL),
(3, 'test2', 3245659815, '102', '', '2020-04-13 04:57:58', NULL, NULL),
(4, 'test19', 566532155, '103', '', '2020-04-13 10:28:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitor`
--

CREATE TABLE `tblvisitor` (
  `ID` int(5) NOT NULL,
  `VisitorName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Apartment` varchar(120) NOT NULL,
  `Floor` varchar(120) NOT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblowner`
--
ALTER TABLE `tblowner`
  ADD PRIMARY KEY (`Apartment`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `tblqua`
--
ALTER TABLE `tblqua`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `apartfk` (`Apartment`);

--
-- Indexes for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `apartfkV` (`Apartment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblowner`
--
ALTER TABLE `tblowner`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblqua`
--
ALTER TABLE `tblqua`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  ADD CONSTRAINT `apartfkV` FOREIGN KEY (`Apartment`) REFERENCES `tblowner` (`Apartment`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
