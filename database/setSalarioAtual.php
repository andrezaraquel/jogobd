<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
	require_once("../includes/models.php");
	$jogador->setSalarioAtual(floatval($_POST["salario"]));
	$_SESSION["jogador"] = serialize($jogador);
	echo "</script>alert('oi');</script>";
}
echo "</script>alert('oia');</script>";
?>