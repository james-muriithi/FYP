-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2016 at 10:05 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

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
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studentId` int(255) NOT NULL,
  `studentName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentCMS` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentEmail` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentPhoneNo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentGender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `studentPassword` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentImage` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `groupId` int(255) DEFAULT NULL,
  `isLeader` int(1) DEFAULT NULL,
  `batchId` int(4) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentEmail`, `studentPhoneNo`, `studentGender`, `studentPassword`, `studentImage`, `groupId`, `isLeader`, `batchId`, `isActive`, `createdDtm`) VALUES
(101, 'Abdul Basit', '9477', 'basit@gmail.com', '033456987', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:11:34'),
(102, 'M.Waleed Nasir', '9793', 'waleed@gmail.com', '033456987', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:12:19'),
(103, 'Faizan Mujahid', '9358', 'mujahid@gmail.com', '03356987411', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:13:04'),
(104, 'Abdul Majid Khan', '10433', 'khan@gmail.com', '03389745', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:13:54'),
(105, 'Mirza Mobeen Ahmed', '10657', 'mirza@gmail.com', '03369870', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:14:52'),
(106, 'Ijlal Hussain Amiry', '10501', 'ijlal@gmail.com', '033568970', 'male', '12', NULL, NULL, NULL, 19, 1, '2016-04-22 12:15:58'),
(107, 'Bakhtawar Rubab', '10679', 'bakhtawar@gmail.com', '0336987012', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:17:21'),
(108, 'Sehrish Saba Bhatti', '9643', 'sehrish@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:18:42'),
(109, 'Lalarukh', '9619', 'lalarukh@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:20:08'),
(110, 'Hamza Abbasi', '9465', 'hamza@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:21:34'),
(111, 'Junaid Munir', '9406', 'junaid@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:24:31'),
(112, 'Aitezaz Mohsin', '10412', 'aitezaz@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:25:15'),
(113, 'Syed Ihtesham Hussain', '9724', 'syed@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:26:17'),
(114, 'Umair Masood Bhatti', '9249', 'umair@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:27:00'),
(115, 'Faiza Bashir', '9871', 'faiza@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:27:45'),
(116, 'Fatima Aslam Khan', '9292', 'fatima@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:29:32'),
(117, 'Sundas Saeed', '10395', 'sundas@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:33:15'),
(118, 'Zoubaria Nourees', '10684', 'zoubairia@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:34:02'),
(119, 'Sara Amir', '10392', 'sara@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:34:37'),
(120, 'Amina Zahid', '10551', 'amina@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:35:15'),
(121, 'Waqar Muneeb', '10639', 'waqar@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:36:05'),
(122, 'Ahmad Azzam Amir', '10742', 'ahmad@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:36:56'),
(123, 'Mirza Abdul Rehman', '10371', 'abdul@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:37:52'),
(124, 'Rizwan Muhammad', '7527', 'rahi@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:38:45'),
(125, 'Muhammad Danish Khan', '8623', 'danish@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:41:26'),
(126, 'Waleed Zahid Baloch', '10370', 'zahid@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:42:20'),
(127, 'Ayesha Naseer', '10394', 'ayesha@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:43:13'),
(128, 'Benazir Ashraf', '10438', 'benazir@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:44:04'),
(129, 'Fatima Haider', '10656', 'fatimaHaider@gmail.com', '', 'female', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:45:09'),
(130, 'Sheran Sharif', '10432', 'sheran@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:45:53'),
(131, 'Kashif Ali', '10485', 'kashif@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:46:44'),
(132, 'Salman Asif', '10450', 'salman@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:47:46'),
(133, 'Muhammad Asif', '8907', 'asif@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:48:28'),
(134, 'Muhammad Suhail', '9172', 'suhail@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:49:08'),
(135, 'Muhamad Shafee', '9286', 'shafee@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:49:47'),
(136, 'Muhammad Sajid', '10369', 'sajid@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:50:31'),
(137, 'Syed Ali Wasif Dariya Kazmi', '10490', 'kazmi@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:51:30'),
(138, 'Abdullah Zaheer', '10363', 'zaheer@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:52:14'),
(139, 'Majid Khawar', '10406', 'majid@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:52:51'),
(140, 'Muhammad Suhaib', '9278', 'suhaib@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:53:32'),
(141, 'Huzaifa Tahir', '9245', 'huzaifa@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:54:10'),
(142, 'Muhammad Majid', '9207', 'muhammadMajid@gmail.com', '', 'male', '123', NULL, NULL, NULL, 19, 1, '2016-04-22 12:55:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=143;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
