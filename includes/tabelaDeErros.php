<!DOCTYPE html>
<html lang="pt-br"> 
<head>
	<?php require_once("includes/header.php"); ?>
	<link  href="css/tabelaDeErros.css" rel="stylesheet">
 </head>
<body>
<div class="container">
  <div class='row'>
    <div class='col-sm-12'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">		
          <div class="item  active">
            <div class="row">
              <div class="col-sm-12" style="padding: 50px;">
 
					<table border="1px" class="tabelaDeErros">
						<tr><th colspan="3" >Tabela de Erros Em Uma S&oacute; C&eacute;lula</th></tr>
						<tr>
							<th>Nome do Erro</th>
							<th>Descri&ccedil;&atilde;o</th>
							<th>Exemplo</th>
						</tr>
						<tr>
							<td>Valor em Falta</td>
							<td>Falta de preenchimento de atributos obrigat&oacute;rios.</td>
							<td>Valor null na coluna 'nome' de uma tabela 'Pessoa'.</td>
						</tr>
						<tr>
							<td>Valor Ilegal</td>
							<td>Fora do dom&iacute;nio de valores v&aacute;lidos.</td>
							<td>Idade = 233.</td>
						</tr>
						<tr>
							<td>Valor Ilegal</td>
							<td>Fora do dom&iacute;­nio de valores v&aacute;lidos.</td>
							<td>Idade = 25, mas, na verdade, &eacute; 30.</td>
						</tr>
						<tr>
							<td>Erro Ortogr&aacute;fico</td>
							<td>Erro geralmente associado a atributos textuais.</td>
							<td>Cidade = "Brga".</td>
						</tr>
						<tr>
							<td>Informa&ccedil;&atilde;o Em Excesso</td>
							<td>M&uacute;ltiplos valores introduzidos num &uacute;nico atributo textual.</td>
							<td>Logradouro = "Rua da Lua, 12, Boa Viagem, 50200-325-Recife-PE".</td>
						</tr>
						<tr>
							<td>Substring Inv&aacute;lido</td>
							<td>Anomalia resultante do uso de abreviaturas ou pronomes de tratamento em nomes de pessoas.</td>
							<td>Nome = "Dr. Alcides".</td>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o de Sintaxe</td>
							<td>O valor do atributo surge sob diferentes formatos.</td>
							<td>Campo data com valores 05/05/2014 e 2014/05/05.</td>
						</tr>
						<tr>
							<td>Valor Impreciso</td>
							<td>Valor com mais de uma interpreta&ccedil;&atilde;o.</td>
							<td>C.Grande - pode ser Campina Grande ou Campo Grande.</td>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o De Restri&ccedil;&atilde;o De Dom&iacute;nio De Neg&oacute;cio</td>
							<td>Valor do campo n&atilde;o poderia ser aceito no mundo real.</td>
							<td>Idade inferior a 18 anos em uma tabela de empregados de uma empresa.</td>
						</tr>
						<tr>
							<td>Valor Desatualizado</td>
							<td>Valor n&atilde;o corresponde ao valor atual.</td>
							<td>Endere&ccedil;o do cliente &eacute; antigo e n&atilde;o est&aacute; atualizado.</td>
						</tr>
					</table>
				
              </div>          
                    
            </div>
          </div>
          <div class="item" style="padding: 50px;">
            <div class="row">
              <div class="col-sm-12">
                
					<table border="1px" class="tabelaDeErros">
						<tr><th colspan="3" >Tabela de Erros Na Linha Inteira</th></tr>
						<tr>
							<th>Nome do Erro</th>
							<th>Descri&ccedil;&atilde;o</th>
							<th>Exemplo</th>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o Da Depend&ecirc;ncia Entre Atributos</td>
							<td>Exist&ecirc;ncia de inconsist&ecirc;ncia entre valores de atributos relacionados.</td>
							<td>Idade = 30 em 2014, mas data de nascimento = 15/03/1970.</td>
						</tr>
						<tr>
							<td>Troca De Valores Entre Atributos</td>
							<td>Introdu&ccedil;&atilde;o de valor no atributo errado.</td>
							<td>Nome = "Rua do Sol" e logradouro = "Jos&eacute; Freitas".</td>
						</tr>
						<tr>
							<td>Tupla Semi-vazia Ou Vazia</td>
							<td>A maioria dos atributos da tupla n&atilde;o est&aacute; preenchida.</td>
							<td>Linha contendo apenas o nome do produto.</td>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o De Depend&ecirc;ncia Funcional</td>
							<td>O valor de um atributo n&atilde;o est&aacute; relacionado apenas a este, como deveria na vida real.</td>
							<td>CEP's iguais em estados diferentes.</td>
						</tr>		
					</table>
				
              </div>          
                   
            </div>
          </div>
          <div class="item" style="padding: 50px;">
            <div class="row">
              <div class="col-sm-12">
               
					<table border="1px" class="tabelaDeErros">
						<tr><th colspan="3" >Tabela de Erros Em Linhas Da Tabela </th></tr>
						<tr>
							<th>Nome do Erro</th>
							<th>Descri&ccedil;&atilde;o</th>
							<th>Exemplo</th>
						</tr>
						<tr>
							<td>Utiliza&ccedil;&atilde;o De Sin&ocirc;nimos</td>
							<td>Express&otilde;es diferentes, mas com o mesmo sentido.</td>
							<td>Profiss&atilde;o = "professor" ou "docente".</td>
						</tr>
						<tr>
							<td>Valor N&atilde;o &uacute;nico</td>
							<td>Duas entidades com o mesmo valor em campo que deveria ser chave &uacute;nica.</td>
							<td>Matr&iacute;cula X = 1122 e Matr&iacute;cula Y = 1122.</td>
						</tr>
						<tr>
							<td>Redund&acirc;ncia Sobre A Mesma Entidade</td>
							<td>Aparentemente existe outro registro da mesma entidade.</td>
							<td>Nome(linha X) = "Jos&eacute; Alves" e Nome(linha Y) = "J. Alves".</td>
						</tr>
						<tr>
							<td>Inconsist&ecirc;ncia Sobre A Mesma Entidade</td>
							<td>Conflito nos valores dos atributos de uma mesma entidade representada em mais de uma tupla.</td>
							<td>Linha X = "Carlos, 06/07/1975", linha Y = "Carlos, 20/08/1980".</td>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o De Restri&ccedil;&atilde;o De Dom&iacute;nio De Neg&oacute;cio</td>
							<td>Uma tabela possui mais/menos tuplas do que deveria.</td>
							<td>Uma tabela de estados brasileiros com 28 linhas(estados).</td>
						</tr>
						<tr>
							<td>Circularidade Entre Tupla Em Autorrelacionamento</td>
							<td>Um registro na tabela que &eacute;, ao mesmo tempo, gerente e subordinado da mesma pessoa, por exemplo.</td>
							<td>Jo&atilde;o &eacute; gerente de Pedro e Pedro &eacute; gerente de Jo&atilde;o.</td>
						</tr>		
					</table>
			
              </div>          
              </div>          
              </div> 
			<div class="item" style="padding: 50px;">
            <div class="row">
              <div class="col-sm-12">
            
					 <table border="1px" class="tabelaDeErros">
						<tr><th colspan="3" >Tabela de Erros Em M&uacute;ltiplas Tabelas</th></tr>
						<tr>
							<th>Nome do Erro</th>
							<th>Descri&ccedil;&atilde;o</th>
							<th>Exemplo</th>
						</tr>
						<tr>
							<td>Refer&ecirc;ncia Inexistente</td>
							<td>Viola&ccedil;&atilde;o &agrave; integridade referencial.</td>
							<td>C&oacute;digo de departamento inexistente na tabela 'departamento'.</td>
						</tr>
						<tr>
							<td>Refer&ecirc;ncia Errada</td>
							<td>C&oacute;digo de refer&ecirc;ncia a alguma tabela n&atilde;o condiz com a situa&ccedil;&atilde;o real.</td>
							<td>Jos&eacute; Alves est&aacute; no departamento 10, mas ele pertence ao departamento 11.</td>
						</tr>
						<tr>
							<td>Redund&acirc;ncia Sobre A Mesma Entidade</td>
							<td>A mesma entidade encontra-se representada sob formas iguais ou diferentes em v&aacute;rias tabelas.</td>
							<td>Tabela 'funcionarios': nome = "Jos&eacute; Alves"; Tabela 'departamento': nomeFuncionario = "J. Alves".</td>
						</tr>
						<tr>
							<td>Inconsist&ecirc;ncia Sobre A Mesma Entidade</td>
							<td>Conflitos nos valores dos atributos de uma entidade representada em mais do que uma tabela.</td>
							<td>Tabela 'funcionarios': dataNascimento de Jos&eacute; = 08/09/1973 e na tabela 'departamento': dataNascimento de Jos&eacute; = 25/01/1973.</td>
						</tr>
						<tr>
							<td>Formatos De Representa&ccedil;&atilde;o Diferentes</td>
							<td>O valor do atributo surge sob diferentes formatos de representa&ccedil;&atilde;o consoante a tabela.</td>
							<td>Tabela X: data = 04/05/2014, tabela Y: data = 2014/05/04.</td>
						</tr>
						<tr>
							<td>Unidade De Medidas Diferentes</td>
							<td>O valor do atributo surge sob variadas unidades de medida consoante a tabela.</td>
							<td>Na tabela X os valores est&atilde;o em reais e na tabela Y est&atilde;o em d&oacute;lares.</td>
						</tr>	
						<tr>
							<td>Utiliza&ccedil;&atilde;o De Sin&ocirc;nimos</td>
							<td>Express&otilde;es sintaticamente diferentes, mas com igual significado em tabelas diferentes.</td>
							<td>Tabela X: profiss&atilde;o = "professor", tabela Y: profiss&atilde;o = "docente".</td>
						</tr>
						<tr>
							<td>Viola&ccedil;&atilde;o De Restri&ccedil;&atilde;o De Dom&iacute;nio</td>
							<td>Um valor em uma tabela &eacute; inconsistente, de acordo com dados em outra tabela.</td>
							<td>Na tabela 'Pedido' o valor do produto &eacute; 2000, mas na tabela 'DetalhePedido' o total corresponde a 2100.</td>
						</tr>
						<tr>
							<td>Dom&iacute;nio De Viola&ccedil;&atilde;o De Restri&ccedil;&atilde;o</td>
							<td>Viola&ccedil;&atilde;o de restri&ccedil;&atilde;o inerente ao dom&iacute;nio, envolvendo os relacionamentos entre m&uacute;ltiplas rela&ccedil;&otilde;es.</td>
							<td>O funcion&aacute;rio respons&aacute;vel pela emiss&atilde;o da fatura deve pertencer ao departamento de vendas.</td>
						</tr>	
					</table>
 
              </div>
 
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#media" class="left carousel-control"></a>
        <a data-slide="next" href="#media" class="right carousel-control"></a>
      </div>                          
    </div>
  </div>
</div>
</body>
</html>