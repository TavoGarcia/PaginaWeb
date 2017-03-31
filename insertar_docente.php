<?php 

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);



if 
(
    isset($_POST['nip']) && !empty($_POST['nip'])
    && isset($_POST['nombre']) && !empty($_POST['nombre'])
   
) 
{

    $query = "SELECT nip, nombre_docente FROM docente WHERE nip = '$_POST[nip]' or nombre_docente = '$_POST[nombre]'";

    
$result=mysqli_query($con, $query);
    
}

if(mysqli_num_rows($result)>0)
{
	echo "<script type='text/javascript'> alert('ATENCION: Ya existe un Docente con No. de Identificación y/o Nombre similar, Verifique los datos !!');
        window.location='alta_docentes.php';</script>";
}
    
else{
    
    
$registrar = "INSERT INTO docente (nip, nombre_docente, imagen) 
VALUES ('$_POST[nip]','$_POST[nombre]', '$_POST[imagen]') ";
       
      
    mysqli_query($con, $registrar);
   
    
    	echo "<script type='text/javascript'> alert('Datos insertados correctamente !!'); 
        window.location='alta_docentes.php';</script>";
    
    //header('Location: carga_horarios.php');
  		
}


?>