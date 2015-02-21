<div style='position:relative;'>
	<div>
		<img src='img/mostraDescricao.png' style='position:absolute; top:3px; left:20%;' />
	</div>
	<div style='position:absolute; top:35%; padding: 7% 1% 10% 1%; left: 30%; right: 32%; color:black; font-size: 90%; text-align: center;'> 
	<?php
		if(!isset($_SESSION)){
			session_start();
		}
		include("database/acessaBD.php");

		$pesquisaDescricao = mysql_query("SELECT * FROM cenario WHERE id_empresa = ". $empresa->getId() ." AND id_nivel = ". $jogador->getNivel() ." AND id_cenario = ".$_SESSION['id_cenario']);

		$resultado = mysql_fetch_array($pesquisaDescricao);

		echo $resultado['descricao'];

		mysql_close();
	?>
	</div>
</div>
