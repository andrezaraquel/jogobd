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
		$tihs->dicaUm = $dadosCenario["dica1"];
		$this->dicaDois = $dadosCenario["dica2"];
		
		$dadosTabelas = mysql_query("SELECT nome FROM tabelas WHERE id_empresa = $id_empresa AND id_nivel = $id_nivel AND id_cenario = $id_cenario");
		$this->tabelas = mysql_fetch_array($dadosTabela);
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