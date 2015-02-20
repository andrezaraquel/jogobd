<?php 
if($_SERVER["REQUEST_METHOD"] == "POST") {
	session_start();
	include ('acessaBD.php');
	
	$nome= $_POST ["nome"];
	$usuario_email = $_POST["email"];
	$sexo = $_POST["sexo"];
	$usuario_senha = $_POST["senha"];
	$id_nivel = 1;
	
	$senha_criptografada = base64_encode('$usuario_senha');
	$strSQL1 = "INSERT INTO `cadastros` (`email`,`senha`,`nome`,`sexo`, `id_nivel`) VALUES ('$usuario_email', '$senha_criptografada', '$nome', '$sexo', '$id_nivel')";
	if (!mysql_query($strSQL1)) {
		header("Email já cadastrado", true, 400);
		die(mysql_error());
	}
	
	$_SESSION['email'] = $usuario_email;
	$_SESSION['senha'] = $usuario_senha;
	$_SESSION['nome'] = $nome;
	$_SESSION['sexo'] = $sexo;
	$_SESSION['id_nivel'] = $id_nivel;
}
?>

