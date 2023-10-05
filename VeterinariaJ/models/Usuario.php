<?php

require_once 'Conexion.php';

class Usuario extends Conexion{
  
  private $acceso;

  public function __CONSTRUCT(){
    $this->acceso = parent::getConnection();

  }

  public function login ($dni = ""){
    try{
        $query = $this->acceso->prepare("CALL spu_login(?)");
        $query->execute(array($dni));

        return $query->fetch(PDO::FETCH_ASSOC);

    }
    catch(Exception $err){
        die($err->getMessage());

    }

  }

}

?>