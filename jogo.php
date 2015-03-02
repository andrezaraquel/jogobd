<?php
require_once("includes/models.php");

if (!Empresa::temEmpresa() || !Partida::temPartida()) {
	header('Location: classificados.php');
	exit;
}

$jogador = Jogador::getJogador();
$partida = Partida::getPartida();
$empresa = Empresa::getEmpresa();
$nivel = new Nivel($jogador->getNivel());

if (count($partida->getListaDeVitorias()) >= 5) {
	$empresa->delete();
	$partida->delete();
	header('Location: classificados.php');
	exit;
}

if ($partida->getNumCenarios() < 5) {
	$partida->delete();
	$empresa->delete();
	echo '<script>
	alert("Não existem vagas suficientes para esta empresa.");
	window.location.href="classificados.php";
	</script>';
	exit;
} else {
	$cenario = new Cenario($empresa->getId(), $jogador->getNivel(), $partida->getCenarioAleatorio());
	$cenario->commit();
}
$tabelas = $cenario->getTabelas();
$erros = 0;
for ($i = 0; $i < count($tabelas); $i++) {
	$erros += $tabelas[$i]->countErros();
}
?>
<!DOCTYPE html>
<html lang="pt-br"> 
<head>
	<?php require_once("includes/header.php"); ?>
	<link href="css/partidas.css" rel="stylesheet" />
	<script type="text/javascript" src="js/partidas.js"></script>	
</head>
<body>	

<?php 
require_once("modals/confirmaLogout.php"); 
require_once("modals/avancar.php"); 
require_once("modals/dica1.php");
require_once("modals/dica2.php");
?>

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
				<div class = "row class='col-sm-12'">
					<h1 class="content-title">Mr. Data Analyst</h1>                   
				</div>

				<?php $imagem = "img/". $jogador->getSexo() . ".png"; ?>
				<img src = "<?php echo $imagem; ?>" width="64" height="80" class = "posicaoAvatar">	
					
				<div class="row">	
					<div class='col-sm-4'>
						<font id = "nomeJogador"><?php echo "Olá, ". $jogador->getNome() ?></font>
					</div>						
				</div>
								
				<div class='row'>
					<div class='col-sm-12'>
						<div id = 'nivelJogador'>Você é <?php echo $nivel->getNome(); ?>.</div>
					</div>
				</div>
						
				<div class='row'>
					<div class='col-sm-4' align='left'>
						<div id = 'divContador'>Erros:  <font id = 'numeroDeErrosMarcados' color = 'red'>0</font> 
						<?php if ($nivel->getId() <= 2): ?> <!-- Mostra erros existentes -->
							/ <font id = 'numeroDeErrosExistentes'><?php echo $erros; ?></font>
						<?php endif; ?>
						</div>
					</div>
					<div class='col-sm-4' align='center'>
						<div id = 'divPlacar'> R$<font id = 'placar'><?php echo $jogador->getSalarioAtual(); ?></font>,00</div>
					</div>
					<div class='col-sm-4'  align='right'>
						<font id = 'contadorRegressivo'><span id='clock1'></span><script id = 'script'></script></font>
					</div>
				</div>

				<div class="progress row" id='divProgress'>
					   <div  id='fase0' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 1</p></div>
					   <div  id='fase1' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 2</p></div>
					   <div  id='fase2' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 3</p></div>
					   <div  id='fase3' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 4</p></div>
					   <div  id='fase4' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 5</p></div>
				</div>
								
				<div class='divDica'>
					<a href='#ModalDica1' data-toggle='modal' rel='tooltip' title='1ª Dica' class='dica dica1'></a>
					</br>
					<a href='#ModalDica2' data-toggle='modal' rel='tooltip' title='2ª Dica' class='dica dica2'></a>
				</div>

				<?php
				foreach($tabelas as &$tabela) {
					$tabela->desenha();
				}
				?>
					   
				<!--Botao que avanca quando esta enable.Precisa redirecionar para outra pagina e verificar os erros e acertos do usuario.--->
				<div id = 'divBotao'>
					<input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar <?php if ($jogador->getNivel() <= 2) { echo("disable"); } else { echo("enable"); } ?>' onclick =  'avancar(<?php if ($jogador->getNivel() <= 2) { echo("false"); } else { echo("true"); } ?>)' action = 'mostraCenarios.php'>
				</div>

				<div>
					<div id = "divResultado"></div>
					<div id = "divInformes"></div>
					<div id = "divScore"></div>
				</div>
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

 <script type="text/javascript"> 
$(function() {
	$("#ModalDica1 h5").html('<?php echo $cenario->getDicaUm(); ?>');
	$("#ModalDica2 h5").html('<?php echo $cenario->getDicaDois(); ?>');
	
	$(".dica1").click(function(){
		$(this).removeClass("dica1");
		$(this).addClass("dica1Sel");
	});
	
	$(".dica2").click(function(){
		$(this).removeClass("dica2");
		$(this).addClass("dica2Sel");
	});
});
</script>

<!--facebook-->
<script type="text/javascript">
  (function() {
	var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	po.src = 'https://apis.google.com/js/platform.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<!--google plus-->
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<script type="text/javascript">
window.___gcfg = {lang: 'en-GB'};

  (function() {
	var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	po.src = 'https://apis.google.com/js/platform.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<!--twitter-->
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

</body>	
</html>		