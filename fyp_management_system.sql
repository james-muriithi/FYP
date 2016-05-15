-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2016 at 07:33 PM
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
  `sdpPart` tinyint(4) DEFAULT '1' COMMENT '0 or 1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `startingDate`, `isActive`, `sdpPart`, `createdDtm`) VALUES
(1, 'Fall 2015', '2016-09-04', 1, 1, '2016-05-12 23:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `batch_settings`
--

CREATE TABLE `batch_settings` (
  `id` int(11) NOT NULL,
  `batchId` int(11) NOT NULL DEFAULT '0',
  `male_female_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no;1=yes',
  `sdp1_grading` tinyint(1) NOT NULL DEFAULT '0',
  `internal_evaluation` tinyint(1) NOT NULL DEFAULT '0',
  `sdp2_grading` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_settings`
--

INSERT INTO `batch_settings` (`id`, `batchId`, `male_female_group`, `sdp1_grading`, `internal_evaluation`, `sdp2_grading`) VALUES
(1, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch_tasks`
--

CREATE TABLE `batch_tasks` (
  `taskId` int(11) NOT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` varchar(50) DEFAULT '1',
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
(1, 1, '1', 'Orientation Presentation', '<p>asfdsa</p>', 1, NULL, NULL, 1, '2016-05-15 20:53:12');

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
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='examinerGroupInfo';

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
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `facultyName`, `facultyPhoneNo`, `facultyEmail`, `designation`, `facultyImage`, `facultyPassword`, `isAdmin`, `isCoordinator`, `isActive`, `createdDtm`) VALUES
(0, 'Super Admin', '', 'superadmin@fypms.com', '--', NULL, '123', 1, 0, 1, '0000-00-00 00:00:00'),
(30, 'Saud Khan', '+923458541454', 'saudkhan@riu.edu.pk', 'Coordinator', '5734c6597d84b3.34254190.jpg', '123', 0, 1, 1, '2016-05-12 23:06:47'),
(31, 'Muhammad Fawad Chaudry', '', 'fawad@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:24:27'),
(32, 'Uzair Muhammad', '', 'uzair@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:24:57'),
(33, 'Hajra Murtaza', '', 'hajra@gmail.com', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:25:17'),
(34, 'Musharif Ahmed', '', 'musharif@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:25:38'),
(35, 'Syed Sharjeel Ahmed Gilani', '', 'sharjeel@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:26:06'),
(36, 'Muhammad Osama Raza', '', 'osama@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:26:23'),
(37, 'Samir Obaid', '', 'samir@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:26:38'),
(38, 'Rizwan Bin Faiz', '', 'rizwan@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:26:56'),
(39, 'Sheheryar Malik', '', 'sheheryar@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:27:26'),
(40, 'Adeel Zafar', '', 'adeel@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:27:45'),
(41, 'Naveed Ikram', '', 'naveed@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, 1, '2016-05-14 13:28:06');

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
(1, 1, 30);

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
(1, 1, 1, 'group_1_deliverable_1.pdf', 43, '2016-05-15 20:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `internal_evaluations`
--

CREATE TABLE `internal_evaluations` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `votedBy` int(11) NOT NULL COMMENT 'facultyId of Gradedby',
  `aeVote` int(11) NOT NULL COMMENT 'Allow External Exam',
  `ohVote` int(11) NOT NULL COMMENT 'Allow Partition in Open House'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectId` int(11) DEFAULT NULL,
  `projectName` varchar(50) DEFAULT NULL,
  `projectStatus` tinyint(4) DEFAULT NULL COMMENT '1=SDP-1 ,2=SDP-2,3=Passed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `repository_users`
--

CREATE TABLE `repository_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `user_email` varchar(50) NOT NULL DEFAULT '0',
  `user_password` varchar(50) DEFAULT NULL,
  `access_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1= full-access '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repository_users`
--

INSERT INTO `repository_users` (`user_id`, `user_name`, `user_email`, `user_password`, `access_type`) VALUES
(3, 'Umair Qamar', 'umairqamar@live.com', '123', 1);

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
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', '5734d46c70da79.56514541.jpg', 1, 1, 1, 1, '2016-04-10 14:28:47'),
(44, 'Najeeb Qureshi', '8781', 'najeeb@gmail.com', '1234567', 'male', '123', '5734d476024d93.45721196.jpg', 1, NULL, 1, 1, '2016-04-13 14:17:37'),
(45, 'Muhammad Waqar Khan', '7740', 'waqar@gmail.com', '033569870', 'male', '123', '5734d47dc58770.26480061.jpg', 1, NULL, 1, 1, '2016-04-14 22:03:41'),
(46, 'Muhammad Fahad Khan', '7759', 'fahad@hotmail.com', '03356980', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:04:52'),
(47, 'Mohsin Ali Abid', '8658', 'mohsin@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:05:42'),
(48, 'Mazhar Khan', '8627', 'mazhar@yahoo.com', '033564897', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:06:28'),
(49, 'Usman Javaid', '8939', 'usman@gmail.com', '03369872', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:07:23'),
(50, 'Sheraz Anwar', '8660', 'sheraz@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:08:05'),
(51, 'Muhammad Laraib Khan', '8617', 'laraib@yahoo.com', '0336589741', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:09:02'),
(52, 'Ayesha Hashim', '9214', 'ayesha@yahoo.com', '033658970', 'female', '123', NULL, 2, 1, 1, 1, '2016-04-14 22:09:52'),
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
(1, 'Club Cricket Info', 1, 1, 3, 3, 43, '2016-05-12 23:17:47'),
(2, 'Vine Tube', 1, 1, 3, 1, 52, '2016-05-14 17:05:22');

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
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Club Cricket Info', 'info', 1, 0, '2016-05-12 23:21:31');

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
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Club Cricket Info', 'info', NULL, 1, 0, '2016-05-12 23:21:30'),
(2, 'Orientation Presentation', '<p>asfdsa</p>', 'task', 1, 1, 1, '2016-05-15 20:53:12');

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
(1, 30, 3, 1),
(2, 31, 1, 0),
(3, 32, 3, 0),
(4, 33, 2, 0),
(5, 34, 3, 0),
(6, 35, 3, 0),
(7, 36, 2, 0),
(8, 37, 3, 0),
(9, 38, 3, 0),
(10, 39, 3, 0),
(11, 40, 2, 0),
(12, 41, 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batchId`);

--
-- Indexes for table `batch_settings`
--
ALTER TABLE `batch_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  ADD PRIMARY KEY (`taskId`);

--
-- Indexes for table `batch_templates`
--
ALTER TABLE `batch_templates`
  ADD PRIMARY KEY (`templateId`);

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
  ADD PRIMARY KEY (`facultyStudentId`);

--
-- Indexes for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  ADD PRIMARY KEY (`requestId`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD PRIMARY KEY (`requestId`);

--
-- Indexes for table `group_uploads`
--
ALTER TABLE `group_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internal_evaluations`
--
ALTER TABLE `internal_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_repository`
--
ALTER TABLE `project_repository`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository_users`
--
ALTER TABLE `repository_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `student_group`
--
ALTER TABLE `student_group`
  ADD PRIMARY KEY (`groupId`);

--
-- Indexes for table `student_group_request`
--
ALTER TABLE `student_group_request`
  ADD PRIMARY KEY (`requestId`);

--
-- Indexes for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline_student`
--
ALTER TABLE `timeline_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_load`
--
ALTER TABLE `work_load`
  ADD PRIMARY KEY (`loadId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `batch_settings`
--
ALTER TABLE `batch_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `batch_templates`
--
ALTER TABLE `batch_templates`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `external_examiner`
--
ALTER TABLE `external_examiner`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `internal_evaluations`
--
ALTER TABLE `internal_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_repository`
--
ALTER TABLE `project_repository`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `repository_users`
--
ALTER TABLE `repository_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student_group_request`
--
ALTER TABLE `student_group_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `timeline_student`
--
ALTER TABLE `timeline_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
