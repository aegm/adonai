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
    require_once 'lib/clases/empresa.class.php';
    require_once("lib/clases/reporte.class.php");
    
    /*************************************** OJEBTOS LOCALES ******************************************/
    $emp = new empresa;
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
    
    /********************************************* CONTENIDO *******************************************/
    //LISTANDO LAS NOTICIAS
    $array['cabezas'] = "";
    $array['registros'] = "";
    $datos['tabla'] = "";
    
    $l = 100;
    $tabla = "noticias";
    $c = array("titulo","descripcion","contenido","status");
    $p = 1;
    $id = "id_noticia";
    $reporte->generar($tabla,$f,$o,$c,$l,$p,$id);
    if($reporte->estatus)
    {
            $array['registros'] = "";
            foreach($reporte->datos as $registro)
            {
                    $campos = "";
                        $i++;
                        foreach($registro as $campo => $valor)
                        {
                            $atributos = "";
                            $formato = substr(strstr($campo, '..'), 2);
                            print_r($formato);
                            $valor = formato($formato,$valor);
                            $array['cabezas'] .= $html->html("html/cabeza_tabla.html",array("cabeza"=>str_replace("..".extension($campo),"",$campo)));
                            
                            $campos .= $html->html("html/campo_tabla.html",array("campo"=>$valor,"atributos"=>$atributos));
                        }
                        $array['registros'] .= $html->html("html/lista_tabla.html",array("tabla"=>$tabla,"id"=>$registro['ID'],"i"=>$i,"campos"=>$campos,"clase"=>$clase));
            }
    }
  
    
    //ADICIONANDO EL FORMULARIO PARA AGREGAR UNA NOTICIA O EDITARLA
   
    //$emp->datBas();
    //$array['FORMULARIO'] = formulario_html('frm_empresa',array("txt_rsocial"=>$emp->rsocial,"txt_rif"=>$emp->identificacion,"txt_somos"=>$emp->somos,"txt_mision"=>$emp->mision,"txt_vision"=>$emp->vision,"txt_tel"=>$emp->telefono,"txt_email"=>$emp->correo,"txt_emailc"=>$emp->email));
    $matriz['CONTENIDO'] = $html->html("html/$archivo.html",$array);
    /***************************************** IMPRIMIENDO MATRIZ ***************************************/
    echo $html->html("html/matriz.html",$matriz);
    
    

