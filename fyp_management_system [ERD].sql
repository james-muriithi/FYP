-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2016 at 07:10 PM
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
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batchId` int(255) NOT NULL,
  `batchName` varchar(255) NOT NULL,
  `startingDate` date DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '0' COMMENT '0= inactive , 1= active',
  `sdpPart` tinyint(1) DEFAULT '1' COMMENT '0 or 1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `startingDate`, `isActive`, `sdpPart`, `createdDtm`) VALUES
(18, 'Spring 2016', '2016-02-07', 1, 2, '2016-04-17 21:55:46'),
(19, 'Fall 2016', '2016-04-28', 1, 1, '2016-04-23 00:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `batch_tasks`
--

CREATE TABLE `batch_tasks` (
  `taskId` int(11) NOT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` tinyint(1) DEFAULT '1',
  `taskName` text,
  `taskDetail` text,
  `taskWeek` int(11) DEFAULT NULL,
  `taskDeadline` datetime DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `hasDeliverable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=has deliverable',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_tasks`
--

INSERT INTO `batch_tasks` (`taskId`, `batchId`, `sdpPart`, `taskName`, `taskDetail`, `taskWeek`, `taskDeadline`, `templateId`, `hasDeliverable`, `createdDtm`) VALUES
(1, 18, 1, 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use <b>â€œTemplate-01â€</b> to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 25th April 2016 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 3, '2016-04-25 15:30:00', 4, 1, '2016-04-21 21:48:26');

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
(3, 18, 'Handbook-Version-2-0.pdf', 'Handbook-Version-2-0.pdf', '2016-04-21 20:26:59'),
(4, 18, 'Template -  01 - Project Team.doc', 'Template -  01 - Project Team.doc', '2016-04-21 20:27:02'),
(5, 18, 'Template -  02 - Inital Proposal.doc', 'Template -  02 - Inital Proposal.doc', '2016-04-21 20:27:06'),
(6, 18, 'Template -  04 - Proposal  Plan.doc', 'Template -  04 - Proposal  Plan.doc', '2016-04-21 20:27:56'),
(7, 18, 'Template -  05 - Project Report.doc', 'Template -  05 - Project Report.doc', '2016-04-21 20:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner`
--

CREATE TABLE `external_examiner` (
  `examinerId` int(255) NOT NULL,
  `examinerName` varchar(100) NOT NULL,
  `examinerEmail` varchar(255) NOT NULL,
  `examinerPhone` varchar(50) NOT NULL,
  `examinerPassword` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='examinerGroupInfo';

--
-- Dumping data for table `external_examiner`
--

INSERT INTO `external_examiner` (`examinerId`, `examinerName`, `examinerEmail`, `examinerPhone`, `examinerPassword`, `company`, `designation`, `isActive`) VALUES
(1, 'Bill Gates', 'gates@microsoft.com', '1234567890', '123', 'Microsoft', 'CEO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `facultyId` int(255) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyImage` varchar(255) DEFAULT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `isCoordinator` tinyint(1) DEFAULT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `facultyName`, `facultyPhoneNo`, `facultyEmail`, `designation`, `facultyImage`, `facultyPassword`, `isAdmin`, `isCoordinator`, `createdDtm`) VALUES
(0, 'Super Admin', '', 'superadmin@fypms.com', '--', NULL, '123', 1, 0, '0000-00-00 00:00:00'),
(18, 'Saud Khan', '+923458541454', 'saudkhan@riu.edu.pk', 'Coordinator', '5715310b853707.98279886.jpg', '123', 0, 1, '2016-04-17 20:45:12'),
(19, 'Muhammad Fawad Chaudry', '12345678', 'fawadch@gmail.com', 'Supervisor', NULL, '123', 0, NULL, '2016-04-20 20:18:57'),
(20, 'Uzair Muhammad', '12345678', 'muzair@gmail.com', 'Supervisor', NULL, '123', 0, NULL, '2016-04-20 20:20:44'),
(21, 'Zeeshan Sabir', '12345678', 'zeeshan@gmail.com', 'Supervisor', NULL, '123', 0, NULL, '2016-04-20 20:22:22'),
(22, 'Osama Raza', '12345678', 'osama@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-20 20:41:59'),
(23, 'Hajra Murtaza', '12345678', 'hajra@gmail.com', 'Supervisor', NULL, '123', 0, NULL, '2016-04-20 23:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_group`
--

CREATE TABLE `faculty_student_group` (
  `facultyStudentId` int(255) NOT NULL,
  `groupId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='facultyGroupInfo';

--
-- Dumping data for table `faculty_student_group`
--

INSERT INTO `faculty_student_group` (`facultyStudentId`, `groupId`, `facultyId`) VALUES
(2, 1, 21),
(3, 4, 23);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_request`
--

CREATE TABLE `faculty_student_request` (
  `requestId` int(11) NOT NULL,
  `facultyId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `requestDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `comments` text,
  `grade` varchar(50) DEFAULT NULL,
  `gradedBy` int(11) DEFAULT NULL COMMENT 'User id of user',
  `gradeDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `studentId`, `groupId`, `sdpPart`, `comments`, `grade`, `gradedBy`, `gradeDtm`) VALUES
(4, 14, 1, 2, '', 'A', 1, '2016-04-22 00:31:52'),
(5, 15, 1, 2, '', 'A', 1, '2016-04-22 00:31:52'),
(6, 21, 1, 2, '', 'B', 1, '2016-04-22 00:31:53'),
(7, 14, 1, 1, '', 'A', 21, '2016-04-22 00:34:28'),
(8, 15, 1, 1, '', 'A', 21, '2016-04-22 00:34:28'),
(9, 21, 1, 1, '', 'B+', 21, '2016-04-22 00:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `group_requests`
--

CREATE TABLE `group_requests` (
  `requestId` int(255) NOT NULL,
  `studentId` int(255) NOT NULL,
  `groupId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_uploads`
--

CREATE TABLE `group_uploads` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  `uploadFile` varchar(50) NOT NULL,
  `uploadedBy` int(11) NOT NULL COMMENT 'userId of uploader',
  `uploadedDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_uploads`
--

INSERT INTO `group_uploads` (`id`, `groupId`, `taskId`, `uploadFile`, `uploadedBy`, `uploadedDtm`) VALUES
(1, 1, 1, 'group_1_deliverable_1.doc', 15, '2016-04-21 21:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_logs`
--

CREATE TABLE `meeting_logs` (
  `id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `meeting_title` varchar(50) NOT NULL,
  `meeting_dtm` datetime NOT NULL,
  `comments` text,
  `meeting_status` enum('Pending','Done','Cancelled','Postponed') NOT NULL DEFAULT 'Pending',
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintain all meeting logs of supervisors with students';

--
-- Dumping data for table `meeting_logs`
--

INSERT INTO `meeting_logs` (`id`, `supervisor_id`, `group_id`, `meeting_title`, `meeting_dtm`, `comments`, `meeting_status`, `created_dtm`) VALUES
(1, 21, 1, 'Meeting 01 - Group Formation', '2016-04-30 15:30:00', '', 'Done', '2016-04-21 22:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `project_repository`
--

CREATE TABLE `project_repository` (
  `id` int(11) NOT NULL,
  `batchId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_repository`
--

INSERT INTO `project_repository` (`id`, `batchId`) VALUES
(1, 18);

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
(14, 'Muneeb Khan', '7757', 'muneeb_420@gmail.com', '01234565', 'male', '123', '56fff928b82971.36534035.jpg', 1, NULL, 18, 1, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', 'umairqamar@live.com', '03458541454', 'male', '123', '57178d49d31f15.75642865.jpg', 1, 1, 18, 1, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', 'bilalhassan@live.com', '+923458541454', 'male', '123', '56fff9374231d1.64504225.jpg', 1, NULL, 18, 1, '2016-04-03 13:30:06'),
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-10 14:28:47'),
(44, 'Najeeb Qureshi', '8781', 'najeeb@gmail.com', '1234567', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-13 14:17:37'),
(45, 'Muhammad Waqar Khan', '7740', 'waqar@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:03:41'),
(46, 'Muhammad Fahad Khan', '7759', 'fahad@hotmail.com', '03356980', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:04:52'),
(47, 'Mohsin Ali Abid', '8658', 'mohsin@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:05:42'),
(48, 'Mazhar Khan', '8627', 'mazhar@yahoo.com', '033564897', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:06:28'),
(49, 'Usman Javaid', '8939', 'usman@gmail.com', '03369872', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:07:23'),
(50, 'Sheraz Anwar', '8660', 'sheraz@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:08:05'),
(51, 'Muhammad Laraib Khan', '8617', 'laraib@yahoo.com', '0336589741', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:09:02'),
(52, 'Ayesha Hashim', '9214', 'ayesha@yahoo.com', '033658970', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:09:52'),
(53, 'Mariya Sajjad', '9331', 'mariya@gmail.com', '033658970', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:11:07'),
(54, 'Hina Arif', '9231', 'hina@gmail.com', '03325689', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:11:45'),
(55, 'Muhammad Adeen Riaz', '8659', 'adeen@yahoo.com', '033658970', 'male', '123', NULL, 4, 1, 18, 1, '2016-04-14 22:12:34'),
(56, 'Jamal Hussain Siddiqui', '8621', 'jamal@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:13:29'),
(57, 'Muhammad Shahzad', '8857', 'shahzad@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:14:14'),
(58, 'Muhammad Farhan Ali', '7735', 'farhan@yahoo.com', '0335698741', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:14:56'),
(59, 'Haseeb Ahmed', '7337', 'haseeb@yahoo.com', '03236116360', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:16:27'),
(60, 'Muhammad Naeem', '7752', 'naeem@hotmail.com', '03135122852', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:18:17'),
(61, 'Zeeshan Ali Khan', '8990', 'zeeshan@yahoo.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:19:08'),
(62, 'Ali Haq', '8647', 'ali@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:19:46'),
(63, 'Waleed Khalid', '8940', 'waleed@yahoo.com', '03445986007', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:21:41'),
(64, 'Muhammad Nabeel Tariq', '9011', 'nabeel@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:23:23'),
(65, 'Muhammad Ateeq Meer', '7530', 'ateeqmeer@gmail.com', '03004368436', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:27:59'),
(66, 'Muhammad Asad Ullah Khan', '8861', 'asad@hotmail.com', '0335698712', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:28:57'),
(67, 'Abdul Samad', '8648', 'samad@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:30:51'),
(68, 'Asadullah', '9305', 'asad@gmail.com', '023115864977', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:32:32'),
(69, 'Waqas Abdullah', '7655', 'waqas@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:33:20'),
(70, 'Ali Murtaza', '9268', 'ali@hotmail.com', '03361445566', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:36:26'),
(71, 'Mehran Ali', '8023', 'mehranali8023@hotmail.com', '03315613839', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:38:52'),
(72, 'Syed Wasif Raza', '7414', 'swasif@gmail.com', '03341561011', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:41:07'),
(73, 'Muhammad Jamal', '8691', 'jamal@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:42:32'),
(74, 'Hannan Javaid', '9764', 'hannan@gmail.com', '03356890', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:44:19'),
(75, 'Muhammad Ahmed', '9759', 'ahmed@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:45:09'),
(76, 'Muhamad Awais Aryan', '9215', 'awasia@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:45:59'),
(77, 'Muhammad Ahmed Javaid', '9251', 'ahmed@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:47:03'),
(78, 'Syed Kazim Raza', '9264', 'kazim@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:48:02'),
(79, 'Khizar Iqbal', '9574', 'redprince007@gmail.com', '03337390718', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:49:56'),
(80, 'Umair Daud Raja', '9380', 'daud@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:51:03'),
(81, 'Aqib Javed', '9808', 'aqib@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:52:13'),
(82, 'Abdul Basit', '9675', 'basitkhan565@yahoo.com', '03135769291', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:54:24'),
(83, 'Ebad Majeed', '9189', 'ebad@gmail.com', '033569872', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:55:08'),
(84, 'Irfan Khaliq', '9556', 'irfan@gmail.com', '03254698', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:55:48'),
(85, 'Zubair Ali', '9272', 'zubair@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:57:44'),
(86, 'Faizan Hameed', '9548', 'faizan@hotmail.com', '032569871', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 22:58:32'),
(87, 'Danish Hussain', '9525', 'danish@hotmail.com', '03315458369', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:00:37'),
(88, 'Ahmed Aizaz Abid', '9402', 'aizaz@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:04:32'),
(89, 'Muhammad Ashhar', '9184', 'ashaar@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:11:45'),
(90, 'Ishaq Ibrahim', '9220', 'isac@yahoo.com', '03315810211', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:13:45'),
(91, 'Mohsin Tanveer', '9260', 'mohsin@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:16:38'),
(92, 'Muhammad Saeed Ur Rehman', '9269', 'saeed@yahoo.com', '033658970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:20:13'),
(93, 'Umair Sharif', '9258', 'sharif@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:21:57'),
(94, 'Shoaib Nawaz', '9155', 'nawaz@yahoo.com', '033569810', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:24:16'),
(95, 'Sheikh Awais Ali', '7531', 'sheikhawais@gmail.com', '03015631656', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:26:36'),
(96, 'Hina Zameer', '9271', 'zameer@gmail.com', '0335698721', 'female', '123', NULL, 5, NULL, 18, 1, '2016-04-14 23:27:33'),
(97, 'Madiha Arooj', '9270', 'madiha@gmail.com', '03358976', 'female', '123', NULL, 5, 1, 18, 1, '2016-04-14 23:28:45'),
(98, 'Maryam Ilyas', '9807', 'maryam@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:58:18'),
(99, 'Sundas Manzoor', '9734', 'sundas@hotmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:59:34'),
(100, 'Ifrah Komal', '9584', 'irfah@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `groupId` int(255) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(1) NOT NULL DEFAULT '1' COMMENT 'Here to check before deleting group',
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupInfo';

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`groupId`, `projectName`, `batchId`, `sdpPart`, `groupLimit`, `inGroup`, `leaderId`, `createdDtm`) VALUES
(1, 'FYP Management System', 18, 1, 3, 3, 15, '2016-04-19 21:11:33'),
(4, 'RSATS', 18, 1, 3, 1, 55, '2016-04-19 22:54:02'),
(5, 'Online Menu', 18, 1, 3, 2, 97, '2016-04-20 00:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `student_group_request`
--

CREATE TABLE `student_group_request` (
  `requestId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL COMMENT 'Request sent by',
  `groupId` int(11) NOT NULL COMMENT 'Request sent to group',
  `requestDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Requests sent to join a group a stored here temporarilty';

-- --------------------------------------------------------

--
-- Table structure for table `timeline_faculty`
--

CREATE TABLE `timeline_faculty` (
  `id` int(11) NOT NULL,
  `title` text,
  `details` text,
  `type` varchar(50) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='timeline for faculty';

--
-- Dumping data for table `timeline_faculty`
--

INSERT INTO `timeline_faculty` (`id`, `title`, `details`, `type`, `batchId`, `sdpPart`, `createdDtm`) VALUES
(4, 'Batch Upgraded', 'Spring 2016has been upgraded to Senior Design Project Part 2', 'info', 18, 2, '2016-04-23 00:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_student`
--

CREATE TABLE `timeline_student` (
  `id` int(11) NOT NULL,
  `title` text,
  `details` text,
  `type` varchar(50) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Timeline for students';

--
-- Dumping data for table `timeline_student`
--

INSERT INTO `timeline_student` (`id`, `title`, `details`, `type`, `taskId`, `batchId`, `sdpPart`, `createdDtm`) VALUES
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Zeeshan Sabir is now supervising group FYP Management System', 'info', NULL, 18, 1, '2016-04-22 23:57:34'),
(2, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Hajra Murtaza is now supervising group RSATS', 'info', NULL, 18, 1, '2016-04-22 23:57:33'),
(3, 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use <b>â€œTemplate-01â€</b> to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 25th April 2016 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 'task', 1, 18, 1, '2016-04-21 21:48:26'),
(7, 'Batch Upgraded', 'Spring 2016has been upgraded to Senior Design Project Part 2', 'info', NULL, 18, 2, '2016-04-23 00:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `work_load`
--

CREATE TABLE `work_load` (
  `loadId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL,
  `totalLoad` int(255) NOT NULL,
  `currentLoad` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='workload_Info';

--
-- Dumping data for table `work_load`
--

INSERT INTO `work_load` (`loadId`, `facultyId`, `totalLoad`, `currentLoad`) VALUES
(9, 18, 0, 0),
(10, 19, 1, 0),
(11, 20, 2, 0),
(12, 21, 1, 1),
(13, 22, 1, 0),
(14, 23, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batchId`);

--
-- Indexes for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  ADD PRIMARY KEY (`taskId`),
  ADD KEY `FK_batch_tasks_batch` (`batchId`);

--
-- Indexes for table `batch_templates`
--
ALTER TABLE `batch_templates`
  ADD PRIMARY KEY (`templateId`),
  ADD KEY `FK_batch_templates_batch` (`batchId`);

--
-- Indexes for table `external_examiner`
--
ALTER TABLE `external_examiner`
  ADD PRIMARY KEY (`examinerId`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`facultyId`);

--
-- Indexes for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  ADD PRIMARY KEY (`facultyStudentId`),
  ADD KEY `fk_group_id` (`groupId`),
  ADD KEY `fk_faculty_id` (`facultyId`);

--
-- Indexes for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `FK_faculty_student_request_faculty` (`facultyId`),
  ADD KEY `FK_faculty_student_request_faculty_student_group` (`groupId`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_grades_student` (`studentId`),
  ADD KEY `FK_grades_student_group` (`groupId`);

--
-- Indexes for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `FK_group_requests_student` (`studentId`),
  ADD KEY `FK_group_requests_student_group` (`groupId`);

--
-- Indexes for table `group_uploads`
--
ALTER TABLE `group_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_group_uploads_faculty_student_group` (`groupId`),
  ADD KEY `FK_group_uploads_batch_tasks` (`taskId`),
  ADD KEY `FK_group_uploads_student` (`uploadedBy`);

--
-- Indexes for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_meeting_logs_faculty` (`supervisor_id`),
  ADD KEY `FK_meeting_logs_faculty_student_group` (`group_id`);

--
-- Indexes for table `project_repository`
--
ALTER TABLE `project_repository`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_project_repository_batch` (`batchId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`),
  ADD KEY `FK_student_batch` (`batchId`);

--
-- Indexes for table `student_group`
--
ALTER TABLE `student_group`
  ADD PRIMARY KEY (`groupId`),
  ADD KEY `FK_student_group_batch` (`batchId`),
  ADD KEY `FK_student_group_student` (`leaderId`);

--
-- Indexes for table `student_group_request`
--
ALTER TABLE `student_group_request`
  ADD PRIMARY KEY (`requestId`),
  ADD KEY `FK_student_group_request_student` (`studentId`),
  ADD KEY `FK_student_group_request_student_group` (`groupId`);

--
-- Indexes for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_timeline_faculty_batch` (`batchId`);

--
-- Indexes for table `timeline_student`
--
ALTER TABLE `timeline_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_timeline_student_batch_tasks` (`taskId`),
  ADD KEY `FK_timeline_student_batch_tasks_2` (`batchId`);

--
-- Indexes for table `work_load`
--
ALTER TABLE `work_load`
  ADD PRIMARY KEY (`loadId`),
  ADD KEY `FK_work_load_faculty` (`facultyId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `batch_templates`
--
ALTER TABLE `batch_templates`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `external_examiner`
--
ALTER TABLE `external_examiner`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `requestId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_uploads`
--
ALTER TABLE `group_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project_repository`
--
ALTER TABLE `project_repository`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `student_group_request`
--
ALTER TABLE `student_group_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `timeline_student`
--
ALTER TABLE `timeline_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  ADD CONSTRAINT `FK_batch_tasks_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `batch_templates`
--
ALTER TABLE `batch_templates`
  ADD CONSTRAINT `FK_batch_templates_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  ADD CONSTRAINT `fk_faculty_id` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`),
  ADD CONSTRAINT `fk_group_id` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  ADD CONSTRAINT `FK_faculty_student_request_faculty` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_faculty_student_request_faculty_student_group` FOREIGN KEY (`groupId`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `FK_grades_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_grades_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD CONSTRAINT `FK_group_requests_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_requests_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `group_uploads`
--
ALTER TABLE `group_uploads`
  ADD CONSTRAINT `FK_group_uploads_batch_tasks` FOREIGN KEY (`taskId`) REFERENCES `batch_tasks` (`taskId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_uploads_faculty_student_group` FOREIGN KEY (`groupId`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_uploads_student` FOREIGN KEY (`uploadedBy`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD CONSTRAINT `FK_meeting_logs_faculty` FOREIGN KEY (`supervisor_id`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_meeting_logs_faculty_student_group` FOREIGN KEY (`group_id`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_repository`
--
ALTER TABLE `project_repository`
  ADD CONSTRAINT `FK_project_repository_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `FK_student_group_student` FOREIGN KEY (`leaderId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_group_request`
--
ALTER TABLE `student_group_request`
  ADD CONSTRAINT `FK_student_group_request_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_student_group_request_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  ADD CONSTRAINT `FK_timeline_faculty_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `timeline_student`
--
ALTER TABLE `timeline_student`
  ADD CONSTRAINT `FK_timeline_student_batch_tasks` FOREIGN KEY (`taskId`) REFERENCES `batch_tasks` (`taskId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_timeline_student_batch_tasks_2` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work_load`
--
ALTER TABLE `work_load`
  ADD CONSTRAINT `FK_work_load_faculty` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
