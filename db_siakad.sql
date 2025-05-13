/*
 Navicat Premium Data Transfer

 Source Server         : my_local
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : db_siakad

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 13/05/2025 11:33:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absensi_siswa
-- ----------------------------
DROP TABLE IF EXISTS `absensi_siswa`;
CREATE TABLE `absensi_siswa`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `kehadiran_id` bigint UNSIGNED NOT NULL,
  `mapel_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `absensi_siswa_siswa_id_foreign`(`siswa_id` ASC) USING BTREE,
  INDEX `absensi_siswa_kehadiran_id_foreign`(`kehadiran_id` ASC) USING BTREE,
  INDEX `absensi_siswa_mapel_id_foreign`(`mapel_id` ASC) USING BTREE,
  CONSTRAINT `absensi_siswa_kehadiran_id_foreign` FOREIGN KEY (`kehadiran_id`) REFERENCES `kehadiran` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `absensi_siswa_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `absensi_siswa_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absensi_siswa
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for guru
-- ----------------------------
DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_card` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama_guru` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapel_id` int NOT NULL,
  `kode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guru
-- ----------------------------
INSERT INTO `guru` VALUES (1, '00001', '123456789', 'Asmawati, S.Pd', 3, 'MAT', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/12082326012025_gambaruser.png', '2025-01-26 23:08:12', '2025-01-26 23:08:12', NULL);
INSERT INTO `guru` VALUES (2, '00002', '123456789', 'Khairunnisa, S.Pd', 1, 'BHI', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/57082326012025_gambaruser.png', '2025-01-26 23:08:57', '2025-01-26 23:08:57', NULL);
INSERT INTO `guru` VALUES (3, '00003', '123456789', 'Suhaima,S.Pd', 8, 'IPS', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/35132326012025_gambaruser.png', '2025-01-26 23:13:35', '2025-01-26 23:13:35', NULL);
INSERT INTO `guru` VALUES (4, '00004', '32423423432', 'Nikmatuzsohrah, S.Pd.I', 7, 'IPA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/05142326012025_gambaruser.png', '2025-01-26 23:14:05', '2025-01-26 23:14:05', NULL);
INSERT INTO `guru` VALUES (5, '00005', '32423423432', 'Syamsiya wahyuni, S.Pd.I', 9, 'SJI', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/45142326012025_gambaruser.png', '2025-01-26 23:14:45', '2025-01-26 23:42:23', NULL);
INSERT INTO `guru` VALUES (6, '00006', '32423423432', 'Abdul gani, S. Pd. I', 10, 'SBK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/31152326012025_gambaruser.png', '2025-01-26 23:15:31', '2025-01-26 23:15:31', NULL);
INSERT INTO `guru` VALUES (7, '00007', '32423423432', 'Mujianah, S. Pd. I', 11, 'PIA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/11162326012025_gambaruser.png', '2025-01-26 23:16:11', '2025-01-26 23:16:11', NULL);
INSERT INTO `guru` VALUES (8, '00008', '32423423432', 'Agus kurniawan, S. Ag', 12, 'QH', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/52162326012025_gambaruser.png', '2025-01-26 23:16:52', '2025-01-26 23:16:52', NULL);
INSERT INTO `guru` VALUES (9, '00009', '32423423432', 'Sarita Bonita, S. Pd. I', 13, 'BA', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/13161608022025_guru mts.png', '2025-01-26 23:17:25', '2025-04-20 15:31:02', '2025-04-20 15:31:02');
INSERT INTO `guru` VALUES (10, '00010', '32423423432', 'Adekayanti, S. Pd', 5, 'PKN', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/03182326012025_gambaruser.png', '2025-01-26 23:18:03', '2025-01-26 23:18:03', NULL);
INSERT INTO `guru` VALUES (11, '00011', '32423423432', 'Sukarman, S. Pd', 2, 'BI', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/10352326012025_gambaruser.png', '2025-01-26 23:35:10', '2025-01-26 23:35:10', NULL);
INSERT INTO `guru` VALUES (12, '00012', '32423423432', 'Indra gunawan', 14, 'TIK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/52352326012025_gambaruser.png', '2025-01-26 23:35:52', '2025-01-26 23:35:52', NULL);
INSERT INTO `guru` VALUES (13, '00013', '32423423432', 'Syamsul Bahri, S. E', 15, 'PJK', 'L', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/28362326012025_gambaruser.png', '2025-01-26 23:36:28', '2025-01-26 23:36:28', NULL);
INSERT INTO `guru` VALUES (14, '00014', '32423423432', 'Guru BK', 6, 'BK', 'P', '08934029', 'Sumbawa', '2024-12-29', 'uploads/guru/05512326012025_gambaruser.png', '2025-01-26 23:51:05', '2025-01-26 23:51:05', NULL);

-- ----------------------------
-- Table structure for hari
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_hari` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hari
-- ----------------------------
INSERT INTO `hari` VALUES (1, 'Senin', '2025-01-16 23:08:34', NULL);
INSERT INTO `hari` VALUES (2, 'Selasa', '2025-01-16 23:08:38', NULL);
INSERT INTO `hari` VALUES (3, 'Rabu', '2025-01-16 23:08:40', NULL);
INSERT INTO `hari` VALUES (4, 'Kamis', '2025-01-16 23:08:42', NULL);
INSERT INTO `hari` VALUES (5, 'Jumat', '2025-01-16 23:08:44', NULL);
INSERT INTO `hari` VALUES (6, 'Sabtu', '2025-01-16 23:08:48', NULL);

-- ----------------------------
-- Table structure for jadwal
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `hari_id` int NOT NULL,
  `kelas_id` int NOT NULL,
  `mapel_id` int NOT NULL,
  `guru_id` int NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruang_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal
-- ----------------------------
INSERT INTO `jadwal` VALUES (1, 1, 1, 6, 14, '08:00:00', '08:30:00', 1, '2025-05-13 09:20:33', '2025-05-13 09:20:33', NULL);
INSERT INTO `jadwal` VALUES (2, 1, 1, 13, 9, '09:00:00', '09:30:00', 1, '2025-05-13 09:32:37', '2025-05-13 09:32:37', NULL);

-- ----------------------------
-- Table structure for kehadiran
-- ----------------------------
DROP TABLE IF EXISTS `kehadiran`;
CREATE TABLE `kehadiran`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ket` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kehadiran
-- ----------------------------
INSERT INTO `kehadiran` VALUES (1, 'Hadir', '3C0', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `kehadiran` VALUES (2, 'Izin', '0CF', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `kehadiran` VALUES (3, 'Bertugas Keluar', 'F90', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `kehadiran` VALUES (4, 'Sakit', 'FF0', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `kehadiran` VALUES (5, 'Terlambat', '7F0', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `kehadiran` VALUES (6, 'Tanpa Keterangan', 'F00', '2024-11-20 13:28:04', '2024-11-20 13:28:04');

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` int NOT NULL,
  `guru_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (1, 'KELAS VII A', 9, 1, '2025-01-26 23:39:44', '2025-05-13 09:44:21', NULL);
INSERT INTO `kelas` VALUES (2, 'KELAS VII B', 9, 2, '2025-01-26 23:40:04', '2025-05-13 08:58:20', NULL);
INSERT INTO `kelas` VALUES (3, 'KELAS VII C', 9, 3, '2025-01-26 23:40:19', '2025-05-13 08:58:29', NULL);
INSERT INTO `kelas` VALUES (4, 'KELAS VIII A', 9, 4, '2025-01-26 23:42:59', '2025-05-13 09:44:44', NULL);
INSERT INTO `kelas` VALUES (5, 'KELAS VIII B', 9, 5, '2025-01-26 23:43:13', '2025-05-13 08:58:51', NULL);
INSERT INTO `kelas` VALUES (6, 'KELAS VIII C', 9, 6, '2025-01-26 23:43:29', '2025-05-13 08:59:01', NULL);
INSERT INTO `kelas` VALUES (19, 'KELAS IX A', 9, 7, '2025-03-17 11:01:39', '2025-05-13 08:59:15', NULL);
INSERT INTO `kelas` VALUES (20, 'KELAS IX B', 9, 8, '2025-03-17 11:02:40', '2025-05-13 08:59:26', NULL);
INSERT INTO `kelas` VALUES (21, 'KELAS IX C', 9, 9, '2025-05-13 08:01:36', '2025-05-13 08:59:39', NULL);

-- ----------------------------
-- Table structure for mapel
-- ----------------------------
DROP TABLE IF EXISTS `mapel`;
CREATE TABLE `mapel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_mapel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paket_id` int NOT NULL,
  `kelompok` enum('A','B','C') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mapel
-- ----------------------------
INSERT INTO `mapel` VALUES (1, 'Bahasa Indonesia', 9, 'A', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL);
INSERT INTO `mapel` VALUES (2, 'Bahasa Inggris', 9, 'A', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL);
INSERT INTO `mapel` VALUES (3, 'Matematika', 9, 'A', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL);
INSERT INTO `mapel` VALUES (4, 'Pendidikan Agama dan Budi Pekerti', 9, 'A', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL);
INSERT INTO `mapel` VALUES (5, 'Pendidikan Pancasila dan Kewarganegaraan', 9, 'A', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL);
INSERT INTO `mapel` VALUES (6, 'Nilai Sikap', 9, 'A', '2025-01-14 15:09:43', '2025-01-14 15:10:17', NULL);
INSERT INTO `mapel` VALUES (7, 'Ilmu Pengetahuan Alam', 9, 'A', '2025-01-14 15:18:36', '2025-01-14 15:18:36', NULL);
INSERT INTO `mapel` VALUES (8, 'Ilmu Pengetahuan Sosial', 9, 'A', '2025-01-26 23:09:45', '2025-01-26 23:09:45', NULL);
INSERT INTO `mapel` VALUES (9, 'Sejarah Kebudayaan Islam', 9, 'A', '2025-01-26 23:10:07', '2025-01-26 23:10:07', NULL);
INSERT INTO `mapel` VALUES (10, 'Seni Budaya', 9, 'A', '2025-01-26 23:10:17', '2025-01-26 23:10:17', NULL);
INSERT INTO `mapel` VALUES (11, 'Praktek ibadah & Akidah akhlak', 9, 'A', '2025-01-26 23:10:29', '2025-01-26 23:10:29', NULL);
INSERT INTO `mapel` VALUES (12, 'Qur\'an hadist', 9, 'A', '2025-01-26 23:10:39', '2025-01-26 23:10:39', NULL);
INSERT INTO `mapel` VALUES (13, 'Bahasa Arab', 9, 'A', '2025-01-26 23:11:05', '2025-01-26 23:11:05', NULL);
INSERT INTO `mapel` VALUES (14, 'TIK', 9, 'A', '2025-01-26 23:11:21', '2025-01-26 23:11:21', NULL);
INSERT INTO `mapel` VALUES (15, 'Penjaskes', 9, 'A', '2025-01-26 23:11:32', '2025-01-26 23:11:32', NULL);

-- ----------------------------
-- Table structure for materi_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `materi_pelajaran`;
CREATE TABLE `materi_pelajaran`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_materi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mapel` bigint UNSIGNED NOT NULL,
  `id_kelas` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `materi_pelajaran_id_mapel_foreign`(`id_mapel` ASC) USING BTREE,
  INDEX `materi_pelajaran_id_kelas_foreign`(`id_kelas` ASC) USING BTREE,
  CONSTRAINT `materi_pelajaran_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `materi_pelajaran_id_mapel_foreign` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of materi_pelajaran
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_03_12_092809_create_hari_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_03_12_092854_create_guru_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_03_12_092926_create_absensi_guru_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_03_12_092941_create_jadwal_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_03_12_092953_create_kehadiran_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_03_12_093010_create_kelas_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_03_12_093018_create_mapel_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_03_12_093027_create_nilai_table', 1);
INSERT INTO `migrations` VALUES (12, '2020_03_12_093036_create_paket_table', 1);
INSERT INTO `migrations` VALUES (13, '2020_03_12_093050_create_pengumuman_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_03_12_093102_create_rapot_table', 1);
INSERT INTO `migrations` VALUES (15, '2020_03_12_093117_create_ruang_table', 1);
INSERT INTO `migrations` VALUES (16, '2020_03_12_093130_create_siswa_table', 1);
INSERT INTO `migrations` VALUES (17, '2020_03_16_102220_create_ulangan_table', 1);
INSERT INTO `migrations` VALUES (18, '2020_04_07_094355_create_sikap_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_12_10_012840_create_profile_sekolah_table', 2);
INSERT INTO `migrations` VALUES (20, '2024_12_10_013305_create_profile_sekolah_table', 3);
INSERT INTO `migrations` VALUES (21, '2024_12_14_001436_create_tahun_pelajaran_table', 4);
INSERT INTO `migrations` VALUES (22, '2024_12_14_014535_create_tugas_kelas_table', 5);
INSERT INTO `migrations` VALUES (23, '2024_12_14_110508_create_materi_pelajaran_table', 6);
INSERT INTO `migrations` VALUES (24, '2024_12_14_111111_create_materi_pelajaran_table', 7);
INSERT INTO `migrations` VALUES (25, '2024_12_15_191651_create_absensi_siswa', 8);
INSERT INTO `migrations` VALUES (26, '2025_01_12_095637_create_absensi_siswa_new', 9);
INSERT INTO `migrations` VALUES (27, '2025_01_13_141530_create_wali_kelas_table', 10);

-- ----------------------------
-- Table structure for nilai
-- ----------------------------
DROP TABLE IF EXISTS `nilai`;
CREATE TABLE `nilai`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `guru_id` int NOT NULL,
  `kkm` int NOT NULL DEFAULT 70,
  `deskripsi_a` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deskripsi_b` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deskripsi_c` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deskripsi_d` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nilai
-- ----------------------------
INSERT INTO `nilai` VALUES (1, 1, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:08:12', '2025-01-26 23:08:12');
INSERT INTO `nilai` VALUES (2, 2, 70, '100', '95', '80', '75', '2025-01-26 23:08:57', '2025-02-09 14:48:17');
INSERT INTO `nilai` VALUES (3, 3, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:13:35', '2025-01-26 23:13:35');
INSERT INTO `nilai` VALUES (4, 4, 70, '100', '95', '80', '75', '2025-01-26 23:14:05', '2025-02-08 17:25:23');
INSERT INTO `nilai` VALUES (5, 5, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:14:45', '2025-01-26 23:14:45');
INSERT INTO `nilai` VALUES (6, 6, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:15:31', '2025-01-26 23:15:31');
INSERT INTO `nilai` VALUES (7, 7, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:16:11', '2025-01-26 23:16:11');
INSERT INTO `nilai` VALUES (8, 8, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:16:52', '2025-01-26 23:16:52');
INSERT INTO `nilai` VALUES (9, 9, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:17:25', '2025-01-26 23:17:25');
INSERT INTO `nilai` VALUES (10, 10, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:18:03', '2025-01-26 23:18:03');
INSERT INTO `nilai` VALUES (11, 11, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:35:10', '2025-01-26 23:35:10');
INSERT INTO `nilai` VALUES (12, 12, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:35:52', '2025-01-26 23:35:52');
INSERT INTO `nilai` VALUES (13, 13, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:36:28', '2025-01-26 23:36:28');
INSERT INTO `nilai` VALUES (14, 14, 70, NULL, NULL, NULL, NULL, '2025-01-26 23:51:05', '2025-01-26 23:51:05');
INSERT INTO `nilai` VALUES (15, 15, 70, NULL, NULL, NULL, NULL, '2025-02-21 22:49:37', '2025-02-21 22:49:37');

-- ----------------------------
-- Table structure for paket
-- ----------------------------
DROP TABLE IF EXISTS `paket`;
CREATE TABLE `paket`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ket` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paket
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for pengumuman
-- ----------------------------
DROP TABLE IF EXISTS `pengumuman`;
CREATE TABLE `pengumuman`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `opsi` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengumuman
-- ----------------------------
INSERT INTO `pengumuman` VALUES (1, 'pengumuman', 'pengumuman', '2024-11-20 13:28:04', '2024-11-20 13:28:04');

-- ----------------------------
-- Table structure for profile_sekolah
-- ----------------------------
DROP TABLE IF EXISTS `profile_sekolah`;
CREATE TABLE `profile_sekolah`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nsm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `npsm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `akreditasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `penjelasan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile_sekolah
-- ----------------------------

-- ----------------------------
-- Table structure for rapot
-- ----------------------------
DROP TABLE IF EXISTS `rapot`;
CREATE TABLE `rapot`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_id` int NOT NULL,
  `kelas_id` int NOT NULL,
  `guru_id` int NOT NULL,
  `mapel_id` int NOT NULL,
  `p_nilai` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_predikat` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_nilai` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `k_predikat` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `k_deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rapot
-- ----------------------------
INSERT INTO `rapot` VALUES (1, 1, 1, 4, 7, '86', 'B', '95', '90', 'B', '95', '2025-02-08 17:25:57', '2025-02-08 17:27:08');

-- ----------------------------
-- Table structure for ruang
-- ----------------------------
DROP TABLE IF EXISTS `ruang`;
CREATE TABLE `ruang`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ruang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ruang
-- ----------------------------
INSERT INTO `ruang` VALUES (1, 'Ruang VII A', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (2, 'Ruang VII B', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (3, 'Ruang VII C', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (4, 'Ruang VIII A', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (5, 'Ruang VIII B', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (6, 'Ruang VIII C', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (7, 'Ruang IX A', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (8, 'Ruang IX B', '2024-11-20 13:28:04', '2024-11-20 13:28:04');
INSERT INTO `ruang` VALUES (9, 'Ruang IX C', '2024-11-20 13:28:04', '2024-11-20 13:28:04');

-- ----------------------------
-- Table structure for sikap
-- ----------------------------
DROP TABLE IF EXISTS `sikap`;
CREATE TABLE `sikap`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_id` int NOT NULL,
  `kelas_id` int NOT NULL,
  `guru_id` int NOT NULL,
  `mapel_id` int NOT NULL,
  `sikap_1` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sikap_2` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sikap_3` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sikap
-- ----------------------------

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `no_induk` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama_siswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tmp_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES (52, '90970001', NULL, 'Desi Marlina', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 19, '2025-05-13 10:23:20', '2025-05-13 10:23:20', NULL);
INSERT INTO `siswa` VALUES (53, '90970002', NULL, 'Indah Permatasari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 19, '2025-05-13 10:23:20', '2025-05-13 10:23:20', NULL);
INSERT INTO `siswa` VALUES (54, '90970003', NULL, 'Nurlaila', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 19, '2025-05-13 10:23:20', '2025-05-13 10:23:20', NULL);
INSERT INTO `siswa` VALUES (55, '90970004', NULL, 'Rina Oktaviani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 19, '2025-05-13 10:23:20', '2025-05-13 10:23:20', NULL);
INSERT INTO `siswa` VALUES (56, '90970005', NULL, 'Sulastri Adekayanti', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 19, '2025-05-13 10:23:20', '2025-05-13 10:23:20', NULL);
INSERT INTO `siswa` VALUES (57, '90980001', NULL, 'Maya Sari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 20, '2025-05-13 10:25:48', '2025-05-13 10:25:48', NULL);
INSERT INTO `siswa` VALUES (58, '90980002', NULL, 'Nia Lestari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 20, '2025-05-13 10:25:48', '2025-05-13 10:25:48', NULL);
INSERT INTO `siswa` VALUES (59, '90980003', NULL, 'Rika Amelia', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 20, '2025-05-13 10:25:48', '2025-05-13 10:25:48', NULL);
INSERT INTO `siswa` VALUES (60, '90980004', NULL, 'Eka Putri', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 20, '2025-05-13 10:25:48', '2025-05-13 10:25:48', NULL);
INSERT INTO `siswa` VALUES (61, '90980005', NULL, 'Intan Ayu Dewina', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 20, '2025-05-13 10:25:48', '2025-05-13 10:25:48', NULL);
INSERT INTO `siswa` VALUES (62, '90990001', NULL, 'Ayu Safitri', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 21, '2025-05-13 10:26:09', '2025-05-13 10:26:09', NULL);
INSERT INTO `siswa` VALUES (63, '90990002', NULL, 'Melati Handayani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 21, '2025-05-13 10:26:09', '2025-05-13 10:26:09', NULL);
INSERT INTO `siswa` VALUES (64, '90990003', NULL, 'Dewi Sartika', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 21, '2025-05-13 10:26:09', '2025-05-13 10:26:09', NULL);
INSERT INTO `siswa` VALUES (65, '90990004', NULL, 'Fatimah Azzahra', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 21, '2025-05-13 10:26:09', '2025-05-13 10:26:09', NULL);
INSERT INTO `siswa` VALUES (66, '90990005', NULL, 'Nurhasanah', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 21, '2025-05-13 10:26:09', '2025-05-13 10:26:09', NULL);
INSERT INTO `siswa` VALUES (67, '80840001', NULL, 'Qistina Zahra', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (68, '80840002', NULL, 'Rina Susanti', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (69, '80840003', NULL, 'Siti Rohmah', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (70, '80840004', NULL, 'Tania Wulandari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (71, '80840005', NULL, 'Vania Lestari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 4, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (72, '80850001', NULL, 'Winda Safitri', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (73, '80850002', NULL, 'Saviera Pratiwi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (74, '80850003', NULL, 'Yuni Rahayu', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (75, '80850004', NULL, 'Zahra Maulida', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (76, '80850005', NULL, 'Anisa Fitriani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 5, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (77, '80860001', NULL, 'Rani Pratiwi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (78, '80860002', NULL, 'Nurul Hidayah', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (79, '80860003', NULL, 'Fitriani Dewi', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (80, '80860004', NULL, 'Rahmawati', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (81, '80860005', NULL, 'Lilis Suryani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 6, '2025-05-13 10:28:46', '2025-05-13 10:28:46', NULL);
INSERT INTO `siswa` VALUES (82, '70710001', NULL, 'Aisyah Putri', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (83, '70710002', NULL, 'Citra Mutmainnah', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (84, '70710003', NULL, 'Cahaya Nuraini', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (85, '70710004', NULL, 'Dian Maharani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (86, '70710005', NULL, 'Fitri Handayani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 1, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (87, '70720001', NULL, 'Eka Sari', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (88, '70720002', NULL, 'Gita Puspita', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (89, '70720003', NULL, 'Halimah Salsabila', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (90, '70720004', NULL, 'Indah Pertama', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (91, '70720005', NULL, 'Jihan Amelia', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 2, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (92, '70730001', NULL, 'Lestari Ayu', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (93, '70730002', NULL, 'Meylani Rizkita', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (94, '70730003', NULL, 'Nadira Shafira', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (95, '70730004', NULL, 'Olivia Maharani', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);
INSERT INTO `siswa` VALUES (96, '70730005', NULL, 'Putri Amalia', 'P', NULL, NULL, NULL, NULL, 'uploads/siswa/50271431012020_female.jpg', 3, '2025-05-13 10:31:19', '2025-05-13 10:31:19', NULL);

-- ----------------------------
-- Table structure for tahun_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahun_pelajaran`;
CREATE TABLE `tahun_pelajaran`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tahun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepala_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_rapor` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tahun_pelajaran
-- ----------------------------
INSERT INTO `tahun_pelajaran` VALUES (1, '2024/2025', '1', 'Genap', 'Ahmad Robbiul Iman S.Kom', '2024-12-14', '2024-12-14 02:39:43', '2025-03-13 23:44:54');

-- ----------------------------
-- Table structure for tugas_kelas
-- ----------------------------
DROP TABLE IF EXISTS `tugas_kelas`;
CREATE TABLE `tugas_kelas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_soal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mapel` int NOT NULL,
  `waktu_awal` datetime NOT NULL,
  `waktu_akhir` datetime NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tugas_kelas
-- ----------------------------

-- ----------------------------
-- Table structure for ulangan
-- ----------------------------
DROP TABLE IF EXISTS `ulangan`;
CREATE TABLE `ulangan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siswa_id` int NOT NULL,
  `kelas_id` int NOT NULL,
  `guru_id` int NOT NULL,
  `mapel_id` int NOT NULL,
  `ulha_1` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ulha_2` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uts` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ulha_3` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uas` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ulangan
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Guru','Siswa','Operator') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_induk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_walikelas` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Admin', NULL, NULL, '8ssb93IXTg1fKs2CSFHsjuYj24u103kbSycB0E9DTwEBj3EqBdZ2LywvxSRn', '2024-11-20 13:28:04', '2024-11-20 13:28:04', NULL, NULL);
INSERT INTO `users` VALUES (29, 'Asmawati, S.Pd', 'asmawati@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00001', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (30, 'Khairunnisa, S.Pd', 'khairunnisa@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00002', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (31, 'Suhaima,S.Pd', 'suhaima,s.pd@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00003', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (32, 'Nikmatuzsohrah, S.Pd.I', 'nikmatuzsohrah@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00004', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (33, 'Syamsiya wahyuni, S.Pd.I', 'syamsiya@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00005', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (34, 'Abdul gani, S. Pd. I', 'abdul@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00006', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (35, 'Mujianah, S. Pd. I', 'mujianah,@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00007', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (36, 'Agus kurniawan, S. Ag', 'agus@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00008', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (37, 'Sarita Bonita, S. Pd. I', 'sarita@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00009', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 1);
INSERT INTO `users` VALUES (38, 'Adekayanti, S. Pd', 'adekayanti@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00010', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 0);
INSERT INTO `users` VALUES (39, 'Sukarman, S. Pd', 'sukarman,@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00011', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 0);
INSERT INTO `users` VALUES (40, 'Indra gunawan', 'indra@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00012', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 0);
INSERT INTO `users` VALUES (41, 'Syamsul Bahri, S. E', 'syamsul@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00013', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 0);
INSERT INTO `users` VALUES (42, 'Guru BK', 'guru@siakad.ac.id', NULL, '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', 'Guru', NULL, '00014', NULL, '2025-05-13 09:45:22', '2025-05-13 09:45:22', NULL, 0);

-- ----------------------------
-- Table structure for wali_kelas
-- ----------------------------
DROP TABLE IF EXISTS `wali_kelas`;
CREATE TABLE `wali_kelas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `guru_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wali_kelas_guru_id_foreign`(`guru_id` ASC) USING BTREE,
  INDEX `wali_kelas_kelas_id_foreign`(`kelas_id` ASC) USING BTREE,
  CONSTRAINT `wali_kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wali_kelas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wali_kelas
-- ----------------------------
INSERT INTO `wali_kelas` VALUES (1, 1, 1, '2025-05-13 09:44:21', '2025-05-13 09:44:21');
INSERT INTO `wali_kelas` VALUES (2, 2, 2, '2025-05-13 09:44:28', '2025-05-13 09:44:28');
INSERT INTO `wali_kelas` VALUES (3, 3, 3, '2025-05-13 09:44:36', '2025-05-13 09:44:36');
INSERT INTO `wali_kelas` VALUES (4, 4, 4, '2025-05-13 09:44:44', '2025-05-13 09:44:44');
INSERT INTO `wali_kelas` VALUES (5, 5, 5, '2025-05-13 09:44:53', '2025-05-13 09:44:53');
INSERT INTO `wali_kelas` VALUES (6, 6, 6, '2025-05-13 09:45:01', '2025-05-13 09:45:01');
INSERT INTO `wali_kelas` VALUES (7, 7, 19, '2025-05-13 09:45:08', '2025-05-13 09:45:08');
INSERT INTO `wali_kelas` VALUES (8, 8, 20, '2025-05-13 09:45:23', '2025-05-13 09:45:23');
INSERT INTO `wali_kelas` VALUES (9, 9, 21, '2025-05-13 09:45:32', '2025-05-13 09:45:32');

-- ----------------------------
-- Triggers structure for table wali_kelas
-- ----------------------------
DROP TRIGGER IF EXISTS `set_is_walikelas_to_1`;
delimiter ;;
CREATE TRIGGER `set_is_walikelas_to_1` AFTER INSERT ON `wali_kelas` FOR EACH ROW BEGIN
  UPDATE users
  SET is_walikelas = 1
  WHERE id_card = (
    SELECT id_card FROM guru WHERE id = NEW.guru_id
  );
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table wali_kelas
-- ----------------------------
DROP TRIGGER IF EXISTS `reset_is_walikelas_to_0`;
delimiter ;;
CREATE TRIGGER `reset_is_walikelas_to_0` AFTER DELETE ON `wali_kelas` FOR EACH ROW BEGIN
  DECLARE count_wali INT;
  
  SELECT COUNT(*) INTO count_wali
  FROM wali_kelas
  WHERE guru_id = OLD.guru_id;

  IF count_wali = 0 THEN
    UPDATE users
    SET is_walikelas = 0
    WHERE id_card = (
      SELECT id_card
      FROM guru
      WHERE guru.id = OLD.guru_id
      LIMIT 1
    );
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
