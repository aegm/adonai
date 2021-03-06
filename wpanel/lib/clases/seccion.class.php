<?php
 //session_start();
//require_once('../../../config.php');//prueba de objeto
require_once('dbi.class.php');
require_once('dbi.result.class.php');
 
class seccion
{
	private $db;
        public $estatus;
        public $mensaje;
	public $msgTipo;
        public $msgTitle;
        public $instalacion;
        public $cobertura;
        public $datos="";
	public $json="";
        public function __construct()
	{
	  $this->db=new db;
	}
	public function listar($data)
	{
            
            
            $consulta=$this->db->query("SELECT * FROM secciones where id_seccion = '1'");
               
            if($consulta->num_rows==0)
		{
			$this->mensaje = "No se encontraron eventos...";
			$this->msgTipo = "aviso";
			$this->estatus = false;
			$this->json = json_encode($this);
			return $this->estatus;
		}
               while($consultas = $consulta->fetch_assoc())
                {
                   $this->instalacion = $consultas['instalaciones'];
                   $this->cobertura = $consultas['cobertura'];
                    $this->mensaje="Se Mostraron los datos correctamente";
                    $this->msgTipo="ok";
                    $this->estatus = true;
                    $this->json = json_encode($this);
                }
               
                return $this->estatus;
                
	}
        
        public function actualizaInstalacion($txt_instalacion)
        {
            
            $query = "UPDATE secciones SET instalaciones = '$txt_instalacion' where id_seccion = '1'";
            $actualiza = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Agregaron los Registros Correctamente";
                $this->msgTitle = "Datos de las Instalaciones";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudieron Actualizar los Registros";
                 $this->msgTipo = "error";
                 $this->estatus = false;
            }
            
            return $this->estatus;
        }
        
         public function actualizaCobertura($txt_cobertura)
        {
            
            $query = "UPDATE secciones SET cobertura = '$txt_cobertura' where id_seccion = '1'";
            $actualiza = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Agregaron los Registros Correctamente";
                $this->msgTitle = "Datos de la Cobertura";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudieron Actualizar los Registros";
                 $this->msgTipo = "error";
                 $this->estatus = false;
            }
            
            return $this->estatus;
        }
        
        public function actualizar($txt_titulo, $txt_descrip, $evento){
            $query = "UPDATE eventos SET titulo_evento = '$txt_titulo',descripcion = '$txt_descrip' where id_evento = $evento";
            $actualiza = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Actualizaron los Registros Correctamente";
                $this->msgTitle = "Datos del Evento";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudieron Actualizar los Registros";
                 $this->msgTipo = "error";
                 $this->estatus = false;
            }
            
            return $this->estatus;
        }
        
          public function eliminar($nr_evento){
           $query = "DELETE FROM eventos where id_evento = '$nr_evento'";
            $elimina = $this->db->query($query);
            if(!$this->db->errno){
                $this->mensaje = "Se Elimino el Registro Correctamente";
                $this->msgTitle = "Datos del Evento";
                $this->msgTipo = "ok";
                $this->estatus = true;
            }else{
                 $this->mensaje = "No se Pudo Actualizar los Registros";
                 $this->msgTitle = "Datos del Evento";
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
