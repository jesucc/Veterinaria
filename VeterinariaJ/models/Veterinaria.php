<?php

require_once 'Conexion.php';

class Veterinaria extends Conexion{
  
  private $acceso;

  public function __CONSTRUCT(){
    $this->acceso = parent::getConnection();

  }

  public function clientesRegistrar($data = []){
    try{
      $query = $this->acceso->prepare("CALL spu_clientes_registrar(?,?,?,?)");
      $query->execute(
        array(
          $data['apellidos'],
          $data['nombres'],
          $data['dni'],
          $data['claveacceso'],
        )
      );

    }catch(Exception $e){
      die($e->getMessage());
  
    }
  
  }

  public function mascotaRegistrar($data = []){
    try{
      $query = $this->acceso->prepare("CALL spu_mascota_registrar(?,?,?,?,?,?)");
      $query->execute(
        array(
          $data['idcliente'],
          $data['idraza'],
          $data['nombre'],
          $data['fotografia'],
          $data['color'],
          $data['genero']
        )
      );
  
    }catch(Exception $e){
      die($e->getMessage());
  
    }
  
  }

  public function buscarCliente($dni = 0){
      try{
        $query = $this->acceso->prepare("CALL spu_buscar_cliente(?)");
        $query->execute(array($dni));
        return $query->fetch(PDO::FETCH_ASSOC);
        
      }catch(Exception $e){
        die($e->getMessage());
      }

  }

  

  public function listarMascota(){
    try{
      $query = $this->acceso->prepare("CALL spu_listar_mascota()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
      
    }catch(Exception $e){
      die($e->getMessage());
    }

  }


  public function listarRaza(){
    try{
      $query = $this->acceso->prepare("CALL spu_listar_raza()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
      
    }catch(Exception $e){
      die($e->getMessage());
    }

  }

}





?>