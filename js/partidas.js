/* Arquivo javascript para dinamismo da pagina onde o jogador 
marca os erros e avanca, verificando sua pontuacao

authors: Andreza Raquel e Dandara Navarro
*/
var numCenarios;
var salarioInicial;
var salarioAtual;
var nivelAtual;
var proximoNivel;
var cenarioAtual;
var progresso;

var errosExistentes;
var numErrosEncontrados;
var numNaoMarcados;
var numMarcacoesIncorretas;
var clicked;
var tempo;

var segundos;
var tempoMaximo;

/*Funcao que eh chamada sempre que a pagina carrega*/
$(function () {	
	$.ajax({
		type: 'get',
		url: 'database/getData.php',
		success: function(data) {
			console.log(data);
			var json = JSON.parse(data);
			console.log(json);
			//----------------------
			// SESSION DATA
			//----------------------
			numCenarios = parseInt(json.numCenarios);
			salarioInicial = json.salarioInicial;
			salarioAtual = json.salarioAtual;
			nivelAtual = parseInt(json.nivelAtual);
			proximoNivel = json.proximoNivel;
			score = parseFloat(json.score);
			cenarioAtual = parseInt(json.cenarioAtual);
			progresso = json.progresso;
			//----------------------

			errosExistentes = parseInt($("#numeroDeErrosExistentes").html());
			numErrosEncontrados = 0;
			numNaoMarcados = 0;
			numMarcacoesIncorretas = 0;
			clicked = 0;
			tempo;

			desenhaBarra(progresso);
			//if (cenarioAtual < 5) {
				preencheBarraDeProgresso(false); // parametro false significa que nao precisa atualizar a lista de vitorias
			//} else {
			//	limpaProgresso(); // inicia a barra de progresso branca		
			//}

			segundos = tempoMaximoPorNivel();
			tempoMaximo = segundos;

			contadorRegressivo();

			selecionaCelula(); // Funcao que colore a celula marcada com o clique do mouse
			selecionaLinha(); // Marca a linha inteira como erro
		}
	});
	
});

				
//-----------------------------------------------
// TABELA
//-----------------------------------------------

/*Funcao que marca a celula quando o mouse eh clicado*/
function selecionaCelula(){		
	$(".tabelaDoJogo > tbody > tr > td").click(function () {// Evento acionado quando uma td é clicada
		if (segundos > 0) {
			var tr = $(this).parent();
			if (tr.attr("class") != "selected" && $(this).hasClass("destaque")) {	// se a celula jah foi clicada, desmarque
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

/*Funcao que atualiza na tela a quantidade de marcacoes a cada clique*/
function atualizaQuantidadeMarcacoes(){
	var contador = document.getElementById("numeroDeErrosMarcados");// procura o local onde a quantidade de marcacao deve aparecer
	if (contador != null) {
		contador.innerHTML = "<font color= #d9534f>" + clicked + "</font>" // Mostra a quantidade atual de marcacoes na pagina.
	}
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
//-----------------------------------------------
// FIM DA TABELA
//-----------------------------------------------

//-----------------------------------------------
// CRONOMETRO
//-----------------------------------------------
function tempoMaximoPorNivel() {	
	switch (nivelAtual){		
		case 1:
			return 5 * 60;
			break;
		case 2:
			return 4 * 60;
			break;
		case 3:
			return 3 * 60;
			break;
		case 4:
			return 2 * 60;
			break;
	}
	return 60;
}

/*Funcao para o contador regressivo*/
function contadorRegressivo() {
	if (segundos == null) return;
	segundos--;
	if (segundos >= 0) {
		atualizaTempoNaPagina(segundos);
		if (segundos <= 30) {
			piscando();
		}
		setTimeout(function() {
			contadorRegressivo();
		}, 1000);
	} else {
		alert("Tempo Esgotado! :(");
		avancar(true); // parametro de controle. Ele sendo true pode avancar mesmo q o botao esteja desabilitado
	}
}

function piscando() {  
	divPisca = document.getElementById("contadorRegressivo");    
	if(divPisca.getAttribute("style")=="VISIBILITY: hidden"){                              
		divPisca.setAttribute("style", "VISIBILITY: visible");            
	}else{                   
		divPisca.setAttribute("style", "VISIBILITY: hidden");                       
	}          
}

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

/*Funcao que atualiza o tempo na pagina a cada segundo*/
function atualizaTempoNaPagina(segundos) {
	//alert(segundos);
	var horas = pad(Math.floor((segundos / 3600) % 24), 2);
	var minutos = pad(Math.floor((segundos / 60) % 60), 2);
	var segundos = pad(segundos % 60, 2);
	tempo = horas+"<font color=#000000>:</font>"+ minutos + "<font color=#000000>:</font>"+ segundos; // procura o local onde o tempo deve aparecer
	document.getElementById('clock1').innerHTML=tempo; //mostra o tempo atual na pagina
}
//-----------------------------------------------
// FIM DO CRONOMETRO
//-----------------------------------------------
	
//-----------------------------------------------
// VALIDACAO
//-----------------------------------------------
/*Funcao ajax que retorna o erro de cada celula*/
function getErro(celula, id) {
	$.ajax({
		type: 'get',
		url: "database/pesquisaErro.php",
		data: {identificador: id},
	}).done(function(data){
		celula.attr('title', data);
	});

}

function mostraTooltip(celula) {
	celula.attr('trigger', "hover");
	celula.attr('rel', "tooltip");
	
	if (celula.data('error') == undefined) {			
		celula.attr('title',"Não é erro");
	}else{		
		getErro(celula, celula.data('error'));
	}

}

function mostraErros(callback) {
	$.ajax({
		type: 'get',
		url: 'database/getErros.php',
		success: function(data) {
			var json = JSON.parse(data);
			$(".tabelaDoJogo").each(function(k) {
				var tabela = json[k];
				$(this).find("tbody > tr").each(function(i) {
					$(this).find("td").each(function(j) {
						var tr = $(this).parent();
						var row = $(this).data("row");
						var col = $(this).data("col");
						var encontrado = false;
						for (var m = 0; m < tabela.length; m++) {
							if (tabela[m].i == row && tabela[m].j == col) {
								encontrado = true;
								if (col == -1) {
									$(tr).find("td").each(function(n) {
										$(this).data("error", tabela[m].msg);
									});
								} else {
									$(this).data("error", tabela[m].msg);
								}
								break;
							}
						}
						if (encontrado) {
							if (col == -1) {
								if ($(tr).attr("class") == "selected") {
									numErrosEncontrados++; // incrementa a quantidade de erros encontrados 
									$(tr).removeClass("selected"); // remove a cor rosa
									$(tr).find("td").each(function(e){				
										$(this).addClass("marcouCerto");
										mostraTooltip($(this));				
									});
								} else {
									numNaoMarcados++; // incrementa o numero de erros nao marcados
									$(tr).removeClass("selected"); // remove a cor rosa			
									$(this).addClass("erroNaoMarcado");	
									mostraTooltip($(this));	
								}
							} else {
								if ($(this).attr("class") == "destaque") {
									numErrosEncontrados++; // incrementa a quantidade de erros encontrados 
									$(this).removeClass("destaque"); // remove a cor rosa
									$(this).addClass("marcouCerto") // adiciona a cor verde
									mostraTooltip($(this));
								} else {
									numNaoMarcados++; // incrementa o numero de erros nao marcados
									$(this).addClass("erroNaoMarcado"); // adiciona a cor amarela
									mostraTooltip($(this));
								}
							}
						} else if (col == -1 && $(tr).attr("class") == "selected") {
							numMarcacoesIncorretas++; // incrementa a quantidade de marcaçÃµes incorretas
							$(tr).removeClass("selected"); // remove a cor rosa			
							$(this).addClass("marcouErrado");// adiciona a cor vermelha
							mostraTooltip($(this));
						} else if ($(this).attr("class") == "destaque") {
							numMarcacoesIncorretas++; // incrementa a quantidade de marcacoes incorretas
							$(this).removeClass("destaque"); // remove a cor rosa
							$(this).addClass("marcouErrado");// adiciona a cor vermelha
							mostraTooltip($(this));
						}
						if (col == -1) {
							$(this).find(":checkbox").attr("disabled", true); // desabilita marcação nos checkbox's
						}
					});
				});
			});
			callback();
		}
	});
}

// funcao que imprime na tela o resultado das marcacoes realizadas pelo usuario
function mostraResultado() {
	var resultado = document.getElementById("divResultado"); // procura o elemto com o id informado. No caso, a div onde sera colocada o resultado da partida
	// atibui ao resultado da pesquisa os valores das marcacoes corretas e erradas
	resultado.innerHTML = "<font color= #5cb85c>Erro(s) Encontrado(s): " + numErrosEncontrados + "</font></br>" +
	"<font color= #f0ad4e>Erro(s) N&atilde;o Marcado(s): " + numNaoMarcados + "</font></br>" +
	"<font color= #d9534f>Marca&ccedil;&atilde;o(&otilde;es) Errada(s): " + numMarcacoesIncorretas+ "</font>"
}
//-----------------------------------------------
// FIM DA VALIDACAO
//-----------------------------------------------

//Calcula o aumento conforme o tempo restante e a medida fMeasure alcançada
function calculaAumentoSalarial(callback) {
	var acrescimos = 0;		
	if (fMeasure() >= 70){	
		
		var tempoGasto = tempoMaximo - segundos;
		var calculoDoTempo = tempoGasto / tempoMaximo;
		var calculoDoNivel = nivelAtual/8.0;
		acrescimos = Math.abs(2*(fMeasure()/100) - calculoDoTempo)*calculoDoNivel;
	}
	// Aumento com base no salario, fMeasure e acrescimo em relacao ao tempo restante (soh a parte inteira)
	var salario = salarioAtual + parseInt(salarioInicial* acrescimos);
	$.ajax({
		type: 'POST',
		url: 'database/setPontuacao.php',
		data: {
			"score": fMeasure(),
			"salario": salario
		},
		success: function() {
			salarioAtual = salario;
			$("#placar").html(salario);
			callback();
		},
		fail: function(data) {
			console.log(data);
		},
		error: function(data) {
			console.log(data);
		}
	});
}

/*Funcao que calcula a medida de acertos com base no total de marcacoes feitas pelo usuario*/
function fMeasure() {

	//RECALL é a razão entre o numero de registros relevantes (numero de erros marcados corretamente)
	//recuperado para o numero total de registros relevantes na base de dados (numero de erros existentes, de fato).
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
	if ($("#buttonAvancar").hasClass("enable")) {
		window.location.href = 'jogo.php';
	}
}

/*Funcao para o botao de avancar. So redireciona se o botao estiver habilitado ou se o tempo acabou*/
function avancar(tempoEsgotado){
	if (($("#buttonAvancar")).hasClass("enable") || tempoEsgotado) { // verifica se o botao esta habilitado.
		if (cenarioAtual == 5 && nivelAtual == 4){
			document.getElementById('divBotao').innerHTML = "<a id = 'buttonAvancar' data-toggle='modal' class = 'botaoAvancar disable' href = '#ModalAvancar'>Encerrar</a>";
		} else if(cenarioAtual == 5) {		
			document.getElementById('divBotao').innerHTML = "<a id = 'buttonAvancar' data-toggle='modal' class = 'botaoAvancar disable' href = '#ModalAvancar'>Avançar</a>";
		} else {
			document.getElementById('divBotao').innerHTML = "<input type = 'button' id = 'buttonAvancar' value = 'Avançar' class = 'botaoAvancar disable' onClick = 'avancaCenario()'/>";
		}
		
		segundos = null; //pausa o tempo
		
		 // colore as celulas marcadas ou nao
		mostraErros(function() {
			mostraResultado(); // mostra o resultado das marcacoes na tela
			mostraScore();
			calculaAumentoSalarial(function() {				
				preencheBarraDeProgresso(true); // parametro true significa que eh preciso atualizar a lista de vitorias
				if (cenarioAtual == 5){
					preencheModal();
				} 
			});			
		});
	}	
}

//-----------------------------------------------
// LISTA DE VITORIAS
//-----------------------------------------------

function setListaDeVitorias() {
	$.ajax({
		type: "POST",
		url: "database/getSetListaDeVitorias.php",
		data: {
			"resultado": fMeasure()
		}, 
		success: function(data) {
			getListaDeVitorias();
		}
	});
}

//-----------------------------------------------
// FIM DA LISTA DE VITORIAS
//-----------------------------------------------

function desenhaBarra(progresso) {
	for (i = 0; i < progresso.length; i++) {
		if (progresso[i] == "s") {
			document.getElementById("fase"+i).setAttribute("class", "progress-bar progress-bar-success");
		} else {
			document.getElementById("fase"+i).setAttribute("class", "progress-bar progress-bar-danger");	
		}
	}
	
	$("#buttonAvancar").removeClass("disable");
	$("#buttonAvancar").addClass("enable");
}

function getListaDeVitorias() {
	$.ajax({
		type: 'GET',
		url: "database/getSetListaDeVitorias.php",
		success: function (data) {
			desenhaBarra(data);
		}
	});	
}

function preencheBarraDeProgresso(atualiza) {	
	if (atualiza) {
		setListaDeVitorias();
	} else {
		getListaDeVitorias();
	}		
}

function jogadorAvancaDeNivel(callback) {
	$.ajax({
		type: "POST",
		url: "database/avancaDeNivel.php",
		success: function() {
			callback();	
		}	
	});	
}

function preencheModal(){
	var jogadorVenceu = score >= 210 || (score >= 140 && $("#fase4").hasClass("progress-bar-success"));
	if(jogadorVenceu && nivelAtual == 4){		
		document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco-vencedor.png' style ='float:left;margin:0 20px 10px 10px;'>	<h5>Parabéns! Você conseguiu terminar todas as etapas.</h5><a class='btn btn-success' style='margin-left: 25%;' href='ranking.php'>Verificar o Ranking</a></div>";													
	} else if(jogadorVenceu){
		jogadorAvancaDeNivel(function() {
			document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco_promovido.png' style ='float:left;margin:0 20px 10px 10px;'>	<h5>Parabéns! Você obteve um desempenho bastante satisfatório. Por isso, foi promovido para <b>"+proximoNivel+"</b>!<h5><a class='btn btn-success' style='margin-left: 25%;' href='jogo.php'>Continuar o trabalho</a></div>";	
		});										
	} else {													
		document.getElementById("corpoModal").innerHTML = "<div><img src = 'img/boneco-demitido.png' style ='float:left;margin:0 20px 10px 10px;'><h5>Você foi demitido por não atingir uma média de 70% em pelo menos 3 partidas.</h5>	<a class='btn btn-danger' style='margin-left: 25%;' href='classificados.php'>Sair da empresa</a></div>";
	}

}

function limpaProgresso(){
	document.getElementById('divProgress').innerHTML = "<div  id='fase0'></div><div  id='fase1'></div><div  id='fase2'></div><div  id='fase3'></div><div  id='fase4'></div>";
}


