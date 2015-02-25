<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	if(floatval($_POST["resultado"]) >= 70){
		$partida->addResultadoNaListaDeVitorias("s");
	} else {
		$partida->addResultadoNaListaDeVitorias("n");
	}
	$_SESSION["partida"] = serialize($partida);
	
} else if($_SERVER["REQUEST_METHOD"] == "GET") {
	require_once("../includes/models.php");
	$lista = $partida->getListaDeVitorias();
	$_SESSION["partida"] = serialize($partida);	
	echo $lista;	
}
?>