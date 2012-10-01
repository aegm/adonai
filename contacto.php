<?php

/*
 * Archivo Creado por el Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
    session_start();
    /************************************** LIBRERIAS LOCALES *****************************************/
    require_once 'config.php';
    require_once 'wpanel/lib/clases/empresa.class.php'; 
    /*************************************** OJEBTOS LOCALES ******************************************/
    $dat_bas = new empresa;
    /**************************************************************************************************/	
    include_once('head.php');
    /**************************************** VARIABLES DE MATRIZ **************************************/

    $matriz['TITULO'] .= NOMBRE;
    $matriz['KEYWORDS'] = "";
    $matriz['DESCRIPTION'] = "";
    $matriz['BODY'] = "";

    /********************************************* CONTENIDO *******************************************/	

    
    $array['CONTACTO'] = $html->html("html/contact.html",array("CORREO"=>$datos->correo,"MISION"=>$datos->mision,"VISION"=>$datos->vision));
    
    $dat_bas->datBas();
    $array['CORREO']  = $dat_bas->correo;
    $array['TELEFONO']  = $dat_bas->telefono;
    $array['ROOT_URL']  = ROOT_URL;
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);
    /***************************************** MATRIZ **************************************************/
    echo $html->html("html/matriz.html",$matriz);
?>
