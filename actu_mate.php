<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
$resultado='';

if 
(
    isset($_POST['nombre']) && !empty($_POST['nombre'])
    && isset($_POST['carrera']) && !empty($_POST['carrera'])
    
    
) 
{
			
	$query="UPDATE materia SET
	 id_materia='$_POST[id]',
     nombre_materia='$_POST[nombre]',
	 id_carrera='$_POST[carrera]'
	 

	 WHERE id_Materia='$_POST[id]'";
	
	$resultado=$con->query($query);
    
    header('Location: carga_materias.php');
    
}

elseif ($resultado>0)
{
    
    header('Location: carga_materias.php');
    
}

else
{
    echo "error";
}
	
?>

			
			