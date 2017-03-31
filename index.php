<?php

session_start();

if (isset($_SESSION['username']))
{
    header('Location: admin.php');
}
else
{
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    
    <title>Desplegar</title>
    
    <link rel="stylesheet" href="css/toggle.css">
    
    <link rel="stylesheet" href="css/normalize.css">
        
	<script src="js/jquery-1.11.1.min.js"></script>
	
</head>
<body>
   
   <section class="seccionToggle">
       <div class="desp">
           <h2>Bienvenido!!</h2>
           <p>Por favor, inicie sesión para acceder a la administración del sistema.</p>
           <img src="images/us.png" alt="">
           <form action="verificar.php" method="post">
           
				<input type="email" name="email" placeholder="Email" required="">
        		        <br><br>
        		<input type="password" name="password" placeholder="Password" required="">
						<br><br>
            	<input type="submit" name="Sign In" value="Ingresar">
                
           </form>
           
       </div>
       
   </section>
   
   <a href="#" id="btn-toggle" class="btn-toggle">Iniciar Sesión</a>
   
   <div class="main">
          
        <div class="vista1">         
          <h2>Sistema de Control de Bitácoras</h2>
          <h2>Centro de Cómputo</h2>
        </div>
          
           <div class="logo">
               <img src="images/logo_ITSM.jpg" alt="">    
           </div>
       
   </div>
    
    <script src="js/desplegar.js"></script>
    
</body>
</html>
<?php      
}
?>