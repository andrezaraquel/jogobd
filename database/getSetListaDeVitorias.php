<?php
require_once("../includes/models.php");
if($_SERVER["REQUEST_METHOD"] == "POST") {
	if(floatval($_POST["resultado"]) >= 70){
		$partida->addResultadoNaListaDeVitorias("s");
	} else {
		$partida->addResultadoNaListaDeVitorias("n");
	}
	setcookie("partida", serialize($partida));
} else if($_SERVER["REQUEST_METHOD"] == "GET") {
	$lista = $partida->getListaDeVitorias();
	$vitorias = implode("", $lista);
	echo $vitorias;
}
?>