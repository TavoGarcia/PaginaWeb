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

INSERT INTO bitacora_monitoreo VALUES("1","root@localhost","INSERCCI√ìN CREADA","2017-02-26 12:22:37");
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
INSERT INTO docente VALUES("9","99","Andres Manuel Avila","ˇÿˇ‡\0JFIF\0\0\0\0\0\0ˇÌ\0úPhotoshop 3.0\08BIM\0\0\0\0\0Äg\0OO6XezAFsKVFBfeM_OSx(\0bFBMD01000abb030000b0070000a00c0000fe0c0000660d000060120000e81a0000431c00003e1d00002c1e00005b2e0000ˇ‚ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ ‹\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˆ÷\0\0\0\0\0”-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0¸\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0ê\0\0\0gXYZ\0\0§\0\0\0bXYZ\0\0∏\0\0\0rTRC\0\0Ã\0\0\0@gTRC\0\0Ã\0\0\0@bTRC\0\0Ã\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ˆ÷\0\0\0\0\0”-XYZ \0\0\0\0\0\0\0\03\0\0§XYZ \0\0\0\0\0\0o¢\0\08ı\0\0êXYZ \0\0\0\0\0\0bô\0\0∑Ö\0\0⁄XYZ \0\0\0\0\0\0$†\0\0Ñ\0\0∂œcurv\0\0\0\0\0\0\0\0\0\0À…cíkˆ?Q4!Ò)ê2;íFQw]Ìkpzâ±ö|¨iø}”√È0ˇˇˇ€\0C\0		\n\n	\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9ˇ€\0C\n\n\n9& &99999999999999999999999999999999999999999999999999ˇ¬\0@@\0\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ⁄\0\0\0\0\0Ú	çÛLL∏ÂL°søV[S°≤ÊÁ „”œ)#òPX\"T\'51îLY(îÇ&§ ÖêT¢ÃÁ¨ Œ¶¡ú}eB›÷mË*∞›äi∆&jÒ1∑Ÿ2ÁUahx…ÎÂñqÖe	≤ê&	@âBÃLX&Q73IÀc≈ÑMvwS˜-û<ªÓxı^csKoU—,ıh‰ö∏ËÛ€À_)Ì¸µï‚k$K\"(%\0! \02ú3LrÔ…uuÒsMzzåÕ∏j¬6tiì~ÌvXS\\◊ŸE´v·(îJ$âBÅ(î\0¢Ñ£,Go]uΩî=›]π’g ™¢qà¥”sZØ“ñˆ^ZÙ≠„±„+ıırJòïD¬&\n\0@òê	#)3€π-ß¢Ú6÷X÷kË≤¶ª<&∂a(éç˘÷âÊ±ä˛>≠uÃÀâÇÃIñ*\0\0$@Xò0±ñ(€ü6rÕ≈m÷≥œaeN¥:€•±◊Ÿ ò*wõwìÌ\\ö˙G>˝’««ïöú5·f˝u∏ÁybJ\0T†$ ñ$LÀöüm‚}Ìñ¥¯˘$«æ≥jÿUŸh≤◊ñÛ K√0ç˙±É.û>í«ì∑ÉYe—∆õÎ¶&¬,ã\0\0	!$—ßz˝øÇΩ‘Ê´ız4Ìs-Ê=©iÁ∂Í≥∫ÏŒ|ã\\πK◊ªõöÀx¬4¶!\0\n\0	âJe8Isó‘Î◊À¨ÔË‘±ÜÓhŸ€MoºiÁÈØ≥ñ3«ü\\SôÙ„ﬁïÒªJÑ\0\0T¿\0gù⁄vbMŸsÙ¨ÛiÌ#öl∑sÎu6ıVq¬1–¿\\”\0Ä\0\0(\0\0øEùŒ=6P˜WMum‡›.˛ûN´,™∫ÁYé,¥úxLcs\0\0\0\0\0@\0v<6˜;wÏ‡‘™’åcd˙∏≤.∫k¨uù\\◊ˆrq˜gAö\0A\0\0\0\0◊wCi¨z\ndUÿ‘¿≥tŸ“vÍzö‹6\\‘X◊Õb3@\0\0\0\0( \0©ÄŒ¬≥¢Ê”^l„ÊÓï´e‘L\"gXvRm≥£ã,\0î \0\0\0\0†\0`\0›øè}ÕÑjÈ÷uqYkZº{ˆÁUskdSWŸV¿J\0\0\0\0P\0\0\0\0m€œ—¨Ï√VvmÔÊÓN~[:¨Îä	†\0\0\0\0\0\0Ä\0\02µ´ŒÃ±œ≤Á=˝˛fÕ;5N:bò\0 \"B$\0\0ÇÄ&!û1[Ï´¨ıõ3ÈhH”õä \0ÇQ \0\0\0¶∆´2Ÿ)ß—“˙k+ºˇ\0W*Ì√°\0\0\0\0à?ˇƒ\0*\0\0\0\0\0\0\0!@\"1 #AP$02Bˇ⁄\0\0\0ˇ\0A<Ä]íø¨cXS˙AÚk*YKƒR¯ñ/ª_—	¸•e◊∫65’¢ﬂX{Æe⁄w:Ó{URÊ¨Afdc5>ªÒÎª€}†ÕŸ-,´RYn≠`#◊^’RÏÄ Ê∆+2≤q∂ºä¶ÒwÎ®ôLàO#Yà\'9Ÿ°«Ó)xW∫céòvSŒŸ˜¢-ú¶Uf⁄<üü@⁄âgp›˙ã+ws0ØH◊ó∆YîÂ]>‚ŸU¨ÕGΩs*È€‰”ÊjoQÈ+—‰VX,≤w1ÍtúÿA|ÎnN\"’Z≤4Íxë‰/ ùCZµ∂Y∑&{Ê⁄¬siZód®ºØ™Ùb2õ«¯„àËk∞˘Tº€˛≠Œ|a=∆µ°4e7µñ‡èEÌ÷^4µµáãRò˚Â„÷ƒ2dEÆªJbı+∑âˆúcVw≈„=r∫Èz/Æ≠˚:g¨Óî.f¨õK)µ∂æ:ù\nvf.#√j\nÏ#y*å˘»XN£jßµ≠b‹L%w^Å¨ûDÔ«ﬂÚîueK“≤¶≤¸º¬Qj≥¶ôU˛‹ñÍ›ZÓäÍgbªX7y◊€àı?\"•|$±íwx#7/∂©Õñ˝B◊V-‹ë∫©W¨TA tF8ßëÜ]°ÌJ…tj∑-,°–Ùàò„+€G-∆µö™6∑‡h≈‚ÛÅ∞cc\n∆R∑LE}GΩ∑3.–˛Uÿ(±ñ«’∂r≠4†⁄yR{·™Ÿ3Ò¯D·…ÿœœ˚ªk◊g@ôÙÀƒ$‡ù;ÎŸèa™±∫óá&«√N_PjîŒ—V$ÉÕG±ì_c+ûRı&F#PæÏ~ú¢ö.˙öT÷d€k7yp€%¨Ü¶‰Ê·Z‰ëø∆∫û∆∏&çe#ﬂ”ØWúZ}˝}Wòºœ¡?Úû˘ñ¿¶˛ﬂ®ZzÃvb!sj>ãhZ⁄«≤Ub√H9Y:æ!ﬁ±≤y&]GÌ’9#Œ‡”˝Cz*v%`*^v˛∂Xn5ñ4vVƒcøJ6m•Ï¨gµgèhüÇµ»®1ˇ\0c™¥îÆπq“ì¯àÃK∞ ¯`nqãŸ∫É©ê€µAñâ]läœ˜-Y’=Ì⁄ûlÒø∑°kıﬁ≈ﬁ_Ù„ú„¡∫¶5æÎl<ãì6ŒKöÏøP‹Z?∂Ã≠`xµËæú†:-ƒÄD∫≥{‚Î@Ä´6Wgºyj;w0cpA	dj[nËÑËJÕ\"áÓjªKêG6˘Ú®Ìœ¸‹F⁄,Ê–4N&Ó»`cà{yKÛLOõäªno◊qÑÕÚå\"wlä ü&±*Hâ3?àïô_se=¨]K	„‰—Ú≤ùú∫áÚFï¥K9%¬7ïKh´wï6π∞8¸Ñ≠Âo[í±	Öƒ>¯iX√Ò3‚WdÁ⁄√èÒÍè‹*⁄·Ód:??êx[~b±äˆâ÷ºé<|vêâ«‘b”™ºÂh≠ÜHù@–ƒ•]óßé5Ï™◊ˆy·¶Ê˚EÔ+NRÂ(m–ØÀ)îSÌQ©åRîkÈÃôˇ\0†[Aóè¶\"∑ÍcÄDüoÙászT≠läãéñπ±ßÒ˝Ω∏ÁãÿZò:!ÀN⁄ÛFΩ?àáæ%=VΩ∏ÿˆÈèx¿èË5⁄/ß”S3&≤ëâ\'øú£ì(†#Èa·¥∑ÑÌˆÂ6æˇƒ\0\0\0\0\0\0\0\0\0\0\0\0@ 0!Pˇ⁄\0?√¨–ºèŒã1 0±BTW™àíÈkùñ≈IØ¢Ïı}Ÿ\"§˜]^Î´ƒ‘íI&ã ¢©±SbÂˇƒ\0\0\0\0\0\0\0\0\0\0\0\0@\0 0Pˇ⁄\0?≤π4gNßSF>IP‚hCCP˜21§v˙öy}MEX»§dÈ¢i¶cLÛˇƒ\03\0\0\0\0\0\0\0!1A\"2@Qaq PÅbë#0R±°B`Çí—ˇ⁄\0\0\0?˝ÅŸB*ã‚\0ˆ`VÍsn·ÏïTRTIUvñ[îi[∫(QÈÄ∑™∫|©ªzÛPK•µ“ÏÉz\'Mu¬P¶–Ìê’Ø‘¢ÉVØ∑CÕdæ *´J®TØ`∏H_LW∫›Yr’MáÖ√ì÷(úè=R†JòG-$’YHj∫©UDô å[ú¢ï¢†îjUapÏ´A\\!LUeâA˙ã™O5`õ˝\n*™πW+à°.˘NÜù’ïé—IpÖîUC©(¥™s9SèM–vA„+ÑJ¢vxEô≤H\nwæPfn§¨AúÂq˘¯M˙œƒqëƒ‘~&ÊÜ*Â8Xüå–Û≤òƒƒ¨Õªh ]ŸjâwU≈\'J#◊`8Mp˘_W˙≥™áÓ∆àÔJ «kxÊ≈t\n≠ﬁ,:,Ó‚mtl—ÃFÀë~-&√TÜLÿ#;ƒ¡õ+µ∂ü*TÒu,°[–∑b&\"ŒÍ≥∫Ωëq7VÂÎ≤0‹3t[Á.T¬… ”’42çuSbA™!≠πÂ=ÁR≥!vYL’îŒäct¬p¨#AUR*=u…K]PÀéäí\neÈZØ‰Ë◊¨™FÈ≤öÖeò:>ﬁ™»\'T#úuõƒãyR·©’fb.Ú§‹)T™·5≤{£úΩ∏ÚCqÕÓ≥}R{JD|¶Ä3âÑ–Zt™s≥W∆»4îÊa∑;tÚôÄ”¿›ÓÂY:(P‡\nÜàÃT[]é\\[°é†,Œié¨U®wîçé,m@Î•1qÀûíãfQ-j{¶ø±¡V@(L(oBné˘≤ÍM{\"u(\' –xÃØ¶ÁKz(f`mµî\\“–ÚïG˘ÑˆA$ZVg> Ú•∂¢Ç7Z“÷û˙¶R±ƒmhÍ¶*}@4L¶∞≈¢E|.ö6ú†ÉU›Rõëë3—ÿöm≠⁄\' if(-Õº–!5Âd√Î∂m Ω7Y√@À–&ä∏ß4ÊkØd~ôæ9QYa°à(Ò˝\'>¡£Ú∞ÎuÂÀ-sZmΩ}-†6\0Á~U„î¶¡?Í	\"ã+0√GQ™õƒJ¿.Ñl€QE1nTô™ímtUªIıL	˚UAø-OÉ§Åˆ(9Ω,Ü#Nˆô™öq-óÚPƒ\n£LÎnau_Î‘Sc3º˜.P◊ºùU.™È—Qn∫B§«D÷À(dU”djçc<µ∏Ã§u‰{˙¶‰À≥t åY@$Ö˜v ≤≤πø*%X)Õ¯Y(hÄ•BŒﬂûv=7*µTq[’ÚÆªÆßû◊’UC˘[¬ª#U_fë≥ãÚy»˝®;#˝âV â0zÆ9ˆ~	PZ§˚-Íåß∏qÒ\n^#∞Vß¢ÇSÛµ¡˛√uuUEx[ÿyÒˇ\0UñËnV,\n?©=Ωñ»?πZSZÍË}ã6õOÑÏWè}Ö∏∫Àq·””Ob6åªZ‹©≠£ÿ˙¶ﬁ£• ìÏΩ◊€˛í¨§úœõhÄÈdi^zæâPfgE@-ÿ¸) ˝ÄÙ=ÛXßeÙ€W}ùëÈœ¿Y+<MP◊HBÑı[≠¨†Ê≈z]9Õöi ˇƒ\0*\0\0\0\0\0\0!1AQa@q Åë0°±¡P—·Òˇ⁄\0\0\0?!ÙÆaßË0 ≥‡D•∏≤›Jò3Vs9˙/Q˙Ü_©Ë˝8Ø’‚·ù …±º¸K±≤ì!„∏≠ÒË·«•Oºz\\∑”ÌË{:\\_ÿöl>5.¢¡§óÍ/dºU70Ü¥>%-q•ê5?Ew∂?.›&+ƒoáS”_¢}”Ÿ9Éëh^Çˇ\0Ô±ñfÅTS¥(‹÷\n÷ ™≈Ó>â∏J¡è=JÈÚº≈WŒÁ%ô(Wqçò>ßß~¿·ËnvçKáπAF5È/H—®ú©‘B˚u∞ñÛÊ$∞0ØHf˘àñ»	L@† Åª©x\nÜzÂÛ‹Ñ6F÷\'„-ÄZã\nßƒ≈pi”ÛËKXQ4ööX}†ö3‚dîÆBSÕ\n‘·kÆ£Í˚TË«Úñ8ÉÚG‚√ÃÃ]>gv|¡l/xµÈŸÌ#ˇ\0%µsÑ£PÇ·ñË|K„?îKƒáÃ‹™ﬂ∑—Ï<ÃJg`ƒkàˆY,SfÁózçS\nŸ™©f®©É@+%âT‰na[≤™ÈuF∞˘îÛÌÇ:f¢≤´Ö~j‡7åœ‹Ç4·9‘√‚\"Õ7OÌ0©Æ,ïiM¢y{Ô.@⁄›¯ú¥¯ÑIT∞ÂÀôÛk]C7 e7A6µ;˙ò¬Úèø÷^ﬂ¶‡0¶xÅH\0«<±åÑqˆâ®[¿zØÓfÄ·‹Es€∞_32¿rT†∆CÜV¬º¯ÖHdllÍe˚œó√,∞•0g√;CÚ¿*CÊQÜﬁ]ØÔ2Õ!ì0w.2xÛÍ˛â‰˝zÙÜYG£,”Ù` Ú–Zï_1O^€ﬂàBæﬂOoà¨Ü;vôÄrIF™‡2•ºïÃu≥ópÿÏ˜2Îaóı√¡ïaw≥BÅ˙∂V≥ﬂÈbpÊ¶5∫òÕ2ÌÉÛ∆k[ƒ¬’◊BÊV˝ø∏lô?‚WRÀ.W˝j* °Åc,Pc6Œ.Â´G®‡Ÿ˛Ò¯Ç¬Pr5ˇ\0¿(mCâI°≈HÃ≈©h¸ë+Ë‚\"5¸J´¨^}á0he›cXÖnEû—2ƒ˜µJ¢•⁄Ç´Jq4±oÊ^hΩÌ˜çæ=ó,¸c/‰ˇ\0ÿÇó∞NXô≥‚$(h>æÛ)Æ £†¬!Ã·ätêÜÍæfs)π±OÑ\n4l≠Õ„â‘jæ´ê«GÌ˝ÀAM∑ˆó:≠ˇ\0Q¶üÎcËT8‚2|∑1WÃ‡∑{9ˇ\0ÿÖÈunu‚6_òœŸôf¯£*‡]D¨¬¸≥GL(¶0¢W	ÔP; á=`¡ày≈Ñ»1:{ñV`<À%ö˝‚\00l«˛L®¯¶˜)x˙ÛıÚZ=z5Ë]:[Ç™Ÿ·˛Úòÿ2aÓ/pb\\Ø0	P’¬Zÿ|\'wÇˇ\0Ê^¡¢wF*Ú!pöÙ[£ƒ›¨‘%XT¯72óˆ˚ÀÇÒ¸KQÏ3àVm‹<Åò.Á5Ñˆ7ïú∆,wïºJâá<B®Ω2€∑YäªòWìPÂyéœôìb√ÄΩ§J°•π¯≈>„‡ôï*W¶QGu9ﬁ˙Ö∂ÉûP—°é Ùµîw/Ÿé\0ËÕà∞¶°zNπ©Uh⁄;+_òfPVf≈íÉ	u∂øôkv¿o∞Á©C∞Ω}‚\0Æfwâõ[ö`Q«ÊqÈÿAg’F®á-UÛ∂@Ry˝‡óbæƒ†	Of√/í6MçD∫òﬁ7	œúq⁄¶VÂW*\\îœåªõ∆›&tÓk>\nà‘Ñ d˜0möúÔ˙∑ø˙Ê◊Øâhiƒe-¸™^+ŸleÜ∞Ù¨–ÆV\\òp9˛•°fº¯ï=H∑5õW`∑3£çπO˘ÇäÇ«ß©zŒ ˚D≠œ∫ƒ¶log5ƒ±πo®[ƒU°Ü9-’pÍ}©3™ˆwh`ñ£Œª¶ÂÅs‡!˚◊Ê+ãß‘ÕfÏÛ¯¸M—€Õˇ\0¨JêWÈ÷÷˘ÄZAºº/3áxÈck—ÍUÁSëFÜˆ1Z+2£ﬁ%_€Ÿ–≤™ÑÓÑ÷73.µM◊â÷6ó	˚Õ»nˇ\0í∫„%Yp9W,_‚1 /Åô‘…«”o†@∑°>{ˆ<óı“‚¡ZcÁ-~&√®Ã\\¢¯·è:€∏ÉkkÜÆ©ï;c^ÌífKHùS¬x;éHÀtUUng…4‡¬åÆƒD¸ú≈⁄ˇ\0$Vm‘´é];ô™“„—z+‹n_Ñì;¸«\"»-≤$”L?Ù¶\\∫fÒà<£é%»áÊó0ïÂƒOu˚Q”,…&b˚ôÑw.wSAø0ı0Fﬁƒü ¡Ó∆±îG‹†™îø•”È`5JÓ.f\"Íoè‡èπ7HBuÛS¥Dß“ÊΩhVYú‹BRıüto:[Ÿ^X‡˝J¶há8îOí`WSnØGôÅ,⁄5Ä‹l]x\'/–W0à*úréÚÈ∑∑G’L0πT]ƒ; ≤#PŒÄáCÍÊ¢Üc{É\\zê“/ä|0¸ånÀ\n‡Ù?\"1∆ƒÙvôx.⁄^1^¯k—SñåÄ¢s‹≈#Kã⁄^#‰CÌ/Í.Yœ∏ˇ\0?‡ôzMB™‘KµF«Ê4.Œ◊∫àÿzI_‡0|2cN\"„ämÖåyƒÏÜ∆9Ülá¯‚lU)˛•ãL08fE[¨np∫A…)4êûaƒ˚Ä9Eaº«Ñ¡+´)¸F∑ì{L´åÍ>%r¢À&Àˇ\00Õ%¢	jWïb\nB´Äˇ\0‰—Ω‹≥W‹=*∫5ñI√◊æ…µxÙ≈;Ù‹ô˝Ü¿‡ª˘ñD5ˇ\0ë?)›± ∑¨,ß¸JãxÍS∫ô)f†<ff√J˝Çbmåm_!Ã&ã-è~ÂπÄHîçüºW1|Tesåfe∂ñ®SjmPKuÌ?ˇ⁄\0\0\0\0\0G´$y+{Gõë^‰˛¿œ˝úåW%˚Ï\05∏ÊS¨3‹¢\"ÿq◊˘ÄÂ˙7˛0∆§‹†Ks€X’>¸π∏,pÄÛ\06∞t3ÜsÓ˛Ô†∫®ñA~_»¨ÉÓ}Ó\0¬0ÆìÎ¡°F©rêLÈ√ÙhæJ‡Õf6>÷n\0ƒOæ9a>ŒŸ\nî∫”O<Iπ◊=JŸó,û√F4Úpü´ÉülŒ 0„PÛNbÚ0…Á≈4√0As÷å)Ÿ:ÒƒÁ√2√WƒΩÖ»\0”8√«ì∑õåÏC0√A47‰P\0¨0C0√A_ëRÀ √0√0¡eÅvr¢0√|2À0¡[±Œ?§0ˇ\0å1À0C0ƒO6V¨0√0ˇƒ\0\0\0\0\0\0\0\0\0\0! 01A@Pˇ⁄\0?-e§˜nGpÒõeêudwA·ùLm!~¡l7Ïô}·˚I¡,…%d¸∫¯H˚¬Gñ±‹ı›£∆ØWÿbH8Œ^ßÂõ2l1ëáª6À‰|ò…„&ÚÍ`É®yŒ2ÏÂ˘}ü≈´,…Rèr«ﬁ@ŸE∑SÚR:ÙÏÏ<$=ÂóÀY=ŸÁúÚÓﬁÅ›cÁ;ë‡˘6$∫ò≈˘Ëœúr2@Gµ˜f¡ú$Ã˝ø\\#ÜOp/∏… ˜=L9Ô»eàK‹?Ñl©≈◊àÍœOˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0 !10Aˇ⁄\0?gBG¨|©J^ÜQæ(Bx*q±e?2xµBba4<!¯1?äYÍáT]BßÉ≈ã‡ÜËë\"‰£Œ<67®Ï|Æ¬Èv«ääZ$Ü°J^OÅÑŸ8.P5âüÖÏ]ÒºöLSCjß¢˘.«1\\X?È6ºTå!m˝.\'XŸƒÛ—JRq•&xƒ‘&z·xN-ß©°ì·	îÇ‘bÂvÉd/;∆cAA¢€Û•À˜!vâiºøˇƒ\0*\0\0\0\0\0\0\0!1AQaqÅë °±0@¡—·ÒPˇ⁄\0\0\0?ªÌ/ä8∆\'0∏^ıM]EÃúŒÑƒ%4XË>ùàÜDWâ|Äavº¡ºq0ˆ=+áœ™ÌÛÍxeÿ∂Ìh5ZÃ¬—xeﬂ≠¸KÍ\\ÁË9©qe‹ÊÜ¸ê]V^ù‡JÍ´vπÇ–ö9[Øª*Etù“-≥\nh4¡bî%S`Åw_.—⁄≥ﬁ-c¥q.·π`∆òÉ7l™‚‚⁄•Ò4n%D¨ç ÊL¨qà˝\"s+÷ölÈ2´àöÒæa√r¢∫ù±åƒ8%ﬂZ§‰uÊLòî|ïƒp°yå£˝¬;OµïÀH¢HÄãÛYõof†ßµ{Ò·~cÿ(°Û-n-Ø\'Û8;ê\\ár≈ò¶Œß‚.gÁ–e”q[ÀÁ“ñ÷Ω3ÎrÊ*^?Î“õ\n(Ö9_¥±3ãab	ƒg^∫äÕö%wç¢◊⁄lô∆™&≠™∫¡ö\0ÿÕªâWwÕÛ+Ã·gº!E∑¿wá¬ßu\nLÇ≈∏F˛eŒ8cª◊0ŸŒii/PUÛ]\"Àƒµp‹r¡Ë∏˝/’ò_†D\nyImn.ZçÉ®¬⁄xÇÛW¥Ck™„º£∞*–‹+&í„¨‚≤˛bB»¥‚„Z∞É;eÎ⁄—˝˛ ÖÇﬁKﬁ^E©R°∑r	(¶°]è‘Yô€S4‚>°5{ée‚ÓZsû“˝∑œË?E„“ŸpWùj6∂º@¥ïÊW;Ÿi´Êb®—ƒ5ònà\"+m|«ö±\nWsßÙÖö•¥|*GvYr{Ó§E“aLF¥‰\\G:ï3@á-)‰˚¬<∞l-∑0jŒ°ª}z™˙ﬂ†ïÙ‹Ã ’{K∂#∞¢WÄ6E©]óßﬁ0™õãÿ.3´# °‘∑˜Ä(FEøƒ¨›$cvà\"88Æ%ÕÜè¸∆\0›´\'?cvEìïWìâT›∫V\'h=eî^zC’Ùﬁı˙7ËnuÙÀ˚¡}∆d!4£SPÃÛ:¬Dõ\0≈‘⁄gÖ`Dç§TÜ®´ïÂè\0$œUø0Â\0† ™nΩ©ó¿£®&s	„pW&o8é¿®@ºÆ?πÑäﬁ\\¿ÈMD≤¸ø¨†¡¿œà9áÕŒc˙Å+5ÙÊX/GÅ´Ò3TèSAÅCO±Jó]<¿v.0\\º◊:Çı§≥¯æµÌ}ﬁ ;≤Q£Äˇ\0≤€Â87ÊıÅYÆ8åä¯4e óÒUR»wœE]n(4Ç\nÂÜÛ≠:î]+u\\‹(í\\∂å-#ñsîÊ\'	dlÂ¡†∆pqr»	ØfF’ÚDâÜÖM;B∏[\\Î◊–ﬂ‘z8îwƒsYR“üô~–·£¨BFÿsóâm\n\"\'ΩÒ\\eñZ∫ºâ…*!£—PÖ∞∆úLå á\n–ÙﬁÔtxifUã÷q÷JË¥	ç2Ë0[πï√Öe∞kçí˜zb›ÀgçxÌ€QCïÓ™<Ô¥íÎÖ◊íΩµﬁ8ò˜l%r≈níh§¥hAåød•ò6û“€”uÅ´<˝W†ÃÊaªÈäÙØ©ñc◊©\nnÒ””⁄U¿éUÃﬁ¶ª@&0¢˝ÊM2íËyNò˚≤⁄ΩÏópò¸‹@ï’∫ÍÛﬁ\0⁄a—á¢‹‡‹h&ÓÌáŸQR™¢ñ{u˛ı®‰ãµú8§ÉƒFîà,≤é?ôTÇﬂæe1’\0Ë—ºÙ˘ç´™\\U3Åja“Ù	†à:¨<Bn∂π€Ô+´”-< ˝N^¶.ÛÙç›≈ÅS\nX2c9Ñÿ#”æQædÅJ8∫‚¯Êf\\Éî›ºÁÓ°“çkåÎ˝P‚Ø∂Ü≈Â}.BÑW…[Ù6—U˝—ÀÃ\'O0È–^„_hù∫`∏üüäœJ]Â≥¿æ”§áÈ∂≈8ª»æÑÂJ“ˆFÕ@&ﬁoí\0J»Æfå4˚Ûn#“T¨¥ÏépSvƒ` ïc¶=SœÈ‹∫É/ògKY›LVÜP…ohÆ‡‰{Ûÿô¿∫êâØº±@≤ˆ|«¥Dãrb2Ôu}.8ÃòﬁK˛%MD∑V:|¡\0%_Í6M€ºöË\nÈËV¨)≠¨ptÔ\";–◊√…\"íÓXR€Ô‡:8¶7©´>/øÀ˝®h@Íç–≥>Iï‰Al0(◊ò µ{|G˝‘h¶∏plø|À*14€FÒàE_∞Wu›rëŸõjUº§∂%MÈi`Ú‹Oh·6˝TÁ7ıÊ$cdÀ+ûf–/‚q…ÁπÈ.,∞vËƒ*à4Uv~~`S√Çç(ÖswÏòGIl&4¸À˘UãdÉBﬁ<+¶a°Ùn«t¿\0U?)ö[3dÿ]{tƒ2s∑Ã• ∫¢ﬁ›ÚÛ¸A°Uä ◊ãef#%3“HÌ‰œÇd&Pón3ˆïùø9ã/PNFÑº./ÒÄÜYµ·\0˚‘b≥Pe’±ïz¸∆Ü÷:ŸFhº6íAã2TÔÙ’îA[üL˝hç\0q›¬27÷V‡ò´\n€4%Ç5¿Èæ}Û˜óÀ:∆ˇ\0Äˇ\0,$C§À5/A⁄Z+Ü∑5µ”`·ˇ\0/3hV≠ïcG)c≥‡îXÕ]î÷πˇ\02ô\0>%v¿J»¿ç]/òﬁ\n«Xñïyô∏MXÚˆÕk”±3¡]Û.\nS7b√⁄;Ö´_ôπÅBªπˆáùúk7⁄∏ökªîA˜÷Æ»∑œOFå}7RÛıÛ*ÊÈ3(ÊPgJt˜Ä√◊AOhfΩÂLp6™˘rßıâo®–ËﬂÊ4l≠[ãÑÿÓY1ˆOix!à_+éñJ‰2Ë»;|˛%w5˛†ÅƒUt¸|D†kò¢±πëÅÎ.≥2‰:≠\0≠⁄ËÔB‚—qúw–ÕÎÂ•¥µÅÍ∫åmö\'S{{C¨·$2⁄Ô.Ì[˛Á“æ≥_Mz_s_01Il0∆µö\0\n:6ˆúª`±b{k˚qm	∂nÉM÷XÍwÑ-Võ%•xN7_âmútr‚≠\\vX2ﬂ6sl€∑yîpNE]®¨ﬂ˝ñË9@©±z=ª Ù§∂ÕvñŸåÒJ∑®±Uê⁄5ËÌ™ÇßÙS´wézx]r·†±Í›;Õkây#)_äøRÆu„ÙèKπÃTrv‚ml“a©R∞∂C•åJJ`O`ƒzäAUJäVf»tã [|ºßŸˇ\0~,–Œ\0ÙﬂHP.&.º\\aWö3FoΩF\0È.ıågœ1ãÖg⁄xW1ìeÁ¯Öz1JppMoôPÆ©âúäã)»º:^¢©Ç4·F≠ØÒ‚^Ç•âX*Àca@Ø—kS◊Ù*˙F‰\0‰sQ≠\0`B¨ô§÷vq4Æá`4Ø]∫à—BP5UÅ¨Ω∏ñ¨Ñ]òn`0.C1‘⁄[)@NÜ–’U§Or8®—∑íå;{Ó®åÕ c]‡¶,B 7¸@#ò}íóEÂò)’Ùã7±∞yä©eô/ÌÍ‚T.AÉŸŒ¢[¡h…~b§X¶¨Ø◊a*µÌA•∫ﬂi´Ïr-LÅ(ÿ:‡bT⁄ÿHﬂÖÅ‹‡qœ(√Mﬁ;ëB¨[xºÅ”¥∂ÛR]ì\\‰bÚ∫Ö˙WtÏÉt®l2.ß\\81g¥-q≈√3Ãt;‘PzCïxçn[yE$	õ=#\\tÙ¿…“àQÅvúMeG©*xä≈¢l≠˝Á27^‚»˛ù˝7ËÊp®±Î,%J+ÊrC Í:ƒ≈Ä\n4^ﬂ›ï]¢∏˘cûÄ\"Q\0†∞@— 7ÜÖ†zøΩ„hõjqé32äJú`πi+#7]Rë*·;!@c=c,Ou›≈]´Á◊˚∫ã\0∏\n˚õÊ•∆µi ˘Ì?∫˙à˛ñ1+ag4ı4˘Í\'âouú´3√ ;3åwã^£@\n˚êŒônç∫íﬁ(Yü«√ŸL•jˆ&«L#\0ø/ÒS∫zΩâkmÑ6ƒ◊KG©÷∆S◊ã„◊pÎ˚CESTÂ‚8Q>\"àÿ<Øü@ß·<Gî;à˛ò)ñNÂáÊg·skl◊/ÿÎ\0YYø~aAûk¯3&=Ûˇ\0cP⁄4Øô°Å]71VáíÀ:@[¬p˝øCÆúJä’b≠Ê	@,‡µ9V¸≈[´eõ0∆5®¢€à»D\n±_Ê;A≠è˙ñÕ-6Z¯ï«E{uñ8ç…`ÿ¬*to‰ä›‚…&6·‘eœ;äyc∞ûÏπ.—Z∆aÛ»gQ%ºﬁïi÷073Â∆ΩÕ8œü€n]X`^ë‘,’sPYC8∂cõˆè€º¶0SÃ∞2Xb;*^Â¶¡=—[‹ë®èP^C¬ø3ü°Æ?kC≥9BÎÄõ$d,\\øëÉ`\\Da˜ó-I{zAµ ‘rπÂ(4≈¿F∑kjÜ çjb/[˙^n˛Éy‘≈„]ˇ\0@™Ô˙in€&Ü!Ü0_bˆÃgTÈ‹ÏŒ;}%\0YAVES:PÊ9´wÎ˚JıEAo“áöxÉPÍ2°™Kû”3I˘±2uá∑ê∑Q)=i*qp-®Û@€C“\nŒeqh06cß8‚;u«Ì–¥Oºøô@íΩGî°ƒ£FIWØ§˘GxÊÂÒ4	ü]Î⁄*Uõî¿Ω„=	∑7,∏œ™n‚è)Ñ‰€/K ‘DÙ¨&s›rƒ#z˝wçiøÃ5!Fr,«IUä∫ùÖ3/ÇSe§…y¬Y˜˝Ë÷•´#∫˜îàÙn ÿ<Ó\n¥e®@±hã]}√Ê#4\nmúWÀ÷3ì±Îî\no=xbµ™ÊÉnEåΩ>gOZï˚1§zK\\ª˙ÖF‡∆·zÙ9Ä¶{˛eùÖ^p0˙Y+\0fπLGs!TMÊ∑›óÁÖ\0‰ÕdX°t”X„Ëø›πö∏î“9òâÅé±Md¿d•xÑÿX¡yÈΩˆïG\"ÚÀ·–L+w\\TzÇ¨®™á…=˙˛˙ÍmµïEÇı[ÑxÛ\'Ú7Ô’e%aR€GàárZÅnIøºı„¢·u‡2‡âADnÔõ∑‚Uòß_ﬂõî6ª8éUÄrAî∑£˝¬VOsòóôñ]Ösá]b¡OL©zœò-¨é#[,\0Ìç)1_¯P(›˛%µ∏≥Ç∆$¸.huƒ}V“®Ï◊^Æ∑Z!Ñ FÄâ‘]q–T\nSåÔ¥∞j∫rTæò˙oÙ1˚ä*`ÍÜ∫èYûaw”0\nOp¯âU€Jz8œx⁄ ¿‹/kY/Åë°VÛÊi†˛Œ—uf?ºAD¨\'1€õÔ˚”0±N∫uÇHeƒ!Sö‘JÅ!hdÆÛjAïeUZ.èF≠ôGÃΩ¶/Ã\\éÀV–ä≈	√èÔ¸˝˝sãB¥{±çÅ‡≈/&À±∫˚\\5Û⁄(=™8I7zÀ¿{s)∞mç‰Pq\\ˆˆçÒÀ∫¥◊Á‹È*T6Dœ_’øKüˇŸ");
INSERT INTO docente VALUES("12","7","DKJSKDSJ","");
INSERT INTO docente VALUES("14","871","Gustavo Garc√É¬≠a","");
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
INSERT INTO materia VALUES("14","Construcci√É¬≥n 2","1");
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