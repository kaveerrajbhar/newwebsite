-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 10:29 AM
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
-- Database: `student_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `Std` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `price`, `quantity`, `image`, `Std`, `created_at`, `updated_at`) VALUES
(1, 'hello', 200.00, 40, 'books/std-3/1721040475_Screenshot 2024-05-17 112519.png', 'std-3', '2024-07-12 05:34:24', '2024-07-15 10:47:55'),
(2, 'english', 300.00, 40, 'books/std-1/1721044822_Screenshot 2024-06-24 174125.png', 'std-1', '2024-07-12 05:37:35', '2024-07-15 12:00:22'),
(3, 'heop', 200.00, 20, 'books/std-3/1721040048_Screenshot 2024-05-17 104401.png', 'std-3', '2024-07-12 05:58:45', '2024-07-15 10:40:48'),
(4, 'abc', 500.00, 50, 'books/std-2/1721045033_Screenshot 2024-07-01 144447.png', 'std-2', '2024-07-15 12:03:53', '2024-07-15 12:03:53');

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
(5, '2024_06_03_122227_create_students_table', 1),
(6, '2024_06_07_093629_create_books_table', 2),
(7, '2024_06_07_094114_create_notebooks_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notebooks`
--

CREATE TABLE `notebooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `srno` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `Std` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `srno`, `name`, `father`, `mobile`, `Std`, `created_at`, `updated_at`) VALUES
(1003, 103, 'Student 1C', 'Father C', '1234567003', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1004, 104, 'Student 1D', 'Father D', '1234567004', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1005, 105, 'Student 1E', 'Father E', '1234567005', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1007, 107, 'Student 1G', 'Father G', '1234567007', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1008, 108, 'Student 1H', 'Father H', '1234567008', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1009, 109, 'Student 1I', 'Father I', '1234567009', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1010, 110, 'Student 1J', 'Father J', '1234567010', 'std-1', '2024-06-07 07:22:25', '2024-06-07 07:22:25'),
(1011, 111, 'Student 2A', 'Father A', '1234567011', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1013, 113, 'Student 2C', 'Father C', '1234567013', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1014, 114, 'Student 2D', 'Father D', '1234567014', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1015, 115, 'Student 2E', 'Father E', '1234567015', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1016, 116, 'Student 2F', 'Father F', '1234567016', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1017, 117, 'Student 2G', 'Father G', '1234567017', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1018, 118, 'Student 2H', 'Father H', '1234567018', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1019, 119, 'Student 2I', 'Father I', '1234567019', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1020, 120, 'Student 2J', 'Father J', '1234567020', 'std-2', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1021, 121, 'Student 3A', 'Father A', '1234567021', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1022, 122, 'Student 3B', 'Father B', '1234567022', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1023, 123, 'Student 3C', 'Father C', '1234567023', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1024, 124, 'Student 3D', 'Father D', '1234567024', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1025, 125, 'Student 3E', 'Father E', '1234567025', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1026, 126, 'Student 3F', 'Father F', '1234567026', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1027, 127, 'Student 3G', 'Father G', '1234567027', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1028, 128, 'Student 3H', 'Father H', '1234567028', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1029, 129, 'Student 3I', 'Father I', '1234567029', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1030, 130, 'Student 3J', 'Father J', '1234567030', 'std-3', '2024-06-07 08:11:05', '2024-06-07 08:11:05'),
(1031, 10010, 'kabir', 'abc', '7464805709', 'std-3', '2024-07-10 04:49:40', '2024-07-10 04:49:40'),
(1032, 10012, 'kabir rajbhar', 'abc', '7464805709', 'std-3', '2024-07-10 04:51:44', '2024-07-10 04:51:44'),
(1033, 10014, 'vishal', 'abcd', '7464805709', 'std-4', '2024-07-10 05:12:44', '2024-07-10 05:12:44');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
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
-- Indexes for table `notebooks`
--
ALTER TABLE `notebooks`
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
-- Indexes for table `students`
--
ALTER TABLE `students`
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
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notebooks`
--
ALTER TABLE `notebooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1034;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
