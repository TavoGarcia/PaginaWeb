<?php 
//echo "sjj";
include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);



if 
(
    isset($_POST['nombre']) && !empty($_POST['nombre'])
    && isset($_POST['fecha']) && !empty($_POST['fecha'])
    && isset($_POST['docente']) && !empty($_POST['docente'])
    && isset($_POST['sala']) && !empty($_POST['sala'])
    
   
) 
{

    $registrar1 = "INSERT INTO software (nombre_sw)
VALUES ('$_POST[nombre]') ";
    
    mysqli_query($con, $registrar1);
    //echo $registrar1;
    $id=mysqli_insert_id($con);
    //echo $id;
    
$registrar2 = "INSERT INTO detalle_software (fecha_instalacion, id_sw, id_docente, id_sala)
VALUES ('$_POST[fecha]' , $id, '$_POST[docente]' , '$_POST[sala]') ";
       
      
    mysqli_query($con, $registrar2);
   
    	//echo $registrar2;
    
    echo "<script type='text/javascript'> alert('Datos insertados correctamente !!'); 
        window.location='sw.php';</script>";
  		
}

else
{
	echo "nada" ;
}

?>