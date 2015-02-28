<?php
if (!isset($_SESSION))
	session_start();
$_SESSION["empresaId"] = $_POST["empresaId"];
?>