<?php
require_once("Model.php");
class Cenario extends Model {
	
	private $descricao;
	private $dicaUm;
	private $dicaDois;
	private $tabelas;
		
	function __construct($id_empresa, $id_nivel, $id_cenario) {
		parent::__construct();	
		$dadosCenario = mysql_query("SELECT * FROM cenario WHERE id_empresa = $id_empresa AND id_nivel = $id_nivel AND id_cenario = $id_cenario");
		$dadosCenario = mysql_fetch_assoc($dadosCenario);
		$this->descricao = $dadosCenario["descricao"];
		$this->dicaUm = $dadosCenario["dica1"];
		$this->dicaDois = $dadosCenario["dica2"];
		$dadosTabelas = mysql_query("SELECT nome FROM tabelas WHERE id_empresa = $id_empresa AND id_nivel = $id_nivel AND id_cenario = $id_cenario");
		$dadosTabelas = mysql_fetch_assoc($dadosTabelas);
		$this->tabelas = $dadosTabelas["nome"];
		if (!is_array($this->tabelas)) {
			$this->tabelas = array($this->tabelas);
		}
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
	
	function commit() {
		setcookie("cenario", serialize($this), time()+3600*24*30, '/');
	}
	
	function delete() {
		unset($_COOKIE["cenario"]);
		setcookie("cenario", null, -1, '/');
	}
	
	static function getCenario() {
		return unserialize($_COOKIE["cenario"]);
	}
	
	static function temCenario() {
		return isset($_COOKIE["cenario"]);
	}
	
}
?>