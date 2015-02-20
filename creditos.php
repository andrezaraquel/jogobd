<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	<link href="css/paginaInicial.css" rel="stylesheet">
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
				<img src='img/boneco-creditos.png' class='bonecoCreditos'>
			</div>
			<div class='credito row'>
				<div class="col-md-10 col-md-offset-1" align="center">	
					<h3 style="font-weight:bold;">Jogo desenvolvido pelas alunas </h3>
					<h4>Andreza Raquel Monteiro de Queiroz (Aluna de Graduação) </h4>
					<h4>andreza.queiroz@ccc.ufcg.edu.br</h4>
					<h4>Dandara Dantas Navarro (Aluna de Graduação)</h4>
					<h4>dandara.navarro@ccc.ufcg.edu.br</h4>
					<h3 style="font-weight:bold;">do curso Ciência da Computação da UFCG</h3>
				</div>
			</div>
		</div>
	</div>
</div>		
		
</body>
</html>