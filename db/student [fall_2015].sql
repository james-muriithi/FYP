-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2016 at 07:22 PM
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
-- Table structure for table `student`
--

CREATE TABLE `student` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentEmail`, `studentPhoneNo`, `studentGender`, `studentPassword`, `studentImage`, `groupId`, `isLeader`, `batchId`, `isActive`, `createdDtm`) VALUES
(14, 'Muneeb Khan', '7757', 'muneeb_420@gmail.com', '01234565', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', 'umairqamar@live.com', '03458541454', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', 'bilalhassan@live.com', '+923458541454', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-03 13:30:06'),
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-10 14:28:47'),
(44, 'Najeeb Qureshi', '8781', 'najeeb@gmail.com', '1234567', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-13 14:17:37'),
(45, 'Muhammad Waqar Khan', '7740', 'waqar@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:03:41'),
(46, 'Muhammad Fahad Khan', '7759', 'fahad@hotmail.com', '03356980', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:04:52'),
(47, 'Mohsin Ali Abid', '8658', 'mohsin@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:05:42'),
(48, 'Mazhar Khan', '8627', 'mazhar@yahoo.com', '033564897', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:06:28'),
(49, 'Usman Javaid', '8939', 'usman@gmail.com', '03369872', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:07:23'),
(50, 'Sheraz Anwar', '8660', 'sheraz@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:08:05'),
(51, 'Muhammad Laraib Khan', '8617', 'laraib@yahoo.com', '0336589741', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:09:02'),
(52, 'Ayesha Hashim', '9214', 'ayesha@yahoo.com', '033658970', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:09:52'),
(53, 'Mariya Sajjad', '9331', 'mariya@gmail.com', '033658970', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:11:07'),
(54, 'Hina Arif', '9231', 'hina@gmail.com', '03325689', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:11:45'),
(55, 'Muhammad Adeen Riaz', '8659', 'adeen@yahoo.com', '033658970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:12:34'),
(56, 'Jamal Hussain Siddiqui', '8621', 'jamal@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:13:29'),
(57, 'Muhammad Shahzad', '8857', 'shahzad@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:14:14'),
(58, 'Muhammad Farhan Ali', '7735', 'farhan@yahoo.com', '0335698741', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:14:56'),
(59, 'Haseed Ahmed', '7337', 'haseeb@yahoo.com', '03236116360', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:16:27'),
(60, 'Muhammad Naeem', '7752', 'naeem@hotmail.com', '03135122852', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:18:17'),
(61, 'Zeeshan Ali Khan', '8990', 'zeeshan@yahoo.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:19:08'),
(62, 'Ali Haq', '8647', 'ali@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:19:46'),
(63, 'Waleed Khalid', '8940', 'waleed@yahoo.com', '03445986007', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:21:41'),
(64, 'Muhammad Nabeel Tariq', '9011', 'nabeel@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:23:23'),
(65, 'Muhammad Ateeq Meer', '7530', 'ateeqmeerpro@gmail.com', '03004368436', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:27:59'),
(66, 'Muhammad Asad Ullah Khan', '8861', 'asad@hotmail.com', '0335698712', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:28:57'),
(67, 'Abdul Samad', '8648', 'samad@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:30:51'),
(68, 'Asadullah', '9305', 'asad@gmail.com', '023115864977', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:32:32'),
(69, 'Waqas Abdullah', '7655', 'waqas@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:33:20'),
(70, 'Ali Murtaza', '9268', 'ali@hotmail.com', '03361445566', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:36:26'),
(71, 'Mehran Ali', '8023', 'mehranali8023@hotmail.com', '03315613839', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:38:52'),
(72, 'Syed Wasif Raza', '7414', 'mohsinbrolive@gmail.com', '03341561011', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:41:07'),
(73, 'Muhammad Jamal', '8691', 'jamal@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:42:32'),
(74, 'Hannan Javaid', '9764', 'hannan@gmail.com', '03356890', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:44:19'),
(75, 'Muhammad Ahmed', '9759', 'ahmed@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:45:09'),
(76, 'Muhamad Awais Aryan', '9215', 'awasia@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:45:59'),
(77, 'Muhammad Ahmed Javaid', '9251', 'ahmed@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:47:03'),
(78, 'Syed Kazim Raza', '9264', 'kazim@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:48:02'),
(79, 'Khizar Iqbal', '9574', 'redprince007@gmail.com', '03337390718', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:49:56'),
(80, 'Umair Daud Raja', '9380', 'daud@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:51:03'),
(81, 'Aqib Javed', '9808', 'aqib@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:52:13'),
(82, 'Abdul Basit', '9675', 'basitkhan565@yahoo.com', '03135769291', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:54:24'),
(83, 'Ebad Majeed', '9189', 'ebad@gmail.com', '033569872', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:55:08'),
(84, 'Irfan Khaliq', '9556', 'irfan@gmail.com', '03254698', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:55:48'),
(85, 'Zubair Ali', '9272', 'zubair@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:57:44'),
(86, 'Faizan Hameed', '9548', 'faizan@hotmail.com', '032569871', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:58:32'),
(87, 'Danish Hussain', '9525', 'danish@hotmail.com', '03315458369', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:00:37'),
(88, 'Ahmed Aizaz Abid', '9402', 'aizaz@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:04:32'),
(89, 'Muhammad Ashhar', '9184', 'ashaar@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:11:45'),
(90, 'Ishaq Ibrahim', '9220', 'isac@yahoo.com', '03315810211', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:13:45'),
(91, 'Mohsin Tanveer', '9260', 'mohsin@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:16:38'),
(92, 'Muhammad Saeed Ur Rehman', '9269', 'saeed@yahoo.com', '033658970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:20:13'),
(93, 'Umair Sharif', '9258', 'sharif@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:21:57'),
(94, 'Shoaib Nawaz', '9155', 'nawaz@yahoo.com', '033569810', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:24:16'),
(95, 'Sheikh Awais Ali', '7531', 'sheikhawaisali@ymail.com', '03015631656', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:26:36'),
(96, 'Hina Zameer', '9271', 'zameer@gmail.com', '0335698721', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:27:33'),
(97, 'Madiha Arooj', '9270', 'madiha@gmail.com', '03358976', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:28:45'),
(98, 'Maryam Ilyas', '9807', 'maryam@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:58:18'),
(99, 'Sundas Manzoor', '9734', 'sundas@hotmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 23:59:34'),
(100, 'IFrah Komal', '9584', 'irfah@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-15 00:00:34');

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
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
