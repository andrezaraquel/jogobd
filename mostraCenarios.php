<?php
/*
Classe que permite a criacao das tabelas de um cenario.

authors: Andreza Raquel e Dandara Navarro
*/
/*Funcao que pesquisa o salario dependendo do nivel do jogador*/
function pesquisaSalario(){
	include ("acessaBD.php"); // acessa o arquivo de conexao com o bd

	$id_nivel = $_SESSION['id_nivel']; // recebe o id_nivel de partidas.js, utilizado para pesquisar de qual nivel se trata
	$consulta = mysql_query("SELECT * FROM nivel WHERE id_nivel = ". $id_nivel); // faz a consulta no bd do nivel
	$nivel = mysql_fetch_array($consulta); // tranforna a pesquisa em um array
	echo $nivel['salarioInicial'];  // imprime o indice do array que se refere ao salario

	mysql_close(); // fecha a conexao 
}

function getTabela($nomeTabela) {
	include("acessaBD.php");
	$dadosTabela = mysql_query("SELECT * FROM $nomeTabela");
	$tabela = array();
	while($linha = mysql_fetch_array($dadosTabela)) {
		array_push($tabela, array());
		$lastIndex = count($tabela) - 1;
		for ($i = 1; $i < count($linha)/4; $i++) {
			array_push($tabela[$lastIndex], $linha[$i*2-1]);
		}
	} 
	return $tabela;
}

// funcao que desenha na tela cada tabela do cenario

function pesquisaCenarioAleatorio(){
	include ("acessaBD.php"); // inclui o arquivo de conexao
	
	$cenarios = mysql_query("SELECT DISTINCT id_cenario FROM tabelas WHERE id_empresa = ". $_SESSION["id_empresa"]. " AND id_nivel = " . $_SESSION["id_nivel"]);
	$numCenarios = mysql_num_rows ($cenarios);
	return $numCenarios;
}
//funcao que seleciona as tabelas de um cenario escolhido aleatoriamente
function selecionaTabelas(){
	include ("acessaBD.php"); // inclui o arquivo de conexao
	
	$numeroMaximoDeCenarios = pesquisaCenarioAleatorio(); // Numero de cenarios cadastrados para cada empresa naquele nivel
	
	$cenarioAleatorio = rand(1,$numeroMaximoDeCenarios); // Pesquisa um numero aleatoriamente para ser o cenario
	
	
	// Verifica se o cenario ainda não foi escolhido naquela rodada.
	if (!in_array( $cenarioAleatorio  , $_SESSION['listaDeCenarios'])){
		
		$_SESSION["id_cenario"] = $cenarioAleatorio;
	
		// Se ainda não foi escolhido, adiciona na lista de escolhidos
		array_push($_SESSION['listaDeCenarios'], $cenarioAleatorio);
		// sessão que guarda a lista de cenarios
				
		$nivelJogador = $_SESSION['id_nivel']; 
		$id_empresa = $_SESSION['id_empresa'];
		
		// Pesquisa das tabelas no cenario escolhido aleatoriamente, na empresa escolhida e com o nivel do jogador 
		$nomesTabelas = mysql_query("SELECT nome FROM tabelas WHERE id_empresa = $id_empresa AND id_nivel = $nivelJogador AND id_cenario = $cenarioAleatorio"); // consulta a(s) tabela(s) referentes ao cenario

		// percorre a consulta pegando o nome da tabela
		while($nome = mysql_fetch_assoc($nomesTabelas)){
			$nomeTabela = $nome["nome"];
			desenhaTabela($nomeTabela); // manda desenhar cada tabela pesquisada
		}
	} else { // se o cenario j&aacute tiver sido retornado antes
		selecionaTabelas();// chama a funcao novamente
	}
}

?>

</html>