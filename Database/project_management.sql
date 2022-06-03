-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 17, 2022 at 07:27 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignedtasks`
--

CREATE TABLE `assignedtasks` (
  `id` int(11) NOT NULL,
  `taskId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignedtasks`
--

INSERT INTO `assignedtasks` (`id`, `taskId`, `userId`) VALUES
(1, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `screenshots` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bugs`
--

INSERT INTO `bugs` (`id`, `title`, `screenshots`, `comment`) VALUES
(1, 'Bug in Header file', 'SS Submit', 'Problem in Header');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentsId` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `likeCount` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `bugId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentsId`, `userName`, `comment`, `likeCount`, `projectId`, `bugId`) VALUES
(1, 'Naymul Islam', 'Good Project', 1, 8, 0),
(2, 'Naymul Islam', 'Good UI', 2, 7, 0),
(12, 'Naymul Islam', 'Header', NULL, NULL, 1),
(13, 'Naymul Islam', 'Hi', NULL, NULL, 1),
(14, 'Naymul Islam', 'Budget is too low', NULL, NULL, 1),
(15, 'Naymul Islam', 'Budget is too low', NULL, NULL, 1),
(16, 'Naymul Islam', 'Fix Header', NULL, NULL, 1),
(17, 'Naymul Islam', 'Problem in Header', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `assignId` int(11) DEFAULT 0,
  `issueDetails` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `assignId`, `issueDetails`, `comment`) VALUES
(1, 1, 'In the menu, click Issues > Issue Tracking, select an Inbox.', 'There is a problem'),
(2, 1, 'A list of actions is displayed on the toolbar at the top of the page. ', 'List is not working'),
(6, 1, 'ABC', 'GG');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_04_13_135046_create_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectId` int(11) NOT NULL,
  `projectName` varchar(20) NOT NULL,
  `projectDetails` text NOT NULL,
  `budget` int(11) DEFAULT NULL,
  `amountSpent` int(11) DEFAULT NULL,
  `assignDate` date NOT NULL,
  `deadline` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `taskId` int(11) DEFAULT NULL,
  `commentId` int(11) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectId`, `projectName`, `projectDetails`, `budget`, `amountSpent`, `assignDate`, `deadline`, `status`, `taskId`, `commentId`, `userName`, `updated_at`, `created_at`) VALUES
(4, 'A WebSite', 'Teaching website', 31000, 3000, '2022-02-15', 10, 'Queued', 2, 0, 'Naymul Islam', '2022-04-14 07:46:58', NULL),
(7, 'Making a Desktop app', 'Making a Desktop application', 65000, 500, '2022-03-18', 7, 'active', 3, 0, 'Naymul Islam', '2022-04-14 07:46:28', NULL),
(8, 'Microsoft Teams', 'Web Team Application', 65000, 500, '2022-02-15', 7, 'Queued', 3, 0, 'Tapu Saha', '2022-04-14 07:16:31', NULL),
(9, 'Desktop app', 'Making a Desktop application', 60000, 0, '2022-04-14', 7, 'Queued', NULL, NULL, NULL, '2022-04-14 09:20:51', '2022-04-14 09:20:51'),
(10, 'Ecommerce site', 'here we will be bulidin', 10000, 100, '2022-04-14', 5, 'Queued', NULL, NULL, 'Naymul Islam', '2022-04-14 09:27:55', '2022-04-14 09:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `TaskTitle` varchar(20) NOT NULL,
  `taskDetails` text NOT NULL,
  `comment` text DEFAULT NULL,
  `solution` text NOT NULL,
  `assignDate` date NOT NULL,
  `deadline` int(11) NOT NULL,
  `status` text NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `code` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `TaskTitle`, `taskDetails`, `comment`, `solution`, `assignDate`, `deadline`, `status`, `projectId`, `userName`, `code`, `updated_at`) VALUES
(2, 'making header', 'Keep it Slim, Don\'t Sweat the Logo​,Keep Your Navigation Tidy,If Search Is Important, Add it to the Header,Test it On Small Screens​ Over to You', 'Nothing yet', '1647364965.pdf', '2022-02-15', 10, 'issue', 4, 'Nazim Hasan', NULL, '2022-04-15 09:07:00'),
(3, 'Desktop Application', 'Keep it Slim, Don\'t Sweat the Logo​,Keep Your Navigation Tidy,If Search Is Important, Add it to the Header,Test it On Small Screens​ Over to You', 'all done', '1647187466.json', '2022-03-12', 2, 'inProgress', 7, 'Nazim Hasan', NULL, '2022-04-15 03:07:27'),
(4, 'NavBar', 'Keep it Slim, Don\'t Sweat the Logo​,Keep Your Navigation Tidy,If Search Is Important, Add it to the Header,Test it On Small Screens​ Over to You', 'All ok', '1647182258.php', '2022-02-15', 10, 'progressing', 7, 'Nazim Hasan', NULL, '2022-04-15 03:07:03'),
(5, 'Set up and break dow', 'Provide information and marketing materials to customers. Present products in a clean and organized manner. Answer customer questions about the benefits of our products', 'Able to lift up to 35 pounds', '1647225063.md', '2022-03-23', 2, 'done', 8, 'Tapu Saha', NULL, '2022-04-15 09:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `teamName` varchar(20) NOT NULL,
  `projectId` int(11) DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `teamName`, `projectId`, `status`) VALUES
(7, 'Team A', 4, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `userName`, `token`, `created_at`, `updated_at`, `status`, `role`) VALUES
(1, 'Naymul Islam', 'QVoChVIdob8TmDad5lxgNQFOeS2boc8ZAJCJEdWPgUvQSiQic48aOoQAyLImSCmA', '2022-04-13 07:52:40', '2022-04-13 09:56:52', 'disable', ''),
(2, 'Naymul Islam', 'UMxnezNKqbRVUL4BupwR0JaHVeSduChIbcttvZiKjwbhaIZuhCO8OhiLLvSjSNoz', '2022-04-13 07:56:03', '2022-04-13 07:56:03', 'active', ''),
(3, 'Naymul Islam', 'bOWNjzmGDCB7BmhevJmQaGMWltwQRfbwVIhIleKky2YYewKUYXjtxRBiTWVaKAys', '2022-04-14 01:05:39', '2022-04-14 01:05:39', 'active', ''),
(4, 'Naymul Islam', 'kOB5qS0hAzdXSbtuuso65dULCQtvbY0WOVIzsdKYk8iLftZL0pcsY6VRUz0nW77w', '2022-04-14 01:10:10', '2022-04-14 01:10:10', 'active', 'Developer'),
(5, 'Naymul Islam', 'eFHSbEjEgEWZNHvutaaILfWGbXzTLWVgwWAVOSbNoKmhWge8iRF9mrJpxGjLNVos', '2022-04-14 01:12:06', '2022-04-14 01:12:06', 'active', 'Developer'),
(6, 'Naymul Islam', 'uEdLJCWIFr0j9X6WH8BvIgFFIhdjovbTA2mQYC8k9X51tH3zk2LFxfu2lAjyBzwp', '2022-04-14 01:13:47', '2022-04-14 01:13:47', 'active', 'Developer'),
(7, 'Naymul Islam', 'vV177cpdA4yD92JbQAdrcjfkXRVeRl13ggDuF5I8ZsuTHuoEpbB9RhseUnm4gYut', '2022-04-14 01:20:04', '2022-04-14 01:20:04', 'active', 'tester'),
(8, 'Tapu Saha', 'T4FpBGmIDVSrHUYY73Vq82U804a0S0oRGDKX9fGihXdI9mybMD6bLzGycOyv2Y6L', '2022-04-14 01:20:51', '2022-04-14 01:20:51', 'active', 'manager'),
(9, 'Naymul Islam', 'u5podZnQ5BU0hPIkcI8Ma5iUvcCjyzusaGcRufa1RZh6RzTWAqoKQkCMklvx44EH', '2022-04-14 02:50:32', '2022-04-14 02:50:32', 'active', 'tester'),
(10, 'Naymu', 'zrYrHJJwbKItA4QZA1RKhrs3YAzUZwa8tlaqO0xD3EA687YFHMHUPzdW36ubNxgS', '2022-04-14 02:52:24', '2022-04-14 02:52:24', 'active', 'manager'),
(11, 'Naul Islam', 'RwnyDn51tAjZB1iODeboSOPOY8UltfEiqBQCBa4dfVZVzc0g5b5h3581KYQCxbEA', '2022-04-14 03:15:37', '2022-04-14 03:15:37', 'active', 'manager'),
(12, 'NayIslam', 'jnwI8SntpJLLd20Z94xArKgyEJHv4ksHBdxiWIi0GQoBIF0vaMXQQIwzQ2cUq29D', '2022-04-14 03:20:02', '2022-04-14 03:20:02', 'active', 'manager'),
(13, 'Naymul Islam', 'iWmKHO71eGecm4cSpKnVioy3Orje2SYIjLu1Wd8YS3OG6EKfmgdldX0YXgiVf6bE', '2022-04-14 03:34:01', '2022-04-14 03:34:01', 'active', 'manager'),
(14, 'Naymul Islam', 'EkVchgBDWGQf2YS6M4vjcqgAFYSfcXQo4WZ7zHu16QLVfMAvVhulSsMN2kf52Kmr', '2022-04-14 03:51:30', '2022-04-14 03:51:30', 'active', 'manager'),
(15, 'Naymul Islam', 'L2Mv5OgTDxgp4bH09atjuP8g2bfWXZ0O8mVeqnfNiGG8HHI0TsCnfTPgGjPSsTV2', '2022-04-14 22:48:53', '2022-04-14 22:48:53', 'active', 'manager'),
(16, 'Tapu Saha', 'g3TOGtDQbKbTEudfbTuJDnQJlSOC2ksMexZCTZUcj1iot918h7vDyOTRdSdEejgh', '2022-04-14 23:13:44', '2022-04-14 23:13:44', 'active', 'tester'),
(17, 'Naymul Islam', 'RpMwBLF4wFmVoyeSb1HgRuyJG2IJdNB04S1WmM3RJ25hAbMra9lvOBtZbsFUCccN', '2022-04-15 03:27:25', '2022-04-15 03:27:25', 'active', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userId` varchar(15) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `education` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `joinningDate` date DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `teamId` int(11) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `auth_type` text NOT NULL DEFAULT 'email',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userId`, `userName`, `email`, `password`, `education`, `address`, `phone`, `joinningDate`, `skills`, `photo`, `status`, `teamId`, `role`, `auth_type`, `updated_at`) VALUES
(6, 'u-001', 'Naymul Islam', 'nirbas@gmail.com', 'sks12345', 'B.S. in Computer Science from NSU', 'Dhanmondi,Dhaka', '01777862911', '2022-02-09', 'Javascript PHP Node.js React JS MongoDB', 'null', 'active', 7, 'manager', 'email', '2022-04-15 09:12:42'),
(7, 'u-002', 'Tapu Saha', 'tapu@gmail.com', 'tapu12345', 'BCs in AIUB', 'Nowakhali', '019201211', '2022-03-01', 'HTML', 'null', 'active', 7, 'tester', 'email', '2022-04-15 09:12:51'),
(8, NULL, 'Md. Nazim Hasan', 'nazimhasan124073@gmail.com', '$2y$10$B4EUAF24ISNfKY7NOPz0O./GpTtUsix0MUlFt/HqgiW4wBBxlYZRq', NULL, 'Shafipur,Kaliakoir,Gazipur,Dhaka', NULL, NULL, NULL, NULL, 'active', NULL, 'developer', 'github', '2022-04-15 09:12:56'),
(9, NULL, 'Nazim Hasan', 'nazimhasan124073@gmail.com', '$2y$10$jsF2tB7q08M7OntJKL45N.UyIygd49O8M91Uc7V2C6ojwV3bKodTm', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 'developer', 'google', '2022-04-15 09:13:00'),
(10, NULL, 'MD. NAZMUL HASAN ANIK', 'nazmulhasan313285@gmail.com', 'Nazmul123', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 'developer', 'email', '2022-04-15 09:13:03'),
(11, NULL, 'BILLAL HOSSAIN', 'asda@gmail.com', 'ballal11', NULL, NULL, NULL, NULL, NULL, NULL, 'blocked', NULL, 'developer', 'email', '2022-04-15 09:13:09'),
(12, NULL, 'Nazmul Hasan', 'nazmulhasan313285@gmail.com', '$2y$10$QaRrR1/WMTDPcGqCgtYuPuRYLad8rgwrk0zaQA0fEm27Nq9zhi7LO', NULL, NULL, NULL, NULL, NULL, NULL, 'blocked', NULL, 'developer', 'google', '2022-04-15 09:13:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignedtasks`
--
ALTER TABLE `assignedtasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskId` (`taskId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentsId`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignId` (`assignId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectId`),
  ADD KEY `taskId` (`taskId`),
  ADD KEY `commentId` (`commentId`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectId` (`projectId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teamId` (`teamId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignedtasks`
--
ALTER TABLE `assignedtasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignedtasks`
--
ALTER TABLE `assignedtasks`
  ADD CONSTRAINT `assignedtasks_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignedtasks_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`ProjectId`);

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`assignId`) REFERENCES `assignedtasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`ProjectId`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`ProjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
