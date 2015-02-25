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
// pesquisa o nivel do usuario atual
$nivel = new Nivel($jogador->getNivel());
$empresa = new Empresa($_GET['id_empresa']); // Criacao da sessao com o id da empresa que o usuario selecionou

$_SESSION['empresa'] = serialize($empresa);
$jogador->setSalarioAtual($nivel->getSalarioInicial());
$_SESSION["jogador"] = serialize($jogador);
setcookie("score", 0); // criando um cookie para guarda o score obtido.
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
