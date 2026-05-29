-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: projet_dj_seux
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('0fa0913c-b257-4fa4-96d1-30f1c19eb5c8','Manager','MANAGER',NULL),('4900275f-73d2-43fd-ae51-2aaeeb234a28','User','USER',NULL),('4d562f65-1eb5-4f6d-9473-feb70e1c8a1d','Admin','ADMIN',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('003c1130-0ab8-49d3-bde1-ac112a5b42fc','4d562f65-1eb5-4f6d-9473-feb70e1c8a1d'),('037c7cb2-97c9-4079-a095-cba6e765beda','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('27d6b7be-2c64-4eee-9d88-c8c021660545','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('2ed2bcc6-b7d5-49d1-a8ff-7de96a032295','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('3839d360-c54a-4217-b6a3-d64cd02965fe','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('5158aa32-e0d0-4213-86c7-23cd8355db25','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('5fe7414c-86e4-4548-b56a-77565dfec19d','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('6a50cf72-14c4-4536-a58e-b4c1aab9d393','0fa0913c-b257-4fa4-96d1-30f1c19eb5c8'),('84aecc43-2c05-4075-bc57-5e661eb79f0d','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('8c54d76a-1051-4ad2-b294-377f55a957e2','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('c2b53879-61aa-462c-9589-a59cf23eb1d9','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('cbb2698d-467e-4a34-be4a-5c9699c43d16','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('d1943196-09cd-4b2e-a26a-4cfc2cbdf8b6','4900275f-73d2-43fd-ae51-2aaeeb234a28'),('fd90ad6c-1f4c-4139-843b-bb40b50e6bd8','4900275f-73d2-43fd-ae51-2aaeeb234a28');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('003c1130-0ab8-49d3-bde1-ac112a5b42fc','luco.mina@hotmail.fr','LUCO.MINA@HOTMAIL.FR','luco.mina@hotmail.fr','LUCO.MINA@HOTMAIL.FR',0,'AQAAAAIAAYagAAAAEIVB+nQ4jdLKlT0Ju6gBE0xyqMc8nWFBytBEyz1GEGsnPeSxkY1/YSXNk1Sbt6nfPQ==','RDTFGVB35QSO3F24JAXO5ZJENH7IOL4Q','56c0b719-563c-43e1-be37-f460a1a88cea',NULL,0,0,NULL,1,0),('037c7cb2-97c9-4079-a095-cba6e765beda','totoplayy@gmail.com','TOTOPLAYY@GMAIL.COM','totoplayy@gmail.com','TOTOPLAYY@GMAIL.COM',0,'AQAAAAIAAYagAAAAEGm1kvJZ1xH2gMrXasaJ2VUaLz+EoxAHaV5KmyFt2jTdoZWpqEAf7vxPT0Kqd1DsSA==','YBMXE5MONCXJRNLPMGYGQOEAXMJ6UPE2','6fa02e45-5a29-4a22-a773-d037f6e94253',NULL,0,0,NULL,1,0),('27d6b7be-2c64-4eee-9d88-c8c021660545','clementbourbon97410@gmail.com','CLEMENTBOURBON97410@GMAIL.COM','clementbourbon97410@gmail.com','CLEMENTBOURBON97410@GMAIL.COM',0,'AQAAAAIAAYagAAAAEDLFHUbfaRQo7G/9ZEteFMj9dkCPvR3q/Whji0EEm712hiYubjUGNw5g4PrMvF4y6Q==','4RRVLXAOTTE2DC5RABRN3KS7R7OLJXUQ','50f4d49e-c181-4b12-9d4d-51dc0c99437e',NULL,0,0,NULL,1,0),('2ed2bcc6-b7d5-49d1-a8ff-7de96a032295','clementbourbon97401@gmail.com','CLEMENTBOURBON97401@GMAIL.COM','clementbourbon97401@gmail.com','CLEMENTBOURBON97401@GMAIL.COM',0,'AQAAAAIAAYagAAAAEJOa/HXXQD7sxsxNfZ7c4ra/RBSMy22XElfP3rRaXCv7q4wqAqFyr/YN9nmhAA6e8w==','QELRQNZFYTQSBR5YAGZGR7WLFL553PWW','091547ec-8bd5-4991-b292-070cde194bc8',NULL,0,0,NULL,1,0),('3839d360-c54a-4217-b6a3-d64cd02965fe','clementbourbon974@gmail.com','CLEMENTBOURBON974@GMAIL.COM','clementbourbon974@gmail.com','CLEMENTBOURBON974@GMAIL.COM',0,'AQAAAAIAAYagAAAAEC5PUTepqIzMHFZi850Wm0v2ZDdW/eY6DtrYvC9qaN5CkIsTTp438l8SeJiNaff2eg==','QCMLCRKT3DFNQ264YAW53BS6B6SNGXWT','b8ed11db-93c4-4736-b43f-f08d4232267e',NULL,0,0,NULL,1,0),('5158aa32-e0d0-4213-86c7-23cd8355db25','test2@test.com','TEST2@TEST.COM','test2@test.com','TEST2@TEST.COM',0,'AQAAAAIAAYagAAAAEM6Ooevvm+oNWxWTM/+ZKeQtutsLnjK7rvK4JJ0y7IkHo1/FxFYwXQx0wUPQ3PHukA==','6EX236IGDPRLVWRDNOI5KVKERY75WXGM','0f33a81c-2586-4df6-b547-5d2e24f81136',NULL,0,0,NULL,1,0),('5fe7414c-86e4-4548-b56a-77565dfec19d','anae.fev@gmail.com','ANAE.FEV@GMAIL.COM','anae.fev@gmail.com','ANAE.FEV@GMAIL.COM',0,'AQAAAAIAAYagAAAAEGviCe7P3Gad7JihgEuj5TlaRGMzcc3RW9Hl1QKPJIYui1yyJe3n0zWC4D5F5zn0sg==','OMKRIYC4YLNL7QUY6IETHUXY23ZZZFQM','f3a7bf5a-4f95-4c31-9585-cfa779af074b',NULL,0,0,NULL,1,0),('6a50cf72-14c4-4536-a58e-b4c1aab9d393','clement.bourbon@sio-carriat.com','CLEMENT.BOURBON@SIO-CARRIAT.COM','clement.bourbon@sio-carriat.com','CLEMENT.BOURBON@SIO-CARRIAT.COM',0,'AQAAAAIAAYagAAAAEHC/pFzQj5vIv973rTrJRKUTGNw1Kqbn1Ned5bK+mFdN124y/fCUDFPX5HLg/G0txg==','3GQ7G37LOPEZ5C2MKILGSO63GFTAJ4NC','3e8e70e1-020a-437e-93cf-ba31062b3743',NULL,0,0,NULL,1,0),('84aecc43-2c05-4075-bc57-5e661eb79f0d','test@test.com','TEST@TEST.COM','test@test.com','TEST@TEST.COM',0,'AQAAAAIAAYagAAAAEKEP6s9ePlb3kNcsGWHDTPGn3NvGqcm/OH/vgoYgW1vgi3oy9pOoa990aEdmiIcxCQ==','LNWA7QOQZD4C3AE3GZF6Q64VGFWM4DWG','d261a660-463a-4052-8691-9d41fd915c4f',NULL,0,0,NULL,1,0),('8c54d76a-1051-4ad2-b294-377f55a957e2','clementbourbon785@gmail.com','CLEMENTBOURBON785@GMAIL.COM','clementbourbon785@gmail.com','CLEMENTBOURBON785@GMAIL.COM',0,'AQAAAAIAAYagAAAAEN7MfjBA6SNjyF3g0EUU0GFSX39qSlm4446LaPh8AaaHxMrUfvTcnpbLr+RCGTuxGQ==','NRJBKRH2WBEROYB2NJDYCKXGHDWR3FQN','b9d438df-3471-4628-bad5-8ff17f255e52',NULL,0,0,NULL,1,0),('c2b53879-61aa-462c-9589-a59cf23eb1d9','jetestunderniertruc@gmail.com','JETESTUNDERNIERTRUC@GMAIL.COM','jetestunderniertruc@gmail.com','JETESTUNDERNIERTRUC@GMAIL.COM',0,'AQAAAAIAAYagAAAAEENpFWQdy9UN0LTMaM6lSAUbpFL07BFlndmGiMwVcq0mJmkK54KemodTdAhngTpm2A==','RHHW7CWQDZJNH6YWTUFQZ4WC25EGFERI','df892c93-2451-49c4-ae6f-5034e05da03b',NULL,0,0,NULL,1,0),('cbb2698d-467e-4a34-be4a-5c9699c43d16','tombenoit1230@gmail.com','TOMBENOIT1230@GMAIL.COM','tombenoit1230@gmail.com','TOMBENOIT1230@GMAIL.COM',0,'AQAAAAIAAYagAAAAECQMkYOKK/Obazzj9WCuYCr9YqaBeu92Ro5pin6XhRqpZVxk9faetRarEprTN16+Kg==','7CWGPODWBLOXE2OJ23UEFAZBLYTFQCIV','367146ea-46bf-4cb0-a11a-886d94738ff8',NULL,0,0,NULL,1,0),('d1943196-09cd-4b2e-a26a-4cfc2cbdf8b6','clementbourbon1230@gmail.com','CLEMENTBOURBON1230@GMAIL.COM','clementbourbon1230@gmail.com','CLEMENTBOURBON1230@GMAIL.COM',0,'AQAAAAIAAYagAAAAEIX2vB4sU4aKFabEWNRAPUA7JyW8Q5JsInyqy/7cFy1wQDEex6NQBeqZEQYX38hc3Q==','AAD7U6CPEKVKIQOMAYQZMV4GA63L6SN2','6729b3d8-4967-4ca3-a579-7a8c401d1506',NULL,0,0,NULL,1,0),('fd90ad6c-1f4c-4139-843b-bb40b50e6bd8','fev.anae@gmail.com','FEV.ANAE@GMAIL.COM','fev.anae@gmail.com','FEV.ANAE@GMAIL.COM',0,'AQAAAAIAAYagAAAAEKYoQA1RlehoNrTKijMrebBlRft+eQvonesJTkR4DrIGgj93T+/BH0DhdlTJKsAZ5w==','LTH6BA7HZA4FYEKM6QDLB7JT5DOC7N6C','92846bd8-5d33-4f7b-8786-88fbc4263810',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenir` (
  `id_prestation` int(11) NOT NULL,
  `id_media` int(11) NOT NULL,
  PRIMARY KEY (`id_prestation`,`id_media`),
  KEY `id_media` (`id_media`),
  CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenir`
--

LOCK TABLES `contenir` WRITE;
/*!40000 ALTER TABLE `contenir` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `url_media` varchar(255) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_media`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_media` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'test.tkt',1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moyen_paiement`
--

DROP TABLE IF EXISTS `moyen_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moyen_paiement` (
  `id_moyen_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `nom_moyen_paiement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_moyen_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moyen_paiement`
--

LOCK TABLES `moyen_paiement` WRITE;
/*!40000 ALTER TABLE `moyen_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `moyen_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `id_moyen_paiement` int(11) DEFAULT NULL,
  `id_reservation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_paiement`),
  KEY `id_moyen_paiement` (`id_moyen_paiement`),
  KEY `id_reservation` (`id_reservation`),
  CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_moyen_paiement`) REFERENCES `moyen_paiement` (`id_moyen_paiement`),
  CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestataire`
--

DROP TABLE IF EXISTS `prestataire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestataire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `date_inscription` varchar(255) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateur` (`id_utilisateur`),
  CONSTRAINT `prestataire_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestataire`
--

LOCK TABLES `prestataire` WRITE;
/*!40000 ALTER TABLE `prestataire` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestataire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestation` (
  `id_prestation` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prestation` varchar(255) DEFAULT NULL,
  `description_presta` varchar(255) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_prestataire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_prestation`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `prestation_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_presta` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestation`
--

LOCK TABLES `prestation` WRITE;
/*!40000 ALTER TABLE `prestation` DISABLE KEYS */;
INSERT INTO `prestation` VALUES (1,'Pack Mariage Premium','Animation musicale complète pour votre mariage, 6h de set incluant cocktail et soirée',1200.00,1,NULL),(2,'Pack Mariage Essentiel','Animation soirée mariage 4h avec sono et lumières',800.00,1,NULL),(3,'Soirée Club Privée','Set DJ pour soirée privée jusqu\'à 200 personnes, 3h',500.00,2,NULL),(4,'Soirée Entreprise','Animation musicale pour événement d\'entreprise, 4h',700.00,2,NULL),(5,'Festival Open Air','Set DJ pour festival en plein air, 2h sur scène',900.00,3,NULL),(6,'Anniversaire Fun','Animation DJ pour fête d\'anniversaire, 3h',350.00,4,NULL),(7,'DJ set Shatta Bouyon','Un set afro caribéeen',500.00,1,12),(8,'DJ tech','Ttkt',124.00,1,12);
/*!40000 ALTER TABLE `prestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propose`
--

DROP TABLE IF EXISTS `propose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propose` (
  `id_prestation` int(11) NOT NULL,
  `id_prestataire` int(11) NOT NULL,
  PRIMARY KEY (`id_prestation`,`id_prestataire`),
  KEY `id_prestataire` (`id_prestataire`),
  CONSTRAINT `propose_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  CONSTRAINT `propose_ibfk_2` FOREIGN KEY (`id_prestataire`) REFERENCES `prestataire` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propose`
--

LOCK TABLES `propose` WRITE;
/*!40000 ALTER TABLE `propose` DISABLE KEYS */;
/*!40000 ALTER TABLE `propose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `date_reservation` date DEFAULT NULL,
  `date_prestation` date DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `id_prestation` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `statut` varchar(50) DEFAULT 'En attente',
  PRIMARY KEY (`id_reservation`),
  KEY `id_prestation` (`id_prestation`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (14,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',1,10,'En attente'),(15,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',2,10,'En attente'),(16,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',7,11,'Acceptée'),(17,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',8,11,'Refusée'),(18,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',6,11,'En attente'),(19,'2026-05-29','2026-04-15','Plage de Tahiti - Motu',0,'Non renseignée',8,11,'En attente');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_media`
--

DROP TABLE IF EXISTS `type_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_media` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_media`
--

LOCK TABLES `type_media` WRITE;
/*!40000 ALTER TABLE `type_media` DISABLE KEYS */;
INSERT INTO `type_media` VALUES (1,'Photo');
/*!40000 ALTER TABLE `type_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_presta`
--

DROP TABLE IF EXISTS `type_presta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_presta` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_presta`
--

LOCK TABLES `type_presta` WRITE;
/*!40000 ALTER TABLE `type_presta` DISABLE KEYS */;
INSERT INTO `type_presta` VALUES (1,'DJ Mariage'),(2,'DJ Soirée'),(3,'DJ Festival'),(4,'DJ Anniversaire');
/*!40000 ALTER TABLE `type_presta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `AspNetUserId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_banned` tinyint(4) DEFAULT 0,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `FK_a_u` (`AspNetUserId`),
  CONSTRAINT `FK_a_u` FOREIGN KEY (`AspNetUserId`) REFERENCES `aspnetusers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (4,'Bourbon','Clement','2026-03-23','cbb2698d-467e-4a34-be4a-5c9699c43d16','tombenoit1230@gmail.com',0,NULL,NULL),(5,'Bourbon','Mina','2026-05-06','84aecc43-2c05-4075-bc57-5e661eb79f0d','test@test.com',0,NULL,NULL),(6,'Bourbon','Mina','2026-05-06','5158aa32-e0d0-4213-86c7-23cd8355db25','test2@test.com',0,NULL,NULL),(7,'Ben','Tom','2026-05-06','037c7cb2-97c9-4079-a095-cba6e765beda','totoplayy@gmail.com',0,NULL,NULL),(8,'Bouuwbon','Clément','2026-05-06','c2b53879-61aa-462c-9589-a59cf23eb1d9','jetestunderniertruc@gmail.com',0,NULL,NULL),(9,'bourbon','luco','2026-05-06','003c1130-0ab8-49d3-bde1-ac112a5b42fc','luco.mina@hotmail.fr',0,NULL,NULL),(10,'Fevry','Anae ','2026-05-29','5fe7414c-86e4-4548-b56a-77565dfec19d','anae.fev@gmail.com',0,'0778252004','01000'),(11,'Anae','Fevry','2026-05-29','fd90ad6c-1f4c-4139-843b-bb40b50e6bd8','fev.anae@gmail.com',0,'0778252004','45 Rue Haroun Tazieff'),(12,'Etudiant','Clem','2026-05-29','6a50cf72-14c4-4536-a58e-b4c1aab9d393','clement.bourbon@sio-carriat.com',0,NULL,NULL);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29 20:44:11
