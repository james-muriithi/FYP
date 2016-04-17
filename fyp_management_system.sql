-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2016 at 04:12 PM
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
  `configurationType` varchar(255) NOT NULL,
  `isActive` tinyint(4) DEFAULT '0' COMMENT '0= inactive , 1= active',
  `sdpPart` tinyint(4) DEFAULT '1' COMMENT '0 or 1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `startingDate`, `configurationType`, `isActive`, `sdpPart`, `createdDtm`) VALUES
(4, 'Fall 2016', NULL, 'default', 1, 2, '2016-04-03 13:24:15'),
(12, 'Spring 2016', '2016-04-04', 'default', 1, 1, '2016-04-03 21:22:24');

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
(19, 12, '1', 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use â€œTemplate-01â€ to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 7th September 2051 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 2, '2015-09-07 15:30:00', 13, 1, '2016-04-16 23:21:58'),
(20, 12, '1', 'Deliverable 02: Project Proposal', '<p>\r\n\r\n</p><ul><li>Use â€œTemplate-02â€ &nbsp;to write down initial proposal and submit hard copy to project coordinator.</li><li>Due Date: Monday, 14th September 2015 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 3, '2015-09-14 15:30:00', 14, 1, '2016-04-16 23:22:58'),
(21, 12, '1', 'Project Proposal Presentation', '<p>\r\n\r\n</p><p>SDP (Part I) Proposal Presentations will be held on <strong>Thursday</strong>&nbsp;(1st October 2015) &amp; <strong>Friday</strong>&nbsp;(2nd October 2015).</p><p>All SDP (Part I) students must reserve a presentation slot in consultation with project supervisor by <strong>Wednesday, 30th September 2015 (01:00 pm)</strong>. Presentation slots will be allocated on first come first serve basis.</p><h2>Schedule: Thursday (1st October 2015)<strong><br></strong></h2><ul><li><strong>09:00 AM - 09:30 AM</strong>&nbsp;- Club Cricket Info (Aizaz Ahmed Abbasi (7736), Najeeb Qureshi (8781), Muhammad Waqar Khan (7740)) </li><li><strong>09:30 AM - 10:00 AM</strong>&nbsp;- VineTube (Ayesha Hashim (9214), Mariya Sajjad (9331), Hina Arif (9231))</li><li><strong>10:00 AM - 10:30 AM</strong>&nbsp;- Rabta Caller (MohsinTanveer (9260), Muhmmad Saeed ur Rehman (9269), Umair Sharif (9258))</li><li><strong>10:30 AM - 11:00 AM</strong>&nbsp;- Rabta Messenger (Abdul Basit (9675), Ebad Majeed (9189), Irfan Khaliq (9556))  &nbsp;</li><li><strong>11:00 AM - 11:30 AM</strong>&nbsp;- Final Year Project Management System (Muhammad Muneeb (7757), Umair Qamar (10776), Bilal Hassan (7471))</li><li><strong>11:30 AM - 12:00 PM</strong>&nbsp;- SmartApp (Hina Zamir (9271), Madiha Arooj (9270))</li><li><strong>12:00 PM - 12:30 PM</strong>&nbsp;- Patient Appointment Innovation (<strong></strong>Usman Javaid (8939), Sheeraz Anwar (8660), Muhammad Laraib Khan (8617))</li><li><strong>12:30 PM - 01:00 PM</strong>&nbsp;- Flood Detection and Alert System by MIS (Maryam Ilyas (9807), Sundas Manzoor (9734), Ifrah Komal (9584))</li><li>PRAYER BREAK </li><li><strong>02:00 PM - 02:30 PM</strong>&nbsp;- Emergency Surveillance Automated Services (Muhammad Farhan Ali (7735), Haseeb Ahmed (7337), Muhammad Naeem (7752))</li><li><strong>02:30 PM - 03:00 PM</strong>&nbsp;- Murghi Khana- Poultry Farm Management System (Ahmed Aizaz Abid (9402), Muhammad Ashhar (9184), Ishaq Ibrahim (9220))</li><li><strong>03:00 PM - 03:30 PM</strong>&nbsp;- Market Ware- Distribution Management System (Zubair Ali (9272), &nbsp;Faizan Hameed (9248), Danish Hussain (9525))</li></ul><h2>Schedule: Friday (2nd October 2015)<strong><br></strong></h2><ul><li><strong>09:00 AM - 09:30 AM</strong>&nbsp;- Resource Sharing and Tracking System (<strong></strong>Muhammad Adeen Riaz (8659), Jamal Hussain Siddiqui (8621), Muhammad Shahzad (8857))</li><li><strong>09:30 AM - 10:00 AM</strong>&nbsp;- Alumni Network Portal (Zeeshan Ali Khan (8990), Ali Haq (8647), Waleed Khalid (8940))</li><li><strong>10:00 AM - 10:30 AM</strong>&nbsp;- eMenu System for Restaurant (Muhammad Awais Aryan (9215), Muhammad Ahmed Javed (9251), Syed Kazim Raza (9264))</li><li><strong>10:30 AM - 11:00 AM</strong>&nbsp;- Heads-Up (Muhammad Fahad Khan (7759), Mohsin Ali Abid (8658), Mazhar Khan (8627))  &nbsp; </li><li><strong>11:00 AM - 11:30 AM</strong>&nbsp;- Safe Eyes (<strong></strong>Muhammad Nabeel Tariq (9011), Muhammad Ateeq Meer (7530), Muhammad Asad Ullah Khan (8861))</li><li><strong>11:30 AM - 12:00 PM</strong>&nbsp;- Online Buy and Sell Web Application (Ali Murtaza (9268), Mehran Ali (8023), Syed Wasif Raza (7414))</li><li><strong>12:00 PM - 12:30 PM</strong>&nbsp;- Patient Facilitation System (Khizar Iqbal (9574), Umair Daud Raja (9380), Aqib Javed (9808))</li><li><strong>12:30 PM - 01:00 PM</strong>&nbsp;- &nbsp;Automatic Generation of Game Based Captcha<strong>&nbsp;(</strong>Sheikh Awais Ali (7531))</li><li>PRAYER BREAK</li><li><strong>02:00 PM - 02:30 PM -</strong>&nbsp;Hotel Management System (Aqib Javed (9179), Shoaib Nawaz (9155))</li><li><strong>02:30 PM - 03:00 PM</strong>&nbsp;- Online Cab Hiring Application (Muhammad Jamal (9691), Hannan Javaid (9764), Muhammad Ahmed (9759))</li><li><strong>03:00 PM - 03:30 PM</strong>&nbsp;- Marketing Sale System (Abdul Samad (8648), Asadullah (9305), Waqas Abdullah (7655))</li></ul>\r\n\r\n<br><p></p>', 5, '2016-04-16 23:24:26', 0, 0, '2016-04-16 23:24:26'),
(22, 12, '1', 'Proposal Presentation: Submission', '<p>\r\n\r\n</p><ul><li><strong>Due Date:</strong>&nbsp;Friday, 9th October 2015&nbsp;</li></ul>\r\n\r\n<br><p></p>', 6, '2015-10-09 00:00:00', 0, 1, '2016-04-16 23:25:14'),
(23, 12, '1', 'Final Project Proposal', '', 7, '2016-04-16 23:25:43', 0, 1, '2016-04-16 23:25:43'),
(24, 12, '1', 'Open House (Fall 2015)', '<p>\r\n\r\n</p><p>Date for Open House (Fall 2015) has been finalized. All Part-01 project groups are required to participate in Open House on<strong>Friday, 4th December 2015 (9:00AM-1:00PM)</strong>.</p><ul><li>All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li><li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li><li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li><li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li></ul><p><strong>IMPORTANT:</strong>&nbsp;This is mandatory activity - Failure to participate will earn you "F" grade.</p>\r\n\r\n<p></p>', 14, '2015-12-04 09:00:00', 0, 0, '2016-04-16 23:26:32'),
(25, 12, '1', 'Progress Presentations: Important Notes', '<p>\r\n\r\n</p><p>SDP (Part 1) project progress presentations have been scheduled on <b>Thursday, 14th January 2016 (09:00am-04:30pm)</b>. </p><p>You will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.</p><p>In regards to presentation, you need to use the attached PPT template and following guidelines:</p><ul><li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li><li><b>SLIDE #06:</b>&nbsp;Solution: What are you building to solve the problem?</li><li><b>SLIDE #08:</b>&nbsp;Requirements:</li><ul><li>List down various techniques &amp; tools you used to develop/elicit requirements</li><li>Point out how did you document these requirements â€“ did you create SRS?</li></ul><li><b>SLIDE #09:</b>&nbsp;Requirements:</li><ul><li>List down all the users (roles / actors) of your system</li><li>Point out if you have identified all the use cases? How many?</li><li>Point out if you have documented functional &amp; non-functional requirements?</li></ul><li><b>SLIDE #10:</b>&nbsp;Design:</li><ul><li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li></ul><li><b>SLIDE #11: </b>Design:</li><ul><li>Point out which UML diagrams you have used in your design</li><li>Point out if you have prepared an ERD</li><li>Point out if you have used any design patterns</li></ul><li><b>SLIDE #12:</b>&nbsp;Implementation:</li><ul><li>List down various development tools &amp; technologies you are using in your project</li><li>Point out if you are using any coding standards / best practices</li><li>List down various libraries / components / web services that you have identified / decided to use in your project</li></ul><li><b>SLIDE #14:</b>&nbsp;Work Breakdown Structure (WBS):</li><ul><li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li></ul><li><b>SLIDE #15:</b>&nbsp;Challenges:</li><ul><li>List any challenges that you are currently facing. &nbsp;e.g., identification of requirements, &nbsp;design, technical issues, etc.</li></ul><li><b>SLIDE #17:</b>&nbsp;Prototype:</li><ul><li>Insert 1 screen shot of your prototype that showcases most features.</li></ul><li><b>SLIDE #18:</b>&nbsp;Report:</li><ul><li>Point out the amount of progress made in each of the five chapters.</li></ul></ul><p>Finally, note that this is a mandatory activity and failure to participate will earn you an â€œFâ€ grade, unless you have prior permission from you supervisor &amp; project coordinator.</p>\r\n\r\n<br><p></p>', 20, '2016-01-14 09:00:00', 0, 0, '2016-04-16 23:27:17'),
(28, 12, '2', 'Final Report (Latest Version)', '', 1, '2016-02-26 00:49:00', 16, 1, '2016-04-17 00:16:28');

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

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `configurationId` int(255) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `taskDetails` longtext,
  `week` int(11) NOT NULL,
  `projectPart` tinyint(4) NOT NULL DEFAULT '1',
  `deadline` datetime DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `configurationType` varchar(50) DEFAULT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'close',
  `deliverable` tinyint(1) DEFAULT '0' COMMENT 'does this project has deliverable to upload ? 1=yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default Configurations';

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`configurationId`, `taskName`, `taskDetails`, `week`, `projectPart`, `deadline`, `attachment`, `configurationType`, `status`, `deliverable`) VALUES
(1, 'Orientation Presentation', '', 1, 1, '0000-00-00 00:00:00', '', 'default', 'open', 0),
(2, 'Deliverable 01: Project Team List', '<ul><li>Use "Template-01" to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: --</li></ul>', 2, 1, NULL, '', 'default', 'open', 1),
(3, 'Deliverable 02: Project Proposal', '<ul>\r\n	<li>Use "Template-2 " to write down initial proposal and submit hard copy to project coordinator.</li>\r\n	<li>Due Date: -- (Before 3:30pm)</li>\r\n</ul>', 3, 1, NULL, '', 'default', 'open', 1),
(4, 'Project Proposal Presentation', 'SDP (Part I) Proposal Presentations will be held on --', 5, 1, NULL, '', 'default', 'open', 0),
(5, 'Proposal Presentation: Submission', NULL, 6, 1, NULL, NULL, 'default', 'open', 1),
(6, 'Final Project Proposal', NULL, 6, 1, NULL, NULL, 'default', 'open', 1),
(7, 'Open House (Fall 2015)', '<ul>\r\n	<li>Date for Open House (Fall 2015) has been finalized. All Part-01 project groups are required to participate in Open House on <strong>--</strong>.\r\n<ul">\r\n	<li">All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n<strong>IMPORTANT:</strong> This is mandatory activity - Failure to participate will earn you "F" grade.</li>\r\n</ul>', 14, 1, NULL, NULL, 'default', 'open', 0),
(8, 'Progress Presentations', '<ul>\r\n	<li>SDP (Part 1) project progress presentations have been scheduled on <b>--</b>.\r\n\r\nYou will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.\r\n\r\nIn regards to presentation, you need to use the attached PPT template and following guidelines:\r\n<ul>\r\n	<li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li>\r\n	<li><b>SLIDE #06:</b> Solution: What are you building to solve the problem?</li>\r\n	<li><b>SLIDE #08:</b> Requirements:\r\n<ul>\r\n	<li>List down various techniques &amp; tools you used to develop/elicit requirements</li>\r\n	<li>Point out how did you document these requirements – did you create SRS?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #09:</b> Requirements:\r\n<ul>\r\n	<li>List down all the users (roles / actors) of your system</li>\r\n	<li>Point out if you have identified all the use cases? How many?</li>\r\n	<li>Point out if you have documented functional &amp; non-functional requirements?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #10:</b> Design:\r\n<ul>\r\n	<li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #11: </b>Design:\r\n<ul>\r\n	<li>Point out which UML diagrams you have used in your design</li>\r\n	<li>Point out if you have prepared an ERD</li>\r\n	<li>Point out if you have used any design patterns</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #12:</b> Implementation:\r\n<ul>\r\n	<li>List down various development tools &amp; technologies you are using in your project</li>\r\n	<li>Point out if you are using any coding standards / best practices</li>\r\n	<li>List down various libraries / components / web services that you have identified / decided to use in your project</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #14:</b> Work Breakdown Structure (WBS):\r\n<ul>\r\n	<li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #15:</b> Challenges:\r\n<ul>\r\n	<li>List any challenges that you are currently facing.  e.g., identification of requirements,  design, technical issues, etc.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #17:</b> Prototype:\r\n<ul>\r\n	<li>Insert 1 screen shot of your prototype that showcases most features.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #18:</b> Report:\r\n<ul>\r\n	<li>Point out the amount of progress made in each of the five chapters.</li>\r\n</ul>\r\n</li>\r\n</ul>\r\nFinally, note that this is a mandatory activity and failure to participate will earn you an “F” grade, unless you have prior permission from you supervisor &amp; project coordinator.</li>\r\n</ul>', 20, 1, NULL, NULL, 'default', 'open', 0),
(9, 'Final Report (Latest Version)', NULL, 3, 2, NULL, NULL, 'default', 'open', 1);

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner`
--

CREATE TABLE `external_examiner` (
  `examinerId` int(255) NOT NULL,
  `examinerName` varchar(100) NOT NULL,
  `examinerPhone` varchar(50) NOT NULL,
  `examinerEmail` varchar(255) NOT NULL,
  `examinerPassword` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='examinerGroupInfo';

--
-- Dumping data for table `external_examiner`
--

INSERT INTO `external_examiner` (`examinerId`, `examinerName`, `examinerPhone`, `examinerEmail`, `examinerPassword`, `company`, `isActive`) VALUES
(1, 'haj', '', 'haj@gmail.com', '123', 'Google', 1),
(2, 'Bill Gates', '', 'bill@gates.com', '123', 'Microsoft', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `facultyId` int(255) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `facultyImage` varchar(255) DEFAULT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isCoordinator` tinyint(1) NOT NULL,
  `createdDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `facultyName`, `designation`, `facultyPhoneNo`, `facultyEmail`, `facultyImage`, `facultyPassword`, `isAdmin`, `isCoordinator`, `createdDtm`) VALUES
(7, 'Saud Khan', 'Assocaite Professor', '3345123456', 'saudkhan@riu.edu.pk', NULL, '123', 1, 1, NULL),
(13, 'Osama Raza', 'Lecturer', '111111', 'osama@riu.edu.pk', '57138d311521b4.60190644.jpg', '123', 0, 0, NULL);

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
(4, 9, 13),
(5, 14, 13);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_request`
--

CREATE TABLE `faculty_student_request` (
  `requestId` int(11) NOT NULL,
  `request_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `facultyId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL
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
  `grade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `group_deliverables`
--

CREATE TABLE `group_deliverables` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `config_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL COMMENT 'Id of user who uploaded this deliverable',
  `deliverable` varchar(100) NOT NULL,
  `upload_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 9, 19, 'group_9_deliverable_19.doc', 15, '2016-04-17 15:49:28');

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
(1, 13, 9, 'YO YO MEETING YO!', '2016-04-05 20:23:56', NULL, 'Pending', '2016-04-05 20:24:01'),
(2, 13, 9, 'Meeting', '2016-04-05 00:00:00', '<p>I am a good supervisor</p>', 'Postponed', '2016-04-05 22:25:03'),
(3, 13, 14, 'Meeting 5', '2016-04-05 00:00:00', '<p>LALALALA!</p>', 'Cancelled', '2016-04-05 22:25:16'),
(4, 13, 9, 'aa', '1970-01-01 00:00:00', '<p>Comment</p>', '', '2016-04-05 22:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `facultyId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_repository`
--

CREATE TABLE `project_repository` (
  `project_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_repository`
--

INSERT INTO `project_repository` (`project_id`, `batch_id`) VALUES
(1, 12);

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
  `student_image` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `groupId` int(255) DEFAULT '0',
  `isLeader` int(1) DEFAULT NULL,
  `batchId` int(255) DEFAULT NULL,
  `isCompleted` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentEmail`, `studentPhoneNo`, `studentGender`, `studentPassword`, `student_image`, `groupId`, `isLeader`, `batchId`, `isCompleted`, `isActive`, `createdDtm`) VALUES
(14, 'Muneeb Khan', '7757', 'muneeb_420@gmail.com', '01234565', 'male', '123', '56fff928b82971.36534035.jpg', 9, 1, 12, 0, 0, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', 'umairqamar@live.com', '03458541454', 'male', '123', '56fff632e226e7.95020533.jpg', 9, 0, 12, 0, 0, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', 'bilalhassan@live.com', '+923458541454', 'male', '123', '56fff9374231d1.64504225.jpg', 14, 1, 12, 0, 0, '2016-04-03 13:30:06'),
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', NULL, 15, 1, 4, 0, 1, '2016-04-10 14:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `groupId` int(255) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `projectPart` int(1) NOT NULL,
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupInfo';

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`groupId`, `projectName`, `batch_id`, `projectPart`, `groupLimit`, `inGroup`, `leaderId`) VALUES
(9, 'Fyp Management System', 12, 1, 3, 1, 14),
(14, 'Bilal Hassan', 12, 1, 3, 1, 21),
(15, 'Group - A', 15, 0, 3, 1, 43);

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `item_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `details` longtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `sdp_part` tinyint(4) NOT NULL DEFAULT '1',
  `batch_id` int(11) DEFAULT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `visibility` varchar(50) NOT NULL,
  `is_active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`item_id`, `title`, `details`, `type`, `sdp_part`, `batch_id`, `created_dtm`, `created_by`, `visibility`, `is_active`) VALUES
(1, 'Muhammad Saud Khan sent you an email', '<div>All SDP (Part I) project groups are required to participate in this activity (Friday, 4th December 2015 (9:00AM-1:00PM)).</div>\r\n<div></div>\r\n<div>\r\n<ul>\r\n	<li>All groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>You are expected to present your report (first 5 chapters), project idea &amp; prototype.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n</div>\r\n<div>IMPORTANT: This is mandatory activity - Failure to participate will earn you "F" grade.</div>\r\n<div></div>\r\n\r\n', 'email', 1, 12, '2016-03-10 19:58:00', 'Saud Khan', 'PUBLIC', 1),
(2, 'Orientation Presentation', '', '', 1, 1, '2016-04-03 22:38:44', '', '', 1),
(3, 'Deliverable 01: Project Team List', '<ul><li>Use "Template-01" to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: --</li></ul>', 'task', 1, 1, '2016-04-03 22:40:57', '', '', 1),
(4, 'Deliverable 02: Project Proposal', '<ul>\r\n	<li>Use "Template-2 " to write down initial proposal and submit hard copy to project coordinator.</li>\r\n	<li>Due Date: -- (Before 3:30pm)</li>\r\n</ul>', 'task', 1, 1, '2016-04-04 19:28:41', '', '', 0),
(5, 'Proposal Presentation: Submission', '', 'task', 1, 1, '2016-04-04 19:28:43', '', '', 0),
(6, 'Final Project Proposal', '', 'task', 1, 1, '2016-04-04 19:28:44', '', '', 0),
(7, 'Open House (Fall 2015)', '<ul>\r\n	<li>Date for Open House (Fall 2015) has been finalized. All Part-01 project groups are required to participate in Open House on <strong>--</strong>.\r\n<ul">\r\n	<li">All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n<strong>IMPORTANT:</strong> This is mandatory activity - Failure to participate will earn you "F" grade.</li>\r\n</ul>', 'task', 1, 1, '2016-04-04 19:28:45', '', '', 0),
(8, 'Progress Presentations', '<ul>\r\n	<li>SDP (Part 1) project progress presentations have been scheduled on <b>--</b>.\r\n\r\nYou will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.\r\n\r\nIn regards to presentation, you need to use the attached PPT template and following guidelines:\r\n<ul>\r\n	<li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li>\r\n	<li><b>SLIDE #06:</b> Solution: What are you building to solve the problem?</li>\r\n	<li><b>SLIDE #08:</b> Requirements:\r\n<ul>\r\n	<li>List down various techniques &amp; tools you used to develop/elicit requirements</li>\r\n	<li>Point out how did you document these requirements – did you create SRS?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #09:</b> Requirements:\r\n<ul>\r\n	<li>List down all the users (roles / actors) of your system</li>\r\n	<li>Point out if you have identified all the use cases? How many?</li>\r\n	<li>Point out if you have documented functional &amp; non-functional requirements?</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #10:</b> Design:\r\n<ul>\r\n	<li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #11: </b>Design:\r\n<ul>\r\n	<li>Point out which UML diagrams you have used in your design</li>\r\n	<li>Point out if you have prepared an ERD</li>\r\n	<li>Point out if you have used any design patterns</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #12:</b> Implementation:\r\n<ul>\r\n	<li>List down various development tools &amp; technologies you are using in your project</li>\r\n	<li>Point out if you are using any coding standards / best practices</li>\r\n	<li>List down various libraries / components / web services that you have identified / decided to use in your project</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #14:</b> Work Breakdown Structure (WBS):\r\n<ul>\r\n	<li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #15:</b> Challenges:\r\n<ul>\r\n	<li>List any challenges that you are currently facing.  e.g., identification of requirements,  design, technical issues, etc.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #17:</b> Prototype:\r\n<ul>\r\n	<li>Insert 1 screen shot of your prototype that showcases most features.</li>\r\n</ul>\r\n</li>\r\n	<li><b>SLIDE #18:</b> Report:\r\n<ul>\r\n	<li>Point out the amount of progress made in each of the five chapters.</li>\r\n</ul>\r\n</li>\r\n</ul>\r\nFinally, note that this is a mandatory activity and failure to participate will earn you an “F” grade, unless you have prior permission from you supervisor &amp; project coordinator.</li>\r\n</ul>', 'task', 1, 1, '2016-04-04 19:28:45', '', '', 0);

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
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='timeline for faculty';

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
  `batchId` text,
  `sdpPart` varchar(1) DEFAULT '1',
  `createdDtm` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Timeline for students';

--
-- Dumping data for table `timeline_student`
--

INSERT INTO `timeline_student` (`id`, `title`, `details`, `type`, `taskId`, `batchId`, `sdpPart`, `createdDtm`) VALUES
(8, 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use â€œTemplate-01â€ to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 7th September 2051 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 'task', 19, '12', NULL, '2016-04-16 23:21:58'),
(9, 'Deliverable 02: Project Proposal', '<p>\r\n\r\n</p><ul><li>Use â€œTemplate-02â€ &nbsp;to write down initial proposal and submit hard copy to project coordinator.</li><li>Due Date: Monday, 14th September 2015 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 'task', 20, '12', NULL, '2016-04-16 23:22:58'),
(10, 'Project Proposal Presentation', '<p>\r\n\r\n</p><p>SDP (Part I) Proposal Presentations will be held on <strong>Thursday</strong>&nbsp;(1st October 2015) &amp; <strong>Friday</strong>&nbsp;(2nd October 2015).</p><p>All SDP (Part I) students must reserve a presentation slot in consultation with project supervisor by <strong>Wednesday, 30th September 2015 (01:00 pm)</strong>. Presentation slots will be allocated on first come first serve basis.</p><h2>Schedule: Thursday (1st October 2015)<strong><br></strong></h2><ul><li><strong>09:00 AM - 09:30 AM</strong>&nbsp;- Club Cricket Info (Aizaz Ahmed Abbasi (7736), Najeeb Qureshi (8781), Muhammad Waqar Khan (7740)) </li><li><strong>09:30 AM - 10:00 AM</strong>&nbsp;- VineTube (Ayesha Hashim (9214), Mariya Sajjad (9331), Hina Arif (9231))</li><li><strong>10:00 AM - 10:30 AM</strong>&nbsp;- Rabta Caller (MohsinTanveer (9260), Muhmmad Saeed ur Rehman (9269), Umair Sharif (9258))</li><li><strong>10:30 AM - 11:00 AM</strong>&nbsp;- Rabta Messenger (Abdul Basit (9675), Ebad Majeed (9189), Irfan Khaliq (9556))  &nbsp;</li><li><strong>11:00 AM - 11:30 AM</strong>&nbsp;- Final Year Project Management System (Muhammad Muneeb (7757), Umair Qamar (10776), Bilal Hassan (7471))</li><li><strong>11:30 AM - 12:00 PM</strong>&nbsp;- SmartApp (Hina Zamir (9271), Madiha Arooj (9270))</li><li><strong>12:00 PM - 12:30 PM</strong>&nbsp;- Patient Appointment Innovation (<strong></strong>Usman Javaid (8939), Sheeraz Anwar (8660), Muhammad Laraib Khan (8617))</li><li><strong>12:30 PM - 01:00 PM</strong>&nbsp;- Flood Detection and Alert System by MIS (Maryam Ilyas (9807), Sundas Manzoor (9734), Ifrah Komal (9584))</li><li>PRAYER BREAK </li><li><strong>02:00 PM - 02:30 PM</strong>&nbsp;- Emergency Surveillance Automated Services (Muhammad Farhan Ali (7735), Haseeb Ahmed (7337), Muhammad Naeem (7752))</li><li><strong>02:30 PM - 03:00 PM</strong>&nbsp;- Murghi Khana- Poultry Farm Management System (Ahmed Aizaz Abid (9402), Muhammad Ashhar (9184), Ishaq Ibrahim (9220))</li><li><strong>03:00 PM - 03:30 PM</strong>&nbsp;- Market Ware- Distribution Management System (Zubair Ali (9272), &nbsp;Faizan Hameed (9248), Danish Hussain (9525))</li></ul><h2>Schedule: Friday (2nd October 2015)<strong><br></strong></h2><ul><li><strong>09:00 AM - 09:30 AM</strong>&nbsp;- Resource Sharing and Tracking System (<strong></strong>Muhammad Adeen Riaz (8659), Jamal Hussain Siddiqui (8621), Muhammad Shahzad (8857))</li><li><strong>09:30 AM - 10:00 AM</strong>&nbsp;- Alumni Network Portal (Zeeshan Ali Khan (8990), Ali Haq (8647), Waleed Khalid (8940))</li><li><strong>10:00 AM - 10:30 AM</strong>&nbsp;- eMenu System for Restaurant (Muhammad Awais Aryan (9215), Muhammad Ahmed Javed (9251), Syed Kazim Raza (9264))</li><li><strong>10:30 AM - 11:00 AM</strong>&nbsp;- Heads-Up (Muhammad Fahad Khan (7759), Mohsin Ali Abid (8658), Mazhar Khan (8627))  &nbsp; </li><li><strong>11:00 AM - 11:30 AM</strong>&nbsp;- Safe Eyes (<strong></strong>Muhammad Nabeel Tariq (9011), Muhammad Ateeq Meer (7530), Muhammad Asad Ullah Khan (8861))</li><li><strong>11:30 AM - 12:00 PM</strong>&nbsp;- Online Buy and Sell Web Application (Ali Murtaza (9268), Mehran Ali (8023), Syed Wasif Raza (7414))</li><li><strong>12:00 PM - 12:30 PM</strong>&nbsp;- Patient Facilitation System (Khizar Iqbal (9574), Umair Daud Raja (9380), Aqib Javed (9808))</li><li><strong>12:30 PM - 01:00 PM</strong>&nbsp;- &nbsp;Automatic Generation of Game Based Captcha<strong>&nbsp;(</strong>Sheikh Awais Ali (7531))</li><li>PRAYER BREAK</li><li><strong>02:00 PM - 02:30 PM -</strong>&nbsp;Hotel Management System (Aqib Javed (9179), Shoaib Nawaz (9155))</li><li><strong>02:30 PM - 03:00 PM</strong>&nbsp;- Online Cab Hiring Application (Muhammad Jamal (9691), Hannan Javaid (9764), Muhammad Ahmed (9759))</li><li><strong>03:00 PM - 03:30 PM</strong>&nbsp;- Marketing Sale System (Abdul Samad (8648), Asadullah (9305), Waqas Abdullah (7655))</li></ul>\r\n\r\n<br><p></p>', 'task', 21, '12', NULL, '2016-04-16 23:24:26'),
(11, 'Proposal Presentation: Submission', '<p>\r\n\r\n</p><ul><li><strong>Due Date:</strong>&nbsp;Friday, 9th October 2015&nbsp;</li></ul>\r\n\r\n<br><p></p>', 'task', 22, '12', NULL, '2016-04-16 23:25:14'),
(12, 'Final Project Proposal', '', 'task', 23, '12', NULL, '2016-04-16 23:25:44'),
(13, 'Open House (Fall 2015)', '<p>\r\n\r\n</p><p>Date for Open House (Fall 2015) has been finalized. All Part-01 project groups are required to participate in Open House on<strong>Friday, 4th December 2015 (9:00AM-1:00PM)</strong>.</p><ul><li>All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li><li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li><li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li><li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li></ul><p><strong>IMPORTANT:</strong>&nbsp;This is mandatory activity - Failure to participate will earn you "F" grade.</p>\r\n\r\n<p></p>', 'task', 24, '12', NULL, '2016-04-16 23:26:32'),
(14, 'Progress Presentations: Important Notes', '<p>\r\n\r\n</p><p>SDP (Part 1) project progress presentations have been scheduled on <b>Thursday, 14th January 2016 (09:00am-04:30pm)</b>. </p><p>You will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.</p><p>In regards to presentation, you need to use the attached PPT template and following guidelines:</p><ul><li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li><li><b>SLIDE #06:</b>&nbsp;Solution: What are you building to solve the problem?</li><li><b>SLIDE #08:</b>&nbsp;Requirements:</li><ul><li>List down various techniques &amp; tools you used to develop/elicit requirements</li><li>Point out how did you document these requirements â€“ did you create SRS?</li></ul><li><b>SLIDE #09:</b>&nbsp;Requirements:</li><ul><li>List down all the users (roles / actors) of your system</li><li>Point out if you have identified all the use cases? How many?</li><li>Point out if you have documented functional &amp; non-functional requirements?</li></ul><li><b>SLIDE #10:</b>&nbsp;Design:</li><ul><li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li></ul><li><b>SLIDE #11: </b>Design:</li><ul><li>Point out which UML diagrams you have used in your design</li><li>Point out if you have prepared an ERD</li><li>Point out if you have used any design patterns</li></ul><li><b>SLIDE #12:</b>&nbsp;Implementation:</li><ul><li>List down various development tools &amp; technologies you are using in your project</li><li>Point out if you are using any coding standards / best practices</li><li>List down various libraries / components / web services that you have identified / decided to use in your project</li></ul><li><b>SLIDE #14:</b>&nbsp;Work Breakdown Structure (WBS):</li><ul><li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li></ul><li><b>SLIDE #15:</b>&nbsp;Challenges:</li><ul><li>List any challenges that you are currently facing. &nbsp;e.g., identification of requirements, &nbsp;design, technical issues, etc.</li></ul><li><b>SLIDE #17:</b>&nbsp;Prototype:</li><ul><li>Insert 1 screen shot of your prototype that showcases most features.</li></ul><li><b>SLIDE #18:</b>&nbsp;Report:</li><ul><li>Point out the amount of progress made in each of the five chapters.</li></ul></ul><p>Finally, note that this is a mandatory activity and failure to participate will earn you an â€œFâ€ grade, unless you have prior permission from you supervisor &amp; project coordinator.</p>\r\n\r\n<br><p></p>', 'task', 25, '12', NULL, '2016-04-16 23:27:17'),
(15, 'Final Report (Latest Version)', '', 'task', 27, '12', '1', '2016-04-17 00:12:45'),
(16, 'Final Report (Latest Version)', '', 'task', 28, '12', '2', '2016-04-17 00:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `work_load`
--

CREATE TABLE `work_load` (
  `loadId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `totalLoad` int(255) NOT NULL,
  `currentLoad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='workload_Info';

--
-- Dumping data for table `work_load`
--

INSERT INTO `work_load` (`loadId`, `facultyId`, `designation`, `totalLoad`, `currentLoad`) VALUES
(1, 7, 'Teaching Fellow', 3, 0),
(5, 13, 'Assocaite Professor', 3, 2),
(6, 14, 'Captain America', 3, 0);

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
-- Indexes for table `group_deliverables`
--
ALTER TABLE `group_deliverables`
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
-- Indexes for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_repository`
--
ALTER TABLE `project_repository`
  ADD PRIMARY KEY (`project_id`);

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
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`item_id`);

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
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `batch_templates`
--
ALTER TABLE `batch_templates`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `configurationId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `external_examiner`
--
ALTER TABLE `external_examiner`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `group_deliverables`
--
ALTER TABLE `group_deliverables`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `project_repository`
--
ALTER TABLE `project_repository`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline_student`
--
ALTER TABLE `timeline_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
