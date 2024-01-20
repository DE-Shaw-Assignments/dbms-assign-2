-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: swiggy
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--
DROP DATABASE IF EXISTS swiggy;
CREATE DATABASE swiggy;
USE swiggy;
DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `cust_credits` int DEFAULT '0',
  `gender` char(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  CONSTRAINT `Customer_chk_1` CHECK (((`phone_number` >= 1000000000) and (`phone_number` <= 9999999999)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryPerson`
--

DROP TABLE IF EXISTS `DeliveryPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryPerson` (
  `delivery_person_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`delivery_person_id`),
  UNIQUE KEY `contact_number` (`contact_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryPerson`
--

LOCK TABLES `DeliveryPerson` WRITE;
/*!40000 ALTER TABLE `DeliveryPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeliveryPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `discount_id` int NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `percentage_discount` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `code` (`code`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `Discount_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dish` (
  `dish_id` int NOT NULL,
  `restaurant_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dish_type` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `dish_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `Dish_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FavoriteRestaurants`
--

DROP TABLE IF EXISTS `FavoriteRestaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FavoriteRestaurants` (
  `customer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`restaurant_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `FavoriteRestaurants_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `FavoriteRestaurants_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavoriteRestaurants`
--

LOCK TABLES `FavoriteRestaurants` WRITE;
/*!40000 ALTER TABLE `FavoriteRestaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `FavoriteRestaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `OrderItem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `OrderItem_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `Dish` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `delivery_person_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Placed','In Progress','Delivered','Cancelled') DEFAULT NULL,
  `special_instructions` varchar(255) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `delivery_person_id` (`delivery_person_id`),
  KEY `Orders_ibfk_4` (`address_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`),
  CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`delivery_person_id`) REFERENCES `DeliveryPerson` (`delivery_person_id`),
  CONSTRAINT `Orders_ibfk_4` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `payment_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('Credit Card','Debit Card','COD','PayPal','Other') DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('Pending','Processed','Failed','Refunded','Other') DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `restaurant_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `review_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `delivery_person_id` int DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `order_id` (`order_id`),
  KEY `delivery_person_id` (`delivery_person_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`),
  CONSTRAINT `Review_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `Review_ibfk_4` FOREIGN KEY (`delivery_person_id`) REFERENCES `DeliveryPerson` (`delivery_person_id`),
  CONSTRAINT `Review_ibfk_5` FOREIGN KEY (`dish_id`) REFERENCES `Dish` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
INSERT INTO `Customer` (`customer_id`, `first_name`, `last_name`, `email`, `phone_number`, `password_hash`, `registration_date`, `last_login_date`, `cust_credits`, `gender`, `date_of_birth`)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 1234567890, 'hashed_password', '2022-01-01', '2024-01-20 13:45:27', 100, 'M', '2000-01-01'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210, 'hashed_password', '2022-01-02', '2024-01-20 13:45:27', 50, 'F', '1995-05-15'),
(3, 'Michael', 'Johnson', 'michael.j@example.com', 5556667777, 'hashed_password', '2022-02-10', '2024-01-20 13:45:27', 75, 'M', '1998-08-20'),
(4, 'Emily', 'Williams', 'emily.w@example.com', 3334445555, 'hashed_password', '2022-03-15', '2024-01-20 13:45:27', 120, 'F', '1992-11-30'),
(5, 'Chris', 'Anderson', 'chris.a@example.com', 9998887777, 'hashed_password', '2022-04-20', '2024-01-20 13:45:27', 90, 'M', '1997-04-05'),
(6, 'Sophia', 'Brown', 'sophia.b@example.com', 7776665555, 'hashed_password', '2022-05-25', '2024-01-20 13:45:27', 60, 'F', '1994-02-10'),
(7, 'Matthew', 'Miller', 'matthew.m@example.com', 2223334444, 'hashed_password', '2022-06-30', '2024-01-20 13:45:27', 110, 'M', '1989-09-15'),
(8, 'Olivia', 'Jones', 'olivia.j@example.com', 6665554444, 'hashed_password', '2022-07-05', '2024-01-20 13:45:27', 80, 'F', '1985-07-20'),
(9, 'Daniel', 'White', 'daniel.w@example.com', 4445556666, 'hashed_password', '2022-08-10', '2024-01-20 13:45:27', 95, 'M', '1996-06-25'),
(10, 'Ava', 'Taylor', 'ava.t@example.com', 8889990000, 'hashed_password', '2022-09-15', '2024-01-20 13:45:27', 70, 'F', '1993-12-01');

INSERT INTO `Restaurant` (`restaurant_id`, `name`, `address`, `city`, `state`, `zip_code`, `country`, `contact_number`, `is_open`)
VALUES
(1, 'Tasty Restaurant', '123 Main St', 'Cityville', 'Stateville', '12345', 'Countryland', '111-222-3333', 1),
(2, 'Spicy Grill', '456 Oak St', 'Townsville', 'Stateville', '56789', 'Countryland', '444-555-6666', 1),
(3, 'Sushi Palace', '789 Maple St', 'Villagetown', 'Stateville', '98765', 'Countryland', '777-888-9999', 1),
(4, 'Pizza Heaven', '101 Pineapple St', 'Cityville', 'Stateville', '54321', 'Countryland', '333-444-5555', 1),
(5, 'Burger Joint', '202 Chestnut St', 'Townsville', 'Stateville', '67890', 'Countryland', '999-000-1111', 1);

INSERT INTO `Dish` (`dish_id`, `restaurant_id`, `name`, `description`, `dish_type`, `price`, `dish_category`)
VALUES
(1, 1, 'Chicken Curry', 'Spicy chicken curry with basmati rice', 'Non-Veg', 12.99, 'Main Course'),
(2, 1, 'Vegetable Biryani', 'Mixed vegetable biryani with raita', 'Veg', 9.99, 'Main Course'),
(3, 2, 'Grilled Shrimp', 'Juicy grilled shrimp with garlic butter', 'Non-Veg', 14.99, 'Appetizer'),
(4, 2, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil', 'Veg', 10.99, 'Main Course'),
(5, 3, 'Sushi Platter', 'Assorted sushi rolls with wasabi and soy sauce', 'Non-Veg', 18.99, 'Appetizer'),
(6, 3, 'Tempura Udon', 'Japanese udon soup with tempura vegetables', 'Veg', 11.99, 'Main Course'),
(7, 4, 'Pepperoni Pizza', 'Pizza with pepperoni, tomato sauce, and cheese', 'Non-Veg', 13.99, 'Main Course'),
(8, 4, 'Veggie Burger', 'Vegetarian burger with fresh vegetables and fries', 'Veg', 8.99, 'Main Course'),
(9, 5, 'Double Cheeseburger', 'Burger with two beef patties, cheese, and special sauce', 'Non-Veg', 15.99, 'Snack'),
(10, 1, 'Paneer Tikka', 'Grilled paneer with aromatic spices', 'Veg', 11.99, 'Appetizer'),
(11, 2, 'Mushroom Risotto', 'Creamy mushroom risotto with parmesan', 'Veg', 13.99, 'Main Course'),
(12, 2, 'Garlic Bread', 'Crunchy garlic bread with herbs', 'Veg', 5.99, 'Appetizer'),
(13, 3, 'Dragon Roll', 'Spicy tuna and avocado roll with eel sauce', 'Non-Veg', 16.99, 'Sushi'),
(14, 3, 'Edamame', 'Steamed young soybeans with sea salt', 'Veg', 7.99, 'Appetizer'),
(15, 4, 'BBQ Chicken Pizza', 'Pizza with BBQ chicken, red onions, and cilantro', 'Non-Veg', 14.99, 'Main Course'),
(16, 4, 'Caprese Salad', 'Tomato, mozzarella, and basil salad', 'Veg', 8.49, 'Salad'),
(17, 5, 'Chicken Wings', 'Crispy chicken wings with hot sauce', 'Non-Veg', 9.99, 'Appetizer'),
(18, 5, 'Sweet Potato Fries', 'Baked sweet potato fries with aioli', 'Veg', 6.99, 'Snack');

INSERT INTO `Address` (`customer_id`, `type`, `address_line1`, `address_line2`, `city`, `state`, `zip_code`, `country`)
VALUES
(1, 'Home', '123 Main St', 'Apt 101', 'Cityville', 'Stateville', '12345', 'Countryland'),
(1, 'Work', '888 Cedar St', 'House 25', 'Villagetown', 'Stateville', '56789', 'Countryland'),
(2, 'Home', '456 Oak St', 'Suite 202', 'Townsville', 'Stateville', '56789', 'Countryland'),
(3, 'Work', '789 Maple St', 'Floor 3', 'Villagetown', 'Stateville', '98765', 'Countryland'),
(4, 'Home', '101 Pineapple St', 'Unit B', 'Cityville', 'Stateville', '54321', 'Countryland'),
(5, 'Work', '202 Chestnut St', 'Office 5A', 'Townsville', 'Stateville', '67890', 'Countryland'),
(6, 'Home', '301 Elm St', 'Apartment 10', 'Villagetown', 'Stateville', '34567', 'Countryland'),
(7, 'Home', '404 Cedar St', 'House 15', 'Cityville', 'Stateville', '87654', 'Countryland'),
(8, 'Work', '507 Pine St', 'Floor 2', 'Townsville', 'Stateville', '23456', 'Countryland'),
(8, 'Home', '555 Broad St', 'Suite 301', 'Townsville', 'Stateville', '34567', 'Countryland'),
(9, 'Home', '610 Oak St', 'Apt 303', 'Villagetown', 'Stateville', '76543', 'Countryland'),
(10, 'Home', '713 Maple St', 'Unit C', 'Cityville', 'Stateville', '98765', 'Countryland');

INSERT INTO `Discount` (`discount_id`, `code`, `description`, `amount`, `percentage_discount`, `start_date`, `end_date`, `is_active`, `restaurant_id`)
VALUES
(4, 'WINTER20', 'Winter Special - $5 off', 5.00, NULL, '2022-12-01', '2022-12-31', 1, 6),
(5, 'THAI50', 'Thai Fusion Opening - 50% off', NULL, 50.00, '2022-11-15', '2022-11-30', 1, 7),
(6, 'SPICE15', 'Indian Spice Discount - 15% off', NULL, 15.00, '2022-10-01', '2022-10-31', 1, 8);

INSERT INTO `FavoriteRestaurants` (`customer_id`, `restaurant_id`)
VALUES
(1, 1), 
(1, 3),
(2, 2), 
(3, 4),
(4, 5), 
(5, 1), 
(5, 3), 
(6, 2), 
(7, 4),  
(8, 5), 
(9, 1), 
(9, 2), 
(10, 3), 
(10, 5);

INSERT INTO `DeliveryPerson` (`delivery_person_id`, `first_name`, `last_name`, `contact_number`, `email`, `password_hash`, `vehicle_number`, `availability`)
VALUES
(1, 'David', 'Johnson', 1112223333, 'david.j@example.com', 'hashed_password', 'DLX123', 1),
(2, 'Emma', 'Smith', 4445556666, 'emma.s@example.com', 'hashed_password', 'CRV789', 1),
(3, 'Ryan', 'Williams', 7778889999, 'ryan.w@example.com', 'hashed_password', 'VAN456', 0),
(4, 'Sophie', 'Brown', 9990001111, 'sophie.b@example.com', 'hashed_password', 'BIKE001', 1),
(5, 'Jack', 'Miller', 2223334444, 'jack.m@example.com', 'hashed_password', 'SCOOTER789', 1),
(6, 'Grace', 'Davis', 6667778888, 'grace.d@example.com', 'hashed_password', 'CAR555', 1);


INSERT INTO `Orders` (`order_id`, `customer_id`, `delivery_person_id`, `restaurant_id`, `order_date`, `address_id`, `total_amount`, `status`, `special_instructions`)
VALUES
(1, 1, 4, 1, '2024-01-20 14:30:00', 1, 22.99, 'Placed', 'No spicy food'),
(2, 2, 2, 3, '2024-01-20 15:15:00', 2, 34.99, 'In Progress', 'Extra garlic butter'),
(3, 3, 6, 2, '2024-01-20 16:00:00', 3, 18.99, 'Delivered', 'None'),
(4, 4, 1, 4, '2024-01-20 17:30:00', 4, 13.99, 'Cancelled', 'No cheese'),
(5, 5, 5, 5, '2024-01-20 18:45:00', 5, 25.99, 'Placed', 'Extra spicy'),
(6, 1, 3, 1, '2024-01-20 19:20:00', 6, 29.99, 'In Progress', 'Contactless delivery'),
(7, 7, 4, 3, '2024-01-20 20:10:00', 7, 16.99, 'Delivered', 'Vegetarian only'),
(8, 8, 5, 4, '2024-01-20 21:00:00', 8, 19.99, 'Placed', 'No onions'),
(9, 9, 1, 5, '2024-01-20 21:45:00', 9, 27.99, 'In Progress', 'Gluten-free'),
(10, 2, 6, 2, '2024-01-20 22:30:00', 10, 31.99, 'Delivered', 'No nuts'),
(11, 10, 6, 2, '2024-01-20 22:30:00', 10, 31.99, 'Delivered', 'No Garlic');

INSERT INTO `OrderItem` (`order_item_id`, `order_id`, `dish_id`, `quantity`)
VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 4, 1),
(5, 3, 5, 1),
(6, 4, 6, 2),
(7, 5, 7, 1),
(8, 6, 1, 1),
(9, 6, 4, 2),
(10, 7, 5, 1),
(11, 8, 6, 1),
(12, 8, 9, 1),
(13, 9, 7, 2),
(14, 10, 1, 1),
(15, 10, 5, 1);

INSERT INTO `Payment` (`payment_id`, `order_id`, `amount`, `payment_method`, `payment_date`, `status`)
VALUES
(1, 1, 22.99, 'Credit Card', '2024-01-20', 'Pending'),
(2, 2, 34.99, 'Debit Card', '2024-01-20', 'Processed'),
(3, 3, 18.99, 'COD', '2024-01-20', 'Processed'),
(4, 4, 13.99, 'PayPal', '2024-01-20', 'Refunded'),
(5, 5, 25.99, 'Other', '2024-01-20', 'Pending'),
(6, 6, 29.99, 'Credit Card', '2024-01-20', 'Processed'),
(7, 7, 16.99, 'Debit Card', '2024-01-20', 'Processed'),
(8, 8, 19.99, 'COD', '2024-01-20', 'Pending'),
(9, 9, 27.99, 'PayPal', '2024-01-20', 'Pending'),
(10, 10, 31.99, 'Other', '2024-01-20', 'Processed'),
(11, 11, 31.99, 'Credit Card', '2024-01-20', 'Processed');


INSERT INTO `Review` (`review_id`, `customer_id`, `restaurant_id`, `order_id`, `delivery_person_id`, `dish_id`, `rating`, `comment`, `review_date`)
VALUES
(1, 1, NULL, NULL, 1, NULL, 4, 'Fast and friendly delivery person!', '2024-01-20'),
(2, 2, NULL, 1, NULL, NULL, 5, 'The order arrived quickly and was well-packaged.', '2024-01-20'),
(4, 4, NULL, 3, NULL, NULL, 2, 'The delivery person cancelled, and the order was not delivered.', '2024-01-20'),
(5, 5, NULL, NULL, 2, NULL, 4, 'The delivery person was polite and professional.', '2024-01-20'),
(6, 1, NULL, 4, NULL, NULL, 4, 'Ordered a dish, and it was consistently good.', '2024-01-20'),
(7, 7, NULL, 5, NULL, NULL, 5, 'The order arrived on time, and the food was fresh.', '2024-01-20'),
(8, 8, NULL, NULL, 3, NULL, 3, 'Average experience. The delivery person could improve.', '2024-01-20'),
(9, 9, NULL, NULL, 4, NULL, 5, 'Perfectly cooked dish. Appreciated the attention to detail.', '2024-01-20'),
(10, 2, NULL, 6, NULL, NULL, 4, 'The order was delivered promptly. Good service overall.', '2024-01-20'),
(11, 10, NULL, 7, NULL, NULL, 5, 'Excellent dish, and the delivery was quick.', '2024-01-20'),
(12, 1, 1, NULL, NULL, NULL, 4, 'Great food and quick delivery!', '2024-01-20'),
(23, 2, 3, NULL, NULL, NULL, 5, 'Amazing flavors! Will order again.', '2024-01-20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 15:32:50