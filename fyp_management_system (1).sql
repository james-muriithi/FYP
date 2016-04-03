-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2016 at 05:49 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fyp_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batchId` int(255) NOT NULL,
  `batchName` varchar(255) NOT NULL,
  `startingDate` datetime DEFAULT NULL,
  `configurationType` varchar(255) NOT NULL,
  `isActive` tinyint(4) DEFAULT '0' COMMENT '0= inactive , 1= active',
  `sdpPart` tinyint(4) DEFAULT '1' COMMENT '0 or 1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `startingDate`, `configurationType`, `isActive`, `sdpPart`, `createdDtm`) VALUES
(2, 'Fall 2017', NULL, 'default', NULL, 0, '2016-04-03 13:24:15'),
(4, 'Fall 2016', NULL, 'default', NULL, 0, '2016-04-03 13:24:15'),
(5, 'Fall 2015', NULL, 'default', NULL, 0, '2016-04-03 13:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE IF NOT EXISTS `configurations` (
  `configurationId` int(255) NOT NULL,
  `week` int(11) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `taskDetails` longtext,
  `projectPart` tinyint(4) NOT NULL DEFAULT '1',
  `deadline` datetime DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `configurationType` varchar(50) DEFAULT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'close'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Default Configurations';

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`configurationId`, `week`, `taskName`, `taskDetails`, `projectPart`, `deadline`, `attachment`, `configurationType`, `status`) VALUES
(1, 1, 'Orientation Presentation', '', 1, '0000-00-00 00:00:00', '', 'default', 'close'),
(2, 2, 'Deliverable 01: Project Team List', '<ul><li>Use "Template-01" to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: --</li></ul>', 1, NULL, '', 'default', 'close'),
(3, 3, 'Deliverable 02: Project Proposal', '<ul>\r\n	<li>Use "Template-2 " to write down initial proposal and submit hard copy to project coordinator.</li>\r\n	<li>Due Date: -- (Before 3:30pm)</li>\r\n</ul>', 1, NULL, '', 'default', 'close'),
(4, 5, 'Project Proposal Presentation', 'SDP (Part I) Proposal Presentations will be held on --', 1, NULL, '', 'default', 'close'),
(5, 6, 'Proposal Presentation: Submission', NULL, 1, NULL, NULL, 'default', 'close'),
(6, 6, 'Final Project Proposal', NULL, 1, NULL, NULL, 'default', 'close'),
(7, 14, 'Open House (Fall 2015)', '<ul>\r\n	<li>Date for Open House (Fall 2015) has been finalized. All Part-01 project groups are required to participate in Open House on <strong>--</strong>.\r\n<ul">\r\n	<li">All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n<strong>IMPORTANT:</strong> This is mandatory activity - Failure to participate will earn you "F" grade.</li>\r\n</ul>', 1, NULL, NULL, 'default', 'close'),
(8, 20, 'Progress Presentations', '<ul>\r\n	<li>SDP (Part 1) project progress presentations have been scheduled on <b>--</b>.\r\n\r\nYou will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.\r\n\r\nIn regards to presentation, you need to use the attached PPT template and following guidelines:\r\n<ul>\r\n	<li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li>\r\n	<li><b>SLIDE #06:</b> Solution: What are you building to solve the problem?</li>\r\n	<li><b>SLIDE #08:</b> Requirements:\r\n<ul>\r\n	<li>List down various techniques &amp; tools you used to develop/elicit requirements</li>\r\n	<li>Point out how did you document these requirements – did you create SRS?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #09:</b> Requirements:\r\n<ul>\r\n	<li>List down all the users (roles / actors) of your system</li>\r\n	<li>Point out if you have identified all the use cases? How many?</li>\r\n	<li>Point out if you have documented functional &amp; non-functional requirements?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #10:</b> Design:\r\n<ul>\r\n	<li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #11: </b>Design:\r\n<ul>\r\n	<li>Point out which UML diagrams you have used in your design</li>\r\n	<li>Point out if you have prepared an ERD</li>\r\n	<li>Point out if you have used any design patterns</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #12:</b> Implementation:\r\n<ul>\r\n	<li>List down various development tools &amp; technologies you are using in your project</li>\r\n	<li>Point out if you are using any coding standards / best practices</li>\r\n	<li>List down various libraries / components / web services that you have identified / decided to use in your project</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #14:</b> Work Breakdown Structure (WBS):\r\n<ul>\r\n	<li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #15:</b> Challenges:\r\n<ul>\r\n	<li>List any challenges that you are currently facing.  e.g., identification of requirements,  design, technical issues, etc.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #17:</b> Prototype:\r\n<ul>\r\n	<li>Insert 1 screen shot of your prototype that showcases most features.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #18:</b> Report:\r\n<ul>\r\n	<li>Point out the amount of progress made in each of the five chapters.</li>\r\n</ul>\r\n</li>\r\n</ul>\r\nFinally, note that this is a mandatory activity and failure to participate will earn you an “F” grade, unless you have prior permission from you supervisor &amp; project coordinator.</li>\r\n</ul>', 1, NULL, NULL, 'default', 'close'),
(9, 3, 'Final Report (Latest Version)', NULL, 2, NULL, NULL, 'default', 'close');

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner`
--

CREATE TABLE IF NOT EXISTS `external_examiner` (
  `examinerId` int(255) NOT NULL,
  `examinerName` varchar(100) NOT NULL,
  `examinerPhone` varchar(50) NOT NULL,
  `examinerEmail` varchar(255) NOT NULL,
  `examinerPassword` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='examinerGroupInfo';

--
-- Dumping data for table `external_examiner`
--

INSERT INTO `external_examiner` (`examinerId`, `examinerName`, `examinerPhone`, `examinerEmail`, `examinerPassword`, `company`, `isActive`) VALUES
(1, 'haj', '', 'haj@gmail.com', '123', 'Google', 1),
(2, 'Bill Gates', '', 'bill@gates.com', '123', 'Microsoft', 1);

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner_old`
--

CREATE TABLE IF NOT EXISTS `external_examiner_old` (
  `examinerId` int(255) NOT NULL,
  `examinerName` varchar(255) NOT NULL,
  `examinerPhone` int(255) NOT NULL,
  `examinerEmail` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `slotPresentation` varchar(255) NOT NULL,
  `groupId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='examinerInfo';

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `facultyId` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isCoordinator` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `designation`, `facultyName`, `facultyPhoneNo`, `facultyEmail`, `facultyPassword`, `isAdmin`, `isCoordinator`) VALUES
(7, 'Lecturer', 'Saud Khan', '3345123456', 'saudkhan@riu.edu.pk', '123', 1, 1),
(13, 'Assocaite Professor', 'Osama Raza', '123123', 'osama@riu.edu.pk', '123', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_group`
--

CREATE TABLE IF NOT EXISTS `faculty_student_group` (
  `facultyStudentId` int(255) NOT NULL,
  `groupId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='facultyGroupInfo';

--
-- Dumping data for table `faculty_student_group`
--

INSERT INTO `faculty_student_group` (`facultyStudentId`, `groupId`, `facultyId`) VALUES
(4, 9, 13),
(5, 14, 13);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_request`
--

CREATE TABLE IF NOT EXISTS `faculty_student_request` (
  `requestId` int(11) NOT NULL,
  `request_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `facultyId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE IF NOT EXISTS `grades` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `comments` text,
  `grade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `group_requests`
--

CREATE TABLE IF NOT EXISTS `group_requests` (
  `requestId` int(255) NOT NULL,
  `studentId` int(255) NOT NULL,
  `groupId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `facultyId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studentId` int(255) NOT NULL,
  `studentName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentCMS` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentPhoneNo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentEmail` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentGender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `studentPassword` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_image` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `groupId` int(255) DEFAULT '0',
  `isLeader` int(1) NOT NULL,
  `batchId` int(255) NOT NULL,
  `isCompleted` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(4) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentPhoneNo`, `studentEmail`, `studentGender`, `studentPassword`, `student_image`, `groupId`, `isLeader`, `batchId`, `isCompleted`, `isActive`, `createdDtm`) VALUES
(14, 'Muneeb Khan', '7757', '01234565', 'muneeb_420@gmail.com', 'male', '123', '56fff928b82971.36534035.jpg', 9, 1, 2, 0, 0, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', '03458541454', 'umairqamar@live.com', 'male', '123', '56fff632e226e7.95020533.jpg', 9, 0, 2, 0, 0, '2016-04-03 13:30:06'),
(16, 'Abdul Saboor', '7783', '03335385896', 'saboor@gmail.com', 'male', '123', '5700fbca736940.24514340.jpg', 9, 0, 2, 0, 0, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', '+923458541454', 'bilalhassan@live.com', 'male', '123', '56fff9374231d1.64504225.jpg', 14, 1, 5, 0, 0, '2016-04-03 13:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE IF NOT EXISTS `student_group` (
  `groupId` int(255) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `projectPart` int(1) NOT NULL,
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='groupInfo';

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`groupId`, `projectName`, `projectPart`, `groupLimit`, `inGroup`, `leaderId`) VALUES
(9, 'Fyp Management System', 1, 3, 1, 14),
(14, 'Bilal Hassan', 1, 3, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `TaskId` int(255) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `deadline` date NOT NULL,
  `projectPart` int(11) NOT NULL,
  `week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='deadlineInfo';

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
  `item_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `details` longtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `sdp_part` tinyint(4) NOT NULL DEFAULT '1',
  `batch_id` int(11) NOT NULL DEFAULT '1',
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `visibility` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`item_id`, `title`, `details`, `type`, `sdp_part`, `batch_id`, `created_dtm`, `created_by`, `visibility`) VALUES
(1, 'Muhammad Saud Khan sent you an email', '<div>All SDP (Part I) project groups are required to participate in this activity (Friday, 4th December 2015 (9:00AM-1:00PM)).</div>\r\n<div></div>\r\n<div>\r\n<ul>\r\n	<li>All groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>You are expected to present your report (first 5 chapters), project idea &amp; prototype.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n</div>\r\n<div>IMPORTANT: This is mandatory activity - Failure to participate will earn you "F" grade.</div>\r\n<div></div>\r\n\r\n', 'email', 1, 1, '2016-03-10 19:58:00', 'Saud Khan', 'PUBLIC');

-- --------------------------------------------------------

--
-- Table structure for table `wbs_status`
--

CREATE TABLE IF NOT EXISTS `wbs_status` (
  `groupId` int(255) NOT NULL,
  `wbsTask` text NOT NULL,
  `wbsTaskDeadline` varchar(255) NOT NULL,
  `wbsTaskStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupIdInfo';

-- --------------------------------------------------------

--
-- Table structure for table `work_load`
--

CREATE TABLE IF NOT EXISTS `work_load` (
  `loadId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `totalLoad` int(255) NOT NULL,
  `currentLoad` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='workload_Info';

--
-- Dumping data for table `work_load`
--

INSERT INTO `work_load` (`loadId`, `facultyId`, `designation`, `totalLoad`, `currentLoad`) VALUES
(1, 7, 'Teaching Fellow', 3, 0),
(5, 13, 'Assocaite Professor', 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batchId`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`configurationId`);

--
-- Indexes for table `external_examiner`
--
ALTER TABLE `external_examiner`
  ADD PRIMARY KEY (`examinerId`);

--
-- Indexes for table `external_examiner_old`
--
ALTER TABLE `external_examiner_old`
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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`TaskId`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`item_id`);

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
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `configurationId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `external_examiner`
--
ALTER TABLE `external_examiner`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `external_examiner_old`
--
ALTER TABLE `external_examiner_old`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `TaskId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
