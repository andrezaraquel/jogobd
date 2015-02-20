<?php
session_start();

if (!isset($_SESSION["login"]) || !isset($_SESSION["senha"])) {
	header("location: index.php");
	exit;
} 
?>
<?php 
/*
Classe que faz a pesquisa do salario no banco de dados com base na vaga selecionada pelo jogador.
Retorna o salario inicial do jogador.

authors: Andreza Raquel e Dandara Navarro
*/

include ("acessaBD.php"); // acessa o arquivo de conexao com o bd

$id_nivel = $_SESSION['id_nivel']; // recebe o id_nivel de partidas.js, utilizado para pesquisar de qual nivel se trata

$consulta = mysql_query("SELECT * FROM nivel WHERE id_nivel = ". $id_nivel); // faz a consulta no bd do nivel

$nivel = mysql_fetch_array($consulta); // tranforna a pesquisa em um array

echo $nivel['salarioInicial'];  // imprime o indice do array que se refere ao salario

mysql_close(); // fecha a conexao 

?>