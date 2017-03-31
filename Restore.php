<?php
include './Connet.php';
include "./conexion.php";

	$restorePoint=SGBD::limpiarCadena($_POST['restorePoint']);
	$sql=explode(";",file_get_contents($restorePoint));
	$totalErrors=0;
	for($i = 0; $i < (count($sql)-1); $i++){
	    if(SGBD::sql("$sql[$i];")){  }else{ $totalErrors++; }
	}
	if($totalErrors<=0){
		echo "<script>alert('Restauración Exitosa');</script>";
		echo "<script>location.href='respaldar.php'</script>";
	}else{
		echo "<script>alert('Ocurrio un error inesperado, no se pudo hacer la restauracion');</script>";
		echo "<script>location.href='respaldar.php'</script>";
	}
