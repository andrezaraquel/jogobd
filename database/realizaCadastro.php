<?php 
if($_SERVER["REQUEST_METHOD"] == "POST") {
	session_start();
	require_once('acessaBD.php');
	require_once("../models/Jogador.php");
	
	$nome = $_POST ["nome"];
	$email = $_POST["email"];
	$sexo = $_POST["sexo"];
	$senha = $_POST["senha"];
	
	$strSQL1 = "INSERT INTO `cadastros` (`email`, `senha`, `nome`, `sexo`, `id_nivel`) VALUES ('$email', MD5('$senha'), '$nome', '$sexo', 1)";
	
	$query = mysql_query($strSQL1);
	if (!$query) {
		header("HTTP/1.1 400 E-mail já cadastrado.");
		mysql_close();
		die();
	}
	mysql_close();
	
	$jogador = new Jogador($nome, $login, 1, $sexo);
	$_SESSION['jogador'] = serialize($jogador);
}
?>

