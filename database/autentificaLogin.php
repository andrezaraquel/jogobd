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
		$_SESSION['jogador'] = serialize(new Jogador($cadastro["nome"], $usuario_email, $senha_criptografada, $cadastro["id_nivel"], $cadastro["sexo"]));
	} else{	
		header("text: Email ou senha inválida", true, 400);
	}
} 
mysql_close();
?>