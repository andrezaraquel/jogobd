
$(document).ready(function(){

    $("a[rel=modal]").click( function(ev){
        ev.preventDefault();
 
        var id = $(this).attr("href");
		var id_empresa = $(this).attr('name');
				
        var alturaTela = $('#jornal').height();
        var larguraTela = $('#jornal').width();
		
        //colocando o fundo preto
        $('#mascara').css({'width':larguraTela,'height':alturaTela});
        $('#mascara').fadeIn(1000);
        $('#mascara').fadeTo("slow",0.8);
 
        var left = ($(window).width() /3) - ( $(id).width() / 2 );
        var top = ($(window).height() / 4) - ( $(id).height() / 4 );
     
        $(id).show(); 
			
    });	

    $("#mascara").click( function(){
        $(this).hide();
        $(".window").hide();
    });
 
    $('.fechar').click(function(ev){
        ev.preventDefault();
        $("#mascara").hide();
        $(".window").hide();
    });
});

/*Funcao que mostra o frame referente a empresa que o usuario escolheu
	id_empresa: identificador da empresa escolhida
*/
function mostraFrame(id_empresa){
	$.ajax({
		url: 'database/selecionaEmpresa.php',
		type: 'POST',
		data: {
			"empresaId" : id_empresa
		},
		success: function(data) {
			document.getElementById('janela').innerHTML = "<iframe name = 'confirmaCenario' src='confirmaCenario.php' scrolling='auto' frameborder='0' width='100%' height='90%'></iframe>";
		}
	});
}
