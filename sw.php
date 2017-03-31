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
                <h2 class="wow fadeInDown animated" data-wow-delay=".5s">Software del Centro de Cómputo</h2>
                <p class="wow fadeInUp animated" data-wow-delay=".5s">Por favor llene cada una de las siguientes casillas </p>
            </div>



            <div class="contact-form wow fadeInUp animated" data-wow-delay=".5s">
                <h4></h4>
                <form action="insertar_sw.php" method="post">

                    <input type="text" name="nombre" placeholder="Nombre del Software" required>
                    <input type="date" name="fecha" placeholder="" required>

                    <select type="text" class="contact-form" name="docente" required>
                        <option>Seleccione el Docente</option>
                        <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select * from docente";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_docente'] ?>"><?php echo $row['nombre_docente'] ?></option>
                          <?php } }?>
                    </select>

                    <select type="text" class="contact-form" name="sala" required>
                        <option>Seleccione Sala de instalacion</option>
                        <?php 
                          include("conexion.php");

                        $con=mysqli_connect($host, $user, $pw, $db);

                          $sql = "select * from sala";  
                          $result = mysqli_query($con,$sql);

                          if ($result->num_rows > 0) {

                        // output data of each row
                        while($row = $result->fetch_assoc()) {

                         ?>
                          
                          <option required value="<?php echo $row['id_sala'] ?>"><?php echo $row['nombre_sala'] ?></option>
                          <?php } }?>
                    </select>
                    <br>

                    <button class="btn1 btn-1 btn-1b">Guardar</button>
                    <button type="reset" class="btn1 btn-1 btn-1b">Limpiar</button>

                </form>
            </div>

            <br><br>

            <div class="panel-group" id="accordion">



                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">SALA A</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">


                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='A' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">SALA B</a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                        <div class="panel-body">

                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='B' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">SALA C</a>
                        </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse">
                        <div class="panel-body">

                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='C' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">SALA D</a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse">
                        <div class="panel-body">

                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='D' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">SALA E</a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse">
                        <div class="panel-body">

                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='E' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">LABORATORIO DE ELECTRONICA</a>
                        </h4>
                    </div>
                    <div id="collapse6" class="panel-collapse collapse">
                        <div class="panel-body">

                            <?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);

?>


                                <?php 
   $query = "SELECT docente.id_docente, nombre_docente, software.id_sw, nombre_sw, sala.id_sala, nombre_sala, fecha_instalacion from docente,sala,software, detalle_software WHERE docente.id_docente=detalle_software.id_docente AND software.id_sw=detalle_software.id_sw AND sala.id_sala=detalle_software.id_sala and nombre_sala='LE' order by fecha_instalacion ASC "; 

  $resultado=$con->query($query);
 ?>




                                <br>
                                <table class="table table-striped table-condensed cf table-hover">
                                    <thead class="cf">
                                        <tr class="info">

                                            <th>Nombre del Software</th>
                                            <th>Fecha Instalación</th>
                                            <th>Docente</th>
                                            <th>Acciones</th>

                                        </tr>
                                    </thead>


                                    <tr>

                                        <?php  while($row=$resultado->fetch_assoc()){ ?>

                                        <td data-title="Nombre_s">
                                            <?php echo $row['nombre_sw'];?>
                                        </td>


                                        <td data-title="Nombre_s">
                                            <?php echo $row['fecha_instalacion'];?>
                                        </td>

                                        <td data-title="Apellido Paterno">
                                            <?php echo $row['nombre_docente'];?>
                                        </td>

                                        <td data-title="Actualizar">

                                            <button class="btn btn-primary btn-xs">
        <i class="fa fa-refresh"></i>
        <a href="actualiza_sw.php?id_sw=<?php echo $row['id_sw'];?>">
            Actualizar
        </a>
        </button>

                                            <button class="btn btn-danger btn-xs">
        <i class="fa fa-trash-o"></i>
        <a href="eliminar_sw.php?id_sw=<?php echo $row['id_sw'];?>">
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
