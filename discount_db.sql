-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 08:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discount_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `for_family_member` tinyint(1) NOT NULL DEFAULT 0,
  `cost` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `schedule_id`, `for_family_member`, `cost`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 1, 264.03, '2024-09-26 09:46:09', '2024-09-26 09:46:09'),
(2, 6, 4, 1, 397.40, '2024-09-26 09:48:41', '2024-09-26 09:48:41'),
(3, 7, 5, 1, 236.25, '2024-09-26 09:50:55', '2024-09-26 09:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('amount','percentage') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `max_uses` int(11) NOT NULL DEFAULT 0,
  `max_discount` decimal(8,2) DEFAULT NULL,
  `family_member` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `type`, `value`, `max_uses`, `max_discount`, `family_member`, `created_at`, `updated_at`) VALUES
(1, 'Family Member Discount', 'percentage', 10.00, 5, NULL, 1, '2024-09-26 04:45:42', '2024-09-26 04:45:42'),
(2, 'Recurring Booking Discount', 'amount', 20.00, 10, NULL, 0, '2024-09-26 04:45:42', '2024-09-26 04:45:42'),
(3, 'Family Member Discount', 'percentage', 10.00, 0, NULL, 0, '2024-09-26 09:48:41', '2024-09-26 09:48:41'),
(4, 'Family Member Discount', 'percentage', 10.00, 0, NULL, 0, '2024-09-26 09:50:55', '2024-09-26 09:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_09_26_085906_create_discounts_table', 2),
(7, '2024_09_26_090329_create_bookings_table', 3),
(8, '2024_09_26_143726_create_schedules_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `name`, `date`, `time`, `created_at`, `updated_at`) VALUES
(1, 'eaque', '2012-05-13', '03:57:24', '2024-09-26 09:19:54', '2024-09-26 09:19:54'),
(2, 'quasi', '2009-01-01', '19:55:41', '2024-09-26 09:43:27', '2024-09-26 09:43:27'),
(3, 'libero', '1990-11-10', '01:46:08', '2024-09-26 09:46:09', '2024-09-26 09:46:09'),
(4, 'maxime', '1981-04-07', '15:19:53', '2024-09-26 09:48:41', '2024-09-26 09:48:41'),
(5, 'et', '2018-11-12', '13:03:52', '2024-09-26 09:50:55', '2024-09-26 09:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Karianne Kuhic', 'howell.daisy@example.net', '2024-09-26 09:06:00', '$2y$04$KykDOx2zuopd157NFin1LOYpaOEURE8vZkuFf8nnJaLhoCRNu2qyO', 'fhqbmt1eE6', '2024-09-26 09:06:00', '2024-09-26 09:06:00'),
(2, 'Dario Gleason', 'mckenzie21@example.com', '2024-09-26 09:10:42', '$2y$04$c35ooaUvyiIzuREwy6h96ejKXh6aCyB0A3NzJ9DOWQ8UfDh//5itC', 'mPBYXShfOZ', '2024-09-26 09:10:42', '2024-09-26 09:10:42'),
(3, 'Dr. Tristian Little', 'huel.katheryn@example.org', '2024-09-26 09:19:54', '$2y$04$Tra29AxML765vn5VuDNvXO.aNtTBmfucoX5gJ05/weZoqZCJ4Juam', 'Gaiml0eUbb', '2024-09-26 09:19:54', '2024-09-26 09:19:54'),
(4, 'Deondre Harris', 'rosalia66@example.net', '2024-09-26 09:43:27', '$2y$04$Yi.keg8PLh4gntXlspsf1eteQMQU1V1/edjcaSluyX02QF/k.jmum', 'TMZBTjBJR7', '2024-09-26 09:43:27', '2024-09-26 09:43:27'),
(5, 'Wilfred Rogahn', 'melvin.rath@example.org', '2024-09-26 09:46:09', '$2y$04$YWZq4PLsHtCrLQGS9RNqiuZncjgmQOlviMzC5kaVO9KOUeww6GK.i', 'jdsWFFjYGO', '2024-09-26 09:46:09', '2024-09-26 09:46:09'),
(6, 'Prof. Haley Beatty', 'erica.zulauf@example.com', '2024-09-26 09:48:40', '$2y$04$djPbQFgs9/jECshZhi2wcOCQEhpA.VAVVFjjFQL3omj46YOqVNcca', 'SlAhU8Z7A1', '2024-09-26 09:48:41', '2024-09-26 09:48:41'),
(7, 'Adan Raynor', 'darryl.luettgen@example.net', '2024-09-26 09:50:55', '$2y$04$eGQpTO7DIhn3SAD6OlGH/uj1otcuVFjWar7tGFVvu1hPA.NbDGBkm', '0OCGpiOuZr', '2024-09-26 09:50:55', '2024-09-26 09:50:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
