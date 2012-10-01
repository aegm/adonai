<?php

/*
 * Archivo Creado por el Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
    session_start();
    /************************************** LIBRERIAS LOCALES *****************************************/
    require_once 'config.php';
    require_once 'wpanel/lib/clases/noticia.class.php';
    require_once 'wpanel/lib/clases/evento.class.php';
    require_once 'wpanel/lib/clases/servicio.class.php';
    require_once 'wpanel/lib/clases/image.class.php';
    require_once 'wpanel/lib/clases/testimonio.class.php';

    /*************************************** OJEBTOS LOCALES ******************************************/
    $noti = new noticia;
    $even = new evento;
    $service = new servicio;
    $img = new image;
    $test = new testimonio;

    /**************************************************************************************************/	

    include_once('head.php');

    /**************************************** VARIABLES DE MATRIZ **************************************/

    $matriz['TITULO'] .= NOMBRE;
    $matriz['KEYWORDS'] = "";
    $matriz['DESCRIPTION'] = "";
    $matriz['BODY'] = "inicio";
    //$matriz['CSS'].=$html->html("html/css.html",array("href"=>"/wschool/css/form.css","media"=>"all"));


    //$matriz['CSS'] .= $html->html("html/css.html",array("href"=>"css/--Colocar archivo--.css","media"=>"all"));
    //$matriz['JS'] .= $html->html("html/js.html",array("src"=>"lib/js/--Colocar archivo--.js"));

    /********************************************* CONTENIDO *******************************************/	
    //INSERTANDO LAS NOTICIAS DESTACADAS
    $array['NOTICIAS'] = "";
    $noti->listar($data);
    if($noti->estatus)
        foreach ($noti->datos as $noticias)
        {
            $img->listar("noti", $noticias['id_noticia']);
            if($img->estatus)
            foreach($img->imgFile as $img_noti)
            {
                $img_noticias = $img_noti;
                
            }

        $array['NOTICIAS'] .= $html->html("html/noticias.html",array("id"=>$noticias['id_noticia'],"titulo"=>$noticias['titulo'],"descripcion"=>$noticias['descripcion'],"fecha" => $noticias['fecha'],"imagen"=>$img_noticias));
        }
        
      //INSERTANDO LOS EVENTOS DESTACADAS
    $array['EVENTOS'] = "";
    $even->listar($data);
    if($noti->estatus)
        foreach ($even->datos as $eventos)
        {
        $img->listar("serv", $eventos['id_evento']);
            if($img->estatus)
            foreach($img->imgFile as $img_eve)
            {
                $img_eventos = $img_eve;
                
            }
        
        
        $array['EVENTOS'] .= $html->html("html/eventos.html",array("id"=>$eventos['id_evento'],"titulo"=>$eventos['titulo_evento'],"descripcion"=>$eventos['descripcion'],"fecha" => $eventos['fecha'],"imagen"=>$img_noticias));
        }   
    
    
    
    //INSERTANDO LOS SERVICIOS DESTACADOS
    $array['SERVICIOS'] = "";
    $service->listar($data);
    if($service->estatus)
    {
        foreach ($service->datos as $services)
           {
            $array['SERVICIOS'] .= $html->html("html/servicios_destacados.html",array("id"=>$services['id_servicio'],"titulo"=>$services['nombre'],"descripcion"=>$services['descripcion']));
           }
           
    }
    
    //INSTANCIONADO LOS TESTIMONIOS
    $array['TESTIMONIO'] = "";
    $test->listar($data);
    if($test->estatus)
    {
        foreach ($test->datos as $testis)
           {
            $array['TESTIMONIO'] .= $html->html("html/testimonio_destacados.html",array("id"=>$testis['id_test'],"titulo"=>$testis['testimonio']));
           }
           
    }
    
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);    
    /***************************************** MATRIZ **************************************************/
    echo $html->html("html/matriz.html",$matriz);
?>
