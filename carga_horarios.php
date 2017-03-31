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
                <div class="logo wow fadeInDown animated" data-wow-delay=".5s">
                    <h1>
                        <a href="index.html"><img src="" alt="" /></a>
                    </h1>
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
                <h2 class="wow fadeInDown animated" data-wow-delay=".5s">Carga de Horarios Académicos</h2>
                <p class="wow fadeInUp animated" data-wow-delay=".5s">Por favor llene cada una de las siguientes casillas </p>
            </div>



            <div class="contact-form wow fadeInUp animated" data-wow-delay=".5s">
                <h4></h4>
                <form action="insertar_horarios.php" method="post">

                    <select class="contact-form" name="entrada">
                         <option>Seleccione un hora de entrada</option>
                         <option>07:00:00</option>
                         <option>08:00:00</option>
                         <option>09:00:00</option>
                         <option>10:00:00</option>
                         <option>11:00:00</option>
                         <option>12:00:00</option>
                         <option>13:00:00</option>
                         <option>14:00:00</option>
                         <option>15:00:00</option>
                         <option>16:00:00</option>
                         <option>17:00:00</option>
                         <option>18:00:00</option>
                         <option>19:00:00</option>
                    </select>
                    <select class="contact-form" name="salida">
                         <option>Seleccione un hora de salida</option>
                         <option>07:00:00</option>
                         <option>08:00:00</option>
                         <option>09:00:00</option>
                         <option>10:00:00</option>
                         <option>11:00:00</option>
                         <option>12:00:00</option>
                         <option>13:00:00</option>
                         <option>14:00:00</option>
                         <option>15:00:00</option>
                         <option>16:00:00</option>
                         <option>17:00:00</option>
                         <option>18:00:00</option>
                         <option>19:00:00</option>
                    </select>

                    <select class="contact-form" name="dia">
                         <option>Seleccione un día de la semana</option>
                         <option>Lunes</option>
                         <option>Martes</option>
                         <option>Miercoles</option>
                         <option>Jueves</option>
                         <option>Viernes</option>  
                    </select>

                    <!-- TABLA MATERIA -->
                    <select class="contact-form" name="grupo">
                         <option>Semestre</option>
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                         <option>5</option>
                         <option>6</option>
                         <option>7</option>
                         <option>8</option>
                         <option>9</option>
                         <option>10</option>
                         <option>11</option>
                         <option>12</option>
                    </select>

                    <select type="text" class="contact-form" name="materia" required>
                        <option>Materia a Impartir</option>
                        <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select id_materia, nombre_materia from materia";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_materia'] ?>"><?php echo $row['nombre_materia'] ?></option>
                          <?php } }?>
                    </select>



                    <select class="contact-form" name="sala">
                         <option>Seleccione una Sala</option>
                         <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select id_sala, nombre_sala from sala";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_sala'] ?>"><?php echo $row['nombre_sala'] ?></option>
                          <?php } }?>
                    </select>

                    <select type="text" class="contact-form" name="docente" required>
                        <option>Seleccione el Docente</option>
                        <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select id_docente, nombre_docente from docente";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_docente'] ?>"><?php echo $row['nombre_docente'] ?></option>
                          <?php } }?>
                    </select>
                    <br>

                    <button class="btn1 btn-1 btn-1b">Guardar</button>

                </form>
            </div>

            <div class="codes-heading  wow fadeInUp animated" data-wow-delay=".5s">


                <form method="post" action="<?php echo $_SERVER['SCRIPT_NAME'];?>" class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" name="buscar" class="form-control input-lg" placeholder="Buscar...">
                    </div>
                    <button class="btn1 btn-1 btn-1b">Buscar Horario</button>
                </form>

            </div><br>


            <div class="grid_3 grid_4 wow fadeInUp animated table-responsive" data-wow-delay=".5s">

                <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                    <?php 
   $query = "SELECT id_bitacora, nombre_docente, hora_entrada, hora_salida, dia,nombre_materia, semestre, nombre_carrera, nombre_sala 
   FROM docente, materia, detalle_bitacora, sala, carreras
   WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND 
   carreras.id_carrera=materia.id_carrera
   order by hora_entrada asc";
                
  if(isset($_POST['buscar'])){
      $buscar = $_POST['buscar'];
      if(empty($buscar)){
        $query = "SELECT * from detalle_bitacora"; 
        
      }else{
          $query="SELECT id_bitacora, nombre_docente, hora_entrada, hora_salida, dia,nombre_materia, semestre, nombre_carrera, nombre_sala 
   FROM docente, materia, detalle_bitacora, sala, carreras
   WHERE docente.id_docente=detalle_bitacora.id_docente AND materia.id_materia=detalle_bitacora.id_materia AND sala.id_sala=detalle_bitacora.id_sala AND 
   carreras.id_carrera=materia.id_carrera

and nombre_docente like '%$buscar%' or nombre_carrera like '%$buscar%' or semestre like '%$buscar%' or hora_entrada like '%$buscar%' or hora_salida like '%$buscar%' or nombre_sala like '%$buscar%' or dia like '%$buscar%' ";
          
          
        //$query="SELECT Nombre_s, Apellido_Pat, Apellido_Mat, Nombre_Aula, Hra_Inicial, Hra_Final, Dia, //Carrera, Nombre FROM docente, horarios, aula, materia 
        //WHERE Nombre_s like '%$buscar%' or Apellido_Pat like '%$buscar%' or Apellido_Mat like //'%$buscar%' or Dia like '%$buscar%' or Carrera like '%$buscar%' or Nombre like '%$buscar%'";
      }
      
      
  }
  $resultado=$con->query($query);
 ?>



                    <br>
                    <table class="table table-bordered table-striped table-condensed cf table-hover">
                        <thead class="cf">
                            <tr class="info">

                                <th>Docente</th>
                                <th>Hora Entrada</th>
                                <th>Hora Salida</th>
                                <th>Día</th>
                                <th>Materia</th>
                                <th>Semestre</th>
                                <th>Carrera</th>
                                <th>Sala</th>
                                <th>Acciones</th>

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

                            <td data-title="Id Materia">
                                <?php echo $row['nombre_sala'];?>
                            </td>


                            <td data-title="Actualizar">

                                <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_horarios.php?id_bitacora=<?php echo $row['id_bitacora'];?>">
            Actualizar
        </a>
        </button>

                                <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_h.php?id_bitacora=<?php echo $row['id_bitacora'];?>">
            Eliminar
        </a>
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
