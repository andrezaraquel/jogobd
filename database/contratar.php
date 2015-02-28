<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	$jogador = Jogador::getJogador();
	$nivel = new Nivel($jogador->getNivel());
	$jogador->setSalarioAtual($nivel->getSalarioInicial());
	$jogador->setScore(0);
	$empresa = new Empresa($_POST["empresaId"]);
	$partida = new Partida($jogador->getNivel(), $_POST["empresaId"]);

	$jogador->commit();
	$empresa->commit();
	$partida->commit();
}
?>