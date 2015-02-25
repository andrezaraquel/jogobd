<?php

require_once("../includes/models.php");

$numCenarios = $partida->getNumCenarios();
$nivel = new Nivel($jogador->getNivel());
$salarioInicial = $nivel->getSalarioInicial();
$nivelAtual = $jogador->getNivel();
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

$json = '{"salarioAtual": ' . $jogador->getSalarioAtual() . ', "numCenarios":' . $numCenarios . ', "salarioInicial":' . $salarioInicial . ', "nivelAtual":' . $nivelAtual . ', "proximoNivel":"' . $proximoNivel . '", "score":' . $_COOKIE['score'] . '}';

echo $json;
?>