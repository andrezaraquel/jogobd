<?php

require_once("includes/models.php");

$numCenarios = $partida->getNumCenarios();
$salarioInicial = $nivel->getSalarioInicial();
$nivelAtual = $nivel.getId();

switch($nivelAtual){
	case 1:
		$proximoNivel = "Analista de Dados Júnior";
		break;
	case 2:
		$proximoNivel = "Analista de Dados Pleno";
		break;
	case 3:
		$proximoNivel = "Analista de Dados Sênior";
		break;
}

$json = '{"numCenarios":$numCenarios, "salarioInicial":$salarioInicial, "nivelAtual":$nivelAtual, "proximoNivel":$proximoNivel}';

echo $json;

mysql_close();

?>