<?php
require_once("includes/models.php");
setcookie("score", 0); // criando um cookie para guarda o score obtido.
setcookie("podeJogar", "false");
?>
<!DOCTYPE html>
<html lang="pt-br"> 
<head>
	<?php include_once("includes/header.php"); ?>
	<link rel="stylesheet" type="text/css" href="css/classificados.css">
	<link rel="stylesheet" type="text/css" href="css/confirmaCenario.css">
	<script type="text/javascript" src="js/proposta.js"></script> 
</head>

<body class='corDoFundo'>
	
<?php 
$_SESSION["navbar"] = "logout";
include_once("includes/navbar.php");
?>

<div class="row-fluid">
	<div class="span8 offset2" align="center" style="height:100%;">
		<div class="jornal" id="jornal" align="center">
			<div id='conteudo'>
				<a href="#janela" rel="modal" name = '1' onclick ='mostraFrame(1);'><img class="anuncio anuncio01"></a>
				<a href="#janela" rel="modal" name = '2' onclick ='mostraFrame(2);'><img class="anuncio anuncio02"></a>
				<a href="#janela" rel="modal" name = '3' onclick ='mostraFrame(3);'><img class="anuncio anuncio03"></a>
				<a href="#janela" rel="modal" name = '4' onclick ='mostraFrame(4);'><img class="anuncio anuncio04"></a>
				<a href="#janela" rel="modal" name = '5' onclick ='mostraFrame(5);'><img class="anuncio anuncio05"></a>
				<a href="#janela" rel="modal" name = '6' onclick ='mostraFrame(6);'><img class="anuncio anuncio06"></a>
				<a href="#janela" rel="modal" name = '7' onclick ='mostraFrame(7);'><img class="anuncio anuncio07"></a>
				<a href="#janela" rel="modal" name = '8' onclick ='mostraFrame(8);'><img class="anuncio anuncio08"></a>
				<a href="#janela" rel="modal" name = '9' onclick ='mostraFrame(9);'><img class="anuncio anuncio09"></a>
				<a href="#janela" rel="modal" name = '10' onclick ='mostraFrame(10);'><img class="anuncio anuncio10"></a>
				<a href="#janela" rel="modal" name = '11' onclick ='mostraFrame(11);'><img class="anuncio anuncio11"></a>
				
				<img class = 'leitor'>										
			</div>
			<div class="window conteudo" id="janela"></div>
			<!-- mascara para cobrir o jormal -->  
			<div id="mascara"></div>
		</div>
	</div>
</div>

</body>
</html>	