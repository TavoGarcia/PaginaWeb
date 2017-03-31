create database processing2;

/*TABLA DE ADMINISTRADOR*/
create table admin(
    id_user int(3) not null primary key auto_increment,
    Email varchar(100) not null,
    Pass varchar(50) not null
)ENGINE=INNODB;


/*TABLA DE DOCENTES*/
create table docente
(   
    id_docente int(4) not null auto_increment primary key,
    nip int(4) not null,
    nombre_docente varchar(50) not null,
    imagen longblob null
    
)ENGINE=INNODB;


/*TABLA DE ASISTENCIA DE LOS DOCENTES*/
create table asistencia
(
    id_asistencia int(6) not null auto_increment primary key,
    fecha date not null,
    hora_entrada time not null,
    asistencia tinyint(1) not null,
    id_docente int(4) not null,
    foreign key (id_docente) references docente(id_docente) on delete cascade on update cascade
)ENGINE= INNODB;


/*TABLA DE SALAS DEL CENTRO DE CÓMPUTO*/
create table sala
(
    id_sala int(2) not null auto_increment primary key,
    nombre_sala varchar(20) not null
    
)ENGINE= INNODB;


/*TABLA DEL SOFTWARE INSTALADO EN LAS SALAS*/
create table software
(
    id_sw int(4) not null auto_increment primary key,
    nombre_sw varchar (50) not null
)ENGINE= INNODB;


/*TABLA DE DETALLES DEL SOFTWARE INSTALADO EN LAS SALAS*/
create table detalle_software
(
    id_detalle_sw int(4) auto_increment not null primary key,
    fecha_instalacion date not null,
    
    id_sw int(4) not null,
    id_docente int(4) not null,
    id_sala int(4) not null,
    
    foreign key (id_sw) references software(id_sw) on delete cascade on update cascade,
    foreign key (id_docente) references docente(id_docente) on delete cascade on update cascade,
    foreign key (id_sala) references sala(id_sala) on delete cascade on update cascade
            
)ENGINE= INNODB;


/*TABLA DE LAS CARRERAS DEL ITSM */
create table carreras
(
    id_carrera int(2) not null auto_increment primary key,
    nombre_carrera varchar (40) not null
)ENGINE= INNODB;


/*TABLA DE MATERIAS  */
create table materia
(
    id_materia int(4) not null auto_increment primary key,
    nombre_materia varchar(50) null,
    
    id_carrera int(2) not null,
    foreign key (id_carrera) references carreras(id_carrera)
)ENGINE= INNODB;


/*TABLA DE BITACORA GENERAL*/
create table detalle_bitacora
(
    id_bitacora int(5) not null auto_increment primary key,
    hora_entrada time not null,
    hora_salida time not null,
    dia varchar(10) not null,
    semestre int(2) null,
    
    id_materia int(4) not null,
    id_docente int(4) not null,
    id_sala int(4) not null,
    
    foreign key (id_materia) references materia(id_materia),
    foreign key (id_docente) references docente(id_docente) on delete cascade on update cascade,
    foreign key (id_sala) references sala(id_sala)     
)ENGINE= INNODB;

/*TABLA PARA EL CONTROL DEL MONITOREO*/
CREATE TABLE IF NOT EXISTS `bitacora_monitoreo` 
(`id` int(11) NOT NULL AUTO_INCREMENT,
 `operacion` varchar(50) DEFAULT NULL,
 `usuario` varchar(80) DEFAULT NULL,
 `host` varchar(30) NOT NULL,
 `modificado` datetime DEFAULT NULL,
 `tabla` varchar(80) NOT NULL,
 PRIMARY KEY (`id_monitoreo`) ) ENGINE=InnoDB;

/*TRIGGERS DOCENTE*/
drop trigger if exists tr_insercion_doce;
create trigger tr_insercion_doce before insert on docente
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"DOCENTE INSERTADO",now());


drop trigger if exists tr_actualizacion_doce;
create trigger tr_actualizacion_doce
    before update on docente
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"DOCENTE ACTUALIZADO",now());
   

drop trigger if exists tr_borrado_doce;
create trigger tr_borrado_doce before delete on docente
    for each row
    insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"DOCENTE ELIMINADO",now());


/*TRIGGERS MATERIA*/
drop trigger if exists tr_insercion_mate;
create trigger tr_insercion_mate before insert on materia
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"MATERIA INSERTADA",now());


drop trigger if exists tr_actualizacion_mate;
create trigger tr_actualizacion_mate
    before update on materia
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"MATERIA ACTUALIZADA",now());
   

drop trigger if exists tr_borrado_mate;
create trigger tr_borrado_mate before delete on materia
    for each row
    insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"MATERIA ELIMINADA",now());


/*TRIGGERS SW*/
drop trigger if exists tr_insercion_sw;
create trigger tr_insercion_sw before insert on software
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"SOFTWARE INSERTADO",now());


drop trigger if exists tr_actualizacion_sw;
create trigger tr_actualizacion_sw
    before update on software
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"SOFTWARE ACTUALIZADO",now());
   

drop trigger if exists tr_borrado_sw;
create trigger tr_borrado_sw before delete on software
    for each row
    insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"SOFTWARE ELIMINADO",now());


/*TRIGGERS HORARIOS*/
drop trigger if exists tr_insercion_horario;
create trigger tr_insercion_horario before insert on detalle_bitacora
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"HORARIO INSERTADO",now());


drop trigger if exists tr_actualizacion_horario;
create trigger tr_actualizacion_horario
    before update on detalle_bitacora
   for each row
   insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"HORARIO ACTUALIZADO",now());
   

drop trigger if exists tr_borrado_horario;
create trigger tr_borrado_horario before delete on detalle_bitacora
    for each row
    insert into bitacora_monitoreo(usuario,descripcion,fecha) values (user(),"HORARIO ELIMINADO",now());





INSERT INTO `admin` (`id_user`, `Email`, `Pass`) VALUES (NULL, USER(), 'araceli2017')



/*ESTA CONSULTA OBTIENE QUE PROGRAMA USA CADA DONCETE Y EN QUE SALA ESTÁ INSTALADO, ASÍ COMO
EL NOMBRE DEL PROGRAMA*/

SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala 
and nombre_sala="lo q sea" order by fecha_instalacion ASC


/*ESTA CONSULTA DA COMO RESULTADO EL HORARIO DE UN MAESTRO*/
SELECT nombre_docente, hora_entrada, hora_salida, dia, grupo, nombre_carrera, nombre_sala FROM docente, materia, detalle_bitacora, sala, carreras
   WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND carreras.id_carrera=materia.id_carrera

/*ESTA CONSULTA DA COMO RESULTADO EL HORARIO POR SALAS*/
SELECT nombre_docente, hora_entrada, hora_salida, dia, semestre, nombre_carrera, nombre_sala FROM docente, materia, detalle_bitacora, sala, carreras WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND carreras.id_carrera=materia.id_carrera AND nombre_sala='B' ORDER BY dia ASC 


/*INSERCIONES EN DOS TABLAS SE PUEDE HACER AL MISMO TIEMPO CON PHP*/
INSERT INTO `materia` (`id_materia`, `nombre_materia`, `grupo`, `id_carrera`) VALUES (NULL, 'Taller de Base de Datos', '703', '1');

INSERT INTO `detalle_bitacora` (`id_bitacora`, `hora_entrada`, `hora_salida`, `id_materia`, `nip`, `id_sala`) VALUES (NULL, '05:00:00', '07:00:00', '1', '1', '1');


/* CODIGO QUE SE EJECUTO Y CORRIO AL 100% */

/*
    
create table docente
(
    nip int(4) not null auto_increment primary key,
    nombre_docente varchar(50) not null,
    imagen longblob null
    
)ENGINE= INNODB;


create table asistencia
(
    id_asistencia int(6) not null auto_increment primary key,
    fecha date not null,
    hora_entrada time not null,
    asistencia tinyint(1) not null,
    nip int(4) not null,
    foreign key (nip) references docente(nip) on delete cascade on update cascade
)ENGINE= INNODB;


create table sala
(
    id_sala int(2) not null auto_increment primary key,
    nombre_sala varchar(20) not null
    
)ENGINE= INNODB;


create table software
(
    id_sw int(4) not null auto_increment primary key,
    nombre_sw varchar (50) not null
)ENGINE= INNODB;


create table detalle_software
(
    id_detalle_sw int(4) auto_increment not null primary key,
    fecha_instalacion date not null,
    
    id_sw int(4) not null,
    nip int(4) not null,
    id_sala int(4) not null,
    
    foreign key (id_sw) references software(id_sw) on delete cascade on update cascade,
    foreign key (nip) references docente(nip),
    foreign key (id_sala) references sala(id_sala)
            
)ENGINE= INNODB;


create table carreras
(
    id_carrera int(2) not null auto_increment primary key,
    nombre_carrera varchar (40) not null
)ENGINE= INNODB;



create table materia
(
    id_materia int(4) not null auto_increment primary key,
    nombre_materia varchar(50) null,
    grupo varchar(10) null,
    id_carrera int(2) not null,
    foreign key (id_carrera) references carreras(id_carrera)
)ENGINE= INNODB;



create table detalle_bitacora
(
    id_bitacora int(5) not null auto_increment primary key,
    hora_entrada time not null,
    hora_salida time not null,
    
    id_materia int(4) not null,
    nip int(4) not null,
    id_sala int(4) not null,
    
    foreign key (id_materia) references materia(id_materia),
    foreign key (nip) references docente(nip) on delete cascade on update cascade,
    foreign key (id_sala) references sala(id_sala)     
)ENGINE= INNODB;
*/