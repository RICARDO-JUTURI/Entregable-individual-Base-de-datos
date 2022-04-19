CREATE TABLE `categories` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `banner` varchar(45) NOT NULL
);

CREATE TABLE `notes` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` timestamp DEFAULT NULL,
  `updatedAt` timestamp DEFAULT NULL,
  `images` text DEFAULT NULL
);

CREATE TABLE `users` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `pass` varchar(70) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `rol` int(2) NOT NULL DEFAULT 0,
  `note_id` int(11) NOT NULL,
  `createdAt` timestamp DEFAULT NULL,
  `updatedAt` timestamp DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL
);

ALTER TABLE `categories` ADD FOREIGN KEY (`id`) REFERENCES `notes` (`categoryId`);

ALTER TABLE `notes` ADD FOREIGN KEY (`id`) REFERENCES `users` (`note_id`);

CREATE UNIQUE INDEX `id_UNIQUE` ON `categories` (`id`);

CREATE UNIQUE INDEX `id_UNIQUE` ON `notes` (`id`);

CREATE INDEX `subcategory_idx` ON `notes` (`categoryId`);

CREATE UNIQUE INDEX `id_UNIQUE` ON `users` (`id`);