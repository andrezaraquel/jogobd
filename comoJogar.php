<?php
session_start();
require_once("models/Model.php");
require_once("models/Jogador.php");

if (!Jogador::temJogador()) { // se nao estiver logado...
	header("location: index.php"); // ...vai para a pagina inicial.
	exit;
} 

if (isset($_COOKIE["comoJogar"]) && $_COOKIE["comoJogar"] == true) {
	header("location: classificados.php");
	exit;
}
setcookie("comoJogar", true); //nao repete o tutorial duas vezes depois de lido
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	<title>Como jogar Mr. Data Analyst</title>
	<link href="css/comoJogar.css" rel="stylesheet">
</head>
<body class='corDoFundo'>

<?php 
$_SESSION["navbar"] = "comojogar";
include_once("includes/navbar.php");
?>

<div class="row">
	<iframe height="570" class="col-md-6 col-md-offset-3" src="//www.youtube.com/embed/cqTlLL9fp1E" frameborder="0" allowfullscreen></iframe>
</div>

</body>
</html>                                		