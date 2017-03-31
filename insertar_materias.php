<?php 

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);



if 
(
    isset($_POST['materia']) && !empty($_POST['materia'])
    && isset($_POST['carrera']) && !empty($_POST['carrera'])
    
        
) 
{
    $query = "INSERT INTO materia (nombre_materia, id_carrera) VALUES ('$_POST[materia]','$_POST[carrera]')";
       
 
    mysqli_query($con, $query);
    
   
    	echo "<script type='text/javascript'> alert('Datos insertados correctamente !!'); 
        window.location='carga_materias.php';</script>";
    
    //header('Location: carga_horarios.php');
  		
}

else
{
	echo "Debes llenar todos los campos";
}

?>