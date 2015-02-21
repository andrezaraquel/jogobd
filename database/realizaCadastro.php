<?php 
if($_SERVER["REQUEST_METHOD"] == "POST") {
	session_start();
	include ('acessaBD.php');
	
	$nome= $_POST ["nome"];
	$login = $_POST["username"];
	$sexo = $_POST["sexo"];
	$senha = $_POST["senha"];
	
	
	
	$strSQL1 = "INSERT INTO `cadastros` (`usuario`,`senha`,`nome`,`sexo`, `id_nivel`) VALUES ('$usuario_login', '$usuario_senha', '$nome', '$sexo', '$id_nivel')";
	
	mysql_query($strSQL1) or die (mysql_error());
	
	mysql_close();
	
	$_SESSION['jogador'] = serialize(new Jogador($nome, $login, $senha, $sexo));
	
	header("location: comoJogar.php");
	
	
}
?>

