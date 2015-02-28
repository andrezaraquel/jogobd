<?php
session_start();
$jogador = Jogador::getJogador();
$partida = Partida::getPartida();
if($_POST["score"] >= 70){	
	if (count($partida->getListaDeVitorias()) == 0) {
		$jogador->setScore($_POST["score"]);
	} else{
		$jogador->setScore(intval($jogador->getScore()) + intval($_POST["score"]));
	}
	$partida->addResultadoNaListaDeVitorias("s");
} else {
	$partida->addResultadoNaListaDeVitorias("n");
}
$jogador->commit();
$partida->commit();
 
echo $jogador->getScore();
?>