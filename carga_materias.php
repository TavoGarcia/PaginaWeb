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

    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
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
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
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
                                <li><a href="admin.php" class="active">Menú Principal</a></li>
                                <li><a href="alta_docentes.php" class="active">Docentes</a></li>
                                <li><a href="carga_materias.php" class="active">Materias</a></li>
                                <li><a href="carga_horarios.php" class="active">Horarios</a></li>
                                <li><a href="sw.php" class="active">Software Instalado</a></li>
                                <li><a href="hra_doce.php" class="active">Horario por Docentes</a></li>
                                <li><a href="hra_sala.php" class="active">Horario por Salas</a></li>
                                <li><a href="respaldar.php" class="active">Respaldos y Restauraciones</a></li>
                                <li><a href="bitacora_monitoreo.php" class="active">Bitácora de Monitoreo</a></li>

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
                <h2 class="wow fadeInDown animated" data-wow-delay=".5s">Carga de Materias</h2>
                <p class="wow fadeInUp animated" data-wow-delay=".5s">Por favor llene cada una de las siguientes casillas </p>
            </div>



            <div class="contact-form wow fadeInUp animated" data-wow-delay=".5s">


                <form action="insertar_materias.php" method="post">

                    <input type="text" name="materia" placeholder="Nombre de la Materia" required>

                    <select type="text" class="contact-form" name="carrera" required>
                        <option>Seleccione una Carrera</option>
                        <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select id_carrera, nombre_carrera from carreras";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_carrera'] ?>"><?php echo $row['nombre_carrera'] ?></option>
                          <?php } }?>
                    </select>

                    <br>
                    <br>

                    <button class="btn1 btn-1 btn-1b">Guardar</button>
                    <button type="reset" class="btn1 btn-1 btn-1b">Limpiar</button>

                </form>
            </div>

            <div class="codes-heading  wow fadeInUp animated" data-wow-delay=".5s">


                <form method="post" action="<?php echo $_SERVER[" PHP_SELF "];?>" class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" name="buscar" class="form-control input-lg" placeholder="Buscar...">
                    </div>
                    <button class="btn1 btn-1 btn-1b">Buscar Materia</button>
                </form>

            </div><br>


            <div class="grid_3 grid_4 wow fadeInUp animated table-responsive" data-wow-delay=".5s">


                <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                    <?php 
   $query = "SELECT * from materia, carreras where materia.id_carrera=carreras.id_carrera"; 
  if(isset($_POST['buscar'])){
      $buscar = $_POST['buscar'];
      if(empty($buscar)){
        $query = "SELECT * from materia"; 
        
      }else{
          $query="SELECT * from materia, carreras where materia.id_carrera=carreras.id_carrera and nombre_materia like '%$buscar%' or nombre_carrera like '%$buscar%'";
          
        //$query="SELECT Nombre_s, Apellido_Pat, Apellido_Mat, Nombre_Aula, Hra_Inicial, Hra_Final, Dia, //Carrera, Nombre FROM docente, horarios, aula, materia 
        //WHERE Nombre_s like '%$buscar%' or Apellido_Pat like '%$buscar%' or Apellido_Mat like //'%$buscar%' or Dia like '%$buscar%' or Carrera like '%$buscar%' or Nombre like '%$buscar%'";
      }
      
      
  }
  $resultado=$con->query($query);
 ?>


                    <br>
                    <table class="table table-striped table-condensed cf table-hover">
                        <thead class="cf">
                            <tr class="info">


                                <th>Nombre de la Materia</th>
                                <th>Carrera Perteneciente</th>

                                <th>Acciones a Realizar</th>

                            </tr>
                        </thead>


                        <tr>

                            <?php  while($row=$resultado->fetch_assoc()){ ?>

                            <td data-title="ID">
                                <?php echo $row['nombre_materia'];?>
                            </td>

                            <td data-title="NIP">
                                <?php echo $row['nombre_carrera'];?>
                            </td>



                            <td data-title="Actualizar">

                                <button class="btn btn-primary btn-xs">
    
        <i class="fa fa-refresh">
        </i>
           <!-- El NIP es el nombre de la caja de texto en el FORM -->
            <a href="actualiza_materia.php?id_materia=<?php echo $row['id_materia'];?>">Actualizar</a>
    </button>



                            </td>


                        </tr>

                        <?php } ?>

                    </table>
            </div>



        </div>
    </div>

    <!-- //contact -->

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
