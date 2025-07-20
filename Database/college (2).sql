-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2025 at 03:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `department_id`, `credits`) VALUES
(1, 'Data Structures', 1, 4),
(2, 'Thermodynamics', 2, 3),
(3, 'Circuits Analysis', 3, 3),
(4, 'Structural Design', 4, 3),
(5, 'Algorithms', 1, 4),
(6, 'Database Systems', 1, 4),
(7, 'Machine Learning', 1, 4),
(8, 'Fluid Mechanics', 2, 3),
(9, 'Power Systems', 3, 3),
(10, 'Building Materials', 4, 3),
(11, 'Organic Chemistry', 5, 3),
(12, 'Web Development', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Chemical Engineering'),
(6, 'Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `grade`) VALUES
(1, 1, 1, 'A'),
(2, 1, 5, 'B'),
(3, 2, 2, 'B+'),
(4, 3, 3, 'A'),
(5, 4, 1, 'A'),
(6, 4, 5, 'A'),
(7, 5, 1, 'A'),
(8, 5, 5, 'B'),
(9, 6, 2, 'B+'),
(10, 7, 3, 'A'),
(11, 8, 4, 'B'),
(12, 9, 1, 'A'),
(13, 9, 6, 'A'),
(14, 10, 7, 'B'),
(15, 11, 8, 'A'),
(16, 12, 9, 'B'),
(17, 13, 10, 'A'),
(18, 14, 1, 'B'),
(19, 14, 5, 'C'),
(20, 5, 8, 'A'),
(21, 6, 9, 'B'),
(22, 7, 10, 'A'),
(23, 15, 12, 'A'),
(24, 16, 11, 'B'),
(25, 17, 9, 'A'),
(26, 18, 12, 'A'),
(27, 19, 11, 'B+'),
(28, 20, 12, 'A'),
(29, 15, 6, 'B'),
(30, 16, 7, 'A'),
(31, 17, 3, 'B'),
(32, 18, 5, 'A'),
(33, 19, 4, 'B'),
(34, 20, 6, 'A'),
(35, 21, 1, 'A'),
(37, 22, 2, 'B+'),
(39, 23, 3, 'A'),
(41, 24, 4, 'B+'),
(43, 25, 5, 'B'),
(45, 26, 8, 'B'),
(47, 27, 1, 'B+'),
(49, 28, 2, 'A'),
(51, 29, 3, 'A'),
(53, 30, 4, 'A'),
(55, 31, 5, 'A'),
(57, 32, 9, 'A'),
(59, 33, 10, 'A'),
(61, 34, 1, 'B+'),
(63, 35, 2, 'B'),
(65, 36, 3, 'A'),
(67, 37, 4, 'A'),
(69, 38, 5, 'B'),
(71, 39, 6, 'A'),
(73, 40, 1, 'A'),
(75, 41, 2, 'A'),
(77, 42, 3, 'A'),
(79, 43, 4, 'B'),
(81, 44, 5, 'A'),
(83, 45, 6, 'B+'),
(85, 46, 1, 'A'),
(87, 47, 2, 'A'),
(89, 48, 3, 'B'),
(91, 49, 4, 'A'),
(93, 50, 5, 'A'),
(95, 51, 6, 'B'),
(97, 52, 1, 'B+'),
(99, 53, 2, 'A'),
(101, 54, 3, 'A'),
(103, 55, 4, 'A'),
(105, 56, 5, 'A'),
(107, 57, 9, 'A'),
(109, 58, 10, 'A'),
(111, 59, 1, 'B+'),
(113, 60, 2, 'B'),
(115, 61, 3, 'A'),
(117, 62, 4, 'A'),
(119, 63, 5, 'B'),
(121, 64, 6, 'A'),
(123, 65, 1, 'A'),
(125, 66, 2, 'A'),
(127, 67, 3, 'B'),
(129, 68, 4, 'A'),
(131, 69, 5, 'A'),
(133, 70, 6, 'B'),
(135, 71, 1, 'A'),
(136, 72, 1, 'B'),
(137, 73, 2, 'A'),
(138, 74, 3, 'B'),
(139, 75, 4, 'A'),
(140, 76, 5, 'B'),
(141, 77, 6, 'A'),
(142, 78, 7, 'B'),
(143, 79, 8, 'A'),
(144, 80, 9, 'B'),
(145, 81, 10, 'A'),
(146, 82, 11, 'B'),
(147, 83, 12, 'A'),
(148, 84, 1, 'B'),
(149, 85, 2, 'A'),
(150, 86, 3, 'B'),
(151, 87, 4, 'A'),
(152, 88, 5, 'B'),
(153, 89, 6, 'A'),
(154, 90, 7, 'B'),
(155, 91, 8, 'A'),
(156, 92, 9, 'B'),
(157, 93, 10, 'A'),
(158, 94, 11, 'B'),
(159, 95, 12, 'A'),
(160, 96, 1, 'B'),
(161, 97, 2, 'A'),
(162, 98, 3, 'B'),
(163, 99, 4, 'A'),
(164, 100, 5, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `year_of_joining` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `age`, `gender`, `department_id`, `year_of_joining`) VALUES
(1, 'Alice Johnson', 20, 'Female', 1, '2022'),
(2, 'Bob Smith', 21, 'Male', 2, '2021'),
(3, 'Clara Davis', 22, 'Female', 3, '2020'),
(4, 'David Wilson', 19, 'Male', 1, '2023'),
(5, 'Emily Clark', 20, 'Female', 1, '2022'),
(6, 'Frank Wright', 23, 'Male', 2, '2021'),
(7, 'Grace Lee', 22, 'Female', 3, '2020'),
(8, 'Henry Adams', 21, 'Male', 4, '2022'),
(9, 'Isabella Turner', 20, 'Female', 1, '2023'),
(10, 'Jake Brown', 22, 'Male', 2, '2020'),
(11, 'Kylie Scott', 23, 'Female', 3, '2021'),
(12, 'Liam Johnson', 19, 'Male', 4, '2023'),
(13, 'Mia Anderson', 21, 'Female', 1, '2023'),
(14, 'Noah Martinez', 22, 'Male', 2, '2022'),
(15, 'Olivia Garcia', 20, 'Female', 6, '2023'),
(16, 'Paul Walker', 23, 'Male', 5, '2021'),
(17, 'Quinn Evans', 22, 'Other', 3, '2020'),
(18, 'Rachel King', 21, 'Female', 6, '2023'),
(19, 'Samuel Moore', 20, 'Male', 5, '2023'),
(20, 'Tina White', 19, 'Female', 6, '2024'),
(21, 'Uma Patel', 21, 'Female', 1, '2022'),
(22, 'Victor Singh', 22, 'Male', 2, '2021'),
(23, 'Wendy Thomas', 20, 'Female', 3, '2023'),
(24, 'Xavier Khan', 23, 'Male', 4, '2020'),
(25, 'Yara Das', 22, 'Female', 5, '2021'),
(26, 'Zack Roy', 19, 'Male', 6, '2024'),
(27, 'Aditi Sharma', 20, 'Female', 1, '2022'),
(28, 'Bharat Joshi', 22, 'Male', 2, '2021'),
(29, 'Catherine Paul', 21, 'Female', 3, '2023'),
(30, 'Dinesh Kapoor', 23, 'Male', 4, '2020'),
(31, 'Esha Nair', 22, 'Female', 5, '2021'),
(32, 'Farhan Ali', 19, 'Male', 6, '2024'),
(33, 'Gauri Mehta', 20, 'Female', 1, '2022'),
(34, 'Hari Prasad', 22, 'Male', 2, '2021'),
(35, 'Isha Reddy', 21, 'Female', 3, '2023'),
(36, 'Jatin Verma', 23, 'Male', 4, '2020'),
(37, 'Kavya Menon', 22, 'Female', 5, '2021'),
(38, 'Lalit Yadav', 19, 'Male', 6, '2024'),
(39, 'Meera Pillai', 20, 'Female', 1, '2022'),
(40, 'Nikhil Gupta', 22, 'Male', 2, '2021'),
(41, 'Oviya Bansal', 21, 'Female', 3, '2023'),
(42, 'Pranav Desai', 23, 'Male', 4, '2020'),
(43, 'Riya Sengupta', 22, 'Female', 5, '2021'),
(44, 'Sahil Malhotra', 19, 'Male', 6, '2024'),
(45, 'Tanvi Joshi', 20, 'Female', 1, '2022'),
(46, 'Uday Sharma', 22, 'Male', 2, '2021'),
(47, 'Vaishnavi Rao', 21, 'Female', 3, '2023'),
(48, 'Yash Chauhan', 23, 'Male', 4, '2020'),
(49, 'Zara Ahmed', 22, 'Female', 5, '2021'),
(50, 'Aman Tripathi', 19, 'Male', 6, '2024'),
(51, 'Bhavya Kapoor', 20, 'Female', 1, '2022'),
(52, 'Chirag Goyal', 22, 'Male', 2, '2021'),
(53, 'Deepika Arora', 21, 'Female', 3, '2023'),
(54, 'Eshan Dubey', 23, 'Male', 4, '2020'),
(55, 'Fatima Sheikh', 22, 'Female', 5, '2021'),
(56, 'Gopal Varma', 19, 'Male', 6, '2024'),
(57, 'Hina Batra', 20, 'Female', 1, '2022'),
(58, 'Irfan Pathan', 22, 'Male', 2, '2021'),
(59, 'Jaya Nambiar', 21, 'Female', 3, '2023'),
(60, 'Karan Gill', 23, 'Male', 4, '2020'),
(61, 'Lakshmi Iyer', 21, 'Female', 1, '2023'),
(62, 'Manav Shah', 22, 'Male', 2, '2022'),
(63, 'Nisha Patil', 20, 'Female', 3, '2024'),
(64, 'Omkar Kulkarni', 23, 'Male', 4, '2020'),
(65, 'Pooja Deshmukh', 22, 'Female', 5, '2021'),
(66, 'Rahul Bansal', 19, 'Male', 6, '2024'),
(67, 'Sneha Kaur', 20, 'Female', 1, '2023'),
(68, 'Tushar Sinha', 22, 'Male', 2, '2022'),
(69, 'Urvashi Raut', 21, 'Female', 3, '2024'),
(70, 'Varun Reddy', 23, 'Male', 4, '2020'),
(71, 'Waseem Khan', 22, 'Male', 5, '2021'),
(72, 'Xena D’Cruz', 19, 'Female', 6, '2024'),
(73, 'Yusuf Patel', 20, 'Male', 1, '2023'),
(74, 'Zeenat Ali', 22, 'Female', 2, '2022'),
(75, 'Aditya Mehra', 21, 'Male', 3, '2024'),
(76, 'Bhavana Kapoor', 23, 'Female', 4, '2020'),
(77, 'Chetan Saxena', 22, 'Male', 5, '2021'),
(78, 'Divya Rani', 19, 'Female', 6, '2024'),
(79, 'Eklavya Yadav', 20, 'Male', 1, '2023'),
(80, 'Farah Qureshi', 22, 'Female', 2, '2022'),
(81, 'Gurpreet Singh', 21, 'Male', 3, '2024'),
(82, 'Harshita Modi', 23, 'Female', 4, '2020'),
(83, 'Iqbal Ahmed', 22, 'Male', 5, '2021'),
(84, 'Juhi Rawat', 19, 'Female', 6, '2024'),
(85, 'Kunal Thakur', 20, 'Male', 1, '2023'),
(86, 'Leena Fernandes', 22, 'Female', 2, '2022'),
(87, 'Mohit Chauhan', 21, 'Male', 3, '2024'),
(88, 'Nidhi Soni', 23, 'Female', 4, '2020'),
(89, 'Om Prakash', 22, 'Male', 5, '2021'),
(90, 'Prisha Gupta', 19, 'Female', 6, '2024'),
(91, 'Rohan Kapoor', 20, 'Male', 1, '2023'),
(92, 'Sana Sheikh', 22, 'Female', 2, '2022'),
(93, 'Tarun Mehta', 21, 'Male', 3, '2024'),
(94, 'Usha Jain', 23, 'Female', 4, '2020'),
(95, 'Vikas Singh', 22, 'Male', 5, '2021'),
(96, 'Yamini Rao', 19, 'Female', 6, '2024'),
(97, 'Zubin Joseph', 20, 'Male', 1, '2023'),
(98, 'Ananya Sharma', 22, 'Female', 2, '2022'),
(99, 'Bharath Kumar', 21, 'Male', 3, '2024'),
(100, 'Chitra Devi', 23, 'Female', 4, '2020');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
