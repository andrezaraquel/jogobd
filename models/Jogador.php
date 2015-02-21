<?php
require_once("Model.php");
class Jogador extends Model {
	
	private $nome;
	private $login;
	private $nivel;
	private $sexo;
	private $salarioAtual;
	
	function __construct($nome, $login, $nivel, $sexo){
		$this->nome = $nome;
		$this->login = $login;
		$this->nivel = $nivel;
		$this->sexo = $sexo;
	}
	
	function getNome() {
		return $this->nome;
	}
	
	function setNome($newNome) {
		$this->nome = $newNome;
	}
	
	function getLogin() {
		return $this->login;
	}
	
	function getNivel() {
		return $this->nivel;
	}
	
	function getSexo() {
		return $this->sexo;
	}
	
	function avancaDeNivel() {
		switch($this->nivel){
			case 1:
				$this->nivel = 2;
				break;
			case 2:
				$this->nivel = 3;
				break;
			case 3:
				$this->nivel = 4;
				break;
		
		}
		mysql_query("UPDATE cadastros SET id_nivel=" . $this->nivel . " WHERE email ='" . $this->email . "'");
		mysql_close();	
	}
	
	function setSalarioAtual($newSalario){
		$this->salarioAtual = $newSalario;
	}
}
?>