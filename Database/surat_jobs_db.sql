-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2019 at 10:36 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `surat_jobs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tb`
--

CREATE TABLE `admin_tb` (
  `Admin_id` int(10) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_tb`
--

INSERT INTO `admin_tb` (`Admin_id`, `Username`, `Password`) VALUES
(1, 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `applyforjobfair`
--

CREATE TABLE `applyforjobfair` (
  `id` int(6) NOT NULL,
  `JobSeekerId` int(6) NOT NULL,
  `JobFairId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `apply_for_job_tb`
--

CREATE TABLE `apply_for_job_tb` (
  `Apply_for_job_id` int(11) NOT NULL,
  `Company_job_post_id` int(11) DEFAULT NULL,
  `ApplyJobFairId` int(6) NOT NULL,
  `Apply_date` varchar(11) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `Round1_start_time` datetime DEFAULT NULL,
  `Round1_end_time` datetime DEFAULT NULL,
  `Round2_start_time` datetime DEFAULT NULL,
  `Round2_end_time` datetime DEFAULT NULL,
  `Round3_start_time` datetime DEFAULT NULL,
  `Round3_end_time` datetime DEFAULT NULL,
  `Round1_score` int(11) DEFAULT NULL,
  `Round2_score` int(11) DEFAULT NULL,
  `Round3_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_tb`
--

CREATE TABLE `chat_tb` (
  `Chat_message_id` int(11) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL,
  `Company_id` int(11) NOT NULL,
  `Message` varchar(2000) NOT NULL,
  `Sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sent_by` tinyint(4) NOT NULL COMMENT '1--seekerTOprovider , 2---providerTOseeker'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college_course_tb`
--

CREATE TABLE `college_course_tb` (
  `College_course_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `College_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college_course_tb`
--

INSERT INTO `college_course_tb` (`College_course_id`, `Course_id`, `College_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 2, 3),
(6, 3, 3),
(7, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `college_tb`
--

CREATE TABLE `college_tb` (
  `College_id` int(11) NOT NULL,
  `College_name` varchar(50) NOT NULL,
  `College_location` varchar(50) NOT NULL,
  `College_email` varchar(50) NOT NULL,
  `College_webURL` text NOT NULL,
  `College_password` varchar(50) NOT NULL,
  `College_contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college_tb`
--

INSERT INTO `college_tb` (`College_id`, `College_name`, `College_location`, `College_email`, `College_webURL`, `College_password`, `College_contact`) VALUES
(1, 'Maliba', 'Bardoli', 'maliba@gmail.com', 'www.maliba.com', 'm123', '8585069805'),
(2, 'Scet', 'adajan', 'scet@gmail.com', 'www.scet.com', 's123', '8852536985'),
(3, 'Svnit', 'Goddoad', 'svnit@gmail.com', 'www.svnit.com', 's123', '8569369850'),
(4, 'Mahvir', 'Vesu', 'mahvir@gmail.com', 'www.mahvir.com', 'm123', '8556325809'),
(5, 'Daiict', 'gandhinagar', 'daiict@gmail.com', 'www.daiict.com', 'd123', '8569852369'),
(6, 'Navyug', 'Pal', 'navyug@gmail.com', 'www.navyug.com', 'n123', '8596369858');

-- --------------------------------------------------------

--
-- Table structure for table `company_job_post_allowed_course_tb`
--

CREATE TABLE `company_job_post_allowed_course_tb` (
  `Company_job_post_allowed_course_id` int(11) NOT NULL,
  `Company_job_post_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_job_post_allowed_course_tb`
--

INSERT INTO `company_job_post_allowed_course_tb` (`Company_job_post_allowed_course_id`, `Company_job_post_id`, `Course_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 1),
(4, 3, 3),
(5, 4, 1),
(6, 5, 3),
(7, 6, 3),
(8, 7, 2),
(9, 8, 2),
(10, 9, 3),
(11, 9, 4),
(12, 10, 3),
(13, 10, 4),
(14, 11, 3),
(15, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `company_job_post_tb`
--

CREATE TABLE `company_job_post_tb` (
  `Company_job_post_id` int(11) NOT NULL,
  `Company_id` int(11) DEFAULT NULL,
  `Participated_company_id` int(11) DEFAULT NULL,
  `Post_name` varchar(50) NOT NULL,
  `Post_description` text NOT NULL,
  `Package_provided` varchar(50) DEFAULT NULL,
  `Experience_required` text NOT NULL,
  `Post_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Job_status` int(11) DEFAULT '0' COMMENT 'Open-1,Close-2',
  `Agreement_details` text NOT NULL,
  `No_of_position` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_job_post_tb`
--

INSERT INTO `company_job_post_tb` (`Company_job_post_id`, `Company_id`, `Participated_company_id`, `Post_name`, `Post_description`, `Package_provided`, `Experience_required`, `Post_date`, `End_date`, `Job_status`, `Agreement_details`, `No_of_position`) VALUES
(1, NULL, 1, 'Android Developer', 'You need to do backend coding and some kind of logical part', '5.8', '0-2 years', '2018-12-12', NULL, 1, '1.5 years bonad will be there', 3),
(2, NULL, 1, 'UI/UX Developer', 'You need to develop designs for app', '4.5', '1-3 years', '2018-12-12', NULL, 1, 'will be provided at PI time', 4),
(3, NULL, 2, 'Web Developer', 'Expert in HTML and javscript knowledge of java script framework is required', '8.5', '1-2 years', '2018-12-12', NULL, 1, '1.7 years bond', 7),
(4, NULL, 5, 'IOS Developer', 'Need to develope app in objective c', '1.5', 'fresher', '2018-12-12', NULL, 1, '2 years bond', 1),
(5, NULL, 6, 'Unity Designer', 'You need to design graphics for 3D game', '7.5', '2 years', '2018-12-12', NULL, 1, '1.5 years bond', 7),
(6, NULL, 7, 'UI Developer', 'Have to do design part ', '1.5', '0-2 years', '2018-12-12', NULL, 1, 'non disclosure', 1),
(7, NULL, 7, 'PHP developer', 'Design website in PHP Laravel ', '1.5', '1 year', '2018-12-12', NULL, 1, '2 years bond', 1),
(8, NULL, 8, 'C sharp Developer', 'Need to make webservices in c sharp', '1.5', '2 years', '2018-12-12', NULL, 1, '1 year bond', 1),
(9, NULL, 9, 'Java Developer', 'Java web developer work ', '5.9', '0-3 years', '2018-12-12', NULL, 1, '1 year', 1),
(10, NULL, 9, 'Unity Devloper', 'Game development work', '1.5', '1 year', '2018-12-12', NULL, 1, '1.3 years', 1),
(11, NULL, 10, 'Php devloper', 'website development', '1.5', '2 years', '2018-12-12', NULL, 1, '1 year', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_tb`
--

CREATE TABLE `company_tb` (
  `Company_id` int(11) NOT NULL,
  `Company_name` varchar(50) NOT NULL,
  `Company_address` text NOT NULL,
  `Company_email` varchar(50) NOT NULL,
  `Company_contact_person` varchar(50) NOT NULL,
  `Company_contact` varchar(50) NOT NULL,
  `Company_webURL` text NOT NULL,
  `Company_establishedOn` date NOT NULL,
  `Company_password` varchar(50) NOT NULL,
  `Registered_date` date NOT NULL,
  `Company_logo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_tb`
--

INSERT INTO `company_tb` (`Company_id`, `Company_name`, `Company_address`, `Company_email`, `Company_contact_person`, `Company_contact`, `Company_webURL`, `Company_establishedOn`, `Company_password`, `Registered_date`, `Company_logo`) VALUES
(1, 'Eastern techo solution', 'Near scet colleges gandhi nagar', 'estern@gmail.com', 'Dishant Mehta', '7490001029', 'www.estern.com', '2018-10-04', 'estern123', '2018-12-11', '154455423910.png'),
(2, 'Ocean', 'goddod', 'ocean@gmail.com', 'Mitesh  zaveri', '8569856936', 'www.ocean.com', '2011-12-12', 'o123', '2018-12-11', '1544555358Screenshot_20181211-082655.png'),
(3, 'Riversand', 'Bangalore', 'riversand@gmail.com', 'Subramanyam', '8596360000', 'www.riversand.com', '2002-12-12', 'r123', '2018-12-11', '1544556126Screenshot_20181208-190508.png'),
(4, 'Escrow', 'Adajan', 'escrow@gmail.com', 'Aashish Dhameliya', '8469731258', 'www.escrowinfotech.com', '2018-12-12', 'e123', '2018-12-11', '1544559013Screenshot_20181208-190128.png');

-- --------------------------------------------------------

--
-- Table structure for table `course_tb`
--

CREATE TABLE `course_tb` (
  `Course_id` int(11) NOT NULL,
  `Course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_tb`
--

INSERT INTO `course_tb` (`Course_id`, `Course_name`) VALUES
(1, 'MscIt'),
(2, 'BCA'),
(3, 'MCA'),
(4, 'Computer Engneering');

-- --------------------------------------------------------

--
-- Table structure for table `educational_qualification_tb`
--

CREATE TABLE `educational_qualification_tb` (
  `Educational_qualification_id` int(11) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `CGPA` double NOT NULL,
  `Year_of_passing` date NOT NULL,
  `Board` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experience_tb`
--

CREATE TABLE `experience_tb` (
  `Exp_id` int(11) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL,
  `Company_name` varchar(50) NOT NULL,
  `Designation` int(50) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extra_curricular_tb`
--

CREATE TABLE `extra_curricular_tb` (
  `Extra_curricular_id` int(11) NOT NULL,
  `Award` varchar(200) NOT NULL,
  `Honored_by` varchar(200) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL,
  `Publication` varchar(2083) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_fair_course_tb`
--

CREATE TABLE `job_fair_course_tb` (
  `Job_fair_course_id` int(11) NOT NULL,
  `Job_fair_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_fair_course_tb`
--

INSERT INTO `job_fair_course_tb` (`Job_fair_course_id`, `Job_fair_id`, `Course_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 2),
(6, 3, 3),
(7, 4, 3),
(8, 4, 4),
(9, 5, 1),
(10, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `job_fair_round_date_tb`
--

CREATE TABLE `job_fair_round_date_tb` (
  `Job_fair_round_date_id` int(11) NOT NULL,
  `Round_id` int(11) NOT NULL,
  `Job_fair_id` int(11) NOT NULL,
  `Round_start_date` date NOT NULL,
  `Round_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_fair_round_date_tb`
--

INSERT INTO `job_fair_round_date_tb` (`Job_fair_round_date_id`, `Round_id`, `Job_fair_id`, `Round_start_date`, `Round_end_date`) VALUES
(1, 1, 1, '2018-12-22', '2018-12-24'),
(2, 2, 1, '2018-12-25', '2018-12-27'),
(3, 3, 1, '2018-12-28', '2018-12-30'),
(4, 1, 2, '2018-12-16', '2018-12-18'),
(5, 2, 2, '2018-12-19', '2018-12-21'),
(6, 3, 2, '2018-12-22', '2018-12-24'),
(7, 1, 3, '2018-12-05', '2018-12-07'),
(8, 2, 3, '2018-12-08', '2018-12-10'),
(9, 3, 3, '2018-12-11', '2018-12-13'),
(10, 1, 4, '2018-12-19', '2018-12-21'),
(11, 2, 4, '2018-12-22', '2018-12-24'),
(12, 3, 4, '2018-12-25', '2018-12-27'),
(13, 1, 5, '2018-12-21', '2018-12-23'),
(14, 2, 5, '2018-12-24', '2018-12-26'),
(15, 3, 5, '2018-12-27', '2018-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `job_fair_tb`
--

CREATE TABLE `job_fair_tb` (
  `Job_fair_id` int(11) NOT NULL,
  `Host_college_id` int(11) NOT NULL,
  `Job_fair_start_date` date NOT NULL,
  `Job_fair_end_date` date NOT NULL,
  `Company_registration_start_date` date NOT NULL,
  `Company_registration_end_date` date NOT NULL,
  `Student_registration_start_date` date NOT NULL,
  `Student_registration_end_date` date NOT NULL,
  `IsOnline` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_fair_tb`
--

INSERT INTO `job_fair_tb` (`Job_fair_id`, `Host_college_id`, `Job_fair_start_date`, `Job_fair_end_date`, `Company_registration_start_date`, `Company_registration_end_date`, `Student_registration_start_date`, `Student_registration_end_date`, `IsOnline`) VALUES
(1, 1, '2018-12-11', '2018-12-31', '2018-12-11', '2018-12-15', '2018-12-16', '2018-12-21', 1),
(2, 2, '2018-12-01', '2018-12-25', '2018-12-01', '2018-12-10', '2018-12-11', '2018-12-15', 1),
(3, 3, '2018-11-20', '2018-12-15', '2018-11-21', '2018-11-27', '2018-11-28', '2018-12-04', 0),
(4, 5, '2018-12-10', '2018-12-29', '2018-12-11', '2018-12-14', '2018-12-15', '2018-12-18', 1),
(5, 4, '2018-12-01', '2018-12-30', '2018-12-11', '2018-12-20', '2018-12-11', '2018-12-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_seeker_selected_skill_tb`
--

CREATE TABLE `job_seeker_selected_skill_tb` (
  `selected_skill_id` int(11) NOT NULL,
  `Skill_id` int(11) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_seeker_tb`
--

CREATE TABLE `job_seeker_tb` (
  `Job_seeker_id` int(11) NOT NULL,
  `College_course_id` int(11) DEFAULT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Student_contact` varchar(50) NOT NULL,
  `Student_email` varchar(50) NOT NULL,
  `Student_gender` varchar(50) NOT NULL,
  `Student_profile` text,
  `Student_resume` text,
  `Student_password` varchar(50) NOT NULL,
  `Student_cgpa` double NOT NULL,
  `IsOther` tinyint(1) DEFAULT NULL,
  `Resume_objective` text,
  `Registered_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_seeker_tb`
--

INSERT INTO `job_seeker_tb` (`Job_seeker_id`, `College_course_id`, `Student_name`, `Student_contact`, `Student_email`, `Student_gender`, `Student_profile`, `Student_resume`, `Student_password`, `Student_cgpa`, `IsOther`, `Resume_objective`, `Registered_date`) VALUES
(1, 1, 'Archana Shah', '9889898985', 'archana@gmail.com', 'Female', '', '', 'a123', 8.5, 0, NULL, '0000-00-00'),
(2, 4, 'Charmi Shah', '8585698500', 'charmi@gmail.com', 'Female', '', '', 'c123', 8.5, 0, NULL, '0000-00-00'),
(3, 5, 'Jasmin Jariwala', '8585252523', 'jasmin@gmail.com', 'Female', '1544555027Screenshot_20181211-082655.png', '1544554854Archana_resume.pdf', 'j123', 5.3, 0, NULL, '0000-00-00'),
(4, 3, 'Kreya Shah', '8569856985', 'kreya@gmail.com', 'Female', '1544555152IMG-20181209-WA0000.jpg', '1544555152129.pdf', 'k123', 9, 0, NULL, '0000-00-00'),
(5, 1, 'Preet Shah', '8569854548', 'preet@gmail.com', 'Female', '1544555447IMG-20181209-WA0007.jpg', '1544555447129.pdf', 'p123', 8.5, 0, NULL, '0000-00-00'),
(6, 3, 'Keyuri Master', '8754698580', 'keyuri@gmail.com', 'Female', '1544555675IMG-20181205-WA0001.jpg', '1544555675129.pdf', 'k123', 5.6, 0, NULL, '0000-00-00'),
(7, 2, 'Bina Shah', '8585252500', 'bina@gmail.com', 'Female', '154456204211.png', '1544562042Archana_resume.pdf', 'b123', 5.3, 0, NULL, '0000-00-00'),
(8, 2, 'JituShah', '8585252523', 'jitu@gmail.com', 'Male', '154456248511.png', '1544562485Archana_resume.pdf', 'j123', 5.3, 0, NULL, '0000-00-00'),
(11, 1, 'rahul lotwala', '8401996740', 'rahullotwala@gmail.com', 'Male', '1546418705P_20190101_131045_BF.jpg', '1546418705BE-IV_Even_2018-19.pdf', 'rahul@123', 6.5, 0, NULL, '2019-01-02'),
(12, 1, 'sourov karmakar', '8401996740', 'karmakarsourabh7@gmail.com', 'Male', '1546424606PixelLava_LiveWall-liveWP-hlkGWh8fUmFewkRhvpPn.jpg', '1546424606BE-IV_Even_2018-19.pdf', 'sourov@123', 5.4, 0, NULL, '2019-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `participated_college_tb`
--

CREATE TABLE `participated_college_tb` (
  `Participated_college_id` int(11) NOT NULL,
  `Job_fair_id` int(11) NOT NULL,
  `College_id` int(11) NOT NULL,
  `IsApproved` tinyint(1) NOT NULL,
  `IsParticipated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participated_college_tb`
--

INSERT INTO `participated_college_tb` (`Participated_college_id`, `Job_fair_id`, `College_id`, `IsApproved`, `IsParticipated`) VALUES
(1, 5, 1, 1, 1),
(2, 5, 2, 1, 1),
(3, 2, 2, 0, 1),
(4, 3, 3, 1, 1),
(5, 3, 1, 1, 1),
(6, 1, 1, 1, 1),
(7, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `participated_company_tb`
--

CREATE TABLE `participated_company_tb` (
  `Participated_company_id` int(11) NOT NULL,
  `Job_fair_id` int(11) NOT NULL,
  `Company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participated_company_tb`
--

INSERT INTO `participated_company_tb` (`Participated_company_id`, `Job_fair_id`, `Company_id`) VALUES
(1, 5, 3),
(2, 5, 2),
(5, 5, 1),
(6, 5, 4),
(7, 3, 1),
(8, 3, 2),
(9, 2, 3),
(10, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `participated_student_tb`
--

CREATE TABLE `participated_student_tb` (
  `Participated_student_id` int(11) NOT NULL,
  `Job_seeker_id` int(11) NOT NULL,
  `Job_fair_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participated_student_tb`
--

INSERT INTO `participated_student_tb` (`Participated_student_id`, `Job_seeker_id`, `Job_fair_id`) VALUES
(1, 5, 5),
(2, 6, 5),
(3, 1, 5),
(4, 3, 3),
(5, 7, 3),
(6, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `resume_theme`
--

CREATE TABLE `resume_theme` (
  `resume_id` smallint(6) NOT NULL,
  `theme_name` varchar(20) NOT NULL,
  `theme_category` varchar(20) NOT NULL,
  `theme_preview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `round_tb`
--

CREATE TABLE `round_tb` (
  `Round_id` int(11) NOT NULL,
  `Round_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `round_tb`
--

INSERT INTO `round_tb` (`Round_id`, `Round_name`) VALUES
(1, 'Aptitude Test'),
(2, 'Practical Test'),
(3, 'Personal Interview');

-- --------------------------------------------------------

--
-- Table structure for table `selection_result_tb`
--

CREATE TABLE `selection_result_tb` (
  `Selection_result_id` int(11) NOT NULL,
  `Participated_student_id` int(11) NOT NULL,
  `Company_job_post_id` int(11) NOT NULL,
  `Approval_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_result_tb`
--

INSERT INTO `selection_result_tb` (`Selection_result_id`, `Participated_student_id`, `Company_job_post_id`, `Approval_status`) VALUES
(1, 5, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill_for_job_tb`
--

CREATE TABLE `skill_for_job_tb` (
  `Skill_for_job_id` int(11) NOT NULL,
  `Skill_id` int(11) NOT NULL,
  `Company_job_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill_tb`
--

CREATE TABLE `skill_tb` (
  `Skill_id` int(11) NOT NULL,
  `Skill_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_applied_job_post_tb`
--

CREATE TABLE `student_applied_job_post_tb` (
  `Student_applied_job_post_id` int(11) NOT NULL,
  `Student_priority_id` int(11) NOT NULL,
  `Company_job_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_applied_job_post_tb`
--

INSERT INTO `student_applied_job_post_tb` (`Student_applied_job_post_id`, `Student_priority_id`, `Company_job_post_id`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 5),
(4, 4, 7),
(5, 5, 8),
(6, 6, 7),
(7, 7, 8),
(8, 8, 7),
(9, 9, 8),
(10, 10, 4),
(11, 11, 3),
(12, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_exam_result_tb`
--

CREATE TABLE `student_exam_result_tb` (
  `Student_exam_result_id` int(11) NOT NULL,
  `Job_fair_round_date_id` int(11) NOT NULL,
  `Participated_company_id` int(11) NOT NULL,
  `Participated_student_id` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL COMMENT 'Pending,Pass,Fail',
  `IsConfirmed` int(1) DEFAULT NULL COMMENT '0=Send Letter,1=Confirmed,2=Already Placed',
  `Result` float NOT NULL,
  `IsCalling` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_exam_result_tb`
--

INSERT INTO `student_exam_result_tb` (`Student_exam_result_id`, `Job_fair_round_date_id`, `Participated_company_id`, `Participated_student_id`, `Status`, `IsConfirmed`, `Result`, `IsCalling`) VALUES
(1, 7, 7, 4, 'Fail', NULL, 25, 0),
(2, 7, 7, 5, 'Pass', NULL, 55, 0),
(3, 7, 7, 6, 'Pass', NULL, 85, 0),
(4, 7, 8, 4, 'Pass', NULL, 56, 0),
(5, 7, 8, 5, 'Pass', NULL, 65, 0),
(6, 7, 8, 6, 'Fail', NULL, 25, 0),
(7, 8, 7, 5, 'Pass', NULL, 47, 0),
(8, 8, 7, 6, 'Pass', NULL, 65, 0),
(9, 8, 8, 4, 'Pass', NULL, 56, 0),
(10, 8, 8, 5, 'Pass', NULL, 55, 0),
(11, 9, 7, 6, 'Pass', NULL, 55, 0),
(12, 9, 8, 5, 'Pass', 1, 65, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_priority_tb`
--

CREATE TABLE `student_priority_tb` (
  `Student_priority_id` int(11) NOT NULL,
  `Participated_student_id` int(11) NOT NULL,
  `Company_id` int(11) NOT NULL,
  `Priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_priority_tb`
--

INSERT INTO `student_priority_tb` (`Student_priority_id`, `Participated_student_id`, `Company_id`, `Priority`) VALUES
(1, 2, 2, 2),
(2, 2, 3, 3),
(3, 2, 4, 1),
(4, 4, 1, 2),
(5, 4, 2, 1),
(6, 5, 1, 2),
(7, 5, 2, 1),
(8, 6, 1, 1),
(9, 6, 2, 2),
(10, 3, 1, 2),
(11, 3, 2, 3),
(12, 3, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tb`
--
ALTER TABLE `admin_tb`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `applyforjobfair`
--
ALTER TABLE `applyforjobfair`
  ADD PRIMARY KEY (`id`),
  ADD KEY `JobSeekerRelation` (`JobSeekerId`),
  ADD KEY `JobFairRelation` (`JobFairId`);

--
-- Indexes for table `apply_for_job_tb`
--
ALTER TABLE `apply_for_job_tb`
  ADD PRIMARY KEY (`Apply_for_job_id`),
  ADD KEY `JobPostRelation` (`Company_job_post_id`),
  ADD KEY `ApplyJobFairRelation` (`ApplyJobFairId`);

--
-- Indexes for table `chat_tb`
--
ALTER TABLE `chat_tb`
  ADD PRIMARY KEY (`Chat_message_id`),
  ADD KEY `Job_seeker_ID` (`Job_seeker_id`,`Company_id`),
  ADD KEY `Job_provider_ID` (`Company_id`);

--
-- Indexes for table `college_course_tb`
--
ALTER TABLE `college_course_tb`
  ADD PRIMARY KEY (`College_course_id`),
  ADD KEY `Course_id` (`Course_id`),
  ADD KEY `College_id` (`College_id`),
  ADD KEY `Course_id_2` (`Course_id`),
  ADD KEY `College_id_2` (`College_id`);

--
-- Indexes for table `college_tb`
--
ALTER TABLE `college_tb`
  ADD PRIMARY KEY (`College_id`);

--
-- Indexes for table `company_job_post_allowed_course_tb`
--
ALTER TABLE `company_job_post_allowed_course_tb`
  ADD PRIMARY KEY (`Company_job_post_allowed_course_id`),
  ADD KEY `Company_job_post_id` (`Company_job_post_id`,`Course_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `company_job_post_tb`
--
ALTER TABLE `company_job_post_tb`
  ADD PRIMARY KEY (`Company_job_post_id`),
  ADD KEY `Participated_company_id` (`Participated_company_id`),
  ADD KEY `Company_id` (`Company_id`);

--
-- Indexes for table `company_tb`
--
ALTER TABLE `company_tb`
  ADD PRIMARY KEY (`Company_id`);

--
-- Indexes for table `course_tb`
--
ALTER TABLE `course_tb`
  ADD PRIMARY KEY (`Course_id`);

--
-- Indexes for table `educational_qualification_tb`
--
ALTER TABLE `educational_qualification_tb`
  ADD PRIMARY KEY (`Educational_qualification_id`),
  ADD KEY `Job_seeker_ID` (`Job_seeker_id`,`Course_id`),
  ADD KEY `Degree_ID` (`Course_id`);

--
-- Indexes for table `experience_tb`
--
ALTER TABLE `experience_tb`
  ADD PRIMARY KEY (`Exp_id`),
  ADD KEY `Job_seeker_ID` (`Job_seeker_id`),
  ADD KEY `Job_seeker_ID_2` (`Job_seeker_id`);

--
-- Indexes for table `extra_curricular_tb`
--
ALTER TABLE `extra_curricular_tb`
  ADD PRIMARY KEY (`Extra_curricular_id`),
  ADD KEY `Job_seeker_ID` (`Job_seeker_id`);

--
-- Indexes for table `job_fair_course_tb`
--
ALTER TABLE `job_fair_course_tb`
  ADD PRIMARY KEY (`Job_fair_course_id`),
  ADD KEY `Job_fair_id` (`Job_fair_id`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Indexes for table `job_fair_round_date_tb`
--
ALTER TABLE `job_fair_round_date_tb`
  ADD PRIMARY KEY (`Job_fair_round_date_id`),
  ADD KEY `Round_id` (`Round_id`),
  ADD KEY `Job_fair_id` (`Job_fair_id`);

--
-- Indexes for table `job_fair_tb`
--
ALTER TABLE `job_fair_tb`
  ADD PRIMARY KEY (`Job_fair_id`),
  ADD KEY `Host_college_id` (`Host_college_id`);

--
-- Indexes for table `job_seeker_selected_skill_tb`
--
ALTER TABLE `job_seeker_selected_skill_tb`
  ADD PRIMARY KEY (`selected_skill_id`),
  ADD KEY `Skill_ID` (`Skill_id`,`Job_seeker_id`),
  ADD KEY `Job_seeker_ID` (`Job_seeker_id`);

--
-- Indexes for table `job_seeker_tb`
--
ALTER TABLE `job_seeker_tb`
  ADD PRIMARY KEY (`Job_seeker_id`),
  ADD KEY `College_course_id` (`College_course_id`);

--
-- Indexes for table `participated_college_tb`
--
ALTER TABLE `participated_college_tb`
  ADD PRIMARY KEY (`Participated_college_id`),
  ADD KEY `job_fair_id` (`Job_fair_id`),
  ADD KEY `College_id` (`College_id`);

--
-- Indexes for table `participated_company_tb`
--
ALTER TABLE `participated_company_tb`
  ADD PRIMARY KEY (`Participated_company_id`),
  ADD KEY `Job_fair_id` (`Job_fair_id`),
  ADD KEY `Company_id` (`Company_id`);

--
-- Indexes for table `participated_student_tb`
--
ALTER TABLE `participated_student_tb`
  ADD PRIMARY KEY (`Participated_student_id`),
  ADD KEY `Student_id` (`Job_seeker_id`),
  ADD KEY `Job_fair_id` (`Job_fair_id`);

--
-- Indexes for table `resume_theme`
--
ALTER TABLE `resume_theme`
  ADD PRIMARY KEY (`resume_id`);

--
-- Indexes for table `round_tb`
--
ALTER TABLE `round_tb`
  ADD PRIMARY KEY (`Round_id`);

--
-- Indexes for table `selection_result_tb`
--
ALTER TABLE `selection_result_tb`
  ADD PRIMARY KEY (`Selection_result_id`),
  ADD KEY `Participated_student_id` (`Participated_student_id`),
  ADD KEY `Company_job_post_id` (`Company_job_post_id`);

--
-- Indexes for table `skill_for_job_tb`
--
ALTER TABLE `skill_for_job_tb`
  ADD PRIMARY KEY (`Skill_for_job_id`),
  ADD KEY `Skill_ID` (`Skill_id`,`Company_job_post_id`),
  ADD KEY `Job_post_ID` (`Company_job_post_id`);

--
-- Indexes for table `skill_tb`
--
ALTER TABLE `skill_tb`
  ADD PRIMARY KEY (`Skill_id`);

--
-- Indexes for table `student_applied_job_post_tb`
--
ALTER TABLE `student_applied_job_post_tb`
  ADD PRIMARY KEY (`Student_applied_job_post_id`),
  ADD KEY `Student_priority_id` (`Student_priority_id`,`Company_job_post_id`),
  ADD KEY `Company_job_post_id` (`Company_job_post_id`);

--
-- Indexes for table `student_exam_result_tb`
--
ALTER TABLE `student_exam_result_tb`
  ADD PRIMARY KEY (`Student_exam_result_id`),
  ADD KEY `Job_fair_round_date_id` (`Job_fair_round_date_id`),
  ADD KEY `Participated_company_id` (`Participated_company_id`),
  ADD KEY `Participated_student_id` (`Participated_student_id`);

--
-- Indexes for table `student_priority_tb`
--
ALTER TABLE `student_priority_tb`
  ADD PRIMARY KEY (`Student_priority_id`),
  ADD KEY `Participated_student_id` (`Participated_student_id`),
  ADD KEY `Company_job_post_id` (`Company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tb`
--
ALTER TABLE `admin_tb`
  MODIFY `Admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applyforjobfair`
--
ALTER TABLE `applyforjobfair`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `apply_for_job_tb`
--
ALTER TABLE `apply_for_job_tb`
  MODIFY `Apply_for_job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_tb`
--
ALTER TABLE `chat_tb`
  MODIFY `Chat_message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `college_course_tb`
--
ALTER TABLE `college_course_tb`
  MODIFY `College_course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `college_tb`
--
ALTER TABLE `college_tb`
  MODIFY `College_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company_job_post_allowed_course_tb`
--
ALTER TABLE `company_job_post_allowed_course_tb`
  MODIFY `Company_job_post_allowed_course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `company_job_post_tb`
--
ALTER TABLE `company_job_post_tb`
  MODIFY `Company_job_post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `company_tb`
--
ALTER TABLE `company_tb`
  MODIFY `Company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_tb`
--
ALTER TABLE `course_tb`
  MODIFY `Course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `educational_qualification_tb`
--
ALTER TABLE `educational_qualification_tb`
  MODIFY `Educational_qualification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experience_tb`
--
ALTER TABLE `experience_tb`
  MODIFY `Exp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_curricular_tb`
--
ALTER TABLE `extra_curricular_tb`
  MODIFY `Extra_curricular_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_fair_course_tb`
--
ALTER TABLE `job_fair_course_tb`
  MODIFY `Job_fair_course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `job_fair_round_date_tb`
--
ALTER TABLE `job_fair_round_date_tb`
  MODIFY `Job_fair_round_date_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `job_fair_tb`
--
ALTER TABLE `job_fair_tb`
  MODIFY `Job_fair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_seeker_selected_skill_tb`
--
ALTER TABLE `job_seeker_selected_skill_tb`
  MODIFY `selected_skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_seeker_tb`
--
ALTER TABLE `job_seeker_tb`
  MODIFY `Job_seeker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `participated_college_tb`
--
ALTER TABLE `participated_college_tb`
  MODIFY `Participated_college_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `participated_company_tb`
--
ALTER TABLE `participated_company_tb`
  MODIFY `Participated_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `participated_student_tb`
--
ALTER TABLE `participated_student_tb`
  MODIFY `Participated_student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resume_theme`
--
ALTER TABLE `resume_theme`
  MODIFY `resume_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `round_tb`
--
ALTER TABLE `round_tb`
  MODIFY `Round_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selection_result_tb`
--
ALTER TABLE `selection_result_tb`
  MODIFY `Selection_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skill_for_job_tb`
--
ALTER TABLE `skill_for_job_tb`
  MODIFY `Skill_for_job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill_tb`
--
ALTER TABLE `skill_tb`
  MODIFY `Skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_applied_job_post_tb`
--
ALTER TABLE `student_applied_job_post_tb`
  MODIFY `Student_applied_job_post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_exam_result_tb`
--
ALTER TABLE `student_exam_result_tb`
  MODIFY `Student_exam_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_priority_tb`
--
ALTER TABLE `student_priority_tb`
  MODIFY `Student_priority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applyforjobfair`
--
ALTER TABLE `applyforjobfair`
  ADD CONSTRAINT `JobFairRelation` FOREIGN KEY (`JobFairId`) REFERENCES `job_fair_tb` (`Job_fair_id`),
  ADD CONSTRAINT `JobSeekerRelation` FOREIGN KEY (`JobSeekerId`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `apply_for_job_tb`
--
ALTER TABLE `apply_for_job_tb`
  ADD CONSTRAINT `ApplyJobFairRelation` FOREIGN KEY (`ApplyJobFairId`) REFERENCES `applyforjobfair` (`id`),
  ADD CONSTRAINT `JobPostRelation` FOREIGN KEY (`Company_job_post_id`) REFERENCES `company_job_post_tb` (`Company_job_post_id`);

--
-- Constraints for table `chat_tb`
--
ALTER TABLE `chat_tb`
  ADD CONSTRAINT `chat_tb_ibfk_4` FOREIGN KEY (`Company_id`) REFERENCES `company_tb` (`Company_id`),
  ADD CONSTRAINT `chat_tb_ibfk_5` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `college_course_tb`
--
ALTER TABLE `college_course_tb`
  ADD CONSTRAINT `college_course_tb_ibfk_1` FOREIGN KEY (`Course_id`) REFERENCES `course_tb` (`Course_id`),
  ADD CONSTRAINT `college_course_tb_ibfk_2` FOREIGN KEY (`College_id`) REFERENCES `college_tb` (`College_id`);

--
-- Constraints for table `company_job_post_allowed_course_tb`
--
ALTER TABLE `company_job_post_allowed_course_tb`
  ADD CONSTRAINT `company_job_post_allowed_course_tb_ibfk_3` FOREIGN KEY (`Company_job_post_id`) REFERENCES `company_job_post_tb` (`Company_job_post_id`),
  ADD CONSTRAINT `company_job_post_allowed_course_tb_ibfk_4` FOREIGN KEY (`Course_id`) REFERENCES `course_tb` (`Course_id`);

--
-- Constraints for table `company_job_post_tb`
--
ALTER TABLE `company_job_post_tb`
  ADD CONSTRAINT `company_job_post_tb_ibfk_1` FOREIGN KEY (`Company_id`) REFERENCES `company_tb` (`Company_id`),
  ADD CONSTRAINT `company_job_post_tb_ibfk_2` FOREIGN KEY (`Participated_company_id`) REFERENCES `participated_company_tb` (`Participated_company_id`);

--
-- Constraints for table `educational_qualification_tb`
--
ALTER TABLE `educational_qualification_tb`
  ADD CONSTRAINT `educational_qualification_tb_ibfk_3` FOREIGN KEY (`Course_id`) REFERENCES `course_tb` (`Course_id`),
  ADD CONSTRAINT `educational_qualification_tb_ibfk_4` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `experience_tb`
--
ALTER TABLE `experience_tb`
  ADD CONSTRAINT `experience_tb_ibfk_1` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `extra_curricular_tb`
--
ALTER TABLE `extra_curricular_tb`
  ADD CONSTRAINT `extra_curricular_tb_ibfk_1` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `job_fair_course_tb`
--
ALTER TABLE `job_fair_course_tb`
  ADD CONSTRAINT `job_fair_course_tb_ibfk_1` FOREIGN KEY (`Job_fair_id`) REFERENCES `job_fair_tb` (`Job_fair_id`),
  ADD CONSTRAINT `job_fair_course_tb_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `course_tb` (`Course_id`);

--
-- Constraints for table `job_fair_round_date_tb`
--
ALTER TABLE `job_fair_round_date_tb`
  ADD CONSTRAINT `job_fair_round_date_tb_ibfk_1` FOREIGN KEY (`Round_id`) REFERENCES `round_tb` (`Round_id`),
  ADD CONSTRAINT `job_fair_round_date_tb_ibfk_2` FOREIGN KEY (`Job_fair_id`) REFERENCES `job_fair_tb` (`Job_fair_id`);

--
-- Constraints for table `job_fair_tb`
--
ALTER TABLE `job_fair_tb`
  ADD CONSTRAINT `job_fair_tb_ibfk_1` FOREIGN KEY (`Host_college_id`) REFERENCES `college_tb` (`College_id`);

--
-- Constraints for table `job_seeker_selected_skill_tb`
--
ALTER TABLE `job_seeker_selected_skill_tb`
  ADD CONSTRAINT `job_seeker_selected_skill_tb_ibfk_1` FOREIGN KEY (`Skill_id`) REFERENCES `skill_tb` (`Skill_id`),
  ADD CONSTRAINT `job_seeker_selected_skill_tb_ibfk_2` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `job_seeker_tb`
--
ALTER TABLE `job_seeker_tb`
  ADD CONSTRAINT `job_seeker_tb_ibfk_1` FOREIGN KEY (`College_course_id`) REFERENCES `college_course_tb` (`College_course_id`);

--
-- Constraints for table `participated_college_tb`
--
ALTER TABLE `participated_college_tb`
  ADD CONSTRAINT `participated_college_tb_ibfk_1` FOREIGN KEY (`Job_fair_id`) REFERENCES `job_fair_tb` (`Job_fair_id`),
  ADD CONSTRAINT `participated_college_tb_ibfk_2` FOREIGN KEY (`College_id`) REFERENCES `college_tb` (`College_id`);

--
-- Constraints for table `participated_company_tb`
--
ALTER TABLE `participated_company_tb`
  ADD CONSTRAINT `participated_company_tb_ibfk_1` FOREIGN KEY (`Job_fair_id`) REFERENCES `job_fair_tb` (`Job_fair_id`),
  ADD CONSTRAINT `participated_company_tb_ibfk_2` FOREIGN KEY (`Company_id`) REFERENCES `company_tb` (`Company_id`);

--
-- Constraints for table `participated_student_tb`
--
ALTER TABLE `participated_student_tb`
  ADD CONSTRAINT `participated_student_tb_ibfk_2` FOREIGN KEY (`Job_fair_id`) REFERENCES `job_fair_tb` (`Job_fair_id`),
  ADD CONSTRAINT `participated_student_tb_ibfk_3` FOREIGN KEY (`Job_seeker_id`) REFERENCES `job_seeker_tb` (`Job_seeker_id`);

--
-- Constraints for table `selection_result_tb`
--
ALTER TABLE `selection_result_tb`
  ADD CONSTRAINT `selection_result_tb_ibfk_1` FOREIGN KEY (`Participated_student_id`) REFERENCES `participated_student_tb` (`Participated_student_id`),
  ADD CONSTRAINT `selection_result_tb_ibfk_2` FOREIGN KEY (`Company_job_post_id`) REFERENCES `company_job_post_tb` (`Company_job_post_id`);

--
-- Constraints for table `skill_for_job_tb`
--
ALTER TABLE `skill_for_job_tb`
  ADD CONSTRAINT `skill_for_job_tb_ibfk_1` FOREIGN KEY (`Skill_id`) REFERENCES `skill_tb` (`Skill_id`),
  ADD CONSTRAINT `skill_for_job_tb_ibfk_2` FOREIGN KEY (`Company_job_post_id`) REFERENCES `company_job_post_tb` (`Company_job_post_id`);

--
-- Constraints for table `student_applied_job_post_tb`
--
ALTER TABLE `student_applied_job_post_tb`
  ADD CONSTRAINT `student_applied_job_post_tb_ibfk_2` FOREIGN KEY (`Company_job_post_id`) REFERENCES `company_job_post_tb` (`Company_job_post_id`),
  ADD CONSTRAINT `student_applied_job_post_tb_ibfk_3` FOREIGN KEY (`Student_priority_id`) REFERENCES `student_priority_tb` (`Student_priority_id`);

--
-- Constraints for table `student_exam_result_tb`
--
ALTER TABLE `student_exam_result_tb`
  ADD CONSTRAINT `student_exam_result_tb_ibfk_1` FOREIGN KEY (`Job_fair_round_date_id`) REFERENCES `job_fair_round_date_tb` (`Job_fair_round_date_id`),
  ADD CONSTRAINT `student_exam_result_tb_ibfk_2` FOREIGN KEY (`Participated_company_id`) REFERENCES `participated_company_tb` (`Participated_company_id`),
  ADD CONSTRAINT `student_exam_result_tb_ibfk_3` FOREIGN KEY (`Participated_student_id`) REFERENCES `participated_student_tb` (`Participated_student_id`);

--
-- Constraints for table `student_priority_tb`
--
ALTER TABLE `student_priority_tb`
  ADD CONSTRAINT `student_priority_tb_ibfk_1` FOREIGN KEY (`Participated_student_id`) REFERENCES `participated_student_tb` (`Participated_student_id`),
  ADD CONSTRAINT `student_priority_tb_ibfk_2` FOREIGN KEY (`Company_id`) REFERENCES `company_tb` (`Company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
