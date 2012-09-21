<?php

/*
 * Archivo Creado por el Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
    session_start();
    /************************************** LIBRERIAS LOCALES *****************************************/
    require_once("../config.php");
    require_once 'lib/funciones.php';
    require_once 'lib/clases/formulario.class.php';
    require_once("lib/clases/reporte.class.php");
    
    /*************************************** OJEBTOS LOCALES ******************************************/

    $reporte = new reporte;
    /**************************************************************************************************/	

    include_once('head.php');

    /**************************************** VARIABLES DE MATRIZ **************************************/

    $matriz['TITULO'] .= "Almacenadora Adonai.";
    $matriz['KEYWORDS'] = "";
    $matriz['DESCRIPTION'] = "";
    $matriz['BODY'] = "inicio";
    $matriz['ROOT_URL'] = ROOT_URL;
    $matriz['CSS'] .= incluir_lib(ROOT_URL."wpanel/css/tabla.css");
    $matriz['CSS'] .= incluir_lib(ROOT_URL."wpanel/lib/upload/uploadifive.css");
    $matriz['JS'] .= incluir_lib(ROOT_URL."wpanel/lib/upload/jquery.uploadifive.min.js");
   
    
    /********************************************* CONTENIDO *******************************************/
    $array['ROOT_URL'] = ROOT_URL;
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);
    /***************************************** IMPRIMIENDO MATRIZ ***************************************/
    echo $html->html("html/matriz.html",$matriz);
    
    

