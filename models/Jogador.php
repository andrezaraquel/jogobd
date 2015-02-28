<?php
require_once("Model.php");
class Jogador extends Model {
	
	public static $ULTIMO_NIVEL = 4;
	
	private $nome;
	private $login;
	private $sexo;
	
	function __construct($nome, $login, $sexo, $nivel) {
		parent::__construct();
		$this->nome = $nome;
		$this->login = $login;
		$this->sexo = $sexo;
		setcookie("nivel", $nivel, time()+3600*24*30, '/');
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
		return $_COOKIE["nivel"];
	}
	
	function avancaDeNivel() {
		$nivel = intval($this->getNivel());
		if ($nivel < 4) $nivel++;
		mysql_query("UPDATE cadastros SET id_nivel= " . $nivel . " WHERE email ='" . $this->email . "'");
		mysql_close();	
	}
	
	function getSalarioAtual() {
		return $_COOKIE["salarioAtual"];
	}
	
	function setSalarioAtual($novoSalario) {
		setcookie("salarioAtual", $novoSalario, time()+3600*24*30, '/');
	}
	
	function getScore() {
		return $_COOKIE["score"];
	}
	
	function setScore($novoScore) {
		setcookie("score", $novoScore, time()+3600*24*30, '/');
	}
	
	function commit() {
		$_SESSION["jogador"] = serialize($this);
	}
	
	function inserePontuacao(){
		$registroEmail = mysql_query("SELECT * FROM ranking WHERE email = '". $this->login ."'")or die(mysql_error()); // pesquisa no bd o erro que tem o id recebido
		
		$id_nivel = $_SESSION['id_nivel'];
		$pesquisaNivel = mysql_query("SELECT * FROM nivel WHERE id_nivel = $id_nivel") or die(mysql_error());
		$nivel = mysql_fetch_array($pesquisaNivel);
		
		if (mysql_num_rows($registroEmail) > 0) {
			mysql_query("UPDATE ranking SET nivel = '".$nivel["sigla"]."', pontuacao = '".$_SESSION["salarioAtual"]."' WHERE email = '".$email."'")or die(mysql_error());
		} else {
			mysql_query("INSERT INTO ranking (email, nome, nivel, pontuacao) VALUES ('".$_SESSION["email"]."', '".$_SESSION["nome"]."', '".$nivel["sigla"]."', '".$_SESSION["salarioAtual"]."')")or die(mysql_error());
		}	
		mysql_close();
	}
	
	static function getJogador() {
		return unserialize($_SESSION["jogador"]);
	}
	
	static function temJogador() {
		return isset($_SESSION["jogador"]);
	}
	
}
?>