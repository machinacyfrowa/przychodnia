-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Maj 2021, 14:31
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `przychodnia`
--
CREATE DATABASE IF NOT EXISTS `przychodnia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `przychodnia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`) VALUES
(1, 'admin', '$argon2i$v=19$m=65536,t=4,p=1$R2hZaTkwcXNLRGQ2VzNxbw$jizkh7zuX4vybyF3UFklwcieEt6KcXW63HVLiBBHE2A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `patient` int(11) NOT NULL,
  `doctor` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient` (`patient`),
  KEY `doctor` (`doctor`),
  KEY `room` (`room`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `appointment`
--

INSERT INTO `appointment` (`id`, `date`, `patient`, `doctor`, `room`) VALUES
(10, '2021-05-10 08:00:00', 0, 2, 1),
(11, '2021-05-10 09:00:00', 2, 2, 1),
(12, '2021-05-10 10:00:00', 0, 2, 1),
(13, '2021-05-10 08:20:00', 0, 1, 1),
(14, '2021-05-10 08:35:00', 0, 1, 1),
(15, '2021-05-10 08:50:00', 0, 1, 1),
(16, '2021-05-10 09:05:00', 0, 1, 1),
(17, '2021-05-10 09:20:00', 0, 1, 1),
(18, '2021-05-10 09:35:00', 0, 1, 1),
(19, '2021-05-10 09:50:00', 0, 1, 1),
(20, '2021-05-10 10:05:00', 0, 1, 1),
(21, '2021-05-10 10:20:00', 0, 1, 1),
(22, '2021-05-10 10:35:00', 0, 1, 1),
(23, '2021-05-10 10:50:00', 0, 1, 1),
(24, '2021-05-10 11:05:00', 0, 1, 1),
(25, '2021-05-10 11:20:00', 0, 1, 1),
(26, '2021-05-10 11:35:00', 0, 1, 1),
(27, '2021-05-10 11:50:00', 0, 1, 1),
(28, '2021-05-10 12:05:00', 0, 1, 1),
(29, '2021-05-10 12:20:00', 0, 1, 1),
(30, '2021-05-10 12:35:00', 0, 1, 1),
(31, '2021-05-10 12:50:00', 0, 1, 1),
(32, '2021-05-10 13:05:00', 1, 1, 1),
(33, '2021-05-10 13:20:00', 0, 1, 1),
(34, '2021-05-10 13:35:00', 0, 1, 1),
(35, '2021-05-10 13:50:00', 0, 1, 1),
(36, '2021-05-10 14:05:00', 0, 1, 1),
(37, '2021-05-10 14:20:00', 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `speciality` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `doctor`
--

INSERT INTO `doctor` (`id`, `firstName`, `lastName`, `speciality`) VALUES
(1, 'Adam', 'Miły', 'Internista'),
(2, 'Janina', 'Uprzejma', 'Kardiolog');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pesel` varchar(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesel` (`pesel`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `patient`
--

INSERT INTO `patient` (`id`, `pesel`, `password`, `firstName`, `lastName`) VALUES
(0, '(pusty)', '', '(pusty)', '(pusty)'),
(1, '0', '$argon2i$v=19$m=65536,t=4,p=1$SU1xZFRDd2JGQUlTMmdNTg$Lb25bgb6BwlLO3vYoJkEh0LM5+4jOkV/dp2rAFuzNxw', 'Jan', 'Kowalski'),
(2, '00', '$argon2i$v=19$m=65536,t=4,p=1$RnhYb2w3c1UzMWxHeVFWaA$NhwdfxveiI8AKcCj9z+HJkoE1iUkBB0Ce5mu3x8Q3J0', 'Adam', 'Nowak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `room`
--

INSERT INTO `room` (`id`, `roomNumber`) VALUES
(1, '23A');

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`room`) REFERENCES `room` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
