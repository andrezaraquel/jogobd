<!--
Classe que representa cada partida jogada pelo usuario.

authors: Andreza Raquel e Dandara Navarro
-->
<?php
session_start();
if(!isset($_SESSION['email']) || !isset($_SESSION['senha'])){
    header('Location: index.php');
	exit;
}

if(!isset($_SESSION['id_empresa']) || $_COOKIE["podeJogar"] == "false"){
	header('Location: classificados.php');
	exit;
}

if(count($_SESSION['listaDeCenarios']) == 5 && $_SESSION['score'] < 210){
	header('Location: classificados.php');
}
?>

<?php
setcookie('id_nivel', $_SESSION['id_nivel']);
setcookie('salarioInicial', $_SESSION['salarioInicial']);
?>

<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<title>Mr. Data Analyst</title>
		<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="img/favicon.ico">		
		
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.css" rel="stylesheet">
    
		
	
		<script src="js/bootstrap.min.js"></script>

		<link href="css/partidas.css" rel="stylesheet" />
		<?php
		if($_SESSION['sexo'] == 'feminino'){
			echo "<link rel='stylesheet' type='text/css' href='css/feminino.css'/>";
		}else{
			echo "<link rel='stylesheet' type='text/css' href='css/masculino.css'/>";
		}
		?>
		
		</head>
<body>	

	<nav class="navbar navbar-default navbar-static-top barraNavegacao" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>

				</button>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				
				<ul id='opcoesDoJogo' class="nav navbar-nav">
					<li class="active" >
						<a href="#jogo" role="tab" data-toggle="tab"><img src='img/boneco-jogo.png'>Jogo</a>
					</li>
					<?php
						if($_SESSION["id_nivel"] != 4 ){
							echo "<li>".
									"<a href='#tabela-erros' role='tab' data-toggle='tab'>".
									"<img src='img/boneco-pc.png'>Tabelas de Erros".
									"</a>".
								"</li>";
						}
					?>					
					<li><a href="#descricaoCenario" role="tab" data-toggle="tab"><img src='img/boneco-descricao.png'>Descri&ccedil;&atilde;o do Cen&aacute;rio</a></li>
				</ul>
				 <ul class="nav navbar-nav navbar-right">
					<li><a href="#ModalConfirmaLogout" data-toggle="modal"><img src='img/boneco-sair.png'> Sair</a></li>
				</ul>				
			</div>
		</div>
	</nav>
	
	<div class="tab-content">
		<div class="tab-pane active" id="jogo">
			<div class="container">
			
			   <div class="content-container clearfix">
					<div class="col-md-12">
					<?php
						require_once("partida.php");
					?>
				</div>			  
			</div>
		</div>
	</div>

	<div class="tab-pane" id="tabela-erros">		  
		<div class="container">
			<div class="content-container clearfix">
				<div class="col-md-12">
					<?php 
						require_once("tabelaDeErros.html");
					?>
				</div>
			</div>
		</div>		  
	</div>
	
	<div class="tab-pane" id="descricaoCenario">
		  
		<div class="container">
			<div class="content-container clearfix">
				<div class="col-md-12">
					<h1 class="content-title">Descri&ccedil;&atilde;o do Cen&aacute;rio</h1>
					<?php
						require_once("descricaoCenario.php");
					?>
				</div>
			</div>
		</div>
	</div>
	 
	  
	<div class="modal fade bs-modal-sm" id="ModalConfirmaLogout" tabindex="1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-sm" style=" margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;">
						<header class="modal-header">
							<button class="close" data-dismiss="modal" aria-hidden="true" style='color:white !important;'>X</button>
							<h4>Tem certeza que deseja sair?</h4>
							<h5>Se você sair perderá os dados salvos dessa rodada!</h5>
						</header>
						
						<div class="modal-footer">					
							<a class="btn btn-danger btn-large" href="classificados.php">Pedir Demissão</a>
							<a class="btn btn-danger btn-large" href="logout.php">Sair</a>
						 </div>
						
					</div>
				</div>
	</div>
</body>	
</html>		