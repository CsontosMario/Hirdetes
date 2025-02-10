-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 10. 13:37
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
  `email` varchar(50) NOT NULL,
  `jelszo` varchar(50) NOT NULL,
  `iranyitoszam` int(11) NOT NULL,
  `telepules` varchar(50) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `orszag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `regisztracio`
--

INSERT INTO `regisztracio` (`felhasznaloID`, `azonosito`, `nev`, `email`, `jelszo`, `iranyitoszam`, `telepules`, `cim`, `orszag`) VALUES
(1, 'vekonymarcell', 'Vékony Marcell', '', '1234aA', 6900, 'Makó', 'Posta.u. 1', 'Magyarország'),
(2, 'csontosmariodavid', 'Csontos Márió Dávid', 'csontos.mariodavi-2020@keri.mako.hu', '1234aA', 6915, 'Csanádalberti', 'Munkácsy Mihály utca 23.', 'Magyarország'),
(3, 'raikouusagi', 'Raikou Usagi', 'villamnyul7777@gmail.com', '1234aA', 6915, 'Csanádalberti', 'Dózsa György utca 3.', 'Magyarország'),
(4, 'szabomario', 'Szabó Márió', '', '1234aA', 6900, 'Makó', 'Ady Endre u 1.', 'Magyarország'),
(5, 'kissandrea', 'Kiss Andrea', '', '1234aA', 6900, 'Makó', 'Kossuth L utca 46.', 'Magyarország'),
(6, 'nagyakos', 'Nagy Ákos', 'akosnagy@gmail.com', '1234aA', 6915, 'Csanádalberti', 'Petőfi Sándor utca 3.', 'Magyarország'),
(7, 'nyaridaniel', 'Nyári Dániel', 'nyaridaniel@gmail.com', '1234aA', 6900, 'Makó', 'ukbuk.u. 1', 'Magyarország'),
(8, 'frankcastle', 'Frank Castle', '', '1234aA', 6900, 'New York', 'street.u 7.', 'United States'),
(9, 'petecastallengtion', 'Pete Castallengtion', '', '1234aA', 10000, 'New York', 'Park Avenue', 'United States'),
(10, 'soujiseta', 'Souji Seta', 'soujiseta@gmail.com', '1234aA', 777, 'Fuefuki, Yamanashi', 'Yamanashi Prefectural Rte 313', 'Japan');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek_en`
--

CREATE TABLE `zoldsegek_en` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_en`
--

INSERT INTO `zoldsegek_en` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'Potato', 'Medium flour content, suitable for baking and cooking. Hungarian product.', 1000, 'in bulk'),
(2, 'carrot.jpg', 'Carrot', 'Smooth cylindrical, medium length. Hungarian product.', 400, 'in bulk'),
(3, 'sorrel.jpg', 'Garden Sorrel', 'Strong leaves. Hungarian product.', 400, 'per package'),
(4, 'spinach.jpg', 'Spinach', 'Medium-sized leaves. Hungarian product.', 500, 'per package'),
(5, 'spring_onion.jpg', 'Spring Onion', 'Elongated head, suitable for fresh consumption and salads. Hungarian product.', 250, 'per package'),
(6, 'corn.jpg', 'Corn', 'Medium-grained, sweet, excellent for cooking. Hungarian product.', 200, 'piece by piece'),
(7, 'pea.jpg', 'Green peas', 'Medium-sized grains, first-ripe and suitable for soups, vegetables, salads. Hungarian product.', 1000, 'in bulk'),
(8, 'kohlrabi.jpg', 'Kohlrabi', 'First-born, white. Hungarian product.', 450, 'piece by piece'),
(9, 'pepper.jpg', 'Pepper', 'Fleshy, medium-sized, suitable for both fresh consumption and cooking. Hungarian product.', 800, 'in bulk'),
(10, 'cauliflower.jpg', 'Cauliflower', 'It has a large rosette, suitable for making soups, vegetables and countless dishes. Hungarian product.', 800, 'per capita');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek_hu`
--

CREATE TABLE `zoldsegek_hu` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_hu`
--

INSERT INTO `zoldsegek_hu` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'Burgonya (Balatoni-rózsa)', 'Közepes liszttartalmú, sütésre és főzésre is alkalmas. Magyar termék.', 1000, 'ömlesztve'),
(2, 'carrot.jpg', 'Sárgarépa (Matador)', 'Síma hengeres, közepes hosszúságú.  Magyar termék.', 400, 'ömlesztve'),
(3, 'sorrel.jpg', 'Kerti Sóska (Pallagi nagylevelű)', 'Erőteljes levelű.  Magyar termék.', 400, 'csomagonként'),
(4, 'spinach.jpg', 'Spenót', 'Közepes nagyságú levelek. Magyar termék.', 500, 'csomagonként'),
(5, 'spring_onion.jpg', 'Újhagyma', 'Hosszúkás fejű, alkalmas friss fogyasztásra és salátákhoz. Magyar termék.', 250, 'csomagonként'),
(6, 'corn.jpg', 'Kukorica (Csemege)', 'Közepes szemű, édes, főzésre kitűnő. Magyar termék.', 200, 'darabonként'),
(7, 'pea.jpg', 'Zöldborsó (Zsuzsi)', 'Közepes nagyságú szemek, zsengék és alkalmas levesekhez, főzelékekhez, salátákhoz. Magyar termék.', 1000, 'ömlesztve'),
(8, 'kohlrabi.jpg', 'Karalábé', 'Zsenge, fehér. Magyar termék.', 450, 'darabonként'),
(9, 'pepper.jpg', 'Paprika (Fehérözön)', 'Húsos, közepes nagyságú, friss fogyasztásra és főzésre egyaránt alkalmas. Magyar termék.', 800, 'ömlesztve'),
(10, 'cauliflower.jpg', 'Karfiol', 'Nagyrózsájú, alkalmas levesek, főzelékek és számtalan étel készítésére. Magyar termék.', 800, 'fejenként');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek_jp`
--

CREATE TABLE `zoldsegek_jp` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_jp`
--

INSERT INTO `zoldsegek_jp` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'じゃがいも', '小麦粉含有量が中程度で、パン作りや調理に適しています。ハンガリー製品。', 1000, '大量に'),
(2, 'carrot.jpg', 'キャロット', '滑らかな円筒形で、長さは中程度。ハンガリー製品。', 400, '大量に'),
(3, 'sorrel.jpg', 'スイバ', 'ガーデンスイバ;葉が丈夫です。 ハンガリー製品。', 400, 'パッケージあたり'),
(4, 'spinach.jpg', 'ほうれん草', '中くらいの大きさの葉。ハンガリー製品。', 500, 'パッケージあたり'),
(5, 'spring_onion.jpg', 'ネギ', '細長い頭部を持ち、生食やサラダに適しています。ハンガリー製品。', 250, 'パッケージあたり'),
(6, 'corn.jpg', 'コーン（デザート）', '中サイズで甘く、料理に最適です。ハンガリー製品。', 200, '一つ一つ'),
(7, 'pea.jpg', 'グリーンピース', '中粒で柔らかく、スープ、野菜、サラダに適しています。ハンガリー製品。', 1000, '大量に'),
(8, 'kohlrabi.jpg', 'コールラビ', '長男、白人。ハンガリー製品。', 450, '一つ一つ'),
(9, 'pepper.jpg', 'パプリカ', '肉質が厚く、中型で、生食にも調理にも適しています。ハンガリー製品。', 800, '大量に'),
(10, 'cauliflower.jpg', 'カリフラワー', '大きなロゼットが付いており、スープ、野菜、数え切れないほどの料理を作るのに適しています。ハンガリー製品。', 800, '頭ごとに');

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
-- A tábla indexei `zoldsegek_en`
--
ALTER TABLE `zoldsegek_en`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `zoldsegek_hu`
--
ALTER TABLE `zoldsegek_hu`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `zoldsegek_jp`
--
ALTER TABLE `zoldsegek_jp`
  ADD PRIMARY KEY (`termekID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `felhasznaloID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_en`
--
ALTER TABLE `zoldsegek_en`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_hu`
--
ALTER TABLE `zoldsegek_hu`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_jp`
--
ALTER TABLE `zoldsegek_jp`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
