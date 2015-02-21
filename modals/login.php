<div class="modal fade" id="LoginModal" tabindex="1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-sm" style="margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;">
		<header class="modal-header">
			<button class="close" data-dismiss="modal" aria-hidden="true">X</button>
			<h3 id="meuModalLabel">Faça seu Login</h3>
		</header>	
		<section class="modal-body">		
			<form class="form-horizontal" id="loginForm" name="login">					
				<div class="alert alert-danger" id="msgLoginError" style="display: none;">
					<p></p>
				</div>
				<div class="control-group">
					<div class="input-group" style="width: 100%">
						<label for="email" class="control-label">E-mail</label>
						<input type="text" name="email" class="form-control" required placeholder="Insira seu email" maxlength="60" onblur="validaEmail(login.email)">
						<div id="msgEmail"></div>
					</div>
					<div class="input-group" style="width: 100%">
						<label for="senha" class="control-label">Senha</label>
						<input type="password" name="senha" class="form-control" required placeholder="Insira sua senha">
					</div>
				</div>		
			</form>		
		</section>
		<div class="modal-footer">
			<center>
				<a href="cadastro.php"><button class="btn btn-danger btn-large">Não possuo cadastro</button></a>
				<input type="submit" value="Entrar" class="btn btn-success btn-large" id="loginSubmitBtn" />		
			</center>
		</div>
	</div>
</div>