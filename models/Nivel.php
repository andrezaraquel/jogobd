<?php
require_once("Model.php");
class Nivel extends Model {
	
	private $id;
	private $nome;
	private $sigla;
	private $salarioInicial;
	
	function __construct($id) {
		parent::__construct();
		$this->id = $id;
		$dados = mysql_query("SELECT * FROM nivel WHERE id_nivel = $id");
		$dados = mysql_fetch_assoc($dados);
		$this->nome = $dados["nome"];
		$this->sigla = $dados["sigla"];
		$this->salarioInicial = $dados["salarioInicial"];
		mysql_close();
	}
	
	function getId() {
		return $this->id;
	}
	
	function getNome() {
		return $this->nome;
	}
	
	function getSigla() {
		return $this->sigla;
	}
	
	function getSalarioInicial() {
		return $this->salarioInicial;
	}
	
	function getProximoNivel() {
		switch($this->id) {
		case 1:
			return "Analista de Dados Júnior";
		case 2:
			return "Analista de Dados Pleno";
		case 3:
			return "Analista de Dados Sênior";
		}
		return "";
	}
	
}
?>