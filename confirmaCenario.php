<?php
session_start();

if (!isset($_SESSION["email"]) || !isset($_SESSION["senha"])) {
	header("Location: index.php");
	exit;
} 
?>

<!DOCTYPE html>
<html lang="pt-br"> 
<head> 
	<meta charset="utf-8"> 

	<title>Mr. Data Analyst</title>
	<link rel="stylesheet" type="text/css" href="css/confirmaCenario.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/proposta.js"></script>
</head>
<body>
<?php
$_SESSION['id_empresa'] = $_GET['id_empresa']; // Criacao da sessao com o id da empresa que o usuario selecionou

include ('acessaBD.php'); // inclusao do arquivo de acesso ao banco de dados

// pesquisa o nivel do usuario atual
$pesquisaNivel = mysql_query("SELECT * FROM nivel WHERE id_nivel = ". $_SESSION['id_nivel']);
$nivel = mysql_fetch_array($pesquisaNivel); // transforma a pesquisa em um array
$nomeNivel = $nivel['nome']; // seleciona o nome do nivel e guarda na variavel

$pesquisaEmpresa = mysql_query("SELECT * FROM empresa WHERE id_empresa = ". $_SESSION['id_empresa']);
$empresa = mysql_fetch_array($pesquisaEmpresa);
$nomeEmpresa = $empresa['nome']; 

$_SESSION['salarioInicial'] = $nivel['salarioInicial']; // seleciona o salario referente ao nivel e guarda numa variavel
$_SESSION['salarioAtual'] = $_SESSION['salarioInicial'];
$_SESSION['listaDeCenarios'] = array();
$_SESSION['listaDeVitorias'] = array();
$_SESSION['score'] = 0;

setcookie("stringDeVitorias", implode("|", $_SESSION['listaDeVitorias']));
setcookie("podeJogar", "true");
?>
	<div class="confirmaEmprego">	
		<h4>Dados da Vaga:</h4>
		<h5><?php echo $nomeNivel;?></h5>
		<h5>Sal&aacuterio Inicial: R$ <?php echo $_SESSION['salarioInicial'];?></h5>
		<h5>Empresa: <?php echo $nomeEmpresa?></h5>	
	</div>
		
	<a href="javaScript:parent.location = 'jogo.php'" class='botaoAceita'></a>
	<a href="javaScript:parent.location = 'classificados.php'" class='botaoRejeita'></a>

<?php mysql_close();?>
</body>
</html>
