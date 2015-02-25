<?php
require_once("includes/models.php");

$nivel = new Nivel($jogador->getNivel());
$partida = new Partida($jogador->getNivel(), $empresa->getId());
if ($partida->getNumCenarios() < 5) {
	unset($_SESSION['empresa']);
	echo '<script>
	alert("Não existem vagas suficientes para esta empresa.");
	window.location.href="classificados.php";
	</script>';
	exit;
} else {
	$cenario = new Cenario($empresa->getId(), $jogador->getNivel(), $partida->getCenarioAleatorio());
	$_SESSION["cenario"] = serialize($cenario);
	$_SESSION["partida"] = serialize($partida);
}

require_once("modals/avancar.php"); 
require_once("modals/dica1.php");
require_once("modals/dica2.php");

$nomesTabelas = $cenario->getTabelas();
$tabelas = array();
$erros = 0;
for ($i = 0; $i < count($nomesTabelas); $i++) {
	$tabela = new Tabela($nomesTabelas[$i]);
	$erros += $tabela->countErros();
	array_push($tabelas, $tabela);
}
?>
<!DOCTYPE HTML>
<html>
<head>
	<script type="text/javascript" src="js/partidas.js"></script>	
	<link href="css/partidas.css" rel="stylesheet" >
</head>
<body>

<?php
/*
if(count($_SESSION['listaDeCenarios']) > count($_SESSION['listaDeVitorias'])){
				array_push($_SESSION['listaDeVitorias'], "n");
}
setcookie("stringDeVitorias", implode("|", $_SESSION['listaDeVitorias']));
setcookie("numCenarios", count($_SESSION['listaDeCenarios']));
*/
?>

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
<div id = 'divBotao'><input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar disable' onclick =  'avancar(<?php if ($jogador->getNivel() <= 2) { echo("true"); } else { echo("false"); } ?>,"<?php echo $partida->getNumCenarios(); ?>")' action = 'mostraCenarios.php'/></div>

<div>
	<div id = "divResultado"></div>
	<div id = "divInformes"></div>
	<div id = "divScore"></div>
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
	
<?php 		
	function inserePontuacao($email){
		$registroEmail = mysql_query("SELECT * FROM ranking WHERE email = '". $email."'")or die(mysql_error()); // pesquisa no bd o erro que tem o id recebido
		
		$id_nivel = $_SESSION['id_nivel'];
		$pesquisaNivel = mysql_query("SELECT * FROM nivel WHERE id_nivel = $id_nivel") or die(mysql_error());
		$nivel = mysql_fetch_array($pesquisaNivel);
		
		
		
		if (mysql_num_rows($registroEmail) > 0){
			mysql_query("UPDATE ranking SET nivel = '".$nivel["sigla"]."', pontuacao = '".$_SESSION["salarioAtual"]."' WHERE email = '".$email."'")or die(mysql_error());
		} else{
			mysql_query("INSERT INTO ranking (email, nome, nivel, pontuacao) VALUES ('".$_SESSION["email"]."', '".$_SESSION["nome"]."', '".$nivel["sigla"]."', '".$_SESSION["salarioAtual"]."')")or die(mysql_error());
		}			
	}
?>

</body>
</html>
		
