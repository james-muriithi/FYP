-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2016 at 09:55 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajaxdb`
--
CREATE DATABASE IF NOT EXISTS `ajaxdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ajaxdb`;

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

CREATE TABLE `names` (
  `name_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `location` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `names`
--
ALTER TABLE `names`
  ADD PRIMARY KEY (`name_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `names`
--
ALTER TABLE `names`
  MODIFY `name_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `buckysroom`
--
CREATE DATABASE IF NOT EXISTS `buckysroom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `buckysroom`;

-- --------------------------------------------------------

--
-- Table structure for table `ad_sizes`
--

CREATE TABLE `ad_sizes` (
  `id` int(11) UNSIGNED NOT NULL,
  `size` varchar(200) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `ads` tinyint(8) DEFAULT '1',
  `class` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'horizontal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) UNSIGNED NOT NULL,
  `adKey` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '0: Pending, 1: Active, 2: Expired',
  `defaultAd` tinyint(2) DEFAULT '0',
  `ownerID` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `startedDate` datetime DEFAULT NULL,
  `endedDate` datetime DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '''Text'' and ''Image''',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `description` varchar(2000) DEFAULT NULL,
  `adSize` int(11) DEFAULT '0',
  `fileName` varchar(255) DEFAULT '',
  `url` varchar(500) DEFAULT NULL,
  `display_url` varchar(500) DEFAULT '',
  `budget` double(12,10) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `receivedImpressions` int(11) DEFAULT '0',
  `clicks` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `albumID` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `visibility` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `albums_photos`
--

CREATE TABLE `albums_photos` (
  `id` int(11) UNSIGNED NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

CREATE TABLE `banned_users` (
  `bannedID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bannedUserID` int(11) DEFAULT NULL,
  `bannedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bitcoin_transaction`
--

CREATE TABLE `bitcoin_transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `receiverID` int(11) UNSIGNED NOT NULL,
  `payerID` int(11) UNSIGNED NOT NULL,
  `activityType` tinyint(2) DEFAULT '1' COMMENT '1: Listing product in shop, 2: Shop order transaction, 3: Listing item in trade section',
  `activityID` int(11) UNSIGNED NOT NULL COMMENT 'Listing product ID / Shop Order ID / Trade Item ID',
  `amount` double DEFAULT NULL COMMENT 'Payment amount',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '0: pending, 1: Paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `countryID` int(11) NOT NULL,
  `country_title` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `status` tinyint(2) DEFAULT '1' COMMENT '0: disable, 1: enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit_activity`
--

CREATE TABLE `credit_activity` (
  `id` int(11) UNSIGNED NOT NULL,
  `receiverID` int(11) UNSIGNED NOT NULL COMMENT 'The user ID who has received this credits',
  `payerID` int(11) UNSIGNED NOT NULL COMMENT 'The user ID who has sent this credits. 0 means paypal',
  `activityType` tinyint(2) DEFAULT '0' COMMENT '0: Deposit from Paypal Payments, 1: Payment to other, 2: Trade Item Add, 9: other',
  `amount` double(11,5) DEFAULT '0.00000',
  `transactionID` int(11) UNSIGNED DEFAULT '0' COMMENT 'If the payer is paypal, then it will save transaction ID',
  `receiverBalance` double(11,5) DEFAULT '0.00000',
  `payerBalance` double(11,5) DEFAULT '0.00000',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedbackID` int(11) UNSIGNED NOT NULL,
  `activityID` int(11) UNSIGNED NOT NULL COMMENT 'tradeID or ShopOrderID',
  `activityType` tinyint(2) DEFAULT '1' COMMENT '1: Trade, 2: Shop Order',
  `receiverID` int(11) UNSIGNED NOT NULL,
  `writerID` int(11) UNSIGNED NOT NULL,
  `itemID` int(11) UNSIGNED NOT NULL COMMENT 'tradeItemID or ShopProductID',
  `score` tinyint(2) DEFAULT '0' COMMENT '0: No score 1: positive, -1: negative',
  `comment` text COLLATE utf8_unicode_ci,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_activities`
--

CREATE TABLE `forum_activities` (
  `activityID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `objectID` int(11) NOT NULL,
  `objectType` enum('forum') NOT NULL,
  `activityType` enum('replied_to_reply','replied_to_topic','reply_approved','topic_approved') NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actionID` int(11) NOT NULL,
  `isNew` tinyint(1) NOT NULL,
  `activityStatus` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forum_blocked_users`
--

CREATE TABLE `forum_blocked_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `blockedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_categories`
--

CREATE TABLE `forum_categories` (
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `parentID` int(11) DEFAULT '0' COMMENT 'Parent category id',
  `creatorID` int(11) DEFAULT '0',
  `topics` int(11) DEFAULT '0' COMMENT 'The number of topics',
  `replies` int(11) DEFAULT '0' COMMENT 'The number of replies',
  `followers` int(11) DEFAULT '0',
  `lastTopicID` int(11) DEFAULT '0',
  `sortOrder` int(11) DEFAULT '0',
  `createdDate` datetime DEFAULT NULL,
  `image` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_categories_links`
--

CREATE TABLE `forum_categories_links` (
  `id` int(11) UNSIGNED NOT NULL,
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `linkTitle` varchar(100) DEFAULT NULL,
  `linkUrl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_followers`
--

CREATE TABLE `forum_followers` (
  `id` int(11) UNSIGNED NOT NULL,
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_moderators`
--

CREATE TABLE `forum_moderators` (
  `id` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT '0',
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `status` enum('Pending','Approved') DEFAULT 'Pending',
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_replies`
--

CREATE TABLE `forum_replies` (
  `replyID` int(11) UNSIGNED NOT NULL,
  `topicID` int(11) DEFAULT NULL,
  `replyContent` text,
  `creatorID` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT '',
  `votes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_topics`
--

CREATE TABLE `forum_topics` (
  `topicID` int(11) UNSIGNED NOT NULL,
  `topicTitle` varchar(500) DEFAULT NULL,
  `topicContent` text,
  `categoryID` smallint(5) UNSIGNED NOT NULL,
  `creatorID` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `replies` int(11) DEFAULT NULL COMMENT 'The number of Replies',
  `lastReplyID` int(11) DEFAULT NULL,
  `lastReplyDate` datetime DEFAULT NULL,
  `lastReplierID` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'pending',
  `votes` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_votes`
--

CREATE TABLE `forum_votes` (
  `voteID` int(11) UNSIGNED NOT NULL,
  `objectID` int(11) NOT NULL,
  `voterID` int(11) NOT NULL,
  `voteDate` datetime NOT NULL,
  `voteStatus` tinyint(2) NOT NULL DEFAULT '1',
  `objectType` enum('reply','topic') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `friendID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userFriendID` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends_old`
--

CREATE TABLE `friends_old` (
  `friendID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `userFriendID` int(11) DEFAULT NULL,
  `status` enum('pending','approved','declined') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_activities`
--

CREATE TABLE `main_activities` (
  `activityID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `objectID` int(11) NOT NULL,
  `objectType` enum('post','forum','trade','shop') NOT NULL,
  `activityType` enum('comment','feedback','like','offer_accepted','offer_declined','offer_received','replied_to_reply','replied_to_topic','reply_approved','sold','topic_approved') NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actionID` int(11) NOT NULL,
  `isNew` tinyint(1) NOT NULL,
  `activityStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `main_notifications`
--

CREATE TABLE `main_notifications` (
  `userID` int(11) NOT NULL,
  `activityID` int(11) NOT NULL,
  `notificationType` tinyint(2) DEFAULT '1' COMMENT '1: CommentToPost, 2: CommentedToMyComment',
  `isNew` tinyint(2) DEFAULT '1',
  `createdDate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL COMMENT 'Message Owner ID',
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `is_trash` tinyint(2) DEFAULT '0',
  `messageStatus` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_blocklist`
--

CREATE TABLE `messenger_blocklist` (
  `messengerBlocklistID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT '0',
  `blockedID` int(11) DEFAULT '0',
  `blockedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_buddylist`
--

CREATE TABLE `messenger_buddylist` (
  `messengerBuddylistID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `buddyID` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `messageID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `buddyID` int(11) NOT NULL,
  `messageType` tinyint(2) DEFAULT '0' COMMENT '0: Sent, 1: received',
  `message` text,
  `isNew` tinyint(2) DEFAULT '0',
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages_old`
--

CREATE TABLE `messenger_messages_old` (
  `messageID` int(11) UNSIGNED NOT NULL,
  `messageOwnerID` int(11) DEFAULT NULL,
  `senderID` int(11) DEFAULT NULL,
  `receiverID` int(11) DEFAULT NULL,
  `isNew` tinyint(2) DEFAULT '0',
  `message` text,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `moderatorID` int(11) UNSIGNED NOT NULL,
  `moderatorType` tinyint(5) DEFAULT NULL COMMENT '1: Community, 2: Forum, 3: Trade',
  `userID` int(11) DEFAULT NULL,
  `moderatorStatus` tinyint(2) DEFAULT '0' COMMENT '0: Expired, 1: Active',
  `electedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moderator_candidates`
--

CREATE TABLE `moderator_candidates` (
  `candidateID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `candidateText` text,
  `votes` int(11) DEFAULT '0',
  `appliedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moderator_votes`
--

CREATE TABLE `moderator_votes` (
  `voteID` int(11) UNSIGNED NOT NULL,
  `voterID` int(11) DEFAULT NULL,
  `candidateID` int(11) UNSIGNED NOT NULL,
  `voteType` tinyint(2) DEFAULT '0' COMMENT '1: Approval Vote, 0: Negative Vote',
  `voteDate` datetime DEFAULT NULL,
  `voteStatus` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page_followers`
--

CREATE TABLE `page_followers` (
  `id` int(11) UNSIGNED NOT NULL,
  `pageID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL COMMENT 'follower ID',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `pageID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL COMMENT 'Creator ID',
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `links` text COLLATE utf8_unicode_ci COMMENT 'serialized title=>link pair list',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '0: Inactive, 1: Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `poster` int(11) NOT NULL,
  `pageID` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0: means it doesnot belong to a page. If it is bigger than 0, it means it belonged to a page',
  `profileID` int(11) DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_date` datetime NOT NULL,
  `visibility` tinyint(10) NOT NULL DEFAULT '0' COMMENT '0: private, 1: public',
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `youtube_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_profile` tinyint(2) DEFAULT '0',
  `likes` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `post_status` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments`
--

CREATE TABLE `posts_comments` (
  `commentID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `commenter` int(11) NOT NULL,
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `posted_date` datetime NOT NULL,
  `commentStatus` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts_hits`
--

CREATE TABLE `posts_hits` (
  `hitID` int(11) UNSIGNED NOT NULL,
  `postID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `hitDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts_likes`
--

CREATE TABLE `posts_likes` (
  `likeID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `liked_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `likeStatus` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publisher_ads`
--

CREATE TABLE `publisher_ads` (
  `id` int(11) UNSIGNED NOT NULL,
  `publisherID` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `borderColor` varchar(10) DEFAULT '006699',
  `bgColor` varchar(10) DEFAULT 'FFFFFF',
  `titleColor` varchar(10) DEFAULT '006699',
  `textColor` varchar(10) DEFAULT '999999',
  `urlColor` varchar(10) DEFAULT '006699',
  `createdDate` datetime NOT NULL,
  `impressions` mediumint(12) NOT NULL,
  `paidImpressions` mediumint(12) NOT NULL,
  `earnings` double(10,8) DEFAULT '0.00000000',
  `status` tinyint(2) DEFAULT '1' COMMENT '1: Active, 0: Deleted',
  `token` varchar(255) DEFAULT NULL,
  `adType` tinyint(4) DEFAULT '1' COMMENT '1: Customer Ad, 2: Page & Profile Ad, 3: Forum Ad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `reportID` int(11) UNSIGNED NOT NULL,
  `reporterID` int(11) DEFAULT NULL,
  `reportedID` int(11) DEFAULT NULL,
  `objectID` int(11) DEFAULT NULL,
  `objectType` varchar(20) DEFAULT NULL COMMENT 'post, comment, message',
  `reportedDate` datetime DEFAULT NULL,
  `reportStatus` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionID` char(26) NOT NULL DEFAULT '',
  `userID` int(11) DEFAULT '0',
  `expiry` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `catID` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentID` int(11) DEFAULT '0',
  `status` tinyint(2) DEFAULT '1' COMMENT '0: disable, 1: enable',
  `isDownloadable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

CREATE TABLE `shop_orders` (
  `orderID` int(11) UNSIGNED NOT NULL,
  `sellerID` int(11) UNSIGNED NOT NULL,
  `buyerID` int(11) UNSIGNED NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL COMMENT 'Sold product ID',
  `unitPrice` double NOT NULL COMMENT 'unitPrice',
  `shippingPrice` double NOT NULL COMMENT 'shippingPrice',
  `totalPrice` double NOT NULL COMMENT 'total',
  `buyerShippingID` int(11) DEFAULT NULL,
  `trackingNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRead` tinyint(2) DEFAULT '0' COMMENT '0: New, 1: Read',
  `isArchived` tinyint(2) DEFAULT '0' COMMENT '0: No, 1: Yes',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '1: Sold'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders_shipping`
--

CREATE TABLE `shop_orders_shipping` (
  `shippingID` int(11) UNSIGNED NOT NULL,
  `fullName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryID` int(11) UNSIGNED DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `productID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` double DEFAULT NULL COMMENT 'Price in BTC',
  `subtitle` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `catID` int(11) UNSIGNED NOT NULL COMMENT 'It will use trade_category',
  `locationID` int(11) UNSIGNED DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `returnPolicy` text COLLATE utf8_unicode_ci,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '0: Inactive, 1: ACTIVE, 2: Sold',
  `expiryDate` datetime DEFAULT NULL,
  `listingDuration` tinyint(4) DEFAULT NULL,
  `fileName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `isDownloadable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_price`
--

CREATE TABLE `shop_shipping_price` (
  `id` int(11) UNSIGNED NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL,
  `locationID` int(11) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL COMMENT 'Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `stats_post`
--

CREATE TABLE `stats_post` (
  `postID` int(11) UNSIGNED NOT NULL,
  `postType` varchar(10) DEFAULT NULL,
  `sortOrder` int(10) DEFAULT '0',
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_users`
--

CREATE TABLE `temp_users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `activation` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE `tracker` (
  `trackID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT '0',
  `ipAddr` varchar(255) DEFAULT NULL,
  `trackedTime` int(11) DEFAULT NULL,
  `action` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE `trade` (
  `tradeID` int(11) UNSIGNED NOT NULL,
  `sellerID` int(11) UNSIGNED NOT NULL,
  `buyerID` int(11) UNSIGNED NOT NULL,
  `sellerItemID` int(11) UNSIGNED NOT NULL,
  `buyerItemID` int(11) UNSIGNED NOT NULL,
  `sellerShippingID` int(11) UNSIGNED NOT NULL,
  `buyerShippingID` int(11) UNSIGNED NOT NULL,
  `sellerTrackingNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyerTrackingNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '1: traded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trade_categories`
--

CREATE TABLE `trade_categories` (
  `catID` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentID` int(11) DEFAULT '0',
  `status` tinyint(2) DEFAULT '1' COMMENT '0: disable, 1: enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trade_items`
--

CREATE TABLE `trade_items` (
  `itemID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `itemWanted` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `catID` int(11) UNSIGNED NOT NULL,
  `locationID` int(11) UNSIGNED DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) DEFAULT '1' COMMENT '0: Inactive, 1: ACTIVE, 2: Traded',
  `expiryDate` datetime DEFAULT NULL,
  `listingDuration` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trade_offers`
--

CREATE TABLE `trade_offers` (
  `offerID` int(11) UNSIGNED NOT NULL,
  `targetItemID` int(11) UNSIGNED NOT NULL,
  `offeredItemID` int(11) UNSIGNED NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'it will save the last status change date',
  `targetHideDeclined` tinyint(2) DEFAULT '0' COMMENT 'The man who declines this offer removed this after declining. 0: show, 1: hide',
  `offeredHideDeclined` tinyint(2) DEFAULT '0' COMMENT 'The man who offered this offer removed this after being declined. 0: show, 1: hide',
  `status` tinyint(2) DEFAULT '1' COMMENT '0: Inactive, 1: Active, 2: Declined',
  `isNew` tinyint(2) DEFAULT '1' COMMENT '0: not new, 1: new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trade_shipping_info`
--

CREATE TABLE `trade_shipping_info` (
  `shippingID` int(11) UNSIGNED NOT NULL,
  `fullName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryID` int(11) UNSIGNED DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trade_users`
--

CREATE TABLE `trade_users` (
  `userID` int(11) UNSIGNED NOT NULL,
  `shippingFullName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingAddress` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingAddress2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingCity` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingState` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingZip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shippingCountryID` int(11) UNSIGNED DEFAULT NULL,
  `optOfferReceived` tinyint(2) DEFAULT '1' COMMENT '0: disagree; 1: agree that you receive notification when someone makes me an offer',
  `optOfferAccepted` tinyint(2) DEFAULT '1' COMMENT '0: disagree; 1: agree that you receive notification when someone accepts my offer',
  `optOfferDeclined` tinyint(2) DEFAULT '1' COMMENT '0: disagree; 1: agree that you receive notification when someone declines my offer',
  `optFeedbackReceived` tinyint(2) DEFAULT '1' COMMENT '0: disagree; 1: agree that you receive notification when someone declines my offer',
  `optProductSoldOnShop` tinyint(2) DEFAULT '1' COMMENT '0: disagree; 1: agree that you receive notification when someone buy your product on shop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `payer_email` varchar(255) DEFAULT NULL COMMENT 'payer email address',
  `amount` double(11,5) NOT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `trackNumber` varchar(500) DEFAULT NULL COMMENT 'You may read paypal transaction id from here',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `user_acl`
--

CREATE TABLE `user_acl` (
  `aclID` tinyint(4) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Level` tinyint(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email_visibility` tinyint(2) DEFAULT '0',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `gender_visibility` tinyint(2) DEFAULT '0',
  `birthdate` date DEFAULT '0000-00-00',
  `birthdate_visibility` tinyint(2) DEFAULT '0',
  `relationship_status` tinyint(2) DEFAULT '0' COMMENT '1: Single, 2: In a Relation',
  `relationship_status_visibility` tinyint(2) DEFAULT '0',
  `religion` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `religion_visibility` tinyint(2) DEFAULT '0',
  `political_views` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `political_views_visibility` tinyint(2) DEFAULT '0',
  `birthplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `birthplace_visibility` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `current_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `current_city_visibility` tinyint(2) DEFAULT '0',
  `home_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `home_phone_visibility` tinyint(2) DEFAULT '0',
  `cell_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `cell_phone_visibility` tinyint(2) DEFAULT '0',
  `work_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `work_phone_visibility` tinyint(2) DEFAULT '0',
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `address_visibility` tinyint(2) DEFAULT '0',
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(2) DEFAULT '0',
  `messenger_privacy` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'all',
  `show_messenger` tinyint(2) DEFAULT '0',
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '(UTC) Coordinated Universal Time',
  `timezone_visibility` tinyint(2) DEFAULT '0',
  `attributes` varchar(5000) COLLATE utf8_unicode_ci DEFAULT '',
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Registered',
  `user_acl_id` tinyint(4) NOT NULL DEFAULT '2',
  `credits` double(11,5) DEFAULT '0.00000',
  `posts_count` int(11) DEFAULT '0',
  `posts_rating` int(11) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_bitcoin`
--

CREATE TABLE `users_bitcoin` (
  `id` int(11) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `bitcoin_guid` char(36) NOT NULL,
  `bitcoin_address` varchar(34) NOT NULL,
  `bitcoin_link` varchar(200) DEFAULT NULL,
  `bitcoin_password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_bitcoin_transactions_history`
--

CREATE TABLE `users_bitcoin_transactions_history` (
  `transactionID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `addr` text,
  `type` varchar(10) DEFAULT NULL COMMENT 'sent, received',
  `amount` text,
  `totalAmount` int(11) DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_contact`
--

CREATE TABLE `users_contact` (
  `userID` int(11) NOT NULL,
  `contact_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visibility` tinyint(2) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_daily_activities`
--

CREATE TABLE `users_daily_activities` (
  `userID` int(11) NOT NULL,
  `date` date NOT NULL,
  `posts` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `likes` int(11) DEFAULT '0',
  `friendRequests` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_educations`
--

CREATE TABLE `users_educations` (
  `userID` int(11) NOT NULL,
  `school` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `visibility` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0: Private, 1: Public',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_employments`
--

CREATE TABLE `users_employments` (
  `userID` int(11) NOT NULL,
  `employer` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `visibility` tinyint(2) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_links`
--

CREATE TABLE `users_links` (
  `userID` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `visibility` tinyint(2) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_notify_settings`
--

CREATE TABLE `users_notify_settings` (
  `settingID` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `notifyRepliedToMyTopic` tinyint(2) DEFAULT '1' COMMENT 'Someone replies to my topic',
  `notifyRepliedToMyReply` tinyint(2) DEFAULT '1' COMMENT 'Someone replies to a topic that I replied to',
  `notifyMyPostApproved` tinyint(2) DEFAULT '1' COMMENT 'My post has been approved.',
  `notifyCommentToMyComment` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_rating`
--

CREATE TABLE `users_rating` (
  `userID` int(11) UNSIGNED NOT NULL,
  `totalRating` int(11) UNSIGNED DEFAULT '0' COMMENT 'count of feedback, cronjob will update this automatically',
  `positiveRating` int(11) UNSIGNED DEFAULT '0' COMMENT 'Positive rating count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_stats`
--

CREATE TABLE `users_stats` (
  `userID` int(11) UNSIGNED NOT NULL,
  `pageFollowers` int(11) DEFAULT '0',
  `likes` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `voteUps` int(11) DEFAULT '0',
  `replies` int(11) DEFAULT '0',
  `reputation` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_token`
--

CREATE TABLE `users_token` (
  `id` int(11) UNSIGNED NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `userToken` varchar(256) DEFAULT NULL,
  `tokenDate` int(11) DEFAULT NULL,
  `tokenType` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--

CREATE TABLE `video_categories` (
  `categoryID` int(11) UNSIGNED NOT NULL,
  `parentID` int(11) DEFAULT '0',
  `subjectID` int(11) NOT NULL DEFAULT '0',
  `categoryName` varchar(255) DEFAULT '',
  `categoryDescription` varchar(2000) NOT NULL,
  `videosCount` int(11) DEFAULT '0',
  `forumCategoryID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--

CREATE TABLE `video_comments` (
  `commentID` int(11) UNSIGNED NOT NULL,
  `videoID` int(11) DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_subjects`
--

CREATE TABLE `video_subjects` (
  `subjectID` int(11) UNSIGNED NOT NULL,
  `subjectTitle` varchar(255) DEFAULT '',
  `subjectName` varchar(255) DEFAULT '',
  `featuredVideoCode` varchar(50) DEFAULT '' COMMENT 'Youtube Video Code',
  `featuredVideoTitle` varchar(200) DEFAULT '' COMMENT 'Video Title',
  `featuredVideoDescription` varchar(2000) NOT NULL,
  `topCourses` varchar(100) DEFAULT '' COMMENT 'category ids divided by comma'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `videoID` int(11) UNSIGNED NOT NULL,
  `categoryID` int(11) DEFAULT '0',
  `title` varchar(80) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_sizes`
--
ALTER TABLE `ad_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad` (`defaultAd`,`status`,`type`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`albumID`);

--
-- Indexes for table `albums_photos`
--
ALTER TABLE `albums_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banned_users`
--
ALTER TABLE `banned_users`
  ADD PRIMARY KEY (`bannedID`);

--
-- Indexes for table `bitcoin_transaction`
--
ALTER TABLE `bitcoin_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receiverID_index` (`receiverID`) USING BTREE,
  ADD KEY `payerID_index` (`payerID`) USING BTREE,
  ADD KEY `activityID_index` (`activityID`) USING BTREE;

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryID`);

--
-- Indexes for table `credit_activity`
--
ALTER TABLE `credit_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedbackID`);

--
-- Indexes for table `forum_activities`
--
ALTER TABLE `forum_activities`
  ADD PRIMARY KEY (`activityID`),
  ADD KEY `userID_index` (`userID`) USING BTREE,
  ADD KEY `objectID_index` (`objectID`) USING BTREE,
  ADD KEY `actionID_index` (`actionID`) USING BTREE,
  ADD KEY `activityType_index` (`activityType`) USING BTREE,
  ADD KEY `createdDate_index` (`createdDate`),
  ADD KEY `actionID_activityType_index` (`actionID`,`activityType`);

--
-- Indexes for table `forum_blocked_users`
--
ALTER TABLE `forum_blocked_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_categories`
--
ALTER TABLE `forum_categories`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `icat` (`categoryID`,`categoryName`);
ALTER TABLE `forum_categories` ADD FULLTEXT KEY `name_description` (`categoryName`,`description`);

--
-- Indexes for table `forum_categories_links`
--
ALTER TABLE `forum_categories_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_followers`
--
ALTER TABLE `forum_followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_moderators`
--
ALTER TABLE `forum_moderators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_replies`
--
ALTER TABLE `forum_replies`
  ADD PRIMARY KEY (`replyID`);
ALTER TABLE `forum_replies` ADD FULLTEXT KEY `search` (`replyContent`);

--
-- Indexes for table `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD PRIMARY KEY (`topicID`),
  ADD KEY `ftopics` (`topicID`,`topicTitle`,`topicContent`(100),`categoryID`,`creatorID`,`createdDate`,`replies`,`lastReplyID`,`lastReplierID`,`views`,`status`,`votes`);
ALTER TABLE `forum_topics` ADD FULLTEXT KEY `search` (`topicTitle`,`topicContent`);

--
-- Indexes for table `forum_votes`
--
ALTER TABLE `forum_votes`
  ADD PRIMARY KEY (`voteID`),
  ADD KEY `ivotes` (`voteID`,`voteStatus`,`objectID`,`objectType`,`voterID`),
  ADD KEY `ix_object_voter_type` (`objectID`,`voterID`,`objectType`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`friendID`),
  ADD KEY `userID_index` (`userID`) USING BTREE,
  ADD KEY `userFriendID_index` (`userFriendID`) USING BTREE,
  ADD KEY `userFriendID_userID_index` (`userFriendID`,`userID`),
  ADD KEY `status_userID_userFriendID` (`status`,`userID`,`userFriendID`);

--
-- Indexes for table `friends_old`
--
ALTER TABLE `friends_old`
  ADD PRIMARY KEY (`friendID`);

--
-- Indexes for table `main_activities`
--
ALTER TABLE `main_activities`
  ADD PRIMARY KEY (`activityID`),
  ADD KEY `userID_index` (`userID`) USING BTREE,
  ADD KEY `objectID_index` (`objectID`) USING BTREE,
  ADD KEY `actionID_index` (`actionID`) USING BTREE,
  ADD KEY `activityType_index` (`activityType`) USING BTREE,
  ADD KEY `createdDate_index` (`createdDate`),
  ADD KEY `actionID_activityType_index` (`actionID`,`activityType`);

--
-- Indexes for table `main_notifications`
--
ALTER TABLE `main_notifications`
  ADD PRIMARY KEY (`userID`,`activityID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `messenger_blocklist`
--
ALTER TABLE `messenger_blocklist`
  ADD PRIMARY KEY (`messengerBlocklistID`);

--
-- Indexes for table `messenger_buddylist`
--
ALTER TABLE `messenger_buddylist`
  ADD PRIMARY KEY (`messengerBuddylistID`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `buddyID_index` (`buddyID`);

--
-- Indexes for table `messenger_messages_old`
--
ALTER TABLE `messenger_messages_old`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD PRIMARY KEY (`moderatorID`);

--
-- Indexes for table `moderator_candidates`
--
ALTER TABLE `moderator_candidates`
  ADD PRIMARY KEY (`candidateID`);

--
-- Indexes for table `moderator_votes`
--
ALTER TABLE `moderator_votes`
  ADD PRIMARY KEY (`voteID`),
  ADD KEY `MODERATOR_VOTES_CANDIDATES_ID_INDEX` (`candidateID`);

--
-- Indexes for table `page_followers`
--
ALTER TABLE `page_followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pageID_index` (`pageID`) USING BTREE,
  ADD KEY `userID_index` (`userID`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pageID`),
  ADD KEY `userID_index` (`userID`) USING BTREE;
ALTER TABLE `pages` ADD FULLTEXT KEY `title` (`title`,`about`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `poster_index` (`poster`) USING BTREE,
  ADD KEY `pageID_index` (`pageID`) USING BTREE;

--
-- Indexes for table `posts_comments`
--
ALTER TABLE `posts_comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `postID_index` (`postID`) USING BTREE,
  ADD KEY `commenter_index` (`commenter`) USING BTREE;

--
-- Indexes for table `posts_hits`
--
ALTER TABLE `posts_hits`
  ADD PRIMARY KEY (`hitID`);

--
-- Indexes for table `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD PRIMARY KEY (`likeID`),
  ADD KEY `ix_post_user` (`postID`,`userID`);

--
-- Indexes for table `publisher_ads`
--
ALTER TABLE `publisher_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisherID_index` (`publisherID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `idtype` (`reportID`,`objectType`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `asessions` (`sessionID`,`userID`,`expiry`),
  ADD KEY `idsessions` (`userID`,`expiry`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `sellerID_index` (`sellerID`) USING BTREE,
  ADD KEY `buyerID_index` (`buyerID`) USING BTREE,
  ADD KEY `productID_index` (`productID`) USING BTREE;

--
-- Indexes for table `shop_orders_shipping`
--
ALTER TABLE `shop_orders_shipping`
  ADD PRIMARY KEY (`shippingID`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `userID_index` (`userID`) USING BTREE,
  ADD KEY `catID_index` (`catID`) USING BTREE,
  ADD KEY `locationID_index` (`locationID`) USING BTREE;
ALTER TABLE `shop_products` ADD FULLTEXT KEY `title` (`title`,`subtitle`,`description`);

--
-- Indexes for table `shop_shipping_price`
--
ALTER TABLE `shop_shipping_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productID_index` (`productID`) USING BTREE,
  ADD KEY `locationID_index` (`locationID`) USING BTREE;

--
-- Indexes for table `stats_post`
--
ALTER TABLE `stats_post`
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `temp_users`
--
ALTER TABLE `temp_users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`trackID`);

--
-- Indexes for table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`tradeID`),
  ADD KEY `sellerID_index` (`sellerID`) USING BTREE,
  ADD KEY `buyerID_index` (`buyerID`) USING BTREE,
  ADD KEY `sellerItemID_index` (`sellerItemID`) USING BTREE,
  ADD KEY `buyerItemID_index` (`buyerItemID`) USING BTREE;

--
-- Indexes for table `trade_categories`
--
ALTER TABLE `trade_categories`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `trade_items`
--
ALTER TABLE `trade_items`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `userID_index` (`userID`) USING BTREE,
  ADD KEY `catID_index` (`catID`) USING BTREE,
  ADD KEY `locationID_index` (`locationID`) USING BTREE;
ALTER TABLE `trade_items` ADD FULLTEXT KEY `title` (`title`,`subtitle`,`description`);

--
-- Indexes for table `trade_offers`
--
ALTER TABLE `trade_offers`
  ADD PRIMARY KEY (`offerID`),
  ADD KEY `targetItemID_index` (`targetItemID`) USING BTREE,
  ADD KEY `offeredItemID_index` (`offeredItemID`) USING BTREE;

--
-- Indexes for table `trade_shipping_info`
--
ALTER TABLE `trade_shipping_info`
  ADD PRIMARY KEY (`shippingID`);

--
-- Indexes for table `trade_users`
--
ALTER TABLE `trade_users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_acl`
--
ALTER TABLE `user_acl`
  ADD PRIMARY KEY (`aclID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `cusers` (`userID`,`firstName`,`lastName`,`thumbnail`,`messenger_privacy`,`status`),
  ADD KEY `busers` (`userID`,`firstName`,`lastName`,`thumbnail`,`messenger_privacy`,`status`),
  ADD KEY `iusers` (`firstName`,`lastName`,`thumbnail`),
  ADD KEY `ausers` (`userID`,`firstName`,`lastName`,`thumbnail`,`messenger_privacy`);
ALTER TABLE `users` ADD FULLTEXT KEY `firstName` (`firstName`,`lastName`);

--
-- Indexes for table `users_bitcoin`
--
ALTER TABLE `users_bitcoin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID_index` (`userID`);

--
-- Indexes for table `users_bitcoin_transactions_history`
--
ALTER TABLE `users_bitcoin_transactions_history`
  ADD PRIMARY KEY (`transactionID`);

--
-- Indexes for table `users_contact`
--
ALTER TABLE `users_contact`
  ADD PRIMARY KEY (`userID`,`order`);

--
-- Indexes for table `users_daily_activities`
--
ALTER TABLE `users_daily_activities`
  ADD PRIMARY KEY (`userID`,`date`);

--
-- Indexes for table `users_educations`
--
ALTER TABLE `users_educations`
  ADD PRIMARY KEY (`userID`,`order`);

--
-- Indexes for table `users_employments`
--
ALTER TABLE `users_employments`
  ADD PRIMARY KEY (`userID`,`order`);

--
-- Indexes for table `users_links`
--
ALTER TABLE `users_links`
  ADD PRIMARY KEY (`userID`,`order`);

--
-- Indexes for table `users_notify_settings`
--
ALTER TABLE `users_notify_settings`
  ADD PRIMARY KEY (`settingID`);

--
-- Indexes for table `users_rating`
--
ALTER TABLE `users_rating`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `users_stats`
--
ALTER TABLE `users_stats`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `users_token`
--
ALTER TABLE `users_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_categories`
--
ALTER TABLE `video_categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `vid` (`videoID`,`createdDate`);

--
-- Indexes for table `video_subjects`
--
ALTER TABLE `video_subjects`
  ADD PRIMARY KEY (`subjectID`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`videoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_sizes`
--
ALTER TABLE `ad_sizes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `albumID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums_photos`
--
ALTER TABLE `albums_photos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banned_users`
--
ALTER TABLE `banned_users`
  MODIFY `bannedID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bitcoin_transaction`
--
ALTER TABLE `bitcoin_transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `credit_activity`
--
ALTER TABLE `credit_activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedbackID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_activities`
--
ALTER TABLE `forum_activities`
  MODIFY `activityID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175583;
--
-- AUTO_INCREMENT for table `forum_blocked_users`
--
ALTER TABLE `forum_blocked_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_categories`
--
ALTER TABLE `forum_categories`
  MODIFY `categoryID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_categories_links`
--
ALTER TABLE `forum_categories_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_followers`
--
ALTER TABLE `forum_followers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_moderators`
--
ALTER TABLE `forum_moderators`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_replies`
--
ALTER TABLE `forum_replies`
  MODIFY `replyID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_topics`
--
ALTER TABLE `forum_topics`
  MODIFY `topicID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_votes`
--
ALTER TABLE `forum_votes`
  MODIFY `voteID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `friendID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friends_old`
--
ALTER TABLE `friends_old`
  MODIFY `friendID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `main_activities`
--
ALTER TABLE `main_activities`
  MODIFY `activityID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messenger_blocklist`
--
ALTER TABLE `messenger_blocklist`
  MODIFY `messengerBlocklistID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messenger_buddylist`
--
ALTER TABLE `messenger_buddylist`
  MODIFY `messengerBuddylistID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `messageID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messenger_messages_old`
--
ALTER TABLE `messenger_messages_old`
  MODIFY `messageID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `moderator`
--
ALTER TABLE `moderator`
  MODIFY `moderatorID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `moderator_candidates`
--
ALTER TABLE `moderator_candidates`
  MODIFY `candidateID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `moderator_votes`
--
ALTER TABLE `moderator_votes`
  MODIFY `voteID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_followers`
--
ALTER TABLE `page_followers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pageID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts_comments`
--
ALTER TABLE `posts_comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts_hits`
--
ALTER TABLE `posts_hits`
  MODIFY `hitID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts_likes`
--
ALTER TABLE `posts_likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publisher_ads`
--
ALTER TABLE `publisher_ads`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `reportID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `catID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_orders`
--
ALTER TABLE `shop_orders`
  MODIFY `orderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_orders_shipping`
--
ALTER TABLE `shop_orders_shipping`
  MODIFY `shippingID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `productID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_shipping_price`
--
ALTER TABLE `shop_shipping_price`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `temp_users`
--
ALTER TABLE `temp_users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tracker`
--
ALTER TABLE `tracker`
  MODIFY `trackID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trade`
--
ALTER TABLE `trade`
  MODIFY `tradeID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trade_categories`
--
ALTER TABLE `trade_categories`
  MODIFY `catID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trade_items`
--
ALTER TABLE `trade_items`
  MODIFY `itemID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trade_offers`
--
ALTER TABLE `trade_offers`
  MODIFY `offerID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trade_shipping_info`
--
ALTER TABLE `trade_shipping_info`
  MODIFY `shippingID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_acl`
--
ALTER TABLE `user_acl`
  MODIFY `aclID` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_bitcoin`
--
ALTER TABLE `users_bitcoin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_bitcoin_transactions_history`
--
ALTER TABLE `users_bitcoin_transactions_history`
  MODIFY `transactionID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_notify_settings`
--
ALTER TABLE `users_notify_settings`
  MODIFY `settingID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_token`
--
ALTER TABLE `users_token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_categories`
--
ALTER TABLE `video_categories`
  MODIFY `categoryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `commentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_subjects`
--
ALTER TABLE `video_subjects`
  MODIFY `subjectID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `videoID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `moderator_votes`
--
ALTER TABLE `moderator_votes`
  ADD CONSTRAINT `MODERATOR_CANDIDATE_ID_FOREIGN_KEY` FOREIGN KEY (`candidateID`) REFERENCES `moderator_candidates` (`candidateID`) ON DELETE CASCADE ON UPDATE NO ACTION;
--
-- Database: `codeigniter`
--
CREATE DATABASE IF NOT EXISTS `codeigniter` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `codeigniter`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1932 - Table 'codeigniter.users' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'codeigniter.users' doesn't exist in engine)
--
-- Database: `fyp_management_system`
--
CREATE DATABASE IF NOT EXISTS `fyp_management_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fyp_management_system`;

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
(2, 'Fall 2017', NULL, 'default', NULL, 0, '2016-04-03 13:24:15'),
(4, 'Fall 2016', NULL, 'default', NULL, 0, '2016-04-03 13:24:15'),
(5, 'Fall 2015', NULL, 'default', NULL, 0, '2016-04-03 13:24:15'),
(12, 'Spring 2016', '2016-04-04', 'default', 1, 1, '2016-04-03 21:22:24');

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
-- Table structure for table `external_examiner_old`
--

CREATE TABLE `external_examiner_old` (
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

CREATE TABLE `faculty` (
  `facultyId` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isCoordinator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

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

--
-- Dumping data for table `group_deliverables`
--

INSERT INTO `group_deliverables` (`id`, `group_id`, `config_id`, `uploaded_by`, `deliverable`, `upload_dtm`) VALUES
(5, 9, 2, 14, 'group9-deliverable-2.pdf', '2016-04-04 23:45:59');

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
-- Table structure for table `student`
--

CREATE TABLE `student` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentPhoneNo`, `studentEmail`, `studentGender`, `studentPassword`, `student_image`, `groupId`, `isLeader`, `batchId`, `isCompleted`, `isActive`, `createdDtm`) VALUES
(14, 'Muneeb Khan', '7757', '01234565', 'muneeb_420@gmail.com', 'male', '123', '56fff928b82971.36534035.jpg', 9, 1, 12, 0, 0, '2016-04-03 13:30:06'),
(15, 'Umair Qamar', '10776', '03458541454', 'umairqamar@live.com', 'male', '123', '56fff632e226e7.95020533.jpg', 9, 0, 12, 0, 0, '2016-04-03 13:30:06'),
(21, 'Bilal Hassan', '7471', '+923458541454', 'bilalhassan@live.com', 'male', '123', '56fff9374231d1.64504225.jpg', 14, 1, 12, 0, 0, '2016-04-03 13:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `groupId` int(255) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `projectPart` int(1) NOT NULL,
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupInfo';

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

CREATE TABLE `tasks` (
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
-- Table structure for table `wbs_status`
--

CREATE TABLE `wbs_status` (
  `groupId` int(255) NOT NULL,
  `wbsTask` text NOT NULL,
  `wbsTaskDeadline` varchar(255) NOT NULL,
  `wbsTaskStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupIdInfo';

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
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
-- AUTO_INCREMENT for table `external_examiner_old`
--
ALTER TABLE `external_examiner_old`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `requestId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `TaskId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;--
-- Database: `fyp_muneeb`
--
CREATE DATABASE IF NOT EXISTS `fyp_muneeb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fyp_muneeb`;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batchId` int(255) NOT NULL,
  `batchName` varchar(255) NOT NULL,
  `configurationType` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `configurationType`, `isActive`) VALUES
(2, 'Fall 2017', 'default', 1),
(4, 'Fall 2016', 'default', 1),
(5, 'Fall 2015', 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `configurationId` int(255) NOT NULL,
  `week` int(11) NOT NULL,
  `taskName` varchar(255) NOT NULL,
  `taskDetails` longtext,
  `projectPart` tinyint(4) NOT NULL DEFAULT '1',
  `deadline` datetime DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `configurationType` varchar(50) DEFAULT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'close'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default Configurations';

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
(0, 'Examiner 01', '1234567', 'examiner@gmail.com', '123', 'GOOGLE', 0),
(0, 'haj', '', 'haj@gmail.com', '123', 'Google', 1);

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner_old`
--

CREATE TABLE `external_examiner_old` (
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

CREATE TABLE `faculty` (
  `facultyId` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyName` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isCoordinator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faculty Details';

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `designation`, `facultyName`, `facultyPhoneNo`, `facultyEmail`, `facultyPassword`, `isAdmin`, `isCoordinator`) VALUES
(7, 'Lecturer', 'Saud Khan', '3345123456', 'saudkhan@riu.edu.pk', '123', 1, 1),
(12, 'Assocaite Professor', 'Osama Raza', '123456789', 'osama.raza@riu.edu.pk', '123', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_group`
--

CREATE TABLE `faculty_student_group` (
  `facultyStudent` int(255) NOT NULL,
  `groupId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='facultyGroupInfo';

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
  `id` int(11) DEFAULT NULL,
  `studnet_id` int(11) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL
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

--
-- Dumping data for table `group_requests`
--

INSERT INTO `group_requests` (`requestId`, `studentId`, `groupId`) VALUES
(1, 16, 11),
(2, 16, 9),
(3, 16, 11);

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
-- Table structure for table `student`
--

CREATE TABLE `student` (
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
  `isCompleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='FYP Student Records';

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentPhoneNo`, `studentEmail`, `studentGender`, `studentPassword`, `student_image`, `groupId`, `isLeader`, `batchId`, `isCompleted`) VALUES
(14, 'Muneeb Khan', '7757', '01234565', 'muneeb_420@gmail.com', 'male', '123', NULL, 9, 1, 2, 0),
(15, 'Umair Qamar', '10776', '03458541454', 'umairqamar@live.com', 'male', '123', NULL, 9, 0, 2, 0),
(16, 'Abdul Saboor', '7783', '03335385896', 'saboor@gmail.com', 'male', '123', NULL, 0, 0, 2, 0),
(19, 'Bilal Hassan', '7731', '1212', 'bilalhassan@live.com', 'male', '123', NULL, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `groupId` int(255) NOT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `projectPart` int(1) NOT NULL,
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupInfo';

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`groupId`, `projectName`, `projectPart`, `groupLimit`, `inGroup`, `leaderId`) VALUES
(9, 'Fyp Management System', 1, 3, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
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

CREATE TABLE `timeline` (
  `item_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `details` longtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `sdp_part` tinyint(4) NOT NULL DEFAULT '1',
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `visibility` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`item_id`, `title`, `details`, `type`, `sdp_part`, `created_dtm`, `created_by`, `visibility`) VALUES
(1, 'Muhammad Saud Khan sent you an email', '<div>All SDP (Part I) project groups are required to participate in this activity (Friday, 4th December 2015 (9:00AM-1:00PM)).</div>\r\n<div></div>\r\n<div>\r\n<ul>\r\n	<li>All groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>You are expected to present your report (first 5 chapters), project idea &amp; prototype.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n</div>\r\n<div>IMPORTANT: This is mandatory activity - Failure to participate will earn you "F" grade.</div>\r\n<div></div>\r\n\r\n', 'email', 1, '2016-03-10 19:58:00', 'Saud Khan', 'PUBLIC');

-- --------------------------------------------------------

--
-- Table structure for table `wbs_status`
--

CREATE TABLE `wbs_status` (
  `groupId` int(255) NOT NULL,
  `wbsTask` text NOT NULL,
  `wbsTaskDeadline` varchar(255) NOT NULL,
  `wbsTaskStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='groupIdInfo';

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
(1, 8, 'Teaching Fellow', 2, 0),
(2, 1, 'Assistant Professor', 6, 1),
(3, 8, 'Assocaite Professor', 2, 0),
(4, 13, 'Captain America', 3, 0);

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
  ADD PRIMARY KEY (`facultyStudent`);

--
-- Indexes for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  ADD PRIMARY KEY (`requestId`);

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
  MODIFY `batchId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `configurationId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `external_examiner_old`
--
ALTER TABLE `external_examiner_old`
  MODIFY `examinerId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  MODIFY `facultyStudent` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  MODIFY `requestId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `requestId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `groupId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `TaskId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `work_load`
--
ALTER TABLE `work_load`
  MODIFY `loadId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;--
-- Database: `fypms`
--
CREATE DATABASE IF NOT EXISTS `fypms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fypms`;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int(255) NOT NULL,
  `batch_name` enum('Spring','Fall') NOT NULL,
  `batch_year` varchar(4) NOT NULL,
  `start_date` date NOT NULL,
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL COMMENT 'Name of Coordinator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_name`, `batch_year`, `start_date`, `created_dtm`, `created_by`) VALUES
(3, 'Spring', '2015', '0000-00-00', '2016-01-28 00:53:16', 'Saud Khan'),
(5, 'Spring', '2016', '0000-00-00', '2016-02-27 13:58:05', 'Saud Khan');

-- --------------------------------------------------------

--
-- Table structure for table `batch_configurations`
--

CREATE TABLE `batch_configurations` (
  `batch_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `config_name` text,
  `config_detail` text,
  `config_value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will associate each batch with their configurations';

--
-- Dumping data for table `batch_configurations`
--

INSERT INTO `batch_configurations` (`batch_id`, `config_id`, `config_name`, `config_detail`, `config_value`) VALUES
(0, NULL, 'ma', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `batch_tasks`
--

CREATE TABLE `batch_tasks` (
  `batch_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `sdp_part` tinyint(4) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `task_name` text,
  `task_description` longtext,
  `attachment` varchar(55) DEFAULT NULL,
  `task_deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unnormalized Database';

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

CREATE TABLE `coordinator` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coordinator`
--

INSERT INTO `coordinator` (`id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `default_task`
--

CREATE TABLE `default_task` (
  `id` int(11) NOT NULL,
  `sdp_part` tinyint(1) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `task_name` text,
  `task_description` longtext,
  `attachment` varchar(255) DEFAULT NULL,
  `task_deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default tasks of a batch';

--
-- Dumping data for table `default_task`
--

INSERT INTO `default_task` (`id`, `sdp_part`, `week`, `task_name`, `task_description`, `attachment`, `task_deadline`) VALUES
(1, 1, 1, 'Orientation Presentation', NULL, NULL, NULL),
(2, 1, 2, 'Deliverable 01: Project Team List', '<ul>\r\n	<li>Use "Template-01" to fill in the details of project team members and submit hard copy to Project Coordinator .</li>\r\n	<li>Due Date: -- </li>\r\n</ul>', NULL, NULL),
(3, 1, 3, 'Deliverable 02: Project Proposal', '<ul>\r\n	<li>Use "Template-02"  to write down initial proposal and submit hard copy to project coordinator.</li>\r\n	<li>Due Date: --</li>\r\n</ul>', NULL, NULL),
(4, 1, 5, 'Proposal Presentation', 'SDP (Part I) Proposal Presentations will be held on <strong>--</strong>\r\n\r\nAll SDP (Part I) students must reserve a presentation slot in consultation with project supervisor by <strong>--</strong>.\r\n Presentation slots will be allocated on first come first serve basis.', NULL, NULL),
(5, 1, 5, 'Proposal Presentation: Submission', 'Due Date: --', NULL, NULL),
(6, 1, 6, 'Final Project Proposal ', NULL, NULL, NULL),
(7, 1, 13, 'Open House (Fall 2015)', 'Date for Open House  has been finalized. All Part-01 project groups are required to participate in Open House on<strong>--</strong>.\r\n<ul>\r\n	<li>All project groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\r\n	<li>SDP (Part 01) groups are expected to present their report (first 5 chapters), project idea &amp; prototype at Open House.</li>\r\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\r\n	<li>You will also need to design posters, brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\r\n</ul>\r\n<strong>IMPORTANT:</strong> This is mandatory activity - Failure to participate will earn you "F" grade.', NULL, NULL),
(8, 1, 19, 'Progress Presentation Template', NULL, 'Progress Presentation.pptx', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner`
--

CREATE TABLE `external_examiner` (
  `id` int(255) NOT NULL,
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

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL DEFAULT '0',
  `faculty_designation` varchar(50) DEFAULT '0',
  `faculty_role` varchar(50) NOT NULL DEFAULT '0' COMMENT 'supervisor,coordinator,or both or lecturer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `student_cms` varchar(50) NOT NULL,
  `is_initiator` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=yes , 0=no',
  `batch` varchar(50) DEFAULT NULL COMMENT 'batch in which he enrolled in SDP',
  `sdp_part` tinyint(4) DEFAULT NULL COMMENT 'currently in part 1 or 2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `student_cms`, `is_initiator`, `batch`, `sdp_part`) VALUES
(5, '10776', 1, NULL, NULL),
(14, '7757', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_group_requests`
--

CREATE TABLE `student_group_requests` (
  `request_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `request_dtm` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Requests sent to the groups are stored here untill accepted\r\n';

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `student_group_id` int(11) NOT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `sdp_part` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Part 1 or Part 2',
  `initiator_id` int(11) NOT NULL COMMENT 'User id of group initiator',
  `group_limit` int(11) NOT NULL DEFAULT '3' COMMENT 'numbers of group members.Default is 3 unles coordinator changes it',
  `num_of_members` int(11) NOT NULL COMMENT 'number of group members in group.MUST always be less than group limit',
  `created_dtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_groups`
--

INSERT INTO `student_groups` (`student_group_id`, `project_name`, `sdp_part`, `initiator_id`, `group_limit`, `num_of_members`, `created_dtm`) VALUES
(12, 'Final Year Project Management System', 1, 5, 3, 1, '2016-02-15 22:16:34'),
(13, 'Some Project', 1, 6, 3, 1, '2016-02-27 13:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unnormalized Table';

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
('005', 'Umair Qamar '),
('006', 'Umair Qamar '),
('new id', 'new name');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_contact` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_gender` enum('male','female') NOT NULL,
  `user_image` varchar(50) NOT NULL,
  `user_created_dtm` datetime NOT NULL,
  `user_type` tinytext NOT NULL COMMENT 'SA=SuperAdmin,CO=Coordinator,SU=Supervisor,ST=Student,FA=Faculty,EE=ExternalExaminer',
  `is_active` tinyint(1) NOT NULL COMMENT '0= inactive, 1 = active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users : superuser,coordinator,student,supervisor,external_examiner';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_contact`, `user_password`, `user_gender`, `user_image`, `user_created_dtm`, `user_type`, `is_active`) VALUES
(1, 'Super Admin', 'superadmin@email.com', NULL, '123', 'male', '56a9e554af5708.74283687.jpg', '2016-01-21 22:41:17', 'SA', 1),
(4, 'Saud Khan', 'saudkhan@riu.edu.pk', NULL, '123', 'male', '56a9e69b237d91.18795593.jpg', '2016-01-22 19:35:51', 'CO', 1),
(5, 'Umair Qamar', 'umairqamar@live.com', '12345678', '123', 'male', '', '0000-00-00 00:00:00', 'ST', 0),
(14, 'Muhammad Muneeb', 'muhammadmuneeb76@gmail.com', '3345224443', '123', 'male', '', '0000-00-00 00:00:00', 'ST', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `batch_name_batch_year` (`batch_name`,`batch_year`);

--
-- Indexes for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_task`
--
ALTER TABLE `default_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD KEY `FK_faculty_users` (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_cms`),
  ADD KEY `FK_student_users` (`id`);

--
-- Indexes for table `student_group_requests`
--
ALTER TABLE `student_group_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`student_group_id`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD KEY `FK__faculy` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `default_task`
--
ALTER TABLE `default_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student_group_requests`
--
ALTER TABLE `student_group_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `student_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD CONSTRAINT `FK_coordinator_users` FOREIGN KEY (`id`) REFERENCES `users` (`user_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"fyp_muneeb","table":"configurations"},{"db":"fyp_muneeb","table":"tasks"},{"db":"fyp_muneeb","table":"wbs_status"},{"db":"fyp_muneeb","table":"faculty"},{"db":"fyp_muneeb","table":"external_examiner"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'fyp_muneeb', 'configurations', '{"sorted_col":"`configurations`.`status` ASC"}', '2016-03-31 16:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-02-29 05:50:07', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `testing`
--
CREATE DATABASE IF NOT EXISTS `testing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `testing`;

-- --------------------------------------------------------

--
-- Table structure for table `add_delete_record`
--

CREATE TABLE `add_delete_record` (
  `id` int(11) NOT NULL,
  `content` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_delete_record`
--

INSERT INTO `add_delete_record` (`id`, `content`) VALUES
(13, 'nigga!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_delete_record`
--
ALTER TABLE `add_delete_record`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_delete_record`
--
ALTER TABLE `add_delete_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2016-02-28 10:41:05', '2016-02-28 10:41:05', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'WordPress', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'thefaintedbrain@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'hack_file', '0', 'yes'),
(30, 'blog_charset', 'UTF-8', 'yes'),
(31, 'moderation_keys', '', 'no'),
(32, 'active_plugins', 'a:0:{}', 'yes'),
(33, 'category_base', '', 'yes'),
(34, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(35, 'comment_max_links', '2', 'yes'),
(36, 'gmt_offset', '0', 'yes'),
(37, 'default_email_category', '1', 'yes'),
(38, 'recently_edited', '', 'no'),
(39, 'template', 'twentyfifteen', 'yes'),
(40, 'stylesheet', 'twentyfifteen', 'yes'),
(41, 'comment_whitelist', '1', 'yes'),
(42, 'blacklist_keys', '', 'no'),
(43, 'comment_registration', '0', 'yes'),
(44, 'html_type', 'text/html', 'yes'),
(45, 'use_trackback', '0', 'yes'),
(46, 'default_role', 'subscriber', 'yes'),
(47, 'db_version', '35700', 'yes'),
(48, 'uploads_use_yearmonth_folders', '1', 'yes'),
(49, 'upload_path', '', 'yes'),
(50, 'blog_public', '1', 'yes'),
(51, 'default_link_category', '2', 'yes'),
(52, 'show_on_front', 'posts', 'yes'),
(53, 'tag_base', '', 'yes'),
(54, 'show_avatars', '1', 'yes'),
(55, 'avatar_rating', 'G', 'yes'),
(56, 'upload_url_path', '', 'yes'),
(57, 'thumbnail_size_w', '150', 'yes'),
(58, 'thumbnail_size_h', '150', 'yes'),
(59, 'thumbnail_crop', '1', 'yes'),
(60, 'medium_size_w', '300', 'yes'),
(61, 'medium_size_h', '300', 'yes'),
(62, 'avatar_default', 'mystery', 'yes'),
(63, 'large_size_w', '1024', 'yes'),
(64, 'large_size_h', '1024', 'yes'),
(65, 'image_default_link_type', 'none', 'yes'),
(66, 'image_default_size', '', 'yes'),
(67, 'image_default_align', '', 'yes'),
(68, 'close_comments_for_old_posts', '0', 'yes'),
(69, 'close_comments_days_old', '14', 'yes'),
(70, 'thread_comments', '1', 'yes'),
(71, 'thread_comments_depth', '5', 'yes'),
(72, 'page_comments', '0', 'yes'),
(73, 'comments_per_page', '50', 'yes'),
(74, 'default_comments_page', 'newest', 'yes'),
(75, 'comment_order', 'asc', 'yes'),
(76, 'sticky_posts', 'a:0:{}', 'yes'),
(77, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(78, 'widget_text', 'a:0:{}', 'yes'),
(79, 'widget_rss', 'a:0:{}', 'yes'),
(80, 'uninstall_plugins', 'a:0:{}', 'no'),
(81, 'timezone_string', '', 'yes'),
(82, 'page_for_posts', '0', 'yes'),
(83, 'page_on_front', '0', 'yes'),
(84, 'default_post_format', '0', 'yes'),
(85, 'link_manager_enabled', '0', 'yes'),
(86, 'finished_splitting_shared_terms', '1', 'yes'),
(87, 'site_icon', '0', 'yes'),
(88, 'medium_large_size_w', '768', 'yes'),
(89, 'medium_large_size_h', '0', 'yes'),
(90, 'initial_db_version', '35700', 'yes'),
(91, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(92, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'cron', 'a:5:{i:1457217666;a:2:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1457217667;a:1:{s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1457261052;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1457261054;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(105, 'rewrite_rules', 'a:65:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(107, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.4.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.4.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.4.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.4.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.4.2";s:7:"version";s:5:"4.4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1457205871;s:15:"version_checked";s:5:"4.4.2";s:12:"translations";a:0:{}}', 'yes'),
(109, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1457205881;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:1:{s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes'),
(112, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1457205889;s:7:"checked";a:6:{s:12:"twentyeleven";s:3:"2.3";s:13:"twentyfifteen";s:3:"1.4";s:14:"twentyfourteen";s:3:"1.6";s:9:"twentyten";s:3:"2.1";s:14:"twentythirteen";s:3:"1.7";s:12:"twentytwelve";s:3:"1.9";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(113, '_site_transient_timeout_browser_e3ae366e66d1c39ce6cf9f9706edbba9', '1457261050', 'yes'),
(114, '_site_transient_browser_e3ae366e66d1c39ce6cf9f9706edbba9', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"48.0.2564.116";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(115, 'can_compress_scripts', '1', 'yes'),
(137, '_site_transient_timeout_theme_roots', '1457207675', 'yes'),
(138, '_site_transient_theme_roots', 'a:7:{s:9:"UrduPress";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:9:"twentyten";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(139, '_site_transient_timeout_browser_a38759e458df6a2e151e116ba3dc0a0b', '1457810693', 'yes'),
(140, '_site_transient_browser_a38759e458df6a2e151e116ba3dc0a0b', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"44.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(141, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1457249099', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(142, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 04:55:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=4.5-beta2-36853";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.5 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2016/03/wordpress-4-5-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 04:55:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4116";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.5 Beta 2 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.5, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Mike Schroder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2370:"<p>WordPress 4.5 Beta 2 is now available!</p>\n<p>This software is still in development<strong>,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.5, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/" target="_blank">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.5-beta2.zip" target="_blank">download the beta here</a> (zip).</p>\n<p>For more information on what&#8217;s new in 4.5, check out the <a href="https://wordpress.org/news/2016/02/wordpress-4-5-beta-1/">Beta 1 blog post</a>. Some of the fixes in Beta 2 include:</p>\n<ul>\n<li>Added <a href="https://core.trac.wordpress.org/ticket/33300">Horizontal Rule (HR) editing shortcut</a> and <a href="https://core.trac.wordpress.org/ticket/28612">dismissible &#8220;Paste as Text&#8221; notice</a> in <strong>TinyMCE</strong>.</li>\n<li><strong>Selective Refresh</strong> support is <a href="https://core.trac.wordpress.org/changeset/36797">enabled for core themes titles and taglines</a>, which allows shift-click to focus on controls and PHP filters to apply in the preview.</li>\n<li>Resolved a fatal error on <strong>image upload</strong> when ImageMagick could not complete stripping meta during resize (<a href="https://core.trac.wordpress.org/ticket/33642">#33642</a>).</li>\n<li><strong>Various bug fixes</strong>. We&#8217;ve made <a href="https://core.trac.wordpress.org/log/?action=stop_on_copy&amp;mode=stop_on_copy&amp;rev=36813&amp;stop_rev=36701&amp;limit=200&amp;verbose=on">just over 100 changes</a> in the last week.</li>\n</ul>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta" target="_blank">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/" target="_blank">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major" target="_blank">a list of known bugs.</a></p>\n<p>Happy testing!</p>\n<p><em>It&#8217;s peer pressure time</em><br />\n<em>Testing: all cool kids do it</em><br />\n<em>Help find ALL the bugs!</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:33:"\n		\n		\n		\n		\n				\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Contributor Weekend: One-Hour Video";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://wordpress.org/news/2016/02/contributor-weekend-one-hour-video/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 26 Feb 2016 19:36:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4112";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:349:"It&#8217;s time for our second global contributor weekend, and this time we&#8217;re focusing on the video team. For this month&#8217;s challenge, in honor of it being our second month, you have two options for how you can participate! The challenge for this month overall is to work with at least one hour worth of WordCamp video, which [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Jen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2590:"<p>It&#8217;s time for our second global contributor weekend, and this time we&#8217;re focusing on the <a href="https://make.wordpress.org/tv">video team</a>. For this month&#8217;s challenge, in honor of it being our second month, you have two options for how you can participate! The challenge for this month overall is to work with at least one hour worth of WordCamp video, which you can do by either creating subtitles or editing the video file in preparation for upload to <a href="http://WordPress.tv">WordPress.tv</a>.</p>\n<p>One of the great things about contributing to the video team is that you get to learn so much, since all the work basically involves watching WordCamp presentation videos. Subtitling is a doubly important need, as it is needed to make all those WordCamp videos accessible to people who are deaf or hard of hearing and can&#8217;t listen to the audio track, as well as making it possible for the videos to be consumed (in some cases after subtitle translation) by people who speak different languages.</p>\n<p>The challenge will last from Saturday, February 27, 2016 through Sunday, February 28, 2016, and the results will be reviewed afterward by members of the video team. If you enjoy the challenge, the video team would be very excited to welcome you into their ranks! Interested? <a href="https://wp.me/P6onIa-28D">Here&#8217;s how to participate</a>.</p>\n<h3>What About Last Month?</h3>\n<p>In January, the inaugural contributor weekend was focused on the support forums. That challenge had 73 participants, including 10 people who provided 20 or more correct answers to open support threads, thereby winning the challenge. Congratulations to Harris Anastasiadis, Ahmad Awais, Takis Bouyouris, Phil Erb, Eric Gunawan, Jackie McBride, Diana Nichols, Kostas Nicolacopoulos, Juhi Saxena, and Sarah Semark! To them and to everyone else who participated, thank you <strong>so much</strong> for your efforts. Every answer helps, and over the course of this contributor weekend, these amazing volunteers responded to <strong>800 support threads</strong>. The support forums queue of requests with no replies went from 28 pages to 7 pages &#8212; that was an incredible success, of which every participant was a part!</p>\n<p>So head on over to see how to <a href="https://wp.me/P6onIa-28D">get involved with the one-hour video challenge</a> this weekend, and help us make next month&#8217;s post just as impressive! <img src="https://s.w.org/images/core/emoji/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:41:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n	\n\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.5 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2016/02/wordpress-4-5-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 25 Feb 2016 03:27:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4080";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:329:"WordPress 4.5 Beta 1 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.5, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"enclosure";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"url";s:62:"https://wordpress.org/news/files/2016/02/wp-inline-linking.mp4";s:6:"length";s:6:"409018";s:4:"type";s:9:"video/mp4";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"url";s:62:"https://wordpress.org/news/files/2016/02/wp-editor-updates.mp4";s:6:"length";s:6:"231953";s:4:"type";s:9:"video/mp4";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Mike Schroder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5453:"<p>WordPress 4.5 Beta 1 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.5, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/" target="_blank">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.5-beta1.zip" target="_blank">download the beta here</a> (zip).</p>\n<p>WordPress 4.5 is slated for release on <a href="https://make.wordpress.org/core/version-4-5-project-schedule/" target="_blank">April 12</a>, but to get there, we need your help testing what we have been working on, including:</p>\n<ul>\n<li><strong>Responsive Preview of your site in the Customizer </strong>(<a href="https://core.trac.wordpress.org/ticket/31195">#31195</a>) &#8211; See how your site looks in <a href="https://make.wordpress.org/core/2016/01/28/previewing-site-responsiveness-in-the-customizer/">mobile, tablet, and desktop</a> contexts before making changes to its appearance.</li>\n<li><strong>Theme Logo Support </strong>(<a href="https://core.trac.wordpress.org/ticket/33755">#33755</a>) &#8211; Native support for a <a href="https://make.wordpress.org/core/2016/02/24/theme-logo-support/">theme logo within the Customizer</a>.</li>\n<li><strong>Inline Link Editing</strong> (<a href="https://core.trac.wordpress.org/ticket/33301">#33301</a>) &#8211; Within the visual editor, <a href="https://wordpress.org/news/files/2016/02/wp-inline-linking.mp4">edit links inline</a> for a smoother workflow.</li>\n<li><strong>Additional Editor Shortcuts</strong> (<a href="https://core.trac.wordpress.org/ticket/33300">#33300</a>) &#8211; <a href="https://wordpress.org/news/files/2016/02/wp-editor-updates.mp4">Includes a few new shortcuts</a>, like <code>`..`</code> for <code>code</code> and <code>**..**</code> for <strong>bold</strong>.</li>\n<li><strong>Comment Moderation Improvements </strong>(<a href="https://core.trac.wordpress.org/ticket/34133">#34133</a>) &#8211; An enhanced experience when moderating comments, including preview with rendered formatting.</li>\n<li><strong>Optimization of Image Generation </strong>(<a href="https://core.trac.wordpress.org/ticket/33642">#33642</a>) &#8211; Image sizes are generated more efficiently and remove unneeded meta, while still including color profiles in Imagick, for reduced sizes of up to 50% with near identical visual quality.</li>\n</ul>\n<p>&nbsp;</p>\n<p>There have been changes for developers to explore as well:</p>\n<ul>\n<li><strong>Selective Refresh </strong>(<a href="https://core.trac.wordpress.org/ticket/27355">#27355</a>)<strong> </strong>&#8211; A <a href="https://make.wordpress.org/core/2016/02/16/selective-refresh-in-the-customizer/">comprehensive framework</a> for rendering parts of the customizer preview in real time. Theme and plugin authors should test their widgets specifically for compatibility with selective refresh, and note that it <a href="https://core.trac.wordpress.org/ticket/35855">may ultimately be opt-in for 4.5</a>.</li>\n<li><strong>Backbone and Underscore updated to latest versions</strong> (<a href="https://core.trac.wordpress.org/ticket/34350">#34350</a>)<b> </b>&#8211; Backbone is upgraded from 1.1.2 to 1.2.3 and Underscore is upgraded from 1.6.0 to 1.8.3. See the <a href="https://make.wordpress.org/core/2016/02/17/backbone-and-underscore-updated-to-latest-versions/">this post</a> for important changes.</li>\n<li><strong>Embed templates</strong> (<a href="https://core.trac.wordpress.org/ticket/34561">#34561</a>) &#8211; Embed templates were split into parts and can now be directly overridden by themes via the template hierarchy.</li>\n<li><strong>New WP_Site class</strong> (<a href="https://core.trac.wordpress.org/ticket/32450">#32450</a>) &#8211; More object-oriented approach for managing sites in Multisite</li>\n<li><strong>Script loader</strong> (<a href="https://core.trac.wordpress.org/ticket/14853">#14853</a>, <a href="https://core.trac.wordpress.org/ticket/35873">#35873</a>) &#8211; Introduces <code>wp_add_inline_script()</code> for including inline JavaScript just like <code>wp_add_inline_style()</code> works for CSS, and better support for script header/footer dependencies.</li>\n</ul>\n<p>If you want a more in-depth view of what major changes have made it into 4.5, <a href="https://make.wordpress.org/core/tag/4-5/" target="_blank">check out all 4.5-tagged posts</a> on the main development blog, or check out a <a href="https://core.trac.wordpress.org/query?status=closed&amp;resolution=fixed&amp;milestone=4.5&amp;group=component&amp;order=priority">list of everything</a> that&#8217;s changed.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta" target="_blank">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/" target="_blank">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major" target="_blank">a list of known bugs.</a></p>\n<p>Happy testing!</p>\n<p><em>A wonderful day</em><br />\n<em>is one that brings new WordPress</em><br />\n<em>Four Five Beta One</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Experiment: WordCamp Incubator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2016/02/experiment-wordcamp-incubator/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Feb 2016 19:28:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"Events";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4076";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:399:"WordCamps are locally-organized WordPress conferences that happen all over the world (and are so fun). Sometimes people don&#8217;t realize that WordCamps are organized by local volunteers rather than a central organization, and they contact us asking, &#8220;Can you bring WordCamp to my city?&#8221; When this happens, we always suggest they start with a meetup group, and think about [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Jen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2989:"<p><a href="http://wordcamp.org">WordCamps</a> are locally-organized WordPress conferences that happen all over the world (and are so fun). Sometimes people don&#8217;t realize that WordCamps are organized by local volunteers rather than a central organization, and they contact us asking, &#8220;Can you bring WordCamp to my city?&#8221; When this happens, we always suggest they start with a meetup group, and think about organizing a WordCamp themselves after their group has been active for a few months. We emphasize that WordCamps are locally-organized events, not something that the central <a href="https://make.wordpress.org/community">community team</a> plans from afar.</p>\n<p>This has been successful in many areas &#8212; there are currently 241 meetup groups on our meetup.com chapter program! In some regions, though, enthusiastic volunteers have had more of a challenge getting things started. Because of this, we&#8217;re going to try an experiment this year called the WordCamp Incubator.</p>\n<p>The intention of the incubator program is to help spread WordPress to underserved areas through providing more significant organizing support for a first event. In practical terms, this experiment means we&#8217;ll be choosing three cities in 2016 where there is not an active WordPress community &#8212; but where it seems like there is a lot of potential and where there are some people excited to become organizers &#8212; and will help to organize their first WordCamp. These WordCamps will be small, one-day, one-track events geared toward the goal of generating interest and getting people involved in creating an ongoing local community.*</p>\n<p>So, where should we do these three events?  If you have always wanted a WordCamp in your city but haven&#8217;t been able to get a meetup group going, this is a great opportunity. We will be taking applications for the next week, then will get in touch with everyone who applied to discuss the possibilities. We will announce the  cities chosen by the end of March.</p>\n<p>To apply, <a href="http://wordpressdotorg.polldaddy.com/s/wordcamp-incubator-application">fill in the application</a> by February 26, 2016. You don&#8217;t need to have any specific information handy, it&#8217;s just a form to let us know you&#8217;re interested. You can apply to nominate your city even if you don&#8217;t want to be the main organizer, but for this experiment  we will need local liaisons and volunteers, so please only nominate cities where you live or work so that we have at least one local connection to begin.</p>\n<p>Thanks, and good luck!</p>\n<p><em><strong>* </strong>For the record, that describes the ideal first WordCamp even if you have an active meetup &#8212; there&#8217;s no need to wait until your group is big enough to support a large multi-day event, and small events are a lot of fun because everyone has a chance to be involved and get to know most of the other attendees.</em></p>\n<p>&nbsp;</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:36:"\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 4.4.2 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wordpress.org/news/2016/02/wordpress-4-4-2-security-and-maintenance-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 02 Feb 2016 17:57:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4065";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:375:"WordPress 4.4.2 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. WordPress versions 4.4.1 and earlier are affected by two security issues: a possible SSRF for certain local URIs, reported by Ronni Skansing; and an open redirection attack, reported by Shailesh Suthar. Thank you [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Samuel Sidler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2072:"<p>WordPress 4.4.2 is now available. This is a <strong>security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>WordPress versions 4.4.1 and earlier are affected by two security issues: a possible SSRF for certain local URIs, reported by <a href="https://www.linkedin.com/in/ronni-skansing-36143b65">Ronni Skansing</a>; and an open redirection attack, reported by <a href="https://twitter.com/shailesh4594">Shailesh Suthar</a>.</p>\n<p>Thank you to both reporters for practicing <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">responsible disclosure</a>.</p>\n<p>In addition to the security issues above, WordPress 4.4.2 fixes 17 bugs from 4.4 and 4.4.1. For more information, see the <a href="https://codex.wordpress.org/Version_4.4.2">release notes</a> or consult the <a href="https://core.trac.wordpress.org/query?milestone=4.4.2">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.4.2</a> or venture over to Dashboard → Updates and simply click “Update Now.” Sites that support automatic background updates are already beginning to update to WordPress 4.4.2.</p>\n<p>Thanks to everyone who contributed to 4.4.2:</p>\n<p><a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/berengerzyla">berengerzyla</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chandrapatel">Chandra Patel</a>, <a href="https://profiles.wordpress.org/chriscct7">Chris Christoff</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/firebird75">firebird75</a>, <a href="https://profiles.wordpress.org/ivankristianto">Ivan Kristianto</a>, <a href="https://profiles.wordpress.org/jmdodd">Jennifer M. Dodd</a>, <a href="https://profiles.wordpress.org/salvoaranzulla">salvoaranzulla</a></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n				\n		\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Contributor Weekend: Support Forums";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"https://wordpress.org/news/2016/01/contributor-weekend-support-forums/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Jan 2016 18:31:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:4:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:6:"Events";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:12:"contributors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:14:"Support Forums";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4055";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:351:"Our first global contributor drive is coming up next weekend, January 30-31, 2016, and we want you to be involved! Many of our current contributors first got involved at a Contributor Day at a WordCamp or WordPress Meetup event near them, but not everyone has had that opportunity, so we&#8217;re trying to create an online experience that [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:3:"Jen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2112:"<p>Our first global contributor drive is coming up next weekend, January 30-31, 2016, and we want you to be involved!</p>\n<p>Many of our current contributors first got involved at a Contributor Day at a <a href="http://wordcamp.org">WordCamp</a> or <a href="http://www.meetup.com/pro/wordpress/">WordPress Meetup</a> event near them, but not everyone has had that opportunity, so we&#8217;re trying to create an online experience that will give new contributors the same kind of live support and group dynamic. We&#8217;ll be doing these as weekend challenges rather than one-day events so that WordPress users all over the world can participate without worrying about pesky time zones, but each challenge will be designed to be completed within a few hours, comparable to an in-person Contributor Day.</p>\n<p>Our inaugural Contributor Weekend is focused on the <a href="https://make.wordpress.org/support">Support Team</a> &#8212; the folks who volunteer their time to help people with WordPress questions in the <a href="https://wordpress.org/support">support forums</a> and <a href="https://make.wordpress.org/support/irc-support-channel/">IRC</a>. Over the two day span, forum moderators will be available online to help new contributors and answer questions as needed. The challenge this month is called <em>20 Questions;</em> your mission (should you choose to accept it) is to help WordPress users by answering 20 forum support requests over the course of the weekend.</p>\n<p>You can participate on your own, or you can get together with other people from your local meetup group and work on it together. Working together in person is really fun, so we highly recommend trying to get some folks together if you&#8217;re able, but if that&#8217;s not possible you can still connect to other participants online. Either way, this is a great way to give back to the WordPress project and have some fun helping people at the same time.</p>\n<p>Interested? <a href="https://make.wordpress.org/support/20-questions/">Get the details on how to participate</a>.</p>\n<p>Hope to see you next weekend!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"WordPress 4.4.1 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wordpress.org/news/2016/01/wordpress-4-4-1-security-and-maintenance-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 Jan 2016 20:07:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=4041";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:376:"WordPress 4.4.1 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. WordPress versions 4.4 and earlier are affected by a cross-site scripting vulnerability that could allow a site to be compromised. This was reported by Crtc4L. There were also several non-security bug fixes: Emoji [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Aaron Jorbin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5153:"<p>WordPress 4.4.1 is now available. This is a <strong>security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>WordPress versions 4.4 and earlier are affected by a cross-site scripting vulnerability that could allow a site to be compromised. This was <a href="https://make.wordpress.org/core/handbook/reporting-security-vulnerabilities/">reported</a> by <a href="https://hackerone.com/crtc4l">Crtc4L</a>.</p>\n<p>There were also several non-security bug fixes:</p>\n<ul>\n<li>Emoji support has been updated to include all of the latest emoji characters, including the new diverse emoji! <img src="https://s.w.org/images/core/emoji/72x72/1f44d.png" alt="👍" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/72x72/1f3ff.png" alt="🏿" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/72x72/1f44c.png" alt="👌" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/72x72/1f3fd.png" alt="🏽" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/72x72/1f44f.png" alt="👏" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/72x72/1f3fc.png" alt="🏼" class="wp-smiley" style="height: 1em; max-height: 1em;" /></li>\n<li>Some sites with older versions of OpenSSL installed were unable to communicate with other services provided through some plugins.</li>\n<li>If a post URL was ever re-used, the site could redirect to the wrong post.</li>\n</ul>\n<p>WordPress 4.4.1 fixes 52 bugs from 4.4. For more information, see the <a href="https://codex.wordpress.org/Version_4.4.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/query?milestone=4.4.1">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.4.1</a> or venture over to Dashboard → Updates and simply click “Update Now.” Sites that support automatic background updates are already beginning to update to WordPress 4.4.1.</p>\n<p>Thanks to everyone who contributed to 4.4.1:</p>\n<p><a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/Compute">Compute</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/DvanKooten">Danny van Kooten</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling (ocean90)</a>, <a href="https://profiles.wordpress.org/dossy">Dossy Shiobara</a>, <a href="https://profiles.wordpress.org/eherman24">Evan Herman</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/gblsm">gblsm</a>, <a href="https://profiles.wordpress.org/hnle">Hinaloe</a>, <a href="https://profiles.wordpress.org/igmoweb">Ignacio Cruz Moreno</a>, <a href="https://profiles.wordpress.org/jadpm">jadpm</a>, <a href="https://profiles.wordpress.org/jeffpyebrookcom/">Jeff Pye Brook</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/JPr">jpr</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/KrissieV">KrissieV</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/wp-architect">Matthew Ell</a>, <a href="https://profiles.wordpress.org/meitar">Meitar</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/rogerhub">Roger Chen</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/salcode">Sal Ferrarello</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/scottbrownconsulting">scottbrownconsulting</a>, <a href="https://profiles.wordpress.org/SergeyBiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/ShinichiN">Shinichi Nishikawa</a>, <a href="https://profiles.wordpress.org/smerriman">smerriman</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="https://profiles.wordpress.org/tharsheblows">tharsheblows</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, and <a href="https://profiles.wordpress.org/webaware">webaware</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:36:"\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"WordPress 4.4 “Clifford”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"https://wordpress.org/news/2015/12/clifford/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 08 Dec 2015 03:25:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3990";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:379:"Version 4.4 of WordPress, named “Clifford” in honor of jazz trumpeter Clifford Brown, is available for download or update in your WordPress dashboard. New features in 4.4 make your site more connected and responsive. Clifford also introduces a new default theme, Twenty Sixteen. Introducing Twenty Sixteen Our newest default theme, Twenty Sixteen, is a modern take [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:40793:"<p>Version 4.4 of WordPress, named “Clifford” in honor of jazz trumpeter Clifford Brown, is available for download or update in your WordPress dashboard. New features in 4.4 make your site more connected and responsive. Clifford also introduces a new default theme, Twenty Sixteen.</p>\n<p><iframe width=''692'' height=''388'' src=''https://videopress.com/embed/J44FHXvg?hd=0'' frameborder=''0'' allowfullscreen></iframe><script src=''https://v0.wordpress.com/js/next/videopress-iframe.js?m=1435166243''></script></p>\n<hr />\n<h2 style="text-align: center">Introducing Twenty Sixteen</h2>\n<p><img class="aligncenter size-full wp-image-3994" src="https://wordpress.org/news/files/2015/12/ipad-white-desktop-2x.png" alt="A screenshot of Twenty Sixteen set in an iPad frame" width="1680" height="1139" srcset="https://wordpress.org/news/files/2015/12/ipad-white-desktop-2x-300x203.png 300w, https://wordpress.org/news/files/2015/12/ipad-white-desktop-2x-768x521.png 768w, https://wordpress.org/news/files/2015/12/ipad-white-desktop-2x-1024x694.png 1024w, https://wordpress.org/news/files/2015/12/ipad-white-desktop-2x.png 1680w" sizes="(max-width: 1680px) 100vw, 1680px" /></p>\n<p>Our newest default theme, Twenty Sixteen, is a modern take on a classic blog design.</p>\n<p>Twenty Sixteen was built to look great on any device. A fluid grid design, flexible header, fun color schemes, and more, will all make your content shine.</p>\n<hr />\n<h2 style="text-align: center">Responsive Images</h2>\n<p><img class="aligncenter wp-image-3995 size-full" src="https://wordpress.org/news/files/2015/12/responsive-devices-ipad-2x.png" alt="An image of a laptop, iPad, Android phone, and iPhone containing the same image displayed at multiple sizes to demonstrate responsive image features." width="1396" height="640" srcset="https://wordpress.org/news/files/2015/12/responsive-devices-ipad-2x-300x138.png 300w, https://wordpress.org/news/files/2015/12/responsive-devices-ipad-2x-768x352.png 768w, https://wordpress.org/news/files/2015/12/responsive-devices-ipad-2x-1024x469.png 1024w, https://wordpress.org/news/files/2015/12/responsive-devices-ipad-2x.png 1396w" sizes="(max-width: 1396px) 100vw, 1396px" /></p>\n<p>WordPress now takes a smarter approach to displaying appropriate image sizes on any device, ensuring a perfect fit every time. You don’t need to do anything to your theme, it just works.</p>\n<hr />\n<h2 style="text-align: center">Embed Everything</h2>\n<div class="embed-container">\n<blockquote data-secret="wv4RlzOPNS" class="wp-embedded-content"><p><a href="https://make.wordpress.org/core/2015/10/28/new-embeds-feature-in-wordpress-4-4/">New Embeds Feature in WordPress 4.4</a></p></blockquote>\n<p><iframe class="wp-embedded-content" sandbox="allow-scripts" security="restricted" style="display:none;" src="https://make.wordpress.org/core/2015/10/28/new-embeds-feature-in-wordpress-4-4/embed/#?secret=wv4RlzOPNS" data-secret="wv4RlzOPNS" width="600" height="338" title="Embedded WordPress Post" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>\n</div>\n<p>Now you can embed your posts on other WordPress sites. Simply drop a post URL into the editor and see an instant embed preview, complete with the title, excerpt, and featured image if you’ve set one. We’ll even include your site icon and links for comments and sharing.</p>\n<p>In addition to post embeds, WordPress 4.4 also adds support for five new oEmbed providers: Cloudup, Reddit Comments, ReverbNation, Speaker Deck, and VideoPress.</p>\n<hr />\n<h2 style="text-align: center">Under the Hood</h2>\n<p><img class="aligncenter size-full wp-image-4003" src="https://wordpress.org/news/files/2015/12/banner-1544x500.jpg" alt="The WordPress REST API logo" width="1544" height="500" srcset="https://wordpress.org/news/files/2015/12/banner-1544x500-300x97.jpg 300w, https://wordpress.org/news/files/2015/12/banner-1544x500-768x249.jpg 768w, https://wordpress.org/news/files/2015/12/banner-1544x500-1024x332.jpg 1024w, https://wordpress.org/news/files/2015/12/banner-1544x500.jpg 1544w" sizes="(max-width: 1544px) 100vw, 1544px" /></p>\n<h3>REST API infrastructure</h3>\n<p>Infrastructure for the REST API has been integrated into core, marking a new era in developing with WordPress. The REST API gives developers an easy way to build and extend RESTful APIs on top of WordPress.</p>\n<p>Infrastructure is the first part of a multi-stage rollout for the REST API. Inclusion of core endpoints is targeted for an upcoming release. To get a sneak peek of the core endpoints, and for more information on extending the REST API, check out the official <a href="https://wordpress.org/plugins/rest-api/">WordPress REST API</a> plugin.</p>\n<h3>Term meta</h3>\n<p>Terms now support metadata, just like posts. See <a href="https://developer.wordpress.org/reference/functions/add_term_meta"><code>add_term_meta()</code></a>, <a href="https://developer.wordpress.org/reference/functions/get_term_meta"><code>get_term_meta()</code></a>, and <a href="https://developer.wordpress.org/reference/functions/update_term_meta"><code>update_term_meta()</code></a> for more information.</p>\n<h3>Comment query improvements</h3>\n<p>Comment queries now have cache handling to improve performance. New arguments in <code>WP_Comment_Query</code> make crafting robust comment queries simpler.</p>\n<div class="feature-section under-the-hood three-col">\n<div class="col">\n<h3>Term, comment, and network objects</h3>\n<p>New <code>WP_Term</code>, <code>WP_Comment</code>, and <code>WP_Network</code> objects make interacting with terms, comments, and networks more predictable and intuitive in code.</p>\n</div>\n</div>\n<hr />\n<h2>The Team</h2>\n<p><a class="alignleft" href="https://profiles.wordpress.org/wonderboymusic"><img src="https://www.gravatar.com/avatar/ed0f881acb9dc96bee53e4dc61b5558f?d=mm&amp;s=180&amp;r=G" alt="Scott Taylor" width="80" height="80" /></a>This release was led by <a href="http://scotty-t.com/">Scott Taylor</a>, with the help of these fine individuals. There are 471 contributors with props in this release (by far the most ever!). Pull up some Clifford Brown on your music service of choice, and check out some of their profiles:</p>\n<a href="https://profiles.wordpress.org/mercime">@mercime</a>, <a href="https://profiles.wordpress.org/_smartik_">_smartik_</a>, <a href="https://profiles.wordpress.org/a5hleyrich">A5hleyRich</a>, <a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/aaronrutley">Aaron Rutley</a>, <a href="https://profiles.wordpress.org/kawauso">Adam Harley (Kawauso)</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/adamholisky">adamholisky</a>, <a href="https://profiles.wordpress.org/mrahmadawais">Ahmad Awais</a>, <a href="https://profiles.wordpress.org/akibjorklund">Aki Bj&#246;rklund</a>, <a href="https://profiles.wordpress.org/albertoct">AlbertoCT</a>, <a href="https://profiles.wordpress.org/akirk">Alex Kirk</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/gounder">Alexander Gounder</a>, <a href="https://profiles.wordpress.org/alireza1375">alireza1375</a>, <a href="https://profiles.wordpress.org/shedonist">Amanda Giles</a>, <a href="https://profiles.wordpress.org/amereservant">amereservant</a>, <a href="https://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/aduth">Andrew Duthie</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/norcross">Andrew Norcross</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/afragen">Andy Fragen</a>, <a href="https://profiles.wordpress.org/amandato">Angelo Mandato</a>, <a href="https://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/apkoponen">ap.koponen</a>, <a href="https://profiles.wordpress.org/apokalyptik">apokalyptik</a>, <a href="https://profiles.wordpress.org/atomicjack">atomicjack</a>, <a href="https://profiles.wordpress.org/austinginder">Austin Ginder</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/barryceelen">Barry Ceelen</a>, <a href="https://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="https://profiles.wordpress.org/bcworkz">bcworkz</a>, <a href="https://profiles.wordpress.org/bdn3504">BdN3504</a>, <a href="https://profiles.wordpress.org/pixolin">Bego Mario Garde</a>, <a href="https://profiles.wordpress.org/benjmay">Ben May</a>, <a href="https://profiles.wordpress.org/benjaminpick">Benjamin Pick</a>, <a href="https://profiles.wordpress.org/berengerzyla">berengerzyla</a>, <a href="https://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="https://profiles.wordpress.org/bigdawggi">bigdawggi</a>, <a href="https://profiles.wordpress.org/bilalcoder">bilalcoder</a>, <a href="https://profiles.wordpress.org/binarykitten">BinaryKitten</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bjornjohansen">Bj&#248;rn Johansen</a>, <a href="https://profiles.wordpress.org/bobbingwide">bobbingwide</a>, <a href="https://profiles.wordpress.org/gitlost">bonger</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradt">Brad Touesnard</a>, <a href="https://profiles.wordpress.org/bradparbs">bradparbs</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/bravokeyl">bravokeyl</a>, <a href="https://profiles.wordpress.org/brentvr">brentvr</a>, <a href="https://profiles.wordpress.org/brettz95">brettz95</a>, <a href="https://profiles.wordpress.org/mckilem">Bruno Kos</a>, <a href="https://profiles.wordpress.org/crazycoolcam">Cam</a>, <a href="https://profiles.wordpress.org/camikaos">Cami Kaos</a>, <a href="https://profiles.wordpress.org/carolinegeven">carolinegeven</a>, <a href="https://profiles.wordpress.org/misterbisson">Casey Bisson</a>, <a href="https://profiles.wordpress.org/ch1902">ch1902</a>, <a href="https://profiles.wordpress.org/nhuja">Chandra M</a>, <a href="https://profiles.wordpress.org/chandrapatel">Chandra Patel</a>, <a href="https://profiles.wordpress.org/chasewiseman">Chase Wiseman</a>, <a href="https://profiles.wordpress.org/chiara_09">Chiara Dossena</a>, <a href="https://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="https://profiles.wordpress.org/chiragswadia">Chirag Swadia</a>, <a href="https://profiles.wordpress.org/chriscct7">Chris Christoff</a>, <a href="https://profiles.wordpress.org/chrismkindred">Chris Kindred</a>, <a href="https://profiles.wordpress.org/cklosows">Chris Klosowski</a>, <a href="https://profiles.wordpress.org/chriscoyier">chriscoyier</a>, <a href="https://profiles.wordpress.org/chrisdc1">Chrisdc1</a>, <a href="https://profiles.wordpress.org/lovememore">christianoliff</a>, <a href="https://profiles.wordpress.org/christophherr">Christoph Herr</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/chrisvendiadvertisingcom">cjhaas</a>, <a href="https://profiles.wordpress.org/codeelite">codeelite</a>, <a href="https://profiles.wordpress.org/coenjacobs">Coen Jacobs</a>, <a href="https://profiles.wordpress.org/compute">Compute</a>, <a href="https://profiles.wordpress.org/couturefreak">Courtney Ivey</a>, <a href="https://profiles.wordpress.org/craig-ralston">Craig Ralston</a>, <a href="https://profiles.wordpress.org/cgrymala">Curtiss Grymala</a>, <a href="https://profiles.wordpress.org/cdog">Cătălin Dogaru</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/dboulet">Dan Boulet</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/daniel-koskinen">Daniel Koskinen</a>, <a href="https://profiles.wordpress.org/dmenard">Daniel M&#233;nard</a>, <a href="https://profiles.wordpress.org/mte90">Daniele Scasciafratte</a>, <a href="https://profiles.wordpress.org/daniellandau">daniellandau</a>, <a href="https://profiles.wordpress.org/daniloercoli">daniloercoli</a>, <a href="https://profiles.wordpress.org/dannydehaan">Danny de Haan</a>, <a href="https://profiles.wordpress.org/dvankooten">Danny van Kooten</a>, <a href="https://profiles.wordpress.org/nerrad">Darren Ethier (nerrad)</a>, <a href="https://profiles.wordpress.org/dllh">Daryl L. L. Houston (dllh)</a>, <a href="https://profiles.wordpress.org/dattaparad">Datta Parad</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/davidanderson">David Anderson</a>, <a href="https://profiles.wordpress.org/davidbinda">David Binovec</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/dshanske">David Shanske</a>, <a href="https://profiles.wordpress.org/debaat">DeBAAT</a>, <a href="https://profiles.wordpress.org/denis-de-bernardy">Denis de Bernardy</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, <a href="https://profiles.wordpress.org/downstairsdev">Devin Price</a>, <a href="https://profiles.wordpress.org/dezzy">Dezzy</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dipalidhole27gmailcom">Dipali Dhole</a>, <a href="https://profiles.wordpress.org/dipeshkakadiya">dipesh.kakadiya</a>, <a href="https://profiles.wordpress.org/dbru">Dominik Bruderer</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/dossy">Dossy Shiobara</a>, <a href="https://profiles.wordpress.org/drebbitsweb">Dreb Bits</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustinbolton">dustinbolton</a>, <a href="https://profiles.wordpress.org/kucrut">Dzikri Aziz</a>, <a href="https://profiles.wordpress.org/edirect24">edirect24</a>, <a href="https://profiles.wordpress.org/oso96_2000">Eduardo Reveles</a>, <a href="https://profiles.wordpress.org/eduardozulian">Eduardo Zulian</a>, <a href="https://profiles.wordpress.org/cais">Edward Caissie</a>, <a href="https://profiles.wordpress.org/egill">Egill R. Erlendsson</a>, <a href="https://profiles.wordpress.org/egower">egower</a>, <a href="https://profiles.wordpress.org/iehsanir">Ehsaan</a>, <a href="https://profiles.wordpress.org/ehtis">ehtis</a>, <a href="https://profiles.wordpress.org/iseulde">Ella Iseulde Van Dorpe</a>, <a href="https://profiles.wordpress.org/ellieroepken">Ellie Strejlau</a>, <a href="https://profiles.wordpress.org/elliott-stocks">Elliott Stocks</a>, <a href="https://profiles.wordpress.org/elusiveunit">elusiveunit</a>, <a href="https://profiles.wordpress.org/enshrined">enshrined</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericdaams">Eric Daams</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/ericjuden">ericjuden</a>, <a href="https://profiles.wordpress.org/eherman24">Evan Herman</a>, <a href="https://profiles.wordpress.org/f4rkie">F4rkie</a>, <a href="https://profiles.wordpress.org/flixos90">Felix Arntz</a>, <a href="https://profiles.wordpress.org/fsylum">Firdaus Zahari</a>, <a href="https://profiles.wordpress.org/firebird75">firebird75</a>, <a href="https://profiles.wordpress.org/fonglh">fonglh</a>, <a href="https://profiles.wordpress.org/francoisb">francoisb</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/fjarrett">Frankie Jarrett</a>, <a href="https://profiles.wordpress.org/frozzare">Fredrik Forsmo</a>, <a href="https://profiles.wordpress.org/gaelan">Gaelan Lloyd</a>, <a href="https://profiles.wordpress.org/gagan0123">Gagan Deep Singh</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/garza">garza</a>, <a href="https://profiles.wordpress.org/grvrulz">Gaurav Pareek</a>, <a href="https://profiles.wordpress.org/gautamgupta">Gautam Gupta</a>, <a href="https://profiles.wordpress.org/gblsm">gblsm</a>, <a href="https://profiles.wordpress.org/geminorum">geminorum</a>, <a href="https://profiles.wordpress.org/kloon">Gerhard Potgieter</a>, <a href="https://profiles.wordpress.org/gezamiklo">geza.miklo</a>, <a href="https://profiles.wordpress.org/gizburdt">Gijs Jorissen</a>, <a href="https://profiles.wordpress.org/garusky">Giuseppe Mamone</a>, <a href="https://profiles.wordpress.org/jubstuff">Giustino Borzacchiello</a>, <a href="https://profiles.wordpress.org/gnaka08">gnaka08</a>, <a href="https://profiles.wordpress.org/gradyetc">gradyetc</a>, <a href="https://profiles.wordpress.org/gregrickaby">Greg Rickaby</a>, <a href="https://profiles.wordpress.org/tivnet">Gregory Karpinsky (@tivnet)</a>, <a href="https://profiles.wordpress.org/webord">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/gwinhlopez">gwinh.lopez</a>, <a href="https://profiles.wordpress.org/hakre">hakre</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/hnle">Hinaloe</a>, <a href="https://profiles.wordpress.org/hrishiv90">Hrishikesh Vaipurkar</a>, <a href="https://profiles.wordpress.org/hlashbrooke">Hugh Lashbrooke</a>, <a href="https://profiles.wordpress.org/hugobaeta">Hugo Baeta</a>, <a href="https://profiles.wordpress.org/polevaultweb">Iain Poulson</a>, <a href="https://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="https://profiles.wordpress.org/iandstewart">Ian Stewart</a>, <a href="https://profiles.wordpress.org/icetee">icetee</a>, <a href="https://profiles.wordpress.org/igmoweb">Ignacio Cruz Moreno</a>, <a href="https://profiles.wordpress.org/headonfire">Ihor Vorotnov</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ippetkov">ippetkov</a>, <a href="https://profiles.wordpress.org/ivankristianto">Ivan Kristianto</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/athsear">J.Sugiyama</a>, <a href="https://profiles.wordpress.org/jadpm">jadpm</a>, <a href="https://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="https://profiles.wordpress.org/macmanx">James Huff</a>, <a href="https://profiles.wordpress.org/janhenckens">Jan Henckens</a>, <a href="https://profiles.wordpress.org/japh">Japh</a>, <a href="https://profiles.wordpress.org/jaspermdegroot">Jasper de Groot</a>, <a href="https://profiles.wordpress.org/jazbek">jazbek</a>, <a href="https://profiles.wordpress.org/jcroucher">jcroucher</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeffmatson">JeffMatson</a>, <a href="https://profiles.wordpress.org/cheffheid">Jeffrey de Wit</a>, <a href="https://profiles.wordpress.org/jeffpyebrookcom">Jeffrey Schutzman</a>, <a href="https://profiles.wordpress.org/jeichorn">jeichorn</a>, <a href="https://profiles.wordpress.org/jmdodd">Jennifer M. Dodd</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/slimndap">Jeroen Schmit</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jim912">jim912</a>, <a href="https://profiles.wordpress.org/jliman">jliman</a>, <a href="https://profiles.wordpress.org/jmayhak">jmayhak</a>, <a href="https://profiles.wordpress.org/jnylen0">jnylen0</a>, <a href="https://profiles.wordpress.org/jobst">Jobst Schmalenbach</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/joehills">joehills</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/johnpbloch">John P. Bloch</a>, <a href="https://profiles.wordpress.org/mindctrl">John Parris</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jonathanbardo">Jonathan Bardo</a>, <a href="https://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/koke">Jorge Bernal</a>, <a href="https://profiles.wordpress.org/betzster">Josh Betz</a>, <a href="https://profiles.wordpress.org/jjeaton">Josh Eaton</a>, <a href="https://profiles.wordpress.org/shelob9">Josh Pollock</a>, <a href="https://profiles.wordpress.org/jpr">jpr</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/juhise">Juhi Saxena</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/justdaiv">justdaiv</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jshreve">Justin Shreve</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/greenshady">Justin Tadlock</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kalenjohnson">KalenJohnson</a>, <a href="https://profiles.wordpress.org/karinedo">karinedo</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinb">Kevin Behrens</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kevinatelement">kevinatelement</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/krissiev">KrissieV</a>, <a href="https://profiles.wordpress.org/drozdz">Krzysiek Dr&#243;żdż</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/laceous">laceous</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/offereins">Laurens Offereins</a>, <a href="https://profiles.wordpress.org/lcherpit">lcherpit</a>, <a href="https://profiles.wordpress.org/ldinclaux">ldinclaux</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/leemon">leemon</a>, <a href="https://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="https://profiles.wordpress.org/linuxologos">linuxologos</a>, <a href="https://profiles.wordpress.org/spmlucas">Lucas Karpiuk</a>, <a href="https://profiles.wordpress.org/lucatume">lucatume</a>, <a href="https://profiles.wordpress.org/luciole135">luciole135</a>, <a href="https://profiles.wordpress.org/lucymtc">Lucy Tomas</a>, <a href="https://profiles.wordpress.org/lukecarbis">Luke Carbis</a>, <a href="https://profiles.wordpress.org/madalinungureanu">madalin.ungureanu</a>, <a href="https://profiles.wordpress.org/mako09">Mako</a>, <a href="https://profiles.wordpress.org/manolis09">manolis09</a>, <a href="https://profiles.wordpress.org/iworks">Marcin Pietrzak</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/mechter">Markus</a>, <a href="https://profiles.wordpress.org/wilto">Mat Marquis</a>, <a href="https://profiles.wordpress.org/matheusfd">Matheus Martins</a>, <a href="https://profiles.wordpress.org/mattbagwell">Matt Bagwell</a>, <a href="https://profiles.wordpress.org/mgibbs189">Matt Gibbs</a>, <a href="https://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/veraxus">Matt van Andel</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/wp-architect">Matthew Ell</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mazurstas">mazurstas</a>, <a href="https://profiles.wordpress.org/mbrandys">mbrandys</a>, <a href="https://profiles.wordpress.org/mdmcginn">mdmcginn</a>, <a href="https://profiles.wordpress.org/mehulkaklotar">Mehul Kaklotar</a>, <a href="https://profiles.wordpress.org/meitar">Meitar</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/meloniq">meloniq</a>, <a href="https://profiles.wordpress.org/micahmills">micahmills</a>, <a href="https://profiles.wordpress.org/micahwave">micahwave</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="https://profiles.wordpress.org/michielhab">Michiel Habraken</a>, <a href="https://profiles.wordpress.org/mcguive7">Mickey Kay</a>, <a href="https://profiles.wordpress.org/mdgl">Mike Glendinning</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/thaicloud">Mike Jordan</a>, <a href="https://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="https://profiles.wordpress.org/mikeschroder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinić</a>, <a href="https://profiles.wordpress.org/mismith227">mismith227</a>, <a href="https://profiles.wordpress.org/misterunknown">misterunknown</a>, <a href="https://profiles.wordpress.org/mitchoyoshitaka">mitcho (Michael Yoshitaka Erlewine)</a>, <a href="https://profiles.wordpress.org/monika">Monika</a>, <a href="https://profiles.wordpress.org/morganestes">morganestes</a>, <a href="https://profiles.wordpress.org/mor10">Morten Rand-Hendriksen</a>, <a href="https://profiles.wordpress.org/mt8biz">moto hachi ( mt8.biz )</a>, <a href="https://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="https://profiles.wordpress.org/mrmist">mrmist</a>, <a href="https://profiles.wordpress.org/mulvane">mulvane</a>, <a href="https://profiles.wordpress.org/neoscrib">neoscrib</a>, <a href="https://profiles.wordpress.org/next-season">NExT-Season</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/nicholas_io">nicholas_io</a>, <a href="https://profiles.wordpress.org/nickciske">Nick Ciske</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nickduncan">NickDuncan</a>, <a href="https://profiles.wordpress.org/rahe">Nicolas Juen</a>, <a href="https://profiles.wordpress.org/nikeo">nikeo</a>, <a href="https://profiles.wordpress.org/nikschavan">Nikhil Chavan</a>, <a href="https://profiles.wordpress.org/niklasbr">Niklas</a>, <a href="https://profiles.wordpress.org/nikolovtmw">Nikola Nikolov</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/rabmalin">Nilambar Sharma</a>, <a href="https://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="https://profiles.wordpress.org/pareshradadiya-1">Paresh Radadiya</a>, <a href="https://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="https://profiles.wordpress.org/obrienlabs">Pat O''Brien</a>, <a href="https://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="https://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="https://profiles.wordpress.org/figureone">Paul Ryan</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/sirbrillig">Payton Swick</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/walbo">Petter Walb&#248; Johnsg&#229;rd</a>, <a href="https://profiles.wordpress.org/petya">Petya Raykovska</a>, <a href="https://profiles.wordpress.org/pfefferle">pfefferle</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/philiplakin">PhilipLakin</a>, <a href="https://profiles.wordpress.org/corphi">Philipp Cordes</a>, <a href="https://profiles.wordpress.org/delawski">Piotr Delawski</a>, <a href="https://profiles.wordpress.org/psoluch">Piotr Soluch</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/prasad-nevase">Prasad Nevase</a>, <a href="https://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="https://profiles.wordpress.org/pratikchaskar">Pratik</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rajnikmit">rajnikmit</a>, <a href="https://profiles.wordpress.org/racase">Rakesh Lawaju (Racase Lawaju)</a>, <a href="https://profiles.wordpress.org/ramay">ramay</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/raulillana">Raul Illana</a>, <a href="https://profiles.wordpress.org/renoirb">renoirb</a>, <a href="https://profiles.wordpress.org/rhubbardreverb">rhubbardreverb</a>, <a href="https://profiles.wordpress.org/rhyswynne">Rhys Wynne</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/rogerhub">Roger Chen</a>, <a href="https://profiles.wordpress.org/rommelxcastro">Rommel Castro</a>, <a href="https://profiles.wordpress.org/wpmuguru">Ron Rennick</a>, <a href="https://profiles.wordpress.org/ronalfy">Ronald Huereca</a>, <a href="https://profiles.wordpress.org/kingkool68">Russell Heimlich</a>, <a href="https://profiles.wordpress.org/ruudjoyo">Ruud Laan</a>, <a href="https://profiles.wordpress.org/ryankienstra">Ryan Kienstra</a>, <a href="https://profiles.wordpress.org/markel">Ryan Markel</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/welcher">Ryan Welcher</a>, <a href="https://profiles.wordpress.org/zeo">Safirul Alredha</a>, <a href="https://profiles.wordpress.org/salcode">Sal Ferrarello</a>, <a href="https://profiles.wordpress.org/salvoaranzulla">salvoaranzulla</a>, <a href="https://profiles.wordpress.org/sammybeats">Sam Brodie</a>, <a href="https://profiles.wordpress.org/sam2kb">sam2kb</a>, <a href="https://profiles.wordpress.org/solarissmoke">Samir Shah</a>, <a href="https://profiles.wordpress.org/samuelsidler">Samuel Sidler</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sanketparmar">Sanket Parmar</a>, <a href="https://profiles.wordpress.org/rosso99">Sara Rosso</a>, <a href="https://profiles.wordpress.org/sarciszewski">sarciszewski</a>, <a href="https://profiles.wordpress.org/sgrant">Scott Grant</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/scottbrownconsulting">scottbrownconsulting</a>, <a href="https://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/sdavis2702">sdavis2702</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/sebastianpisula">Sebastian Pisula</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/serpent7776">serpent7776</a>, <a href="https://profiles.wordpress.org/several27">several27</a>, <a href="https://profiles.wordpress.org/shimakyohsuke">shimakyohsuke</a>, <a href="https://profiles.wordpress.org/shinichin">Shinichi Nishikawa</a>, <a href="https://profiles.wordpress.org/side777">side777</a>, <a href="https://profiles.wordpress.org/pross">Simon Prosser</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="https://profiles.wordpress.org/sirzooro">sirzooro</a>, <a href="https://profiles.wordpress.org/sjmur">sjmur</a>, <a href="https://profiles.wordpress.org/smerriman">smerriman</a>, <a href="https://profiles.wordpress.org/spacedmonkey">Spacedmonkey</a>, <a href="https://profiles.wordpress.org/sboisvert">St&#233;phane Boisvert</a>, <a href="https://profiles.wordpress.org/khromov">Stanislav Khromov</a>, <a href="https://profiles.wordpress.org/metodiew">Stanko Metodiev</a>, <a href="https://profiles.wordpress.org/stebbiv">stebbiv</a>, <a href="https://profiles.wordpress.org/miglosh">Stefan Froehlich</a>, <a href="https://profiles.wordpress.org/sillybean">Stephanie Leary</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/stevehenty">stevehenty</a>, <a href="https://profiles.wordpress.org/stevehoneynz">SteveHoneyNZ</a>, <a href="https://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="https://profiles.wordpress.org/charlestonsw">Store Locator Plus</a>, <a href="https://profiles.wordpress.org/sudar">Sudar Muthu</a>, <a href="https://profiles.wordpress.org/brainstormforce">Sujay</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/summerblue">summerblue</a>, <a href="https://profiles.wordpress.org/sunnyratilal">Sunny Ratilal</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="https://profiles.wordpress.org/karmatosed">Tammie Lister</a>, <a href="https://profiles.wordpress.org/tanner-m">Tanner Moushey</a>, <a href="https://profiles.wordpress.org/tbcorr">tbcorr</a>, <a href="https://profiles.wordpress.org/tychay">Terry Chay</a>, <a href="https://profiles.wordpress.org/tharsheblows">tharsheblows</a>, <a href="https://profiles.wordpress.org/themiked">theMikeD</a>, <a href="https://profiles.wordpress.org/kraftner">Thomas Kr&#228;ftner</a>, <a href="https://profiles.wordpress.org/thomaswm">thomaswm</a>, <a href="https://profiles.wordpress.org/tfrommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/tott">Thorsten Ott</a>, <a href="https://profiles.wordpress.org/tigertech">tigertech</a>, <a href="https://profiles.wordpress.org/tillkruess">Till</a>, <a href="https://profiles.wordpress.org/tevko">Tim Evko</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tmeister">tmeister</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/tommarshall">tommarshall</a>, <a href="https://profiles.wordpress.org/tomsommer">tomsommer</a>, <a href="https://profiles.wordpress.org/skithund">Toni Viemer&#246;</a>, <a href="https://profiles.wordpress.org/toro_unit">Toro_Unit (Hiroshi Urabe)</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/rilwis">Tran Ngoc Tuan Anh</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/trenzterra">trenzterra</a>, <a href="https://profiles.wordpress.org/tryon">Tryon Eggleston</a>, <a href="https://profiles.wordpress.org/tszming">tszming</a>, <a href="https://profiles.wordpress.org/junsuijin">ty</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/chacha102">Tyler Carter</a>, <a href="https://profiles.wordpress.org/grapplerulrich">Ulrich</a>, <a href="https://profiles.wordpress.org/sorich87">Ulrich Sossou</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/umeshnevase">Umesh Nevase</a>, <a href="https://profiles.wordpress.org/utkarshpatel">Utkarsh</a>, <a href="https://profiles.wordpress.org/vilkatis">vilkatis</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/walterebert">Walter Ebert</a>, <a href="https://profiles.wordpress.org/walterbarcelos">walterbarcelos</a>, <a href="https://profiles.wordpress.org/webaware">webaware</a>, <a href="https://profiles.wordpress.org/webdevmattcrom">webdevmattcrom</a>, <a href="https://profiles.wordpress.org/wen-solutions">WEN Solutions</a>, <a href="https://profiles.wordpress.org/wenthemes">WEN Themes</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/wmertens">wmertens</a>, <a href="https://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="https://profiles.wordpress.org/theode">WP Plugin Dev dot com</a>, <a href="https://profiles.wordpress.org/wpdev101">wpdev101</a>, <a href="https://profiles.wordpress.org/alphawolf">wpseek</a>, <a href="https://profiles.wordpress.org/wturrell">wturrell</a>, <a href="https://profiles.wordpress.org/yamchhetri">Yam Chhetri</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/oxymoron">Zach Wills</a>, <a href="https://profiles.wordpress.org/zrothauser">Zack Rothauser</a>, and <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.\n<p>&nbsp;</p>\n<p>Special thanks go to <a href="http://siobhanmckeown.com/">Siobhan McKeown</a> for producing the release video with <a href="http://www.sararosso.com/newsletter/">Sara Rosso</a>, and <a href="http://camikaos.com">Cami Kaos</a> for the voice-over.</p>\n<p>Finally, thanks to all of the contributors who provided subtitles for the release video, which at last count had been translated into 23 languages!</p>\n<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.5!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.4 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2015/11/wordpress-4-4-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Nov 2015 23:04:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3982";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:328:"The release candidate for WordPress 4.4 is now available. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.4 on Tuesday, December 8, but we need your help to get there. If you haven’t tested 4.4 yet, [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1801:"<p>The release candidate for WordPress 4.4 is now available.</p>\n<p>RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.4 on <strong>Tuesday, December 8</strong>, but we need your help to get there.</p>\n<p>If you haven’t tested 4.4 yet, now is the time!</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.4 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.4-RC1.zip">download the release candidate here</a> (zip).</p>\n<p>For more information about what’s new in version 4.4, check out the <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/">Beta</a> blog post.</p>\n<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.4 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.4 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>\n<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/dev-notes+4-4/">notes for developers</a> for 4.4.</p>\n<p><em>Tickets are all closed</em><br />\n<em>Help test the latest changes</em><br />\n<em>New WordPress for All</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.4 Beta 4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/11/wordpress-4-4-beta-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Nov 2015 00:04:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=3977";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"WordPress 4.4 Beta 4 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the WordPress Beta Tester plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Scott Taylor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1407:"<p>WordPress 4.4 Beta 4 is now available!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.4, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.4-beta4.zip">download the beta here</a> (zip).</p>\n<p>For more information about what’s new in version 4.4, check out the <a href="https://wordpress.org/news/2015/10/wordpress-4-4-beta-1/" target="_blank">Beta 1</a> blog post. This our final planned beta. Next week will be our first Release Candidate.</p>\n<p>If you think you’ve found a bug, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="https://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.4">everything we’ve fixed</a>.</p>\n<p><em>Closer To The End</em><br />\n<em>Tickets Are Being Shuffled</em><br />\n<i>Onward to RC</i></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sat, 05 Mar 2016 19:25:02 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:10:"connection";s:5:"close";s:25:"strict-transport-security";s:11:"max-age=360";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Thu, 03 Mar 2016 04:55:35 GMT";s:4:"link";s:63:"<https://wordpress.org/news/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20160126233718";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(143, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1457249099', 'no'),
(144, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1457205899', 'no'),
(145, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1457249105', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(146, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: WPWeekly Episode 224 – Preview of WordPress 4.5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=52049&preview_id=52049";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wptavern.com/wpweekly-episode-224-preview-of-wordpress-4-5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2586:"<p>In our first episode in more than a month, <a href="http://marcuscouch.com/">Marcus Couch</a> and I discuss the latest WordPress news, including a preview of WordPress 4.5. I share my experience taking a month off away from WordPress and the lessons learned in doing so. This show is a little rough around the edges but we&#8217;ll be back to our normal selves starting next week.</p>\n<h2>Stories Discussed:</h2>\n<p><a href="https://wordpress.org/news/2016/02/wordpress-4-5-beta-1/">WordPress 4.5 Beta 1 Released</a><br />\n<a href="http://wptavern.com/wordpress-4-5-to-introduce-native-support-for-a-theme-logo">WordPress 4.5 to Introduce Native Support for a Theme Logo</a><br />\n<a href="http://wptavern.com/poetica-acquired-by-conde-nast-open-source-wordpress-plugin-will-be-discontinued">Poetica Acquired by Condé Nast, Open Source WordPress Plugin Will Be Discontinued</a><br />\n<a href="http://wptavern.com/stripe-payment-gateway-for-woocommerce-is-now-available-for-free">Stripe Payment Gateway for WooCommerce Is Now Available for Free</a><br />\n<a href="http://wptavern.com/automattic-adds-amp-support-to-wordpress-com-releases-plugin-for-self-hosted-sites">Automattic Adds AMP Support to WordPress.com, Releases Plugin for Self-Hosted Sites</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a href="https://wordpress.org/plugins/migrate-ninja-forms-to-gravity-forms/">Migrate Ninja Forms to Gravity Forms</a> is a plugin that does exactly what it&#8217;s name implies. It migrates content from Ninja Forms to Gravity Forms.</p>\n<p><a href="https://wordpress.org/plugins/amp-analytics/">AMP Analytics</a> extends Google&#8217;s AMP to allow you to add analytics to your Accelerated Mobile Pages.</p>\n<p><a href="https://wordpress.org/plugins/pl-platform/">PageLines Platform 5</a> is a complete drag-and-drop editing system. It works with any standard WordPress theme.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 9th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #224:</strong><br />\n</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Mar 2016 20:29:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:43:"WPTavern: In Case You Missed It – Issue 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51929";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wptavern.com/in-case-you-missed-it-issue-3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7794:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/01/ICYMIFeaturedImage.png" rel="attachment wp-att-50955"><img class="size-full wp-image-50955" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/01/ICYMIFeaturedImage.png?resize=676%2C292" alt="In Case You Missed It Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/112901923@N07/16153818039">Night Moves</a> &#8211; <a href="https://creativecommons.org/licenses/by-nc/2.0/">(license)</a>\n<p>There&#8217;s a lot of great WordPress content published in the community but not all of it is featured on the Tavern. This post is part of a new series where I share an assortment of items related to WordPress that caught my eye but didn&#8217;t make it into a full post.</p>\n<h2>Automattic Stands with Apple</h2>\n<p>In light of the recent court order issued against Apple in the <a href="http://www.nytimes.com/2016/02/18/technology/apple-timothy-cook-fbi-san-bernardino.html?_r=0">San Bernardino case</a>, Automattic has <a href="https://transparency.automattic.com/2016/03/03/automattic-and-wordpress-com-stand-with-apple-to-support-digital-security/">taken a stand</a> with Apple by joining other influential technology companies in filing an amicus brief in support of Apple’s legal challenge.</p>\n<p>The court order requires Apple to write code that acts as a backdoor and weakens security on iPhones. Automattic&#8217;s transparency blog explains why they&#8217;re siding with Apple:</p>\n<blockquote><p>Like Apple, we respect the rule of law, and honor the valid government orders we receive to furnish data in connection with criminal investigations. But deliberately weakening information security, as Apple has been asked to do here, is a step too far that makes everyone less safe.</p>\n<p>Undermining security measures – even in situations where there appear to be good intentions – will inevitably have unintended consequences for regular people.</p>\n<p>We stand with Apple in both condemning terrorism and defending the privacy and security of our users. If Automattic was faced with a government order like the one issued in San Bernadino, we, like Apple, would do everything within the law to challenge it. That’s why we’re joining with a sizable group of leading tech companies today to support Apple in this case.</p></blockquote>\n<p>If you&#8217;d like to learn more about why the court order is a terrible idea, check out the <a href="https://cloudup.com/iZG9vzAV3U3">full legal brief</a> submitted by Automattic to the United States District Court.</p>\n<h2>The Ethics of Sharing GPL Code</h2>\n<p>Tom McFarlin shares his thoughts on working with clients, educating people, and <a href="https://tommcfarlin.com/sharing-gpl-code/">sharing GPL code</a> from client projects. If you&#8217;re a consultant, how do you convince clients to give you permission to release code they pay for and you write to the public under the GPL?</p>\n<p>After reading the post, <a href="https://tommcfarlin.com/sharing-gpl-code/#comment-881900">check out this comment</a> left by Darrinb.</p>\n<h2>Gravity Forms Becomes 2nd Gold Partner</h2>\n<p>Around this time last year, Scott Kingsley Clark <a href="http://wptavern.com/pods-lead-developer-scott-kingsley-clark-launches-friends-of-pods-funding-campaign">launched a new sponsorship program</a> called Friends of Pods. The funding is used to decrease private development of Pods and focus more on Pods core, related plugins, and integrations. Gravity Forms, the popular form creation plugin created by Rocketgenius is the <a href="http://pods.io/2016/03/04/announcing-our-2nd-gold-partner-gravity-forms/">second gold partner</a> in the program.</p>\n<p>In addition to the partnership news, the <a href="https://wordpress.org/plugins/pods-gravity-forms/">Pods Gravity Forms add-on</a> is now available on the WordPress plugin directory.</p>\n<h2>ActiveDen is No More</h2>\n<p><a href="http://activeden.net/">ActiveDen</a>, a site where people could sell Flash assets and was the first site in the Envato Marketplace has officially closed its doors. The company <a href="http://inside.envato.com/farewell-activeden/">shut it down</a> in order to focus on things that have more impact.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/ActiveDenShutsDown.png" rel="attachment wp-att-52052"><img class="size-full wp-image-52052" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/ActiveDenShutsDown.png?resize=812%2C303" alt="ActiveDen Shuts Down" /></a>ActiveDen Shuts Down\n<p>To learn more about the history of ActiveDen, I encourage you to watch this 45 minute video featuring Collis Ta&#8217;eed where he talks about the first six months of Envato.</p>\n<div class="embed-wrap"></div>\n<h2>SIDEKICK Partners With ThemeForest</h2>\n<p><a href="https://www.sidekick.pro/updates/sidekick-teams-themeforest/">SIDEKICK announced</a> it is in a trial partnership with 19 ThemeForest authors. The partnership enables customers to view interactive tutorials from within the WordPress dashboard. According to the announcement, the test aims to alleviate some support pain for authors.</p>\n<h2>Calypso&#8217;s Contributor Code of Conduct</h2>\n<p>Codes of Conduct are not limited to events. Many open source projects have implemented them as a way to provide a base line of expectations from those who participate in the project. WordPress core contributor, Ryan Boren, shared a link to <a href="https://github.com/Automattic/wp-calypso/blob/master/CODE-OF-CONDUCT.md">Calypso&#8217;s Code of Conduct</a> on Github which explains the expectations project maintainers have of contributors.</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Open source contribution is onboarding flow 4 the future of work in a software eaten world. It has codes of conduct. <a href="https://t.co/isXa7S1WTh">https://t.co/isXa7S1WTh</a></p>\n<p>&mdash; Ryan Boren (@rboren) <a href="https://twitter.com/rboren/status/705228769192079360">March 3, 2016</a></p></blockquote>\n<p></p>\n<h2>Coen Jacobs on Bundling Libraries in WordPress</h2>\n<p>Coen Jacobs <a href="http://coenjacobs.me/2016/03/02/bundling-libraries-is-not-overhead-its-a-best-practice/">explains why</a> bundling libraries is not overhead but a best practice. It&#8217;s another post in a series from Jacobs on the issue of handling dependencies in WordPress.</p>\n<h2>WordImpress and Media Temple Partnership</h2>\n<p>The WordImpress team <a href="https://wordimpress.com/announcing-wordimpres-media-temple-community-consultants/">announced on its site</a> that it has partnered with Media Temple as WordPress Community Consultants. In exchange for information about customer needs, Media Temple is enabling the team to sponsor, attend, and speak at more WordCamps this year.</p>\n<h2>Happy Birthday Wapuu!</h2>\n<p>In what is a traditional part of this series, I end each issue featuring a Wapuu design. For those who don&#8217;t know, Wapuu is the <a href="http://wapuu.jp/2015/12/12/wapuu-origins/">unofficial mascot</a> of the WordPress project.</p>\n<p>In honor of <a href="http://wapuu.jp/2016/02/18/happy-birthday-wapuu/">Wapuu&#8217;s recent birthday</a> which is February 19th, I present Birthday Wapuu. I hope you&#8217;ll join me in wishing Wapuu a happy birthday!</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/BirthdayWapuu.png" rel="attachment wp-att-52054"><img class="size-full wp-image-52054" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/BirthdayWapuu.png?resize=900%2C1000" alt="Happy Birthday Wapuu" /></a>Happy Birthday Wapuu\n<p>That&#8217;s it for issue three. If you recently discovered a cool resource or post related to WordPress, please share it with us in the comments.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Mar 2016 20:12:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:53:"Akismet: Akismet WordPress Plugin 3.1.8 Now Available";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1905";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://blog.akismet.com/2016/03/04/akismet-wordpress-plugin-3-1-8-now-available/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1089:"<p>Version 3.1.8 of <a href="http://wordpress.org/plugins/akismet/">the Akismet plugin for WordPress</a> is now available.</p>\n<p>This update improves compatibility with plugins that rewrite admin URLs. It also reduces the amount of space Akismet uses in the database and reduces the size of the Akismet API requests. A fix is also included for a bug that could have caused comment moderation emails to be sent for some comments that were caught as spam.</p>\n<p>To upgrade, visit the Updates page of your WordPress dashboard and follow the instructions. If you need to download the plugin zip file directly, links to all versions are available in <a href="http://wordpress.org/plugins/akismet/">the WordPress plugins directory</a>.</p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1905/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1905/" /></a> <img alt="" border="0" src="http://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1905&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 04 Mar 2016 17:00:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Christopher Finke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"WPTavern: Joshua Strebel Interviews Alex King 10 Days Before His Death";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=52027";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://wptavern.com/joshua-strebel-interviews-alex-king-10-days-before-his-death";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1577:"<p>In September of 2015, Joshua Strebel, founder of Pagely, <a href="http://pressnomics.com/2015/09/four-speakers-added-to-pn4/">announced that Alex King</a> would be one of the speakers at Pressnomics 4, an annual conference devoted to the business aspects of WordPress. Unfortunately, days after the announcement, <a href="http://wptavern.com/alex-king-founder-of-crowd-favorite-passes-away">King passed away</a> from colon cancer.</p>\n<p>Due to health reasons, King would not have been able to attend the event in person. Instead, Strebel flew to King&#8217;s house and <a href="http://pressnomics.com/2016/03/our-interview-with-alex-king/">recorded a 40 minute bedside interview</a>. In the interview, which is edited beautifully, the duo discuss King&#8217;s career, lessons learned managing Crowd Favorite, and if Automattic is the empire, who fills the role of Darth Vader.</p>\n<div class="embed-wrap"></div>\n<p>Jeff Matson who writes and maintains documentation for <a href="http://www.rocketgenius.com/">Rocketgenius</a> and who&#8217;s attending the event, describes the crowd&#8217;s reaction after watching the interview, &#8220;Insightful and full of emotion, where a standing ovation was not only warranted, but mandatory. The crowd&#8217;s reaction truly showed how loved and respected Alex King was.&#8221;</p>\n<p>As I watched the interview, it was difficult not to cry. King passed away 10 days after it was recorded and even then, he had a sense of humor. King is survived by his wife Heather and his daughter Caitlin.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 22:21:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:94:"WPTavern: Roots Team Releases wp-password-bcrypt Plugin to Improve WordPress Password Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51913";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:104:"http://wptavern.com/roots-team-releases-wp-password-bcrypt-plugin-to-improve-wordpress-password-security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5264:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/passwords.jpg" rel="attachment wp-att-52033"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/passwords.jpg?resize=1024%2C436" alt="photo credit: Linux password file - (license)" class="size-full wp-image-52033" /></a>photo credit: <a href="http://www.flickr.com/photos/132889348@N07/20538585283">Linux password file</a> &#8211; <a href="https://creativecommons.org/licenses/by-sa/2.0/">(license)</a>\n<p>This week the <a href="https://roots.io/" target="_blank">Roots</a> development team released <a href="https://github.com/roots/wp-password-bcrypt" target="_blank">wp-password-bcrypt</a>, a plugin that uses <a href="https://en.wikipedia.org/wiki/Bcrypt" target="_blank">bcrypt</a> instead of <a href="https://en.wikipedia.org/wiki/MD5" target="_blank">MD5</a> password hashing. MD5&#8217;s known and exploited weaknesses have rendered it &#8220;cryptographically broken and unsuitable for further use,&#8221; according to the CMU Software Engineering Institute.</p>\n<p>In a <a href="https://roots.io/improving-wordpress-password-security/" target="_blank">post</a> announcing the plugin, Scott Walkinshaw explained why WordPress&#8217; default MD5 hashing function + salting is insecure:</p>\n<blockquote><p>MD5 is considered &#8220;broken&#8221; due to its collision vulnerability, but it’s broken more fundamentally for passwords: it’s too cheap and fast to calculate a hash.</p></blockquote>\n<p><a href="https://en.wikipedia.org/wiki/Bcrypt" target="_blank">bcrypt</a>, on the other hand, is much slower than MD5, making it more expensive to calculate. This stronger method of password hashing is built into PHP 5.5, but WordPress maintains 5.2.4 as its minimum required version. This precludes WordPress from using the newer password_hash function.</p>\n<p>Walkinshaw cites a four year old <a href="https://core.trac.wordpress.org/ticket/21022" target="_blank">ticket</a> which proposes a way for WordPress to allow plugin developers to more easily change from the salted MD5 method of hashing to the more secure bcrypt. James McKay left a sobering <a href="https://core.trac.wordpress.org/ticket/21022#comment:8" target="_blank">comment</a> on that ticket, advocating that WordPress core move to make bcrypt the default for environments that support it:</p>\n<blockquote><p>bcrypt needs to be made the default, out of the box option on all systems that support it. The idea that WordPress admins should have to go hunting for a plugin or tweak configuration options to do this scares me, simply because most of them won&#8217;t unless (a) they are well versed in web security, (b) they know that WordPress uses a weak alternative by default, and (c) they consider it to be an issue worth worrying about.</p>\n<p>People often underestimate the seriousness of MD5 and the SHA-* algorithms being &#8220;less secure.&#8221; They aren&#8217;t just less secure: thanks to developments in password cracking in the past few years using GPU- and FPGA- based software, they are <a href="https://codahale.com/how-to-safely-store-a-password/" target="_blank">totally useless</a>. Programs such as oclHashCat even have an option specifically to crack passwords in WordPress databases &#8212; and the rate at which they can do so is terrifying. If you&#8217;re not making a strong password hashing algorithm the default, out of the box option, you&#8217;re exposing your users to unacceptable and unnecessary risk.</p></blockquote>\n<p>Unfortunately, action on the ticket has been held up due to a UX issue. Discussion on the ticket continues, but contributors have not yet settled on a path for improvement.</p>\n<p>&#8220;So what is holding up the switch?&#8221; Walkinshaw said. &#8220;Bureaucracy and the unwillingness to make it happen. The consensus of the ticket is that it’s actually a UX problem. At this point, there is no technical reason why this can’t be done.&#8221;</p>\n<p>In the meantime, if you want to implement secure bcrypt hashed passwords, you can use the <a href="https://github.com/roots/wp-password-bcrypt" target="_blank">wp-password-bcrypt</a> plugin from the Roots team. It will protect against database compromises. If your WP database fell into the wrong hands, attackers would have a much more difficult time attempting to brute force a bcrypted password versus a MD5-based password.</p>\n<p>The plugin re-hashes user passwords with bcrypt when users log in. If a user never logs in, the password remains hashed with MD5. It can also be uninstalled without negative consequences. There are no settings &#8211; it simply works in the background.</p>\n<p>&#8220;We&#8217;ve purposely tried to keep the plugin as simple as possible so there are no surprises,&#8221; Walkinshaw said. &#8220;Obviously we recommend people test out the plugin first, and hopefully put it on a staging site first.&#8221;</p>\n<p>The plugin can be installed by automatically autoloading it with Composer or by manually copying wp-password-bcrypt.php into your mu-plugins folder. It will also soon be added to Roots&#8217; <a href="https://roots.io/bedrock/" target="_blank">Bedrock</a> project boilerplate to provide a more secure default.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 21:37:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:96:"WPTavern: WordPress Meetup Groups in Belfast and Dublin are Planning WordCamps for 2016 and 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51824";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:106:"http://wptavern.com/wordpress-meetup-groups-in-belfast-and-dublin-are-planning-wordcamps-for-2016-and-2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4919:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/wordcamp-belfast.jpg" rel="attachment wp-att-52003"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/wordcamp-belfast.jpg?resize=712%2C291" alt="wordcamp-belfast" class="aligncenter size-full wp-image-52003" /></a></p>\n<p>The inaugural <a href="https://twitter.com/WCBelfast" target="_blank">WordCamp Belfast</a> and <a href="https://twitter.com/WordCampDublin" target="_blank">WordCamp Dublin</a> are now in the early stages of planning. Members of the WordPress Northern Ireland meetup group are collaborating with the Dublin meetup to organize an event in Belfast in September 2016 and one in Dublin in April 2017. The dates have not yet been set in stone but organizers are looking at venues and are gathering all the details and costs to begin work on a budget.</p>\n<p>&#8220;Ever since first setting up the WordPress Meetup group in January 2014, a WordCamp was always something that we wanted to see – when the time was right,&#8221; organizer Mark Smallman said. &#8220;Having had the meetup group running successfully for two years, and having been in communication with the Dublin group, we decided the time was right to explore the possibility of running a WordCamp.&#8221;</p>\n<p>John Walsh, co-organizer of the Dublin WordPress Meetup Group, has applied to be the lead organizer of WordCamp Dublin 2017.</p>\n<p>&#8220;The goal is to combine our resources and work together to achieve the common goal of bringing WordCamp to Dublin and to Belfast on an annual basis,&#8221; Walsh said. &#8220;Separately, we have a certain capability but by working together we can accomplish a lot more.&#8221;</p>\n<p>Since neither of the two groups has previously hosted or planned a WordCamp, Smallman said that it&#8217;s a steep learning curve for all of them.</p>\n<p>&#8220;It helps to have as many and as varied a range of skills as possible on-board to help us get to the summit,&#8221; Smallman said. &#8220;We hope that once we have #WCBelfast in full swing, some of the same organizing team members can either offer assistance to WordCamp Dublin or take on roles directly within their organizing team. This should help both WordCamps in terms of planning for the future.&#8221;</p>\n<p>Smallman said that if both WordCamps are a success, the teams will look at the possibility of alternating between Belfast and Dublin in future years.</p>\n<p>&#8220;Having a team that is spread over the two areas will also help to widen the net of possible speakers, sponsors and attendees for both WordCamps, hopefully helping to make both a success,&#8221; he said. &#8220;And who knows, possibly both will become regular events on the WordCamp calendar.&#8221;</p>\n<h3>The Wapuu of the North: Growing the Community Spirit in Belfast</h3>\n<p>Smallman and the organizing team hope the two WordCamps will help to validate and grow the unique WordPress communities on both sides of the border.</p>\n<p>&#8220;Belfast and Northern Ireland have a wide range of very skilled people in the I.T. sector,&#8221; he said. &#8220;But up until recently it was lacking when it comes to community spirit within the sector. Slowly, we have seen groups within the area grow and now we have thriving Blogging and PHP groups as well as many others.&#8221;</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/belfast_wapuu.jpg" rel="attachment wp-att-52005"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/belfast_wapuu.jpg?resize=300%2C300" alt="belfast_wapuu" class="alignright size-medium wp-image-52005" /></a>As an expression of community spirit, the Belfast organizing team has already created a wapuu mascot for the event.</p>\n<p>&#8220;The Wapuu of the North was generously created by Peter of <a href="http://1440design.com/wordpress/branding-wordcamp-belfast/" target="_blank">1440 Design</a> in Belfast,&#8221; Smallman said. &#8220;Peter works along side <a href="https://twitter.com/se_nelson" target="_blank">Sam Nelson</a> who is on our organizing team. Sam also created our #WCBelfast badge.</p>\n<p>&#8220;We chatted and bounced a few ideas around for a theme for the WordCamp,&#8221; he said. &#8220;Game of Thrones was a very obvious choice, and one that none of us could think of a better fit. Northern Ireland has no fewer than a dozen filming locations for the show. We all thought that we could not choose anyone better than the Wapuu of the North to deliver the message that the White Walkers (developers) were on their way!&#8221;</p>\n<p>Smallman said the team is excited about the venue they&#8217;ve selected for hosting Northern Ireland&#8217;s very first WordCamp.</p>\n<p>&#8220;With all being well, we really are planning something very special for our first WordCamp,&#8221; he said. &#8220;We cannot wait to get moving onto the next stage.&#8221;</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 10:00:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: BuddyPress 2.5.0 Released, Features Customizable Emails and Support for Emoji";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51957";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://wptavern.com/buddypress-2-5-0-released-features-customizable-emails-and-support-for-emoji";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2990:"<p>BuddyPress 2.5.0 &#8220;Medici&#8221; was <a href="https://buddypress.org/2016/03/buddypress-2-5-0/" target="_blank">released</a> today, named for <a href="http://www.medici57.com/" target="_blank">Medici on 57th</a>, a Chicago restaurant famous among BP contributors for its &#8220;Garbage Pizza.&#8221; The new <a href="https://codex.buddypress.org/emails/" target="_blank">BP Email API</a> is the highlight of the release. It allows users to edit BuddyPress emails in the admin and change their appearance in the customizer.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/bp-emails-feature.png" rel="attachment wp-att-51979"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/bp-emails-feature.png?resize=1016%2C528" alt="bp-emails-feature" class="aligncenter size-full wp-image-51979" /></a></p>\n<p>The placeholder text in curly braces, which is replaced with data in the emails, is called a &#8220;token.&#8221; All <a href="https://codex.buddypress.org/emails/email-tokens/" target="_blank">available email tokens</a> are listed in the codex. Since BP emails are simply a custom post type, plugin developers can easily hook into BuddyPress&#8217; email system and <a href="https://codex.buddypress.org/emails/custom-emails/" target="_blank">create new emails</a> that will be triggered by a specified action.</p>\n<p>This release also introduces long-awaited support for emoji, which can now be used in activity updates, messages, and group descriptions.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/bp-emoji.png" rel="attachment wp-att-51988"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/bp-emoji.png?resize=844%2C387" alt="bp-emoji" class="aligncenter size-full wp-image-51988" /></a></p>\n<p>Other highlights of BuddyPress 2.5 include:</p>\n<ul>\n<li><strong>Post Type Comments Tracking</strong> &#8211; Custom post types show in the activity stream and now, with the BuddyPress &#8220;Site Tracking&#8221; component enabled, replies to CPT-generated activity items will be synchronized with comments on the corresponding post.</li>\n<li><strong>Twenty Twelve Companion Stylesheet</strong> &#8211; BuddyPress now has basic styles that will make it fit in seamlessly when activated with the Twenty Twelve theme.</li>\n<li><strong>Autolink Settings for Profile Fields</strong> &#8211; BuddyPress profile fields can be autolinked to a search of the members directory using the field value as a search term. This release offers as new setting to enable or disable the autolinking on a per-field basis.</li>\n</ul>\n<p>34 volunteer contributors worked together to close 95 tickets for the <a href="https://buddypress.trac.wordpress.org/milestone/2.5" target="_blank">2.5 milestone</a>. For a full list of all the improvements and fixes, check out the <a href="https://buddypress.trac.wordpress.org/milestone/2.5" target="_blank">official 2.5.0 changelog</a>.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 03 Mar 2016 00:12:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: TGM Plugin Activation Library Contributors Work Toward Feature Plugin Proposal";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51715";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"http://wptavern.com/tgm-plugin-activation-library-contributors-work-toward-feature-plugin-proposal";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6907:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/paper.jpg" rel="attachment wp-att-51974"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/03/paper.jpg?resize=960%2C516" alt="photo credit: Startup Stock Photos" class="size-full wp-image-51974" /></a>photo credit: <a href="https://stocksnap.io/photo/AL0V4Q84GP">Startup Stock Photos</a>\n<p>The team behind the <a href="http://tgmpluginactivation.com/" target="_blank">TGM Plugin Activation Library</a> (TGMPA) is working to propose it as a feature plugin for WordPress. Last July contributors on the project <a href="https://make.wordpress.org/core/2015/07/10/feature-plugin-chat-on-july-14/#comment-26310" target="_blank">opened the discussion</a> on a post calling for feature plugins, and the upcoming 3.0 version is being developed with this path in mind.</p>\n<p>Developers use TGMPA to manage dependencies between plugins and themes, as an alternative to bundling a heap of plugin-type functionality into one extension. It walks users through the process of installing plugin dependencies that are required or recommended by the developer. The library is used by 6% of WordPress.org themes as well as a large number of commercial products hosted on CodeCanyon and Themeforest.</p>\n<p>TGMPA will require a substantial rewrite in order to make it ready for consideration as a feature plugin. It also needs to be multisite compatible, address a number of usability issues, and be trimmed of extra features to become leaner and more core friendly.</p>\n<p>The team behind the project has a <a href="https://docs.google.com/forms/d/1dGb8s2poPWbCGPBPLn5sDDxSulNRYit7vF_-rsk5V6M/viewform?c=0&w=1" target="_blank">survey</a> open to solicit opinions from the community regarding the implementation of these changes. A few sample considerations from the survey include:</p>\n<ul>\n<li>What method should the plugin use to supply dependency information to multisite independently of whether a theme or plugin is active?</li>\n<li>How should the plugin deal with themes and plugins which haven&#8217;t yet upgraded to the newer version of TGMPA?</li>\n<li>Should the plugin support plugin download sources other than wordpress.org?</li>\n</ul>\n<p>&#8220;To me it feels like we need more core team support for it to be properly considered for feature plugin status, so some lobbying behind the scenes is in order,&#8221; TGMPA lead developer <a href="https://twitter.com/jrf_nl" target="_blank">Juliette Reinders Folmer</a> told the Tavern. &#8220;The survey is also part of this as that will give us hard data to use in the discussions.&#8221;</p>\n<h3>The Future of TGMPA Is a More Modular Architecture</h3>\n<p>Folmer said that regardless of whether TGMPA is approved to become a feature plugin, future development will continue with core in mind.</p>\n<p>&#8220;Development for v3 will be a lot more modular,&#8221; Folmer said. &#8220;TGMPA currently is effectively one file with four classes. That makes it easy to include it in themes and plugins (one file), but not as easy to maintain. As v3 will contain some big changes, this seems like a good point in time to change the structure of TGMPA as well.&#8221;</p>\n<p>With a more modular approach in place, Folmer said that the team plans to split the package into a number of different repositories for development purposes. She has tentatively identified features that would be offered in the core module, and everything else would be supported via add-on modules, i.e.:</p>\n<ul>\n<li>support for bundled plugins</li>\n<li>support for non-wp.org download urls</li>\n<li>support for recommended plugins</li>\n</ul>\n<p>TGMPA would also introduce two wrappers &#8211; each would function as a layer that will load all the available modules:</p>\n<ul>\n<li>one for continued support for including TGMPA in plugins and themes</li>\n<li>one for TGMPA as a feature plugin</li>\n</ul>\n<p>&#8220;So no matter what will be decided concerning whether TGMPA will be allowed to become a feature plugin, support for the features of TGMPA as is (but better) will be continued,&#8221; Folmer said.</p>\n<p>&#8220;With the modular development, it won&#8217;t be as easy anymore to download &#8216;TGMPA&#8217; from GitHub, as you&#8217;d need to download all the different modules (or use composer / use git submodules),&#8221; she said. &#8220;I envision the <a href="http://wptavern.com/tgm-plugin-activation-team-releases-custom-generator" target="_blank">Custom TGMPA Generator</a> to be the way forward for downloading TGMPA as a complete package in that respect.&#8221;</p>\n<h3>Can TGMPA Gain Enough Support from Core Developers to Become a Feature Plugin?</h3>\n<p>Folmer said that the WordPress core developers she has spoken with are divided on whether on whether its current approach makes it a good candidate for a feature plugin.</p>\n<p>During <a href="https://github.com/TGMPA/TGM-Plugin-Activation/issues/447" target="_blank">preliminary discussions on GitHub</a>, WordPress core committer <a href="http://pento.net/" target="_blank">Gary Pendergast</a> expressed reservations about requiring too much user interaction during the process.</p>\n<p>&#8220;The primary goal of plugin dependencies should be that it&#8217;s invisible to the user,&#8221; Pendergast said. &#8220;If there&#8217;s ever a point where the user is asked to make a decision, then it&#8217;s not ready for core.</p>\n<p>&#8220;I&#8217;ve had a quick read through the TGMPA code,&#8221; he said. &#8220;I think it&#8217;s solving the problem it needed to solve (providing a drop-in library for themes and plugins), but I think we&#8217;d need to tie it much more tightly into core for it to be a feature plugin.&#8221;</p>\n<p>Folmer hopes to address user experience concerns with refinements to the plugin based on feedback from the survey, which will be open until the end of March.</p>\n<p>&#8220;So far, most responses have been from developers using TGMPA,&#8221; she said. &#8220;Even though the survey is quite technical, we would very much also like to hear from more end-users.&#8221;</p>\n<p>With the recent confusion over WordPress.org&#8217;s previously unwritten rule <a href="http://wptavern.com/the-wordpress-plugin-directory-will-no-longer-accept-frameworks" target="_blank">banning framework plugins from the official directory</a>, the challenge of managing inter-plugin dependencies is under the spotlight again. The TGM Plugin Activation library isn&#8217;t the only possible solution to this problem, but it does have a motivated contributor base that is willing to take up the challenge of solving this problem via a feature plugin. If you want to be part of shaping the roadmap for version 3, make sure to <a href="https://docs.google.com/forms/d/1dGb8s2poPWbCGPBPLn5sDDxSulNRYit7vF_-rsk5V6M/viewform?c=0&w=1" target="_blank">fill out the survey</a> before April 1.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Mar 2016 20:16:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: The WordPress Plugin Directory Will No Longer Accept Frameworks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51927";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/the-wordpress-plugin-directory-will-no-longer-accept-frameworks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5925:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/sockets.jpg" rel="attachment wp-att-51946"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/sockets.jpg?resize=960%2C476" alt="photo credit: Jaroslaw Puszczyński" class="size-full wp-image-51946" /></a>photo credit: <a href="https://stocksnap.io/photo/M07SV6AMBD">Jaroslaw Puszczyński</a>\n<p>Today the WordPress plugin review team issued a reminder for what they said is a long-standing, unwritten rule: frameworks are not allowed in the official directory. In a post tiled &#8220;<a href="https://make.wordpress.org/plugins/2016/03/01/please-do-not-submit-frameworks/" target="_blank">Please do not submit frameworks</a>,&#8221; Mika Epstein outlined the reason behind the rule:</p>\n<blockquote><p>At this time, we are not accepting frameworks as we don’t feel frameworks, boilerplates, and libraries are appropriate for the Plugins Directory. We require that plugins be useful in and of themselves (even if only being a portal to an external service). And while there are many benefits to frameworks and libraries, without plugin dependency support in core or the directory, it becomes another level of hassle for users.</p></blockquote>\n<p>Until WordPress core adopts a way to support plugin dependencies, the plugin review team recommends that frameworks and libraries be packaged with each plugin in a way that doesn&#8217;t conflict with other plugins/frameworks/libraries.</p>\n<p>The issue was most recently addressed with the <a href="https://wordpress.org/plugins/cmb2/" target="_blank">CMB2</a> plugin, which Epstein said was <a href="https://make.wordpress.org/plugins/2016/02/25/re-thinking-tags-in-the-plugin-directory/#comment-42655" target="_blank">mistakenly approved months ago.</a> CMB2 is essentially a library that makes it easy for developers to build metaboxes, custom fields, and forms. It is exactly the kind of plugin that the previously unwritten rule is meant to block from being available in the official directory. Epstein further clarified the reasons why:</p>\n<blockquote><p>The issue is as follows: Having a framework as a plugin is a poor experience for the user. Not the developer. The user. The user understands “I have an add-on for WooCommerce, I probably need Woo.” They do not always understand “I have plugin Slider Joe. Why do I need Advanced Custom Fields?” In addition, by having a library as a plugin, the onus of version compatibility is now on the person least likely to understand it: the user.</p>\n<p>The plugin repository is not, currently, a library or framework repository. It’s not meant like the NPM package manager, or even Composer as a way to define what a plugin ‘needs’ in the same ways for a developer to build a project. The plugin repository is, plain and simple, meant for plugins that users will find useful. Plugins that add functionality to WordPress in a directly inter-actable way.\n</p></blockquote>\n<p>The confusion lies in the fact that this particular rule has been applied inconsistently for years and has many notable exceptions, including <a href="https://wordpress.org/plugins/redux-framework/" target="_blank">Redux Framework</a>, <a href="https://wordpress.org/plugins/cmb2/" target="_blank">CMB2</a>, and arguably plugins like <a href="https://wordpress.org/plugins/piklist/" target="_blank">Piklist</a>, <a href="https://wordpress.org/plugins/titan-framework/" target="_blank">Titan Framework</a>, <a href="https://wordpress.org/plugins/kirki/" target="_blank">Kirki</a>, <a href="https://wordpress.org/plugins/options-framework/" target="_blank">Options Framework</a>, and many more. These are the types of plugins that don&#8217;t really do anything out of the box but are meant for developers to use for building things.</p>\n<p>According to Epstein, a few of these plugins have been &#8220;grandfathered in&#8221; due to oversights in the plugin review process, but the rule stands for new submissions.</p>\n<p>&#8220;CMB2 and Redux Framework are grandfathered in,&#8221; she <a href="https://make.wordpress.org/plugins/2016/02/25/re-thinking-tags-in-the-plugin-directory/#comment-42655" target="_blank">said</a>. &#8220;We don’t let any more in, since a lot of plugins include them inside AS plugins. It’s a mess. Also CMB2 shouldn’t have been approved, which is a different mess altogether. Frameworks are not supposed to be in the repo at this time. Period.&#8221;</p>\n<p>Another commenter on the most recent post, who recently had his <a href="https://wordpress.org/plugins/advanced-term-fields/" target="_blank">Advanced Term Fields</a> plugin approved, asked, <strong>&#8220;Are you saying the best way to handle this scenario is to include the parent framework in each child plugin, as opposed to alerting the user that &#8216;This plugin requires XXX plugin in order to function properly?''&#8221;</strong></p>\n<p>Epstein confirmed that this is in fact what the team is suggesting:</p>\n<blockquote><p>Currently, yes. That would have been the best way. Since your plugin is approved, though, it’s unfair of us to yank the rug out from under you. While you don’t have a great many users, we recognize when the gaff is us.</p></blockquote>\n<p>The plugin review team has a difficult job and is working with limited volunteer resources. However, the inconsistent application of unwritten rules has led to what appears to be an arbitrary set of guidelines. One thing that would make life easier for both reviewers and plugin developers is if WordPress core adopted a way to manage inter-plugin dependencies. <a href="http://tgmpluginactivation.com/" target="_blank">The TGM Plugin Activation</a> team is <a href="https://github.com/TGMPA/TGM-Plugin-Activation/issues/447" target="_blank">working on a proposal for a feature plugin</a>, which we&#8217;ll examine in depth in an upcoming post.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 02 Mar 2016 00:49:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:92:"WPTavern: Poetica Acquired by Condé Nast, Open Source WordPress Plugin Will Be Discontinued";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51903";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:100:"http://wptavern.com/poetica-acquired-by-conde-nast-open-source-wordpress-plugin-will-be-discontinued";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3293:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/poetica.png" rel="attachment wp-att-51905"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/03/poetica.png?resize=1025%2C520" alt="poetica" class="aligncenter size-full wp-image-51905" /></a></p>\n<p>Poetica <a href="https://blog.poetica.com/2016/03/01/our-next-chapter/" target="_blank">announced</a> today that its team and technology have been acquired by Condé Nast. The technology provided realtime &#8220;Google-docs style collaboration&#8221; in the WordPress post editor as well as a non-WordPress editor available via the public <a href="https://poetica.com/" target="_blank">Poetica.com</a> service. As of June 1, 2016, the service will be shut down.</p>\n<p>The Poetica team will continue to develop the technology as part of <a href="http://learn.copilot.conde.io/" target="_blank">Copilot</a>, Condé Nast’s proprietary publishing platform.</p>\n<p>According to CTO and co-founder Blaine Cook, <a href="https://twitter.com/blaine/status/704738953321013253" target="_blank">development on the open source plugin will be discontinued</a>, as the plugin is dependent on the Poetica service. Those who have been using the plugin will have no choice but to find an alternative.</p>\n<p>WordPress isn&#8217;t well-equipped for content collaboration. In fact, thanks to its fancy <a href="https://codex.wordpress.org/Post_Locking" target="_blank">post locking</a> feature, WordPress is streamlined to enable the opposite of a collaborative editorial workflow. It&#8217;s designed for one user to work on a post while locking all other users out.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2013/09/post-locking.png" rel="attachment wp-att-9350"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2013/09/post-locking.png?resize=715%2C231" alt="post-locking" class="aligncenter size-full wp-image-9350" /></a></p>\n<p>Additionally, after a post is published, no further collaboration can be made, as the only way to make edits is to push changes immediately to the live copy.</p>\n<p>Poetica was one of the few tools that provided a way for editorial teams to write together, allowing multiple WordPress users to view and edit content at the same time. The plugin tracked changes and allowed users to make suggested edits that could be accepted or rejected.</p>\n<p>Although Poetica provided a much-needed collaboration tool for WordPress, its founders said they were unable to create a profitable business model around the software:</p>\n<blockquote><p>Up until now, though, we’ve been a small five-person team. We’ve tackled the dual problems of creating a humane, intuitive, and collaborative way to interact with text, on any device and any content platform; and the parallel challenge of creating a viable business model. Unfortunately, these goals were often at odds with each-other, competing for our limited time and attention.</p></blockquote>\n<p>After Poetica.com is shut down, it will destroy any drafts and user data from the site, as Condé Nast has only acquired the software and not the user data. Users will soon be notified via email about how to download a full archive of their drafts ahead of the June 1st shutdown.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 01 Mar 2016 19:38:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"WPTavern: aXe: An Open Source JavaScript Library for Automating Accessibility Testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51876";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/axe-an-open-source-javascript-library-for-automating-accessibility-testing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4883:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/axe-logo.jpg" rel="attachment wp-att-51880"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/axe-logo.jpg?resize=780%2C366" alt="axe-logo" class="aligncenter size-full wp-image-51880" /></a></p>\n<p>In June 2015 <a href="http://www.deque.com/" target="_blank">Deque</a>, an accessibility consultancy, open sourced <a href="https://github.com/dequelabs/axe-core" target="_blank">aXe</a>, its accessibility rules engine for automated web UI testing. aXe is a compact JavaScript library (~100 KB) that executes automated accessibility tests inside your testing framework or browser. Deque outlined a number of advantages that the aXe library has over previous approaches to automated testing of HTML-based user interfaces:</p>\n<ul>\n<li>It works on all modern browsers</li>\n<li>It supports in-memory fixtures, static fixtures, integration tests and iframes of infinite depth</li>\n<li>It has zero false positives (bugs notwithstanding)</li>\n<li>It is open source</li>\n<li>It is actively supported by a major accessibility vendor</li>\n<li>It is designed to work with whatever tools, frameworks, libraries and environments you have today</li>\n<li>It is designed to be integrated into your existing functional/acceptance automated tests</li>\n<li>It automatically determines which rules to run based on the evaluation context</li>\n<li>It is highly configurable</li>\n</ul>\n<p>aXe integrates with Karma, QUnit, Jasmine, Mocha, PhantomJS, and many others &#8211; basically any testing framework that supports JavaScript execution.</p>\n<h3>aXe Extension Adds Accessibility Testing to Chrome Developer Tools</h3>\n<p>If you&#8217;re not using automated testing tools in your projects, the Chrome developer tools extension is the easiest gateway to performing accessibility tests directly in the browser as you&#8217;re viewing or building a website or application.</p>\n<p>aXe is available as a <a href="https://chrome.google.com/webstore/detail/axe/lhdoppojpmngadmnindnejefpokejbdd" target="_blank">free extension from the Chrome web store</a>. (Alternatively, it&#8217;s also available as an <a href="https://addons.mozilla.org/en-us/firefox/addon/axe-devtools/?src=search&utm_campaign=aXe%20The%20Accessibility%20Engine&utm_content=aXe%20for%20Firefox&utm_medium=Hyperlink&utm_source=Website" target="_blank">add-on for Firefox</a>.) Once you click &#8220;Add to Chrome,&#8221; aXe will be available under its own tab in Chrome DevTools panel. It automatically ferrets out accessibility defects and offers details for each violation.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/axe-on-wordpressorg.png" rel="attachment wp-att-51879"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/axe-on-wordpressorg.png?resize=1025%2C583" alt="axe-on-wordpressorg" class="aligncenter size-full wp-image-51879" /></a></p>\n<p>The creators of aXe were invited to contribute the open source library to the <a href="http://www.w3.org/WAI/ER/2015/draft-charter-3" target="_blank">W3C WAI Evaluation and Repair Tools Working Group</a>, as the group works to develop a normative set of rules for evaluating <a href="https://www.w3.org/TR/WCAG20/" target="_blank">WCAG 2.0</a> conformance.</p>\n<p>If you&#8217;re working on improving WordPress&#8217; accessibility, the aXe extension can even help perform some of the <a href="https://make.wordpress.org/accessibility/handbook/testing/how-to-test-for-accessibility/" target="_blank">tests recommended by the Accessibility team</a>. You can log issues by <a href="https://make.wordpress.org/core/handbook/reporting-bugs/" target="_blank">creating a ticket on WordPress Trac</a> or testing patches for existing tickets.</p>\n<p>In 2014 the Accessibility team <a href="https://make.wordpress.org/accessibility/2014/05/02/automated-accessibility-testing/" target="_blank">discussed adding automated accessibility testing to WordPress</a>, with Quail.js as one of the frontrunners. The team is just now <a href="http://wptavern.com/your-chance-to-give-feedback-on-wordpress-accessibility-coding-standards" target="_blank">adding accessibility code standards to the WordPress core handbook</a>. The next step would be firming up a list of requirements for an automated testing tool. aXe might be a new possibility to consider, as it is open source and focused on helping websites meet WCAG 2.0 requirements.</p>\n<p>Deque&#8217;s mission with aXe is to bring equality to the digital world. They are working to make automated accessibility testing more mainstream with professional web developers. If accessibility is a priority for your work, <a href="https://github.com/dequelabs/axe-core" target="_blank">aXe</a> is a lightweight library you may want to consider for automated testing on own projects.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 01 Mar 2016 01:11:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"WPTavern: Stripe Payment Gateway for WooCommerce Is Now Available for Free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51757";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wptavern.com/stripe-payment-gateway-for-woocommerce-is-now-available-for-free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2682:"<p>Last week WooCommerce announced on Twitter that its <a href="https://www.woothemes.com/products/stripe/" target="_blank">Stripe payment gateway</a> is now a free product. Prior to this decision, it was priced at $79 for a single license, $99 for up to five sites, and $199 for up to 25 sites.</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Exciting product announcement from <a href="https://twitter.com/stripe">@stripe</a> (which is also now free for WooCommerce, woo!) <a href="https://t.co/kQet52WMbn">https://t.co/kQet52WMbn</a> <a href="https://t.co/PzCRoyrgWG">pic.twitter.com/PzCRoyrgWG</a></p>\n<p>&mdash; WooCommerce (@WooCommerce) <a href="https://twitter.com/WooCommerce/status/702809439271821312">February 25, 2016</a></p></blockquote>\n<p></p>\n<p>The news coincides with the debut of Stripe&#8217;s new <a href="https://stripe.com/atlas" target="_blank">Atlas</a> product, which allows foreign companies to incorporate as a U.S. company in Delaware, set up a U.S. bank account, and accept payments with Stripe. Atlas was created to help entrepreneurs start global businesses no matter where they are located in the world.</p>\n<p>Automattic had a similar aim of lowering the barrier to entry for WooCommerce when it made the Stripe payment gateway available for free.</p>\n<p>&#8220;Receiving payments is integral to running an online store,&#8221; Product Team Lead Matty Cohen said. &#8220;Publishing the WooCommerce Stripe integration for free is one way we are helping merchants to get their stores set up quicker, and to easily receive credit card payments through their stores.</p>\n<p>&#8220;One of our focuses is to lower the barrier to entry and to assist WooCommerce stores in becoming successful,&#8221; Cohen said. &#8220;We are excited to be partners in making payment processing globally available for WooCommerce merchants.&#8221;</p>\n<p>Over the past two years, Stripe has been working to expand its services beyond the handful of countries it initially supported in the US and Europe. Although Stripe is increasingly popular, it cannot yet be considered a global option for accepting payments. It&#8217;s currently in <a href="https://support.stripe.com/questions/what-countries-does-stripe-support" target="_blank">private beta</a> for businesses in Brazil, Mexico, Portugal, Singapore, and Switzerland.</p>\n<p>Products like Atlas, in combination with the free gateway available from WooCommerce, should serve to bring Stripe availability to more locations around the world. WooCommerce representatives would not comment on whether Automattic is planning on offering more payment gateweys for free.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 29 Feb 2016 19:27:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:98:"WPTavern: Mandrill to Discontinue Free Tier for Transactional Emails, Developers Seek Alternatives";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51826";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:107:"http://wptavern.com/mandrill-to-discontinue-free-tier-for-transactional-emails-developers-seek-alternatives";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3123:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/paper-plane.jpg" rel="attachment wp-att-51834"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/paper-plane.jpg?resize=1024%2C444" alt="photo credit: Paper Plane - (license)" class="size-full wp-image-51834" /></a>photo credit: <a href="http://www.flickr.com/photos/8176740@N05/5703519506">Paper Plane</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>This week Mandrill announced that it will be <a href="http://blog.mailchimp.com/important-changes-to-mandrill/" target="_blank">discontinuing its free tier for transactional emails</a>. As of March 16th, new Mandrill users will create their accounts through MailChimp and existing users will be required to merge their accounts with a MailChimp account where they will be charged <a href="http://blog.mandrill.com/important-changes-to-mandrill.html" target="_blank">$20+/mo</a> for transactional emails. The deadline for merging accounts is April 27th.</p>\n<p>MailChimp is choosing to focus on delivering &#8220;personalized transactional&#8221; emails that require more design. For those who want to continue delivering utility type emails, the company recommends <a href="https://aws.amazon.com/ses/" target="_blank">Amazon SES</a>:</p>\n<blockquote><p>Transactional emails, like password reminders and the myriad email notifications you get after making changes to online accounts, are dead simple. Utilitarian providers like Amazon SES excel at this. Their innovation is mostly focused on increasing efficiency and reducing costs.</p></blockquote>\n<p>Many WordPress developers depend on Mandrill for sending wp_mail() emails in order to ensure delivery and take this load off the server. After MailChimp&#8217;s announcement, many are scrambling to find an alternative.</p>\n<p>Amazon SES allows users to send 62,000 messages per month to any recipient, as long as you call it from an Amazon EC2 instance. If you already have one set up, this is one of the best options.</p>\n<p><a href="https://hmn.md/" target="_blank">Human Made</a> created an open source <a href="https://github.com/humanmade/aws-ses-wp-mail" target="_blank">plugin</a> that makes it easy to change to Amazon SES. Setting it up is as simple as adding a few constants to your wp-config.php file and then verifying your sending domain for SES.</p>\n<p>Of course, Amazon SES isn&#8217;t the only option. Remkus de Vries wrote a post on <a href="https://remkusdevries.com/transactional-email-alternatives-for-mandrillapp/" target="_blank">transactional email alternatives to Mandrill</a>, which includes <a href="https://www.mailgun.com/" target="_blank">MailGun</a> (10,000 emails free every month), <a href="https://sendgrid.com/" target="_blank">SendGrid</a> (up to 12,000 emails  free per month), <a href="https://www.sendinblue.com/" target="_blank">SendIn Blue</a> (up to 9,000 emails/month, 300 emails/day free), and several others. Many of these email services also have corresponding plugins available in the WordPress Plugin Directory.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 26 Feb 2016 21:15:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: Austin WordPress Meetup to Host Charity Hackathon April 8, 2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51762";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://wptavern.com/austin-wordpress-meetup-to-host-charity-hackathon-april-8-2016";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4645:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/collaboration.jpg" rel="attachment wp-att-51819"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/collaboration.jpg?resize=960%2C479" alt="photo credit: Startup Stock Photos" class="size-full wp-image-51819" /></a>photo credit: <a href="https://stocksnap.io/photo/69TMH4ITIE">Startup Stock Photos</a>\n<p>After leading the do_action( ‘wordpress-charity-hackathon’ ); event in <a href="http://wptavern.com/wordpress-cape-town-to-host-charity-hackathon-in-august" target="_blank">2014</a> and <a href="http://wptavern.com/wordpress-cape-town-to-host-2nd-annual-charity-hackathon-in-june" target="_blank">2015</a> in Cape Town, South Africa, Hugh Lashbrooke is bringing the event to Texas with the help of Austin local David Cole. The Austin WordPress Meetup Group will be <a href="http://www.meetup.com/austinwordpress/events/228432694/" target="_blank">hosting the hackathon on April 8th</a>, which will coincide with <a href="https://wooconf.com/" target="_blank">WooConf</a>.</p>\n<p>Participants will spend the day building new WordPress-powered websites for 10 local non-profit organizations. At the end of the day, the following charities will have a new (or revamped) online presence with free hosting:</p>\n<ul>\n<li>North Austin Community Media (aka KXPE-LP)</li>\n<li>The Blood Center of Central Texas</li>\n<li>Refugee Services of Texas</li>\n<li>PelotonU</li>\n<li>Circle of Health International</li>\n<li>Black Fret</li>\n<li>AIDS Services of Austin</li>\n<li>Texas PACE Authority</li>\n<li>Day With Daddy</li>\n<li>Austin Kids First</li>\n</ul>\n<p>&#8220;What we&#8217;re looking for are 5-6 people to sign up for each build team and with 10 build teams that means we&#8217;re looking for 50-60 people to get involved and help to give back to the non-profits in the Austin area,&#8221; Lashbrooke said. &#8220;It&#8217;s important to note that the build teams are not just developers &#8211; we&#8217;re looking for project managers, social media managers, designers and content creators as well as developers.&#8221;</p>\n<p>The hackathon will be held at the tail end of WooConf and Lashbrooke said he hopes to attract a few WooConf attendees.</p>\n<p>&#8220;We&#8217;re going to make a more direct push to get WooConf attendees to be a part of the event, but right now the sign-up form is open to absolutely anyone,&#8221; he said.</p>\n<p>As part of the WordPress Community team&#8217;s new initiative to <a href="https://make.wordpress.org/community/2016/01/25/full-day-events/" target="_blank">standardize certain specialized full day events</a>, the do_action charity hackathon is now fully backed by the WordPress Foundation.</p>\n<p>&#8220;The Foundation will be on hand to offer support (logistically and financially) where necessary, just like with regular meetup events,&#8221; Lashbrooke said. &#8220;I will also be putting together documentation on how we organize this kind of event, which will be published on WordPress.org so that other communities can replicate the event type in their area.&#8221;</p>\n<p>When looking for non-profits to include, Lashbrooke said they don&#8217;t only look for organizations without websites. They also look for those that need their online presence improved or otherwise entirely rebuilt.</p>\n<p>&#8220;That may mean their website works fine, but it doesn&#8217;t really cater to their needs (accepting donations, selling goods, encouraging volunteers, etc.), so then on the day we can refresh things for them and make it all work in the way that they need it to,&#8221; he said.</p>\n<p>Last year the Cape Town participants helped create websites for the <a href="http://www.adultswithautism.org.za/" target="_blank">Academy for Adults with Autism</a>, <a href="http://www.carecareers.co.za/" target="_blank">Care Career Connection</a>, the <a href="http://www.psoriasis.org.za/" target="_blank">South African Psoriasis Association</a>, and several others.</p>\n<p>&#8220;It really does feel great &#8211; the non-profit representatives are there on the day as well, and seeing their reaction to the results of the hard work from their teams is always hugely satisfying,&#8221; Lashbrooke said. &#8220;Ultimately, what we&#8217;re doing is empowering non-profits to get on with the work that they do best without their online presence being a hinderance to their work.&#8221;</p>\n<p>If you live in Austin or will be attending WooConf and want to be part of the hackathon, you can sign up via the <a href="http://goo.gl/forms/2hjEXfSH0q" target="_blank">volunteer form</a>.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 26 Feb 2016 18:16:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"WPTavern: The WordPress Plugin Directory Is Getting a Makeover";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51789";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wptavern.com/the-wordpress-plugin-directory-is-getting-a-makeover";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2720:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/hammer-nails.jpg" rel="attachment wp-att-51795"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/hammer-nails.jpg?resize=960%2C419" alt="photo credit: Patryk Dziejma" class="size-full wp-image-51795" /></a>photo credit: <a href="https://stocksnap.io/photo/POQ7B631M3">Patryk Dziejma</a>\n<p>In February 2015, the <a href="http://wptavern.com/wordpress-theme-directory-launches-new-design" target="_blank">WordPress Theme Directory launched a new design</a>. Konstantin Obenland worked with Samuel “Otto” Wood and the <a href="https://make.wordpress.org/meta/" target="_blank">WordPress meta team</a> to update the design and move the directory off of bbPress. Today Obenland <a href="https://make.wordpress.org/meta/2016/02/25/plugin-directory-v3/" target="_blank">announced</a> that the <a href="https://wordpress.org/plugins/" target="_blank">Plugin Directory</a> will be getting a similar treatment.</p>\n<p>Version 3 of the Plugin Directory will focus heavily on improving the search interface, including prioritizing translated plugins for international users. Another major goal of the redesign is to streamline the plugin submission and review process. The new directory will be powered by WordPress, instead of bbPress, which will make it easier for plugin developers and reviewers to manage plugins, tags/categories, and committers.</p>\n<p>According to the <a href="https://make.wordpress.org/meta/plugin-directory-version-3/" target="_blank">project overview</a>, plugins will be saved in a custom post type, offering reviewers a more efficient workflow that makes use of post statuses with capability controlled permissions. This will also make it possible to run automated checks on plugins, which should reduce the number of <a href="https://make.wordpress.org/plugins/2016/02/03/plugin-review-inconsistencies/#comment-42561" target="_blank">inconsistencies in the review process</a>.</p>\n<p>The meta team plans to hit milestones every two weeks in order to ship version 3 by June 26, 2016. Obenland is aiming for getting a minimal viable product off the ground by March 1st, which would includes the plugin CPT, readme.txt parsing, and a basic display on the frontend. A full overview of the project and the tickets that will need to be addressed is available on the <a href="https://make.wordpress.org/meta/plugin-directory-version-3/" target="_blank">make.wordpress.org/meta P2</a>. New contributors are welcome to jump in on <a href="https://meta.trac.wordpress.org/query?status=!closed&component=Plugin+Directory" target="_blank">Meta Trac</a> and in the #meta Slack channel.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 25 Feb 2016 22:41:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: WordPress 4.5 to Introduce Native Support for a Theme Logo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51767";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:78:"http://wptavern.com/wordpress-4-5-to-introduce-native-support-for-a-theme-logo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4944:"<p>In October 2014, <a href="http://wptavern.com/jetpack-3-2-released-introduces-new-site-logo-feature-for-theme-developers" target="_blank">Jetpack 3.2 introduced a new site logo feature</a> for theme developers. As Jetpack is widely used, it provided a way for theme developers to easily build in logo support, thereby increasing data portability across themes.</p>\n<p>After discussion in yesterday&#8217;s core development meeting, <a href="https://make.wordpress.org/core/2016/02/24/theme-logo-support/" target="_blank">WordPress 4.5 is now set to introduce theme support for a site logo</a> using code that was ported over from Jetpack&#8217;s implementation. Themes will be able to declare support via: <code>add_theme_support( ''site-logo'', size )</code>, which will add the site logo upload to the customizer.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/site-logo.png" rel="attachment wp-att-51779"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/site-logo.png?resize=1025%2C748" alt="Image credit: Ryan Boren" class="size-full wp-image-51779" /></a>Image credit: <a href="https://make.wordpress.org/flow/2016/02/19/customize-site-logo-and-icon-33755-5-diff-iphone-6/">Ryan Boren</a>\n<p>According to release lead Mike Schroder, WordPress 4.5 will ship with a new version of <a href="https://wordpress.org/themes/twentysixteen/" target="_blank">Twenty Sixteen</a> that will support a site logo as an example implementation for theme developers.</p>\n<h3>Adding a Site Logo was Not Intuitive for Users During Testing</h3>\n<p>In the corresponding <a href="https://core.trac.wordpress.org/ticket/33755" target="_blank">ticket</a>, a few WordPress contributors were concerned about users experiencing confusion between the &#8220;Site Icon&#8221; and &#8220;Site Logo&#8221; features. Tammie Lister conducted <a href="https://make.wordpress.org/flow/2016/02/20/site-logo-and-icon-user-testing/" target="_blank">two users tests</a>, which she posted on the make.wordpress.org/flow blog.</p>\n<p>The first user landed on Appearance > Header and said, &#8220;I&#8217;m not really sure if this is the logo where I should be adding this.&#8221; She goes back to the admin, returns again to the header setting, and then finally lands on the customizer. She mistakenly added a site icon thinking it was the logo. Eventually, she found the correct setting and added the logo.</p>\n<p>The second tester first landed on the Tools menu and then navigated to Appearance, got lost in the theme browser, and then landed on Customize. She thought she was on the wrong screen and went back. She navigated to Settings, Users, and several other screens in the process of trying to find the right place to upload the logo. Eventually she found it with the explicit instructions included in the testing round for those who are having trouble.</p>\n<p>Both test users struggled to find this feature. Based on these tests, it does not appear that adding a site logo is very intuitive for users who are not working in WordPress every day. Watching the test users struggle through the admin in search of this setting is rather painful.</p>\n<p>&#8220;Discoverability of the feature isn&#8217;t great,&#8221; Lister <a href="https://core.trac.wordpress.org/ticket/33755#comment:77" target="_blank">reported</a> when summarizing the results of her testing. &#8220;Perhaps this is ok as a theme feature. Perhaps we need to ensure publicity of this feature and documentation. Once people find it and use it the actual process makes sense.&#8221;</p>\n<p>Two Jetpack support personnel joined the conversation to report that the site logo feature has been well tested while used in the plugin and that they receive very few questions about it.</p>\n<p>&#8220;I can&#8217;t recall a single case where a user was confused about how to use the Site Logo, nor a single instance where a user confused it with the Site Icon,&#8221; Kathryn Presner said.</p>\n<p>Several contributors involved in the conversation commented that the feature seemed rushed. Given that nearly every modern website has a logo, this feature is one that is likely to be widely used with theme support. Theme authors will be the ones to add support for a site logo and field questions about how to use it. Based on the user tests, however, a brand new WordPress user with a vanilla site running Twenty Sixteen may be in for a bit of a hunt when trying to upload a logo.</p>\n<p>Schroder pulled the trigger yesterday to include the feature in the upcoming release and it is now available in the first beta <a href="https://wordpress.org/news/2016/02/wordpress-4-5-beta-1/" target="_blank">released last night</a>. If you want to help test, the easiest way is to use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/" target="_blank">WordPress Beta Tester</a> plugin and select “bleeding edge nightlies.&#8221;</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 25 Feb 2016 18:11:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: Automattic Adds AMP Support to WordPress.com, Releases Plugin for Self-Hosted Sites";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51722";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:102:"http://wptavern.com/automattic-adds-amp-support-to-wordpress-com-releases-plugin-for-self-hosted-sites";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6300:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/amp-wpcom-screenshots2.png" rel="attachment wp-att-51747"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/amp-wpcom-screenshots2.png?resize=1025%2C372" alt="amp-wpcom-screenshots2" class="aligncenter size-full wp-image-51747" /></a></p>\n<p>Today WordPress.com <a href="https://en.blog.wordpress.com/2016/02/24/amp-for-wordpress-dot-com/" target="_blank">announced</a> support for <a href="https://www.ampproject.org/" target="_blank">Accelerated Mobile Pages</a> (AMP), Google&#8217;s open source project to improve the experience of the mobile web for publishers. When visitors arrive to a WordPress.com site via a mobile search, posts will load faster than ever before.</p>\n<p>Each post is dynamically generated according to the AMP spec, with /amp/ added to the end of the URL for the mobile version. They&#8217;re also cached in Google&#8217;s cloud infrastructure to reduce loading time. The performance gains are staggering. In early tests, Pinterest&#8217;s engineering team found that <strong>&#8220;<a href="https://engineering.pinterest.com/blog/building-faster-mobile-web-experience-amp" target="_blank">AMP pages load four times faster and use eight times less data than traditional mobile-optimized pages</a>.&#8221;</strong></p>\n<p>What makes AMP pages load so quickly? Google has a <a href="https://www.ampproject.org/docs/get_started/technical_overview.html" target="_blank">strict set of optimizations</a> that are employed to improve mobile loading:</p>\n<ul>\n<li>Allow only asynchronous scripts</li>\n<li>Size all resources statically</li>\n<li>Don’t let extension mechanisms block rendering</li>\n<li>Keep all third-party JavaScript out of the critical path</li>\n<li>All CSS must be inline and size-bound</li>\n<li>Font triggering must be efficient</li>\n<li>Minimize style recalculations</li>\n<li>Only run GPU-accelerated animations</li>\n<li>Prioritize resource loading</li>\n<li>Load pages in an instant</li>\n</ul>\n<p>To see just how fast AMP is, check out the Google search demo at <a href="https://googleblog.blogspot.com/2015/10/introducing-accelerated-mobile-pages.html" target="_blank">g.co/amp</a>.</p>\n<p>Automattic also released a <a href="https://wordpress.org/plugins/amp/" target="_blank">plugin</a> that allows self-hosted WordPress users to take advantage of the mobile performance improvements offered by AMP. The plugin has been tested since October and is currently active on 8,000 installs. For most users, it&#8217;s as easy as installing the plugin and activating it. The default styles are fairly generic but developers can refer to the <a href="https://github.com/Automattic/amp-wp/blob/master/readme.md" target="_blank">documentation on GitHub</a> to further customize AMP styles.</p>\n<p>The Jetpack team is working on getting its publishing-related modules ready for AMP compatibility. In order to take advantage of AMP performance increases, users have to compromise on JS-powered features like Sharing Buttons and Likes.</p>\n<p>&#8220;It’s definitely something on our roadmap, and we’re working on the details and timeline at the moment,&#8221; Jetpack team lead Sam Hotchkiss told the Tavern.</p>\n<p>According to <a href="http://www.niemanlab.org/2016/02/diving-all-in-or-dipping-a-toe-how-publishers-are-approaching-googles-accelerated-mobile-pages-initiative/" target="_blank">NiemanLab&#8217;s survey of newsrooms</a>, publishers that are not running on WordPress are struggling to get on board with AMP, due to the fact that it requires developer resources to implement. This is especially difficult for those that impose JavaScript-based paywalls, as AMP heavily restricts JavaScript.</p>\n<p>AMP allows for paywalls, subscription content, and ads, but for many publishers these will have to be rebuilt to be distributed according to the AMP specifications. At this time, AMP <a href="https://github.com/ampproject/amphtml/blob/325878c6bde7a4bd40d67e8c81b9e599af1039d7/ads/integration-guide.md" target="_blank">does not support “interstitials,”</a> the pop-up ads that obscure content and annoy readers.</p>\n<p>Publishers can opt not to support AMP, but the kicker is that Google may show preference to results that are configured to deliver AMP-powerd posts, simply by virtue of the fact that it already factors page speed into results. The <a href="https://googleblog.blogspot.com/2015/10/introducing-accelerated-mobile-pages.html" target="_blank">AMP demo</a> shows a carousel of AMP-powered posts under Top Stories, but it&#8217;s not yet clear whether this will be the actual implementation.</p>\n<h3>AMP is a Big Win for the Open Web</h3>\n<p>Google is firing back at <a href="https://instantarticles.fb.com/" target="_blank">Facebook’s Instant Articles</a> with the official launch of AMP today. Facebook&#8217;s attempt to speed up mobile viewing is platform-specific and only available within its app. AMP, on the other hand, works anywhere online and is controlled and customized by the publisher.</p>\n<p>In October 2015, WordPress.com was one of the first publishers to partner with Google on this initiative to speed up the mobile web. Paul Maiorana, VP of Platform Services at Automattic, <a href="https://vip.wordpress.com/2015/10/07/mobile-web/" target="_blank">announced the company&#8217;s involvement in the project on the VIP blog</a>:</p>\n<blockquote><p>We believe that open source is one of the most powerful ideas of our generation. We strongly and actively support a free, open internet. We’re very happy to support an open source initiative like AMP, which brings publishers and technology companies together to make a better mobile experience for everyone.</p></blockquote>\n<p>The mobile web is currently a zombie wasteland of bloated, sluggish pages &#8211; many sites are unbearable to browse and users quickly abandon slow-loading pages. The AMP project helps publishers deliver a leaner version of posts. It makes mobile browsing faster for everyone, not just those using a few select apps. As such, it is a victory for the open web.</p>\n<p>For more background on the project with comments from WordPress.com&#8217;s Paul Maiorana, check out video below:</p>\n<div class="embed-wrap"></div>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Feb 2016 22:27:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"Matt: Ten Thousand Hours with Reid Hoffman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46223";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://ma.tt/2016/02/ten-thousand-hours-with-reid-hoffman/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:287:"<p><a href="http://casnocha.com/">Ben Casnocha</a> is an interesting and innovative character in his own right, and <a href="http://casnocha.com/reid-hoffman-lessons">it&#8217;s worth reading his essay slash short book on the years he spent as the right hand man of Reid Hoffman</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Feb 2016 16:17:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"WPTavern: WordCamp Miami Wapuuno Cards Now Available on GitHub";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51699";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wptavern.com/wordcamp-miami-wapuuno-cards-now-available-on-github";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1942:"<p>One of the challenges of organizing a WordCamp is coming up with general swag for the event that will delight attendees, as opposed to filling swag bags with cheap plastic junk. Organizers are also tasked with arranging a gift for speakers. WordCamp Miami, which will be entering its ninth year running in 2017, is well known for creating fun collectibles for attendees and speakers. Last year the team gave <a href="https://twitter.com/dimensionmedia/status/702185356330930176" target="_blank">“WordPress developer” cards</a> as speaker gifts.</p>\n<p>This year organizers created a deck of Wapuu Uno cards, dubbed &#8220;Wapuuno,&#8221; as a gift for speakers. Each card features a different wapuu, most of which were designed for past WordCamps in various locations around the world. Organizer David Bisset created the deck based on open source Wapuus that are publicly available.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/wapuuno-cards.png" rel="attachment wp-att-51701"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/wapuuno-cards.png?resize=1025%2C915" alt="wapuuno-cards" class="aligncenter size-full wp-image-51701" /></a></p>\n<p>I asked Bisset what he would recommend to other WordCamp organizers who are stumped about what to get speakers. &#8220;I don’t think speaker gifts need to be anything meaningful,&#8221; he said. &#8220;Miami does these out of fun, but organizers shouldn’t be pressured to do these things. If they are stumped, sometimes a gift is simply a nice coffee or trinket.&#8221;</p>\n<p>The <a href="https://github.com/dimensionmedia/Wapuuno" target="_blank">Wapuuno cards</a> are now available on GitHub for anyone to download and print. Bisset joked that WordCamp Miami organizers are looking into creating Candy Land style Wapuu cards in 2017 but is hoping that other WordCamp organizers will beat them to it.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Feb 2016 00:03:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WPTavern: 10up Open Sources ElasticPress Plugin for WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51677";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wptavern.com/10up-open-sources-elasticpress-plugin-for-woocommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6465:"<p><a href="https://www.woothemes.com/woocommerce/" target="_blank">WooCommerce</a> is currently the most popular way to add a store to WordPress. Its usage is on the rise and seems to be growing in tandem with global WordPress usage. Wappalyzer estimates a <a href="https://wappalyzer.com/categories/ecommerce" target="_blank">31% marketshare</a> in the e-commerce category and <a href="http://builtwith.com/ecommerce/" target="_blank">BuiltWith has WooCommerce at roughly 29%</a> among other shopping cart technologies. Either way you slice it, WooCommerce accounts for a big piece of the pie.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/woocommerce-marketshare.png" rel="attachment wp-att-51688"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/woocommerce-marketshare.png?resize=1025%2C618" alt="woocommerce-marketshare" class="aligncenter size-full wp-image-51688" /></a></p>\n<p>Store managers are attracted to WooCommerce because of its ease of use and its ecosystem that offers hundreds of free and commercial extensions. The reason many stores are still built on Magento, an open source shopping cart with a more complicated store management interface, is because it was built to handle massive stores with thousands of products and complex searches. WooCommerce is rapidly becoming a more viable option for these types of stores, with continual <a href="https://www.woothemes.com/2016/01/woocommerce-25-dashing-dolphin/" target="_blank">performance improvements</a> and the new open source <a href="http://10up.com/blog/2016/elasticpress-woocommerce-plugin/" target="_blank">ElasticPress WooCommerce</a> extension from <a href="http://10up.com/" target="_blank">10up</a>.</p>\n<p>In 2014 the engineering team at 10up created <a href="https://wordpress.org/plugins/elasticpress/" target="_blank">ElasticPress</a> to improve WordPress search, allow for complex search filters, and allow for cross-blog search within multisite (a feature missing from existing ElasticSearch plugins at the time).</p>\n<p>Taylor Lovett, 10up&#8217;s Director of Web Engineering, said he was surprised by the amount of feedback they received on the project.</p>\n<p>&#8220;The plugin grew from just search to improving WordPress performance by routing slow queries through Elasticsearch,&#8221; Lovett said. &#8220;As such, we continued to iterate on the project, supporting as many WP_Query parameters as possible and making things as developer friendly as possible.&#8221;</p>\n<p>During that time Lovett was traveling to WordCamps around the world talking about the power of ElasticPress. He met other developers who asked what it would take to support WooCommerce queries.</p>\n<p>&#8220;ElasticPress has a very powerful API that allows it to route almost all WordPress functionality through Elasticsearch instead of MySQL,&#8221; Lovett said. &#8220;However, in order to make the plugin really work for WooCommerce, we needed a &#8216;connector&#8217; of sorts. The connector mostly enables Elasticsearch integration in the admin, adds support for indexing ALL post statuses and public post types, and passes appropriate GET parameters to WP_Query in ElasticPress proper formats. ElasticPress tries to support all of WP_Query functionality but there are some holes that the connector needed to fill.</p>\n<p>&#8220;I knew that WooCommerce sites could suffer from performance problems given the complex product/order queries that they run,&#8221; he said. &#8220;As such, we built ElasticPress WooCommerce to solve those problems.&#8221;</p>\n<p>After testing the plugin locally on a store with about 10,000 products and 20,000 orders, 10up found that <strong>&#8220;ElasticPress WooCommerce can easily turn database queries that take 3-4 seconds into Elasticsearch queries that take 30 milliseconds.&#8221;</strong> According to Lovett, the tests included about 20 WooCommerce extensions and the database queries were timed using the Debug Bar, Debug Bar Extender, and Debug Bar ElasticPress.</p>\n<p>ElasticPress WooCommerce provides roughly a 100% data retrieval performance improvement when it comes to filtering products on both the frontend and in the admin. This helps stores render pages faster to capture potential customers while they&#8217;re in the buying mood.</p>\n<h3>Using ElasticPress WooCommerce for Performance Increases with Other Extensions</h3>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/elasticpress-woocommerce.png" rel="attachment wp-att-51691"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/elasticpress-woocommerce.png?resize=1025%2C439" alt="elasticpress-woocommerce" class="aligncenter size-full wp-image-51691" /></a></p>\n<p><a href="https://wordpress.org/plugins/elasticpress-woocommerce/" target="_blank">ElasticPress WooCommerce</a> requires ElasticPress 1.8+ and PHP 5.2.4+. Once those are in place, it is relatively plug-and-play. Lovett said that the only caveat is that it is not guaranteed to support the hundreds of WooCommerce extensions completely. If an extension uses WP_Query in a way that&#8217;s compatible with ElasticPress then it should automatically take advantage of the performance increases.</p>\n<p>&#8220;We try to support as much extension functionality as we can but there is just too much to tackle,&#8221; he said. &#8220;The way those extensions use WP_Query varies. We can’t predict how every extension interacts with WP_Query and don’t have time to test every single one.</p>\n<p>&#8220;Some extensions have no bearing on ElasticPress WooCommerce,&#8221; Lovett said. &#8220;For example, a different payment gateway. Extensions that involve showing/filtering products and orders should test their extensions with the plugin and refer to the ElasticPress documentation to make sure they are only using supported WP_Query parameters.&#8221;</p>\n<p>10up is looking for more developers to test and collaborate on the project, which is hosted on both <a href="https://github.com/10up/elasticpress-woocommerce" target="_blank">GitHub</a> and <a href="https://wordpress.org/plugins/elasticpress-woocommerce/" target="_blank">WordPress.org</a>. The company plans to improve the plugin based on experience with enterprise WooCommerce customers. If you are looking to scale WooCommerce or are currently managing a sluggish store, ElasticPress WooCommerce is one option that you may want to test.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 23 Feb 2016 20:51:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: WordPress Tops Alignable’s Small Business Trust Index";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51635";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wptavern.com/wordpress-tops-alignables-small-business-trust-index";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4128:"<p>In a <a href="https://www.alignable.com/small-business-insights/introducing-alignables-smb-trust-index" target="_blank">SMB trust index survey</a> conducted by Alignable in the fourth quarter of 2015, WordPress ranked as the most trusted of 25 nationally recognized brands used by small business owners. The results were ranked using the (<a href="http://www.netpromotersystem.com/about/measuring-your-net-promoter-score.aspx" target="_blank">Net Promoter System</a>), a trademarked customer loyalty metric that measures promoters against detractors to produce a net trustworthiness score.</p>\n<p>The survey, which was <a href="http://www.bizjournals.com/sanfrancisco/blog/techflash/2016/02/alignable-survey-smb-trust-q4-2015-yelp-wordpress.html" target="_blank">originally reported by the San Francisco Business Times</a>, was roundly disregarded in the WordPress community due to the misuse of the word &#8216;company&#8217; in the Times&#8217; writeup:</p>\n<blockquote><p>For small business owners, WordPress is a well-trusted company, Yelp is a brand in trouble, and Facebook is on a downward path.</p></blockquote>\n<p>Additionally, the wording on the <a href="https://s3.amazonaws.com/alignable/content/Alignable-SMB-Trust-Index-Q4-2015.pdf" target="_blank">ranking graphic</a> seemed to trivialize the results: <em>&#8220;WordPress proves &#8216;free&#8217; doesn&#8217;t always mean &#8216;junk.''&#8221;</em></p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/wordpress-nps-results.png" rel="attachment wp-att-51664"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/wordpress-nps-results.png?resize=1025%2C729" alt="wordpress-nps-results" class="aligncenter size-full wp-image-51664" /></a></p>\n<p>Despite the odd presentation, the results are worth examining, as Alignable surveyed more than 6,000 small business owners across 7,000 communities in North America. WordPress received an NPS of 73, significantly higher than other brands known for website creation: Shopify (29), Godaddy (26), Squarespace (11), Wix (-7), Weebly (-13), and Web.com (-61).</p>\n<p>The footnote on the report explains the relative position changes which are shown on the rankings graphic for brands that were included in the previous quarter&#8217;s survey:</p>\n<blockquote><p>Data represents running, cumulative report of SMB sentiment of vendors and providers from more than 6,000 ratings. Relative position changes from this quarter to the prior quarter were generated from the 25% net new ratings added to the database in the quarter. Alignable members rated these brands on a sliding scale from 0-10. NPS values calculated by subtracting percentage of detractors (brands rated 0-6) from percentage of promoters (brands rated 9-10).</p></blockquote>\n<p>Godaddy fell one point in positioning and Wix and Weebly fell 4 and 8 points respectively. WordPress is new to Alignable&#8217;s SMB index and should have relative position notes included in next quarter&#8217;s survey.</p>\n<p>Although the footnote specifies that the index rates brands, the 25 that are included are clearly companies and products. Any conclusions drawn from rating the general WordPress brand would be somewhat nebulous, given that it&#8217;s not clear if business owners are rating their experiences with the WordPress.com service or the self-hosted software. With the introduction of <a href="http://wptavern.com/early-reviews-show-applications-like-calypso-are-the-future-of-wordpress" target="_blank">Calypso</a>, the gap between the two publishing experiences continues to grow.</p>\n<p>Nevertheless, most of the brands included are also representative of several different products. The scores are more of a general indication of the trustworthiness of the brand name, although creators of the Net Promoter System claim that a high NPS can point toward long-term profitable growth. If you&#8217;re in the business of building websites or applications for clients, it&#8217;s good to know that the trustworthiness of the WordPress brand is ranking high among industry competitors.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Feb 2016 19:53:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:112:"WPTavern: Varying Vagrant Vagrants 1.3.0 Released with Support for MailCatcher and More Virtualization Providers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51643";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:122:"http://wptavern.com/varying-vagrant-vagrants-1-3-0-released-with-support-for-mailcatcher-and-more-virtualization-providers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2774:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/vvv.png" rel="attachment wp-att-51659"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/vvv.png?resize=1025%2C473" alt="vvv" class="aligncenter size-full wp-image-51659" /></a></p>\n<p>Over the weekend, Jeremy Felt released <a href="https://varyingvagrantvagrants.org/2016/02/21/varying-vagrant-vagrants-1-3-0/" target="_blank">Varying Vagrant Vagrants 1.3.0</a>. Although VVV uses <a href="https://www.virtualbox.org/" target="_blank">VirtualBox</a> as its default virtualization provider, this release adds support for Parallels, VMWare Fusion, VMWare Workstation, and Hyper-V in the default Vagrantfile.</p>\n<p>Version 1.3.0 also adds <a href="http://mailcatcher.me/" target="_blank">MailCatcher</a> to the default provisioning. When working in a development environment, you generally don&#8217;t want want to deliver emails from the test site. MailCatcher collects any mail that is sent out and stores it for display. It&#8217;s available in the browser at vvv.dev:1080 in case you need to troubleshoot WordPress core and/or plugins.</p>\n<p>Felt, the project&#8217;s current maintainer, said that he is aiming to push out more incremental releases every three months and hopes to get more developers using the <code>develop</code> branch on GitHub.</p>\n<p>&#8220;A tough thing about marking version numbers on a project like VVV is that all of the various versions of included packages change frequently,&#8221; Felt said. &#8220;We need to do a better job of making it easier to maintain existing packages.&#8221;</p>\n<p>Felt is currently <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/issues/583" target="_blank">soliciting feedback on changing the TLD for test sites</a> in the next version, as Google is attempting to <a href="https://gtldresult.icann.org/application-result/applicationstatus/applicationdetails/1339" target="_blank">gain control of the .dev TLD</a>. If the company were to open it up for public registration, it could cause confusion with test sites. After a brief discussion with VVV users, Felt has narrowed the considerations to .localhost, .test, and .local.</p>\n<p>In addition to a new TLD for test sites, Felt hopes to update packages on <code>vagrant provision</code> in a future release, which should help keep PHP, Nginx, and MySQL updated. He also wants to make it easy to remove the default configurations for WordPress local, trunk, and dev environments that are offered with VVV out of the box.</p>\n<p>For more details on the 23 features and bug fixes in 1.3.0, check out the official <a href="https://github.com/Varying-Vagrant-Vagrants/VVV/blob/1.3.0/CHANGELOG.md" target="_blank">changelog</a>.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Feb 2016 16:02:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Matt: New Yorker on Zen Master Poet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46218";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://ma.tt/2016/02/new-yorker-on-zen-master-poet/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:171:"<p>It&#8217;s never a bad time to <a href="http://www.newyorker.com/magazine/2008/10/20/zen-master">read and learn about the life, work, and poetry of Gary Snyder</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Feb 2016 15:50:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: Jazzy Claire de Lune";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46164";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"https://ma.tt/2016/02/jazzy-claire-de-lune/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:939:"<p><span class="embed-youtube"></span></p>\n<p>I love this version from <a href="http://www.kamasiwashington.com/">Kamasi Washington</a> of Claude Debussy&#8217;s Clair de Lune, or &#8220;light of the moon.&#8221; Here&#8217;s the <a href="https://en.wikipedia.org/wiki/Paul_Verlaine">Paul Verlaine</a> poem that inspired the original composition:</p>\n<blockquote><p>Your soul is a chosen landscape<br />\nWhere charming masqueraders and bergamaskers go<br />\nPlaying the lute and dancing and almost<br />\nSad beneath their fanciful disguises.</p>\n<p>All sing in a minor key<br />\nOf victorious love and the opportune life,<br />\nThey do not seem to believe in their happiness<br />\nAnd their song mingles with the moonlight,</p>\n<p>With the still moonlight, sad and beautiful,<br />\nThat sets the birds dreaming in the trees<br />\nAnd the fountains sobbing in ecstasy,<br />\nThe tall slender fountains among marble statues.</p></blockquote>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 21 Feb 2016 20:07:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Post Status: All things HTTP/2 and HTTPS — Draft podcast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=21371";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://poststatus.com/all-things-http2-and-https-draft-podcast/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2417:"<p>Welcome to the Post Status <a href="https://poststatus.com/category/draft">Draft podcast</a>, which you can find <a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">on iTunes</a>, <a href="http://www.stitcher.com/podcast/krogsgard/post-status-draft-wordpress-podcast">Stitcher</a>, and <a href="http://simplecast.fm/podcasts/1061/rss">via RSS</a> for your favorite podcatcher. Post Status Draft is hosted by Joe Hoyle &#8212; the CTO of Human Made &#8212; and Brian Krogsgard.</p>\n<p><span>HTTPS and HTTP/2 are somewhat intertwined, and a lot has been going on lately in this realm. Google has made a big push to encourage the use of SSL for websites &#8212; including making it a search ranking factor &#8212; and LetsEncrypt and other services are offering new ways to deliver free SSL certificates, securely. And HTTPS is required for HTTP/2, which is making a big splash as well, quickly outpacing SPDY. Today, we’ll talk about what these terms are, and what it means for the web and for WordPress.</span></p>\n<!--[if lt IE 9]><script>document.createElement(''audio'');</script><![endif]-->\n<a href="https://audio.simplecast.com/27370.mp3">https://audio.simplecast.com/27370.mp3</a>\n<p><a href="http://audio.simplecast.com/27370.mp3">Direct Download</a></p>\n<h3>Links</h3>\n<ul>\n<li><a href="https://letsencrypt.org/">Let&#8217;s Encrypt</a></li>\n<li><a href="http://wordpress.tv/2015/12/09/zack-tollman-and-aaron-jorbin-the-future-stack-running-wordpress-with-tomorrows-technologies/">The Future Stack: Running WordPress with Tomorrow&#8217;s Technologies</a></li>\n<li><a href="http://oauth.net/">OAuth</a></li>\n<li><a href="https://http2.github.io/faq/">HTTP/2 FAQs</a></li>\n<li><a href="https://make.wordpress.org/core/2015/09/08/wordpress-and-http2/">WordPress and HTTP/2</a></li>\n<li><a href="https://en.wikipedia.org/wiki/HTTP/2#Software_and_services_supporting_HTTP.2F2">Software and services supporting HTTP/2</a></li>\n<li><a href="http://blog.chromium.org/2016/02/transitioning-from-spdy-to-http2.html">Transitioning from SPDY to HTTP/2</a></li>\n<li><a href="https://wordpress.tv/2015/07/29/zack-tollman-http-2-and-you/">HTTP/2 and You</a></li>\n<li><a href="https://blog.cloudflare.com/introducing-http2/">Introducing HTTP/2</a></li>\n<li><a href="http://www.buzzfeed.com/nickrkm/youre-listening-to-delilah#.wa82qoMyR">You&#8217;re Listening to Delilah</a></li>\n</ul>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 20 Feb 2016 18:20:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Katie Richards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WPTavern: hack.summit() Event for Developers Will Be Live-Streamed February 22-24";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51615";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/hack-summit-event-for-developers-will-be-live-streamed-february-22-24";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2570:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/hack.summit.png" rel="attachment wp-att-51623"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/hack.summit.png?resize=1025%2C375" alt="hack.summit" class="aligncenter size-full wp-image-51623" /></a></p>\n<p><a href="https://hacksummit.org/" target="_blank">Hack.summit()</a> is a unique event for developers that is set to be live-streamed February 22-24, 2016. It is the world&#8217;s largest virtual conference ever assembled, with 64,000 developers registered for last year&#8217;s event. hack.summit() will feature an impressive array of programming language creators and open source contributors and all ticket sales/donations go to support programming non-profits such as Code.org, Code for America, CoderDojo, and Girls Who Code.</p>\n<p>The event focuses on three primary objectives:</p>\n<ul>\n<li>To educate programmers of all languages and skill sets</li>\n<li>To raise money for coding nonprofits</li>\n<li>To encourage mentorship among software developers</li>\n</ul>\n<p>In lieu of traditional ticket sales, hack.summit() attendees are asked to donate to one of the selected coding non-profits. Those who are not financially able to donate can get a free ticket by sharing the event on Twitter or Facebook. Attendees are provided with a unique ticket number after registering, which includes access to the live conference.</p>\n<p>The event heavily promotes mentoring by asking attendees to sign a <a href="https://hackpledge.org/" target="_blank">hack pledge</a> to help mentor the next generation of developers with a minimum of one hour of coding help. The hack pledge video below features stories from programmers who have struggled to master software craftsmanship and those who benefited greatly from mentors:</p>\n<div class="embed-wrap"></div>\n<p>hack.summit() will also host the largest <a href="https://www.koding.com/Hackathon" target="_blank">virtual hackathon</a> in the world. Participants will create a web app using any publicly available API that falls within three general categeries: data visualization, productivity, or gaming. Last year&#8217;s event drew 60,000 coders from more than 900 cities. Participants will compete to win from a $150,000 prize pool.</p>\n<p>If you&#8217;re looking for an interesting non-WordPress event to attend this year, <a href="https://hacksummit.org/" target="_blank">hack.summit()</a> is one of the most accessible with high quality speakers that will expand your technical horizons.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 19 Feb 2016 20:21:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Matt: WordPress NPS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46156";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:36:"https://ma.tt/2016/02/wordpress-nps/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:753:"<blockquote><p>For small business owners, WordPress is a well-trusted company, Yelp is a brand in trouble, and Facebook is on a downward path. Those are some of the findings out today from a survey of 6,000 small business owners from the second half of 2015 conducted by Alignable.</p></blockquote>\n<p><a href="http://www.bizjournals.com/sanfrancisco/blog/techflash/2016/02/alignable-survey-smb-trust-q4-2015-yelp-wordpress.html">You can see the whole thing here</a>. WordPress came in with a NPS of 73, Shopify at 29, Godaddy at 26, Squarespace at 11, Wix at -7, Weebly at -13, Web.com at -61, and Yelp at -66. <a href="http://www.netpromotersystem.com/about/measuring-your-net-promoter-score.aspx">Here&#8217;s how a Net Promoter Score works</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 19 Feb 2016 19:55:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WPTavern: WordPress to Launch Experimental WordCamp Incubator Program";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51599";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wptavern.com/wordpress-to-launch-experimental-wordcamp-incubator-program";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2595:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/02/wordpress-swag.jpg" rel="attachment wp-att-17801"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/02/wordpress-swag.jpg?resize=1024%2C441" alt="photo credit: Huasonic - cc" class="size-full wp-image-17801" /></a>photo credit: <a href="http://www.flickr.com/photos/huasonic/3008912290/">Huasonic</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc/2.0/">cc</a>\n<p>During the 2015 State of the Word address, Matt Mullenweg shared a few stats about the growth of WordPress events around the globe. Last year there were 89 WordCamps with 21,000 attendees across 34 countries. A surprising 60% of the 601 WordCamp organizers were doing it for the first time. More people are getting involved in hosting WordPress events but there are many areas of the world that have yet to experience one.</p>\n<p>The WordPress community team, which provides support and guidance for WordCamps, will be experimenting with bringing events to new locations in 2016. Ordinarily, WordCamps spring up organically from local WordPress communities with active meetups. The new <a href="https://wordpress.org/news/2016/02/experiment-wordcamp-incubator/" target="_blank">WordPress incubator program</a> will bring a WordCamp to three new cities where meetups are not necessarily as well established.</p>\n<p>Jen Mylo outlined the goal of the program in a recent <a href="https://wordpress.org/news/2016/02/experiment-wordcamp-incubator/" target="_blank">post</a> on the WordPress news blog:</p>\n<blockquote><p>The intention of the incubator program is to help spread WordPress to underserved areas through providing more significant organizing support for a first event. In practical terms, this experiment means we’ll be choosing three cities in 2016 where there is not an active WordPress community — but where it seems like there is a lot of potential and where there are some people excited to become organizers — and will help to organize their first WordCamp.</p></blockquote>\n<p>The new WordCamps will be designed as one-day, one-track events that connect the local community and inspire them to establish an ongoing presence. Qualifications for applying are rather loose. Those who have always wanted to get WordPress events going in their city but haven&#8217;t had success organizing meetups are encouraged to apply.</p>\n<p>Applications will be accepted until February 26, 2016, and cities will be chosen by the end of March. Where do you think the world needs a new WordCamp?</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 19 Feb 2016 18:23:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: Happy Joe to Shut Down Non-Profit Organization in Favor of For-Profit Venture";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51587";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/happy-joe-to-shut-down-non-profit-organization-in-favor-of-for-profit-venture";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3100:"<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/11/VeteransDayFeaturedImage.png" rel="attachment wp-att-33378"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/11/VeteransDayFeaturedImage.png?resize=638%2C285" alt="Veterans Day Featured Image" class="size-full wp-image-33378" /></a>photo credit: <a href="https://www.flickr.com/photos/soldiersmediacenter/6343590279/">The U.S. Army</a> &#8211; <a href="http://creativecommons.org/licenses/by/2.0/">cc</a>\n<p>Happy Joe founder James Dalman <a href="https://www.happyjoe.org/shutting-down/" target="_blank">announced</a> this week that the non-profit organization will be shutting down. Dalman started the organization to help veterans find employment opportunities in WordPress and other web technologies. He plans to continue with a modified version of the Happy Joe mission set up as a for-profit venture.</p>\n<p>After operating for the past two years as a tax-exempt 501(c)(3) organization, Dalman no longer has the desire to continue raising funds. Happy Joe pulled in $80,000 in 2015 through corporate sponsorships and private donations, but Dalman started 2016 with no funds to carry through.</p>\n<p>&#8220;The reality is we can’t continue on a zero budget and I can’t continue to work for free,&#8221; he said. &#8220;While it would be simple to say dedicate more time to asking companies and people for funding, it’s not in my heart to do so anymore. I believe in being self-sufficient and not a burden on others.&#8221;</p>\n<p>Lack of funding is the primary reason the organization is shutting down, but Dalman also struggled with the perception of non-profits. With organizations like the <a href="http://www.nytimes.com/2016/01/28/us/wounded-warrior-project-spends-lavishly-on-itself-ex-employees-say.html?_r=0" target="_blank">Wounded Warrior Foundation receiving negative press for excessive spending</a>, Dalman said the growing skepticism of non-profits made his job more challenging.</p>\n<blockquote><p>There’s no doubt that accountability and transparency is critical and Happy Joe has strived to excel in this. But the wrong assumptions about what a non-profit can do and the skepticism and lack of trust also complicates the mission for teams operating in the non-profit space for the future. Battling these challenges keeps us from doing the work that truly matters.</p></blockquote>\n<p>Dalman&#8217;s non-profit post-mortem also cites negative stereotypes about veterans, expectations of rewards or kickbacks for donations, and his own leadership as contributing factors to his decision to shut the organization down.</p>\n<p>&#8220;We will now operate as a for-profit venture and will shift our focus from web tech training to building a talent marketplace where veterans can get freelance work and be mentored in growing a business,&#8221; Dalman said.</p>\n<p>The new for-profit venture will drop some of the programs that Happy Joe offered previously but will continue to assist veterans in seeking employment and developing entrepreneurial skills.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Feb 2016 22:29:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: GitHub Introduces Issue and Pull Request Templates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51565";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/github-introduces-issue-and-pull-request-templates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2547:"<p>Last week GitHub <a href="http://wptavern.com/github-responds-to-letter-from-open-source-project-maintainers" target="_blank">responded to a letter from open source project maintainers</a> with apologies for the lack of communication and lack of attention to feedback regarding issue management. Because contributions are the lifeblood of open source projects, maintainers are requesting additional features for issues and pull requests that would help make contributions more meaningful.</p>\n<p>The discussions surrounding the <a href="http://wptavern.com/open-source-project-maintainers-confront-github-with-open-letter-on-issue-management" target="_blank">&#8220;Dear GitHub&#8221; letter</a> challenged the company to start tackling the low-hanging fruit on the list of improvements that would benefit open source projects. Yesterday GitHub <a href="https://github.com/blog/2111-issue-and-pull-request-templates" target="_blank">introduced issue and pull request templates</a> as the first of many promised improvements.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/github-issues-templates.png" rel="attachment wp-att-51570"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/github-issues-templates.png?resize=1025%2C622" alt="github-issues-templates" class="aligncenter size-full wp-image-51570" /></a></p>\n<p>Issue templates can now be created by adding a file called <a href="https://help.github.com/articles/creating-an-issue-template-for-your-repository/" target="_blank">ISSUE_TEMPLATE.md</a> to the root directory. Project maintainers can use this template to ensure that crucial information, such as expected behavior, reproduction steps, and version tested, is included in the bug report. This is the kind of information that saves time for everyone involved in testing and improving the software.</p>\n<p>Pull request templates follow the same file-naming pattern (PULL_REQUEST_TEMPLATE.md). These new templates can be added to either the root directory of the repository or the new .github/ directory. GitHub recommends placing CONTRIBUTING.md, ISSUE_TEMPLATE.md, and PULL_REQUEST_TEMPLATE.md files in the .github/ folder to reduce clutter in the root directory.</p>\n<p>GitHub&#8217;s new issue and pull request templates are a positive step toward reaffirming the company&#8217;s commitment to supporting open source projects. Maintainers are still hoping to see a voting system implemented to help declutter the +1&#8217;s from issues queues.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Feb 2016 18:57:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Critical Security Vulnerability Discovered in Elegant Themes Products";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51546";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/critical-security-vulnerability-discovered-in-elegant-themes-products";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2237:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/elegant-themes.jpg" rel="attachment wp-att-51562"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/elegant-themes.jpg?resize=674%2C300" alt="elegant-themes" class="aligncenter size-full wp-image-51562" /></a></p>\n<p><a href="http://www.elegantthemes.com/" target="_blank">Elegant Themes</a> emailed its customers last night to inform them of a critical security vulnerability affecting a large segment of its product line.</p>\n<blockquote><p>An information disclosure vulnerability was found in the Divi Builder (included in our Divi and Extra themes, as well as our Divi Builder plugin) which resulted in the potential for user privilege escalation. If properly exploited, it could allow registered users, regardless of role, on your WordPress installation to perform a subset of actions within the Divi Builder, including the ability to manipulate posts.\n</p></blockquote>\n<p>In addition to the Divi Builder, the vulnerability was also found in the Divi, Extra, and Divi 2.3 (legacy) themes and the Boom and Monarch plugins. It was privately disclosed and promptly patched by Elegant Themes with the help of a third-party security vendor. No known exploit attempts have been made.</p>\n<p>Updating the themes and plugins will fix the vulnerability but the patches were created only for the most recent versions. Legacy theme customers now have an upgrade path, including a version that doesn&#8217;t add new functionality. Customers who are not ready to update are advised to turn registration off on their sites, as untrusted users increases the possibility of privilege escalation. Elegant Themes also recommends installing its Security Patcher plugin and utilizing the CloudProxy WAF from Sucuri, which has virtually patched the vulnerability.</p>\n<p>As of 2015, Elegant Themes has more than 300,000 customers. Given the severity of the vulnerability, the company is also making the updates available for free to all expired accounts via its updater plugin. Customers who have forgotten their login credentials can contact Elegant Themes to have the latest versions of the themes and plugins sent to them.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Feb 2016 16:02:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"WPTavern: WP Pusher 2.1.0 Offers Tighter Integration with GitHub and Bitbucket";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51525";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://wptavern.com/wp-pusher-2-1-0-offers-tighter-integration-with-github-and-bitbucket";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4285:"<p>WP Pusher is on a relentless mission to make it effortless for WordPress developers to connect their plugin and theme repositories hosted on GitHub and Bitbucket. <a href="http://blog.wppusher.com/wp-pusher-2-1-0-has-landed/" target="_blank">Version 2.1.0</a> of the plugin eliminates the requirement to manually create a token with GitHub and introduces 1-click authentication via OAuth. This update makes setting up the plugin on a new site relatively painless.</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr">It''s going to be a lot easier to setup GitHub with a token in the next version of <a href="https://twitter.com/WP_Pusher">@WP_Pusher</a>! <a href="https://t.co/CK9Dyo0zle">pic.twitter.com/CK9Dyo0zle</a></p>\n<p>&mdash; Peter Suhm (@petersuhm) <a href="https://twitter.com/petersuhm/status/695232521462759424">February 4, 2016</a></p></blockquote>\n<p></p>\n<p>In order to make the on-boarding process easier for new users, Peter Suhm, creator of WP Pusher, had to build a service that uses OAuth to handle authentication.</p>\n<p>&#8220;It’s not possible to do OAuth from a WordPress plugin without shipping a secret token together with the code (which you do not want to do),&#8221; Suhm said. &#8220;So we built a small service, on our own server, that handles all the communication with GitHub and Bitbucket. We don’t store anything. Your GitHub and Bitbucket tokens are not stored on our servers.&#8221;</p>\n<p>After determining that OAuth would be one of the safest ways to manage this, Suhm reached out to GitHub and they suggested the approach of building a small service to perform authentication. He&#8217;s now exploring different ways he can make both the code and service available to other developers.</p>\n<p>&#8220;The whole infrastructure is built using the Laravel PHP framework and their excellent <a href="https://github.com/laravel/socialite" target="_blank">Socialite</a> package,&#8221; Suhm said. &#8220;I&#8217;m thinking about either open sourcing the service (when it&#8217;s been online for a bit) or writing an in-depth tutorial on how to set up a similar thing. I also thought about offering the service to other WordPress plugin authors, since OAuth can be used for so many things, including Twitter, Facebook, Instagram and even WordPress.com authentication.&#8221;</p>\n<p>Version 2.1.0 also adds a new Push-to-Deploy checkbox, which removes the requirement of manually setting up a webhook on GitHub or Bitbucket. WP Pusher now sets up the webhook automatically in the background.</p>\n<p>&#8220;Setting up automatic updates is something I&#8217;ve gotten many support requests about,&#8221; Suhm said. &#8220;Now, all you have to do is check a checkbox and your plugin or theme will be updated every time you push a change to GitHub.&#8221;</p>\n<p>Now that the plugin uses OAuth, it can be even more tightly integrated with GitHub and Bitbucket in future updates.</p>\n<p>&#8220;The next big thing I want to work on, which is now possible, is to allow users to select and install a plugin or theme directly from GitHub &#8211; with just one click,&#8221; Suhm said.</p>\n<p>The improvements offered in WP Pusher 2.1.0 make it even easier for new users to start deploying WordPress themes and plugins directly from GitHub without all the hassle of manually creating tokens and setting up webhooks. However, users still need a basic knowledge of Git in order to use the product. Suhm continues to offer <a href="http://wptavern.com/wp-pusher-launches-free-git-crash-course-for-wordpress-developers" target="_blank">free Git education for WordPress developers</a> in hopes of expanding his customer base.</p>\n<p>&#8220;WordPress devs are definitely starting to get interested in Git, as I had more than 1,000 developers sign up to my video course,&#8221; he said.</p>\n<p>WP Pusher is free to use for open source code hosted in public repositories. Since Suhm doesn&#8217;t track his users, he doesn&#8217;t have exact numbers for how many sites are using the plugin. Although he would not disclose how many licenses he has sold, he estimates that approximately 1,000 developers have installed WP Pusher. Suhm&#8217;s customers range from small freelancers to agencies to large universities.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Feb 2016 21:52:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"WPTavern: TGM Plugin Activation Team Releases Custom Generator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51498";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wptavern.com/tgm-plugin-activation-team-releases-custom-generator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3104:"<p>The development team behind TGM Plugin Activation <a href="http://tgmpluginactivation.com/2016/02/12/custom-tgmpa-generator/" target="_blank">released its new generator</a> last week. The popular tool is a PHP library that allows WordPress developers to require or recommend plugins for a theme or plugin. It essentially helps walk WordPress users through installation and activation of plugin dependencies in the admin.</p>\n<p>Bundling a bunch of plugin-type functionality into a theme is generally discouraged, but authors still need a way to recommend additional extensions. The <a href="https://github.com/TGMPA/TGM-Plugin-Activation" target="_blank">TGMPA</a> library is a solution to this problem and is recommended by Themeforest, CodeCanyon, and the WordPress.org Theme Review Team as an alternative to bundling.</p>\n<p>The <a href="http://tgmpluginactivation.com/download/" target="_blank">new generator</a> addresses an issue that theme authors were running up against while using TGMPA and publishing themes to WordPress.org. The Theme Check plugin would often spit out feedback preventing the theme from passing all the checks: <em>“You are only allowed to use add_theme_page(), please remove the call to add_submenu_page(),” or “You are only supposed to use one text-domain.”</em></p>\n<p>According to TGMPA contributor Juliette Reinders Folmer&#8217;s, authors reported having performed a search-and-replace that resulted in fatal errors because it would often change some strings that should not have been changed. This process repeated anytime TGMPA needed to be updated.</p>\n<p>The Custom TGMPA generator asks the author to input the type of extension where TGMPA is being used, as well as the avenue of distribution. Authors then add the text domain, function prefix, and the theme/plugin name. The generator automatically outputs a download of the latest stable version of TGMPA with the customized strings already in place.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/tgmpa-custom-generator.png" rel="attachment wp-att-51507"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2016/02/tgmpa-custom-generator.png?resize=1025%2C322" alt="tgmpa-custom-generator" class="aligncenter size-full wp-image-51507" /></a></p>\n<p>The Custom TGMPA generator is the result of a <a href="https://github.com/TGMPA/TGM-Plugin-Activation/pull/460" target="_blank">discussion</a> with WordPress.org representatives regarding issues that continually pop up during theme reviews. The generator provided an acceptable solution that doesn&#8217;t require bypassing the Theme Check Plugin. Authors who experience any bugs with the generator can log them with the TGMPA team in the project&#8217;s GitHub <a href="https://github.com/TGMPA/TGM-Plugin-Activation/issues" target="_blank">issues</a> queue. The team is still trucking on the <a href="https://github.com/TGMPA/TGM-Plugin-Activation/issues/394" target="_blank">3.0 milestone</a> which aims to make TGMPA updatable independent of the plugin/theme that ships it.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Feb 2016 19:14:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: GitHub Responds to Letter from Open Source Project Maintainers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51478";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://wptavern.com/github-responds-to-letter-from-open-source-project-maintainers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3404:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/github-octocat.jpg" rel="attachment wp-att-42456"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/github-octocat.jpg?resize=857%2C400" alt="github-octocat" class="aligncenter size-full wp-image-42456" /></a></p>\n<p>Last month a group of open source project maintainers <a href="http://wptavern.com/open-source-project-maintainers-confront-github-with-open-letter-on-issue-management" target="_blank">confronted GitHub with an open letter</a> of complaints regarding issue management. They were frustrated by a lack of communication from GitHub and a lack of features for managing issues. More than 1700 maintainers of open source projects, including several projects related to WordPress, have <a href="https://docs.google.com/spreadsheets/d/1oGsg02jS-PnlIMJ3OlWIOEmhtG-udTwuDz_vsQPBHKs/edit#gid=290603204" target="_blank">signed</a> the letter so far.</p>\n<p>GitLab, a competing code hosting service, <a href="http://wptavern.com/gitlab-courts-open-source-project-maintainers-with-response-to-dear-github-letter" target="_blank">responded to the letter</a> almost immediately with a new GitLab issue that outlined every concern mentioned in the original &#8220;Dear GitHub&#8221; letter. The new initiative is focused on &#8220;<a href="https://gitlab.com/gitlab-org/gitlab-ce/issues/8938" target="_blank">making GitLab the best place for big open source projects</a>.&#8221;</p>\n<p>GitHub, on the other hand, took roughly a month to reply. The company&#8217;s staff forked the letter and drafted <a href="https://github.com/bkeepers/dear-github/blob/master/README.md" target="_blank">a reply</a> containing an apology and a promise to address their concerns:</p>\n<blockquote><p>Dear Open Source Maintainers,</p>\n<p>We hear you and we&#8217;re sorry. We&#8217;ve been slow to respond to your letter and slow to respond to your frustrations.</p>\n<p>We&#8217;re working hard to fix this. Over the next few weeks we&#8217;ll begin releasing a number of improvements to Issues, many of which will address the specific concerns raised in the letter. But we&#8217;re not going to stop there. We&#8217;ll continue to focus on Issues moving forward by adding new features, responding to feedback, and iterating on the core experience. We&#8217;ve also got a few surprises in store.</p>\n<p>Issues haven&#8217;t gotten much attention from GitHub these past few years and that was a mistake, but we&#8217;ve never stopped thinking about or caring about you and your communities. However, we know we haven&#8217;t communicated that. So in addition to improving Issues, we&#8217;re also going to kick off a few initiatives that will help give you more insight into what&#8217;s on our radar. We want to make sharing feedback with GitHub less of a black box experience and we want to hear your ideas and concerns regularly.</p></blockquote>\n<p>GitHub closed the letter saying that the company would be in touch next week. Although no concrete changes have been announced, GitHub&#8217;s reply indicates that the company will be improving its communication and features to better serve open source projects and their communities. Hopefully this public exchange is a turning point for code hosting and collaboration services to prioritize features that open source project maintainers need.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 16 Feb 2016 22:46:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:93:"WPTavern: Customizer Responsive Preview and Selective Refresh to be Merged Into WordPress 4.5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51451";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:103:"http://wptavern.com/customizer-responsive-preview-and-selective-refresh-to-be-merged-into-wordpress-4-5";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3307:"<p>Last week the feature plugin decision deadline closed and WordPress core contributors approved Responsive Preview and Selective Refresh for merge. The merge deadline is Wednesday, February 17, followed by the first beta next week.</p>\n<p>Both feature approved for 4.5 extend the customizer to improve live previews. A new version of the <a href="https://wordpress.org/plugins/customize-partial-refresh/" target="_blank">Customize Partial Refresh</a> plugin is now available and ready for testing. This new feature makes previews more instant using JavaScript, as opposed to reloading the entire preview for each setting change. Developers who build customizer settings will be able to use a <strong>postMessage</strong> transport, which is much faster than the default <strong>refresh</strong> transport. The plugin&#8217;s description page includes a video demonstrating the faster previews with an example of adding smilies to the site title.</p>\n<div class="embed-wrap"></div>\n<p>According to the meeting <a href="https://make.wordpress.org/core/2016/02/11/core-dev-chat-notes-for-feb-10/" target="_blank">summary</a> written by 4.5 release deputy Adam Silverstein, the most important question to answer is whether <a href="https://github.com/xwp/wp-customize-partial-refresh/issues/22" target="_blank">widgets should opt-in for selective refresh by default</a>. Weston Ruter <a href="https://github.com/xwp/wp-customize-partial-refresh/issues/22#issuecomment-182594185" target="_blank">recommended</a> that they require opt-in for widget selective refresh in 4.5 and warn developers that it will be set to default in the next release.</p>\n<p>The <a href="https://core.trac.wordpress.org/ticket/31195" target="_blank">new responsive preview feature</a> is part of the <a href="https://wordpress.org/plugins/customizer-ui-experiments/" target="_blank">Customizer UI Experiments</a> plugin. It adds buttons to the customizer controls footer which allow users to preview site responsiveness while making changes. The buttons have icons for desktop, tablet, and phone-sized devices with portrait orientation.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/customize-device-preview.gif" rel="attachment wp-att-51464"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/customize-device-preview.gif?resize=1025%2C537" alt="customize-device-preview" class="aligncenter size-full wp-image-51464" /></a></p>\n<p>According to Silverstein&#8217;s <a href="https://make.wordpress.org/core/2016/02/11/core-dev-chat-notes-for-feb-10/" target="_blank">summary</a> of last week&#8217;s meeting, WordPress 4.5 will not ship with WP REST API endpoints as previously planned:</p>\n<blockquote><p>The REST API team’s proposal is to merge the four main endpoints when they are ready, and they are not ready for 4.5. As such, no endpoints are targeted for WordPress 4.5.</p></blockquote>\n<p>Discussion regarding the future of the REST API and <a href="https://make.wordpress.org/core/2016/02/05/rest-api-meeting-summary-feb-4/#comment-29217" target="_blank">what constitutes an MVP</a> continues on <a href="https://make.wordpress.org/core/tag/rest-api/" target="_blank">make.wordpress.org/core</a> and in the #core-restapi channel on Slack.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 15 Feb 2016 21:30:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: Solar in Sunshine State";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://ma.tt/2016/02/solar-in-sunshine-state/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1104:"<p>One of my favorite movies is <a href="http://www.imdb.com/title/tt0427944/">Thank You for Smoking</a>, the Jason Reitman&#8217;s film that looks at the world through the lens of a tobacco lobbyist. It&#8217;s fiction, though. <a href="https://www.rollingstone.com/politics/news/the-koch-brothers-dirty-war-on-solar-power-20160211">This real-life Rolling Stone look at what is going on with rooftop solar in Florida and the big utilities</a> has quotes that could have easily been in the movie.</p>\n<p>Facing an amendment that would open up one of the sunniest states to solar power, the utilities created a competing amendment called &#8220;Rights of Electricity Consumers Regarding Solar Energy Choice,&#8221; which, as you might imagine, is extraordinarily unfriendly to anyone who wants solar panels on their home. Why the confusing title?</p>\n<blockquote><p>Bascom insisted there was no intention to mislead. &#8220;It would defy all logic,&#8221; she tells <em>Rolling Stone</em>. &#8220;Why would we confuse ours with one that does not have public support?&#8221;</p></blockquote>\n<p>&nbsp;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 15 Feb 2016 19:35:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Post Status: WordPress in the Enterprise — Draft podcast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=21170";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"https://poststatus.com/wordpress-in-the-enterprise-draft-podcast/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1512:"<p>Welcome to the Post Status <a href="https://poststatus.com/category/draft">Draft podcast</a>, which you can find <a href="https://itunes.apple.com/us/podcast/post-status-draft-wordpress/id976403008">on iTunes</a>, <a href="http://www.stitcher.com/podcast/krogsgard/post-status-draft-wordpress-podcast">Stitcher</a>, and <a href="http://simplecast.fm/podcasts/1061/rss">via RSS</a> for your favorite podcatcher. Post Status Draft is hosted by Joe Hoyle &#8212; the CTO of Human Made &#8212; and Brian Krogsgard.</p>\n<p><span>Today, Joe and Brian discuss WordPress in the “enterprise,&#8221; starting with a discussion on what the enterprise even is. We discuss WordPress’s value to the enterprise, and what enterprise level companies are looking for in their technology solutions.</span></p>\n<p><span>The conversation turns into conspiracy theories and joking around by the 50 minute mark, so don’t be intimidated by the hour and fifteen minute timestamp.</span></p>\n<a href="https://audio.simplecast.com/26691.mp3">https://audio.simplecast.com/26691.mp3</a>\n<p><a href="http://audio.simplecast.com/26691.mp3">Direct Download</a></p>\n<h3>Links</h3>\n<ul>\n<li><a href="http://www.niemanlab.org/2015/05/quartz-is-an-api-the-path-ahead-for-the-business-site-thats-reshaping-digital-news/">Quartz is an API</a></li>\n<li><a href="http://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/">What is Code?</a></li>\n<li><a href="https://make.wordpress.org/marketing/">Make WordPress Marketing</a></li>\n</ul>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 13 Feb 2016 15:41:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Katie Richards";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WPTavern: Rescue Themes is For Sale";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51436";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wptavern.com/rescue-themes-is-for-sale";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2313:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/rescue-themes.png" rel="attachment wp-att-51442"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/rescue-themes.png?resize=1025%2C390" alt="rescue-themes" class="aligncenter size-full wp-image-51442" /></a></p>\n<p>After two years in business, <a href="https://twitter.com/jamigibbs" target="_blank">Jami Gibbs</a> is <a href="https://blog.jamigibbs.com/rescue-themes-is-available-for-purchase-2a8a947031b8#.r36mtcvqy" target="_blank">selling Rescue Themes</a>. The niche theme shop specializes in products for nonprofits, politics, breweries, and e-commerce websites.</p>\n<p>Gibbs did not publicly disclose how much revenue the shop is generating, but <a href="https://rescuethemes.com/" target="_blank">Rescue Themes</a> has seven products available on Themeforest ranging in price from $16-$59. She also has several free plugins and two free themes (<a href="http://wptavern.com/gateway-a-free-wordpress-theme-built-on-the-foundation-framework" target="_blank">Gateway</a> and <a href="http://wptavern.com/politics-a-free-wordpress-theme-for-political-campaigns" target="_blank">Politics</a>) listed on WordPress.org.</p>\n<p>&#8220;This decision hasn’t come lightly and I’ve had many sleepless nights wrestling over it,&#8221; Gibbs said in her post announcing that the shop is for sale. &#8220;Rescue Themes has done quite well for me and I admit that I feel a little sad letting it go but I’ve come to a point where the time I have to dedicate to it has dwindled as new projects and opportunities take over my day. It would pain me infinitely more seeing it go adrift than it would to hand over the keys to someone else.&#8221;</p>\n<p>After enlisting the help of the professional theme reviewers at the Themereview.co service, Gibbs began building all of her products with WordPress standards in place. With Themeforest as her primary distribution avenue, she was one of the few WordPress sellers making a difference by providing standards-compliant products.</p>\n<p>Gibbs is looking for a buyer who will make positive contributions to the WordPress community, continue support for her current customers, and continue to distribute the current products under the GPL license.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 12 Feb 2016 20:04:46 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WPTavern: Bluehost Open Sources Script Used to Update 2.5 Million WordPress Sites";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51421";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/bluehost-open-sources-script-used-to-update-2-5-million-wordpress-sites";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3125:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/bluehost.png" rel="attachment wp-att-51424"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/bluehost.png?resize=843%2C403" alt="bluehost" class="aligncenter size-full wp-image-51424" /></a></p>\n<p>During the 2015 State of the Word address, Matt Mullenweg highlighted <a href="https://www.bluehost.com/" target="_blank">Bluehost</a>&#8216;s recent efforts to update its customers&#8217; outdated WordPress sites. After finding that 80% of their WordPress installations were not on the latest version, Bluehost wrote a Perl script that uses WP-CLI to update sites, even those running on versions as old as 1.0.2. The company successfully updated more than 2.5 million customer sites.</p>\n<p>According to Bluehost representative <a href="https://twitter.com/mikehansenme" target="_blank">Mike Hansen</a>, the script took about a month to run through all of the outdated sites. First, it checks the status of a site, then backs everything up, and then runs all updates via WP-CLI. The script then checks the site to see if everything is good. If anything breaks, it restores the backup. Hansen said that they execute it on a cron job so that it doesn&#8217;t require a person to run it. The company uses the script to continually update WordPress sites without customers having to initiate updates.</p>\n<p>Bluehost used the script to successfully update 99% of the WordPress sites on its platform. After the first major update, fewer than 0.007% of customers reported issues and WordPress-related technical support requests have been reduced by 18%.</p>\n<p>&#8220;Our support requests are down partly because we are not getting as many hacked sites on super old versions of WordPress,&#8221; Hansen told the Tavern. &#8220;Things break less often. Plugin and theme incompatibilities have been reduced.</p>\n<p>&#8220;Initially we were considering upgrading core, then plugins, then themes but we realized that doing them all at once was the most successful route,&#8221; he said.</p>\n<p>Bluehost&#8217;s initiative was a huge vote of confidence for WordPress updates, as they have now been battle tested by the host all the way back to very old versions. When 4.3 was released, Bluehost was able to do 2.6 million core updates, along with plugins and themes.</p>\n<p>Yesterday the company open sourced the WP Tools update script under the GPL license. It&#8217;s now <a href="https://github.com/bluehost/wp-tools" target="_blank">available on GitHub</a> for any person or hosting company to use or modify. The script received its <a href="https://github.com/bluehost/wp-tools/pull/1" target="_blank">first pull request</a> in less than 24 hours. With contribution from other hosts working to make the internet more secure, WP Tools has the potential to become even more reliable for ongoing WordPress updates.</p>\n<p>Check out the video below to see the part of the State of the Word where Matt Mullenweg tells Bluehost&#8217;s story of updating outdated WordPress sites:</p>\n<div class="embed-wrap"></div>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 12 Feb 2016 18:54:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: WordCamp US 2017 + 2018";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46137";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"https://ma.tt/2016/02/wordcamp-us-2017-2018/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:609:"<p>When we chose Philadelphia to host the first ever WordCamp US, it was actually for two years, <a href="https://2016.us.wordcamp.org/">they&#8217;ll be hosting again this year December 2-4</a>. We&#8217;re going to pick the host city and group for 2017 and 2018 in the next few months, though, and in fact the <a href="https://2016.us.wordcamp.org/2016/01/08/applications-for-the-wordcamp-us-2017-host-city-now-open/">applications are open and closing in a few weeks</a>. If you think your city and team have what it takes to wow the world with the best WordPress event, please put your hat in the ring!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 12 Feb 2016 00:06:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WPTavern: WordCamp Europe Assembles 130-Person Volunteer Team";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51276";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wptavern.com/wordcamp-europe-assembles-130-person-volunteer-team";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2410:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/wceu-2016.png" rel="attachment wp-att-49423"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/12/wceu-2016.png?resize=1025%2C407" alt="wceu-2016" class="aligncenter size-full wp-image-49423" /></a></p>\n<p>The call for volunteers for WordCamp Europe <a href="https://2016.europe.wordcamp.org/the-call-for-volunteers-for-wordcamp-europe-is-now-closed/" target="_blank">closed this week</a> and organizers announced that they have assembled a team of more than 100 people to help run the event. The 130 applicants represent 33 countries from Europe and beyond, with the highest numbers from the United States, Germany, The Netherlands, Italy, and Romania.</p>\n<p>The event will be held in Vienna at the end of June where the team will finally gather together in person. In the meantime, organizers are navigating the challenges of working remotely with a volunteer team that is spread across the globe.</p>\n<p>&#8220;For now we are using Zapier with Trello as connected apps and lots of well organized columns,&#8221; said Milan Ivanović, one of the leaders of the Volunteer Team. &#8220;We contacted every volunteer via email manually and soon we will use WordPress Slack for general communication before and on the day of the event.&#8221;</p>\n<p>WordCamp Europe organizers have high expectations for cities that apply to host future events. Potential cities will need to have a volunteer team with experience at previous events. This year&#8217;s event nearly doubles the number of volunteers from last year, expanding the pool of capable hands for 2017.</p>\n<p>&#8220;The biggest challenge would definitely be meeting everybody&#8217;s wishes while assigning roles,&#8221; Ivanović said. &#8220;Next week we will do a final check of the venue and start working on assigning roles.&#8221;</p>\n<p>Volunteers are expected to arrive a few days ahead of the event for a briefing and to familiarize themselves with the venue.</p>\n<p>&#8220;Leading up to the event we are going to have weekly meetings and try to cover as much as we can to prepare as best as possible,&#8221; Ivanović said. &#8220;Volunteers are investing dozens of hours into this event. I also want to emphasize that we are not covering the costs, but there is something so noble and beautiful when volunteering.&#8221;</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Feb 2016 18:53:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WPTavern: BuddyPress 2.5 Will Add Customizable Emails via a New BP Email API";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51390";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"http://wptavern.com/buddypress-2-5-will-add-customizable-emails-via-a-new-bp-email-api";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3256:"<p>BuddyPress 2.5 <a href="https://buddypress.org/2016/02/buddypress-2-5-0-beta-1/" target="_blank">beta 1</a> was released this week with a list of new features and improvements to test, including a brand new <a href="https://buddypress.trac.wordpress.org/ticket/6592" target="_blank">BP Email API</a>. The new API allows users to easily customize any email that BuddyPress sends, without having to leave the admin or write any code.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/email-customizer.png" rel="attachment wp-att-51399"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/email-customizer.png?resize=991%2C575" alt="email-customizer" class="aligncenter size-full wp-image-51399" /></a></p>\n<p>The <a href="https://buddypress.trac.wordpress.org/ticket/6592" target="_blank">ticket</a> to overhaul BuddyPress emails was opened six months ago and has received more than 100 replies with feedback and patches from multiple contributors. BuddyPress lead developer Paul Gibbs spearheaded this initiative and summarized the outcome when introducing the new API on his blog:</p>\n<blockquote><p>In a nutshell, we moved emails into a custom post type (BuddyPress’ first!) with a supporting taxonomy (BuddyPress’ second!), devised a HTML email template with Customizer integration, and wrote a new API to manage how we represent emails internally and how we send them (goodbye, <a href="https://developer.wordpress.org/reference/functions/wp_mail/" target="_blank">wp_mail</a>!).</p></blockquote>\n<p>Gibbs has been writing plugins for the platform for the past seven years. He started with <a href="https://wordpress.org/plugins/welcome-pack/" target="_blank">Welcome Pack</a>, a plugin that allowed community admins to customize welcome emails to enhance the new user experience. His experience building and maintaining the now defunct Welcome Pack led him to work on improving BuddyPress&#8217; core email handling.</p>\n<p>&#8220;With retrospect, adding customizable emails to Welcome Pack is what killed my interest in that plugin,&#8221; Gibbs said. &#8220;It was such a lengthy, painful slog to get the customization working and nicely implemented (I picked the wrong approach), that when it was finally done, so was I!&#8221;</p>\n<p>Gibbs&#8217; work on this ticket makes emails in BuddyPress 2.5 much easier to edit than they ever were in his Welcome Pack plugin. The new Emails custom post type allows administrators to edit the content of the plugin&#8217;s 16 default emails directly in the admin. The email template can also be edited in the customizer at <strong>Appearance >> Emails</strong> with controls to change the header, body, and footer background colors, and text size/colors.</p>\n<p>The new email capabilities allow BuddyPress community managers to personalize their sites&#8217; communication without having a lot of technical knowledge. It&#8217;s a significant improvement over the generic stock emails previously sent by the plugin.</p>\n<p>According to the <a href="https://buddypress.trac.wordpress.org/roadmap" target="_blank">project roadmap</a>, the 2.5 milestone is now 96% complete and the official release is expected in three weeks.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Feb 2016 15:28:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Matt: Lent This Year: Buying Things";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46113";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://ma.tt/2016/02/lent-this-year-buying-things/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1781:"<p>Today is Ash Wednesday and the start of Lent, when typically Catholics give something up, or try to form a new habit, for about six weeks. Many of my friends who aren&#8217;t Catholic do the same, it&#8217;s a good practice to try to go without something in your life you take for granted. It can make you reexamine assumptions, take you out of your comfort zone, or make you appreciate the thing you gave up much more when you return to it. Also it&#8217;s just a bit more fun when you do it with friends. <img src="https://s.w.org/images/core/emoji/72x72/1f600.png" alt="😀" class="wp-smiley" /></p>\n<p>Last few years I&#8217;ve given up:</p>\n<ul>\n<li>2013: Meat.</li>\n<li>2014: <a href="https://ma.tt/2014/03/no-smartphone-for-lent/">Smartphones</a>. (This was hard!)</li>\n<li>2015: I meditated every day using <a href="http://www.calm.com/">Calm</a>.</li>\n</ul>\n<p>This year I&#8217;ve been thinking about what I take for granted, and surveyed friends for what their suggestions would be. One of the things that I&#8217;m pretty bad at is buying too many things, especially gadgets. I&#8217;m pretty good at clearing out old ones so it doesn&#8217;t get too cluttered, but I definitely have a habit of getting the latest USB gadgets on Amazon, shirts from <a href="http://www.kitandace.com/">Kit &amp; Ace</a>, workout stuff from <a href="http://shop.lululemon.com/">Lululemon</a>, <a href="http://www.nike.com/us/en_us/c/nikeid">shoes I don&#8217;t need</a>, etc.</p>\n<p>So the thing I&#8217;m going to give up this year is shopping or buying any material things. I&#8217;m also going to take the opportunity to try and reduce the stuff I do have in my life to things that <a href="http://tidyingup.com/books/the-life-changing-magic-of-tidying-up-hc">spark joy</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 10 Feb 2016 19:03:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WPTavern: Learn How to Test WordPress Core Patches with VVV on Mac OS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51369";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wptavern.com/learn-how-to-test-wordpress-core-patches-with-vvv-on-mac-os";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2764:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/vvv-test-patches.png" rel="attachment wp-att-51374"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/vvv-test-patches.png?resize=1025%2C385" alt="vvv-test-patches" class="aligncenter size-full wp-image-51374" /></a></p>\n<p>Testing patches is one way that both developers and non-developers can contribute to WordPress without writing any code. It&#8217;s a valuable service that keeps things moving along in tickets and helps patches make their way into core.</p>\n<p>The most challenging part of testing patches is getting your testing environment set up properly. The WordPress core handbook has <a href="https://make.wordpress.org/core/handbook/testing/patch/" target="_blank">instructions for using Grunt to test patches</a>, but they&#8217;re not easy to follow if you happen to be a more visual learner.</p>\n<p>Yesterday Ryan Boren published a tutorial for <a href="https://make.wordpress.org/flow/2016/02/08/testing-patches-with-vvv-on-mac-os/" target="_blank">testing patches with VVV on Mac OS</a>, complete with screenshots at every step. The bulk of the instructions cover establishing a test environment with <a href="https://github.com/Varying-Vagrant-Vagrants/VVV" target="_blank">VVV</a>, which requires you to install Vagrant, install Virtualbox, initialize Vagrant, install Git, and finally install VVV. Applying a patch and reverting it after testing is probably the easiest part of the entire process.</p>\n<p>Boren&#8217;s tutorial is one of the clearest and easiest to follow, because it helps you visualize what success looks like at every step. If you want to add mobile testing into the mix while testing patches, check out his <a href="https://make.wordpress.org/core/2015/03/16/mobile-patch-testing-with-vvv-and-xip-io/" target="_blank">post</a> on using VVV and <a href="http://xip.io/" target="_blank">xip.io</a>. Boren explained how he goes through tickets with patches that change UI and adds mobile and desktop screenshots of his testing.</p>\n<p>&#8220;These screenshots hasten UI feedback and usually reveal visual glitches on mobile that are then patched up, making our mobile experience that little bit better,&#8221; he said. &#8220;Until that blue sky someday when I can apply patches to a patch server with a tap, I’ve found VVV and xip.io to be the easiest way to do localhost testing of patches from mobile devices.&#8221;</p>\n<p>The process of setting up a test environment is the most time-consuming aspect of testing patches, but once you have it in place, it&#8217;s easy to apply them. Have you found an easier way to test patches with support for mobile devices? Let us know in the comments.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 10 Feb 2016 12:30:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: Automattic Launches Components with 5 New Starter Themes Based on Underscores";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51347";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/automattic-launches-components-with-5-new-starter-themes-based-on-underscores";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3366:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/components.png" rel="attachment wp-att-51349"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2016/02/components.png?resize=1025%2C429" alt="components" class="aligncenter size-full wp-image-51349" /></a></p>\n<p>Automattic&#8217;s team of theme developers <a href="http://themeshaper.com/2016/02/09/introducing-components/" target="_blank">announced the release of Components</a> today along with a suite of themes that extend the popular <a href="http://underscores.me/" target="_blank">Underscores</a> starter theme for specific use cases. These include a classic blog, modern blog, portfolio, magazine, and business theme. The new <a href="http://components.underscores.me/" target="_blank">Components</a> website lets theme authors download a theme that includes reusable components tailored to each theme type.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/components-portfolio.png" rel="attachment wp-att-51354"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/components-portfolio.png?resize=1025%2C625" alt="components-portfolio" class="aligncenter size-full wp-image-51354" /></a></p>\n<p>Each theme includes general layout structures and templates to support the specific type of theme. For example, when you select the &#8216;Portfolio&#8217; starter theme, your download will include the following:</p>\n<ul>\n<li>A portfolio post type, courtesy of Jetpack, added to all the necessary files</li>\n<li>A grid portfolio view</li>\n<li>A single column blog template</li>\n<li>A sliding panel for navigation, social menu, and also widgets</li>\n<li>A large featured image with full-width script</li>\n</ul>\n<p>There&#8217;s not much to see once the theme is installed, because it&#8217;s just a starting point designed to save time when building layouts and templates. Automattic&#8217;s theme team used its collective knowledge of developing hundreds of themes in order to create these five starter themes with the bare basics required for presenting content via these five major theme categories.</p>\n<p>Components was inspired by the community behind Underscores, according to Automattic theme wrangler David Kennedy. Developers using the starter theme often offered contributions that were beyond the scope of a simple starter theme.</p>\n<p>&#8220;While maintaining and improving Underscores, we always see great pull requests from the community that we turn away because the contributions end up being too specific for a normal starter theme,&#8221; Kennedy said. &#8220;Many of those additions would have been perfect in most themes. Now, some of them have a home in a project that zeroes in on a certain kind of user with each theme it builds.&#8221;</p>\n<p>The project&#8217;s goal is to provide a &#8220;more modular, pattern-based approach to theme development.&#8221; Even if you&#8217;re not building with Underscores, many of the <a href="https://github.com/Automattic/theme-components/tree/master/components" target="_blank">theme components</a> included in this project can be easily reused elsewhere as theme building blocks. The components library is open source and <a href="https://github.com/Automattic/theme-components" target="_blank">available on GitHub</a> for anyone to fork.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 10 Feb 2016 05:19:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Matt: The Problem with Phone Calls";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=46103";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://ma.tt/2016/02/the-problem-with-phone-calls/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1117:"<p><a href="http://www.theatlantic.com/technology/archive/2015/08/why-people-hate-making-phone-calls/401114/">The Atlantic does an in-depth look on why it&#8217;s much less pleasant to have phone calls than it used to be</a>. It&#8217;s true, but there are also some great alternatives that I&#8217;ve been having luck with recently. <a href="https://www.messenger.com/">Facebook Messenger</a> has a built-in audio (and video!) calling system that is okay. <a href="http://www.apple.com/mac/facetime/">Facetime</a> isn&#8217;t just for video, you can also make audio calls with it and they sound amazing (something I learned from Kanye, true story). Many times I&#8217;ll try a phone number in Facetime first just in case the person uses an iPhone. And finally <a href="http://www.skype.com/en/">Skype</a> still works pretty well even if its clients are a bit heavy. If I&#8217;m able to be at a computer (all of these work on computer as well as apps), <a href="http://www.amazon.com/gp/product/B00D4LBOV6">this Sennheiser USB headset</a> sounds great, blocks background noise, and people say that I sound clear.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Feb 2016 23:58:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:109:"Post Status: Complete coverage should not be a requirement for core inclusion of WordPress REST API endpoints";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=20957";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://poststatus.com/wordpress-rest-api-should-be-iterative/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:19055:"<p>The <a href="http://wp-api.org/">WordPress REST API</a> is at a bit of a crossroads. There is a proposal on the table by the core team of four contributors — Ryan McCue, Rachel Baker, Daniel Bachhuber, and Joe Hoyle — to ship endpoints to WordPress core iteratively. There is a pushback on this proposal by WordPress Project Lead and co-founder Matt Mullenweg.</p>\n<p>The API should be iterative, and should not require complete admin parity to be included, as Matt has proposed.</p>\n<h3>The state of what’s already in core, and what’s pending</h3>\n<p>The REST API infrastructure is already in core, having been included in WordPress 4.4. The infrastructure provides just that, an underlying infrastructure, to offer plugins a suite of base functionality to utilize, making the development of their own RESTful features easier.</p>\n<p>The infrastructure allows developers to get a huge head start for creating their own REST API endpoints and functionality. The endpoints are how a third party client or developer would actually interact with the API, and the endpoints for WordPress core functionality are what are in debate.</p>\n<p>Every piece of WordPress functionality — data that can be read, created, updated, or deleted — would ideally be available to the WordPress REST API, so that anything possible in WordPress is also possible via the API, and therefore also possible from a third party application interacting with the API.</p>\n<p>However, creating this complete coverage is unrealistic in the current WordPress development structure, and should not be necessary for shipping initial endpoints to WordPress Core.</p>\n<p>The proposal from the core REST API team is to begin by shipping four core WordPress objects: posts (meaning the posts table, which includes all post types), terms, comments, and users. These four core objects have been developed as endpoints, are well tested, and are ready for core. There are kinks to work out, but overall, they are an excellent starting point.</p>\n<p>Matt’s proposal is that the API should not ship in core, with any endpoints, until complete “wp-admin coverage” is available: meaning that until all actions a user can make in the WordPress admin can be achieved via the API, then it shouldn’t go into core. He said in a <a href="https://wordpress.slack.com/archives/core-restapi/p1454626846001168">meeting about the API</a>, to firm up his proposal, that there should be, &#8220;no partial endpoints in core. let’s design a complete API, not half-do it and foist it on millions of sites.&#8221;</p>\n<p>The primary areas not covered by the API currently are as follows: widget management and display, menu management and display, theme and plugin management, multisite management, and site options management.</p>\n<p>So Matt would like to see each of these endpoints be developed and battle tested before any endpoints ship in core. I agree with the REST API team that the first four objects should take priority, and should go in before these other objects are ready. The remaining objects should each be feature plugins of their own, and go in over time, as they are ready, without delaying the four core objects currently under review.</p>\n<h3>Many use cases covered</h3>\n<p>Posts, terms, comments, and users endpoints make up practically all WordPress content. This means that a huge swath of use cases for the API are covered with these four objects.</p>\n<p>Matt’s thinking that a core WordPress REST API should have all or nothing coverage is a false dichotomy. Applications like <a href="https://developer.wordpress.com/calypso/">Calypso</a> — a WordPress admin replacement based on WordPress.com’s own and separate REST API — are, I believe, the exception for usage of the REST API, not the rule. I believe most people that would take advantage of the REST API’s core inclusion are going to use parts of it only, and I believe most of what they’ll be seeking is content related, versus site management.</p>\n<p>The WordPress admin is exhaustive: it’s pretty much anything and everything one would want to do in WordPress. Custom admins that would utilize the REST API are unlikely to completely mimic the current admin; if they were to do so, it’d be difficult to see the point of making such an application interface, versus just using the tried and true default. I’m certain <em>some</em> new full implementations of the admin will show up (similar to Calypso), but I don’t think it’ll be a common use case.</p>\n<p>More likely, even custom admins would mostly be in the business of manipulating content — specifically catering content editing experiences for a specific type of website — and would be satisfied creating their own custom endpoints for other site management tasks until those endpoints are available through feature plugins or in core itself.</p>\n<p>For tasks such as custom front-end websites that are decoupled from WordPress, the WordPress REST API is immediately useful, using the four proposed objects. <a href="https://make.wordpress.org/core/2016/02/05/rest-api-meeting-summary-feb-4/#comment-29219">As K. Adam White said</a>, delaying the endpoints that are ready, “will effectively block a significant group of potential adopters coming from external platforms.”</p>\n<h3>The value of core inclusion, verses keeping endpoints in the plugin</h3>\n<p>Core inclusion of endpoints is a stamp of approval that the endpoints are ready for prime time. Organizations that would use the API for bespoke applications would prefer to know that the endpoints will be ready and available for the long term, and keeping endpoints out of core is a sign — intended or not — that things can change, and will prevent adoption that is important for WordPress’s growth.</p>\n<p>Whereas, <a href="http://journal.rmccue.io/340/progressive-enhancement-with-the-wordpress-rest-api/">a procedure of iterative development</a>, vertically focused by endpoint, can be a signal of readiness provided by the WordPress core team, essentially saying that those endpoints in core are stable and will maintain WordPress’s well known commitment to backward compatibility, while those endpoints in the feature plugin may be stable, but are subject to change.</p>\n<h3>Iteration has been good for WordPress</h3>\n<p>Iteration has been paramount to nearly all WordPress features, and it doesn’t make sense why it wouldn’t be a part of the REST API’s core inclusion.</p>\n<p>In a meeting about the status of the API, Matt Mullenweg said, “I know it’s a minority opinion, but I would be pretty skeptical of merging a partial API into core, I think it would do a lot more damage than benefit.” I fail to understand what kind of damage including these endpoints would cause.</p>\n<p>Matt <a href="https://ma.tt/2016/02/chicken-and-eggs/">has insinuated</a> that the API as-is would be like shipping a car with no wheels, and I vehemently disagree with the analogy. I think the API is more like a Prius, and the goal is a Tesla. It’s a hybrid, with partial but important coverage, that betters the web (or the environment, for the car analogy). It’s not full coverage (like the fully electric Tesla), but it’s better than nothing (gas guzzler!). Okay, enough analogies, because honestly those don’t help that much. But the API as-is is certainly not a wheel-less car. It’s a perfectly drivable and nice car, it’s just not yet fully the car of tomorrow.</p>\n<p>Iteration and WordPress have gone hand in hand for ages. Almost every feature I can think of in WordPress has iterated over time, from the initial release: the Customizer, WordPress media management, custom post types, menu management, and more. It’s important to ship features that work, but that doesn’t mean they have to be exactly what you envision. WordPress itself is far from perfect, yet it’s available for download. Every lead developer could tell you dozens of things they’d like to improve, but they’re perfectly fine shipping new releases without every one of those new features.</p>\n<h3>Vertically integrated API support</h3>\n<p>Let’s do a mental exercise on the difference between building horizontal and vertical support in the API. This isn’t how one would really build an API, but it’s how we’ll envision calculating support for it.</p>\n<p>If you envision the WordPress dashboard, there are many paths you can take. Every top level admin tab is available to you: Add new post, visit the settings page, choose a theme, etc. The REST API cannot currently mimic every action you can take. I would define horizontal support as visiting the admin, identifying each potential action one step away from that first view, and creating that functionality with the REST API. You’d have a lot more endpoints, but the endpoints would be incomplete — and one layer deep.</p>\n<p>The next step, if working horizontally, would be to take each new view you just visited, based on the previous action, and do it again. This would cover <em>a lot more</em> functionality. Change widget order, move menu items around, delete comments, etc. But there are yet further levels you can take each of these screens. However, say the initial screen had 12 possible events, and now each of those 12 has 12 possible events, you now have 144 events to mimic in the API, but you still have layers to go before you have complete support of any particular fully fledged task.</p>\n<p>If you continue that process, you’ll be attacking support horizontally, and you’ll be at it for a long time.</p>\n<p>Now, let’s think vertically. Let’s choose an end goal: like publish a blog post. Okay, now let’s go back to the admin. This time, we’re going to enable support for adding new posts with the API; that’s one action, and we’re going to ignore other possible actions that don’t have to do with adding a post.</p>\n<p>On our next screen, we have new options, but not all of them are explicitly about publishing a post. However, many of these options are important to publishing a post: information like assigning an author (users), and putting the post into a category (terms). So we’re going to do what we need to do with each of these things that enables us to better support posting. </p>\n<p>Okay, so we can now publish a post via the API, and we’ve also enabled baseline support for stuff that posts expect. The next step in the flow may be that someone would comment on that post. So we’re going vertically through the process. We’re providing complete coverage for these steps. And it gets more complicated than what I’ve said so far. Posts could have meta data, or be password protected, or they might be multiple post types. </p>\n<p>Each of these creates new considerations we must account for to have complete vertical coverage of the process of publishing a post. We haven’t even touched managing site settings or other functionality that doesn’t apply to publishing a post. But as we realize the stuff that interacts with this most important task of publishing content, we begin to form a minimum viable product for our API, to know what we need to ship to fully and well support all things posts with the API. You may still take 144 steps, but at the end, you’ll have more coverage of fewer things, versus light coverage of all things.</p>\n<p>This is what the REST API team has done with these four objects. Posts, terms, users, and comments are the content processing experience in WordPress. It’s a fully fledged API experience, without shortcuts. There are challenges of course, and room to improve, but from top to bottom the process of content creation and manipulation is part of the API.</p>\n<p>As the REST API team have said in various channels during this debate, the non-supported endpoints are mostly isolated from the publishing experience. Supporting posts is co-dependent on supporting the author of the post, and the terms for the post. Supporting the settings screens for the website, or managing themes and plugins, or managing widget areas are not co-dependent on the post experience.</p>\n<p>These other verticals are important, and it is everyone’s goals to create broad, horizontal support of WordPress functionality. But it should be done one vertical feature at a time, and we shouldn’t wait to ship something that is near ready for prime time until we’ve supported absolutely everything. For one, the API is useful to many people <em>right now</em>, but also, the API, unless the entire development strategy of WordPress changes, will <em>never</em> be caught up to support every WordPress feature.</p>\n<h3>Truly “complete coverage” would require API-first driven development</h3>\n<p>For the WordPress REST API to truly have “complete coverage” of WordPress features, then the API would have to be the first consideration when building a new feature. This wouldn’t be a bad thing! But it’s not the way WordPress development works right now.</p>\n<p>Stripe is a great example. When you hear a developer talk about Stripe, the popular merchant processor, the first thing they’ll say is how good the API is. Well, that’s because Stripe <em>is</em> the Stripe API. No feature ships unless it started with API coverage.</p>\n<p>Developers love working with Stripe, because anything that can be accomplished with Stripe is accomplished with the API. With WordPress, the REST API team is running to catch up with core development; core development is not centrally focused around the REST API.</p>\n<p>And as long as core development operates outside the scope of API-first, then the API will always be running to catch up, and the smaller team surrounding API development will never maintain pace with core.</p>\n<p>WordPress already learned this lesson with unit testing. For years, unit testing was nice to have, but not required for commit. Today, WordPress has unit testing coverage of <a href="http://scotty-t.com/coverage/index.html">less than 50%</a>, even though all new commits require tests. Unit testing, though now a first class citizen to WordPress development, is still catching up.</p>\n<p>I’m not saying whether or not WordPress should be developed API-first, but I am saying that Matt’s goal of complete coverage <em>before shipping</em> would just mean the API will never ship, because it will <em>never</em> have complete coverage with the current development strategy.</p>\n<h3>The importance of adoption, and design for the majority</h3>\n<p>It was recently pointed out that the REST API infrastructure is only used by 20 plugins. It makes it appear as if it’s not an important WordPress feature, and that sentiment is wrong.</p>\n<p>Consider nearly any other software. I’ll use MailChimp as an example this time. Loads of people use Mailchimp. Mailchimp has a REST API, and I use it for Post Status. My implementation is not one of their official integrations, which they noted they have 845 of <a href="https://poststatus.com/category/planet/feed/">in their 2015 report</a>. Mine is just me interacting with their API — only trackable by counting total API calls.</p>\n<p>Well, Mailchimp has millions of users, and those millions of user accounts sent over 204 billion emails in 2015. A fraction of those users (I assume) are responsible for more than 29 billion calls to Mailchimp’s API, either through custom interactions (like me), or through one of the 845 official Mailchimp integrations. It really doesn’t matter that there are only 845 integrations with Mailchimp’s API; because the impact of those integrations and the developers otherwise interacting with the API had huge implications that make Mailchimp a more attractive service.</p>\n<p>The second <a href="https://wordpress.org/about/philosophy/">core philosophy</a> of WordPress is to “design for the majority.” It says, “Many end users of WordPress are non-technically minded. They don’t know what AJAX is, nor do they care about which version of PHP they are using.” And while this is true, it doesn’t mean that technical features don’t benefit the majority, even if they aren’t directly interacting with them.</p>\n<p>The WordPress REST API is an invisible feature to most users, but it also will eventually impact nearly all users of WordPress. Like Mailchimp and Stripe, the WordPress REST API can and will impact the overall experience of using WordPress itself. Especially as third parties create gateways for interaction with millions of WordPress installs via the API, the API will be very much for the majority. But it will always be the kind of situation where a small number of integrations are responsible for a large number of interactions.</p>\n<p>We should not base our decision making process for including the API in core on how many plugins are currently supporting the API. We should base our decision making on the potential impact developers can have developing applications with WordPress via the REST API, by utilizing the power in the API — power that can be utilized to improve publishing for everyone.</p>\n<h3>The time for the WordPress REST API is now</h3>\n<p>The time for the WordPress REST API is now. The API is not complete, but it is ready. This is <a href="https://ma.tt/2010/11/one-point-oh/">step one</a>. There are <a href="https://make.wordpress.org/core/2016/02/05/rest-api-meeting-summary-feb-4/">real issues</a> to be resolved with the first four objects, but the first four objects should not sit on the sidelines, excluded from WordPress core, because “complete coverage” doesn’t yet exist.</p>\n<p>There is a capable and willing team driving the WordPress REST API. We all owe our gratitude to Ryan McCue, Rachel Baker, Daniel Bachhuber, Joe Hoyle, and the other contributors that have worked tirelessly — many of them for many years — to make the WordPress REST API a reality.</p>\n<p>We should not take these efforts for granted. A contributor’s time is finite, and everyone that’s worked hard on the API could have spent that time on other things. While time spent shouldn’t be our metric for including a feature in core, we should consider it now. This team has worked for a long time, all along asking for others to provide feedback, and at the 11th hour a vocal (and powerful) minority have decided to throw considerable roadblocks at their efforts.</p>\n<p>The WordPress REST API is a good feature for WordPress to have. REST APIs are a staple of modern web applications. The endpoints proposed for core inclusion is a reasonable next step after the infrastructure that <a href="https://poststatus.com/wordpress-4-4/">went in WordPress 4.4</a>. Whether these first four objects are ready for 4.5, or get postponed until 4.6 isn’t a huge deal; they should be ready before they are merged. But they should not be sidelined until the fantasy of complete coverage is met.</p>\n<p>The inclusion of the WordPress REST API should be iterative, smart, and focused. It shouldn’t be all or nothing. It should be now.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Feb 2016 21:03:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:103:"WPTavern: WP REST API Team Releases Version 2 Beta 12, Seeks Feedback from WordPress’ Lead Developers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51322";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:109:"http://wptavern.com/wp-rest-api-team-releases-version-2-beta-12-seeks-feedback-from-wordpress-lead-developers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6785:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/wp-rest-api.jpg" rel="attachment wp-att-43000"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/wp-rest-api.jpg?resize=1025%2C469" alt="wp-rest-api" class="aligncenter size-full wp-image-43000" /></a></p>\n<p>The WP REST API team <a href="https://make.wordpress.org/core/2016/02/09/wp-rest-api-version-2-0-beta-12/" target="_blank">released version 2 beta 12</a> today. Daniel Bachhuber highlighted the breaking changes in the release that developers will want to digest before updating. This includes the removal of meta endpoints from the primary plugin into its own feature plugin, <a href="https://wordpress.org/plugins/rest-api-meta-endpoints/" target="_blank">now available on WordPress.org</a>.</p>\n<p>In a <a href="http://wptavern.com/wordpress-contributors-look-for-a-path-forward-for-the-wp-rest-api#comment-143820" target="_blank">comment</a> on our coverage of the continuing discussion, WP REST API team member <a href="https://twitter.com/joe_hoyle" target="_blank">Joe Hoyle</a> clarified the team&#8217;s position on the endpoints&#8217; readiness for core:</p>\n<blockquote><p>For the record, the REST API Team support further iteration on the existing endpoints before being merged into core. That could mean waiting for the WordPress.com API team to use those endpoints in production, or gathering more usage feedback from others. I am strongly against merging anything before it’s been well-proven and well-tested.</p>\n<p>The proposal by the team was to include the 4 content endpoints when they are ready. We had a lengthly overview as to the progress of those endpoints, more details on what we feel is left to be done can be seen at the <a href="https://github.com/wp-api/wp-api/issues?q=is%3Aopen+is%3Aissue+milestone%3A2.0" target="_blank">issues queue for the 2.0 milestone</a>.</p>\n<p>Why these endpoints specifically? Because they are co-dependent for the most part. Shipping Posts without support for Taxonomies would not be that useful.</p></blockquote>\n<p>Hoyle also cautions that pursuing full coverage of wp-admin is a monumental task that could take several more years:</p>\n<blockquote><p>Going for development of _all_ functionality (somewhere around 8-10 total data routes) should not be underestimated. It’s taken somewhere around a year and a half to get the current 4 to where they are now, and that was with 2 years prior art from Version 1.</p>\n<p>As someone who has been in the weeds of that implementation for a while now, I cannot over over-stress just how tricky trying to retrofit a consistent, coherent interface on 13 years of organically grown code and ideas can become. I’m looking forward to being part of the writing the implementation for the remaining (and majority) of functionality, however I don’t want to stop users and developers benefitting from what is already being built for another [several] years.</p></blockquote>\n<p>Hoyle emphasized that the team is not proposing merging the existing endpoints now, but he believes they are getting very close.</p>\n<p>With the release of v2 beta 12, Bachhuber urged WordPress lead developers and committers to offer official feedback in hopes of building a consensus. Given the disagreements in the <a href="http://wptavern.com/wp-rest-api-delayed-contributors-facing-gridlock" target="_blank">recent meeting</a>, it&#8217;s clear that WordPress contributors have not been on the same page as far as what constitutes core readiness for the project.</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Right about now seems like a good time to get official feedback on WP REST API from <a href="https://twitter.com/WordPress">@wordpress</a>''s lead developers and committers. Just sayin''</p>\n<p>&mdash; Daniel Bachhuber (@danielbachhuber) <a href="https://twitter.com/danielbachhuber/status/697067292782235648">February 9, 2016</a></p></blockquote>\n<p></p>\n<p>Feedback from contributors is starting to trickle in. WordPress core committer Jeremy Felt shared his thoughts in a <a href="https://jeremyfelt.com/2016/02/09/thoughts-on-merging-the-wp-rest-api-plugin/" target="_blank">post</a> on his blog today:</p>\n<blockquote><p>I’m in favor of the REST API team’s proposal to merge the endpoints for the primary objects in WordPress—posts, comments, users, terms—when they’re ready.</p>\n<p>When the endpoints for these objects are ready, I would like to see them merged early in a release cycle.</p>\n<p>With these primary endpoints in, front end workflows can immediately start to take advantage. This is something groups have been doing for years with custom code already. Getting these groups to use the same structure is valuable.</p></blockquote>\n<p>Core committer Weston Ruter summarized his opinion in a tweet:</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr"><a href="https://twitter.com/danielbachhuber">@danielbachhuber</a> I''m for iterative inclusion of REST API endpoints, advising clients to make use of feature detection.</p>\n<p>&mdash; Weston Ruter ⚡ (@westonruter) <a href="https://twitter.com/westonruter/status/697088319423778816">February 9, 2016</a></p></blockquote>\n<p></p>\n<p>The plugin is moving forward with regular betas while the discussion continues. Developers who are using the API in beta will need to continue to follow the project closely, as the latest beta makes changes to available features. 10up developer Eric Mann tweeted some of <a href="https://twitter.com/EricMann/status/697111525979328512" target="_blank">his challenges in using the API in beta</a>:</p>\n<blockquote><p>My client installed the REST API before it included post meta. We had to build a bunch of custom work to support meta. Then the REST API updated to include meta and broke our integration. I spent a chunk of hours refactoring to compensate so we could update. Now, apparently, the REST API is pulling that meta support out and putting it in a separate plugin. Yet people still criticize me for saying I&#8217;m wary of placing too much dependency on the stability of the API.</p></blockquote>\n<p>Joe Hoyle is currently crowdsourcing stats on <a href="https://docs.google.com/spreadsheets/d/1V-9s0U407iOR1II6yWOqBboMe9M6J7oeOJmwxpOvd9E/edit#gid=0" target="_blank">projects that are using the WP REST API v2 in production</a>. Developers who have stepped up to use the API have had to be nimble in accommodating its rapid development. At this time, the WP REST API team agrees that further iteration on the existing endpoints will be necessary before merging them into core. Continued feedback from developers with projects that use the API will be critical for demonstrating that the API has been well tested.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Feb 2016 20:33:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:83:"WPTavern: WordPress Theme Review Team Recommends Authors Start Keeping a Change Log";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51297";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wptavern.com/wordpress-theme-review-team-recommends-authors-start-keeping-a-change-log";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2723:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/writing.jpg" rel="attachment wp-att-51302"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/writing.jpg?resize=1025%2C472" alt="photo credit: Green Chameleon" class="size-full wp-image-51302" /></a>photo credit: <a href="https://stocksnap.io/photo/8Y0EDX4VP9">Green Chameleon</a>\n<p>Last April, WordPress Theme Review Team member Jose Castaneda <a href="http://wptavern.com/do-wordpress-org-themes-need-a-changelog" target="_blank">proposed that the team adopt a standard change log format</a>. Theme authors are not yet required to keep a change log but the general consensus is that it&#8217;s a good practice that benefits users.</p>\n<p>Castaneda <a href="https://wordpress.slack.com/archives/themereview/p1452621691006215" target="_blank">revived the topic of change logs</a> during the team&#8217;s most recent meeting, saying he hopes this will be the year that they can finally standardize the readme.txt file and take action on the change log-related trac tickets. This would require action on <a href="https://meta.trac.wordpress.org/ticket/45" target="_blank">a meta trac ticket</a> to add change logs to the WordPress.org theme listing tabs and <a href="https://core.trac.wordpress.org/ticket/22810" target="_blank">a core ticket</a> that would expose the change log to users in the WordPress admin.</p>\n<p>Castaneda <a href="https://make.wordpress.org/themes/2016/02/08/making-a-changelog-work-for-you/" target="_blank">posted</a> some basic recommendations as a first step towards educating theme authors on the proper format for writing a change log:</p>\n<ul>\n<li>Listing versions in reverse-chronological order (newest on top)</li>\n<li>One sub-section per version</li>\n<li>Group changes made per version</li>\n<li>Don’t dump commit logs (if using version control)</li>\n<li>Emphasize deprecations</li>\n</ul>\n<p>Even though a change log is not yet exposed in wp-admin, theme authors can still write one for users who are willing to do a bit of looking before updating. It&#8217;s especially important for things like changes to CSS selectors, the removal or addition of features, and anything that might cause child themes to break.</p>\n<p>The theme review team is currently <a href="https://wordpress.slack.com/archives/themereview/p1452622051006226" target="_blank">focused on fixing its review process</a>, so pursuing the necessary tickets for a change log is not a pressing item on the agenda. When the team gets time to follow through on making change logs happen for WordPress.org themes, authors who already have one in place will be positioned to display them to their users.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Feb 2016 17:06:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WPTavern: WordPress Contributors Look for a Path Forward for the WP REST API";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=51252";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"http://wptavern.com/wordpress-contributors-look-for-a-path-forward-for-the-wp-rest-api";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8205:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/path-trees.jpg" rel="attachment wp-att-51293"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2016/02/path-trees.jpg?resize=1025%2C500" alt="photo credit: Valeriy Poltorak" class="size-full wp-image-51293" /></a>photo credit: <a href="https://stocksnap.io/photo/087EFF0277">Valeriy Poltorak</a>\n<p>Over the weekend, discussion continued surrounding the direction of the WP REST API, as both Matt Mullenweg and Ryan McCue took to their WordPress blogs to clarify statements from <a href="http://wptavern.com/wp-rest-api-delayed-contributors-facing-gridlock" target="_blank">last week&#8217;s status meeting</a>. Differences of opinion are driving a heated debate about what constitutes a goalpost for the API&#8217;s readiness for core.</p>\n<p>In a post titled &#8220;<a href="https://ma.tt/2016/02/chicken-and-eggs/" target="_blank">Chicken and Egg</a>,&#8221; Mullenweg addressed the recent WP REST API discussion while sharing an anecdote from a book that covers history from the mid-90s hip-hop era.</p>\n<blockquote><p>I love the idea of Questlove realizing the song was missing something, and going back to the booth to keep working on it until it resonated with his target audience. A song that doesn’t stand up on its own wouldn’t be any better when bundled as part of an album. (Or Samsung would have the most popular apps on Android.) Fans hear the care and quality of each track, and they become super-fans.</p></blockquote>\n<p>Mullenweg relates it to considerations when building products for the web:</p>\n<blockquote><p>There’s this tension in everything we produce. Where’s the line to tread between <a href="https://ma.tt/2010/11/one-point-oh/" target="_blank">1.0 is the loneliest</a> and <a href="http://theleanstartup.com/principles" target="_blank">a minimum viable product</a>? Or is it about a <a href="http://theleanstartup.com/principles" target="_blank">minimum lovable product</a>? Are we building a car with no air conditioning or a car with no wheels?</p>\n<p>&#8216;Pivot&#8217; has become passé, but it’s much worse to assume that distribution will solve something core to your product that isn’t working.</p></blockquote>\n<p>Mullenweg <a href="https://wordpress.slack.com/archives/core-restapi/p1454630772001445" target="_blank">mentioned the same car analogy</a> during the meeting last week. In response to a commenter who asked for more clarification on how the analogy applies to the REST API, Mullenweg said the following:</p>\n<blockquote><p>If you want a good heuristic to use generally: there were decades of cars, millions of vehicles and drivers, before they had air conditioning. The core value proposition of a car is transportation, AC just helps you get there more comfortably. You didn’t need a car to get AC, you could have it in your house. AC might cause you to chose one car over another, but you probably wouldn’t walk or ride a horse if the car didn’t have AC, you’d just roll down the windows.</p></blockquote>\n<p>This begs the question, what constitutes wheels? Contributors to this discussion are divided on whether or not the existing endpoints are ready to be merged into core. The WP REST API team members, many of whom are already successfully using the API in production, believe that the endpoints are ready now. The current state of the API offers the ability to get content in and out of WordPress, opening it up for easier communication with other platforms, which many believe is the primary use case.</p>\n<p>Mullenweg and others who joined the discussion last week are in favor of delivering something more complete, a REST API that supports everything available in wp-admin. This includes WordPress&#8217; many site management features and would put the API several releases away from core readiness.</p>\n<p>In a <a href="http://wptavern.com/wp-rest-api-delayed-contributors-facing-gridlock#comment-142834" target="_blank">comment</a> on our initial report, Drew Jaynes advocated what he believes to be a middle ground that provides a solid jumping-off point. This would involve resolving the missing pieces in the existing endpoints before merging them (items like password-protected posts, autosaves and post previews, and meta.)</p>\n<p>&#8220;As I and others from the contributor/committer camp said in the chat, there can be a middle ground,&#8221; he said. &#8220;Whether that ends up looking like the four core endpoints alone, four core endpoints with some flavor, XML-RPC parity, or some measure of wp-admin parity, remains to be seen,&#8221; he said.</p>\n<p>In a post titled &#8220;<a href="http://journal.rmccue.io/340/progressive-enhancement-with-the-wordpress-rest-api/" target="_blank">Progressive Enhancement with the WordPress REST API</a>,&#8221; Ryan McCue outlined a full-on iterative approach that would push for distribution now and roll out more endpoints in future releases:</p>\n<blockquote><p>Progressive enhancement is our key solution to a couple of related problems: forward-compatibility with future features and versions of WordPress, and robust handling of data types in WordPress. Progressive enhancement also unblocks the REST API project and ensures there’s no need to wait until the REST API has parity with every feature of the WordPress admin.</p></blockquote>\n<p>McCue&#8217;s post goes into further detail of the REST API&#8217;s feature detection capabilities, which allow developers to easily detect support for features and build them in a forwards-compatible way while waiting for core support.</p>\n<h3>Is Distribution the Answer?</h3>\n<p>During last week&#8217;s meeting McCue <a href="https://wordpress.slack.com/archives/core-restapi/p1454633021001594" target="_blank">said</a> that continuing the project&#8217;s development as a feature plugin will do more harm than good. If the REST API is not allowed to ship without offering support for everything in wp-admin, the team would be forced to continue iterating on it as a feature plugin while simultaneously resolving difficult roadblocks in WordPress core. With just four major contributors operating at less than part time on the project, this requirement could stall the WP REST API indefinitely.</p>\n<p>&#8220;We believe that the progressive enhancement approach is the best approach for continuing API development,&#8221; McCue said. &#8220;Progressive enhancement is a paradigm the REST API project ​must​ adopt, if it’s an API we want to add to (without breaking backwards compatibility) over the next 10 years.&#8221;</p>\n<p>Mullenweg, who has led an iterative approach to development throughout WordPress&#8217; history, is wary of latching onto distribution as the only way forward.</p>\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr"><a href="https://twitter.com/Krogsgard">@Krogsgard</a> No one is against iteration. It''s: iterate in plugin with low stakes, or iterate in core, shipping to tens of millions of sites?</p>\n<p>&mdash; Matt Mullenweg (@photomatt) <a href="https://twitter.com/photomatt/status/696765965334290432">February 8, 2016</a></p></blockquote>\n<p></p>\n<p>The larger WordPress&#8217; usage becomes, the louder its footsteps are heard. Iterating on the REST API in core, with distribution to millions of sites, may affect the web in ways contributors cannot yet anticipate. As they say, heavy is the head that wears the crown. The ripples extend beyond WordPress sites to the outside platforms that will also consume the API.</p>\n<p>Contributors are still discussing the nuances of iterative development in core vs. delivering a more complete API. Meanwhile, adoption is stilted by the uncertainty surrounding the project and the fact that it still carries a plugin dependency. It&#8217;s not yet clear whether WordPress contributors will dig in and push for inclusion of the endpoints against Mullenweg&#8217;s recommendation or whether they will opt to spend more time polishing the existing endpoints. If the WP REST API team is required to ensure that the API can support a wp-admin replacement, it may not land in core until the end of this year or later.</p>\n<div id="epoch-width-sniffer"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Feb 2016 22:06:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sat, 05 Mar 2016 19:25:05 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"220858";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Sat, 05 Mar 2016 19:15:13 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20160126233718";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(147, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1457249105', 'no'),
(148, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1457205905', 'no'),
(149, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1457249108', 'no'),
(150, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 05 Mar 2016 19:09:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 13 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"The most downloaded plugin for WordPress (almost 30 million downloads). Use All in One SEO Pack to automatically optimize your site for Search Engines";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The Wordfence WordPress security plugin provides free enterprise-class WordPress security, protecting your website from hacks and malware.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:107:"Increase your traffic, view your stats, speed up your site, and protect yourself from hackers with Jetpack.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Protect your WordPress site by hiding vital areas of your site, protecting access to important files, preventing brute-force login attempts, detecting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"iThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical user experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sat, 05 Mar 2016 19:25:12 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Sat, 05 Mar 2016 19:44:01 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Sat, 05 Mar 2016 19:09:01 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20160126233718";}', 'no'),
(151, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1457249108', 'no'),
(152, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1457205908', 'no'),
(153, '_transient_timeout_plugin_slugs', '1457292309', 'no'),
(154, '_transient_plugin_slugs', 'a:1:{i:0;s:9:"hello.php";}', 'no'),
(155, '_transient_timeout_dash_88ae138922fe95674369b1cb3d215a2b', '1457249109', 'no'),
(156, '_transient_dash_88ae138922fe95674369b1cb3d215a2b', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2016/03/wordpress-4-5-beta-2/''>WordPress 4.5 Beta 2</a> <span class="rss-date">March 3, 2016</span><div class="rssSummary">WordPress 4.5 Beta 2 is now available! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.5, try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”). Or you can [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wptavern.com/wpweekly-episode-224-preview-of-wordpress-4-5''>WPTavern: WPWeekly Episode 224 – Preview of WordPress 4.5</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/in-case-you-missed-it-issue-3''>WPTavern: In Case You Missed It – Issue 3</a></li><li><a class=''rsswidget'' href=''http://blog.akismet.com/2016/03/04/akismet-wordpress-plugin-3-1-8-now-available/''>Akismet: Akismet WordPress Plugin 3.1.8 Now Available</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''https://wordpress.org/plugins/wpclef/'' class=''dashboard-news-plugin-link''>Clef Two-Factor Authentication</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=wpclef&amp;_wpnonce=0993dde7b1&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Clef Two-Factor Authentication''>Install</a>)</span></li></ul></div>', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_edit_last', '1'),
(3, 4, '_edit_lock', '1456656788:1'),
(4, 5, '_edit_last', '1'),
(5, 5, '_edit_lock', '1457205960:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-02-28 10:41:05', '2016-02-28 10:41:05', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2016-02-28 10:41:05', '2016-02-28 10:41:05', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2016-02-28 10:41:05', '2016-02-28 10:41:05', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2016-02-28 10:41:05', '2016-02-28 10:41:05', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2016-02-28 10:44:11', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-28 10:44:11', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=3', 0, 'post', '', 0),
(4, 1, '2016-02-28 10:53:08', '0000-00-00 00:00:00', '<ul>\n	<li>SDP (Part 1) project progress presentations have been scheduled on <b>--</b>.\n\nYou will need to make a presentation (<b>use PPT template</b>) about your project progress and show your project report (5 chapters) &amp; prototype to project review committee.  There are no specific presentation slots - you need to be available whenever review committee calls you for presentation.\n\nIn regards to presentation, you need to use the attached PPT template and following guidelines:\n<ul>\n	<li><b>SLIDE #05: </b>Problem: Clearly state the problem that motivated you to work on your project</li>\n	<li><b>SLIDE #06:</b> Solution: What are you building to solve the problem?</li>\n	<li><b>SLIDE #08:</b> Requirements:\n<ul>\n	<li>List down various techniques &amp; tools you used to develop/elicit requirements</li>\n	<li>Point out how did you document these requirements – did you create SRS?</li>\n</ul>\n</li>\n	<li><b>SLIDE #09:</b> Requirements:\n<ul>\n	<li>List down all the users (roles / actors) of your system</li>\n	<li>Point out if you have identified all the use cases? How many?</li>\n	<li>Point out if you have documented functional &amp; non-functional requirements?</li>\n</ul>\n</li>\n	<li><b>SLIDE #10:</b> Design:\n<ul>\n	<li>Include a deployment diagram that provides overview of the entire system (hardware / software components)</li>\n</ul>\n</li>\n	<li><b>SLIDE #11: </b>Design:\n<ul>\n	<li>Point out which UML diagrams you have used in your design</li>\n	<li>Point out if you have prepared an ERD</li>\n	<li>Point out if you have used any design patterns</li>\n</ul>\n</li>\n	<li><b>SLIDE #12:</b> Implementation:\n<ul>\n	<li>List down various development tools &amp; technologies you are using in your project</li>\n	<li>Point out if you are using any coding standards / best practices</li>\n	<li>List down various libraries / components / web services that you have identified / decided to use in your project</li>\n</ul>\n</li>\n	<li><b>SLIDE #14:</b> Work Breakdown Structure (WBS):\n<ul>\n	<li>Show latest version of your work breakdown structure (WBS) and highlight the items that you have completed so far.</li>\n</ul>\n</li>\n	<li><b>SLIDE #15:</b> Challenges:\n<ul>\n	<li>List any challenges that you are currently facing.  e.g., identification of requirements,  design, technical issues, etc.</li>\n</ul>\n</li>\n	<li><b>SLIDE #17:</b> Prototype:\n<ul>\n	<li>Insert 1 screen shot of your prototype that showcases most features.</li>\n</ul>\n</li>\n	<li><b>SLIDE #18:</b> Report:\n<ul>\n	<li>Point out the amount of progress made in each of the five chapters.</li>\n</ul>\n</li>\n</ul>\nFinally, note that this is a mandatory activity and failure to participate will earn you an “F” grade, unless you have prior permission from you supervisor &amp; project coordinator.</li>\n</ul>', '', '', 'draft', 'open', 'open', '', '', '', '', '2016-02-28 10:53:08', '2016-02-28 10:53:08', '', 0, 'http://localhost/wordpress/?p=4', 0, 'post', '', 0),
(5, 1, '2016-03-05 19:26:00', '0000-00-00 00:00:00', '<div>All SDP (Part I) project groups are required to participate in this activity (Friday, 4th December 2015 (9:00AM-1:00PM)).</div>\n<div></div>\n<div>\n<ul>\n	<li>All groups (including every member of the team) are required to arrive as early as possible and setup their stalls by 9:00AM.</li>\n	<li>You are expected to present your report (first 5 chapters), project idea &amp; prototype.</li>\n	<li>Each group will be provided a table, an LCD monitor, extension board and couple of chairs. You can run a slide show, presentation or prototype on the LCD monitor.</li>\n	<li>You will also need to design brochures (handouts), 1 banner (3x6 foot), and 1 standee (standard size) for your stall.</li>\n</ul>\n</div>\n<div>IMPORTANT: This is mandatory activity - Failure to participate will earn you "F" grade.</div>\n<div></div>\nBest Wishes,', '', '', 'draft', 'open', 'open', '', '', '', '', '2016-03-05 19:26:00', '2016-03-05 19:26:00', '', 0, 'http://localhost/wordpress/?p=5', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(4, 1, 0),
(5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'thefaintedbrain'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"ebbb924c45c7c52e5574fafff11de786d85913e5366b2d3332888ea260ceb0c4";a:4:{s:10:"expiration";i:1457378692;s:2:"ip";s:3:"::1";s:2:"ua";s:73:"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0";s:5:"login";i:1457205892;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'thefaintedbrain', '$P$ByhEFSN04fRh50rFiYbjzqcHTmvH4s1', 'thefaintedbrain', 'thefaintedbrain@gmail.com', '', '2016-02-28 10:41:04', '', 0, 'thefaintedbrain');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `wp_fiverr`
--
CREATE DATABASE IF NOT EXISTS `wp_fiverr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wp_fiverr`;

-- --------------------------------------------------------

--
-- Table structure for table `forum_votes`
--
-- in use(#1932 - Table 'wp_fiverr.forum_votes' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.forum_votes' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--
-- in use(#1932 - Table 'wp_fiverr.friends' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.friends' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `friends_old`
--
-- in use(#1932 - Table 'wp_fiverr.friends_old' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.friends_old' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `main_activities`
--
-- in use(#1932 - Table 'wp_fiverr.main_activities' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.main_activities' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `main_notifications`
--
-- in use(#1932 - Table 'wp_fiverr.main_notifications' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.main_notifications' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--
-- in use(#1932 - Table 'wp_fiverr.messages' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.messages' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `messenger_blocklist`
--
-- in use(#1932 - Table 'wp_fiverr.messenger_blocklist' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.messenger_blocklist' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `messenger_buddylist`
--
-- in use(#1932 - Table 'wp_fiverr.messenger_buddylist' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.messenger_buddylist' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--
-- in use(#1932 - Table 'wp_fiverr.messenger_messages' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.messenger_messages' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages_old`
--
-- in use(#1932 - Table 'wp_fiverr.messenger_messages_old' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.messenger_messages_old' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--
-- in use(#1932 - Table 'wp_fiverr.moderator' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.moderator' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `moderator_candidates`
--
-- in use(#1932 - Table 'wp_fiverr.moderator_candidates' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.moderator_candidates' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `moderator_votes`
--
-- in use(#1932 - Table 'wp_fiverr.moderator_votes' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.moderator_votes' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `page_followers`
--
-- in use(#1932 - Table 'wp_fiverr.page_followers' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.page_followers' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--
-- in use(#1932 - Table 'wp_fiverr.pages' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.pages' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--
-- in use(#1932 - Table 'wp_fiverr.posts' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.posts' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments`
--
-- in use(#1932 - Table 'wp_fiverr.posts_comments' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.posts_comments' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `posts_hits`
--
-- in use(#1932 - Table 'wp_fiverr.posts_hits' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.posts_hits' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `posts_likes`
--
-- in use(#1932 - Table 'wp_fiverr.posts_likes' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.posts_likes' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `publisher_ads`
--
-- in use(#1932 - Table 'wp_fiverr.publisher_ads' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.publisher_ads' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--
-- in use(#1932 - Table 'wp_fiverr.reports' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.reports' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--
-- in use(#1932 - Table 'wp_fiverr.sessions' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.sessions' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--
-- in use(#1932 - Table 'wp_fiverr.shop_categories' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.shop_categories' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--
-- in use(#1932 - Table 'wp_fiverr.shop_orders' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.shop_orders' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders_shipping`
--
-- in use(#1932 - Table 'wp_fiverr.shop_orders_shipping' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.shop_orders_shipping' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--
-- in use(#1932 - Table 'wp_fiverr.shop_products' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.shop_products' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_price`
--
-- in use(#1932 - Table 'wp_fiverr.shop_shipping_price' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.shop_shipping_price' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `stats_post`
--
-- in use(#1932 - Table 'wp_fiverr.stats_post' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.stats_post' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `temp_users`
--
-- in use(#1932 - Table 'wp_fiverr.temp_users' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.temp_users' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--
-- in use(#1932 - Table 'wp_fiverr.tracker' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.tracker' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--
-- in use(#1932 - Table 'wp_fiverr.trade' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade_categories`
--
-- in use(#1932 - Table 'wp_fiverr.trade_categories' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade_categories' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade_items`
--
-- in use(#1932 - Table 'wp_fiverr.trade_items' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade_items' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade_offers`
--
-- in use(#1932 - Table 'wp_fiverr.trade_offers' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade_offers' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade_shipping_info`
--
-- in use(#1932 - Table 'wp_fiverr.trade_shipping_info' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade_shipping_info' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `trade_users`
--
-- in use(#1932 - Table 'wp_fiverr.trade_users' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.trade_users' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--
-- in use(#1932 - Table 'wp_fiverr.transactions' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.transactions' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `user_acl`
--
-- in use(#1932 - Table 'wp_fiverr.user_acl' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.user_acl' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1932 - Table 'wp_fiverr.users' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_bitcoin`
--
-- in use(#1932 - Table 'wp_fiverr.users_bitcoin' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_bitcoin' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_bitcoin_transactions_history`
--
-- in use(#1932 - Table 'wp_fiverr.users_bitcoin_transactions_history' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_bitcoin_transactions_history' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_contact`
--
-- in use(#1932 - Table 'wp_fiverr.users_contact' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_contact' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_daily_activities`
--
-- in use(#1932 - Table 'wp_fiverr.users_daily_activities' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_daily_activities' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_educations`
--
-- in use(#1932 - Table 'wp_fiverr.users_educations' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_educations' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_employments`
--
-- in use(#1932 - Table 'wp_fiverr.users_employments' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_employments' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_links`
--
-- in use(#1932 - Table 'wp_fiverr.users_links' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_links' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_notify_settings`
--
-- in use(#1932 - Table 'wp_fiverr.users_notify_settings' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_notify_settings' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_rating`
--
-- in use(#1932 - Table 'wp_fiverr.users_rating' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_rating' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_stats`
--
-- in use(#1932 - Table 'wp_fiverr.users_stats' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_stats' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `users_token`
--
-- in use(#1932 - Table 'wp_fiverr.users_token' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.users_token' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--
-- in use(#1932 - Table 'wp_fiverr.video_categories' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.video_categories' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--
-- in use(#1932 - Table 'wp_fiverr.video_comments' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.video_comments' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `video_subjects`
--
-- in use(#1932 - Table 'wp_fiverr.video_subjects' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.video_subjects' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--
-- in use(#1932 - Table 'wp_fiverr.videos' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.videos' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--
-- in use(#1932 - Table 'wp_fiverr.wp_commentmeta' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_commentmeta' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--
-- in use(#1932 - Table 'wp_fiverr.wp_comments' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_comments' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--
-- in use(#1932 - Table 'wp_fiverr.wp_links' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_links' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--
-- in use(#1932 - Table 'wp_fiverr.wp_options' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_options' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--
-- in use(#1932 - Table 'wp_fiverr.wp_postmeta' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_postmeta' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--
-- in use(#1932 - Table 'wp_fiverr.wp_posts' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_posts' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--
-- in use(#1932 - Table 'wp_fiverr.wp_term_relationships' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_term_relationships' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--
-- in use(#1932 - Table 'wp_fiverr.wp_term_taxonomy' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_term_taxonomy' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--
-- in use(#1932 - Table 'wp_fiverr.wp_termmeta' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_termmeta' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--
-- in use(#1932 - Table 'wp_fiverr.wp_terms' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_terms' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--
-- in use(#1932 - Table 'wp_fiverr.wp_usermeta' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_usermeta' doesn't exist in engine)

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--
-- in use(#1932 - Table 'wp_fiverr.wp_users' doesn't exist in engine)
-- Error reading data: (#1932 - Table 'wp_fiverr.wp_users' doesn't exist in engine)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
