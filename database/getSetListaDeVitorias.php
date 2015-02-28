<?php
require_once("../includes/models.php");
$partida = Partida::getPartida();
$cenario = Cenario::getCenario();
if($_SERVER["REQUEST_METHOD"] == "POST") {
	if (floatval($_POST["resultado"]) >= 70) {
		$partida->addResultadoNaListaDeVitorias("s");
	} else {
		$partida->addResultadoNaListaDeVitorias("n");
	}
	$partida->addCenarioApresentado($cenario->getId());
	$partida->commit();
} else if($_SERVER["REQUEST_METHOD"] == "GET") {
	$lista = $partida->getListaDeVitorias();
	$vitorias = implode("", $lista);
	echo $vitorias;
}
?>