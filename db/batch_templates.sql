-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2016 at 04:14 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch_templates`
--

CREATE TABLE `batch_templates` (
  `templateId` int(11) NOT NULL,
  `batchId` int(11) DEFAULT NULL,
  `templateName` varchar(100) DEFAULT NULL,
  `templateLocation` varchar(150) DEFAULT NULL,
  `uploadedDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_templates`
--

INSERT INTO `batch_templates` (`templateId`, `batchId`, `templateName`, `templateLocation`, `uploadedDtm`) VALUES
(13, 12, 'Template -  01 - Project Team.doc', 'Template -  01 - Project Team.doc', '2016-04-15 16:25:49'),
(14, 12, 'Template -  02 - Inital Proposal.doc', 'Template -  02 - Inital Proposal.doc', '2016-04-15 16:26:06'),
(15, 12, 'Template -  04 - Proposal  Plan.doc', 'Template -  04 - Proposal  Plan.doc', '2016-04-15 16:28:39'),
(16, 12, 'Template -  05 - Project Report.doc', 'Template -  05 - Project Report.doc', '2016-04-15 16:32:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch_templates`
--
ALTER TABLE `batch_templates`
  ADD PRIMARY KEY (`templateId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch_templates`
--
ALTER TABLE `batch_templates`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
