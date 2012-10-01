<?php

/*
 * Archivo Creado por el Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
    session_start();
    /************************************** LIBRERIAS LOCALES *****************************************/
    require_once 'config.php';
    /*************************************** OJEBTOS LOCALES ******************************************/

    /**************************************************************************************************/	
    include_once('head.php');
    /**************************************** VARIABLES DE MATRIZ **************************************/

    $matriz['TITULO'] .= NOMBRE;
    $matriz['KEYWORDS'] = "";
    $matriz['DESCRIPTION'] = "";
    $matriz['BODY'] = "inicio";

    /********************************************* CONTENIDO *******************************************/	

    
    $array['CONTACTO'] = $html->html("html/contact.html",array("CORREO"=>$datos->correo,"MISION"=>$datos->mision,"VISION"=>$datos->vision));
    
    
    
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);
    /***************************************** MATRIZ **************************************************/
    echo $html->html("html/matriz.html",$matriz);
?>
