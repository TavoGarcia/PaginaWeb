SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS processing2;

USE processing2;

DROP TABLE IF EXISTS admin;

CREATE TABLE `admin` (
  `id_user` int(3) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Pass` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO admin VALUES("1","black93@gmail.com","123");
INSERT INTO admin VALUES("3","root@localhost","1992");
INSERT INTO admin VALUES("5","JORGECRUZ@localhost","cruz2017");
INSERT INTO admin VALUES("6","j","j");
INSERT INTO admin VALUES("7","ARACELI@localhost","araceli2017");



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




DROP TABLE IF EXISTS bitacora_monitoreo;

CREATE TABLE `bitacora_monitoreo` (
  `id_monitoreo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_monitoreo`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO bitacora_monitoreo VALUES("1","root@localhost","INSERCCIÓN CREADA","2017-02-26 12:22:37");
INSERT INTO bitacora_monitoreo VALUES("2","root@localhost","DOCENTE INSERTADO","2017-02-26 13:36:10");
INSERT INTO bitacora_monitoreo VALUES("3","root@localhost","DOCENTE INSERTADO","2017-02-26 15:51:49");
INSERT INTO bitacora_monitoreo VALUES("4","root@localhost","DOCENTE ELIMINADO","2017-02-26 15:52:16");
INSERT INTO bitacora_monitoreo VALUES("5","root@localhost","DOCENTE ACTUALIZADO","2017-02-26 16:04:48");
INSERT INTO bitacora_monitoreo VALUES("6","root@localhost","MATERIA INSERTADA","2017-02-26 16:40:14");
INSERT INTO bitacora_monitoreo VALUES("7","JORGECRUZ@localhost","MATERIA INSERTADA","2017-02-26 16:45:20");
INSERT INTO bitacora_monitoreo VALUES("8","JORGECRUZ@localhost","MATERIA INSERTADA","2017-02-26 17:19:08");
INSERT INTO bitacora_monitoreo VALUES("9","JORGECRUZ@localhost","MATERIA INSERTADA","2017-02-26 18:25:33");
INSERT INTO bitacora_monitoreo VALUES("10","JORGECRUZ@localhost","SOFTWARE INSERTADO","2017-02-26 19:06:20");
INSERT INTO bitacora_monitoreo VALUES("11","JORGECRUZ@localhost","HORARIO INSERTADO","2017-02-26 19:14:46");



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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO detalle_bitacora VALUES("5","07:00:00","08:00:00","Viernes","12","16","8","4");
INSERT INTO detalle_bitacora VALUES("11","13:00:00","14:00:00","Miercoles","6","14","5","6");
INSERT INTO detalle_bitacora VALUES("13","14:00:00","15:00:00","Lunes","4","1","5","2");
INSERT INTO detalle_bitacora VALUES("16","16:00:00","17:00:00","Jueves","7","15","5","4");
INSERT INTO detalle_bitacora VALUES("17","09:00:00","10:00:00","Miercoles","9","1","8","3");
INSERT INTO detalle_bitacora VALUES("18","11:00:00","13:00:00","Martes","2","14","5","3");
INSERT INTO detalle_bitacora VALUES("23","11:00:00","12:00:00","Lunes","9","12","5","1");
INSERT INTO detalle_bitacora VALUES("25","07:00:00","08:00:00","Viernes","1","9","5","2");
INSERT INTO detalle_bitacora VALUES("26","10:00:00","11:00:00","Lunes","4","29","18","6");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO detalle_software VALUES("1","2017-01-25","7","8","1");
INSERT INTO detalle_software VALUES("2","2017-02-24","8","5","2");
INSERT INTO detalle_software VALUES("3","2017-02-25","9","8","6");
INSERT INTO detalle_software VALUES("4","2017-02-27","10","14","2");



DROP TABLE IF EXISTS docente;

CREATE TABLE `docente` (
  `id_docente` int(4) NOT NULL AUTO_INCREMENT,
  `nip` int(4) NOT NULL,
  `nombre_docente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` longblob,
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO docente VALUES("5","33","Dr. Simon Pedro Arguijo Hernandez","");
INSERT INTO docente VALUES("8","398700","LIC. Araceli Vazquez Gomez","robodeidentidad_0.jpg");
INSERT INTO docente VALUES("9","99","Andres Manuel Avila","����\0JFIF\0\0\0\0\0\0��\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0OO6XezAFsKVFBfeM_OSx(\0bFBMD01000abb030000b0070000a00c0000fe0c0000660d000060120000e81a0000431c00003e1d00002c1e00005b2e0000��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	
INSERT INTO docente VALUES("12","7","DKJSKDSJ","");
INSERT INTO docente VALUES("14","871","Gustavo GarcÃ­a","");
INSERT INTO docente VALUES("15","5","ana","");
INSERT INTO docente VALUES("16","21","Paco","");
INSERT INTO docente VALUES("18","1993","ana maria","");
INSERT INTO docente VALUES("19","1992","Carlos Andres Cabrera","");



DROP TABLE IF EXISTS materia;

CREATE TABLE `materia` (
  `id_materia` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_carrera` int(2) NOT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
INSERT INTO materia VALUES("22","Mecanica","9");
INSERT INTO materia VALUES("23","Electricidad","8");
INSERT INTO materia VALUES("24","Nada","7");
INSERT INTO materia VALUES("25","IA","1");
INSERT INTO materia VALUES("26","CALCULO VECTORIAL","5");
INSERT INTO materia VALUES("27","ANALISIS 2","3");
INSERT INTO materia VALUES("28","ANA","3");
INSERT INTO materia VALUES("29","ninguna","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO software VALUES("2","Matlab 2014");
INSERT INTO software VALUES("3","SQL Server 2012");
INSERT INTO software VALUES("4","Flexim");
INSERT INTO software VALUES("5","Arduino 2.0");
INSERT INTO software VALUES("6","Flexim");
INSERT INTO software VALUES("7","Solidworks 2014");
INSERT INTO software VALUES("8","Processing");
INSERT INTO software VALUES("9","asd");
INSERT INTO software VALUES("10","ajsnajsdnask");



SET FOREIGN_KEY_CHECKS=1;