/* Arquivo javascript para dinamismo da pagina onde o jogador 
marca os erros e avanca, verificando sua pontuacao

authors: Andreza Raquel e Dandara Navarro
*/

var errosExistentes = 0;
var numErrosEncontrados = 0;
var numNaoMarcados = 0;
var numMarcacoesIncorretas = 0;
var clicked = 0;
var tempo;
var horas = "0"+0; 
var minutos = tempoMaximoPorNivel();
var segundos = +1;

function tempoMaximoPorNivel(){	
	var tempoNivel;	
	switch ($.cookie("id_nivel")){		
		case "1":
			tempoNivel = "0" + 5;
			break;
		case "2":
			tempoNivel = "0" + 4;
			break;
		case "3":
			tempoNivel = "0" + 3;
			break;
		case "4":
			tempoNivel = "0" + 2;
			break;
	}
	return tempoNivel;
}

/*Funcao que eh chamada sempre q a pagina carrega*/
$(function () {	
	selecionaCelula(); // Funcao que colore a celula marcada com o clique do mouse
	
	document.getElementById('script').innerHTML = setTimeout('contadorRegressivo()',1000);	// Contador regressivo aparecer na tela
	
	mostraErrosExistentes(); // Conta os erros existentes no cenario
	selecionaLinha(); // Marca a linha inteira como erro
	cliqueDicas();
	if($.cookie("numCenarios") < 5){
		preencheBarraDeProgresso(false);
	} else {
		limpaProgresso();		
	}
	
});


function cliqueDicas(){
	$(".dica1").click(function(){
		$(this).removeClass("dica1");
		$(this).addClass("dica1Sel");
	});
	
	$(".dica2").click(function(){
		$(this).removeClass("dica2");
		$(this).addClass("dica2Sel");
	});
}

/*Funcao que marca a celula quando o mouse eh clicado*/
function selecionaCelula(){		
	$("table > tbody > tr > td").click(function () {// Evento acionado quando uma td é clicada
		if(minutos != null && $(this).parent().parent().parent().attr("class") != "tabelaDeErros"){
		
			var tr = $(this).parent();
			
			if (tr.attr("class") != "selected" && $(this).hasClass("destaque")){	// se a celula jah foi clicada, desmarque
				
				clicked--;	// numero de marcacoes diminui
				$(this).removeClass("destaque"); // remove a cor rosa

			} else if (tr.attr("class") != "selected" && (clicked < errosExistentes || nivelAtual > 2) && !$(this).hasClass("tdCheck")){	// Se não, verifica se a quantidade de marcacao eh menor que a quantidade de erros existentes
				
				clicked++;	// incrementa a quantidade de marcacao
				$(this).addClass("destaque"); // Adiciona a cor rosa
			}

			habilitaDesabilitaBotaoAvancar(); // Funcao que verifica se eh preciso habilitar ou desabilitar o botao de avancar

			atualizaQuantidadeMarcacoes(); // Funcao que atualiza na tela a quantidade de marcacoes feitas ateh o momento
		}
	});
}

function selecionaLinha(){   
	$('table > tbody > tr > td > :checkbox').click(function(){	
	if($(this).parent().parent().parent().attr("id") != "tabelaDeErros"){
       var tr = $(this).parent().parent();
	   var incremento = 1;
		$(tr).find('td').each(function(e){
			if ($(this).hasClass('destaque')){
				$(this).removeClass('destaque');
				incremento--;
			}				
		});
	   if ($(this).is(':checked') && ((clicked < errosExistentes || nivelAtual > 2) || incremento < 1)){			
			$(tr).addClass('selected');
			clicked += incremento;
	   } else if ($(this).is(':checked')) {			
			$(this).removeAttr('checked');
	   }else {
			$(tr).removeClass('selected');
			clicked--;		
	   }
	  }
     });
}

/*Funcao que atualiza na tela a quantidade de marcacoes a cada clique*/
function atualizaQuantidadeMarcacoes(){
	var contador = document.getElementById("numeroDeErrosMarcados");// procura o local onde a quantidade de marcacao deve aparecer
	if(contador != null){
		contador.innerHTML = "<font color= #d9534f>" + clicked + "</font>" // Mostra a quantidade atual de marcacoes na pagina.
	}
}

/*Funcao que habilita ou desabilita o botao de avancar */
function habilitaDesabilitaBotaoAvancar(){
	if(clicked == errosExistentes || nivelAtual > 2){ // se a quantidade de marcacoes for igual aa quantidade de erros
		$("#buttonAvancar").addClass("enable");// habilita o botao
		$("#buttonAvancar").addClass("hover"); // permite que o  mouse fique no formato de maozinha ao ser passado por cima do botao

		$("input").removeClass("disable"); // remove a class de desabilitado

	} else{ // se nao desabilita o botao novamente

		$("input").removeClass("enable");
		$("input").removeClass("hover");
		$("input").addClass("disable");
	}
}

/*Funcao para o contador regressivo*/
function contadorRegressivo(){
	segundos--;

	if(segundos==-1){ // reinicia a contagem regressiva do segundos
		segundos=59;
		if(minutos ==1){ // tratamento para os minutos ficarem com duas casas sempre
			minutos="0" + 0;

		} else if (minutos == "00") { // verifica se o tempo esgotou!!
			alert("Tempo Esgotado! :(");
			segundos = -1;
			avancar(true, null); // parametro de controle. Ele sendo true pode avancar mesmo q o botao esteja desabilitado

		}else if (minutos != null){ // se nada disse acontecer continua a contagem regressiva.
			minutos = "0" + --minutos;
		}
	}

	if(segundos<=9)segundos="0"+segundos; // decrementa sempre os segundos	
	
	
	atualizaTempoNaPagina();
	if(minutos == 0 && segundos <= 59){
		piscando();
	}	
	setTimeout('contadorRegressivo()',1000); // chama a funcao a cada segundo
	
	
}

function piscando(){  
               
	divPisca = document.getElementById("contadorRegressivo");    
	if(divPisca.getAttribute("style")=="VISIBILITY: hidden"){                              
		divPisca.setAttribute("style", "VISIBILITY: visible");            
	}else{                   
		divPisca.setAttribute("style", "VISIBILITY: hidden");                       
	}          
}

/*Funcao que atualiza o tempo na pagina a cada segundo*/
function atualizaTempoNaPagina(){
	tempo = horas+"<font color=#000000>:</font>"+minutos+"<font color=#000000>:</font>"+segundos; // procura o local onde o tempo deve aparecer
	document.getElementById('clock1').innerHTML=tempo; //mostra o tempo atual na pagina
}

/*Funcao ajax que retorna o erro de cada celula*/
function getErro(celula, id) {
	$.ajax({
		type: 'get',
		url: "pesquisaErro.php",
		data: {identificador: id},
	}).done(function(data){
		celula.attr('title', data);
	});

}


function coloreLinhas(){
	$("table > tbody > tr > td").each(function(i){
		var tr = $(this).parent();
		
		if ($(this).attr("class") == "tdCheck campoErro" && $(tr).attr("class") == "selected"){
						
			numErrosEncontrados++; // incrementa a quantidade de erros encontrados 
			$(tr).removeClass("selected"); // remove a cor rosa
			$(tr).find("td").each(function(e){				
				$(this).addClass("marcouCerto");
				mostraTooltip($(this));				
			});
						
			
		}else if ($(this).attr("class") == "tdCheck campoErro" && $(tr).attr("class") != "selected"){
			numNaoMarcados++; // incrementa o numero de erros nao marcados
			$(tr).removeClass("selected"); // remove a cor rosa			
			$(this).addClass("erroNaoMarcado");	
			mostraTooltip($(this));	
		
		}else if  ($(this).attr("class") != "tdCheck campoErro" && $(tr).attr("class") == "selected"){
			numMarcacoesIncorretas++; // incrementa a quantidade de marcaçÃµes incorretas
			$(tr).removeClass("selected"); // remove a cor rosa			
			$(this).addClass("marcouErrado");// adiciona a cor vermelha
			mostraTooltip($(this));
		} else if(tr.data('error') != undefined){
			mostraTooltip($(this));
		}
		
		$(this).find(":checkbox").attr("disabled", true); // desabilita marcação nos checkbox's
	});
	

}



// funcao que colore as celulas segundo a marcacao correta e errada ou falta de marcacao do erro pelo jogador
function coloreCelulas(){
	$(".tabelaDoJogo").find('td').each(function(i){ // percorre todas as td's da tabela

		if ($(this).attr("class") == "campoErro destaque"){ // se a celula estiver marcada corretamente marca com verde
			numErrosEncontrados++; // incrementa a quantidade de erros encontrados 
			$(this).removeClass("destaque"); // remove a cor rosa
			$(this).addClass("marcouCerto") // adiciona a cor verde

			mostraTooltip($(this));

		} else if ($(this).attr("class") == "campoErro") { // verifica se a celula eh errada e não foi marcada. Se isso acontece, marca com amarelo

			numNaoMarcados++; // incrementa o numero de erros nao marcados
			$(this).addClass("erroNaoMarcado"); // adiciona a cor amarela

			mostraTooltip($(this));

		} else if ($(this).attr("class") == "destaque") { // se nao, verifica se uma celula que nao tem erro foi marcada. Se sim, marca com vermelho

			numMarcacoesIncorretas++; // incrementa a quantidade de marcacoes incorretas
			$(this).removeClass("destaque"); // remove a cor rosa
			$(this).addClass("marcouErrado");// adiciona a cor vermelha

			mostraTooltip($(this));
			
		} // fim else if
	}); // fim da procura por td's
} // fim funcao coloreCelulas

// funcao que imprime na tela o resultado das marcacoes realizadas pelo usuario
function mostraResultado(){

	var resultado = document.getElementById("divResultado"); // procura o elemto com o id informado. No caso, a div onde sera colocada o resultado da partida

	// atibui ao resultado da pesquisa os valores das marcacoes corretas e erradas
	resultado.innerHTML = "<font color= #5cb85c>Erro(s) Encontrado(s): " + numErrosEncontrados + "</font></br>" +
	"<font color= #f0ad4e>Erro(s) N&atilde;o Marcado(s): " + numNaoMarcados + "</font></br>" +
	"<font color= #d9534f>Marca&ccedil;&atilde;o(&otilde;es) Errada(s): " + numMarcacoesIncorretas+ "</font>"

}

function getScore(){
	$.ajax({
		type: 'get',
		url: "getScore.php",
		data: {score: fMeasure()},
	}).done(function(data){
		$.cookie("score", data);
	});
}

//funcao que calcula o tempo que resta, em segundos, apos o jogador concluir a partida
function calculaSegundosRestantes() {
	return parseInt(minutos) * 60 + parseInt(segundos); // tranforma tudo em segundos e retorna
}


var salarioInicial = $.cookie("salarioInicial");
var tempoMaximoPorNivel = parseInt(tempoMaximoPorNivel())*60;
var nivelAtual = parseInt($.cookie("id_nivel"));
//Calcula o aumento conforme o tempo restante e a medida fMeasure alcançada
function calculaAumentoSalarial(){
	var acrescimos = 0;		
	if (fMeasure() >= 70){	
		
		var tempoGasto = tempoMaximoPorNivel - calculaSegundosRestantes();		
		var calculoDoTempo = tempoGasto / tempoMaximoPorNivel;
		var calculoDoNivel = nivelAtual/8.0;
		acrescimos = Math.abs(2*(fMeasure()/100) - calculoDoTempo)*calculoDoNivel;
	}
	// Aumento com base no salario, fMeasure e acrescimo em relacao ao tempo restante (soh a parte inteira)
	var salario = parseInt(document.getElementById('placar').innerHTML)+ parseInt(salarioInicial* acrescimos);

	document.getElementById('placar').innerHTML = salario; // atualiza o salario na tela
}

/*Funcao que calcula a medida de acertos com base no total de marcacoes feitas pelo usuario*/
function fMeasure() {

	//RECALL é a razão entre o nÃºmero de registros relevantes (numero de erros marcados corretamente)
	//recuperado para o nÃºmero total de registros relevantes na base de dados (numero de erros existentes, de fato).
	var recall = 0;
	if (errosExistentes != 0) {
		recall = numErrosEncontrados / errosExistentes; 
	}

	//A precisao eh a razao entre o numero de registros relevantes recuperados (o numero de erros marcados corretamente)
	// para o numero total de registros recuperados (irrelevante e relevantes) (erros marcados corretamente e marcacoes incorretas)
	var precision  = 0;
	if (numErrosEncontrados + numMarcacoesIncorretas){
		precision = numErrosEncontrados / (numErrosEncontrados + numMarcacoesIncorretas);
	}

	var measure = 0;
	if (precision + recall != 0){
		// formula da f-measure;
		measure = 2 * precision * recall / (precision + recall);
	}
	// retorna a parte inteira do percentual f-measure.
	return parseInt(measure * 100);
}

/*Funcao que mostra na tela o desempenho do jogador*/
function mostraScore(){
	document.getElementById("divScore").innerHTML = "<br/><font>Seu desempenho foi de " + fMeasure() + "%</font>";
}

/*Funcao redireciona para outro cenario*/
function avancaCenario(){	
	var salarioAtual = document.getElementById('placar').innerHTML; // o salario atual do jogador
	location.href="avancaCenario.php?salarioAtual="+salarioAtual; // redireciona para mudar o cenario
}

function zeraCronometro(){
	minutos = null;
	segundos = 0;
}



/*Funcao para o botao de avancar. So redireciona se o botao estiver habilitado ou se o tempo acabou*/
function avancar(tempoEsgotado, numCenarios){
	if (($("#buttonAvancar")).hasClass("enable") || tempoEsgotado) { // verifica se o botao esta habilitado.
		if(numCenarios == 4 && nivelAtual == 4 ){
			document.getElementById('divBotao').innerHTML = "<a id = 'buttonAvancar' data-toggle='modal' class = 'botaoAvancar enable' href = '#ModalAvancar'>Encerrar</a>";
		}
		else if(numCenarios == 4){		
			document.getElementById('divBotao').innerHTML = "<a id = 'buttonAvancar' data-toggle='modal' class = 'botaoAvancar enable' href = '#ModalAvancar'>Avançar</a>";
		} else {
			document.getElementById('divBotao').innerHTML = "<input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar enable' onClick = 'avancaCenario()'/>";
		}
		document.getElementById("contadorRegressivo").innerHTML = tempo; // mostra o tempo que ele passou para concluir uma etapa

		coloreCelulas(); // colore as celulas marcadas ou nao
		coloreLinhas();
		mostraResultado(); // mostra o resultado das marcacoes na tela
		mostraScore();
		calculaAumentoSalarial();
		zeraCronometro();
		preencheBarraDeProgresso(true);
		if(numCenarios == 4){
			preencheModal();
		} 
		
		getScore();	
		
	}	
}
function getListaDeVitorias(){
	var listaDeVitorias = getStringDeVitorias() == "" ? new Array():getStringDeVitorias().split("|");

	if(fMeasure() >= 70){
		listaDeVitorias.push("s")
		}
		else if(fMeasure() < 70){
		listaDeVitorias.push("n");
		}
	return listaDeVitorias;	
}

function getStringDeVitorias(){
	var stringDeVitorias = $.cookie("stringDeVitorias");
	if(typeof stringDeVitorias == "undefined"){
		stringDeVitorias = "";
	}
	return stringDeVitorias;
}


function preencheBarraDeProgresso(atualiza){	
	var listaDeVitorias = atualiza?getListaDeVitorias(): getStringDeVitorias().split("|");	
	//alert("passou daqui: " + listaDeVitorias);
	for(i = 0; i < listaDeVitorias.length; i++){				
		if(listaDeVitorias[i] == "s"){
			document.getElementById("fase"+i).setAttribute("class", "progress-bar progress-bar-success");			
		} else if(listaDeVitorias[i] == "n"){
			document.getElementById("fase"+i).setAttribute("class", "progress-bar progress-bar-danger");			
		}			
	} 	
}
var proximoNivel = $.cookie("proximoNivel");

function preencheModal(){
	var jogadorVenceu = $.cookie('score') >= 210 || ($.cookie('score') >= 140 && $("#fase4").hasClass("progress-bar-success"));
	if(jogadorVenceu && nivelAtual == 4){
		$.cookie("podeJogar", "false");
		document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco-vencedor.png' style ='float:left;margin:0 20px 10px 10px;'>	<h5>Parabéns! Você conseguiu terminar todas as etapas.</h5><a class='btn btn-success' style='margin-left: 25%;' href='ranking.php'>Verificar o Ranking</a></div>";													
	} else if(jogadorVenceu){											
		document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco_promovido.png' style ='float:left;margin:0 20px 10px 10px;'>	<h5>Parabéns! Você obteve um desempenho bastante satisfatório. Por isso, foi promovido para "+proximoNivel+"<h5><a class='btn btn-success' style='margin-left: 25%;' href='jogo.php'>Continuar o trabalho</a></div>";													
	} else {
													
		document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco-demitido.png' style ='float:left;margin:0 20px 10px 10px;'><h5>Você foi demitido por não atingir uma média de 70% em pelo menos 3 partidas.</h5>	<a class='btn btn-danger' style='margin-left: 25%;' href='classificados.php'>Sair da empresa</a></div>";
	}

}


// funcao que percorre as tabelas para verificar a quantidade de erros no cenario atual
function mostraErrosExistentes() {
	$(".campoErro").each(function(i) { 
		errosExistentes++;
	});

	var contador = document.getElementById("numeroDeErrosExistentes"); //Procura o local onde colocar a quantidade de erros
	if(contador != null){
		contador.innerHTML = "<font>"+errosExistentes+"</font>"; // adiciona a quantidade de erros existentes ao carregar a pagina
	}
}

function mostraTooltip(celula){
		celula.attr('trigger', "hover");
		celula.attr('rel', "tooltip");
		
		if(celula.data('error') == undefined){			
			celula.attr('title',"Não é erro");
		}else{			
			getErro(celula, celula.data('error'));
		}

}

function limpaProgresso(){
	document.getElementById('divProgress').innerHTML = "<div  id='fase0'></div><div  id='fase1'></div><div  id='fase2'></div><div  id='fase3'></div><div  id='fase4'></div>";
	$.cookie("score", 0);	
}
