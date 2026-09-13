-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Sep 2026 pada 16.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `final_score`
--

CREATE TABLE `final_score` (
  `NPM` char(10) DEFAULT NULL,
  `task_score` int(3) DEFAULT NULL,
  `UTS_score` int(3) DEFAULT NULL,
  `subject_code` char(5) DEFAULT NULL,
  `lecturer_code` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lecturer`
--

CREATE TABLE `lecturer` (
  `lecturer_code` char(10) NOT NULL,
  `lecturer_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `lecturer_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `NPM` char(10) NOT NULL,
  `students_name` varchar(30) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') DEFAULT 'Male',
  `dept` varchar(20) NOT NULL,
  `student_add` varchar(30) NOT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subjects`
--

CREATE TABLE `subjects` (
  `subject_code` char(5) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  `semester` int(1) NOT NULL,
  `sks` int(1) NOT NULL,
  `dept` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `final_score`
--
ALTER TABLE `final_score`
  ADD KEY `NPM` (`NPM`),
  ADD KEY `subject_code` (`subject_code`),
  ADD KEY `lecturer_code` (`lecturer_code`);

--
-- Indeks untuk tabel `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`lecturer_code`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`NPM`);

--
-- Indeks untuk tabel `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_code`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `final_score`
--
ALTER TABLE `final_score`
  ADD CONSTRAINT `final_score_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `students` (`NPM`),
  ADD CONSTRAINT `final_score_ibfk_2` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`subject_code`),
  ADD CONSTRAINT `final_score_ibfk_3` FOREIGN KEY (`lecturer_code`) REFERENCES `lecturer` (`lecturer_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
