<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("acessaBD.php");
	 
	$usuario_email = $_POST["email"];
	$usuario_senha = $_POST["senha"];
	 
	$senha_criptografada = base64_encode('$usuario_senha');
	$sql = mysql_query("SELECT * FROM cadastros WHERE email = '$usuario_email' and senha = '$senha_criptografada'") or die(mysql_error());
	 
	$cadastro = mysql_fetch_array($sql);
	 
	if (mysql_num_rows($sql) > 0){
		session_start();
		$_SESSION['email'] = $_POST['email'];
		$_SESSION['nome'] = $cadastro['nome'];
		$_SESSION['sexo'] = $cadastro['sexo'];
		$_SESSION['id_nivel'] = $cadastro['id_nivel'];
	} else{	
		header("text: Email ou senha inválida", true, 400);
	}
} 
mysql_close();
?>