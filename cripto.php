<?php

include ("acessaBD.php");

$sql = mysql_query("SELECT * FROM cadastros") or die(mysql_error());

while($linha = mysql_fetch_array($sql)){
	$usuario_senha = $linha['senha'];
	$senha_criptografada = base64_encode('$usuario_senha');
	mysql_query("UPDATE cadastros SET senha = '".$senha_criptografada."' WHERE email = '".$linha['email']."'")or die(mysql_error());
}
 
 

?>