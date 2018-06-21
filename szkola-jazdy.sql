SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cwiczenia`;
CREATE TABLE `cwiczenia` (
  `idCwiczenie` int(11) NOT NULL AUTO_INCREMENT,
  `nazwaCwiczenie` varchar(15) COLLATE latin2_bin NOT NULL,
  PRIMARY KEY (`idCwiczenie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `cwiczenia` (`idCwiczenie`, `nazwaCwiczenie`) VALUES
(1,	'Wykład'),
(2,	'Plac manewrowy'),
(3,	'Trasa 1'),
(4,	'Trasa 2'),
(5,	'Trasa 3');

DROP TABLE IF EXISTS `harmonogram`;
CREATE TABLE `harmonogram` (
  `idHarmonogram` int(11) NOT NULL AUTO_INCREMENT,
  `dzien` date NOT NULL,
  `godzina` time NOT NULL,
  `idCwiczenie` int(11) NOT NULL,
  `peselKursant` int(11) NOT NULL,
  `peselInstruktor` int(11) NOT NULL,
  PRIMARY KEY (`idHarmonogram`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `harmonogram` (`idHarmonogram`, `dzien`, `godzina`, `idCwiczenie`, `peselKursant`, `peselInstruktor`) VALUES
(1,	'2018-02-02',	'11:00:00',	1,	11111111,	44444444),
(2,	'2018-02-02',	'11:00:00',	1,	10101010,	44444444),
(3,	'2018-02-02',	'11:00:00',	1,	8888888,	44444444),
(4,	'2018-02-02',	'11:00:00',	1,	33333333,	44444444),
(5,	'2018-02-02',	'17:00:00',	3,	33333333,	99999999),
(6,	'2018-02-02',	'17:00:00',	3,	8888888,	44444444),
(7,	'2018-02-02',	'17:00:00',	3,	10101010,	22222222),
(8,	'2018-02-03',	'11:00:00',	3,	11111111,	99999999),
(9,	'2018-02-03',	'12:00:00',	4,	10101010,	99999999),
(10,	'2018-02-03',	'12:00:00',	5,	8888888,	44444444),
(11,	'2018-02-04',	'11:00:00',	4,	11111111,	99999999),
(12,	'2018-02-04',	'12:00:00',	5,	8888888,	44444444),
(13,	'2018-02-05',	'11:00:00',	5,	11111111,	99999999),
(14,	'2018-02-05',	'12:00:00',	2,	11111111,	22222222),
(15,	'2018-02-05',	'12:00:00',	3,	33333333,	44444444),
(16,	'2018-02-01',	'12:00:00',	3,	11111111,	22222222),
(17,	'2018-02-01',	'12:00:00',	4,	33333333,	44444444),
(18,	'2018-02-02',	'12:00:00',	2,	55555555,	22222222),
(19,	'2018-02-02',	'13:00:00',	5,	77777777,	44444444),
(20,	'2018-02-02',	'13:00:00',	5,	8888888,	99999999),
(21,	'2018-02-02',	'15:00:00',	5,	10101010,	44444444);

DROP TABLE IF EXISTS `instruktorzy`;
CREATE TABLE `instruktorzy` (
  `peselInstruktor` int(11) NOT NULL,
  `imieInstruktor` varchar(15) COLLATE latin2_bin NOT NULL,
  `nazwiskoInstruktor` varchar(15) COLLATE latin2_bin NOT NULL,
  PRIMARY KEY (`peselInstruktor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `instruktorzy` (`peselInstruktor`, `imieInstruktor`, `nazwiskoInstruktor`) VALUES
(12121212,	'Andrzej',	'Kowalski'),
(22222222,	'Marek',	'Kowalski'),
(44444444,	'Wojciech',	'Kowalski'),
(99999999,	'Piotr',	'Kowalski');

DROP TABLE IF EXISTS `kursanci`;
CREATE TABLE `kursanci` (
  `peselKursant` int(8) NOT NULL,
  `imieKursant` varchar(15) COLLATE latin2_bin NOT NULL,
  `nazwiskoKursant` varchar(15) COLLATE latin2_bin NOT NULL,
  PRIMARY KEY (`peselKursant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `kursanci` (`peselKursant`, `imieKursant`, `nazwiskoKursant`) VALUES
(8888888,	'Anna',	'Nowak'),
(10101010,	'Józefina',	'Nowak'),
(11111111,	'Andrzej',	'Nowak'),
(33333333,	'Jacek',	'Nowak'),
(55555555,	'Paweł',	'Nowak'),
(77777777,	'Monika',	'Nowak');

DROP TABLE IF EXISTS `rodzajKursu`;
CREATE TABLE `rodzajKursu` (
  `idHarmonogram` int(11) NOT NULL,
  `kurs` varchar(20) COLLATE latin2_bin NOT NULL,
  UNIQUE KEY `idHarmonogram` (`idHarmonogram`),
  CONSTRAINT `rodzajKursu_ibfk_1` FOREIGN KEY (`idHarmonogram`) REFERENCES `harmonogram` (`idHarmonogram`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `rodzajKursu` (`idHarmonogram`, `kurs`) VALUES
(1,	'dodatkowe'),
(2,	'dodatkowe'),
(3,	'dodatkowe'),
(4,	'dodatkowe'),
(5,	'dodatkowe'),
(6,	'dodatkowe'),
(7,	'dodatkowe'),
(8,	'dodatkowe'),
(9,	'dodatkowe'),
(10,	'dodatkowe'),
(11,	'dodatkowe'),
(12,	'dodatkowe'),
(13,	'dodatkowe'),
(14,	'dodatkowe'),
(15,	'dodatkowe'),
(16,	'pełny kurs'),
(17,	'pełny kurs'),
(18,	'dodatkowe'),
(19,	'pełny kurs'),
(20,	'pełny kurs'),
(21,	'pełny kurs');

DROP TABLE IF EXISTS `samochody`;
CREATE TABLE `samochody` (
  `numerRejestracyjny` varchar(10) COLLATE latin2_bin NOT NULL,
  `marka` varchar(15) COLLATE latin2_bin NOT NULL,
  `model` varchar(15) COLLATE latin2_bin NOT NULL,
  `rokProdukcji` int(4) NOT NULL,
  PRIMARY KEY (`numerRejestracyjny`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `samochody` (`numerRejestracyjny`, `marka`, `model`, `rokProdukcji`) VALUES
('KR-123456',	'Toyota',	'Yaris',	2012),
('KR-234567',	'Toyota',	'Yaris',	2013),
('KR-345678',	'Kia',	'Rio',	2014),
('KR-456789',	'Kia',	'Rio',	2015);

DROP VIEW IF EXISTS `widok`;
CREATE TABLE `widok` (`dzien` date, `godzina` time, `Instruktor I` varchar(15), `Instruktor N` varchar(15), `Kursant I` varchar(15), `Kursant N` varchar(15), `Cwiczenie` varchar(15), `marka` varchar(15), `model` varchar(15), `rokProdukcji` varchar(11), `Rejestracja` varchar(10), `kurs` varchar(20));


DROP VIEW IF EXISTS `widok2`;
CREATE TABLE `widok2` (`Zastepca imie` varchar(15), `Zastepca nazwisko` varchar(15), `Zastepuje imie` varchar(15), `Zastepuje nazwisko` varchar(15));


DROP TABLE IF EXISTS `wyjazdNaCwiczenie`;
CREATE TABLE `wyjazdNaCwiczenie` (
  `idHarmonogram` int(11) NOT NULL,
  `numerRejestracyjny` varchar(10) COLLATE latin2_bin NOT NULL,
  UNIQUE KEY `idHarmonogram` (`idHarmonogram`),
  CONSTRAINT `wyjazdNaCwiczenie_ibfk_1` FOREIGN KEY (`idHarmonogram`) REFERENCES `harmonogram` (`idHarmonogram`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `wyjazdNaCwiczenie` (`idHarmonogram`, `numerRejestracyjny`) VALUES
(5,	'KR-234567'),
(6,	'KR-456789'),
(7,	'KR-345678'),
(8,	'KR-234567'),
(9,	'KR-234567'),
(10,	'KR-456789'),
(11,	'KR-123456'),
(12,	'KR-123456'),
(13,	'KR-234567'),
(14,	'KR-234567'),
(15,	'KR-456789'),
(16,	'KR-123456'),
(17,	'KR-234567'),
(18,	'KR-345678'),
(19,	'KR-234567'),
(20,	'KR-456789'),
(21,	'KR-234567');

DROP TABLE IF EXISTS `zastepcy`;
CREATE TABLE `zastepcy` (
  `peselKto` int(11) NOT NULL,
  `peselKogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

INSERT INTO `zastepcy` (`peselKto`, `peselKogo`) VALUES
(44444444,	22222222),
(12121212,	22222222),
(12121212,	44444444),
(22222222,	99999999);

DROP TABLE IF EXISTS `widok`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `widok` AS select `harmonogram`.`dzien` AS `dzien`,`harmonogram`.`godzina` AS `godzina`,`instruktorzy`.`imieInstruktor` AS `Instruktor I`,`instruktorzy`.`nazwiskoInstruktor` AS `Instruktor N`,`kursanci`.`imieKursant` AS `Kursant I`,`kursanci`.`nazwiskoKursant` AS `Kursant N`,`cwiczenia`.`nazwaCwiczenie` AS `Cwiczenie`,if(isnull(`samochody`.`marka`),'brak',`samochody`.`marka`) AS `marka`,if(isnull(`samochody`.`model`),'brak',`samochody`.`model`) AS `model`,if(isnull(`samochody`.`rokProdukcji`),'brak',`samochody`.`rokProdukcji`) AS `rokProdukcji`,if(isnull(`wyjazdNaCwiczenie`.`numerRejestracyjny`),'brak',`wyjazdNaCwiczenie`.`numerRejestracyjny`) AS `Rejestracja`,`rodzajKursu`.`kurs` AS `kurs` from ((((((`harmonogram` join `instruktorzy` on((`harmonogram`.`peselInstruktor` = `instruktorzy`.`peselInstruktor`))) join `kursanci` on((`harmonogram`.`peselKursant` = `kursanci`.`peselKursant`))) join `cwiczenia` on((`harmonogram`.`idCwiczenie` = `cwiczenia`.`idCwiczenie`))) left join `wyjazdNaCwiczenie` on((`harmonogram`.`idHarmonogram` = `wyjazdNaCwiczenie`.`idHarmonogram`))) left join `rodzajKursu` on((`harmonogram`.`idHarmonogram` = `rodzajKursu`.`idHarmonogram`))) left join `samochody` on((`wyjazdNaCwiczenie`.`numerRejestracyjny` = `samochody`.`numerRejestracyjny`))) order by `harmonogram`.`dzien`,`harmonogram`.`godzina`;

DROP TABLE IF EXISTS `widok2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `widok2` AS select `help2`.`imieInstruktor` AS `Zastepca imie`,`help2`.`nazwiskoInstruktor` AS `Zastepca nazwisko`,(select `instruktorzy`.`imieInstruktor` from `instruktorzy` where (`instruktorzy`.`peselInstruktor` = `help1`.`peselKogo`)) AS `Zastepuje imie`,(select `instruktorzy`.`nazwiskoInstruktor` from `instruktorzy` where (`instruktorzy`.`peselInstruktor` = `help1`.`peselKogo`)) AS `Zastepuje nazwisko` from (`zastepcy` `help1` join `instruktorzy` `help2` on((`help1`.`peselKto` = `help2`.`peselInstruktor`)));