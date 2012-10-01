<?php
@session_start();
require_once("wpanel/lib/clases/plantilla.class.php");
require_once("lib/PHPMailer/class.phpmailer.php");
require_once("wpanel/lib/funciones.php");
require_once('config.php');
//error_reporting(0);

if(isset($_POST)&&count($_POST)){
	$form_error = false;
	
	foreach($_POST as $i => $valor)
		$$i = escapar($valor);
	
	switch($_POST['form']){
		case 'contact':
                        $_SESSION['mensaje']="";
			if(!$phone)
			{
				$_SESSION['mensaje'].="* Por favor, coloque un telefono...<br>";
				$_SESSION['msgTipo']="error";
				$_SESSION['msgTitle']="error";
				$form_error=true;
			}
			if(!PHPMailer::ValidateAddress($email))
			{
				$_SESSION['mensaje'].="* Por favor, coloque un correo electrónico válido...<br>";
				$_SESSION['msgTipo']="error";
				$_SESSION['msgTitle']="error";
				$form_error=true;
			}
			if(!$name)
			{
				$_SESSION['mensaje'].="* Por favor, coloque su nombre...<br>";
				$_SESSION['msgTipo']="error";
				$_SESSION['msgTitle']="error";
				$form_error=true;
			}
			if(!$comments)
			{
				$_SESSION['mensaje'].="* Por favor, especifique su comentario...<br>";
				$_SESSION['msgTipo']="error";
				$_SESSION['msgTitle']="error";
				$form_error=true;
			}
                       
                       
			if(!$form_error)
			{
				
                            $message="<h2>Información de Contacto Almacenadora Adonai</h2>";
				foreach($_POST as $campo => $valor)
				{
					if($campo!="form")
					$message.="<strong>$campo: </strong>$valor<br>";
				}
				$html=new plantilla;
				$html->leer("html/mail.html");
				$html->vars(array("BODY"=>$message));
				$message=$html->mostrar();
				
				$para='social@almacenadoraadonai.com ';
				//$para='gilberto.amb@gmail.com';
				$asunto="Contacto Almacenadora Adonai";
				
				$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
				$cabeceras .= 'Content-type: text/html; charset=utf-8' . "\r\n";
				$cabeceras .= 'From: '.$name.' <'.$email.'>' . "\r\n";
				
				if(!mail($para, $asunto, $message, $cabeceras))
				{
					$form_error=true;
					$_SESSION['mensaje'] = "An unexpected error ocurred when trying to process your request. Please try again later.";
					$_SESSION['msgTipo']="error";
					$_SESSION['msgTitle']="error";
				}
				else
				{
					$_SESSION['mensaje'] = "Tu mensaje ha sido enviado correctamente...";
					$_SESSION['msgTipo']="ok";
					$_SESSION['msgTitle']="ok";
				}
			}
			$error_redirect_to = 'contacto.php';
			$ty_redirect_to = 'contacto.php';
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