<?php

/*
 * Autor: Ing. Angel Gonzalez
 * Correo: angeledugo@gmail.com
 */
@session_start();

require_once('../config.php');
require_once("lib/clases/usr.class.php");
require_once("lib/clases/menu.class.php");
require_once("lib/funciones.php");
function login($usuario,$clave)
{
	$user = new usuario;
	
	if(!$user->login($usuario,$clave))
	{
		$_SESSION['mensaje']=$user->mensaje;
		$_SESSION['msgTipo']=$user->msgTipo;
		$_SESSION['msgTitle']=$user->msgTitle;
		return false;
	}
	else
	{
            $menu = new menu;
            $menu->iniciar($user->id_grupo);
		return 'empresa.php';
	}
}

if(isset($_POST)&&count($_POST)){
	$form_error = false;
	
	foreach($_POST as $i => $valor)
		$$i = escapar($valor);
	
	switch($_POST['form']){
		case 'login':
                    if(!$ty_redirect_to = login($usuario,$clave))
				$form_error = true;
				
			$error_redirect_to = $pagina;

		break;
                default:
			$_SESSION['mensaje'] = 'Formulario especificado no es válido. Póngase en contacto con nosotros si tiene alguna pregunta.';
			$_SESSION['msgTipo']="error";
			header("Location: index.php");
			exit();
			break;
	}
	$lang_dir = '';
	
	if($form_error)
	{
		$_SESSION[$_POST['form']] = $_POST;
		header("Location: ".$lang_dir.$error_redirect_to);
		exit();
	}
	try
	{
		//$user = UserFactory::getUserType($_POST);
		//$user->email();
		
		//$admin = AdminFactory::getAdminType($_POST);
		//$admin->notify();

		//$subscriber = SubscriberFactory::getSubscriberType($_POST);
		//$subscriber->subscribe();

		unset($_SESSION[$_POST['form']]);
		header("Location: ".$lang_dir.$ty_redirect_to);

	}
	catch(Exception $e)
	{
		$_SESSION['active_form'] = $_POST['form'];
		$_SESSION[$_POST['form']] = $_POST;
		$_SESSION['mensaje'] = 'Error inesperado al intentar procesar su solicitud. Por favor, inténtelo de nuevo más tarde.';
		header("Location: ".$lang_dir.$error_redirect_to);
	}     
}
                
?>
