-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2016 at 11:29 PM
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
(1, 'Fall 2016', '2015-08-31', 1, 2, '2016-04-26 21:55:58'),
(19, 'Spring 2016', '2016-02-08', 1, 1, '2016-04-27 00:09:22');

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
(1, 1, '1', 'Deliverable 02: Project Proposal', '<p></p><p>Â· &nbsp; &nbsp; &nbsp; &nbsp;\r\nUse â€œTemplate-02â€ &nbsp;to write down initial proposal and submit\r\nhard copy to project coordinator.</p>\r\n\r\n<p>Â· &nbsp; &nbsp; &nbsp; &nbsp;\r\nDue Date: Monday, 14th September 2051 (Before 3:30pm)</p><br><p></p>', 2, '2015-09-14 15:30:00', 3, 1, '2016-04-26 23:49:01'),
(2, 19, '1', 'Orientation Presentation', '<p>Orientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation Presentation<br></p>', 1, '2016-04-14 14:30:00', NULL, 1, '2016-04-27 00:14:46');

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
(1, 1, 'Handbook-Version-2-0.pdf', 'Handbook-Version-2-0.pdf', '2016-04-26 23:13:53'),
(2, 1, 'Template -  01 - Project Team.doc', 'Template -  01 - Project Team.doc', '2016-04-26 23:13:56'),
(3, 1, 'Template -  02 - Inital Proposal.doc', 'Template -  02 - Inital Proposal.doc', '2016-04-26 23:13:58'),
(4, 1, 'Template -  04 - Proposal  Plan.doc', 'Template -  04 - Proposal  Plan.doc', '2016-04-26 23:14:01'),
(5, 1, 'Template -  05 - Project Report.doc', 'Template -  05 - Project Report.doc', '2016-04-26 23:14:04');

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
(1, 'Bill Gates', 'gates@microsoft.com', '', '123', 'Microsoft', 'CEO', 1);

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
(24, 'Saud Khan', '03451234567', 'saudkhan@riu.edu.pk', 'Coordinator', '571faf21f35406.63893346.jpg', '123', 0, 1, '2016-04-26 21:19:21'),
(25, 'Adeel Zafar', '', 'adeel@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-26 22:24:34'),
(26, 'Musharif Ahmed', '', 'musharif@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-26 22:25:11'),
(27, 'Samir Obaid', '', 'samir@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-26 22:35:27'),
(28, 'Muhammad Fawad Chaudry', '', 'fawad@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-26 22:37:14'),
(29, 'Uzair Muhammad', '', 'uzair@riu.edu.pk', 'Supervisor', NULL, '123', 0, NULL, '2016-04-26 22:38:13');

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
(1, 2, 24),
(2, 12, 24);

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
(1, 43, 2, 1, '', 'A+', 24, '2016-04-26 23:50:14'),
(2, 44, 2, 1, '', 'A+', 24, '2016-04-26 23:50:14'),
(3, 45, 2, 1, '', 'A+', 24, '2016-04-26 23:50:14'),
(4, 43, 2, 2, '', 'B+', 1, '2016-04-27 00:06:34'),
(5, 44, 2, 2, '', 'B', 1, '2016-04-27 00:06:34'),
(6, 45, 2, 2, '', 'C+', 1, '2016-04-27 00:06:34');

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
(1, 2, 1, 'group_2_deliverable_1.docx', 43, '2016-04-26 23:49:41'),
(2, 3, 2, 'group_3_deliverable_2.docx', 112, '2016-04-27 00:15:32');

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

--
-- Dumping data for table `internal_evaluations`
--

INSERT INTO `internal_evaluations` (`id`, `groupId`, `votedBy`, `aeVote`, `ohVote`) VALUES
(4, 2, 24, 2, 2),
(5, 12, 24, -1, -1),
(6, 2, 25, 2, 2),
(7, 2, 29, 1, 1),
(8, 12, 29, -1, 1),
(9, 2, 26, 1, 1),
(10, 12, 26, 2, 2),
(11, 2, 27, 2, 1),
(12, 12, 27, -1, -1),
(13, 2, 28, 2, 2),
(14, 12, 28, 2, 2);

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
(1, 24, 2, 'Meeting 4', '2016-04-28 00:00:00', NULL, 'Pending', '2016-04-27 22:38:19');

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
(14, 'Muneeb Khan', '7757', 'muneeb_420@gmail.com', '01234565', 'male', '123', '571fc1ed78e844.19123851.jpg', 12, NULL, 1, 1, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', 'umairqamar@live.com', '03458541454', 'male', '123', '571fc167eb6844.89367165.jpg', 12, 1, 1, 1, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', 'bilalhassan@live.com', '+923458541454', 'male', '123', NULL, 12, NULL, 1, 1, '2016-04-03 13:30:06'),
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', '571fafa2118908.51169619.jpg', 2, 1, 1, 1, '2016-04-10 14:28:47'),
(44, 'Najeeb Qureshi', '8781', 'najeeb@gmail.com', '1234567', 'male', '123', '571fafb8cf5792.07778878.jpg', 2, NULL, 1, 1, '2016-04-13 14:17:37'),
(45, 'Muhammad Waqar Khan', '7740', 'waqar@gmail.com', '033569870', 'male', '123', '571fafaeb7f8e2.46039702.jpg', 2, NULL, 1, 1, '2016-04-14 22:03:41'),
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
(59, 'Haseeb Ahmed', '7337', 'haseeb@yahoo.com', '03236116360', 'male', '123', NULL, NULL, NULL, 1, 1, '2016-04-14 22:16:27'),
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
(100, 'IFrah Komal', '9584', 'irfah@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 1, 1, '2016-04-15 00:00:34'),
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
(2, 'Club Cricket Info', 1, 1, 3, 3, 43, '2016-04-26 23:00:54'),
(12, 'Fyp Management System', 1, 1, 3, 3, 15, '2016-04-27 00:27:44');

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
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Club Cricket Info', 'info', 1, 0, '2016-04-26 23:01:26'),
(2, 'Consultant', '<p>\r\n\r\n</p><p>Mr. Asim Asfaq (asimizb@gmail.com) will be available for consultation for any project related advise during this semester.</p><ul><li><strong>Timing:</strong>&nbsp;11:30am - 01:00pm</li><li><strong>Day:</strong>&nbsp;Every Monday</li><li><strong>Location:</strong>&nbsp;Project Lab, Block A</li></ul>\r\n\r\n<br><p></p>', 'info', 1, NULL, '2016-04-26 23:44:47'),
(3, 'Batch Upgraded', 'Fall 2016 has been upgraded to Senior Design Project Part 2', 'info', 1, 2, '2016-04-27 00:12:00'),
(4, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Fyp Management System', 'info', 1, 0, '2016-04-28 20:14:05');

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
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Club Cricket Info', 'info', NULL, 1, 0, '2016-04-26 23:01:26'),
(2, 'Consultant', '<p>\r\n\r\n</p><p>Mr. Asim Asfaq (asimizb@gmail.com) will be available for consultation for any project related advise during this semester.</p><ul><li><strong>Timing:</strong>&nbsp;11:30am - 01:00pm</li><li><strong>Day:</strong>&nbsp;Every Monday</li><li><strong>Location:</strong>&nbsp;Project Lab, Block A</li></ul>\r\n\r\n<br><p></p>', 'info', NULL, 1, NULL, '2016-04-26 23:15:36'),
(3, 'Deliverable 02: Project Proposal', '<p></p><p>Â· &nbsp; &nbsp; &nbsp; &nbsp;\r\nUse â€œTemplate-02â€ &nbsp;to write down initial proposal and submit\r\nhard copy to project coordinator.</p>\r\n\r\n<p>Â· &nbsp; &nbsp; &nbsp; &nbsp;\r\nDue Date: Monday, 14th September 2051 (Before 3:30pm)</p><br><p></p>', 'task', 1, 1, 1, '2016-04-26 23:49:01'),
(4, 'Batch Upgraded', 'Fall 2016 has been upgraded to Senior Design Project Part 2', 'info', NULL, 1, 2, '2016-04-27 00:12:00'),
(5, 'Orientation Presentation', '<p>Orientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation PresentationOrientation Presentation<br></p>', 'task', 2, 19, 1, '2016-04-27 00:14:46'),
(6, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Saud Khan is now supervising group Fyp Management System', 'info', NULL, 1, 0, '2016-04-28 20:14:05');

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
(1, 24, 6, 2),
(2, 25, 3, 0),
(3, 26, 1, 0),
(4, 27, 1, 0),
(5, 28, 1, 0),
(6, 29, 1, 0);

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
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `batch_templates`
--
ALTER TABLE `batch_templates`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `external_examiner`
--
ALTER TABLE `external_examiner`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `requestId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_uploads`
--
ALTER TABLE `group_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `internal_evaluations`
--
ALTER TABLE `internal_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
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
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `student_group_request`
--
ALTER TABLE `student_group_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `timeline_student`
--
ALTER TABLE `timeline_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
