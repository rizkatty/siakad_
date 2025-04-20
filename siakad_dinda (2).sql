-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 04.30
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad_dinda`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi_guru`
--

CREATE TABLE `absensi_guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kehadiran_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi_siswa`
--

CREATE TABLE `absensi_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `kehadiran_id` bigint(20) UNSIGNED NOT NULL,
  `mapel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absensi_siswa`
--

INSERT INTO `absensi_siswa` (`id`, `tanggal`, `siswa_id`, `kehadiran_id`, `mapel_id`, `created_at`, `updated_at`) VALUES
(1, '2025-02-08', 1, 1, 7, '2025-02-08 09:27:55', '2025-02-08 09:27:55'),
(2, '2025-02-09', 1, 1, 7, '2025-02-09 06:54:49', '2025-02-09 06:54:49'),
(3, '2025-02-24', 7, 1, 4, '2025-02-24 03:51:09', '2025-02-24 03:51:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_card` varchar(10) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `kode` varchar(5) DEFAULT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `id_card`, `nip`, `nama_guru`, `mapel_id`, `kode`, `jk`, `telp`, `tmp_lahir`, `tgl_lahir`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '00001', '123456789', 'Asmawati, S.Pd', 3, 'MAT', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/12082326012025_gambaruser.png', '2025-01-26 15:08:12', '2025-01-26 15:08:12', NULL),
(2, '00002', '123456789', 'Asmawati, S.Pd', 1, 'BHI', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/57082326012025_gambaruser.png', '2025-01-26 15:08:57', '2025-01-26 15:08:57', NULL),
(3, '00003', '123456789', 'Suhaima,S.Pd', 8, 'IPS', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/35132326012025_gambaruser.png', '2025-01-26 15:13:35', '2025-01-26 15:13:35', NULL),
(4, '00004', '32423423432', 'Nikmatuzsohrah, S.Pd.I', 7, 'IPA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/05142326012025_gambaruser.png', '2025-01-26 15:14:05', '2025-01-26 15:14:05', NULL),
(5, '00005', '32423423432', 'Syamsiya wahyuni, S.Pd.I', 9, 'SJI', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/45142326012025_gambaruser.png', '2025-01-26 15:14:45', '2025-01-26 15:42:23', NULL),
(6, '00006', '32423423432', 'Abdul gani, S. Pd. I', 10, 'SBK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/31152326012025_gambaruser.png', '2025-01-26 15:15:31', '2025-01-26 15:15:31', NULL),
(7, '00007', '32423423432', 'Mujianah, S. Pd. I', 11, 'PIA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/11162326012025_gambaruser.png', '2025-01-26 15:16:11', '2025-01-26 15:16:11', NULL),
(8, '00008', '32423423432', 'Agus kurniawan, S. Ag', 12, 'QH', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/52162326012025_gambaruser.png', '2025-01-26 15:16:52', '2025-01-26 15:16:52', NULL),
(9, '00009', '32423423432', 'Sarita Bonita, S. Pd. I', 13, 'BA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/13161608022025_guru mts.png', '2025-01-26 15:17:25', '2025-02-08 08:16:13', NULL),
(10, '00010', '32423423432', 'Adekayanti, S. Pd', 5, 'PKN', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/03182326012025_gambaruser.png', '2025-01-26 15:18:03', '2025-01-26 15:18:03', NULL),
(11, '00011', '32423423432', 'Sukarman, S. Pd', 2, 'BI', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/10352326012025_gambaruser.png', '2025-01-26 15:35:10', '2025-01-26 15:35:10', NULL),
(12, '00012', '32423423432', 'Indra gunawan', 14, 'TIK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/52352326012025_gambaruser.png', '2025-01-26 15:35:52', '2025-01-26 15:35:52', NULL),
(13, '00013', '32423423432', 'Syamsul Bahri, S. E', 15, 'PJK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/28362326012025_gambaruser.png', '2025-01-26 15:36:28', '2025-01-26 15:36:28', NULL),
(14, '00014', '32423423432', 'Guru BK', 6, 'BK', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/05512326012025_gambaruser.png', '2025-01-26 15:51:05', '2025-01-26 15:51:05', NULL),
(15, '00015', '32423423439', 'Firmansyah,S.Pd', 4, 'PAI', 'L', '085737227689', 'Sumbawa', '1975-08-16', 'uploads/guru/37492221022025_2024_08_16_02_31_IMG_0311.HEIC', '2025-02-21 14:49:37', '2025-02-21 14:49:37', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_hari` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id`, `nama_hari`, `created_at`, `updated_at`) VALUES
(1, 'Senin', '2025-01-16 15:08:34', NULL),
(2, 'Selasa', '2025-01-16 15:08:38', NULL),
(3, 'Rabu', '2025-01-16 15:08:40', NULL),
(4, 'Kamis', '2025-01-16 15:08:42', NULL),
(5, 'Jumat', '2025-01-16 15:08:44', NULL),
(6, 'Sabtu', '2025-01-16 15:08:48', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hari_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `hari_id`, `kelas_id`, `mapel_id`, `guru_id`, `jam_mulai`, `jam_selesai`, `ruang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 1, 13, 9, '07:00:00', '09:00:00', 1, '2025-01-26 15:52:17', '2025-03-07 04:52:00', NULL),
(6, 1, 1, 2, 11, '09:00:00', '10:30:00', 1, '2025-01-26 15:52:54', '2025-03-07 04:52:28', NULL),
(7, 2, 1, 7, 4, '07:00:00', '09:00:00', 1, '2025-01-26 15:53:18', '2025-03-07 05:16:37', NULL),
(8, 1, 7, 6, 14, '07:30:00', '16:00:00', 7, '2025-01-26 15:53:50', '2025-03-07 04:24:26', '2025-03-07 04:24:26'),
(9, 2, 8, 6, 14, '07:30:00', '16:00:00', 8, '2025-01-26 15:54:12', '2025-03-07 04:24:34', '2025-03-07 04:24:34'),
(10, 3, 9, 6, 14, '07:30:00', '16:00:00', 9, '2025-01-26 15:54:38', '2025-03-07 04:24:41', '2025-03-07 04:24:41'),
(11, 1, 7, 4, 15, '07:30:00', '11:40:00', 2, '2025-02-21 14:54:07', '2025-03-07 04:24:28', '2025-03-07 04:24:28'),
(12, 4, 1, 4, 15, '07:30:00', '12:00:00', 8, '2025-03-07 04:23:33', '2025-03-07 04:25:43', '2025-03-07 04:25:43'),
(13, 2, 1, 4, 15, '09:00:00', '10:30:00', 1, '2025-03-07 04:30:39', '2025-03-07 05:18:15', NULL),
(14, 3, 1, 1, 2, '07:30:00', '10:00:00', 1, '2025-03-07 04:31:32', '2025-03-07 04:31:32', NULL),
(15, 3, 1, 8, 3, '10:30:00', '12:00:00', 1, '2025-03-07 04:32:06', '2025-03-07 04:32:06', NULL),
(16, 4, 1, 3, 1, '07:30:00', '10:00:00', 1, '2025-03-07 04:32:54', '2025-03-07 04:32:54', NULL),
(17, 4, 1, 11, 7, '10:30:00', '12:00:00', 1, '2025-03-07 04:33:38', '2025-03-07 04:33:55', '2025-03-07 04:33:55'),
(18, 4, 1, 12, 8, '10:30:00', '12:00:00', 1, '2025-03-07 04:35:54', '2025-03-07 04:35:54', NULL),
(19, 5, 1, 11, 7, '07:00:00', '09:00:00', 1, '2025-03-07 04:36:58', '2025-03-07 04:38:41', NULL),
(20, 6, 1, 10, 6, '07:00:00', '09:00:00', 1, '2025-03-07 04:42:40', '2025-03-07 04:48:28', NULL),
(21, 5, 1, 15, 13, '09:15:00', '10:30:00', 1, '2025-03-07 04:43:47', '2025-03-07 04:43:47', NULL),
(22, 6, 1, 9, 5, '09:00:00', '10:30:00', 1, '2025-03-07 04:46:16', '2025-03-07 05:05:11', '2025-03-07 05:05:11'),
(23, 6, 1, 14, 12, '10:30:00', '12:30:00', 1, '2025-03-07 04:47:44', '2025-03-07 05:04:45', '2025-03-07 05:04:45'),
(24, 1, 1, 9, 5, '10:30:00', '12:30:00', 1, '2025-03-07 05:05:48', '2025-03-07 05:05:48', NULL),
(25, 6, 1, 14, 12, '09:00:00', '10:30:00', 1, '2025-03-07 05:06:26', '2025-03-07 05:06:26', NULL),
(26, 6, 1, 6, 14, '10:30:00', '12:30:00', 1, '2025-03-07 05:06:55', '2025-03-07 05:06:55', NULL),
(27, 2, 1, 1, 2, '10:30:00', '12:30:00', 1, '2025-03-07 05:19:46', '2025-03-07 05:19:46', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ket` varchar(30) NOT NULL,
  `color` varchar(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kehadiran`
--

INSERT INTO `kehadiran` (`id`, `ket`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Hadir', '3C0', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(2, 'Izin', '0CF', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(3, 'Bertugas Keluar', 'F90', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(4, 'Sakit', 'FF0', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(5, 'Terlambat', '7F0', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(6, 'Tanpa Keterangan', 'F00', '2024-11-20 05:28:04', '2024-11-20 05:28:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `paket_id`, `guru_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KELAS VII A', 9, 3, '2025-01-26 15:39:44', '2025-01-26 15:39:44', NULL),
(2, 'KELAS VII B', 9, 10, '2025-01-26 15:40:04', '2025-01-26 15:40:04', NULL),
(3, 'KELAS VII C', 9, 1, '2025-01-26 15:40:19', '2025-02-21 14:39:42', NULL),
(4, 'KELAS VIII A', 9, 5, '2025-01-26 15:42:59', '2025-01-26 15:42:59', NULL),
(5, 'KELAS VIII B', 9, 6, '2025-01-26 15:43:13', '2025-01-26 15:43:13', NULL),
(6, 'KELAS VIII C', 9, 4, '2025-01-26 15:43:29', '2025-01-26 15:43:29', NULL),
(7, 'KELAS IX A', 9, 9, '2025-01-26 15:43:57', '2025-03-07 06:14:49', '2025-03-07 06:14:49'),
(8, 'KELAS IX B', 9, 11, '2025-01-26 15:44:23', '2025-03-07 06:14:51', '2025-03-07 06:14:51'),
(9, 'KELAS IX C', 9, 13, '2025-01-26 15:44:44', '2025-03-07 06:14:53', '2025-03-07 06:14:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_mapel` varchar(50) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `kelompok` enum('A','B','C') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id`, `nama_mapel`, `paket_id`, `kelompok`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bahasa Indonesia', 9, 'A', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(2, 'Bahasa Inggris', 9, 'A', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(3, 'Matematika', 9, 'A', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(4, 'Pendidikan Agama dan Budi Pekerti', 9, 'A', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(5, 'Pendidikan Pancasila dan Kewarganegaraan', 9, 'A', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(6, 'Nilai Sikap', 9, 'A', '2025-01-14 07:09:43', '2025-01-14 07:10:17', NULL),
(7, 'Ilmu Pengetahuan Alam', 9, 'A', '2025-01-14 07:18:36', '2025-01-14 07:18:36', NULL),
(8, 'Ilmu Pengetahuan Sosial', 9, 'A', '2025-01-26 15:09:45', '2025-01-26 15:09:45', NULL),
(9, 'Sejarah Kebudayaan Islam', 9, 'A', '2025-01-26 15:10:07', '2025-01-26 15:10:07', NULL),
(10, 'Seni Budaya', 9, 'A', '2025-01-26 15:10:17', '2025-01-26 15:10:17', NULL),
(11, 'Praktek ibadah & Akidah akhlak', 9, 'A', '2025-01-26 15:10:29', '2025-01-26 15:10:29', NULL),
(12, 'Qur\'an hadist', 9, 'A', '2025-01-26 15:10:39', '2025-01-26 15:10:39', NULL),
(13, 'Bahasa Arab', 9, 'A', '2025-01-26 15:11:05', '2025-01-26 15:11:05', NULL),
(14, 'TIK', 9, 'A', '2025-01-26 15:11:21', '2025-01-26 15:11:21', NULL),
(15, 'Penjaskes', 9, 'A', '2025-01-26 15:11:32', '2025-01-26 15:11:32', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi_pelajaran`
--

CREATE TABLE `materi_pelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `file_materi` varchar(255) NOT NULL,
  `id_mapel` bigint(20) UNSIGNED NOT NULL,
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `materi_pelajaran`
--

INSERT INTO `materi_pelajaran` (`id`, `judul`, `file_materi`, `id_mapel`, `id_kelas`, `created_at`, `updated_at`) VALUES
(1, 'Listening', 'uploads/file_materi/WerZxU396oWcBanzCDSd29xwRFfbbbZLEBSzrFuD.pdf', 2, 1, '2025-02-08 09:34:04', '2025-02-08 09:34:04'),
(2, 'meching laerning', 'uploads/file_materi/20JkXNKMlOnUB99xTymAj3ZXo0SSFzXhwFsIiZ43.pdf', 3, 1, '2025-02-24 03:47:16', '2025-02-24 03:47:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_03_12_092809_create_hari_table', 1),
(5, '2020_03_12_092854_create_guru_table', 1),
(6, '2020_03_12_092926_create_absensi_guru_table', 1),
(7, '2020_03_12_092941_create_jadwal_table', 1),
(8, '2020_03_12_092953_create_kehadiran_table', 1),
(9, '2020_03_12_093010_create_kelas_table', 1),
(10, '2020_03_12_093018_create_mapel_table', 1),
(11, '2020_03_12_093027_create_nilai_table', 1),
(12, '2020_03_12_093036_create_paket_table', 1),
(13, '2020_03_12_093050_create_pengumuman_table', 1),
(14, '2020_03_12_093102_create_rapot_table', 1),
(15, '2020_03_12_093117_create_ruang_table', 1),
(16, '2020_03_12_093130_create_siswa_table', 1),
(17, '2020_03_16_102220_create_ulangan_table', 1),
(18, '2020_04_07_094355_create_sikap_table', 1),
(19, '2024_12_10_012840_create_profile_sekolah_table', 2),
(20, '2024_12_10_013305_create_profile_sekolah_table', 3),
(21, '2024_12_14_001436_create_tahun_pelajaran_table', 4),
(22, '2024_12_14_014535_create_tugas_kelas_table', 5),
(23, '2024_12_14_110508_create_materi_pelajaran_table', 6),
(24, '2024_12_14_111111_create_materi_pelajaran_table', 7),
(25, '2024_12_15_191651_create_absensi_siswa', 8),
(26, '2025_01_12_095637_create_absensi_siswa_new', 9),
(27, '2025_01_13_141530_create_wali_kelas_table', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kkm` int(11) NOT NULL DEFAULT 70,
  `deskripsi_a` text DEFAULT NULL,
  `deskripsi_b` text DEFAULT NULL,
  `deskripsi_c` text DEFAULT NULL,
  `deskripsi_d` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `guru_id`, `kkm`, `deskripsi_a`, `deskripsi_b`, `deskripsi_c`, `deskripsi_d`, `created_at`, `updated_at`) VALUES
(1, 1, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:08:12', '2025-01-26 15:08:12'),
(2, 2, 70, '100', '95', '80', '75', '2025-01-26 15:08:57', '2025-02-09 06:48:17'),
(3, 3, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:13:35', '2025-01-26 15:13:35'),
(4, 4, 70, '100', '95', '80', '75', '2025-01-26 15:14:05', '2025-02-08 09:25:23'),
(5, 5, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:14:45', '2025-01-26 15:14:45'),
(6, 6, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:15:31', '2025-01-26 15:15:31'),
(7, 7, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:16:11', '2025-01-26 15:16:11'),
(8, 8, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:16:52', '2025-01-26 15:16:52'),
(9, 9, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:17:25', '2025-01-26 15:17:25'),
(10, 10, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:18:03', '2025-01-26 15:18:03'),
(11, 11, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:35:10', '2025-01-26 15:35:10'),
(12, 12, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:35:52', '2025-01-26 15:35:52'),
(13, 13, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:36:28', '2025-01-26 15:36:28'),
(14, 14, 70, NULL, NULL, NULL, NULL, '2025-01-26 15:51:05', '2025-01-26 15:51:05'),
(15, 15, 70, NULL, NULL, NULL, NULL, '2025-02-21 14:49:37', '2025-02-21 14:49:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ket` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opsi` varchar(32) NOT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `opsi`, `isi`, `created_at`, `updated_at`) VALUES
(1, 'pengumuman', 'pengumuman', '2024-11-20 05:28:04', '2024-11-20 05:28:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile_sekolah`
--

CREATE TABLE `profile_sekolah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `kontak` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nsm` varchar(255) NOT NULL,
  `npsm` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `akreditasi` varchar(255) NOT NULL,
  `kabupaten_kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `penjelasan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rapot`
--

CREATE TABLE `rapot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `p_nilai` varchar(5) NOT NULL,
  `p_predikat` varchar(5) NOT NULL,
  `p_deskripsi` text NOT NULL,
  `k_nilai` varchar(5) DEFAULT NULL,
  `k_predikat` varchar(5) DEFAULT NULL,
  `k_deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rapot`
--

INSERT INTO `rapot` (`id`, `siswa_id`, `kelas_id`, `guru_id`, `mapel_id`, `p_nilai`, `p_predikat`, `p_deskripsi`, `k_nilai`, `k_predikat`, `k_deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 7, '86', 'B', '95', '90', 'B', '95', '2025-02-08 09:25:57', '2025-02-08 09:27:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ruang` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`id`, `nama_ruang`, `created_at`, `updated_at`) VALUES
(1, 'Ruang VII A', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(2, 'Ruang VII B', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(3, 'Ruang VII C', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(4, 'Ruang VIII A', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(5, 'Ruang VIII B', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(6, 'Ruang VIII C', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(7, 'Ruang IX A', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(8, 'Ruang IX B', '2024-11-20 05:28:04', '2024-11-20 05:28:04'),
(9, 'Ruang IX C', '2024-11-20 05:28:04', '2024-11-20 05:28:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sikap`
--

CREATE TABLE `sikap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `sikap_1` varchar(5) DEFAULT NULL,
  `sikap_2` varchar(5) DEFAULT NULL,
  `sikap_3` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_induk` varchar(30) NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(15) DEFAULT NULL,
  `tmp_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `no_induk`, `nis`, `nama_siswa`, `jk`, `telp`, `tmp_lahir`, `tgl_lahir`, `alamat`, `foto`, `kelas_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'NIS0001', '2401001', 'Ahmad Fauzi', 'L', '082340613574', 'Sumbawa', '2013-03-12', 'Dusun Stowe Berang RT 03 RW 09 Kecamatan Moyo Hilir', 'uploads/siswa/52471919042020_male.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 06:10:06', '2025-03-07 06:10:06'),
(2, 'NIS0002', NULL, 'Budi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:18', '2025-03-07 05:56:18'),
(3, 'NIS0003', NULL, 'Citra', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:37', '2025-03-07 05:56:37'),
(4, 'NIS0004', NULL, 'Dian', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:56:54', '2025-03-07 05:56:54'),
(5, 'NIS0005', NULL, 'Eka', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:24', '2025-03-07 05:57:24'),
(6, 'NIS0006', NULL, 'Fajar', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 6, '2025-01-26 16:15:15', '2025-03-07 05:57:40', '2025-03-07 05:57:40'),
(7, 'NIS0007', '2201001', 'Citra Anggraini', 'P', '085737227689', 'Sumbawa', '2011-02-21', 'Jln.Bay Pass sering atas RT 03 RW 09 Desa kerato kecamatan unter iwes', 'uploads/siswa/03181608022025_Pas Foto Latar Merah.jpg', 7, '2025-01-26 16:15:15', '2025-03-07 05:54:57', '2025-03-07 05:54:57'),
(8, 'NIS0008', NULL, 'Hendra', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 8, '2025-01-26 16:15:15', '2025-03-07 05:55:51', '2025-03-07 05:55:51'),
(9, 'NIS0009', NULL, 'Indah', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 9, '2025-01-26 16:15:15', '2025-03-07 05:56:05', '2025-03-07 05:56:05'),
(10, 'NIS0010', NULL, 'Joko', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 05:38:46', '2025-03-07 05:38:46'),
(11, 'NIS0011', NULL, 'Kirana', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:21', '2025-03-07 05:56:21'),
(12, 'NIS0012', NULL, 'Lukman', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:40', '2025-03-07 05:56:40'),
(13, 'NIS0013', NULL, 'Maya', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:56:57', '2025-03-07 05:56:57'),
(14, 'NIS0014', NULL, 'Nina', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:27', '2025-03-07 05:57:27'),
(15, 'NIS0015', NULL, 'Omar', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-01-26 16:15:15', '2025-03-07 05:57:43', '2025-03-07 05:57:43'),
(16, 'NIS0016', NULL, 'Putri', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 7, '2025-01-26 16:15:15', '2025-03-07 05:44:05', '2025-03-07 05:44:05'),
(17, 'NIS0017', NULL, 'Qori', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 8, '2025-01-26 16:15:15', '2025-03-07 05:55:54', '2025-03-07 05:55:54'),
(18, 'NIS0018', NULL, 'Rama', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 9, '2025-01-26 16:15:15', '2025-03-07 05:56:08', '2025-03-07 05:56:08'),
(19, 'NIS0019', NULL, 'Siti', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 05:38:49', '2025-03-07 05:38:49'),
(20, 'NIS0020', NULL, 'Teguh', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:24', '2025-03-07 05:56:24'),
(21, 'NIS0021', NULL, 'Umi', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:43', '2025-03-07 05:56:43'),
(22, 'NIS0022', NULL, 'Vina', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:57:00', '2025-03-07 05:57:00'),
(23, 'NIS0023', NULL, 'Wawan', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:31', '2025-03-07 05:57:31'),
(24, 'NIS0024', NULL, 'Yulia', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-01-26 16:15:15', '2025-03-07 05:57:49', '2025-03-07 05:57:49'),
(25, 'NIS0025', NULL, 'Zaki', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 7, '2025-01-26 16:15:15', '2025-03-07 05:43:56', '2025-03-07 05:43:56'),
(26, 'NIS0026', NULL, 'Ayu', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 8, '2025-01-26 16:15:15', '2025-03-07 05:55:49', '2025-03-07 05:55:49'),
(27, 'NIS0027', NULL, 'Bayu', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 9, '2025-01-26 16:15:15', '2025-03-07 05:56:03', '2025-03-07 05:56:03'),
(28, 'NIS0028', NULL, 'Cahya', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 05:38:44', '2025-03-07 05:38:44'),
(29, 'NIS0029', NULL, 'Dewi', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:20', '2025-03-07 05:56:20'),
(30, 'NIS0030', NULL, 'Evan', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:39', '2025-03-07 05:56:39'),
(31, 'NIS0031', NULL, 'Farah', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:56:55', '2025-03-07 05:56:55'),
(32, 'NIS0032', NULL, 'Galih', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:26', '2025-03-07 05:57:26'),
(33, 'NIS0033', NULL, 'Hani', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 6, '2025-01-26 16:15:15', '2025-03-07 05:57:42', '2025-03-07 05:57:42'),
(34, 'NIS0034', NULL, 'Ivan', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 7, '2025-01-26 16:15:15', '2025-03-07 05:44:03', '2025-03-07 05:44:03'),
(35, 'NIS0035', NULL, 'Juli', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 8, '2025-01-26 16:15:15', '2025-03-07 05:55:52', '2025-03-07 05:55:52'),
(36, 'NIS0036', NULL, 'Kiki', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 9, '2025-01-26 16:15:15', '2025-03-07 05:56:06', '2025-03-07 05:56:06'),
(37, 'NIS0037', NULL, 'Laila', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 05:38:47', '2025-03-07 05:38:47'),
(38, 'NIS0038', NULL, 'Miko', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:23', '2025-03-07 05:56:23'),
(39, 'NIS0039', NULL, 'Novi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:42', '2025-03-07 05:56:42'),
(40, 'NIS0040', NULL, 'Ovi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:56:58', '2025-03-07 05:56:58'),
(41, 'NIS0041', NULL, 'Putu', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:29', '2025-03-07 05:57:29'),
(42, 'NIS0042', NULL, 'Qisya', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-01-26 16:15:15', '2025-03-07 05:57:45', '2025-03-07 05:57:45'),
(43, 'NIS0043', NULL, 'Rani', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 7, '2025-01-26 16:15:15', '2025-03-07 05:44:01', '2025-03-07 05:44:01'),
(44, 'NIS0044', NULL, 'Sandy', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 8, '2025-01-26 16:15:15', '2025-03-07 05:55:56', '2025-03-07 05:55:56'),
(45, 'NIS0045', NULL, 'Tia', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 9, '2025-01-26 16:15:15', '2025-03-07 05:56:09', '2025-03-07 05:56:09'),
(46, 'NIS0046', NULL, 'Ulfa', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 1, '2025-01-26 16:15:15', '2025-03-07 05:39:02', '2025-03-07 05:39:02'),
(47, 'NIS0047', NULL, 'Vita', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 2, '2025-01-26 16:15:15', '2025-03-07 05:56:26', '2025-03-07 05:56:26'),
(48, 'NIS0048', NULL, 'Wira', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 3, '2025-01-26 16:15:15', '2025-03-07 05:56:44', '2025-03-07 05:56:44'),
(49, 'NIS0049', NULL, 'Yanto', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-01-26 16:15:15', '2025-03-07 05:57:01', '2025-03-07 05:57:01'),
(50, 'NIS0050', NULL, 'Zahra', 'L', NULL, NULL, NULL, NULL, 'uploads/siswa/52471919042020_male.jpg', 5, '2025-01-26 16:15:15', '2025-03-07 05:57:33', '2025-03-07 05:57:33'),
(51, '240701', '70710001', 'Aisyah Putri', 'P', '081234567890', 'Sumbawa', '2013-01-12', 'Dusun Stowe Berang RT 03 RW 09 Kecamatan Moyo Hilir', 'uploads/siswa/50271431012020_female.jpg', 1, '2025-03-07 06:12:14', '2025-03-07 06:12:14', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_pelajaran`
--

CREATE TABLE `tahun_pelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `kepala_sekolah` varchar(255) NOT NULL,
  `tanggal_rapor` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tahun_pelajaran`
--

INSERT INTO `tahun_pelajaran` (`id`, `tahun`, `status`, `semester`, `kepala_sekolah`, `tanggal_rapor`, `created_at`, `updated_at`) VALUES
(1, '2024/2025', '1', 'Ganjil', 'M.Najamudin Syar\'i, M.Pd', '2024-12-14', '2024-12-13 18:39:43', '2024-12-13 18:39:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas_kelas`
--

CREATE TABLE `tugas_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `file_soal` varchar(255) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `waktu_awal` datetime NOT NULL,
  `waktu_akhir` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tugas_kelas`
--

INSERT INTO `tugas_kelas` (`id`, `judul`, `file_soal`, `id_mapel`, `waktu_awal`, `waktu_akhir`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sistem Pengukuran dalam Kerja Ilmiah', 'uploads/tugas_kelas/kEIowLGOSEzpBdewoTWLarS5Y17UzhgfyfRrk7qx.pdf', 7, '2025-02-08 18:31:00', '2025-02-09 18:31:00', 'aktif', '2025-02-08 09:32:08', '2025-02-08 09:32:08'),
(2, 'Sistem Pengukuran dalam Kerja Ilmiah', 'uploads/tugas_kelas/Ay4VaO548psqArRT9YKL8w284KTdcXvqVa6soTB0.pdf', 3, '2025-02-24 12:38:00', '2025-02-24 16:41:00', 'aktif', '2025-02-24 03:37:57', '2025-02-24 03:37:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulangan`
--

CREATE TABLE `ulangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `ulha_1` varchar(5) DEFAULT NULL,
  `ulha_2` varchar(5) DEFAULT NULL,
  `uts` varchar(5) DEFAULT NULL,
  `ulha_3` varchar(5) DEFAULT NULL,
  `uas` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ulangan`
--

INSERT INTO `ulangan` (`id`, `siswa_id`, `kelas_id`, `guru_id`, `mapel_id`, `ulha_1`, `ulha_2`, `uts`, `ulha_3`, `uas`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 7, '80', '75', '85', '90', '95', '2025-02-08 09:25:57', '2025-02-08 09:25:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Guru','Siswa','Operator') NOT NULL,
  `no_induk` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `no_induk`, `id_card`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$bcf1qHmMdOm6KUkWnPug2uFz9yhj0vYWFjUaDYpsSyAWZZj7lx4r2', 'Admin', NULL, NULL, 'zlU43CuIFLlJx0dKBRKIjFgHuYaS15cbho5WucgGnf0oy86CToWx9DGRwLQU', '2024-11-20 05:28:04', '2024-11-20 05:28:04', NULL),
(2, 'Guru', 'guru@gmail.com', NULL, '$2y$10$dbRvfwochMIDVSl4uHOXeOYjSeAA.KdwdHT6Y.SW4YDiLDphbW9le', 'Guru', '', '00004', 'b55yjb4KNVCqDxELP9EVRDF60znrDTZ3oAf4kKJc6vhseYy0ZxqZ6zaj50OY', '2025-01-26 16:16:46', '2025-02-06 02:45:47', NULL),
(21, 'Ahmad Fauzi', 'siswa@gmail.com', NULL, '$2y$10$hbpWQPIxknTe7YCwv959NOFDeXVjU5UV8wTEj/i0aD80iMuIHaEQW', 'Siswa', 'NIS0001', NULL, NULL, '2025-02-06 02:23:43', '2025-03-07 06:10:06', '2025-03-07 06:10:06'),
(22, 'Asmawati, S.Pd', 'walikelas@gmail.com', NULL, '$2y$10$eIHBwZeU0qXI3hVU0rdT6uWTwAyRNdyhVvfuQ8G8sR.Lp2ge37NM6', 'Guru', NULL, '00001', NULL, '2025-02-06 02:30:06', '2025-02-06 02:30:43', NULL),
(23, 'Guru BK', 'gurubk@gmail.com', NULL, '$2y$10$Ic6B8qrlzJlgjdtgbrGbLOdMssok0cpofHWSAG4Y8LfyvHP3eps1K', 'Guru', NULL, '00014', NULL, '2025-02-06 02:36:03', '2025-02-06 02:46:41', NULL),
(24, 'Firmansyah,S.Pd', 'guru1@gmail.com', NULL, '$2y$10$NJGYcIp1Zhbq3SAFSSVZhuvxCrZtB0Qy74l6kO5d0ndM04d4FeB3u', 'Guru', NULL, '00015', NULL, '2025-02-21 14:50:52', '2025-02-21 14:50:52', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` bigint(20) UNSIGNED NOT NULL,
  `kelas_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wali_kelas`
--

INSERT INTO `wali_kelas` (`id`, `guru_id`, `kelas_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2025-02-06 02:33:42', '2025-02-06 02:38:11'),
(2, 6, 2, '2025-02-08 07:39:57', '2025-02-08 07:39:57'),
(3, 1, 3, '2025-02-08 07:58:03', '2025-02-09 06:38:26'),
(4, 9, 4, '2025-02-08 08:12:52', '2025-02-08 08:12:52'),
(5, 10, 5, '2025-02-08 08:13:04', '2025-02-08 08:13:04'),
(6, 11, 6, '2025-02-08 08:13:20', '2025-02-08 08:13:20'),
(7, 7, 7, '2025-03-07 03:16:02', '2025-03-07 03:16:02'),
(8, 13, 8, '2025-03-07 03:16:31', '2025-03-07 03:16:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi_guru`
--
ALTER TABLE `absensi_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensi_siswa_siswa_id_foreign` (`siswa_id`),
  ADD KEY `absensi_siswa_kehadiran_id_foreign` (`kehadiran_id`),
  ADD KEY `absensi_siswa_mapel_id_foreign` (`mapel_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materi_pelajaran`
--
ALTER TABLE `materi_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materi_pelajaran_id_mapel_foreign` (`id_mapel`),
  ADD KEY `materi_pelajaran_id_kelas_foreign` (`id_kelas`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profile_sekolah`
--
ALTER TABLE `profile_sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rapot`
--
ALTER TABLE `rapot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sikap`
--
ALTER TABLE `sikap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tahun_pelajaran`
--
ALTER TABLE `tahun_pelajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tugas_kelas`
--
ALTER TABLE `tugas_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ulangan`
--
ALTER TABLE `ulangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wali_kelas_guru_id_foreign` (`guru_id`),
  ADD KEY `wali_kelas_kelas_id_foreign` (`kelas_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi_guru`
--
ALTER TABLE `absensi_guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `materi_pelajaran`
--
ALTER TABLE `materi_pelajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `profile_sekolah`
--
ALTER TABLE `profile_sekolah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rapot`
--
ALTER TABLE `rapot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `sikap`
--
ALTER TABLE `sikap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `tahun_pelajaran`
--
ALTER TABLE `tahun_pelajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tugas_kelas`
--
ALTER TABLE `tugas_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ulangan`
--
ALTER TABLE `ulangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  ADD CONSTRAINT `absensi_siswa_kehadiran_id_foreign` FOREIGN KEY (`kehadiran_id`) REFERENCES `kehadiran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absensi_siswa_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absensi_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `materi_pelajaran`
--
ALTER TABLE `materi_pelajaran`
  ADD CONSTRAINT `materi_pelajaran_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `materi_pelajaran_id_mapel_foreign` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD CONSTRAINT `wali_kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wali_kelas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

UPDATE guru SET deleted_at = NULL WHERE deleted_at IS NOT NULL;
UPDATE siswa SET deleted_at = NULL WHERE deleted_at IS NOT NULL;
UPDATE wali_kelas SET deleted_at = NULL WHERE deleted_at IS NOT NULL;

