/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : almacena_adonai

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2012-09-17 14:39:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cobertura`
-- ----------------------------
DROP TABLE IF EXISTS `cobertura`;
CREATE TABLE `cobertura` (
  `id_cob` int(3) NOT NULL,
  `id_empresa` int(3) NOT NULL,
  `latitud` varchar(30) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cob`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cobertura
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_datbas`
-- ----------------------------
DROP TABLE IF EXISTS `emp_datbas`;
CREATE TABLE `emp_datbas` (
  `id_empresa` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `identificacion` varchar(11) NOT NULL,
  `somos` varchar(150) NOT NULL,
  `mision` text NOT NULL,
  `vision` text NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email_contacto` varchar(120) NOT NULL,
  `email_cobranza` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emp_datbas
-- ----------------------------
INSERT INTO `emp_datbas` VALUES ('1', 'Prueba', 'J-0000000', 'PRUEBAs', 'PRUEBA', 'PRUEBAS', 'PRUEBA', 'prueba@prueba', 'prueba@pruebas');

-- ----------------------------
-- Table structure for `eventos`
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id_evento` int(3) NOT NULL,
  `titulo_evento` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of eventos
-- ----------------------------

-- ----------------------------
-- Table structure for `formularios`
-- ----------------------------
DROP TABLE IF EXISTS `formularios`;
CREATE TABLE `formularios` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `accion` varchar(50) NOT NULL DEFAULT 'form_process.php',
  `metodo` varchar(4) NOT NULL DEFAULT 'post',
  `tipo` varchar(40) NOT NULL DEFAULT 'application/x-www-form-urlencoded',
  `clase` varchar(20) NOT NULL DEFAULT 'form',
  `form` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of formularios
-- ----------------------------
INSERT INTO `formularios` VALUES ('frm_empresa', 'Datos de la Empresa', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-empresa');
INSERT INTO `formularios` VALUES ('frm_filtro', 'Filtro de busqueda', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'form-filtro');
INSERT INTO `formularios` VALUES ('frm_noticias', 'Datos de la Noticia', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-noticia');

-- ----------------------------
-- Table structure for `formularios_adicional`
-- ----------------------------
DROP TABLE IF EXISTS `formularios_adicional`;
CREATE TABLE `formularios_adicional` (
  `id_adicional` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_campo` int(10) unsigned NOT NULL,
  `id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `class` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(50) NOT NULL,
  `deshabilitado` int(1) NOT NULL DEFAULT '0',
  `orden` int(2) NOT NULL,
  PRIMARY KEY (`id_adicional`),
  KEY `formularios_adicional-formulario_campos` (`id_campo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of formularios_adicional
-- ----------------------------
INSERT INTO `formularios_adicional` VALUES ('1', '10', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');

-- ----------------------------
-- Table structure for `formularios_botones`
-- ----------------------------
DROP TABLE IF EXISTS `formularios_botones`;
CREATE TABLE `formularios_botones` (
  `id_boton` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_formulario` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'submit',
  `nombre` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL DEFAULT 'gg-button',
  `deshabilitado` int(1) NOT NULL,
  `orden` int(2) NOT NULL,
  PRIMARY KEY (`id_boton`),
  KEY `fk_formulario_botones-formulario` (`id_formulario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of formularios_botones
-- ----------------------------
INSERT INTO `formularios_botones` VALUES ('1', 'frm_empresa', 'submit', 'submit', 'Guardar', 'gg-button', '1', '1');
INSERT INTO `formularios_botones` VALUES ('2', 'frm_empresa', 'btn_modificar', 'button', 'Modificar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('3', 'frm_filtro', 'btn_agregar', 'button', 'Agregar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('4', 'frm_noticias', 'submit', 'submit', 'Guardar', 'gg-button', '0', '1');

-- ----------------------------
-- Table structure for `formularios_campos`
-- ----------------------------
DROP TABLE IF EXISTS `formularios_campos`;
CREATE TABLE `formularios_campos` (
  `id_campo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_formulario` varchar(50) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'text',
  `legend` varchar(50) NOT NULL,
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `clase` varchar(200) NOT NULL DEFAULT 'text',
  `info` varchar(50) NOT NULL,
  `obligatorio` int(1) NOT NULL,
  `deshabilitado` int(1) NOT NULL,
  `solo_lectura` int(1) NOT NULL,
  `orden` int(2) NOT NULL,
  `datos` varchar(50) NOT NULL,
  `datos_value` varchar(20) NOT NULL,
  PRIMARY KEY (`id_campo`),
  KEY `fk_formularios_campos-formulario` (`id_formulario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of formularios_campos
-- ----------------------------
INSERT INTO `formularios_campos` VALUES ('1', 'frm_empresa', 'text', 'Datos de la Empresa', 'txt_rsocial', 'txt_rsocial', 'Razon Social', '', 'text vobli', '', '1', '1', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('2', 'frm_empresa', 'text', 'Datos de la Empresa', 'txt_rif', 'txt_rif', 'RIF', '', 'text', '', '1', '1', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('3', 'frm_empresa', 'textarea', 'Datos de la Empresa', 'txt_somos', 'txt_somos', 'Quienes Somos', '', 'text', '', '1', '1', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('4', 'frm_empresa', 'textarea', 'Datos de la Empresa', 'txt_mision', 'txt_mision', 'Misión', '', 'text', '', '1', '1', '0', '4', '', '');
INSERT INTO `formularios_campos` VALUES ('5', 'frm_empresa', 'textarea', 'Datos de la Empresa', 'txt_vision', 'txt_vision', 'Visión', '', 'text', '', '1', '1', '0', '5', '', '');
INSERT INTO `formularios_campos` VALUES ('6', 'frm_empresa', 'text', 'Datos de la Empresa', 'txt_tel', 'txt_tel', 'Telefono', '', 'text', '', '1', '1', '0', '6', '', '');
INSERT INTO `formularios_campos` VALUES ('7', 'frm_empresa', 'text', 'Datos de la Empresa', 'txt_email', 'txt_email', 'Correo contacto', '', 'text', '', '1', '1', '0', '7', '', '');
INSERT INTO `formularios_campos` VALUES ('8', 'frm_empresa', 'text', 'Datos de la Empresa', 'txt_emailc', 'txt_emailc', 'Correo cobranzas', '', 'text', '', '1', '1', '0', '8', '', '');
INSERT INTO `formularios_campos` VALUES ('9', 'frm_empresa', 'hidden', 'Datos de la Empresa', 'form', 'form', '', 'actualiza-empresa', 'text', '', '0', '0', '0', '9', '', '');
INSERT INTO `formularios_campos` VALUES ('10', 'frm_filtro', 'text', 'Filtro:', 'txt_id', 'txt_id', 'Id', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('11', 'frm_noticias', 'textarea', 'Noticias', 'txt_titulo', 'txt_titulo', 'titulo noticia', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('12', 'frm_noticias', 'textarea', 'Noticias', 'txt_decrip', 'txt_decrip', 'Descripcion', '', 'text vobli', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('13', 'frm_noticias', 'textarea', 'Noticias', 'txt_conten', 'txt_conten', 'Contenido', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('14', 'frm_noticias', 'select', 'Noticias', 'slt_status', 'slt_status', 'Estatus', '', 'text vobli', '', '1', '0', '0', '4', 'status', 'id_estatus');
INSERT INTO `formularios_campos` VALUES ('15', 'frm_noticias', 'hidden', 'Noticias', 'form', 'form', '', 'guarda-noticia', 'text', '', '0', '0', '0', '5', '', '');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_acceso` int(10) unsigned NOT NULL,
  `id` varchar(20) NOT NULL,
  `clase` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `target` varchar(20) NOT NULL,
  `orden` int(2) NOT NULL,
  `tipo` int(1) NOT NULL COMMENT '0.- Menu principal, # de id para sub menu del id.',
  `session` int(1) NOT NULL COMMENT '0: desabilitado, 1: solo no session, 2: session y no session, 3: solo session.',
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `orden` (`orden`,`tipo`) USING BTREE,
  KEY `fk_menu_acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_acceso`) REFERENCES `usuarios_accesos` (`id_acceso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', 'menu_empresa', '', 'Empresa', 'wpanel/empresa.php', '', '1', '0', '1');
INSERT INTO `menu` VALUES ('2', '2', 'menu_noticia', '', 'Noticias', 'wpanel/noticia.php', '', '2', '0', '1');

-- ----------------------------
-- Table structure for `noticias`
-- ----------------------------
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id_noticia` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `contenido` text,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of noticias
-- ----------------------------
INSERT INTO `noticias` VALUES ('1', 'Prueba titulo', 'Prueba de descripcion', 'Prueba de contenido', '1');
INSERT INTO `noticias` VALUES ('2', 'Prueba 2', 'descripcion 2', 'contenido 2', '1');
INSERT INTO `noticias` VALUES ('3', 'asd', 'asd', 'asd', '2');
INSERT INTO `noticias` VALUES ('4', 'asd', 'asd', '<p>&nbsp;asd</p>', '2');
INSERT INTO `noticias` VALUES ('5', 'prueba de titulo', 'prueba de descripcion', '<p>&nbsp;asdasd&nbsp;</p>\r\n<p>asdn asmd}asdas</p>\r\n<p>d n&ntilde;asd&nbsp;</p>\r\n<p>asd</p>\r\n<p>&nbsp;asd</p>\r\n<p>&nbsp;</p>', '1');

-- ----------------------------
-- Table structure for `personas`
-- ----------------------------
DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas` (
  `id_persona` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_estado` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` int(10) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_ciudad` int(10) unsigned DEFAULT NULL,
  `identificacion` varchar(50) NOT NULL,
  `telefono2` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `correo2` varchar(100) NOT NULL,
  `creado` varchar(100) NOT NULL,
  `modificado` varchar(100) NOT NULL,
  `fecha_creacion` int(12) NOT NULL,
  `fecha_modificacion` int(12) NOT NULL,
  `id_grupo` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `in_identificacion` (`identificacion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6906 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of personas
-- ----------------------------
INSERT INTO `personas` VALUES ('1', '1', 'Angel', 'Gonzalez', '474352200', 'El prado', '04262411899', '1', '16595338', ' ', 'angeledugo@gmail.com', ' ', '16595338', ' ', '1347424200', '1347424200', '1');

-- ----------------------------
-- Table structure for `servicios`
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id_servicio` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of servicios
-- ----------------------------

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id_estatus` int(2) NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `estatus` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Inactivo', '0');
INSERT INTO `status` VALUES ('2', 'Activo', '1');
INSERT INTO `status` VALUES ('3', 'Terminado', '2');

-- ----------------------------
-- Table structure for `testimonio`
-- ----------------------------
DROP TABLE IF EXISTS `testimonio`;
CREATE TABLE `testimonio` (
  `id_test` int(3) NOT NULL,
  `testimonio` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of testimonio
-- ----------------------------

-- ----------------------------
-- Table structure for `tipo_usr`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usr`;
CREATE TABLE `tipo_usr` (
  `id_tipo` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipo_usr
-- ----------------------------

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_persona` int(10) unsigned NOT NULL,
  `id_grupo` int(10) unsigned NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `fecha_registro` int(12) NOT NULL,
  `ultima_entrada` int(10) NOT NULL,
  `estatus` varchar(1) NOT NULL DEFAULT '1' COMMENT '1:activo, 2:inactivo, 3:contrato_vencido',
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `in_usuario` (`usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', '1', 'aegm', '81dc9bdb52d04dc20036dbd8313ed055', '1347424200', '1347906462', '1');

-- ----------------------------
-- Table structure for `usuarios_accesos`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_accesos`;
CREATE TABLE `usuarios_accesos` (
  `id_acceso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `seguridad` int(4) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  UNIQUE KEY `in_nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios_accesos
-- ----------------------------
INSERT INTO `usuarios_accesos` VALUES ('1', 'Empresa', '2222');
INSERT INTO `usuarios_accesos` VALUES ('2', 'Noticia', '2222');

-- ----------------------------
-- Table structure for `usuarios_config`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_config`;
CREATE TABLE `usuarios_config` (
  `id_persona` int(10) unsigned NOT NULL,
  `grado` int(2) NOT NULL,
  `datos_actualizados` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_persona`),
  CONSTRAINT `fk_usuarios_config-usuarios` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios_config
-- ----------------------------
INSERT INTO `usuarios_config` VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for `usuarios_grupos`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_grupos`;
CREATE TABLE `usuarios_grupos` (
  `id_grupo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `in_nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios_grupos
-- ----------------------------
INSERT INTO `usuarios_grupos` VALUES ('1', 'Super Admin');

-- ----------------------------
-- Table structure for `usuarios_grupos_permisos`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_grupos_permisos`;
CREATE TABLE `usuarios_grupos_permisos` (
  `id_grupo` int(10) unsigned NOT NULL,
  `id_acceso` int(10) unsigned NOT NULL,
  `seguridad` int(4) NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_acceso`),
  KEY `fk_grupo_permisos-acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `fk_grupo_permisos-acceso` FOREIGN KEY (`id_acceso`) REFERENCES `usuarios_accesos` (`id_acceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grupo_permisos-grupo` FOREIGN KEY (`id_grupo`) REFERENCES `usuarios_grupos` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios_grupos_permisos
-- ----------------------------
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '1', '2222');
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '2', '2222');

-- ----------------------------
-- View structure for `vmenu`
-- ----------------------------
DROP VIEW IF EXISTS `vmenu`;
CREATE  VIEW `vmenu` AS select `menu`.`id_menu` AS `id_menu`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`usuarios_accesos`.`id_acceso` AS `id_acceso`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios_grupos_permisos`.`seguridad` AS `grupo_seguridad`,`usuarios_accesos`.`nombre` AS `acceso`,`usuarios_accesos`.`seguridad` AS `acceso_seguridad`,`menu`.`id` AS `id`,`menu`.`clase` AS `clase`,`menu`.`nombre` AS `nombre`,`menu`.`url` AS `url`,`menu`.`orden` AS `orden`,`menu`.`tipo` AS `tipo`,`menu`.`session` AS `session`,`menu`.`target` AS `target` from (((`menu` join `usuarios_grupos_permisos` on((`menu`.`id_acceso` = `usuarios_grupos_permisos`.`id_acceso`))) join `usuarios_grupos` on((`usuarios_grupos_permisos`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `usuarios_accesos` on((`usuarios_grupos_permisos`.`id_acceso` = `usuarios_accesos`.`id_acceso`))) ;

-- ----------------------------
-- View structure for `vusuarios`
-- ----------------------------
DROP VIEW IF EXISTS `vusuarios`;
CREATE  VIEW `vusuarios` AS select `personas`.`id_persona` AS `id_persona`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`personas`.`id_grupo` AS `id_grupo_persona`,`personas`.`identificacion` AS `identificacion`,`personas`.`nombre` AS `nombre`,`personas`.`apellido` AS `apellido`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios`.`usuario` AS `usuario`,`usuarios`.`clave` AS `clave`,`usuarios`.`ultima_entrada` AS `ultima_entrada`,`usuarios_config`.`datos_actualizados` AS `datos_actualizados`,`usuarios`.`estatus` AS `estatus`,`personas`.`correo` AS `correo` from (((`usuarios` join `usuarios_grupos` on((`usuarios`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `personas` on((`usuarios`.`id_persona` = `personas`.`id_persona`))) left join `usuarios_config` on((`personas`.`id_persona` = `usuarios_config`.`id_persona`))) ;
