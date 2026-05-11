-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 26 mars 2026 à 08:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_dj_seux`
--

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('0fa0913c-b257-4fa4-96d1-30f1c19eb5c8', 'Manager', 'MANAGER', NULL),
('4900275f-73d2-43fd-ae51-2aaeeb234a28', 'User', 'USER', NULL),
('4d562f65-1eb5-4f6d-9473-feb70e1c8a1d', 'Admin', 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('27d6b7be-2c64-4eee-9d88-c8c021660545', '4900275f-73d2-43fd-ae51-2aaeeb234a28'),
('2ed2bcc6-b7d5-49d1-a8ff-7de96a032295', '4900275f-73d2-43fd-ae51-2aaeeb234a28'),
('3839d360-c54a-4217-b6a3-d64cd02965fe', '4900275f-73d2-43fd-ae51-2aaeeb234a28'),
('8c54d76a-1051-4ad2-b294-377f55a957e2', '4900275f-73d2-43fd-ae51-2aaeeb234a28'),
('cbb2698d-467e-4a34-be4a-5c9699c43d16', '4900275f-73d2-43fd-ae51-2aaeeb234a28'),
('d1943196-09cd-4b2e-a26a-4cfc2cbdf8b6', '4900275f-73d2-43fd-ae51-2aaeeb234a28');

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusers`
--

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
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('27d6b7be-2c64-4eee-9d88-c8c021660545', 'clementbourbon97410@gmail.com', 'CLEMENTBOURBON97410@GMAIL.COM', 'clementbourbon97410@gmail.com', 'CLEMENTBOURBON97410@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDLFHUbfaRQo7G/9ZEteFMj9dkCPvR3q/Whji0EEm712hiYubjUGNw5g4PrMvF4y6Q==', '4RRVLXAOTTE2DC5RABRN3KS7R7OLJXUQ', '50f4d49e-c181-4b12-9d4d-51dc0c99437e', NULL, 0, 0, NULL, 1, 0),
('2ed2bcc6-b7d5-49d1-a8ff-7de96a032295', 'clementbourbon97401@gmail.com', 'CLEMENTBOURBON97401@GMAIL.COM', 'clementbourbon97401@gmail.com', 'CLEMENTBOURBON97401@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJOa/HXXQD7sxsxNfZ7c4ra/RBSMy22XElfP3rRaXCv7q4wqAqFyr/YN9nmhAA6e8w==', 'QELRQNZFYTQSBR5YAGZGR7WLFL553PWW', '091547ec-8bd5-4991-b292-070cde194bc8', NULL, 0, 0, NULL, 1, 0),
('3839d360-c54a-4217-b6a3-d64cd02965fe', 'clementbourbon974@gmail.com', 'CLEMENTBOURBON974@GMAIL.COM', 'clementbourbon974@gmail.com', 'CLEMENTBOURBON974@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEC5PUTepqIzMHFZi850Wm0v2ZDdW/eY6DtrYvC9qaN5CkIsTTp438l8SeJiNaff2eg==', 'QCMLCRKT3DFNQ264YAW53BS6B6SNGXWT', 'b8ed11db-93c4-4736-b43f-f08d4232267e', NULL, 0, 0, NULL, 1, 0),
('8c54d76a-1051-4ad2-b294-377f55a957e2', 'clementbourbon785@gmail.com', 'CLEMENTBOURBON785@GMAIL.COM', 'clementbourbon785@gmail.com', 'CLEMENTBOURBON785@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEN7MfjBA6SNjyF3g0EUU0GFSX39qSlm4446LaPh8AaaHxMrUfvTcnpbLr+RCGTuxGQ==', 'NRJBKRH2WBEROYB2NJDYCKXGHDWR3FQN', 'b9d438df-3471-4628-bad5-8ff17f255e52', NULL, 0, 0, NULL, 1, 0),
('cbb2698d-467e-4a34-be4a-5c9699c43d16', 'tombenoit1230@gmail.com', 'TOMBENOIT1230@GMAIL.COM', 'tombenoit1230@gmail.com', 'TOMBENOIT1230@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAECQMkYOKK/Obazzj9WCuYCr9YqaBeu92Ro5pin6XhRqpZVxk9faetRarEprTN16+Kg==', '7CWGPODWBLOXE2OJ23UEFAZBLYTFQCIV', '367146ea-46bf-4cb0-a11a-886d94738ff8', NULL, 0, 0, NULL, 1, 0),
('d1943196-09cd-4b2e-a26a-4cfc2cbdf8b6', 'clementbourbon1230@gmail.com', 'CLEMENTBOURBON1230@GMAIL.COM', 'clementbourbon1230@gmail.com', 'CLEMENTBOURBON1230@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIX2vB4sU4aKFabEWNRAPUA7JyW8Q5JsInyqy/7cFy1wQDEex6NQBeqZEQYX38hc3Q==', 'AAD7U6CPEKVKIQOMAYQZMV4GA63L6SN2', '6729b3d8-4967-4ca3-a579-7a8c401d1506', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `id_prestation` int(11) NOT NULL,
  `id_media` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id_media` int(11) NOT NULL,
  `url_media` varchar(255) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id_media`, `url_media`, `id_type`) VALUES
(1, 'test.tkt', 1);

-- --------------------------------------------------------

--
-- Structure de la table `moyen_paiement`
--

CREATE TABLE `moyen_paiement` (
  `id_moyen_paiement` int(11) NOT NULL,
  `nom_moyen_paiement` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id_paiement` int(11) NOT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `id_moyen_paiement` int(11) DEFAULT NULL,
  `id_reservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestataire`
--

CREATE TABLE `prestataire` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `date_inscription` varchar(255) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `id_prestation` int(11) NOT NULL,
  `nom_prestation` varchar(255) DEFAULT NULL,
  `description_presta` varchar(255) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `propose`
--

CREATE TABLE `propose` (
  `id_prestation` int(11) NOT NULL,
  `id_prestataire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `date_prestation` date DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `id_prestation` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_media`
--

CREATE TABLE `type_media` (
  `id_type` int(11) NOT NULL,
  `nom_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_media`
--

INSERT INTO `type_media` (`id_type`, `nom_type`) VALUES
(1, 'Photo');

-- --------------------------------------------------------

--
-- Structure de la table `type_presta`
--

CREATE TABLE `type_presta` (
  `id_type` int(11) NOT NULL,
  `nom_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `AspNetUserId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `date_inscription`, `id_role`, `AspNetUserId`, `email`) VALUES
(4, 'Bourbon', 'Clement', '2026-03-23', NULL, 'cbb2698d-467e-4a34-be4a-5c9699c43d16', 'tombenoit1230@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Index pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Index pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`id_prestation`,`id_media`),
  ADD KEY `id_media` (`id_media`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id_media`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `moyen_paiement`
--
ALTER TABLE `moyen_paiement`
  ADD PRIMARY KEY (`id_moyen_paiement`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_moyen_paiement` (`id_moyen_paiement`),
  ADD KEY `id_reservation` (`id_reservation`);

--
-- Index pour la table `prestataire`
--
ALTER TABLE `prestataire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`id_prestation`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `propose`
--
ALTER TABLE `propose`
  ADD PRIMARY KEY (`id_prestation`,`id_prestataire`),
  ADD KEY `id_prestataire` (`id_prestataire`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_prestation` (`id_prestation`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `type_media`
--
ALTER TABLE `type_media`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `type_presta`
--
ALTER TABLE `type_presta`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `FK_a_u` (`AspNetUserId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id_media` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `moyen_paiement`
--
ALTER TABLE `moyen_paiement`
  MODIFY `id_moyen_paiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prestataire`
--
ALTER TABLE `prestataire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `id_prestation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_media`
--
ALTER TABLE `type_media`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_presta`
--
ALTER TABLE `type_presta`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_media` (`id_type`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`id_moyen_paiement`) REFERENCES `moyen_paiement` (`id_moyen_paiement`),
  ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`);

--
-- Contraintes pour la table `prestataire`
--
ALTER TABLE `prestataire`
  ADD CONSTRAINT `prestataire_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD CONSTRAINT `prestation_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_presta` (`id_type`);

--
-- Contraintes pour la table `propose`
--
ALTER TABLE `propose`
  ADD CONSTRAINT `propose_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  ADD CONSTRAINT `propose_ibfk_2` FOREIGN KEY (`id_prestataire`) REFERENCES `prestataire` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestation` (`id_prestation`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_a_u` FOREIGN KEY (`AspNetUserId`) REFERENCES `aspnetusers` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
