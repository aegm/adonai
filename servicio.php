<?php

/*
 * Archivo Creado por el Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
    session_start();
    /************************************** LIBRERIAS LOCALES *****************************************/
    require_once 'config.php';
    require_once 'wpanel/lib/clases/servicio.class.php';
    require_once 'wpanel/lib/clases/image.class.php';
   


    /*************************************** OJEBTOS LOCALES ******************************************/
    $service = new servicio;
    $img = new image;
    /**************************************************************************************************/	

    include_once('head.php');

    /**************************************** VARIABLES DE MATRIZ **************************************/

    $matriz['TITULO'] .= NOMBRE;
    $matriz['KEYWORDS'] = "";
    $matriz['DESCRIPTION'] = "";
    $matriz['BODY'] = "document.location = '#article'";
    //$matriz['CSS'].=$html->html("html/css.html",array("href"=>"/wschool/css/form.css","media"=>"all"));


    //$matriz['CSS'] .= $html->html("html/css.html",array("href"=>"css/--Colocar archivo--.css","media"=>"all"));
    //$matriz['JS'] .= $html->html("html/js.html",array("src"=>"lib/js/--Colocar archivo--.js"));

    /********************************************* CONTENIDO *******************************************/
    if($_GET['id'])
        $data = $_GET['id'];
    
    $service->listar($data);
    foreach ($service->datos as $ser)
    {
        $img->listar("serv", $ser['id_servicio']);
            if($img->estatus)
            foreach($img->imgFile as $img_ser)
            {
                 $img_serv = $img_ser;
                 
                
            }
        
        $array['SERVICIO'] .= $html->html("html/detalle_servicio.html",array("id"=>$ser['id_servicio'],"NOMBRE"=>$ser['nombre'],"DESCRIPCION"=>$ser['descripcion'],"imagen"=>$img_serv));
    }
    
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);
    /***************************************** MATRIZ **************************************************/
    echo $html->html("html/matriz.html",$matriz);
?>
