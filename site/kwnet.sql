-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 11 Haz 2024, 09:47:40
-- Sunucu sürümü: 10.5.23-MariaDB
-- PHP Sürümü: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kwnet`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favoriler`
--

CREATE TABLE `favoriler` (
  `favoriID` int(11) NOT NULL,
  `favoriyeEkleyenKisiID` varchar(50) NOT NULL,
  `favoriyeEklenenIcerikID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `favoriler`
--

INSERT INTO `favoriler` (`favoriID`, `favoriyeEkleyenKisiID`, `favoriyeEklenenIcerikID`) VALUES
(130, '331666285', '324'),
(132, '331666285', '327'),
(133, '331666285', '329'),
(134, '281882749', '320'),
(135, '281882749', '321'),
(137, '281882749', '328'),
(138, '281882749', '327'),
(139, '281882749', '326'),
(140, '281882749', '325'),
(141, '281882749', '324'),
(142, '281882749', '322'),
(144, '216436859', '321'),
(150, '192897294', '321'),
(152, '331666285', '321'),
(153, '778996757', '321');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `icerikler`
--

CREATE TABLE `icerikler` (
  `icerikno` int(11) NOT NULL,
  `icerigiYayinlayanKisi` varchar(50) NOT NULL,
  `tarih` varchar(50) NOT NULL,
  `icerikkapakResmi` varchar(255) NOT NULL,
  `icerikBaslik` varchar(250) NOT NULL,
  `icerikKategori` varchar(50) NOT NULL,
  `icerikAciklamasi` varchar(2500) NOT NULL,
  `icerikVideoDosyasi` varchar(255) NOT NULL,
  `goruntulenme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `icerikler`
--

INSERT INTO `icerikler` (`icerikno`, `icerigiYayinlayanKisi`, `tarih`, `icerikkapakResmi`, `icerikBaslik`, `icerikKategori`, `icerikAciklamasi`, `icerikVideoDosyasi`, `goruntulenme`) VALUES
(320, '331666285', '01.05.2024 15:41', '20240501155556_matrix-banner.jpg', 'Deneme', '1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', '20240501154257_Rotating_earth_(large).gif', 90),
(321, '331666285', '01.05.2024 15:55', '20240503235746_malefiz.jpg', 'Test', '70', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', '20240501155544_diziler-banner.jpg', 76),
(331, '331666285', '27.05.2024 21:24', '20240527212202_20240527_121207.jpg', '2024', '70', 'Deneme gönderisi', '20240527212401_VID_129660717_201056_523.mp4', 31);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategoriID` int(55) NOT NULL,
  `kategoriAdi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategoriID`, `kategoriAdi`) VALUES
(1, 'Uncategorized'),
(70, 'Test'),
(71, 'Deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `kullaniciID` varchar(11) NOT NULL,
  `kullaniciAdi` varchar(50) NOT NULL,
  `kullaniciSifre` varchar(50) NOT NULL,
  `kullaniciProfilResmi` varchar(255) NOT NULL,
  `kullaniciBiografi` varchar(2500) NOT NULL,
  `kullaniciTur` varchar(50) NOT NULL,
  `tarih` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kullaniciID`, `kullaniciAdi`, `kullaniciSifre`, `kullaniciProfilResmi`, `kullaniciBiografi`, `kullaniciTur`, `tarih`) VALUES
('192897294', 'admin', '12345678', 'default/user.png', 'Hakkimda bilgisi yok ggggggggg', 'user', '14.05.2024 16:43'),
('193163620', 'Durden', 'a194b244c', '20240501201448_kovboygirl.jpg', '', 'user', '01.05.2024 20:08'),
('216436859', 'konyaaaa', 'konyameramm', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '03.05.2024 16:22'),
('236773720', 'kintarofansz', 'kintarolover', 'default/user.png', 'Mustafa\'ya cok asigim', 'user', '03.05.2024 22:07'),
('281882749', 'bedoonessm', '23041968', '20240501193456_A1609EFB-73D3-41CF-8A1B-FF8BF727F65F.jpeg', 'Hakkimda bilgisi yok', 'user', '01.05.2024 19:15'),
('291673643', 'Yigit', '12062003y', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '01.05.2024 23:14'),
('331666285', 'mustafa', 'kmtal123', '20240507091856_1.JPG', 'Mustafa Tasal', 'admin', '01.05.2024 09:53'),
('466186528', 'Ali Turan', '12345678', 'default/user.png', 'Projem 100 puan olcak.', 'user', '03.05.2024 08:14'),
('586515340', 'xvahah', '12345678', 'default/user.png', 'Xacacw', 'user', '24.05.2024 18:12'),
('747072759', 'micsfo', 'micsfo123', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '01.05.2024 20:14'),
('760294683', 'Arthur Leywin', 'ArthurXTessia1718', 'default/user.png', 'The Beginning After The End\'s God.', 'user', '01.05.2024 23:11'),
('778996757', 'liebert', '12345678', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '27.05.2024 16:55'),
('779589691', 'AksEnes', 'AKSENES123', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '17.05.2024 10:46'),
('907791754', 'ddddd', 'dddddddd', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '05.05.2024 14:12'),
('983312504', 'Hahaha', '12345678', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '03.05.2024 10:40');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `id` int(11) NOT NULL,
  `kadi` varchar(50) NOT NULL,
  `eposta` varchar(50) NOT NULL,
  `mesaj` varchar(2000) NOT NULL,
  `tarih` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`id`, `kadi`, `eposta`, `mesaj`, `tarih`) VALUES
(57, 'Hüseyin Sevket ', 'hüseyinsevket42@gmail.com', 'Benim projem yok tesekkürler ', '2024-05-03 08:17:04.195381');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorumID` int(11) NOT NULL,
  `yorumHangiKullaniciyaAitID` varchar(200) NOT NULL,
  `yorumHangiIcerigeAitID` varchar(200) NOT NULL,
  `yorummetni` varchar(2000) NOT NULL,
  `tarih` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorumID`, `yorumHangiKullaniciyaAitID`, `yorumHangiIcerigeAitID`, `yorummetni`, `tarih`) VALUES
(906, '331666285', '322', 'Deneme yorumu', '01.05.2024 16:07'),
(907, '331666285', '328', 'Test', '01.05.2024 16:25'),
(908, '331666285', '320', 'ggfgf', '01.05.2024 16:59'),
(914, '331666285', '320', 'rrqr', '01.05.2024 16:59'),
(925, '331666285', '329', 'Test.', '01.05.2024 17:27'),
(926, '281882749', '329', 'B', '01.05.2024 19:45'),
(927, '331666285', '321', 'deneme', '02.05.2024 14:56'),
(928, '216436859', '320', 'uyuyhggt', '03.05.2024 16:26'),
(929, '216436859', '320', 'uyuyhggt', '03.05.2024 16:26'),
(930, '216436859', '320', 'uyuyhggt', '03.05.2024 16:26'),
(931, '216436859', '320', 'uyuyhggt', '03.05.2024 16:26'),
(932, '331666285', '321', 'G', '05.05.2024 20:49'),
(934, '331666285', '320', '3', '07.05.2024 09:20'),
(936, '193163620', '320', 'ben durden by durden', '19.05.2024 02:59'),
(939, '586515340', '321', 'Yoeum', '24.05.2024 18:14'),
(940, '778996757', '321', 'bu neymis', '27.05.2024 16:57'),
(941, '778996757', '320', 'yorumm', '27.05.2024 16:58'),
(942, '778996757', '320', 'yrayyad', '27.05.2024 16:58'),
(943, '778996757', '320', 'vsvcsx', '27.05.2024 16:58'),
(944, '331666285', '320', 'test', '27.05.2024 16:58'),
(945, '331666285', '320', 'denemee', '27.05.2024 16:58'),
(946, '331666285', '320', 'mstafa', '27.05.2024 16:58'),
(947, '331666285', '331', 'Test yorumu', '27.05.2024 21:25'),
(949, '331666285', '331', 'A', '27.05.2024 21:25');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `favoriler`
--
ALTER TABLE `favoriler`
  ADD PRIMARY KEY (`favoriID`);

--
-- Tablo için indeksler `icerikler`
--
ALTER TABLE `icerikler`
  ADD PRIMARY KEY (`icerikno`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`kullaniciID`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorumID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `favoriler`
--
ALTER TABLE `favoriler`
  MODIFY `favoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- Tablo için AUTO_INCREMENT değeri `icerikler`
--
ALTER TABLE `icerikler`
  MODIFY `icerikno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategoriID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=951;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
