-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2015 at 08:28 PM
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
-- Table structure for table `biomes`
--

CREATE TABLE IF NOT EXISTS `biomes` (
  `biomes_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `climate` text COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`biomes_id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='types of biomes' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `biomes`
--

INSERT INTO `biomes` (`biomes_id`, `name`, `climate`, `location`) VALUES
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
-- Table structure for table `inhabitants`
--

CREATE TABLE IF NOT EXISTS `inhabitants` (
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
-- Dumping data for table `inhabitants`
--

INSERT INTO `inhabitants` (`inhabitants_id`, `name`, `species`, `gender`, `age`, `height`, `weight`) VALUES
(1, 'Grizzly Bear', 'Ursus arctos horribilis', 'male', 10, '3.3 ft', ' 397 - 794 lb'),
(2, 'Grizzly Bear', 'Ursus arctos horribilis', 'female', 9, '3.3 ft', '287 - 441 lb'),
(3, 'Grey Wolf', 'Canis Lupus', 'male', 9, '2.6 - 2.8 ft ', '95 - 99 lb'),
(4, 'Grey Wolf', 'Canis lupus', 'female', 10, '2.6 - 2.8 ft ', ' 79 - 85 lb ');

-- --------------------------------------------------------

--
-- Table structure for table `sounds`
--

CREATE TABLE IF NOT EXISTS `sounds` (
  `sounds_id` int(8) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `file_location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `inhabitants_id` int(11) NOT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `temperature` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `season` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sounds_id`),
  KEY `label` (`label`(255),`file_location`(255)),
  KEY `inhabitants_id` (`inhabitants_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sounds in a biome' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sounds`
--

INSERT INTO `sounds` (`sounds_id`, `label`, `description`, `file_location`, `inhabitants_id`, `location`, `temperature`, `time`, `season`) VALUES
(1, 'Grizzly Male', 'Roar of a male Grizzly Bear', 'T1', 1, 'Alaska', '50°F', '0000-00-00', 'spring'),
(2, 'Grizzly Bear', 'Female Grizzly Bear Roar.', 'T2', 2, 'Alaska', '60°F', '0000-00-00', 'spring'),
(3, 'Grey Wolf', 'Male Grey Wolf howl', 't3', 3, 'Montana', '30°F', '0000-00-00', 'spring'),
(4, 'Grey Wolf', 'Female grey wolf howl.', 't4', 4, 'Utah', '60°F', '0000-00-00', 'summer');

-- --------------------------------------------------------

--
-- Table structure for table `sounds_biomes`
--

CREATE TABLE IF NOT EXISTS `sounds_biomes` (
  `biomes_id` int(8) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  UNIQUE KEY `biomes_id` (`biomes_id`),
  KEY `biomes_id_2` (`biomes_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sounds_general`
--

CREATE TABLE IF NOT EXISTS `sounds_general` (
  `general_id` int(8) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  KEY `general_id` (`general_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sounds_inhabitants`
--

CREATE TABLE IF NOT EXISTS `sounds_inhabitants` (
  `inhabitants_id` int(11) NOT NULL,
  `sounds_id` int(8) NOT NULL,
  KEY `inhabitants_id` (`inhabitants_id`),
  KEY `sounds_id` (`sounds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sounds`
--
ALTER TABLE `sounds`
  ADD CONSTRAINT `sounds_ibfk_1` FOREIGN KEY (`inhabitants_id`) REFERENCES `inhabitants` (`inhabitants_id`);

--
-- Constraints for table `sounds_biomes`
--
ALTER TABLE `sounds_biomes`
  ADD CONSTRAINT `sounds_biomes_ibfk_2` FOREIGN KEY (`sounds_id`) REFERENCES `sounds` (`sounds_id`),
  ADD CONSTRAINT `sounds_biomes_ibfk_1` FOREIGN KEY (`biomes_id`) REFERENCES `biomes` (`biomes_id`);

--
-- Constraints for table `sounds_general`
--
ALTER TABLE `sounds_general`
  ADD CONSTRAINT `sounds_general_ibfk_2` FOREIGN KEY (`sounds_id`) REFERENCES `sounds` (`sounds_id`),
  ADD CONSTRAINT `sounds_general_ibfk_1` FOREIGN KEY (`general_id`) REFERENCES `general` (`general_id`);

--
-- Constraints for table `sounds_inhabitants`
--
ALTER TABLE `sounds_inhabitants`
  ADD CONSTRAINT `sounds_inhabitants_ibfk_2` FOREIGN KEY (`inhabitants_id`) REFERENCES `inhabitants` (`inhabitants_id`),
  ADD CONSTRAINT `sounds_inhabitants_ibfk_1` FOREIGN KEY (`sounds_id`) REFERENCES `sounds` (`sounds_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
