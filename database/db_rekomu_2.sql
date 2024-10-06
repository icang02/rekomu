-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 06 Okt 2024 pada 11.46
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
-- Database: `db_rekomu_2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `real_price` int NOT NULL,
  `average_rating` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(5, 2, 1, 'Tas (11 x 17 cm)', '27-tas-11-x-17-cm', 131250, 125000, NULL, 'item/Tas (11 x 17 cm).jpg', 0),
(6, 2, 1, 'Tas (17 x 13 cm (mix manik))', '27-tas-17-x-13-cm-mix-manik', 178500, 170000, NULL, 'item/Tas (17 x 13 cm (mix manik)).jpg', 0),
(7, 2, 1, 'Tas (13 x 19 cm)', '27-tas-13-x-19-cm', 183750, 175000, NULL, 'item/Tas (13 x 19 cm).jpg', 0),
(8, 2, 1, 'Tas (13 x 12 cm)', '27-tas-13-x-12-cm', 147000, 140000, NULL, 'item/Tas (13 x 12 cm).jpg', 0),
(9, 2, 1, 'Id Card', '27-id-card', 52500, 50000, NULL, 'item/Id Card.jpg', 0),
(10, 2, 1, 'Card Holder', '27-card-holder', 52500, 50000, NULL, 'item/Card Holder.jpg', 0),
(11, 2, 2, '3row Bead', '28-3row-bead', 28350, 27000, NULL, 'item/3row Bead Bracelet.jpg', 0),
(12, 2, 2, '5row Bead Bracelet', '28-5row-bead-bracelet', 26250, 25000, NULL, 'item/5row Bead Bracelet.jpg', 0),
(13, 2, 2, 'Kukie Bracelet', '28-kukie-bracelet', 36750, 35000, NULL, 'item/Kukie-Bracelet.jpg', 0),
(14, 2, 2, 'Line Bracelet', '28-line-bracelet', 25200, 24000, NULL, 'item/Line Bracelet.jpg', 0),
(15, 2, 2, 'Paracord Bracelet', '28-paracord-bracelet', 26250, 25000, NULL, 'item/Paracord Bracelet.jpg', 0),
(16, 2, 3, 'Tenun Mekongga', '29-tenun-mekongga', 367500, 350000, NULL, 'item/Tenun Mekongga.jpg', 0),
(17, 2, 3, 'Tenun Tolaki', '29-tenun-tolaki', 157500, 150000, NULL, 'item/Tenun Tolaki.jpg', 0),
(18, 2, 3, 'Tenun Tabere', '29-tenun-tabere', 262500, 250000, NULL, 'item/Tenun Tabere.jpg', 0),
(19, 2, 3, 'Tenun Sangia', '29-tenun-sangia', 525000, 500000, NULL, 'item/Tenun Sangia.jpeg', 0),
(20, 2, 3, 'Tutup Gelas', '29-tutup-gelas', 52500, 50000, NULL, 'item/Tutup Gelas.jpg', 0),
(21, 2, 3, 'Kotak Cendra Mata', '29-kotak-cendra-mata', 52500, 50000, NULL, 'item/Kotak Cendra Mata.jpg', 0),
(22, 2, 3, 'Songket Kepala', '29-songket-kepala', 52500, 50000, NULL, 'item/Songket Kepala.jpg', 0),
(23, 2, 3, 'Tas', '29-tas', 52500, 50000, NULL, 'item/Tas.jpg', 0),
(24, 2, 4, 'Cincin Black Series', '30-cincin-black-series', 10500, 10000, NULL, 'item/Cincin Black Series.jpg', 0),
(25, 2, 4, 'Cincin Blue Series', '30-cincin-blue-series', 10500, 10000, NULL, 'item/Cincin Blue Series.jpg', 0),
(26, 2, 4, 'Cincin Sun Flower', '30-cincin-sun-flower', 10500, 10000, NULL, 'item/Cincin Sun Flower.jpg', 0),
(27, 2, 4, 'Cincin Lotsu', '30-cincin-lotsu', 10500, 10000, NULL, 'item/Cincin Lotsu.jpg', 0),
(28, 2, 4, 'Cincin Green Yellow', '30-cincin-green-yellow', 10500, 10000, NULL, 'item/Cincin Green Yellow.jpg', 0),
(29, 2, 4, 'Cincin Love', '30-cincin-love', 10500, 10000, NULL, 'item/Cincin Love.jpg', 0),
(30, 2, 4, 'Cincin Silver', '30-cincin-silver', 10500, 10000, NULL, 'item/Cincin Silver.jpg', 0),
(31, 2, 4, 'Gelang Pink Series', '30-gelang-pink-series', 15750, 15000, NULL, 'item/Gelang Pink Series.jpg', 0),
(32, 2, 4, 'Gelang Tali', '30-gelang-tali', 15750, 15000, NULL, 'item/Gelang Tali.jpg', 0),
(33, 2, 4, 'Gelang Tali Huruf', '30-gelang-tali-huruf', 21000, 20000, NULL, 'item/Gelang Tali Huruf.jpg', 0),
(34, 2, 4, 'Gelang Mutiara Putih', '30-gelang-mutiara-putih', 21000, 20000, NULL, 'item/Gelang Mutiara Putih.jpg', 0),
(35, 2, 4, 'Gantungan HP', '30-gantungan-hp', 31500, 30000, NULL, 'item/Gantungan HP.jpg', 0),
(36, 2, 5, 'Arumi Ring', '31-arumi-ring', 6300, 6000, NULL, 'item/Arumi ring.jpg', 0),
(37, 2, 5, 'Flower Ring', '31-flower-ring', 6300, 6000, NULL, 'item/Flower Ring.jpg', 0),
(38, 2, 5, 'Nudey Ring', '31-nudey-ring', 6300, 6000, NULL, 'item/Nudey Ring.jpg', 0),
(39, 2, 5, 'Starbie Ring', '31-starbie-ring', 6300, 6000, NULL, 'item/Starbie Ring.jpg', 0),
(40, 2, 5, 'Black Series Ring', '31-black-series-ring', 6300, 6000, NULL, 'item/Black Series Ring.jpg', 0),
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
(61, 1, 6, 'Es Kopi Aren', '32-es-kopi-aren', 18900, 18000, NULL, 'item/Es Kopi Aren.png', 0),
(62, 1, 6, 'Es Kopi Susu', '32-es-kopi-susu', 18900, 18000, NULL, 'item/Es Kopi Susu.jpeg', 0),
(63, 1, 6, 'Green Tea', '32-green-tea', 15750, 15000, NULL, 'item/Green Tea.png', 0),
(64, 1, 6, 'Lemon Tea', '32-lemon-tea', 15750, 15000, NULL, 'item/Lemon Tea.png', 0),
(65, 1, 6, 'Es Lotus', '32-es-lotus', 21000, 20000, NULL, 'item/Es Lotus.png', 0),
(66, 1, 6, 'Nasi Ayam Kemangi', '32-nasi-ayam-kemangi', 15750, 15000, NULL, 'item/Nasi Ayam Kemangi.png', 0),
(67, 1, 6, 'Pisang Original', '32-pisang-original', 10500, 10000, NULL, 'item/Pisang Original.png', 0),
(68, 1, 6, 'Pisang Keju Susu', '32-pisang-keju-susu', 15750, 15000, NULL, 'item/Pisang Keju Susu.png', 0),
(69, 1, 6, 'Kentang Goreng', '32-kentang-goreng', 21000, 20000, NULL, 'item/Kentang Goreng.png', 0),
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
(87, 1, 9, 'Mie Kuah', '35-mie-kuah', 15750, 15000, NULL, 'item/Mie Kuah.jpg', 0),
(88, 1, 9, 'Mie Petir', '35-mie-petir', 17850, 17000, NULL, 'item/Mie Petir.png', 0),
(89, 1, 9, 'Mie Nyemek', '35-mie-nyemek', 17850, 17000, NULL, 'item/Mie Nyemek.jpg', 0),
(90, 1, 9, 'Seblak', '35-seblak', 21000, 20000, NULL, 'item/Seblak.png', 0),
(91, 1, 9, 'Bakso Bakar', '35-bakso-bakar', 15750, 15000, NULL, 'item/Bakso Bakar.jpg', 0),
(92, 1, 9, 'Bakso Goreng', '35-bakso-goreng', 15750, 15000, NULL, 'item/Bakso Goreng.jpg', 0),
(93, 1, 9, 'Bakso Kuah', '35-bakso-kuah', 15750, 15000, NULL, 'item/Bakso Kuah.jpg', 0),
(94, 1, 9, 'Nasi Goreng', '35-nasi-goreng', 21000, 20000, NULL, 'item/Nasi Goreng.jpg', 0),
(95, 1, 9, 'Burger', '35-burger', 21000, 20000, NULL, 'item/Burger.jpg', 0),
(96, 1, 9, 'Ayam Goreng Crispy', '35-ayam-goreng-crispy', 31500, 30000, NULL, 'item/Ayam Goreng Crispy.jpg', 0),
(97, 1, 9, 'Ayam Geprek', '35-ayam-geprek', 31500, 30000, NULL, 'item/Ayam Geprek.jpg', 0),
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
(113, 1, 9, 'Ice Greentea', '35-ice-greentea', 15750, 15000, NULL, 'item/Ice Greentea.jpg', 0),
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
(125, 1, 11, 'Sate Ayam', '37-sate-ayam', 5250, 5000, NULL, 'item/Sate Ayam.jpg', 0),
(126, 1, 11, 'Sate Kembang Cumi', '37-sate-kembang-cumi', 5250, 5000, NULL, 'item/Sate Kembang Cumi.png', 0),
(127, 1, 11, 'Sate Bola Salmon', '37-sate-bola-salmon', 5250, 5000, NULL, 'item/Sate Bola Salmon.png', 0),
(128, 1, 11, 'Sate Bola Kepiting', '37-sate-bola-kepiting', 5250, 5000, NULL, 'item/Sate Bola Kepiting.png', 0),
(129, 1, 11, 'Sate Krupuk Pangsit', '37-sate-krupuk-pangsit', 5250, 5000, NULL, 'item/Sate Krupuk Pangsit.png', 0),
(130, 1, 11, 'Sate Bakso Lobster', '37-sate-bakso-lobster', 5250, 5000, NULL, 'item/Sate Bakso Lobster.png', 0),
(131, 1, 11, 'Telur Puyu Bacem', '37-telur-puyu-bacem', 5250, 5000, NULL, 'item/Telur Puyu Bacem.png', 0),
(132, 1, 12, 'Sosis Kentang', '38-sosis-kentang', 21000, 20000, NULL, 'item/Sosis Kentang.jpg', 0),
(133, 1, 12, 'Kentang Goreng Kelapa Dua', '38-kentang-goreng-kelapa-dua', 15750, 15000, NULL, 'item/Kentang Goreng Kelapa Dua.png', 0),
(134, 1, 12, 'Ubi Goreng', '38-ubi-goreng', 15750, 15000, NULL, 'item/Ubi Goreng.jpg', 0),
(135, 1, 12, 'Ayam Goreng Gepur', '38-ayam-goreng-gepur', 26250, 25000, NULL, 'item/Ayam Goreng Gepur.jpg', 0),
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
(171, 1, 15, 'Es Kopi Uo', '41-es-kopi-uo', 15750, 15000, NULL, 'item/Es Kopi Uo.jpg', 0),
(172, 1, 15, 'Es Susu Aren', '41-es-susu-aren', 15750, 15000, NULL, 'item/Es Susu Aren.jpg', 0),
(173, 1, 15, 'Ice Tea', '41-ice-tea', 15750, 15000, NULL, 'item/Ice Tea.jpg', 0),
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
(186, 1, 16, 'Ayam Ungkep', '42-ayam-ungkep', 68250, 65000, NULL, 'item/Ayam Ungkep.jpg', 0),
(187, 1, 16, 'Ayam Bakar', '42-ayam-bakar', 26250, 25000, NULL, 'item/Ayam Bakar.jpg', 0),
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
(200, 1, 17, 'Lime Juice', '43-lime-juice', 23100, 22000, NULL, 'item/Lime Juice.jpg', 0),
(201, 1, 17, 'Mie Kuah My', '43-mie-kuah-my', 21000, 20000, NULL, 'item/Mie Kuah My.jpg', 0),
(202, 1, 17, 'Milk Tea', '43-milk-tea', 18900, 18000, NULL, 'item/Milk Tea.jpg', 0),
(203, 1, 17, 'Nasi Goreng My', '43-nasi-goreng-my', 28350, 27000, NULL, 'item/Nasi Goreng My.jpg', 0),
(204, 1, 17, 'Nasi Telur Dadar', '43-nasi-telur-dadar', 24150, 23000, NULL, 'item/Nasi Telur Dadar.jpg', 0),
(205, 1, 17, 'Rice Bool Rica Rica', '43-rice-bool-rica-rica', 29400, 28000, NULL, 'item/Rice Bool Rica Rica.jpg', 0),
(206, 1, 18, 'Afogatto', '44-afogatto', 21000, 20000, NULL, 'item/Afogatto.jpg', 0),
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
(232, 1, 19, 'Cumi Parape', '45-cumi-parape', 42000, 40000, NULL, 'item/Cumi Parape.jpg', 0),
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
(246, 3, 20, 'Abaya Black Plisket', '46-abaya-black-plisket', 367500, 350000, NULL, 'item/Abaya Black Plisket.jpg', 0),
(247, 3, 20, 'Gamis Plisket Cerrutty', '46-gamis-plisket-cerrutty', 294000, 280000, NULL, 'item/Gamis Plisket Cerrutty.jpg', 0),
(248, 3, 20, 'Blouse Payet Premium', '46-blouse-payet-premium', 178500, 170000, NULL, 'item/Blouse Payet Premium.jpg', 0),
(249, 3, 20, 'Rok Jeans Span', '46-rok-jeans-span', 141750, 135000, NULL, 'item/Rok Jeans Span.jpg', 0),
(250, 3, 20, 'Rajut Crop', '46-rajut-crop', 126000, 120000, NULL, 'item/Rajut Crop.jpg', 0),
(251, 3, 20, 'Kemeja Polos Linen', '46-kemeja-polos-linen', 115500, 110000, NULL, 'item/Kemeja Polos Linen.jpg', 0),
(252, 3, 20, 'Rajut Salur', '46-rajut-salur', 136500, 130000, NULL, 'item/Rajut Salur.jpg', 0),
(253, 3, 20, 'Kemeja Crinkle', '46-kemeja-crinkle', 126000, 120000, NULL, 'item/Kemeja Crinkle.jpg', 0),
(254, 3, 20, 'Outer Rajut', '46-outer-rajut', 157500, 150000, NULL, 'item/Outer Rajut.jpg', 0),
(255, 3, 20, 'Kemeja Motif', '46-kemeja-motif', 131250, 125000, NULL, 'item/Kemeja Motif.jpg', 0),
(256, 3, 20, 'Outer Crop', '46-outer-crop', 157500, 150000, NULL, 'item/Outer Crop.jpg', 0),
(257, 3, 20, 'Rajut Knit', '46-rajut-knit', 173250, 165000, NULL, 'item/Rajut Knit.jpg', 0),
(258, 3, 20, 'Outer Rajut Premium', '46-outer-rajut-premium', 126000, 120000, NULL, 'item/Outer Rajut Premium.jpg', 0),
(259, 3, 20, 'Outer Knit Plisket', '46-outer-knit-plisket', 78750, 75000, NULL, 'item/Outer Knit Plisket.jpg', 0),
(260, 3, 20, 'Blouse Payet', '46-blouse-payet', 141750, 135000, NULL, 'item/Blouse Payet.jpg', 0),
(261, 3, 20, 'Blouse Shimmer', '46-blouse-shimmer', 157500, 150000, NULL, 'item/Blouse Shimmer.jpg', 0),
(262, 3, 20, 'Blouse Flower Premium', '46-blouse-flower-premium', 183750, 175000, NULL, 'item/Blouse Flower Premium.jpg', 0),
(263, 3, 21, 'Ayy Blouse', '47-ayy-blouse', 126000, 120000, NULL, 'item/Ayy Blouse.jpg', 0),
(264, 3, 21, 'Ayy Kaftan', '47-ayy-kaftan', 262500, 250000, NULL, 'item/Ayy Kaftan.jpg', 0),
(265, 3, 21, 'Blezer Mini', '47-blezer-mini', 157500, 150000, NULL, 'item/Blezer Mini.jpg', 0),
(266, 3, 21, 'Blouse Import Allsize', '47-blouse-import-allsize', 115500, 110000, NULL, 'item/Blouse Import Allsize.jpg', 0),
(267, 3, 21, 'Tunik Rajut BKK', '47-tunik-rajut-bkk', 189000, 180000, NULL, 'item/Tunik Rajut BKK.jpg', 0),
(268, 3, 21, 'Blouse Levis Import', '47-blouse-levis-import', 147000, 140000, NULL, 'item/Blouse Levis Import.jpg', 0),
(269, 3, 21, 'Crop Top Sweater', '47-crop-top-sweater', 157500, 150000, NULL, 'item/Crop Top Sweater.jpg', 0),
(270, 3, 21, 'Gamis Motif', '47-gamis-motif', 220500, 210000, NULL, 'item/Gamis Motif.jpg', 0),
(271, 3, 21, 'Hoodie Elephant', '47-hoodie-elephant', 189000, 180000, NULL, 'item/Hoodie Elephant.jpg', 0),
(272, 3, 21, 'Hoodie Polos', '47-hoodie-polos', 168000, 160000, NULL, 'item/Hoodie Polos.jpg', 0),
(273, 3, 21, 'Jeans Import L', '47-jeans-import-l', 231000, 220000, NULL, 'item/Jeans Import L.jpg', 0),
(274, 3, 21, 'Kaftan Motif', '47-kaftan-motif', 294000, 280000, NULL, 'item/Kaftan Motif.jpg', 0),
(275, 3, 21, 'Kaos Oversize', '47-kaos-oversize', 199500, 190000, NULL, 'item/Kaos Oversize.jpg', 0),
(276, 3, 21, 'Kemeja Polos', '47-kemeja-polos', 147000, 140000, NULL, 'item/Kemeja Polos.jpg', 0),
(277, 3, 21, 'Linean', '47-linean', 157500, 150000, NULL, 'item/Linean.jpg', 0),
(278, 3, 22, 'Azara Dress', '48-azara-dress', 262500, 250000, NULL, 'item/Azara Dress.jpeg', 0),
(279, 3, 22, 'Blouse Organza', '48-blouse-organza', 204750, 195000, NULL, 'item/Blouse Organza.jpg', 0),
(280, 3, 22, 'Cardigan Strip Import', '48-cardigan-strip-import', 189000, 180000, NULL, 'item/Cardigan Strip Import.jpg', 0),
(281, 3, 22, 'Kaftan', '48-kaftan', 178500, 170000, NULL, 'item/Kaftan.jpg', 0),
(282, 3, 22, 'Kamyla Mukenah', '48-kamyla-mukenah', 199500, 190000, NULL, 'item/Kamyla Mukenah.jpeg', 0),
(283, 3, 22, 'Kemeja Polos Nevada', '48-kemeja-polos-nevada', 189000, 180000, NULL, 'item/Kemeja Polos Nevada.jpg', 0),
(284, 3, 22, 'Oneset Crickle', '48-oneset-crickle', 210000, 200000, NULL, 'item/Oneset Crickle.jpg', 0),
(285, 3, 22, 'Oneset Flower', '48-oneset-flower', 204750, 195000, NULL, 'item/Oneset Flower.jpg', 0),
(286, 3, 22, 'Pastel Kaftan', '48-pastel-kaftan', 189000, 180000, NULL, 'item/Pastel Kaftan.jpeg', 0),
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
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(11, '2024_09_24_182458_add_address_to_users_table', 1),
(12, '2024_09_24_233502_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci
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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7cWu0hGmrRbKFguJRVlb4A8asfASyhBnpLP5VKEW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3NiS3o3QzhpSzhVeFp4VDFSVmwwazMwc0dLWkx3cG5XU1QxUXljMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9yZWtvbXUudGVzdC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728133952);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_time` datetime NOT NULL,
  `quantity` int NOT NULL,
  `rating` int DEFAULT NULL,
  `rating_time` datetime DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `group_id`, `name`, `image`, `email`, `password`, `contact`, `address`) VALUES
(1, 1, 'Admin', 'user/admin.jpg', 'admin', '$2y$12$8Ro7cISPWZpmZG1gSqkoIO7daXID4GYRSocR3CTsdjJhiwlr1M3SG', NULL, NULL),
(2, 3, 'Manikku', 'user/manikku.jpg', 'manikku@gmail.com', '$2y$12$/nIZIM83f2hB3cpY/jB1ruC7NyBccy0TtUNrJYx9FLTEpngPcChmy', NULL, NULL),
(3, 3, 'Bracelet Kolaka', 'user/braceletklk.png', 'braceletklk@gmail.com', '$2y$12$VU0A4GaACSBBNOoaeCnrneJ/zLlafO0v4LjasxERzMOzZF7P0fNDy', NULL, NULL),
(4, 3, 'Rumah Tenun', 'user/rumah_tenun.jpg', 'rumahtenun@gmail.com', '$2y$12$ULt5z4ZBsoq1IUpTD42b1.HDK6eTDfK13159WLZvkN2jOe4Btc.Ie', NULL, NULL),
(5, 3, 'Hello Gumpy', 'user/gumpy.jpg', 'hellogumpy@gmail.com', '$2y$12$T4E/ZdqMbLT08Ec1cQUfvu5.zj5CNi7.hXADvfvISuzMwDC4plKXy', NULL, NULL),
(6, 3, 'Bracelet By Naral', 'user/Bracelet Naral.jpg', 'naralshop@gmail.com', '$2y$12$uRmOQ/AFgv4Y54v700MqlOoeIR0PdUpa8ZtrVl30SqSIIeSz55bbC', NULL, NULL),
(7, 3, 'Toko Kopi Pakde', 'user/kopipakde.jpg', 'tokokopipakde@gmail.com', '$2y$12$rmuzRYwC4gn7QkQ5u6JNE.kuJWBn0n5VG0HP0gvh7j96EJuMYEWO6', NULL, NULL),
(8, 3, 'Mamina Booth', 'user/Mamina Booth.jpg', 'maminabooth@gmail.com', '$2y$12$mga0iZ/ZafPW3ZpnE/IkJeTFFoyK1nDF9f0l2hJWZAlWtuZu/Pu16', NULL, NULL),
(9, 3, 'Kedai Senja', 'user/Kedai Senja.jpg', 'kedaisenja@gmail.com', '$2y$12$9EHmvTx3G9bhobE5EKmPx.9LKyPqGJn/6iW39Gb2W2w1a1B2Rr3vu', NULL, NULL),
(10, 3, 'Kedai Barokah', 'user/Kedai Barokah.jpg', 'kedaibarokah@gmail.com', '$2y$12$ByqrW5axSC6QXC5G8cCzDuf9OdxdtQSc0lHvvPSkTSCImKNcLqvVW', NULL, NULL),
(11, 3, 'Kedai Yustia', 'user/Kedai Yustia.jpg', 'kedaiyustia@gmail.com', '$2y$12$SRQhNfVBqgBkZresTxBH5.dd8vi5eS/lDEXMhV7ImhR8xy7XxR0zS', NULL, NULL),
(12, 3, 'Angkringan Mante', 'user/Angkringan Mante.jpg', 'angkringanmante@gmail.com', '$2y$12$SH4eazrbCjHDxRMs53AfweEhk7vP6BEy.FouZHCC06/q7T9y/7Hsa', NULL, NULL),
(13, 3, 'Cafe Kelapa Dua', 'user/Kelapa Dua.jpg', 'cafekelapadua@gmail.com', '$2y$12$BK3881gnvO2qQmFl8oII8um43IUCL8c0T92Jaa8ts/17A7JK0Nt4y', NULL, NULL),
(14, 3, 'Edd Cemilan', 'user/edd cemilan.jpg', 'eddcemilankolaka@gmail.com', '$2y$12$3gqvqzfWn3enq9sSTn1R8eqoN4VIQlccffJNNk5G5d8xHjhDS/3ym', NULL, NULL),
(15, 3, 'Dofu Donuts', 'user/dofu donuts.jpg', 'dofudonuts@gmail.com', '$2y$12$eZQyXmjdHDlZonCXUyBSHe675EypvZiRVqS53a3ETGpbiCSrwVJg2', NULL, NULL),
(16, 3, 'UO Kopi', 'user/uo kopi.jpg', 'uokopi@gmail.com', '$2y$12$4hSsfptGb6Qoc.R639X0n.XSMk7/87zJta5EIIyHPTT3HdwUr6xby', NULL, NULL),
(17, 3, 'Ummu Haura Kitchen', 'user/ummu haura.jpg', 'ummuhaurakitchen@gmail.com', '$2y$12$rav7qcFP47kT9XteNqyGNu0g3BztB7dEGv7NlXct.vKWGAdB8CuUi', NULL, NULL),
(18, 3, 'My Coffee Cafe', 'user/my coffee cafe.jpg', 'mycoffee@gmail.com', '$2y$12$Lf93pI1i3P03/UJigQT7BeOhP4uNnwP45PR1POvZfRogJxjBr42eq', NULL, NULL),
(19, 3, 'Coffe Story', 'user/coffe story.jpg', 'coffestory@gmail.com', '$2y$12$Jeo9fB7BmJgXWXjZNJgxMuEmak6xJDxhO2NQkvPN7BwP/X1CWhQ3.', NULL, NULL),
(20, 3, 'RM Asap', 'user/rm asap.jpg', 'rmasap@gmail.com', '$2y$12$yeHAYDqLn5zTEll/2HAoUeoECPOztdlYrdNtPLBK7y5nd1M7RSrU6', NULL, NULL),
(21, 3, 'Hijab Store', 'user/hijab store.jpg', 'hijabstore@gmail.com', '$2y$12$5qryfFEZ.JEsUwPQwwM.xeuLyI31WZXqDq5C.THORaFq4qQJF4PCq', NULL, NULL),
(22, 3, 'Ayy Shop', 'user/ayy shop.jpg', 'ayyshop@gmail.com', '$2y$12$uF19h.etESdqXhdwWNQ.b.knjthphYTX99UTkQz9nHz2feH51Q1zC', NULL, NULL),
(23, 3, 'Barira Butik', 'user/barira butik.jpg', 'barirabutik@gmail.com', '$2y$12$Jo35.YXPhOX/9RX5I1Yc9.wc25GT1W7suQ.L4x8tKQxvgUhYDwbOC', NULL, NULL),
(24, 3, 'Bahira Store', 'user/bahira store.jpg', 'bahirastore@gmail.com', '$2y$12$TF7JtTLHOb6nPU2GnH66eOYd0rhjLKV46bIrV/o39SNKuDQBJtmyS', NULL, NULL),
(25, 2, 'Ila', NULL, 'bandukarmila@yahoo.com', '$2y$12$hltSQ/IeiTr2lGb1b54FxeUYCSSp1MWe1WJQrAvJnYdbAkAGErU1O', NULL, NULL),
(26, 2, 'Riska Novianty', NULL, 'riskanovianty95@gmail.com', '$2y$12$pUehoXmS48qmwiMpfUxAU.k/SONf9.0XsncnEP300Pvhls1YL4U6C', NULL, NULL),
(27, 2, 'Nurhidayanti', NULL, 'nurhidayanti98@gmail.com', '$2y$12$lu3nywJeD.tiWzRkvcMRzuzboyVlRB1K6a2jjvu8s4seFu0Ri/OlO', NULL, NULL),
(28, 2, 'Sarnita', NULL, 'sarnitaaprilia@gmail.com', '$2y$12$CC2s/wOTmiT5ZvZ9HtcFTOWG5jpAzsEzYjZTYeNNOoKbVeWAZvLNC', NULL, NULL),
(29, 2, 'Pasha Diza Putri', NULL, 'pashadiza@gmail.com', '$2y$12$iwGrf0Y.z09lKAOnuFHBPuBJdp4WWVLpzSLqm8xkX6Woj6Swuj9tm', NULL, NULL),
(30, 2, 'Risma Damayanti', NULL, 'rismadamayanti2912@gmail.com', '$2y$12$5w7Wvw2wPky41ijIYvCIvOGxMUWgs10PvQTCES3yw/C.JYwfKosri', NULL, NULL),
(31, 2, 'Renaldi', NULL, 'renaldi700302@gmail.com', '$2y$12$b6QhvDy7pCjsxtU/M4qmZOdnn04hqUJGB9Cxcb4W9YnpUODVyRT1m', NULL, NULL),
(32, 2, 'La ode muh. TaufiqQur\'Rahman O.T.', NULL, 'Kiong.y.143@gmail.com', '$2y$12$x5H7LprriVwvQAPGvr4gHuBw7sY0hAD15peqgI.jWZK7N2NiA7qcO', NULL, NULL),
(33, 2, 'Hajria', NULL, 'Haje@gmail.com', '$2y$12$LzXIsiWNEOjuhHdE6n2Fn.t0/W4egNWwx3CdmwGNAD2K3yJpgvbk2', NULL, NULL),
(34, 2, 'Ummyy', NULL, 'ummyyklsm14@gmail.com', '$2y$12$5v.hPijzbmxmogdSDR1ePufKV.jTPlQ8O3HYRP6eK3Tbu0RsrGKFC', NULL, NULL),
(35, 2, 'Arya Wibawa AR', NULL, 'aryawibawa352@gmail.com', '$2y$12$VkzYj/uMSuu8AdZCh9ARReTeihezJ5NVWbXF25NiTPYEDczVksL.C', NULL, NULL),
(36, 2, 'Ayudha Rahma Salam', NULL, 'ayudharahma02@gmail.com', '$2y$12$rnYu.bj7Bnugwsu5NWUAgOT9ynLhBAk92f3J8734VDumbGIkVb7HS', NULL, NULL),
(37, 2, 'Yasmin', NULL, 'yasminwildani234@gmail.com', '$2y$12$AqzL8Wa40Sy6n4LNgGL0dubLEEZfsqcH3b5ZKUraJMJy4ubaOTydO', NULL, NULL),
(38, 2, 'Nur sadilah', NULL, 'nursaadillah16@gmail.com', '$2y$12$h8Hetm4hJJyrfMEX6bkeOuSSt1d2iEH2OTnxWfuroU5nrj2PC6cNO', NULL, NULL),
(39, 2, 'Nurhandayani', NULL, 'nurhandayaniamir74@gmail.com', '$2y$12$kQA8GnfY9R2cv7i3eB.TZuvLfLyAbomn7dtNY1Z7y7S5m6VEhXAp2', NULL, NULL),
(40, 2, 'Alexander skevin frandito amantokan nasus', NULL, 'alexandernasus30@gmail.com', '$2y$12$pG5Q9nFRJcjqtTysV7qiEeaz7YlZqbBoAC2wuNJiCGNAfNRLxqNrS', NULL, NULL),
(41, 2, 'Fenny Utami', NULL, 'utamifenny3@gmail.com', '$2y$12$kH.DRXvZ6kiA4ofxWDdrku2eMzc5GJdlSE6bYvnxywyuzPOuajqdS', NULL, NULL),
(42, 2, 'Aqeela', NULL, 'caaqila7@gmail.com', '$2y$12$GmxIx6d22Qw8DrltN7x3h.J1SfnB66zEfWfxmVlvk7ozy989XX/.q', NULL, NULL),
(43, 2, 'Diaz ahza', NULL, 'Diazahza0305@gmail.com', '$2y$12$m864P94LKmJL1iED8SnLWeMKraGdHRJze3k25lpfhHUFzajZWR/Ty', NULL, NULL),
(44, 2, 'Whyn', NULL, 'herdiansyahwin5@gmail.com', '$2y$12$leiems7LMWwz5yY0yzeDmuQP3fNb9p7RKYPgv.g1oZyFqGwcibqwW', NULL, NULL),
(45, 2, 'Romie Thomas ningrat', NULL, 'Romie123@gmail.com', '$2y$12$6fH.OMhoZg8NCslApRZ35.4g1vSYlVSF11O5yWcBxU41Er4X6th1O', NULL, NULL),
(46, 2, 'Indo Kulau', NULL, 'indokulau0411@gmail.com', '$2y$12$MdiIjtUBfG45nOlcEhI9guZSzqpzwUPqIMkA199r8hfm2sd3Uzd06', NULL, NULL),
(47, 2, 'Vincent', NULL, 'vincent231@gmail.com', '$2y$12$L.ee7ZHv5EsZVXLieZotruxaf0C3lq4YlWvW2vRfXZd3bGg10ttam', NULL, NULL),
(48, 2, 'Muhammad Al-Musyafir Kasim', NULL, 'muh.almusyafir@gmail.com', '$2y$12$2d3VTVjm3q.qq2CdO2vMCOoXkfwpfeVRX0OcXiOueZRx8ocxyVilu', NULL, NULL),
(49, 2, 'Nur Atika Resky', NULL, 'nuratikatika2002@gmail.com', '$2y$12$Sfonm2ZTGW.jmzo5wHhopuHT9K4XZZSoYt31Qgx5Mkl/Tmf4YvznK', NULL, NULL),
(50, 2, 'Nurul Fadhilah Ashar', NULL, 'nurulfadhilahashar@gmail.com', '$2y$12$GTMP0jP3k44xX1Xq2256ZOVVNLo4ZtcxpfI7RdIu8cZOOY5LEzNuG', NULL, NULL);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
