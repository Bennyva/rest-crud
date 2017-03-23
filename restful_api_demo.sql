-- Host: localhost
-- Generation Time: Oct 07, 2014 at 11:05 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22
CREATE database `restful_api_demo`;
USE `restful_api_demo`;




SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `restful_api_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--
DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
   `user_id` int(70) NOT NULL AUTO_INCREMENT,
   `user_email` varchar(45) NOT NULL,
   `user_password` varchar(45) DEFAULT NULL,
   `user_join_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`user_id`),
   UNIQUE KEY `user_email_UNIQUE` (`user_email`)
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;





/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
