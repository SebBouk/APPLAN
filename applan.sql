-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 28 juin 2024 à 13:15
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `applan`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `nomCat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nomCat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chronos`
--

DROP TABLE IF EXISTS `chronos`;
CREATE TABLE IF NOT EXISTS `chronos` (
  `jeu_id` bigint UNSIGNED NOT NULL,
  `phase_id` bigint UNSIGNED NOT NULL,
  `point_de_base` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facteur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `chronos_jeu_id_foreign` (`jeu_id`),
  KEY `chronos_phase_id_foreign` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `correspond`
--

DROP TABLE IF EXISTS `correspond`;
CREATE TABLE IF NOT EXISTS `correspond` (
  `jeu_id` bigint UNSIGNED NOT NULL,
  `cat_id` bigint UNSIGNED NOT NULL,
  KEY `correspond_jeu_id_foreign` (`jeu_id`),
  KEY `correspond_cat_id_foreign` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `joueur_id` bigint UNSIGNED NOT NULL,
  `phase_id` bigint UNSIGNED NOT NULL,
  `score` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `historique_joueur_id_foreign` (`joueur_id`),
  KEY `historique_phase_id_foreign` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeux`
--

DROP TABLE IF EXISTS `jeux`;
CREATE TABLE IF NOT EXISTS `jeux` (
  `nomJeu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlImage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nomJeu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

DROP TABLE IF EXISTS `joue`;
CREATE TABLE IF NOT EXISTS `joue` (
  `joueur_id` bigint UNSIGNED NOT NULL,
  `phase_id` bigint UNSIGNED NOT NULL,
  `score` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `joue_joueur_id_foreign` (`joueur_id`),
  KEY `joue_phase_id_foreign` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
  `login_id` bigint UNSIGNED DEFAULT NULL,
  `prenom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlTwitch` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlYoutube` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `joueurs_login_id_foreign` (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`login_id`, `prenom`, `nom`, `urlTwitch`, `urlYoutube`, `description`) VALUES
(NULL, 'seb', 'boukob', 'twwitch', 'youtubbe', 'le week-end');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_21_092226_create_jeux_table', 1),
(5, '2024_06_21_093607_create_vignettes_table', 1),
(6, '2024_06_21_094332_create_categories_table', 1),
(7, '2024_06_21_095154_create_objectifs_table', 1),
(8, '2024_06_21_095317_create_phases_table', 1),
(9, '2024_06_21_095424_create_joueurs_table', 1),
(10, '2024_06_21_100502_create_correspond_table', 1),
(11, '2024_06_21_121512_create_chronos_table', 1),
(12, '2024_06_21_121732_create_point_table', 1),
(13, '2024_06_21_121824_create_point_objectif_table', 1),
(14, '2024_06_21_121945_create_joue_table', 1),
(15, '2024_06_24_091154_create_historique_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `objectifs`
--

DROP TABLE IF EXISTS `objectifs`;
CREATE TABLE IF NOT EXISTS `objectifs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valeur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phases`
--

DROP TABLE IF EXISTS `phases`;
CREATE TABLE IF NOT EXISTS `phases` (
  `nomPhase` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eliminatoire` tinyint(1) NOT NULL,
  PRIMARY KEY (`nomPhase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `point`
--

DROP TABLE IF EXISTS `point`;
CREATE TABLE IF NOT EXISTS `point` (
  `jeu_id` bigint UNSIGNED NOT NULL,
  `phase_id` bigint UNSIGNED NOT NULL,
  KEY `point_jeu_id_foreign` (`jeu_id`),
  KEY `point_phase_id_foreign` (`phase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `point_objectif`
--

DROP TABLE IF EXISTS `point_objectif`;
CREATE TABLE IF NOT EXISTS `point_objectif` (
  `jeu_id` bigint UNSIGNED NOT NULL,
  `phase_id` bigint UNSIGNED NOT NULL,
  `objectif_id` bigint UNSIGNED NOT NULL,
  KEY `point_objectif_jeu_id_foreign` (`jeu_id`),
  KEY `point_objectif_phase_id_foreign` (`phase_id`),
  KEY `point_objectif_objectif_id_foreign` (`objectif_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3lSnQAmvf4wXXVwC9KZ8g36Bz3ID0sYZEedjnCR6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFNhQUFMaTQ1VHJKQTZTOTh5U2s4c0R4TmQ0MGFLbFFGZXNaeGhFTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qb3VldXJzL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719567369),
('WKtT1LT3R07J5t5K31yAVkup7IOuAlIkhbQgnutY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVNVVXZ4TWVndE1vMjdtd3V2cHV6b3hCV3ZlM3Yzc2VQbHVhNDRZeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qb3VldXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719412911),
('0nnuLUak7bDcPsWJv4gsKV3D4NVKTMbVRgI4dQFJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG45ZzR5bVRNOXk4WUZmakxHR3dnNHcwMTNqeGlDdGg1SGFkNDViZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9qb3VldXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719580376);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `login` int NOT NULL,
  `mdp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idUser` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`login`),
  UNIQUE KEY `unique` (`idUser`)
) ENGINE=MyISAM AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`login`, `mdp`, `remember_token`, `created_at`, `updated_at`, `idUser`) VALUES
(198, '$2y$12$NfD6gZEQnjc8LCOX1pdezepAJnkncj7yL4LPnpKy4wn/5ccy.yrjW', NULL, NULL, NULL, 2012),
(199, '$2y$12$SS2IZ0j2.ZjJFQsrznmNoucNSoAR11IQTzuypwpoX6Y3j88fcHxM.', NULL, NULL, NULL, 2011),
(1999, '$2y$12$rSDORmPZnYVUcDLIpX7dAegdRJx5IhDDATE.BTZju6nifhg1kUHsG', NULL, NULL, NULL, 2010),
(19999, '$2y$12$cid8DNa2hpC0KFT0rcEAmuk5RPwC0hfwYXGTNfhPzv2h5JVFQ0I9S', NULL, NULL, NULL, 2009),
(200, '$2y$12$VQ2wCFy.phNJYjKfP3lBAOslfzu4K7N6aZJz2NZ85lY9XSAtU23s2', NULL, NULL, NULL, 2008),
(1909, '$2y$12$6HEqkTbnfhKFdcRTc4n1kOdpP3B8oyl44OvNGvqGc.JqC.3NatudG', NULL, NULL, NULL, 2007);

-- --------------------------------------------------------

--
-- Structure de la table `vignettes`
--

DROP TABLE IF EXISTS `vignettes`;
CREATE TABLE IF NOT EXISTS `vignettes` (
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jeu_id` bigint UNSIGNED NOT NULL,
  KEY `vignettes_jeu_id_foreign` (`jeu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
