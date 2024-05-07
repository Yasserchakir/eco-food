-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 07 mai 2024 à 09:43
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eco-food`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(20) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_Category` int(20) NOT NULL,
  `name_Category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `createcategory`
--

CREATE TABLE `createcategory` (
  `id_user` int(20) NOT NULL,
  `id_Category` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

CREATE TABLE `offer` (
  `id_offer` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `start_date_time` int(15) NOT NULL,
  `end_date_time` int(15) NOT NULL,
  `image_url` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `rate` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `id_Category` int(20) NOT NULL,
  `id_user` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id_order` int(20) NOT NULL,
  `creation_date_time` int(20) NOT NULL,
  `total_amount` int(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_offer` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vieworderhistory`
--

CREATE TABLE `vieworderhistory` (
  `id_admin` int(20) NOT NULL,
  `id_order` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_Category`);

--
-- Index pour la table `createcategory`
--
ALTER TABLE `createcategory`
  ADD PRIMARY KEY (`id_user`,`id_Category`),
  ADD UNIQUE KEY `id_Category` (`id_Category`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id_offer`),
  ADD KEY `id_Category` (`id_Category`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD UNIQUE KEY `id_order` (`id_order`),
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `vieworderhistory`
--
ALTER TABLE `vieworderhistory`
  ADD PRIMARY KEY (`id_admin`,`id_order`),
  ADD UNIQUE KEY `id_admin` (`id_admin`),
  ADD KEY `id_order` (`id_order`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `createcategory`
--
ALTER TABLE `createcategory`
  ADD CONSTRAINT `createcategory_ibfk_2` FOREIGN KEY (`id_Category`) REFERENCES `category` (`id_Category`),
  ADD CONSTRAINT `createcategory_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`id_Category`) REFERENCES `category` (`id_Category`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offer` (`id_offer`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `vieworderhistory`
--
ALTER TABLE `vieworderhistory`
  ADD CONSTRAINT `vieworderhistory_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`),
  ADD CONSTRAINT `vieworderhistory_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
