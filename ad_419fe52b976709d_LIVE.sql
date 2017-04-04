-- Host: us-cdbr-iron-east-03.cleardb.net
-- Generation Time: Mar 31, 2017 at 9:00 PM

-- DROP DATABASE IF EXISTS `paramedic_application_db`;
-- CREATE database `paramedic_application_db`;
 USE `ad_419fe52b976709d`;

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

DROP TABLE IF EXISTS `question_types`;
DROP TABLE IF EXISTS `answers`;
DROP TABLE IF EXISTS `questions`;
DROP TABLE IF EXISTS `results`;
DROP TABLE IF EXISTS `categories`;

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

-- INSERT INTO `users` (`user_id`, `user_email`, `last_log_in`, `log_in_count`, `user_first_name`, `user_last_name`) VALUES (1, 'benjaminvanarragon@gmail.com', '2013-08-05 18:19:03', 1, 'Benjamin', 'Vanarragon');

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
 
-- INSERT INTO `results` (`result_id`, `result_score`, `user_id`, `category_id`, `total_length`, `date_written`) VALUES (1, 75, 1, 2, 100, '2013-08-05 18:28:52');

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

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (13, 2, 'What is the dosage for Atropine in Unstable Bradycardia?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (14, 2, 'What is the dosage for Calcium Chloride?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (15, 2, 'Indication for use of Dopamine?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (16, 2, 'What is the dosage of Tetracaine?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (17, 2, 'Indication for use of Atrovent?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (18, 2, 'What is the dosage for Lidocaine?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (19, 2, 'MagSulfate contraindications?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (20, 2, 'Labetaol contrindications?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (21, 2, 'What is the dosage for Versed?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (22, 2, 'What is the dosage of Solu-Medrol?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (23, 2, 'What is the dosage for Vasopressin?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (24, 2, 'What is the dosage for Epi 1:1000 for an allergic reaction?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (25, 2, 'Vasopressin indications?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (26, 2, 'Indication for use of Versed?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (27, 2, 'What is the dosage for Zofran?', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (28, 2, 'Indications for Amiodarone?', 1);

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

INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (29, 3, 'Electrocardiogram choose one: Question 1', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (30, 3, 'Electrocardiogram choose one: Question 2', 1);
INSERT INTO `questions` (`question_id`,`category_id`,`question_text`, `question_type_id`) VALUES (31, 3, 'Electrocardiogram choose one: Question 3', 1);
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
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (49, 13, 1, '0.5-1 mg every 3-5 minutes up to a total of 0.04 mg/kg',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (50, 13, 0, '2 mg every 5 minutes',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (51, 13, 0, '2-5 mg over 2 minutes,may repeat after 2 minutes to a max dose of 10mg',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (52, 13, 0, '5-10 mg every 3-5 minutes up to a total of 0.04 mg/kg',2);

-- question 14 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (53, 14, 0, '1 gm of 5% for V-Fib/V-Tach, 500 mg for Calcium Channel Blocker overdose',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (54, 14, 1, '1 gm of 10% for V-Fib/V-Tach, 500 mg for Calcium Channel Blocker overdose',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (55, 14, 0, '2-5 mg over 2 minutes,may repeat after 2 minutes to a max dose of 10mg',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (56, 14, 0, '10 gm of 10% for V-Fib/V-Tach, 500 mg for Calcium Channel Blocker overdose',2);

-- question 15 answers- choose one
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (57, 15, 0, 'Asthma,COPD,CHF',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (58, 15, 0, 'Hypertension',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (59, 15, 1, 'Hypotension',2);
INSERT INTO `answers` (`answer_id`,`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (60, 15, 0, 'Type II Diabetes',2);

-- question 16 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (16, 0, '1-2 drops every 5 minutes.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (16, 1, '1-2 drops initally.Repeat as needed for pain.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (16, 0, '2-4 drops every 5 minutes.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (16, 0, '2-4 drops initally.Repeat as needed for pain.',2);

-- question 17 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (17, 0, 'Anti-seizure medication.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (17, 1, 'COPD, Asthma, Chronic Bronchitis, Empyshema, Coughing, Wheezing, SOB',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (17, 0, 'Tricyclic overdose',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (17, 0, 'Type II Diabetes',2);

-- question 18 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (18, 1, '1 mg/Kg increasing by 0.5mg/Kg untill max dose of 3 mg. Then maintenance drip 1 level higher using clock method.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (18, 0, '150 mg with a pulse. 300 mg with no pulse.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (18, 0, 'increasing scale of 15,30,60,120,240,240',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (18, 0, 'Inital bolus of 25-50 mEq followed by infusion of 100mEq in 1000 cc bag at 150ml/hr (15dpm)',2);

-- question 19 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (19, 1, 'Myocardial damage,hepatitis,heart blocks,Significant Renal Impairment,Addison Disease',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (19, 0, 'Pregnancy',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (19, 0, 'Systolic B.P. <100 with uncontrolled bleeding',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (19, 0, 'Type II Diabetes requires Med Control',2);

-- question 20 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (20, 1, 'CHF,Pulmonary edema,Bradycardia,AV Block,Cardiogenic shock,Reactive Airway Disease',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (20, 0, 'Systolic blood pressure >100',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (20, 0, 'Type II Diabetes',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (20, 0, 'Unknown orgin of abdominal pain',2);

-- question 21 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (21, 1, '1-2 mg over 2 minutes,may repeat after 2 minutes to a max dose of 10mg',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (21, 0, '1-2 mg over 2 minutes,may repeat after 2 minutes to a max dose of 20mg',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (21, 0, '2-5 mg over 2 minutes,may repeat after 2 minutes to a max dose of 10mg',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (21, 0, '2-5 mg over 2 minutes,may repeat after 20 minutes to a max dose of 10mg',2);

-- question 22 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (22, 0, '100mEq',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (22, 1, '125mg',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (22, 0, '150mg if pulse present. 300mg if no pulse',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (22, 0, 'Inital bolus of 25-50 mEq followed by infusion of 100mEq in 1000 cc bag at 150ml/hr (15dpm)',2);

-- question 23 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (23, 0, '10-20 units in a 100 cc bag',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (23, 0, '10-20 units in a single dose.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (23, 0, '20-40 units in a 100 cc bag',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (23, 1, '20-40 units in a single dose.',2);

-- question 24 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (24, 0, '0.3 mg IM if hypotensive',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (24, 1, '0.3 mg IM if not hypotensive',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (24, 0, '0.3 mg IV if not hypotensive',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (24, 0, '2-5 mg over 2 minutes,may repeat after 2 minutes to a max dose of 10mg',2);

-- question 25 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (25, 0, 'Asystole and PEA only',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (25, 1, 'Asystole,PEA,V-Tach,and V-fib',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (25, 0, 'Svt',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (25, 0, 'V-tach only',2);

-- question 26 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (26, 0, 'Pain management',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (26, 1, 'Seizures or prior to conscious E.T. intubation',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (26, 0, 'Systolic B.P. <100',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (26, 0, 'Type II Diabetes',2);

-- question 27 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (27, 1, '2-4 mg IV over 2-5 minutes or 4 mg by mouth.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (27, 0, '2-4 mg IV over 2-5 minutes or 8 mg by mouth.',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (27, 0, '2-4 mg IV over 2-5 minutes or 40 mg in a 100 cc bag wide open',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (27, 0, '4-8mg mg IV over 2-5 minutes or 4 mg by mouth.',2);

-- question 28 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (28, 0, 'Asthma,COPD,CHF',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (28, 1, 'Cardiac Arrest,Anti-arrhythmic used for V-tach,V-Fib,A-Fib,A-Flutter refractory to other meds',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (28, 0, 'Seizures (regular or pregnancy related)',2);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (28, 0, 'Type II Diabetes',2);
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
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 29, 0, 'A: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 29, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 29, 1, 'C: ECG correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 29, 0, 'D: ECG not correct',3);

-- question 26 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 30, 1, 'A: ECG correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 30, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 30, 0, 'C: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES ( 30, 0, 'D: ECG not correct',3);

-- question 27 answers- choose one
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (31, 0, 'A: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (31, 0, 'B: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (31, 0, 'C: ECG not correct',3);
INSERT INTO `answers` (`question_id`, `isCorrect`, `answer_text`, `category_id`) VALUES (31, 1, 'D: ECG correct',3);

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



SELECT * FROM QUESTIONS WHERE category_id = 2;





