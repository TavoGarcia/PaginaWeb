<?php 

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);


if 
(
    isset($_POST['entrada']) && !empty($_POST['entrada'])
    && isset($_POST['salida']) && !empty($_POST['salida'])
    && isset($_POST['dia']) && !empty($_POST['dia'])
    && isset($_POST['grupo']) && !empty($_POST['grupo'])
    && isset($_POST['materia']) && !empty($_POST['materia'])
    && isset($_POST['sala']) && !empty($_POST['sala'])
    && isset($_POST['docente']) && !empty($_POST['docente'])
) 
{

$query = "SELECT id_bitacora, hora_entrada, hora_salida, dia, detalle_bitacora.id_sala
FROM detalle_bitacora
WHERE dia = '$_POST[dia]' and hora_entrada = '$_POST[entrada]' and detalle_bitacora.id_sala = '$_POST[sala]'";

    
$result=mysqli_query($con, $query);
    
    
}

if(mysqli_num_rows($result)>0)
{
	echo "<script type='text/javascript'> alert('ATENCION: Ya existe un horario asignado el mismo día a esta sala !!'); 
    window.location='carga_horarios.php';</script>"; 
}

else{
    
        
    
    $query = "INSERT INTO detalle_bitacora (id_bitacora, hora_entrada, hora_salida, dia, semestre, id_materia, id_docente, id_sala) VALUES (NULL, '$_POST[entrada]', '$_POST[salida]', '$_POST[dia]', '$_POST[grupo]', '$_POST[materia]', '$_POST[docente]', '$_POST[sala]')";
    
    
    mysqli_query($con, $query);
    
   
    echo "<script type='text/javascript'> alert('DATOS insertados correctamente !!'); 
    window.location='carga_horarios.php';</script>"; 
    
    
   
}

?>