-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Erstellungszeit: 19. Apr 2020 um 17:49
-- Server-Version: 8.0.19
-- PHP-Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `codingsolo`
--
CREATE DATABASE `codingsolo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE codingsolo;

CREATE USER 'elastic'@'%' IDENTIFIED WITH mysql_native_password BY 'elastic';
GRANT SELECT ON codingsolo.* TO 'elastic'@'%';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `anschrift`
--

CREATE TABLE `anschrift` (
  `id` int NOT NULL,
  `anschrift_strasse` varchar(255) DEFAULT NULL,
  `anschrift_hausnummer` varchar(255) DEFAULT NULL,
  `anschrift_postleitzahl` varchar(255) DEFAULT NULL,
  `anschrift_ort` varchar(255) DEFAULT NULL,
  `anschrift_land` int DEFAULT NULL,
  `anschrift_erstellung` timestamp NULL DEFAULT NULL,
  `anschrift_bearbeitet` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `anschrift`
--

INSERT INTO `anschrift` (`id`, `anschrift_strasse`, `anschrift_hausnummer`, `anschrift_postleitzahl`, `anschrift_ort`, `anschrift_land`, `anschrift_erstellung`, `anschrift_bearbeitet`) VALUES
(1, 'Hans-Becker Str', '4B', '64686', 'Lautertal', 1, '2020-04-18 15:14:19', '2020-04-18 15:14:19'),
(2, 'Hauptstrasse', '222', '64686', 'Mannheim', 1, '2020-04-18 15:15:05', '2020-04-18 15:14:19'),
(3, 'Am Hauptplatz', '3', '20537', 'Hamburg', 1, '2020-04-18 15:15:05', '2020-04-18 15:14:19'),
(4, 'Xample Street', '16', 'SW1E 6LB', 'London', 2, '2020-04-18 15:15:05', '2020-04-18 15:14:19'),
(5, 'River Street', '13', 'SW1E 6LB', 'London', 2, '2020-04-18 15:15:05', '2020-04-18 15:14:19'),
(6, 'Glücksufer', '343', '50968', 'Köln', 1, '2020-04-18 15:14:19', '2020-04-18 15:14:19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int NOT NULL,
  `artikel_name` varchar(255) DEFAULT NULL,
  `artikel_preis` double DEFAULT NULL,
  `artikel_status` enum('vorhanden','ausverkauft','gering') DEFAULT NULL,
  `artikel_erstellt` datetime DEFAULT (now()),
  `artikel_bearbeitet` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `artikel_name`, `artikel_preis`, `artikel_status`, `artikel_erstellt`, `artikel_bearbeitet`) VALUES
(1, 'Schnurlose Tastatur', 25.99, 'vorhanden', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(2, 'Gaming Monitor', 350.99, 'vorhanden', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(3, 'Gaming Tastatur Schnurlos', 99.99, 'vorhanden', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(4, 'Game Pad', 19, 'ausverkauft', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(5, 'Schnurlose Kopfhörer', 55.99, 'vorhanden', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(6, 'Gaming Maus', 108.99, 'vorhanden', '2020-04-18 17:23:50', '2020-04-18 17:23:50'),
(7, 'Gaming Maus (Pro Gramer)', 80.99, 'gering', '2020-04-18 17:23:50', '2020-04-18 17:23:50');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `id` int NOT NULL,
  `kunde_id` int NOT NULL,
  `bestellung_datum` datetime DEFAULT NULL,
  `bestellung_status` varchar(255) DEFAULT NULL,
  `bestellung_bearbeitet` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`id`, `kunde_id`, `bestellung_datum`, `bestellung_status`, `bestellung_bearbeitet`) VALUES
(8001, 1, '2020-01-13 17:34:21', 'Abgeschlossen', '2020-01-13 17:34:21'),
(8002, 1, '2020-04-08 17:34:21', 'In Bearbeitung', '2020-01-13 17:34:21'),
(8003, 2, '2020-04-13 17:34:21', 'In Bearbeitung', '2020-01-13 17:34:21'),
(8004, 3, '2020-04-13 17:34:21', 'In Bearbeitung', '2020-01-13 17:34:21'),
(8005, 4, '2020-04-13 17:34:21', 'In Bearbeitung', '2020-01-13 17:34:21'),
(8006, 5, '2020-04-12 17:34:21', 'In Bearbeitung', '2020-01-13 17:34:21'),
(8007, 6, '2020-03-16 17:34:21', 'Verzögert', '2020-01-13 17:34:21'),
(8008, 3, '2020-02-03 17:34:21', 'Abgeschlossen', '2020-01-13 17:34:21'),
(8009, 4, '2020-02-19 17:34:21', 'Abgeschlossen', '2020-01-13 17:34:21'),
(8010, 2, '2020-02-24 17:34:21', 'Abgeschlossen', '2020-01-13 17:34:21'),
(8012, 6, '2020-03-24 17:34:21', 'Abgebrochen', '2020-01-13 17:34:21');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung_artikel`
--

CREATE TABLE `bestellung_artikel` (
  `id` int DEFAULT NULL,
  `artikel_id` int DEFAULT NULL,
  `anzahl` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `bestellung_artikel`
--

INSERT INTO `bestellung_artikel` (`id`, `artikel_id`, `anzahl`) VALUES
(8002, 5, 20),
(8001, 1, 50),
(8001, 2, 10),
(8001, 6, 50),
(8002, 3, 40),
(8003, 7, 5),
(8003, 1, 50),
(8003, 2, 25),
(8010, 3, 100),
(8010, 5, 100),
(8004, 2, 10),
(8004, 6, 50),
(8008, 3, 50),
(8008, 4, 20),
(8005, 5, 25),
(8005, 1, 30),
(8009, 2, 50),
(8006, 1, 25),
(8006, 2, 25),
(8006, 6, 25),
(8007, 6, 100),
(8007, 3, 100),
(8007, 4, 100),
(8012, 2, 1000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `id` int NOT NULL,
  `kunde_vorname` varchar(255) DEFAULT NULL,
  `kunde_name` varchar(255) DEFAULT NULL,
  `kunde_kundennummer` varchar(255) DEFAULT NULL,
  `kunde_sperrung` tinyint(1) DEFAULT NULL,
  `kunde_geburtsdatum` datetime DEFAULT NULL,
  `kunde_erstellung` timestamp NULL DEFAULT NULL,
  `kunde_bearbeitet` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`id`, `kunde_vorname`, `kunde_name`, `kunde_kundennummer`, `kunde_sperrung`, `kunde_geburtsdatum`, `kunde_erstellung`, `kunde_bearbeitet`) VALUES
(1, 'Doe', 'John', 'K1020202', 0, '1970-03-17 00:00:00', '2020-04-18 17:00:17', '2020-04-18 17:00:17'),
(2, 'Willson', 'Sam', 'K1021212', 0, '1992-11-01 00:00:00', '2020-04-18 15:02:25', '2020-04-18 17:00:17'),
(3, 'Müller', 'Dennis', 'K1021243', 0, '1985-04-07 00:00:00', '2020-04-18 15:02:57', '2020-04-18 17:00:17'),
(4, 'Kümmel', 'Hans', 'K1032987', 0, '1998-02-13 00:00:00', '2020-04-18 15:03:08', '2020-04-18 17:00:17'),
(5, 'Meier', 'Johann', 'K1020211', 0, '1972-03-13 00:00:00', '2020-04-18 15:03:13', '2020-04-18 17:00:17'),
(6, 'Schmidt', 'Christian', 'K1020592', 0, '1976-01-21 00:00:00', '2020-04-18 15:03:17', '2020-04-18 17:00:17');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde_anschrift`
--

CREATE TABLE `kunde_anschrift` (
  `kunde_id` int DEFAULT NULL,
  `anschrift_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `kunde_anschrift`
--

INSERT INTO `kunde_anschrift` (`kunde_id`, `anschrift_id`) VALUES
(1, 4),
(2, 5),
(3, 1),
(4, 2),
(5, 6),
(6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `land`
--

CREATE TABLE `land` (
  `id` int NOT NULL,
  `land_name` varchar(255) DEFAULT NULL,
  `land_kuerzel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Daten für Tabelle `land`
--

INSERT INTO `land` (`id`, `land_name`, `land_kuerzel`) VALUES
(1, 'Deutschland', 'de'),
(2, 'England', 'en');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `anschrift`
--
ALTER TABLE `anschrift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anschrift_land` (`anschrift_land`);

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kunde_id` (`kunde_id`);

--
-- Indizes für die Tabelle `bestellung_artikel`
--
ALTER TABLE `bestellung_artikel`
  ADD KEY `id` (`id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kunde_anschrift`
--
ALTER TABLE `kunde_anschrift`
  ADD KEY `kunde_id` (`kunde_id`),
  ADD KEY `anschrift_id` (`anschrift_id`);

--
-- Indizes für die Tabelle `land`
--
ALTER TABLE `land`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `anschrift`
--
ALTER TABLE `anschrift`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8013;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `land`
--
ALTER TABLE `land`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `anschrift`
--
ALTER TABLE `anschrift`
  ADD CONSTRAINT `anschrift_ibfk_1` FOREIGN KEY (`anschrift_land`) REFERENCES `land` (`id`);

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`id`);

--
-- Constraints der Tabelle `bestellung_artikel`
--
ALTER TABLE `bestellung_artikel`
  ADD CONSTRAINT `bestellung_artikel_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bestellung` (`id`),
  ADD CONSTRAINT `bestellung_artikel_ibfk_2` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`);

--
-- Constraints der Tabelle `kunde_anschrift`
--
ALTER TABLE `kunde_anschrift`
  ADD CONSTRAINT `kunde_anschrift_ibfk_1` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`id`),
  ADD CONSTRAINT `kunde_anschrift_ibfk_2` FOREIGN KEY (`anschrift_id`) REFERENCES `anschrift` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
