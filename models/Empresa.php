<?php

require_once("Model.php");
class Empresa extends Model {
	
	private $id;
	private $nome;
	
	function __construct($id){
		$this->id = $id;
		$pesquisaEmpresa = mysql_query("SELECT * FROM empresa WHERE id_empresa = ". $this->id);
		$empresa = mysql_fetch_array($pesquisaEmpresa);
		$this->nome = $empresa['nome']; 
	}
	
	function getId() {
		return $this->id;
	}
	
	function getNome() {
		return $this->nome;
	}
	
	function getCenarios($nivel){
		$query = mysql_query("SELECT id_cenario FROM cenario WHERE id_empresa = " . $this->id . " AND id_nivel = " . $nivel);
		mysql_close();
		return mysql_fetch_array($query);
	}
}
?>