<?php
require_once("Model.php");
class Partida extends Model {
	
	private $nivel;
	private $id_empresa;	
	private $cenariosJaApresentados;
	private $numCenarios;
	private $listaDeVitorias;
		
	function __construct($nivel, $id_empresa) {
		parent::__construct();
		$this->nivel = $nivel;
		$this->id_empresa = $id_empresa;
		$this->cenariosJaApresentados = array();
		$cenarios = mysql_query("SELECT DISTINCT id_cenario FROM tabelas WHERE id_empresa = " . $this->id_empresa . " AND id_nivel = " . $this->nivel) or die(mysql_error());
		$this->numCenarios = mysql_num_rows($cenarios);
		$this->listaDeVitorias = array();
		mysql_close();
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
			$this->addCenarioApresentado($cenarioAleatorio);
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
}
?>