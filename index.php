<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	
	<meta property="og:title" content="Minha pontuação!"> 
	<meta property="og:description" content="Aprenda você também"> 
	<meta property="og:image" content="http://mrdataanalyst.pe.hu/img/boneco-vencedor.png"> 
	
	<link href="css/paginaInicial.css" rel="stylesheet">
	
	<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script> 
</head>  
<body>  

<?php 
session_start();
$_SESSION["navbar"] = "logout";
include_once("includes/navbar.php"); 
?>

<div class="row">
	<div class="col-sm-6 col-sm-offset-3 conteudo" >
			<img src='img/boneco-lupa.png' class='bonecoIndex col-sm-12'>							
			<div class='botoesIndex row' align="center">
				<div class="col-sm-6 col-sm-offset-3" style="margin-top:20%">
					<?php
						if (isset($_SESSION["jogador"])) {
							echo "<a class='btn btn-lg btn-primary botaoInicial' href='classificados.php'>Jogar</a>";
						} else{
							echo "<a class='btn btn-lg btn-primary botaoInicial' href='#LoginModal' data-toggle='modal' >Jogar</a>";
						}
					?>							
				</div>
				<div class="col-sm-6 col-sm-offset-3" style="margin-top: 1%;">
					<a class="btn btn-lg btn-primary botaoInicial" href="ranking.php">Melhores Pontuações</a>
				</div>
				<div class="col-sm-6 col-sm-offset-3" style="margin-top: 1%;">
					<a class="btn btn-lg btn-primary botaoInicial" href='creditos.php'>Créditos</a>
				</div>
			</div>		
	</div>
</div>

<?php include_once("modals/login.php"); ?>

<script type="text/javascript" src="js/login.js" />

</body>
</html>