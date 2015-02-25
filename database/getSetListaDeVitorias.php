<?php
require_once("../includes/models.php");
if($_SERVER["REQUEST_METHOD"] == "POST") {
	if(floatval($_POST["resultado"]) >= 70){
		$partida->addResultadoNaListaDeVitorias("s");
	} else {
		$partida->addResultadoNaListaDeVitorias("n");
	}
	$_SESSION["partida"] = serialize($partida);
	
} else if($_SERVER["REQUEST_METHOD"] == "GET") {
	$lista = $partida->getListaDeVitorias();
	$vitorias = "";
	for ($i = 0; $i < count($lista); $i++) {
		$vitorias += $lista[$i];
	}
	echo $vitorias;	
}
?>