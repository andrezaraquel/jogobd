<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	$jogador->setSalarioAtual(floatval($_POST["salario"]));
	$jogador->inserePontuacao();
	$_SESSION["jogador"] = serialize($jogador);	
	setcookie("score", floatval($_COOKIE["score"]) + floatval($_POST['score']));
}
?>