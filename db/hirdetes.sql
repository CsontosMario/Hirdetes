-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 14. 12:17
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
(1, 'Vékony Marcell', 'Makó', 2003, '', 'Szoftverfejlesztő- és tesztelő vagyok', 'A weboldal fejlesztői csapatának tagja vagyok.', 'marcell.jpg', 'iAmSoftwareDevTester'),
(2, 'Csontos Márió Dávid', 'Makó', 2005, '', 'Szoftverfejlesztő- és tesztelő vagyok', 'A weboldal fejlesztői csapatának vezetője vagyok.', 'mario_temporary_picture.jpg', 'kohlrabi');

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
(1, 'Hudák Mária', 0, '', '', 'Fő termelő', 'maria.jpg'),
(2, 'Burkus Gusztáv', 0, '', '', 'Fő termelő', 'gusztav.jpg');

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek_de`
--

CREATE TABLE `zoldsegek_de` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_de`
--

INSERT INTO `zoldsegek_de` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'Kartoffel', 'Mittlerer Mehlanteil, zum Backen und Kochen geeignet. Ungarisches Produkt.', 1000, 'in großen Mengen'),
(2, 'carrot.jpg', 'Karotte', 'Glatt, zylindrisch, mittlere Länge. Ungarisches Produkt.', 400, 'in großen Mengen'),
(3, 'sorrel.jpg', 'Gartensauerampfer', 'Starke Blätter. Ungarisches Produkt.', 400, 'pro Paket'),
(4, 'spinach.jpg', 'Spinat', 'Mittelgroße Blätter. Ungarisches Produkt.', 500, 'pro Paket'),
(5, 'spring_onion.jpg', 'Frühlingszwiebeln', 'Länglicher Kopf, geeignet zum Frischverzehr und für Salate. Ungarisches Produkt.', 250, 'pro Paket'),
(6, 'corn.jpg', 'Mais', 'Mittelkörnig, süß, hervorragend zum Kochen geeignet. Ungarisches Produkt.', 200, 'Stück für Stück'),
(7, 'pea.jpg', 'Grüne Erbsen', 'Mittelgroße Körner, erstreif und geeignet für Suppen, Gemüse, Salate. Ungarisches Produkt.', 1000, 'in großen Mengen'),
(8, 'kohlrabi.jpg', 'Kohlrabi', 'Erstgeborener, weiß. Ungarisches Produkt.', 450, 'Stück für Stück'),
(9, 'pepper.jpg', 'Pfeffer', 'Fleischig, mittelgroß, sowohl zum Frischverzehr als auch zum Kochen geeignet. Ungarisches Produkt.', 800, 'in großen Mengen'),
(10, 'cauliflower.jpg', 'Blumenkohl', 'Es hat eine große Rosette und eignet sich für die Zubereitung von Suppen, Gemüse und unzähligen Gerichten. Ungarisches Produkt.', 800, 'pro Kopf');

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
-- Tábla szerkezet ehhez a táblához `zoldsegek_jpn`
--

CREATE TABLE `zoldsegek_jpn` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_jpn`
--

INSERT INTO `zoldsegek_jpn` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'じゃがいも', '小麦粉含有量が中程度で、パンや料理に適しています。ハンガリー産。', 1000, '大量に'),
(2, 'carrot.jpg', 'ニンジン', '滑らかな円筒形、中程度の長さ。ハンガリー産。', 400, '大量に'),
(3, 'sorrel.jpg', 'ガーデンスイバ', '葉が丈夫。ハンガリー産。', 400, 'パッケージあたり'),
(4, 'spinach.jpg', 'ほうれん草', '中サイズの葉。ハンガリー産。', 500, 'パッケージあたり'),
(5, 'spring_onion.jpg', 'ネギ', '細長い頭部は生食やサラダに適しています。ハンガリー産。', 250, 'パッケージあたり'),
(6, 'corn.jpg', 'トウモロコシ', '中粒で甘く、料理に最適です。ハンガリー産。', 200, '少しずつ'),
(7, 'pea.jpg', 'グリーンピース', '中粒で、初熟しており、スープ、野菜、サラダに適しています。ハンガリー産。', 1000, '大量に'),
(8, 'kohlrabi.jpg', 'コールラビ', '長男、白人。ハンガリー産。', 450, '少しずつ'),
(9, 'pepper.jpg', 'ペッパー', '肉厚で中型、生食にも調理にも適しています。ハンガリー産。', 800, '大量に'),
(10, 'cauliflower.jpg', 'カリフラワー', '大きなロゼットがあり、スープ、野菜、その他さまざまな料理を作るのに適しています。ハンガリー製品。', 800, '一人当たり');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `zoldsegek_svk`
--

CREATE TABLE `zoldsegek_svk` (
  `termekID` int(10) NOT NULL,
  `kep` varchar(50) NOT NULL,
  `megnevezes` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ar` int(10) NOT NULL,
  `kiszereles` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `zoldsegek_svk`
--

INSERT INTO `zoldsegek_svk` (`termekID`, `kep`, `megnevezes`, `leiras`, `ar`, `kiszereles`) VALUES
(1, 'potato.jpg', 'zemiak', 'Stredný obsah múky, vhodné na pečenie a varenie. Maďarský výrobok.', 1000, 'hromadne'),
(2, 'carrot.jpg', 'Mrkva', 'Hladký cylindrický, stredne dlhý. Maďarský výrobok.', 400, 'hromadne'),
(3, 'sorrel.jpg', 'Záhradný šťavel', 'Silné listy. Maďarský výrobok.', 400, 'za balenie'),
(4, 'spinach.jpg', 'Špenát', 'Stredne veľké listy. Maďarský výrobok.', 500, 'za balenie'),
(5, 'spring_onion.jpg', 'Jarná cibuľka', 'Predĺžená hlávka, vhodná na čerstvú konzumáciu a šaláty. Maďarský výrobok.', 250, 'za balenie'),
(6, 'corn.jpg', 'Kukurica', 'Stredne zrnité, sladké, výborné na varenie. Maďarský výrobok.', 200, 'kus po kuse'),
(7, 'pea.jpg', 'Zelený hrášok', 'Stredne veľké zrná, prvé zrelé a vhodné do polievok, zeleniny, šalátov. Maďarský výrobok.', 1000, 'hromadne'),
(8, 'kohlrabi.jpg', 'kaleráb', 'Prvorodený, biely. Maďarský výrobok.', 450, 'kus po kuse'),
(9, 'pepper.jpg', 'Pepper', 'Mäsité, stredne veľké, vhodné na čerstvú konzumáciu aj varenie. Maďarský výrobok.', 800, 'hromadne'),
(10, 'cauliflower.jpg', 'Karfiol', 'Má veľkú rozetu, vhodnú na prípravu polievok, zeleniny a nespočetného množstva jedál. Maďarský výrobok.', 800, 'na obyvateľa');

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
-- A tábla indexei `zoldsegek_de`
--
ALTER TABLE `zoldsegek_de`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `zoldsegek_en`
--
ALTER TABLE `zoldsegek_en`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `zoldsegek_jpn`
--
ALTER TABLE `zoldsegek_jpn`
  ADD PRIMARY KEY (`termekID`);

--
-- A tábla indexei `zoldsegek_svk`
--
ALTER TABLE `zoldsegek_svk`
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

--
-- AUTO_INCREMENT a táblához `zoldsegek_de`
--
ALTER TABLE `zoldsegek_de`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_en`
--
ALTER TABLE `zoldsegek_en`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_jpn`
--
ALTER TABLE `zoldsegek_jpn`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `zoldsegek_svk`
--
ALTER TABLE `zoldsegek_svk`
  MODIFY `termekID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
