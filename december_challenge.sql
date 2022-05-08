-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-05-2022 a las 20:30:06
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `december_challenge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `currency`, `address`, `balance`, `created_at`, `updated_at`) VALUES
(1, '2', 'EUR', '716 Lauretta Row Suite 982\nNorth Shannaborough, MT 97421', -85831.74, '2022-05-06 21:08:54', '2022-05-08 22:29:42'),
(2, '6', 'USD', '2513 Luciano Orchard Apt. 814\nNorth Andre, CO 65598', 1100.00, '2022-05-06 21:08:54', '2022-05-08 22:42:16'),
(3, '10', 'UYU', '78581 Elody Divide\nEast Chanelfort, NY 38159', 453.98, '2022-05-06 21:08:54', '2022-05-08 22:30:57'),
(4, '8', 'UYU', '7723 Joyce Oval Apt. 501\nSchuppestad, NC 40520-7748', 4579.46, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(5, '5', 'EUR', '8346 Spinka Trail\nNew Yoshiko, ND 11087-9332', 2996.56, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(6, '7', 'EUR', '6340 Homenick Pine\nPort Hazel, WV 90108', 4981.87, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(7, '6', 'UYU', '894 Jean Lodge Suite 127\nSouth Giovannaview, NE 47620', 3683.00, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(8, '5', 'UYU', '678 Considine Mission Apt. 510\nCruickshankside, MA 60976-4234', 1798.18, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(9, '5', 'EUR', '3993 Fleta Tunnel\nEast Norwood, TX 14069', 5448.28, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(10, '7', 'EUR', '3849 Prosacco Lights Suite 629\nNew Boris, IN 43042', 1183.69, '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(11, '11', 'USD', '4500 Prosacco Lights Suite 669 New Boris, IN 43042', 589.00, '2022-05-08 03:00:00', '2022-05-08 22:42:16'),
(15, '11', 'EUR', '4300 Valladolid, España', 284.40, '2022-05-08 03:00:00', '2022-05-08 22:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_transaction`
--

DROP TABLE IF EXISTS `account_transaction`;
CREATE TABLE IF NOT EXISTS `account_transaction` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `account_transaction`
--

INSERT INTO `account_transaction` (`id`, `account_id`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(2, 9, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 10, 2, NULL, NULL),
(5, 1, 3, NULL, NULL),
(6, 7, 3, NULL, NULL),
(7, 5, 4, NULL, NULL),
(8, 6, 4, NULL, NULL),
(9, 2, 5, NULL, NULL),
(10, 7, 5, NULL, NULL),
(11, 4, 6, NULL, NULL),
(12, 7, 6, NULL, NULL),
(13, 1, 7, NULL, NULL),
(14, 6, 7, NULL, NULL),
(15, 4, 8, NULL, NULL),
(16, 8, 8, NULL, NULL),
(17, 2, 9, NULL, NULL),
(18, 6, 9, NULL, NULL),
(19, 4, 10, NULL, NULL),
(20, 9, 10, NULL, NULL),
(21, 1, 22, NULL, NULL),
(22, 3, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 3, 23, NULL, NULL),
(25, 15, 24, NULL, NULL),
(26, 11, 24, NULL, NULL),
(27, 15, 25, NULL, NULL),
(28, 11, 25, NULL, NULL),
(29, 11, 26, NULL, NULL),
(30, 1, 26, NULL, NULL),
(31, 11, 27, NULL, NULL),
(32, 3, 27, NULL, NULL),
(33, 11, 28, NULL, NULL),
(34, 3, 28, NULL, NULL),
(35, 11, 29, NULL, NULL),
(36, 15, 29, NULL, NULL),
(37, 11, 30, NULL, NULL),
(38, 15, 30, NULL, NULL),
(39, 11, 31, NULL, NULL),
(40, 15, 31, NULL, NULL),
(41, 11, 32, NULL, NULL),
(42, 2, 32, NULL, NULL),
(43, 11, 33, NULL, NULL),
(44, 2, 33, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_06_125928_create_transactions_table', 1),
(6, '2022_05_06_125957_create_accounts_table', 1),
(7, '2022_05_06_173555_create_account_transactions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` double(8,2) NOT NULL,
  `account_from` int(11) NOT NULL,
  `account_to` int(11) NOT NULL,
  `account_from_currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_to_currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `account_from`, `account_to`, `account_from_currency`, `account_to_currency`, `created_at`, `updated_at`) VALUES
(1, 7522.53, 4, 9, 'UYU', 'EUR', '2022-10-09 21:08:54', '2022-05-06 21:08:54'),
(2, 3056.99, 2, 10, 'UYU', 'EUR', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(3, 8308.44, 1, 7, 'EUR', 'UYU', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(4, 2457.04, 5, 6, 'EUR', 'EUR', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(5, 4669.38, 2, 7, 'UYU', 'UYU', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(6, 8222.14, 4, 7, 'UYU', 'UYU', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(7, 4564.49, 1, 6, 'EUR', 'EUR', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(8, 8297.58, 4, 8, 'UYU', 'UYU', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(9, 3622.31, 2, 6, 'UYU', 'EUR', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(10, 9710.35, 4, 9, 'UYU', 'EUR', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(22, 10000.00, 1, 3, 'EUR', 'UYU', '2022-05-06 21:46:20', '2022-05-06 21:46:20'),
(23, 10000.00, 1, 3, 'EUR', 'UYU', '2022-01-01 21:46:39', '2022-05-06 21:46:39'),
(24, 1000.00, 15, 11, 'EUR', 'USD', '2022-05-08 22:26:44', '2022-05-08 22:26:44'),
(25, 1000.00, 15, 11, 'EUR', 'USD', '2022-05-08 22:29:17', '2022-05-08 22:29:17'),
(26, 1000.00, 11, 1, 'USD', 'EUR', '2022-05-08 22:29:42', '2022-05-08 22:29:42'),
(27, 10.00, 11, 3, 'USD', 'UYU', '2022-05-08 22:30:33', '2022-05-08 22:30:33'),
(28, 1.00, 11, 3, 'USD', 'UYU', '2022-05-08 22:30:57', '2022-05-08 22:30:57'),
(29, 100.00, 11, 15, 'USD', 'EUR', '2022-05-08 22:37:26', '2022-05-08 22:37:26'),
(30, 100.00, 11, 15, 'USD', 'EUR', '2022-05-08 22:39:32', '2022-05-08 22:39:32'),
(31, 100.00, 11, 15, 'USD', 'EUR', '2022-05-08 22:39:44', '2022-05-08 22:39:44'),
(32, 100.00, 11, 2, 'USD', 'USD', '2022-05-08 22:41:54', '2022-05-08 22:41:54'),
(33, 1000.00, 11, 2, 'USD', 'USD', '2022-05-08 22:42:16', '2022-05-08 22:42:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rhiannon Veum', 'demario62@example.net', '2022-05-06 21:08:54', 'admin1234', 'AwZZdYOPBp', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(2, 'Raymond Rippin', 'shields.emmy@example.com', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JdIKa6j3sC', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(3, 'Dr. Joanny Powlowski', 'rau.otha@example.org', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GPR5kh4RsE', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(4, 'Baron Gerlach', 'seamus97@example.com', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8t25vRBbhy', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(5, 'Prof. Kevin Stoltenberg I', 'johnpaul71@example.net', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rDKhhd1joJ', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(6, 'Mrs. Bessie Dickens I', 'bmitchell@example.org', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sI6kXCXZRS', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(7, 'Sylvia Tillman', 'maggio.flavio@example.net', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jr5aICckvZ', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(8, 'George Ward', 'emraz@example.com', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wnpLZuUnJI', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(9, 'Oda Wiegand', 'pmayert@example.net', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BtjGoSWxEG', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(10, 'Garry Morar', 'kovacek.salvatore@example.org', '2022-05-06 21:08:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HkspQiSr4I', '2022-05-06 21:08:54', '2022-05-06 21:08:54'),
(11, 'admin', 'admin@admin', NULL, '$2y$10$n.xCpb9zx0ny.5AjTItWJ.Ht8p7bzvPHVawNSleCHPUywQjWkwboO', NULL, '2022-05-08 21:49:47', '2022-05-08 21:49:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
