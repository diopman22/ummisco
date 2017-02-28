-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 14 Août 2015 à 11:30
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bdummisco1`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `login_admin` varchar(20) NOT NULL DEFAULT '',
  `motpassadmin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`login_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`login_admin`, `motpassadmin`) VALUES
('abou', 'chelsea'),
('localhost', 'repasser'),
('ousmane', 'sine');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `idArticle` int(11) NOT NULL AUTO_INCREMENT,
  `titreArticle` varchar(255) NOT NULL,
  `dateArticle` date NOT NULL,
  `contenuArticle` text NOT NULL,
  `idChercheur` int(11) NOT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `idChercheur` (`idChercheur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `chercheur`
--

CREATE TABLE IF NOT EXISTS `chercheur` (
  `idChercheur` int(11) NOT NULL,
  `domaine` varchar(255) NOT NULL,
  KEY `idChercheur` (`idChercheur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `chercheur`
--

INSERT INTO `chercheur` (`idChercheur`, `domaine`) VALUES
(21, 'fouille de donnÃ©e');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `idCours` int(11) NOT NULL AUTO_INCREMENT,
  `nomCours` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `coefficient` float NOT NULL,
  `credit` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  PRIMARY KEY (`idCours`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `cours`
--

INSERT INTO `cours` (`idCours`, `nomCours`, `description`, `coefficient`, `credit`, `categorie`) VALUES
(1, 'UML', 'conception et modÃ©lisation', 3, 3, 'Obligatoire'),
(3, 'MVC', 'cours sur le modÃ©le vue controleur', 2, 2, 'Optionnel'),
(10, 'Data Mining', 'cours sur le data mining', 2, 2, 'Obligatoire');

-- --------------------------------------------------------

--
-- Structure de la table `coursue`
--

CREATE TABLE IF NOT EXISTS `coursue` (
  `idCours` int(11) NOT NULL,
  `idUe` int(11) NOT NULL,
  KEY `idCours` (`idCours`),
  KEY `idUe` (`idUe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coursue`
--

INSERT INTO `coursue` (`idCours`, `idUe`) VALUES
(10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `idDocument` int(11) NOT NULL AUTO_INCREMENT,
  `nomDocument` varchar(255) NOT NULL,
  `adresseDoc` varchar(255) NOT NULL,
  `idChercheur` int(11) NOT NULL,
  PRIMARY KEY (`idDocument`),
  KEY `idChercheur` (`idChercheur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `idEtudiant` int(11) NOT NULL,
  `numeroCarte` varchar(255) NOT NULL,
  `Option` varchar(255) NOT NULL,
  KEY `idEtudiant` (`idEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`idEtudiant`, `numeroCarte`, `Option`) VALUES
(15, '7776645444433', 'Master'),
(16, '7776645444433', 'Master'),
(28, '14789332', '');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `idNote` int(11) NOT NULL AUTO_INCREMENT,
  `note` float NOT NULL,
  `idCours` int(11) NOT NULL,
  `idEtudiant` int(11) NOT NULL,
  PRIMARY KEY (`idNote`),
  KEY `idCours` (`idCours`),
  KEY `idEtudiant` (`idEtudiant`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `note`
--

INSERT INTO `note` (`idNote`, `note`, `idCours`, `idEtudiant`) VALUES
(1, 15, 1, 15),
(2, 14, 3, 16),
(3, 11, 3, 15),
(4, 10, 10, 15),
(5, 10, 1, 16),
(6, 9, 10, 16);

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE IF NOT EXISTS `planning` (
  `idPlanning` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `cours` varchar(255) NOT NULL,
  `idProfesseur` int(11) NOT NULL,
  PRIMARY KEY (`idPlanning`),
  KEY `idProfesseur` (`idProfesseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `planning`
--

INSERT INTO `planning` (`idPlanning`, `date_debut`, `date_fin`, `heure_debut`, `heure_fin`, `cours`, `idProfesseur`) VALUES
(1, '2015-07-16', '0000-00-00', '00:00:03', '00:00:00', 'UML', 19),
(2, '2015-07-29', '2015-08-06', '15:00:00', '18:00:00', 'UML', 19),
(3, '2015-07-30', '2015-08-14', '15:00:00', '18:00:00', 'MVC', 22),
(4, '2015-08-07', '2015-08-21', '10:00:00', '14:00:00', 'Data Mining', 23),
(5, '2015-08-02', '2015-08-15', '15:00:00', '17:00:00', 'MVC', 20);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE IF NOT EXISTS `professeur` (
  `idProfesseur` int(11) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  KEY `idProfesseur` (`idProfesseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`idProfesseur`, `grade`, `specialite`, `role`) VALUES
(19, 'Professeur', 'UML', '1'),
(20, 'Docteur', 'java', '1'),
(22, 'Docteur', 'IA', 'NULL'),
(23, 'Docteur', 'Algorithmique', '1'),
(24, 'Docteur', 'rÃ©seaux', 'NULL'),
(25, 'Docteur', 'Superviseur', '1'),
(26, 'Docteur', 'Reseaux', 'NULL'),
(27, 'Docteur', 'php', 'NULL');

-- --------------------------------------------------------

--
-- Structure de la table `professeursupport`
--

CREATE TABLE IF NOT EXISTS `professeursupport` (
  `idProfesseur` int(11) NOT NULL,
  `idSupport` int(11) NOT NULL,
  KEY `idProfesseur` (`idProfesseur`),
  KEY `idSupport` (`idSupport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

CREATE TABLE IF NOT EXISTS `support` (
  `idSupport` int(11) NOT NULL AUTO_INCREMENT,
  `nomSupport` varchar(255) NOT NULL,
  `typeSupport` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  PRIMARY KEY (`idSupport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

CREATE TABLE IF NOT EXISTS `ue` (
  `idUe` int(11) NOT NULL AUTO_INCREMENT,
  `nomUe` varchar(255) NOT NULL,
  `idProfesseur` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`idUe`),
  KEY `idProfesseur` (`idProfesseur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `ue`
--

INSERT INTO `ue` (`idUe`, `nomUe`, `idProfesseur`, `libelle`) VALUES
(10, 'UE 532', 19, 'Data Mining'),
(12, 'UE 531', 19, 'Algorithme et Programmation'),
(13, 'UE 530', 19, 'Intelligence artificielle');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `motpass` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `num_tel` varchar(20) DEFAULT NULL,
  `valide` int(11) NOT NULL,
  `type_user` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `login`, `motpass`, `nom`, `prenom`, `email`, `num_tel`, `valide`, `type_user`) VALUES
(2, 'localhost', 'repasser', 'thiam', 'thier', 'thiernothiam@esp.sn', '776691903', 0, 0),
(3, 'Piipen', 'papa', 'Dieng Salla', 'Papa Ibrahima', 'ppp@esp.sn', '775547666', 0, 0),
(9, 'ilo', 'passer', 'Lo', 'ilo', 'thiamthierno81@live.', '777Â²', 0, 0),
(10, 'dicko', 'diengsala', 'Dieng', 'Abdou', 'thiamthierno81@live.', '776691903', 0, 0),
(11, 'expert', 'repaser', 'Gaye', 'Thierno', 'thiamthierno81@live.', '77666109', 0, 0),
(12, 'gass', 'passer', 'Gassama', 'Astou', 'thiamthierno81@live.', '77666109', 0, 0),
(13, 'cambe', 'kaolack', 'Samb', 'Abdou', 'cambe@esp.sn', '66666666666666', 0, 0),
(14, 'mans', 'passer', 'DIOP', 'Mansour', 'man@gmail.com', '778135522', 0, 0),
(15, 'piippen', 'passer', 'Dieng', 'papa Ibrahima', 'pid@esp.sn', '77666109', 0, 3),
(16, 'kheuch', 'passer', 'Niang', 'Baye Cheikh', 'pid@esp.sn', '77666109', 0, 3),
(19, 'bapoulo', 'passer', 'Ba', 'alassane', 'pid@esp.sn', '77666109', 0, 1),
(20, 'ifall', 'passer', 'Fall', 'Ibrahima', 'ifall@esp.sn', '778160409', 0, 1),
(21, 'medteck', 'passer', 'Diop', 'Mohamed', 'med@esp.sn', '7766542312', 0, 2),
(22, 'mbackiou', 'passer', 'Mbacke', 'Ahmath Bamba', 'bamba@esp.sn', '7788881809', 0, 1),
(23, 'grvais', 'passer', 'Mendy', 'Gervais', 'thiamthierno81@live.', '77666109', 0, 1),
(24, 'idiop', 'passer', 'Diop', 'Idy', 'thiamthierno81@live.', '77666109', 0, 1),
(25, 'python', 'passer', 'Python', 'Paul', 'python@esp.sn', '8800987', 0, 1),
(26, 'ngom', 'passer', 'Ngom', 'Mamadou', 'thiamthierno81@live.', '77', 0, 1),
(27, 'kaba', 'passer', 'Sall', 'Kaba', 'thiamthierno81@live.', '77666109', 0, 1),
(28, 'thiam', 'passer', 'THIAM', 'Thierno', 'thiam@gmail.com', '776691903', 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `videoconference`
--

CREATE TABLE IF NOT EXISTS `videoconference` (
  `idVideo` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) NOT NULL,
  `dateVideo` date NOT NULL,
  `heureVideo` time NOT NULL,
  `idChercheur` int(11) NOT NULL,
  PRIMARY KEY (`idVideo`),
  KEY `idChercheur` (`idChercheur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`idChercheur`) REFERENCES `chercheur` (`idChercheur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `chercheur`
--
ALTER TABLE `chercheur`
  ADD CONSTRAINT `chercheur_ibfk_1` FOREIGN KEY (`idChercheur`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `coursue`
--
ALTER TABLE `coursue`
  ADD CONSTRAINT `coursue_ibfk_1` FOREIGN KEY (`idCours`) REFERENCES `cours` (`idCours`) ON DELETE CASCADE,
  ADD CONSTRAINT `coursue_ibfk_2` FOREIGN KEY (`idUe`) REFERENCES `ue` (`idUe`) ON DELETE CASCADE;

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`idChercheur`) REFERENCES `chercheur` (`idChercheur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`idCours`) REFERENCES `cours` (`idCours`) ON DELETE CASCADE,
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`) ON DELETE CASCADE;

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`idProfesseur`) REFERENCES `professeur` (`idProfesseur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`idProfesseur`) REFERENCES `utilisateur` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `professeursupport`
--
ALTER TABLE `professeursupport`
  ADD CONSTRAINT `professeursupport_ibfk_1` FOREIGN KEY (`idProfesseur`) REFERENCES `professeur` (`idProfesseur`) ON DELETE CASCADE,
  ADD CONSTRAINT `professeursupport_ibfk_2` FOREIGN KEY (`idSupport`) REFERENCES `support` (`idSupport`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`idProfesseur`) REFERENCES `professeur` (`idProfesseur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `videoconference`
--
ALTER TABLE `videoconference`
  ADD CONSTRAINT `videoconference_ibfk_1` FOREIGN KEY (`idChercheur`) REFERENCES `chercheur` (`idChercheur`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
