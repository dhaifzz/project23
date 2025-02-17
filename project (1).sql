-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 01:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `adviser`
--

CREATE TABLE `adviser` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `year_level` int(11) NOT NULL,
  `date_joined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adviser`
--

INSERT INTO `adviser` (`id`, `user_id`, `year_level`, `date_joined`) VALUES
(1, 18, 2, '2024-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `approval`
--

CREATE TABLE `approval` (
  `id` int(11) NOT NULL,
  `excuse_letter_id` int(11) NOT NULL,
  `approved_adviser` int(11) DEFAULT NULL,
  `approved_guidance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approval`
--

INSERT INTO `approval` (`id`, `excuse_letter_id`, `approved_adviser`, `approved_guidance`) VALUES
(1, 18, NULL, NULL),
(2, 34, NULL, NULL),
(3, 35, NULL, NULL),
(4, 36, NULL, NULL),
(5, 45, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `acronym` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `acronym`, `created_at`, `last_updated`) VALUES
(1, 'Bachelor of Computing Science', 'BSCS', '2024-10-29 12:49:47', '0000-00-00 00:00:00'),
(2, 'Bachelor of Information Management', 'BSIT', '2024-10-29 12:51:04', NULL),
(3, 'Mobile Application Development', 'MAD', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Associate in Computer Technology');

-- --------------------------------------------------------

--
-- Table structure for table `excuse_letter`
--

CREATE TABLE `excuse_letter` (
  `id` int(11) NOT NULL,
  `excuse_letter` blob NOT NULL,
  `comment` text DEFAULT NULL,
  `prof_id` int(11) NOT NULL,
  `date_submitted` date NOT NULL,
  `date_absent` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `excuse_letter`
--

INSERT INTO `excuse_letter` (`id`, `excuse_letter`, `comment`, `prof_id`, `date_submitted`, `date_absent`, `course_id`, `student_id`) VALUES
(18, 0x433a5c78616d70705c6874646f63735c70726f6a6563745c73747564656e742d766965772f75706c6f6164732f73637265656e73686f743032372e6a7067, 'ddddd', 4, '2024-12-10', '2024-11-01', 1, 3),
(34, 0x73637265656e73686f743030332e6a7067, 'sdsds', 1, '2024-11-30', '2024-11-08', 1, 3),
(35, 0x73637265656e73686f743030352e6a7067, 'rfdred', 4, '2024-12-02', '2024-12-11', 1, 3),
(36, 0x73637265656e73686f743030332e6a7067, 'wesdfwe', 1, '2024-12-04', '2024-11-15', 1, 3),
(45, 0x73637265656e73686f743030342e6a7067, 'weew', 6, '2024-12-11', '2024-11-15', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `guidance`
--

CREATE TABLE `guidance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_started` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_joined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`ID`, `user_id`, `date_joined`) VALUES
(1, 16, '2024-12-05'),
(4, 17, '2024-12-05'),
(6, 19, '2024-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `year_level` int(11) NOT NULL,
  `type` enum('CS','IT','ACT','') NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `year_level`, `type`, `department_id`) VALUES
(1, 'BSCS-3A', 3, 'CS', 1),
(2, 'BSCS-2B', 2, 'CS', 1),
(3, 'BSIT-2A', 2, 'IT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `user_id`, `sections_id`, `enrollment_date`) VALUES
(1, 8, 1, '2024-12-04'),
(3, 9, 3, '2024-12-01'),
(4, 10, 2, '2024-10-04'),
(5, 11, 1, '2024-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ids` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(100) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `user_type` enum('Student','Professor','Adviser','Guidance') DEFAULT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ids`, `email`, `password`, `last_name`, `first_name`, `middle_name`, `created_at`, `last_updated`, `user_type`, `department_id`) VALUES
(8, 'jusonneiljam@gmail.com', '$2y$10$0rReBIyHrLJ/0iy96ER9F.44Tt46U1f8T0PuaT/xo9DjnEX4Mwb.6', 'Juson', 'Neil Jam', NULL, '2024-11-25 06:23:17', '2024-12-10 09:32:28', 'Student', 1),
(9, 'neil', '$2y$10$0zXduaxnmMDXJlDdUIv7qukkRSZwGy1XywTRXTmRVXtWxo10ATIbC', 'Juson', 'Neil Jam', NULL, '2024-11-25 06:25:20', '2024-12-10 09:32:31', 'Student', 2),
(10, 'jusonmarodel@gmail.com', '$2y$10$1tx1fqmhTijFenjZeo5y2.ujE/pzaLHNDSrtSTWju.kPwzk1eJO7W', 'Juson', 'Neil Jam', NULL, '2024-11-25 15:00:19', '2024-12-10 09:32:34', 'Student', 1),
(11, '09951491869', '$2y$10$D4njwZSxqaf3gnEJTDMr5OYdX3ld3zXNowvhTVTtY6T9ELj/QLaEC', 'Juson', 'Neil Jam', 'J', '2024-11-25 21:05:54', '2024-12-10 09:32:38', 'Student', 1),
(16, 'dap@wmsu.com', '$2y$10$d7VMjzAeUll38P.uGHLOsOQ2DvnHCkmux4.4YFbhm1/KTN3XBbSG2', 'dsd', 'Dap', 'Y', '2024-11-26 08:33:13', '2024-12-10 11:55:47', 'Professor', 1),
(17, 'dapp@wmsu.com', '$2y$10$hiHqvv5EC39/Tbh5jM1yyuSSbu4zkkBbftQ40HUmd3k4ExUwPemKO', 'pIEDAD', 'gERALDINE', 'tIMONEL', '2024-11-26 15:55:47', '2024-12-10 11:55:50', 'Professor', 1),
(18, 'faculty@wmsu.com', '$2y$10$oMc0YB6hktWmU3a29bm0iOf2v/S6X9nwcSTiQxOItbWEvR8nKJPSO', 'Juson', 'gERALDINE', 'y', '2024-11-29 02:34:54', '2024-12-10 13:50:39', 'Adviser', 1),
(19, 'jusonmarodel@gmail.con', '$2y$10$6xO6g4Pkqjq9XL8UvzJeoeO8tiIWWm6JFNX.04OXktoodfQ7modW.', 'dsd', 'gERALDINE', 'tIMONEL', '2024-12-02 03:35:30', '2024-12-10 11:55:53', 'Professor', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adviser`
--
ALTER TABLE `adviser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `year_level` (`year_level`);

--
-- Indexes for table `approval`
--
ALTER TABLE `approval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `excuse_letter_id` (`excuse_letter_id`),
  ADD KEY `approved_adviser` (`approved_adviser`),
  ADD KEY `approved_guidance` (`approved_guidance`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excuse_letter`
--
ALTER TABLE `excuse_letter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `prof_id` (`prof_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `guidance`
--
ALTER TABLE `guidance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year_level` (`year_level`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sections_id` (`sections_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ids`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adviser`
--
ALTER TABLE `adviser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `approval`
--
ALTER TABLE `approval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `excuse_letter`
--
ALTER TABLE `excuse_letter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `guidance`
--
ALTER TABLE `guidance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adviser`
--
ALTER TABLE `adviser`
  ADD CONSTRAINT `adviser_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ids`),
  ADD CONSTRAINT `adviser_ibfk_2` FOREIGN KEY (`year_level`) REFERENCES `sections` (`year_level`);

--
-- Constraints for table `approval`
--
ALTER TABLE `approval`
  ADD CONSTRAINT `approval_ibfk_1` FOREIGN KEY (`excuse_letter_id`) REFERENCES `excuse_letter` (`id`),
  ADD CONSTRAINT `approval_ibfk_2` FOREIGN KEY (`approved_adviser`) REFERENCES `adviser` (`id`),
  ADD CONSTRAINT `approval_ibfk_3` FOREIGN KEY (`approved_guidance`) REFERENCES `guidance` (`id`);

--
-- Constraints for table `excuse_letter`
--
ALTER TABLE `excuse_letter`
  ADD CONSTRAINT `excuse_letter_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `excuse_letter_ibfk_2` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`id`),
  ADD CONSTRAINT `excuse_letter_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `guidance`
--
ALTER TABLE `guidance`
  ADD CONSTRAINT `guidance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ids`);

--
-- Constraints for table `professors`
--
ALTER TABLE `professors`
  ADD CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ids`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ids`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
