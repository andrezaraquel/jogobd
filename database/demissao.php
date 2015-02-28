<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	$empresa = Empresa::getEmpresa();
	$partida = Partida::getPartida();
	$cenario = Cenario::getCenario();
	$empresa->delete();
	$partida->delete();
	$cenario->delete();
}
?>