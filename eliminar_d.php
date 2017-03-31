<?php 
	
	include("conexion.php");
    $con=mysqli_connect($host, $user, $pw, $db);
$resultado='';


    $id_doce = $_GET['id_docente'];
    
	$query="DELETE FROM docente WHERE id_docente='$_GET[id_docente]'";
	
    $resultado=$con->query($query);
	
?>

			<?php 
				if($resultado>0){
				?>
				
							
				<?php 	
                
echo "<script type='text/javascript'> alert('¿Desea ELIMINAR este campo?'); 
        window.location='alta_docentes.php';</script>";
				}

else{ ?>
				
				
				
			<?php	} ?>
			
			
			