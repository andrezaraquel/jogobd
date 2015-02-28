<?php
require_once("Model.php");
class Cenario extends Model {
	
	private $id;
	private $descricao;
	private $dicaUm;
	private $dicaDois;
	private $tabelas;
		
	function __construct($empresaId, $nivel, $cenarioId) {
		parent::__construct();	
		$this->id = $cenarioId;
		$dadosCenario = mysql_query("SELECT * FROM cenario WHERE id_empresa = $empresaId AND id_nivel = $nivel AND id_cenario = $cenarioId");
		$dadosCenario = mysql_fetch_assoc($dadosCenario);
		$this->descricao = $dadosCenario["descricao"];
		$this->dicaUm = $dadosCenario["dica1"];
		$this->dicaDois = $dadosCenario["dica2"];
		$dadosTabelas = mysql_query("SELECT nome FROM tabelas WHERE id_empresa = $empresaId AND id_nivel = $nivel AND id_cenario = $cenarioId");
		$this->tabelas = array();
		while ($linha = mysql_fetch_assoc($dadosTabelas)) {
			$tabela = $linha["nome"];
			if (!is_array($tabela)) {
				array_push($this->tabelas, $tabela);
			}
		}
		mysql_close();
	}
	
	function getId() {
		return $this->id;
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
	
	function getNomeTabelas() {
		return $this->tabelas;
	}	
	
	function getTabelas() {
		$nomesTabelas = $this->getNomeTabelas();
		$tabelas = array();
		for ($i = 0; $i < count($nomesTabelas); $i++) {
			$tabela = new Tabela($nomesTabelas[$i]);
			array_push($tabelas, $tabela);
		}
		return $tabelas;
	}
	
	function getErroTabelas() {
		$tabelas = $this->getTabelas();
		$erros = array();
		for ($i = 0; $i < count($tabelas); $i++) {
			array_push($erros, $tabelas[$i]->getErros());
		}
		return $erros;
	}
	
	function commit() {
		$_SESSION["cenario"] = serialize($this);
	}
	
	function delete() {
		unset($_SESSION["cenario"]);
	}
	
	static function getCenario() {
		return unserialize($_SESSION["cenario"]);
	}
	
	static function temCenario() {
		return isset($_SESSION["cenario"]);
	}
	
}
?>