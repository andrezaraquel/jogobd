<?php
require_once("models/Jogador.php");
if (Jogador::temJogador()) {
	header('Location: index.php');
	exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	<link href="css/paginaInicial.css" rel="stylesheet">
</head>
<body>
 
<div class="col-sm-12" style="padding-top: 6%;">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3 conteudo">
			<img src='img/boneco-cadastra.png' width='150' height='200'  style ='float:left;margin:15% 0% 15% 10%;'>
			<h1>Cadastro</h1>
			<center>
				<form class="form-horizontal" name="cadastro" method="post" id="formCadastro" onsubmit="return validaCampo();">
					<!-- Text input-->
					<div class="control-group">
					  <label class="control-label" for="nome">Nome</label>
					  <div class="controls">
						<input id="nome" name="nome" placeholder="Digite seu nome" required class="input-xlarge" type="text">
					  </div>
					</div>
					<!-- Text input-->
					<div class="control-group">
					  <label class="control-label" for="usuario">Email</label>
					  <div class="controls">
						<input id="email" name="email" placeholder="exemplo@exemplo.com.br" class="input-xlarge" required type="text" onkeyup="twitter.updateUrl(this.value)">
					  </div>
					</div>
					<!-- Multiple Radios -->
					<div class="control-group">
					  <label class="control-label" for="radios">Sexo</label>
					  <div class="controls">
						<label class="radio" for="radios-0">
						  <input name="sexo" id="feminino" value="feminino" checked="checked" type="radio">
						  Feminino
						</label>
						<label class="radio" for="radios-1">
						  <input name="sexo" id="masculino" value="masculino" type="radio">
						  Masculino
						</label>
					  </div>
					</div>
					<!-- Password input-->
					<div class="control-group">
					  <label class="control-label" for="senha">Senha</label>
					  <div class="controls">
						<input id="senha" name="senha" placeholder="Digite sua senha" required class="input-xlarge" type="password">
					  </div>
					</div>
					<!-- Button -->
					<div class="control-group">
					  <label class="control-label" for="cadastro"></label>
					  <div class="controls">
						<input type="submit" value="Finalizar Cadastro" class="btn btn-success" id="cadastro">
					  </div>
					</div>
				</form>
			</center>
		</div>
	</div>
</div>
 
<?php include_once("modals/message.php"); ?>

<script type="text/javascript">
function validaCampo(){
	var msg = false;
	if ((document.cadastro.nome.value).length < 3) {
		msg = "O campo NOME deve conter pelo menos 3 caracteres!";
	} else if (!validaEmail(document.cadastro.email)) {
		msg = "Email inválido!";
	} else if ((document.cadastro.senha.value).length < 6) {
		msg = "O campo SENHA deve conter pelo menos 6 caracteres!";
	}
	if (msg) {
		$(".modal-body > p").html(msg);
		$("#MessageModal").modal('show');
	} else {
		$.ajax({
			type: 'POST',
			url: 'database/cadastrar.php',
			data: $("#formCadastro").serialize(),
			success: function(data) {
				window.location.href = 'comoJogar.php';
			},
			error: function(data) {
				$(".modal-body > p").html(data.statusText);
				$("#MessageModal").modal('show');
			}
		});
	}
	return false;
}

function validaEmail(field) { 
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(field.value);
}
</script>

</body>
</html>