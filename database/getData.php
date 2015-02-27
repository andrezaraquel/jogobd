<?php

require_once("../includes/models.php");

$nivelAtual = $jogador->getNivel();
$nivel = new Nivel($nivelAtual);
$salarioInicial = $nivel->getSalarioInicial();
$cenarioAtual = count($partida->getListaDeVitorias()) + 1;

switch($nivelAtual) {
	case 1:
		$proximoNivel = "Analista de Dados Júnior";
		break;
	case 2:
		$proximoNivel = "Analista de Dados Pleno";
		break;
	case 3:
		$proximoNivel = "Analista de Dados Sênior";
		break;
	default:
		$proximoNivel = "";
}

$lista = $partida->getListaDeVitorias();
$vitorias = implode("", $lista);

$json = '{"salarioAtual": ' . $jogador->getSalarioAtual() . ', "numCenarios":' . $partida->getNumCenarios() . ', "salarioInicial":' . $salarioInicial . ', "nivelAtual":' . $nivelAtual . ', "proximoNivel":"' . $proximoNivel . '", "score":' . $jogador->getScore() . ', "progresso": "' . $vitorias . '", "cenarioAtual": "' . $cenarioAtual .'"}';

echo $json;
?>