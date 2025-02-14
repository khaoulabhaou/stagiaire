-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 09:30 AM
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
-- Database: `gestion_stagiaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE `administrateur` (
  `ID_administrateur` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prénom` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande`
--

CREATE TABLE `demande` (
  `ID_demande` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `niveau` varchar(20) DEFAULT NULL,
  `statue` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demande_stagiaire`
--

CREATE TABLE `demande_stagiaire` (
  `ID_demande` int(11) DEFAULT NULL,
  `ID_stagiaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encadrants`
--

CREATE TABLE `encadrants` (
  `ID_encadrants` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prénom` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `ID_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encadrant_stagiaire`
--

CREATE TABLE `encadrant_stagiaire` (
  `ID_encadrants` int(11) DEFAULT NULL,
  `ID_stagiaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE `etablissement` (
  `ID_etablissement` int(11) NOT NULL,
  `nom_etablissement` varchar(100) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL,
  `abréviation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responsable_stages`
--

CREATE TABLE `responsable_stages` (
  `ID_encadrants` int(11) DEFAULT NULL,
  `ID_stage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ID_service` int(11) NOT NULL,
  `nom_service` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `ID_stage` int(11) NOT NULL,
  `titre` varchar(20) DEFAULT NULL,
  `date_début` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `ID_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stagiaire`
--

CREATE TABLE `stagiaire` (
  `ID_stagiaire` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prénom` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `téléphone` varchar(20) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `ID_administrateur` int(11) DEFAULT NULL,
  `ID_stage` int(11) DEFAULT NULL,
  `ID_service` int(11) DEFAULT NULL,
  `ID_etablissement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`ID_administrateur`);

--
-- Indexes for table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`ID_demande`);

--
-- Indexes for table `demande_stagiaire`
--
ALTER TABLE `demande_stagiaire`
  ADD KEY `fkIDS1` (`ID_stagiaire`),
  ADD KEY `fkIDem` (`ID_demande`);

--
-- Indexes for table `encadrants`
--
ALTER TABLE `encadrants`
  ADD PRIMARY KEY (`ID_encadrants`),
  ADD KEY `fkIDsSE` (`ID_service`);

--
-- Indexes for table `encadrant_stagiaire`
--
ALTER TABLE `encadrant_stagiaire`
  ADD KEY `fkIDS` (`ID_stagiaire`),
  ADD KEY `fkIDEn` (`ID_encadrants`);

--
-- Indexes for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`ID_etablissement`);

--
-- Indexes for table `responsable_stages`
--
ALTER TABLE `responsable_stages`
  ADD KEY `fkIDStage1` (`ID_stage`),
  ADD KEY `fkIDEcadrent` (`ID_encadrants`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID_service`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`ID_stage`),
  ADD KEY `fkIDsSE1` (`ID_service`);

--
-- Indexes for table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD PRIMARY KEY (`ID_stagiaire`),
  ADD KEY `fktabl` (`ID_etablissement`),
  ADD KEY `fkIDA` (`ID_administrateur`),
  ADD KEY `fkIDStage` (`ID_stage`),
  ADD KEY `fkIDSE` (`ID_service`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `demande_stagiaire`
--
ALTER TABLE `demande_stagiaire`
  ADD CONSTRAINT `fkIDS1` FOREIGN KEY (`ID_stagiaire`) REFERENCES `stagiaire` (`ID_stagiaire`),
  ADD CONSTRAINT `fkIDem` FOREIGN KEY (`ID_demande`) REFERENCES `demande` (`ID_demande`);

--
-- Constraints for table `encadrants`
--
ALTER TABLE `encadrants`
  ADD CONSTRAINT `fkIDsSE` FOREIGN KEY (`ID_service`) REFERENCES `service` (`ID_service`);

--
-- Constraints for table `encadrant_stagiaire`
--
ALTER TABLE `encadrant_stagiaire`
  ADD CONSTRAINT `fkIDEn` FOREIGN KEY (`ID_encadrants`) REFERENCES `encadrants` (`ID_encadrants`),
  ADD CONSTRAINT `fkIDS` FOREIGN KEY (`ID_stagiaire`) REFERENCES `stagiaire` (`ID_stagiaire`);

--
-- Constraints for table `responsable_stages`
--
ALTER TABLE `responsable_stages`
  ADD CONSTRAINT `fkIDEcadrent` FOREIGN KEY (`ID_encadrants`) REFERENCES `encadrants` (`ID_encadrants`),
  ADD CONSTRAINT `fkIDStage1` FOREIGN KEY (`ID_stage`) REFERENCES `stages` (`ID_stage`);

--
-- Constraints for table `stages`
--
ALTER TABLE `stages`
  ADD CONSTRAINT `fkIDsSE1` FOREIGN KEY (`ID_service`) REFERENCES `service` (`ID_service`);

--
-- Constraints for table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `fkIDA` FOREIGN KEY (`ID_administrateur`) REFERENCES `administrateur` (`ID_administrateur`),
  ADD CONSTRAINT `fkIDSE` FOREIGN KEY (`ID_service`) REFERENCES `service` (`ID_service`),
  ADD CONSTRAINT `fkIDStage` FOREIGN KEY (`ID_stage`) REFERENCES `stages` (`ID_stage`),
  ADD CONSTRAINT `fktabl` FOREIGN KEY (`ID_etablissement`) REFERENCES `etablissement` (`ID_etablissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
