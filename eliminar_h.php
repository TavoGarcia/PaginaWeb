<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
    $resultado='';


   $id_hora = $_GET['id_bitacora'];
    
	$query="DELETE FROM detalle_bitacora WHERE id_bitacora='$_GET[id_bitacora]'";
	
    $resultado=$con->query($query);
	
?>

			<?php 
				if($resultado>0){
				?>
				
							
				<?php 	


echo "<script type='text/javascript'> alert('¿Desea ELIMINAR este campo?'); 
        window.location='carga_horarios.php';</script>";
				}else{ ?>
				
				
				
			<?php	} ?>
			
			
			