-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 31 Décembre 2024 à 15:29
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `freelancerdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `date` datetime NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `expediteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl8xlu71rivq1ica7j953fepec` (`destinataire_id`),
  KEY `FK6x9px06xy8gm0r4incqrwiun` (`expediteur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `contenu`, `date`, `destinataire_id`, `expediteur_id`) VALUES
(1, 'maw', '2024-12-31 14:41:21', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anneeExperience` int(11) DEFAULT NULL,
  `biblio` varchar(255) DEFAULT NULL,
  `disponibilite` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q1ahp4x6s0ae4hwhcd1bnw36o` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` (`id`, `anneeExperience`, `biblio`, `disponibilite`, `rating`, `skills`, `user_id`) VALUES
(1, 454, 'gf', 'bhc', 12, 'vg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget` float NOT NULL,
  `date_limite` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `nbre_heures` int(11) NOT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK59iquxtd02ud6e45eguj99kms` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `project`
--

INSERT INTO `project` (`id`, `budget`, `date_limite`, `description`, `etat`, `nbre_heures`, `technologies`, `titre`, `client_id`, `statut`) VALUES
(1, 5000, '2025-01-31', 'spring mvc freelance platform', NULL, 70, 'js- spring-java - ', 'spring', 2, 'Opened'),
(2, 545, '2025-10-10', 'nvg', NULL, 10, 'nvxf', 'gfdg', 2, 'f');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

CREATE TABLE IF NOT EXISTS `proposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `duree` int(11) NOT NULL,
  `montant` float NOT NULL,
  `freelancer_id` int(11) DEFAULT NULL,
  `proj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbx9f32wjs1hkhbgienu257j` (`freelancer_id`),
  KEY `FKjuba2w3ltr02cxww1n2ncpfn7` (`proj_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `proposition`
--

INSERT INTO `proposition` (`id`, `description`, `duree`, `montant`, `freelancer_id`, `proj_id`) VALUES
(1, 'zf', 10, 10, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'ROLE_FREELANCER'),
(2, 'ROLE_CLIENT');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK84qlpfci484r1luck11eno6ec` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `enabled`, `nom`, `password`, `username`, `role_id`) VALUES
(1, 'wael@gmail.com', b'1', 'wael', '$2a$10$jplOX5PHLHui3wkO797vFulk1edfx94YcTVWT0D4R9jw4HtAu2J7K', 'wael', 1),
(2, 'amine@gmail.com', b'1', 'amine', '$2a$10$FmEtgFseOd2G5Wp/5itXdu.hLD0MMf.jY6wkyYOfFcZz/lZeK5YW.', 'amine', 2);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK6x9px06xy8gm0r4incqrwiun` FOREIGN KEY (`expediteur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKl8xlu71rivq1ica7j953fepec` FOREIGN KEY (`destinataire_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK9ke43amidbypdepae19k20a12` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK59iquxtd02ud6e45eguj99kms` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `FKjuba2w3ltr02cxww1n2ncpfn7` FOREIGN KEY (`proj_id`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `FKsbx9f32wjs1hkhbgienu257j` FOREIGN KEY (`freelancer_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK84qlpfci484r1luck11eno6ec` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
