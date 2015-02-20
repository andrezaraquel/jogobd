<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	<link href="css/paginaInicial.css" rel="stylesheet">
	<link href="css/ranking.css" rel="stylesheet">
</head>  
<body> 

<?php 
session_start();
$_SESSION["navbar"] = "voltar";
include_once("includes/navbar.php");
?>

<div class="col-sm-12" style="padding-top: 1%;">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3 conteudo">
			<div align="center">
				<img src='img/boneco-podium.png' class='bonecoRanking'>	
			</div>
			<div class='ranking row'>
				<div class="col-md-10 col-md-offset-1" align="center">	
					<table border="1px" class="tabelaRanking">
						<tr><th colspan="3" >Melhores Pontuações do Mr. Data Analyst</th></tr>
						<tr>
							<th>Nome</th>
							<th>Nível</th>
							<th>Pontuação</th>
						</tr>
						
						<?php
							include ("database/acessaBD.php");
							$melhores_pontuacoes = mysql_query("SELECT * FROM ranking ORDER BY pontuacao DESC LIMIT 10");
							$temp = "<tr>";
							while($linha = mysql_fetch_array($melhores_pontuacoes)) {
								$tamanhoMax = sizeof($linha)/2;
								for ($campo = 1; $campo < $tamanhoMax ; $campo++) {	
									$temp =  $temp . "<td>" . $linha[$campo] . "</td>" ;
								} 
								$temp = $temp . "</tr>";
							}
							echo $temp;
							mysql_close(); // fecha conexao
						?>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</div>		
		
</body>
</html>