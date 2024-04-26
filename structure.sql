-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: database:3306
-- Vytvořeno: Pát 26. dub 2024, 15:51
-- Verze serveru: 8.3.0
-- Verze PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `oagency`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `absence`
--

CREATE TABLE `absence` (
  `id` int UNSIGNED NOT NULL,
  `student_id` int UNSIGNED NOT NULL,
  `day_id` int UNSIGNED NOT NULL,
  `hour_id` int UNSIGNED NOT NULL,
  `subject_id` int NOT NULL,
  `date` date NOT NULL,
  `type_id` int UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `accepted` enum('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `absence_types`
--

CREATE TABLE `absence_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `class` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `color` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `addresses`
--

CREATE TABLE `addresses` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `answered_questionnaire`
--

CREATE TABLE `answered_questionnaire` (
  `id` int NOT NULL,
  `student_id` int UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `answers`
--

CREATE TABLE `answers` (
  `id` int UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL,
  `question_id` int NOT NULL,
  `answer_id` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `cabinets`
--

CREATE TABLE `cabinets` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `classbook`
--

CREATE TABLE `classbook` (
  `id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `shortcut` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `class_of_teacher`
--

CREATE TABLE `class_of_teacher` (
  `id` int UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `school_year` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `days`
--

CREATE TABLE `days` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `shortcut` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `emails`
--

CREATE TABLE `emails` (
  `id` int UNSIGNED NOT NULL,
  `author_user_id` int NOT NULL,
  `recipients` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `email_sort`
--

CREATE TABLE `email_sort` (
  `id` int UNSIGNED NOT NULL,
  `email_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `type_id` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `groups`
--

CREATE TABLE `groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `shortcut` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `year_of_onset` year NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `groups_of_students`
--

CREATE TABLE `groups_of_students` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `student_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `holidays`
--

CREATE TABLE `holidays` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date DEFAULT NULL,
  `everyyear` enum('true','false') CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `homework`
--

CREATE TABLE `homework` (
  `id` int UNSIGNED NOT NULL,
  `day_id` int UNSIGNED NOT NULL,
  `hour_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `deadline` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `hours`
--

CREATE TABLE `hours` (
  `id` int UNSIGNED NOT NULL,
  `hour` int NOT NULL,
  `time_start` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `time_end` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `marks`
--

CREATE TABLE `marks` (
  `id` int UNSIGNED NOT NULL,
  `student_id` int UNSIGNED NOT NULL,
  `subject_id` int UNSIGNED NOT NULL,
  `mark` float NOT NULL,
  `scale` tinyint NOT NULL,
  `date` date NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `notes`
--

CREATE TABLE `notes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `day_id` int UNSIGNED NOT NULL,
  `hour_id` int UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `parents`
--

CREATE TABLE `parents` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `student_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `qualification`
--

CREATE TABLE `qualification` (
  `id` int UNSIGNED NOT NULL,
  `student_id` int UNSIGNED NOT NULL,
  `subject_id` int UNSIGNED NOT NULL,
  `grade` tinyint NOT NULL,
  `semester` tinyint NOT NULL,
  `school_year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `students`
--

CREATE TABLE `students` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `register_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects`
--

CREATE TABLE `subjects` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `shortcut` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `subjects_by_group`
--

CREATE TABLE `subjects_by_group` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `subject_id` int UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL,
  `school_year` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `teachers`
--

CREATE TABLE `teachers` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `cabinet_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `timetable`
--

CREATE TABLE `timetable` (
  `id` int UNSIGNED NOT NULL,
  `day_id` int UNSIGNED NOT NULL,
  `hour_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `subject_id` int UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL,
  `classroom_id` int UNSIGNED NOT NULL,
  `school_year` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `timetable_changes`
--

CREATE TABLE `timetable_changes` (
  `id` int UNSIGNED NOT NULL,
  `curr_day_id` int UNSIGNED NOT NULL,
  `curr_hour_id` int UNSIGNED NOT NULL,
  `curr_group_id` int UNSIGNED DEFAULT NULL,
  `curr_teacher_id` int UNSIGNED DEFAULT NULL,
  `curr_subject_id` int UNSIGNED DEFAULT NULL,
  `curr_classroom_id` int UNSIGNED DEFAULT NULL,
  `canceled` enum('true','false','new') CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `new_day_id` int UNSIGNED DEFAULT NULL,
  `new_hour_id` int UNSIGNED DEFAULT NULL,
  `new_group_id` int UNSIGNED DEFAULT NULL,
  `new_teacher_id` int UNSIGNED DEFAULT NULL,
  `new_subject_id` int UNSIGNED DEFAULT NULL,
  `new_classroom_id` int UNSIGNED DEFAULT NULL,
  `curr_date` date NOT NULL,
  `new_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `facebook_id` bigint NOT NULL,
  `degree` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `firstname` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `surname` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `login_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `generated_pw` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `birthday` date NOT NULL,
  `sex` tinyint NOT NULL DEFAULT '0',
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_czech_ci NOT NULL,
  `last_connected` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_czech_ci;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `hour_id` (`hour_id`);

--
-- Indexy pro tabulku `absence_types`
--
ALTER TABLE `absence_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `answered_questionnaire`
--
ALTER TABLE `answered_questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cabinets`
--
ALTER TABLE `cabinets`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `classbook`
--
ALTER TABLE `classbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `class_of_teacher`
--
ALTER TABLE `class_of_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexy pro tabulku `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `email_sort`
--
ALTER TABLE `email_sort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `groups_of_students`
--
ALTER TABLE `groups_of_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexy pro tabulku `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `hour_id` (`hour_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexy pro tabulku `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_id_2` (`student_id`),
  ADD KEY `student_id_3` (`student_id`);

--
-- Indexy pro tabulku `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `hour_id` (`hour_id`);

--
-- Indexy pro tabulku `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexy pro tabulku `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pro tabulku `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `subjects_by_group`
--
ALTER TABLE `subjects_by_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexy pro tabulku `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cabinet_id` (`cabinet_id`);

--
-- Indexy pro tabulku `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `hour_id` (`hour_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexy pro tabulku `timetable_changes`
--
ALTER TABLE `timetable_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hour_id` (`curr_hour_id`),
  ADD KEY `new_classroom_id` (`new_classroom_id`),
  ADD KEY `new_teacher_id` (`new_teacher_id`),
  ADD KEY `new_subject_id` (`new_subject_id`),
  ADD KEY `new_hour_id` (`new_hour_id`),
  ADD KEY `curr_teacher_id` (`curr_teacher_id`),
  ADD KEY `curr_classroom_id` (`curr_classroom_id`),
  ADD KEY `new_group_id` (`new_group_id`),
  ADD KEY `curr_group_id` (`curr_group_id`),
  ADD KEY `curr_subject_id` (`curr_subject_id`),
  ADD KEY `curr_day_id` (`curr_day_id`),
  ADD KEY `new_day_id` (`new_day_id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `absence`
--
ALTER TABLE `absence`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `absence_types`
--
ALTER TABLE `absence_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `answered_questionnaire`
--
ALTER TABLE `answered_questionnaire`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `cabinets`
--
ALTER TABLE `cabinets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `classbook`
--
ALTER TABLE `classbook`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `class_of_teacher`
--
ALTER TABLE `class_of_teacher`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `days`
--
ALTER TABLE `days`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `email_sort`
--
ALTER TABLE `email_sort`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `groups_of_students`
--
ALTER TABLE `groups_of_students`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `hours`
--
ALTER TABLE `hours`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `students`
--
ALTER TABLE `students`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `subjects_by_group`
--
ALTER TABLE `subjects_by_group`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `timetable_changes`
--
ALTER TABLE `timetable_changes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `absence_types` (`id`),
  ADD CONSTRAINT `absence_ibfk_3` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `absence_ibfk_4` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `absence_ibfk_5` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Omezení pro tabulku `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `class_of_teacher`
--
ALTER TABLE `class_of_teacher`
  ADD CONSTRAINT `class_of_teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `class_of_teacher_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Omezení pro tabulku `email_sort`
--
ALTER TABLE `email_sort`
  ADD CONSTRAINT `email_sort_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`),
  ADD CONSTRAINT `email_sort_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `groups_of_students`
--
ALTER TABLE `groups_of_students`
  ADD CONSTRAINT `groups_of_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `groups_of_students_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Omezení pro tabulku `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Omezení pro tabulku `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Omezení pro tabulku `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `notes_ibfk_3` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`);

--
-- Omezení pro tabulku `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `qualification`
--
ALTER TABLE `qualification`
  ADD CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `qualification_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Omezení pro tabulku `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `subjects_by_group`
--
ALTER TABLE `subjects_by_group`
  ADD CONSTRAINT `subjects_by_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `subjects_by_group_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `subjects_by_group_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Omezení pro tabulku `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`cabinet_id`) REFERENCES `cabinets` (`id`);

--
-- Omezení pro tabulku `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `timetable_ibfk_4` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `timetable_ibfk_5` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `timetable_ibfk_6` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Omezení pro tabulku `timetable_changes`
--
ALTER TABLE `timetable_changes`
  ADD CONSTRAINT `timetable_changes_ibfk_1` FOREIGN KEY (`curr_hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_10` FOREIGN KEY (`new_group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_11` FOREIGN KEY (`curr_group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_12` FOREIGN KEY (`curr_subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_13` FOREIGN KEY (`curr_day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_14` FOREIGN KEY (`new_day_id`) REFERENCES `days` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_2` FOREIGN KEY (`new_group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_3` FOREIGN KEY (`new_classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_4` FOREIGN KEY (`new_teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_5` FOREIGN KEY (`new_subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_6` FOREIGN KEY (`new_hour_id`) REFERENCES `hours` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_7` FOREIGN KEY (`curr_teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `timetable_changes_ibfk_8` FOREIGN KEY (`curr_classroom_id`) REFERENCES `classrooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
