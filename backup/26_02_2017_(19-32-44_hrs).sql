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
INSERT INTO docente VALUES("9","99","Andres Manuel Avila","����\0JFIF\0\0\0\0\0\0��\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0OO6XezAFsKVFBfeM_OSx(\0bFBMD01000abb030000b0070000a00c0000fe0c0000660d000060120000e81a0000431c00003e1d00002c1e00005b2e0000��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0@@\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�	��LL��L�s�V[S��������)#�PX\"T\'51�LY(��&� ��T�����Φ��}eB��m�*�݊i�&j�1��2�Uahx���q�e	��&	@�B�LX&Q73I�cńMvwS�-�<��x�^csKoU�,�h䚸����_)�����k$K\"(%\0! \02�3Lr��uu�sMzz�͸j�6ti�~�vXS\\��E�v�(�J$�B�(�\0���,Go]u��=�]��gʪ�q���sZ�Җ�^Z����+��rJ��D�&\n\0@��	#)3۹-���6�X�k貦�<&�a(���։汊�>�u�����I�*\0\0$@X�0��(۟6r��mֳ�aeN�:ۥ���ʘ*w�w��\\��G>���Ǖ��5�f�u��ybJ\0T�$ �$L���m�}햴��$Ǿ�j�U�h�ז��K�0����.�>�Ǔ��Ye�ƛ�&�,�\0\0	!$ѧz�������z4�s-�=�i�����|�\\�K׻���x�4�!\0\n\0	�Je8Is����ˬ���Ա��h��Mo�i�鯳�3ǟ\\S���ޕ�J�\0\0T�\0g��vbM�s���i�#�l�s�u6�Vq�1��\\�\0�\0\0(\0\0�E��=6P��WMum��.��N�,���Y�,��xLcs\0\0\0\0\0@\0v<6�;w��ԪՌcd���.�k�u�\\��rq��gA�\0A\0\0\0\0�wCi�z\ndU����t��v�z��6\\��X��b3@\0\0\0\0( \0���³���^l��e�L\"gXvRm���,\0� \0\0\0\0�\0`\0ݿ�}̈́j��uqYkZ�{��UskdSW�V�J\0\0\0\0P\0\0\0\0m��Ѭ��Vvm���N~[:��	�\0\0\0\0\0\0�\0\02���̱ϲ�=��f�;5N:b�\0 \"B$\0\0��&!�1[쫬��3�hH��� \0�Q \0\0\0�ƫ2�)����k+��\0W*���\0\0\0\0�?��\0*\0\0\0\0\0\0\0!@\"1 #AP$02B��\0\0\0�\0A<�]���cXS�A�k*YK�R��/�_�	��e׺65բ�X{�e�w:�{UR�Afdc5>����}���-,�RYn�`#�^�R� ��+2�q�����w먙L�O#Y�\'9١��)xW�c��vS����-��Uf�<��@ډgp���+ws0�Hח�Y���]>��U��G�s*�����joQ�+��VX,�w1�t��A|�nN\"�Z�4�x��/ʝCZ��Y�&{���siZ�d�����b2������k��T�����|a=Ƶ�4e7����E��^4����R������2dE��Jb�+����cVw��=r��z/���:g��.f��K)���:�\nvf.#�j\n�#y*���XN�j���b�L%w^���D����ueKҲ�����Qj���U�ܖ��Z��gb�X7y�ۈ�?\"�|$��wx#7/��͖�B�V-ܑ��W�TA�tF8���]��J�tj�-,����+�G-Ƶ��6��h���cc\n�R�LE}G��3.��U�(���նr�4��yR{��3��D�������k�g@����$��;�ُa�����&��N_Pj���V$��G��_c+�R�&F#P��~���.��T�d�k7yp�%������Z䑿ƺ�Ƹ&�e#�ӯW�Z}�}W����?������ߨZz�vb!sj�>�hZ�ǲUb�H9Y:�!ޱ�y&]G��9#����Cz*v%`*^v��Xn5�4vV��c�J6m��g�g�h���Ȩ1�\0c�����qғ���K� �`nq�ٺ���۵A��]l���-Y�=�ڞl���k����_������5��l<��6�K��P�Z?�̭`x�辜�:-ĀD��{��@��6Wg�yj;w0cpA	dj[n��J�\"��j�K�G6������F�,��4N&��`c�{yK�LO���no�q���\"wl�ʟ&�*H�3?���_se=�]K	��������F��K9%�7�Kh�w�6��8����o[��	��>�iX��3�Wd�������*���d:??�x[~b����ּ�<|v����bӪ��h��H�@�ĥ]���5���y���E�+NR�(mЯ�)�S�Q��R�k�̙�\0�[A���\"��c�D�o��szT�l�������������Z�:!�N��F�?���%=V�����x���5�/��S3&���\'����(�#�aᴷ����6���\0\0\0\0\0\0\0\0\0\0\0\0@ 0!P��\0?ìм�΋1�0�BTW����k���I����}�\"��]^��ԒI&�ʢ�Sb���\0\0\0\0\0\0\0\0\0\0\0\0@\0 0P��\0?��4gN�SF>IP�hCCP�21�v��y}MEXȤd�i�cL���\03\0\0\0\0\0\0\0!1A\"2@Qaq P�b�#0R��B`�����\0\0\0?���B*��\0�`V�sn��TRTIUv�[�i[�(Q逷��|��z�PK����z\'Mu�P�����Ԣ�V��C�d��*�J�T�`�H_LW��Yr�M��Ó�(��=R�J�G-$�YHj��UD�ʌ[������jUap�A\\!LUe�A���O5`��\n*��W+��.�N��Օ��Ip��UC�(��s9S�M�vA�+�J�vxE��H\nw�Pfn��A��q��M���q���~&�*�8X�������Ĭ��h ]�j�wU�\'J#�`8Mp�_W�����ƈ�J��kx��t\n��,:,��mtl��Fˑ~-&�T�L�#;���+���*T�u,�[зb&\"�곺��q7V��0�3t[�.T�����42�uSbA�!���=�R�!vYL��Ίct�p�#AUR*=u�K]Pˎ��\ne�Z���׬�F鲚�e�:>ު�\'T#�u���yR���fb.��)T��5�{�����Cq��}R{JD|��3���Zt�s�W��4��a�;t������Y:(P�\n���T[]�\\[���,�i��U�w���,m@�1q˞��fQ-j{����V@(L(oBn����M{\"u(\' �x̯��Kz(f`m��\\���G���A$ZVg>�򥶢�7Z�֞��R��mh�*}@4L��ŢE|.�6���U�R���3�ؚm��\'�if(-ͼ�!5�d��m��7Y�@��&���4�k�d~��9QYa��(��\'>����u��-sZm�}-�6\0�~U㔦�?�	\"�+0�GQ���J�.�l�QE1nT���mtU�I�L	�UA�-O�����(9�,�#N����q-��P�\n�L�nau_��Sc3��.P���U.���Qn�B��D��(dU�dj�c<��̤u�{���˳t ��Y@$��vʲ���*%X)��Y(h��B�ߞv=7*�Tq[�򮻮����UC�[»#U_f����y���;#��Vʉ0z�9�~	PZ��-ꌧ�q�\n^#�V���S����uuUEx[�y��\0U��nV,\n?�=���?�ZSZ��}�6�O��W�}����q���Ob6��Zܩ��������ʓ��������ϛh��di^z��PfgE@-��)����=�X�e��W}�����Y+<MP�HB��[�����z]9͚i���\0*\0\0\0\0\0\0!1AQa@q ��0���P������\0\0\0?!��a��0ʳ�D����J�3Vs9�/Q��_���8���������K���!㸭���ǥO�z\\����{:\\_ؚl>5.�����/d�U70��>%-q��5?Ew�?.�&+�o�S�_�}��9��h^��\0ﱖf�TS�(��\n� ���>��J��=J���W��%�(Wq��>��~���nv��K��AF5�/HѨ���B�u����$�0�Hf����	L@� ���x\n�z��܄6F�\'�-�Z�\n���pi���KXQ4��X}��3�d��BS�\n��k����T���8��G����]>gv|�l/x����#�\0%�s��P���|K�?�Kć�ܪ߷��<�Jg`�k��Y,Sf�z�S\n���f���@+%�T�na[���uF�����:f����~j�7����4�9���\"�7O�0��,�iM��y{�.@�������IT��˙�k]C7�e7A6�;������^ߦ�0�x�H\0�<���q���[�z��f���Es۰_32�rT��C�V¼��Hdll�e�ϗ�,��0g�;C��*C�Q��]��2�!�0w.2x������z�YG�,��`���Z�_1O^�߈B��Oo���;v��rIF��2����u��p���2�a�����aw�B���V���bp�5���2���k[����B�V���l�?�WR�.W�j*���c,Pc6�.��G��������Pr5�\0�(mC�I��H�ũh��+��\"5�J��^}�0he�cX�nE��2���J��ڂ�Jq4�o�^h�����=�,�c/��\0؂��NX���$(h>��)� ���!��t���fs)��O�\n4l����j���G���AM���:��\0Q���c�T8�2|�1W��{9�\0؅�unu�6_����f��*�]D����GL(��0�W	�P; �=`��yń�1:{�V`<�%���\00l��L����)x����Z=z5�]:[�������2a�/pb\\�0	P��Z�|\'w��\0�^��wF*�!p��[��ݬ�%XT�72���˂��KQ�3�Vm�<��.�5��7���,w��J��<B��2۷Y���W�P�y�ϙ�bÀ��J�����>����*W�QGu9������Pѡ� ���w/َ\0�͈���zN��Uh�;+_�fPVf�Œ�	u���kv�o��C��}�\0�fw��[�`Q��q��Ag�F��-U��@Ry���b���	Of�/�6M�D���7	ϜqڦV�W*\\�ό����&t�k>\n����d�0m��������ׯ�hi�e-��^+�le����ЮV\\�p9���f���=H�5�W`�3���O����ǧ�z� �D�ϺĦlog5ı�o�[�U��9-�p�}�3��wh`��λ��s�!���+����f����M����\0�J�W�����ZA��/3�x�ck��U�S�F��1Z+2��%_��в����73.�M׉�6�	���n�\0���%Yp9W,_�1�/������o�@��>{�<������Zc�-~&è�\\���:۸�kk����;c^�fKH�S�x;�H�tUUng�4���D�����\0$Vmԫ�];�����z+�n_���;��\"�-�$�L?��\\�f�<��%ȇ�0���Ou�Q�,�&b���w.wSA�0�0F��� ��Ʊ�Gܠ������`5J�.f\"�o����7HBu�S�D���hVY��BR��to:[�^X��J�h�8�O�`WSn�G��,�5��l]x\'/�W0�*�r��鷷G�L0�T]�; �#P΀�C�梆c{�\\z��/�|0��n��\n��?\"1���v�x.�^1^�k�S����s��#K��^#�C�/�.Yϸ�\0?��zMB��K�F��4.�׺��zI_�0|2cN\"��m��y����9�l���lU)���L08fE[�np�A�)4��a���9Ea����+�)�F��{L���>%r��&��\00�%�	jW�b\nB���\0�ѽܳW�=*�5�I�׾ɵx��;�ܙ������D5�\0�?)ݱ� ��,��J�x�S��)f�<ff�J��bm�m_!�&�-�~幀H����W1|Tes�fe���SjmPKu�?��\0\0\0\0\0G�$y+{G��^�������W%��\05��S�3ܢ\"�q�����7�0ƤܠKs�X�>���,p��\06�t3�s����A~_Ȭ��}�\0�0�����F�r�L���h�J��f6>�n\0�O�9a>��\n���O<I��=Jٗ,��F4�p����l��0�P�Nb�0���4�0As֌)�:����2�WĽ��\0�8�������C0�A47�P\0�0C0�A_�R� �0�0�e�vr�0�|2�0�[��?�0�\0�1�0C0�O6V�0�0��\0\0\0\0\0\0\0\0\0\0! 01A@P��\0?-e��nGp�e�udwA�L�m!~�l7�}��I�,�%d���H��G����ݣ��W�bH8�^��2l1���6��|����&��`��y��2���}�ū,�R�r��@�E�S�R:���<$=��Y=�������c�;���6$�������r2@G��f��$���\\#�Op/�� �=L9��e�K�?�l��׈��O��\0\0\0\0\0\0\0\0\0\0\0\0\0 !10A��\0?gBG�|�J^�Q�(Bx*q�e?2�x�Bba4<!�1?�Y�T]B��ŋ���\"��<67��|���vǊ�Z$��J^O���8.P5����]�LSCj���.�1\\X?�6�T�!m�.\'X����JRq�&x��&z�xN-�����	���b�v�d/;�cAA�����!v�i����\0*\0\0\0\0\0\0\0!1AQaq�� ��0@�����P��\0\0\0?��/�8�\'0�^�M]E̜΄�%4X�>���DW�|�av���q0�=+�Ϫ���xeض�h5Z���xe߭�K�\\��9�qe�����]V^��J�v��К9[��*Et��-�\nh4�b�%S`�w_.�ڳ�-c�q.�`Ƙ�7l���ڥ�4n%D����L�q��\"s+֚l�2�����a�r������8%�Z��u�L��|��p�y����;O���H�H���Y�of���{��~c�(��-n-�\'�8;�\\�rŘ�Χ�.g��e�q[��Җֽ3�r�*^?�қ\n(�9_��3�ab	�g^��͚%w����l�ƪ&�����\0�ͻ�Ww��+��g�!E��w�§u\nL�ŸF�e�8c��0��ii/PU�]\"�ĵp�r���/՘_�D\nyImn.Z�����x��W�Ck�㼣�*��+&�����bBȴ��Z��;e����� ���K�^E�R��r	(��]��Y��S4�>�5{�e��Zs������?E���pW�j6��@���W;�i��b���5�n�\"+m|ǚ�\nWs�􅚥�|*GvYr{�E�aLF��\\G:�3@�-)���<�l-�0jΡ�}z�������� �{K�#��W�6E�]���0����.3�# �Է��(FE�Ĭ�$cv�\"88�%͆���\0ݫ\'?cvE��W��TݺV\'h=e�^zC�����7�nu����}�d!4�SP��:�D�\0���g�`D��T�����\0$�U�0�\0�ʪn𽩗���&s	�pW&o8���@��?����\\��MD��������ψ9���c��+5��X/G���3T�SA�CO�J�]<�v.0\\��:��������}��;�Q���\0���87���Y�8���4eʗ�UR�w�E]n(4�\n����:�]+u\\�(�\\��-#�s��\'	dl����pqr�	�fF��D���M;B�[\\�����z8�w�sYR���~�ᣬBF�s��m\n\"\'��\\e�Z����*!��P��ƜL� �\n����txifU��q�J�	�2�0[��Åe�k���zb��g�x��QC���<���ג���8��l%r�n�h��hA��d��6����u��<�W���a������cש\nn����U��U�ަ�@&0���M2��yN������p���@�պ���\0�aч����h&���QR���{u������8���F��,��?�T�߾e1�\0�Ѽ�����\\U3�ja��	��:�<Bn����+��-<��N^�.����ŁS\nX2c9��#��Q�d�J8����f\\��ݼ�����k���P⯶���}.B�W�[�6�U����\'O0��^�_h��`�����J]���Ӥ���8�Ⱦ��J��F�@&�o�\0J��f�4��n#�T���pSv�` �c�=S��ܺ�/�gKY�LV�P�oh���{�ؙ�������@��|ǴD�rb2�u}.8̘�K�%MD�V:|�\0%_�6Mۼ��\n��V�)��pt�\";�����\"��XR���:8�7��>/����h@�г>I��Al0(ט �{|G��h��pl�|�*14�F��E_�Wu�r�ٛjU���%M�i`��Oh�6�T�7��$cd�+�f�/�q���.,�v��*�4Uv~~`S���(�sw�GIl&4���U�d�B�<+�a��n�t�\0U?)��[3d�]{t�2s�̥ʺ������A�U��׋ef#%3�H��ςd&P�n3����9�/PNF��./�Y��\0��b�Pe���z�Ɔ�:�Fh�6�A�2T��ՔA[�L�h�\0q��27�V���\n�4%�5��}����:��\0��\0,$C��5/A�Z+��5��`��\0/3hV��cG)c���X�]�ֹ�\02�\0>%v�J���]/��\n��X��y��MX���kӱ3�]�.\nS7b��;��_���B������k7���k���A���ȷ�OF�}7R���*��3(�PgJt����AOhf��Lp6��r���o�����4l�[����Y1�Oix!�_+��J�2��;|�%w5����Ut�|D�k�������.�2�:�\0����B��q�w���奴��꺌m�\'S{{C��$2��.�[��Ҿ�_Mz_s_01Il0Ƶ�\0\n:6���`�b{k�qm	�n�M�X�w�-V�%�xN7_�m�tr�\\vX2�6sl۷y�pNE]������9@��z=������v�ٌ�J���U��5����S�w�zx]rᠱ��;�k�y#)_��R�u��K��Trv�ml�a�R��C��JJ`O`�z�AUJ�V�f�t� [|����\0~,��\0��HP.&.�\\aW�3Fo�F\0�.��g�1��g�xW1�e���z1JppMo�P������)ȼ:^���4�F����^���X*�ca@��kS��*�F�\0�sQ�\0`B����vq4��`4�]���BP5U������]�n`0.C1���[)@N���U�Or8�ѷ��;{��c]�,B�7�@#�}��E�)��7��y��e�/���T.A��΢[�h�~b�X����a*��A���i��r-L�(�:�bT��H߅���q�(�M�;�B�[x��Ӵ��R]�\\�b��Wt�t�l2.�\\81g�-q��3�t;�PzC�x�n[yE$	�=#\\t���҈Q�v�MeG�*x�Ţl���27^�����7��p���,%J+�rC �:�ŀ\n4^�ݕ]���c��\"Q\0��@���7���z���h�jq�32�J�`�i+#7]R�*�;!@c=c,Ou��]������\0�\n�����i���?�����1+ag4�4��\'�ou��3� ;3�w�^�@\n��Ιn����(Y����L�j�&��L#\0�/�S�z��km�6��KG���S׋��p��CEST��8Q>\"��<��@��<G�;���)�N��g�skl�/��\0YY�~aA�k�3&=��\0cP�4����]71V���:@[�p��C��J��b��	@,�9V��[�e�0�5��ۈ�D\n�_�;A�����-6Z���E{u�8��`��*to����&6��e�;�yc���.�Z�a��gQ%���i�073�ƽ�8ϟ�n]X`^��,�sPYC8�c���ۼ�0S̰2Xb;*^��=�[ܑ��P^C¿3���?kC�9B���$d,\\���`\\Da��-I{zA���r��(4��F�kj�ʍjb/[�^n��y���]�\0@���in�&�!�0_b��gT����;}%\0YAVES:P�9�w��J�EAo҇�x�P�2��K��3I��2u����Q)=i*qp-��@�C�\n�eqh06c�8�;u��дO���@��G��ģFIW���Gx���4	�]��*U�����=	�7,�Ϫn��)���/K �D��&s�r�#z�w�i��5!Fr,�IU����3/�Se��y�Y���֥�#�����n �<�\n�e�@�h�]}��#4\nm�W��3���\no=xb���nE��>gOZ��1�zK\\���F���z�9��{�e��^p0�Y+\0f�LGs!TM�ݗ��\0��dX�t�X��������9�����Md�d�x��X�y����G\"����L+w\\Tz������=����m��E��[�x�\'�7��e%aR�G��rZ�nI������u�2��ADn�U��_ߛ�6�8�U�rA�����VOs����]�s�]b�OL�zϘ-��#[,\0�)1_�P(��%�����$�.hu�}VҨ��^��Z!� F���]q�T\nS�ﴰj�rT���o�1��*`���Y�aw�0\nOp��U�Jz8�x����/kY/���V��i����uf?�AD�\'1ۛ���0�N�u�He�!S��J�!hd��jA�eUZ.�F��G̽�/�\\��VЊ�	Ï����s�B�{�����/&˱��\\5��(=�8I7z��{s)�m��Pq\\����˺�����*T6D�_տK���");
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