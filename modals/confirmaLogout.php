<div class="modal fade bs-modal-sm" id="ModalConfirmaLogout" tabindex="1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" style=" margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;">
			<header class="modal-header">
				<button class="close" data-dismiss="modal" aria-hidden="true" style='color:white !important;'>X</button>
				<h4>Tem certeza que deseja sair?</h4>
				<h5>Se você sair perderá os dados salvos dessa rodada!</h5>
			</header>
			
			<div class="modal-footer">					
				<a class="btn btn-danger btn-large" href="classificados.php" onclick="demissao()">Pedir Demissão</a>
				<a class="btn btn-danger btn-large" href="logout.php">Sair</a>
			 </div>
			
		</div>
	</div>
</div>

<script type="text/javascript">
function demissao() {
	<?php 
	if (Empresa::temEmpresa()) $empresa->delete();
	if (Cenario::temCenario()) $cenario->delete();
	if (Partida::temPartida()) $partida->delete();
	?>
}
</script>
