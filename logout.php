<!-- Classe para deslogar o usuario do sistema
authors: Andreza Raquel e Dandara Navarro
-->
<?php 
session_start(); 
session_destroy();
setcookie("score", null);
setcookie("salarioInicial", null);
setcookie("id_nivel", null);
setcookie("stringDeVitorias", null);
setcookie("numCenarios", null);
setcookie("proximoNivel", null);
header('Location: index.php');
?>