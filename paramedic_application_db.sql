-- Host: localhost
-- Generation Time: Oct 07, 2014 at 11:05 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

DROP DATABASE IF EXISTS `paramedic_application_db`;
CREATE database `paramedic_application_db`;
USE `paramedic_application_db`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paramedic_application_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`user_id` int(255) NOT NULL AUTO_INCREMENT,
	`user_email` varchar(45) NOT NULL,
	`last_log_in` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`log_in_count` int(255) NOT NULL,
    `user_first_name` varchar(45) NOT NULL,
    `user_last_name` varchar(50) NOT NULL,
    
	PRIMARY KEY (`user_id`),
	UNIQUE KEY `user_email_UNIQUE` (`user_email`)
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
--
-- Populate users
--

INSERT INTO `users` (`user_id`, `user_email`, `last_log_in`, `log_in_count`, `user_first_name`, `user_last_name`) VALUES (1, 'benjaminvanarragon@gmail.com', '2013-08-05 18:19:03', 1, 'Benjamin', 'Vanarragon');

--
-- Table structure for table `categories`
--
DROP TABLE IF EXISTS `categories`;
 
 CREATE TABLE `categories` (
	`category_id` int(255) NOT NULL AUTO_INCREMENT,
	`category_name` varchar(255) NOT NULL,
    `category_desc` varchar(255) NOT NULL,
      
	PRIMARY KEY (`category_id`)
   
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
--
-- Populate categories
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_desc`) VALUES (1, 'Cardiovascular', 'Questions relating to, or involving the heart and blood vessels.');
INSERT INTO `categories` (`category_id`, `category_name`, `category_desc`) VALUES (2, 'Drugs', 'Questions on medicines sold directly without a prescription OR pharmaceutical drugs.');
INSERT INTO `categories` (`category_id`, `category_name`, `category_desc`) VALUES (3, 'Electrocardiogram', 'Questions on recordings or descriptions of a person\'s heartbeat produced by electrocardiography');

--
-- Table structure for table `results`
--
DROP TABLE IF EXISTS `results`;

CREATE TABLE `results` (
	`result_id` int(255) NOT NULL AUTO_INCREMENT,
	`result_score` int(255) NOT NULL,
	`user_id` int(255) NOT NULL,
	
	`category_id` int(255) NOT NULL,
	`total_length` int(255) NOT NULL,
	`date_written` timestamp NULL DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (`result_id`),
	CONSTRAINT FK_RESULTS_USERS FOREIGN KEY (`user_id`) REFERENCES users(`user_id`),
	CONSTRAINT FK_RESULTS_CATEGORIES FOREIGN KEY (`category_id`) REFERENCES categories(`category_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
 --
-- Populate results
-- 
 
INSERT INTO `results` (`result_id`, `result_score`, `user_id`, `category_id`, `total_length`, `date_written`) VALUES (1, 75, 1, 2, 100, '2013-08-05 18:28:52');

--
-- Table structure for table `questions`
--
DROP TABLE IF EXISTS `questions`;
 
 CREATE TABLE `questions` (
	`question_id` int(255) NOT NULL AUTO_INCREMENT,
	`category_id` int(255) NOT NULL,
	`question_text` varchar(255) NOT NULL,
    `question_type_id` int(10) NOT NULL,
         
	PRIMARY KEY (`question_id`),
	CONSTRAINT FK_QUESTIONS_CATEGORIES FOREIGN KEY (`category_id`) REFERENCES categories(`category_id`)
   
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
--
-- Populate questions
--

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (1, 1, 'Cardiovasular choose one: Question 1', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (2, 1, 'Cardiovasular choose one: Question 2', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (3, 1, 'Cardiovasular choose one: Question 3', 1);
/*
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (4, 1, 'Cardiovasular choose multi: Question 1', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (5, 1, 'Cardiovasular choose multi: Question 2', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (6, 1, 'Cardiovasular choose multi: Question 3', 2);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (7, 1, 'Cardiovasular type one: Question 1', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (8, 1, 'Cardiovasular type one: Question 2', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (9, 1, 'Cardiovasular type one: Question 3', 3);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (10, 1, 'Cardiovasular type multi: Question 1', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (11, 1, 'Cardiovasular type multi: Question 2', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (12, 1, 'Cardiovasular type multi: Question 3', 4);
*/
-- ===============================

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (13, 2, 'Drugs choose one: Question 1', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (14, 2, 'Drugs choose one: Question 2', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (15, 2, 'Drugs choose one: Question 3', 1);
/*
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (16, 2, 'Drugs choose multi: Question 1', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (17, 2, 'Drugs choose multi: Question 2', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (18, 2, 'Drugs choose multi: Question 3', 2);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (19, 2, 'Drugs type one: Question 1', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (20, 2, 'Drugs type one: Question 2', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (21, 2, 'Drugs type one: Question 3', 3);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (22, 2, 'Drugs type multi: Question 1', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (23, 2, 'Drugs type multi: Question 2', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (24, 2, 'Drugs type multi: Question 3', 4);
*/
-- ===============================

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (25, 3, 'Electrocardiogram choose one: Question 1', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (26, 3, 'Electrocardiogram choose one: Question 2', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (27, 3, 'Electrocardiogram choose one: Question 3', 1);
/*
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (28, 3, 'Electrocardiogram choose multi: Question 1', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (29, 3, 'Electrocardiogram choose multi: Question 2', 2);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (30, 3, 'Electrocardiogram choose multi: Question 3', 2);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (31, 3, 'Electrocardiogram type one: Question 1', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (32, 3, 'Electrocardiogram type one: Question 2', 3);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (33, 3, 'Electrocardiogram type one: Question 3', 3);

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (34, 3, 'Electrocardiogram type multi: Question 1', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (35, 3, 'Electrocardiogram type multi: Question 2', 4);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (36, 3, 'Electrocardiogram type multi: Question 3', 4);
*/
--
-- Table structure for table `answers`
--
DROP TABLE IF EXISTS `answers`;
 
 CREATE TABLE `answers` (
	`answer_id` int(255) NOT NULL AUTO_INCREMENT,
	`question_id` int(255) NOT NULL,
	`isCorrect` tinyint NOT NULL,
	`answer_text` varchar(255) NOT NULL,
    `category_id` int(255) NOT NULL,
         
	PRIMARY KEY (`answer_id`),
	CONSTRAINT FK_ANSWERS_QUESTION FOREIGN KEY (`question_id`) REFERENCES questions(`question_id`),
    CONSTRAINT FK_ANSWERS_CATEGORY FOREIGN KEY (`category_id`) REFERENCES categories(`category_id`)
   
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
--
-- Populate answers
--

-- =============================================
-- CARDIOVASCULAR ANSWERS FOR ALL TYPES
-- =============================================
-- question 1 answers - choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (1, 1, 0, 'A: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (2, 1, 0, 'B: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (3, 1, 1, 'C: Cardiovasular correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (4, 1, 0, 'D: Cardiovasular not correct', 1);

-- question 2 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (5, 2, 1, 'A: Cardiovasular correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (6, 2, 0, 'B: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (7, 2, 0, 'C: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (8, 2, 0, 'D: Cardiovasular not correct', 1);

-- question 3 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (9, 3, 0, 'A: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (10, 3, 0, 'B: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (11, 3, 0, 'C: Cardiovasular not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (12, 3, 1, 'D: Cardiovasular correct', 1);

-- =========================================
/*
-- question 4 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (13, 4, 0, 'A: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (14, 4, 1, 'B: correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (15, 4, 0, 'C: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (16, 4, 1, 'D: correct', 1);

-- question 5 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (17, 5, 0, 'A: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (18, 5, 1, 'B: correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (19, 5, 0, 'C: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (20, 5, 1, 'D: correct', 1);

-- question 6 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (21, 6, 0, 'A: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (22, 6, 1, 'B: correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (23, 6, 0, 'C: not correct', 1);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`,`category_id`) VALUES (24, 6, 1, 'D: correct', 1);
*/
-- =========================================
-- CAN DEFINE YOUR OWN CORRECT ANSWERS
-- question 7 answers- type one
/*
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (25, 7, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (26, 7, 1, 'B: typed similar too');

-- question 8 answers- type one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (29, 8, 1, 'A: typed similar to');

-- question 9 answers- type one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (33, 9, 1, 'A: typed similar to');

-- =========================================
-- CAN HAVE UP TO ANY AMOUNT OF MULTIPLE CORRECT WAYS TO TYPE THE ANSWER - AS YOU WANT
-- question 10 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (37, 10, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (38, 10, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (39, 10, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (40, 10, 1, 'D: typed similar two');

-- question 11 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (41, 11, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (42, 11, 1, 'B: typed similar too');

-- question 12 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (45, 12, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (46, 12, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (47, 12, 1, 'C: typed similar 2');
*/

-- =============================================
-- DRUGS ANSWERS FOR ALL TYPES
-- =============================================
-- question 13 answers - choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (49, 13, 0, 'A: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (50, 13, 0, 'B: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (51, 13, 1, 'C: DRUGS correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (52, 13, 0, 'D: DRUGS not correct',2);

-- question 14 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (53, 14, 1, 'A: DRUGS correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (54, 14, 0, 'B: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (55, 14, 0, 'C: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (56, 14, 0, 'D: DRUGS not correct',2);

-- question 15 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (57, 15, 0, 'A: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (58, 15, 0, 'B: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (59, 15, 0, 'C: DRUGS not correct',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (60, 15, 1, 'D: DRUGS correct',2);

-- =========================================






/*
-- question 4 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (13, 4, 0, 'A: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (14, 4, 1, 'B: correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (15, 4, 0, 'C: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (16, 4, 1, 'D: correct');

-- question 5 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (17, 5, 0, 'A: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (18, 5, 1, 'B: correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (19, 5, 0, 'C: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (20, 5, 1, 'D: correct');

-- question 6 answers- choose multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (21, 6, 0, 'A: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (22, 6, 1, 'B: correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (23, 6, 0, 'C: not correct');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (24, 6, 1, 'D: correct');

-- =========================================

-- question 7 answers- type one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (25, 7, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (26, 7, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (27, 7, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (28, 7, 1, 'D: typed similar two');

-- question 8 answers- type one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (29, 8, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (30, 8, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (31, 8, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (32, 8, 1, 'D: typed similar two');

-- question 9 answers- type one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (33, 9, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (34, 9, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (35, 9, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (36, 9, 1, 'D: typed similar two');

-- =========================================

-- question 10 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (37, 10, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (38, 10, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (39, 10, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (40, 10, 1, 'D: typed similar two');

-- question 11 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (41, 11, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (42, 11, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (43, 11, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (44, 11, 1, 'D: typed similar two');

-- question 12 answers- type multi
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (45, 12, 1, 'A: typed similar to');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (46, 12, 1, 'B: typed similar too');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (47, 12, 1, 'C: typed similar 2');
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`) VALUES (48, 12, 1, 'D: typed similar two');
*/

-- =============================================
-- ECG ANSWERS FOR ALL TYPES
-- =============================================
-- question 25 answers - choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (97, 25, 0, 'A: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (98, 25, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (99, 25, 1, 'C: ECG correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (100, 25, 0, 'D: ECG not correct',3);

-- question 26 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (101, 26, 1, 'A: ECG correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (102, 26, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (103, 26, 0, 'C: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (104, 26, 0, 'D: ECG not correct',3);

-- question 27 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (105, 27, 0, 'A: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (106, 27, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (107, 27, 0, 'C: ECG not correct',3);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (108, 27, 1, 'D: ECG correct',3);

-- =========================================


--
-- Table structure for table `question_types`
--
DROP TABLE IF EXISTS `question_types`;
 
 CREATE TABLE `question_types` (
	`question_type_id` int(255) NOT NULL AUTO_INCREMENT,
	`question_type` varchar(255) NOT NULL,
    
	PRIMARY KEY (`question_type_id`)
   
 ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
--
-- Populate question_types
--
INSERT INTO `question_types` (`question_type_id`,`question_type`) VALUES (1, 'choose_one');
INSERT INTO `question_types` (`question_type_id`,`question_type`) VALUES (2, 'choose_multi');
INSERT INTO `question_types` (`question_type_id`,`question_type`) VALUES (3, 'type_one');
INSERT INTO `question_types` (`question_type_id`,`question_type`) VALUES (4, 'type_multi');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- ===================================================
-- SQL PLAYGROUND QUERIES HERE
-- ===================================================

SELECT * FROM USERS;

SELECT * FROM CATEGORIES;

SELECT * FROM RESULTS;

SELECT * FROM QUESTIONS;

SELECT * FROM ANSWERS;

SELECT * FROM QUESTION_TYPES;

-- gets user name and test score
SELECT 
CONCAT(result_score, '/', total_length) AS 'Score', 
CONCAT(user_first_name, ' ', user_last_name) AS 'Name' 
FROM RESULTS 
INNER JOIN USERS 
ON results.user_id = users.user_id;

SELECT * FROM QUESTIONS WHERE category_id = 1;
SELECT * FROM ANSWERS WHERE category_id = 1;

SELECT * FROM QUESTIONS WHERE category_id =1;

-- this function selects random top number in the limit function
SELECT * FROM QUESTIONS WHERE category_id = 1
ORDER BY RAND()
LIMIT 2;

INSERT INTO questions (question_id, category_id, question_text, question_type_id)
VALUES (99, 1, "colons", 1);


INSERT INTO answers VALUES (109, 99, 1, "yes", 1);
INSERT INTO answers VALUES (110, 99, 0, "only once a week", 1);
INSERT INTO answers VALUES (111, 99, 0, "sometimes", 1);
INSERT INTO answers VALUES (112, 99, 0, "no", 1);
INSERT INTO answers VALUES (113, 99, 0, "maybe", 1);


-- INSERT INTO users VALUES (2, "aragallex@gmail.com", '2013-08-05 18:19:03', 2, 'Ben', 'v');
SELECT * FROM users;

-- UPDATE users SET last_log_in = '2016-08-05 18:19:03', log_in_count = 6 WHERE user_email = 'aragallex@gmail.com';

INSERT INTO results VALUES (3, 99, 1, 1, 100, '2014-08-05 18:28:52');
select * from results;











