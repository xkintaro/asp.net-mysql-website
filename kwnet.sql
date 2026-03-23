-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Mar 2026, 19:11:02
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

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
(154, '331666285', '332'),
(155, '331666285', '334');

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
(332, '331666285', '22.03.2026 20:55', '20260322205511_ee0716da-a007-4fad-adc9-1485ffa4be23.jpg', 'Test', '72', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', '20260322205552_009.mp4', 2),
(333, '331666285', '22.03.2026 21:02', '20260322210021_062.jpg', 'kwnet', '70', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n', '20260322210236_016.mp4', 2),
(334, '331666285', '22.03.2026 21:03', '20260322210328_1901bed540b944779bc24788faeae91e~tplv-jj85edgx6n-image-origin.jpg', 'kintaro', '70', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n', '20260322210350_009.mp4', 5);

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
(72, 'Anime');

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
('192897294', 'admin', '12345678', 'default/user.png', 'Hakkimda bilgisi yok', 'admin', '14.05.2024 16:43'),
('193163620', 'Durden', 'a194b244c', 'default/user.png', '', 'user', '01.05.2024 20:08'),
('216436859', 'konyaaaa', 'konyameramm', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '03.05.2024 16:22'),
('236773720', 'kintarofansz', 'kintarolover', 'default/user.png', 'Mustafa\'ya cok asigim', 'user', '03.05.2024 22:07'),
('281882749', 'bedoonessm', '23041968', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '01.05.2024 19:15'),
('291673643', 'Yigit', '12062003y', 'default/user.png', 'Hakkimda bilgisi yok', 'user', '01.05.2024 23:14'),
('331666285', 'kintaro', '12345678', '20260322210526_001.jpg', 'admin test', 'admin', '01.05.2024 09:53'),
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
(951, '331666285', '332', 'test', '22.03.2026 20:56'),
(952, '331666285', '332', 'comment', '22.03.2026 20:56'),
(953, '331666285', '334', 'Test', '22.03.2026 21:04'),
(954, '331666285', '334', 'xw', '22.03.2026 21:04'),
(955, '331666285', '334', 'qq', '22.03.2026 21:04'),
(956, '331666285', '333', 'testt', '22.03.2026 21:04'),
(957, '331666285', '333', 'wxx', '22.03.2026 21:04');

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
  MODIFY `favoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- Tablo için AUTO_INCREMENT değeri `icerikler`
--
ALTER TABLE `icerikler`
  MODIFY `icerikno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategoriID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=958;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
