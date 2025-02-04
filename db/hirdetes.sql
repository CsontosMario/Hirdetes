-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 04. 11:05
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
('A', 'átutalás'),
('BK', 'bankkártya'),
('KP', 'készpénz');

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
-- Tábla szerkezet ehhez a táblához `regisztracio`
--

CREATE TABLE `regisztracio` (
  `felhasznaloID` int(11) NOT NULL,
  `azonosito` varchar(50) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `jelszo` varchar(50) NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `telepules` varchar(50) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `orszag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `regisztracio`
--

INSERT INTO `regisztracio` (`felhasznaloID`, `azonosito`, `nev`, `jelszo`, `iranyitoszam`, `telepules`, `cim`, `orszag`) VALUES
(1, 'vekonymarcell', 'Vékony Marcell', '1234aA', 6900, 'Makó', 'Posta.u. 1', 'Magyarország'),
(2, 'csontosmariodavid', 'Csontos Márió Dávid', '1234aA', 6915, 'Csanádalberti', 'Munkácsy Mihály utca 23.', 'Magyarország'),
(3, 'raikouusagi', 'Raikou Usagi', '1234aA', 6915, 'Csanádalberti', 'Dózsa György utca 3.', 'Magyarország'),
(4, 'szabomario', 'Szabó Márió', '1234aA', 6900, 'Makó', 'Ady Endre u 1.', 'Magyarország'),
(5, 'kissandrea', 'Kiss Andrea', '1234aA', 6900, 'Makó', 'Kossuth L utca 46.', 'Magyarország'),
(6, 'nagyakos', 'Nagy Ákos', '1234aA', 6915, 'Csanádalberti', 'Petőfi Sándor utca 3.', 'Magyarország'),
(7, '', 'Nyári Dániel', '1234aA', 6900, 'Makó', 'ukbuk.u. 1', 'Magyarország'),
(8, '', 'Frank Castle', '1234aA', 6900, 'New York', 'street.u 7.', 'United States'),
(9, '', 'Pete Castallengtion', '1234aA', 10000, 'New York', 'Park Avenue', 'United States');

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
(1, 'potato.jpg', 'Burgonya (Balatoni-rózsa)', 'Közepes liszttartalmú, sütésre és főzésre is alkalmas. Magyar termék.', 1000, 'ömlesztve'),
(2, 'carrot.jpg', 'Sárgarépa (Matador)', 'Síma hengeres, közepes hosszúságú.  Magyar termék.', 400, 'ömlesztve'),
(3, 'sorrel.jpg', 'Kerti Sóska (Pallagi nagylevelű)', 'Erőteljes levelű.  Magyar termék.', 400, 'csomagonként'),
(4, 'spinach.jpg', 'Spenót', 'Közepes nagyságú levelek. Magyar termék.', 500, 'csomagonként'),
(5, 'spring_onion.jpg', 'Újhagyma', 'Hosszúkás fejű, alkalmas friss fogyasztásra és salátákhoz. Magyar termék.', 250, 'csomagonként'),
(6, 'corn.jpg', 'Kukorica (Csemege)', 'Közepes szemű, édes, főzésre kitűnő. Magyar termék.', 200, 'darabonként'),
(7, 'pea.jpg', 'Zöldborsó (Zsuzsi)', 'Közepes nagyságú szemek, zsengék és alkalmas levesekheez, főzelékekhez, salátákhoz. Magyar termék.', 1000, 'ömlesztve'),
(8, 'kohlrabi.jpg', 'Karalábé', 'Zsenge, fehér. Magyar termék.', 450, 'darabonként'),
(9, 'pepper.jpg', 'Paprika (Fehérözön)', 'Húsos, közepes nagyságú, friss fogyasztásra és főzésre egyaránt alkalmas. Magyar termék.', 800, 'ömlesztve'),
(10, 'cauliflower.jpg', 'Karfiol', 'Nagyrózsájú, alkalmas levesek, főzelékek és számtalan étel készítésére. Magyar termék.', 800, 'fejenként');

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
-- A tábla indexei `regisztracio`
--
ALTER TABLE `regisztracio`
  ADD PRIMARY KEY (`felhasznaloID`);

--
-- A tábla indexei `zoldsegek`
--
ALTER TABLE `zoldsegek`
  ADD PRIMARY KEY (`termekID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `zoldsegek`
--
ALTER TABLE `zoldsegek`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
