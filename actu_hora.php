<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
    $resultado='';
    $id= $_POST['id_bitacora'];
  if 
(
    isset($_POST['entrada']) && !empty($_POST['entrada'])
    && isset($_POST['salida']) && !empty($_POST['salida'])
    && isset($_POST['dia']) && !empty($_POST['dia'])
    && isset($_POST['grupo']) && !empty($_POST['grupo'])
    && isset($_POST['carrera']) && !empty($_POST['carrera'])
    && isset($_POST['materia']) && !empty($_POST['materia'])
    && isset($_POST['sala']) && !empty($_POST['sala'])
    && isset($_POST['docente']) && !empty($_POST['docente'])
) 
{

$actu="UPDATE materia,detalle_bitacora SET
	 id_bitacora='$_POST[id_bitacora]',
     hora_entrada='$_POST[entrada]',
	 hora_salida='$_POST[salida]',
     dia='$_POST[dia]',
     semestre='$_POST[grupo]', 
	 detalle_bitacora.id_materia='$_POST[materia]', 
     id_carrera='$_POST[carrera]',
	 id_sala='$_POST[sala]',
     id_docente='$_POST[docente]'

	 WHERE id_bitacora=$id AND materia.id_materia='$_POST[materia]'";
    
    //echo $actu;
	
	$resultado=$con->query($actu);
    
    //echo $resultado;
    echo "<script type='text/javascript'> alert('Datos Actualizados correctamente !!'); 
        window.location='carga_horarios.php';</script>";
}


else{

		
	
    
    echo "error";
   
    
}
    
	
?>

			
			