<?php 
session_start();

include("conexion.php");

if (isset($_POST['email']) && !empty($_POST['email']) && isset($_POST['password']) && !empty($_POST['password'])) 
{
	$con=mysqli_connect($host, $user, $pw, $db);
	
	$result=mysqli_query($con,"SELECT Email, Pass FROM admin WHERE Email='$_POST[email]'");
	$sesion=mysqli_fetch_array($result);
		
	if ($_POST['password'] == $sesion ['Pass']) 
	{

	$_SESSION['username'] = $_POST['email'];

        echo "<script type=text/javascript>alert('Sesión Iniciada'); window.location='admin.php';</script>";
	}
  
	else
	{
	echo "<script type=text/javascript>alert('Datos incorrectos, verifiquelos por favor.'); window.location='index.php';</script>";
        
	}
}

 ?>

 