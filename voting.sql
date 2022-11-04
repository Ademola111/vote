-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2022 at 04:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(255) NOT NULL,
  `ad_email` varchar(255) NOT NULL,
  `ad_pass` varchar(255) NOT NULL,
  `ad_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ad_id`, `ad_name`, `ad_email`, `ad_pass`, `ad_date`) VALUES
(1, 'Hakeem', 'virgintinny@gmail.com', 'London111', '2022-10-25 15:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `contestant`
--

CREATE TABLE `contestant` (
  `cont_id` int(11) NOT NULL,
  `cont_name` varchar(255) NOT NULL,
  `na_nacosid` varchar(255) NOT NULL,
  `na_nacoslevel` varchar(255) NOT NULL,
  `cont_post` enum('none','president','vp','vp special duties','software director r&i','developers lead','gen sec','fin sec','pro1','pro2','welfare director','social director','sport director') NOT NULL DEFAULT 'none',
  `cont_department` enum('none','cs','cse','csm','it') NOT NULL DEFAULT 'none',
  `cont_studycenter` varchar(255) NOT NULL,
  `cont_pic` varchar(255) NOT NULL,
  `cont_membershipcert` varchar(255) NOT NULL,
  `cont_nominationform` varchar(255) NOT NULL,
  `cont_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nacosid`
--

CREATE TABLE `nacosid` (
  `na_id` int(11) NOT NULL,
  `na_studentname` varchar(255) DEFAULT NULL,
  `na_nacosid` varchar(255) DEFAULT NULL,
  `na_studycenter` varchar(255) DEFAULT NULL,
  `na_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nacosid`
--

INSERT INTO `nacosid` (`na_id`, `na_studentname`, `na_nacosid`, `na_studycenter`, `na_time`) VALUES
(1, 'Boluwatife Babalolaa', 'NA00001', 'Lagos VI', '2022-11-04 02:57:20'),
(2, 'Okwachi Kanu', 'NA00002', 'Enugu', '2022-11-04 02:57:20'),
(3, 'Johnathan Imuko', 'NA00003', 'Dutse', '2022-11-04 02:57:20'),
(4, 'Shodeke Bamidele Samson', 'NA00004', 'Ibadan', '2022-11-04 02:57:20'),
(5, 'Olugbesan Samuel', 'NA00005', 'Ibadan', '2022-11-04 02:57:20'),
(6, 'Sanusi Emmanuel', 'NA00006', 'Lagos VI', '2022-11-04 02:57:20'),
(7, 'Zainab Muhammed Umar', 'NA00007', 'Lafia', '2022-11-04 02:57:20'),
(8, 'Adisa Ifeoluwa Oluwatobilola', 'NA00008', 'Lagos VI', '2022-11-04 02:57:20'),
(9, 'Adewunmi Oluwasegun Olamide', 'NA00009', 'Ibadan', '2022-11-04 02:57:20'),
(10, 'Adisa IfeOluwa Oluwatobiloba', 'NA00010', 'Lagos VI', '2022-11-04 02:57:20'),
(11, 'Sule Oche Benjamin', 'NA00011', 'Abuja', '2022-11-04 02:57:20'),
(12, 'Chukwu Timothy Kelechi', 'NA00012', 'Abakaliki', '2022-11-04 02:57:20'),
(13, 'Olaiya Shoneye Hassan', 'NA00013', 'Lagos VI', '2022-11-04 02:57:20'),
(14, 'Haruna Yau', 'NA00014', 'Dutse', '2022-11-04 02:57:20'),
(15, 'Idongesit Stella Essien', 'NA00015', 'Lagos VI', '2022-11-04 02:57:20'),
(16, 'Harisu Muhammad', 'NA00016', 'Kastina', '2022-11-04 02:57:20'),
(17, 'Nathanael Temmy', 'NA00017', 'Abeokuta', '2022-11-04 02:57:20'),
(18, 'Igboke Martha C.', 'NA00018', 'Abakaliki', '2022-11-04 02:57:20'),
(19, 'Chiamaka Angela Okorie', 'NA00020', 'Abuja', '2022-11-04 02:57:20'),
(20, 'SAMUEL MSONTER ORTIL', 'NA00021', 'Abuja', '2022-11-04 02:57:20'),
(21, 'Effiong Saviour Okpo-mfon', 'NA00022', 'Lagos VI', '2022-11-04 02:57:20'),
(22, 'Stephen Ifeanyi Nwoye', 'NA00031', 'Jos', '2022-11-04 02:57:20'),
(23, 'Omale Abraham Ojochenemi', 'Na63139', 'Abuja', '2022-11-04 02:57:20'),
(24, 'AREMU AKOREDE', 'NA13124', 'Ibadan', '2022-11-04 02:57:20'),
(25, 'Olamoyegun Babatunde Peter', 'NA88710', 'Ibadan', '2022-11-04 02:57:20'),
(26, 'Olagunju Omolara Dasola', 'Na611133', 'Ibadan', '2022-11-04 02:57:20'),
(27, 'Enyinnaya Daniel', 'NA91911', 'Lagos VI', '2022-11-04 02:57:20'),
(28, 'Esu Magnus Imoh', 'NO11112', 'Abuja', '2022-11-04 02:57:20'),
(29, 'Isreal Baba', 'NA01113', 'Abakaliki', '2022-11-04 02:57:20'),
(30, 'Joshua Abe', 'NA20361', 'Lagos VI', '2022-11-04 02:57:20'),
(31, 'Adelani Toheeb Daniel', 'NA00362', 'Lagos VI', '2022-11-04 02:57:20'),
(32, 'Deborah Oluwafeyikemi Nyamekye Nyarko', 'NAO12126', 'Abuja', '2022-11-04 02:57:20'),
(33, 'Boluwaji Akinsefunmi', 'NA85334', 'Lagos VI', '2022-11-04 02:57:20'),
(34, 'Haruna Yau', 'NA20343', 'Dutse', '2022-11-04 02:57:20'),
(35, 'Nathanael Temmy', 'NA13332', 'Abeokuta', '2022-11-04 02:57:20'),
(36, 'Afonja Omotomiwa Raheem', 'NA76445', 'Lagos VI', '2022-11-04 02:57:20'),
(37, 'Joseph Atteh', 'NA44431', 'Lagos VI', '2022-11-04 02:57:20'),
(38, 'Johnson Olubukola Esther', 'NA61345', 'Lagos VI', '2022-11-04 02:57:20'),
(39, 'Kabiru Mudi', 'NA203411', 'Kastina', '2022-11-04 02:57:20'),
(40, 'Vincent Stephen', 'NA30303', 'Lafia', '2022-11-04 02:57:20'),
(41, 'Lekwot Raymond Daniel', 'NA21200', 'Abuja', '2022-11-04 02:57:20'),
(42, 'Duru Ikemsinachukwu Johnbosco Kelechi', 'NA32210', 'Lagos VI', '2022-11-04 02:57:20'),
(43, 'Sanusi Emmanuel Olatunji', 'NA00006', 'Lagos VI', '2022-11-04 02:57:20'),
(44, 'ENO- OBONG- EMMANUEL', 'NA00007', 'Port-Harcourt', '2022-11-04 02:57:20'),
(45, 'Serah Daniel', 'NA00008', 'Lagos VI', '2022-11-04 02:57:20'),
(46, 'Akinboroye Samuel Oluwatobi', 'NA00009', 'Ibadan', '2022-11-04 02:57:20'),
(47, 'Ndubuisi Chigozie Paul', 'NA00010', 'Abuja', '2022-11-04 02:57:20'),
(48, 'Adediran Timothy', 'NA00011', 'Abeokuta', '2022-11-04 02:57:20'),
(49, 'Abdullahi Hassan Yakasai', 'NA00012', 'Abuja', '2022-11-04 02:57:20'),
(50, 'Olaniregun Emmanuel Oluremi', 'NA20013', 'Ibadan', '2022-11-04 02:57:20'),
(51, 'Adebayo Helen Imoleayo', 'NA00014', 'Ibadan', '2022-11-04 02:57:20'),
(52, 'Shaapera Vershima Micheal', 'NA30015', 'Abuja', '2022-11-04 02:57:20'),
(53, 'Aminah Odaudu Atadoga', 'NA02016', 'Lokoja', '2022-11-04 02:57:20'),
(54, 'Wisdom Samuel', 'NA02017', 'Abeokuta', '2022-11-04 02:57:20'),
(55, 'Amupitan Victor Idowu', 'NA02018', 'Ilorin', '2022-11-04 02:57:20'),
(56, 'Ibeawuchi Esther Nkechinyere', 'NA02019', 'Lagos VI', '2022-11-04 02:57:20'),
(57, 'Moses Kufre Nathaniel', 'NA02020', 'Ekiti', '2022-11-04 02:57:20'),
(58, 'Ogunsola Taiwo Peace', 'NA02021', 'Ibadan', '2022-11-04 02:57:20'),
(59, 'Victory Esien Anwakang', 'NA02022', 'Abuja', '2022-11-04 02:57:20'),
(60, 'OGBOLE HOPE', 'NA02027', 'Lagos VI', '2022-11-04 02:57:20'),
(61, 'Fakunmoju Fatai', 'NA02028', 'Lagos VI', '2022-11-04 02:57:20'),
(62, 'Emmanuel Paul', 'NA02029', 'Lagos VI', '2022-11-04 02:57:20'),
(63, 'Ismaeel  Salami', 'NA02030', 'Port-Harcourt', '2022-11-04 02:57:20'),
(64, 'Oyeniran Adewale Akintunde', 'NA02031', 'Ibadan', '2022-11-04 02:57:20'),
(65, 'Dabo Oluwatomisin Titus', 'NA02032', 'Abuja', '2022-11-04 02:57:20'),
(66, 'Adesanmi Justinah Kemisola', 'NA02033', 'Abuja', '2022-11-04 02:57:20'),
(67, 'Adesanmi Justinah Kemisola', 'NA02034', 'Akure', '2022-11-04 02:57:20'),
(68, 'Dabo Oluwatomisin Titus', 'NA02035', 'Akure', '2022-11-04 02:57:20'),
(69, 'Aliu Adeshina Oluwaseun', 'NA01128', 'Ibadan', '2022-11-04 02:57:20'),
(70, 'Kabiru Mudi', 'NA20341', 'Kastina', '2022-11-04 02:57:20'),
(71, 'Arthur David Ayomide', 'NA00342', 'Ibadan', '2022-11-04 02:57:20'),
(72, 'Fashola Micheal Olatunji', 'NA00344', 'Ibadan', '2022-11-04 02:57:20'),
(73, 'Onayemi Hakeem Adedamola', 'NA00345', 'Lagos VI', '2022-11-04 02:57:20'),
(74, 'Usman Kazeem Adah', 'NA00346', 'Abuja', '2022-11-04 02:57:20'),
(75, 'Ikeh Princewill Chukwuebuka', 'NA00347', 'Mccarthy', '2022-11-04 02:57:20'),
(76, 'Olaoshebikan Babatunde David', 'NA00348', 'Lagos VI', '2022-11-04 02:57:20'),
(77, 'Afolabi Gbemisola Iyabode', 'NA00349', 'Ibadan', '2022-11-04 02:57:20'),
(78, 'Toviesi Aliyu G', 'NA00350', 'Lagos VI', '2022-11-04 02:57:20'),
(79, 'Issac Olaitan', 'NA00351', 'Abeokuta', '2022-11-04 02:57:20'),
(80, 'LADAN Muhammad', 'NA00352', 'Kaduna', '2022-11-04 02:57:20'),
(81, 'Idowu Precious Damilola', 'NA00353', 'Mccarthy', '2022-11-04 02:57:20'),
(82, 'Oriko Valentine Evaristus', 'NA00354', 'Abakaliki', '2022-11-04 02:57:20'),
(83, 'Onah Jeremiah Ijwo', 'NA00355', 'Lagos VI', '2022-11-04 02:57:20'),
(84, 'Adediwura Odunayo Tosin', 'NA00356', 'Lagos VI', '2022-11-04 02:57:20'),
(85, 'Lawrence Bolaji Amusan', 'NA00357', 'Ibadan', '2022-11-04 02:57:20'),
(86, 'Ajileye Oluwasegun Oluwafemi', 'NA51331', 'Lagos VI', '2022-11-04 02:57:20'),
(87, 'Odenigbo Innocent Obumu', 'NA01332', 'Abuja', '2022-11-04 02:57:20'),
(88, 'Olalekan Adeyemi Raji', 'NA01333', 'Abuja', '2022-11-04 02:57:20'),
(89, 'Olayinka Emmanuel', 'NA22211', 'Lagos VI', '2022-11-04 02:57:20'),
(90, 'Joseph Princetom Johnson', 'NA02212', 'Ilorin', '2022-11-04 02:57:20'),
(91, 'Tomiwa Damilola', 'NA02213', 'Ibadan', '2022-11-04 02:57:20'),
(92, 'Ademu Charles Adaji', 'NA09214', 'Ilorin', '2022-11-04 02:57:20'),
(93, 'Ladan Iliyasu', 'NA02215', 'Lafia', '2022-11-04 02:57:20'),
(94, 'Wodi Aliyu Munirat', 'NA02216', 'Abuja', '2022-11-04 02:57:20'),
(95, 'Olorunosebi Dhikrat Motunrayo', 'NA45544', 'Abuja', '2022-11-04 02:57:20'),
(96, 'Iwambe Denen Andy', 'NA05545', 'Abuja', '2022-11-04 02:57:20'),
(97, 'Nianden M. Vincent', 'NA05546', 'Abuja', '2022-11-04 02:57:20'),
(98, 'Saka Aliu', 'NA05547', 'Abuja', '2022-11-04 02:57:20'),
(99, 'Esther Bisella', 'NA05548', 'Abuja', '2022-11-04 02:57:20'),
(100, 'Adewale Oluwadimimu Adeyinka', 'NA05549', 'Ibadan', '2022-11-04 02:57:20'),
(101, 'Adegbegi Samuel Oluwasegun', 'NA05550', 'Ekiti', '2022-11-04 02:57:20'),
(102, 'Olatunji Bukola E.', 'NA43221', 'Lagos VI', '2022-11-04 02:57:20'),
(103, 'Toyin Solomon', 'NA01115', 'Abeokuta', '2022-11-04 02:57:20'),
(104, 'Onwuka Maryjane Chiamaka', 'NA11710', 'Akwa', '2022-11-04 02:57:20'),
(105, 'Adugbe Daniel', 'NA01711', 'Ibadan', '2022-11-04 02:57:20'),
(106, 'Falade Dorcas Oluwakamiye', 'NA01712', 'Abeokuta', '2022-11-04 02:57:20'),
(107, 'Oyekanmi Mayowa Stephen', 'NA01713', 'Abeokuta', '2022-11-04 02:57:20'),
(108, 'Moses Kufre Nathaniel', 'NA01714', 'Ekiti', '2022-11-04 02:57:20'),
(109, 'Oyekanmi Mayowa Stephen', 'NA01715', 'Abeokuta', '2022-11-04 02:57:20'),
(110, 'Clement Diligence Chibuikem', 'NA01716', 'Jos', '2022-11-04 02:57:20'),
(111, 'Abdulrahim Yusuf', 'NA01717', 'Abuja', '2022-11-04 02:57:20'),
(112, 'Promise Stephen John', 'NA01718', 'Mccarthy', '2022-11-04 02:57:20'),
(113, 'Tomiwa Adesiyan', 'NA01719', 'Ibadan', '2022-11-04 02:57:20'),
(114, 'Egwu Veronica Eleje', 'NA01720', 'Abuja', '2022-11-04 02:57:20'),
(115, 'Ridwan Issah', 'NA01721', 'Abuja', '2022-11-04 02:57:20'),
(116, 'OFFODIE RITA CHINENYE', 'NA01722', 'Jos', '2022-11-04 02:57:20'),
(117, 'Francis Sunday Chukwuyere', 'NA01723', 'Abeokuta', '2022-11-04 02:57:20'),
(118, 'Ramatu Yusuf', 'NA01724', 'Abuja', '2022-11-04 02:57:20'),
(119, 'Mbogo John Bendict .E', 'NA01725', 'Mushin', '2022-11-04 02:57:20'),
(120, 'OKERE OBIANUJU STELLA', 'NA01726', 'Owerri', '2022-11-04 02:57:20'),
(121, 'FAITH IMUETINYANOSA', 'NA01727', 'Lagos VI', '2022-11-04 02:57:20'),
(122, 'Afe Micheal Ayokunle', 'NA01728', 'Ibadan', '2022-11-04 02:57:20'),
(123, 'Onasanyo Ayomide Emmanuel', 'NA01729', 'Ibadan', '2022-11-04 02:57:20'),
(124, 'UMEH Ugochukwu Stanley', 'NA01730', 'Lagos VI', '2022-11-04 02:57:20'),
(125, 'Olaore Oluwadamilola Sam', 'NA01731', 'Ibadan', '2022-11-04 02:57:20'),
(126, 'Kabirat Abike Lasisi', 'NA01732', 'Ibadan', '2022-11-04 02:57:20'),
(127, 'Blessing Effiong Okon', 'NA01733', 'Lagos VI', '2022-11-04 02:57:20'),
(128, 'Obasi Chidinma Perpetual', 'NA01734', 'Lagos VI', '2022-11-04 02:57:20'),
(129, 'Adebayo Azeez Ademola', 'NA01735', 'Lagos VI', '2022-11-04 02:57:20'),
(130, 'OPATUNMBI CHRISTIANAH KEHINDE', 'NA01736', 'Ibadan', '2022-11-04 02:57:20'),
(131, 'Udeme Juliet Chinyere', 'NA01738', 'Asaba', '2022-11-04 02:57:20'),
(132, 'SULEIMAN JURAT ZUWERAT', 'NA01739', 'Apapa', '2022-11-04 02:57:20'),
(133, 'SANUSI IBRAHEEM BABATUNDE', 'NA01740', 'Abeokuta', '2022-11-04 02:57:20'),
(134, 'Ibrahim Hanifa Abdullahi', 'NA01741', 'Lafia', '2022-11-04 02:57:20'),
(135, 'Olagunju Moses Elijah', 'NA01742', 'Ibadan', '2022-11-04 02:57:20'),
(136, 'Barry Job Michael', 'NA01743', 'Abeokuta', '2022-11-04 02:57:20'),
(137, 'Ogijo Nafisat Olamide', 'NA01744', 'Ibadan', '2022-11-04 02:57:20'),
(138, 'Asawo Rhoda Abosede', 'NA01745', 'Abeokuta', '2022-11-04 02:57:20'),
(139, 'Olatunji Isreal', 'NA01746', 'Ibadan', '2022-11-04 02:57:20'),
(140, 'Samuel Anuolawapo Oriola', 'NA01747', 'Mushin', '2022-11-04 02:57:20'),
(141, 'Alogaga Faith Eboshigwe', 'NA01748', 'Benin', '2022-11-04 02:57:20'),
(142, 'Bello Mujeeb Abiodun', 'NA01749', 'Osogbo', '2022-11-04 02:57:20'),
(143, 'Omolade Victor', 'NA01750', 'Akure', '2022-11-04 02:57:20'),
(144, 'Faith Agboola', 'NA01751', 'Ibadan', '2022-11-04 02:57:20'),
(145, 'Friday  Sunday', 'NA01752', 'Ekiti', '2022-11-04 02:57:20'),
(146, 'Adegboyega Tosin', 'NA01753', 'Ibadan', '2022-11-04 02:57:20'),
(147, 'Ibrahim Agunbiade', 'NA01754', 'Ibadan', '2022-11-04 02:57:20'),
(148, 'Deborah Tolulope Adebunmi', 'NA01755', 'Jos', '2022-11-04 02:57:20'),
(149, 'Deborah Tolulope Adebunmi', 'NA01756', 'Jos', '2022-11-04 02:57:20'),
(150, 'Ajewole Bamidele', 'NA01757', 'Mushin', '2022-11-04 02:57:20'),
(151, 'Adepingha Busayo Sunday', 'NA01758', 'Lagos VI', '2022-11-04 02:57:20'),
(152, 'Adebanjo Moyosore', 'NA01759', 'Ibadan', '2022-11-04 02:57:20'),
(153, 'Olugbesan Adegboyega Samuel', 'NA01760', 'Ibadan', '2022-11-04 02:57:20'),
(154, 'Joshua Abe', 'NA01761', 'Ibadan', '2022-11-04 02:57:20'),
(155, 'Akpati Justice', 'NA01762', 'Asaba', '2022-11-04 02:57:20'),
(156, 'Ekenedilichukwu Ibekwe', 'NA01763', 'Lagos VI', '2022-11-04 02:57:20'),
(157, 'Unoh Sylvester Ugah', 'NA01764', 'Abuja', '2022-11-04 02:57:20'),
(158, 'Olia Adedamola Luqmon', 'NA01765', 'Ibadan', '2022-11-04 02:57:20'),
(159, 'Olagunju Moses Elijah', 'NA01766', 'Ibadan', '2022-11-04 02:57:20'),
(160, 'Olutoye Ifeoluwa Folake', 'NA01767', 'Ibadan', '2022-11-04 02:57:20'),
(161, 'Simon Etim', 'NA01768', 'Apapa', '2022-11-04 02:57:20'),
(162, 'Attani Okpe Emmanuel', 'NA01769', 'Ibadan', '2022-11-04 02:57:20'),
(163, 'CHIJIOKE CHARLES', 'NA01770', 'Akure', '2022-11-04 02:57:20'),
(164, 'ADEDIRAN TIMOTHY ISHOLA', 'NA01771', 'Abeokuta', '2022-11-04 02:57:20'),
(165, 'Opeyemi Damilola Vipekode', 'NA01772', 'Ibadan', '2022-11-04 02:57:20'),
(166, 'Boluwatife Olaoye', 'NA01773', 'Ibadan', '2022-11-04 02:57:20'),
(167, 'Jacob Sunday Balla', 'NA01774', 'Lagos VI', '2022-11-04 02:57:20'),
(168, 'OKON MARY OBO', 'NA01775', 'Abuja', '2022-11-04 02:57:20'),
(169, 'Abed Taofeeq', 'NA01776', 'Mushin', '2022-11-04 02:57:20'),
(170, 'Prudence David', 'NA01777', 'Port-Harcourt', '2022-11-04 02:57:20'),
(171, 'Oladipupo Samuel Tosin', 'NA01778', 'Abeokuta', '2022-11-04 02:57:20'),
(172, 'Hannah Chukwu', 'NA01779', 'Abuja', '2022-11-04 02:57:20'),
(173, 'Babatunde Akeem', 'NA01780', 'Akure', '2022-11-04 02:57:20'),
(174, 'Yahaya Hassan', 'NA01781', 'Jos', '2022-11-04 02:57:20'),
(175, 'Emmanuel Alah Udeye', 'NA01782', 'Abuja', '2022-11-04 02:57:20'),
(176, 'Agbejule Okikiola Israel', 'NA01783', 'Ibadan', '2022-11-04 02:57:20'),
(177, 'Emereonye Chinonso Evander', 'NA01784', 'Lagos VI', '2022-11-04 02:57:20'),
(178, 'Samuel M. Ortil', 'NA01785', 'Abuja', '2022-11-04 02:57:20'),
(179, 'Odanye Victoria Ololade', 'NA01786', 'Lagos VI', '2022-11-04 02:57:20'),
(180, 'Emmanuel David', 'NA01787', 'Abuja', '2022-11-04 02:57:20'),
(181, 'Onifade Victor Joshua Adejuwon', 'NA01788', 'Osogbo', '2022-11-04 02:57:20'),
(182, 'Onifade Victor Joshua Adejuwon', 'NA01789', 'Osogbo', '2022-11-04 02:57:20'),
(183, 'Noor-Al-Hudah Nurudeen', 'NA01790', 'Ibadan', '2022-11-04 02:57:20'),
(184, 'Akinrande Paul Abiodun', 'NA01791', 'Lagos VI', '2022-11-04 02:57:20'),
(185, 'Lawal Temitayo Oluwadamilare', 'NA01792', 'Ekiti', '2022-11-04 02:57:20'),
(186, 'Ekuma Prince Chinemerueze', 'NA01793', 'Lagos VI', '2022-11-04 02:57:20'),
(187, 'GBEMISOLA AFOLABI', 'NA01794', 'Ibadan', '2022-11-04 02:57:20'),
(188, 'Olawole Faith', 'NA01795', 'Akure', '2022-11-04 02:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `vt_id` int(11) NOT NULL,
  `vt_category` varchar(255) DEFAULT NULL,
  `vt_nacosid` varchar(255) DEFAULT NULL,
  `vt_contestantid` int(11) DEFAULT NULL,
  `vt_nacosidid` int(11) DEFAULT NULL,
  `vt_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `contestant`
--
ALTER TABLE `contestant`
  ADD PRIMARY KEY (`cont_id`);

--
-- Indexes for table `nacosid`
--
ALTER TABLE `nacosid`
  ADD PRIMARY KEY (`na_id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`vt_id`),
  ADD KEY `vt_contestantid` (`vt_contestantid`),
  ADD KEY `vt_nacosidid` (`vt_nacosidid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contestant`
--
ALTER TABLE `contestant`
  MODIFY `cont_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nacosid`
--
ALTER TABLE `nacosid`
  MODIFY `na_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `vt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`vt_contestantid`) REFERENCES `contestant` (`cont_id`),
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`vt_nacosidid`) REFERENCES `nacosid` (`na_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
