<?php
require_once("Model.php");
class Partida extends Model{
	
	private $nivel;
	private $id_empresa;	
	private $cenariosJaApresentados;
		
	function __construct($nivel, $id_empresa) {
		$this->nivel = $nivel;
		$this->id_empresa = $id_empresa;
		$this->cenariosJaApresentados = array();
		mysql_close();
	}
	
	function getCenariosJaApresentados() {
		return $this->cenariosJaApresentados;
	}
	
	function addCenarioApresentado($cenario) {
		array_push($this->cenariosJaApresentados, $cenario);
	}
	
	function getCenarioAleatorio() {
		$numeroMaximoDeCenarios = pesquisaCenarioAleatorio(); // Numero de cenarios cadastrados para cada empresa naquele nivel
		$cenarioAleatorio = rand(1, $numeroMaximoDeCenarios); // Pesquisa um numero aleatoriamente para ser o cenario
		if (!in_array( $cenarioAleatorio, cenariosJaApresentados)){
			return $cenarioAleatorio;
		} 
		
		return getCenarioAleatorio();
	}
	
	private function numCenarios(){		
		$cenarios = mysql_query("SELECT DISTINCT id_cenario FROM tabelas WHERE id_empresa = ". $_SESSION["id_empresa"]. " AND id_nivel = " . $_SESSION["id_nivel"]);
		$numCenarios = mysql_num_rows ($cenarios);
		return $numCenarios;
	}
	
}
?>