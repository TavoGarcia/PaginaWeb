SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS processing2;

USE processing2;

DROP TABLE IF EXISTS admin;

CREATE TABLE `admin` (
  `id_user` int(3) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Pass` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admin VALUES("1","black93@gmail.com","123");



DROP TABLE IF EXISTS asistencia;

CREATE TABLE `asistencia` (
  `id_asistencia` int(6) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `asistencia` tinyint(1) NOT NULL,
  `id_docente` int(4) NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




DROP TABLE IF EXISTS carreras;

CREATE TABLE `carreras` (
  `id_carrera` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO carreras VALUES("1","Ing. en Sistemas Computacionales");
INSERT INTO carreras VALUES("2","Ing. Industial");
INSERT INTO carreras VALUES("3","Ing. TICS");
INSERT INTO carreras VALUES("4","Ing. Gestion Empresarial");
INSERT INTO carreras VALUES("5","Ing. Civil");
INSERT INTO carreras VALUES("6","Ing. Electromecanica");
INSERT INTO carreras VALUES("7","Ing. Petrolera");
INSERT INTO carreras VALUES("8","Ing. Bioquimica");
INSERT INTO carreras VALUES("9","Ing. Ambiental");



DROP TABLE IF EXISTS detalle_bitacora;

CREATE TABLE `detalle_bitacora` (
  `id_bitacora` int(5) NOT NULL AUTO_INCREMENT,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `dia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(2) DEFAULT NULL,
  `id_materia` int(4) NOT NULL,
  `id_docente` int(4) NOT NULL,
  `id_sala` int(4) NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_materia` (`id_materia`),
  KEY `id_docente` (`id_docente`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `detalle_bitacora_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`) ON UPDATE CASCADE,
  CONSTRAINT `detalle_bitacora_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_bitacora_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO detalle_bitacora VALUES("5","07:00:00","08:00:00","Viernes","12","16","8","4");
INSERT INTO detalle_bitacora VALUES("11","13:00:00","14:00:00","Miercoles","6","14","5","6");
INSERT INTO detalle_bitacora VALUES("13","14:00:00","15:00:00","Lunes","4","1","5","2");
INSERT INTO detalle_bitacora VALUES("16","16:00:00","17:00:00","Jueves","7","15","5","4");
INSERT INTO detalle_bitacora VALUES("17","09:00:00","10:00:00","Miercoles","9","1","8","3");
INSERT INTO detalle_bitacora VALUES("18","11:00:00","13:00:00","Martes","2","14","5","3");
INSERT INTO detalle_bitacora VALUES("23","11:00:00","12:00:00","Lunes","9","12","5","1");
INSERT INTO detalle_bitacora VALUES("25","07:00:00","08:00:00","Viernes","1","9","5","2");



DROP TABLE IF EXISTS detalle_software;

CREATE TABLE `detalle_software` (
  `id_detalle_sw` int(4) NOT NULL AUTO_INCREMENT,
  `fecha_instalacion` date NOT NULL,
  `id_sw` int(4) NOT NULL,
  `id_docente` int(4) NOT NULL,
  `id_sala` int(4) NOT NULL,
  PRIMARY KEY (`id_detalle_sw`),
  KEY `id_sw` (`id_sw`),
  KEY `id_docente` (`id_docente`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `detalle_software_ibfk_1` FOREIGN KEY (`id_sw`) REFERENCES `software` (`id_sw`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_software_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_software_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO detalle_software VALUES("1","2017-01-25","7","8","1");



DROP TABLE IF EXISTS docente;

CREATE TABLE `docente` (
  `id_docente` int(4) NOT NULL AUTO_INCREMENT,
  `nip` int(4) NOT NULL,
  `nombre_docente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longblob,
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO docente VALUES("5","33","Dr. Simon Pedro Arguijo Hernandez","");
INSERT INTO docente VALUES("8","398700","LIC. Araceli Vazquez Gomez","robodeidentidad_0.jpg");



DROP TABLE IF EXISTS materia;

CREATE TABLE `materia` (
  `id_materia` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_carrera` int(2) NOT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO materia VALUES("1","Bases de Datos","8");
INSERT INTO materia VALUES("8","POO","2");
INSERT INTO materia VALUES("9","Algebra","3");
INSERT INTO materia VALUES("10","asjaskjha","9");
INSERT INTO materia VALUES("12","Procesamiento Digital de Imagenes","1");
INSERT INTO materia VALUES("13","POO","1");
INSERT INTO materia VALUES("14","ConstrucciÃ³n 2","1");
INSERT INTO materia VALUES("15","Procesamiento de Imagenes","1");
INSERT INTO materia VALUES("16","Redes","1");
INSERT INTO materia VALUES("17","POO","7");
INSERT INTO materia VALUES("18","POO","1");
INSERT INTO materia VALUES("19","POO","1");
INSERT INTO materia VALUES("20","1","1");
INSERT INTO materia VALUES("21","9","1");



DROP TABLE IF EXISTS sala;

CREATE TABLE `sala` (
  `id_sala` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_sala` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO sala VALUES("1","A");
INSERT INTO sala VALUES("2","B");
INSERT INTO sala VALUES("3","C");
INSERT INTO sala VALUES("4","D");
INSERT INTO sala VALUES("5","E");
INSERT INTO sala VALUES("6","LE");



DROP TABLE IF EXISTS software;

CREATE TABLE `software` (
  `id_sw` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_sw` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_sw`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO software VALUES("2","Matlab 2014");
INSERT INTO software VALUES("3","SQL Server 2012");
INSERT INTO software VALUES("4","Flexim");
INSERT INTO software VALUES("5","Arduino 2.0");
INSERT INTO software VALUES("6","Flexim");
INSERT INTO software VALUES("7","Solidworks 2014");



SET FOREIGN_KEY_CHECKS=1;