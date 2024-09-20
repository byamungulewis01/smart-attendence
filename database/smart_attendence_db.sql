-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 08:27 AM
-- Server version: 8.0.33
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_attendence_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendences`
--

CREATE TABLE `attendences` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `status` enum('present','absent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendences`
--

INSERT INTO `attendences` (`id`, `date`, `student_id`, `course_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2024-09-05', 4, 6, 'present', '2024-09-19 08:07:19', '2024-09-19 08:07:19'),
(2, '2024-09-05', 6, 6, 'present', '2024-09-19 08:08:13', '2024-09-19 08:08:13'),
(3, '2024-09-05', 11, 6, 'present', '2024-09-19 08:13:13', '2024-09-19 08:13:13'),
(4, '2024-09-05', 12, 6, 'absent', '2024-09-19 09:55:27', '2024-09-19 09:55:27'),
(5, '2024-09-05', 13, 6, 'absent', '2024-09-19 09:55:27', '2024-09-19 09:55:27'),
(6, '2024-09-05', 14, 6, 'absent', '2024-09-19 09:55:27', '2024-09-19 09:55:27'),
(7, '2024-09-14', 4, 6, 'present', '2024-09-14 06:07:19', '2024-09-14 06:07:19'),
(8, '2024-09-14', 6, 6, 'absent', '2024-09-14 06:08:13', '2024-09-14 06:08:13'),
(9, '2024-09-14', 11, 6, 'present', '2024-09-14 06:13:13', '2024-09-14 06:13:13'),
(10, '2024-09-14', 12, 6, 'present', '2024-09-14 07:55:27', '2024-09-14 07:55:27'),
(11, '2024-09-14', 13, 6, 'absent', '2024-09-14 07:55:27', '2024-09-14 07:55:27'),
(12, '2024-09-14', 14, 6, 'present', '2024-09-14 07:55:27', '2024-09-14 07:55:27'),
(13, '2024-09-15', 4, 6, 'present', '2024-09-15 06:07:19', '2024-09-15 06:07:19'),
(14, '2024-09-15', 6, 6, 'absent', '2024-09-15 06:08:13', '2024-09-15 06:08:13'),
(15, '2024-09-15', 11, 6, 'present', '2024-09-15 06:13:13', '2024-09-15 06:13:13'),
(16, '2024-09-15', 12, 6, 'present', '2024-09-15 07:55:27', '2024-09-15 07:55:27'),
(17, '2024-09-15', 13, 6, 'absent', '2024-09-15 07:55:27', '2024-09-15 07:55:27'),
(18, '2024-09-15', 14, 6, 'present', '2024-09-15 07:55:27', '2024-09-15 07:55:27'),
(19, '2024-09-17', 4, 6, 'present', '2024-09-17 06:07:19', '2024-09-17 06:07:19'),
(20, '2024-09-17', 6, 6, 'absent', '2024-09-17 06:08:13', '2024-09-17 06:08:13'),
(21, '2024-09-17', 11, 6, 'present', '2024-09-17 06:13:13', '2024-09-17 06:13:13'),
(22, '2024-09-17', 12, 6, 'present', '2024-09-17 07:55:27', '2024-09-17 07:55:27'),
(23, '2024-09-17', 13, 6, 'absent', '2024-09-17 07:55:27', '2024-09-17 07:55:27'),
(24, '2024-09-17', 14, 6, 'present', '2024-09-17 07:55:27', '2024-09-17 07:55:27'),
(25, '2024-09-18', 4, 6, 'absent', '2024-09-18 06:07:19', '2024-09-18 06:07:19'),
(26, '2024-09-18', 6, 6, 'present', '2024-09-18 06:08:13', '2024-09-18 06:08:13'),
(27, '2024-09-18', 11, 6, 'present', '2024-09-18 06:13:13', '2024-09-18 06:13:13'),
(28, '2024-09-18', 12, 6, 'present', '2024-09-18 07:55:27', '2024-09-18 07:55:27'),
(29, '2024-09-18', 13, 6, 'present', '2024-09-18 07:55:27', '2024-09-18 07:55:27'),
(30, '2024-09-18', 14, 6, 'present', '2024-09-18 07:55:27', '2024-09-18 07:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` enum('ICT','Crop Production','Mechanical Engineering','Veternary Technology','EET','Civil Engineering') COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('Level 5','Level 6','Level 7') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `option`, `level`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Object Oriented Programming', 'ICT', 'Level 6', 'active', 22, '2024-09-18 13:08:55', '2024-09-20 05:21:49'),
(2, 'Kirk Stuart', 'Crop Production', 'Level 7', 'active', 20, '2024-09-18 13:13:57', '2024-09-18 13:13:57'),
(3, 'Velma Walters', 'Civil Engineering', 'Level 5', 'active', 24, '2024-09-18 13:16:32', '2024-09-18 13:16:32'),
(4, 'Zachary Ochoa', 'Crop Production', 'Level 6', 'active', 21, '2024-09-18 13:16:39', '2024-09-18 13:16:39'),
(5, 'Morgan Mays', 'Veternary Technology', 'Level 6', 'active', 22, '2024-09-18 13:16:47', '2024-09-18 13:16:47'),
(6, 'Lunix Server Administrative', 'ICT', 'Level 5', 'active', 22, '2024-09-18 13:16:53', '2024-09-20 05:21:40'),
(7, 'Windows Server Administrative', 'ICT', 'Level 6', 'inactive', 20, '2024-09-18 13:16:59', '2024-09-20 05:20:05'),
(8, 'Emmanuel Nguyen', 'Mechanical Engineering', 'Level 7', 'active', 22, '2024-09-18 13:17:04', '2024-09-20 05:22:56'),
(9, 'Networking A', 'ICT', 'Level 7', 'inactive', 24, '2024-09-18 13:17:08', '2024-09-20 05:19:36'),
(10, 'Xavier Terry', 'Civil Engineering', 'Level 6', 'inactive', 23, '2024-09-18 13:17:12', '2024-09-18 13:17:12'),
(11, 'Kristen Hunt', 'Mechanical Engineering', 'Level 6', 'active', 24, '2024-09-19 06:25:33', '2024-09-19 06:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_18_021749_create_courses_table', 1),
(7, '2024_09_18_021805_create_students_table', 2),
(9, '2024_09_18_212309_create_personal_access_tokens_table', 3),
(10, '2024_09_18_021817_create_attendences_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lDAQZmOWtDFCzg9NoJYMVcXCSOWZYhGe6WmhzSkg', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclNsUm56ODlFRUpwNldwR01HZ3FkWTU3cG16dGpvbnlwNEwyMXRtaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1726820767);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` enum('ICT','Crop Production','Mechanical Engineering','Veternary Technology','EET','Civil Engineering') COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('Level 5','Level 6','Level 7') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `reg_number`, `card_number`, `option`, `level`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Elizabeth', 'Marks', '24RP00001', '68034SD66', 'Civil Engineering', 'Level 6', 'active', '2024-09-18 14:10:35', '2024-09-18 14:10:35'),
(3, 'Jada', 'Hanson', '24RP00003', '39DRE4454', 'Mechanical Engineering', 'Level 6', 'inactive', '2024-09-18 14:12:46', '2024-09-18 14:12:46'),
(4, 'Kai', 'Marks', '24RP00004', '220TR554', 'ICT', 'Level 5', 'inactive', '2024-09-18 14:12:55', '2024-09-19 07:27:49'),
(5, 'Yen', 'Delgado', '24RP00005', '31655AS', 'Crop Production', 'Level 6', 'active', '2024-09-18 14:13:12', '2024-09-18 14:13:12'),
(6, 'Jenna', 'Sellers', '24RP00006', '641GG88', 'ICT', 'Level 5', 'active', '2024-09-18 15:25:41', '2024-09-18 15:25:41'),
(7, 'Berk', 'Matthews', '24RP00007', '151RRFFFS', 'Mechanical Engineering', 'Level 7', 'active', '2024-09-19 06:25:44', '2024-09-19 06:25:44'),
(8, 'Cynthia', 'Rosario', '24RP00008', '927RRR5', 'EET', 'Level 7', 'active', '2024-09-19 06:26:00', '2024-09-19 06:26:00'),
(9, 'Shelley', 'Lara', '24RP00009', '841TTR44', 'EET', 'Level 5', 'inactive', '2024-09-19 06:26:07', '2024-09-19 06:26:07'),
(10, 'Cheyenne', 'Monroe', '24RP00010', '362YY676', 'Mechanical Engineering', 'Level 5', 'inactive', '2024-09-19 06:26:15', '2024-09-19 06:26:15'),
(11, 'Rae', 'Lindsey', '24RP00011', '26255GGH7', 'ICT', 'Level 5', 'active', '2024-09-19 07:28:15', '2024-09-19 07:28:15'),
(12, 'Trevor', 'Payne', '24RP00012', '804TTTY54', 'ICT', 'Level 5', 'inactive', '2024-09-19 07:28:28', '2024-09-19 07:28:28'),
(13, 'Joelle', 'Parrish', '24RP00013', '2724AAASSKI', 'ICT', 'Level 5', 'active', '2024-09-19 08:14:48', '2024-09-19 08:14:48'),
(14, 'Chanda', 'Hampton', '24RP00014', '9123344ASS', 'ICT', 'Level 5', 'active', '2024-09-19 08:15:02', '2024-09-19 08:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super_admin','admin','teacher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `status`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'BYAMUNGU Lewis', 'byamungulewis@gmail.com', '+250785436135', 'active', 'super_admin', '2024-09-18 09:54:49', '$2y$12$oBrHw6v1t.rFBr2cUaOsw.GGYKkTPN2tvbAVSrOkHZmlhnGjkXXXS', 'Q71fxOg94GzZH7pixMnGbdhxtXCGLkB2BfV2bKCiXA7j9WFj2b6RxNnnemEV', '2024-09-18 09:54:50', '2024-09-18 09:54:50'),
(2, 'Damon Holmes', 'fuxirymux@mailinator.com', '+1 (795) 571-1976', 'inactive', 'admin', NULL, '$2y$12$dbg6GwI5QMGbx/.lYUmRwOv2p0.Yu88x66eI9bWzBdQM6yu0KEuYW', NULL, '2024-09-18 09:55:11', '2024-09-18 09:55:11'),
(3, 'Maxwell Potter', 'laravugu@mailinator.com', '+1 (306) 372-2756', 'active', 'admin', NULL, '$2y$12$V8qO7Iim0rJ8JiuNWh2UX.jFC6YWtioZXUsvySNWoJl/QkLPc5H.G', NULL, '2024-09-18 09:55:20', '2024-09-18 09:55:20'),
(5, 'Nicholas Benjamin', 'wuqycaba@mailinator.com', '+1 (835) 181-3915', 'active', 'admin', NULL, '$2y$12$ocR3uFe/4zcSmuylw6v7ceA.nDksCInZ63q163yfI2g.o8sCe8cEm', NULL, '2024-09-18 09:55:35', '2024-09-18 09:55:35'),
(7, 'Darius Francis', 'rodek@mailinator.com', '+1 (767) 333-4425', 'inactive', 'admin', NULL, '$2y$12$vW6sj5KmNsF5n3SCNyWVoOlafrcM8fCsH2ztpMbWCnjBH/9SC1qy6', NULL, '2024-09-18 10:00:53', '2024-09-18 10:00:53'),
(8, 'Erasmus Sloan', 'jyjiq@mailinator.com', '+1 (965) 526-1576', 'inactive', 'admin', NULL, '$2y$12$sRA3QpC.svN7O7No/IgxaeertP9/Spf.EKTNwwQAEi/6JjQDNZs3e', NULL, '2024-09-18 10:00:57', '2024-09-18 10:00:57'),
(9, 'Kylynn Lynch', 'huhuxusyt@mailinator.com', '+1 (977) 343-9997', 'active', 'admin', NULL, '$2y$12$V/bjasDOx222Mshi7I1EI.B57deTO/4YTa/V6cocOGJDOm7Kd9Toy', NULL, '2024-09-18 10:01:00', '2024-09-18 10:01:00'),
(10, 'Stewart Bell', 'gygupuvuxi@mailinator.com', '+1 (828) 835-1196', 'inactive', 'admin', NULL, '$2y$12$XLig.ELf4xvstPTET2zzceSmC40TkyORSKzDXslEtpXQFoMd43MDe', NULL, '2024-09-18 10:01:04', '2024-09-18 10:01:04'),
(11, 'Rebekah Molina', 'savy@mailinator.com', '+1 (195) 343-9035', 'active', 'admin', NULL, '$2y$12$HmfWneFHsZCeGdqXdTkl9.ZaqIfP3iMY3OjK4X5oM.Gff9xE4n04G', NULL, '2024-09-18 10:01:08', '2024-09-18 10:01:08'),
(12, 'Orlando Hale', 'zuzamyzo@mailinator.com', '+1 (913) 565-5033', 'active', 'admin', NULL, '$2y$12$.kiopde2xms0zcZL0e2ZHOE2mC05CmW4mqGhoexWYQjkW1wxobJm2', NULL, '2024-09-18 10:01:12', '2024-09-18 10:01:12'),
(13, 'Cheryl Woodward', 'tunyzy@mailinator.com', '+1 (527) 776-4814', 'active', 'admin', NULL, '$2y$12$g1hi7nDZJvuOHE8scexldeEitMLL.RTDe0iMazY7hy5JxQAbdetcK', NULL, '2024-09-18 10:01:16', '2024-09-18 10:01:16'),
(14, 'Sybil Dunn iuuu', 'jyvawik@mailinator.com', '+1 (191) 233-7089', 'active', 'admin', NULL, '$2y$12$p1RBrcS9MXKTP7RydhrktOoJJ7yLu2IkXGx3EAV97rUnEaq31P.WC', NULL, '2024-09-18 10:01:20', '2024-09-18 12:00:14'),
(15, 'Yael Ellison', 'qidijis@mailinator.com', '+1 (743) 996-7838', 'inactive', 'admin', NULL, '$2y$12$OkVVuLjaQfFnoifHvVd3MO3.ZDb2gUS2B3vEXhiaRfMHUYS4T/hCq', NULL, '2024-09-18 10:01:24', '2024-09-18 10:01:24'),
(16, 'Miriam Kelley', 'bekyz@mailinator.com', '+1 (352) 758-1888', 'inactive', 'admin', NULL, '$2y$12$dzjkM/ZUcuSxhlNEse.sSO3Lx0DDsGM1laKcuW.UsoK5.Uo9zk.pG', NULL, '2024-09-18 10:01:27', '2024-09-18 10:01:27'),
(17, 'Heather Newton', 'rytyqada@mailinator.com', '+1 (387) 695-5965', 'active', 'admin', NULL, '$2y$12$NrhTr5xvCnPL406vrYrrOuZ1ZDeOWXA6qMAJ.TfE6kN7Z6ARMt8Zu', NULL, '2024-09-18 10:01:30', '2024-09-18 10:01:30'),
(18, 'Jaime Bowman UPDATE', 'nivoxo@mailinator.com', '+1 (162) 711-6449', 'active', 'admin', NULL, '$2y$12$y.ppOqr/wGHGchstB9O02u7dS7zeXKwZijuikf.cCsalkLUH2wkPu', NULL, '2024-09-18 10:07:27', '2024-09-18 11:07:46'),
(19, 'Moana Moran', 'miwose@mailinator.com', '+1 (667) 583-9172', 'inactive', 'admin', NULL, '$2y$12$kUIA9CSji7GKsRoz3Vubi.7pTPr1VfrD8LJ2wjMylX1Tb6qmcjo7a', NULL, '2024-09-18 11:34:07', '2024-09-18 11:34:07'),
(20, 'Ross Chan', 'geper@mailinator.com', '+1 (744) 211-8758', 'active', 'teacher', NULL, '$2y$12$sAhR9pFn.TJXm4dgxzmsX.BhbMo9w4iySU30CP5ou43IBFft2bG4K', NULL, '2024-09-18 11:49:22', '2024-09-18 11:49:22'),
(21, 'Orson Guerra', 'vysu@mailinator.com', '+1 (173) 348-7472', 'inactive', 'teacher', NULL, '$2y$12$txdmy9UEN7ZyV9GA.h9aTOZCONoE/h/Nqv7RujaxyjkbkPekhTWnK', NULL, '2024-09-18 11:54:11', '2024-09-18 11:54:11'),
(22, 'Lawrence Hatfield', 'ragirus@mailinator.com', '+1 (468) 133-3359', 'inactive', 'teacher', NULL, '$2y$12$OEg7IoQbkXDU.KOpznVqA.cB4R0kVlf.mrucdc8k61/QvqGmmG6x6', NULL, '2024-09-18 11:54:26', '2024-09-18 11:54:26'),
(23, 'Reese Santos', 'lynog@mailinator.com', '+1 (937) 196-6574', 'active', 'teacher', NULL, '$2y$12$69MEKmmj3xYJ.W9CQsvFMu/nv5d2UD8tpnZBsx.643auX8dl/7kBy', NULL, '2024-09-18 11:54:33', '2024-09-18 12:00:28'),
(24, 'Marah Randolph', 'cycyja@mailinator.com', '+1 (569) 677-8057', 'inactive', 'teacher', NULL, '$2y$12$mwEtyfIMNQ7AYYTDk5wQ9.oVPX3WBUZK5j8g0tXzSMieXO8PmLVXS', NULL, '2024-09-18 12:19:12', '2024-09-18 12:19:25'),
(25, 'Griffith Diaz', 'hehacupa@mailinator.com', '+1 (344) 307-3554', 'inactive', 'teacher', NULL, '$2y$12$4dSZ5Ot5Akl2GjWd.27Mr.FZvdzla8htjGFVeT9bLHNoZKzrtLlBi', NULL, '2024-09-19 06:25:14', '2024-09-19 06:25:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendences`
--
ALTER TABLE `attendences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendences_student_id_foreign` (`student_id`),
  ADD KEY `attendences_course_id_foreign` (`course_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_reg_number_unique` (`reg_number`),
  ADD UNIQUE KEY `students_card_number_unique` (`card_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendences`
--
ALTER TABLE `attendences`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendences`
--
ALTER TABLE `attendences`
  ADD CONSTRAINT `attendences_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `attendences_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
