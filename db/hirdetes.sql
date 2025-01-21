-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 21. 10:18
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
  `fizetesID` int(11) NOT NULL,
  `megnevezes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fizetes`
--

INSERT INTO `fizetes` (`fizetesID`, `megnevezes`) VALUES
(1, 'készpénz'),
(2, 'átutalás'),
(3, 'bankkártya');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `kosarID` int(11) NOT NULL,
  `felhasznaloID` int(11) NOT NULL,
  `datum` date NOT NULL,
  `fizetesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kosar`
--

INSERT INTO `kosar` (`kosarID`, `felhasznaloID`, `datum`, `fizetesID`) VALUES
(1, 1, '2017-11-15', 1),
(2, 2, '2016-09-06', 2),
(3, 3, '2019-06-12', 3),
(4, 4, '2023-12-04', 4),
(5, 5, '2018-03-20', 5);

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
(1, 1, 3, 500),
(2, 2, 12, 5500),
(3, 3, 6, 3000),
(4, 4, 16, 36000),
(5, 5, 19, 12000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `regisztracio`
--

CREATE TABLE `regisztracio` (
  `felhasznaloID` int(11) NOT NULL,
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

INSERT INTO `regisztracio` (`felhasznaloID`, `nev`, `jelszo`, `iranyitoszam`, `telepules`, `cim`, `orszag`) VALUES
(1, 'Vékony Marcell', '1234aA', 6900, 'Makó', 'Posta.u. 1', 'Magyarország'),
(2, 'Csontos Márió Dávid', '1234aA', 6915, 'Csanádalberti', 'Munkácsy Mihály utca 23.', 'Magyarország');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek`
--

CREATE TABLE `zoldsegek` (
  `kep` varchar(50) NOT NULL,
  `termekID` int(10) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek`
--

INSERT INTO `zoldsegek` (`kep`, `termekID`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
('potato', 1, 'Burgonya (Balatoni-rózsa)', 'Közepes liszttartalmú, sütésre és főzésre is alkalmas. Magyar termék.', 1000, 'ömlesztve'),
('carrot', 2, 'Sárgarépa (Matador)', 'Síma hengeres, közepes hosszúságú.  Magyar termék.', 400, 'ömlesztve'),
('sorrel', 3, 'Kerti Sóska (Pallagi nagylevelű)', 'Erőteljes levelű.  Magyar termék.', 400, 'csomagonként'),
('spinach', 4, 'Spenót', 'Közepes nagyságú levelek. Magyar termék.', 500, 'csomagonként'),
('spring_onion', 5, 'Újhagyma', 'Hosszúkás fejű, alkalmas friss fogyasztásra és salátákhoz. Magyar termék.', 250, 'csomagonként'),
('corn', 6, 'Kukorica (Csemege)', 'Közepes szemű, édes, főzésre kitűnő. Magyar termék.', 200, 'darabonként'),
('pea', 7, 'Zöldborsó (Zsuzsi)', 'Közepes nagyságú szemek, zsengék és alkalmas levesekheez, főzelékekhez, salátákhoz. Magyar termék.', 1000, 'ömlesztve'),
('kohlrabi', 8, 'Karalábé', 'Zsenge, fehér. Magyar termék.', 450, 'darabonként'),
('pepper', 9, 'Paprika (Fehérözön)', 'Húsos, közepes nagyságú, friss fogyasztásra és főzésre egyaránt alkalmas. Magyar termék.', 800, 'ömlesztve'),
('cauliflower', 10, 'Karfiol', 'Nagyrózsájú, alkalmas levesek, főzelékek és számtalan étel készítésére. Magyar termék.', 800, 'fejenként');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fizetes`
--
ALTER TABLE `fizetes`
  ADD PRIMARY KEY (`fizetesID`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`kosarID`),
  ADD KEY `felhasznaloID` (`felhasznaloID`),
  ADD KEY `fizetesID` (`fizetesID`);

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
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `zoldsegek`
--
ALTER TABLE `zoldsegek`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
