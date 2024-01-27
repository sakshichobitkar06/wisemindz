-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 01:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_node`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(191) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Class 1', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:31:17'),
(2, 'Class 2', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:31:28'),
(3, 'Class 3', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:31:38'),
(4, 'Class 4', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:31:50'),
(5, 'Class 5', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:32:03'),
(6, 'Class 6', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:32:32'),
(7, 'Class 7', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:32:42'),
(8, 'Class 8', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:32:56'),
(9, '12', 0, NULL, NULL, '2023-08-25 09:35:15', '2023-10-06 12:36:26'),
(10, 'Class 9', 0, NULL, NULL, '2023-10-19 06:54:47', '2023-10-19 13:00:55'),
(11, 'Calss 1', 0, NULL, NULL, '2023-10-19 06:55:04', '2023-10-19 13:01:17'),
(12, '10', 0, NULL, NULL, '2023-11-06 11:39:36', '2023-11-06 11:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `designation_name` varchar(191) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation_name`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(2, 'Vice Principal', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:26:09'),
(3, 'Class Teachers', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:26:09'),
(4, 'Teachers', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-08-24 07:26:09'),
(5, 'Academic Coordinator', 1, NULL, NULL, '2023-10-28 06:10:07', '2023-10-28 06:10:07'),
(6, 'Student', 0, NULL, NULL, '2023-11-06 11:32:28', '2023-11-06 11:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(191) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `outoff` varchar(191) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_name`, `class_id`, `level_id`, `subject_id`, `outoff`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'first Test Series', 1, 1, 1, '30', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(2, 'First Test Series', 2, 2, 2, '30', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(3, 'First Test Series', 3, 3, 3, '30', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(4, 'Second Test Series', 4, 4, 4, '40', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(5, 'Second Test Series', 5, 5, 5, '40', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(6, 'XYZ', 2, 2, 9, NULL, 0, NULL, NULL, '2023-11-06 12:14:57', '2023-11-06 12:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `game_name` varchar(191) NOT NULL,
  `game_type` enum('A','B') DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `class_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `game_topic` varchar(255) DEFAULT NULL,
  `folder` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `subject_id`, `game_name`, `game_type`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`, `class_id`, `level_id`, `game_topic`, `folder`) VALUES
(1, 1, 'singing', '', 1, NULL, NULL, '2023-11-06 12:41:24', '2023-11-06 12:42:48', 1, 1, 'indoor', '');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level_name` varchar(191) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level_name`, `class_id`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Level First', 1, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(2, 'Level First', 2, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(3, 'Level First', 3, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(4, 'Level Second', 4, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(5, 'Level Second', 5, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(6, 'Level Second', 6, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(7, 'Level Third', 7, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(8, 'Level Third', 8, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(9, '3', 9, 0, NULL, NULL, '2023-08-25 09:35:43', '2023-10-06 12:49:37'),
(10, 'B', 3, 0, NULL, NULL, '2023-11-06 11:55:30', '2023-11-06 11:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `outoff` varchar(191) DEFAULT NULL,
  `obtain` varchar(191) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_allotments`
--

CREATE TABLE `mark_allotments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `outoff` varchar(191) DEFAULT NULL,
  `obtain` varchar(191) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mark_allotments`
--

INSERT INTO `mark_allotments` (`id`, `student_id`, `class_id`, `level_id`, `subject_id`, `exam_id`, `outoff`, `obtain`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(2, 2, 1, 1, 1, 1, '100', '75', 1, NULL, NULL, '2023-11-06 10:54:10', '2023-11-06 10:54:10'),
(3, 2, 2, 2, 2, 2, '22', '2', 1, NULL, NULL, '2023-11-06 11:26:49', '2023-11-06 11:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `exam_section` enum('A','B') DEFAULT NULL,
  `question_name` text DEFAULT NULL,
  `optionA` varchar(2000) NOT NULL,
  `optionB` varchar(2000) NOT NULL,
  `optionC` varchar(2000) NOT NULL,
  `optionD` varchar(2000) NOT NULL,
  `correct_option` varchar(2000) NOT NULL,
  `mark` varchar(2000) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `class_id`, `subject_id`, `exam_id`, `exam_section`, `question_name`, `optionA`, `optionB`, `optionC`, `optionD`, `correct_option`, `mark`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 4, 4, 1, 'A', 'Which of these foods is considered healthy for you?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-04 13:47:48', '2023-09-05 11:54:29'),
(2, 4, 4, 2, 'A', 'What should you eat to make your bones strong?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-04 13:48:48', '2023-09-05 11:54:02'),
(3, 4, 4, 2, 'A', 'Which of the following is a healthy breakfast option?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-04 16:30:53', '2023-09-05 11:54:14'),
(4, 4, 4, 2, 'A', '	Which foot is good for your teeth?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-04 16:59:09', '2023-09-05 11:50:47'),
(5, 4, 4, 1, 'A', 'Which foot should you eat more of stay healthy?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:50:24', '2023-09-05 11:52:02'),
(6, 4, 4, 1, 'A', 'Which drink is a good choise to keep your body hydrated?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:53:36', '2023-09-05 11:53:36'),
(7, 4, 4, 1, 'A', 'Which food group does rice and bread belong to?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:55:20', '2023-09-05 11:55:20'),
(8, 4, 4, 2, 'A', 'Eating too much sugary food can be bad for	your?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:56:14', '2023-09-05 11:56:14'),
(9, 4, 4, 1, 'A', 'Which of these foods is rich in vitamins	and	minerals?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:57:04', '2023-09-05 11:57:04'),
(10, 4, 4, 2, 'A', 'Which food is a good source of protein?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:57:46', '2023-09-05 11:57:46'),
(11, 4, 4, 2, 'B', 'What should you eat to help your brain stay sharp?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:58:36', '2023-09-05 11:59:21'),
(12, 4, 4, 2, 'B', 'Which food should you limit to stay	healthy?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 11:59:11', '2023-09-05 11:59:11'),
(13, 4, 4, 2, 'B', 'Which food group does yogurt belong to?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:00:10', '2023-09-05 12:00:10'),
(14, 4, 4, 1, 'B', 'Eating too much fast food can make you feel?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:00:58', '2023-09-05 12:00:58'),
(15, 4, 4, 1, 'B', 'Which of these foods is a good source of fiber?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:01:42', '2023-09-05 12:01:42'),
(16, 4, 4, 2, 'B', 'Which food is a healthier option for	a snack?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:03:09', '2023-09-05 12:03:09'),
(17, 4, 4, 2, 'B', 'What should you avoid eating too much of to keep your teeth healthy?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:04:14', '2023-09-05 12:04:14'),
(18, 4, 4, 2, 'B', 'Which food group does chicken belong to?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:05:00', '2023-09-05 12:05:00'),
(19, 4, 4, 1, 'B', 'What should you eat to keep your heart healthy?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:05:45', '2023-09-05 12:05:45'),
(20, 4, 4, 1, 'B', 'Which of these foods is a good source of fiber?', '', '', '', '', '', '', 1, NULL, NULL, '2023-09-05 12:06:39', '2023-09-05 12:06:39'),
(21, 2, 9, 1, 'A', 'What?', 'Aa', 'Ba', 'Ca', 'Da', 'Ba', '20', 1, NULL, NULL, '2023-11-06 12:35:38', '2023-11-06 12:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `description`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'System Admin', 1, NULL, NULL, '2023-08-24 07:26:09', '2023-10-26 04:55:24'),
(2, 'Teacher', NULL, 1, NULL, NULL, '2023-08-24 07:42:59', '2023-08-24 07:42:59'),
(3, 'Super Admin', NULL, 1, NULL, NULL, '2023-08-24 07:43:21', '2023-08-24 07:43:21'),
(4, 'Teacher', NULL, 0, NULL, NULL, '2023-11-06 11:19:12', '2023-11-06 11:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `school_name` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `city_name` varchar(191) DEFAULT NULL,
  `district_name` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `affilition_no` varchar(191) DEFAULT NULL,
  `email_id` varchar(191) NOT NULL,
  `mobile_no` varchar(30) NOT NULL,
  `password` varchar(666) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role` varchar(191) DEFAULT 'Admin',
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `school_name`, `address`, `city_name`, `district_name`, `state`, `pin_code`, `affilition_no`, `email_id`, `mobile_no`, `password`, `role_id`, `role`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Demo School', 'Sankar Nagar Nagpur', 'Nagpur', 'Nagpur', 'Nagpur', '441900', '12345678', 'demo@gmail.com', '8698273854', '$2a$10$hQ.joIawsqWx.o7yQfq6..3n8JN7otCLd2HpuNHrAdoWjIVgSMI6S', 1, 'Admin', 1, 1, 1, '2023-08-24 07:26:09', '2023-08-24 07:26:09'),
(2, 'Mundle Public School', 'Near Outer Ring Road, Gawasi Manapur, Wardha Road Nagpur ', 'Nagpur', 'Nagpur', 'Nagpur', '441108', 'NA', 'mpsoffice1@gmail.com', '9373282664', '$2a$10$rS0/XWAnPBVzO143T8XOa.mxVvmQTNQd2c5CteZ2P7clukVI6ieta', 1, 'Admin', 1, NULL, NULL, '2023-08-24 07:42:30', '2023-08-24 07:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `school_refresh_tokens`
--

CREATE TABLE `school_refresh_tokens` (
  `id` int(11) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `refresh_token` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section_name` varchar(191) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'A', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:36:25'),
(2, 'B', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:36:31'),
(3, 'C', 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:36:39'),
(4, 'D', 1, NULL, NULL, '2023-08-24 07:36:46', '2023-08-24 07:36:46'),
(5, 'E', 1, NULL, NULL, '2023-08-24 07:36:56', '2023-08-24 07:36:56'),
(6, 'F', 1, NULL, NULL, '2023-09-07 04:37:58', '2023-09-07 04:37:58'),
(7, 'C', 0, NULL, NULL, '2023-11-06 11:45:26', '2023-11-06 11:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200818115900-create-role.js'),
('20200820084716-create-school-refresh-token.js'),
('20200820084716-create-user-refresh-token.js'),
('20211112115355-create-user.js'),
('20230721101840-create-class.js'),
('20230721131528-create-designation.js'),
('20230722072938-create-section.js'),
('20230722085130-create-level.js'),
('20230722105057-create-subject.js'),
('20230722115916-create-exam.js'),
('20230722115916-create-game.js'),
('20230722115916-create-question.js'),
('20230724062446-create-staff.js'),
('20230724090615-create-student.js'),
('20230728104413-create-school.js'),
('20230731091557-create-staffallotment.js'),
('20230802064027-create-staff-refresh-token.js'),
('20230803054912-create-mark-allotment.js'),
('20230803054912-create-mark.js'),
('20231005072528-create-game.js'),
('20231006091143-create-game.js');

-- --------------------------------------------------------

--
-- Table structure for table `staffallotments`
--

CREATE TABLE `staffallotments` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffallotments`
--

INSERT INTO `staffallotments` (`id`, `staff_id`, `class_id`, `level_id`, `subject_id`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 1, 1, 1, NULL, NULL, '2023-08-25 11:03:33', '2023-08-25 11:03:33'),
(2, 2, 2, 2, 2, 1, NULL, NULL, '2023-08-25 11:04:30', '2023-08-25 11:04:30'),
(3, 1, 4, 4, 4, 1, NULL, NULL, '2023-09-05 17:35:17', '2023-09-05 17:35:17'),
(4, 2, 3, 3, 3, 1, NULL, NULL, '2023-09-06 11:43:37', '2023-09-06 11:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email_id` varchar(191) NOT NULL,
  `mobile_no` varchar(30) NOT NULL,
  `password` varchar(666) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `role` varchar(191) DEFAULT 'Teacher',
  `designation_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `first_name`, `last_name`, `email_id`, `mobile_no`, `password`, `school_id`, `role_id`, `role`, `designation_id`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Shilpa', 'Jaywant', 'shilpa@gmail.com', '9921920004', '$2a$10$DQ15pwxE9krxWT03aFY1x.pYw5EBuncQQFSnJMhgvXl2Xg9cbkg46', 1, 2, 'Teacher', 4, 1, NULL, NULL, '2023-08-24 07:39:10', '2023-10-20 12:32:46'),
(2, 'Jayashree', 'Bapolikar', 'jayashree@gmail.com', '9881203840', '$2a$10$I07gs/FH.SEX3jY007iMbuqN2iLJvKZ.lv.pzSVnmZo0CdxWbZMOO', 1, 2, 'Teacher', 5, 1, NULL, NULL, '2023-08-24 07:39:57', '2023-08-24 07:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `staff_refresh_tokens`
--

CREATE TABLE `staff_refresh_tokens` (
  `id` int(11) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `refresh_token` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `middle_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `roll_no` varchar(191) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `mobile_no` varchar(191) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `middle_name`, `last_name`, `roll_no`, `school_id`, `class_id`, `section_id`, `mobile_no`, `gender`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(2, 'Aaradhya', '', 'Wayre', '101', 1, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Avni', '', 'Raut', '102', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Dhruvika', 'Kishor', 'Jaipurkar', '103', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Gargi', '', 'Wakudkar', '104', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Hiranya', '', 'Pawar', '105', 2, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Kartiki', 'Unesh', 'Pijdurkar', '106', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Lavanya', '', 'Khobe', '107', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Nivruti', '', 'Dhage', '108', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Reiyanshi', '', 'Bopche', '109', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Ruchi', '', 'Dhotre', '110', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Shiksha', '', 'Behankar', '111', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Tanishtha', '', 'Junghare', '112', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Unnati', '', 'Wagde', '113', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Yashaswi', '', 'Madavi', '114', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Yavi', '', 'Raut', '115', NULL, 1, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Aadvit', '', 'Lihitkar', '116', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Adhir', 'Ganesh', 'Hinge', '117', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Ansh', 'Akash', 'Thakre', '118', 3, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Arnav', '', 'Ramteke', '119', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Arush', '', 'Mokasare', '120', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Krish', '', 'Lambat', '121', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Nirmesh', '', 'Mohatkar', '122', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Rudransh', '', 'Somkuwar', '123', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Shived', '', 'Kori', '124', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Soumya', '', 'Khobe', '125', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Vansh', '', 'Dandekar', '126', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Yash', '', 'More', '127', NULL, 1, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Aaradhya', 'Chandrakant', 'Misal', '201', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Dhanshri', '', 'Shende', '202', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Dhruvi', 'Ashish', 'Kamble', '203', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Divija', '', 'Bhoyar', '204', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Janavi', 'Ramnath', 'Meshram', '205', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Kashvi', '', 'Shembekar', '206', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Krishti', '', 'Patidar', '207', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Lavnya', 'Pravin', 'Shrikhande', '208', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Priyal', 'Ankush', 'Meshram', '209', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Shreya', 'Babasaheb', 'Ingle', '210', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Swanandi', '', 'Zarpure', '211', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Tejshree', 'Umesh', 'Banait', '212', NULL, 2, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Arjav', 'Sanghpal', 'Ramteke', '213', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Arnav', 'Sachin', 'Thakre', '214', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Atharva', 'Ravindra', 'Bhoyar', '215', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Chinmay', 'Sanjay', 'Wayare', '216', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Daksh', 'Bhajan', 'Lal', '217', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Hashvin', '', 'Gawali', '218', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Laukik', '', 'Waghade', '219', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Mayank', 'Jitendra', 'Seddayya', '220', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Mohit', 'Mukesh', 'Dongre', '221', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Paras', 'Pravin', 'Dandekar', '222', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Riyansh', '', 'Mankar', '223', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Shreyansh', 'Amol', 'Uikey', '224', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Vihan', 'Nitin', 'Nichat', '225', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Vihant', '', 'Jaipurkar', '226', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Vrushabh', 'Amol', 'Raut', '227', NULL, 2, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Atmaja', 'Alhad', 'Sadachar', '301', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Bhavika', 'Ankush', 'Wagh', '302', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Dewanshi', '', 'Dubey', '303', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Dhanshree', '', 'Tekam', '304', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Kavya', '', 'Ikhar', '305', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Lakshika', '', 'Charpate', '306', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Mrunali', '', 'Charate', '307', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Mrunmai', 'Prithviraj', 'Pandey', '308', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Paridhi', 'Kirtikumar', 'Lilhare', '309', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Reha', 'Rahul', 'Barde', '310', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Ritika', 'Yogesh', 'Gawai', '311', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Ruchika', '', 'Bhoyar', '312', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Ruhi', '', 'Dhotre', '313', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Sakshi', '', 'Sonekar', '314', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Swara', '', 'Nagmoti', '315', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Swara', 'Vinod', 'Wakudkar', '316', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Vibhavari', '', 'Gawali', '317', NULL, 3, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Adinath', '', 'Deshpande', '318', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Ansh', 'Abhilash', 'Bondade', '319', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Durvansh', '', 'Amrutkar', '320', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Dnyanesh', 'Tushar', 'Bhangale', '321', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Garvesh', '', 'Anjankar', '322', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Krishna', 'Atul', 'Mote', '323', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Laksh', 'Mangesh', 'Hinge', '324', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Mahak', '', 'Bopche', '325', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Malhar', 'Tejas', 'Kulkarni', '326', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Reyansh', 'Pankaj', 'Chandankhede', '327', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Reyansh', '', 'Nimbekar', '328', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Ridam', '', 'Lasurkar', '329', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Shithilesh', 'Shailesh', 'Patil', '330', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Shlok', 'Suraj', 'Rathod', '331', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Shreyash', 'Gaurav', 'Aswar', '332', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Vedant', '', 'Hiware', '333', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Uday', '', 'Taksande', '334', NULL, 3, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Aahana', 'Sandeep', 'Amle', '401', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Aarohi', 'Avinash', 'Sone', '402', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Bhargavi', 'Rakesh', 'Chaudhari', '403', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Rajshree', 'Pravin', 'Patil', '404', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Riddhi', 'Dipak', 'Soyam', '405', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Sambodhi', 'Dhiraj', 'Fulmali', '406', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Shravani', 'Roshan', 'Raut', '407', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Shrawani', 'Khushal', 'Hinge', '408', NULL, 4, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Akshaj', 'Amol', 'Deshpande', '409', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Arnav', 'Nutan', 'Mate', '410', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Atharv', 'Purushottam', 'Belsare', '411', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Ayu', 'Sunil', 'Kale', '412', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Dhiraj', 'Chandrakant', 'Jaipurkar', '413', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Jeet', 'Raju', 'Kale', '414', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Lalit', 'Mannu', 'Pandey', '415', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Mayank', 'Raju', 'Ganvir', '416', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Mokshank', 'Bablu', 'Jibhe', '417', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Monal', 'Ganesh', 'Dhage', '418', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Rushikesh', 'Kamlakar', 'Dakhane', '419', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Saumya', 'Nilesh', 'Mahajan', '420', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Soham', 'Mahadev', 'Wankhede', '421', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Tarang', '', 'Dhone', '422', NULL, 4, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Aaradhya', 'Gaurav', 'Aswar', '501', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Aaradhya', 'Vinod', 'Wakudkar', '502', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Adiraj', 'R.', 'Kanitkar', '503', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Aditi', 'Nitin', 'Sahastrabuddhe', '504', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Chiranjivi', 'Rahul', 'Belkhode', '505', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Gargi', 'Kishor', 'Jaipurkar', '506', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Jivika', 'Ramdayal', 'Nagle', '507', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Kinjal', 'Vikrant', 'Moon', '508', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Nitisha', 'Mangesh', 'Pendor', '509', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Poorvi', 'Motiram', 'Sonkusale', '510', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Ridam', 'Ankush', 'Meshram', '511', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Ridima', '', 'Mankar', '512', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Sachi', 'Chandrashekar', 'Bhagat', '513', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Saveri', 'Pankaj', 'Jaiswal', '514', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Shreya', 'Pravin', 'Sayam', '515', NULL, 5, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Aadi', 'Abhijeet', 'Nalawade', '516', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Anish', 'Shailesh', 'Agnihotri', '517', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Anway', 'Raju', 'Jadhav', '518', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Arush', 'Gajanan', 'Jadhav', '519', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Atul', 'Surendra', 'Raut', '520', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Chaitanya', 'Arvind', 'Bagne', '521', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Dhruv', 'Nitin', 'Bawane', '522', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Kunal', '', 'Puri', '523', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Naksh', 'Dinesh', 'Dive', '524', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Nishant', 'Manohar', 'Wadole', '525', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Om', 'Sandeep', 'Muley', '526', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Pranav', 'Hemant', 'Lengule', '527', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Raj', '', 'More', '528', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Rudra', 'Raju', 'Parate', '529', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Samyak', 'Abhilash', 'Bondade', '530', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Sarthak', 'Nitin', 'Tiwade', '531', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Soham', 'Pradeep', 'Khonde', '532', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Toshal', 'Pradip', 'Bobde', '533', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Utkarsh', 'Tushar', 'Dhok', '534', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Viraj', 'Yogesh', 'Sayam', '535', NULL, 5, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Hitanshi', 'Harish', 'Khobragade', '601', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Jasmin', 'Pramod', 'Khergade', '602', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Kanak', 'Kailash', 'Mohurle', '603', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Minal', 'Omprakash', 'Telrandhe', '604', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Nandini', '', 'Kale', '605', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Pranali', 'Vinodrao', 'Dhage', '606', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Sarvshree', 'Sanjay', 'Sonwane', '607', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Unnati', 'Dhiraj', 'Ganvir', '608', NULL, 6, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Aarnav', 'Harsh', 'Jain', '609', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Bhavya', 'Ravindra', 'Junghare', '610', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Girish', 'Sudhir', 'Kantode', '611', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Himanshu', 'Homraj', 'Bhoyar', '612', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Lavanya', 'Praful', 'Mathankar', '613', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Mkrand', 'Janakraj', 'Bhoayr', '614', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Pranay', 'Gajanan', 'Chambhare', '615', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Rajeev', '', 'Waindeshwar', '616', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Rehan', 'Vikas', 'Wagde', '617', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Rupesh', '', 'Bagde', '618', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Sarthak', 'Hemraj', 'Khergade', '619', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Shyam', '', 'Garade', '620', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Tejas', 'Indrapal', 'Bhagat', '621', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Yash', 'Babasaheb', 'Ingle', '622', NULL, 6, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Aastha', 'Pramod', 'Kulmate', '623', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Dhruvi', 'Sanjay', 'Bobade', '624', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Janvi', 'Sanjay', 'Bhopre', '625', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Janvi', 'Atul', 'Patil', '626', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Jiyana', 'Jagdish', 'Dongre', '627', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Khushi', 'Hemraj', 'Kakde', '628', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Paridhi', 'Vinod', 'Zalke', '629', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Riya', 'Wasudeo', 'Chaple', '630', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Siddhi', 'Ganesh', 'Ingle', '631', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Aryan', 'Anil', 'Matikhaye', '632', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Bhavesh', 'Gopal', 'Dhage', '633', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Dev', 'Rajendra', 'Lasurkar', '634', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Harsh', 'Vijay', 'Bagne', '635', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Irshad', 'Shakir', 'Shaikh', '636', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Kartika', '', 'Dhage', '637', NULL, 6, 2, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Lokesh', 'Guneshwar', 'Garade', '638', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Naitik', 'Nagsen', 'Shevale', '639', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Rajat', 'Jagdish', 'Dhak', '640', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Risikesh', 'Vijay', 'Choudhary', '641', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Ritesh', 'Nitin', 'Sahastrabuddhe', '642', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Rudra', 'Anil', 'Shende', '643', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Sandesh', 'Sandeep', 'Wayre', '644', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Saumya', 'Bramhanand', 'Bhagat', '645', NULL, 6, 2, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Abhira', '', 'Pande', '701', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Aditi', 'Ajay', 'Sonekar', '702', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Aditi', '', 'Charate', '703', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Akshada', 'Rahul', 'Mokasare', '704', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Akshara', 'Vishal', 'Mahajan', '705', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Ayushi', 'Baba', 'Dongre', '706', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Chaitali', 'Rahul', 'Belkhode', '707', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Garima', 'Sunil', 'Varma', '708', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Janhavi', 'Milind', 'Nanwate', '709', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Janhavi', 'Sanjay', 'Khawale', '710', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Kavya', 'Khomeshwar', 'Shembekar', '711', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Narayani', 'Vishwas', 'Pachpor', '712', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Nidhi', '', 'Kamde', '713', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Ovee', 'Premshekhar', 'Tembhare', '714', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Purva', 'Shriram', 'Ganorkar', '715', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Samruddhi', 'Ravinder', 'Gonarkar', '716', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Saumya', 'Naresh', 'Dhak', '717', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Shravani', 'Sanjay', 'Matikhaye', '718', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Shruti', 'Bramhanand', 'Bhagat', '719', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Sweta', '', 'Kumari', '720', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Rutuja', '', 'Mankar', '721', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Tamanna', 'Chetan', 'Bondade', '722', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Tanvi', 'Kailash', 'Patfode', '723', NULL, 7, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Yashasvi', 'Nandeshwar', 'Ganorkar', '724', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Charudatta', 'Rajkumar', 'Kothikar', '725', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Devanshu', 'Abhijit', 'Thakre', '726', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Krushna', '', 'Ambule', '727', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Nishant', 'Vilas', 'Choudhary', '728', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Sandesh', 'Vijay', 'Dehankar', '729', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Shreyash', 'Naresh', 'Raut', '730', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Soham', '', 'Bobde', '731', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Soyam', 'Manoj', 'Pantawane', '732', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Swapnil', 'Manoj', 'Thakre', '733', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Tilakraj', 'Pravin', 'Bobde', '734', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Vansh', 'Manohar', 'Thorat', '735', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Yash', 'Vinod', 'Lambat', '736', NULL, 7, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Aayushi', 'Amit', 'Tiwari', '801', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Anushka', '', 'Mankar', '802', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Avishka', 'Harish', 'Kohale', '803', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Chaitanyamai', 'Sachin', 'Patil', '804', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Himani', 'Sanjay', 'Matikhaye', '805', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Jivika', 'Pravin', 'Shrikhande', '806', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Khushi', 'B.', 'Meshram', '807', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Kinjal', '', 'Zarpure', '808', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Mahi', 'Dilip', 'Maske', '809', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Mansi', 'Hansraj', 'Mahakalkar', '810', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Mansi', 'Deepak', 'Vaze', '811', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Ojashwi', 'Tirtheshwar', 'Satpute', '812', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Pauravi', 'Bhushan', 'Mulmule', '813', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Samruddhi', 'Jaydeep', 'Lohakre', '814', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Sharvari', '', 'Shambharkar', '815', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Sonam', 'Ambadas', 'Dhage', '816', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Vaishanvi', '', 'Jharia', '817', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Vidya', 'Khemraj', 'Kapse', '818', NULL, 8, 1, '', 'female', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Alok', 'Amol', 'Fulzele', '819', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Anshul', 'Ratnapal', 'Dongre', '820', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Aryan', '', 'Rode', '821', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Bhargav', 'Shriram', 'Rakshak', '822', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Daksh', '', 'Kadwe', '823', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Dhruv', 'Tarun', 'Chavhan', '824', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Dhruv', 'Sharad', 'Dhage', '825', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Kartik', '', 'Patil', '826', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Kunal', 'Sanjay', 'Bhopre', '827', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Naman', 'Sanjeet', 'Prasad', '828', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'Paresh', 'Pramod', 'Raut', '829', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Prince', 'Bhanuprakash', 'Singh', '830', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Rudra', 'Anil', 'Dhoke', '831', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Sholk', 'Devanand', 'Pantawane', '832', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Shrivallabh', 'Nikhilesh', 'Jagdale', '833', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Swaroop', 'Prashant', 'Wankhede', '834', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Vansh', 'Hemant', 'Bagade', '835', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Vedant', 'Gopal', 'Dhage', '836', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Virat', 'Kishor', 'Nikode', '837', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Yugan', 'Yuvraj', 'Wagde', '838', NULL, 8, 1, '', 'male', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(191) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `class_id`, `level_id`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Marathi', 1, 1, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(2, 'Hindi', 2, 2, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(3, 'Math', 3, 3, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(4, 'Science', 4, 4, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(5, 'English', 7, 7, 1, NULL, NULL, '2023-08-24 07:26:10', '2023-08-24 07:26:10'),
(6, 'Hindi', 1, 1, 1, NULL, NULL, '2023-08-25 10:19:48', '2023-08-25 10:19:48'),
(7, 'English', 1, 1, 1, NULL, NULL, '2023-08-25 10:20:10', '2023-08-25 10:20:10'),
(8, 'Science', 5, 5, 1, NULL, NULL, '2023-09-07 05:09:16', '2023-09-07 05:09:16'),
(9, 'Science', 1, 1, 0, NULL, NULL, '2023-11-06 12:05:17', '2023-11-06 12:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) NOT NULL,
  `email_id` varchar(191) NOT NULL,
  `mobile_no` varchar(30) NOT NULL,
  `profile_img` varchar(666) DEFAULT NULL,
  `password` varchar(666) NOT NULL,
  `role_id` int(11) NOT NULL,
  `token` varchar(666) DEFAULT '',
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `email_id`, `mobile_no`, `profile_img`, `password`, `role_id`, `token`, `status`, `created_by`, `updated_by`, `createdAt`, `updatedAt`) VALUES
(1, 'Akash', 'K', 'Bhoyar', 'akashbhoyar49@gmail.com', '8698273854', NULL, '$2y$10$wQHR0th.6RSBTyw7JYDLDOBjwJdQMlXcZwiQYvwnGADdL5J.YpYDW', 1, '', 1, 1, 1, '2023-08-24 07:26:09', '2023-08-24 07:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_refresh_tokens`
--

CREATE TABLE `user_refresh_tokens` (
  `id` int(11) NOT NULL,
  `email_id` varchar(500) NOT NULL,
  `refresh_token` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_allotments`
--
ALTER TABLE `mark_allotments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_refresh_tokens`
--
ALTER TABLE `school_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffallotments`
--
ALTER TABLE `staffallotments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_refresh_tokens`
--
ALTER TABLE `staff_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_refresh_tokens`
--
ALTER TABLE `user_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_allotments`
--
ALTER TABLE `mark_allotments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `school_refresh_tokens`
--
ALTER TABLE `school_refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staffallotments`
--
ALTER TABLE `staffallotments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_refresh_tokens`
--
ALTER TABLE `staff_refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_refresh_tokens`
--
ALTER TABLE `user_refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
