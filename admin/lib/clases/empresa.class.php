<?php
 //session_start();
//require_once('../../../config.php');//prueba de objeto
require_once('dbi.class.php');
require_once('dbi.result.class.php');
 
class empresa
{
	private $db;
	public $rsocial;
        public $identificacion;
        public $somos;
        public $mision;
        public $vision;
        public $telefono;
        public $correo;
        public $email;
        public $estatus;
        public $mensaje;
	public $msgTipo;
        public $datos="";
	public $json="";
        public function __construct()
	{
	  $this->db=new db;
	}
	public function datBas()
	{
            $consulta=$this->db->query("SELECT * FROM emp_datbas");
                if ($datos = $consulta->fetch_assoc())
                {
                    
                    $this->rsocial = $datos['nombre'];
                    $this->identificacion = $datos['identificacion'];
                    $this->somos = $datos['somos'];
                    $this->mision = $datos['mision'];
                    $this->vision = $datos['vision'];
                    $this->telefono = $datos['somos'];
                    $this->correo = $datos['email_contacto'];
                    $this->email = $datos['email_cobranza'];
                    $this->mensaje="Se Mostraron los datos correctamente";
                    $this->msgTipo="ok";
                    $this->estatus = true;
                    $this->json = json_encode($this);
                }
                return $this->estatus;
                
	}
	
}
//----------------------------------------------------------
// 						PRUEBAS DE LA CLASE

//$emp = new empresa;
//$emp->datBas();
//echo "<br><textarea>".print_r($emp->json,true)."</textarea>";

//----------------------------------------------------------
