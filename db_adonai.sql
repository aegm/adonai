CREATE DATABASE  IF NOT EXISTS `almacena_adonai` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `almacena_adonai`;
-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: almacena_adonai
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id_estatus` int(2) NOT NULL DEFAULT '0',
  `nombre` varchar(20) DEFAULT NULL,
  `estatus` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Inactivo',0),(2,'Activo',1),(3,'Terminado',2);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id_evento` int(3) NOT NULL AUTO_INCREMENT,
  `titulo_evento` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `id_servicio` int(3) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usr`
--

DROP TABLE IF EXISTS `tipo_usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usr` (
  `id_tipo` int(2) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usr`
--

LOCK TABLES `tipo_usr` WRITE;
/*!40000 ALTER TABLE `tipo_usr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobertura` (
  `id_cob` int(3) NOT NULL,
  `id_empresa` int(3) NOT NULL,
  `latitud` varchar(30) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cob`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura`
--

LOCK TABLES `cobertura` WRITE;
/*!40000 ALTER TABLE `cobertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_grupos`
--

DROP TABLE IF EXISTS `usuarios_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_grupos` (
  `id_grupo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `in_nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_grupos`
--

LOCK TABLES `usuarios_grupos` WRITE;
/*!40000 ALTER TABLE `usuarios_grupos` DISABLE KEYS */;
INSERT INTO `usuarios_grupos` VALUES (1,'Super Admin');
/*!40000 ALTER TABLE `usuarios_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formularios`
--

DROP TABLE IF EXISTS `formularios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formularios`
--

LOCK TABLES `formularios` WRITE;
/*!40000 ALTER TABLE `formularios` DISABLE KEYS */;
INSERT INTO `formularios` VALUES ('frm_empresa','Datos de la Empresa','form_process.php','post','application/x-www-form-urlencoded','form','datbas-empresa'),('frm_evento','Agregar Evento','form_process.php','post','application/x-www-form-urlencoded','form','datbas-evento'),('frm_fevento','Filtro de Bsuqueda','form_process.php','post','application/x-www-form-urlencoded','form','datbas-fevento'),('frm_filtro','Filtro de busqueda','form_process.php','post','application/x-www-form-urlencoded','form','form-filtro'),('frm_ftestimonio','Filtro de Bsuqueda','form_process.php','post','application/x-www-form-urlencoded','form','datbas-ftestimonio'),('frm_noticias','Datos de la Noticia','form_process.php','post','application/x-www-form-urlencoded','form','datbas-noticia'),('frm_testimonio','Agregar Testimonio','form_process.php','post','application/x-www-form-urlencoded','form','datbas-testimonio');
/*!40000 ALTER TABLE `formularios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_datbas`
--

DROP TABLE IF EXISTS `emp_datbas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_datbas`
--

LOCK TABLES `emp_datbas` WRITE;
/*!40000 ALTER TABLE `emp_datbas` DISABLE KEYS */;
INSERT INTO `emp_datbas` VALUES (1,'Prueba','J-0000000','PRUEBAs','PRUEBA','PRUEBAS','PRUEBA','prueba@prueba','prueba@pruebas');
/*!40000 ALTER TABLE `emp_datbas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vmenu`
--

DROP TABLE IF EXISTS `vmenu`;
/*!50001 DROP VIEW IF EXISTS `vmenu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vmenu` (
  `id_menu` int(10) unsigned,
  `id_grupo` int(10) unsigned,
  `id_acceso` int(10) unsigned,
  `grupo` varchar(50),
  `grupo_seguridad` int(4),
  `acceso` varchar(50),
  `acceso_seguridad` int(4),
  `id` varchar(20),
  `clase` varchar(20),
  `nombre` varchar(50),
  `url` varchar(100),
  `orden` int(2),
  `tipo` int(1),
  `session` int(1),
  `target` varchar(20)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios_accesos`
--

DROP TABLE IF EXISTS `usuarios_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_accesos` (
  `id_acceso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `seguridad` int(4) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  UNIQUE KEY `in_nombre` (`nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_accesos`
--

LOCK TABLES `usuarios_accesos` WRITE;
/*!40000 ALTER TABLE `usuarios_accesos` DISABLE KEYS */;
INSERT INTO `usuarios_accesos` VALUES (1,'Empresa',2222),(2,'Noticia',2222),(3,'Eventos',2222),(4,'Testimonios',2222);
/*!40000 ALTER TABLE `usuarios_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vusuarios`
--

DROP TABLE IF EXISTS `vusuarios`;
/*!50001 DROP VIEW IF EXISTS `vusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vusuarios` (
  `id_persona` int(10) unsigned,
  `id_grupo` int(10) unsigned,
  `id_grupo_persona` int(10) unsigned,
  `identificacion` varchar(50),
  `nombre` varchar(50),
  `apellido` varchar(50),
  `grupo` varchar(50),
  `usuario` varchar(30),
  `clave` varchar(32),
  `ultima_entrada` int(10),
  `datos_actualizados` varchar(1),
  `estatus` varchar(1),
  `correo` varchar(100)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'aegm','81dc9bdb52d04dc20036dbd8313ed055',1347424200,1348239699,'1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `id_noticia` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `contenido` text,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_noticia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (1,'Prueba titulo','Prueba de descripcion','<p><b>&quot;Prueba\' de contenido prueba</b></p>','1'),(2,'Prueba 2','descripcion 2','contenido 2','1'),(3,'asd','asd','asd','2');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formularios_adicional`
--

DROP TABLE IF EXISTS `formularios_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formularios_adicional`
--

LOCK TABLES `formularios_adicional` WRITE;
/*!40000 ALTER TABLE `formularios_adicional` DISABLE KEYS */;
INSERT INTO `formularios_adicional` VALUES (1,10,'btn_verificar','button','','gg-icon-buscar adicional','',0,1),(3,16,'btn_verificar','button','','gg-icon-buscar adicional','',0,1),(4,17,'btn_verificar','button','','gg-icon-buscar adicional','',0,1);
/*!40000 ALTER TABLE `formularios_adicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formularios_campos`
--

DROP TABLE IF EXISTS `formularios_campos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formularios_campos`
--

LOCK TABLES `formularios_campos` WRITE;
/*!40000 ALTER TABLE `formularios_campos` DISABLE KEYS */;
INSERT INTO `formularios_campos` VALUES (1,'frm_empresa','text','Datos de la Empresa','txt_rsocial','txt_rsocial','Razon Social','','text vobli','',1,1,0,1,'',''),(2,'frm_empresa','text','Datos de la Empresa','txt_rif','txt_rif','RIF','','text','',1,1,0,2,'',''),(3,'frm_empresa','textarea','Datos de la Empresa','txt_somos','txt_somos','Quienes Somos','','text','',1,1,0,3,'',''),(4,'frm_empresa','textarea','Datos de la Empresa','txt_mision','txt_mision','Misión','','text','',1,1,0,4,'',''),(5,'frm_empresa','textarea','Datos de la Empresa','txt_vision','txt_vision','Visión','','text','',1,1,0,5,'',''),(6,'frm_empresa','text','Datos de la Empresa','txt_tel','txt_tel','Telefono','','text','',1,1,0,6,'',''),(7,'frm_empresa','text','Datos de la Empresa','txt_email','txt_email','Correo contacto','','text','',1,1,0,7,'',''),(8,'frm_empresa','text','Datos de la Empresa','txt_emailc','txt_emailc','Correo cobranzas','','text','',1,1,0,8,'',''),(9,'frm_empresa','hidden','Datos de la Empresa','form','form','','actualiza-empresa','text','',0,0,0,9,'',''),(10,'frm_filtro','text','Filtro:','txt_id','txt_id','Id','','text vobli','',1,0,0,1,'',''),(11,'frm_noticias','textarea','Noticias','txt_titulo','txt_titulo','titulo noticia','','text vobli','',1,0,0,1,'',''),(12,'frm_noticias','textarea','Noticias','txt_decrip','txt_decrip','Descripcion','','text vobli','',1,0,0,2,'',''),(13,'frm_noticias','textarea','Noticias','txt_conten','txt_conten','Contenido','','text vobli','',1,0,0,3,'',''),(14,'frm_noticias','select','Noticias','slt_status','slt_status','Estatus','','text vobli','',1,0,0,4,'status','id_estatus'),(15,'frm_noticias','hidden','Noticias','form','form','','guarda-noticia','text','',0,0,0,5,'',''),(16,'frm_ftestimonio','text','Filtro:','txt_id','txt_id','Id','','text','',1,0,0,1,'',''),(17,'frm_fevento','text','Filtro:','txt_id','txt_id','Id','','text','',1,0,0,1,'',''),(18,'frm_testimonio','textarea','Testimonio','txt_test','txt_test','Testimonio','','text','',1,0,0,1,'',''),(19,'frm_evento','textarea','Eventos','txt_titulo','txt_titulo','Evento','','text','',1,0,0,1,'',''),(20,'frm_evento','textarea','Eventos','txt_descrip','txt_descrip','Descripcion del Evento','','text','',1,0,0,1,'',''),(208,'frm_evento','hidden','Eventos','form','form','','guarda-evento','text','',0,0,0,5,'',''),(209,'frm_testimonio','hidden','Testimonio','form','form','','guarda-test','text','',0,0,0,1,'',''),(210,'frm_evento','hidden','Eventos','evento','evento','','','text','',0,0,0,6,'',''),(211,'frm_noticias','hidden','Noticias','noticia','noticia','','','text','',0,0,0,6,'',''),(212,'frm_testimonio','hidden','Testimonio','testimonio','testimonio','','','text','',0,0,0,4,'','');
/*!40000 ALTER TABLE `formularios_campos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formularios_botones`
--

DROP TABLE IF EXISTS `formularios_botones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formularios_botones`
--

LOCK TABLES `formularios_botones` WRITE;
/*!40000 ALTER TABLE `formularios_botones` DISABLE KEYS */;
INSERT INTO `formularios_botones` VALUES (1,'frm_empresa','submit','submit','Guardar','gg-button',1,1),(2,'frm_empresa','btn_modificar','button','Modificar','gg-button',0,1),(3,'frm_filtro','btn_agregar','button','Agregar','gg-button',0,1),(4,'frm_noticias','submit','submit','Guardar','gg-button',0,1),(5,'frm_fevento','btn_agregar','button','Agregar','gg-button',0,1),(6,'frm_ftestimonio','btn_agregar','button','Agregar','gg-button',0,1),(7,'frm_testimonio','btn_agregar','submit','Guardar','gg-button',0,1),(8,'frm_evento','btn_agregar','submit','Guardar','gg-button',0,1);
/*!40000 ALTER TABLE `formularios_botones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonio`
--

DROP TABLE IF EXISTS `testimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonio` (
  `id_test` int(3) NOT NULL AUTO_INCREMENT,
  `testimonio` text,
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonio`
--

LOCK TABLES `testimonio` WRITE;
/*!40000 ALTER TABLE `testimonio` DISABLE KEYS */;
INSERT INTO `testimonio` VALUES (3,'Prueba de Guardado prueba');
/*!40000 ALTER TABLE `testimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'menu_empresa','','Empresa','wpanel/empresa.php','',1,0,1),(2,2,'menu_noticia','','Noticias','wpanel/noticia.php','',2,0,1),(3,3,'menu_eventos','','Eventos','wpanel/eventos.php','',3,0,1),(4,4,'menu_testimonio','','Testimonios','wpanel/testimonio.php','',4,0,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,1,'Angel','Gonzalez',474352200,'El prado','04262411899',1,'16595338',' ','angeledugo@gmail.com',' ','16595338',' ',1347424200,1347424200,1);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_config`
--

DROP TABLE IF EXISTS `usuarios_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_config` (
  `id_persona` int(10) unsigned NOT NULL,
  `grado` int(2) NOT NULL,
  `datos_actualizados` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_persona`),
  CONSTRAINT `fk_usuarios_config-usuarios` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_config`
--

LOCK TABLES `usuarios_config` WRITE;
/*!40000 ALTER TABLE `usuarios_config` DISABLE KEYS */;
INSERT INTO `usuarios_config` VALUES (1,1,'0');
/*!40000 ALTER TABLE `usuarios_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_grupos_permisos`
--

DROP TABLE IF EXISTS `usuarios_grupos_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_grupos_permisos` (
  `id_grupo` int(10) unsigned NOT NULL,
  `id_acceso` int(10) unsigned NOT NULL,
  `seguridad` int(4) NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_acceso`),
  KEY `fk_grupo_permisos-acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `fk_grupo_permisos-acceso` FOREIGN KEY (`id_acceso`) REFERENCES `usuarios_accesos` (`id_acceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_grupo_permisos-grupo` FOREIGN KEY (`id_grupo`) REFERENCES `usuarios_grupos` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_grupos_permisos`
--

LOCK TABLES `usuarios_grupos_permisos` WRITE;
/*!40000 ALTER TABLE `usuarios_grupos_permisos` DISABLE KEYS */;
INSERT INTO `usuarios_grupos_permisos` VALUES (1,1,2222),(1,2,2222),(1,3,2222),(1,4,2222);
/*!40000 ALTER TABLE `usuarios_grupos_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `vmenu`
--

/*!50001 DROP TABLE IF EXISTS `vmenu`*/;
/*!50001 DROP VIEW IF EXISTS `vmenu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vmenu` AS select `menu`.`id_menu` AS `id_menu`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`usuarios_accesos`.`id_acceso` AS `id_acceso`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios_grupos_permisos`.`seguridad` AS `grupo_seguridad`,`usuarios_accesos`.`nombre` AS `acceso`,`usuarios_accesos`.`seguridad` AS `acceso_seguridad`,`menu`.`id` AS `id`,`menu`.`clase` AS `clase`,`menu`.`nombre` AS `nombre`,`menu`.`url` AS `url`,`menu`.`orden` AS `orden`,`menu`.`tipo` AS `tipo`,`menu`.`session` AS `session`,`menu`.`target` AS `target` from (((`menu` join `usuarios_grupos_permisos` on((`menu`.`id_acceso` = `usuarios_grupos_permisos`.`id_acceso`))) join `usuarios_grupos` on((`usuarios_grupos_permisos`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `usuarios_accesos` on((`usuarios_grupos_permisos`.`id_acceso` = `usuarios_accesos`.`id_acceso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vusuarios`
--

/*!50001 DROP TABLE IF EXISTS `vusuarios`*/;
/*!50001 DROP VIEW IF EXISTS `vusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vusuarios` AS select `personas`.`id_persona` AS `id_persona`,`usuarios_grupos`.`id_grupo` AS `id_grupo`,`personas`.`id_grupo` AS `id_grupo_persona`,`personas`.`identificacion` AS `identificacion`,`personas`.`nombre` AS `nombre`,`personas`.`apellido` AS `apellido`,`usuarios_grupos`.`nombre` AS `grupo`,`usuarios`.`usuario` AS `usuario`,`usuarios`.`clave` AS `clave`,`usuarios`.`ultima_entrada` AS `ultima_entrada`,`usuarios_config`.`datos_actualizados` AS `datos_actualizados`,`usuarios`.`estatus` AS `estatus`,`personas`.`correo` AS `correo` from (((`usuarios` join `usuarios_grupos` on((`usuarios`.`id_grupo` = `usuarios_grupos`.`id_grupo`))) join `personas` on((`usuarios`.`id_persona` = `personas`.`id_persona`))) left join `usuarios_config` on((`personas`.`id_persona` = `usuarios_config`.`id_persona`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-21 11:39:56
