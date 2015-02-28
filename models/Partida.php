<?php
require_once("Model.php");
class Partida extends Model {
	
	private $nivel;
	private $empresaId;	
	private $cenariosJaApresentados;
	private $numCenarios;
	private $listaDeVitorias;
		
	function __construct($nivel, $empresaId) {
		parent::__construct();
		$this->nivel = $nivel;
		$this->empresaId = $empresaId;
		$this->cenariosJaApresentados = array();
		$cenarios = mysql_query("SELECT DISTINCT id_cenario FROM tabelas WHERE id_empresa = " . $empresaId . " AND id_nivel = " . $nivel) or die(mysql_error());
		$this->numCenarios = mysql_num_rows($cenarios);
		$this->listaDeVitorias = array();
		mysql_close();
	}
	
	function getEmpresaId() {
		return $this->empresaId;	
	}
	
	function getCenariosJaApresentados() {
		return $this->cenariosJaApresentados;
	}
	
	function addCenarioApresentado($cenario) {
		array_push($this->cenariosJaApresentados, $cenario);
	}
	
	function getCenarioAleatorio() {
		$numeroMaximoDeCenarios = $this->numCenarios; // Numero de cenarios cadastrados para cada empresa naquele nivel
		$cenarioAleatorio = rand(1, $numeroMaximoDeCenarios); // Pesquisa um numero aleatoriamente para ser o cenario
		if (!in_array($cenarioAleatorio, $this->cenariosJaApresentados)){
			return $cenarioAleatorio;
		} 
		return $this->getCenarioAleatorio();
	}
	
	function getNumCenarios() {		
		return $this->numCenarios;
	}
	
	function getListaDeVitorias() {
		return $this->listaDeVitorias;
	}
	
	function addResultadoNaListaDeVitorias($resultado) {
		array_push($this->listaDeVitorias, $resultado);
	}
	
	function commit() {	
		$_SESSION["partida"] = serialize($this);
	}
		
	function delete() {
		unset($_SESSION["partida"]);
	}
	
	static function getPartida() {
		return unserialize($_SESSION["partida"]);
	}
	
	static function temPartida() {
		return isset($_SESSION["partida"]);
	}
	
}
?>