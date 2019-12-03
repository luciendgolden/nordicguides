-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2019 at 09:30 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nordicguides`
--
CREATE DATABASE IF NOT EXISTS `nordicguides` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nordicguides`;

-- --------------------------------------------------------

--
-- Table structure for table `annualfee`
--

CREATE TABLE `annualfee` (
  `annualfeeID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `annualfee`
--

INSERT INTO `annualfee` (`annualfeeID`, `memberID`, `year`, `date`, `amount`) VALUES
(1, 2, 2019, '2019-01-24', 15),
(2, 3, 2019, '2019-01-24', 15),
(3, 5, 2019, '2019-01-24', 15),
(4, 1, 2019, '2019-02-15', 20),
(5, 4, 2019, '2019-02-15', 20);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cityID` int(11) NOT NULL,
  `cityname` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cityID`, `cityname`, `country`) VALUES
(1, 'Haparanda', 'Sweden'),
(2, 'Tornio', 'Finland'),
(3, 'Kemi', 'Finland'),
(4, 'Rovaniemi', 'Finland');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `year` int(11) NOT NULL,
  `basicfee` double NOT NULL,
  `duedate` date NOT NULL,
  `extrafee` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`year`, `basicfee`, `duedate`, `extrafee`) VALUES
(2019, 15, '2019-02-01', 20),
(2020, 17, '2020-02-01', 20);

-- --------------------------------------------------------

--
-- Table structure for table `groupcities`
--

CREATE TABLE `groupcities` (
  `groupcityID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupcities`
--

INSERT INTO `groupcities` (`groupcityID`, `groupID`, `cityID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `groupID` int(11) NOT NULL,
  `groupname` varchar(100) NOT NULL,
  `groupdescription` text DEFAULT NULL,
  `contactpersonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`groupID`, `groupname`, `groupdescription`, `contactpersonID`) VALUES
(1, 'Tornio-Haparanda guides', 'Local guides in Tornio-Haparanda area', 3),
(2, 'Kemi guides', 'Local guides in Kemi area', 2),
(3, 'Rovaniemi guides', 'Local guides in Arctic circle area', 5);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `language` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`language`) VALUES
('English'),
('Finnish'),
('French'),
('German'),
('Norwegian'),
('Russian'),
('Sami'),
('Spanish'),
('Swedish');

-- --------------------------------------------------------

--
-- Table structure for table `membergroups`
--

CREATE TABLE `membergroups` (
  `membergroupID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membergroups`
--

INSERT INTO `membergroups` (`membergroupID`, `groupID`, `memberID`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 2, 1),
(5, 2, 2),
(6, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `memberlanguages`
--

CREATE TABLE `memberlanguages` (
  `memberlanguageID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `language` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memberlanguages`
--

INSERT INTO `memberlanguages` (`memberlanguageID`, `memberID`, `language`, `level`) VALUES
(1, 1, 'Finnish', 'Excellent'),
(2, 1, 'Swedish', 'Excellent'),
(3, 1, 'English', 'Excellent'),
(4, 1, 'German', 'Good'),
(5, 2, 'Finnish', 'Excellent'),
(6, 2, 'Swedish', 'Excellent'),
(7, 2, 'English', 'Excellent'),
(8, 3, 'Finnish', 'Excellent'),
(9, 3, 'Swedish', 'Excellent'),
(10, 3, 'Norwegian', 'Good'),
(15, 5, 'Finnish', 'Excellent'),
(16, 5, 'English', 'Excellent'),
(17, 5, 'Swedish', 'Good'),
(18, 5, 'Spanish', 'Good'),
(19, 5, 'French', 'Excellent'),
(22, 4, 'Finnish', 'Excellent'),
(23, 4, 'Swedish', 'Excellent'),
(27, 4, 'English', 'Excellent'),
(28, 4, 'Norwegian', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberID` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'member',
  `driverslicense` varchar(10) DEFAULT NULL,
  `profileimage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `birthdate`, `firstname`, `lastname`, `street`, `city`, `zip`, `phone`, `email`, `password`, `role`, `driverslicense`, `profileimage`) VALUES
(1, NULL, 'John', 'Doe', 'Hallituskatu 1', 'Tornio', '95400', NULL, 'jdoe@lapinamk.fi', 'password', 'member', NULL, NULL),
(2, NULL, 'Mike', 'Stone', 'Meripuistokatu 4', 'Kemi', '94700', NULL, 'mstone@kemi.fi', 'password', 'member', NULL, NULL),
(3, NULL, 'Georg', 'Harrison', 'Strandgata 3', 'Haparanda', '95300', NULL, 'gharrison@haparanda.se', 'password', 'member', NULL, NULL),
(4, '1993-02-23', 'Andy', 'McRoy', 'Kauppakatu 60', 'Tornio', '95400', '05032242332', 'amroy@lapinamk.fi', '$2y$10$gLV2zIB7VjCR7I9JkLmMSe8TrWlw8c1vsIAwJhkvYJNqWUvOCkpvm', 'admin', 'ok', 'yk.jpg'),
(5, NULL, 'Anna', 'Hanson', 'Porokatu 2', 'Rovaniemi', '96300', NULL, 'ahanson@rollo.fi', 'password', 'member', NULL, NULL),
(7, NULL, 'Yrjö', 'Koskenniemi', NULL, NULL, NULL, NULL, 'yrjo.koskenniemi@lapinamk.fi', '$2y$10$bIZ/XjWBfpXzWe4n7IkqFuZ0zu6uBItjra8ng5HRrSdSBKMN6Evly', 'member', NULL, NULL),
(8, NULL, 'Johanna', 'Vuokila', NULL, NULL, NULL, NULL, 'johanna.vuokila@lapinamk.fi', '$2y$10$81lq/meFWmEQ3xjoGgbvTOE74I7E7n1R3HK90MbNDVP0Jni52QIB2', 'member', NULL, NULL),
(9, NULL, 'Juha', 'Orre', NULL, NULL, NULL, NULL, 'juha.orre@lapinamk.fi', '$2y$10$pRXzUWDEp/x.9wdMPk0I0uMB21XFSxbMRlG3.qSvZkEVB36SJawmW', 'member', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annualfee`
--
ALTER TABLE `annualfee`
  ADD PRIMARY KEY (`annualfeeID`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `year` (`year`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityID`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `groupcities`
--
ALTER TABLE `groupcities`
  ADD PRIMARY KEY (`groupcityID`),
  ADD KEY `groupID` (`groupID`),
  ADD KEY `cityID` (`cityID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupID`),
  ADD KEY `contactpersonID` (`contactpersonID`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language`);

--
-- Indexes for table `membergroups`
--
ALTER TABLE `membergroups`
  ADD PRIMARY KEY (`membergroupID`),
  ADD KEY `groupID` (`groupID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `memberlanguages`
--
ALTER TABLE `memberlanguages`
  ADD PRIMARY KEY (`memberlanguageID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annualfee`
--
ALTER TABLE `annualfee`
  MODIFY `annualfeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groupcities`
--
ALTER TABLE `groupcities`
  MODIFY `groupcityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membergroups`
--
ALTER TABLE `membergroups`
  MODIFY `membergroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `memberlanguages`
--
ALTER TABLE `memberlanguages`
  MODIFY `memberlanguageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annualfee`
--
ALTER TABLE `annualfee`
  ADD CONSTRAINT `annualfee_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`),
  ADD CONSTRAINT `annualfee_ibfk_2` FOREIGN KEY (`year`) REFERENCES `fees` (`year`);

--
-- Constraints for table `groupcities`
--
ALTER TABLE `groupcities`
  ADD CONSTRAINT `groupcities_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groups` (`groupID`),
  ADD CONSTRAINT `groupcities_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `cities` (`cityID`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`contactpersonID`) REFERENCES `members` (`memberID`);

--
-- Constraints for table `membergroups`
--
ALTER TABLE `membergroups`
  ADD CONSTRAINT `membergroups_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `groups` (`groupID`),
  ADD CONSTRAINT `membergroups_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`);

--
-- Constraints for table `memberlanguages`
--
ALTER TABLE `memberlanguages`
  ADD CONSTRAINT `memberlanguages_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
