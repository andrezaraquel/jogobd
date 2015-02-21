<?php
class Tabela {
	
	private $nome;
	private $nomeColunas;
	private $corpo;
	private $corpoErro;

	function __construct($nomeTabela) {
		require_once("database/acessaBD.php");
		$this->nome = substr($nomeTabela, 0, strlen($nomeTabela) -2);
		$this->setNomeColunas($nomeTabela);
		$this->setCorpo($nomeTabela);
		mysql_close();
	}
		
	function setNomeColunas($nomeTabela) {
		$dadosColuna = mysql_query("SHOW COLUMNS FROM $nomeTabela"); 
		$this->nomeColunas = array();
		$i = 1;
		while($linha = mysql_fetch_assoc($dadosColuna)) {
			if (++$i % 2 == 1) {
				array_push($this->nomeColunas, $linha["Field"]);
			}
		} 
		unset($this->nomeColunas[count($this->nomeColunas)-1]);
	}
	
	function setCorpo($nomeTabela) {
		$dadosTabela = mysql_query("SELECT * FROM $nomeTabela");
		$this->corpo = array();
		$this->corpoErro = array();
		while($linha = mysql_fetch_assoc($dadosTabela)) {
			array_push($this->corpo, array());
			array_push($this->corpoErro, array());
			$lastIndex = count($this->corpo) - 1;
			$colunas = array_keys($linha);
			$ultimaPosicao = count($colunas) - 1;
			$ultimaColuna = $colunas[$ultimaPosicao];
			for ($i = 1; $i < count($colunas)/2; $i++) {
				$coluna = $colunas[$i*2-1];
				$colunaErro = $colunas[$i*2];
				array_push($this->corpo[$lastIndex], $linha[$coluna]);
				array_push($this->corpoErro[$lastIndex], $linha[$colunaErro]);
			}
			array_push($this->corpoErro[$lastIndex], $linha[$ultimaColuna]);
		} 
	}
	
	function getNome() {
		return $this->nome;
	}
	
	function getNomeColunas() {
		return $this->nomeColunas;
	}
	
	function getCorpo() {
		return $this->corpo;
	}
	
	function getCorpoErro() {
		return $this->corpoErro;
	}
	
}
?>