-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 06 Okt 2024 pada 11.58
-- Versi server: 8.0.30
-- Versi PHP: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rekomu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1727193839),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1727193839;', 1727193839),
('98fbc42faedc02492397cb5962ea3a3ffc0a9243', 'i:1;', 1726660136),
('98fbc42faedc02492397cb5962ea3a3ffc0a9243:timer', 'i:1726660136;', 1726660136),
('fc074d501302eb2b93e2554793fcaf50b3bf7291', 'i:1;', 1726048896),
('fc074d501302eb2b93e2554793fcaf50b3bf7291:timer', 'i:1726048896;', 1726048896);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`) VALUES
(1, 'Kuliner', 'kuliner'),
(2, 'Kerajinan Tangan', 'kerajinan-tangan'),
(3, 'Fashion', 'fashion');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'UMKM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `real_price` int NOT NULL,
  `average_rating` double DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_view` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `category_id`, `seller_id`, `name`, `slug`, `price`, `real_price`, `average_rating`, `image`, `count_view`) VALUES
(1, 2, 1, 'Tas (17 x 13 cm)', '27-tas-17-x-13-cm', 173250, 165000, NULL, 'item/Tas (17 x 13 cm).jpg', 0),
(2, 2, 1, 'Tas (18 x 12 cm)', '27-tas-18-x-12-cm', 194250, 185000, NULL, 'item/gambar-item-20240729225920.jpg', 0),
(3, 2, 1, 'Tas (13 x 17 cm)', '27-tas-13-x-17-cm', 173250, 165000, NULL, 'item/Tas (13 x 17 cm).jpg', 0),
(4, 2, 1, 'Tas (19 x 13 cm)', '27-tas-19-x-13-cm', 262500, 250000, NULL, 'item/Tas (19 x 13 cm).jpg', 0),
(5, 2, 1, 'Tas (11 x 17 cm)', '27-tas-11-x-17-cm', 131250, 125000, 3.6087, 'item/Tas (11 x 17 cm).jpg', 13),
(6, 2, 1, 'Tas (17 x 13 cm (mix manik))', '27-tas-17-x-13-cm-mix-manik', 178500, 170000, NULL, 'item/Tas (17 x 13 cm (mix manik)).jpg', 0),
(7, 2, 1, 'Tas (13 x 19 cm)', '27-tas-13-x-19-cm', 183750, 175000, NULL, 'item/Tas (13 x 19 cm).jpg', 0),
(8, 2, 1, 'Tas (13 x 12 cm)', '27-tas-13-x-12-cm', 147000, 140000, NULL, 'item/Tas (13 x 12 cm).jpg', 0),
(9, 2, 1, 'Id Card', '27-id-card', 52500, 50000, NULL, 'item/Id Card.jpg', 0),
(10, 2, 1, 'Card Holder', '27-card-holder', 52500, 50000, 3.5, 'item/Card Holder.jpg', 15),
(11, 2, 2, '3row Bead', '3row-bead-4105da', 28350, 27000, NULL, 'item/3row Bead Bracelet.jpg', 2),
(12, 2, 2, '5row Bead Bracelet', '28-5row-bead-bracelet', 26250, 25000, 3, 'item/5row Bead Bracelet.jpg', 7),
(13, 2, 2, 'Kukie Bracelet', '28-kukie-bracelet', 36750, 35000, NULL, 'item/Kukie-Bracelet.jpg', 0),
(14, 2, 2, 'Line Bracelet', '28-line-bracelet', 25200, 24000, NULL, 'item/Line Bracelet.jpg', 0),
(15, 2, 2, 'Paracord Bracelet', '28-paracord-bracelet', 26250, 25000, NULL, 'item/Paracord Bracelet.jpg', 0),
(16, 2, 3, 'Tenun Mekongga', '29-tenun-mekongga', 367500, 350000, NULL, 'item/Tenun Mekongga.jpg', 0),
(17, 2, 3, 'Tenun Tolaki', '29-tenun-tolaki', 157500, 150000, NULL, 'item/Tenun Tolaki.jpg', 0),
(18, 2, 3, 'Tenun Tabere', '29-tenun-tabere', 262500, 250000, NULL, 'item/Tenun Tabere.jpg', 0),
(19, 2, 3, 'Tenun Sangia', '29-tenun-sangia', 525000, 500000, NULL, 'item/Tenun Sangia.jpeg', 0),
(20, 2, 3, 'Tutup Gelas', '29-tutup-gelas', 52500, 50000, NULL, 'item/Tutup Gelas.jpg', 0),
(21, 2, 3, 'Kotak Cendra Mata', '29-kotak-cendra-mata', 52500, 50000, 3.5, 'item/Kotak Cendra Mata.jpg', 12),
(22, 2, 3, 'Songket Kepala', '29-songket-kepala', 52500, 50000, 3.4, 'item/Songket Kepala.jpg', 10),
(23, 2, 3, 'Tas', '29-tas', 52500, 50000, NULL, 'item/Tas.jpg', 0),
(24, 2, 4, 'Cincin Black Series', '30-cincin-black-series', 10500, 10000, NULL, 'item/Cincin Black Series.jpg', 0),
(25, 2, 4, 'Cincin Blue Series', '30-cincin-blue-series', 10500, 10000, NULL, 'item/Cincin Blue Series.jpg', 0),
(26, 2, 4, 'Cincin Sun Flower', '30-cincin-sun-flower', 10500, 10000, NULL, 'item/Cincin Sun Flower.jpg', 1),
(27, 2, 4, 'Cincin Lotsu', '30-cincin-lotsu', 10500, 10000, NULL, 'item/Cincin Lotsu.jpg', 0),
(28, 2, 4, 'Cincin Green Yellow', '30-cincin-green-yellow', 10500, 10000, NULL, 'item/Cincin Green Yellow.jpg', 0),
(29, 2, 4, 'Cincin Love', '30-cincin-love', 10500, 10000, NULL, 'item/Cincin Love.jpg', 0),
(30, 2, 4, 'Cincin Silver', '30-cincin-silver', 10500, 10000, NULL, 'item/Cincin Silver.jpg', 0),
(31, 2, 4, 'Gelang Pink Series', '30-gelang-pink-series', 15750, 15000, NULL, 'item/Gelang Pink Series.jpg', 0),
(32, 2, 4, 'Gelang Tali', '30-gelang-tali', 15750, 15000, NULL, 'item/Gelang Tali.jpg', 0),
(33, 2, 4, 'Gelang Tali Huruf', '30-gelang-tali-huruf', 21000, 20000, NULL, 'item/Gelang Tali Huruf.jpg', 0),
(34, 2, 4, 'Gelang Mutiara Putih', '30-gelang-mutiara-putih', 21000, 20000, 3.7, 'item/Gelang Mutiara Putih.jpg', 10),
(35, 2, 4, 'Gantungan HP', '30-gantungan-hp', 31500, 30000, NULL, 'item/Gantungan HP.jpg', 0),
(36, 2, 5, 'Arumi Ring', '31-arumi-ring', 6300, 6000, NULL, 'item/Arumi ring.jpg', 0),
(37, 2, 5, 'Flower Ring', '31-flower-ring', 6300, 6000, NULL, 'item/Flower Ring.jpg', 0),
(38, 2, 5, 'Nudey Ring', '31-nudey-ring', 6300, 6000, 3.7391, 'item/Nudey Ring.jpg', 13),
(39, 2, 5, 'Starbie Ring', '31-starbie-ring', 6300, 6000, NULL, 'item/Starbie Ring.jpg', 0),
(40, 2, 5, 'Black Series Ring', '31-black-series-ring', 6300, 6000, 3.7, 'item/Black Series Ring.jpg', 13),
(41, 2, 5, 'Sweet Joa Ring', '31-sweet-joa-ring', 10500, 10000, NULL, 'item/Sweet Joa Ring.jpg', 0),
(42, 2, 5, 'Sweet Cleo Ring', '31-sweet-cleo-ring', 10500, 10000, NULL, 'item/Sweet Cleo Ring.jpeg', 0),
(43, 2, 5, 'Couple Bracelet', '31-couple-bracelet', 31500, 30000, NULL, 'item/Couple Bracelet.jpg', 0),
(44, 2, 5, 'Celina Bracelet', '31-celina-bracelet', 16800, 16000, NULL, 'item/Celina Bracelet.jpg', 0),
(45, 2, 5, 'Aeri Bracelet', '31-aeri-bracelet', 17850, 17000, NULL, 'item/Aeri Bracelet.jpg', 0),
(46, 2, 5, 'Ciela Bracelet', '31-ciela-bracelet', 17850, 17000, NULL, 'item/Ciela Bracelet.jpg', 0),
(47, 2, 5, 'Darla Bracelet', '31-darla-bracelet', 17850, 17000, NULL, 'item/Darla Bracelet.jpg', 0),
(48, 2, 5, 'Saski Bracelet', '31-saski-bracelet', 17850, 17000, NULL, 'item/Saski Bracelet.jpg', 0),
(49, 2, 5, 'Oliv Bracelet', '31-oliv-bracelet', 16800, 16000, NULL, 'item/Oliv Bracelet.jpg', 0),
(50, 2, 5, 'Sean Bracelet', '31-sean-bracelet', 16800, 16000, NULL, 'item/Sean Bracelet.jpeg', 0),
(51, 2, 5, 'Phone Hook', '31-phone-hook', 36750, 35000, NULL, 'item/Phone Hook.jpg', 0),
(52, 2, 5, 'Hera Phone Strap', '31-hera-phone-strap', 44100, 42000, NULL, 'item/Hera Phone Strap.jpg', 0),
(53, 2, 5, 'Cassie Phone Strap', '31-cassie-phone-strap', 44100, 42000, NULL, 'item/Cassie Phone Strap.jpg', 0),
(54, 2, 5, 'Lumi Phone Strap', '31-lumi-phone-strap', 44100, 42000, NULL, 'item/Lumi Phone Strap.jpeg', 0),
(55, 2, 5, 'Hazel Phone Strap', '31-hazel-phone-strap', 44100, 42000, NULL, 'item/Hazel Phone Strap.jpg', 0),
(56, 1, 6, 'Kopi Susu', '32-kopi-susu', 15750, 15000, NULL, 'item/Kopi Susu.png', 0),
(57, 1, 6, 'Vietnam Drip', '32-vietnam-drip', 15750, 15000, NULL, 'item/Vietnam Drip.png', 0),
(58, 1, 6, 'Serotonin', '32-serotonin', 18900, 18000, NULL, 'item/Serotonin.png', 0),
(59, 1, 6, 'Monkey Banana', '32-monkey-banana', 18900, 18000, NULL, 'item/Monkey Banana.png', 0),
(60, 1, 6, 'Es Kopi Karamel', '32-es-kopi-karamel', 18900, 18000, NULL, 'item/Es Kopi Karamel.png', 0),
(61, 1, 6, 'Es Kopi Aren', '32-es-kopi-aren', 18900, 18000, 3.25, 'item/Es Kopi Aren.png', 15),
(62, 1, 6, 'Es Kopi Susu', '32-es-kopi-susu', 18900, 18000, NULL, 'item/Es Kopi Susu.jpeg', 0),
(63, 1, 6, 'Green Tea', '32-green-tea', 15750, 15000, 4, 'item/Green Tea.png', 11),
(64, 1, 6, 'Lemon Tea', '32-lemon-tea', 15750, 15000, NULL, 'item/Lemon Tea.png', 0),
(65, 1, 6, 'Es Lotus', '32-es-lotus', 21000, 20000, NULL, 'item/Es Lotus.png', 0),
(66, 1, 6, 'Nasi Ayam Kemangi', '32-nasi-ayam-kemangi', 15750, 15000, NULL, 'item/Nasi Ayam Kemangi.png', 0),
(67, 1, 6, 'Pisang Original', '32-pisang-original', 10500, 10000, 3.5909, 'item/Pisang Original.png', 13),
(68, 1, 6, 'Pisang Keju Susu', '32-pisang-keju-susu', 15750, 15000, NULL, 'item/Pisang Keju Susu.png', 0),
(69, 1, 6, 'Kentang Goreng', '32-kentang-goreng', 21000, 20000, 4.3333, 'item/Kentang Goreng.png', 23),
(70, 1, 7, 'Chicken Katsu', '33-chicken-katsu', 21000, 20000, NULL, 'item/Chicken Katsu.png', 0),
(71, 1, 7, 'Chicken Steak', '33-chicken-steak', 26250, 25000, NULL, 'item/Chicken Steak.png', 0),
(72, 1, 7, 'Beef Burger', '33-beef-burger', 21000, 20000, NULL, 'item/Beef Burger.png', 0),
(73, 1, 7, 'Hotdog Cheese Beef', '33-hotdog-cheese-beef', 21000, 20000, NULL, 'item/Hotdog Cheese Beef.png', 0),
(74, 1, 8, 'Risol Mayo', '34-risol-mayo', 15750, 15000, NULL, 'item/Risol Mayo.png', 0),
(75, 1, 8, 'Banana Roll Matcha', '34-banana-roll-matcha', 10500, 10000, NULL, 'item/Banana Roll Matcha.png', 0),
(76, 1, 8, 'Banana Roll Coklat', '34-banana-roll-coklat', 10500, 10000, NULL, 'item/Banana Roll Coklat.png', 0),
(77, 1, 8, 'Banana Roll Keju', '34-banana-roll-keju', 10500, 10000, NULL, 'item/Banana Roll Keju.png', 0),
(78, 1, 8, 'Banana Roll Mix', '34-banana-roll-mix', 15750, 15000, NULL, 'item/Banana Roll Mix.png', 0),
(79, 1, 8, 'Pisang Coklat', '34-pisang-coklat', 26250, 25000, NULL, 'item/Pisang Coklat.png', 0),
(80, 1, 8, 'Pisang Ori', '34-pisang-ori', 21000, 20000, NULL, 'item/Pisang Ori.png', 0),
(81, 1, 8, 'Ice Greentea Senja', '34-ice-greentea-senja', 10500, 10000, NULL, 'item/Ice Greentea Senja.png', 0),
(82, 1, 8, 'Ice Coklat Senja', '34-ice-coklat-senja', 10500, 10000, NULL, 'item/Ice Coklat Senja.png', 0),
(83, 1, 8, 'Ice Strawberry', '34-ice-strawberry', 10500, 10000, NULL, 'item/Ice Strawberry.jpg', 0),
(84, 1, 8, 'Ice Vanilla Senja', '34-ice-vanilla-senja', 10500, 10000, NULL, 'item/Ice Vanilla Senja.png', 0),
(85, 1, 9, 'Mie Goreng Telur', '35-mie-goreng-telur', 12600, 12000, NULL, 'item/Mie Goreng Telur.png', 0),
(86, 1, 9, 'Mie Goreng Bakso', '35-mie-goreng-bakso', 15750, 15000, NULL, 'item/Mie Goreng Bakso.jpg', 0),
(87, 1, 9, 'Mie Kuah', '35-mie-kuah', 15750, 15000, 4.3684, 'item/Mie Kuah.jpg', 19),
(88, 1, 9, 'Mie Petir', '35-mie-petir', 17850, 17000, NULL, 'item/Mie Petir.png', 0),
(89, 1, 9, 'Mie Nyemek', '35-mie-nyemek', 17850, 17000, NULL, 'item/Mie Nyemek.jpg', 0),
(90, 1, 9, 'Seblak', '35-seblak', 21000, 20000, NULL, 'item/Seblak.png', 0),
(91, 1, 9, 'Bakso Bakar', '35-bakso-bakar', 15750, 15000, NULL, 'item/Bakso Bakar.jpg', 0),
(92, 1, 9, 'Bakso Goreng', '35-bakso-goreng', 15750, 15000, NULL, 'item/Bakso Goreng.jpg', 0),
(93, 1, 9, 'Bakso Kuah', '35-bakso-kuah', 15750, 15000, NULL, 'item/Bakso Kuah.jpg', 0),
(94, 1, 9, 'Nasi Goreng', '35-nasi-goreng', 21000, 20000, NULL, 'item/Nasi Goreng.jpg', 0),
(95, 1, 9, 'Burger', '35-burger', 21000, 20000, 3.619, 'item/Burger.jpg', 19),
(96, 1, 9, 'Ayam Goreng Crispy', '35-ayam-goreng-crispy', 31500, 30000, NULL, 'item/Ayam Goreng Crispy.jpg', 0),
(97, 1, 9, 'Ayam Geprek', '35-ayam-geprek', 31500, 30000, 4.0909, 'item/Ayam Geprek.jpg', 18),
(98, 1, 9, 'Ayam Lalapan', '35-ayam-lalapan', 12600, 12000, NULL, 'item/Ayam Lalapan.jpg', 0),
(99, 1, 9, 'Pisang Goreng Keju', '35-pisang-goreng-keju', 12600, 12000, NULL, 'item/Pisang Goreng Keju.png', 0),
(100, 1, 9, 'Pisang Nugget', '35-pisang-nugget', 17850, 17000, NULL, 'item/Pisang Nugget.jpg', 0),
(101, 1, 9, 'Pisang Epe', '35-pisang-epe', 15750, 15000, NULL, 'item/Pisang Epe.jpg', 0),
(102, 1, 9, 'Roti Bakar', '35-roti-bakar', 12600, 12000, NULL, 'item/Roti Bakar.jpg', 0),
(103, 1, 9, 'Kentang Goreng Barokah', '35-kentang-goreng-barokah', 12600, 12000, NULL, 'item/Kentang Goreng Barokah.jpg', 0),
(104, 1, 9, 'Banana Roll', '35-banana-roll', 10500, 10000, NULL, 'item/Banana Roll.jpeg', 0),
(105, 1, 9, 'Jus Alpukat', '35-jus-alpukat', 10500, 10000, NULL, 'item/Jus Alpukat.jpg', 0),
(106, 1, 9, 'Jus Buah Naga', '35-jus-buah-naga', 10500, 10000, NULL, 'item/Jus Buah Naga.jpg', 0),
(107, 1, 9, 'Jus Apel', '35-jus-apel', 10500, 10000, NULL, 'item/Jus Apel.JPG', 0),
(108, 1, 9, 'Jus Jeruk', '35-jus-jeruk', 10500, 10000, NULL, 'item/Jus Jeruk.jpg', 0),
(109, 1, 9, 'Jus Melon', '35-jus-melon', 10500, 10000, NULL, 'item/Jus Melon.jpg', 0),
(110, 1, 9, 'Ice Milo', '35-ice-milo', 15750, 15000, NULL, 'item/Ice Milo.jpg', 0),
(111, 1, 9, 'Ice Cappuchino', '35-ice-cappuchino', 15750, 15000, NULL, 'item/Ice Cappuchino.png', 0),
(112, 1, 9, 'Ice Vanilla', '35-ice-vanilla', 15750, 15000, NULL, 'item/Ice Vanilla.png', 0),
(113, 1, 9, 'Ice Greentea', '35-ice-greentea', 15750, 15000, NULL, 'item/Ice Greentea.jpg', 1),
(114, 1, 9, 'Ice Coklat', '35-ice-coklat', 15750, 15000, NULL, 'item/Ice Coklat.jpg', 0),
(115, 1, 10, 'Paru Goreng Rica', '36-paru-goreng-rica', 31500, 30000, NULL, 'item/Paru Goreng Rica.jpeg', 0),
(116, 1, 10, 'Baby Cumi', '36-baby-cumi', 26250, 25000, NULL, 'item/Baby Cumi.jpg', 0),
(117, 1, 10, 'Sambel Pete', '36-sambel-pete', 21000, 20000, NULL, 'item/Sambel Pete.jpeg', 0),
(118, 1, 10, 'Ayam Suwir', '36-ayam-suwir', 26250, 25000, NULL, 'item/Ayam Suwir.jpg', 0),
(119, 1, 10, 'Cakalang Suwir', '36-cakalang-suwir', 26250, 25000, NULL, 'item/Cakalang Suwir.jpg', 0),
(120, 1, 10, 'Teri Medan', '36-teri-medan', 21000, 20000, NULL, 'item/Teri Medan.jpg', 0),
(121, 1, 10, 'Sambal Bawang', '36-sambal-bawang', 15750, 15000, NULL, 'item/Sambal Bawang.png', 0),
(122, 1, 11, 'Nasi Bakar Ayam', '37-nasi-bakar-ayam', 15750, 15000, NULL, 'item/Nasi Bakar Ayam.png', 0),
(123, 1, 11, 'Sate Sosis Sapi', '37-sate-sosis-sapi', 5250, 5000, NULL, 'item/Sate Sosis Sapi.png', 0),
(124, 1, 11, 'Sate Odeng', '37-sate-odeng', 5250, 5000, NULL, 'item/Sate Odeng.png', 0),
(125, 1, 11, 'Sate Ayam', '37-sate-ayam', 5250, 5000, 4.375, 'item/Sate Ayam.jpg', 16),
(126, 1, 11, 'Sate Kembang Cumi', '37-sate-kembang-cumi', 5250, 5000, NULL, 'item/Sate Kembang Cumi.png', 0),
(127, 1, 11, 'Sate Bola Salmon', '37-sate-bola-salmon', 5250, 5000, NULL, 'item/Sate Bola Salmon.png', 0),
(128, 1, 11, 'Sate Bola Kepiting', '37-sate-bola-kepiting', 5250, 5000, NULL, 'item/Sate Bola Kepiting.png', 0),
(129, 1, 11, 'Sate Krupuk Pangsit', '37-sate-krupuk-pangsit', 5250, 5000, NULL, 'item/Sate Krupuk Pangsit.png', 0),
(130, 1, 11, 'Sate Bakso Lobster', '37-sate-bakso-lobster', 5250, 5000, NULL, 'item/Sate Bakso Lobster.png', 0),
(131, 1, 11, 'Telur Puyu Bacem', '37-telur-puyu-bacem', 5250, 5000, NULL, 'item/Telur Puyu Bacem.png', 0),
(132, 1, 12, 'Sosis Kentang', '38-sosis-kentang', 21000, 20000, NULL, 'item/Sosis Kentang.jpg', 0),
(133, 1, 12, 'Kentang Goreng Kelapa Dua', '38-kentang-goreng-kelapa-dua', 15750, 15000, NULL, 'item/Kentang Goreng Kelapa Dua.png', 0),
(134, 1, 12, 'Ubi Goreng', '38-ubi-goreng', 15750, 15000, 4.1739, 'item/Ubi Goreng.jpg', 15),
(135, 1, 12, 'Ayam Goreng Gepur', '38-ayam-goreng-gepur', 26250, 25000, NULL, 'item/Ayam Goreng Gepur.jpg', 1),
(136, 1, 12, 'Sub Ubi', '38-sub-ubi', 17850, 17000, NULL, 'item/Sup Ubi.jpg', 0),
(137, 1, 12, 'Mie Goreng Tek Tek', '38-mie-goreng-tek-tek', 21000, 20000, NULL, 'item/Mie Goreng Tek Tek.png', 0),
(138, 1, 12, 'Mie Kuah Tek Tek', '38-mie-kuah-tek-tek', 21000, 20000, NULL, 'item/Mie Kuah Tek Tek.jpg', 0),
(139, 1, 12, 'Milo Cheese Regal', '38-milo-cheese-regal', 18900, 18000, NULL, 'item/Milo Cheese Regal.png', 0),
(140, 1, 12, 'Milo Cheese Kacang', '38-milo-cheese-kacang', 15750, 15000, NULL, 'item/Milo Cheese Kacang.png', 0),
(141, 1, 12, 'Choco Oreo', '38-choco-oreo', 17850, 17000, NULL, 'item/Choco Oreo.jpg', 0),
(142, 1, 12, 'Choco Regal', '38-choco-regal', 17850, 17000, NULL, 'item/Choco Regal.png', 0),
(143, 1, 12, 'Choco Berry', '38-choco-berry', 17850, 17000, NULL, 'item/Choco Berry.png', 0),
(144, 1, 12, 'Green Tea Ice', '38-green-tea-ice', 17850, 17000, NULL, 'item/Greentea Ice.jpg', 0),
(145, 1, 12, 'Thaitea Ice', '38-thaitea-ice', 15750, 15000, NULL, 'item/Thaitea Ice.png', 0),
(146, 1, 12, 'Vanilla Regal', '38-vanilla-regal', 15750, 15000, NULL, 'item/Vanilla Regal.png', 0),
(147, 1, 12, 'Vanilla Shake', '38-vanilla-shake', 17850, 17000, NULL, 'item/Vanilla Shake.jpg', 0),
(148, 1, 12, 'Strawberry Shake', '38-strawberry-shake', 15750, 15000, NULL, 'item/Strawberry Shake.jpg', 0),
(149, 1, 13, 'Keripik Emping', '39-keripik-emping', 15750, 15000, NULL, 'item/Keripik Emping.jpeg', 0),
(150, 1, 13, 'Kacang Sembunyi', '39-kacang-sembunyi', 23100, 22000, NULL, 'item/Kacang Sembunyi.jpeg', 0),
(151, 1, 13, 'Stick Keju', '39-stick-keju', 24150, 23000, NULL, 'item/Stick Keju.jpeg', 0),
(152, 1, 13, 'Mente Sembunyi', '39-mente-sembunyi', 25200, 24000, NULL, 'item/Mente Sembunyi.jpeg', 0),
(153, 1, 13, 'Mente Original', '39-mente-original', 54600, 52000, NULL, 'item/Mente Original.jpeg', 0),
(154, 1, 13, 'Mente Caramel', '39-mente-caramel', 54600, 52000, NULL, 'item/Mente Caramel.jpeg', 0),
(155, 1, 13, 'Mente Bawang', '39-mente-bawang', 54600, 52000, NULL, 'item/Mente Bawang.jpeg', 0),
(156, 1, 13, 'Gula Semut Jahe Sachet', '39-gula-semut-jahe-sachet', 21000, 20000, NULL, 'item/Gula Semut Jahe Sachet.jpeg', 0),
(157, 1, 13, 'Gula Semut Ori', '39-gula-semut-ori', 36750, 35000, NULL, 'item/Gula Semut Ori.jpeg', 0),
(158, 1, 13, 'Mente Kentaki', '39-mente-kentaki', 59850, 57000, NULL, 'item/Mente Kentaki.jpeg', 0),
(159, 1, 13, 'Mente Gula Aren', '39-mente-gula-aren', 59850, 57000, NULL, 'item/Mente Gula Aren.jpeg', 0),
(160, 1, 13, 'Kopi Robusta', '39-kopi-robusta', 17850, 17000, NULL, 'item/Kopi Robusta.jpeg', 0),
(161, 1, 14, 'Dofu Paket Isi 6', '40-dofu-paket-isi-6', 18900, 18000, NULL, 'item/Dofu Paket Isi 6.jpg', 0),
(162, 1, 14, 'Dofu Paket Isi 18', '40-dofu-paket-isi-18', 50400, 48000, NULL, 'item/Dofu Paket Isi 18.jpg', 0),
(163, 1, 14, 'Donut Gula', '40-donut-gula', 26250, 25000, NULL, 'item/Donut Gula.jpg', 0),
(164, 1, 14, 'Donut Abon', '40-donut-abon', 4200, 4000, NULL, 'item/Donut Abon.jpg', 0),
(165, 1, 14, 'Tart Mini', '40-tart-mini', 47250, 45000, NULL, 'item/Tart Mini.jpg', 0),
(166, 1, 14, 'Brownies Toping', '40-brownies-toping', 68250, 65000, NULL, 'item/Brownies Toping.jpg', 0),
(167, 1, 15, 'Bakso Goreng Uo', '41-bakso-goreng-uo', 23100, 22000, NULL, 'item/Bakso Goreng Uo.jpg', 0),
(168, 1, 15, 'Batagor', '41-batagor', 26250, 25000, NULL, 'item/Batagor.jpg', 0),
(169, 1, 15, 'Choco Hazelnut', '41-choco-hazelnut', 21000, 20000, NULL, 'item/Choco Hazelnut.jpg', 0),
(170, 1, 15, 'Es Choco Oreo', '41-es-choco-oreo', 21000, 20000, NULL, 'item/Es Choco Oreo.jpg', 0),
(171, 1, 15, 'Es Kopi Uo', '41-es-kopi-uo', 15750, 15000, 3.9524, 'item/Es Kopi Uo.jpg', 17),
(172, 1, 15, 'Es Susu Aren', '41-es-susu-aren', 15750, 15000, NULL, 'item/Es Susu Aren.jpg', 0),
(173, 1, 15, 'Ice Tea', '41-ice-tea', 15750, 15000, 3.9, 'item/Ice Tea.jpg', 18),
(174, 1, 15, 'Kopi Pandan', '41-kopi-pandan', 24150, 23000, NULL, 'item/Kopi Pandan.jpg', 0),
(175, 1, 15, 'Mie Kering', '41-mie-kering', 21000, 20000, NULL, 'item/Mie Kering.jpg', 0),
(176, 1, 15, 'Mie Pangsit', '41-mie-pangsit', 26250, 25000, NULL, 'item/Mie Pangsit.jpg', 0),
(177, 1, 15, 'Nasi Goreng Uo', '41-nasi-goreng-uo', 27300, 26000, NULL, 'item/Nasi Goreng Uo.jpg', 0),
(178, 1, 15, 'Pancake Keju', '41-pancake-keju', 28350, 27000, NULL, 'item/Pancake Keju.jpg', 0),
(179, 1, 15, 'Pancake UO', '41-pancake-uo', 27300, 26000, NULL, 'item/Pancake UO.jpg', 0),
(180, 1, 15, 'Rice Bool', '41-rice-bool', 28350, 27000, NULL, 'item/Rice Bool.jpg', 0),
(181, 1, 15, 'Risoles Uo', '41-risoles-uo', 26250, 25000, NULL, 'item/Risoles Uo.jpg', 0),
(182, 1, 15, 'Sky Cold', '41-sky-cold', 15750, 15000, NULL, 'item/Sky Cold.jpg', 0),
(183, 1, 15, 'Vanilla Regal Uo', '41-vanilla-regal-uo', 21000, 20000, NULL, 'item/Vanilla Regal Uo.jpg', 0),
(184, 1, 16, 'Kari Ayam', '42-kari-ayam', 21000, 20000, NULL, 'item/Kari Ayam.jpg', 0),
(185, 1, 16, 'Ayam Geprek Ummu', '42-ayam-geprek-ummu', 26250, 25000, NULL, 'item/Ayam Geprek Ummu.jpg', 0),
(186, 1, 16, 'Ayam Ungkep', '42-ayam-ungkep', 68250, 65000, NULL, 'item/Ayam Ungkep.jpg', 1),
(187, 1, 16, 'Ayam Bakar', '42-ayam-bakar', 26250, 25000, NULL, 'item/Ayam Bakar.jpg', 1),
(188, 1, 16, 'Telur Geprek', '42-telur-geprek', 15750, 15000, NULL, 'item/Telur Geprek.jpg', 0),
(189, 1, 16, 'Tempe Geprek', '42-tempe-geprek', 15750, 15000, NULL, 'item/Tempe Geprek.jpg', 0),
(190, 1, 16, 'Pangsit Goreng', '42-pangsit-goreng', 21000, 20000, NULL, 'item/Pangsit Goreng.jpg', 0),
(191, 1, 16, 'Martabak Mie', '42-martabak-mie', 15750, 15000, NULL, 'item/Martabak Mie.jpeg', 0),
(192, 1, 16, 'Nasi Ikan', '42-nasi-ikan', 15750, 15000, NULL, 'item/Nasi Ikan.jpg', 0),
(193, 1, 16, 'Dangkot Ayam', '42-dangkot-ayam', 26250, 25000, NULL, 'item/Dangkot Ayam.jpg', 0),
(194, 1, 17, 'Chicken Pop', '43-chicken-pop', 26250, 25000, NULL, 'item/Chicken Pop.jpg', 0),
(195, 1, 17, 'Choco Nutty', '43-choco-nutty', 21000, 20000, NULL, 'item/Choco Nutty.jpg', 0),
(196, 1, 17, 'Fresh Lemon Tea', '43-fresh-lemon-tea', 21000, 20000, NULL, 'item/Fresh Lemon Tea.jpg', 0),
(197, 1, 17, 'Hot Kopi Aren', '43-hot-kopi-aren', 18900, 18000, NULL, 'item/Hot Kopi Aren.jpg', 0),
(198, 1, 17, 'Ice Matcha', '43-ice-matcha', 21000, 20000, NULL, 'item/Ice Matcha.jpg', 0),
(199, 1, 17, 'Kopi Susu My', '43-kopi-susu-my', 18900, 18000, NULL, 'item/Kopi Susu My.jpg', 0),
(200, 1, 17, 'Lime Juice', '43-lime-juice', 23100, 22000, 3.0455, 'item/Lime Juice.jpg', 11),
(201, 1, 17, 'Mie Kuah My', '43-mie-kuah-my', 21000, 20000, NULL, 'item/Mie Kuah My.jpg', 0),
(202, 1, 17, 'Milk Tea', '43-milk-tea', 18900, 18000, NULL, 'item/Milk Tea.jpg', 0),
(203, 1, 17, 'Nasi Goreng My', '43-nasi-goreng-my', 28350, 27000, NULL, 'item/Nasi Goreng My.jpg', 0),
(204, 1, 17, 'Nasi Telur Dadar', '43-nasi-telur-dadar', 24150, 23000, NULL, 'item/Nasi Telur Dadar.jpg', 0),
(205, 1, 17, 'Rice Bool Rica Rica', '43-rice-bool-rica-rica', 29400, 28000, NULL, 'item/Rice Bool Rica Rica.jpg', 0),
(206, 1, 18, 'Afogatto', '44-afogatto', 21000, 20000, NULL, 'item/Afogatto.jpg', 2),
(207, 1, 18, 'Blueberry Ice', '44-blueberry-ice', 21000, 20000, NULL, 'item/Blueberry Ice.jpg', 0),
(208, 1, 18, 'Cappuchino Hot', '44-cappuchino-hot', 21000, 20000, NULL, 'item/Cappuchino Hot.jpg', 0),
(209, 1, 18, 'Greentea Ice Story', '44-greentea-ice-story', 15750, 15000, NULL, 'item/Greentea Ice Story.jpg', 0),
(210, 1, 18, 'Ice Americano', '44-ice-americano', 21000, 20000, NULL, 'item/Ice Americano.jpg', 0),
(211, 1, 18, 'Ice Brown Sugar', '44-ice-brown-sugar', 15750, 15000, NULL, 'item/Ice Brown Sugar.jpg', 0),
(212, 1, 18, 'Ice Coffee', '44-ice-coffee', 15750, 15000, NULL, 'item/Ice Coffee.jpg', 0),
(213, 1, 18, 'Ice Milo Story', '44-ice-milo-story', 15750, 15000, NULL, 'item/Ice Milo Story.jpg', 0),
(214, 1, 18, 'Jasuke', '44-jasuke', 15750, 15000, NULL, 'item/Jasuke.jpg', 0),
(215, 1, 18, 'Kopi Aren Story', '44-kopi-aren-story', 15750, 15000, NULL, 'item/Kopi Aren Story.jpg', 0),
(216, 1, 18, 'Kopi Susu Story', '44-kopi-susu-story', 15750, 15000, NULL, 'item/Kopi Susu Story.jpg', 0),
(217, 1, 18, 'Lime Tea', '44-lime-tea', 15750, 15000, NULL, 'item/Lime Tea.jpg', 0),
(218, 1, 18, 'Mie Tik Tik', '44-mie-tik-tik', 26250, 25000, NULL, 'item/Mie Tik Tik.jpg', 0),
(219, 1, 18, 'Nasi Ayam Story', '44-nasi-ayam-story', 26250, 25000, NULL, 'item/Nasi Ayam Story.jpg', 0),
(220, 1, 18, 'Nasi Goreng Kampung Story', '44-nasi-goreng-kampung-story', 21000, 20000, NULL, 'item/Nasi Goreng Kampung Story.jpg', 0),
(221, 1, 18, 'Nasi Rendang', '44-nasi-rendang', 31500, 30000, NULL, 'item/Nasi Rendang.jpg', 0),
(222, 1, 18, 'Sop Iga', '44-sop-iga', 36750, 35000, NULL, 'item/Sop Iga.jpg', 0),
(223, 1, 18, 'Soto Lamongan', '44-soto-lamongan', 26250, 25000, NULL, 'item/Soto Lamongan.jpg', 0),
(224, 1, 18, 'Tahu Mercon', '44-tahu-mercon', 26250, 25000, NULL, 'item/Tahu Mercon.jpg', 0),
(225, 1, 18, 'V60', '44-v60', 21000, 20000, NULL, 'item/V60.jpg', 0),
(226, 1, 18, 'Nasi Lalapan', '44-nasi-lalapan', 26250, 25000, NULL, 'item/Nasi Lalapan.jpg', 0),
(227, 1, 19, 'Nasi Ayam Geprek', '45-nasi-ayam-geprek', 21000, 20000, NULL, 'item/Nasi Ayam Geprek.jpg', 0),
(228, 1, 19, 'Nasi Ayam Rica Rica', '45-nasi-ayam-rica-rica', 31500, 30000, NULL, 'item/Nasi Ayam Rica Rica.jpg', 0),
(229, 1, 19, 'Ikan Bakar Rica Rica', '45-ikan-bakar-rica-rica', 42000, 40000, NULL, 'item/Ikan Bakar Rica Rica.jpg', 0),
(230, 1, 19, 'Ikan Bakar Parape', '45-ikan-bakar-parape', 31500, 30000, NULL, 'item/Ikan Bakar Parape.jpg', 0),
(231, 1, 19, 'Ikan Bakar Bolu', '45-ikan-bakar-bolu', 36750, 35000, NULL, 'item/Ikan Bakar Bolu.jpg', 0),
(232, 1, 19, 'Cumi Parape', '45-cumi-parape', 42000, 40000, NULL, 'item/Cumi Parape.jpg', 1),
(233, 1, 19, 'Kangkung Tumis', '45-kangkung-tumis', 42000, 40000, NULL, 'item/Kangkung Tumis.jpg', 0),
(234, 1, 19, 'Kepiting Hambur', '45-kepiting-hambur', 42000, 40000, NULL, 'item/Kepiting Hambur.jpg', 0),
(235, 1, 19, 'Udang Bakar', '45-udang-bakar', 15750, 15000, NULL, 'item/Udang Bakar.jpg', 0),
(236, 3, 20, 'Blouse Cerrutty Premium', '46-blouse-cerrutty-premium', 136500, 130000, NULL, 'item/Blouse Cerrutty Premium.jpg', 0),
(237, 3, 20, 'Switer Katun Oversize', '46-switer-katun-oversize', 157500, 150000, NULL, 'item/Switer Katun Oversize.jpg', 0),
(238, 3, 20, 'Hoodie Soat Roge', '46-hoodie-soat-roge', 157500, 150000, NULL, 'item/Hoodie Soat Roge.jpg', 0),
(239, 3, 20, 'Kemeja Salur Katun', '46-kemeja-salur-katun', 115500, 110000, NULL, 'item/Kemeja Salur Katun.jpg', 0),
(240, 3, 20, 'Rajut Oversize', '46-rajut-oversize', 136500, 130000, NULL, 'item/Rajut Oversize.jpg', 0),
(241, 3, 20, 'Kemeja Curdoroy Oversize', '46-kemeja-curdoroy-oversize', 157500, 150000, NULL, 'item/Kemeja Curdoroy Oversize.jpg', 0),
(242, 3, 20, 'Blouse Flower', '46-blouse-flower', 141750, 135000, NULL, 'item/Blouse Flower.jpg', 0),
(243, 3, 20, 'Rok Bludru Plisket', '46-rok-bludru-plisket', 84000, 80000, NULL, 'item/Rok Bludru Plisket.jpg', 0),
(244, 3, 20, 'Kaftan Navy Payet', '46-kaftan-navy-payet', 262500, 250000, NULL, 'item/Kaftan Navy Payet.jpg', 0),
(245, 3, 20, 'Gamis Sage', '46-gamis-sage', 294000, 280000, NULL, 'item/Gamis Sage.jpg', 0),
(246, 3, 20, 'Abaya Black Plisket', '46-abaya-black-plisket', 367500, 350000, 4.1429, 'item/Abaya Black Plisket.jpg', 18),
(247, 3, 20, 'Gamis Plisket Cerrutty', '46-gamis-plisket-cerrutty', 294000, 280000, NULL, 'item/Gamis Plisket Cerrutty.jpg', 0),
(248, 3, 20, 'Blouse Payet Premium', '46-blouse-payet-premium', 178500, 170000, NULL, 'item/Blouse Payet Premium.jpg', 0),
(249, 3, 20, 'Rok Jeans Span', '46-rok-jeans-span', 141750, 135000, 3.7895, 'item/Rok Jeans Span.jpg', 12),
(250, 3, 20, 'Rajut Crop', '46-rajut-crop', 126000, 120000, NULL, 'item/Rajut Crop.jpg', 0),
(251, 3, 20, 'Kemeja Polos Linen', '46-kemeja-polos-linen', 115500, 110000, NULL, 'item/Kemeja Polos Linen.jpg', 0),
(252, 3, 20, 'Rajut Salur', '46-rajut-salur', 136500, 130000, NULL, 'item/Rajut Salur.jpg', 0),
(253, 3, 20, 'Kemeja Crinkle', '46-kemeja-crinkle', 126000, 120000, 3.95, 'item/Kemeja Crinkle.jpg', 11),
(254, 3, 20, 'Outer Rajut', '46-outer-rajut', 157500, 150000, 3.8, 'item/Outer Rajut.jpg', 14),
(255, 3, 20, 'Kemeja Motif', '46-kemeja-motif', 131250, 125000, 3.85, 'item/Kemeja Motif.jpg', 13),
(256, 3, 20, 'Outer Crop', '46-outer-crop', 157500, 150000, 3.5789, 'item/Outer Crop.jpg', 11),
(257, 3, 20, 'Rajut Knit', '46-rajut-knit', 173250, 165000, NULL, 'item/Rajut Knit.jpg', 0),
(258, 3, 20, 'Outer Rajut Premium', '46-outer-rajut-premium', 126000, 120000, NULL, 'item/Outer Rajut Premium.jpg', 0),
(259, 3, 20, 'Outer Knit Plisket', '46-outer-knit-plisket', 78750, 75000, NULL, 'item/Outer Knit Plisket.jpg', 0),
(260, 3, 20, 'Blouse Payet', '46-blouse-payet', 141750, 135000, NULL, 'item/Blouse Payet.jpg', 0),
(261, 3, 20, 'Blouse Shimmer', '46-blouse-shimmer', 157500, 150000, NULL, 'item/Blouse Shimmer.jpg', 0),
(262, 3, 20, 'Blouse Flower Premium', '46-blouse-flower-premium', 183750, 175000, NULL, 'item/Blouse Flower Premium.jpg', 0),
(263, 3, 21, 'Ayy Blouse', '47-ayy-blouse', 126000, 120000, 3.7619, 'item/Ayy Blouse.jpg', 12),
(264, 3, 21, 'Ayy Kaftan', '47-ayy-kaftan', 262500, 250000, NULL, 'item/Ayy Kaftan.jpg', 0),
(265, 3, 21, 'Blezer Mini', '47-blezer-mini', 157500, 150000, NULL, 'item/Blezer Mini.jpg', 0),
(266, 3, 21, 'Blouse Import Allsize', '47-blouse-import-allsize', 115500, 110000, NULL, 'item/Blouse Import Allsize.jpg', 0),
(267, 3, 21, 'Tunik Rajut BKK', '47-tunik-rajut-bkk', 189000, 180000, 2.9, 'item/Tunik Rajut BKK.jpg', 21),
(268, 3, 21, 'Blouse Levis Import', '47-blouse-levis-import', 147000, 140000, NULL, 'item/Blouse Levis Import.jpg', 0),
(269, 3, 21, 'Crop Top Sweater', '47-crop-top-sweater', 157500, 150000, NULL, 'item/Crop Top Sweater.jpg', 0),
(270, 3, 21, 'Gamis Motif', '47-gamis-motif', 220500, 210000, NULL, 'item/Gamis Motif.jpg', 0),
(271, 3, 21, 'Hoodie Elephant', '47-hoodie-elephant', 189000, 180000, NULL, 'item/Hoodie Elephant.jpg', 0),
(272, 3, 21, 'Hoodie Polos', '47-hoodie-polos', 168000, 160000, NULL, 'item/Hoodie Polos.jpg', 0),
(273, 3, 21, 'Jeans Import L', '47-jeans-import-l', 231000, 220000, 3.6667, 'item/Jeans Import L.jpg', 12),
(274, 3, 21, 'Kaftan Motif', '47-kaftan-motif', 294000, 280000, NULL, 'item/Kaftan Motif.jpg', 0),
(275, 3, 21, 'Kaos Oversize', '47-kaos-oversize', 199500, 190000, NULL, 'item/Kaos Oversize.jpg', 0),
(276, 3, 21, 'Kemeja Polos', '47-kemeja-polos', 147000, 140000, NULL, 'item/Kemeja Polos.jpg', 0),
(277, 3, 21, 'Linean', '47-linean', 157500, 150000, NULL, 'item/Linean.jpg', 0),
(278, 3, 22, 'Azara Dress', '48-azara-dress', 262500, 250000, NULL, 'item/Azara Dress.jpeg', 0),
(279, 3, 22, 'Blouse Organza', '48-blouse-organza', 204750, 195000, 3.6, 'item/Blouse Organza.jpg', 10),
(280, 3, 22, 'Cardigan Strip Import', '48-cardigan-strip-import', 189000, 180000, NULL, 'item/Cardigan Strip Import.jpg', 0),
(281, 3, 22, 'Kaftan', '48-kaftan', 178500, 170000, NULL, 'item/Kaftan.jpg', 0),
(282, 3, 22, 'Kamyla Mukenah', '48-kamyla-mukenah', 199500, 190000, NULL, 'item/Kamyla Mukenah.jpeg', 0),
(283, 3, 22, 'Kemeja Polos Nevada', '48-kemeja-polos-nevada', 189000, 180000, NULL, 'item/Kemeja Polos Nevada.jpg', 0),
(284, 3, 22, 'Oneset Crickle', '48-oneset-crickle', 210000, 200000, NULL, 'item/Oneset Crickle.jpg', 0),
(285, 3, 22, 'Oneset Flower', '48-oneset-flower', 204750, 195000, NULL, 'item/Oneset Flower.jpg', 0),
(286, 3, 22, 'Pastel Kaftan', '48-pastel-kaftan', 189000, 180000, 3.3182, 'item/Pastel Kaftan.jpeg', 12),
(287, 3, 22, 'Sweater G', '48-sweater-g', 178500, 170000, NULL, 'item/Sweater G.jpg', 0),
(288, 3, 23, 'Bkk Shirt', '49-bkk-shirt', 231000, 220000, NULL, 'item/Bkk Shirt.jpg', 0),
(289, 3, 23, 'Blouse Brukat', '49-blouse-brukat', 199500, 190000, NULL, 'item/Blouse Brukat.jpg', 0),
(290, 3, 23, 'Blouse Serut', '49-blouse-serut', 189000, 180000, NULL, 'item/Blouse Serut.jpg', 0),
(291, 3, 23, 'Denim Blouse', '49-denim-blouse', 189000, 180000, NULL, 'item/Denim Blouse.jpg', 0),
(292, 3, 23, 'Lisa Shilk Set', '49-lisa-shilk-set', 241500, 230000, NULL, 'item/Lisa Shilk Set.jpg', 0),
(293, 3, 23, 'Midea Blouse', '49-midea-blouse', 199500, 190000, NULL, 'item/Midea Blouse.jpg', 0),
(294, 3, 23, 'Nana Set Hijab', '49-nana-set-hijab', 367500, 350000, NULL, 'item/Nana Set Hijab.jpg', 0),
(295, 3, 23, 'Vest Import Bkk', '49-vest-import-bkk', 199500, 190000, NULL, 'item/Vest Import Bkk.jpg', 0),
(296, 3, 23, 'White Blouse', '49-white-blouse', 199500, 190000, NULL, 'item/White Blouse.jpg', 0),
(297, 3, 23, 'Butter Dress', '49-butter-dress', 294000, 280000, NULL, 'item/Butter Dress.jpg', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_30_001947_create_sliders_table', 1),
(5, '2024_08_30_004402_create_categories_table', 1),
(6, '2024_08_30_004426_create_sellers_table', 1),
(7, '2024_08_30_004643_create_items_table', 1),
(8, '2024_08_30_194126_create_carts_table', 1),
(9, '2024_08_31_075058_create_transactions_table', 1),
(10, '2024_09_03_184907_create_groups_table', 1),
(11, '2024_09_24_182458_add_address_to_users_table', 2),
(12, '2024_09_24_233502_create_settings_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `slug`, `location`, `address`) VALUES
(1, 2, 'manikku', NULL, 'BTN Naral Land Blok A3'),
(2, 3, 'bracelet-kolaka', NULL, 'Jl. Kasuari No. 6'),
(3, 4, 'rumah-tenun', NULL, 'Sabilambo'),
(4, 5, 'hello-gumpy', NULL, 'Lalombaa'),
(5, 6, 'bracelet-by-naral', NULL, 'Jl. Pemuda'),
(6, 7, 'toko-kopi-pakde', NULL, 'Jl. Dr. Sutomo No. 29'),
(7, 8, 'mamina-booth', NULL, 'Bundaran Tugu Pacul'),
(8, 9, 'kedai-senja', NULL, 'Jl Puutobo'),
(9, 10, 'kedai-barokah', NULL, 'Wiskul'),
(10, 11, 'kedai-yustia', NULL, 'Jl Kali Baru'),
(11, 12, 'angkringan-mante', NULL, 'Pelataran Rumah Adat'),
(12, 13, 'cafe-kelapa-dua', NULL, 'Jl Pemuda'),
(13, 14, 'edd-cemilan', NULL, 'BTN Tahoa'),
(14, 15, 'dofu-donuts', NULL, 'Jl Pemuda'),
(15, 16, 'uo-kopi', NULL, 'Jl Bypass'),
(16, 17, 'ummu-haura-kitchen', NULL, 'Jl Pasar Raya'),
(17, 18, 'my-coffee-cafe', NULL, 'Jl Bypass Pomalaa'),
(18, 19, 'coffe-story', NULL, 'Jl Garuda No.15'),
(19, 20, 'rm-asap', NULL, 'Jl. Samratulangi'),
(20, 21, 'hijab-store', NULL, 'Jl Ekonomi No. 57'),
(21, 22, 'ayy-shop', NULL, 'Jl Pramuka No 27'),
(22, 23, 'barira-butik', NULL, 'Jl. Kharil Anwar No. 25'),
(23, 24, 'bahira-store', NULL, 'Jl. Poros Pomalaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VhK7tRV6Yv4bZVemsazsHtpFCtvxJRKKZhvhBNhW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejVBMk56dUJJcFhSbjZRVzNSVUlZWGdlYjYyVnBVUmdUSVBLOU1mVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9yZWtvbXUudGVzdC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728130124);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `name`, `description`, `value`) VALUES
(1, 'Kenaikan Harga Produk', NULL, '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`) VALUES
(1, 'Sistem Rekomendasi Produk UMKM (rekomU)', 'slider/slider1.png'),
(2, 'Dinas Koperasi dan UKM Kabupaten Kolaka', 'slider/slider2.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_time` datetime NOT NULL,
  `quantity` int NOT NULL,
  `rating` int DEFAULT NULL,
  `rating_time` datetime DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `item_id`, `user_id`, `seller_id`, `code`, `transaction_time`, `quantity`, `rating`, `rating_time`, `review`, `shipping_address`, `recipient_contact`) VALUES
(1, 125, 35, 11, 'trx-202409114915', '2024-09-11 17:08:05', 1, 4, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(2, 134, 35, 12, 'trx-202409112713', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(3, 97, 35, 9, 'trx-202409115677', '2024-09-11 17:08:05', 3, 4, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(4, 95, 35, 9, 'trx-202409115169', '2024-09-11 17:08:05', 1, 3, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(5, 67, 35, 6, 'trx-202409119589', '2024-09-11 17:08:05', 1, 3, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(6, 63, 35, 6, 'trx-202409117400', '2024-09-11 17:08:05', 1, 4, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(7, 61, 35, 6, 'trx-202409116994', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(8, 171, 35, 15, 'trx-202409119530', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(9, 200, 35, 17, 'trx-202409117319', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(10, 173, 35, 15, 'trx-202409111936', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(11, 10, 35, 1, 'trx-202409110175', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(12, 21, 35, 3, 'trx-202409119646', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(13, 38, 35, 5, 'trx-202409111239', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(14, 34, 35, 4, 'trx-202409110811', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(15, 40, 35, 5, 'trx-202409116876', '2024-09-11 17:08:05', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(16, 5, 35, 1, 'trx-202409113877', '2024-09-11 17:08:06', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(17, 22, 35, 3, 'trx-202409111466', '2024-09-11 17:08:06', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(18, 254, 35, 20, 'trx-202409118651', '2024-09-11 17:08:06', 3, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(19, 246, 35, 20, 'trx-202409117873', '2024-09-11 17:08:06', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(20, 279, 35, 22, 'trx-202409114325', '2024-09-11 17:08:06', 1, 4, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(21, 286, 35, 22, 'trx-202409119267', '2024-09-11 17:08:06', 1, 2, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(22, 273, 35, 21, 'trx-202409119530', '2024-09-11 17:08:06', 1, 4, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(23, 263, 35, 21, 'trx-202409115889', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(24, 267, 35, 21, 'trx-202409118385', '2024-09-11 17:08:07', 1, 3, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(25, 249, 35, 20, 'trx-202409117426', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(26, 253, 35, 20, 'trx-202409115839', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(27, 87, 35, 9, 'trx-202409117873', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(28, 256, 35, 20, 'trx-202409115292', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(29, 255, 35, 20, 'trx-202409117396', '2024-09-11 17:08:07', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(30, 69, 35, 6, 'trx-202409119836', '2024-09-11 17:08:08', 1, 5, NULL, NULL, 'Jln. Pemuda No. 352 Kolaka', '6281342619887'),
(31, 95, 25, 9, 'trx-202409117250', '2024-09-11 17:23:15', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(32, 67, 25, 6, 'trx-202409119876', '2024-09-11 17:23:15', 2, 3, NULL, NULL, 'Kolaka', '6282291752103'),
(33, 63, 25, 6, 'trx-202409119895', '2024-09-11 17:23:16', 3, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(34, 61, 25, 6, 'trx-202409113607', '2024-09-11 17:23:16', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(35, 171, 25, 15, 'trx-202409118273', '2024-09-11 17:23:16', 2, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(36, 200, 25, 17, 'trx-202409111594', '2024-09-11 17:23:16', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(37, 173, 25, 15, 'trx-202409116900', '2024-09-11 17:23:17', 2, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(38, 10, 25, 1, 'trx-202409118458', '2024-09-11 17:23:17', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(39, 21, 25, 3, 'trx-202409114406', '2024-09-11 17:23:17', 3, 3, NULL, NULL, 'Kolaka', '6282291752103'),
(40, 38, 25, 5, 'trx-202409119089', '2024-09-11 17:23:17', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(41, 34, 25, 4, 'trx-202409116883', '2024-09-11 17:23:17', 4, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(42, 40, 25, 5, 'trx-202409112916', '2024-09-11 17:23:18', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(43, 5, 25, 1, 'trx-202409117794', '2024-09-11 17:23:19', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(44, 22, 25, 3, 'trx-202409119996', '2024-09-11 17:23:19', 2, 3, NULL, NULL, 'Kolaka', '6282291752103'),
(45, 254, 25, 20, 'trx-202409116998', '2024-09-11 17:23:19', 3, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(46, 246, 25, 20, 'trx-202409118264', '2024-09-11 17:23:19', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(47, 279, 25, 22, 'trx-202409117266', '2024-09-11 17:23:19', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(48, 286, 25, 22, 'trx-202409119768', '2024-09-11 17:23:21', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(49, 273, 25, 21, 'trx-202409110699', '2024-09-11 17:23:22', 3, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(50, 263, 25, 21, 'trx-202409114986', '2024-09-11 17:23:22', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(51, 267, 25, 21, 'trx-202409111992', '2024-09-11 17:23:23', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(52, 249, 25, 20, 'trx-202409112378', '2024-09-11 17:23:23', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(53, 253, 25, 20, 'trx-202409110152', '2024-09-11 17:23:23', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(54, 87, 25, 9, 'trx-202409114871', '2024-09-11 17:23:23', 1, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(55, 256, 25, 20, 'trx-202409115520', '2024-09-11 17:23:23', 3, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(56, 255, 25, 20, 'trx-202409119701', '2024-09-11 17:23:23', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(57, 69, 25, 6, 'trx-202409110465', '2024-09-11 17:23:23', 3, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(58, 125, 25, 11, 'trx-202409114284', '2024-09-11 17:23:23', 1, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(59, 134, 25, 12, 'trx-202409119505', '2024-09-11 17:23:24', 2, 5, NULL, NULL, 'Kolaka', '6282291752103'),
(60, 97, 25, 9, 'trx-202409117345', '2024-09-11 17:23:24', 2, 4, NULL, NULL, 'Kolaka', '6282291752103'),
(61, 125, 26, 11, 'trx-202409119221', '2024-09-11 17:50:39', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(62, 134, 26, 12, 'trx-202409110153', '2024-09-11 17:50:39', 2, 5, NULL, NULL, 'Kolaka', '6285343548321'),
(63, 95, 26, 9, 'trx-202409115329', '2024-09-11 17:50:39', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(64, 97, 26, 9, 'trx-202409119225', '2024-09-11 17:50:39', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(65, 67, 26, 6, 'trx-202409113072', '2024-09-11 17:50:39', 1, 5, NULL, NULL, 'Kolaka', '6285343548321'),
(66, 63, 26, 6, 'trx-202409118314', '2024-09-11 17:50:39', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(67, 61, 26, 6, 'trx-202409117603', '2024-09-11 17:50:39', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(68, 171, 26, 15, 'trx-202409114693', '2024-09-11 17:50:39', 1, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(69, 200, 26, 17, 'trx-202409115386', '2024-09-11 17:50:39', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(70, 10, 26, 1, 'trx-202409114106', '2024-09-11 17:50:39', 2, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(71, 21, 26, 3, 'trx-202409116033', '2024-09-11 17:50:39', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(72, 38, 26, 5, 'trx-202409117629', '2024-09-11 17:50:39', 3, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(73, 34, 26, 4, 'trx-202409113360', '2024-09-11 17:50:39', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(74, 40, 26, 5, 'trx-202409114205', '2024-09-11 17:50:39', 2, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(75, 5, 26, 1, 'trx-202409111372', '2024-09-11 17:50:39', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(76, 22, 26, 3, 'trx-202409117885', '2024-09-11 17:50:39', 1, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(77, 254, 26, 20, 'trx-202409119010', '2024-09-11 17:50:40', 1, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(78, 246, 26, 20, 'trx-202409112057', '2024-09-11 17:50:40', 2, 5, NULL, NULL, 'Kolaka', '6285343548321'),
(79, 279, 26, 22, 'trx-202409115483', '2024-09-11 17:50:40', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(80, 286, 26, 22, 'trx-202409114887', '2024-09-11 17:50:41', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(81, 273, 26, 21, 'trx-202409113763', '2024-09-11 17:50:41', 1, 1, NULL, NULL, 'Kolaka', '6285343548321'),
(82, 263, 26, 21, 'trx-202409112915', '2024-09-11 17:50:41', 2, 1, NULL, NULL, 'Kolaka', '6285343548321'),
(83, 267, 26, 21, 'trx-202409117501', '2024-09-11 17:50:42', 1, 2, NULL, NULL, 'Kolaka', '6285343548321'),
(84, 249, 26, 20, 'trx-202409117613', '2024-09-11 17:50:42', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(85, 253, 26, 20, 'trx-202409112500', '2024-09-11 17:50:42', 2, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(86, 87, 26, 9, 'trx-202409110292', '2024-09-11 17:50:42', 2, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(87, 256, 26, 20, 'trx-202409111333', '2024-09-11 17:50:42', 1, 1, NULL, NULL, 'Kolaka', '6285343548321'),
(88, 255, 26, 20, 'trx-202409114145', '2024-09-11 17:50:43', 1, 2, NULL, NULL, 'Kolaka', '6285343548321'),
(89, 69, 26, 6, 'trx-202409115969', '2024-09-11 17:50:43', 1, 3, NULL, NULL, 'Kolaka', '6285343548321'),
(90, 173, 26, 15, 'trx-202409115371', '2024-09-11 17:50:43', 1, 4, NULL, NULL, 'Kolaka', '6285343548321'),
(91, 125, 36, 11, 'trx-202409113566', '2024-09-11 17:59:52', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(92, 134, 36, 12, 'trx-202409115037', '2024-09-11 17:59:52', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(93, 97, 36, 9, 'trx-202409110824', '2024-09-11 17:59:53', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(94, 95, 36, 9, 'trx-202409111668', '2024-09-11 17:59:53', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(95, 67, 36, 6, 'trx-202409119287', '2024-09-11 17:59:53', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(96, 63, 36, 6, 'trx-202409118827', '2024-09-11 17:59:53', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(97, 61, 36, 6, 'trx-202409110562', '2024-09-11 17:59:53', 1, 2, NULL, NULL, 'Kolaka', '62885333374602'),
(98, 171, 36, 15, 'trx-202409118154', '2024-09-11 17:59:54', 1, 2, NULL, NULL, 'Kolaka', '62885333374602'),
(99, 200, 36, 17, 'trx-202409110032', '2024-09-11 17:59:54', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(100, 173, 36, 15, 'trx-202409115713', '2024-09-11 17:59:54', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(101, 10, 36, 1, 'trx-202409115533', '2024-09-11 17:59:54', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(102, 21, 36, 3, 'trx-202409113748', '2024-09-11 17:59:54', 2, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(103, 38, 36, 5, 'trx-202409118671', '2024-09-11 17:59:54', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(104, 34, 36, 4, 'trx-202409111093', '2024-09-11 17:59:54', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(105, 40, 36, 5, 'trx-202409118653', '2024-09-11 17:59:54', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(106, 5, 36, 1, 'trx-202409117480', '2024-09-11 17:59:54', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(107, 22, 36, 3, 'trx-202409116904', '2024-09-11 17:59:54', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(108, 254, 36, 20, 'trx-202409112648', '2024-09-11 17:59:54', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(109, 246, 36, 20, 'trx-202409111675', '2024-09-11 17:59:55', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(110, 279, 36, 22, 'trx-202409119637', '2024-09-11 17:59:55', 1, 2, NULL, NULL, 'Kolaka', '62885333374602'),
(111, 286, 36, 22, 'trx-202409113080', '2024-09-11 17:59:55', 1, 2, NULL, NULL, 'Kolaka', '62885333374602'),
(112, 273, 36, 21, 'trx-202409112372', '2024-09-11 17:59:55', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(113, 263, 36, 21, 'trx-202409117959', '2024-09-11 17:59:55', 1, 4, NULL, NULL, 'Kolaka', '62885333374602'),
(114, 267, 36, 21, 'trx-202409117948', '2024-09-11 17:59:55', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(115, 249, 36, 20, 'trx-202409110681', '2024-09-11 17:59:55', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(116, 253, 36, 20, 'trx-202409115968', '2024-09-11 17:59:55', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(117, 87, 36, 9, 'trx-202409119901', '2024-09-11 17:59:55', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(118, 256, 36, 20, 'trx-202409114572', '2024-09-11 17:59:55', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(119, 255, 36, 20, 'trx-202409116984', '2024-09-11 17:59:55', 1, 3, NULL, NULL, 'Kolaka', '62885333374602'),
(120, 69, 36, 6, 'trx-202409118628', '2024-09-11 17:59:55', 1, 5, NULL, NULL, 'Kolaka', '62885333374602'),
(121, 125, 37, 11, 'trx-202409111644', '2024-09-11 18:26:50', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(122, 134, 37, 12, 'trx-202409110285', '2024-09-11 18:26:50', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(123, 97, 37, 9, 'trx-202409115695', '2024-09-11 18:26:50', 2, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(124, 95, 37, 9, 'trx-202409110908', '2024-09-11 18:26:50', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(125, 67, 37, 6, 'trx-202409113232', '2024-09-11 18:26:50', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(126, 63, 37, 6, 'trx-202409117651', '2024-09-11 18:33:10', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(127, 61, 37, 6, 'trx-202409114791', '2024-09-11 18:33:10', 1, 3, NULL, NULL, 'Kolaka', '6282144343147'),
(128, 171, 37, 15, 'trx-202409110337', '2024-09-11 18:33:10', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(129, 200, 37, 17, 'trx-202409119768', '2024-09-11 18:33:10', 1, 3, NULL, NULL, 'Kolaka', '6282144343147'),
(130, 173, 37, 15, 'trx-202409113795', '2024-09-11 18:33:10', 1, 3, NULL, NULL, 'Kolaka', '6282144343147'),
(131, 10, 37, 1, 'trx-202409118428', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(132, 21, 37, 3, 'trx-202409119351', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(133, 38, 37, 5, 'trx-202409111838', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(134, 34, 37, 4, 'trx-202409119791', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(135, 40, 37, 5, 'trx-202409114069', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(136, 5, 37, 1, 'trx-202409113609', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(137, 22, 37, 3, 'trx-202409117321', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(138, 254, 37, 20, 'trx-202409111339', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(139, 246, 37, 20, 'trx-202409119299', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(140, 279, 37, 22, 'trx-202409113494', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(141, 286, 37, 22, 'trx-202409112402', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(142, 273, 37, 21, 'trx-202409115268', '2024-09-11 18:33:11', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(143, 263, 37, 21, 'trx-202409111424', '2024-09-11 18:33:11', 2, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(144, 267, 37, 21, 'trx-202409112400', '2024-09-11 18:33:11', 1, 3, NULL, NULL, 'Kolaka', '6282144343147'),
(145, 249, 37, 20, 'trx-202409118787', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(146, 253, 37, 20, 'trx-202409115978', '2024-09-11 18:33:11', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(147, 87, 37, 9, 'trx-202409115354', '2024-09-11 18:33:12', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(148, 256, 37, 20, 'trx-202409111332', '2024-09-11 18:33:12', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(149, 255, 37, 20, 'trx-202409111925', '2024-09-11 18:33:12', 1, 4, NULL, NULL, 'Kolaka', '6282144343147'),
(150, 69, 37, 6, 'trx-202409115305', '2024-09-11 18:33:12', 1, 5, NULL, NULL, 'Kolaka', '6282144343147'),
(151, 125, 28, 11, 'trx-202409117621', '2024-09-11 18:33:49', 2, 5, NULL, NULL, 'Kolaka', '6282230147096'),
(152, 134, 28, 12, 'trx-202409118713', '2024-09-11 18:33:50', 1, 4, NULL, NULL, 'Kolaka', '6282230147096'),
(153, 97, 28, 9, 'trx-202409111182', '2024-09-11 18:33:50', 1, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(154, 95, 28, 9, 'trx-202409117512', '2024-09-11 18:33:50', 2, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(155, 67, 28, 6, 'trx-202409119008', '2024-09-11 18:33:50', 1, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(156, 63, 28, 6, 'trx-202409118578', '2024-09-11 18:33:50', 1, 4, NULL, NULL, 'Kolaka', '6282230147096'),
(157, 61, 28, 6, 'trx-202409112078', '2024-09-11 18:33:50', 1, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(158, 171, 28, 15, 'trx-202409114811', '2024-09-11 18:33:50', 2, 4, NULL, NULL, 'Kolaka', '6282230147096'),
(159, 200, 28, 17, 'trx-202409117102', '2024-09-11 18:33:50', 1, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(160, 173, 28, 15, 'trx-202409118909', '2024-09-11 18:33:50', 2, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(161, 10, 28, 1, 'trx-202409117059', '2024-09-11 18:33:50', 2, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(162, 21, 28, 3, 'trx-202409115948', '2024-09-11 18:33:50', 2, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(163, 38, 28, 5, 'trx-202409112866', '2024-09-11 18:33:51', 1, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(164, 34, 28, 4, 'trx-202409112497', '2024-09-11 18:33:51', 2, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(165, 40, 28, 5, 'trx-202409113036', '2024-09-11 18:33:51', 2, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(166, 5, 28, 1, 'trx-202409119207', '2024-09-11 18:33:51', 2, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(167, 22, 28, 3, 'trx-202409114435', '2024-09-11 18:33:51', 1, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(168, 254, 28, 20, 'trx-202409118201', '2024-09-11 18:33:51', 3, 4, NULL, NULL, 'Kolaka', '6282230147096'),
(169, 246, 28, 20, 'trx-202409117198', '2024-09-11 18:33:51', 1, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(170, 279, 28, 22, 'trx-202409117945', '2024-09-11 18:33:51', 2, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(171, 286, 28, 22, 'trx-202409111856', '2024-09-11 18:33:51', 2, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(172, 273, 28, 21, 'trx-202409112875', '2024-09-11 18:33:51', 1, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(173, 263, 28, 21, 'trx-202409113138', '2024-09-11 18:33:51', 1, 4, NULL, NULL, 'Kolaka', '6282230147096'),
(174, 267, 28, 21, 'trx-202409111737', '2024-09-11 18:33:51', 2, 1, NULL, NULL, 'Kolaka', '6282230147096'),
(175, 249, 28, 20, 'trx-202409114967', '2024-09-11 18:33:52', 1, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(176, 253, 28, 20, 'trx-202409112867', '2024-09-11 18:33:52', 1, 3, NULL, NULL, 'Kolaka', '6282230147096'),
(177, 87, 28, 9, 'trx-202409110424', '2024-09-11 18:33:52', 1, 5, NULL, NULL, 'Kolaka', '6282230147096'),
(178, 256, 28, 20, 'trx-202409118221', '2024-09-11 18:33:52', 2, 2, NULL, NULL, 'Kolaka', '6282230147096'),
(179, 255, 28, 20, 'trx-202409113532', '2024-09-11 18:33:52', 1, 5, NULL, NULL, 'Kolaka', '6282230147096'),
(180, 69, 28, 6, 'trx-202409115768', '2024-09-11 18:33:52', 1, 5, NULL, NULL, 'Kolaka', '6282230147096'),
(181, 125, 38, 11, 'trx-202409112777', '2024-09-11 18:47:07', 2, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(182, 134, 38, 12, 'trx-202409115273', '2024-09-11 18:47:08', 2, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(183, 97, 38, 9, 'trx-202409111998', '2024-09-11 18:47:08', 1, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(184, 95, 38, 9, 'trx-202409115090', '2024-09-11 18:47:08', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(185, 67, 38, 6, 'trx-202409113040', '2024-09-11 18:47:08', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(186, 63, 38, 6, 'trx-202409114500', '2024-09-11 18:47:08', 1, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(187, 61, 38, 6, 'trx-202409119029', '2024-09-11 18:47:08', 1, 2, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(188, 171, 38, 15, 'trx-202409112217', '2024-09-11 18:47:08', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(189, 200, 38, 17, 'trx-202409111790', '2024-09-11 18:47:08', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(190, 173, 38, 15, 'trx-202409114098', '2024-09-11 18:47:09', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(191, 10, 38, 1, 'trx-202409117908', '2024-09-11 18:47:09', 2, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(192, 21, 38, 3, 'trx-202409119791', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(193, 38, 38, 5, 'trx-202409113192', '2024-09-11 18:47:09', 1, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(194, 34, 38, 4, 'trx-202409115057', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(195, 40, 38, 5, 'trx-202409118177', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(196, 5, 38, 1, 'trx-202409114990', '2024-09-11 18:47:09', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(197, 22, 38, 3, 'trx-202409111405', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(198, 254, 38, 20, 'trx-202409111708', '2024-09-11 18:47:09', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(199, 246, 38, 20, 'trx-202409112731', '2024-09-11 18:47:09', 2, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(200, 279, 38, 22, 'trx-202409116670', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(201, 286, 38, 22, 'trx-202409119953', '2024-09-11 18:47:09', 1, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(202, 273, 38, 21, 'trx-202409111318', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(203, 263, 38, 21, 'trx-202409111656', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(204, 267, 38, 21, 'trx-202409114708', '2024-09-11 18:47:09', 1, 4, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(205, 249, 38, 20, 'trx-202409112579', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(206, 253, 38, 20, 'trx-202409118360', '2024-09-11 18:47:09', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(207, 87, 38, 9, 'trx-202409117755', '2024-09-11 18:47:09', 1, 3, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(208, 255, 38, 20, 'trx-202409119335', '2024-09-11 18:47:10', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(209, 69, 38, 6, 'trx-202409113812', '2024-09-11 18:47:10', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(210, 256, 38, 20, 'trx-202409119498', '2024-09-11 18:47:10', 1, 5, NULL, NULL, 'Lorong Solata\n', '6285281872413'),
(211, 125, 27, 11, 'trx-202409113001', '2024-09-11 19:36:52', 2, 5, NULL, NULL, 'Kolaka', '6282348775342'),
(212, 134, 27, 12, 'trx-202409112282', '2024-09-11 19:36:52', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(213, 97, 27, 9, 'trx-202409115048', '2024-09-11 19:36:53', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(214, 95, 27, 9, 'trx-202409118246', '2024-09-11 19:36:53', 1, 5, NULL, NULL, 'Kolaka', '6282348775342'),
(215, 67, 27, 6, 'trx-202409115358', '2024-09-11 19:36:53', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(216, 63, 27, 6, 'trx-202409116107', '2024-09-11 19:36:53', 2, 5, NULL, NULL, 'Kolaka', '6282348775342'),
(217, 61, 27, 6, 'trx-202409115802', '2024-09-11 19:36:53', 1, 1, NULL, NULL, 'Kolaka', '6282348775342'),
(218, 171, 27, 15, 'trx-202409110309', '2024-09-11 19:36:53', 1, 1, NULL, NULL, 'Kolaka', '6282348775342'),
(219, 200, 27, 17, 'trx-202409118380', '2024-09-11 19:36:53', 2, 1, NULL, NULL, 'Kolaka', '6282348775342'),
(220, 173, 27, 15, 'trx-202409113686', '2024-09-11 19:36:53', 1, 1, NULL, NULL, 'Kolaka', '6282348775342'),
(221, 10, 27, 1, 'trx-202409119398', '2024-09-11 19:36:53', 1, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(222, 21, 27, 3, 'trx-202409110556', '2024-09-11 19:36:54', 2, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(223, 38, 27, 5, 'trx-202409118586', '2024-09-11 19:36:54', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(224, 34, 27, 4, 'trx-202409112891', '2024-09-11 19:36:54', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(225, 40, 27, 5, 'trx-202409114629', '2024-09-11 19:36:54', 2, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(226, 5, 27, 1, 'trx-202409116261', '2024-09-11 19:36:54', 2, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(227, 22, 27, 3, 'trx-202409115437', '2024-09-11 19:36:54', 1, 1, NULL, NULL, 'Kolaka', '6282348775342'),
(228, 254, 27, 20, 'trx-202409116078', '2024-09-11 19:36:54', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(229, 246, 27, 20, 'trx-202409110374', '2024-09-11 19:36:54', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(230, 279, 27, 22, 'trx-202409113329', '2024-09-11 19:36:54', 2, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(231, 286, 27, 22, 'trx-202409118578', '2024-09-11 19:36:54', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(232, 273, 27, 21, 'trx-202409119557', '2024-09-11 19:36:54', 1, 3, NULL, NULL, 'Kolaka', '6282348775342'),
(233, 263, 27, 21, 'trx-202409112767', '2024-09-11 19:36:54', 1, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(234, 267, 27, 21, 'trx-202409115631', '2024-09-11 19:36:54', 1, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(235, 249, 27, 20, 'trx-202409114199', '2024-09-11 19:36:54', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(236, 253, 27, 20, 'trx-202409115529', '2024-09-11 19:36:54', 1, 5, NULL, NULL, 'Kolaka', '6282348775342'),
(237, 87, 27, 9, 'trx-202409116385', '2024-09-11 19:36:54', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(238, 256, 27, 20, 'trx-202409111405', '2024-09-11 19:36:54', 1, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(239, 255, 27, 20, 'trx-202409115746', '2024-09-11 19:36:54', 1, 2, NULL, NULL, 'Kolaka', '6282348775342'),
(240, 69, 27, 6, 'trx-202409117357', '2024-09-11 19:36:54', 1, 4, NULL, NULL, 'Kolaka', '6282348775342'),
(241, 125, 39, 11, 'trx-202409118983', '2024-09-11 19:38:09', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(242, 134, 39, 12, 'trx-202409112105', '2024-09-11 19:38:10', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(243, 97, 39, 9, 'trx-202409119026', '2024-09-11 19:38:10', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(244, 95, 39, 9, 'trx-202409112690', '2024-09-11 19:38:10', 2, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(245, 67, 39, 6, 'trx-202409119992', '2024-09-11 19:38:10', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(246, 63, 39, 6, 'trx-202409118703', '2024-09-11 19:38:10', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(247, 61, 39, 6, 'trx-202409115670', '2024-09-11 19:38:10', 1, 3, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(248, 171, 39, 15, 'trx-202409113821', '2024-09-11 19:38:10', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(249, 200, 39, 17, 'trx-202409114049', '2024-09-11 19:38:11', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(250, 173, 39, 15, 'trx-202409114127', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(251, 10, 39, 1, 'trx-202409113525', '2024-09-11 19:38:11', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(252, 21, 39, 3, 'trx-202409110837', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(253, 38, 39, 5, 'trx-202409114876', '2024-09-11 19:38:11', 1, 2, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(254, 34, 39, 4, 'trx-202409112976', '2024-09-11 19:38:11', 1, 3, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(255, 40, 39, 5, 'trx-202409115171', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(256, 5, 39, 1, 'trx-202409112155', '2024-09-11 19:38:11', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(257, 22, 39, 3, 'trx-202409119446', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(258, 254, 39, 20, 'trx-202409113827', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(259, 246, 39, 20, 'trx-202409115403', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(260, 279, 39, 22, 'trx-202409114432', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(261, 286, 39, 22, 'trx-202409116189', '2024-09-11 19:38:11', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(262, 273, 39, 21, 'trx-202409115921', '2024-09-11 19:38:11', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(263, 263, 39, 21, 'trx-202409116324', '2024-09-11 19:38:11', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(264, 267, 39, 21, 'trx-202409116363', '2024-09-11 19:38:11', 1, 3, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(265, 249, 39, 20, 'trx-202409110373', '2024-09-11 19:38:12', 1, 3, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(266, 253, 39, 20, 'trx-202409110374', '2024-09-11 19:38:12', 1, 3, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(267, 87, 39, 9, 'trx-202409117971', '2024-09-11 19:38:12', 1, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(268, 256, 39, 20, 'trx-202409112020', '2024-09-11 19:38:12', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(269, 255, 39, 20, 'trx-202409114803', '2024-09-11 19:38:12', 1, 5, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(270, 69, 39, 6, 'trx-202409114751', '2024-09-11 19:38:12', 2, 4, NULL, NULL, 'Jalan Badewi\n', '6285211883676'),
(271, 125, 40, 11, 'trx-202409116240', '2024-09-11 19:49:24', 2, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(272, 134, 40, 12, 'trx-202409117638', '2024-09-11 19:49:25', 1, 2, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(273, 97, 40, 9, 'trx-202409110808', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(274, 95, 40, 9, 'trx-202409113772', '2024-09-11 19:49:26', 1, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(275, 67, 40, 6, 'trx-202409116331', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(276, 63, 40, 6, 'trx-202409114863', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(277, 61, 40, 6, 'trx-202409113870', '2024-09-11 19:49:26', 1, 2, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(278, 171, 40, 15, 'trx-202409118716', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(279, 200, 40, 17, 'trx-202409116161', '2024-09-11 19:49:26', 1, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(280, 173, 40, 15, 'trx-202409114662', '2024-09-11 19:49:26', 2, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(281, 10, 40, 1, 'trx-202409112065', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(282, 21, 40, 3, 'trx-202409116788', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(283, 38, 40, 5, 'trx-202409118182', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(284, 34, 40, 4, 'trx-202409116952', '2024-09-11 19:49:26', 1, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(285, 40, 40, 5, 'trx-202409117146', '2024-09-11 19:49:26', 1, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(286, 5, 40, 1, 'trx-202409112357', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(287, 22, 40, 3, 'trx-202409116174', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(288, 254, 40, 20, 'trx-202409115893', '2024-09-11 19:49:26', 1, 4, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(289, 246, 40, 20, 'trx-202409110087', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(290, 279, 40, 22, 'trx-202409116711', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(291, 286, 40, 22, 'trx-202409111300', '2024-09-11 19:49:26', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(292, 273, 40, 21, 'trx-202409112055', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(293, 263, 40, 21, 'trx-202409117639', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(294, 267, 40, 21, 'trx-202409119785', '2024-09-11 19:49:27', 1, 3, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(295, 249, 40, 20, 'trx-202409116723', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(296, 253, 40, 20, 'trx-202409110205', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(297, 87, 40, 9, 'trx-202409115017', '2024-09-11 19:49:27', 2, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(298, 256, 40, 20, 'trx-202409117323', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(299, 255, 40, 20, 'trx-202409110230', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(300, 69, 40, 6, 'trx-202409111636', '2024-09-11 19:49:27', 1, 5, NULL, NULL, 'Perumnas Lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara', '6282155750479'),
(301, 125, 41, 11, 'trx-202409112767', '2024-09-11 20:03:37', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(302, 134, 41, 12, 'trx-202409116285', '2024-09-11 20:03:37', 1, 5, NULL, NULL, 'Pomalaa', '6282255601752'),
(303, 97, 41, 9, 'trx-202409119133', '2024-09-11 20:03:37', 1, 2, NULL, NULL, 'Pomalaa', '6282255601752'),
(304, 95, 41, 9, 'trx-202409117346', '2024-09-11 20:03:38', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(305, 67, 41, 6, 'trx-202409115568', '2024-09-11 20:03:38', 1, 5, NULL, NULL, 'Pomalaa', '6282255601752'),
(306, 63, 41, 6, 'trx-202409117184', '2024-09-11 20:03:38', 1, 2, NULL, NULL, 'Pomalaa', '6282255601752'),
(307, 61, 41, 6, 'trx-202409118296', '2024-09-11 20:03:38', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(308, 171, 41, 15, 'trx-202409118539', '2024-09-11 20:03:38', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(309, 200, 41, 17, 'trx-202409115770', '2024-09-11 20:03:38', 2, 2, NULL, NULL, 'Pomalaa', '6282255601752'),
(310, 173, 41, 15, 'trx-202409116694', '2024-09-11 20:03:38', 1, 2, NULL, NULL, 'Pomalaa', '6282255601752'),
(311, 10, 41, 1, 'trx-202409110443', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(312, 21, 41, 3, 'trx-202409119458', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(313, 38, 41, 5, 'trx-202409112690', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(314, 34, 41, 4, 'trx-202409114234', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(315, 40, 41, 5, 'trx-202409112771', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(316, 5, 41, 1, 'trx-202409114831', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(317, 22, 41, 3, 'trx-202409115718', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(318, 254, 41, 20, 'trx-202409113891', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(319, 246, 41, 20, 'trx-202409112918', '2024-09-11 20:03:38', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(320, 279, 41, 22, 'trx-202409118557', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(321, 286, 41, 22, 'trx-202409119558', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(322, 273, 41, 21, 'trx-202409116043', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(323, 263, 41, 21, 'trx-202409110278', '2024-09-11 20:03:38', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(324, 267, 41, 21, 'trx-202409117227', '2024-09-11 20:03:38', 1, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(325, 249, 41, 20, 'trx-202409112378', '2024-09-11 20:03:38', 1, 2, NULL, NULL, 'Pomalaa', '6282255601752'),
(326, 253, 41, 20, 'trx-202409116810', '2024-09-11 20:03:38', 2, 3, NULL, NULL, 'Pomalaa', '6282255601752'),
(327, 87, 41, 9, 'trx-202409113112', '2024-09-11 20:03:39', 2, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(328, 256, 41, 20, 'trx-202409113531', '2024-09-11 20:03:39', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(329, 255, 41, 20, 'trx-202409116848', '2024-09-11 20:03:39', 1, 1, NULL, NULL, 'Pomalaa', '6282255601752'),
(330, 69, 41, 6, 'trx-202409113429', '2024-09-11 20:03:39', 1, 4, NULL, NULL, 'Pomalaa', '6282255601752'),
(331, 125, 29, 11, 'trx-202409118382', '2024-09-11 20:04:21', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(332, 134, 29, 12, 'trx-202409113584', '2024-09-11 20:04:22', 1, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(333, 97, 29, 9, 'trx-202409116049', '2024-09-11 20:04:22', 2, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(334, 95, 29, 9, 'trx-202409118464', '2024-09-11 20:04:23', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(335, 67, 29, 6, 'trx-202409110465', '2024-09-11 20:04:23', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(336, 63, 29, 6, 'trx-202409110412', '2024-09-11 20:04:23', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(337, 61, 29, 6, 'trx-202409117552', '2024-09-11 20:04:23', 2, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(338, 171, 29, 15, 'trx-202409110003', '2024-09-11 20:04:23', 2, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(339, 200, 29, 17, 'trx-202409111505', '2024-09-11 20:04:23', 2, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(340, 173, 29, 15, 'trx-202409110593', '2024-09-11 20:04:23', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(341, 10, 29, 1, 'trx-202409117721', '2024-09-11 20:04:24', 2, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(342, 21, 29, 3, 'trx-202409118420', '2024-09-11 20:04:24', 2, 2, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(343, 38, 29, 5, 'trx-202409116682', '2024-09-11 20:04:24', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(344, 34, 29, 4, 'trx-202409116170', '2024-09-11 20:04:24', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(345, 40, 29, 5, 'trx-202409113632', '2024-09-11 20:04:24', 3, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(346, 5, 29, 1, 'trx-202409112346', '2024-09-11 20:04:24', 1, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(347, 22, 29, 3, 'trx-202409118454', '2024-09-11 20:04:24', 1, 2, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(348, 246, 29, 20, 'trx-202409115271', '2024-09-11 20:04:24', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(349, 254, 29, 20, 'trx-202409118594', '2024-09-11 20:04:24', 2, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(350, 279, 29, 22, 'trx-202409110289', '2024-09-11 20:04:24', 1, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(351, 286, 29, 22, 'trx-202409117644', '2024-09-11 20:04:24', 2, 2, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(352, 273, 29, 21, 'trx-202409112250', '2024-09-11 20:04:24', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(353, 263, 29, 21, 'trx-202409111482', '2024-09-11 20:04:25', 2, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(354, 267, 29, 21, 'trx-202409117961', '2024-09-11 20:04:25', 1, 3, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(355, 249, 29, 20, 'trx-202409113889', '2024-09-11 20:04:25', 1, 4, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(356, 253, 29, 20, 'trx-202409117770', '2024-09-11 20:04:25', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(357, 87, 29, 9, 'trx-202409112705', '2024-09-11 20:04:25', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(358, 256, 29, 20, 'trx-202409115901', '2024-09-11 20:04:26', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(359, 255, 29, 20, 'trx-202409112855', '2024-09-11 20:04:27', 1, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(360, 69, 29, 6, 'trx-202409119405', '2024-09-11 20:04:27', 2, 5, NULL, NULL, 'Btn Tahoa, Kolaka', '6281341638380'),
(361, 125, 42, 11, 'trx-202409118889', '2024-09-11 20:24:00', 1, 3, NULL, NULL, 'Jl. Badewi\n', '6282175321886'),
(362, 134, 42, 12, 'trx-202409115535', '2024-09-11 20:24:01', 1, 3, NULL, NULL, 'Jl. Badewi\n', '6282175321886'),
(363, 97, 42, 9, 'trx-202409118464', '2024-09-11 20:24:02', 1, 4, NULL, NULL, 'Jl. Badewi\n', '6282175321886'),
(364, 95, 42, 9, 'trx-202409115958', '2024-09-11 20:24:02', 1, 1, NULL, NULL, 'Jl. Badewi\n', '6282175321886'),
(365, 67, 42, 6, 'trx-202409117129', '2024-09-11 20:28:35', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(366, 63, 42, 6, 'trx-202409113501', '2024-09-11 20:28:35', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(367, 61, 42, 6, 'trx-202409115681', '2024-09-11 20:28:35', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(368, 171, 42, 15, 'trx-202409114342', '2024-09-11 20:28:35', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(369, 200, 42, 17, 'trx-202409112437', '2024-09-11 20:28:35', 1, 3, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(370, 173, 42, 15, 'trx-202409119620', '2024-09-11 20:28:35', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(371, 10, 42, 1, 'trx-202409112228', '2024-09-11 20:28:36', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(372, 21, 42, 3, 'trx-202409118898', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(373, 38, 42, 5, 'trx-202409115796', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(374, 34, 42, 4, 'trx-202409118330', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(375, 40, 42, 5, 'trx-202409113258', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(376, 5, 42, 1, 'trx-202409115346', '2024-09-11 20:28:36', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(377, 22, 42, 3, 'trx-202409116701', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(378, 254, 42, 20, 'trx-202409113492', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(379, 246, 42, 20, 'trx-202409112598', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(380, 279, 42, 22, 'trx-202409110679', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(381, 286, 42, 22, 'trx-202409112559', '2024-09-11 20:28:36', 1, 3, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(382, 273, 42, 21, 'trx-202409114659', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(383, 263, 42, 21, 'trx-202409118104', '2024-09-11 20:28:36', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(384, 267, 42, 21, 'trx-202409110145', '2024-09-11 20:28:36', 1, 3, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(385, 249, 42, 20, 'trx-202409112759', '2024-09-11 20:28:36', 1, 4, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(386, 253, 42, 20, 'trx-202409111314', '2024-09-11 20:28:36', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(387, 87, 42, 9, 'trx-202409112693', '2024-09-11 20:28:36', 1, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(388, 256, 42, 20, 'trx-202409114480', '2024-09-11 20:28:36', 1, 3, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(389, 255, 42, 20, 'trx-202409116766', '2024-09-11 20:28:36', 1, 3, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(390, 69, 42, 6, 'trx-202409113962', '2024-09-11 20:28:37', 3, 5, NULL, NULL, 'Jl. Badewi', '6282175321886'),
(512, 134, 43, 12, 'trx-202409184918', '2024-09-18 17:48:26', 1, 5, NULL, NULL, 'Kolaka', '6282233504423'),
(513, 95, 43, 9, 'trx-202409184076', '2024-09-18 17:48:26', 1, 2, NULL, NULL, 'Kolaka', '6282233504423'),
(514, 67, 43, 6, 'trx-202409181255', '2024-09-18 17:48:26', 2, 4, NULL, NULL, 'Kolaka', '6282233504423'),
(515, 63, 43, 6, 'trx-202409186717', '2024-09-18 17:48:26', 1, 5, NULL, NULL, 'Kolaka', '6282233504423'),
(516, 61, 43, 6, 'trx-202409183664', '2024-09-18 17:48:26', 1, 3, NULL, NULL, 'Kolaka', '6282233504423'),
(517, 200, 43, 17, 'trx-202409189904', '2024-09-18 17:48:26', 1, 2, NULL, NULL, 'Kolaka', '6282233504423'),
(518, 10, 43, 1, 'trx-202409186882', '2024-09-18 17:48:26', 1, 4, NULL, NULL, 'Kolaka', '6282233504423'),
(519, 21, 43, 3, 'trx-202409187345', '2024-09-18 17:48:26', 1, 5, NULL, NULL, 'Kolaka', '6282233504423'),
(520, 38, 43, 5, 'trx-202409182014', '2024-09-18 17:48:26', 1, 3, NULL, NULL, 'Kolaka', '6282233504423'),
(527, 125, 44, 11, 'trx-202409181538', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(528, 10, 44, 1, 'trx-202409182160', '2024-09-18 18:52:20', 1, 4, NULL, NULL, 'Kolaka', '6285234578897'),
(530, 21, 44, 3, 'trx-202409187006', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(532, 38, 44, 5, 'trx-202409182143', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(533, 34, 44, 4, 'trx-202409180861', '2024-09-18 18:52:20', 1, 4, NULL, NULL, 'Kolaka', '6285234578897'),
(534, 40, 44, 5, 'trx-202409186233', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(535, 95, 44, 9, 'trx-202409188768', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(536, 5, 44, 1, 'trx-202409184118', '2024-09-18 18:52:20', 1, 3, NULL, NULL, 'Kolaka', '6285234578897'),
(539, 254, 44, 20, 'trx-202409180175', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(542, 286, 44, 22, 'trx-202409183495', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(543, 273, 44, 21, 'trx-202409183119', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(544, 263, 44, 21, 'trx-202409185696', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(546, 63, 44, 6, 'trx-202409189407', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(547, 253, 44, 20, 'trx-202409188251', '2024-09-18 18:52:20', 1, 4, NULL, NULL, 'Kolaka', '6285234578897'),
(548, 87, 44, 9, 'trx-202409183218', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(549, 61, 44, 6, 'trx-202409180819', '2024-09-18 18:52:20', 1, 4, NULL, NULL, 'Kolaka', '6285234578897'),
(551, 255, 44, 20, 'trx-202409183618', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(552, 171, 44, 15, 'trx-202409188265', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(553, 69, 44, 6, 'trx-202409181742', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(554, 200, 44, 17, 'trx-202409183097', '2024-09-18 18:52:20', 1, 3, NULL, NULL, 'Kolaka', '6285234578897'),
(556, 249, 44, 20, 'trx-202409184792', '2024-09-18 18:52:20', 1, 5, NULL, NULL, 'Kolaka', '6285234578897'),
(560, 34, 45, 4, 'trx-202409188895', '2024-09-18 20:14:47', 1, 4, NULL, NULL, 'Kolaka', '6281254233445'),
(562, 5, 45, 1, 'trx-202409184394', '2024-09-18 20:14:47', 1, 4, NULL, NULL, 'Kolaka', '6281254233445'),
(563, 22, 45, 3, 'trx-202409184662', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(565, 125, 45, 11, 'trx-202409188394', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(566, 246, 45, 20, 'trx-202409182499', '2024-09-18 20:14:47', 1, 4, NULL, NULL, 'Kolaka', '6281254233445'),
(567, 97, 45, 9, 'trx-202409186953', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(568, 279, 45, 22, 'trx-202409187643', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(569, 286, 45, 22, 'trx-202409186988', '2024-09-18 20:14:47', 1, 3, NULL, NULL, 'Kolaka', '6281254233445'),
(570, 273, 45, 21, 'trx-202409184302', '2024-09-18 20:14:47', 1, 4, NULL, NULL, 'Kolaka', '6281254233445'),
(572, 263, 45, 21, 'trx-202409180065', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(573, 267, 45, 21, 'trx-202409180260', '2024-09-18 20:14:47', 1, 3, NULL, NULL, 'Kolaka', '6281254233445'),
(575, 253, 45, 20, 'trx-202409180561', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(578, 256, 45, 20, 'trx-202409186437', '2024-09-18 20:14:47', 1, 3, NULL, NULL, 'Kolaka', '6281254233445'),
(579, 255, 45, 20, 'trx-202409182844', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(580, 63, 45, 6, 'trx-202409181052', '2024-09-18 20:14:47', 1, 5, NULL, NULL, 'Kolaka', '6281254233445'),
(581, 69, 45, 6, 'trx-202409183981', '2024-09-18 20:14:47', 2, 4, NULL, NULL, 'Kolaka', '6281254233445'),
(587, 125, 46, 11, 'trx-202409188373', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(588, 10, 46, 1, 'trx-202409181746', '2024-09-18 20:27:06', 1, 4, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(589, 97, 46, 9, 'trx-202409185585', '2024-09-18 20:27:06', 1, 3, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(590, 21, 46, 3, 'trx-202409181029', '2024-09-18 20:27:06', 1, 4, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(592, 38, 46, 5, 'trx-202409181258', '2024-09-18 20:27:06', 2, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(593, 34, 46, 4, 'trx-202409187341', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(596, 5, 46, 1, 'trx-202409181657', '2024-09-18 20:27:06', 1, 4, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(597, 134, 46, 12, 'trx-202409180040', '2024-09-18 20:27:06', 1, 4, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299');
INSERT INTO `transactions` (`id`, `item_id`, `user_id`, `seller_id`, `code`, `transaction_time`, `quantity`, `rating`, `rating_time`, `review`, `shipping_address`, `recipient_contact`) VALUES
(598, 22, 46, 3, 'trx-202409183098', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(599, 63, 46, 6, 'trx-202409189174', '2024-09-18 20:27:06', 1, 2, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(600, 254, 46, 20, 'trx-202409186619', '2024-09-18 20:27:06', 1, 4, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(601, 246, 46, 20, 'trx-202409187568', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(602, 61, 46, 6, 'trx-202409187018', '2024-09-18 20:27:06', 1, 3, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(605, 171, 46, 15, 'trx-202409188794', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(608, 200, 46, 17, 'trx-202409188152', '2024-09-18 20:27:06', 1, 2, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(616, 69, 46, 6, 'trx-202409188809', '2024-09-18 20:27:06', 1, 5, NULL, NULL, 'Jl. Permata Biru\n', '6281341667299'),
(617, 125, 47, 11, 'trx-202409181262', '2024-09-18 20:39:31', 1, 5, NULL, NULL, 'Kolaka', '6285237815445'),
(618, 10, 47, 1, 'trx-202409189562', '2024-09-18 20:39:31', 1, 2, NULL, NULL, 'Kolaka', '6285237815445'),
(619, 134, 47, 12, 'trx-202409185929', '2024-09-18 20:39:31', 1, 3, NULL, NULL, 'Kolaka', '6285237815445'),
(620, 21, 47, 3, 'trx-202409183276', '2024-09-18 20:39:31', 1, 2, NULL, NULL, 'Kolaka', '6285237815445'),
(621, 67, 47, 6, 'trx-202409184459', '2024-09-18 20:39:31', 1, 2, NULL, NULL, 'Kolaka', '6285237815445'),
(622, 40, 47, 5, 'trx-202409189821', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(623, 95, 47, 9, 'trx-202409189254', '2024-09-18 20:39:31', 1, 5, NULL, NULL, 'Kolaka', '6285237815445'),
(624, 5, 47, 1, 'trx-202409183362', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(627, 246, 47, 20, 'trx-202409189510', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(628, 263, 47, 21, 'trx-202409183646', '2024-09-18 20:39:31', 1, 5, NULL, NULL, 'Kolaka', '6285237815445'),
(630, 286, 47, 22, 'trx-202409182742', '2024-09-18 20:39:31', 1, 3, NULL, NULL, 'Kolaka', '6285237815445'),
(631, 273, 47, 21, 'trx-202409187539', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(632, 63, 47, 6, 'trx-202409182877', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(634, 61, 47, 6, 'trx-202409189681', '2024-09-18 20:39:31', 1, 4, NULL, NULL, 'Kolaka', '6285237815445'),
(635, 267, 47, 21, 'trx-202409181307', '2024-09-18 20:39:31', 1, 3, NULL, NULL, 'Kolaka', '6285237815445'),
(646, 279, 47, 22, 'trx-202409182652', '2024-09-18 20:39:31', 1, 3, NULL, NULL, 'Kolaka', '6285237815445'),
(647, 125, 48, 11, 'trx-202409185722', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(648, 67, 48, 6, 'trx-202409186751', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(649, 134, 48, 12, 'trx-202409184178', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(651, 10, 48, 1, 'trx-202409181732', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(652, 63, 48, 6, 'trx-202409189594', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(653, 21, 48, 3, 'trx-202409182123', '2024-09-18 20:48:46', 1, 4, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(654, 38, 48, 5, 'trx-202409184394', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(655, 61, 48, 6, 'trx-202409182356', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(656, 171, 48, 15, 'trx-202409184749', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(658, 200, 48, 17, 'trx-202409182146', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(660, 5, 48, 1, 'trx-202409185085', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(661, 173, 48, 15, 'trx-202409180319', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(670, 286, 48, 22, 'trx-202409183810', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(672, 273, 48, 21, 'trx-202409184905', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(673, 263, 48, 21, 'trx-202409189493', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(675, 267, 48, 21, 'trx-202409180619', '2024-09-18 20:48:46', 1, 3, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(676, 97, 48, 9, 'trx-202409187860', '2024-09-18 20:48:46', 1, 5, NULL, NULL, 'Jl. Badewi', '6281236259549'),
(677, 125, 49, 11, 'trx-202409182993', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(679, 97, 49, 9, 'trx-202409182034', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(680, 21, 49, 3, 'trx-202409180356', '2024-09-18 20:57:17', 1, 3, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(681, 38, 49, 5, 'trx-202409189683', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(682, 134, 49, 12, 'trx-202409188154', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(684, 67, 49, 6, 'trx-202409186577', '2024-09-18 20:57:17', 1, 3, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(685, 40, 49, 5, 'trx-202409187084', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(686, 5, 49, 1, 'trx-202409188728', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(688, 22, 49, 3, 'trx-202409188898', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(689, 254, 49, 20, 'trx-202409186573', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(690, 256, 49, 20, 'trx-202409187924', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(691, 63, 49, 6, 'trx-202409184905', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(692, 246, 49, 20, 'trx-202409180542', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(693, 173, 49, 15, 'trx-202409185979', '2024-09-18 20:57:17', 1, 2, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(695, 200, 49, 17, 'trx-202409181108', '2024-09-18 20:57:17', 1, 2, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(696, 279, 49, 22, 'trx-202409187081', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(697, 61, 49, 6, 'trx-202409186664', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(698, 286, 49, 22, 'trx-202409187105', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(699, 171, 49, 15, 'trx-202409188433', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(702, 69, 49, 6, 'trx-202409186875', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(703, 249, 49, 20, 'trx-202409181261', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(704, 253, 49, 20, 'trx-202409181396', '2024-09-18 20:57:17', 1, 5, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(705, 87, 49, 9, 'trx-202409182316', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(706, 255, 49, 20, 'trx-202409185848', '2024-09-18 20:57:17', 1, 4, NULL, NULL, 'Jl. Ahmad Mustin\n', '6282194981518'),
(708, 21, 50, 3, 'trx-202409180479', '2024-09-18 21:07:30', 1, 4, NULL, NULL, 'Kolaka', '6285394087609'),
(709, 38, 50, 5, 'trx-202409183034', '2024-09-18 21:07:30', 1, 4, NULL, NULL, 'Kolaka', '6285394087609'),
(712, 125, 50, 11, 'trx-202409187500', '2024-09-18 21:07:30', 1, 5, NULL, NULL, 'Kolaka', '6285394087609'),
(715, 97, 50, 9, 'trx-202409188295', '2024-09-18 21:07:30', 2, 4, NULL, NULL, 'Kolaka', '6285394087609'),
(717, 95, 50, 9, 'trx-202409180580', '2024-09-18 21:07:30', 1, 4, NULL, NULL, 'Kolaka', '6285394087609'),
(719, 67, 50, 6, 'trx-202409182362', '2024-09-18 21:07:30', 1, 2, NULL, NULL, 'Kolaka', '6285394087609'),
(721, 134, 50, 12, 'trx-202409185090', '2024-09-18 21:07:30', 1, 5, NULL, NULL, 'Kolaka', '6285394087609'),
(723, 63, 50, 6, 'trx-202409189429', '2024-09-18 21:07:30', 1, 1, NULL, NULL, 'Kolaka', '6285394087609'),
(724, 61, 50, 6, 'trx-202409183231', '2024-09-18 21:07:30', 1, 1, NULL, NULL, 'Kolaka', '6285394087609'),
(728, 173, 50, 15, 'trx-202409183675', '2024-09-18 21:07:30', 1, 5, NULL, NULL, 'Kolaka', '6285394087609'),
(745, 125, 30, 11, 'trx-202410045917', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(746, 134, 30, 12, 'trx-202410047828', '2024-10-04 22:00:45', 1, 3, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(747, 97, 30, 9, 'trx-202410047254', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(748, 95, 30, 9, 'trx-202410045471', '2024-10-04 22:00:45', 1, 3, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(749, 67, 30, 6, 'trx-202410047522', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(750, 63, 30, 6, 'trx-202410042694', '2024-10-04 22:00:45', 1, 1, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(751, 61, 30, 6, 'trx-202410041072', '2024-10-04 22:00:45', 1, 1, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(752, 171, 30, 15, 'trx-202410042722', '2024-10-04 22:00:45', 1, 2, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(753, 200, 30, 17, 'trx-202410045082', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(754, 173, 30, 15, 'trx-202410043531', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(755, 10, 30, 1, 'trx-202410044662', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(756, 38, 30, 5, 'trx-202410040164', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(757, 34, 30, 4, 'trx-202410040549', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(758, 40, 30, 5, 'trx-202410046625', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(759, 5, 30, 1, 'trx-202410040241', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(760, 22, 30, 3, 'trx-202410041081', '2024-10-04 22:00:45', 1, 2, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(761, 254, 30, 20, 'trx-202410048859', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(762, 246, 30, 20, 'trx-202410048527', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(763, 279, 30, 22, 'trx-202410040427', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(764, 286, 30, 22, 'trx-202410049320', '2024-10-04 22:00:45', 1, 3, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(765, 273, 30, 21, 'trx-202410040729', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(766, 263, 30, 21, 'trx-202410047958', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(767, 267, 30, 21, 'trx-202410047482', '2024-10-04 22:00:45', 1, 3, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(768, 249, 30, 20, 'trx-202410046895', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(769, 253, 30, 20, 'trx-202410042441', '2024-10-04 22:00:45', 1, 4, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(770, 87, 30, 9, 'trx-202410042340', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(771, 256, 30, 20, 'trx-202410044276', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(772, 255, 30, 20, 'trx-202410044197', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(773, 69, 30, 6, 'trx-202410044857', '2024-10-04 22:00:45', 1, 5, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(774, 21, 30, 3, 'trx-202410041853', '2024-10-04 22:00:45', 1, 3, NULL, NULL, 'Jl Badewi, Kec Kolaka, Kab Kolaka', '82310185771'),
(775, 125, 32, 11, 'trx-202410059358', '2024-10-05 10:19:11', 1, 5, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(776, 134, 32, 12, 'trx-202410059242', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(777, 97, 32, 9, 'trx-202410054077', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(778, 95, 32, 9, 'trx-202410056185', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(779, 67, 32, 6, 'trx-202410057803', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(780, 63, 32, 6, 'trx-202410051563', '2024-10-05 10:19:11', 1, 5, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(781, 61, 32, 6, 'trx-202410051947', '2024-10-05 10:19:11', 1, 4, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(782, 171, 32, 15, 'trx-202410051768', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(783, 200, 32, 17, 'trx-202410052442', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(784, 173, 32, 15, 'trx-202410052184', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(785, 10, 32, 1, 'trx-202410059207', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(786, 21, 32, 3, 'trx-202410058651', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(787, 38, 32, 5, 'trx-202410054000', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(788, 34, 32, 4, 'trx-202410050927', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(789, 40, 32, 5, 'trx-202410050825', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(790, 5, 32, 1, 'trx-202410055572', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(791, 22, 32, 3, 'trx-202410054000', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(792, 254, 32, 20, 'trx-202410052296', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(793, 246, 32, 20, 'trx-202410059518', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(794, 279, 32, 22, 'trx-202410052171', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(795, 286, 32, 22, 'trx-202410058622', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(796, 273, 32, 21, 'trx-202410050022', '2024-10-05 10:19:11', 1, 2, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(797, 263, 32, 21, 'trx-202410052369', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(798, 267, 32, 21, 'trx-202410052587', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(799, 249, 32, 20, 'trx-202410054669', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(800, 253, 32, 20, 'trx-202410053534', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(801, 87, 32, 9, 'trx-202410057381', '2024-10-05 10:19:11', 1, 5, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(802, 256, 32, 20, 'trx-202410058981', '2024-10-05 10:19:11', 1, 1, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(803, 255, 32, 20, 'trx-202410050847', '2024-10-05 10:19:11', 1, 3, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(804, 69, 32, 6, 'trx-202410054319', '2024-10-05 10:19:11', 1, 2, NULL, NULL, 'Perumnas lalombaa Blok A No.143', '82127214040'),
(805, 125, 33, 11, 'trx-202410054502', '2024-10-05 10:26:14', 1, 2, NULL, NULL, 'Kolaka', '82296575009'),
(806, 134, 33, 12, 'trx-202410051450', '2024-10-05 10:26:14', 1, 4, NULL, NULL, 'Kolaka', '82296575009'),
(807, 97, 33, 9, 'trx-202410053699', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(808, 95, 33, 9, 'trx-202410050949', '2024-10-05 10:26:14', 1, 2, NULL, NULL, 'Kolaka', '82296575009'),
(809, 67, 33, 6, 'trx-202410050245', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(810, 63, 33, 6, 'trx-202410054913', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(811, 61, 33, 6, 'trx-202410059296', '2024-10-05 10:26:14', 1, 4, NULL, NULL, 'Kolaka', '82296575009'),
(812, 171, 33, 15, 'trx-202410058367', '2024-10-05 10:26:14', 1, 4, NULL, NULL, 'Kolaka', '82296575009'),
(813, 200, 33, 17, 'trx-202410057465', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(814, 173, 33, 15, 'trx-202410051894', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(815, 10, 33, 1, 'trx-202410050907', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(816, 21, 33, 3, 'trx-202410053502', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(817, 38, 33, 5, 'trx-202410056275', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(818, 34, 33, 4, 'trx-202410057549', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(819, 40, 33, 5, 'trx-202410056449', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(820, 5, 33, 1, 'trx-202410056450', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(821, 22, 33, 3, 'trx-202410055543', '2024-10-05 10:26:14', 1, 3, NULL, NULL, 'Kolaka', '82296575009'),
(822, 254, 33, 20, 'trx-202410052811', '2024-10-05 10:26:14', 1, 2, NULL, NULL, 'Kolaka', '82296575009'),
(823, 246, 33, 20, 'trx-202410055623', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(824, 279, 33, 22, 'trx-202410053752', '2024-10-05 10:26:14', 1, 4, NULL, NULL, 'Kolaka', '82296575009'),
(825, 286, 33, 22, 'trx-202410054807', '2024-10-05 10:26:14', 1, 3, NULL, NULL, 'Kolaka', '82296575009'),
(826, 273, 33, 21, 'trx-202410057430', '2024-10-05 10:26:14', 1, 2, NULL, NULL, 'Kolaka', '82296575009'),
(827, 263, 33, 21, 'trx-202410053885', '2024-10-05 10:26:14', 1, 2, NULL, NULL, 'Kolaka', '82296575009'),
(828, 267, 33, 21, 'trx-202410058715', '2024-10-05 10:26:14', 1, 3, NULL, NULL, 'Kolaka', '82296575009'),
(829, 249, 33, 20, 'trx-202410057475', '2024-10-05 10:26:14', 1, 4, NULL, NULL, 'Kolaka', '82296575009'),
(830, 253, 33, 20, 'trx-202410050472', '2024-10-05 10:26:14', 1, 1, NULL, NULL, 'Kolaka', '82296575009'),
(831, 87, 33, 9, 'trx-202410052560', '2024-10-05 10:26:14', 1, 5, NULL, NULL, 'Kolaka', '82296575009'),
(832, 256, 33, 20, 'trx-202410053274', '2024-10-05 10:26:14', 1, 3, NULL, NULL, 'Kolaka', '82296575009'),
(833, 255, 33, 20, 'trx-202410059836', '2024-10-05 10:26:14', 1, 3, NULL, NULL, 'Kolaka', '82296575009'),
(834, 69, 33, 6, 'trx-202410059157', '2024-10-05 10:26:14', 2, 4, NULL, NULL, 'Kolaka', '82296575009'),
(835, 125, 34, 11, 'trx-202410051544', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(836, 134, 34, 12, 'trx-202410054423', '2024-10-05 10:35:28', 1, 5, NULL, NULL, 'Desa puulemo', '81329239112'),
(837, 97, 34, 9, 'trx-202410051376', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(838, 95, 34, 9, 'trx-202410053327', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(839, 67, 34, 6, 'trx-202410059935', '2024-10-05 10:35:28', 1, 2, NULL, NULL, 'Desa puulemo', '81329239112'),
(840, 63, 34, 6, 'trx-202410053794', '2024-10-05 10:35:28', 1, 1, NULL, NULL, 'Desa puulemo', '81329239112'),
(841, 61, 34, 6, 'trx-202410057501', '2024-10-05 10:35:28', 1, 5, NULL, NULL, 'Desa puulemo', '81329239112'),
(842, 171, 34, 15, 'trx-202410050646', '2024-10-05 10:35:28', 1, 5, NULL, NULL, 'Desa puulemo', '81329239112'),
(843, 200, 34, 17, 'trx-202410054749', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(844, 173, 34, 15, 'trx-202410057873', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(845, 10, 34, 1, 'trx-202410054516', '2024-10-05 10:35:28', 1, 2, NULL, NULL, 'Desa puulemo', '81329239112'),
(846, 21, 34, 3, 'trx-202410051747', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(847, 38, 34, 5, 'trx-202410057876', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(848, 34, 34, 4, 'trx-202410055345', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(849, 40, 34, 5, 'trx-202410052172', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(850, 5, 34, 1, 'trx-202410059446', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(851, 22, 34, 3, 'trx-202410056881', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(852, 254, 34, 20, 'trx-202410058696', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(853, 246, 34, 20, 'trx-202410058913', '2024-10-05 10:35:28', 1, 5, NULL, NULL, 'Desa puulemo', '81329239112'),
(854, 279, 34, 22, 'trx-202410054825', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(855, 286, 34, 22, 'trx-202410053414', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(856, 273, 34, 21, 'trx-202410052120', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(857, 263, 34, 21, 'trx-202410058536', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(858, 267, 34, 21, 'trx-202410058080', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(859, 249, 34, 20, 'trx-202410051647', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(860, 253, 34, 20, 'trx-202410057033', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(861, 87, 34, 9, 'trx-202410051917', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(862, 256, 34, 20, 'trx-202410057907', '2024-10-05 10:35:28', 1, 4, NULL, NULL, 'Desa puulemo', '81329239112'),
(863, 255, 34, 20, 'trx-202410050097', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112'),
(864, 69, 34, 6, 'trx-202410050862', '2024-10-05 10:35:28', 1, 3, NULL, NULL, 'Desa puulemo', '81329239112');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `group_id`, `name`, `image`, `email`, `password`, `contact`, `address`) VALUES
(1, 1, 'Admin', 'user/admin.jpg', 'admin', '$2y$12$dU3DOTIrUTpex5DfaQ5CP.CYRoFUIk.SJcL5s1gzF2SRap/yeuIDm', NULL, NULL),
(2, 3, 'Manikku', 'user/manikku.jpg', 'manikku@gmail.com', '$2y$12$0suZahRZpvuj0RJcIsIRdONhn.m9bK6.n0jR1lE0jrBSFUFG6hZwe', NULL, NULL),
(3, 3, 'Bracelet Kolaka', 'user/braceletklk.png', 'braceletklk@gmail.com', '$2y$12$kQEJxFImT/F7R7oTyN6ALudaXns3G0SNl.uA/INWPBbTHZq6XQtTy', NULL, NULL),
(4, 3, 'Rumah Tenun', 'user/rumah_tenun.jpg', 'rumahtenun@gmail.com', '$2y$12$r/aZzszpzbK.fyEAlT08F.OFePbQ84JoD7c7petrsn9nxkNSKliIK', NULL, NULL),
(5, 3, 'Hello Gumpy', 'user/gumpy.jpg', 'hellogumpy@gmail.com', '$2y$12$vnZosRvmAQkiLk8d5O2LIeYMKZN8Y.PIVsX3Dyg2hva2b4dfeVi7W', NULL, NULL),
(6, 3, 'Bracelet By Naral', 'user/Bracelet Naral.jpg', 'naralshop@gmail.com', '$2y$12$bQBlF.HZpD0d/fNzNc3OOOwKnECC7NKMnb6q5SDPvWT/gnFl6qId2', NULL, NULL),
(7, 3, 'Toko Kopi Pakde', 'user/kopipakde.jpg', 'tokokopipakde@gmail.com', '$2y$12$be8lpmFsAjeQQW2acab9bu/7GQ5/YtIHuHKW4Gq54HF4SiG0l2Ucy', NULL, NULL),
(8, 3, 'Mamina Booth', 'user/Mamina Booth.jpg', 'maminabooth@gmail.com', '$2y$12$AhYzlmHzoTfJsSnUiXBmhu5cB8kJw6hGH4EUjebZVxa5PjLGmkoEC', NULL, NULL),
(9, 3, 'Kedai Senja', 'user/Kedai Senja.jpg', 'kedaisenja@gmail.com', '$2y$12$iAmQ7.MnWUkJVIG8Ks/lS.d38VylsA/RLoFLwYYBd5skLPMAQu.4W', NULL, NULL),
(10, 3, 'Kedai Barokah', 'user/Kedai Barokah.jpg', 'kedaibarokah@gmail.com', '$2y$12$0cvB4Hqiuma7/9.DafiShuHtWh6xRzcWLMkLCPrmuMerNXD/8Wm.e', NULL, NULL),
(11, 3, 'Kedai Yustia', 'user/Kedai Yustia.jpg', 'kedaiyustia@gmail.com', '$2y$12$fH8ajmZ5hjlxa/V5V5GJN.FOdncsvS16fnvE4vsldYI1j3Ii4lCle', NULL, NULL),
(12, 3, 'Angkringan Mante', 'user/Angkringan Mante.jpg', 'angkringanmante@gmail.com', '$2y$12$jomx1hN2lLg6t8xo.6ozaulpMekTVse3GQ4hObRobi39bFt73Uijq', NULL, NULL),
(13, 3, 'Cafe Kelapa Dua', 'user/Kelapa Dua.jpg', 'cafekelapadua@gmail.com', '$2y$12$rWke4U.zrYiYJBAVFFGit.fkB30K9Y6PqfP47CfQFJMWfkYftDyRO', NULL, NULL),
(14, 3, 'Edd Cemilan', 'user/edd cemilan.jpg', 'eddcemilankolaka@gmail.com', '$2y$12$FmggVHzRPAE9OjRs1ITPVepE1yTD38qTcM.75D0aEExFe/8ohq.bG', NULL, NULL),
(15, 3, 'Dofu Donuts', 'user/dofu donuts.jpg', 'dofudonuts@gmail.com', '$2y$12$tpsiOWGVZblSZu9ruW8oROHQwPJKqF17BxmFHWcT/P7xS873OqCJO', NULL, NULL),
(16, 3, 'UO Kopi', 'user/uo kopi.jpg', 'uokopi@gmail.com', '$2y$12$p25S4GDFq/1boV1CikxuOu1HMT9gPHNJ2zBJH75C5Ln18swdeZEwK', NULL, NULL),
(17, 3, 'Ummu Haura Kitchen', 'user/ummu haura.jpg', 'ummuhaurakitchen@gmail.com', '$2y$12$8KJEEsEsNpO8.pR7rtU/Ae5Hi5c18Uc.Pjc/jaMQE.lFn3AqUrC/q', NULL, NULL),
(18, 3, 'My Coffee Cafe', 'user/my coffee cafe.jpg', 'mycoffee@gmail.com', '$2y$12$ZEZA7.Lu73IecJm1gq0W/eQLe1OVHT8W86/RBW.yrdVhTgWRwHVEG', NULL, NULL),
(19, 3, 'Coffe Story', 'user/coffe story.jpg', 'coffestory@gmail.com', '$2y$12$5VT/RfvGoi7zPCQX7qexh.j6vG1bKyxmOTe98Xy5EFCCaxlwg/tjG', NULL, NULL),
(20, 3, 'RM Asap', 'user/rm asap.jpg', 'rmasap@gmail.com', '$2y$12$3gWezNerA/ZWYPFpvp6OC.J1QcBzXogUT3LBmcqAUzuLAey85ffli', NULL, NULL),
(21, 3, 'Hijab Store', 'user/hijab store.jpg', 'hijabstore@gmail.com', '$2y$12$vGpYp1saGAkEq7rheJ6KneVVwxvuem3C83Gcihb6e.Az4hCOo3Zau', NULL, NULL),
(22, 3, 'Ayy Shop', 'user/ayy shop.jpg', 'ayyshop@gmail.com', '$2y$12$usx9zaNNr2UH9lZXVee.YOyIJbvVjMJCOGQQqOMVTsZ3QLIlxtiSy', NULL, NULL),
(23, 3, 'Barira Butik', 'user/barira butik.jpg', 'barirabutik@gmail.com', '$2y$12$U6V0drpZcQZV2d95YnB9QOjG0mC6ippZCb9aKGRDHda8wPrR3bliy', NULL, NULL),
(24, 3, 'Bahira Store', 'user/bahira store.jpg', 'bahirastore@gmail.com', '$2y$12$.qkhpTGhyW3ZmLIYMycv2uBqkGp2mNovY2ltnYnXGKCsU8v7SrkMy', NULL, NULL),
(25, 2, 'Ila', NULL, 'bandukarmila@yahoo.com', '$2y$12$Jcvr9hxgdyE.V4n4WGfUNOHQ/eZE9dz9MUjcA3gS4IXUGqUs8BNqS', '82291752103', 'Kolaka'),
(26, 2, 'Riska Novianty', NULL, 'riskanovianty95@gmail.com', '$2y$12$0CdbOPC4a72BXKHgTxEpN.6KvtnqODZiGlOUFbvt/ntHGqQpNP4IO', '85343548321', 'Kolaka'),
(27, 2, 'Nurhidayanti', NULL, 'nurhidayanti98@gmail.com', '$2y$12$EMEdQbxuoSk.I10dbX1BgeWqRGEz7Q/29bTAPt5evnsf5UG0i4Una', '82348775342', 'Kolaka'),
(28, 2, 'Sarnita', NULL, 'sarnitaaprilia@gmail.com', '$2y$12$41vKaCX04hjewzdX62rx1O/OorQ8r.dxOiutc4P81OiaugYtLxRJO', '82230147096', 'Kolaka'),
(29, 2, 'Pasha Diza Putri', NULL, 'pashadiza@gmail.com', '$2y$12$2XYyTMO6W/sLO5CFg/pmD.Gsp70SD.SkllY6XQxVF06x9oroUOJAu', '81341638380', 'Btn tahoa, kolaka'),
(30, 2, 'Risma Damayanti', NULL, 'rismadamayanti2912@gmail.com', '$2y$12$xFl0nLpINhtz532Rb2mAdOYLgXESCGFDRILHn39IYBwSY8Y6Mfoju', '82310185771', 'Jl Badewi, Kec Kolaka, Kab Kolaka'),
(32, 2, 'La Ode Muh. TaufiqQur\'Rahman O.T.', NULL, 'Kiong.y.143@gmail.com', '$2y$12$hxmHU8j1gUndK9yA5wZ.Oumxt/wxJYMwD8.bouOtfJDdgV290rnxW', '82127214040', 'Perumnas lalombaa Blok A No.143'),
(33, 2, 'Hajria', NULL, 'Haje@gmail.com', '$2y$12$h39Sexmfn/pmY8C3lg/0XucC2hgP89J6ngLdMeaHuDDLGUWDv0YS6', '82296575009', 'Kolaka'),
(34, 2, 'Ummyy', NULL, 'ummyyklsm14@gmail.com', '$2y$12$z06EdluGGjtBRPhjJOMjKuvySFaAq2cs2L22K.cGDDzdxsffW17yu', '81329239112', 'Desa puulemo'),
(35, 2, 'Arya Wibawa AR', NULL, 'aryawibawa352@gmail.com', '$2y$12$Niqp3lROxoivFlStES4XG.I5BiPZ3QRyeSZJrnxwku6Fu5T6tRCkq', '81342619887', 'Jln. Pemuda no. 352 kolaka'),
(36, 2, 'Ayudha Rahma Salam', NULL, 'ayudharahma02@gmail.com', '$2y$12$oRjkRXejFEgKAW2xDx4EpejCdtgpWWWnVQ4Kfwdgawd/VGQNy.GF2', '82311666250', 'Kolaka'),
(37, 2, 'Yasmin', NULL, 'yasminwildani234@gmail.com', '$2y$12$uFupqjoOvfWkfTNBl0QMS.GtLZQDzufn/lVMncZgW2BP06atqJZuq', '82144343147', 'Kolaka'),
(38, 2, 'Nur Sadilah', NULL, 'nursaadillah16@gmail.com', '$2y$12$UMt0DkMq1joNxROBbwE/ouUfg7.TiwLnQt04BhyGGaY0FQWdwJwyC', '85281872413', 'Lorong solata'),
(39, 2, 'Nurhandayani', NULL, 'nurhandayaniamir74@gmail.com', '$2y$12$ZdfKKucDUpuo0.yeOOmWau9WUF7ShhRA8AnSKZ3MlSI438brtP17q', '85211883676', 'Jalan badewi'),
(40, 2, 'Alexander Skevin Frandito Amantokan Nasus', NULL, 'alexandernasus30@gmail.com', '$2y$12$1TzQAllD0..uumGZkUeZSehdId3ssIA5HMwQmjF5.NkPOQL3NNXUe', '82155750479', 'Perumnas lalombaa Blok A No.36, Kolaka, Sulawesi Tenggara'),
(41, 2, 'Fenny Utami', NULL, 'utamifenny3@gmail.com', '$2y$12$jfcXvYnZBzEvQo.Qt5Fh0.8jsCb/rNb7.caquoRZBzkjimvE.h8.W', '82255601752', 'Pomalaa'),
(42, 2, 'Aqeela', NULL, 'caaqila7@gmail.com', '$2y$12$DLpgerscHf6tNPn7BQncK.inX56lbYm/YGlFwy/5sXiMrxS3DHCLa', '82175321886', 'Jl. badewi'),
(43, 2, 'Diaz Ahza', NULL, 'Diazahza0305@gmail.com', '$2y$12$RoWLYNpvZ0ZCXFbx85QriuQiNm0SJGLrnVVSmEvj.PLk6ouqnSi1e', '82233504423', 'Kolaka'),
(44, 2, 'Whyn', NULL, 'herdiansyahwin5@gmail.com', '$2y$12$Gshsu8NLglOvg2ZjMR3.iutddxyt0MV6xoLMISw6OUZPvFzaPeD52', '85234578897', 'Kolaka'),
(45, 2, 'Romie Thomas Ningrat', NULL, 'Romie123@gmail.com', '$2y$12$IxMsyTZ1XnJ7iD44W5RFmuO41XaHpYHn24FPiXRrgTpfJ3KLtpWK.', '81254233445', 'Kolaka'),
(46, 2, 'Indo Kulau', NULL, 'indokulau0411@gmail.com', '$2y$12$7s1LrP2B5IafqbvNkPXjhOltF2dq0Wh2AYHG92QMq2GV/Bafnn4Hi', '81341667299', 'Jl. Permata Biru'),
(47, 2, 'Vincent', NULL, 'vincent231@gmail.com', '$2y$12$bEU72Z.xZU3KVpkoIKnPx.dmSKFBTvXdHOBnegorSSxPrJ7FMjLxK', '85237815445', 'Kolaka'),
(48, 2, 'Muhammad Al-Musyafir Kasim', NULL, 'muh.almusyafir@gmail.com', '$2y$12$BlTeMb6uGfoEogTao6HBI.r/mzmrcpYECKvTWC5j33AgqktI2heYy', '81236259549', 'Jalan badewi'),
(49, 2, 'Nur Atika Resky', NULL, 'nuratikatika2002@gmail.com', '$2y$12$fc3NswHPaAH.MMUD4pvqnO/2hEfVljPtp44HxDewUHBhVPvJB8pcC', '82194981518', 'Jl. Ahmad Mustin'),
(50, 2, 'Nurul Fadhilah Ashar', NULL, 'nurulfadhilahashar@gmail.com', '$2y$12$TsXsAx9kTy76mA/e.c47xul01GkLYshclcTb70npPKuygHfIT8aCG', '85394087609', 'Kolaka');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_item_id_foreign` (`item_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_seller_id_foreign` (`seller_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellers_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_item_id_foreign` (`item_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_seller_id_foreign` (`seller_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=880;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=865;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
