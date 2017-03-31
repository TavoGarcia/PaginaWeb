<?php 
session_start();

if (isset($_SESSION['username']))
{
?>
<!DOCTYPE html>
<html>
<head>
<title>Sistema de control de bitácoras del ITSM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Around Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="css/lightbox.css">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href='//fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
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
					<h1><a href="index.html"></a></h1>
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
								
                                   <li><a href="cerrar.php" class="active">Cerrar Sesión</a></li>
                                
                            </ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->
	
	<!-- gallery -->
		<div class="gallery">
			<div class="container">
				<div class="gallery-heading">
					<h2>Bienvenido</h2>
					<h4>Estimado administrador le sugerimos eliga una de las siguientes opciones para continuar con la carga de información. Gracias</h4>
				</div>
				
				<div class="gallery-grids">
				
					<div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="alta_docentes.php">
									<img src="images/24.jpg" alt="" />
									<figcaption>
										<h3>Alta de Docentes</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                 
                 <div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="carga_materias.php">
									<img src="images/25.jpg" alt="" />
									<figcaption>
										<h3>Alta de Materias</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                  
                  <div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="carga_horarios.php">
									<img src="images/23.jpg" alt="" />
									<figcaption>
										<h3>Carga de Horarios Académicos</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                  
                   <div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="sw.php">
									<img src="images/software.jpg" alt="" />
									<figcaption>
										<h3>Software Instalado por Salas</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                   
                    <div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="hra_doce.php">
									<img src="images/hora-doce.jpg" alt="" />
									<figcaption>
										<h3>Horario por Docente</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                   
                    <div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="hra_sala.php">
									<img src="images/hora-sala.jpg" alt="" />
									<figcaption>
										<h3>Horarios por Sala</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
                  
                 	<div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="respaldar.php">
									<img src="images/backup.jpg" alt="" />
									<figcaption>
										<h3>Respaldar Base de Datos</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
					
					<div class="col-md-6 gallery-grid wow fadeInUp animated" data-wow-delay=".5s">
						<div class="grid">
							<figure class="effect-apollo">
								<a class="example-image-link" href="bitacora_monitoreo.php">
									<img src="images/monitoreo.jpg" alt="" />
									<figcaption>
										<h3>Bitácora de Monitoreo</h3>
										
									</figcaption>	
								</a>
							</figure>
						</div>
					</div>
					
					
					<div class="clearfix"> </div>
					<script src="js/lightbox-plus-jquery.min.js"> </script>
				</div>
			</div>
		</div>
	<!-- //gallery -->
	
	<!-- footer -->
	
		<div class="container">
			<div class="footer-grids">
				
				<div class="clearfix"> </div>
			</div>
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