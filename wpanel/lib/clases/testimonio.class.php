<?php
 //session_start();
//require_once('../../../config.php');//prueba de objeto
require_once('dbi.class.php');
require_once('dbi.result.class.php');
 
class testimonio
{
	private $db;
        public $estatus;
        public $mensaje;
	public $msgTipo;
        public $msgTitle;
        public $datos="";
	public $json="";
        public function __construct()
	{
	  $this->db=new db;
	}
	public function listar()
	{
           /* $consulta=$this->db->query("SELECT * FROM");
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
                return $this->estatus;*/
                
	}
        
        public function agregar($txt_test)
        {
            
            $query = "insert into testimonio (testimonio)VALUES('$txt_test')";
            $actualiza = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Agregaron los Registros Correctamente";
                $this->msgTitle = "Datos del Testimonio";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudieron Actualizar los Registros";
                 $this->msgTipo = "error";
                 $this->estatus = false;
            }
            
            return $this->estatus;
        }
        
        public function actualizar(){
            /* $query = "UPDATE emp_datbas SET nombre = '$txt_rsocial',identificacion = '$txt_rif',somos='$txt_somos',mision='$txt_mision',
                                          vision='$txt_vision',telefono='$txt_tel',email_contacto = '$txt_email', email_cobranza = '$txt_emailc' where id_empresa = 1";
            $actualiza = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Actualizaron los Registros Correctamente";
                $this->msgTitle = "Datos de la Empresa";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudieron Actualizar los Registros";
                 $this->msgTipo = "error";
                  $this->estatus = false;
            }
            
            return $this->estatus;*/
        }
        
        public function eliminar($nr_test){
            $query = "DELETE FROM testimonio where id_test = '$nr_test'";
            $elimina = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Elimino el Registro Correctamente";
                $this->msgTitle = "Datos del Testimonio";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudo Actualizar los Registros";
                 $this->msgTitle = "Datos del Testimonio";
                 $this->msgTipo = "error";
                 $this->estatus = false;
            }
              $this->json = json_encode($this);
            return $this->estatus;
            
        }
	
}
//----------------------------------------------------------
// 						PRUEBAS DE LA CLASE

//$emp = new empresa;
//$emp->datBas();
//echo "<br><textarea>".print_r($emp->json,true)."</textarea>";

//----------------------------------------------------------
