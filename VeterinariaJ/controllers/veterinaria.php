<?php

require_once '../models/Veterinaria.php';

$veterinaria = new Veterinaria();

if(isset($_POST['operacion'])){


  if($_POST['operacion'] == 'clientesRegistrar'){

    $register = [
      "apellidos" => $_POST["apellidos"],
      "nombres"   => $_POST["nombres"],
      "dni"       => $_POST["dni"],
      "claveacceso" => password_hash($_POST["claveacceso"], PASSWORD_BCRYPT) 
    ];

    $veterinaria->clientesRegistrar($register);
  }

   if($_POST['operacion'] == 'mascotaRegistrar'){

    $register = [
      "idcliente"   => $_POST["idcliente"],
      "idraza"      => $_POST["idraza"],
      "nombre"      => $_POST["nombre"],
      "fotografia"  => $_POST["fotografia"],
      "color"       => $_POST["color"],
      "genero"      => $_POST["genero"],
    ];

    $veterinaria->mascotaRegistrar($register);
  }
  
  if($_POST['operacion'] == 'buscarCliente'){
    $data = $veterinaria->buscarCliente($_POST['dni']);

    echo json_encode($data);

  }

  if($_POST['operacion'] == 'listarMascota'){
    $data = $veterinaria->listarMascota();

    echo json_encode($data);

  }

}


  

if(isset($_GET['operacion'])){


  if($_GET['operacion'] == 'listarMascota'){
    $data = $veterinaria->listarMascota();

    echo json_encode($data);

  }


  if($_GET['operacion'] == 'getRazas'){
    $data = $veterinaria->listarMascota();

    echo json_encode($data);

  }



}


?>