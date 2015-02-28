<?php
require_once("../includes/models.php");

$jogador = Jogador::getJogador();
$partida = Partida::getPartida();
$nivelAtual = $jogador->getNivel();
$nivel = new Nivel($jogador->getNivel());

$salarioInicial = $nivel->getSalarioInicial();
$cenarioAtual = count($partida->getListaDeVitorias()) + 1;
$proximoNivel = $nivel->getProximoNivel();

$lista = $partida->getListaDeVitorias();
$vitorias = implode("", $lista);

$json = '{"salarioAtual": ' . $jogador->getSalarioAtual() . ', "numCenarios":' . $partida->getNumCenarios() . ', "salarioInicial":' . $salarioInicial . ', "nivelAtual":' . $nivelAtual . ', "proximoNivel":"' . $proximoNivel . '", "score":' . $jogador->getScore() . ', "progresso": "' . $vitorias . '", "cenarioAtual": "' . $cenarioAtual .'"}';

echo $json;
?>