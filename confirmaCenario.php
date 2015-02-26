<?php
require_once("includes/models.php");
?>
<!DOCTYPE html>
<head> 
	<link rel="stylesheet" type="text/css" href="css/confirmaCenario.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/proposta.js"></script>
</head>
<body>
<?php
$nivel = new Nivel($jogador->getNivel());
$jogador->setSalarioAtual($nivel->getSalarioInicial());
$jogador->setScore(0);
$empresa = new Empresa($_GET['id_empresa']); // Criacao da sessao com o id da empresa que o usuario selecionou
$partida = new Partida($jogador->getNivel(), $_GET['id_empresa']);
$empresa->commit();
$partida->commit();
?>
<div class="confirmaEmprego">	
	<h4>Dados da Vaga:</h4>
	<h5><?php echo $nivel->getNome(); ?></h5>
	<h5>Sal&aacuterio Inicial: R$ <?php echo $nivel->getSalarioInicial(); ?></h5>
	<h5>Empresa: <?php echo $empresa->getNome(); ?></h5>	
</div>
	
<a href="javaScript:parent.location = 'jogo.php'" class='botaoAceita'></a>
<a href="javaScript:parent.location = 'classificados.php'" class='botaoRejeita'></a>

</body>
</html>
