<?php
if (!isset($_SESSION)) session_start();

include_once (__DIR__ . "\..\database/acessaBD.php"); // inclusao do arquivo de acesso ao banco de dados
foreach (glob(__DIR__ . "\..\models/*.php") as $filename){
    include_once($filename);
}

if (!isset($_SESSION["jogador"])) { // se nao estiver logado...
	header("location: index.php"); // ...vai para a pagina inicial.
	exit;
} 

$jogador = unserialize($_SESSION["jogador"]);

if (isset($_COOKIE["empresa"])) {
	$empresa = unserialize($_COOKIE["empresa"]);
}
if (isset($_COOKIE["partida"])) {
	$partida = unserialize($_COOKIE["partida"]);
}
if (isset($_COOKIE["cenario"])) {
	$cenario = unserialize($_COOKIE["cenario"]);
}
?>