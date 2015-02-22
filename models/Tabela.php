<?php
require_once("Model.php");
class Tabela extends Model {
	
	private $nomeTabela;
	private $nome;
	private $nomeColunas;
	private $corpo;
	private $corpoErro;

	function __construct($nomeTabela) {
		parent::__construct();
		$this->nomeTabela = $nomeTabela;
		$this->nome = substr($nomeTabela, 0, strlen($nomeTabela) -2);
		$dadosColuna = mysql_query("SHOW COLUMNS FROM $nomeTabela"); 
		$this->nomeColunas = array();
		$i = 1;
		while($linha = mysql_fetch_assoc($dadosColuna)) {
			if (++$i % 2 == 1) {
				array_push($this->nomeColunas, $linha["Field"]);
			}
		} 
		unset($this->nomeColunas[count($this->nomeColunas)-1]);
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
		mysql_close();
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
	
	function countErros() {
		$erros = 0;
		$corpoErro = $this->getCorpoErro();
		for ($i = 0; $i < count($corpoErro); $i++) {
			$linha = $corpoErro[$i];
			for ($j = 0; $j < count($linha); $j++) {
				if ($linha[$j]) {
					$erros++;
				}
			}
		}
		return $erros;
	}
	
	function getErros() {
		$erros = array();
		$corpoErro = $this->getCorpoErro();
		for ($i = 0; $i < count($corpoErro); $i++) {
			$linha = $corpoErro[$i];
			for ($j = 0; $j < count($linha); $j++) {
				if ($linha[$j]) {
					if ($j == count($linha) - 1) {
						array_push($erros, array($i, -1, $linha[$j]));
					} else {
						array_push($erros, array($i, $j, $linha[$j]));
					}
				}
			}
		}
		return $erros;
	}
	
	function desenha() {
		$nome = $this->getNome();
		$output = "
		<table class='tabelaDoJogo' data-nome='" . $this->nomeTabela . "'>
			<thead>
				<tr>
					<th colspan ='10'> Tabela $nome</th>
				</tr>
			
			<tr><th></th>
		";
		foreach ($this->getNomeColunas() as $nomeColuna) {
			$output .= "<th>$nomeColuna</th>";
		}
		$output .= "</thead><tbody>";
		$corpo = $this->getCorpo();
		$corpoErro = $this->getCorpoErro();
		for ($i = 0; $i < count($this->getCorpo()); $i++) {
			$linha = $corpo[$i];
			$linhaErro = $corpoErro[$i];
			$ultimaColuna = count($linhaErro) - 1;
			$output .= "<tr>
					<td class='tdCheck' data-row='" . $i . "' data-col='-1'>
						<input type='checkbox' name='marcar[]' class='cursor' />
					</td>" ;
			for ($j = 0; $j < count($linha); $j++) {
				$output .= "<td data-row='" . $i . "' data-col='" . $j . "'>" . $linha[$j] . "</td>" ;
			}
			$output .= "</tr>";
		}
		$output .= "</tbody></table>";
		echo $output;
	}

}
?>