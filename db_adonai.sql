/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : db_adonai

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2012-09-10 16:14:07
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emp_datbas
-- ----------------------------

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
INSERT INTO `formularios` VALUES ('frm_empresa', 'Datos de la Empresa', 'form_process', 'post', 'application/x-www-form-urlencoded', 'form', 'datbas-empresa');

-- ----------------------------
-- Table structure for `noticias`
-- ----------------------------
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id_noticia` int(3) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `contenido` text,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of noticias
-- ----------------------------

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_tipo` int(2) NOT NULL,
  PRIMARY KEY (`id`,`id_tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
