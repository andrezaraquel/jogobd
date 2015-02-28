<?php
require_once("includes/models.php");
$jogador = Jogador::getJogador();
$nivel = new Nivel($jogador->getNivel());
$empresa = new Empresa($_GET["empresaId"]);
?>
<!DOCTYPE html>
<head> 
	<link rel="stylesheet" type="text/css" href="css/confirmaCenario.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/proposta.js"></script>
</head>
<body>

<div class="confirmaEmprego">	
	<h4>Dados da Vaga:</h4>
	<h5><?php echo $nivel->getNome(); ?></h5>
	<h5>Sal&aacuterio Inicial: R$ <?php echo $nivel->getSalarioInicial(); ?></h5>
	<h5>Empresa: <?php echo $empresa->getNome(); ?></h5>	
</div>
	
<a href="#" class='botaoAceita'></a>
<a href="javaScript:parent.location = 'classificados.php'" class='botaoRejeita'></a>

<script type="text/javascript">
$(".botaoAceita").click(function() {
	$.ajax({
		url: 'database/contratar.php',
		type: 'post',
		data: {
			"empresaId" : "<?php echo $_GET["empresaId"]; ?>"
		},
		success: function(data) {
			javaScript:parent.location = 'jogo.php';
		}
	});
});
</script>

</body>
</html>
