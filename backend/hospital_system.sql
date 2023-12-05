-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 12:37 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `building` varchar(255) NOT NULL,
  `floor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `building`, `floor`) VALUES
(1, 'Inpatient Service', 'Main', '2'),
(2, 'Medical Department', 'Block B', '1'),
(3, 'Nursing Department', 'Block B', '2'),
(4, 'Paramedical Department', 'Block B', '5'),
(5, 'Emergency', 'Block C', '7'),
(7, 'New', 'C', '2');

-- --------------------------------------------------------

--
-- Table structure for table `employees_info`
--

CREATE TABLE `employees_info` (
  `id` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  `date_joined` date NOT NULL,
  `position` varchar(255) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `phone_number`, `email`) VALUES
(1, 'Rafik EL Harriri', 'Jnah', '01830000', 'webmaster@bguh.gov.lb'),
(2, 'Saint Georges Hospital University', 'Achrafieh', '1287', 'PAR@stgeorgehospital.org'),
(3, 'Hopital Libanais Geatawi', 'Achrafieh', '01577477', 'info@hopital-libanais.com'),
(4, 'Clemenceau Medical Center', 'Clemenceau Street', '1240', 'info@cmc.com.lb'),
(6, 'Rasoul', 'Beirut', '123', 'rasoul.com');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_users`
--

CREATE TABLE `hospital_users` (
  `hospital_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hospital_users`
--

INSERT INTO `hospital_users` (`hospital_id`, `user_id`) VALUES
(1, 2),
(1, 2),
(1, 3),
(1, 2),
(2, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(2, 2),
(1, 2),
(1, 2),
(2, 2),
(3, 2),
(1, 2),
(1, 2),
(1, 2),
(2, 2),
(1, 2),
(1, 2),
(1, 3),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(1, 2),
(1, 3),
(1, 4),
(1, 2),
(2, 2),
(3, 2),
(3, 5),
(3, 4),
(3, 3),
(3, 7),
(4, 2),
(4, 7),
(4, 3),
(4, 4),
(4, 5),
(3, 2),
(3, 3),
(1, 2),
(1, 3),
(1, 3),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 3),
(1, 3),
(1, 3),
(1, 3),
(1, 3),
(1, 3),
(1, 3),
(1, 3),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 3),
(2, 2),
(2, 2),
(2, 3),
(2, 4),
(2, 2),
(2, 2),
(2, 3),
(2, 4),
(2, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(1, 2),
(4, 9),
(4, 9),
(3, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `date_issued` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients_info`
--

CREATE TABLE `patients_info` (
  `id` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `case` varchar(255) NOT NULL,
  `profile_pic` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` int(10) NOT NULL,
  `is_vip` tinyint(1) NOT NULL,
  `number_beds` int(2) NOT NULL,
  `floor_number` varchar(20) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `cost_day_usd` int(20) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `is_vip`, `number_beds`, `floor_number`, `phone_number`, `cost_day_usd`, `department_id`) VALUES
(1, 100, 0, 2, '3', '1234', 300, 1),
(2, 101, 0, 1, '2', '1254', 300, 2),
(3, 102, 0, 1, '4', '1245', 400, 3),
(5, 4, 0, 3, '7', '333', 270, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cost` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `usertype_id`) VALUES
(2, 'Jana', 'Zahwe', 'jana@gmail.com', '$2y$10$Rlrsma5UtiMNXRKSNRMk.OGZpzGfp2FuB8DRRtJ5FrGeFQiBfES1C', 2),
(3, 'Ghadeer', 'Zahwe', 'ghadeer22@gmail.com', '$2y$10$kQnVeQqg0b7OgjBxFMWi0.K2FpBbkrBlezteNYm64gJAvI6w00hF6', 1),
(4, 'Ghadeer', 'Zahwe', 'ghadeer223@gmail.com', '$2y$10$71HehStJn4PZ.5yexKuddOwlepelL1sIXCTkeEb4fXHTcgln0.V4C', 1),
(5, 'Ghadeer', 'Zahwe', 'ghadeer_admin@gmail.com', '$2y$10$VBGFmlxmAdszOMwGQpxna.1bzIm8SdTKbVehEPQ7G6cpbKNAuow0.', 4),
(7, 'Ghadeer', 'Zahwe', 'ghadeer.zahwe@gmail.com', '$2y$10$jXPOH7RrfsJjeH4vl0SCk.AO55P2h0hdI774r3Iz6jz0um/meIAVy', 4),
(9, 'Ali', 'Mohamad', 'ali@m.com', '$2y$10$UBr1LdSdDTTqPS95E4Scb.aZZ5blFS6zKXmRaT.uBNmrYS7fsf7RO', 2),
(10, 'Ghadeer', 'Zahwe', 'ghadeerZahwe@gmail.com', '$2y$10$AD7V2x5LDYNzcJsx3l2VQepQlnHi7Ny/GzZtA14UYMzRh1.eIN9oC', 4),
(11, 'Ghadeer', 'Zahwe', 'ghadeerZa@gmail.com', '$2y$10$L1g0zmKQP5WCwXnBxWOwDOHalzEi9jyP6H5XKo1YVtHeLt.Oa8Di.', 4),
(12, 'Ghadeer', 'Zahwe', 'ghadeerZah@gmail.com', '$2y$10$XRIYDbssip96duWWeNQWhuhWpOhQ9.99APKg.wn.H1v5AwM1ET3fe', 4),
(13, 'Ghadeer', 'Zahwe', 'ghadeerZahw@gmail.com', '$2y$10$QY8n9oxNeVA9ShQ4LisMjeaLWpgBRaOnkElabfycoRkaNZZ9CyjaK', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_departments`
--

INSERT INTO `user_departments` (`user_id`, `department_id`) VALUES
(3, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_medications`
--

CREATE TABLE `user_medications` (
  `user_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_rooms`
--

CREATE TABLE `user_rooms` (
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `datetime_entered` date NOT NULL,
  `datetime_left` date NOT NULL,
  `bed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`) VALUES
(1, 'Employee'),
(2, 'Patient'),
(4, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees_info`
--
ALTER TABLE `employees_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `employee_id` (`user_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital_users`
--
ALTER TABLE `hospital_users`
  ADD KEY `hospital__id` (`hospital_id`),
  ADD KEY `user__id` (`user_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients_info`
--
ALTER TABLE `patients_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_patient_id` (`patient_id`),
  ADD KEY `services_employee_id` (`employee_id`),
  ADD KEY `services_department_id` (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype_id` (`usertype_id`);

--
-- Indexes for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD KEY `user___id` (`user_id`),
  ADD KEY `department___id` (`department_id`);

--
-- Indexes for table `user_medications`
--
ALTER TABLE `user_medications`
  ADD KEY `user_medication_id` (`user_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `user_rooms`
--
ALTER TABLE `user_rooms`
  ADD KEY `room_user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees_info`
--
ALTER TABLE `employees_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients_info`
--
ALTER TABLE `patients_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees_info`
--
ALTER TABLE `employees_info`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospital_users`
--
ALTER TABLE `hospital_users`
  ADD CONSTRAINT `hospital__id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user__id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients_info`
--
ALTER TABLE `patients_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `usertype_id` FOREIGN KEY (`usertype_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD CONSTRAINT `department___id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user___id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_medications`
--
ALTER TABLE `user_medications`
  ADD CONSTRAINT `medication_id` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_medication_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_rooms`
--
ALTER TABLE `user_rooms`
  ADD CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
