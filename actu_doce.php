<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
$resultado='';

if 
(
    isset($_POST['nip']) && !empty($_POST['nip'])
    &&isset($_POST['nombre']) && !empty($_POST['nombre'])
        
) 
{
         // UPDATE docente SET nip = '1014' WHERE nip = 1012 
	$query="UPDATE docente SET 
    id_docente='$_POST[id_docente]',
    nip='$_POST[nip]', 
    nombre_docente='$_POST[nombre]'
    
    WHERE id_docente='$_POST[id_docente]'";
	
	$resultado=$con->query($query);
    
    header('Location: alta_docentes.php');
    
}

elseif ($resultado>0)
{
    
    header('Location: alta_docentes.php');
    
}

else
{
    echo "error";
}
	
?>
