-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 05 apr 2016 om 18:20
-- Serverversie: 5.7.9
-- PHP-versie: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linux`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `power`
--

DROP TABLE IF EXISTS `power`;
CREATE TABLE IF NOT EXISTS `power` (
  `idpower` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `power` tinyint(1) NOT NULL,
  PRIMARY KEY (`idpower`),
  UNIQUE KEY `idpower_UNIQUE` (`idpower`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `power`
--

INSERT INTO `power` (`idpower`, `time`, `power`) VALUES
(1, '2016-03-21 21:39:07', 1),
(2, '2016-03-21 21:42:07', 0),
(3, '2016-03-21 21:48:07', 1),
(4, '2016-03-21 22:00:07', 0),
(5, '2016-03-21 22:06:44', 1),
(6, '2016-03-21 22:07:02', 0),
(7, '2016-03-21 22:08:01', 1),
(8, '2016-03-21 22:08:15', 0),
(9, '2016-03-21 22:09:57', 1),
(10, '2016-03-21 22:10:07', 1),
(11, '2016-02-29 23:00:00', 1),
(12, '2016-03-17 23:00:00', 1),
(13, '2016-03-18 23:00:00', 1),
(14, '2016-04-05 10:49:23', 1),
(15, '2016-04-05 15:38:43', 1),
(16, '2016-04-05 15:38:51', 0),
(17, '2016-04-05 17:52:43', 1),
(18, '2016-04-05 17:52:45', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
