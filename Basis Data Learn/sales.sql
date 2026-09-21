-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Sep 2026 pada 09.31
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
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` char(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `customer_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `phone`, `customer_address`) VALUES
('C0001', 'Chen Wei', '081200000001', 'Shanghai'),
('C0002', 'Li Mei', '081288889999', 'Shanghai'),
('C0003', 'Zhang Wei', '081200000003', 'Shenzhen'),
('C0004', 'Wang Fang', '081244445555', 'Shenzhen'),
('C0005', 'Liu Yang', '081200000005', 'Beijing'),
('C0006', 'Yang Jing', '081200000006', 'Hangzhou'),
('C0007', 'Zhao Jie', '081200000007', 'Wuhan'),
('C0008', 'Huang Xiu', '081200000008', 'Suzhou');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` char(5) NOT NULL,
  `customer_id` char(5) NOT NULL,
  `product_code` char(5) NOT NULL,
  `order_date` date NOT NULL,
  `qty` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `product_code`, `order_date`, `qty`) VALUES
('O0001', 'C0001', 'P0001', '2026-09-01', 2),
('O0002', 'C0002', 'P0002', '2026-09-02', 4),
('O0003', 'C0003', 'P0003', '2026-09-03', 3),
('O0004', 'C0004', 'P0004', '2026-09-04', 1),
('O0005', 'C0005', 'P0005', '2026-09-05', 2),
('O0006', 'C0006', 'P0006', '2026-09-06', 5),
('O0007', 'C0007', 'P0007', '2026-09-07', 2),
('O0008', 'C0008', 'P0008', '2026-09-08', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_code` char(5) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_code`, `product_name`, `price`, `stock`) VALUES
('P0001', 'Laptop IdeaPad 3', 8200000, 15),
('P0002', 'Cooling Stand Fan', 240000, 30),
('P0003', 'Mechanical Keyboard', 750000, 15),
('P0004', 'Wireless Mouse', 150000, 75),
('P0005', 'Monitor 24 Inch', 1950000, 10),
('P0006', 'Flashdisk 64GB', 80000, 100),
('P0007', 'SSD 512GB NVMe', 600000, 25),
('P0008', 'RAM 8GB DDR4', 400000, 40);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_code` (`product_code`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_code`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
