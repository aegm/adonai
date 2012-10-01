<?php
/*
 * Archivo creado por el Ing. angel Gonzalez
 * correo: angeledugo@gmail.com
 */
/*ini_set('error_report', E_ALL);
/*error_reporting(E_ALL);
/*****************************LIBRERIAS GLOBALES**********************************/
require_once 'config.php';
require_once 'wpanel/lib/clases/plantilla.class.php';
/*****************************OBJETO GLOBAL***************************************/
$html = new plantilla;
/*****************************VARIABLES PREDEFINIDAS******************************/
$matriz['TITULO'] = "";
$matriz['TITULO_PAGINA']= "";
$matriz['MENSAJE'] = "";
$matriz['MSGTITLE'] = "";
$matriz['MSGTIPO'] = "";
$matriz['CONTENIDO'] = "";
$matriz['JS'] = "";
$matriz['CSS'] = "";
$matriz['USR_INFO'] = "";
$matriz['ROOT_URL'] = ROOT_URL;
//SI ESTA HABILITADO EL ANALITY EJECUTA LO SIGUIENTE
if(GOOGLE_ANALYTICS)
		$matriz['GOOGLE_ANALYTICS'] = $html->html(ROOT_DIR.'html/google_analytics.html');
	else
		$matriz['GOOGLE_ANALYTICS'] = "";
        
/****************************SESSION DE USUARIOS********************************/
$matriz['USR_INFO'] = "";        
        
/****************************MENSAJES GENERALES**********************************/
if(isset($_SESSION['mensaje']))
	{
		if($_SESSION['msgTipo']=="aviso")
			$i['icon']="ui-icon-alert";
		if($_SESSION['msgTipo']=="error")
			$i['icon']="ui-icon-circle-close";
		if($_SESSION['msgTipo']=="ok")
			$i['icon']="ui-icon-circle-check";
		if($_SESSION['msgTipo']=="info")
			$i['icon']="ui-icon-info";
		$matriz['MENSAJE']=$html->html('html/i.html',$i).$_SESSION['mensaje'];
		$matriz['MSGTIPO']=$_SESSION['msgTipo'];
		$matriz['MSGTITLE']=$_SESSION['msgTitle'];
		unset($_SESSION['mensaje']);
		unset($_SESSION['msgTipo']);
		unset($_SESSION['msgTitle']);
	}
/****************************ARCHIVOS CSS Y JS***********************************/
$archivo=basename($_SERVER['PHP_SELF']);
	$archivo=explode(".",$archivo);
	$archivo=$archivo[0];
if (is_file("lib/js/$archivo".".js"))
        $matriz['JS'] .= $html->html("html/js.html",array("src"=>"lib/js/".$archivo.".js"));
?>
