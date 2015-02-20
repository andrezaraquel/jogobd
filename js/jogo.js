$(function(){
$('a[title]').tooltip();


$("#linkCenario").click(function(e){
	$("#cenario").show();	
	$("#descricao").hide();
	$("#erros").hide();
	$("#settings").hide();
	$("#doner").hide();
});

$("#linkDescricao").click(function(e){
	$("#descricao").show();
	$("#cenario").hide();	
	$("#erros").hide();
	$("#settings").hide();
	$("#doner").hide();
});

$("#linkErros").click(function(e){
	$("#erros").show();
	$("#cenario").hide();	
	$("#descricao").hide();
	$("#settings").hide();
	$("#doner").hide();
});

});

