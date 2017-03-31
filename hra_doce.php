<?php
session_start();

if (isset($_SESSION['username']))
{
?>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- css sweet-alert -->
<link rel="stylesheet" href="css/sweetalert.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- font -->
<link href='//fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/sweetalert-dev.js"></script>
<script src="js/sweetalert.min.js"></script>

<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>	
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
						
					</div>
					<div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
						<div class="top-header-right-info">
							<ul>
								
							</ul>
						</div>
						
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="bottom-header">
			<div class="container">
				<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
					<h1><a href="index.html"><img src="" alt="" /></a></h1>
				</div>
				<div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
					<nav class="navbar navbar-default">
						<div class="container">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
                                <!--Color verde #2DCB74 -->
								<li><a href="admin.php" class="active">Volver</a></li>
								
								
							</ul>	
							<div class="clearfix"> </div>
						</div>
					</nav>		
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->
	
	<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="contact-heading"><br><br>
					<h2 class="wow fadeInDown animated" data-wow-delay=".5s">Horarios de Docentes</h2>
					<p class="wow fadeInUp animated" data-wow-delay=".5s"></p>
				</div>
			
			            
              <div class="codes-heading  wow fadeInUp animated" data-wow-delay=".5s">
                        
                                          
                        <form method="post" action="<?php echo $_SERVER["PHP_SELF"];?>" class="navbar-form navbar-right" role="search">
                          <div class="form-group">
                            <input type="text" name="buscar" class="form-control input-lg" placeholder="Buscar...">
                          </div>
                         <button class="btn1 btn-1 btn-1b">Buscar Docente</button>
                        </form>
                        
                    </div><br>
            
            
            <div class="grid_3 grid_4 wow fadeInUp animated table-responsive" data-wow-delay=".5s">
   
									
<?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


<?php 
     $consulta= "select nombre from docente";            
                
   $query = "SELECT nombre_docente, hora_entrada, hora_salida, dia, semestre, nombre_carrera, nombre_sala, nombre_materia FROM docente, materia, detalle_bitacora, sala, carreras WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND carreras.id_carrera=materia.id_carrera
   order by nombre_docente ASC, hora_entrada ASC"; 
                
  if(isset($_POST['buscar'])){
      $buscar = $_POST['buscar'];
      if(empty($buscar)){
        $query = "SELECT nombre_docente, hora_entrada, hora_salida, dia, semestre, nombre_carrera, nombre_sala, nombre_materia FROM docente, materia, detalle_bitacora, sala, carreras WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND carreras.id_carrera=materia.id_carrera
   order by nombre_docente ASC, hora_entrada ASC"; 
        
      }else{
          $query="SELECT nombre_docente, hora_entrada, hora_salida, dia, semestre, nombre_carrera, nombre_sala, nombre_materia FROM docente, materia, detalle_bitacora, sala, carreras
          
WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND carreras.id_carrera=materia.id_carrera

and nombre_docente like '%$buscar%' or nombre_carrera like '%$buscar%' or semestre like '%$buscar%' or hora_entrada like '%$buscar%' or hora_salida like '%$buscar%' or nombre_sala like '%$buscar%' or dia like '%$buscar%' ";
          

      }
      
      
  }
  $resultado=$con->query($query);
               
 ?>

    
    <table class="table table-striped table-condensed cf table-hover">
                                  <thead class="cf">
                                  <tr class="info">

                                        <th>Docente</th>
                                        <th>Hora Entrada</th>
                                        <th>Hora Salida</th>
                                        <th>Día</th>
                                        <th>Materia</th>
                                        <th>Semestre</th>
                                        <th>Carrera</th>
                                        
                                       
                                  </tr>
                      </thead>
                      
                     
               <tr>
             
           <?php  while($row=$resultado->fetch_assoc()){ ?>

  
                   <td data-title="Hora Inicial">
                    <?php echo $row['nombre_docente'];?>
                   </td>
                   
                   <td data-title="Hora Final">
                   <?php echo $row['hora_entrada'];?>
                   </td>
                   
                   <td data-title="Dia">
                   <?php echo $row['hora_salida'];?>
                   </td>
                   
                   <td data-title="Id Materia">
                   <?php echo $row['dia'];?>
                   </td>
                   
                   <td data-title="Id Docente">
                   <?php echo $row['nombre_materia'];?>
                   </td>
                   
                   <td data-title="Id Docente">
                   <?php echo $row['semestre'];?>
                   </td>
                                      
                   <td data-title="Id Aula">
                   <?php echo $row['nombre_carrera'];?>
                   </td>
                   
                   
                   
    </tr>

<?php } ?>
								
							</table>
    
  
 
                       

                        </div>
                  
            
            
		</div>
	</div>
    
     
   
	<!-- footer -->
	
		<div class="container">
			
			<div class="copyright wow fadeInUp animated" data-wow-delay=".5s">
				<p>© 2016 . All Rights Reserved . Design by Gustavo García González</p>
			</div>
		</div>


	<!-- //footer -->
</body>	
</html>
<?php
}
else{
    header('Location: index.php');
}
?>