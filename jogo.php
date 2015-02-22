<!-- 
Classe que representa cada partida jogada pelo usuario.

authors: Andreza Raquel e Dandara Navarro
-->
<?php
require_once("includes/models.php");

if (!isset($_SESSION["empresa"])) {
	header('Location: classificados.php');
	exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br"> 
<head>
	<?php require_once("includes/header.php"); ?>
	<link href="css/partidas.css" rel="stylesheet" />
</head>
<body>	

<?php require_once("modals/confirmaLogout.php"); ?>

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
				<?php if ($jogador->getNivel() != Jogador::$ULTIMO_NIVEL): ?>
					<li>
						<a href='#tabela-erros' role='tab' data-toggle='tab'>
						<img src='img/boneco-pc.png'>Tabelas de Erros
						</a>
					</li>
				<?php endif; ?>			
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
				<?php require_once("includes/partida.php"); ?>
			</div>			  
		</div>
	</div>
</div>

<div class="tab-pane" id="tabela-erros">		  
	<div class="container">
		<div class="content-container clearfix">
			<div class="col-md-12">
				<?php require_once("includes/tabelaDeErros.php"); ?>
			</div>
		</div>
	</div>		  
</div>

<div class="tab-pane" id="descricaoCenario">
	<div class="container">
		<div class="content-container clearfix">
			<div class="col-md-12">
				<h1 class="content-title">Descri&ccedil;&atilde;o do Cen&aacute;rio</h1>
				<?php require_once("includes/descricaoCenario.php"); ?>
			</div>
		</div>
	</div>
</div>
 
</body>	
</html>		