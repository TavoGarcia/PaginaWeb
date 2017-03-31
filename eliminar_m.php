<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
$resultado='';


   $id_mate = $_GET['id_materia'];
    
	$query="DELETE FROM materia WHERE id_materia='$_GET[id_materia]'";
	
$resultado=$con->query($query);
	
?>

			<?php 
				if($resultado>0){
                    
				?>
				
							
				<?php 	

echo "<script type='text/javascript'> alert('¿Desea ELIMINAR este campo?'); 
        window.location='carga_materias.php';</script>";
				}else{ ?>
				
				<h1>Poner mensaje  </h1>
				
			<?php	} ?>
			
			
			