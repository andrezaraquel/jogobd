<?php
if (isset($_SESSION["navbar"]) && ($_SESSION["navbar"] != "logout" || Jogador::temJogador())): ?>
	<nav class='navbar navbar-default navbar-static-top' role='navigation'>
		<div class='container'>
			<div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
				 <?php if (Jogador::temJogador() && $_SESSION["navbar"] == "logout"): ?>
					 <ul class='nav navbar-nav'>
						<?php require_once("models/Jogador.php");
						$jogador = Jogador::getJogador(); ?>
						<h3 style='color: black !important;'> Olá, <?php echo $jogador->getNome(); ?></h3>
					 </ul>		
				 <?php endif; ?>
				 <ul class='nav navbar-nav navbar-right'>
					<?php if ($_SESSION["navbar"] == "logout"): ?>
						<li><a href='logout.php' style='font-size: 25px;'><img src='img/boneco-sair.png'> Sair</a></li>
					<?php elseif ($_SESSION["navbar"] == "voltar"): ?>
						<li><a href='index.php' style='font-size: 25px;'><img src='img/boneco-sair.png'> Voltar</a></li>
					<?php elseif ($_SESSION["navbar"] == "comojogar"): ?>
						<li><a href="classificados.php" style='font-size: 25px;'><img src='img/boneco-sair.png'> Começar o Jogo</a></li>
					<?php endif; ?>
				</ul>
			</div>	
		</div>	
	</nav>
<?php endif; ?>