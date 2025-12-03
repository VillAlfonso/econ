-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 10:04 AM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rider_id` int(11) DEFAULT NULL,
  `pickup_address` varchar(255) NOT NULL,
  `dropoff_address` varchar(255) NOT NULL,
  `pickup_lat` decimal(10,7) DEFAULT NULL,
  `pickup_lng` decimal(10,7) DEFAULT NULL,
  `dropoff_lat` decimal(10,7) DEFAULT NULL,
  `dropoff_lng` decimal(10,7) DEFAULT NULL,
  `distance_km` decimal(8,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `assigned_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `picked_up_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `status` enum('assigned','accepted','picked_up','delivered','failed','cancelled') NOT NULL DEFAULT 'assigned',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `order_id`, `rider_id`, `pickup_address`, `dropoff_address`, `pickup_lat`, `pickup_lng`, `dropoff_lat`, `dropoff_lng`, `distance_km`, `created_at`, `assigned_at`, `accepted_at`, `picked_up_at`, `delivered_at`, `status`, `notes`) VALUES
(1, 22, 1, 'Cheeze Tea Main Store', '235', NULL, NULL, NULL, NULL, 0.00, '2025-12-02 21:47:51', NULL, '2025-12-02 21:47:58', '2025-12-02 21:48:03', '2025-12-02 22:02:26', 'delivered', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_proofs`
--

CREATE TABLE `delivery_proofs` (
  `id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_proofs`
--

INSERT INTO `delivery_proofs` (`id`, `delivery_id`, `image_path`, `uploaded_at`) VALUES
(1, 1, 'uploads/proofs/1764683312_bg.PNG', '2025-12-02 21:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('pending','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`, `payment_id`, `payment_status`, `payment_method`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `notes`) VALUES
(1, 7, 42.00, 'pending', '2025-11-30 12:11:31', NULL, 'pending', NULL, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '0923123421', 'wr3q4qwer3', ''),
(2, 7, 42.00, 'pending', '2025-11-30 12:12:35', 'pi_9ZCPpM9NJLGNJqhrjWcP8o72', 'pending', NULL, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '0923123421', 'wr3q4qwer3', ''),
(3, 7, 42.00, 'pending', '2025-11-30 12:15:31', 'pi_vK7P1p9fbF8nQ5DBPN5eT2Cf', 'pending', NULL, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '0923123421', 'wqadwewe', ''),
(4, 7, 42.00, 'pending', '2025-11-30 12:27:02', NULL, 'pending', NULL, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '0923123421', 'wqadwewe', ''),
(5, 7, 42.00, 'pending', '2025-11-30 12:31:45', NULL, 'pending', NULL, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '', 'ghgbk', ''),
(6, 7, 42.00, 'pending', '2025-11-30 12:36:14', NULL, 'pending', NULL, 'Rheinier Cuenca', 'admin@shop.com', '0923123421', 'weqw', ''),
(7, 7, 42.00, 'pending', '2025-11-30 12:36:29', NULL, 'pending', NULL, 'Rheinier Cuenca', 'admin@shop.com', '0923123421', 'weqw', ''),
(8, 7, 42.00, 'pending', '2025-11-30 12:42:45', NULL, 'pending', NULL, 'Rheinier Cuenca', 'admin@shop.com', '0923123421', 'waew', ''),
(9, 7, 42.00, 'pending', '2025-11-30 12:44:55', 'pi_Bm62Vj9CT9UaWuxj5Fmzn4HJ', 'pending', NULL, 'Rheinier Cuenca', 'admin@shop.com', '0923123421', 'weqwe', ''),
(10, 9, 1212.00, 'completed', '2025-12-01 08:28:43', 'pi_uTxnVDk9dTov7JrRuRHFVXHw', 'paid', NULL, 'Quert Alfonso Villafuerte', '0323-3579@lspu.edu.ph', '144324234324234', 'ewrwerwer324523532', '325325325325'),
(11, 9, 1212.00, 'completed', '2025-12-01 09:07:20', 'pi_kfzH42H9oCUwSyhG9zyCXyNw', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', '32423423r', 'rwe'),
(12, 9, 1212.00, 'completed', '2025-12-01 09:16:30', 'pi_dtCcQz1bT354zQ3nG5QFL2FU', 'paid', NULL, 'Quert Alfonso Villafuerte', '0323-3579@lspu.edu.ph', '144324234324234', 'asdas', 'asdas'),
(13, 9, 42.00, 'completed', '2025-12-01 09:17:54', 'pi_o7Vp7QvqrxvwbqCZPBJqCXZs', 'paid', NULL, 'Quert Alfonso Villafuerte', '0323-3579@lspu.edu.ph', '23523', '32523', '235235'),
(14, 9, 42.00, 'completed', '2025-12-01 09:27:44', 'pi_pAmry4XTrLTe7XK59p7dFddq', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'rqwr', 'qwr'),
(15, 9, 1212.00, 'pending', '2025-12-01 09:29:42', NULL, 'pending', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'rwq', 'qwr'),
(16, 9, 1212.00, 'completed', '2025-12-01 09:31:40', 'pi_NRfzyL4cMWQCwFCKseWNf56r', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'rwq', 'qwr'),
(17, 9, 42.00, 'completed', '2025-12-01 09:32:13', 'pi_WgFgDEZRL8y4V3fDUX6KBMud', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'asdas', 'asdas'),
(18, 9, 1212.00, 'completed', '2025-12-01 09:35:02', 'pi_ixFrQP4eHV3jWgdh2zMh8Trh', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'asdas', 'asfsa'),
(19, 9, 42.00, 'pending', '2025-12-01 09:45:36', NULL, 'pending', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'sad', 'asd'),
(20, 9, 42.00, 'completed', '2025-12-01 10:08:36', 'pi_4TS8mpMzs7tY87c6YoF54es4', 'paid', NULL, 'Quert Alfonso Villafuerte', 'asd@gmail.com', '144324234324234', 'fasf', 'asf'),
(21, 1, 42.00, 'completed', '2025-12-02 13:33:21', 'pi_GM8sZqagLNBubtHK7VRYJXvg', 'paid', NULL, 'Admin', 'admin@shop.com', '1234124', '21421421', '4124214'),
(22, 1, 42.00, 'completed', '2025-12-02 13:47:47', 'pi_5deWwqRMcydFkTP2FRzT85JG', 'paid', NULL, 'Admin', 'admin@shop.com', '1234124', '235', '235');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 6, 1, 42.00),
(2, 2, 6, 1, 42.00),
(3, 3, 6, 1, 42.00),
(4, 4, 6, 1, 42.00),
(5, 5, 6, 1, 42.00),
(6, 6, 6, 1, 42.00),
(7, 7, 6, 1, 42.00),
(8, 8, 6, 1, 42.00),
(9, 9, 6, 1, 42.00),
(10, 10, 7, 1, 1212.00),
(11, 11, 7, 1, 1212.00),
(12, 12, 7, 1, 1212.00),
(13, 13, 6, 1, 42.00),
(14, 14, 6, 1, 42.00),
(15, 15, 7, 1, 1212.00),
(16, 16, 7, 1, 1212.00),
(17, 17, 6, 1, 42.00),
(18, 18, 7, 1, 1212.00),
(19, 19, 6, 1, 42.00),
(20, 20, 6, 1, 42.00),
(21, 21, 6, 1, 42.00),
(22, 22, 6, 1, 42.00);

-- --------------------------------------------------------

--
-- Table structure for table `payout_settings`
--

CREATE TABLE `payout_settings` (
  `id` int(11) NOT NULL DEFAULT 1,
  `base_pay` decimal(10,2) NOT NULL DEFAULT 30.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payout_settings`
--

INSERT INTO `payout_settings` (`id`, `base_pay`) VALUES
(1, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT 'milktea',
  `stock` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `stock`, `image`, `status`, `created_at`) VALUES
(1, 'Espresso Delight', 'Rich and bold espresso blend', 24.99, 'milktea', 0, 'espresso.jpg', 'active', '2025-11-30 01:32:34'),
(2, 'Vanilla Dream Cake', 'Soft sponge with vanilla cream', 38.00, 'milktea', 0, 'vanilla-cake.jpg', 'active', '2025-11-30 01:32:34'),
(3, 'Chocolate Truffle', 'Decadent dark chocolate heaven', 45.00, 'milktea', 0, 'chocolate-truffle.jpg', 'active', '2025-11-30 01:32:34'),
(4, 'Matcha Latte', 'Premium Japanese matcha with milk', 28.50, 'milktea', 0, 'matcha.jpg', 'active', '2025-11-30 01:32:34'),
(5, 'Caramel Macchiato', 'Sweet caramel layered espresso', 32.00, 'milktea', 0, 'caramel-macchiato.jpg', 'active', '2025-11-30 01:32:34'),
(6, 'Tiramisu Classic', 'Traditional Italian coffee dessert', 42.00, 'milktea', 0, '1764500935_692c25c739927.png', 'active', '2025-11-30 01:32:34'),
(7, 'aso', 'nigger', 1212.00, 'food', 999, '1764514077_dog.webp', 'active', '2025-11-30 14:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `rider_earnings`
--

CREATE TABLE `rider_earnings` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `base_pay` decimal(8,2) NOT NULL DEFAULT 30.00,
  `distance_km` decimal(8,2) NOT NULL DEFAULT 0.00,
  `rate_per_km` decimal(8,2) NOT NULL DEFAULT 10.00,
  `bonus` decimal(8,2) NOT NULL DEFAULT 0.00,
  `penalty` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total` decimal(8,2) GENERATED ALWAYS AS (`base_pay` + `distance_km` * `rate_per_km` + `bonus` - `penalty`) STORED,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rider_earnings`
--

INSERT INTO `rider_earnings` (`id`, `rider_id`, `delivery_id`, `base_pay`, `distance_km`, `rate_per_km`, `bonus`, `penalty`, `created_at`) VALUES
(1, 1, 1, 30.00, 0.00, 10.00, 0.00, 0.00, '2025-12-02 22:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `rider_logs`
--

CREATE TABLE `rider_logs` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `log_type` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rider_logs`
--

INSERT INTO `rider_logs` (`id`, `rider_id`, `log_type`, `description`, `created_at`) VALUES
(1, 1, 'accepted_delivery', 'Accepted delivery ID 1', '2025-12-02 21:47:58'),
(2, 1, 'picked_up', 'Picked up delivery ID 1', '2025-12-02 21:48:03'),
(3, 1, 'uploaded_proof', 'Uploaded proof for delivery ID 1', '2025-12-02 21:48:32'),
(4, 1, 'delivery_verified', 'Admin verified delivery ID 1 via dashboard', '2025-12-02 22:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `rider_status`
--

CREATE TABLE `rider_status` (
  `rider_id` int(11) NOT NULL,
  `status` enum('offline','available','on_delivery','suspended') NOT NULL DEFAULT 'offline',
  `last_update` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rider_status`
--

INSERT INTO `rider_status` (`rider_id`, `status`, `last_update`) VALUES
(1, 'available', '2025-12-02 22:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fb_id` varchar(255) DEFAULT NULL,
  `role` enum('admin','customer','rider') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `fb_id`, `role`, `created_at`, `profile_pic`) VALUES
(1, 'Admin', 'admin@shop.com', '$2y$10$O4BqyoJDDakmbWDOefEP..dnVXqPa/VRStPVgWBXgvnWkZdgpmmGq', NULL, 'admin', '2025-11-30 01:32:34', NULL),
(7, 'Rheinier Cuenca', 'cuencarenren@gmail.com', '', NULL, 'rider', '2025-11-30 11:57:16', NULL),
(8, 'asdasd', 'asdasd@asdas.com', '$2y$10$ZigxPvWWNZXJmORLskqzqOWdkGRLVBiuHVpS.WfaHodnvQTZCq8XG', NULL, 'customer', '2025-12-01 08:19:00', NULL),
(9, 'Quert Alfonso Villafuerte', '0323-3579@lspu.edu.ph', '', NULL, 'rider', '2025-12-01 08:28:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_id` (`rider_id`);

--
-- Indexes for table `delivery_proofs`
--
ALTER TABLE `delivery_proofs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payout_settings`
--
ALTER TABLE `payout_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_earnings`
--
ALTER TABLE `rider_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_id` (`rider_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `rider_logs`
--
ALTER TABLE `rider_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rider_id` (`rider_id`);

--
-- Indexes for table `rider_status`
--
ALTER TABLE `rider_status`
  ADD PRIMARY KEY (`rider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `fb_id` (`fb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_proofs`
--
ALTER TABLE `delivery_proofs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rider_earnings`
--
ALTER TABLE `rider_earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rider_logs`
--
ALTER TABLE `rider_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `delivery_proofs`
--
ALTER TABLE `delivery_proofs`
  ADD CONSTRAINT `delivery_proofs_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `rider_earnings`
--
ALTER TABLE `rider_earnings`
  ADD CONSTRAINT `rider_earnings_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rider_earnings_ibfk_2` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_logs`
--
ALTER TABLE `rider_logs`
  ADD CONSTRAINT `rider_logs_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rider_status`
--
ALTER TABLE `rider_status`
  ADD CONSTRAINT `rider_status_ibfk_1` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
