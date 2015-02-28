<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	$jogador = Jogador::getJogador();
	$empresa = Empresa::getEmpresa();
	$jogador->avancaDeNivel();
	$partida = new Partida($jogador->getNivel(), $empresa->getId());
	$partida->commit();
	$jogador->commit();
}
?>