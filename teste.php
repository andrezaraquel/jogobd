<?php
//require_once "mostraCenarios.php";
require_once "models/Tabela.php";

$tabela = new Tabela("peca01");

for ($i = 0; $i < count($tabela); $i++) {
	print_r($tabela->getNome()) . "<br>";
}

?>