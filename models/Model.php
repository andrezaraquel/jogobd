<?php
class Model {

	function __construct() {
		$servidor = "localhost"; // o servidor onde está o bd
		$usuario = "root"; // o usuario que solicita acesso
		$senha = "vertrigo";//"vertrigo"; // a senha desse usuario

		mysql_connect($servidor, $usuario, $senha) or die (mysql_error ()); // Conexao com o Banco de Dados        
		mysql_select_db("jogobd") or die(mysql_error()); // Selecao da base de dados
		mysql_query("SET NAMES utf8"); // Altera para o padrão utf8
		mysql_query("SET CHARACTER_SET utf8");
	}
	
}
?>