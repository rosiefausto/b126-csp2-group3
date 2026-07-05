-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2026 at 07:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_food_monitoring_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `feeding_history`
--

CREATE TABLE `feeding_history` (
  `id` int(11) NOT NULL,
  `feeding_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feeding_history`
--

INSERT INTO `feeding_history` (`id`, `feeding_date`, `status`, `remarks`, `schedule_id`) VALUES
(1, '2026-07-01', 'Completed', 'Finished meal.', 1),
(2, '2026-07-01', 'Completed', 'Ate all food.', 2),
(3, '2026-07-01', 'Completed', 'Healthy appetite.', 3),
(4, '2026-07-01', 'Completed', 'Finished with water.', 4),
(5, '2026-07-01', 'Completed', 'No leftovers.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `feeding_schedule`
--

CREATE TABLE `feeding_schedule` (
  `id` int(11) NOT NULL,
  `feeding_time` time NOT NULL,
  `quantity` decimal(5,2) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feeding_schedule`
--

INSERT INTO `feeding_schedule` (`id`, `feeding_time`, `quantity`, `frequency`, `pet_id`, `food_id`) VALUES
(1, '07:00:00', '200.00', 'Daily', 1, 1),
(2, '08:00:00', '100.00', 'Daily', 2, 3),
(3, '07:30:00', '250.00', 'Daily', 3, 2),
(4, '06:30:00', '120.00', 'Daily', 4, 5),
(5, '08:30:00', '90.00', 'Daily', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `food_inventory`
--

CREATE TABLE `food_inventory` (
  `id` int(11) NOT NULL,
  `quantity_available` decimal(6,2) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_inventory`
--

INSERT INTO `food_inventory` (`id`, `quantity_available`, `unit`, `last_updated`, `food_id`) VALUES
(1, '10.00', 'kg', '2026-07-02 06:18:57', 1),
(2, '8.50', 'kg', '2026-07-02 06:18:57', 2),
(3, '6.00', 'kg', '2026-07-02 06:18:57', 3),
(4, '5.50', 'kg', '2026-07-02 06:18:57', 4),
(5, '7.25', 'kg', '2026-07-02 06:18:57', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `pet_name` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL,
  `breed` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `pet_name`, `species`, `breed`, `age`, `weight`, `gender`, `user_id`) VALUES
(1, 'Lily', 'Dog', 'Labrador Retriever', 3, '25.50', 'Male', 1),
(2, 'Luna', 'Cat', 'Persian', 2, '4.30', 'Female', 1),
(3, 'Buddy', 'Dog', 'Golden Retriever', 5, '29.00', 'Male', 2),
(4, 'Zoe', 'Cat', 'Ragdoll', 2, '4.10', 'Female', 2),
(5, 'Nimbus', 'Cat', 'Siamese', 1, '3.20', 'Female', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pet_food`
--

CREATE TABLE `pet_food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `food_type` varchar(30) NOT NULL,
  `flavor` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pet_food`
--

INSERT INTO `pet_food` (`id`, `food_name`, `brand`, `food_type`, `flavor`, `expiration_date`) VALUES
(1, 'Adult Dog Food', 'Pedigree', 'Dry', 'Beef', '2027-12-31'),
(2, 'Puppy Growth Formula', 'Royal Canin', 'Dry', 'Chicken', '2027-08-15'),
(3, 'Tuna Delight', 'Whiskas', 'Wet', 'Tuna', '2027-09-20'),
(4, 'Salmon Feast', 'Fancy Feast', 'Wet', 'Salmon', '2028-01-10'),
(5, 'Indoor Cat Formula', 'Purina One', 'Dry', 'Turkey', '2027-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`) VALUES
(1, 'Lai Rose Joy', 'Fausto', 'lrjfausto@gmail.com', 'zoe123', '09111234567'),
(2, 'Clarissa', 'Sevilla', 'csevilla@gmail.com', 'clarissa123', '09121234567'),
(3, 'Danniella Mae', 'Viceda', 'dmviceda@gmail.com', 'danniella123', '09131234567'),
(5, 'Ranzie Kirth', 'Cahulugan', 'rkcahulugan@gmail.com', 'ranz123', '09151234567'),
(6, 'Rose', 'Fausto', 'rose@gmail.com', 'rose123', '09213243545'),
(8, 'rose', 'fausto', 'rose@email.com', 'rose123', '0932432423'),
(9, 'zoe', 'fausto', 'zoe@email.com', 'zoezoe', '09123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feeding_history`
--
ALTER TABLE `feeding_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_history_schedule` (`schedule_id`);

--
-- Indexes for table `feeding_schedule`
--
ALTER TABLE `feeding_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedule_pets` (`pet_id`),
  ADD KEY `fk_schedule_pet_food` (`food_id`);

--
-- Indexes for table `food_inventory`
--
ALTER TABLE `food_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_food_inventory_food` (`food_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pets_user` (`user_id`);

--
-- Indexes for table `pet_food`
--
ALTER TABLE `pet_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feeding_history`
--
ALTER TABLE `feeding_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feeding_schedule`
--
ALTER TABLE `feeding_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `food_inventory`
--
ALTER TABLE `food_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pet_food`
--
ALTER TABLE `pet_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feeding_history`
--
ALTER TABLE `feeding_history`
  ADD CONSTRAINT `fk_history_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `feeding_schedule` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `feeding_schedule`
--
ALTER TABLE `feeding_schedule`
  ADD CONSTRAINT `fk_schedule_pet_food` FOREIGN KEY (`food_id`) REFERENCES `pet_food` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_pets` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `food_inventory`
--
ALTER TABLE `food_inventory`
  ADD CONSTRAINT `fk_food_inventory_food` FOREIGN KEY (`food_id`) REFERENCES `pet_food` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_pets_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
