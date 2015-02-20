<?php
session_start();
if($_GET["score"] >= 70){	
	if(count($_SESSION['listaDeVitorias']) == 0){	
		$_SESSION["score"] = $_GET["score"];
	} else{
		$_SESSION["score"] += $_GET["score"];
	}
	array_push($_SESSION['listaDeVitorias'], "s");
} else {
	array_push($_SESSION['listaDeVitorias'], "n");
}
 
echo $_SESSION["score"];
?>