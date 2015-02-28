<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");	
	$jogador->setSalarioAtual(floatval($_POST["salario"]));
	$jogador->inserePontuacao();
	$jogador->setScore(floatval($jogador->getScore()) + floatval($_POST['score']));
	$jogador->commit();
}
?>