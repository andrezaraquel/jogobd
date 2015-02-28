<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("acessaBD.php");
	require_once("../models/Jogador.php");
	 
	$usuario_email = $_POST["email"];
	$usuario_senha = $_POST["senha"];
	 
	$sql = mysql_query("SELECT * FROM cadastros WHERE email = '$usuario_email' and senha = MD5('$usuario_senha')");
	if (!$sql) {
		header("HTTP/1.1 400 Um erro ocorreu. Por favor, tente novamente.");
		mysql_close();
		die();
	}
	
	$cadastro = mysql_fetch_assoc($sql);
	 
	if (mysql_num_rows($sql) > 0) {
		session_start();
		$jogador = new Jogador($cadastro["nome"], $usuario_email, $cadastro["sexo"], $cadastro["id_nivel"]);
		$jogador->commit();
	} else{	
		header("HTTP/1.1 400 E-mail ou senha inv&#225;lido.");
	}
} 
mysql_close();
?>