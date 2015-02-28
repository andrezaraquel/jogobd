<?php
if (!isset($_SESSION)) session_start();

include_once (__DIR__ . "\..\database/acessaBD.php"); // inclusao do arquivo de acesso ao banco de dados
foreach (glob(__DIR__ . "\..\models/*.php") as $filename){
    include_once($filename);
}

if (!Jogador::temJogador()) { // se nao estiver logado...
	header("location: index.php"); // ...vai para a pagina inicial.
	exit;
} 
?>