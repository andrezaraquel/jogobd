<?php
require_once("Model.php");
class Cenario extends Model {
	
	private $descricao;
	private $dicaUm;
	private $dicaDois;
	private $tabelas;
		
	function __construct($descricao, $dicaUm, $dica2, $tabelas) {
		parent::__construct();
		$this->descricao = $descricao;
		$tihs->dicaUm = $dicaUm;
		$this->dicaDois = $dicaDois;
		$this->tabelas = $tabelas;
		mysql_close();
	}
	
	function getDescricao() {
		return $this->descricao;
	}
	
	function getDicaUm() {
		return $this->dicaUm;
	}
	
	function getDicaDois() {
		return $this->dicaDois;
	}
	
	function getTabelas() {
		return $this->tabelas;
	}	
}
?>