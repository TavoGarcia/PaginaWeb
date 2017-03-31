<?php 

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);



if 
(
    isset($_POST['titulo']) && !empty($_POST['titulo'])
    && isset($_POST['descripcion']) && !empty($_POST['descripcion'])
    && isset($_POST['fecha']) && !empty($_POST['fecha'])
    && isset($_POST['imagen']) && !empty($_POST['imagen'])
    
) 
{

$registrar = "INSERT INTO noticias (Id_Noticias, Titulo, Descripcion, Fecha, Imagen) 
VALUES  (null,'$_POST[titulo]', '$_POST[descripcion]', '$_POST[fecha]', '$_POST[imagen]') ";
    
    
      
    mysqli_query($con, $registrar);
    
    echo "<script type='text/javascript'> alert('Datos insertados correctamente !!'); 
        window.location='carga_noticias.php';</script>";
   
  //  header('Location: carga_noticias.php');
  		
}

else
{
	 echo "<script type='text/javascript'> alert('Verifique los datos !!'); 
        window.location='carga_noticias.php';</script>";
   
}

?>