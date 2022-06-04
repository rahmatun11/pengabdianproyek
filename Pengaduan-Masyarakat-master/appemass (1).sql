-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2022 pada 15.52
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appemass`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pengaduan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `komentar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `masyarakat`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `masyarakat` (
`id` bigint(20) unsigned
,`nik` char(16)
,`telp` char(12)
,`name` varchar(191)
,`email` varchar(191)
,`password` varchar(191)
,`level` enum('admin','petugas','masyarakat')
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_05_123021_create_pengaduan_table', 2),
(5, '2020_04_06_113825_create_komentar_table', 3),
(6, '2020_04_07_104252_create_pengumuman_table', 4),
(7, '2022_05_25_172340_create_tentangdesa_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_laporan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balasan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('verified','proses','selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `cover`, `nik`, `nama`, `isi_laporan`, `foto`, `judul`, `kategori`, `balasan`, `status`, `id_petugas`, `created_at`, `updated_at`) VALUES
(29, '1652525440_.jpg', '3217380048792479', 'Karina', '<p>ini jalannya rusak nichhh</p>', '1653127571_.png', 'jalan rusak', 'Sembako', '', 'selesai', 13, '2022-05-21 03:06:11', '2022-05-21 03:09:29'),
(31, '1652525440_.jpg', '3217380048792479', 'Karina', '<p>sadsahdashbb xsajbvdsa dhdbhbaw</p>', '1653128943_.png', 'sadhgavds', 'Administrasi Kependudukan', 'sadasdsadads', 'selesai', 12, '2022-05-21 03:29:03', '2022-05-25 08:42:09'),
(32, '1652525440_.jpg', '3217380048792479', 'Karina', '<p>ini pengaduan</p>', '1653365524_.png', 'pengaduan', 'Kepegawaian', NULL, 'selesai', 13, '2022-05-23 21:12:04', '2022-05-26 02:20:31'),
(33, '1652525440_.jpg', '3217380048792479', 'Karina', '<p>hgdfjkgkkghf</p>', '1653977691_.png', 'pengaduan', 'Administrasi Kependudukan', 'sedang diproses', 'proses', 13, '2022-05-30 23:14:51', '2022-05-30 23:15:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `nama`, `level`, `isi`, `judul`, `created_at`, `updated_at`) VALUES
(3, 'Imam Firmansyah', 'admin', '<p>Verifikasi Laporan ketika anda mengirim laporan pada aplikasi pedora, jadi laporan yang anda kirim tidak langsung akan di munculkan di beranda orang lain, harus melalui verifikasi selama maximal 3 hari peninjauan.</p>', 'Apa itu Verifikasi Laporan?', '2020-04-10 12:47:37', '2020-04-10 12:47:37'),
(4, 'Karina', 'admin', '<p>ini appemas yeye yaya</p>', 'appemas', '2022-05-25 08:31:09', '2022-05-25 08:31:09'),
(5, 'Karina', 'admin', '<p>lelea adalah sebuah desa di kabupaten indramayu</p>', 'lelea', '2022-05-25 10:45:20', '2022-05-25 10:45:20'),
(6, 'Karina', 'admin', '<p>hvjvj</p>', 'p', '2022-05-25 10:47:16', '2022-05-25 10:47:16');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tanggapan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tanggapan` (
`id` bigint(20) unsigned
,`nik` varchar(191)
,`nama` varchar(191)
,`judul` varchar(191)
,`isi_laporan` text
,`kategori` varchar(32)
,`status` enum('verified','proses','selesai')
,`name` varchar(191)
,`level` enum('admin','petugas','masyarakat')
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tentangdesa`
--

CREATE TABLE `tentangdesa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tentangdesa`
--

INSERT INTO `tentangdesa` (`id`, `nama`, `level`, `isi`, `judul`, `created_at`, `updated_at`) VALUES
(1, 'Karina', 'admin', '<p>aksjdbkasdkadks</p>', 'ahsdjasd', '2022-05-25 11:06:15', '2022-05-25 11:06:15'),
(2, 'Karina', 'admin', '<p>lelea adalah sebuah desa di indramayu</p>', 'lelea', '2022-05-25 11:22:42', '2022-05-25 11:22:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `foto` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','petugas','masyarakat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `foto`, `nik`, `telp`, `name`, `email`, `email_verified_at`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, '1586339122_.png', '3201251409760071', '08817211099', 'Karina', 'admin@admin.com', NULL, '$2y$10$wZSHIFIVJ52kAJs3K0Zu1uZwiOq1r.H193kEG0IZecZn1qBYkDMkW', 'admin', NULL, '2020-04-06 23:48:21', '2022-05-17 00:17:48'),
(13, 'avatar.png', NULL, NULL, 'Rahmatun', 'petugas@gmail.com', NULL, '$2y$10$wZSHIFIVJ52kAJs3K0Zu1uZwiOq1r.H193kEG0IZecZn1qBYkDMkW', 'petugas', NULL, '2020-04-06 17:00:00', '2022-05-17 00:17:17'),
(15, '1652525440_.jpg', '3217380048792479', '089607076440', 'Karina', 'karina@gmail.com', NULL, '$2y$10$7.iO8BHb4cLTeAKkZ2h/quCKT50E9RiOO0RDuux5rpOUidd9HJ.eS', 'masyarakat', NULL, '2022-05-14 03:49:22', '2022-05-14 03:50:40'),
(16, 'avatar.png', NULL, NULL, 'faishal shalas', 'faishal@gmail.com', NULL, '$2y$10$AH1N5oyDC2W.i3SDwtXgqO.nHZ.uI4IX34LeDFcJGypABBKmq1xyS', 'petugas', NULL, '2022-05-25 07:26:40', '2022-05-25 07:26:40'),
(17, 'avatar.png', NULL, NULL, 'Naufal Faiq', 'naufal@gmail.com', NULL, '$2y$10$eFH8qIxHWE4xm645vh2yWOpdoMjsxUT5WidGbNHMpkxSYBWjXxRZO', 'petugas', NULL, '2022-05-25 07:27:34', '2022-05-25 07:27:34');

-- --------------------------------------------------------

--
-- Struktur untuk view `masyarakat`
--
DROP TABLE IF EXISTS `masyarakat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `masyarakat`  AS  select `users`.`id` AS `id`,`users`.`nik` AS `nik`,`users`.`telp` AS `telp`,`users`.`name` AS `name`,`users`.`email` AS `email`,`users`.`password` AS `password`,`users`.`level` AS `level`,`users`.`created_at` AS `created_at` from `users` where `users`.`level` = 'masyarakat' ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tanggapan`
--
DROP TABLE IF EXISTS `tanggapan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tanggapan`  AS  select `pengaduan`.`id` AS `id`,`pengaduan`.`nik` AS `nik`,`pengaduan`.`nama` AS `nama`,`pengaduan`.`judul` AS `judul`,`pengaduan`.`isi_laporan` AS `isi_laporan`,`pengaduan`.`kategori` AS `kategori`,`pengaduan`.`status` AS `status`,`users`.`name` AS `name`,`users`.`level` AS `level` from (`pengaduan` join `users`) where `pengaduan`.`id_petugas` = `users`.`id` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tentangdesa`
--
ALTER TABLE `tentangdesa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tentangdesa`
--
ALTER TABLE `tentangdesa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
