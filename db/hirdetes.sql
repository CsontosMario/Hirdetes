-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 05. 09:27
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `hirdetes`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fizetes`
--

CREATE TABLE `fizetes` (
  `fizetesTipus` varchar(11) NOT NULL,
  `megnevezes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fizetes`
--

INSERT INTO `fizetes` (`fizetesTipus`, `megnevezes`) VALUES
('A', 'transfer'),
('BK', 'credit_card'),
('KP', 'ready_money');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `kosarID` int(11) NOT NULL,
  `felhasznaloID` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `fizetesTipus` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kosar`
--

INSERT INTO `kosar` (`kosarID`, `felhasznaloID`, `datum`, `fizetesTipus`) VALUES
(1, 1, '2017-11-15 00:00:00', 'A'),
(2, 2, '2016-09-06 00:00:00', 'BK'),
(3, 3, '2019-06-12 00:00:00', 'KP'),
(4, 4, '2023-12-04 00:00:00', 'KP'),
(5, 5, '2018-03-20 00:00:00', 'BK');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosarelemek`
--

CREATE TABLE `kosarelemek` (
  `kosarID` int(11) NOT NULL,
  `termekID` int(11) NOT NULL,
  `db` int(11) NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kosarelemek`
--

INSERT INTO `kosarelemek` (`kosarID`, `termekID`, `db`, `ar`) VALUES
(1, 1, 3, 3000),
(2, 2, 12, 4800),
(3, 3, 6, 2400),
(4, 4, 16, 8000),
(5, 5, 19, 4750);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `programozoink`
--

CREATE TABLE `programozoink` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `szuletesihely` varchar(20) NOT NULL,
  `szuletesiev` int(4) NOT NULL,
  `rolaroviden` text NOT NULL,
  `rola` text NOT NULL,
  `munkanev` varchar(50) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `profesion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `programozoink`
--

INSERT INTO `programozoink` (`id`, `nev`, `szuletesihely`, `szuletesiev`, `rolaroviden`, `rola`, `munkanev`, `kep`, `profesion`) VALUES
(1, 'Vékony Marcell', 'Makó', 2003, 'about_small', 'about', 'project_membership', 'marcell.jpg', 'profession'),
(2, 'Csontos Márió Dávid', 'Makó', 2005, 'about_small_r', 'about_r', 'projekt_leadership', 'mario_temporary_picture.jpg', 'profession');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `regisztracio`
--

CREATE TABLE `regisztracio` (
  `felhasznaloID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `telefonszam` varchar(20) DEFAULT NULL,
  `jelszo` varchar(50) NOT NULL,
  `iranyitoszam` int(11) DEFAULT NULL,
  `telepules` varchar(50) DEFAULT NULL,
  `cim` varchar(50) DEFAULT NULL,
  `orszag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `regisztracio`
--

INSERT INTO `regisztracio` (`felhasznaloID`, `email`, `nev`, `telefonszam`, `jelszo`, `iranyitoszam`, `telepules`, `cim`, `orszag`) VALUES
(1, 'vekony.marcell-2020@keri.mako.hu', 'Vékony Marcell', NULL, '1234aA', 6900, 'Makó', 'Posta.u. 1', 'Magyarország'),
(2, 'csontos.mariodavi-2020@keri.mako.hu', 'Csontos Márió Dávid', '6205478301', '1234aA', 6915, 'Csanádalberti', 'Munkácsy Mihály utca 23.', 'Magyarország'),
(3, 'villamnyul7777@gmail.com', 'Raikou Usagi', '06205478301', '1234aA', 6915, 'Csanádalberti', 'Dózsa György utca 3.', 'Magyarország'),
(4, 'szabomario@gmail.com', 'Szabó Márió', '06705578905', '1234aA', 6900, 'Makó', 'Ady Endre u 1.', 'Magyarország'),
(5, 'kissandrea@gmail.com', 'Kiss Andrea', NULL, '1234aA', 6900, 'Makó', 'Kossuth L utca 46.', 'Magyarország'),
(6, 'nagyakos@gmail.com', 'Nagy Ákos', '06309846507', '1234aA', 6915, 'Csanádalberti', 'Petőfi Sándor utca 3.', 'Magyarország'),
(7, 'nyaridaniel@gmail.com', 'Nyári Dániel', NULL, '1234aA', 6900, 'Makó', 'ukbuk.u. 1', 'Magyarország'),
(8, 'frankcastle@gmail.com', 'Frank Castle', NULL, '1234aA', 6900, 'New York', 'street.u 7.', 'United States'),
(9, 'petecastallengtion@gmail.com', 'Pete Castallengtion', NULL, '1234aA', 10000, 'New York', 'Park Avenue', 'United States'),
(10, 'soujiseta2011@gmail.com', 'Souji Seta', '+8175322198', '1234aA', 777, 'Fuefuki, Yamanashi Prefecture', 'Yamanashi Prefectural Rd 303', 'Japan');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termeloink`
--

CREATE TABLE `termeloink` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `szuletett` int(4) NOT NULL,
  `rolaroviden` text NOT NULL,
  `rola` text NOT NULL,
  `munkanev` varchar(30) NOT NULL,
  `kep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termeloink`
--

INSERT INTO `termeloink` (`id`, `nev`, `szuletett`, `rolaroviden`, `rola`, `munkanev`, `kep`) VALUES
(1, 'Hudák Mária', 1964, '', '', 'job_title', 'maria.jpg'),
(2, 'Burkus Gusztáv', 1960, '', '', 'job_title', 'gusztav.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek`
--

CREATE TABLE `zoldsegek` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek`
--

INSERT INTO `zoldsegek` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'potato', 'potato_desc', 1000, 'packaging_in_bulk'),
(2, 'carrot.jpg', 'carrot', 'carrot_desc', 400, 'packaging_in_bulk'),
(3, 'sorrel.jpg', 'sorrel', 'sorrel_desc', 400, 'packaging_per_package'),
(4, 'spinach.jpg', 'spinach', 'spinach_desc', 500, 'packaging_per_package'),
(5, 'spring_onion.jpg', 'spring_onion', 'spring_onion_desc', 250, 'packaging_per_package'),
(6, 'corn.jpg', 'corn', 'corn_desc', 200, 'packaging_piece_by_piece'),
(7, 'pea.jpg', 'pea', 'pea_desc', 1000, 'packaging_in_bulk'),
(8, 'kohlrabi.jpg', 'kohlrabi', 'kohlrabi_desc', 450, 'packaging_piece_by_piece'),
(9, 'pepper.jpg', 'pepper', 'pepper_desc', 800, 'packaging_in_bulk'),
(10, 'cauliflower.jpg', 'cauliflower', 'cauliflower_desc', 800, 'packaging_by_head');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fizetes`
--
ALTER TABLE `fizetes`
  ADD PRIMARY KEY (`fizetesTipus`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`kosarID`),
  ADD KEY `felhasznaloID` (`felhasznaloID`),
  ADD KEY `fizetesID` (`fizetesTipus`);

--
-- A tábla indexei `kosarelemek`
--
ALTER TABLE `kosarelemek`
  ADD PRIMARY KEY (`kosarID`,`termekID`);

--
-- A tábla indexei `programozoink`
--
ALTER TABLE `programozoink`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `regisztracio`
--
ALTER TABLE `regisztracio`
  ADD PRIMARY KEY (`felhasznaloID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `termeloink`
--
ALTER TABLE `termeloink`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `zoldsegek`
--
ALTER TABLE `zoldsegek`
  ADD PRIMARY KEY (`termekID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `programozoink`
--
ALTER TABLE `programozoink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `termeloink`
--
ALTER TABLE `termeloink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `zoldsegek`
--
ALTER TABLE `zoldsegek`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
