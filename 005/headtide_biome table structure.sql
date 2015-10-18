-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2015 at 10:22 PM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `headtide_biome`
--

-- --------------------------------------------------------

--
-- Table structure for table `biome`
--

CREATE TABLE IF NOT EXISTS `biome` (
  `biomes_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `climate` text COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`biomes_id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='types of biomes' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `biome`
--

INSERT INTO `biome` (`biomes_id`, `name`, `climate`, `location`) VALUES
(1, 'Coniferous Taiga forest', '12-33” rain per year,\r\nAverage Temp. below freezing 6 months of year.', 'North America in the North, Russia (above the deciduous forest).'),
(2, 'Deciduous Temperate forest', ' 30-60” rain per year,  Average Temp. 50° F', 'Eastern North America,\nmiddle Europe, Asia, Paraguay, New Zealand');

-- --------------------------------------------------------

--
-- Table structure for table `general`
--

CREATE TABLE IF NOT EXISTS `general` (
  `general_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`general_id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `general`
--

INSERT INTO `general` (`general_id`, `name`, `type`) VALUES
(1, 'Wind', 'breeze'),
(2, 'Wind', 'gale'),
(3, 'Wind', 'Storm'),
(4, 'Rain', 'drizzle'),
(5, 'Rain', 'Downpour');

-- --------------------------------------------------------

--
-- Table structure for table `inhabitant`
--

CREATE TABLE IF NOT EXISTS `inhabitant` (
  `inhabitants_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `species` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `height` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`inhabitants_id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `inhabitant`
--

INSERT INTO `inhabitant` (`inhabitants_id`, `name`, `species`, `gender`, `age`, `height`, `weight`) VALUES
(1, 'Grizzly Bear', 'Ursus arctos horribilis', 'male', 10, '3.3 ft', ' 397 - 794 lb'),
(2, 'Grizzly Bear', 'Ursus arctos horribilis', 'female', 9, '3.3 ft', '287 - 441 lb'),
(3, 'Grey Wolf', 'Canis Lupus', 'male', 9, '2.6 - 2.8 ft ', '95 - 99 lb'),
(4, 'Grey Wolf', 'Canis lupus', 'female', 10, '2.6 - 2.8 ft ', ' 79 - 85 lb ');

-- --------------------------------------------------------

--
-- Table structure for table `sound`
--

CREATE TABLE IF NOT EXISTS `sound` (
  `sounds_id` int(8) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `file_location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `inhabitants_id` int(11) NOT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `temperature` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `season` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sounds_id`),
  KEY `label` (`label`(255),`file_location`(255)),
  KEY `inhabitants_id` (`inhabitants_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sounds in a biome' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sound`
--

INSERT INTO `sound` (`sounds_id`, `label`, `description`, `file_location`, `inhabitants_id`, `location`, `temperature`, `Date`, `season`) VALUES
(1, 'Grizzly Male', 'Roar of a male Grizzly Bear', 'T1', 1, 'Alaska', '50°F', '2014-09-08', 'fall'),
(2, 'Grizzly Bear', 'Female Grizzly Bear Roar.', 'T2', 2, 'Alaska', '60°F', '2015-04-15', 'spring'),
(3, 'Grey Wolf', 'Male Grey Wolf howl', 'T3', 3, 'Montana', '30°F', '2015-10-13', 'fall'),
(4, 'Grey Wolf', 'Female grey wolf howl.', 'T4', 4, 'Utah', '60°F', '2015-03-17', 'winter');

-- --------------------------------------------------------

--
-- Table structure for table `sound_biome`
--

CREATE TABLE IF NOT EXISTS `sound_biome` (
  `biomes_id` int(8) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  UNIQUE KEY `biomes_id` (`biomes_id`),
  KEY `biomes_id_2` (`biomes_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sound_general`
--

CREATE TABLE IF NOT EXISTS `sound_general` (
  `general_id` int(8) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  KEY `general_id` (`general_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sound_inhabitant`
--

CREATE TABLE IF NOT EXISTS `sound_inhabitant` (
  `inhabitants_id` int(11) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  KEY `inhabitants_id` (`inhabitants_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sound`
--
ALTER TABLE `sound`
  ADD CONSTRAINT `sound_ibfk_1` FOREIGN KEY (`inhabitants_id`) REFERENCES `inhabitant` (`inhabitants_id`);

--
-- Constraints for table `sound_biome`
--
ALTER TABLE `sound_biome`
  ADD CONSTRAINT `sound_biome_ibfk_2` FOREIGN KEY (`sounds_id`) REFERENCES `sound` (`sounds_id`),
  ADD CONSTRAINT `sound_biome_ibfk_1` FOREIGN KEY (`biomes_id`) REFERENCES `biome` (`biomes_id`);

--
-- Constraints for table `sound_general`
--
ALTER TABLE `sound_general`
  ADD CONSTRAINT `sound_general_ibfk_2` FOREIGN KEY (`sounds_id`) REFERENCES `sound` (`sounds_id`),
  ADD CONSTRAINT `sound_general_ibfk_1` FOREIGN KEY (`general_id`) REFERENCES `general` (`general_id`);

--
-- Constraints for table `sound_inhabitant`
--
ALTER TABLE `sound_inhabitant`
  ADD CONSTRAINT `sound_inhabitant_ibfk_2` FOREIGN KEY (`inhabitants_id`) REFERENCES `inhabitant` (`inhabitants_id`),
  ADD CONSTRAINT `sound_inhabitant_ibfk_1` FOREIGN KEY (`sounds_id`) REFERENCES `sound` (`sounds_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
