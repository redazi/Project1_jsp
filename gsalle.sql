-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 08:42 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsalle`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Matricule` varchar(20) NOT NULL,
  `motdepasse` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Matricule`, `motdepasse`) VALUES
('admin', '147258');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`login`, `password`, `id`) VALUES
('fref', 'ezfezfe', 7),
('reda', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `email` varchar(35) NOT NULL,
  `id` int(10) NOT NULL,
  `message` varchar(60) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`email`, `id`, `message`, `nom`, `phone`) VALUES
('dze@gmail.com', 1, 'trgtrgrtgrtgttr', 'zedezze', 685315318),
('dze@gmail.com', 2, 'dezezfzefez', 'fzfez', 685315318),
('ffef@gmail.com', 3, 'fefrefer', 'zedezze', 685315318);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `datedebut` varchar(20) NOT NULL,
  `datefin` varchar(20) NOT NULL,
  `datereservation` date NOT NULL,
  `email_c` varchar(30) NOT NULL,
  `log` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `valide` int(10) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`datedebut`, `datefin`, `datereservation`, `email_c`, `log`, `code`, `valide`, `id`) VALUES
('21:00', '22:00', '2022-01-25', 'azd@gmail.com', 'reda', 'ACK1234', 0, 7),
('09:00', '10:00', '2022-02-22', 'azd@gmail.com', 'reda', 'ACK1234xs', -1, 5),
('03:00', '06:08', '2022-12-22', 'azd@gmail.com', 'reda', 'dzedezd', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` int(10) NOT NULL,
  `code` varchar(20) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `code`, `libelle`) VALUES
(1, 'ACK1234', 'salle 1'),
(7, 'ACK1234xs', 'salle 12'),
(2, 'ACR1123', '1578'),
(4, 'dzedezd', '168zedde'),
(5, 'QAZS1475', 'salle 3'),
(9, 'ssd', 'dzzed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Matricule`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`login`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`log`,`code`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_code` (`code`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_code` FOREIGN KEY (`code`) REFERENCES `salle` (`code`),
  ADD CONSTRAINT `FK_login` FOREIGN KEY (`log`) REFERENCES `auth` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
