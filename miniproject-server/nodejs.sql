-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 12 mrt 2016 om 13:26
-- Serverversie: 5.7.9
-- PHP-versie: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejs`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
CREATE TABLE IF NOT EXISTS `gebruikers` (
  `gebruikers_id` int(10) NOT NULL AUTO_INCREMENT,
  `wachtwoord` char(60) NOT NULL,
  `gebruikers_naam` varchar(32) NOT NULL,
  `email_adres` varchar(255) NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `achternaam` varchar(255) NOT NULL,
  `studie` varchar(100) NOT NULL,
  `studenten_nummer` int(8) NOT NULL,
  `account_vanaf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `studiejaar` tinyint(1) NOT NULL,
  `periode` tinyint(1) NOT NULL,
  PRIMARY KEY (`gebruikers_id`),
  UNIQUE KEY `gebruikers_naam` (`gebruikers_naam`),
  UNIQUE KEY `gebruikers_id` (`gebruikers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `gebruikers`
--

INSERT INTO `gebruikers` (`gebruikers_id`, `wachtwoord`, `gebruikers_naam`, `email_adres`, `voornaam`, `achternaam`, `studie`, `studenten_nummer`, `account_vanaf`, `studiejaar`, `periode`) VALUES
(1, '$2y$10$/3LZWZVz7JFeNcpdgjehN.rka61FkUBqSSswC7ay4ZIhUjmekQ8lW', 'daveym', 'contact@cheapict.nl', 'Davey', 'Mathijssen', 'Technische Informatica', 2075116, '2016-02-25 22:19:50', 2, 3),
(2, '$2y$10$f8.JQ4liZJ2s2j9i1lVy6OJfMFUV.qPIOIzgIkGpAJFrehZhQYGLC', 'joey', 'joey.sol.palmboom@hotmail.com', 'Joey', 'Sol', 'Chemical Engineering', 0, '2015-04-30 21:30:02', 3, 4),
(3, '$2y$10$j4FRpsCr0K80bZc9WXvf9.HhbIwc9N4aFwuh66IPgMMCZjGttskFa', 'tim', 'tim@mail.com', 'Tim', 'Schijvenaars', 'Technische Informatica', 0, '2015-02-05 20:37:59', 1, 3),
(4, '$2y$10$FHzYcQJRtEyJzLIwkJPDWOfkHe0UtTTT.3pOq4mg3OJx20x6pTF5K', 'sander', 's@mail.com', 'Sander', 'Bogers', 'Marketing', 0, '2015-04-30 21:30:02', 3, 4),
(5, '$2y$10$TgwooxOiNZwNKBFjCcmo4OEjoRwbYN20ipwWeIhyFiTeQH3gj8Whu', 'joli', '', 'Joli', 'van Kruijsdijk', '', 0, '2015-05-27 15:27:54', 1, 4),
(6, '$2y$10$9Uo9ueAJiIIfmpLifCiF6uM6l4kbhQ46Ts4pseq4D6x.m6yG1hDiK', 'melany', 'melany@test.nl', 'Melany', 'Eshuis', 'Technische Informatica', 0, '2016-02-02 17:42:54', 2, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `huiswerk`
--

DROP TABLE IF EXISTS `huiswerk`;
CREATE TABLE IF NOT EXISTS `huiswerk` (
  `huiswerk_id` int(11) NOT NULL AUTO_INCREMENT,
  `vak_id` int(11) NOT NULL,
  `gebruikers_id` int(11) NOT NULL,
  `huiswerk` text NOT NULL,
  `datum_af` date NOT NULL,
  `inlever_tijd` time DEFAULT NULL,
  `inleveren_via` varchar(255) NOT NULL,
  `inlever_methode` varchar(255) DEFAULT NULL,
  `huiswerk_af` tinyint(1) NOT NULL,
  `aangemaakt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`huiswerk_id`),
  KEY `vak_id` (`vak_id`,`gebruikers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `huiswerk`
--

INSERT INTO `huiswerk` (`huiswerk_id`, `vak_id`, `gebruikers_id`, `huiswerk`, `datum_af`, `inlever_tijd`, `inleveren_via`, `inlever_methode`, `huiswerk_af`, `aangemaakt`) VALUES
(1, 1, 1, 'H15 2,7,8,14 en 15 (+bleuj boek afmaken)', '2015-02-09', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(2, 2, 1, 'Lezen H1 + H2 t/m 2.5<br />\r\nAnswer the Review Questions (p56)<br />\r\nmaken exc 2.1 t/m 2.3 (p57)', '2015-02-10', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(3, 4, 1, '-PvA maken<br />\r\n-Gesprekagenda', '2015-02-10', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(4, 5, 1, 'Vragen wie mijn SLB''er is en vragen om in contact te komen met een vierdejaars voor beroepsinterview', '2015-02-09', '21:30:00', 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(5, 6, 2, 'Bij-spijkeren stof van wis 2 ', '2015-02-11', NULL, 'n.v.t.', '', 0, '0000-00-00 00:00:00'),
(6, 7, 2, 'Individuele doelstelling + commentaar op 2 andere doelstellingen', '2015-02-09', '08:45:00', 'BlackBoard', '', 1, '0000-00-00 00:00:00'),
(7, 7, 2, 'Project doelstelling + commentaar op 2 andere doelstellingen', '2015-02-09', '08:45:00', 'BlackBoard', '', 1, '0000-00-00 00:00:00'),
(8, 7, 2, 'Lever Quick Scan in', '2015-02-09', '08:45:00', 'BlackBoard', '', 0, '0000-00-00 00:00:00'),
(9, 10, 2, 'Lees H2 van diktaat reactorkunde. maak opgaven 1 tm 5', '2015-02-10', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(10, 10, 2, 'Maken opgaven in Powerpoint', '2015-02-10', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(11, 11, 2, 'Zoek informatie op over RWZI Dongemond', '2015-02-09', NULL, 'n.v.t.', '', 0, '0000-00-00 00:00:00'),
(12, 12, 1, 'Opdracht RAD met Tim\r\n-inhoudsopgave bijwerken\r\n-blauwe teksten controleren en verwijderen\r\n-gehele document samen doornemen\r\n-nog 4 use-case scenario''s specificeren\r\n-sequentiediagram\r\n-toestandsdiagram\r\n-in hoofdstuk 1 nog een activiteitendiagram?', '2015-02-22', NULL, 'n.v.t.', '', 1, '2015-02-23 19:35:24'),
(13, 1, 1, 'Lezen periodewijzer', '2015-02-09', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(14, 4, 1, '-Logboek uploaden bb en dropbox<br />\r\n-agenda maken<br />\r\n-periodewijzer doornemen en hiervan functionele eisen maken<br />\r\n-aanmaken mappenstructuur bb<br />\r\nvan 12:30-', '2015-02-10', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(15, 4, 1, 'Inleveren PvA', '2015-02-13', '17:00:00', 'email', '', 1, '0000-00-00 00:00:00'),
(16, 1, 1, 'Liang blz 580: opg 14.5\r\nblz 582: opg 14.13\r\nblz 759: opg 19.6 en 19.7\r\nagendastrutuur vd festivalplanner twee file io uitwerkinge: text file, object IO\r\n1. data lezen\r\n2. data schrijven\r\n3. scanner\r\n4. object IO\r\nBluej H12', '2015-03-02', NULL, 'n.v.t.', '', 1, '2015-03-01 16:48:43'),
(17, 2, 1, 'mailen naar paul en paul odprachten in zip', '2015-02-09', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(18, 2, 1, 'Afmaken H2', '2015-02-24', NULL, 'n.v.t.', '', 1, '2015-02-24 10:14:03'),
(19, 13, 1, 'Interview Pascal om 1300 op afdeling 2 - voorbereiden', '2015-03-03', '13:00:00', 'n.v.t.', '', 1, '2015-03-03 19:15:37'),
(20, 4, 1, 'Kijken naar weekplanner + database connectie + begin website + eisen opgesteld 20-2-2015 15:00-17:00', '2015-02-24', NULL, 'n.v.t.', '', 1, '2015-02-24 10:13:47'),
(21, 4, 1, 'Vragen senior:<br />\r\n-in de agenda dagen met tijden ipv 1 dag met tijden<br />\r\n-acts ipv acts+artiesten<br />\r\n-testplan<br />\r\n-wanneer technisch document inleveren?', '2015-02-12', NULL, 'n.v.t.', '', 1, '0000-00-00 00:00:00'),
(22, 13, 1, 'vragen Paul Lindelauf mogelijkheden stage Amerika (niet meer van plan)', '2015-05-06', NULL, 'n.v.t.', '', 1, '2015-05-19 12:35:34'),
(23, 13, 1, 'Uren invullen 2 opendagen(14+10) + reiskosten + 4 promo''s(5*4) + meeloopdag(8) + proefstudeerdag (8) = 60\r\nKrijgen bericht', '2015-07-24', NULL, 'n.v.t.', '', 1, '2015-07-06 18:57:27'),
(24, 4, 1, 'Uren bijschrijven 10-2-2015 20:30-22:30 samen met Janco klasse diagram bespreken + werken aan database versie vd agenda (extra functionaliteit) + uren 8:45 - 12:15', '2015-02-12', NULL, 'n.v.t.', '', 1, '2015-02-17 23:35:21'),
(25, 4, 1, 'uren 12:00-13:00 gesprek senior\r\n+ uren nakijken documeten', '2015-02-13', NULL, 'n.v.t.', '', 1, '2015-02-17 23:35:18'),
(26, 5, 1, 'Vragen tips en belangrijke zaken interview', '2015-02-26', NULL, 'n.v.t.', '', 1, '2015-03-03 19:14:43'),
(27, 2, 1, 'Voorwerken H3 en H4 - geen tijd gehad', '2015-02-24', NULL, 'n.v.t.', '', 1, '2015-02-23 19:35:46'),
(28, 1, 1, '//\r\n', '2015-03-08', NULL, 'n.v.t.', '', 1, '2015-03-15 00:48:03'),
(35, 1, 1, '///', '2015-03-08', NULL, 'n.v.t.', '', 1, '2015-03-15 00:48:07'),
(34, 1, 1, 'proeftentamen\r\nal het huiswerk en samenvatten hoofdstukken\r\nMaken app met volgende functies:\r\n-opslaan settings met file io en uitlezen use transient for not saveable object\r\n-opslaan objecten met binary io en uitlezen\r\n-openen files met filefilter\r\n-randomaccesfile\r\n-input geven met scanner\r\n', '2015-03-30', NULL, 'n.v.t.', '', 1, '2015-03-30 19:28:27'),
(29, 13, 1, 'inschrijven Osiris', '2015-03-02', NULL, 'n.v.t.', '', 1, '2015-03-02 21:55:15'),
(30, 2, 1, 'Lezen hoofdstuk 3 t/m $3.4\r\nAnswer the Review Questions (page 94 / 95)\r\nMaken Programming Exercises (page 95 / 96)\r\n', '2015-03-04', NULL, 'n.v.t.', '', 1, '2015-03-15 00:46:16'),
(31, 4, 1, 'Maken DB verbinding en website', '2015-03-03', NULL, 'n.v.t.', '', 1, '2015-03-02 21:56:29'),
(32, 5, 1, 'Inleveren PvA + alle hoofdstukken toevoegen', '2015-03-06', NULL, 'BlackBoard', '', 1, '2015-03-15 00:45:01'),
(33, 3, 1, 'Maken huiswerk', '2015-03-06', NULL, 'n.v.t.', '', 1, '2015-03-15 00:45:05'),
(36, 5, 1, 'interview verslag typen en slb verslag aanvullen', '2015-03-19', NULL, 'n.v.t.', '', 1, '2015-03-19 23:23:26'),
(37, 5, 1, 'Interview typen en slb opdrachten maken', '2015-03-12', NULL, 'n.v.t.', '', 1, '2015-03-15 00:45:27'),
(38, 1, 1, 'Maken pnoc verslag\r\nmaken 2d graphics opdr\r\nwebsite server Mark\r\ndouchen', '2015-03-12', NULL, 'n.v.t.', '', 1, '2015-03-15 00:45:39'),
(39, 3, 1, 'Wiskunde foto''s overzetten en proeftoets', '2015-03-27', NULL, 'n.v.t.', '', 1, '2015-03-26 21:41:25'),
(40, 4, 1, 'Opdrachten weekplanning', '2015-03-22', NULL, 'n.v.t.', '', 1, '2015-03-23 22:20:01'),
(49, 3, 1, 'Oefenen wiskunde proeftoetsen en evt huiswerk:\r\n-oefentoetsen\r\n-zoeken regeltjes leraar voor vinden asymptoot gebroken functie\r\n-leren tabel sin,cos,tan\r\n-leren bladen van Tim', '2015-04-01', NULL, 'n.v.t.', '', 1, '2015-04-02 08:18:32'),
(41, 12, 1, 'inleveren SDD (2e deel, draft versie)', '2015-03-17', '17:00:00', 'BlackBoard', '', 1, '2015-03-18 23:49:22'),
(42, 12, 1, 'inleveren ODD (draft versie)', '2015-03-24', '17:00:00', 'BlackBoard', '', 1, '2015-03-22 12:02:06'),
(43, 13, 1, 'Afmaken reflectie opdracht en nakijken rest', '2015-03-22', NULL, 'n.v.t.', '', 1, '2015-03-22 11:43:52'),
(44, 12, 1, 'SDD afmaken en ODD concept maken', '2015-03-21', NULL, 'BlackBoard', '', 1, '2015-03-22 11:43:46'),
(45, 2, 1, 'Maken asteroids:\r\n-2 spelers \r\nX voeg enemy spaceship toe\r\nX explosies als iets kapot gaat + geluid (kogel raakt enemy, enemy raakt player)\r\nX langzamer schieten\r\nX status bar(health en score) health als hartje oid\r\nX Game over met gradient(knop om alles te resetten en show score)', '2015-04-09', NULL, 'n.v.t.', '', 1, '2015-04-09 19:11:10'),
(46, 12, 1, 'ODD inleveren', '2015-04-10', '17:00:00', 'BlackBoard', '', 1, '2015-04-10 20:18:47'),
(47, 5, 1, 'Evt inleveren herziene versie PvA', '2015-03-27', '23:59:00', 'BlackBoard', '', 1, '2015-03-27 21:43:01'),
(48, 4, 1, 'taken fp', '2015-04-02', NULL, 'n.v.t.', '', 1, '2015-04-08 21:57:21'),
(50, 5, 1, 'toevoegen nieuwe vakken mm', '2015-04-20', '00:37:00', 'n.v.t.', '', 1, '2015-04-30 21:32:43'),
(51, 18, 1, 'Laatste wiimote ir opdracht + afgeleidde bij z-axis nunchuck', '2015-05-01', NULL, 'n.v.t.', '', 1, '2015-05-01 09:35:14'),
(52, 19, 1, 'Kijken opdrachten periode 4 en controleren agenda periode 3', '2015-05-01', NULL, 'n.v.t.', '', 1, '2015-05-04 11:06:54'),
(53, 16, 1, 'Elke dag wiskunde sommen', '2015-05-10', NULL, 'n.v.t.', '', 1, '2015-05-17 17:18:32'),
(54, 15, 1, 'Inleveren interview', '2015-05-05', NULL, 'n.v.t.', '', 1, '2015-05-05 21:38:25'),
(55, 18, 1, 'Kijken naar Kinect en Arduino(RGB Led)', '2015-05-09', NULL, 'n.v.t.', '', 1, '2015-05-17 17:18:37'),
(56, 15, 1, 'Pitch', '2015-05-19', NULL, 'n.v.t.', '', 1, '2015-05-13 19:38:35'),
(57, 17, 1, 'Slb gesprek, afmaken p4', '2015-05-21', NULL, 'n.v.t.', '', 1, '2015-05-19 12:35:38'),
(58, 15, 1, 'Parkeer opdracht maken', '2015-06-09', NULL, 'n.v.t.', '', 1, '2015-06-07 18:25:49'),
(59, 20, 1, 'Maken opdrachten + beginnen eindopdracht', '2015-05-25', NULL, 'n.v.t.', '', 1, '2015-06-07 18:25:42'),
(60, 17, 1, '-Indelen project/planning \r\n-Scrum board opzetten\r\n-PvA', '2015-05-21', NULL, 'n.v.t.', '', 1, '2015-05-21 11:58:31'),
(61, 16, 1, 'Maken integreer opdrachten', '2015-06-03', NULL, 'n.v.t.', '', 1, '2015-05-31 09:53:52'),
(62, 21, 1, '-pop lange en korte termijn\r\n', '2015-06-09', NULL, 'n.v.t.', '', 1, '2015-06-09 21:29:38'),
(63, 17, 1, 'Maken website + marketing app', '2015-05-29', NULL, 'n.v.t.', '', 1, '2015-05-31 15:29:44'),
(64, 14, 1, 'Recensie inleveren', '2015-06-17', '23:59:00', 'BlackBoard', '', 1, '2015-06-09 19:05:49'),
(65, 14, 1, 'pre-release', '2015-06-08', NULL, 'n.v.t.', '', 1, '2015-06-07 18:25:46'),
(66, 20, 1, 'Inleveren eindopdracht', '2015-06-14', NULL, 'BlackBoard', '', 1, '2015-06-15 11:05:05'),
(67, 18, 1, 'Vragen OAuth Johan', '2015-06-05', NULL, 'n.v.t.', '', 1, '2015-06-09 21:30:17'),
(68, 20, 1, 'Tentamen Netwerk Programmeren LD326 9:30-12:50', '2015-06-16', '09:30:00', 'n.v.t.', '', 1, '2015-06-16 10:53:28'),
(69, 16, 1, 'Tentamen calculus HA101 9:30-11:10', '2015-06-18', '09:30:00', 'n.v.t.', '', 1, '2015-06-18 09:20:34'),
(70, 17, 1, 'Presentatie simapp\r\nIn presentatie:\r\n-hoe zijn we tot dit succes gekomen:\r\n-werken vanaf 845 tot minimaal 3 uur etc.\r\n-thuis werken\r\n-taken opgedeeld in korte stukken, veel briefjes etc\r\n\r\n-kijken naar tips Hannie\r\n\r\n-met gifjes laten zien hoe spel werkt: richten, springen, schieten, teams, f4a\r\n\r\n-vele sounds bij acties vd spelers: oppakken van pijlen, schieten, springen, verschillende geluiden bij raken van objecten\r\n\r\n-idee: games thuis kunnen spelen om punten te verdienen en zo de terugkerende bezoekers te verhogen\r\n', '2015-06-22', NULL, 'n.v.t.', '', 1, '2015-06-22 14:41:38'),
(71, 17, 1, 'Betalen schoolgeld', '2015-06-25', NULL, 'n.v.t.', '', 1, '2015-07-27 13:42:17'),
(72, 17, 1, 'Sollicitatiegesprek ', '2015-06-19', '12:30:00', 'n.v.t.', '', 1, '2015-06-19 22:18:34'),
(73, 14, 1, 'X presentatie\r\nX registreren in game\r\ngebruikersnaam in game\r\nX tablet anissa vragen\r\nX stofzuigen\r\n-android cursus\r\nX sander afspreken\r\n-factuur herinneringen', '2015-06-21', NULL, 'n.v.t.', '', 1, '2015-06-24 21:34:17'),
(74, 17, 1, '-Boeken zoeken en kopen\r\n-Downloaden bestanden BB', '2015-06-28', NULL, 'n.v.t.', '', 1, '2015-07-20 21:19:29'),
(75, 14, 1, 'DUO bellen geen stufi gekregen april 2015 en verschillende bedragen bijgeschreven iedere maand (050) 599 77 55', '2015-07-27', NULL, 'n.v.t.', '', 1, '2015-07-27 13:42:34'),
(76, 14, 1, 'Kijken of Wii geld heeft teruggestort ', '2015-07-25', NULL, 'n.v.t.', '', 1, '2015-07-25 15:19:14'),
(77, 14, 1, '83.5 naar Joey', '2015-07-25', NULL, 'n.v.t.', '', 1, '2015-07-25 15:19:19'),
(78, 14, 1, '-maken werklogbestand\r\n-maken lijstje nodig school iedere dag\r\n-blackboard kijken en periodewijzer', '2015-08-26', NULL, 'n.v.t.', '', 1, '2015-08-30 10:08:26'),
(79, 22, 1, 'taken deze week afwerken', '2015-09-04', NULL, 'n.v.t.', '', 1, '2015-09-01 21:32:45'),
(80, 23, 1, 'Inlezen oude document databases', '2015-08-31', NULL, 'n.v.t.', '', 1, '2015-09-01 06:59:54'),
(81, 23, 1, 'Maken opdrachten ', '2015-09-08', NULL, 'n.v.t.', '', 1, '2015-09-08 15:38:31'),
(82, 24, 1, 'Leren presentaties\r\nSamenvatting maken', '2015-09-22', NULL, 'n.v.t.', '', 1, '2015-09-23 11:06:12'),
(83, 25, 1, 'Maken opdrachten en lezen H1', '2015-09-09', NULL, 'n.v.t.', '', 1, '2015-09-09 08:29:54'),
(84, 27, 1, 'individuele opdracht', '2015-09-21', NULL, 'BlackBoard', '', 1, '2015-09-20 16:20:24'),
(85, 22, 1, 'Inleveren PvA en af sprint 1', '2015-09-11', NULL, 'n.v.t.', '', 1, '2015-09-12 10:30:04'),
(86, 23, 1, 'Maken opdrachten', '2015-09-15', NULL, 'n.v.t.', '', 1, '2015-09-14 20:41:52'),
(87, 28, 1, 'SLO opdrachten bekijken - gemaild, wachten op respons', '2015-09-12', NULL, 'n.v.t.', '', 1, '2015-09-12 10:29:55'),
(88, 22, 1, 'Individuele opdracht inleveren', '2015-09-25', NULL, 'BlackBoard', '', 1, '2015-09-23 13:30:38'),
(89, 27, 1, 'Groepsopdracht', '2015-09-12', NULL, 'n.v.t.', '', 1, '2015-09-14 20:41:24'),
(90, 25, 1, 'Opdrachten week 2 inleveren, nakijken alle opdrachten en screens toevoegen', '2015-09-14', NULL, 'n.v.t.', '', 1, '2015-09-14 20:41:43'),
(91, 25, 1, 'Inleveren groeidocument', '2015-09-14', NULL, 'BlackBoard', '', 1, '2015-09-14 20:41:49'),
(92, 25, 1, 'Leren en samenvatting stof', '2015-09-23', NULL, 'n.v.t.', '', 1, '2015-09-23 11:06:24'),
(93, 28, 1, '-Kijken en maken opdrachten\r\n-Maken gespreksagenda:stageplek vinden, minoren vinden\r\n', '2015-09-17', NULL, 'n.v.t.', '', 1, '2015-09-20 21:22:27'),
(94, 25, 1, 'inleveren DCN', '2015-09-20', NULL, 'BlackBoard', '', 1, '2015-09-20 16:20:20'),
(95, 26, 1, 'Maken http server en hw', '2015-09-21', NULL, 'n.v.t.', '', 1, '2015-09-22 12:00:53'),
(96, 22, 1, 'Server + andere opdrachten', '2015-09-25', NULL, 'n.v.t.', '', 1, '2015-09-25 22:02:22'),
(97, 27, 1, 'Feedback opdracht', '2015-10-05', NULL, 'BlackBoard', '', 1, '2015-09-25 22:01:46'),
(98, 28, 1, 'maken reflectieverslag (opdracht 1) en opdracht 3\r\nAfmaken portfolio\r\n-Niet gedaan', '2015-11-29', NULL, 'n.v.t.', '', 1, '2015-12-07 09:10:45'),
(99, 23, 1, 'Tim en Wesley afmaken db', '2015-09-29', NULL, 'n.v.t.', '', 1, '2015-09-25 19:54:59'),
(100, 24, 1, 'TUSSENTOETS!', '2015-09-29', NULL, 'n.v.t.', '', 1, '2015-09-29 12:52:32'),
(101, 25, 1, 'Inleveren voor woensdag groeidocument', '2015-10-07', NULL, 'BlackBoard', '', 1, '2015-10-06 19:15:33'),
(102, 27, 1, 'PNOC verslag maken + feedback geven René en Wesley', '2015-09-25', NULL, 'n.v.t.', '', 1, '2015-09-25 22:01:26'),
(103, 26, 1, 'C# server form maken', '2015-10-01', NULL, 'n.v.t.', '', 1, '2015-10-02 18:38:49'),
(104, 24, 1, 'Elke dag (vanaf vrijdag) 2 hoofdstukken samenvatten + bijbehorende presentatie doornemen (+opdrachten)', '2015-09-27', NULL, 'n.v.t.', '', 1, '2015-09-29 12:52:28'),
(105, 26, 1, 'C# toets', '2015-10-01', NULL, 'n.v.t.', '', 1, '2015-10-02 08:31:42'),
(106, 24, 1, 'leren', '2015-10-06', NULL, 'n.v.t.', '', 1, '2015-10-05 19:25:36'),
(107, 27, 1, 'huiswerk inleveren', '2015-10-26', '23:59:00', 'BlackBoard', '', 1, '2015-10-25 22:52:15'),
(108, 26, 1, 'Eindopdracht:\r\n-Datumprikker\r\n-Rechts objecten van taken die je aan persoon kunt koppelen (dmv slepen)\r\n-Taken in rechterveld met JSON\r\n ', '2015-11-03', NULL, 'BlackBoard', '', 1, '2015-11-03 22:10:16'),
(109, 22, 1, 'IP2', '2015-11-04', NULL, 'BlackBoard', '', 1, '2015-11-03 22:10:29'),
(115, 26, 1, 'opleveren C# project', '2015-11-03', NULL, 'n.v.t.', '', 1, '2015-11-03 22:10:20'),
(110, 23, 1, 'Maken proeftoets', '2015-10-13', NULL, 'n.v.t.', '', 1, '2015-10-11 20:32:37'),
(111, 26, 1, 'Doorwerken week 1 t/m 5', '2015-10-26', NULL, 'n.v.t.', '', 1, '2015-11-03 22:10:01'),
(112, 24, 1, 'Plannen leren voor bedrijfskunde(maandag), dcn(donderdag) en db(vrijdag)', '2015-10-07', NULL, 'n.v.t.', '', 1, '2015-10-14 21:10:20'),
(113, 24, 1, 'Maken proeftentamen', '2015-10-13', NULL, 'n.v.t.', '', 1, '2015-10-14 21:07:01'),
(114, 25, 1, 'Inleveren groeidocument en nakijken IP + 802.11', '2015-10-12', NULL, 'BlackBoard', '', 1, '2015-10-08 11:25:17'),
(116, 22, 1, '-Controleren testplan\r\n-Controleren presentatie\r\n-Controleren geschiedenis inzien\r\n-Controleren grafieken', '2015-10-20', NULL, 'n.v.t.', '', 1, '2015-10-21 16:41:23'),
(117, 23, 1, '-Proeftentamen\r\n-SQL\r\n-Normalisatie', '2015-10-22', NULL, 'n.v.t.', '', 1, '2015-10-25 20:43:00'),
(118, 25, 1, 'Vragen:\r\n-Hoe heet gegarandeerde minimale bandbreedte? Quality of Service\r\n-subnetmaskers meer informatie zoeken buiten het boek voor tentamen\r\n-vraag 4 proeftentamen over andere laag dan die van ethernet\r\n-hoe heten de pakketjes op iedere laag?', '2015-10-21', NULL, 'n.v.t.', '', 1, '2015-10-22 15:30:03'),
(119, 22, 1, 'Installeren Windows 10 en Ubuntu', '2015-11-08', NULL, 'n.v.t.', '', 1, '2015-11-08 21:16:27'),
(120, 33, 1, 'Maken individuele opdracht', '2015-11-12', '23:59:00', 'BlackBoard', '', 1, '2015-11-12 18:50:23'),
(121, 29, 1, 'Inleveren opgave 3 Design Patterns (en/of opgave 2,4)', '2015-11-16', '17:00:00', 'BlackBoard', '', 1, '2015-11-15 22:34:18'),
(122, 34, 1, 'Maken hw les 1a:\r\nMaak de challenges uit de UWP serie: UWP-011, UWP-013 en UWP-015.\r\nMaak een calculator app, waarbij je gebruik maakt van de layout controls die we gezien hebben: StackPanel en Grid\r\n1b:D\r\noorloop de filmpjes van  channel9 UWP serie tot UWP-031 en maak challenges UWP-023 en UWP-031.\r\n- Maak een Windows UWP calculator van les 1a verder af en functioneel werkend (+, - , *, /).  Niet gedaan', '2015-11-16', '23:59:00', 'BlackBoard', '', 1, '2015-12-07 09:10:52'),
(123, 33, 1, 'Maken mijn deel PvA', '2015-11-13', NULL, 'n.v.t.', '', 1, '2015-11-15 13:20:23'),
(124, 30, 1, 'Voor dinsdag Uwp-37 tm 44 voorbereiden - niet gedaan', '2015-11-17', NULL, 'n.v.t.', '', 1, '2015-12-07 09:10:25'),
(125, 29, 1, 'Inleven OCL opgaven', '2015-12-13', NULL, 'BlackBoard', '', 1, '2016-01-03 22:26:40'),
(126, 33, 1, '-Voorbereiden Review Observator rol: kijken naar verschillende rollen en template maken voor invullen PNOC en Software Engineer\r\n-PvA nakijken\r\n-Maken deel AcceptatieTestPlan\r\n-AcceptatieTestPlan nakijken', '2015-11-19', NULL, 'n.v.t.', '', 1, '2015-11-19 13:12:16'),
(127, 33, 1, 'PvA en Acceptatietestplan doornemen groep A5 en defectenlijst opstellen', '2015-11-21', '00:00:00', 'n.v.t.', '', 1, '2015-11-19 17:47:21'),
(128, 29, 1, 'Maken opgaven in powerpoint (Class Diagram + Testklassen) - niet gedaan', '2015-11-23', NULL, 'BlackBoard', '', 1, '2015-12-07 09:10:31'),
(129, 34, 1, 'Inleveren huiswerk', '2015-11-23', NULL, 'BlackBoard', '', 1, '2015-11-24 20:53:39'),
(130, 34, 1, 'Git aanmaken Tim', '2015-11-23', NULL, 'n.v.t.', '', 1, '2015-11-24 20:53:28'),
(131, 33, 1, 'Audit duurzaamheid\r\n-Lezen H3 en H4 van bestand mail\r\n-Andries uitleg', '2015-12-04', NULL, 'n.v.t.', '', 1, '2015-12-05 15:26:07'),
(132, 31, 1, 'Voorbereiden en maken verslag observator', '2015-11-23', NULL, 'n.v.t.', '', 1, '2015-11-24 20:53:31'),
(133, 33, 1, 'RAD en SDD planning maken + planning rest + mijn hoofdstukken', '2015-11-24', NULL, 'n.v.t.', '', 1, '2015-11-24 21:51:28'),
(134, 29, 1, 'Maken huiswerk - niet gedaan', '2015-11-30', NULL, 'BlackBoard', '', 1, '2015-12-07 09:10:58'),
(135, 33, 1, 'RAD aanpassen aan nieuwe PvA', '2015-11-25', NULL, 'n.v.t.', '', 1, '2015-11-29 12:43:09'),
(136, 33, 1, 'Inschrijven Osiris', '2015-11-30', NULL, 'n.v.t.', '', 1, '2015-11-30 21:27:01'),
(137, 29, 1, 'Lezen boek, maken smv en maken huiswerk', '2016-01-15', NULL, 'n.v.t.', '', 1, '2016-01-15 17:37:56'),
(149, 33, 1, 'Windows store account', '2016-01-08', NULL, 'n.v.t.', '', 1, '2016-01-10 18:27:50'),
(138, 34, 1, 'Inleveren opdracht Hue (met beschrijving?)', '2015-12-07', '23:59:00', 'BlackBoard', '', 1, '2015-12-07 23:08:44'),
(139, 31, 1, 'Plannen ODD en samenvoegen sdd\r\nVragen hoe alles is gegaan met reviews bij iedereen\r\n', '2015-12-09', NULL, 'n.v.t.', '', 1, '2015-12-10 23:30:21'),
(140, 31, 1, 'Maken review verslag 2', '2015-12-09', NULL, 'n.v.t.', '', 1, '2015-12-09 16:36:38'),
(141, 34, 1, 'Vragen Paul x:Bind en hoogtemeter uwp', '2015-12-09', NULL, 'n.v.t.', '', 1, '2015-12-10 16:41:35'),
(142, 32, 1, 'Ingeleverd agenda en opdrachten', '2015-12-14', NULL, 'n.v.t.', '', 1, '2015-12-13 21:16:29'),
(143, 34, 1, '-Maken structuur eindopdracht', '2015-12-12', NULL, 'n.v.t.', '', 1, '2015-12-17 11:06:56'),
(146, 32, 1, 'Maken pnocs + extra opdracht + kijken opdrachten periode 3 + 4', '2016-01-22', NULL, 'n.v.t.', '', 1, '2016-01-30 22:49:44'),
(144, 34, 1, 'Tonen Hue app', '2016-01-08', NULL, 'n.v.t.', '', 1, '2016-01-10 18:26:48'),
(145, 34, 1, 'Paul mailen opdracht beschrijving', '2015-12-12', NULL, 'n.v.t.', '', 1, '2016-01-03 22:26:32'),
(147, 32, 1, 'Kijken stages op bb', '2015-12-21', NULL, 'n.v.t.', '', 1, '2016-01-03 22:26:28'),
(148, 34, 1, '-talen toegevoegd (localization) + selectie\r\n-alle teksten op pagina''s koppelen aan localization bestanden\r\n-map edits', '2015-12-30', NULL, 'n.v.t.', '', 1, '2015-12-30 19:32:41'),
(150, 31, 1, 'Versturen en maken reviewverslag 4 + eventuele verbeteringen opleiding', '2016-01-18', NULL, 'n.v.t.', '', 1, '2016-01-30 22:46:31'),
(151, 33, 1, 'Systeemtest:\r\n-performance testing\r\n-Document afmaken (inleiding, voorblad, inhoudsopgave, slot, layout) \r\n+\r\nKorte beschrijving, lengte, aantal bezienswaardigheden tonen bij keuze route', '2016-01-12', NULL, 'n.v.t.', '', 1, '2016-01-15 17:37:52'),
(152, 34, 1, 'Inleveren C# project + windows store', '2016-01-21', NULL, 'BlackBoard', '', 1, '2016-01-22 12:33:23'),
(153, 33, 1, 'Kijken naar beschrijving project opdracht', '2016-01-18', NULL, 'n.v.t.', '', 1, '2016-01-21 18:51:49'),
(154, 36, 1, 'Downloaden en installeren programma''s, zie BB', '2016-02-01', NULL, 'n.v.t.', '', 1, '2016-02-02 12:58:08'),
(155, 40, 1, 'Maken opdrachten 3-4 (al deels af)', '2016-06-01', NULL, 'n.v.t.', '', 0, '2016-02-06 10:41:32'),
(156, 36, 1, 'Maken opdrachten en inleveren verslag + onderwerp eindopdracht', '2016-01-29', NULL, 'n.v.t.', '', 1, '2016-02-02 19:50:34'),
(157, 35, 1, 'test', '2016-02-01', NULL, 'n.v.t.', '', 1, '2016-02-02 19:38:45'),
(158, 35, 6, 'test', '2016-02-01', NULL, 'n.v.t.', '', 1, '2016-02-02 19:37:06'),
(159, 36, 1, 'Opdrachten maken en individueel inleveren', '2016-01-16', NULL, 'BlackBoard', '', 1, '2016-02-02 19:50:32'),
(160, 36, 6, 'test', '2016-01-16', NULL, 'BlackBoard', '', 1, '2016-02-02 20:05:53'),
(161, 36, 1, 'Opdrachten maken en individueel inleveren.\r\n\r\nMaken van kort en bondig verslag voorzien van:\r\n• Korte uitleg opdracht (2 a 3 zinnen)\r\n• Essentiele code voorzien van zinvol commentaar\r\n• Testrun resultaten (proof dat het werkt)\r\n• Alle code in een repository (werk ook aan je CV!) ', '2016-02-16', NULL, 'BlackBoard', '', 1, '2016-02-16 12:57:45'),
(162, 36, 6, 'Opdrachten maken en individueel inleveren.\r\n\r\nMaken van kort en bondig verslag voorzien van:\r\n• Korte uitleg opdracht (2 a 3 zinnen)\r\n• Essentiele code voorzien van zinvol commentaar\r\n• Testrun resultaten (proof dat het werkt)\r\n• Alle code in een repository (werk ook aan je CV!) ', '2016-02-16', NULL, 'BlackBoard', '', 0, '2016-02-02 19:50:25'),
(163, 35, 1, 'Demonstreer een werkende kiosk (Raspberry Pi die een live feed van twitter of website opent bij het booten)', '2016-02-15', NULL, 'n.v.t.', '', 1, '2016-02-04 23:32:37'),
(164, 35, 6, 'Demonstreer een werkende kiosk (Raspberry Pi die een live feed van twitter of website opent bij het booten)', '2016-02-15', NULL, 'n.v.t.', '', 0, '2016-02-02 20:05:30'),
(165, 35, 1, 'Inleveren onderwerp voor literatuurstudie ', '2016-02-19', '17:00:00', 'BlackBoard', '', 1, '2016-02-19 15:42:01'),
(166, 35, 6, 'Inleveren onderwerp voor literatuurstudie ', '2016-02-19', '17:00:00', 'BlackBoard', '', 0, '2016-02-02 20:07:19'),
(167, 35, 1, 'Inleveren literatuurstudie volgens opmaak van een rapport (P&OC)', '2016-04-04', '10:00:00', 'BlackBoard', '', 0, '2016-02-02 20:08:18'),
(168, 35, 6, 'Inleveren literatuurstudie volgens opmaak van een rapport (P&OC)', '2016-04-04', '10:00:00', 'BlackBoard', '', 0, '2016-02-02 20:08:18'),
(169, 41, 1, 'Maken minimaal 10 opdrachten en in groeidocument zetten', '2016-02-17', NULL, 'n.v.t.', '', 1, '2016-02-17 14:27:48'),
(170, 41, 6, 'Maken minimaal 10 opdrachten en in groeidocument zetten', '2016-02-17', NULL, 'n.v.t.', '', 0, '2016-02-03 10:39:31'),
(171, 38, 1, '-Read the module description for English writing\r\n-Study the assignment for the literature study OS/Linux\r\n', '2016-02-17', NULL, 'n.v.t.', '', 1, '2016-02-16 17:27:42'),
(172, 38, 6, '-Read the module description for English writing\r\n-Study the assignment for the literature study OS/Linux\r\n', '2016-02-17', NULL, 'n.v.t.', '', 0, '2016-02-03 19:39:35'),
(173, 39, 1, '-Zoek informatie\r\n-Houdt relevante informatie bij (in RefWorks of variant en/of een tekstbestand)\r\n\r\n-Bestudeer de handout ‘Elling Overzicht rapport schrijven’.\r\n-Lees de paragrafen van Elling bij stap 1, 2, 3 en 4 (zie handout op BB) en hoofdstuk 4.\r\n', '2016-02-25', NULL, 'n.v.t.', '', 1, '2016-03-05 15:15:49'),
(174, 39, 6, '-Zoek informatie\r\n-Houdt relevante informatie bij (in RefWorks of variant en/of een tekstbestand)\r\n\r\n-Bestudeer de handout ‘Elling Overzicht rapport schrijven’.\r\n-Lees de paragrafen van Elling bij stap 1, 2, 3 en 4 (zie handout op BB) en hoofdstuk 4.\r\n', '2016-02-17', NULL, 'n.v.t.', '', 0, '2016-02-03 19:46:15'),
(175, 35, 1, 'Raspberry Pi Mediacenter die uitzending gemist af kan spelen (met geluid).\r\nKijken naar presentatie 2', '2016-02-22', NULL, 'n.v.t.', '', 1, '2016-02-22 15:35:38'),
(176, 35, 6, 'Raspberry Pi Mediacenter die uitzending gemist af kan spelen (met geluid).', '2016-02-22', NULL, 'n.v.t.', '', 0, '2016-02-15 18:59:25'),
(177, 36, 1, 'Huiswerk week 2 inleveren', '2016-02-22', NULL, 'BlackBoard', '', 1, '2016-02-22 15:35:42'),
(178, 36, 6, 'Huiswerk week 2 inleveren', '2016-02-22', NULL, 'BlackBoard', '', 0, '2016-02-16 17:33:24'),
(179, 41, 1, 'Maken opdrachten week 2', '2016-02-24', NULL, 'n.v.t.', '', 1, '2016-03-05 15:15:42'),
(180, 41, 6, 'Maken opdrachten week 2', '2016-02-24', NULL, 'n.v.t.', '', 0, '2016-02-17 14:29:00'),
(181, 38, 1, 'Maken opdrachten week 2 (zie dias)', '2016-03-02', NULL, 'n.v.t.', '', 1, '2016-03-01 15:33:21'),
(182, 38, 6, 'Maken opdrachten week 2 (zie dias)', '2016-03-02', NULL, 'n.v.t.', '', 0, '2016-02-17 14:29:55'),
(183, 35, 1, 'Chapter 8. Play Games on Your Pi (Optioneel)\r\nChapter 9. Tinker with the GPIO Pins\r\n\r\nOpdracht: Demonstreer een game en een GPIO-toepassing', '2016-02-29', NULL, 'n.v.t.', '', 1, '2016-02-29 14:45:47'),
(184, 35, 6, 'Chapter 8. Play Games on Your Pi (Optioneel)\r\nChapter 9. Tinker with the GPIO Pins\r\n\r\nOpdracht: Demonstreer een game en een GPIO-toepassing', '2016-02-29', NULL, 'n.v.t.', '', 0, '2016-02-22 15:36:39'),
(185, 37, 1, 'Inschrijven Osiris', '2016-02-29', NULL, 'n.v.t.', '', 1, '2016-03-03 09:41:44'),
(186, 37, 6, 'Inschrijven Osiris', '2016-02-29', NULL, 'n.v.t.', '', 0, '2016-02-23 18:25:08'),
(187, 36, 1, 'Maken opdrachten en groeidocument bijwerken', '2016-02-29', '17:00:00', 'BlackBoard', '', 1, '2016-03-05 15:15:36'),
(188, 36, 6, 'Maken opdrachten en groeidocument bijwerken', '2016-02-29', '17:00:00', 'BlackBoard', '', 0, '2016-02-24 13:48:20'),
(189, 39, 1, 'Tussen opdracht 1 maken', '2016-03-04', NULL, 'BlackBoard', '', 1, '2016-03-05 08:15:34'),
(190, 39, 6, 'Tussen opdracht 1 maken', '2016-03-04', NULL, 'BlackBoard', '', 0, '2016-02-25 13:12:48'),
(191, 38, 1, 'Huiswerk Engels inleveren', '2016-03-16', '12:30:00', 'BlackBoard', '', 1, '2016-03-09 12:18:49'),
(192, 38, 6, 'Huiswerk Engels inleveren', '2016-03-16', '12:30:00', 'BlackBoard', '', 0, '2016-03-03 09:44:24'),
(193, 35, 1, 'Inleveren PvA\r\n(max, 2 A4-tjes) Beschrijf daarin minimaal wat je precies gaat doen, waar je energie mee denkt te besparen, wat je nodig hebt en wat je planning is.', '2016-03-14', '10:00:00', 'BlackBoard', '', 1, '2016-03-10 08:03:26'),
(194, 35, 6, 'Inleveren PvA\r\n(max, 2 A4-tjes) Beschrijf daarin minimaal wat je precies gaat doen, waar je energie mee denkt te besparen, wat je nodig hebt en wat je planning is.', '2016-03-14', '10:00:00', 'BlackBoard', '', 0, '2016-03-07 12:24:10'),
(195, 35, 1, 'Inleveren Assignment RESTful on the RPI kort verslagje + code (zip)', '2016-03-11', NULL, 'BlackBoard', '', 0, '2016-03-07 12:25:22'),
(196, 35, 6, 'Inleveren Assignment RESTful on the RPI kort verslagje + code (zip)', '2016-03-11', NULL, 'BlackBoard', '', 0, '2016-03-07 12:25:22'),
(197, 35, 1, 'Mailen Diederich met vragen over opdracht', '2016-03-10', NULL, 'n.v.t.', '', 1, '2016-03-10 12:34:13'),
(198, 39, 1, 'Tussen opdracht 2 maken (verbeteren opdracht 1, etc', '2016-03-20', NULL, 'BlackBoard', '', 0, '2016-03-10 13:00:13');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `todo`
--

DROP TABLE IF EXISTS `todo`;
CREATE TABLE IF NOT EXISTS `todo` (
  `todo_id` int(10) NOT NULL AUTO_INCREMENT,
  `gebruikers_id` int(10) NOT NULL,
  `datum` date DEFAULT NULL,
  `tijd` time DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `kleur` char(7) NOT NULL,
  `todo` text NOT NULL,
  `todo_af` tinyint(1) NOT NULL,
  `aangemaakt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`todo_id`),
  KEY `gebruikers_id` (`gebruikers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `todo`
--

INSERT INTO `todo` (`todo_id`, `gebruikers_id`, `datum`, `tijd`, `categorie`, `kleur`, `todo`, `todo_af`, `aangemaakt`) VALUES
(1, 1, NULL, NULL, 'megamanager', '', '-registreer pagina maken\r\n-eerste keer login scherm met algemene voorwaarden en instellingen en sitegebruik (mogelijkheid sorteren, toevoegen hw etc)\r\n-afstand mobiele tabel\r\n-vakken toevoegen versimpelen\r\n-instellingen:\r\n    responsive table 2 manieren\r\n    verander gegevens (mail, ww etc)\r\n    zet huidige jaar en periode\r\n', 0, '2015-09-25 12:39:38'),
(2, 1, NULL, NULL, 'megamanager', '', 'ns api voor storingen\r\nevt route plannen', 0, '0000-00-00 00:00:00'),
(3, 1, NULL, NULL, 'megamanager', '', 'avans api om rooster te zien\r\nexamenrooster, punten etc', 0, '0000-00-00 00:00:00'),
(4, 1, NULL, NULL, 'megamanager', '', 'een dag voor de einddatum van een opdracht/todo-item een mail sturen naar persoon', 0, '0000-00-00 00:00:00'),
(5, 1, NULL, NULL, 'megamanager', '', 'melding: de todolist/huiswerk lijst is leeg, voeg snel iets toe door op de plus knop te klikken', 1, '0000-00-00 00:00:00'),
(6, 1, NULL, NULL, 'megamanager', '', 'datum inputs in Nederlands formaat', 0, '0000-00-00 00:00:00'),
(7, 1, NULL, NULL, 'megamanager', '', 'geschiedenis pagina fixen', 1, '2015-02-17 10:56:18'),
(8, 1, NULL, NULL, 'megamanager', '', 'CSS wijzigen table-nonie om responsive tabel van todo lijst te fixen', 1, '0000-00-00 00:00:00'),
(9, 1, NULL, NULL, 'megamanager', '', 'Bij lesdag extra optie toevoegen: divers', 1, '2015-02-17 13:31:04'),
(10, 1, '2015-02-18', NULL, 'ps3', '', 'Dead space dlc ', 1, '2015-02-21 16:44:35'),
(11, 1, NULL, NULL, 'megamanager', '', 'vakken weghalen en bij het toevoegen van huiswerk het vak erbij kunnen plaatsen', 1, '2015-02-17 10:56:07'),
(12, 1, NULL, NULL, 'megamanager', '', 'op kolommen kunnen sorteren', 1, '2015-02-15 11:49:09'),
(13, 1, NULL, NULL, 'megamanager', '', 'Bij data-todo en data-huiswerk <br /> strippen dmv javascript of php', 1, '0000-00-00 00:00:00'),
(14, 1, NULL, NULL, 'game', '', 'Voor android een game.\r\ngebruikers kunnen met een simpele editor hun eigen levels maken en online delen.\r\neigen textures maken met een teken tool.', 0, '0000-00-00 00:00:00'),
(15, 1, '2015-02-10', '13:03:00', 'coachcompany', '#ff0000', 'Verhogen ruimte', 1, '0000-00-00 00:00:00'),
(16, 1, NULL, NULL, 'megamanager', '', 'Aanzetten keyboard tijd', 1, '2015-02-17 10:55:43'),
(17, 1, NULL, NULL, 'megamanager', '', 'Sorteren tijd null onderaan', 1, '2015-02-17 10:52:15'),
(18, 1, '2015-02-15', NULL, 'Osaka', '#ff9900', 'Osaka halen 20 + jaarogpaaf', 1, '2015-02-16 09:13:29'),
(19, 1, NULL, NULL, 'test', '', 'Todo list test timestamp', 1, '2015-02-15 11:01:57'),
(20, 1, NULL, NULL, 'test', '', 'Todo list test timestamp2', 1, '2015-02-15 11:02:03'),
(21, 1, '2015-02-18', '11:49:00', 'test', '', 'tijd test', 1, '2015-02-17 10:51:41'),
(22, 1, '2015-02-18', '12:01:00', 'test', '', 'tijd test2', 1, '2015-02-17 10:51:44'),
(23, 1, NULL, NULL, 'megamanager', '', 'geschiedenis pagina max 20 laten zien en naar volgende pagina voor volgende 20', 0, '2015-02-17 10:52:08'),
(24, 1, NULL, NULL, 'android', '#ff9900', 'Skylander schapen namaken:\r\n-achtervolgen, wegrennen, normaal lopen, in de fik etc\r\nhttps://www.youtube.com/watch?v=rEVd_ovhZRA\r\nhttps://www.youtube.com/watch?v=XkWE3jrTDHs', 1, '2015-10-07 14:32:58'),
(25, 1, NULL, NULL, 'megamanager', '', 'sorteren beter aangeven + javascript file downloaden (minifen)', 0, '2015-02-17 22:55:25'),
(26, 1, '2015-03-02', NULL, 'NY vakantie', '', '-psvita\r\n-koptelefoon\r\n-lenzen\r\n-bril\r\n-fris blijven in vliegtuig: leeg flesje water\r\n-kauwgom\r\n-schoolboek?\r\n-concept mails leraren', 1, '2015-03-10 23:07:29'),
(27, 1, '2015-03-10', NULL, 'NY', '', 'Sturen 650 euro voor vakantie en kleding pap', 1, '2015-04-05 07:31:16'),
(28, 1, '2015-03-31', NULL, 'waardebon', '', 'Paintball waardebon', 1, '2015-03-28 13:50:43'),
(29, 1, NULL, NULL, 'server', '#ff9900', 'Ubuntu server voor torrents etc', 0, '2015-03-15 11:22:52'),
(30, 1, '2015-03-23', NULL, 'CheapICT', '#ff9900', 'Factuur maken en opsturen', 1, '2015-03-28 13:50:39'),
(31, 1, '2015-06-28', NULL, 'Ugandahears', '#ff00ff', 'ugandahears dingen:\r\n-pagina/onderdeel voor sponsoren.\r\n-Wat kunnen mensen doen om te helpen, doneren, acties opzetten, etc.\r\n-facebook/twitter/linkedin (ook op de site)\r\n-video''s plaatsen\r\n-persoonlijke verhalen van geholpen mensen\r\n-http://www.cbf.nl/veel-gestelde-vragen/\r\n-meerdere talen?\r\n-bol.com affilatie\r\n-ambi stichting keurmerk \r\n-begroting evt', 1, '2015-06-29 14:36:10'),
(32, 1, NULL, NULL, 'software', '#00ffff', '-liberoffice uitproberen (compatible met office?)\r\n-email client mozilla', 0, '2015-03-26 22:42:43'),
(33, 1, '2015-04-10', NULL, 'cheapict', '#ffff00', 'Belastingdienst\r\n-omzetaangifte\r\n-inkomstenbelasting brief, invullen en evt uitstel aanvragen', 1, '2015-04-30 21:32:34'),
(34, 1, NULL, NULL, 'megamanager', '', 'MM koppelen aan google Calendar zodat alle gegevens makkelijk in Google Calendar weer te geven zijn', 0, '2015-04-07 15:29:55'),
(35, 1, '2015-04-09', NULL, 'sport', '', 'Mailen Arlan', 1, '2015-04-09 19:11:04'),
(36, 1, '2015-06-30', NULL, 'android', '', 'Android cursus - niet meer gedaan', 1, '2015-09-25 12:39:02'),
(37, 1, '2015-04-14', NULL, 'cheapict', '', 'Versturen factuur\r\nAfmaken algemene voorwaarden', 1, '2015-05-04 13:36:58'),
(38, 1, '2016-04-01', NULL, 'cheapict', '', '-Afmaken cheapict responsive site\r\n-Maken bedrijfskaartjes\r\n-Maken persoonlijke CV website:\r\n"Tijdens de opleiding rekening gehouden met duurzaamheid. Zie je bv terug in..."', 0, '2016-03-09 22:20:28'),
(39, 1, '2015-04-15', NULL, 'airsoft', '', 'Printen airsoft', 1, '2015-04-16 18:11:54'),
(40, 1, '2015-04-16', '17:56:00', 'psn', '', 'Psn borderlands, twd en psn plus\r\nAanbieding voorbij', 1, '2015-04-16 22:05:12'),
(41, 1, '2015-05-18', NULL, 'vakantie ', '#ffff00', 'Betalen vakantie ', 1, '2015-05-26 15:12:38'),
(42, 1, '2015-05-29', NULL, 'cheapict', '', 'Factureren websites', 1, '2015-06-01 15:54:57'),
(43, 1, '2015-05-29', NULL, 'werk', '', '-maken sollicitatie', 1, '2015-05-31 12:00:22'),
(44, 1, '2015-06-26', NULL, 'Belasting', '', 'Belastingdienst brief', 1, '2015-06-29 14:35:05'),
(45, 1, NULL, NULL, 'oauth', '', 'OAuth uitleg kijken bv van Facebook', 0, '2015-06-07 18:26:25'),
(46, 1, '2015-06-25', NULL, 'Cheapict', '', 'Facturen herinneringen ', 1, '2015-06-25 09:58:15'),
(47, 1, '2015-06-25', NULL, 'Cadeau', '', 'Bestellen voor moeders', 1, '2015-06-28 10:28:06'),
(48, 1, NULL, NULL, 'Bellen', '', 'Bellen webshop', 1, '2015-10-07 14:32:37'),
(49, 1, '2015-06-26', NULL, 'Cheapict', '', 'Afspraak maken Hans website ', 1, '2015-06-28 10:23:58'),
(50, 1, '2015-06-28', NULL, 'Arduino', '', 'Arduino boek doorwerken - niet meer gedaan', 1, '2015-09-25 12:39:10'),
(51, 1, '2015-06-28', NULL, 'Traktor', '', 'Kijken traktor op marktplaats-niet meer gedaan', 1, '2015-07-16 20:23:59'),
(52, 1, '2015-06-30', NULL, 'Belasting', '', 'Belasting aangifte en omzet belasting', 1, '2015-07-25 16:37:52'),
(53, 1, '2015-06-30', NULL, 'Webshop', '', 'Opsturen bon verzending wiigamesinfo ', 1, '2015-07-06 15:00:20'),
(54, 1, '2015-07-08', NULL, 'Megamanager', '', 'Kijken extra dingen voor megamanager', 1, '2015-09-25 12:39:57'),
(55, 1, '2015-07-08', NULL, 'Fiets ov', '', 'Verlengen OV fiets op andere rekening', 1, '2015-07-27 13:43:12'),
(56, 1, '2015-09-02', NULL, 'Facturen', '#00ffff', '-Maken factuur bristolteam', 1, '2015-09-09 17:06:39'),
(57, 1, '2015-09-26', NULL, 'werk', '#ff9900', 'Kijken naar loon Avans + promowerk', 1, '2015-09-29 12:53:25'),
(58, 1, '2015-10-11', NULL, 'Belasting', '#ffff00', '-Omzetbelasting Q3 doorgeven\r\n-Kijken of factuur Osaka al is betaald', 1, '2015-10-11 20:32:58'),
(59, 1, '2015-10-24', NULL, 'CheapICT', '#00ff00', '-Maken RAD SealFlex', 1, '2015-11-03 22:12:01'),
(60, 1, '2015-10-10', NULL, 'MPS', '#ff9900', '-Tekst knop bij vloeren veranderen voor aanvraag informatie\r\n-veld toevoegen met input voor woonplaats\r\n-factureren voor bovenstaande + antwerpen email en adresgegevens (2uur)', 1, '2015-10-14 21:07:18'),
(61, 1, '2015-10-16', NULL, 'CheapICT', '#00ff00', 'Offerte generator maken + verwijzen naar AV', 1, '2015-11-03 22:11:51'),
(62, 1, '2015-10-15', NULL, 'cheapict', '', 'Mailen Miriam prijzen', 1, '2015-10-17 11:53:17'),
(63, 1, '2015-10-23', NULL, 'CheapICT', '#ff9900', 'Miriam website hosten', 1, '2015-10-20 11:28:23'),
(64, 1, '2016-03-11', NULL, 'stage', '#ff9900', 'Zoeken stage: aanschrijven bedrijven, vragen contact informatie', 0, '2016-03-09 22:20:14'),
(65, 1, '2015-11-28', NULL, 'embedded systems', '', 'Embedded system - robot (battlebot achtig) bouwen', 1, '2015-11-11 18:44:20'),
(66, 1, '2015-11-05', NULL, 'Mps', '#ff9900', 'betalingsherinnering mps', 1, '2015-11-07 18:41:52'),
(67, 1, '2015-11-06', NULL, 'Tele2', '#ffff00', 'Tele2 factuur doorlopend', 1, '2015-11-07 18:42:00'),
(68, 1, '2016-04-01', NULL, 'Portfolio', '', 'Maken portfolio bedrijf pagina en CV', 0, '2016-03-09 22:20:38'),
(69, 1, '2015-11-13', NULL, 'Neostrada', '#ffff00', 'Neostrada nieuwe factuur downloaden na bevestiging dat betaling goed gelopen is', 1, '2015-11-14 13:29:29'),
(70, 1, '2015-11-13', NULL, 'Website', '#ffff00', 'Site Miranda opzetten', 1, '2015-11-15 11:11:36'),
(71, 1, '2015-11-13', NULL, 'Sealflex', '#ff9900', 'Factuur sturen Sealflex', 1, '2015-11-15 14:49:12'),
(72, 1, '2015-11-14', NULL, 'Mps', '', 'Ger mps mail', 1, '2015-11-14 13:29:23'),
(73, 1, '2015-11-28', NULL, 'pc', '', 'pc ome ruud', 1, '2015-12-05 15:26:22'),
(74, 1, '2016-02-09', NULL, 'sealflex', '', 'Onderzoeken C# naar PHP server veilig verzenden van gegevens:\r\n-ssl verbinding opzetten\r\n-sql op php server afhandelen en geen mysql credentials in c# client opslaan.\r\n-checken of ssl verbinding https url encrypt zodat get gegevens niet verschijnen\r\n-checken of c# post in https url kan sturen naar php.\r\n-geen certificaat nodig voor c# client als php server ssl ondersteund?', 1, '2016-03-09 22:20:55'),
(75, 1, '2015-11-16', NULL, 'Anissa', '', 'Anissa moet 29,50 overmaken naar rknnr\r\nAnissa 5,25 geven', 1, '2015-11-18 19:42:02'),
(76, 1, '2015-11-18', NULL, 'Studielink', '#d0e0e3', 'Kijken studielink', 1, '2015-11-18 19:36:55'),
(77, 1, '2015-12-09', NULL, 'Xplor', '', 'Xplora boek verlengen', 1, '2015-12-08 20:47:54'),
(78, 1, '2015-12-07', NULL, '', '#9900ff', 'Mailen Fin4Finance over wat er precies gekoppeld moet/kan worden aan Twinfield en/of WeFact. Vragen om toegangsgegevens.', 1, '2015-12-08 22:56:27'),
(79, 1, '2015-12-09', NULL, 'CheapICT', '#ff00ff', 'Afsluiten bristolteamapp.nl\r\noverzetten servers bristolteam.nl', 1, '2015-12-23 21:17:28'),
(80, 1, '2015-12-07', NULL, 'todovandaag', '#fff2cc', '- Installeren Office, deinstalleren oude\r\n- Wat morgen eten? Vlees uit vriezer halen', 1, '2015-12-08 11:33:55'),
(81, 1, '2015-12-08', NULL, 'Avans', '#fff2cc', 'Decleratieformulier inleveren + paspoort kopie', 1, '2015-12-14 20:05:52'),
(82, 1, '2015-12-12', NULL, '', '#00ff00', 'oma bellen', 1, '2015-12-12 11:57:23'),
(83, 1, '2015-12-19', NULL, 'sealflex', '', 'Mail sturen vragen mobiel + nog niet betaald', 1, '2016-01-03 22:27:46'),
(84, 1, '2016-01-04', NULL, 'Sealflex', '#ff9900', 'Mailen Chris toegang', 1, '2016-01-08 16:47:14'),
(85, 1, '2016-07-01', NULL, 'School', '', 'Windows store account toevoegen hue app + eindopdracht + project', 0, '2016-03-09 22:21:08'),
(86, 1, '2016-01-22', NULL, 'cheapict', '#ff0000', 'Betalen belasting', 1, '2016-01-28 17:03:25'),
(87, 1, '2016-01-28', NULL, 'Joey', '', '€34 Joey ', 1, '2016-01-28 13:32:39'),
(88, 1, '2016-02-07', NULL, 'Sealflex', '#ffff00', 'REST API PHP zie mail', 1, '2016-02-16 17:25:04'),
(89, 1, NULL, NULL, 'Cheapict', '', 'http://tweakers.net/nieuws/107729/overheid-zet-generator-voor-heldere-privacyvoorwaarden-online.html\r\nGenereren privacy voorwaarden', 0, '2016-02-03 15:07:11'),
(90, 1, '2016-02-08', NULL, 'Cheapict', '#ffff00', 'Facturen uitzetten', 1, '2016-02-16 19:12:15'),
(91, 1, '2016-02-29', NULL, 'PS4', '#ff9900', 'Voor 1 maart season pass Fallout 4 kopen', 1, '2016-02-28 15:55:37'),
(92, 1, '2016-03-10', NULL, 'Sealflex', '#00ffff', 'Mailen video naar sealflex', 1, '2016-03-10 08:58:53'),
(93, 1, '2016-03-10', NULL, 'School', '#ff9900', 'Vragen René begrafenis en PvA ', 1, '2016-03-10 08:03:35'),
(94, 1, '2016-03-12', NULL, 'Belasting', '#00ffff', 'Belasting aangifte', 0, '2016-03-10 08:59:43');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `password` char(60) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `gebruikers_naam` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`user_id`, `password`, `username`, `email`, `phone`, `firstname`, `surname`) VALUES
(1, '$2y$13$eLaHMqEw7wYyMB27ElZRwusaWwDqFFhf4KkvNdXRhFrxpACGctScG', 'daveym', 'contact@cheapict.nl', '0629121870', 'Davey', 'Mathijssen');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vakken`
--

DROP TABLE IF EXISTS `vakken`;
CREATE TABLE IF NOT EXISTS `vakken` (
  `vak_id` int(10) NOT NULL AUTO_INCREMENT,
  `gebruikers_id` int(10) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `afkorting` varchar(10) NOT NULL,
  `docent` varchar(255) NOT NULL,
  `lesdag` char(9) NOT NULL,
  `studiejaar` tinyint(1) NOT NULL,
  `periode` tinyint(1) NOT NULL,
  `aangemaakt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vak_id`),
  KEY `gebruikers_id` (`gebruikers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `vakken`
--

INSERT INTO `vakken` (`vak_id`, `gebruikers_id`, `naam`, `afkorting`, `docent`, `lesdag`, `studiejaar`, `periode`, `aangemaakt`) VALUES
(1, 1, 'Object Georiënteerd Programmeren 2', 'OGP2', 'Paul de Mast', 'maandag', 1, 3, '0000-00-00 00:00:00'),
(2, 1, '2D-Computergraphics', '2d-gr', 'Diederich Kroeske', 'woensdag', 1, 3, '0000-00-00 00:00:00'),
(3, 1, 'wiskunde', 'wis', 'Pieter Kop Jansen', 'vrijdag', 1, 3, '0000-00-00 00:00:00'),
(4, 1, 'Festival Planner', 'FP', 'Johan Talboom', 'dinsdag', 1, 3, '0000-00-00 00:00:00'),
(5, 1, 'P&OC3', 'P&OC3', 'Jantien Donkers', 'donderdag', 1, 3, '0000-00-00 00:00:00'),
(6, 2, 'Wiskunde 3', 'Wis3', 'Wilfred Kleinjan', 'woensdag', 3, 3, '0000-00-00 00:00:00'),
(7, 2, 'Project management', 'ProMan', 'Ageeth Lefferts', 'maandag', 3, 3, '0000-00-00 00:00:00'),
(12, 1, 'Object Georiënteerd Moduleren 2', 'OGM2', 'Hans van der Linden', 'donderdag', 1, 3, '0000-00-00 00:00:00'),
(9, 2, 'Duurzaamheid', 'Duur', 'Vincent de Jong', 'maandag', 3, 3, '0000-00-00 00:00:00'),
(10, 2, 'Reactorkunde', 'Rea', 'Vincent de Jong', 'maandag', 3, 3, '0000-00-00 00:00:00'),
(11, 2, 'Project', 'Pro', 'Wim Gaakeer', 'maandag', 3, 3, '0000-00-00 00:00:00'),
(13, 1, 'Studie Loopbaan Begeleiding', 'SLB', 'Joli Kruijsdijk-Waijers', 'maandag', 1, 3, '0000-00-00 00:00:00'),
(14, 1, 'P&OC4', 'P&OC4', 'Jantien Donkers', 'maandag', 1, 4, '2015-04-30 21:23:20'),
(15, 1, 'Interactie & Beleving', 'Inbel', 'Hannie Mommers', 'dinsdag', 1, 4, '2015-04-30 21:24:18'),
(16, 1, 'Calculus', 'calc', 'Pieter Kop Jansen', 'woensdag', 1, 4, '2015-04-30 21:24:36'),
(17, 1, 'Project', 'Project', 'nvt', 'divers', 1, 4, '2015-04-30 21:25:18'),
(18, 1, 'Techniek', 'Techniek', 'Diederich Kroeske', 'donderdag', 1, 4, '2015-04-30 21:30:40'),
(19, 1, 'Studie Loopbaan Begeleiding', 'SLB', 'Joli Kruijsdijk-Waijers', 'divers', 1, 4, '2015-04-30 21:32:07'),
(20, 1, 'Netwerk Programmeren', 'OGP3', 'Paul de Mast', 'maandag', 1, 4, '2015-05-19 12:37:57'),
(21, 1, 'Studie Loopbaan Begeleiding', 'SLB', 'Joli Kruijsdijk-Waijers', 'maandag', 1, 4, '2015-05-19 12:38:27'),
(22, 1, 'Project', 'RHAPP', 'Johan Talboom', 'maandag', 2, 1, '2015-08-30 13:31:15'),
(23, 1, 'Databases', 'DB', 'Hans van der Linden', 'dinsdag', 2, 1, '2015-08-30 13:31:50'),
(24, 1, 'Bedrijfskunde', 'Bedrijfsk', 'Alex Kada', 'dinsdag', 2, 1, '2015-09-22 12:02:52'),
(25, 1, 'Datacommunicatie en netwerken', 'dcn', 'Andries van Dongen', 'woensdag', 2, 1, '2015-08-30 13:32:53'),
(26, 1, 'C# programmeren', 'C#', 'Paul de Mast', 'donderdag', 2, 1, '2015-08-30 13:33:21'),
(27, 1, 'P&OC2.1', 'P&OC2.1', 'Jantien Donkers', 'maandag', 2, 1, '2015-08-30 13:34:17'),
(28, 1, 'Studie Loopbaan Begeleiding', 'SLO', 'Joli van Kruijsdijk-Waijers', 'divers', 2, 1, '2015-09-08 15:40:08'),
(29, 1, 'Design Patterns', 'DP', 'Hans van der Linden', 'woensdag', 2, 2, '2015-11-08 21:17:37'),
(30, 1, 'Databases 2', 'DB 2', 'Paul de Mast', 'vrijdag', 2, 2, '2015-11-08 21:18:19'),
(31, 1, 'P&OC 2.2', 'P&OC 2.2', 'Jantien Donkers', 'maandag', 2, 2, '2015-11-08 21:19:35'),
(32, 1, 'Studie Loopbaan Begeleiding', 'SLB', 'Joli van Kruijsdijk', 'divers', 2, 2, '2015-11-08 21:20:12'),
(33, 1, 'Project', 'Project', 'Joli van Kruijsdijk', 'divers', 2, 2, '2015-11-11 18:41:39'),
(34, 1, '.Net programmeren', '.Net progr', 'Paul de Mast', 'dinsdag', 2, 2, '2015-11-11 18:42:00'),
(35, 1, 'Linux', 'Linux', 'Andries van Dongen', 'maandag', 2, 3, '2016-01-30 22:55:42'),
(36, 1, 'Microcontrollers', 'Micro', 'Diederich Kroeske', 'dinsdag', 2, 3, '2016-01-30 22:58:14'),
(37, 1, 'Project', 'Project', 'X', 'divers', 2, 3, '2016-01-30 22:58:29'),
(38, 1, 'English Writing', 'English', 'Eefje Gijzen', 'woensdag', 2, 3, '2016-02-02 17:45:50'),
(39, 1, 'P&OC', 'P&OC', 'Jantien Donkers', 'donderdag', 2, 3, '2016-02-02 17:45:08'),
(40, 1, 'SLO', 'SLO', 'Joli van Kruijsdijk', 'divers', 2, 3, '2016-01-30 23:00:39'),
(41, 1, 'Embedded software ontwikkeling', 'PRGLOG', 'Peter Kailuhu', 'woensdag', 2, 3, '2016-02-02 17:49:14'),
(42, 6, 'Embedded software ontwikkeling', 'PRGLOG', 'Peter Kailuhu', 'woensdag', 2, 3, '2016-02-02 17:49:14'),
(43, 6, 'SLO', 'SLO', 'Johan Talboom', 'divers', 2, 3, '2016-01-30 23:00:39'),
(44, 6, 'P&OC', 'P&OC', 'Jantien Donkers', 'donderdag', 2, 3, '2016-02-02 17:45:08'),
(45, 6, 'English Writing', 'English', 'Eefje Gijzen', 'woensdag', 2, 3, '2016-02-02 17:45:50'),
(46, 6, 'Project', 'Project', 'X', 'divers', 2, 3, '2016-01-30 22:58:29'),
(47, 6, 'Microcontrollers', 'Micro', 'Diederich Kroeske', 'dinsdag', 2, 3, '2016-01-30 22:58:14'),
(48, 6, 'Linux', 'Linux', 'Andries van Dongen', 'maandag', 2, 3, '2016-01-30 22:55:42');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
