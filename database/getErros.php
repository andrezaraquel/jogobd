<?php

require_once("../includes/models.php");

$nomesTabelas = $cenario->getTabelas();
$erros = array();
for ($i = 0; $i < count($nomesTabelas); $i++) {
	$tabela = new Tabela($nomesTabelas[$i]);
	array_push($erros, $tabela->getErros());
}

echo "[";
for ($i = 0; $i < count($erros); $i++) {
	echo "[";
	for ($j = 0; $j < count($erros[$i]); $j++) {
		echo '{
		"i": ' . $erros[$i][$j][0] . ',
		"j": ' . $erros[$i][$j][1]	. ',
		"msg": "' . $erros[$i][$j][2] . '"
		}';
		if ($j != count($erros[$i]) - 1) {
			echo ",";
		}
	}
	echo "]";
	if ($i != count($erros) - 1) {
		echo ",";
	}
}
echo "]";
?>