-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2021 at 08:16 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amii`
--

-- --------------------------------------------------------

--
-- Table structure for table `desi`
--

CREATE TABLE IF NOT EXISTS `desi` (
  `no` int(3) NOT NULL,
  `designation` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desi`
--

INSERT INTO `desi` (`no`, `designation`) VALUES
(101, 'ACC'),
(102, 'SAL');

-- --------------------------------------------------------

--
-- Stand-in structure for view `emp`
--
CREATE TABLE IF NOT EXISTS `emp` (
`no` int(5)
,`name` varchar(10)
,`designation` varchar(5)
,`salary` int(5)
,`da` varchar(5)
,`hra` int(5)
,`t_salary` int(5)
,`tax` int(3)
,`TOTAL` int(3)
);
-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `no` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `designation` varchar(5) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`no`, `name`, `designation`, `password`) VALUES
(19, 'Vinita', 'acc', '456'),
(20, 'Mohan', 'sal', '555'),
(24, 'abc', 'acc', '333'),
(25, 'xxx', 'sal', '123'),
(28, 'aaaa', '101', '333'),
(29, 'xxxx', '101', '101'),
(30, 'aaaaa', '101', '111'),
(31, 'aaaaaaaa', '101', 'aaa'),
(32, 'Ami', '102', '456'),
(33, 'aammii', '102', '1234');

--
-- Triggers `employee`
--
DROP TRIGGER IF EXISTS `dele`;
DELIMITER //
CREATE TRIGGER `dele` BEFORE DELETE ON `employee`
 FOR EACH ROW DELETE from salary WHERE salary.no=old.no
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ins`;
DELIMITER //
CREATE TRIGGER `ins` AFTER INSERT ON `employee`
 FOR EACH ROW insert into salary values(new.no,(select IF(employee.designation='101',12000,IF(employee.designation='102',15000,0)) from employee where employee.no=new.no),salary.salary*0.12,salary.salary*0.10,salary.salary+salary.da+salary.hra)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update`;
DELIMITER //
CREATE TRIGGER `update` AFTER UPDATE ON `employee`
 FOR EACH ROW UPDATE salary SET salary.salary=(SELECT IF(employee.designation='101',12000,if(employee.designation='102',15000,0))FROM employee WHERE employee.no=old.no),salary.da=salary.salary*0.12,salary.hra=salary.salary*0.15,salary.salary=salary.salary+salary.da+salary.hra WHERE salary.no=old.no
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `no` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(10) NOT NULL,
  `eduction` varchar(10) NOT NULL,
  `persantage` varchar(10) NOT NULL,
  `designation` varchar(10) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`no`, `username`, `password`, `firstname`, `lastname`, `gender`, `address`, `city`, `mobile`, `email`, `eduction`, `persantage`, `designation`) VALUES
(1, 'ami soni', 'ami', 'ami', 'soni', 'female', 'ahm', 'Ahmedabad', '12344', 'a', 'MCA', '88', 'ACC'),
(2, 'Rinkal', '123', 'rinkal', 'katariya', 'female', 'raj', 'Rajkot', '1234567', 'rinkal@g.c', 'MBA', '99', 'MAN');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE IF NOT EXISTS `salary` (
  `no` int(3) NOT NULL,
  `salary` int(5) NOT NULL,
  `da` varchar(5) NOT NULL,
  `hra` int(5) NOT NULL,
  `t_salary` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`no`, `salary`, `da`, `hra`, `t_salary`) VALUES
(28, 15240, '1440', 1800, 14640),
(29, 12000, '1440', 1200, 14640),
(30, 15240, '1440', 1800, 0),
(31, 12000, '1440', 1200, 14640),
(32, 19050, '1800.', 2250, 18300),
(33, 15000, '1800.', 1500, 18300);

--
-- Triggers `salary`
--
DROP TRIGGER IF EXISTS `cal_tax`;
DELIMITER //
CREATE TRIGGER `cal_tax` AFTER INSERT ON `salary`
 FOR EACH ROW INSERT INTO tax1 VALUES(new.no,(SELECT IF(employee.designation='101',(SELECT salary.salary*0.12 FROM salary WHERE salary.no=new.no),IF(employee.designation='102',(SELECT salary.salary*0.10 FROM salary WHERE salary.no=new.no),0))FROM employee WHERE employee.no=new.no),(SELECT salary.t_salary FROM salary WHERE salary.no=new.no)-tax1.tax)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `del`;
DELIMITER //
CREATE TRIGGER `del` BEFORE DELETE ON `salary`
 FOR EACH ROW DELETE from tax1 WHERE tax1.no=old.no
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_tax`;
DELIMITER //
CREATE TRIGGER `update_tax` AFTER UPDATE ON `salary`
 FOR EACH ROW UPDATE tax1 SET tax1.tax=(SELECT if(employee.designation='101',(SELECT salary.salary *0.12 from salary WHERE salary.no=new.no),if(employee.designation='102',(SELECT salary.salary*0.10 from salary WHERE salary.no=new.no),0)) from employee where employee.no=new.no),tax1.TOTAL=(SELECT salary.t_salary from salary WHERE salary.no=new.no)-tax1.tax WHERE tax1.no=old.no
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tax1`
--

CREATE TABLE IF NOT EXISTS `tax1` (
  `no` int(3) NOT NULL,
  `tax` int(3) NOT NULL,
  `TOTAL` int(3) NOT NULL,
  KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax1`
--

INSERT INTO `tax1` (`no`, `tax`, `TOTAL`) VALUES
(19, 1440, 13200),
(28, 1829, 12811),
(29, 1440, 13200),
(30, 1829, -1829),
(31, 1440, 13200),
(32, 1905, 16395),
(33, 1500, 16800);

-- --------------------------------------------------------

--
-- Structure for view `emp`
--
DROP TABLE IF EXISTS `emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emp` AS (select `employee`.`no` AS `no`,`employee`.`name` AS `name`,`employee`.`designation` AS `designation`,`salary`.`salary` AS `salary`,`salary`.`da` AS `da`,`salary`.`hra` AS `hra`,`salary`.`t_salary` AS `t_salary`,`tax1`.`tax` AS `tax`,`tax1`.`TOTAL` AS `TOTAL` from ((`employee` join `salary`) join `tax1`) where ((`employee`.`no` = `salary`.`no`) and (`salary`.`no` = `tax1`.`no`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tax1`
--
ALTER TABLE `tax1`
  ADD CONSTRAINT `tax1_ibfk_1` FOREIGN KEY (`no`) REFERENCES `employee` (`no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
