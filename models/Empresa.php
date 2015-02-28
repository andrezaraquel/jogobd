<?php
require_once("Model.php");
class Empresa extends Model {
	
	private $id;
	private $nome;
	
	function __construct($id){
		parent::__construct();
		$this->id = $id;
		$pesquisaEmpresa = mysql_query("SELECT * FROM empresa WHERE id_empresa = $id") or die(mysql_error());
		$empresa = mysql_fetch_array($pesquisaEmpresa);
		$this->nome = $empresa['nome']; 
		mysql_close();
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
	
	function commit() {
		setcookie("empresa", serialize($this), time()+3600*24*30, '/');
	}
	
	function delete() {
		unset($_COOKIE["empresa"]);
		setcookie("empresa", null, -1, '/');
	}
	
}
?>