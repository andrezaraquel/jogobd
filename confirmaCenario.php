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
$id_empresa = $_GET['id_empresa']; // Criacao da sessao com o id da empresa que o usuario selecionou

// pesquisa o nivel do usuario atual
$nivel = new Nivel($jogador->getNivel());
$empresa = new Empresa($id_empresa);

$_SESSION['empresa'] = serialize($empresa);

//$_SESSION['salarioInicial'] = $nivel['salarioInicial']; // seleciona o salario referente ao nivel e guarda numa variavel
$_SESSION['salarioAtual'] = $_SESSION['salarioInicial'];
$_SESSION['listaDeCenarios'] = array();
$_SESSION['listaDeVitorias'] = array();
$_SESSION['score'] = 0;

setcookie("stringDeVitorias", implode("|", $_SESSION['listaDeVitorias']));
setcookie("podeJogar", "true");
?>
	<div class="confirmaEmprego">	
		<h4>Dados da Vaga:</h4>
		<h5><?php echo $nivel->getNome(); ?></h5>
		<h5>Sal&aacuterio Inicial: R$ <?php echo $nivel->getSalarioInicial(); ?></h5>
		<h5>Empresa: <?php echo $empresa->getNome();?></h5>	
	</div>
		
	<a href="javaScript:parent.location = 'jogo.php'" class='botaoAceita'></a>
	<a href="javaScript:parent.location = 'classificados.php'" class='botaoRejeita'></a>

<?php mysql_close();?>
</body>
</html>
