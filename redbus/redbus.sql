-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: redbus
-- ------------------------------------------------------
-- Server version	8.0.36

--
-- Table structure for table `Agency`
--
DROP DATABASE IF EXISTS redBus;

CREATE DATABASE redBus;
USE redBus;

DROP TABLE IF EXISTS `Agency`;
CREATE TABLE `Agency` (
  `AgencyID` int NOT NULL,
  `AgencyName` varchar(255) NOT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AgencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Agency`
--

LOCK TABLES `Agency` WRITE;
/*!40000 ALTER TABLE `Agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bus`
--

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bus` (
  `BusNumber` varchar(20) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `RegistrationNumber` varchar(20) DEFAULT NULL,
  `BusType` varchar(20) DEFAULT NULL,
  `AgencyID` int DEFAULT NULL,
  PRIMARY KEY (`BusNumber`),
  UNIQUE KEY `RegistrationNumber` (`RegistrationNumber`),
  KEY `fk_AgencyID` (`AgencyID`),
  CONSTRAINT `fk_AgencyID` FOREIGN KEY (`AgencyID`) REFERENCES `Agency` (`AgencyID`),
  CONSTRAINT `Bus_chk_1` CHECK ((`BusType` in (_utf8mb4'AC',_utf8mb4'Non-AC',_utf8mb4'Sleeper')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conductor`
--

DROP TABLE IF EXISTS `Conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conductor` (
  `ConductorID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`ConductorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conductor`
--

LOCK TABLES `Conductor` WRITE;
/*!40000 ALTER TABLE `Conductor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Driver` (
  `DriverID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `LicenseNumber` varchar(20) DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DriverID`),
  UNIQUE KEY `LicenseNumber` (`LicenseNumber`),
  UNIQUE KEY `uc_DriverID` (`DriverID`),
  CONSTRAINT `Driver_chk_1` CHECK ((`Status` in (_utf8mb4'Active',_utf8mb4'Inactive')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `PassengerID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `phone_number` (`phone_number`),
  CONSTRAINT `Passenger_chk_1` CHECK (((`phone_number` >= 1000000000) and (`phone_number` <= 9999999999)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `ReservationID` int NOT NULL,
  `PassengerID` int DEFAULT NULL,
  `BusNumber` varchar(20) NOT NULL,
  `ReservationDate` date DEFAULT NULL,
  `AmountPaid` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `StartingPoint` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `BusNumber` (`BusNumber`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `Passenger` (`PassengerID`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`BusNumber`) REFERENCES `Bus` (`BusNumber`),
  CONSTRAINT `Reservation_chk_1` CHECK ((`Status` in (_utf8mb4'Confirmed',_utf8mb4'Pending',_utf8mb4'Cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedbacks`
--

DROP TABLE IF EXISTS `Feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedbacks` (
  `ReservationID` int DEFAULT NULL,
  `FeedbackID` int NOT NULL,
   `AgencyID` int DEFAULT NULL,
  `PassengerID` int NOT NULL,
  `Rating` int DEFAULT 1,
  `Comment` text,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FeedbackID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `Feedbacks_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `Passenger` (`PassengerID`),
  CONSTRAINT `Feedbacks_ibfk_2` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation` (`ReservationID`),
  CONSTRAINT `Feedbacks_ibfk_3` FOREIGN KEY (`AgencyID`) REFERENCES `Agency` (`AgencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedbacks`
--

LOCK TABLES `Feedbacks` WRITE;
/*!40000 ALTER TABLE `Feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL,
  `ReservationID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `AmountPaid` decimal(10,2) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `TransactionID` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentID`),
  KEY `ReservationID` (`ReservationID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation` (`ReservationID`),
  CONSTRAINT `Payment_chk_1` CHECK ((`Status` in (_utf8mb4'Success',_utf8mb4'Pending',_utf8mb4'Failed')))
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
-- Table structure for table `ReservationSeat`
--

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `SeatID` int NOT NULL,
  `BusNumber` varchar(20) DEFAULT NULL,
  `SeatNumber` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `BusNumber` (`BusNumber`),
  CONSTRAINT `Seat_ibfk_1` FOREIGN KEY (`BusNumber`) REFERENCES `Bus` (`BusNumber`),
  CONSTRAINT `Seat_chk_1` CHECK ((`Status` in (_utf8mb4'Available',_utf8mb4'Booked'))),
  CONSTRAINT `Seat_chk_2` CHECK ((`Type` in (_utf8mb4'Window',_utf8mb4'Aisle',_utf8mb4'Middle')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `ReservationSeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReservationSeat` (
  `ReservationID` int NOT NULL,
  `SeatID` int NOT NULL,
  PRIMARY KEY (`ReservationID`,`SeatID`),
  KEY `SeatID` (`SeatID`),
  CONSTRAINT `ReservationSeat_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `Reservation` (`ReservationID`),
  CONSTRAINT `ReservationSeat_ibfk_2` FOREIGN KEY (`SeatID`) REFERENCES `Seat` (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationSeat`
--

LOCK TABLES `ReservationSeat` WRITE;
/*!40000 ALTER TABLE `ReservationSeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReservationSeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `RouteID` int NOT NULL,
  `SourceLocation` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `BusNumber` varchar(20) NOT NULL,
  `DriverID` int DEFAULT NULL,
  `ConductorID` int DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  KEY `BusNumber` (`BusNumber`),
  KEY `DriverID` (`DriverID`),
  KEY `ConductorID` (`ConductorID`),
  CONSTRAINT `Route_ibfk_1` FOREIGN KEY (`BusNumber`) REFERENCES `Bus` (`BusNumber`),
  CONSTRAINT `Route_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `Driver` (`DriverID`),
  CONSTRAINT `Route_ibfk_3` FOREIGN KEY (`ConductorID`) REFERENCES `Conductor` (`ConductorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedule` (
  `ScheduleID` int NOT NULL,
  `ScheduleName` varchar(255) NOT NULL,
  `AgencyID` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `AgencyID` (`AgencyID`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`AgencyID`) REFERENCES `Agency` (`AgencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RouteSchedule`
--

DROP TABLE IF EXISTS `RouteSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RouteSchedule` (
  `RouteScheduleID` int NOT NULL AUTO_INCREMENT,
  `RouteID` int NOT NULL,
  `ScheduleID` int NOT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ReachingTime` time DEFAULT NULL,
  `DayOfOperation` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  PRIMARY KEY (`RouteScheduleID`),
  KEY `RouteID` (`RouteID`),
  KEY `ScheduleID` (`ScheduleID`),
  CONSTRAINT `RouteSchedule_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `Route` (`RouteID`),
  CONSTRAINT `RouteSchedule_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `Schedule` (`ScheduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RouteSchedule`
--

LOCK TABLES `RouteSchedule` WRITE;
/*!40000 ALTER TABLE `RouteSchedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `RouteSchedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stop`
--

DROP TABLE IF EXISTS `Stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stop` (
  `StopID` int NOT NULL,
  `StopName` varchar(255) NOT NULL,
  PRIMARY KEY (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stop`
--

LOCK TABLES `Stop` WRITE;
/*!40000 ALTER TABLE `Stop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RouteStop`
--

DROP TABLE IF EXISTS `RouteStop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RouteStop` (
  `RouteID` int NOT NULL,
  `StopID` int NOT NULL,
  `ord` int NOT NULL,
  PRIMARY KEY (`RouteID`, `StopID`),
  KEY `StopID` (`StopID`),
  CONSTRAINT `RouteStop_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `Route` (`RouteID`),
  CONSTRAINT `RouteStop_ibfk_2` FOREIGN KEY (`StopID`) REFERENCES `Stop` (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RouteStop`
--

LOCK TABLES `RouteStop` WRITE;

UNLOCK TABLES;

INSERT INTO `Passenger` (`PassengerID`, `Name`, `DOB`, `gender`, `phone_number`, `Email`) VALUES
(1, 'Alex Johnson', '1998-03-25', 'M', 9876543210, 'alex.johnson@example.com'),
(2, 'Emma Smith', '1995-07-12', 'F', 8765432101, 'emma.smith@example.com'),
(3, 'William Davis', '1990-06-18', 'M', 7654321098, 'william.davis@example.com'),
(4, 'Olivia Wilson', '1992-08-22', 'F', 6543210987, 'olivia.wilson@example.com'),
(5, 'Michael Taylor', '1987-12-10', 'M', 5432109876, 'michael.taylor@example.com'),
(6, 'Olivia Jones', '1991-11-25', 'F', 4321098765, 'olivia.jones@example.com'),
(7, 'Daniel Moore', '1989-05-30', 'M', 3210987654, 'daniel.moore@example.com'),
(8, 'Sophie Brown', '1993-09-15', 'F', 2109876543, 'sophie.brown@example.com'),
(9, 'Matthew Wilson', '1986-02-14', 'M', 1098765432, 'matthew.wilson@example.com'),
(10, 'Ava Miller', '1994-04-28', 'F', 9876543200, 'ava.miller@example.com');

INSERT INTO `Agency` (`AgencyID`, `AgencyName`, `ContactPerson`, `ContactNumber`, `Email`) VALUES
(1, 'RedBus Travels', 'John Doe', '9876543210', 'info@redbus.com'),
(2, 'BlueLine Tours', 'Alice Smith', '8765432109', 'info@blueline.com'),
(3, 'GreenTransit', 'Bob Johnson', '7654321098', 'info@greentransit.com'),
(4, 'YellowRoutes', 'Eva Wilson', '6543210987', 'info@yellowroutes.com'),
(5, 'OrangeExpress', 'Charlie Brown', '5432109876', 'info@orangeexpress.com'),
(6, 'PurpleJourney', 'Grace Miller', '4321098765', 'info@purplejourney.com'),
(7, 'PinkVoyage', 'David Moore', '3210987654', 'info@pinkvoyage.com'),
(8, 'SilverTrips', 'Sophia Wilson', '2109876543', 'info@silvertrips.com'),
(9, 'GoldRide', 'Daniel Taylor', '1098765432', 'info@goldride.com'),
(10, 'PlatinumTravels', 'Olivia Johnson', '9876543210', 'info@platinumtravels.com');

INSERT INTO `Bus` (`BusNumber`, `Capacity`, `Model`, `RegistrationNumber`, `BusType`, `AgencyID`) VALUES
('BUS001', 50, 'Volvo B9R', 'TN12345', 'AC', 1),
('BUS002', 45, 'Mercedes-Benz Tourismo', 'KA67890', 'Non-AC', 2),
('BUS003', 55, 'Scania Metrolink', 'MH54321', 'Sleeper', 3),
('BUS004', 40, 'Ashok Leyland Viking', 'DL98765', 'AC', 4),
('BUS005', 60, 'Volvo 9400', 'UP45678', 'Non-AC', 5),
('BUS006', 48, 'Mercedes-Benz SHD', 'RJ23456', 'Sleeper', 6),
('BUS007', 53, 'Scania Multi-Axle', 'MP87654', 'AC', 7),
('BUS008', 35, 'Ashok Leyland Eagle', 'GJ34567', 'Non-AC', 8),
('BUS009', 42, 'Volvo 9700', 'TS65432', 'Sleeper', 9),
('BUS010', 50, 'Mercedes-Benz Intercity', 'KL87654', 'AC', 10);

INSERT INTO `Conductor` (`ConductorID`, `FirstName`, `LastName`, `ContactNumber`, `DOB`) VALUES
(1, 'Emma', 'Johnson', '9876543210', '1985-08-12'),
(2, 'William', 'Smith', '8765432109', '1987-03-25'),
(3, 'Olivia', 'Miller', '7654321098', '1989-11-30'),
(4, 'Noah', 'Davis', '6543210987', '1984-06-14'),
(5, 'Ava', 'Jones', '5432109876', '1990-04-28'),
(6, 'James', 'Brown', '4321098765', '1988-09-15'),
(7, 'Sophia', 'Taylor', '3210987654', '1986-02-03'),
(8, 'Liam', 'Wilson', '2109876543', '1992-12-18'),
(9, 'Isabella', 'Moore', '1098765432', '1983-07-07'),
(10, 'Mason', 'Jackson', '9876543210', '1995-01-22');

INSERT INTO `Driver` (`DriverID`, `FirstName`, `LastName`, `ContactNumber`, `LicenseNumber`, `JoiningDate`, `DOB`, `Status`) VALUES
(1, 'Ethan', 'Johnson', '9876543210', 'DL123456', '2020-05-15', '1980-11-08', 'Active'),
(2, 'Olivia', 'Smith', '8765432109', 'KA987654', '2018-08-22', '1982-04-25', 'Active'),
(3, 'Logan', 'Miller', '7654321098', 'MH345678', '2019-02-10', '1986-10-31', 'Active'),
(4, 'Ava', 'Davis', '6543210987', 'DL876543', '2021-11-05', '1978-05-14', 'Active'),
(5, 'Liam', 'Jones', '5432109876', 'UP456789', '2017-06-28', '1984-03-30', 'Active'),
(6, 'Sophia', 'Brown', '4321098765', 'RJ234567', '2022-03-17', '1981-07-15', 'Active'),
(7, 'Jackson', 'Taylor', '3210987654', 'MP876543', '2016-09-03', '1983-12-22', 'Active'),
(8, 'Emma', 'Wilson', '2109876543', 'GJ345678', '2023-07-19', '1979-04-11', 'Active'),
(9, 'Mia', 'Moore', '1098765432', 'TS456789', '2015-12-02', '1985-01-29', 'Active'),
(10, 'Lucas', 'Jackson', '9876543210', 'KL987654', '2024-01-08', '1987-06-06', 'Active');

INSERT INTO `Stop` (`StopID`, `StopName`) VALUES
(1, 'City A'),
(2, 'City B'),
(3, 'City C'),
(4, 'City D'),
(5, 'City E'),
(6, 'City F'),
(7, 'City G'),
(8, 'City H'),
(9, 'City I'),
(10, 'City J');

INSERT INTO `Route` (`RouteID`, `SourceLocation`, `Destination`, `BusNumber`, `DriverID`, `ConductorID`) VALUES
(1, 'City A', 'City B', 'BUS001', 1, 1),
(2, 'City B', 'City C', 'BUS002', 2, 2),
(3, 'City C', 'City D', 'BUS003', 3, 3),
(4, 'City D', 'City E', 'BUS004', 4, 4),
(5, 'City E', 'City F', 'BUS005', 5, 5),
(6, 'City F', 'City G', 'BUS006', 6, 6),
(7, 'City G', 'City H', 'BUS007', 7, 7),
(8, 'City H', 'City I', 'BUS008', 8, 8),
(9, 'City I', 'City J', 'BUS009', 9, 9),
(10, 'City J', 'City A', 'BUS010', 10, 10);

INSERT INTO `Schedule` (`ScheduleID`, `ScheduleName`, `AgencyID`) VALUES
(1, 'Morning Express', 1),
(2, 'Afternoon Delight', 2),
(3, 'Evening Commute', 3),
(4, 'Night Rider', 4),
(5, 'Early Bird', 5),
(6, 'Late Nighter', 6),
(7, 'Sunset Voyage', 7),
(8, 'Dawn Journey', 8),
(9, 'Twilight Run', 9),
(10, 'Midday Sprint', 10);

INSERT INTO `Seat` (`SeatID`, `BusNumber`, `SeatNumber`, `Status`, `Type`, `Price`) VALUES
(1, 'BUS001', 1, 'Available', 'Window', 150.00),
(2, 'BUS001', 2, 'Available', 'Aisle', 120.00),
(3, 'BUS001', 3, 'Available', 'Middle', 100.00),
(4, 'BUS002', 1, 'Available', 'Window', 130.00),
(5, 'BUS002', 2, 'Available', 'Aisle', 110.00),
(6, 'BUS002', 3, 'Available', 'Middle', 90.00),
(7, 'BUS003', 1, 'Available', 'Window', 140.00),
(8, 'BUS003', 2, 'Available', 'Aisle', 115.00),
(9, 'BUS003', 3, 'Available', 'Middle', 95.00),
(10, 'BUS004', 1, 'Available', 'Window', 160.00);

INSERT INTO `Reservation` (`ReservationID`, `PassengerID`, `BusNumber`, `ReservationDate`, `AmountPaid`, `Status`, `StartingPoint`, `Destination`) VALUES
(1, 1, 'BUS001', '2024-02-01', 200.00, 'Confirmed', 'City A', 'City B'),
(2, 2, 'BUS002', '2024-02-03', 180.00, 'Confirmed', 'City B', 'City C'),
(3, 3, 'BUS003', '2024-02-05', 210.00, 'Pending', 'City C', 'City D'),
(4, 4, 'BUS004', '2024-02-07', 240.00, 'Confirmed', 'City D', 'City E'),
(5,5, 'BUS005', '2024-02-09', 160.00, 'Confirmed', 'City E', 'City F'),
(6,6, 'BUS006', '2024-02-11', 190.00, 'Cancelled', 'City F', 'City G'),
(7,7, 'BUS007', '2024-02-13', 220.00, 'Confirmed', 'City G', 'City H'),
(8,8, 'BUS008', '2024-02-15', 130.00, 'Confirmed', 'City H', 'City I'),
(9,9, 'BUS009', '2024-02-17', 170.00, 'Pending', 'City I', 'City J'),
(10,10, 'BUS010', '2024-02-19', 200.00, 'Confirmed', 'City J', 'City A');

INSERT INTO `Payment` (`PaymentID`, `ReservationID`, `PaymentDate`, `AmountPaid`, `PaymentMethod`, `TransactionID`, `Status`, `Timestamp`) VALUES
(1, 1, '2024-02-01', 200.00, 'Credit Card', 'CC123456', 'Success', '2024-02-01 12:00:00'),
(2, 2, '2024-02-03', 180.00, 'Debit Card', 'DC987654', 'Success', '2024-02-03 12:00:00'),
(3, 3, '2024-02-05', 0.00, 'Cash', '', 'Pending', '2024-02-05 12:00:00'),
(4, 4, '2024-02-07', 240.00, 'Net Banking', 'NB456789', 'Success', '2024-02-07 12:00:00'),
(5, 5, '2024-02-09', 160.00, 'Credit Card', 'CC234567', 'Success', '2024-02-09 12:00:00'),
(6, 6, '2024-02-11', 0.00, 'Cash', '', 'Pending', '2024-02-11 12:00:00'),
(7, 7, '2024-02-13', 220.00, 'Debit Card', 'DC345678', 'Success', '2024-02-13 12:00:00'),
(8, 8, '2024-02-15', 130.00, 'Net Banking', 'NB567890', 'Success', '2024-02-15 12:00:00'),
(9, 9, '2024-02-17', 0.00, 'Cash', '', 'Pending', '2024-02-17 12:00:00'),
(10, 10, '2024-02-19', 200.00, 'Credit Card', 'CC345678', 'Failed', '2024-02-19 12:00:00');

INSERT INTO `ReservationSeat` (`ReservationID`, `SeatID`) VALUES
(1, 1),
(1, 2),
(2, 4),
(2, 5),
(3, 7),
(3, 8),
(4, 10),
(4, 1),
(5, 3),
(5, 4),
(6, 6),
(6, 7),
(7, 9),
(7, 10);

INSERT INTO `RouteSchedule` (`RouteScheduleID`, `RouteID`, `ScheduleID`, `DepartureTime`, `ReachingTime`, `DayOfOperation`) VALUES
(1, 1, 1, '08:00:00', '12:00:00', 'Monday'),
(2, 2, 2, '10:00:00', '14:00:00', 'Tuesday'),
(3, 3, 3, '12:00:00', '16:00:00', 'Wednesday'),
(4, 4, 4, '14:00:00', '18:00:00', 'Thursday'),
(5, 5, 5, '16:00:00', '20:00:00', 'Friday'),
(6, 6, 6, '18:00:00', '22:00:00', 'Saturday'),
(7, 7, 7, '20:00:00', '00:00:00', 'Sunday'),
(8, 8, 8, '22:00:00', '02:00:00', 'Monday'),
(9, 9, 9, '00:00:00', '04:00:00', 'Tuesday'),
(10, 10, 10, '02:00:00', '06:00:00', 'Wednesday');

INSERT INTO `RouteStop` (`RouteID`, `StopID`, `ord`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 2, 1),
(2, 3, 2),
(3, 3, 1),
(3, 4, 2),
(4, 4, 1),
(4, 5, 2),
(5, 5, 1),
(5, 6, 2),
(6, 6, 1),
(6, 7, 2),
(7, 7, 1),
(7, 8, 2),
(8, 8, 1),
(8, 9, 2),
(9, 9, 1),
(9, 10, 2),
(10, 10, 1),
(10, 1, 2);

INSERT INTO `Feedbacks` (`FeedbackID`, `PassengerID`, `ReservationID`, `AgencyID`,`Rating`, `Comment`, `Timestamp`) VALUES
(1, 1, NULL, 1, 4, 'Great service!', '2024-02-01 12:00:00'),
(2, 2, NULL, 2, 5, 'Very satisfied!', '2024-02-03 12:00:00'),
(3, 3, 3, NULL, 3, 'Could be better.', '2024-02-05 12:00:00'),
(4, 4, NULL, 3, 4, 'Nice experience!', '2024-02-07 12:00:00'),
(5, 5, NULL, 4, 5, 'Excellent!', '2024-02-09 12:00:00'),
(6, 6, 6, NULL, 2, 'Not satisfied.', '2024-02-11 12:00:00'),
(7, 7, NULL, 5, 4, 'Good service.', '2024-02-13 12:00:00'),
(8, 8, 8, NULL, 5, 'Highly recommended!', '2024-02-15 12:00:00'),
(9, 9, NULL, 6, 3, 'Average experience.', '2024-02-17 12:00:00'),
(10, 10, NULL, 7, 4, 'Satisfied overall.', '2024-02-19 12:00:00');

-- Dump completed on 2024-01-20 13:45:10
