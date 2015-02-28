<?php
require_once("Model.php");
class Jogador extends Model {
	
	public static $ULTIMO_NIVEL = 4;
	
	private $nome;
	private $login;
	private $sexo;
	private $nivel;
	private $salarioAtual;
	private $score;
	
	function __construct($nome, $login, $sexo, $nivel) {
		parent::__construct();
		$this->nome = $nome;
		$this->login = $login;
		$this->sexo = $sexo;
		$this->nivel = $nivel;
		$this->score = $score;
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
	
	function getSexo() {
		return $this->sexo;
	}
	
	function getNivel() {
		return $this->nivel;
	}
	
	function setNivel($nivel) {
		$this->nivel = $nivel;
	}
	
	function avancaDeNivel() {
		new Ranking($this);
	}
	
	function inserePontuacao() {
		new Pontuacao($this, new Nivel($this->getNivel()));
	}
	
	function getSalarioAtual() {
		return $this->salarioAtual;
	}
	
	function setSalarioAtual($novoSalario) {
		$this->salarioAtual = $novoSalario;
	}
	
	function getScore() {
		return $this->score;
	}
	
	function setScore($novoScore) {
		$this->score = $novoScore;
	}
	
	function commit() {
		$_SESSION["jogador"] = serialize($this);
	}
	
	static function getJogador() {
		return unserialize($_SESSION["jogador"]);
	}
	
	static function temJogador() {
		return isset($_SESSION["jogador"]);
	}
	
}
?>