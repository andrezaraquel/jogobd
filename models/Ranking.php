<?php
require_once("Model.php");
class Ranking extends Model {
	
	function __construct($jogador) {
		parent::__construct();
		$nivel = intval($jogador->getNivel());
		if ($nivel < 4) $nivel++;
		mysql_query("UPDATE cadastros SET id_nivel= " . $nivel . " WHERE email ='" . $jogador->getLogin() . "'");
		mysql_close();	
		$jogador->setNivel($nivel);
	}
	
}
?>