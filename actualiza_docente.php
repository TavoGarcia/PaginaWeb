<?php

include("conexion.php");

$con=mysqli_connect($host, $user, $pw, $db);
        
    $id_doce = $_GET['id_docente'];
    $query="SELECT * FROM docente WHERE id_docente='$id_doce'";
    $resultado=$con->query($query);
    $row=$resultado->fetch_assoc();
?>


    <!DOCTYPE html>
    <html>

    <head>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Around Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
                    <h2 class="wow fadeInDown animated" data-wow-delay=".5s">Dar de alta Docentes</h2>
                    <p class="wow fadeInUp animated" data-wow-delay=".5s">Por favor llene cada una de las siguientes casillas </p>
                </div>



                <div class="contact-form wow fadeInUp animated" data-wow-delay=".5s">
                    <h4></h4>
                    <form action="actu_doce.php" method="post">

                        <input type="hidden" name="id_docente" id="" value="<?php echo $id_doce; ?>">

                        <input type="text" name="nip" id="" value="<?php echo $row['nip']; ?>">
                        <input type="text" name="nombre" value="<?php echo $row['nombre_docente']; ?>">

                        <br>

                        <button class="btn1 btn-1 btn-1b">Guardar</button>

                        <button href="alta_docentes.php" class="btn1 btn-1 btn-1b">Cancelar</button>

                    </form>
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
