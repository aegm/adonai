/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : almacena_adonai

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2012-10-02 11:35:10
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
  `somos` text NOT NULL,
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
INSERT INTO `emp_datbas` VALUES ('1', 'Prueba', 'J-0000000', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like ', 'PRUEBA', 'PRUEBAS', 'PRUEBAssad', 'prueba@prueba', 'prueba@pruebas');

-- ----------------------------
-- Table structure for `eventos`
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id_evento` int(3) NOT NULL AUTO_INCREMENT,
  `titulo_evento` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of eventos
-- ----------------------------
INSERT INTO `eventos` VALUES ('1', 'Lorem Ipsum Dolor Amet', '<p>Lorem Ipsum Dolor Amet Ipsum lorem lorem amet dolor Ipsum dolor Amet</p>', '2012-10-02 09:33:25');

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
INSERT INTO `formularios` VALUES ('frm_cobertura', 'Agregar Cobertura', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-cobertura');
INSERT INTO `formularios` VALUES ('frm_empresa', 'Datos de la Empresa', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-empresa');
INSERT INTO `formularios` VALUES ('frm_evento', 'Agregar Evento', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-evento');
INSERT INTO `formularios` VALUES ('frm_fevento', 'Filtro de Busqueda', 'eventos.php', 'GET', 'application/x-www-form-urlencoded', 'form', 'datbas-fevento');
INSERT INTO `formularios` VALUES ('frm_filtro', 'Filtro de busqueda', 'servicios.php', 'GET\n', 'application/x-www-form-urlencoded', 'form', 'form-filtro');
INSERT INTO `formularios` VALUES ('frm_fnoticia', 'Filtro de busqueda', 'noticia.php', 'GET', 'application/x-www-form-urlencoded', 'form', 'form-filtro');
INSERT INTO `formularios` VALUES ('frm_ftestimonio', 'Filtro de Busqueda', 'testimonio.php', 'GET', 'application/x-www-form-urlencoded', 'form', 'datbas-ftestimonio');
INSERT INTO `formularios` VALUES ('frm_instalaciones', 'Agregar Instalaciòn', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-instalacion');
INSERT INTO `formularios` VALUES ('frm_noticias', 'Datos de la Noticia', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-noticia');
INSERT INTO `formularios` VALUES ('frm_servicio', 'Agregar Servicio', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-servicio');
INSERT INTO `formularios` VALUES ('frm_testimonio', 'Agregar Testimonio', 'form_process.php', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-testimonio');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of formularios_adicional
-- ----------------------------
INSERT INTO `formularios_adicional` VALUES ('1', '10', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');
INSERT INTO `formularios_adicional` VALUES ('3', '16', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');
INSERT INTO `formularios_adicional` VALUES ('4', '17', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');
INSERT INTO `formularios_adicional` VALUES ('5', '228', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');
INSERT INTO `formularios_adicional` VALUES ('6', '232', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');
INSERT INTO `formularios_adicional` VALUES ('7', '236', 'btn_verificar', 'button', '', 'gg-icon-buscar adicional', '', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of formularios_botones
-- ----------------------------
INSERT INTO `formularios_botones` VALUES ('1', 'frm_empresa', 'submit', 'submit', 'Guardar', 'gg-button', '1', '1');
INSERT INTO `formularios_botones` VALUES ('2', 'frm_empresa', 'btn_modificar', 'button', 'Modificar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('3', 'frm_filtro', 'btn_agregar', 'button', 'Agregar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('4', 'frm_noticias', 'submit', 'submit', 'Guardar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('5', 'frm_fevento', 'btn_agregar', 'button', 'Agregar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('6', 'frm_ftestimonio', 'btn_agregar', 'button', 'Agregar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('7', 'frm_testimonio', 'btn_agregar', 'submit', 'Agregar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('8', 'frm_evento', 'btn_agregar', 'submit', 'Guardar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('9', 'frm_instalaciones', 'btn_agregar', 'submit', 'Guardar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('10', 'frm_cobertura', 'btn_agregar', 'submit', 'Guardar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('11', 'frm_servicio', 'btn_agregar', 'submit', 'Guardar', 'gg-button', '0', '1');
INSERT INTO `formularios_botones` VALUES ('13', 'frm_fnoticia', 'btn_agregar', 'button', 'Agregar', 'gg-button', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `formularios_campos` VALUES ('10', 'frm_filtro', 'text', 'Filtro:', 'txt_valor', 'f[1][v]', 'Valor', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('11', 'frm_noticias', 'textarea', 'Noticias', 'txt_titulo', 'txt_titulo', 'titulo noticia', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('12', 'frm_noticias', 'textarea', 'Noticias', 'txt_decrip', 'txt_decrip', 'Descripcion', '', 'text vobli', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('13', 'frm_noticias', 'textarea', 'Noticias', 'txt_conten', 'txt_conten', 'Contenido', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('14', 'frm_noticias', 'select', 'Noticias', 'slt_status', 'slt_status', 'Estatus', '', 'text vobli', '', '1', '0', '0', '4', 'status', 'id_estatus');
INSERT INTO `formularios_campos` VALUES ('15', 'frm_noticias', 'hidden', 'Noticias', 'form', 'form', '', 'guarda-noticia', 'text', '', '0', '0', '0', '5', '', '');
INSERT INTO `formularios_campos` VALUES ('18', 'frm_testimonio', 'textarea', 'Testimonio', 'txt_test', 'txt_test', 'Testimonio', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('19', 'frm_evento', 'textarea', 'Eventos', 'txt_titulo', 'txt_titulo', 'Evento', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('20', 'frm_evento', 'textarea', 'Eventos', 'txt_descrip', 'txt_descrip', 'Descripcion del Evento', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('208', 'frm_evento', 'hidden', 'Eventos', 'form', 'form', '', 'guarda-evento', 'text', '', '0', '0', '0', '5', '', '');
INSERT INTO `formularios_campos` VALUES ('209', 'frm_testimonio', 'hidden', 'Testimonio', 'form', 'form', '', 'guarda-test', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('210', 'frm_evento', 'hidden', 'Eventos', 'evento', 'evento', '', '', 'text', '', '0', '0', '0', '6', '', '');
INSERT INTO `formularios_campos` VALUES ('211', 'frm_noticias', 'hidden', 'Noticias', 'noticia', 'noticia', '', '', 'text', '', '0', '0', '0', '6', '', '');
INSERT INTO `formularios_campos` VALUES ('212', 'frm_testimonio', 'hidden', 'Testimonio', 'testimonio', 'testimonio', '', '', 'text', '', '0', '0', '0', '4', '', '');
INSERT INTO `formularios_campos` VALUES ('213', 'frm_instalaciones', 'textarea', 'Instalacion', 'txt_instalacion', 'txt_instalacion', 'Descripcion de las Instalaciones', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('214', 'frm_cobertura', 'textarea', 'Cobertura', 'txt_cobertura', 'txt_cobertura', 'Descripcion de la Cobertura', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('215', 'frm_servicio', 'textarea', 'Servicio', 'txt_servicio', 'txt_servicio', 'Servicio', '', 'text', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('216', 'frm_instalaciones', 'hidden', 'Instalacion', 'form', 'form', '', 'agrega-instalacion', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('218', 'frm_servicio', 'hidden', 'Servicio', 'form', 'form', '', 'agrega-servicio', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('219', 'frm_cobertura', 'hidden', 'Cobertura', 'form', 'form', '', 'agrega-cobertura', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('220', 'frm_instalaciones', 'hidden', 'Instalacion', 'hdd_instalaciones', 'hdd_instalaciones', '', '', 'text', '', '0', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('221', 'frm_cobertura', 'hidden', 'Cobertura', 'hdd_cobertura', 'hdd_cobertura', '', '', 'text', '', '0', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('222', 'frm_servicio', 'textarea', 'Servicio', 'txt_descripcion', 'txt_descripcion', 'Descripcion Del Servicio', '', 'text', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('223', 'frm_servicio', 'hidden', 'Servicio', 'servicio', 'servicio', 'Descripcion Del Servicio', '', 'text', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('224', 'frm_filtro', 'select', 'Filtro:', 'slt_filtro', 'f[1][c]', 'Filtro', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('226', 'frm_filtro', 'hidden', 'Filtro:', 'tabla', 'tabla', '', '', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('227', 'frm_filtro', 'select', 'Filtro:', 'operadores', 'f[1][o]', 'Operador', '', 'text', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('228', 'frm_fnoticia', 'text', 'Filtro:', 'txt_valor', 'f[1][v]', 'Valor', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('229', 'frm_fnoticia', 'select', 'Filtro:', 'slt_filtro', 'f[1][c]', 'Filtro', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('230', 'frm_fnoticia', 'hidden', 'Filtro:', 'tabla', 'tabla', '', '', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('231', 'frm_fnoticia', 'select', 'Filtro:', 'operadores', 'f[1][o]', 'Operador', '', 'text', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('232', 'frm_fevento', 'text', 'Filtro:', 'txt_valor', 'f[1][v]', 'Valor', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('233', 'frm_fevento', 'select', 'Filtro:', 'slt_filtro', 'f[1][c]', 'Filtro', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('234', 'frm_fevento', 'hidden', 'Filtro:', 'tabla', 'tabla', 'eventos', '', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('235', 'frm_fevento', 'select', 'Filtro:', 'operadores', 'f[1][o]', 'Operador', '', 'text', '', '1', '0', '0', '2', '', '');
INSERT INTO `formularios_campos` VALUES ('236', 'frm_ftestimonio', 'text', 'Filtro:', 'txt_valor', 'f[1][v]', 'Valor', '', 'text vobli', '', '1', '0', '0', '3', '', '');
INSERT INTO `formularios_campos` VALUES ('237', 'frm_ftestimonio', 'select', 'Filtro:', 'slt_filtro', 'f[1][c]', 'Filtro', '', 'text vobli', '', '1', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('238', 'frm_ftestimonio', 'hidden', 'Filtro:', 'tabla', 'tabla', '', 'testimonio', 'text', '', '0', '0', '0', '1', '', '');
INSERT INTO `formularios_campos` VALUES ('239', 'frm_ftestimonio', 'select', 'Filtro:', 'operadores', 'f[1][o]', 'Operador', '', 'text', '', '1', '0', '0', '2', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', 'menu_empresa', '', 'Empresa', 'wpanel/empresa.php', '', '1', '0', '1');
INSERT INTO `menu` VALUES ('2', '2', 'menu_noticia', '', 'Noticias', 'wpanel/noticia.php', '', '5', '0', '1');
INSERT INTO `menu` VALUES ('3', '3', 'menu_eventos', '', 'Eventos', 'wpanel/eventos.php', '', '6', '0', '1');
INSERT INTO `menu` VALUES ('4', '4', 'menu_testimonio', '', 'Testimonios', 'wpanel/testimonio.php', '', '7', '0', '1');
INSERT INTO `menu` VALUES ('5', '5', 'menu_instalaciones', ' ', 'Instalaciones', 'wpanel/Instalaciones.php', ' ', '2', '0', '1');
INSERT INTO `menu` VALUES ('6', '6', 'menu_servicios', ' ', 'Servicios', 'wpanel/servicios.php', ' ', '3', '0', '1');
INSERT INTO `menu` VALUES ('7', '7', 'menu_cobertura', ' ', 'Cobertura', 'wpanel/cobertura.php', ' ', '4', '0', '1');

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
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of noticias
-- ----------------------------
INSERT INTO `noticias` VALUES ('1', 'Lorem Ipsum Dolor Amet', 'Adipiscing consetur mauris imperdiet.', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2', '2012-09-26 15:31:39');
INSERT INTO `noticias` VALUES ('2', 'Lorem Ipsum Dolor Amet.', 'Adipiscing consetur mauris imperdiet.', 'Reprheder invopte invelit dolore nugat oficia desent molit sitanim labrum sintcecat cupidatan.Reprheder invopte invelit dolore nugat oficia desent molit sitanim labrum sintcecat cupidatan.', '1', '2012-09-26 09:55:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of personas
-- ----------------------------
INSERT INTO `personas` VALUES ('1', '1', 'Angel', 'Gonzalez', '474352200', 'El prado', '04262411899', '1', '16595338', ' ', 'angeledugo@gmail.com', ' ', '16595338', ' ', '1347424200', '1347424200', '1');

-- ----------------------------
-- Table structure for `secciones`
-- ----------------------------
DROP TABLE IF EXISTS `secciones`;
CREATE TABLE `secciones` (
  `id_seccion` int(3) NOT NULL AUTO_INCREMENT,
  `instalaciones` text,
  `cobertura` text,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secciones
-- ----------------------------
INSERT INTO `secciones` VALUES ('1', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of asdad</p>', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of asd</p>');

-- ----------------------------
-- Table structure for `servicios`
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id_servicio` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES ('3', 'Neque porro quisquam est qui dolorem', '<p>&nbsp;<span style=\"font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; \">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span></p>');

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
  `id_test` int(3) NOT NULL AUTO_INCREMENT,
  `testimonio` text,
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of testimonio
-- ----------------------------
INSERT INTO `testimonio` VALUES ('3', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"');

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
INSERT INTO `usuarios` VALUES ('1', '1', 'aegm', '81dc9bdb52d04dc20036dbd8313ed055', '1347424200', '1349191279', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuarios_accesos
-- ----------------------------
INSERT INTO `usuarios_accesos` VALUES ('1', 'Empresa', '2222');
INSERT INTO `usuarios_accesos` VALUES ('2', 'Noticia', '2222');
INSERT INTO `usuarios_accesos` VALUES ('3', 'Eventos', '2222');
INSERT INTO `usuarios_accesos` VALUES ('4', 'Testimonios', '2222');
INSERT INTO `usuarios_accesos` VALUES ('5', 'Intalaciones', '2222');
INSERT INTO `usuarios_accesos` VALUES ('6', 'Servicios', '2222');
INSERT INTO `usuarios_accesos` VALUES ('7', 'Cobertura', '2222');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '3', '2222');
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '4', '2222');
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '5', '2222');
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '6', '2222');
INSERT INTO `usuarios_grupos_permisos` VALUES ('1', '7', '2222');

-- ----------------------------
-- View structure for `vmenu`
-- ----------------------------
DROP VIEW IF EXISTS `vmenu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmenu` AS select `menu`.`id_menu` AS `id_menu`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`usuarios_accesos`.`id_acceso` AS `id_acceso`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios_grupos_permisos`.`seguridad` AS `grupo_seguridad`,`usuarios_accesos`.`nombre` AS `acceso`,`usuarios_accesos`.`seguridad` AS `acceso_seguridad`,`menu`.`id` AS `id`,`menu`.`clase` AS `clase`,`menu`.`nombre` AS `nombre`,`menu`.`url` AS `url`,`menu`.`orden` AS `orden`,`menu`.`tipo` AS `tipo`,`menu`.`session` AS `session`,`menu`.`target` AS `target` from (((`menu` join `usuarios_grupos_permisos` on((`menu`.`id_acceso` = `usuarios_grupos_permisos`.`id_acceso`))) join `usuarios_grupos` on((`usuarios_grupos_permisos`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `usuarios_accesos` on((`usuarios_grupos_permisos`.`id_acceso` = `usuarios_accesos`.`id_acceso`))) ;

-- ----------------------------
-- View structure for `vusuarios`
-- ----------------------------
DROP VIEW IF EXISTS `vusuarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vusuarios` AS select `personas`.`id_persona` AS `id_persona`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`personas`.`id_grupo` AS `id_grupo_persona`,`personas`.`identificacion` AS `identificacion`,`personas`.`nombre` AS `nombre`,`personas`.`apellido` AS `apellido`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios`.`usuario` AS `usuario`,`usuarios`.`clave` AS `clave`,`usuarios`.`ultima_entrada` AS `ultima_entrada`,`usuarios_config`.`datos_actualizados` AS `datos_actualizados`,`usuarios`.`estatus` AS `estatus`,`personas`.`correo` AS `correo` from (((`usuarios` join `usuarios_grupos` on((`usuarios`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `personas` on((`usuarios`.`id_persona` = `personas`.`id_persona`))) left join `usuarios_config` on((`personas`.`id_persona` = `usuarios_config`.`id_persona`))) ;
