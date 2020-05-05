-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2020 at 01:44 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `Admin_id` int(11) NOT NULL,
  `Admin_name` varchar(50) NOT NULL,
  `Admin_username` varchar(20) NOT NULL,
  `Admin_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`Admin_id`, `Admin_name`, `Admin_username`, `Admin_password`) VALUES
(1, 'Amasha Daphnie', 'Amasha', 'Amasha123'),
(2, 'Maleesha Gunathilake', 'Maleesha', 'Mal123'),
(3, 'Anolie Kumarasinghe', 'Anolie', 'Oshi123'),
(4, 'Minoli Isurika', 'Minoli', 'Minoli123'),
(5, 'Nethmini Umayangana', 'Sanju', 'Sanju123');

-- --------------------------------------------------------

--
-- Table structure for table `log_in`
--

CREATE TABLE `log_in` (
  `login_id` int(10) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Password` binary(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_in`
--

INSERT INTO `log_in` (`login_id`, `Username`, `Password`) VALUES
(1, 'Amasha Daphnie', 0x416d617368613132330000000000000000000000),
(2, 'Maleesha Gunathilake', 0x4d616c3132330000000000000000000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `patientdetails`
--

CREATE TABLE `patientdetails` (
  `Patient_id` int(11) NOT NULL,
  `Patient_name` varchar(50) NOT NULL,
  `Patient_username` varchar(20) NOT NULL,
  `Patient_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientdetails`
--

INSERT INTO `patientdetails` (`Patient_id`, `Patient_name`, `Patient_username`, `Patient_password`) VALUES
(1, 'Maleesha Perera', 'Maleesha', 'Mal123'),
(2, 'Amasha Daphnie', 'Amasha', 'Ama123'),
(3, 'Oshini Anolie', 'Anolie', 'Ano123');

-- --------------------------------------------------------

--
-- Table structure for table `pay_form`
--

CREATE TABLE `pay_form` (
  `pay_id` int(11) NOT NULL,
  `Card_holder` varchar(50) DEFAULT NULL,
  `Card_number` int(50) NOT NULL,
  `CVV` int(3) NOT NULL,
  `Date` varchar(20) NOT NULL,
  `Total_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pay_form`
--

INSERT INTO `pay_form` (`pay_id`, `Card_holder`, `Card_number`, `CVV`, `Date`, `Total_amount`) VALUES
(66, 'W.P.+Angela+Fernando', 44509235, 93, '2021-08', 4500),
(68, 'S.M.+Basuru', 33887121, 321, '2023-07', 5000),
(70, 'S.M.+Basuru', 33887121, 321, '2024-04', 5000),
(72, 'W. P. N. A. Demian', 33887665, 877, '09/24', 2900),
(73, 'W. P. N. A. Daphnie', 33887665, 877, '09/24', 2900),
(74, 'ccvc', 11342444, 123, '12/34', 13223),
(75, 'Amasha', 112345675, 111, '09%2F29', 12344),
(77, 'Makeesh Gunathilake', 111234566, 112, '08/21', 1200),
(78, 'degfdgfdsdfg', 1111111, 111, '11/11', 1111),
(79, 'Daphnie 123', 1144566, 332, '09/25', 1000),
(80, 'Daphnie 123', 1144566, 332, '09/25', 1000),
(81, 'Daphnie 123', 1144566, 332, '09/25', 1000),
(82, 'Daphnie 123', 1144566, 332, '09/25', 1000),
(96, 'Daphnie', 111111111, 111, '2020-05', 1111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `log_in`
--
ALTER TABLE `log_in`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `patientdetails`
--
ALTER TABLE `patientdetails`
  ADD PRIMARY KEY (`Patient_id`);

--
-- Indexes for table `pay_form`
--
ALTER TABLE `pay_form`
  ADD PRIMARY KEY (`pay_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_in`
--
ALTER TABLE `log_in`
  MODIFY `login_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patientdetails`
--
ALTER TABLE `patientdetails`
  MODIFY `Patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pay_form`
--
ALTER TABLE `pay_form`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
