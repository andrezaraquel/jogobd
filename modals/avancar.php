<?php $jogador = Jogador::getJogador(); ?>
<div class='modal fade' id='ModalAvancar' tabindex='1' role='dialog' aria-labelledby='mySmallModalLabel' aria-hidden='true' data-backdrop='static'>
	<div class='modal-dialog modal-sm' style=' margin-top: 14%; background-color: rgb(48, 80, 128); border-radius: 4%;'>
		<section class='modal-body' id='corpoModal'>
		</section>
		</br>
		<div class="modal-footer" align ='center'>
			<div class="col-sm-12">												
				<div style="float:left; padding-right:2px;">
					<?php echo "<a href='https://twitter.com/share' class='twitter-share-button' data-url='http://mrdataanalyst.pe.hu' data-text='Minha pontuação foi de " . $jogador->getSalarioAtual() . "' data-lang='en' data-count='none' data-hashtags='ResultadoMrDataAnalyst,MinhaPontuacao'>Tweet</a>";?>
				</div>				
				<div style="float:left; padding-right:2px;" class="g-plusone" data-size="tall" data-annotation="none" data-href="http://www.mrdataanalyst.pe.hu"></div>			
			</div>
		</div>
	</div>			
</div>