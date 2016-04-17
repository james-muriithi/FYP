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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  ADD PRIMARY KEY (`taskId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
