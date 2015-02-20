<?php
session_start();
 
if (!isset($_SESSION["email"]) || !isset($_SESSION["senha"])) {
	header("location: index.php");
	exit;
} 
?>
 
<?php
	$_SESSION['salarioAtual'] = $_GET['salarioAtual'];
	header('Location: jogo.php');
?>
