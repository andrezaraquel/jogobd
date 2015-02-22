<?php
session_start();
if (!isset($_SESSION["jogador"])) { // se nao estiver logado...
	header("location: index.php"); // ...vai para a pagina inicial.
	exit;
} 
include_once (__DIR__ . "\..\database/acessaBD.php"); // inclusao do arquivo de acesso ao banco de dados
foreach (glob(__DIR__ . "\..\models/*.php") as $filename){
    include_once($filename);
}
$jogador = unserialize($_SESSION["jogador"]);

if (isset($_SESSION["empresa"])) {
	$empresa = unserialize($_SESSION["empresa"]);
}
if (isset($_SESSION["partida"])) {
	$partida = unserialize($_SESSION["partida"]);
}
if (isset($_SESSION["cenario"])) {
	$cenario = unserialize($_SESSION["cenario"]);
}
?>