<?php
require_once("Model.php");
class Pontuacao extends Model {
	
	function __construct($jogador, $nivel) {
		parent::__construct();
		$registroEmail = mysql_query("SELECT * FROM ranking WHERE email = '". $jogador->getLogin() ."'")or die(mysql_error()); 

		if (mysql_num_rows($registroEmail) > 0) {
			mysql_query("UPDATE ranking SET nivel = '". $nivel->getSigla() . "', pontuacao = '". $jogador->getSalarioAtual() ."' WHERE email = '". $jogador->getLogin() . "'")or die(mysql_error());
		} else {
			$query = "INSERT INTO ranking(email, nome, nivel, pontuacao) VALUES ('" . $jogador->getLogin() . "', '". $jogador->getNome() . "', '". $nivel->getSigla() . "', " . $jogador->getSalarioAtual() .")";
			mysql_query($query)or die(mysql_error());
		}
		mysql_close();
	}
	
}
?>