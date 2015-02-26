<!-- Classe para deslogar o usuario do sistema
authors: Andreza Raquel e Dandara Navarro
-->
<?php 
session_start(); 
session_destroy();
setcookie("score", null);
setcookie("nivel", null);
setcookie("salarioAtual", null);
setcookie("empresa", null);
setcookie("partida", null);
setcookie("cenario", null);
header('Location: index.php');
?>