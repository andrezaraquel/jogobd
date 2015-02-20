<?php
if(!isset($_SESSION)){
	session_start();
}
	
if(!isset($_SESSION['email']) || !isset($_SESSION['senha'])){
    header('Location: index.php');
}
?>
<?php
if(count($_SESSION['listaDeCenarios']) > count($_SESSION['listaDeVitorias'])){
				array_push($_SESSION['listaDeVitorias'], "n");
}
setcookie("stringDeVitorias", implode("|", $_SESSION['listaDeVitorias']));
setcookie("numCenarios", count($_SESSION['listaDeCenarios']));
?>



<!DOCTYPE html>
<html>
	<head lang="pt-br">	
		<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="img/favicon.ico">
		<link rel="canonical" href="http://mrdataanalyst.pe.hu" />		

		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.css" rel="stylesheet">
		<link href="css/partidas.css" rel="stylesheet" />
		
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/partidas.js"></script>	
		
		<!--Muda as cores de alguns itens visuais do jogo dependendo do sexo do usuario-->	
		<?php
			if($_SESSION['sexo'] == 'feminino'){
				echo "<link rel='stylesheet' type='text/css' href='css/feminino.css'/>";
			}else{
				echo "<link rel='stylesheet' type='text/css' href='css/masculino.css'/>";
			}
		?>
		
	</head>
<body>

	<div class = "row class='col-sm-12'">
		<h1 class="content-title">Mr. Data Analyst</h1>                   
	</div>
	
	<?php $imagem = "img/". $_SESSION['sexo']. ".png"; ?>
	<img src = "<?php echo $imagem; ?>" width="64" height="80" class = "posicaoAvatar">	
		
	<div class="row">	
		<div class='col-sm-4'>
			<font id = "nomeJogador"><?php echo "Olá, ". $_SESSION['nome'] ?></font>
		</div>						
	</div>
					
					
	<?php 
		include ('acessaBD.php');
		$id_nivel = $_SESSION['id_nivel'];
		$pesquisaNivel = mysql_query("SELECT * FROM nivel WHERE id_nivel = $id_nivel") or die(mysql_error());
		$nivel = mysql_fetch_array($pesquisaNivel);

		$salarioAtual = $_SESSION['salarioAtual'];
		$listaDeCenarios = $_SESSION['listaDeCenarios'];

		echo "<div class='row'>".
				"<div class='col-sm-12'>".
					"<div id = 'nivelJogador'>Você é ".$nivel['nome']. ".</div>".
				"</div>".
			"</div>"; 
		
		switch($id_nivel){
			case 1:
				setCookie("proximoNivel", "Analista de Dados Júnior");
				break;
			case 2:
				setCookie("proximoNivel", "Analista de Dados Pleno");
				break;
			case 3:
				setCookie("proximoNivel", "Analista de Dados Sênior");
				break;						
		}
		

		if(($id_nivel == 1 || $id_nivel == 2)){

		echo "<div class='row'>".
				"<div class='col-sm-4' align='left'>".
					"<div id = 'divContador'>Erros:  <font id = 'numeroDeErrosMarcados' color = 'red'>0</font> /  ".
						"<font id = 'numeroDeErrosExistentes'></font>".
					"</div>".
				"</div>".
				"<div class='col-sm-4' align='center'>".
					"<div id = 'divPlacar'> R$<font id = 'placar'>$salarioAtual</font>,00</div>".
				"</div>".
				"<div class='col-sm-4'  align='right'>".
					"<font id = 'contadorRegressivo'><span id='clock1'></span><script id = 'script'></script></font>".
				"</div>".
			"</div>";
		 
		} else{
			echo "<div class='row'>".
					"<div class='col-sm-4' align='left'>".
						"<div id = 'divContador'>Erros:  <font id = 'numeroDeErrosMarcados' color = 'red'>0</font></div>".
					"</div>".
					"<div class='col-sm-4' align='center'>".
						"<div id = 'divPlacar'> R$<font id = 'placar'>$salarioAtual</font>,00</div>".
					"</div>".
					"<div class='col-sm-4'  align='right'>".
						"<font id = 'contadorRegressivo'><span id='clock1'></span><script id = 'script'></script></font>".
					"</div>".
				"</div>";		 
		}
		mysql_close();
	?>
	
	<div class="progress row" id='divProgress'>
		   
		   <div  id='fase0' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 1</p></div>
		   <div  id='fase1' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 2</p></div>
		   <div  id='fase2' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 3</p></div>
		   <div  id='fase3' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 4</p></div>
		   <div  id='fase4' class='progress-bar progress-bar-desativado' style='width:20%'><p>Partida 5</p></div>
		   
   </div>
						   
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
		
		
		<?php				
		require_once 'mostraCenarios.php'; // conexao com o arquivo que desenha os cenarios na tela
			if (count($listaDeCenarios) < 5 ){
				selecionaTabelas();		
			} else {
				$_SESSION['listaDeCenarios'] = array();
				$_SESSION['listaDeVitorias'] = array();
				if($_SESSION["id_nivel"] < 4){
					if( $_SESSION['score'] >= 210){
						
					
						include("acessaBD.php");
						inserePontuacao(mysql_real_escape_string($_SESSION['email']));
						mysql_close();
						
						switch($_SESSION["id_nivel"]){
							case 1:
								$_SESSION["id_nivel"] = 2;
								break;
							case 2:
								$_SESSION["id_nivel"] = 3;
								break;
							case 3:
								$_SESSION["id_nivel"] = 4;
								break;
						
						}
						include ('acessaBD.php');
						mysql_query("UPDATE cadastros SET id_nivel=".$_SESSION["id_nivel"]. " WHERE email ='".$_SESSION["email"]. "'");
						
						$pesquisaSalario = mysql_query("SELECT salarioInicial FROM nivel WHERE id_nivel = ".$_SESSION["id_nivel"]);
						$salario = mysql_fetch_array($pesquisaSalario);
						
						$_SESSION["salarioInicial"] = $salario["salarioInicial"];	
						
						
						echo "<script>avancaCenario();</script>";
						
						mysql_close();
					
					
					}			
					
				}
				
			}
			?>

			<div class='modal fade' id='ModalAvancar' tabindex='1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true' data-backdrop='static'>
				<div class='modal-dialog modal-sm' style=' margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;'>
					<section class='modal-body' id='corpoModal'>
					</section>
					</br>
					<div class="modal-footer" align ='center'>
						<div class="col-sm-12">												
							<div style="float:left; padding-right:2px;"><?php echo "<a href='https://twitter.com/share' class='twitter-share-button' data-url='http://mrdataanalyst.pe.hu' data-text='Minha pontuação foi de $salarioAtual' data-lang='en' data-count='none' data-hashtags='ResultadoMrDataAnalyst,MinhaPontuacao'>Tweet</a>";?>
							</div>
							<div style="float:left;padding-right:2px;"><div class="fb-share-button" data-href="http://mrdataanalyst.pe.hu" data-layout="button" data-lang="en"></div></div>
							<div style="float:left; padding-right:2px;"><div class="g-plus" data-action="share" data-annotation="none" data-href="http://mrdataanalyst.pe.hu" data-lang="en"></div></div>
						</div>
						
					</div>
				</div>			
			</div>
			
			<?php
			include ("acessaBD.php");


			if ($id_nivel == 1 || $id_nivel == 2){
			$pesquisaDicas = mysql_query("SELECT * FROM cenario WHERE id_nivel = ".$_SESSION["id_nivel"]." AND id_cenario = ".$_SESSION["id_cenario"]. " AND id_empresa = ".$_SESSION["id_empresa"]);$array_dicas = mysql_fetch_array($pesquisaDicas);
			$dica1 = $array_dicas["dica1"];
			$dica2 = $array_dicas["dica2"];

			echo "
				<div class='divDica'>
							

					<a href='#ModalDica1' data-toggle='modal' rel='tooltip' title='1ª Dica' class='dica dica1'></a>
					</br>
					<a href='#ModalDica2' data-toggle='modal' rel='tooltip' title='2ª Dica' class='dica dica2'></a>


			</div>
			<div class='modal fade' id='ModalDica1' tabindex='1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true'>
				<div class='modal-dialog modal-sm' style=' margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;'>
							<header class='modal-header'>
								<button class='close' data-dismiss='modal' aria-hidden='true'>X</button>
								</br>
							</header>
							</br>
							
							<section class='modal-body'>
								<img class='boneco-dica'>
								<h5>".$dica1."</h5>
							</section>
							</br>
				</div>			
			</div>

			<div class='modal fade' id='ModalDica2' tabindex='1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true'>
				<div class='modal-dialog modal-sm' style=' margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;'>
							<header class='modal-header'>
								<button class='close' data-dismiss='modal' aria-hidden='true'>X</button>
							</br>
							</header>
							</br>
							
							<section class='modal-body'>
								<img class='boneco-dica'>
								<h5>".$dica2."</h5>
							</section>
							</br>
				</div>			
			</div>
			";

			} 
			mysql_close();
			?>

			<!--Botao que avanca quando esta enable.Precisa redirecionar para outra pagina e verificar os erros e acertos do usuario.--->
			<?php
			if($_SESSION['id_nivel'] == 1 || $_SESSION['id_nivel'] == 2){
				echo "<div id = 'divBotao'><input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar disable' onclick =  'avancar(false,".count($listaDeCenarios).")' action = 'mostraCenarios.php'/></div>";
			} else {
				echo "<div id = 'divBotao'><input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar enable' onclick =  'avancar(true,".count($listaDeCenarios).")' action = 'mostraCenarios.php'/></div>";
			}


			?>			
			
			<div>
				<div id = "divResultado"></div>
				<div id = "divInformes"></div>
				<div id = "divScore"></div>
			</div>
			
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