-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 11:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdailyjournal`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `judul` text DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `gambar` text DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `judul`, `isi`, `gambar`, `tanggal`, `username`) VALUES
(1, 'Upacara Bendera', 'Di sini tempat mengikuti upacara bendera, momen untuk menghormati bangsa dan mengingat perjuangan para pahlawan di UDINUS.', '20241205201318.jpg', '2024-12-05 20:26:47', 'admin'),
(2, 'Fakultas Kedokteran', 'Di sini tempat belajar dan berkembang sebagai calon tenaga medis di Fakultas Kedokteran UDINUS, mempersiapkan diri untuk memberikan pelayanan terbaik bagi masyarakat.', '20241205202711.jpg', '2024-12-05 20:27:11', 'admin'),
(3, 'Atlet Profesional', 'Di sini, saya berkesempatan bertemu dengan atlet sepak bola berbakat seperti Pratama Arhan di UDINUS, momen yang menginspirasi untuk terus berprestasi dan membanggakan bangsa.', '20241205202732.jpg', '2024-12-05 20:27:32', 'admin'),
(4, 'Prestasi Dan Penghargaan', 'Di sini momen penuh makna, saat penghargaan dan apresiasi diberikan sebagai wujud pengakuan atas prestasi dan dedikasi di lingkungan UDINUS.', '20241205202758.jpg', '2024-12-05 20:27:58', 'admin'),
(5, 'Penyerahan Jas Almamater Simbol Kebanggaan Mahasiswa Baru UDINUS', 'Di sini momen penuh makna, saat mahasiswa menerima jas almamater sebagai simbol resmi bergabungnya mereka ke keluarga besar UDINUS.', '20241205202823.jpg', '2024-12-05 20:28:23', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `gambar`, `tanggal`) VALUES
(0, '20250110171256.png', '2025-01-10 10:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `foto`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', ''),
(2, 'danny', '$2y$10$KZcoz6E2KBVMWpIhoBnIs.zbkwR5g6XGCQWdYninYhSurMzcgOohO', '20250110171702.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
