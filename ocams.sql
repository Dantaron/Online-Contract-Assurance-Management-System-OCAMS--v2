-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 04:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ocams`
--

-- --------------------------------------------------------

--
-- Table structure for table `temporarly_hasrh`
--

CREATE TABLE `temporarly_hasrh` (
  `temp_hash_id` int(1) NOT NULL,
  `tempharshed` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temporarly_hasrh`
--

INSERT INTO `temporarly_hasrh` (`temp_hash_id`, `tempharshed`) VALUES
(1, '$2b$10$gAktIJvH'),
(2, '$2b$10$LEqMHHnj'),
(3, '$2b$10$zcGSvOyN'),
(4, '$2b$10$x/CjLOhj'),
(5, '$2b$10$odPHUcsZ'),
(6, '$2b$10$PcPYBMny'),
(7, '$2b$10$gNrvFdxO'),
(8, '$2b$10$JHB33qa6'),
(9, '$2b$10$HK77Waos');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_role` varchar(30) NOT NULL,
  `user_phone_number` varchar(20) DEFAULT NULL,
  `user_signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `user_email`, `user_password`, `user_gender`, `user_role`, `user_phone_number`, `user_signature`) VALUES
(2, 'admin', 'admin', 'admin@gmail.com', 'admin', 'male', 'admin', '0657475280', 'admin'),
(3, 'Danta', 'Roni', 'dantaron@gmail.com', '$2b$10$SpEnGS478UFJavzsFnvwi.6zoxABAny/SxDVc0c5UOufIOGNxFfQG', 'male', 'otheruser', '0694035297', '$2b$10$SpEnGS478UFJavzsFnvwi.6zoxABAny/SxDVc0c5UOufIOGNxFfQG'),
(4, 'mwaisa', 'Roni', 'mwa@gmail.com', '$2b$10$e5a3KRzvknYWvVrBJxrhIOPQ41UOtlU991tnWgT.e7/8/hyBBjM4a', 'male', 'otheruser', '0694030297', '$2b$10$e5a3KRzvknYWvVrBJxrhIOPQ41UOtlU991tnWgT.e7/8/hyBBjM4a'),
(9, 'Daniel', 'Ntambala', 'dani@gmail.com', '12345', 'male', 'otheruser', '0694035210', '$2b$10$O2Xkku4IukeC2SyIY0hx/usuREzRNxcQxQpL3Tx/Z5SFxrt/1RgN.'),
(10, 'Letcia', 'Rich', 'let@gmail.com', 'll', 'female', 'otheruser', '0674035250', '$2b$10$jhqlhiMOwQG93QLLFMrSUuQ1bt2bPha.87M9LmQGl1zzz5kDOjb1q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `temporarly_hasrh`
--
ALTER TABLE `temporarly_hasrh`
  ADD PRIMARY KEY (`temp_hash_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `temporarly_hasrh`
--
ALTER TABLE `temporarly_hasrh`
  MODIFY `temp_hash_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
