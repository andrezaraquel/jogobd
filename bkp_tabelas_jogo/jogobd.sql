
-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2014 at 09:41 AM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a5697508_jogobd`
--

-- --------------------------------------------------------

--
-- Table structure for table `aluno01`
--

CREATE TABLE `aluno01` (
  `id_aluno01` int(11) NOT NULL,
  `matricula` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricula_erro` int(2) DEFAULT NULL,
  `nome` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `idade` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idade_erro` int(2) DEFAULT NULL,
  `curso` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curso_erro` int(2) DEFAULT NULL,
  `periodo` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodo_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_aluno01`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aluno01`
--

INSERT INTO `aluno01` VALUES(1, '1234', 16, 'Yasmin da Silva Aguiar', NULL, '18', NULL, 'Engenharia M.', 8, '2', NULL, NULL);
INSERT INTO `aluno01` VALUES(2, '2345', NULL, 'Thaylane Lima Leal', NULL, '19', NULL, 'Psicologia', NULL, '5', NULL, NULL);
INSERT INTO `aluno01` VALUES(3, '3456', NULL, 'Matheus Macedo Maia', NULL, '2', 9, 'Odontologia', NULL, '3', NULL, NULL);
INSERT INTO `aluno01` VALUES(4, '4567', NULL, 'Andressa Lays Barbosa', NULL, '17', NULL, 'Letras Português', NULL, '6', NULL, NULL);
INSERT INTO `aluno01` VALUES(5, '1234', 16, 'Glenda Lesley Porto', NULL, '17', NULL, 'Arte e mídia', NULL, '4', NULL, NULL);
INSERT INTO `aluno01` VALUES(6, '6789', NULL, 'Lucas Vieira Rangel', NULL, '2433;', 4, 'Sociologia', NULL, '8', NULL, NULL);
INSERT INTO `aluno01` VALUES(7, '7890', NULL, 'Gustavo Felipe Monteiro', NULL, '20', NULL, 'Medicina', NULL, '6', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cadastros`
--

CREATE TABLE `cadastros` (
  `email` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `id_nivel` int(1) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cadastros`
--

INSERT INTO `cadastros` VALUES('andreza@gmail.com', '123456', 'andreza', 'feminino', 3);
INSERT INTO `cadastros` VALUES('waleskaferreiira@hotmail.com', 'wah12345', 'waleska', 'feminino', 1);
INSERT INTO `cadastros` VALUES('dandara@gmail.com', '123456', 'Dandara', 'feminino', 2);
INSERT INTO `cadastros` VALUES('123@123.com', '123456', 'echo "OI"', 'masculino', 1);
INSERT INTO `cadastros` VALUES('francineidebela@live.com', '123456', 'Francineide', 'feminino', 1);
INSERT INTO `cadastros` VALUES('mendel_sa@hotmail.com', 'horong22', 'Mendel', 'masculino', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cargo01`
--

CREATE TABLE `cargo01` (
  `id_cargo01` int(1) NOT NULL,
  `id` varchar(4) NOT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `cargo` varchar(25) NOT NULL,
  `cargo_erro` int(2) DEFAULT NULL,
  `id_departamento` varchar(4) NOT NULL,
  `id_departamento_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_cargo01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargo01`
--

INSERT INTO `cargo01` VALUES(1, '1123', NULL, 'Gerente de Vendas', NULL, '2697', NULL, NULL);
INSERT INTO `cargo01` VALUES(2, '1234', NULL, 'Vendedor', NULL, '2345', NULL, NULL);
INSERT INTO `cargo01` VALUES(3, '3456', NULL, 'Padeiro', NULL, '4567', NULL, NULL);
INSERT INTO `cargo01` VALUES(4, '5678', NULL, 'Promotor de Vendas', NULL, '7890', NULL, NULL);
INSERT INTO `cargo01` VALUES(5, '6789', NULL, 'Operador de Caixa', NULL, '8766', 21, NULL);
INSERT INTO `cargo01` VALUES(6, '7890', NULL, 'Assougueiro', 4, '8765', 22, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cenario`
--

CREATE TABLE `cenario` (
  `id_empresa` int(3) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_cenario` int(4) NOT NULL,
  `descricao` varchar(500) CHARACTER SET latin1 NOT NULL,
  `dica1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dica2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_nivel`,`id_cenario`,`id_empresa`),
  KEY `cenario_empresa_fk` (`id_empresa`),
  KEY `cenario_nivel_fk` (`id_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cenario`
--

INSERT INTO `cenario` VALUES(1, 1, 1, 'Cenário do nível Estagiário em um supermercado. Tabela: Produto.', 'A coluna codigo identifica unicamente um produto.', 'Em banco de dados geralmente utiliza-se algarismos  arábicos para a representação numérica.');
INSERT INTO `cenario` VALUES(2, 1, 1, 'Cenário do nível Estagiário em um consultório médico. Tabela: Paciente.', 'Todo(a) paciente deve ter seu nome cadastrado no banco de dados', 'O ano atual é 2014.');
INSERT INTO `cenario` VALUES(3, 1, 1, '', 'Para assegurar uma boa qualidade dos dados, nomes(strings) dever ser usados sem abreviações. ', 'A coluna CPF identifica unicamente um passageiro, ou seja, é a chave primária da tabela passageiro.');
INSERT INTO `cenario` VALUES(5, 1, 1, 'Este cenário possui dados de alguns alunos da nossa faculdade. Esses dados servem para termos o controle da situação do aluno na faculdade, ou seja, qual curso fazem e o período em que se encontram são as informações mais importantes que temos.', 'Identificamos o aluno pela sua matrícula, ou seja, cada aluno tem sua matrícula única.', 'É necessário possuir idade suficiente para ter concluído o ensino médio para poder estudar em nossa faculdade.');
INSERT INTO `cenario` VALUES(6, 1, 1, '', 'É preciso tomar cuidado com a utilização de sinônimos. O ideal é utilizar apenas uma palavra para representar uma mesma coisa.', 'Erros de digitação são frequentes. O ideal é restringir uma coluna para aceitar apenas valores específicos.');
INSERT INTO `cenario` VALUES(11, 1, 1, 'Tabela que contém dados de alguns dos veículos vendidos em nossa concessionária com os dados mais relevantes para os clientes.', 'Identificamos nossos veículos pelo número do seu código.', 'Caso o cliente deseje um carro que não tenha na pronta entrega, podemos fazer o pedido.');
INSERT INTO `cenario` VALUES(1, 1, 2, 'Cenário do nível Estagiário com a tabela de funcionários de  um supermercado.', 'No Brasil, o padrão para representação de datas é dia/mês/ano.', 'A coluna nome guarda o primeiro nome de cada funcionário, enquanto a coluna sobrenome guarda o nome de família do funcionário.');
INSERT INTO `cenario` VALUES(2, 1, 2, 'Cenário do nível Estagiário em um consultório médico. Tabela: Médico.', 'São exemplos de especialidades médicas: Oftalmologia, Cardiologia, Ortodontia, Dermatologia, Endoscopia, Urologia e Nefrologia.', 'CRM signifca Conselho Regional de Medicina. Todo médico quando forma precisa se inscrever no CRM de seu estado para poder exercer a profissão.');
INSERT INTO `cenario` VALUES(3, 1, 2, '', 'Cada companhia é identificada por um código. Por isso a coluna codigo é a chave primária dessa tabela.', 'A chave primária impede que haja duplicação de registros. Tal erro é bastante prejudicial à qualidade dos dados.');
INSERT INTO `cenario` VALUES(5, 1, 2, '', 'Na coluna sobrenome encontram-se os nomes de família (último nome) de cada professor.', 'Assim como os alunos, os professores também possuem uma matrícula que identifica-os unicamente. No caso, a coluna código é responsável por armazená-la.');
INSERT INTO `cenario` VALUES(6, 1, 2, '', 'A coluna codigo identifica unicamente um medicamento na farmácia.', 'Observe bem o formato de representação da informação em cada coluna.');
INSERT INTO `cenario` VALUES(11, 1, 2, 'Tabela que dispõe dos dados de nossos funcionários para termos o controle de quem está nos ajudando a "cuidar" dos nossos clientes.', 'Cada um de nossos funcionários está registrado apenas uma vez no sistema.', 'Sempre tentamos manter a sintaxe de um tipo de dado igual em todas as linhas.');
INSERT INTO `cenario` VALUES(1, 1, 3, 'Cenário do nível Estagiário com a tabela de funcionários de  um supermercado.', 'Para facilitar futuras pesquisas no banco de dados, é importante não haver abreviaturas em atributos textuais.', 'Para o cadastro de um funcionário todos os dados devem, obrigatoriamente, ser preenchidos.');
INSERT INTO `cenario` VALUES(2, 1, 3, 'Cenário do nível Estagiário em um consultório médico. Tabela: Paciente.', '', '');
INSERT INTO `cenario` VALUES(3, 1, 3, '', 'Um mês tem, no máximo, 31 dias e um ano tem 12 meses.', 'A coluna nome guarda, unicamente, o primeiro nome, enquanto a coluna sobrenome guarda o nome de família de cada funcionário.');
INSERT INTO `cenario` VALUES(5, 1, 3, '', 'É muito importante armazenar corretamente o nome do coordenador de um curso para facilitar futuras pesquisas. ', 'O ideal é saber separar corretamente a tabela de cursos da tabela de disciplinas para o banco de dados fique organizado.');
INSERT INTO `cenario` VALUES(6, 1, 3, '', 'É necessária a atualização constante dos dados para evitar registros não mais relevantes.', 'Alguns erros por falha humana podem prejudicar pesquisas futuras.');
INSERT INTO `cenario` VALUES(1, 1, 4, 'Cenário do nível Estagiário que possui uma tabela do setor de açougue de um supermercado.', 'A coluna codigo identifica unicamente um item.', 'Para melhor controle do banco de dados é necessário que colunas responsáveis por informações relevantes ao item estejam devidamente preenchidas.');
INSERT INTO `cenario` VALUES(2, 1, 4, 'Cenário do nível Estagiário em um consultório médico. Tabela: Consulta.', '', '');
INSERT INTO `cenario` VALUES(3, 1, 4, '', 'Quem preenche um banco de dados tem muita responsabilidade. Qualquer erro de digitação influencia na qualidade dos dados.', 'É preciso observar o padrão de representação utilizado em uma coluna para inserir novos valores.');
INSERT INTO `cenario` VALUES(5, 1, 4, '', 'No caso de um funcionário, o ideal é que a chave primária, ou seja, a coluna que o identifica unicamente, seja o CPF para evitar duplicação de registros.', 'A naturalidade diz respeito à cidade de origem de uma pessoa.');
INSERT INTO `cenario` VALUES(6, 1, 4, '', 'Estamos tratando do cenário de uma farmácia. Portanto, as informações de uma tabela nessa empresa devem sempre atender ao que encontramos em farmácias do "mundo real".', 'A data de validade é um atributo bastante importante. Sempre devemos atentar para ela na hora de comprar algum produto.');
INSERT INTO `cenario` VALUES(1, 1, 5, 'Cenário do nível Estagiário com a tabela de itens do setor de frios e laticínios de um supermercado.', 'Para facilitar pesquisas futuras, é importante atentar para o nome do campo e não preenchê-lo com valores além do(s) esperado(s).', 'Informações relevantes de um item são obrigatórias.');
INSERT INTO `cenario` VALUES(2, 1, 5, 'Cenário do nível Estagiário em um consultório médico. Tabela: Médico.', '', '');
INSERT INTO `cenario` VALUES(5, 1, 5, '', 'A coluna qntd_professores indica a quantidade de professores que pertencem ao departamento.', 'Cada departamento possui um nome bem definido.');
INSERT INTO `cenario` VALUES(1, 1, 6, 'Cenário do nível Estagiário com a tabela de itens do setor de brinquedos de um supermercado.', 'A coluna preco é referente ao preço do item em reais.', 'Para auxiliar a tomada de decisões de uma corporação, colunas com informações relevantes de uma entidade são requeridas.');
INSERT INTO `cenario` VALUES(2, 1, 6, 'Cenário do nível Estagiário em um consultório médico. Tabela: Paciente.', 'O paciente Tulio Marques Gois nasceu em Mato Grosso do Sul', 'Os pacientes José Dias Paes e Yasmin Ludmilla Alencar lecionam na mesma universidade');
INSERT INTO `cenario` VALUES(2, 1, 7, 'Cenário do nível Estagiário em um consultório médico. Tabela: Paciente.', 'A cidade de Recife foi fundada em 12/03/1537.', 'A cidade de Belo Horizonte foi fundada em 12/12/1897.');
INSERT INTO `cenario` VALUES(2, 1, 8, 'Cenário do nível Estagiário em um consultório médico. Tabela: Médico.', 'O preenchimento da coluna "plantonista" não é obrigatório.', 'O preenchimento da coluna "email" não é obrigatório.');
INSERT INTO `cenario` VALUES(2, 1, 9, 'Cenário do nível Estagiário em um consultório médico. Tabela: Consulta.', 'Se a consulta for um retorno nenhum valor deve ser cobrado.', 'A coluna "número" serve para identificar unicamente uma consulta');
INSERT INTO `cenario` VALUES(2, 1, 10, 'Cenário do nível Estagiário em um consultório médico. Tabela: Consulta.', 'Todos os dados de uma consulta são obrigatórios', 'Consultas só podem ser marcadas em horário comercial');
INSERT INTO `cenario` VALUES(1, 2, 1, 'Cenário do nível Júnior em um supermercado. Tabelas: Funcionário e Departamento.', 'Id_departamento da tabela funcionario é referência ao codigo_departamento da tabela departamento. ', 'Linhas com pouca ou nenhuma informação são contrárias à qualidade de um banco de dados.');
INSERT INTO `cenario` VALUES(2, 2, 1, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Consulta e Paciente.', '', '');
INSERT INTO `cenario` VALUES(3, 2, 1, 'Neste cenários temos algumas das vendas que estão cadastradas em nosso sistema, com as informações mais relevantes da viagem que o nosso cliente já realizou ou irá realizar.', 'Nosso aeroporto cadastra viagens de clientes que embarcam tanto em Campina Grande quanto em João Pessoa.', 'Nossos funcionários estão treinados para escrever os dados completos, sem abreviações.');
INSERT INTO `cenario` VALUES(1, 2, 2, 'Cenário do nível Júnior com as tabelas dos itens do setor de papelaria e dos distribuidores de um supermercado.', 'Erros de digitação podem ocorrer por falha humana no momento da digitação. ', 'A coluna codigo_distribuidor da tabela de itens é uma referência (chave estrangeira) à coluna codigo da tabela de distribuidores.');
INSERT INTO `cenario` VALUES(2, 2, 2, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Paciente e Endereço.', 'O paciente Fabiano Tavares Mota nasceu no ano de 2000.', 'O paciente Luciano Dias Cartaxo mudou-se para a Rua Teixeira de Freiras, 450, São José, Campina Grande, PB.');
INSERT INTO `cenario` VALUES(1, 2, 3, 'Cenário do nível Júnior com as tabelas dos itens do setor de limpeza e os distribuidores de um supermercado.', 'Todos os valores são representados em reais.', 'Acoluna codigo_distribuidor da tabela de itens é referência (chave estrangeira) à coluna codigo da tabela distribuidor.');
INSERT INTO `cenario` VALUES(2, 2, 3, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Médico e Especialidade Médica.', 'O psiquiatra Paulo Gomes Albuquerque é um médico bastante renomado em sua cidade.', 'A traumatologia é uma especialidade que lida com o trauma do aparelho músculo-esquelético.');
INSERT INTO `cenario` VALUES(1, 2, 4, 'Cenário do nível Júnior com as tabelas de itens do setor de eletrodomésticos e distribuidores de um supermercado.', 'O conceito de chave primária é importante para não haver duplicação de registros.', 'Acoluna codigo_distribuidor da tabela de itens é referência (chave estrangeira) à coluna codigo da tabela distribuidor.');
INSERT INTO `cenario` VALUES(2, 2, 4, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Paciente e Plano de Saúde.', 'A paciente Luana Diniz Viana tem como plano de saúde o Nacional Beta Prata.', 'A paciente Sueli Correia Castro é uma advogada renomada em sua cidade.');
INSERT INTO `cenario` VALUES(1, 2, 5, 'Cenário do nível Júnior com as tabelas de itens e de distribuidores do setor infantil de um supermercado.', 'É importante que colunas para representar valores numéricos possuam restrição para receber apenas valores numéricos, evitando, assim, erros com valores textuais.', 'É importante que os registros sejam únicos, evitando duplicações.');
INSERT INTO `cenario` VALUES(2, 2, 5, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Paciente e Exame.', 'A coluna id serve para identificar unicamente um exame.', 'Todo exame está associado a um paciente.');
INSERT INTO `cenario` VALUES(1, 2, 6, 'Cenário do nível Júnior com as tabelas de itens e distribuidores do setor de Hortifruti de um supermercado.', 'Acoluna codigo_distribuidor da tabela de itens é referência (chave estrangeira) à coluna codigo da tabela distribuidor.', 'A coluna codigo é chave primária da tabela de itens, ou seja, identifica unicamente um item. Assim como a coluna codigo da tabela de distribuidores.');
INSERT INTO `cenario` VALUES(1, 3, 1, 'Cenário do nível Pleno em um supermercado. Tabelas: Item, Produto, Distibuidor e Endereço.', '', '');
INSERT INTO `cenario` VALUES(2, 3, 1, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Médico e Plano de Saúde.', '', '');
INSERT INTO `cenario` VALUES(2, 3, 2, 'Cenário do nível Analista de Dados Júnior em um consultório médico. Tabelas: Fornecedor e Especialidade Médica.', '', '');
INSERT INTO `cenario` VALUES(1, 4, 1, 'Cenário do nível Sênior em um supermercado. Tabelas: Item, Cliente e Vendas.', '', '');
INSERT INTO `cenario` VALUES(1, 4, 2, 'Cenário do nível Sênior para um supermercado. Tabelas: funcionários e endereço dos funcionários.', '', '');
INSERT INTO `cenario` VALUES(1, 4, 3, 'Cenário do nível Sênior de um supermercado. Tabelas: Funcionários, cargo dos funcionários e departamento ao qual pertencem esses funcionários.', '', '');
INSERT INTO `cenario` VALUES(6, 1, 5, '', 'Informações como a tarja, o laboratório e o preço são informações muito importantes, por isso, é necessário que todos os medicamentos contenham tais informações.', 'Para uma melhor performance do banco de dados, é essencial minimizar a possibilidade de falhas humanas no momento da inserção de registros.');
INSERT INTO `cenario` VALUES(6, 1, 6, 'Esta tabela dispõe de alguns dos nossos produtos para cuidado de pele. Podemos observar informações que são úteis para o cliente decidir se compra o produto.', 'É importante observar se um produto já está cadastrado para não haver repetição de registros.', 'A coluna conteúdo carrega a quantidade de produto (que pode ser líquido ou em comprimidos, por exemplo) vendido em cada embalagem.');

-- --------------------------------------------------------

--
-- Table structure for table `cliente01`
--

CREATE TABLE `cliente01` (
  `id_cliente01` int(1) NOT NULL,
  `cpf` varchar(25) DEFAULT NULL,
  `cpf_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(28) DEFAULT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `telefone_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente01`
--

INSERT INTO `cliente01` VALUES(1, '115.391.624-00', NULL, 'Catarina da Silva Fernandes', NULL, '(83)3332-5423', NULL, NULL);
INSERT INTO `cliente01` VALUES(2, '322.725.610-25', NULL, 'Baruch Kauet dos Santos', NULL, '(83)3365-4598', NULL, NULL);
INSERT INTO `cliente01` VALUES(3, '635.114.322-69', NULL, 'Frederico Arruda Correia', NULL, '(83)3361-1073', NULL, NULL);
INSERT INTO `cliente01` VALUES(4, '179.854.321-06', NULL, 'Astrogildo Vila Boas', NULL, '3361-6356', 7, NULL);
INSERT INTO `cliente01` VALUES(5, '275.294.425-000', 2, 'Sophia Karamelon Farias', NULL, '(83)3385-2314', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cliente_especial01`
--

CREATE TABLE `cliente_especial01` (
  `id_cliente_especial01` int(2) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(4) DEFAULT NULL,
  `id_cliente_erro` int(2) DEFAULT NULL,
  `nome` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noem_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `data_nascimento` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_nascimento_erro` int(2) DEFAULT NULL,
  `problema_de_saude` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problema_de_saude_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente_especial01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cliente_especial01`
--

INSERT INTO `cliente_especial01` VALUES(1, 5691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `cliente_especial01` VALUES(2, 4154, NULL, 'Rita', NULL, 'Barbosa', NULL, '27/05/1940', NULL, 'Diabetes', NULL, NULL);
INSERT INTO `cliente_especial01` VALUES(3, 1541, NULL, 'F.', 6, 'Cartacho', NULL, '05/06/1939', NULL, 'alzaimer', 4, NULL);
INSERT INTO `cliente_especial01` VALUES(4, 5846, NULL, 'Josemar', NULL, 'Quintans', NULL, '10/03/1945', NULL, 'Diabetes', NULL, NULL);
INSERT INTO `cliente_especial01` VALUES(5, 3612, NULL, 'Francisco', NULL, 'Cartacho', NULL, '12/03/1935', NULL, 'Hipertensão', NULL, NULL);
INSERT INTO `cliente_especial01` VALUES(6, NULL, 1, 'Marinalva', NULL, 'Marques', NULL, '12/02/1830', 2, 'Diabetes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companhia_aerea01`
--

CREATE TABLE `companhia_aerea01` (
  `id_companhia_aerea01` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_companhia` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nome_companhia_erro` int(2) DEFAULT NULL,
  `qntd_aeronaves` int(2) NOT NULL,
  `qntd_aeronaves_erro` int(2) DEFAULT NULL,
  `qntd_pilotos` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `qntd_pilotos_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_companhia_aerea01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `companhia_aerea01`
--

INSERT INTO `companhia_aerea01` VALUES(1, NULL, 1, 'Viaje bem', NULL, 14, NULL, '5', NULL, NULL);
INSERT INTO `companhia_aerea01` VALUES(2, '6851', NULL, 'Total conforto', NULL, 10, NULL, '3', NULL, 17);
INSERT INTO `companhia_aerea01` VALUES(3, '5285', NULL, 'Boa viagem', NULL, 12, NULL, '2', NULL, NULL);
INSERT INTO `companhia_aerea01` VALUES(4, '2668', NULL, 'Esperança', NULL, 15, NULL, 'VI', 7, NULL);
INSERT INTO `companhia_aerea01` VALUES(5, '9852', NULL, 'Viva feliz', NULL, 20, NULL, '4', NULL, NULL);
INSERT INTO `companhia_aerea01` VALUES(6, '6982', NULL, 'Total conforto', NULL, 10, NULL, '3', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `companhia_aerea02`
--

CREATE TABLE `companhia_aerea02` (
  `id_companhia_aerea02` int(2) NOT NULL,
  `codigo_companhia` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_companhia_erro` int(2) DEFAULT NULL,
  `nome_companhia` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `nome_companhia_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_companhia_aerea02`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companhia_aerea02`
--

INSERT INTO `companhia_aerea02` VALUES(1, '00111', NULL, 'Voe.com', NULL, NULL);
INSERT INTO `companhia_aerea02` VALUES(2, '3003', 16, 'Águia', NULL, NULL);
INSERT INTO `companhia_aerea02` VALUES(3, '12121', NULL, 'Boa Viagem', NULL, NULL);
INSERT INTO `companhia_aerea02` VALUES(4, '3003', 16, 'Siga ao Céu', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consulta01`
--

CREATE TABLE `consulta01` (
  `id_consulta01` int(1) NOT NULL,
  `numero` int(5) DEFAULT NULL,
  `numero_erro` int(2) DEFAULT NULL,
  `paciente_id` int(5) DEFAULT NULL,
  `paciente_id_erro` int(2) DEFAULT NULL,
  `medico_id` int(5) DEFAULT NULL,
  `medico_id_erro` int(2) DEFAULT NULL,
  `data_consulta` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data_consulta_erro` int(2) DEFAULT NULL,
  `valor` decimal(6,2) DEFAULT NULL,
  `valor_erro` int(2) DEFAULT NULL,
  `forma_pgto` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forma_pgto_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_consulta01`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `consulta01`
--

INSERT INTO `consulta01` VALUES(1, 27910, 16, 50000, NULL, 22800, NULL, '15/09/2012', NULL, 99.99, NULL, 'Crédito', NULL, NULL);
INSERT INTO `consulta01` VALUES(2, 27910, 16, 33000, NULL, 22900, NULL, '5.ago.10', 7, 99.00, NULL, 'Débito', NULL, NULL);
INSERT INTO `consulta01` VALUES(3, 37400, NULL, 30000, NULL, 22900, NULL, 'junho/2010', 7, 150.00, NULL, 'Débito', NULL, NULL);
INSERT INTO `consulta01` VALUES(4, 73830, NULL, 40000, NULL, 22900, NULL, '11/01/2013', NULL, -99.99, 2, 'À Vista', NULL, NULL);
INSERT INTO `consulta01` VALUES(5, 78200, NULL, 44000, NULL, 30000, NULL, '09/01/2008', NULL, 80.00, NULL, 'Débito', NULL, NULL);
INSERT INTO `consulta01` VALUES(6, 84577, NULL, 40000, NULL, 22800, NULL, '19/05/2014', NULL, 178.00, NULL, 'kreditu', 4, NULL);
INSERT INTO `consulta01` VALUES(7, 89398, NULL, 82719, NULL, 22900, NULL, '22/08/2010', NULL, 99.00, NULL, 'À Vista', NULL, NULL);
INSERT INTO `consulta01` VALUES(8, 90911, NULL, 40000, NULL, 22900, NULL, '08/08/2013', NULL, 200.00, NULL, 'À Vista', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consulta02`
--

CREATE TABLE `consulta02` (
  `id_consulta02` int(1) NOT NULL AUTO_INCREMENT,
  `numero` int(3) DEFAULT NULL,
  `numero_erro` int(2) DEFAULT NULL,
  `dt_marcacao` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_marcacao_erro` int(2) DEFAULT NULL,
  `valor` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor_erro` int(2) DEFAULT NULL,
  `tipo` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_erro` int(2) DEFAULT NULL,
  `dt_realizacao` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_realizacao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_consulta02`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `consulta02`
--

INSERT INTO `consulta02` VALUES(1, 890, NULL, '12/08/2010', NULL, '90.00', NULL, 'Consulta', NULL, '24/09/2010', NULL, NULL);
INSERT INTO `consulta02` VALUES(2, 837, NULL, '18/06/2012', NULL, '94.00', NULL, 'Consulta', NULL, '18/07/2012', NULL, 17);
INSERT INTO `consulta02` VALUES(3, 267, NULL, '14/08/2013', 11, '120.00', NULL, 'Consulta', NULL, '14/07/2013', 11, NULL);
INSERT INTO `consulta02` VALUES(4, 673, NULL, '13/11/2012', NULL, '0', NULL, 'Retorno', NULL, '17/11/2012', NULL, NULL);
INSERT INTO `consulta02` VALUES(5, 367, NULL, '26/10/2013', NULL, '0', NULL, 'Retorno', NULL, '28/10/2013', NULL, NULL);
INSERT INTO `consulta02` VALUES(6, 111, NULL, '19-08-2013', 7, '190.00', NULL, 'Consulta', NULL, '12-09-2013', 7, NULL);
INSERT INTO `consulta02` VALUES(7, 360, NULL, '07/08/2013', NULL, '0', NULL, 'Retorno', NULL, '10/08/2013', NULL, NULL);
INSERT INTO `consulta02` VALUES(8, 837, NULL, '18/06/2012', NULL, '94.00', NULL, 'Consulta', NULL, '18/07/2012', NULL, 17);
INSERT INTO `consulta02` VALUES(9, 460, NULL, '17/02/2011', NULL, '70.00', NULL, 'Consulta', NULL, '18/03/2011', NULL, NULL);
INSERT INTO `consulta02` VALUES(10, 391, NULL, '22/12/2011', NULL, '145.00', NULL, 'Consulta', NULL, '31/01/2012', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consulta03`
--

CREATE TABLE `consulta03` (
  `id_consulta03` int(1) NOT NULL AUTO_INCREMENT,
  `id` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `data_consulta` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_consulta_erro` int(2) DEFAULT NULL,
  `hora_consulta` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hora_consulta_erro` int(2) DEFAULT NULL,
  `valor` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_consulta03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `consulta03`
--

INSERT INTO `consulta03` VALUES(1, 'C098', NULL, '18/03/2012', NULL, '08:30', NULL, '120.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(2, 'C113', NULL, '22/05/2013', NULL, '10:30', NULL, '130.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(3, NULL, 1, '27/05/2011', NULL, '11:30', NULL, '112.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(4, 'C128', NULL, '27.05.11', 7, '11:30', NULL, '112.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(5, 'C008', NULL, '17/05/2011', NULL, '08:00', NULL, '152.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(6, 'C193', NULL, '21/01/2013', NULL, '10:30', NULL, '-130.0', 9, NULL);
INSERT INTO `consulta03` VALUES(7, 'C102', NULL, '08/07/2013', NULL, '10:30', NULL, '135.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(8, 'C278', NULL, '07/05/2011', NULL, '25:30', 2, '222.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(9, 'C925', NULL, '28/07/2010', NULL, '10:00', NULL, '165.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(10, 'C567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `consulta03` VALUES(11, 'C871', NULL, '10/11/2009', NULL, '08:45', NULL, '98.00', NULL, NULL);
INSERT INTO `consulta03` VALUES(12, 'C601', NULL, '17/08/2011', NULL, '08:45', NULL, '190.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consulta04`
--

CREATE TABLE `consulta04` (
  `id_consulta04` int(1) NOT NULL AUTO_INCREMENT,
  `cod_consulta` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_consulta_erro` int(2) DEFAULT NULL,
  `cod_paciente` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_paciente_erro` int(2) DEFAULT NULL,
  `dt_consulta` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_consulta_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_consulta04`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `consulta04`
--

INSERT INTO `consulta04` VALUES(1, 'C190', NULL, 'P191', NULL, '17/11/2012', NULL, NULL);
INSERT INTO `consulta04` VALUES(2, 'C193', NULL, 'P200', NULL, '18/07/2011', NULL, NULL);
INSERT INTO `consulta04` VALUES(3, 'C195', NULL, 'P222', 21, '18/06/2014', NULL, NULL);
INSERT INTO `consulta04` VALUES(4, 'C400', NULL, 'P192', NULL, '18/07/2011', NULL, NULL);
INSERT INTO `consulta04` VALUES(5, 'C198', NULL, 'P195', NULL, '08-02-2013', 7, NULL);
INSERT INTO `consulta04` VALUES(6, 'C199', NULL, 'P201', NULL, '21/02/2013', NULL, NULL);
INSERT INTO `consulta04` VALUES(7, 'C205', NULL, 'P210', NULL, '11/02/2007', NULL, NULL);
INSERT INTO `consulta04` VALUES(8, 'C207', NULL, 'P211', NULL, '11/02/2007', NULL, 17);
INSERT INTO `consulta04` VALUES(9, 'C209', NULL, 'P201', NULL, '22/06/2008', NULL, NULL);
INSERT INTO `consulta04` VALUES(10, 'C207', NULL, 'P211', NULL, '11/02/2007', NULL, 17);
INSERT INTO `consulta04` VALUES(11, 'C399', NULL, 'P202', NULL, '19/08/2012', NULL, NULL);
INSERT INTO `consulta04` VALUES(12, 'C398', NULL, 'P190', NULL, '23/05/2011', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `curso01`
--

CREATE TABLE `curso01` (
  `id_curso01` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_curso` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `nome_curso_erro` int(2) DEFAULT NULL,
  `qtd_professores` int(2) NOT NULL,
  `qtd_professores_erro` int(2) DEFAULT NULL,
  `nome_cordenador` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_cordenador_erro` int(2) DEFAULT NULL,
  `qtd_periodos` int(2) NOT NULL,
  `qtd_periodos_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_curso01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `curso01`
--

INSERT INTO `curso01` VALUES(1, 101, 16, 'Filosofia', NULL, 25, NULL, NULL, 1, 8, NULL, NULL);
INSERT INTO `curso01` VALUES(2, 102, NULL, 'História', NULL, 24, NULL, 'Everaldo Martins', NULL, 8, NULL, NULL);
INSERT INTO `curso01` VALUES(3, 103, NULL, 'Física', NULL, 28, NULL, 'Jordão de Almeida', NULL, 8, NULL, NULL);
INSERT INTO `curso01` VALUES(4, 104, NULL, 'Cálculo', 9, 15, NULL, 'Inacio Pereira', NULL, 6, NULL, NULL);
INSERT INTO `curso01` VALUES(5, 101, 16, 'Arte e mídia', NULL, 31, NULL, 'M.P. Fortunato', 7, 4, NULL, NULL);
INSERT INTO `curso01` VALUES(6, 106, NULL, 'Ciência da Computação', NULL, 35, NULL, 'Sonally Henriques', NULL, 20, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departamento01`
--

CREATE TABLE `departamento01` (
  `id_departamento01` int(1) NOT NULL,
  `codigo_departamento` varchar(3) DEFAULT NULL,
  `codigo_departamento_erro` int(2) DEFAULT NULL,
  `departamento` varchar(9) DEFAULT NULL,
  `departamento_erro` int(2) DEFAULT NULL,
  `data_criacao` varchar(11) DEFAULT NULL,
  `data_criacao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_departamento01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamento01`
--

INSERT INTO `departamento01` VALUES(1, '301', NULL, 'limpeza', NULL, '16/02/1998', NULL, NULL);
INSERT INTO `departamento01` VALUES(2, '302', NULL, 'gerência', NULL, '22/10/1997', NULL, NULL);
INSERT INTO `departamento01` VALUES(3, '303', NULL, 'açougue', NULL, '04.05.1998', 7, NULL);
INSERT INTO `departamento01` VALUES(4, '304', NULL, NULL, NULL, NULL, NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `departamento02`
--

CREATE TABLE `departamento02` (
  `id_departamento02` int(1) NOT NULL,
  `id` varchar(4) NOT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `departamento` varchar(25) NOT NULL,
  `departamento_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_departamento02`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamento02`
--

INSERT INTO `departamento02` VALUES(1, '2697', NULL, 'Vendas', NULL, NULL);
INSERT INTO `departamento02` VALUES(2, '2345', NULL, 'Frios', NULL, NULL);
INSERT INTO `departamento02` VALUES(3, '4567', NULL, 'Panificação', NULL, NULL);
INSERT INTO `departamento02` VALUES(4, '7890', NULL, 'Roupas e Confecções', NULL, NULL);
INSERT INTO `departamento02` VALUES(5, '6543', NULL, 'Limpesa', 4, NULL);
INSERT INTO `departamento02` VALUES(6, '8765', NULL, 'Hortifruti', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departamento03`
--

CREATE TABLE `departamento03` (
  `id_departamento03` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_departamento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nome_departamento_erro` int(2) DEFAULT NULL,
  `qntd_professores` int(2) NOT NULL,
  `qntd_professores_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_departamento03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `departamento03`
--

INSERT INTO `departamento03` VALUES(1, 789, 16, 'Departamento de Matemática e Estatística', NULL, 28, NULL, NULL);
INSERT INTO `departamento03` VALUES(2, 768, NULL, 'Departamento de Artes', NULL, 16, NULL, NULL);
INSERT INTO `departamento03` VALUES(3, 786, NULL, 'Departamento de Humanidades', NULL, 19, NULL, NULL);
INSERT INTO `departamento03` VALUES(4, 789, 16, 'Departamento de Letras', NULL, 26, NULL, NULL);
INSERT INTO `departamento03` VALUES(5, 790, NULL, 'Departamento de Comunicassão', 4, 18, NULL, NULL);
INSERT INTO `departamento03` VALUES(6, 791, NULL, 'Departamento de Engenharia Elétrica', NULL, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dermocosmeticos01`
--

CREATE TABLE `dermocosmeticos01` (
  `id_dermocosmeticos01` int(2) NOT NULL AUTO_INCREMENT,
  `id` int(2) DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `conteudo` varchar(10) DEFAULT NULL,
  `conteudo_erro` int(2) DEFAULT NULL,
  `preco` varchar(6) DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_dermocosmeticos01`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `dermocosmeticos01`
--

INSERT INTO `dermocosmeticos01` VALUES(1, 1, NULL, 'Gel Cicatricure para cicatrizes e estrias', NULL, '30g', NULL, '28,80', NULL, NULL);
INSERT INTO `dermocosmeticos01` VALUES(2, 2, NULL, 'Lenços Umedecidos Facial Asepxia', NULL, '25 un.', NULL, '13,00', NULL, 17);
INSERT INTO `dermocosmeticos01` VALUES(3, 3, 16, 'Antioxidante Skinceuticals Phloretin CF', NULL, '30', 8, '399,00', NULL, NULL);
INSERT INTO `dermocosmeticos01` VALUES(4, 3, 16, 'Gel de Limpeza Facial Vichy Normaderm', NULL, '200g', NULL, '48,50', NULL, NULL);
INSERT INTO `dermocosmeticos01` VALUES(5, 4, NULL, 'Sabonete Facial Vichy Normaderm Barra', NULL, '80g', NULL, '20,35', NULL, NULL);
INSERT INTO `dermocosmeticos01` VALUES(7, 5, NULL, 'Lenços Umedecidos Facial Asepxia', NULL, '25 un.', NULL, '13,00', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor01`
--

CREATE TABLE `distribuidor01` (
  `id_distribuidor01` int(1) NOT NULL,
  `id` varchar(3) DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `empresa` varchar(32) DEFAULT NULL,
  `empresa_erro` int(3) DEFAULT NULL,
  `cod_endereco` varchar(3) DEFAULT NULL,
  `cod_endereco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor01`
--

INSERT INTO `distribuidor01` VALUES(1, '400', NULL, 'Cosméticos hear,bairro,catolé', 5, '202', NULL, NULL);
INSERT INTO `distribuidor01` VALUES(2, '401', NULL, 'dermapele', NULL, '203', NULL, NULL);
INSERT INTO `distribuidor01` VALUES(3, '402', NULL, 'sorribel', NULL, '314', 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_brinquedos01`
--

CREATE TABLE `distribuidor_brinquedos01` (
  `id_distribuidor_brinquedos01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `distribuidor` varchar(40) NOT NULL,
  `distribuidor_erro` int(2) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  `CNPJ_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_brinquedos01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor_brinquedos01`
--

INSERT INTO `distribuidor_brinquedos01` VALUES(1, 369, NULL, 'Brincando bem', NULL, '12.365.658/8877-64', NULL, 17);
INSERT INTO `distribuidor_brinquedos01` VALUES(2, 370, NULL, 'CIA brinquedos', NULL, '15.875.268/3207-13', NULL, NULL);
INSERT INTO `distribuidor_brinquedos01` VALUES(3, 372, NULL, 'Kids brinquedos educativos', NULL, '26.289.457/5621-84', NULL, NULL);
INSERT INTO `distribuidor_brinquedos01` VALUES(4, 373, NULL, 'Brincando bem', NULL, '12.365.658/8877-64', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_eletrodomesticos01`
--

CREATE TABLE `distribuidor_eletrodomesticos01` (
  `id_distribuidor_eletrodomesticos01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `distribuidor` varchar(50) NOT NULL,
  `distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_eletrodomesticos01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor_eletrodomesticos01`
--

INSERT INTO `distribuidor_eletrodomesticos01` VALUES(1, 385, NULL, 'Fontes Atacado LTDA', NULL, NULL);
INSERT INTO `distribuidor_eletrodomesticos01` VALUES(2, 386, NULL, 'Campina Eletrodomésticos ', NULL, NULL);
INSERT INTO `distribuidor_eletrodomesticos01` VALUES(3, 387, NULL, 'Eletrovariedades', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_frutas_e_verduras01`
--

CREATE TABLE `distribuidor_frutas_e_verduras01` (
  `id_distribuidor_frutas_e_verduras01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `distribuidor` varchar(20) NOT NULL,
  `distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_frutas_e_verduras01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor_frutas_e_verduras01`
--

INSERT INTO `distribuidor_frutas_e_verduras01` VALUES(1, 580, NULL, 'Naldinho das frutas', NULL, NULL);
INSERT INTO `distribuidor_frutas_e_verduras01` VALUES(2, 583, NULL, 'Macedo Frutas', NULL, NULL);
INSERT INTO `distribuidor_frutas_e_verduras01` VALUES(3, 586, NULL, 'Hortifruti Lima', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_limpeza01`
--

CREATE TABLE `distribuidor_limpeza01` (
  `id_distribuidor_limpeza01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `distribuidor` varchar(20) NOT NULL,
  `distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_limpeza01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor_limpeza01`
--

INSERT INTO `distribuidor_limpeza01` VALUES(1, 150, 16, 'Química Farias', NULL, NULL);
INSERT INTO `distribuidor_limpeza01` VALUES(2, 151, NULL, 'Esponja Mix', NULL, NULL);
INSERT INTO `distribuidor_limpeza01` VALUES(3, 150, 16, 'Ramones Química', NULL, NULL);
INSERT INTO `distribuidor_limpeza01` VALUES(4, 152, NULL, 'Limpa Demais', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distribuidor_papelaria01`
--

CREATE TABLE `distribuidor_papelaria01` (
  `id_distribuidor_papelaria01` int(1) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `distribuidor` varchar(20) NOT NULL,
  `distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_distribuidor_papelaria01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distribuidor_papelaria01`
--

INSERT INTO `distribuidor_papelaria01` VALUES(1, '236', 16, 'Colorilapis', NULL, NULL);
INSERT INTO `distribuidor_papelaria01` VALUES(2, '222', NULL, 'Faber Castelo', NULL, NULL);
INSERT INTO `distribuidor_papelaria01` VALUES(3, '236', 16, 'Pintando a Vida', NULL, NULL);
INSERT INTO `distribuidor_papelaria01` VALUES(4, '299', NULL, 'Papelart', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(3) NOT NULL DEFAULT '0',
  `nome` char(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` VALUES(1, 'Supermercado');
INSERT INTO `empresa` VALUES(2, 'Consultório Médico');
INSERT INTO `empresa` VALUES(3, 'Aeroporto');
INSERT INTO `empresa` VALUES(4, 'Locadora');
INSERT INTO `empresa` VALUES(5, 'Faculdade');
INSERT INTO `empresa` VALUES(6, 'Farmácia');
INSERT INTO `empresa` VALUES(7, 'Clube');
INSERT INTO `empresa` VALUES(8, 'Escola');
INSERT INTO `empresa` VALUES(9, 'Telemarketing');
INSERT INTO `empresa` VALUES(10, 'Seguradora');
INSERT INTO `empresa` VALUES(11, 'Concessionária');

-- --------------------------------------------------------

--
-- Table structure for table `endereco01`
--

CREATE TABLE `endereco01` (
  `id_endereco01` int(1) NOT NULL,
  `cod_endereco` varchar(3) DEFAULT NULL,
  `cod_endereco_erro` int(2) DEFAULT NULL,
  `logradouro` varchar(18) DEFAULT NULL,
  `logradouro_erro` int(2) DEFAULT NULL,
  `bairro` varchar(17) DEFAULT NULL,
  `bairro_erro` int(2) DEFAULT NULL,
  `cidade` varchar(13) DEFAULT NULL,
  `cidade_erro` int(2) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `estado_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_endereco01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endereco01`
--

INSERT INTO `endereco01` VALUES(15, '201', NULL, 'Rua Pedro Brasil', NULL, 'Monte Castelo', NULL, 'C.Grande', 8, 'Paraíba', NULL, NULL);
INSERT INTO `endereco01` VALUES(16, '202', NULL, 'Catolé', 12, 'Rua José Freitas', 12, 'Olinda', NULL, 'Recife', 2, NULL);
INSERT INTO `endereco01` VALUES(17, '203', NULL, 'Rua Amazonas', NULL, 'Centro', NULL, 'Missão Velha', NULL, 'Ceará', NULL, NULL);
INSERT INTO `endereco01` VALUES(18, '204', NULL, 'Rua João Quirino', NULL, 'Malvinas', NULL, 'Matureia', NULL, 'PB', 7, NULL);
INSERT INTO `endereco01` VALUES(19, '205', NULL, 'Rua do sol,205,SP', 5, 'Bancário', NULL, 'Guarulhos', NULL, 'São Paulo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `endereco02`
--

CREATE TABLE `endereco02` (
  `id_endereco02` int(1) NOT NULL,
  `codigo` int(2) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `CEP` varchar(15) DEFAULT NULL,
  `CEP_erro` int(2) DEFAULT NULL,
  `logradouro` varchar(25) DEFAULT NULL,
  `logradouro_erro` int(2) DEFAULT NULL,
  `numero` int(3) DEFAULT NULL,
  `numero_erro` int(2) DEFAULT NULL,
  `bairro` varchar(25) DEFAULT NULL,
  `bairro_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_endereco02`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endereco02`
--

INSERT INTO `endereco02` VALUES(1, 12, NULL, '58415-000', NULL, 'Avenida João Wallig', NULL, 177, NULL, 'J. Paulistano', 8, NULL);
INSERT INTO `endereco02` VALUES(2, 13, NULL, '584101-122', 7, 'Rua Nereu Ramos', NULL, 204, NULL, 'Catolé', NULL, NULL);
INSERT INTO `endereco02` VALUES(3, 14, NULL, '58432-180', NULL, 'Rua Costa e Silva', NULL, 502, NULL, 'Dinamérica', NULL, NULL);
INSERT INTO `endereco02` VALUES(4, 15, NULL, '58407-055', NULL, 'Rua Chile', NULL, 105, NULL, 'Monte Castelo', NULL, NULL);
INSERT INTO `endereco02` VALUES(5, 16, NULL, '58406-790', NULL, 'Rua Chile', NULL, 628, NULL, 'Nova Brasilia', NULL, NULL);
INSERT INTO `endereco02` VALUES(6, 17, NULL, '58407-325', NULL, 'José Pinheiro', 12, 320, NULL, 'Rua Amaro Coutinho', 12, NULL);
INSERT INTO `endereco02` VALUES(7, 18, NULL, '58416-565', NULL, 'Rua Alice Carneiro', NULL, 102, NULL, 'Santa Rosa', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `endereco03`
--

CREATE TABLE `endereco03` (
  `id_endereco03` int(1) NOT NULL AUTO_INCREMENT,
  `cod_endereco` int(3) DEFAULT NULL,
  `cod_endereco_erro` int(2) DEFAULT NULL,
  `logradouro` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro_erro` int(2) DEFAULT NULL,
  `numero` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_erro` int(2) DEFAULT NULL,
  `bairro` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro_erro` int(2) DEFAULT NULL,
  `cidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cidade_erro` int(2) DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `uf_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_endereco03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `endereco03`
--

INSERT INTO `endereco03` VALUES(1, 100, NULL, 'Rua Antenor Navarro', NULL, '293', NULL, 'Prata', NULL, 'Campina Grande', NULL, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(2, 200, NULL, 'Av. Floriano Peixoto', NULL, '222', NULL, 'Centro', NULL, 'Campina Grande', NULL, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(3, 300, NULL, 'Rua Cristina Procópio', NULL, '193', NULL, 'Catolé', NULL, 'CG', 6, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(4, 400, NULL, 'Av. Floriano Peixoto', NULL, '182', NULL, 'Centro', NULL, 'Campina Grande', 11, 'RS', 11, NULL);
INSERT INTO `endereco03` VALUES(5, 500, NULL, 'Rua Aluisio Cunha Lima', NULL, '450', NULL, 'Catolé', NULL, 'Campina Grande', NULL, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(6, 600, NULL, 'Rua do Sol', NULL, '1450', NULL, 'Santa Rosa', NULL, 'Campina Grande', NULL, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(7, 700, NULL, 'Rua Teixeira de Freiras', NULL, '450', NULL, 'São José', NULL, 'Campina Grande', NULL, 'PB', NULL, NULL);
INSERT INTO `endereco03` VALUES(8, 800, NULL, 'Rua Sá e Souza', NULL, '978', NULL, 'Setúbal', NULL, 'Recife', NULL, 'PE', NULL, NULL);
INSERT INTO `endereco03` VALUES(9, 900, NULL, 'Rua Januncio Sá, 16 - Boa Viag', 5, '16', NULL, 'Boa Viagem', NULL, 'Recife', NULL, 'PE', NULL, NULL);
INSERT INTO `endereco03` VALUES(10, 999, NULL, 'Rua das Moças', NULL, 's/n', NULL, 'Centro', NULL, 'Recife', NULL, 'PE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `erros`
--

CREATE TABLE `erros` (
  `id_erros` int(3) NOT NULL DEFAULT '0',
  `nome` char(60) DEFAULT NULL,
  `descricao` char(100) DEFAULT NULL,
  `tipo` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_erros`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `erros`
--

INSERT INTO `erros` VALUES(1, 'Valor em falta', 'Falta de preenchimento de atributos obrigatórios', 'Única célula');
INSERT INTO `erros` VALUES(2, 'Valor ilegal', 'Fora do domí­nio de valores válidos', 'Única célula');
INSERT INTO `erros` VALUES(3, 'Valor incorreto', 'O valor do atributo não corresponde à situação real', 'Única célula');
INSERT INTO `erros` VALUES(4, 'Erro ortográfico', 'Erro geralmente associado a atributos textuais', 'Única célula');
INSERT INTO `erros` VALUES(5, 'Informação em excesso', 'Múltiplos valores introduzidos num único atributo textual', 'Única célula');
INSERT INTO `erros` VALUES(6, 'Substring inválido', 'Anomalia resultante do uso de abreviaturas ou pronomes de tratamento em nomes de pessoas', 'Única célula');
INSERT INTO `erros` VALUES(7, 'Violação de sintaxe', 'O valor do atributo surge sob diferentes formatos', 'Única célula');
INSERT INTO `erros` VALUES(8, 'Valor impreciso', 'Valor com mais de uma interpretação', 'Única célula');
INSERT INTO `erros` VALUES(9, 'Violação de restrição de domí­nio de negócio', 'Valor do campo não poderia ser aceito no mundo real', 'Única célula');
INSERT INTO `erros` VALUES(10, 'Valor desatualizado', 'Valor não corresponde ao valor atual', 'Única célula');
INSERT INTO `erros` VALUES(11, 'Violação da dependência entre atributos', 'Existência de inconsistência entre valores de atributos relacionados', 'Tupla inteira');
INSERT INTO `erros` VALUES(12, 'Troca de valores entre atributos', 'Introdução de valor no atributo errado', 'Tupla inteira');
INSERT INTO `erros` VALUES(13, 'Tupla semi-vazia ou vazia', 'A maioria dos atributos da tupla não está preenchida', 'Tupla inteira');
INSERT INTO `erros` VALUES(14, 'Violação de dependência funcional', 'O valor de um atributo não está relacionado apenas a este, como deveria na vida real', 'Tupla inteira');
INSERT INTO `erros` VALUES(15, 'Utilização de sinônimos', 'Expressões diferentes, mas com o mesmo sentido', 'Na tabela');
INSERT INTO `erros` VALUES(16, 'Valor não único', 'Duas entidades com o mesmo valor em campo que deveria ser chave única', 'Na tabela');
INSERT INTO `erros` VALUES(17, 'Redundância sobre a mesma entidade', 'Aparentemente existe outro registro da mesma entidade', 'Na tabela');
INSERT INTO `erros` VALUES(18, 'Inconsistência sobre a mesma entidade', 'Conflito nos valores dos atributos de uma mesma entidade representada em mais de uma tupla', 'Na tabela');
INSERT INTO `erros` VALUES(19, 'Violação de restrição de Domí­nio de negócio', 'Uma tabela possui mais/menos tuplas do que deveria.', 'Na tabela');
INSERT INTO `erros` VALUES(20, 'Circularidade entre tupla em autorrelacionamento', 'Um registro na tabela que é, ao mesmo tempo, gerente e subordinado da mesma pessoa, por exemplo.', 'Na tabela');
INSERT INTO `erros` VALUES(21, 'Referência inexistente', 'Violação à integridade referencial', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(22, 'Referência errada', 'Código de referência a alguma tabela não condiz com a situação real.', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(23, 'Redundância sobre a mesma entidade', 'A mesma entidade encontra-se representada sob formas iguais ou diferentes em várias tabelas', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(24, 'Inconsistência sobre a mesma entidade', 'Conflitos nos valores dos atributos de uma entidade representada em mais do que uma tabela', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(25, 'Formatos de representação diferentes', 'O valor do atributo surge sob diferentes formatos de representação consoante a tabela', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(26, 'Unidade de medidas diferentes', 'O valor do atributo surge sob variadas unidades de medida consoante a tabela', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(27, 'Utilização de sinônimos', 'Expressões sintaticamente diferentes, mas com igual significado em tabelas diferentes', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(28, 'Violação de restrição de domí­nio', 'Um valor em uma tabela é inconsistente, de acordo com dados em outra tabela', 'Em múltiplas tabelas');
INSERT INTO `erros` VALUES(29, 'Domí­nio de violação de restrição', 'Violação de restrição inerente ao domínio, envolvendo os relacionamentos entre múltiplas relações', 'Em múltiplas tabelas');

-- --------------------------------------------------------

--
-- Table structure for table `especialidade01`
--

CREATE TABLE `especialidade01` (
  `id_especialidade01` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `especialidade01`
--

INSERT INTO `especialidade01` VALUES(1, 'E08', NULL, 'Pediatria', NULL, NULL);
INSERT INTO `especialidade01` VALUES(2, 'E18', NULL, 'Cardiologia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(3, 'E03', NULL, 'Ginecologia', NULL, 17);
INSERT INTO `especialidade01` VALUES(4, 'E06', 16, 'Neurologia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(5, 'E13', NULL, 'Clínica Geral', NULL, NULL);
INSERT INTO `especialidade01` VALUES(6, 'E34', NULL, 'Psiquiatria', NULL, NULL);
INSERT INTO `especialidade01` VALUES(7, 'E45', NULL, 'Pneumologia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(8, 'E03', NULL, 'Ginecologia', NULL, 17);
INSERT INTO `especialidade01` VALUES(9, 'E27', NULL, 'Obstetrícia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(10, 'E78', NULL, 'Tralmatologia', 4, NULL);
INSERT INTO `especialidade01` VALUES(11, 'E05', NULL, 'Oftalmologia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(12, 'E81', NULL, 'Hematologia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(13, 'E06', 16, 'Neoplasia', NULL, NULL);
INSERT INTO `especialidade01` VALUES(14, 'E38', NULL, 'Cirurgia Geral', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `especialidade02`
--

CREATE TABLE `especialidade02` (
  `id_especialidade02` int(11) NOT NULL AUTO_INCREMENT,
  `cod_especialidade` varchar(4) DEFAULT NULL,
  `cod_especialidade_erro` varchar(2) DEFAULT NULL,
  `nome` varchar(36) DEFAULT NULL,
  `nome_erro` varchar(1) DEFAULT NULL,
  `linha_erro` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade02`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `especialidade02`
--

INSERT INTO `especialidade02` VALUES(1, 'E001', '', 'Alergologia', '', '');
INSERT INTO `especialidade02` VALUES(2, 'E003', '', 'Neurocirurgia', '', '');
INSERT INTO `especialidade02` VALUES(3, 'E005', '', 'Nefrologia', '', '');
INSERT INTO `especialidade02` VALUES(4, 'E007', '', 'Mamografia', '', '');
INSERT INTO `especialidade02` VALUES(5, 'E011', '', 'Audiometria', '', '');
INSERT INTO `especialidade02` VALUES(6, 'E013', '', 'Hurologia', '4', '');
INSERT INTO `especialidade02` VALUES(7, 'E015', '', 'Homeopatia', '', '');
INSERT INTO `especialidade02` VALUES(8, 'E021', '', 'Cirurgia Geral', '', '');
INSERT INTO `especialidade02` VALUES(9, 'E029', '16', 'Geriatria', '', '');
INSERT INTO `especialidade02` VALUES(10, 'E029', '16', 'Mastologia', '', '');
INSERT INTO `especialidade02` VALUES(11, 'E035', '', 'Oftalmologia', '', '');
INSERT INTO `especialidade02` VALUES(12, 'E037', '', 'Cirurgia Vascular', '', '');
INSERT INTO `especialidade02` VALUES(13, 'E039', '', 'Otorrinolaringologia', '', '');
INSERT INTO `especialidade02` VALUES(14, 'E043', '', 'Cirurgia Video-Laparoscopica Pelvica', '', '17');
INSERT INTO `especialidade02` VALUES(15, 'E043', '', 'Cirurgia Videolaparoscopica Pelvica', '', '17');
INSERT INTO `especialidade02` VALUES(16, 'E047', '', 'Ecocardiograma', '', '');
INSERT INTO `especialidade02` VALUES(17, 'E050', '', 'Dermatologia', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exame01`
--

CREATE TABLE `exame01` (
  `id_exame01` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(3) DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `resultado` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultado_erro` int(2) DEFAULT NULL,
  `data_exame` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_exame_erro` int(2) DEFAULT NULL,
  `data_validade` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_validade_erro` int(2) DEFAULT NULL,
  `id_paciente` int(3) DEFAULT NULL,
  `id_paciente_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_exame01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exame01`
--

INSERT INTO `exame01` VALUES(1, 341, NULL, 'Negativo', NULL, '09/12/2009', NULL, '09/01/2010', NULL, 800, NULL, NULL);
INSERT INTO `exame01` VALUES(2, 736, NULL, 'Negativo', NULL, '08/12/2010', 11, '08/11/2010', 11, 341, NULL, NULL);
INSERT INTO `exame01` VALUES(3, 982, NULL, 'Positivo', NULL, '18/02/2013', NULL, '18/04/2013', NULL, 389, NULL, NULL);
INSERT INTO `exame01` VALUES(4, 452, NULL, 'Negativo', NULL, '19/01/2010', NULL, '19/02/2010', NULL, 761, NULL, NULL);
INSERT INTO `exame01` VALUES(5, NULL, 1, 'Negativo', NULL, '22/03/2013', NULL, '22/04/2013', NULL, 238, NULL, NULL);
INSERT INTO `exame01` VALUES(6, 370, NULL, 'Positivo', NULL, '03-12-2010', 7, '03-01-2011', 7, 801, NULL, NULL);
INSERT INTO `exame01` VALUES(7, 122, NULL, 'Positivo', NULL, '27/07/2013', NULL, '27/08/2013', NULL, 371, NULL, NULL);
INSERT INTO `exame01` VALUES(8, 123, NULL, 'Negativo', NULL, '20/04/2014', NULL, '20/05/2014', NULL, 444, NULL, NULL);
INSERT INTO `exame01` VALUES(9, 196, NULL, 'Indefinido', NULL, '17/11/2010', NULL, '17/12/2010', NULL, 738, NULL, NULL);
INSERT INTO `exame01` VALUES(10, 383, NULL, 'Positivo', NULL, '08/08/2008', NULL, '08/08/2009', NULL, 900, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fornecedor01`
--

CREATE TABLE `fornecedor01` (
  `id_fornecedor01` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `codigo_erro` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `nome_fornecedor` varchar(42) CHARACTER SET utf8 DEFAULT NULL,
  `nome_fornecedor_erro` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `bairro` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `bairro_erro` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `cidade` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `cidade_erro` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `telefone` varchar(44) CHARACTER SET utf8 DEFAULT NULL,
  `telefone_erro` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `cod_especialidade` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `cod_especialidade_erro` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `linha_erro` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `fornecedor01`
--

INSERT INTO `fornecedor01` VALUES(1, 'PE 00116', '', 'ADAHIR FERRERA', '', 'Boa Vista', '', 'Recife', '', '(81)3222-2479', '', 'E007', '', '');
INSERT INTO `fornecedor01` VALUES(2, 'PE 01033', '', 'ADALBERTO GUIDO DE ARAUJO', '', 'Espinheiro', '', 'Recife', '', '(81) 3231-1885/3231-5543', '', 'E001', '', '');
INSERT INTO `fornecedor01` VALUES(3, 'PE 00347', '', 'ADAUTO JOSE MOURATO DE BARROS', '', 'Centro', '', 'Serra Talhada', '', '(87)3831-2745', '', 'E037', '', '');
INSERT INTO `fornecedor01` VALUES(4, 'PE 00017', '', 'ADELMA MARIA GOMES AGUIAR', '', 'Boa Vista', '', 'Recife', '', '(81)3221-4698', '', 'E039', '', '');
INSERT INTO `fornecedor01` VALUES(5, 'PE 00042', '', 'ADERCIO PEREIRA ANGIOLOGIA E CIR. VASCULAR', '', 'Centro', '', 'Cabo', '', '(81)3521-0634', '', 'E007', '', '');
INSERT INTO `fornecedor01` VALUES(6, 'PE 00016', '', 'ADERSON PACHECO NICODEMOS', '', 'Derby', '', 'Recife', '', '(81)3231-4072', '', 'E021', '', '17');
INSERT INTO `fornecedor01` VALUES(7, 'PE 00014', '', 'ADERSON PACHECO NICODEMOS', '', '', '', 'Recife', '', '(81)3231-4072', '', 'E021', '', '17');
INSERT INTO `fornecedor01` VALUES(8, 'PE 00383', '', 'ADERSON SERGIO DE ALENCAR CARVALHO', '', 'Boa Viagem', '', 'Recife', '', '(81)3326-4753', '', 'E001', '', '');
INSERT INTO `fornecedor01` VALUES(9, 'PE 00887', '', 'ADRIANA CARLA PEIXOTO DE ARAUJO', '', 'Ilha do Leite', '', 'Recife', '', '(81)3222-5999', '', 'E011', '', '');
INSERT INTO `fornecedor01` VALUES(10, 'PE 01048', '', 'AJON TENORIO COSTA JUNIOR', '', 'Centro', '', 'Bezerros', '', '(81)3423-8156', '', 'E013', '', '');
INSERT INTO `fornecedor01` VALUES(11, 'PE 01026', '', 'ALEX ANTUNES CORREIA', '', 'Espinheiro', '', 'Recife', '', '(81) 3231-5543/3231-1877/3221-6380/3221-7193', '5', 'E043', '', '');
INSERT INTO `fornecedor01` VALUES(12, 'PE 01018', '', 'ALEXANDRE AUGUSTO PAREDES SELVA', '', 'Bairro Novo', '', 'Olinda', '', '(81) 3439-7217', '', 'E003', '', '');
INSERT INTO `fornecedor01` VALUES(13, 'PE 00741', '', 'ALEXANDRE FAEIRSTEIN', '', 'Centro', '', 'Cabo', '', '(81)3521-0109', '', 'E035', '', '17');
INSERT INTO `fornecedor01` VALUES(14, 'PE 00742', '', 'ALEXANDRE FAEIRSTEIN', '', 'Centro', '', '', '', '(81)3521-0109', '', 'E035', '', '17');
INSERT INTO `fornecedor01` VALUES(15, 'PE 01592', '', 'ALEXANDRE GUERRA', '', 'Boa Viagem', '', 'Recife', '', '(81)3465-5562', '', 'E050', '', '');
INSERT INTO `fornecedor01` VALUES(16, 'PE 00117', '', 'ALFREDO DA COSTA NETO', '', 'Derby', '', 'Recife', '', '(81)3423-8863', '', 'E005', '', '');
INSERT INTO `fornecedor01` VALUES(17, 'PE 00433', '', 'ALFREDO DE LUNA NETO', '', 'Bairro Novo', '', 'Olinda', '', '(81)3361-0102', '', 'E080', '21', '');

-- --------------------------------------------------------

--
-- Table structure for table `funcionario01`
--

CREATE TABLE `funcionario01` (
  `id_funcionario01` int(1) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(17) DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(10) DEFAULT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `cargo_erro` int(2) DEFAULT NULL,
  `id_departamento` varchar(4) DEFAULT NULL,
  `id_departamento_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario01`
--

INSERT INTO `funcionario01` VALUES(1, '200', 16, 'Evanize', NULL, 'Lucena', NULL, 'Faixineira', NULL, '301', NULL, NULL);
INSERT INTO `funcionario01` VALUES(2, '201', NULL, 'Alexandre', NULL, 'Gonzaga', NULL, 'Gerente de vendas', NULL, '302', NULL, NULL);
INSERT INTO `funcionario01` VALUES(3, '202', NULL, 'Carolina', NULL, 'Ramos', NULL, 'Recepcionista', NULL, '400', 21, NULL);
INSERT INTO `funcionario01` VALUES(4, '203', NULL, 'Amanda', NULL, 'Sobral', NULL, 'Faxineira', NULL, '301', NULL, NULL);
INSERT INTO `funcionario01` VALUES(5, '200', 16, 'Ednaldo', NULL, 'Farias', NULL, 'Açougueiro', NULL, '303', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario02`
--

CREATE TABLE `funcionario02` (
  `id_funcionario02` int(2) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(10) NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(25) NOT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `data_contratacao` varchar(10) NOT NULL,
  `data_contratacao_erro` int(2) DEFAULT NULL,
  `salario` varchar(10) NOT NULL,
  `salario_erro` int(2) DEFAULT NULL,
  `funcao` varchar(15) NOT NULL,
  `funcao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario02`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario02`
--

INSERT INTO `funcionario02` VALUES(1, '001', NULL, 'Osvaldo', NULL, 'Cruz', NULL, '08/04/2010', NULL, '1000,00', NULL, 'Marketeiro', NULL, NULL);
INSERT INTO `funcionario02` VALUES(2, '010', NULL, 'Ana', NULL, 'Catarina Dantas', NULL, '2012/01/02', 7, '890,00', NULL, 'Faxineira', NULL, NULL);
INSERT INTO `funcionario02` VALUES(3, NULL, 1, 'Maria', NULL, 'Silva', NULL, '02/10/2013', NULL, '1100,00', NULL, 'Caixa', NULL, NULL);
INSERT INTO `funcionario02` VALUES(4, '011', NULL, 'Luiza', NULL, 'Carvalho', NULL, '15/02/2014', NULL, '1955,00', NULL, 'Gerente', NULL, NULL);
INSERT INTO `funcionario02` VALUES(5, '012', NULL, '1522', 2, 'Arruda', NULL, '05/04/2011', NULL, '1100,00', NULL, 'Caixa', NULL, NULL);
INSERT INTO `funcionario02` VALUES(6, '013', NULL, 'Marivaldo', NULL, 'Gomes', NULL, '14/03/2012', NULL, '1,00', 2, 'Padeiro', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario03`
--

CREATE TABLE `funcionario03` (
  `id_funcionario03` int(2) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(10) NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(15) NOT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `data_contratacao` varchar(15) NOT NULL,
  `data_contratacao_erro` int(2) DEFAULT NULL,
  `salario` varchar(10) NOT NULL,
  `salario_erro` int(2) DEFAULT NULL,
  `funcao` varchar(18) NOT NULL,
  `funcao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario03`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario03`
--

INSERT INTO `funcionario03` VALUES(1, '150', 16, 'Maria', NULL, 'Silva', NULL, '16/02/2012', NULL, '750,00', NULL, 'Açougueira', NULL, NULL);
INSERT INTO `funcionario03` VALUES(2, '152', NULL, 'Ana', NULL, 'Queiroz', NULL, '04/05/2000', NULL, '950,00', NULL, 'Caixa', NULL, NULL);
INSERT INTO `funcionario03` VALUES(3, '153', NULL, 'Lucas', NULL, 'Pereira', NULL, '09/01/1998', NULL, '630,00', NULL, 'Empacotador', NULL, NULL);
INSERT INTO `funcionario03` VALUES(4, '154', NULL, 'Enzo', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 13);
INSERT INTO `funcionario03` VALUES(5, '150', 16, 'Henriq.', 4, 'Costa', NULL, '25/11/2003', NULL, '1150,00', NULL, 'Gerente', NULL, NULL);
INSERT INTO `funcionario03` VALUES(6, '156', NULL, 'Sandra', NULL, 'Lima', NULL, '08.04.2007', 7, '960,00', NULL, 'Vendedor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario04`
--

CREATE TABLE `funcionario04` (
  `id_funcionario04` int(2) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `cpf_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(50) DEFAULT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `data_de_nascimento` varchar(20) DEFAULT NULL,
  `data_de_nascimento_erro` int(2) DEFAULT NULL,
  `codigo_endereco` int(2) DEFAULT NULL,
  `codigo_endereco_erro` int(2) DEFAULT NULL,
  `data_da_contratacao` varchar(15) DEFAULT NULL,
  `data_da_contratacao_erro` int(2) DEFAULT NULL,
  `funcao` varchar(30) DEFAULT NULL,
  `funcao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario04`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario04`
--

INSERT INTO `funcionario04` VALUES(1, '051.896.362-07', NULL, 'Arimateia de Sousa Lopes', NULL, '14/01/1988', 11, 12, NULL, '15/12/1987', 11, 'Gerente de Vendas', NULL, NULL);
INSERT INTO `funcionario04` VALUES(2, '085.097.987-00', 16, 'Ramon Almeida de Araujo', NULL, '20/03/1963', NULL, 13, NULL, '23/06/1988', NULL, 'Promotor de Vendas', NULL, NULL);
INSERT INTO `funcionario04` VALUES(3, '115.391.624-98', NULL, 'Ruan Jackson Barbosa', NULL, '25/09/1966', NULL, 14, NULL, '17/04/1990', NULL, 'Operador de Caixa', NULL, NULL);
INSERT INTO `funcionario04` VALUES(4, '205.181.374-49', NULL, 'Higor Egito Silva', NULL, '18/04/1979', NULL, 15, NULL, '22/02/1999', NULL, 'Vendedor', NULL, NULL);
INSERT INTO `funcionario04` VALUES(5, '343.337.541-00', NULL, 'Elyanne Barros Oliveira', NULL, '14/07/1990', NULL, 16, NULL, '12/07/2009', NULL, 'Serviços Gerais', NULL, NULL);
INSERT INTO `funcionario04` VALUES(6, '351.733.861-34', NULL, 'Josylanne Herminio da Silva', NULL, '25/01/1987', NULL, 17, NULL, '17/10/2005', NULL, 'Encarregado de Setor', NULL, NULL);
INSERT INTO `funcionario04` VALUES(7, '244.488.421-34', NULL, 'Francineide Ferreira Xavier', NULL, '16/11/1987', NULL, 18, NULL, '10/11/2012', NULL, 'Vendedor', NULL, NULL);
INSERT INTO `funcionario04` VALUES(8, '563.257.971-91', NULL, 'Maria Beatriz Sousa', NULL, '23/04/1978', NULL, 12, NULL, '23/09/1998', NULL, 'Vendedor', NULL, 17);
INSERT INTO `funcionario04` VALUES(9, '110.825.693-72', NULL, 'Dr. José Marques Basilio', 6, '27/07/1976', NULL, 13, NULL, '15/02/1995', NULL, 'Vemdedor', 4, NULL);
INSERT INTO `funcionario04` VALUES(10, '516.140.301-20', NULL, 'Adalberto Alves Dias', NULL, '16/05/1978', NULL, 14, NULL, '30/05/2001', NULL, 'Operador de Caixa', NULL, NULL);
INSERT INTO `funcionario04` VALUES(11, '492.917.181-49', NULL, 'Nilsson Correia da Silva', NULL, '10/16/1967', 19, 15, NULL, '11/12/2002', NULL, 'Operador de Caixa', NULL, NULL);
INSERT INTO `funcionario04` VALUES(12, '428.328.451-34', NULL, 'Odete Dias da Silva', NULL, '14/08/1978', NULL, 16, NULL, '16/02/1998', NULL, 'Secretária', NULL, NULL);
INSERT INTO `funcionario04` VALUES(13, '461.802.141-15', NULL, 'Roberto Carlos Dias Peris', NULL, '29/05/1975', NULL, 17, NULL, '19/11/1998', NULL, 'Embalador', NULL, NULL);
INSERT INTO `funcionario04` VALUES(14, '085.097.987-00', 16, 'José Wilson de Almeida', NULL, '25/03/1981', NULL, 18, NULL, '22/10/2013', NULL, 'Embalador', NULL, NULL);
INSERT INTO `funcionario04` VALUES(15, '343.175.701-49', NULL, 'Wescley Mariano Samuel', NULL, '11/02/1978', NULL, 19, 21, '14,10,1999', 7, 'Recepcionista', NULL, NULL);
INSERT INTO `funcionario04` VALUES(16, '563.257.971-91', NULL, 'M. Beatriz Sousa', NULL, '23/04/1978', NULL, 12, NULL, '23/09/1998', NULL, 'Vendedor', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario05`
--

CREATE TABLE `funcionario05` (
  `id_funcionario05` int(1) NOT NULL,
  `codigo` int(2) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `cpf_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(60) NOT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `id_cargo` int(4) NOT NULL,
  `id_cargo_erro` int(2) DEFAULT NULL,
  `salario` varchar(15) NOT NULL,
  `salario_erro` int(1) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario05`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario05`
--

INSERT INTO `funcionario05` VALUES(1, 12, NULL, '051.896.362-07', NULL, 'Inês Lopes da Silva', NULL, 1123, NULL, 'R$ 850,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(2, 13, NULL, '085.097.987-00', NULL, 'Matheus Oliveira Batista', NULL, 3456, NULL, 'R$ 950,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(3, 14, NULL, '115.391.624-98', NULL, 'Maria do Carmo', NULL, 3456, NULL, 'R$ 978,00', NULL, 17);
INSERT INTO `funcionario05` VALUES(4, 15, NULL, '205.181.374-49', NULL, 'Francina Rodrigues Belarmino', NULL, 5678, NULL, 'R$ 768,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(5, 16, NULL, '343.337.541-00', NULL, 'Adriano Lucas Albuquerque', NULL, 6789, NULL, 'US$ 896,00', 26, NULL);
INSERT INTO `funcionario05` VALUES(6, 17, NULL, '351.733.861-34', NULL, 'Fabricio Ferreira de Lima', NULL, 7890, NULL, 'R$ 982,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(7, 18, NULL, '244.488.421-340', 9, 'Maria de Fatima Diniz', NULL, 6789, NULL, 'R$ 850,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(8, 19, NULL, '563.257.971-91', NULL, 'Pamela Rosendo da Cunha Guedes', NULL, 1234, NULL, 'R$ 950,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(9, 20, NULL, '110.825.693-72', NULL, 'Alice dos Santos Freitas', NULL, 3456, NULL, 'R$ 978,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(10, 21, NULL, '115.391.624-98', NULL, 'Maria do Carmo Xavier', NULL, 3456, NULL, 'R$ 978,00', NULL, 17);
INSERT INTO `funcionario05` VALUES(11, 22, NULL, ' 492.917.181-49', NULL, 'Gissele Quintans dos Reis', NULL, 5666, 21, 'R$ 896,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(12, 23, NULL, '428.328.451-34', NULL, 'Tiago Marinho Lima', NULL, 7890, NULL, 'R$ 982,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(13, 24, NULL, '461.802.141-15', NULL, 'Dra. Raynara Nazaré da Silva', 6, 1234, NULL, 'R$ 850,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(14, 25, NULL, '567.467.245-34', NULL, 'Jessica Thaynar Oliveira', NULL, 3456, NULL, 'R$ 950,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(15, 26, NULL, '085.047.124-94', NULL, 'João Freitas Luna', NULL, 5678, NULL, 'R$ 978,00', NULL, NULL);
INSERT INTO `funcionario05` VALUES(16, 27, NULL, '112.925.140-12', NULL, 'Gilberto Queiroz Barros', NULL, 6789, NULL, 'R$ 768,00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario06`
--

CREATE TABLE `funcionario06` (
  `id_funcionario06` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `data_contratacao` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data_contratacao_erro` int(2) DEFAULT NULL,
  `funcao` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `funcao_erro` int(2) DEFAULT NULL,
  `companhia` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `companhia_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario06`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `funcionario06`
--

INSERT INTO `funcionario06` VALUES(1, '5861', 16, 'João ', NULL, 'Silva', NULL, '14/08/2001', NULL, 'Piloto', NULL, 'Viaje bem', NULL, NULL);
INSERT INTO `funcionario06` VALUES(2, '2852', NULL, 'Caroline ', NULL, NULL, 1, '06/07/2013', NULL, 'Aeromoça', NULL, 'Boa viagem', NULL, NULL);
INSERT INTO `funcionario06` VALUES(3, '5861', 16, 'Paulo', NULL, 'Ferreira', NULL, '18/05/1997', NULL, 'Faxineiro', NULL, 'Boa viagem', NULL, NULL);
INSERT INTO `funcionario06` VALUES(4, '1458', NULL, 'Eduardo', NULL, 'Lima', NULL, '58/13/2003', 9, 'Recepcionista', NULL, 'Total conforto', NULL, NULL);
INSERT INTO `funcionario06` VALUES(5, '6983', NULL, '6983', 2, 'Alves', NULL, '15/09/1993', NULL, 'Piloto', NULL, 'Viva feliz', NULL, NULL);
INSERT INTO `funcionario06` VALUES(6, '7432', NULL, 'Sr. Maria', 6, 'Marques', NULL, '12/02/2012', NULL, 'Faxineira', NULL, 'Total conforto', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario07`
--

CREATE TABLE `funcionario07` (
  `id_funcionario07` int(2) NOT NULL AUTO_INCREMENT,
  `id_funcionario` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_funcionario_erro` int(2) DEFAULT NULL,
  `nome` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `data_nascimento` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `data_nascimento_erro` int(2) DEFAULT NULL,
  `funcao` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `funcao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario07`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `funcionario07`
--

INSERT INTO `funcionario07` VALUES(1, '1582', NULL, NULL, 1, 'Martins', NULL, '02/05/1986', NULL, 'Atendente', NULL, NULL);
INSERT INTO `funcionario07` VALUES(2, '3698', NULL, 'Janaina', NULL, 'Queiroz', NULL, '25/02/1981', NULL, 'Atendente', NULL, NULL);
INSERT INTO `funcionario07` VALUES(3, '4588', NULL, 'Marcos', NULL, 'Marques', NULL, '15/09/1990', NULL, 'Caixa', 15, NULL);
INSERT INTO `funcionario07` VALUES(4, '3681', NULL, 'Germano', NULL, 'Almeida', NULL, '10/12/1985', NULL, 'Farmacêutico', NULL, NULL);
INSERT INTO `funcionario07` VALUES(5, '2963', NULL, 'Henrique', NULL, 'Coutinho', NULL, '1P/03/1987', 2, 'Farmacêutico', NULL, NULL);
INSERT INTO `funcionario07` VALUES(6, '3513', NULL, 'D. Marisa', 6, 'Fernades', NULL, '21/10/1991', NULL, 'Operador de caixa', 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario08`
--

CREATE TABLE `funcionario08` (
  `id_funcionario08` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `data_nascimento` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data_nascimento_erro` int(2) DEFAULT NULL,
  `naturalidade` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `naturalidade_erro` int(2) DEFAULT NULL,
  `CPF` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `CPF_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario08`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `funcionario08`
--

INSERT INTO `funcionario08` VALUES(1, 566, NULL, 'Emanuelly Martins', NULL, '07/03/1995', NULL, 'Campina Grande', NULL, '765.753.321-45', NULL, 17);
INSERT INTO `funcionario08` VALUES(2, 568, NULL, 'Evelyne Costa', NULL, '05/02/1990', NULL, 'Esperança; 16; Brasil', NULL, '119.530.340-12', NULL, NULL);
INSERT INTO `funcionario08` VALUES(3, 569, NULL, 'Wanderson Xavier', NULL, '02/02/1993', NULL, 'Lagoa Seca', NULL, '323.835.14-0', 2, NULL);
INSERT INTO `funcionario08` VALUES(4, 567, NULL, 'E. Martins', NULL, '07/03/1995', NULL, 'Campina Grande', NULL, '765.753.321-45', NULL, 17);
INSERT INTO `funcionario08` VALUES(5, 563, NULL, 'João Gilberto', NULL, '15/04/1985', NULL, 'JP', 6, '695.587.255-05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario09`
--

CREATE TABLE `funcionario09` (
  `id_funcionario09` int(2) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_completo_erro` int(11) DEFAULT NULL,
  `data_nascimento` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_nascimento_erro` int(2) DEFAULT NULL,
  `telefone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_erro` int(2) DEFAULT NULL,
  `data_contratacao` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_contratacao_erro` int(11) DEFAULT NULL,
  `cargo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cargo_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario09`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `funcionario09`
--

INSERT INTO `funcionario09` VALUES(1, '00123', NULL, 'Inês da Silva Campos', NULL, '03/04/1980', NULL, '83-33412584', NULL, '03/05/1999', NULL, 'Serviços Gerais', NULL, 18);
INSERT INTO `funcionario09` VALUES(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `funcionario09` VALUES(3, '20102', NULL, 'Ricardo Pereira Costa', NULL, '1987.02.08', 7, '83-93724587', NULL, '06/06/2008', NULL, 'Vendedor', NULL, NULL);
INSERT INTO `funcionario09` VALUES(4, '21111', NULL, 'Gerente de Vendas', 12, '25/08/1978', NULL, '83-96321457', NULL, '20/02/2000', NULL, 'Luis Carlos Ventura', 12, NULL);
INSERT INTO `funcionario09` VALUES(5, NULL, 1, 'Amélia Dantas Xavier', NULL, '24/05/1980', NULL, '83-91112425', NULL, '20/02/2010', NULL, 'Vendedora', NULL, NULL);
INSERT INTO `funcionario09` VALUES(6, '00122', NULL, 'Inês da Silva Campos', NULL, '03/04/1982', NULL, '83-33412584', NULL, '03/05/1999', NULL, 'Serviços Gerais', NULL, 18);

-- --------------------------------------------------------

--
-- Table structure for table `item01`
--

CREATE TABLE `item01` (
  `id_item01` int(1) NOT NULL,
  `codigo_de_barra` varchar(25) DEFAULT NULL,
  `codigo_de_barra_erro` int(2) DEFAULT NULL,
  `nome_produto` varchar(9) DEFAULT NULL,
  `nome_produto_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` varchar(4) DEFAULT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `preco` varchar(4) DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `fornecedor` varchar(26) DEFAULT NULL,
  `fornecedor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_item01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item01`
--

INSERT INTO `item01` VALUES(1, '1589632478596', NULL, 'arros', 4, '2000', NULL, '2,85', NULL, 'Rede Fino Que Se Satisfaz', NULL, NULL);
INSERT INTO `item01` VALUES(2, '9652147896325', 16, 'feijão', NULL, '3500', NULL, '3,70', NULL, 'Grãos que Alimentam', NULL, NULL);
INSERT INTO `item01` VALUES(3, '9632584512586', NULL, 'macarrão', NULL, '-1', 9, '2,50', NULL, 'Massas Trigo Forte', NULL, NULL);
INSERT INTO `item01` VALUES(4, '1255789632154', NULL, 'açúcar', NULL, '4100', NULL, '1,35', NULL, 'Planalcucar', NULL, NULL);
INSERT INTO `item01` VALUES(5, '9652147896325', 16, 'café', NULL, '2500', NULL, '3.54', 7, 'Rei Café', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item02`
--

CREATE TABLE `item02` (
  `id_item02` int(1) NOT NULL,
  `cod_item` varchar(3) DEFAULT NULL,
  `cod_item_erro` int(2) DEFAULT NULL,
  `codigo_barras_produto` varchar(14) DEFAULT NULL,
  `codigo_barras_produto_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` varchar(4) DEFAULT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_item02`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item02`
--

INSERT INTO `item02` VALUES(1, '300', NULL, '5698741236547', NULL, '2500', NULL, NULL);
INSERT INTO `item02` VALUES(2, '301', 16, '8659123654756', NULL, '4503', NULL, NULL);
INSERT INTO `item02` VALUES(3, '302', NULL, '8962136547821', NULL, '1452', NULL, NULL);
INSERT INTO `item02` VALUES(4, '301', 16, '4789612365479', NULL, '3265', NULL, NULL);
INSERT INTO `item02` VALUES(5, '304', NULL, '78445696532', 21, '1525', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_acougue01`
--

CREATE TABLE `itens_setor_acougue01` (
  `id_itens_setor_acougue01` int(2) NOT NULL DEFAULT '0',
  `codigo` varchar(4) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `item` varchar(18) DEFAULT NULL,
  `item_erro` int(2) DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `quantidade_estoque` varchar(30) DEFAULT NULL,
  `quantidade_estoque_erro` int(2) DEFAULT NULL,
  `preco_unitario` varchar(8) DEFAULT NULL,
  `preco_unitario_erro` int(2) DEFAULT NULL,
  `linha _erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_acougue01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_acougue01`
--

INSERT INTO `itens_setor_acougue01` VALUES(1, '559', NULL, 'Carne', NULL, '1kg de carne bovina', NULL, '50kg', NULL, '25,50', NULL, NULL);
INSERT INTO `itens_setor_acougue01` VALUES(2, '222', 16, 'Linguiça', NULL, '500g de linguiça de frango', NULL, '-2', 2, '10,90', NULL, NULL);
INSERT INTO `itens_setor_acougue01` VALUES(3, '995', NULL, 'Coração', NULL, '50 corações de galinha', NULL, '100Kg', NULL, '9,60', NULL, NULL);
INSERT INTO `itens_setor_acougue01` VALUES(4, '113', NULL, NULL, NULL, '500g de carne de charque', NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `itens_setor_acougue01` VALUES(5, '', 1, 'Coxa', NULL, '20 coxas de frango', NULL, '60Kg', NULL, '15,25', NULL, NULL);
INSERT INTO `itens_setor_acougue01` VALUES(6, '222', 16, 'Carne', NULL, '500g de carne de sol', NULL, '250kg', NULL, '9,30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_brinquedos01`
--

CREATE TABLE `itens_setor_brinquedos01` (
  `id_itens_setor_brinquedos01` int(1) NOT NULL,
  `codigo` int(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `produto` varchar(10) NOT NULL,
  `produto_erro` int(2) DEFAULT NULL,
  `decricao` varchar(60) NOT NULL,
  `decricao_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` int(3) NOT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `valor_unitario` varchar(5) NOT NULL,
  `valor_unitario_erro` int(11) DEFAULT NULL,
  `codigo_distribuidor` int(3) NOT NULL,
  `codigo_distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_brinquedos01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_brinquedos01`
--

INSERT INTO `itens_setor_brinquedos01` VALUES(1, 700, NULL, 'Boneca', NULL, 'Boneca Barbie', NULL, 47, NULL, '54,00', NULL, 370, NULL, NULL);
INSERT INTO `itens_setor_brinquedos01` VALUES(2, 741, NULL, 'Carro', NULL, 'Carro de controle remoto', NULL, 100, NULL, '62,50', NULL, 372, NULL, NULL);
INSERT INTO `itens_setor_brinquedos01` VALUES(3, 758, NULL, 'Bola', NULL, 'Bola colorida', NULL, 36, NULL, '13,00', NULL, 372, NULL, NULL);
INSERT INTO `itens_setor_brinquedos01` VALUES(4, 740, NULL, '', 1, 'Urso panda', NULL, 71, NULL, '32.00', 7, 369, NULL, NULL);
INSERT INTO `itens_setor_brinquedos01` VALUES(5, NULL, 1, 'casinha', NULL, 'Casa da barbie', NULL, 31, NULL, '57,20', NULL, 369, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_brinquedos02`
--

CREATE TABLE `itens_setor_brinquedos02` (
  `id_itens_setor_brinquedos02` int(1) NOT NULL,
  `codigo` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `item` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_erro` int(2) DEFAULT NULL,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `preco` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `qtd_em_estoque` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtd_em_estoque_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_brinquedos02`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itens_setor_brinquedos02`
--

INSERT INTO `itens_setor_brinquedos02` VALUES(1, '500', NULL, 'Barbie', NULL, 'Barbie Bailarina', NULL, '17,90', NULL, '0', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(2, '501', 16, 'Carrinho', NULL, 'Carrinho de controle remoto', NULL, '55,22', NULL, '35', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(3, '502', NULL, 'Carro da Polly', NULL, 'Carro Poly com teto que levanta', NULL, '84,99', NULL, '85', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(4, '503', NULL, 'Panda de pelúcia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `itens_setor_brinquedos02` VALUES(5, '504', NULL, 'Jogo das princesas ', NULL, 'Montando uma Cafeteria', NULL, '30,00', NULL, '52', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(6, '505', NULL, 'Boneca Ananda', NULL, 'Boneca Interativa', NULL, '90,80', NULL, '75', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(7, '501', 16, 'jogo Roller coaster ', NULL, 'Construindo parques', NULL, '60,00', NULL, '60', NULL, NULL);
INSERT INTO `itens_setor_brinquedos02` VALUES(8, '507', NULL, 'Bloco Transformers ', NULL, 'Blocos de montar Transformers ', NULL, '-56,45', 9, '55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_eletrodomesticos01`
--

CREATE TABLE `itens_setor_eletrodomesticos01` (
  `id_itens_setor_eletrodomesticos01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(11) DEFAULT NULL,
  `produto` varchar(15) NOT NULL,
  `produto_erro` int(2) DEFAULT NULL,
  `descricao` varchar(50) NOT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` varchar(5) NOT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `valor_unitario` int(5) NOT NULL,
  `valor_unitario_erro` int(2) DEFAULT NULL,
  `codigo_distribuidor` int(3) NOT NULL,
  `codigo_distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_eletrodomesticos01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_eletrodomesticos01`
--

INSERT INTO `itens_setor_eletrodomesticos01` VALUES(1, 322, NULL, 'Geladeira', NULL, 'Geladeira de cor Branca', NULL, '52', NULL, 1500, NULL, 385, NULL, 17);
INSERT INTO `itens_setor_eletrodomesticos01` VALUES(2, 325, NULL, 'Microondas', NULL, 'Microondas de cor Preta', NULL, 'o', 2, 350, NULL, 388, NULL, NULL);
INSERT INTO `itens_setor_eletrodomesticos01` VALUES(3, 322, NULL, 'Geladeira', NULL, 'Geladeira de cor Branca', NULL, '52', NULL, 1500, NULL, 385, NULL, 17);
INSERT INTO `itens_setor_eletrodomesticos01` VALUES(4, 335, NULL, 'Saduicheira', NULL, 'Sanduicheira grill ', NULL, '60', NULL, -1, 2, 386, NULL, NULL);
INSERT INTO `itens_setor_eletrodomesticos01` VALUES(5, 337, NULL, 'Liquidificador', NULL, 'Liquidificador de cor Preta', NULL, '72', NULL, 65, NULL, 387, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_frios_e_laticinios01`
--

CREATE TABLE `itens_setor_frios_e_laticinios01` (
  `id_itens_setor_frios_e_laticinios01` int(2) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `item` varchar(35) DEFAULT NULL,
  `item_erro` int(2) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `validade` varchar(15) DEFAULT NULL,
  `validade_erro` int(2) DEFAULT NULL,
  `preco_unitario` varchar(5) DEFAULT NULL,
  `preco_unitario_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_frios_e_laticinios01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_frios_e_laticinios01`
--

INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(1, '333', NULL, 'Queijo', NULL, 'queijo cheddar', NULL, '15/08/2019', NULL, '5,60', NULL, NULL);
INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(2, '265', NULL, 'Iogurte', NULL, 'iogurte bandeja com 8', NULL, '20/05/2016', NULL, '6,30', NULL, NULL);
INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(3, '999', NULL, 'Mortadela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(4, '555', 16, 'Leite', NULL, 'Leite de caixa 1L', NULL, '9.6.2016', 7, '4,20', NULL, NULL);
INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(5, '555', 16, 'Requeijão', NULL, 'Requeijão no copo', NULL, '25/03/2017', NULL, '5,00', NULL, NULL);
INSERT INTO `itens_setor_frios_e_laticinios01` VALUES(6, NULL, 1, 'Manteiga, 06/02/2017,03,25', 5, '200g de manteiga', NULL, '06/02/2017', NULL, '3,25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_frutas_e_verduras01`
--

CREATE TABLE `itens_setor_frutas_e_verduras01` (
  `id_itens_setor_frutas_e_verduras01` int(1) NOT NULL,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `produto` varchar(15) NOT NULL,
  `produto_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` int(3) NOT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `valor_unitario` varchar(5) NOT NULL,
  `valor_unitario_erro` int(2) DEFAULT NULL,
  `codigo_distribuidor` int(3) DEFAULT NULL,
  `codigo_distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_frutas_e_verduras01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_frutas_e_verduras01`
--

INSERT INTO `itens_setor_frutas_e_verduras01` VALUES(1, 122, 16, 'Tomate', NULL, 150, NULL, '2,50', NULL, 586, NULL, NULL);
INSERT INTO `itens_setor_frutas_e_verduras01` VALUES(2, 125, NULL, 'Banana', NULL, 163, NULL, '1,90', NULL, NULL, 1, NULL);
INSERT INTO `itens_setor_frutas_e_verduras01` VALUES(3, 128, NULL, 'Goiaba', NULL, -1, 2, '3,00', NULL, 583, NULL, NULL);
INSERT INTO `itens_setor_frutas_e_verduras01` VALUES(4, 131, NULL, 'Uva', NULL, 200, NULL, '8,90', NULL, 580, NULL, NULL);
INSERT INTO `itens_setor_frutas_e_verduras01` VALUES(5, 122, 16, 'Laranja', NULL, 46, NULL, '3,90', NULL, 580, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_limpeza01`
--

CREATE TABLE `itens_setor_limpeza01` (
  `id_itens_setor_limpeza01` int(1) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `produto` varchar(20) NOT NULL,
  `produto_erro` int(2) DEFAULT NULL,
  `descricao` varchar(50) NOT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` varchar(3) NOT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `valor_unitario` varchar(6) NOT NULL,
  `valor_unitario_erro` int(2) DEFAULT NULL,
  `codigo_distribuidor` varchar(3) NOT NULL,
  `codigo_distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_limpeza01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_limpeza01`
--

INSERT INTO `itens_setor_limpeza01` VALUES(1, '100', NULL, 'Água Sanitária', NULL, 'Água Sanitária, 200ml', NULL, '40', NULL, '2,30', NULL, '150', NULL, NULL);
INSERT INTO `itens_setor_limpeza01` VALUES(2, NULL, 1, 'Detergente', NULL, 'Detergente, 150ml', NULL, '50', NULL, '1,50', NULL, '152', NULL, NULL);
INSERT INTO `itens_setor_limpeza01` VALUES(3, '102', NULL, 'Desinfetante', NULL, 'Desinfetante, 1L', NULL, '65', NULL, '$7,50', 26, '153', 21, NULL);
INSERT INTO `itens_setor_limpeza01` VALUES(4, '103', NULL, 'Polidor', NULL, 'Polidor, 150ml', NULL, '73', NULL, '6,30', NULL, '152', NULL, NULL);
INSERT INTO `itens_setor_limpeza01` VALUES(5, '104', NULL, 'Esponja de asso', 4, 'Esponja de aço, 2 unidades', NULL, '100', NULL, '2,50', NULL, '151', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itens_setor_papelaria01`
--

CREATE TABLE `itens_setor_papelaria01` (
  `id_itens_setor_papelaria01` int(2) NOT NULL DEFAULT '0',
  `codigo` varchar(5) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `produto` varchar(15) DEFAULT NULL,
  `produto_erro` int(2) DEFAULT NULL,
  `descricao` varchar(40) DEFAULT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `quantidade_em_estoque` varchar(3) DEFAULT NULL,
  `quantidade_em_estoque_erro` int(2) DEFAULT NULL,
  `valor_unitario` varchar(7) DEFAULT NULL,
  `valor_unitario_erro` int(2) DEFAULT NULL,
  `codigo_distribuidor` varchar(3) DEFAULT NULL,
  `codigo_distribuidor_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_itens_setor_papelaria01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itens_setor_papelaria01`
--

INSERT INTO `itens_setor_papelaria01` VALUES(1, '00023', NULL, 'Caneta', NULL, 'Caneta esferográfica azul', NULL, '96', NULL, '2,50', NULL, '236', NULL, NULL);
INSERT INTO `itens_setor_papelaria01` VALUES(2, '00056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6,00', NULL, NULL, NULL, 13);
INSERT INTO `itens_setor_papelaria01` VALUES(3, '25890', NULL, 'Grafite', NULL, 'Grafite 0.7', NULL, '150', NULL, '1...30', 7, '299', NULL, NULL);
INSERT INTO `itens_setor_papelaria01` VALUES(4, NULL, 1, 'Caderno', NULL, 'Caderno capa dura 12 matérias', NULL, '250', NULL, '15,00', NULL, '222', NULL, NULL);
INSERT INTO `itens_setor_papelaria01` VALUES(5, '00036', NULL, 'Lapyzera', 4, 'Lapiseira rosa', NULL, '360', NULL, '0,80', NULL, '245', 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicamento01`
--

CREATE TABLE `medicamento01` (
  `id_medicamento01` int(1) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `fabricante` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fabricante_erro` int(2) DEFAULT NULL,
  `validade` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `validade_erro` int(2) DEFAULT NULL,
  `tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medicamento01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `medicamento01`
--

INSERT INTO `medicamento01` VALUES(1, 111, 16, 'Arflex', NULL, 'Almirall', NULL, 'Jun2016', NULL, 'Oral', NULL, NULL);
INSERT INTO `medicamento01` VALUES(2, 112, NULL, 'Amoxicilina', NULL, 'EMS', NULL, 'Fev2015', NULL, 'Oral', NULL, NULL);
INSERT INTO `medicamento01` VALUES(3, NULL, 1, 'Orlistate', NULL, 'Neo química', NULL, 'Set2017', NULL, 'Injetável', NULL, NULL);
INSERT INTO `medicamento01` VALUES(4, 114, NULL, 'Artrosil', NULL, 'Valpharma', NULL, 'Abr2016', NULL, 'Oral', NULL, NULL);
INSERT INTO `medicamento01` VALUES(5, 111, 16, 'Aciclovir', NULL, 'Danaduzzi&CIA LTDA', NULL, 'Out2018', NULL, 'Liquido', NULL, NULL);
INSERT INTO `medicamento01` VALUES(6, 116, NULL, 'Livepax', NULL, 'Medicamentos& CIA', NULL, '2016Mar', 7, 'Injetável', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicamento02`
--

CREATE TABLE `medicamento02` (
  `id_medicamento02` int(2) NOT NULL AUTO_INCREMENT,
  `id` int(2) NOT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `tarja` varchar(10) DEFAULT NULL,
  `tarja_erro` int(2) DEFAULT NULL,
  `laboratorio` varchar(20) DEFAULT NULL,
  `laboratorio_erro` int(2) DEFAULT NULL,
  `preco` varchar(10) DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medicamento02`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `medicamento02`
--

INSERT INTO `medicamento02` VALUES(1, 1, NULL, 'Cefalexina', NULL, 'vrmelha', 4, 'EMS Genéricos', NULL, '10,12', NULL, NULL);
INSERT INTO `medicamento02` VALUES(2, 2, NULL, 'Bromazepam', NULL, 'preta', NULL, 'Medley Genérico', NULL, '10,99', NULL, NULL);
INSERT INTO `medicamento02` VALUES(3, 3, NULL, 'Dipirona Sódica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `medicamento02` VALUES(4, 4, NULL, 'Amoxilina', NULL, 'vermelha', NULL, NULL, 1, '9,4', NULL, NULL);
INSERT INTO `medicamento02` VALUES(5, 5, NULL, 'Roche', 12, 'preta', NULL, 'Rivotril', 12, '5,97', NULL, NULL);
INSERT INTO `medicamento02` VALUES(6, 6, NULL, 'Paracetamol', NULL, 'branca', NULL, 'Medley', NULL, '6,22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medico01`
--

CREATE TABLE `medico01` (
  `id_medico01` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(5) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `crm` int(5) DEFAULT NULL,
  `crm_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `especialidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `especialidade_erro` int(2) DEFAULT NULL,
  `telefone` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `telefone_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medico01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `medico01`
--

INSERT INTO `medico01` VALUES(1, 9829, NULL, 17827, NULL, 'Severino Ramos Freire', NULL, 'Oftalmologia', NULL, '(81)8377-9277', NULL, NULL);
INSERT INTO `medico01` VALUES(2, 9837, NULL, 21917, NULL, 'Sergio Ramos Datoli', NULL, 'Cardiologia', NULL, '(81)9387-3983', NULL, NULL);
INSERT INTO `medico01` VALUES(3, 3983, NULL, 83711, NULL, 'Tamara Vasconcelos', NULL, '(81)2198-0987', 12, 'Cardiologia', 12, NULL);
INSERT INTO `medico01` VALUES(4, 7873, NULL, 3871, NULL, 'Mariana Silva Freire', NULL, 'Ortodontia', NULL, '(81)8373-0998', NULL, NULL);
INSERT INTO `medico01` VALUES(5, 9383, NULL, NULL, 1, 'Gustavo Tavares Damasceno', NULL, 'Dermatologia', NULL, '(81)9388-2928', NULL, NULL);
INSERT INTO `medico01` VALUES(6, 8709, NULL, 38711, NULL, 'Sr. Dr. Antonio Rafael Silva', 6, 'Endoscopia', NULL, '(84)8373-0982', NULL, NULL);
INSERT INTO `medico01` VALUES(7, 6521, NULL, 76371, NULL, 'Marta Vanderlei Souza', NULL, 'Hurologia', 1, '(81)9837-7711', NULL, NULL);
INSERT INTO `medico01` VALUES(8, 8721, NULL, 28001, NULL, 'Tarcio Silvano Silva', NULL, 'Nefrologia', NULL, '(81)9833-9822', NULL, NULL);
INSERT INTO `medico01` VALUES(9, 8733, NULL, 72357, NULL, 'Sandra Ticiana Pires', NULL, 'Nefrologia', NULL, '(81)9833-9872', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medico02`
--

CREATE TABLE `medico02` (
  `id_medico02` int(11) NOT NULL AUTO_INCREMENT,
  `crm` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crm_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `celular` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular_erro` int(2) DEFAULT NULL,
  `convenios` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `convenios_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medico02`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `medico02`
--

INSERT INTO `medico02` VALUES(1, '8373-9', 16, 'José Eduardo', NULL, 'Andrade', NULL, '9872-0972', NULL, 'Unimed; Geap', NULL, NULL);
INSERT INTO `medico02` VALUES(2, NULL, 1, 'Paula', NULL, 'Burlamarqui', NULL, '8890-0987', NULL, 'Bradesco', NULL, NULL);
INSERT INTO `medico02` VALUES(3, '3890-8', NULL, 'Maria Eduarda', NULL, 'Dias', NULL, '9872-0982', NULL, 'SulAmérica; Geap', NULL, NULL);
INSERT INTO `medico02` VALUES(4, '3902-0', NULL, 'Simone', NULL, 'Albuquerque', NULL, '9092-0981', NULL, 'Nenhum', NULL, NULL);
INSERT INTO `medico02` VALUES(5, '8021-8', NULL, 'Albuquerque', 12, 'Jonas', 12, NULL, NULL, 'Geap', NULL, NULL);
INSERT INTO `medico02` VALUES(6, '4893-9', NULL, 'Silmara', NULL, 'Andrade Paes', NULL, '9871-0862', NULL, 'Nenhum', NULL, NULL);
INSERT INTO `medico02` VALUES(7, '8373-9', 16, 'Rafael', NULL, 'Paes Leme', NULL, '9988-8728', NULL, 'Osplan', NULL, NULL);
INSERT INTO `medico02` VALUES(8, '1111-9', NULL, 'Tenório', NULL, 'Buarque', NULL, '', NULL, 'Bradesco', NULL, NULL);
INSERT INTO `medico02` VALUES(9, '8729-5', NULL, 'Dra. Regina', 6, 'Pasteur', NULL, '9980-0982', NULL, 'Nenhum', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medico03`
--

CREATE TABLE `medico03` (
  `id_medico03` int(11) NOT NULL AUTO_INCREMENT,
  `crm` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crm_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `email` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_erro` int(2) DEFAULT NULL,
  `plantonista` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plantonista_erro` int(2) DEFAULT NULL,
  `consulta` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consulta_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medico03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `medico03`
--

INSERT INTO `medico03` VALUES(1, NULL, 1, 'Joselito Andrade Cunha', NULL, NULL, NULL, 'SIM', NULL, '120.00', NULL, NULL);
INSERT INTO `medico03` VALUES(2, '9387-8', NULL, 'Simone Andrade Maia', NULL, 'sim@gmail.com', NULL, 'SIM', NULL, '180.00', NULL, 17);
INSERT INTO `medico03` VALUES(3, '8901-9', NULL, 'Alexandre Queiroz', NULL, 'aleq@yahoo.br', NULL, 'NAO', NULL, '145.00', NULL, NULL);
INSERT INTO `medico03` VALUES(4, '7389-9', NULL, 'Irina Fonseca', NULL, 'irif@hotmail.com', NULL, 'NAO', NULL, '-20.00', 9, NULL);
INSERT INTO `medico03` VALUES(5, '8373-3', NULL, 'Otaviano Correia', NULL, 'otac@gmail.com', NULL, 'SIM', NULL, '168.00', NULL, NULL);
INSERT INTO `medico03` VALUES(6, '2562-7', NULL, 'Raimundo Filho Nascimento', NULL, 'rafn@gmail.com', NULL, 'NAO', NULL, '135.00', NULL, NULL);
INSERT INTO `medico03` VALUES(7, '6668-5', NULL, 'msilva@gmail.com', 12, 'Maria Silva', 12, 'SIM', NULL, '180.00', NULL, NULL);
INSERT INTO `medico03` VALUES(8, '3762-6', NULL, 'Tania Martins Queiroga', NULL, 'tmq@sfg.com.br', NULL, 'SIM', NULL, '90.00', NULL, NULL);
INSERT INTO `medico03` VALUES(9, '9387-8', NULL, 'Simone A. Maia', NULL, 'sim@gmail.com', NULL, NULL, NULL, '180.00', NULL, 17);
INSERT INTO `medico03` VALUES(10, '5278-8', NULL, 'Ronaldo Belarmino Farias', NULL, 'rbf@gmail.com', NULL, 'NAO', NULL, '176.00', NULL, NULL);
INSERT INTO `medico03` VALUES(11, '1199-7', NULL, 'Heron Pires Souza', NULL, NULL, NULL, 'NAO', NULL, '140.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medico04`
--

CREATE TABLE `medico04` (
  `id_medico04` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `telefone` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_erro` int(11) DEFAULT NULL,
  `cod_especialidade` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_especialidade_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medico04`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `medico04`
--

INSERT INTO `medico04` VALUES(1, 'M90', NULL, 'Jonas Tavares Nobrega', NULL, '(81)8337-0490', NULL, 'E05', NULL, NULL);
INSERT INTO `medico04` VALUES(2, 'M98', NULL, 'Tadeu de Souza Melo', NULL, '(81)9879-0928', NULL, 'E08', NULL, 17);
INSERT INTO `medico04` VALUES(3, 'M77', NULL, 'Daniela Novaes Dutra', NULL, '(83)9873-0938', NULL, 'E13', NULL, NULL);
INSERT INTO `medico04` VALUES(4, 'M71', NULL, 'Lourdes Farias Ramalho', NULL, '8398769022', 7, 'E18', NULL, NULL);
INSERT INTO `medico04` VALUES(5, 'M69', NULL, 'Jonas Carvalho Dutra', NULL, '(81)9833-0938', NULL, 'E18', NULL, NULL);
INSERT INTO `medico04` VALUES(6, 'M67', NULL, 'Ticiane Cordeiro Lima', NULL, '(83)9987-0933', NULL, 'E27', NULL, NULL);
INSERT INTO `medico04` VALUES(7, 'M55', NULL, 'Tulio Valadares Lima', NULL, '(81)9822-8373', NULL, 'E34', NULL, NULL);
INSERT INTO `medico04` VALUES(8, 'M98', NULL, 'Tadeu S. Melo', NULL, '(81)9879-0928', NULL, 'E08', NULL, 17);
INSERT INTO `medico04` VALUES(9, 'M54', NULL, 'Francilene Coutinho', NULL, '(81)9983-1111', NULL, 'E38', NULL, NULL);
INSERT INTO `medico04` VALUES(10, 'M46', NULL, 'Paulo Gomes Albuquerque', NULL, '(84)9874-3000', NULL, 'E99', 21, NULL);
INSERT INTO `medico04` VALUES(11, 'M33', NULL, 'Otavio Costa e Silva', NULL, '(82)9872-2234', NULL, 'E81', NULL, NULL);
INSERT INTO `medico04` VALUES(12, 'M29', NULL, 'Otacilio de Carvalho Batista', NULL, '(81)9854-9112', NULL, 'E78', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medico05`
--

CREATE TABLE `medico05` (
  `id_medico05` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `valor_consulta` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor_consulta_erro` int(11) DEFAULT NULL,
  `plano` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plano_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_medico05`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `medico05`
--

INSERT INTO `medico05` VALUES(1, 'M029', NULL, 'Francisco Assis de Castro', NULL, '90,00', NULL, '738', NULL, NULL);
INSERT INTO `medico05` VALUES(2, 'M871', NULL, NULL, 1, '75,00', NULL, '938', NULL, NULL);
INSERT INTO `medico05` VALUES(3, 'M711', NULL, 'Paula Tomaz de Souza', NULL, '-80,00', 2, '361', NULL, NULL);
INSERT INTO `medico05` VALUES(4, 'M125', NULL, 'Dra. Sandra Dias Rocha', 5, '150,00', NULL, '801', NULL, NULL);
INSERT INTO `medico05` VALUES(5, 'M389', NULL, 'Rodrigo Sá Melo', NULL, '80,00', NULL, '320', NULL, NULL);
INSERT INTO `medico05` VALUES(6, 'M282', 16, 'Ricardo Paes', NULL, '130,00', NULL, '873', NULL, NULL);
INSERT INTO `medico05` VALUES(7, 'M829', NULL, 'Fernanda Alumni', NULL, '95,00', NULL, '451', 21, NULL);
INSERT INTO `medico05` VALUES(8, 'M728', NULL, 'Tiago Herman Dias', NULL, '78,00', NULL, '902', NULL, NULL);
INSERT INTO `medico05` VALUES(9, 'M120', NULL, 'Tiana Souza Paes', NULL, '180,00', NULL, '801', NULL, NULL);
INSERT INTO `medico05` VALUES(10, 'M457', NULL, 'Uriel Tenorio Dias', NULL, '180,00', NULL, '389', NULL, NULL);
INSERT INTO `medico05` VALUES(11, 'M282', 16, 'Urquize Soares Farias', NULL, '190,00', NULL, '361', NULL, NULL);
INSERT INTO `medico05` VALUES(12, 'M810', NULL, 'Tiberio Andrade Gois', NULL, '220,00', NULL, '902', NULL, NULL);
INSERT INTO `medico05` VALUES(13, 'M761', NULL, 'Ivisnaldo Simoes Lima', NULL, '160,00', NULL, '873', NULL, NULL);
INSERT INTO `medico05` VALUES(14, 'M398', NULL, 'Lucas de Melo Farias', NULL, '-85,00', 2, '320', NULL, NULL);
INSERT INTO `medico05` VALUES(15, 'M785', NULL, 'Katia Virginia Ilha', NULL, '110,00', NULL, '738', NULL, NULL);
INSERT INTO `medico05` VALUES(16, 'M003', NULL, 'Uripedes Simonal', NULL, '175,00', NULL, '320', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nivel`
--

CREATE TABLE `nivel` (
  `id_nivel` int(1) NOT NULL,
  `nome` char(30) CHARACTER SET latin1 DEFAULT NULL,
  `sigla` char(3) CHARACTER SET latin1 DEFAULT NULL,
  `salarioInicial` int(5) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nivel`
--

INSERT INTO `nivel` VALUES(1, 'Analista de Dados Estagiário', 'ETG', 678);
INSERT INTO `nivel` VALUES(2, 'Analista de Dados Júnior', 'ADJ', 1095);
INSERT INTO `nivel` VALUES(3, 'Analista de Dados Pleno', 'ADP', 2547);
INSERT INTO `nivel` VALUES(4, 'Analista de Dados Sênior', 'ADS', 7967);

-- --------------------------------------------------------

--
-- Table structure for table `paciente01`
--

CREATE TABLE `paciente01` (
  `id_paciente01` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(4) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_completo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_completo_erro` int(2) DEFAULT NULL,
  `data_nasc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `data_nasc_erro` int(2) DEFAULT NULL,
  `idade` int(2) NOT NULL,
  `idade_erro` int(2) DEFAULT NULL,
  `tipo_sanguineo` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_sanguineo_erro` int(2) DEFAULT NULL,
  `ultima_consulta` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ultima_consulta_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `paciente01`
--

INSERT INTO `paciente01` VALUES(1, 7838, NULL, 'Samara Dias Flores', NULL, '12/09/2004', NULL, 10, NULL, 'A-', NULL, '08/11/2013', NULL, 17);
INSERT INTO `paciente01` VALUES(2, 3988, NULL, NULL, 1, '29/09/1994', NULL, 20, NULL, 'O+', NULL, '22/02/2012', NULL, NULL);
INSERT INTO `paciente01` VALUES(3, 9055, NULL, 'Pedro Soares Toledo', NULL, '16/04/1993', NULL, 21, NULL, 'O-', NULL, '23/06/2012', NULL, NULL);
INSERT INTO `paciente01` VALUES(4, 4039, NULL, 'Rosa Tavares Dias', NULL, '02.02.92', 7, 22, NULL, 'O+', NULL, '09/11/2010', NULL, NULL);
INSERT INTO `paciente01` VALUES(5, 1280, NULL, 'Sandro Damasceno Farias', NULL, '13/04/2000', NULL, 14, NULL, 'O+', NULL, '09/01/2010', NULL, NULL);
INSERT INTO `paciente01` VALUES(6, 7839, NULL, 'Samara', NULL, '12/09/2004', NULL, 10, NULL, 'A-', NULL, NULL, NULL, 17);
INSERT INTO `paciente01` VALUES(7, 6738, NULL, 'Fabiana Onofre', NULL, '18/07/2000', 11, 14, NULL, 'A+', NULL, '18/07/1990', 11, NULL);
INSERT INTO `paciente01` VALUES(8, 4582, NULL, 'Samuel Soares dos Santos', NULL, '09/03/1999', NULL, 15, NULL, 'O+', NULL, '25/09/2013', NULL, NULL);
INSERT INTO `paciente01` VALUES(9, 3028, NULL, 'Maria das Dores Silva', NULL, '19/02/2005', NULL, 9, NULL, 'Z+', 2, '22/11/2012', NULL, NULL);
INSERT INTO `paciente01` VALUES(10, 8940, NULL, 'Poliana Dias Souza RG 1678892', 5, '21/05/2006', NULL, 8, NULL, 'O+', NULL, '09/02/2011', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente02`
--

CREATE TABLE `paciente02` (
  `id_paciente02` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(4) DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `cpf` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf_erro` int(2) DEFAULT NULL,
  `plano_saude` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plano_saude_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente02`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `paciente02`
--

INSERT INTO `paciente02` VALUES(1, 8389, NULL, 'Karla', NULL, 'Silva Souza', NULL, '973876524-09', NULL, 'Unimed Rio', NULL, NULL);
INSERT INTO `paciente02` VALUES(2, 9920, 16, 'Paula', NULL, 'Andrade', NULL, '882987128-09', NULL, 'Unimed São Gonçalo', NULL, NULL);
INSERT INTO `paciente02` VALUES(3, 9773, NULL, 'Dias Andrade', 12, 'Paulo', 12, '772789098-81', NULL, 'Unimed Rio', NULL, NULL);
INSERT INTO `paciente02` VALUES(4, 7878, NULL, 'Gustavo Henrique', NULL, 'Soares', NULL, '787889110-98', NULL, 'Unimed São Paulo', NULL, 17);
INSERT INTO `paciente02` VALUES(5, 5247, NULL, 'Paula Maria', NULL, 'Gutierrez', NULL, '872092765-09', NULL, 'Osplan', NULL, NULL);
INSERT INTO `paciente02` VALUES(6, 7879, NULL, 'Gustavo', NULL, 'Soares', NULL, '787889110-98', NULL, 'Unimed SP', NULL, 17);
INSERT INTO `paciente02` VALUES(7, 9120, NULL, 'Marta', NULL, 'Maracajá', NULL, '876298981-09', NULL, 'Unimed São Carlos', NULL, NULL);
INSERT INTO `paciente02` VALUES(8, 1589, NULL, 'Sr. Carlos Rafael', 6, 'Diniz', NULL, '899726182-90', NULL, 'SulAmérica Saúde', NULL, NULL);
INSERT INTO `paciente02` VALUES(9, 9920, 16, 'Rafaela', NULL, 'Rocha', NULL, '887229098-98', NULL, 'Bradesco', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente03`
--

CREATE TABLE `paciente03` (
  `id_paciente03` int(11) NOT NULL AUTO_INCREMENT,
  `rg` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `naturalidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `naturalidade_erro` int(2) DEFAULT NULL,
  `idade` int(3) DEFAULT NULL,
  `idade_erro` int(2) DEFAULT NULL,
  `profissao` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `paciente03`
--

INSERT INTO `paciente03` VALUES(1, '16788-09 SSP-SP', NULL, 'José Dias Paes', NULL, 'São Paulo', NULL, 66, NULL, 'Professor', 15, NULL);
INSERT INTO `paciente03` VALUES(2, '16799-20 SSP-PE', NULL, 'Maria Dolores Silva', NULL, 'Garanhuns', NULL, 72, NULL, NULL, NULL, NULL);
INSERT INTO `paciente03` VALUES(3, NULL, 1, 'Valdemar Lira Goes', NULL, 'Aracaju', NULL, 55, NULL, 'Engenheiro', NULL, NULL);
INSERT INTO `paciente03` VALUES(4, '16522-89 SSP-SE', NULL, 'Dione Ferreira Souza', NULL, 'Sergipe', 2, 34, NULL, 'Médico', NULL, NULL);
INSERT INTO `paciente03` VALUES(5, '15698-45 SSP-PE', NULL, 'Ricardo Anatolis', NULL, 'Recife', NULL, 46, NULL, 'Advogado', NULL, NULL);
INSERT INTO `paciente03` VALUES(6, '37688-90 SSP-BA', NULL, 'Sandro Dias', NULL, 'Paulo Afonso', NULL, 45, NULL, 'Advogado', NULL, NULL);
INSERT INTO `paciente03` VALUES(7, '67811-34 SSP-RN', NULL, 'Natal', 12, 'Rafaela Torres', 12, 30, NULL, 'Enfermeira', NULL, NULL);
INSERT INTO `paciente03` VALUES(8, '17890-34 SSP-RN', NULL, 'Romulo Medeiros Rocha', NULL, 'Parelhas', NULL, 61, NULL, 'Advogado', NULL, NULL);
INSERT INTO `paciente03` VALUES(9, '22788-36 SSP-RJ', NULL, 'Yasmin Ludmilla Alencar', NULL, 'Rio das Ostras', NULL, 27, NULL, 'Docente', 15, NULL);
INSERT INTO `paciente03` VALUES(10, '46788-90 SSP-AM', NULL, 'Tulio Marques Gois', NULL, 'C. Grande', 8, 56, NULL, 'Motorista', NULL, NULL);
INSERT INTO `paciente03` VALUES(11, '37638-90 SSP-SP', NULL, 'Jonas Torres Silva', NULL, 'Itu', NULL, 36, NULL, 'Engenheiro', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente04`
--

CREATE TABLE `paciente04` (
  `id_paciente04` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `naturalidade` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `naturalidade_erro` int(2) DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_erro` int(2) DEFAULT NULL,
  `sexo` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente04`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `paciente04`
--

INSERT INTO `paciente04` VALUES(1, '998776989-10', 16, 'Gustavo Lira', NULL, 'São Paulo', NULL, 'SP', NULL, 'MAS', NULL, NULL);
INSERT INTO `paciente04` VALUES(2, '888222981-90', NULL, NULL, 1, 'Crato', NULL, 'CE', NULL, 'MAS', NULL, NULL);
INSERT INTO `paciente04` VALUES(3, '778222987-80', NULL, 'Uilly Santos Dias', NULL, 'PE', 12, 'Recife', 12, 'FEM', NULL, NULL);
INSERT INTO `paciente04` VALUES(4, '844999333-61', NULL, 'Tamara Giordanna', NULL, 'Patos', NULL, 'PB', NULL, 'FEM', NULL, NULL);
INSERT INTO `paciente04` VALUES(5, '337839988-90', NULL, 'Ricardo Jereissati', NULL, 'Belo Orizonte', 4, 'MG', NULL, 'MAS', NULL, NULL);
INSERT INTO `paciente04` VALUES(6, '733887338-90', NULL, 'Ronaldo de Lima Farias', NULL, 'Manaus', NULL, 'AM', NULL, 'MAS', NULL, NULL);
INSERT INTO `paciente04` VALUES(7, '287222876-80', NULL, 'Germana Dias Sales', NULL, 'Natal', NULL, 'RN', NULL, 'FEM', NULL, NULL);
INSERT INTO `paciente04` VALUES(8, '278982098-11', NULL, 'Wellington Farias Neto', NULL, 'Rio Branco', NULL, 'AC', NULL, 'MAS', NULL, NULL);
INSERT INTO `paciente04` VALUES(9, '998789909-19', NULL, 'Eduardo Gomes Farias', NULL, 'Cajazeiras', NULL, 'PB', NULL, 'IND', 2, NULL);
INSERT INTO `paciente04` VALUES(10, '998776989-10', 16, 'Keyla Fabregas', NULL, 'Curitiba', NULL, 'PR', NULL, 'FEM', NULL, NULL);
INSERT INTO `paciente04` VALUES(11, '748764290-09', NULL, 'Helena Dias Torres', NULL, 'Gramado', NULL, 'RS', NULL, 'FEM', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente05`
--

CREATE TABLE `paciente05` (
  `id_paciente05` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `profissao` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profissao_erro` int(2) DEFAULT NULL,
  `nascimento` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente05`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `paciente05`
--

INSERT INTO `paciente05` VALUES(1, 'P190', NULL, 'Sra. Maria Freire', 6, 'Advogada', NULL, '09/11/1974', NULL, NULL);
INSERT INTO `paciente05` VALUES(2, 'P191', NULL, 'Maria Lourdes Ramalho', NULL, 'Engeinheira', 4, '19/11/1969', NULL, NULL);
INSERT INTO `paciente05` VALUES(3, 'P192', NULL, 'Ricardo Maia', NULL, 'Motorista', NULL, '29/01/1979', NULL, NULL);
INSERT INTO `paciente05` VALUES(4, 'P195', 16, 'Romildo Dantas', NULL, 'Professor', NULL, '08/10/1982', NULL, NULL);
INSERT INTO `paciente05` VALUES(5, 'P195', 16, 'Silvano Sales', NULL, 'Professor', NULL, '06/01/1982', NULL, NULL);
INSERT INTO `paciente05` VALUES(6, 'P200', NULL, 'Silvana Soares Dias', NULL, 'Recepcionista', NULL, '08/12/1990', NULL, NULL);
INSERT INTO `paciente05` VALUES(7, 'P201', NULL, 'Paulo Dirceu Paes', NULL, 'Professor', NULL, '08/05/1981', NULL, NULL);
INSERT INTO `paciente05` VALUES(8, 'P202', NULL, 'Damiana Lopes Souza', NULL, 'Empresária', NULL, '02-03-1976', 7, NULL);
INSERT INTO `paciente05` VALUES(9, 'P210', NULL, 'Telma Silva Rocha', NULL, 'Médica', NULL, '10/01/1978', NULL, NULL);
INSERT INTO `paciente05` VALUES(10, 'P211', NULL, 'Vinicius Uchoa Guedes', NULL, 'Vendedor', NULL, '09/06/1993', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente06`
--

CREATE TABLE `paciente06` (
  `id_paciente06` int(11) NOT NULL AUTO_INCREMENT,
  `cod_paciente` int(3) DEFAULT NULL,
  `cod_paciente_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `idade` int(3) DEFAULT NULL,
  `idade_erro` int(2) DEFAULT NULL,
  `cod_endereco` int(3) DEFAULT NULL,
  `cod_endereco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente06`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `paciente06`
--

INSERT INTO `paciente06` VALUES(1, 888, NULL, NULL, 1, 45, NULL, 300, NULL, NULL);
INSERT INTO `paciente06` VALUES(2, 335, NULL, 'Stenio Andrade Leme', NULL, 65, NULL, 100, NULL, NULL);
INSERT INTO `paciente06` VALUES(3, 490, NULL, 'Maria das Dores Gurgel', NULL, 30, NULL, 500, NULL, NULL);
INSERT INTO `paciente06` VALUES(4, 440, NULL, 'Sandro Policarpo', NULL, 35, NULL, 550, 21, NULL);
INSERT INTO `paciente06` VALUES(5, 410, NULL, 'Sandro Miguel Silva', NULL, 15, NULL, 600, NULL, NULL);
INSERT INTO `paciente06` VALUES(6, 310, NULL, 'Mariana Dantas', NULL, -19, 2, 999, NULL, NULL);
INSERT INTO `paciente06` VALUES(7, 832, NULL, 'Iury Nunes Souza', NULL, 44, NULL, 900, NULL, NULL);
INSERT INTO `paciente06` VALUES(8, 901, NULL, 'Marinalva Dias Rocha RG 738229', 5, 30, NULL, 800, NULL, NULL);
INSERT INTO `paciente06` VALUES(9, 482, NULL, 'Fabiano Tavares Mota', NULL, 46, 3, 200, NULL, NULL);
INSERT INTO `paciente06` VALUES(10, 619, NULL, 'Luciano Dias Cartaxo', NULL, 62, NULL, 400, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente07`
--

CREATE TABLE `paciente07` (
  `id_paciente07` int(11) NOT NULL AUTO_INCREMENT,
  `pac_id` int(3) DEFAULT NULL,
  `pac_id_erro` int(2) DEFAULT NULL,
  `pac_nome` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pac_nome_erro` int(2) DEFAULT NULL,
  `pac_profissao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pac_profissao_erro` int(2) DEFAULT NULL,
  `pla_id` int(3) DEFAULT NULL,
  `pla_id_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente07`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `paciente07`
--

INSERT INTO `paciente07` VALUES(1, 930, NULL, 'Milton Bivar Antunes', NULL, 'Músico', NULL, 738, NULL, NULL);
INSERT INTO `paciente07` VALUES(2, 298, NULL, 'Jucilene Alencar', NULL, 'Enfermeira', NULL, 389, NULL, NULL);
INSERT INTO `paciente07` VALUES(3, 921, NULL, 'Luana Diniz Viana', NULL, 'Professora', NULL, 903, 21, NULL);
INSERT INTO `paciente07` VALUES(4, 381, NULL, 'Moises Lucarelli de Souza', NULL, 'Empresário', NULL, 938, NULL, NULL);
INSERT INTO `paciente07` VALUES(5, NULL, 1, 'Ulisses Gouveia', NULL, 'Advogado', NULL, 361, NULL, NULL);
INSERT INTO `paciente07` VALUES(6, 339, NULL, 'Paulino Adamastor', NULL, 'Vendedor', NULL, 801, NULL, NULL);
INSERT INTO `paciente07` VALUES(7, 654, NULL, 'Luana Silva Dias', NULL, 'Escritora', NULL, 320, NULL, NULL);
INSERT INTO `paciente07` VALUES(8, 229, NULL, 'Petronio Uchoa Carvalho', NULL, 'Engenheiro Civiu', 4, 873, NULL, NULL);
INSERT INTO `paciente07` VALUES(9, 823, NULL, 'Iolanda Paes dos Santos', NULL, 'Viúva', 2, 902, NULL, NULL);
INSERT INTO `paciente07` VALUES(10, 662, NULL, 'Sueli Correia Castro', NULL, 'Estudante', 10, 389, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paciente08`
--

CREATE TABLE `paciente08` (
  `id_paciente08` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(4) DEFAULT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `idade` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idade_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_paciente08`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `paciente08`
--

INSERT INTO `paciente08` VALUES(1, 738, NULL, 'Vinicius Praxedes', NULL, '67', NULL, NULL);
INSERT INTO `paciente08` VALUES(2, 389, NULL, 'Fabiana Moraes Souza', NULL, '45', NULL, 17);
INSERT INTO `paciente08` VALUES(3, 444, NULL, 'Poliana Torquato', NULL, '23', NULL, NULL);
INSERT INTO `paciente08` VALUES(4, 371, NULL, 'Ludmilla Alves Tenorio', NULL, '28', NULL, NULL);
INSERT INTO `paciente08` VALUES(5, 801, NULL, 'Nelio Uchoa Cavalcanti', NULL, '0', NULL, NULL);
INSERT INTO `paciente08` VALUES(6, 238, NULL, 'Priscilla Mariana Silva', NULL, '-30', 2, NULL);
INSERT INTO `paciente08` VALUES(7, 761, NULL, 'Josefa Laurentina Silva', NULL, '81', NULL, NULL);
INSERT INTO `paciente08` VALUES(8, 389, NULL, 'Fabiana M. Souza', NULL, '45', NULL, 17);
INSERT INTO `paciente08` VALUES(9, 341, NULL, 'Camilo RG 182933', 5, '67', NULL, NULL);
INSERT INTO `paciente08` VALUES(10, 800, NULL, 'Jonas Otavio Silvano', NULL, '65', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passageiro01`
--

CREATE TABLE `passageiro01` (
  `id_passageiro01` int(2) NOT NULL,
  `CPF` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CPF_erro` int(2) DEFAULT NULL,
  `Nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nome_erro` int(2) DEFAULT NULL,
  `Cidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cidade_erro` int(2) DEFAULT NULL,
  `Data_nascimento` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Data_nascimento_erro` int(2) DEFAULT NULL,
  `Idade` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Idade_erro` int(11) DEFAULT NULL,
  `Deficiente_ou_não` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Deficiente_ou_não_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_passageiro01`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `passageiro01`
--

INSERT INTO `passageiro01` VALUES(1, '118.850.194-42', NULL, 'Maria de Lima', NULL, 'Natal', NULL, '01/03/1995', NULL, '19', NULL, 'DEFICIENTE ', NULL, NULL);
INSERT INTO `passageiro01` VALUES(2, '119.209.194-42', NULL, 'Sofia Souza de Queiroz', NULL, 'C. Grande', 8, '05/02/1998', NULL, '16', NULL, 'NÂO', NULL, NULL);
INSERT INTO `passageiro01` VALUES(3, 'ABCGSJDUSD', 2, 'Lucas Ferreira', NULL, 'Esperança', NULL, '02/02/1993', NULL, 'Deficiente', 12, '21', 12, NULL);
INSERT INTO `passageiro01` VALUES(4, '162.632.119-50', NULL, 'José de Souza ', NULL, 'Fortalessa', 4, '09/04/1997', NULL, '17', NULL, 'DEFICIENTE VISUAL', 5, NULL);
INSERT INTO `passageiro01` VALUES(5, '132.856.121-12', NULL, 'Bruno s.', 6, 'Campina Grande', NULL, '08/03/1993', NULL, '210', 2, 'NÃO', NULL, NULL);
INSERT INTO `passageiro01` VALUES(6, '121.902.678-76', NULL, 'Carolina Barboza ', NULL, 'Natal', NULL, '09/05/1993', NULL, '21', NULL, 'DEFICIENTE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `planosaude01`
--

CREATE TABLE `planosaude01` (
  `id_planosaude01` int(11) NOT NULL AUTO_INCREMENT,
  `pla_id` int(3) DEFAULT NULL,
  `pla_id_erro` int(2) DEFAULT NULL,
  `pla_cnpj` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pla_cnpj_erro` int(2) DEFAULT NULL,
  `pla_nome` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pla_nome_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_planosaude01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `planosaude01`
--

INSERT INTO `planosaude01` VALUES(1, 738, NULL, '444.222.445/3039-03', NULL, 'Ecole Empresarial', NULL, NULL);
INSERT INTO `planosaude01` VALUES(2, 389, NULL, '338.239.138/3837-03', NULL, 'ProntoMed Saúde', NULL, NULL);
INSERT INTO `planosaude01` VALUES(3, 801, NULL, '383.227.109/3378-98', NULL, 'Santaris', NULL, 17);
INSERT INTO `planosaude01` VALUES(4, 344, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `planosaude01` VALUES(5, 902, NULL, '377.338.098/2829-92', NULL, 'Uniflex Nacional', NULL, NULL);
INSERT INTO `planosaude01` VALUES(6, 873, NULL, '373.338.387/2823-92', NULL, 'Nacional Beta Prata', NULL, NULL);
INSERT INTO `planosaude01` VALUES(7, 320, NULL, '387.338.339/3933-92', NULL, 'Unimed Beta 2 Dental PPE', NULL, NULL);
INSERT INTO `planosaude01` VALUES(8, 801, NULL, '383.227.109/3378-98', NULL, 'Santaris', NULL, 17);
INSERT INTO `planosaude01` VALUES(9, 361, NULL, '373.377.000/3837-22', NULL, 'Uniflex Estadual - Apto', NULL, NULL);
INSERT INTO `planosaude01` VALUES(10, 938, NULL, '338.338.337/3889-03', NULL, 'Equilíbrio Especial', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `planosaude02`
--

CREATE TABLE `planosaude02` (
  `id_planosaude02` int(11) NOT NULL AUTO_INCREMENT,
  `pla_id` int(3) DEFAULT NULL,
  `pla_id_erro` int(2) DEFAULT NULL,
  `pla_cnpj` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pla_cnpj_erro` int(2) DEFAULT NULL,
  `pla_nome` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pla_nome_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_planosaude02`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `planosaude02`
--

INSERT INTO `planosaude02` VALUES(1, 738, NULL, '444.222.445/3039-03', NULL, 'Ecole Empresarial', NULL, NULL);
INSERT INTO `planosaude02` VALUES(2, 389, NULL, '338.239.138/3837-03', NULL, 'ProntoMed Saúde', NULL, NULL);
INSERT INTO `planosaude02` VALUES(3, 801, NULL, '383.227.109/3378-98', NULL, 'Santaris', NULL, 17);
INSERT INTO `planosaude02` VALUES(4, 344, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `planosaude02` VALUES(5, 902, NULL, '377.338.098/2829-92', NULL, 'Uniflex Nacional', NULL, NULL);
INSERT INTO `planosaude02` VALUES(6, 873, NULL, '373.338.387/2823-92', NULL, 'Nacional Beta Prata', NULL, NULL);
INSERT INTO `planosaude02` VALUES(7, 320, NULL, '387.338.339/3933-92', NULL, 'Unimed Beta 2 Dental PPE', NULL, NULL);
INSERT INTO `planosaude02` VALUES(8, 801, NULL, '383.227.109/3378-98', NULL, 'Santaris', NULL, 17);
INSERT INTO `planosaude02` VALUES(9, 361, NULL, '373.377.000/3837-22', NULL, 'Uniflex Estadual - Apto', NULL, NULL);
INSERT INTO `planosaude02` VALUES(10, 938, NULL, '338.338.337/3889-03', NULL, 'Equilíbrio Especial', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produto01`
--

CREATE TABLE `produto01` (
  `id_produto01` varchar(1) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `descricao` varchar(40) DEFAULT NULL,
  `descricao_erro` int(2) DEFAULT NULL,
  `preco` varchar(6) DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_produto01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto01`
--

INSERT INTO `produto01` VALUES('1', '100', NULL, 'Vassoura', NULL, 'Vassoura de nylon', NULL, '4,80', NULL, NULL);
INSERT INTO `produto01` VALUES('2', '101', 16, 'detergente', NULL, 'detergente neutro, 500ml', NULL, '1,50', NULL, NULL);
INSERT INTO `produto01` VALUES('3', NULL, 1, 'água sanitária', NULL, 'água sanitária, 1l', NULL, '1,30', NULL, NULL);
INSERT INTO `produto01` VALUES('4', '103', NULL, 'desinfetante', NULL, 'desinfetante e fragrância de flores', NULL, 'grande', 2, NULL);
INSERT INTO `produto01` VALUES('5', '104', NULL, 'rodo', NULL, 'rodo madeira', NULL, '5,10', NULL, NULL);
INSERT INTO `produto01` VALUES('6', '101', 16, 'polidor de alumínio', NULL, 'polidor de alumínio, 500ml', NULL, 'xviii', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produto02`
--

CREATE TABLE `produto02` (
  `id_produto02` int(1) NOT NULL,
  `codigo_barras` varchar(14) DEFAULT NULL,
  `codigo_barras_erro` int(2) DEFAULT NULL,
  `nome` varchar(14) DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `id_destribuidor` varchar(3) DEFAULT NULL,
  `id_destribuidor_erro` int(2) DEFAULT NULL,
  `preco` varchar(5) DEFAULT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_produto02`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produto02`
--

INSERT INTO `produto02` VALUES(1, '5698741236547', NULL, 'champuh', 4, '400', NULL, '5,80', NULL, NULL);
INSERT INTO `produto02` VALUES(2, '8659123654756', NULL, 'sabonete', NULL, '401', NULL, '2,25', NULL, NULL);
INSERT INTO `produto02` VALUES(3, '8962136547821', NULL, 'hidratante', NULL, '403', 21, '22,00', NULL, NULL);
INSERT INTO `produto02` VALUES(4, '4789612365479', NULL, 'creme dental', NULL, '402', NULL, '7', NULL, NULL);
INSERT INTO `produto02` VALUES(5, '7844562312659', NULL, 'condicionador', NULL, '400', NULL, '6,40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produto03`
--

CREATE TABLE `produto03` (
  `id_produto03` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `fabricante` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fabricante_erro` int(2) DEFAULT NULL,
  `validade` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `validade_erro` int(2) DEFAULT NULL,
  `preco` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `preco_erro` int(2) DEFAULT NULL,
  `qntd_em_estoque` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `qntd_em_estoque_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_produto03`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `produto03`
--

INSERT INTO `produto03` VALUES(1, 222, NULL, 'Absorvente', NULL, 'Absorve LTDA', NULL, 'Fev0010', 2, '3,90', NULL, '50', NULL, NULL);
INSERT INTO `produto03` VALUES(2, 233, NULL, 'Enxaguante bucal', NULL, 'Feixecs', NULL, 'Abr2015', NULL, '5,50', NULL, '30', NULL, NULL);
INSERT INTO `produto03` VALUES(3, 244, NULL, 'Creme dental', NULL, 'Dental Perfect', NULL, 'Ago2017', NULL, '2,30', NULL, '45', NULL, NULL);
INSERT INTO `produto03` VALUES(4, 255, NULL, 'Escova de dentes', NULL, 'Dental Perfect', NULL, 'Set2018', NULL, '3,00', NULL, '26', NULL, NULL);
INSERT INTO `produto03` VALUES(5, 266, NULL, 'Pera', 9, NULL, 1, 'Ago2018', NULL, '1,90', NULL, '6.78', 2, NULL);
INSERT INTO `produto03` VALUES(6, 277, NULL, 'Faixa de ferimento ', NULL, 'Faixecs', NULL, 'Mar2016', NULL, '3,50', NULL, '38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `professor01`
--

CREATE TABLE `professor01` (
  `id_professor01` int(2) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) NOT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `sobrenome` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sobrenome_erro` int(2) DEFAULT NULL,
  `formacao` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `formacao_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_professor01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `professor01`
--

INSERT INTO `professor01` VALUES(2, 321, 16, 'Maria Gorete', NULL, 'Medeiros', NULL, 'Sociologia', NULL, NULL);
INSERT INTO `professor01` VALUES(3, 432, NULL, 'Antônio de Padua', NULL, 'Arruda', NULL, 'Letras Português', NULL, NULL);
INSERT INTO `professor01` VALUES(4, 543, NULL, 'Helio ', NULL, 'Santos', NULL, 'Odotolôgia', 4, NULL);
INSERT INTO `professor01` VALUES(5, 654, NULL, 'Jane', NULL, 'arruda ', 4, 'Medicina', NULL, NULL);
INSERT INTO `professor01` VALUES(6, 321, 16, 'Jaisna Luara', NULL, 'Barbosa', NULL, 'Arte e mídia', NULL, NULL);
INSERT INTO `professor01` VALUES(7, 876, NULL, 'Hugo Alberto', NULL, 'Gomes', NULL, 'Ciência da Computação', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tabelas`
--

CREATE TABLE `tabelas` (
  `nome` varchar(50) NOT NULL,
  `id_empresa` int(3) NOT NULL,
  `id_nivel` int(1) NOT NULL,
  `id_cenario` int(4) NOT NULL,
  PRIMARY KEY (`nome`),
  KEY `empresa_nivel_cenario_fk` (`id_empresa`,`id_nivel`,`id_cenario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabelas`
--

INSERT INTO `tabelas` VALUES('produto01', 1, 1, 1);
INSERT INTO `tabelas` VALUES('funcionario02', 1, 1, 2);
INSERT INTO `tabelas` VALUES('funcionario03', 1, 1, 3);
INSERT INTO `tabelas` VALUES('itens_setor_acougue01', 1, 1, 4);
INSERT INTO `tabelas` VALUES('itens_setor_frios_e_laticinios01', 1, 1, 5);
INSERT INTO `tabelas` VALUES('itens_setor_brinquedos02', 1, 1, 6);
INSERT INTO `tabelas` VALUES('departamento01', 1, 2, 1);
INSERT INTO `tabelas` VALUES('funcionario01', 1, 2, 1);
INSERT INTO `tabelas` VALUES('distribuidor_papelaria01', 1, 2, 2);
INSERT INTO `tabelas` VALUES('itens_setor_papelaria01', 1, 2, 2);
INSERT INTO `tabelas` VALUES('distribuidor_limpeza01', 1, 2, 3);
INSERT INTO `tabelas` VALUES('itens_setor_limpeza01', 1, 2, 3);
INSERT INTO `tabelas` VALUES('distribuidor_eletrodomesticos01', 1, 2, 4);
INSERT INTO `tabelas` VALUES('itens_setor_eletrodomesticos01', 1, 2, 4);
INSERT INTO `tabelas` VALUES('distribuidor_brinquedos01', 1, 2, 5);
INSERT INTO `tabelas` VALUES('itens_setor_brinquedos01', 1, 2, 5);
INSERT INTO `tabelas` VALUES('distribuidor_frutas_e_verduras01', 1, 2, 6);
INSERT INTO `tabelas` VALUES('itens_setor_frutas_e_verduras01', 1, 2, 6);
INSERT INTO `tabelas` VALUES('distribuidor01', 1, 3, 1);
INSERT INTO `tabelas` VALUES('endereco01', 1, 3, 1);
INSERT INTO `tabelas` VALUES('item02', 1, 3, 1);
INSERT INTO `tabelas` VALUES('produto02', 1, 3, 1);
INSERT INTO `tabelas` VALUES('cliente01', 1, 4, 1);
INSERT INTO `tabelas` VALUES('item01', 1, 4, 1);
INSERT INTO `tabelas` VALUES('vendas01', 1, 4, 1);
INSERT INTO `tabelas` VALUES('endereco02', 1, 4, 2);
INSERT INTO `tabelas` VALUES('funcionario04', 1, 4, 2);
INSERT INTO `tabelas` VALUES('cargo01', 1, 4, 3);
INSERT INTO `tabelas` VALUES('departamento02', 1, 4, 3);
INSERT INTO `tabelas` VALUES('funcionario05', 1, 4, 3);
INSERT INTO `tabelas` VALUES('paciente01', 2, 1, 1);
INSERT INTO `tabelas` VALUES('medico01', 2, 1, 2);
INSERT INTO `tabelas` VALUES('paciente02', 2, 1, 3);
INSERT INTO `tabelas` VALUES('consulta01', 2, 1, 4);
INSERT INTO `tabelas` VALUES('medico02', 2, 1, 5);
INSERT INTO `tabelas` VALUES('paciente03', 2, 1, 6);
INSERT INTO `tabelas` VALUES('paciente04', 2, 1, 7);
INSERT INTO `tabelas` VALUES('medico03', 2, 1, 8);
INSERT INTO `tabelas` VALUES('consulta02', 2, 1, 9);
INSERT INTO `tabelas` VALUES('consulta03', 2, 1, 10);
INSERT INTO `tabelas` VALUES('consulta04', 2, 2, 1);
INSERT INTO `tabelas` VALUES('paciente05', 2, 2, 1);
INSERT INTO `tabelas` VALUES('endereco03', 2, 2, 2);
INSERT INTO `tabelas` VALUES('paciente06', 2, 2, 2);
INSERT INTO `tabelas` VALUES('especialidade01', 2, 2, 3);
INSERT INTO `tabelas` VALUES('medico04', 2, 2, 3);
INSERT INTO `tabelas` VALUES('paciente07', 2, 2, 4);
INSERT INTO `tabelas` VALUES('planosaude01', 2, 2, 4);
INSERT INTO `tabelas` VALUES('exame01', 2, 2, 5);
INSERT INTO `tabelas` VALUES('paciente08', 2, 2, 5);
INSERT INTO `tabelas` VALUES('medico05', 2, 3, 1);
INSERT INTO `tabelas` VALUES('planosaude02', 2, 3, 1);
INSERT INTO `tabelas` VALUES('especialidade02', 2, 3, 2);
INSERT INTO `tabelas` VALUES('fornecedor01', 2, 3, 2);
INSERT INTO `tabelas` VALUES('passageiro01', 3, 1, 1);
INSERT INTO `tabelas` VALUES('companhia_aerea01', 3, 1, 2);
INSERT INTO `tabelas` VALUES('funcionarios06', 3, 1, 3);
INSERT INTO `tabelas` VALUES('voo01', 3, 1, 4);
INSERT INTO `tabelas` VALUES('companhia_aerea02', 3, 2, 1);
INSERT INTO `tabelas` VALUES('venda_de_passagem01', 3, 2, 1);
INSERT INTO `tabelas` VALUES('aluno01', 5, 1, 1);
INSERT INTO `tabelas` VALUES('professor01', 5, 1, 2);
INSERT INTO `tabelas` VALUES('curso01', 5, 1, 3);
INSERT INTO `tabelas` VALUES('funcionario08', 5, 1, 4);
INSERT INTO `tabelas` VALUES('departamento03', 5, 1, 5);
INSERT INTO `tabelas` VALUES('funcionario07', 6, 1, 1);
INSERT INTO `tabelas` VALUES('medicamento01', 6, 1, 2);
INSERT INTO `tabelas` VALUES('cliente_especial01', 6, 1, 3);
INSERT INTO `tabelas` VALUES('produto03', 6, 1, 4);
INSERT INTO `tabelas` VALUES('veiculo01', 11, 1, 1);
INSERT INTO `tabelas` VALUES('funcionario09', 11, 1, 2);
INSERT INTO `tabelas` VALUES('medicamento02', 6, 1, 5);
INSERT INTO `tabelas` VALUES('dermocosmeticos01', 6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `veiculo01`
--

CREATE TABLE `veiculo01` (
  `id_veiculo01` int(2) NOT NULL,
  `codigo` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_erro` int(2) DEFAULT NULL,
  `marca` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marca_erro` int(2) DEFAULT NULL,
  `ano_fabricacao` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ano_fabricacao_erro` int(2) DEFAULT NULL,
  `quantidade_portas` int(3) DEFAULT NULL,
  `quantidade_portas_erro` int(2) DEFAULT NULL,
  `qtd_pronta_entrega` int(2) DEFAULT NULL,
  `qtd_pronta_entrega_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_veiculo01`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `veiculo01`
--

INSERT INTO `veiculo01` VALUES(1, '01410', NULL, 'Corsa', NULL, 'Chevrolet', NULL, '2009', NULL, 2, NULL, 2, NULL, NULL);
INSERT INTO `veiculo01` VALUES(2, '01501', NULL, 'Palio', NULL, 'Fiat', NULL, '2012', NULL, 15, 2, 0, NULL, NULL);
INSERT INTO `veiculo01` VALUES(3, NULL, 1, 'Fusca', NULL, 'Volkswagen', NULL, '1985', NULL, 2, NULL, 1, NULL, NULL);
INSERT INTO `veiculo01` VALUES(4, '11012', NULL, 'March', NULL, '2014', 12, 'Nissan', 12, 4, NULL, 3, NULL, NULL);
INSERT INTO `veiculo01` VALUES(5, '11500', NULL, NULL, NULL, 'Hyundai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `vendas01`
--

CREATE TABLE `vendas01` (
  `id_vendas01` int(1) NOT NULL,
  `id` int(1) NOT NULL,
  `id_erro` int(2) DEFAULT NULL,
  `codigo_da_venda` varchar(3) DEFAULT NULL,
  `codigo_da_venda_erro` int(2) DEFAULT NULL,
  `cpf_cliente` varchar(16) DEFAULT NULL,
  `cpf_cliente_erro` int(2) DEFAULT NULL,
  `codigo_de_barras` varchar(14) DEFAULT NULL,
  `codigo_de_barras_erro` int(2) DEFAULT NULL,
  `quantidade_item` varchar(3) DEFAULT NULL,
  `quantidade_item_erro` int(2) DEFAULT NULL,
  `valor_total` varchar(5) DEFAULT NULL,
  `valor_total_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_vendas01`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendas01`
--

INSERT INTO `vendas01` VALUES(1, 1, NULL, '256', NULL, '115.391.624-00', NULL, '1589632478596', NULL, '7', NULL, '19,95', NULL, NULL);
INSERT INTO `vendas01` VALUES(2, 2, NULL, '256', NULL, '115.391.624-00', NULL, '1255789632154', NULL, '5', NULL, '7,00', 28, NULL);
INSERT INTO `vendas01` VALUES(3, 3, NULL, '258', NULL, '635.114.322-69', NULL, '9632584512586', NULL, '10', NULL, '25,00', NULL, NULL);
INSERT INTO `vendas01` VALUES(4, 4, NULL, '259', NULL, '179.854.321-06', NULL, '1255789632154', NULL, '15', NULL, '20,25', NULL, NULL);
INSERT INTO `vendas01` VALUES(5, 5, NULL, '260', NULL, '123.456.89-07', 21, '9632584512586', NULL, '10', NULL, '2,50', 28, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venda_de_passagem01`
--

CREATE TABLE `venda_de_passagem01` (
  `id_venda_de_passagem01` int(2) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_erro` int(2) DEFAULT NULL,
  `nome_passageiro` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_passageiro_erro` int(2) DEFAULT NULL,
  `CPF` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CPF_erro` int(2) DEFAULT NULL,
  `cidade_embarque` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_embarque_erro` int(2) DEFAULT NULL,
  `cidade_desembarque` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_desembarque_erro` int(2) DEFAULT NULL,
  `codigo_companhia` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_companhia_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_venda_de_passagem01`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `venda_de_passagem01`
--

INSERT INTO `venda_de_passagem01` VALUES(1, '21210', NULL, 'Fernando Henrique Cabral', NULL, '081.440.174-24', NULL, 'Campina Grande', NULL, 'Florianópolis', NULL, '3003', NULL, NULL);
INSERT INTO `venda_de_passagem01` VALUES(2, '21220', NULL, 'Clara Nóbrega Sobral', NULL, '240.1340.97000', 7, 'Campina Grande', NULL, 'Rio de Janeiro', NULL, '00111', NULL, NULL);
INSERT INTO `venda_de_passagem01` VALUES(3, '22110', NULL, 'Dr. Flávio Alberto Leão', 6, '082.225.014-27', NULL, 'C. Grande', 8, 'Buenos Aires', NULL, '00111', NULL, NULL);
INSERT INTO `venda_de_passagem01` VALUES(4, '25111', NULL, 'Yale Sales Silva', NULL, '025.142.234-22', NULL, 'Jão Pessoa', 4, 'São Paulo', NULL, '01010', 21, NULL);
INSERT INTO `venda_de_passagem01` VALUES(5, '21223', NULL, 'Franklin Cabral Albuquerque', NULL, '564.369.587-25', NULL, 'João Pessoa', NULL, 'Salvador', NULL, '3003', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voo01`
--

CREATE TABLE `voo01` (
  `id_voo01` int(2) NOT NULL AUTO_INCREMENT,
  `voo` int(3) NOT NULL,
  `voo_erro` int(2) DEFAULT NULL,
  `destino` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `destino_erro` int(1) DEFAULT NULL,
  `horario_chegada` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `horario_chegada_erro` int(2) DEFAULT NULL,
  `companhia` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `companhia_erro` int(2) DEFAULT NULL,
  `linha_erro` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_voo01`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `voo01`
--

INSERT INTO `voo01` VALUES(1, 145, 16, 'Guarulhos - SP', 7, '14:30', NULL, 'Voe alto', NULL, NULL);
INSERT INTO `voo01` VALUES(2, 146, NULL, 'Jão Pessoa - Paraíba', 4, '16:20', NULL, 'Boa viagem', NULL, NULL);
INSERT INTO `voo01` VALUES(3, 147, NULL, 'Maceió - Alagoas', NULL, '01/50', 7, 'Total conforto', NULL, NULL);
INSERT INTO `voo01` VALUES(4, 145, 16, 'Recife - Pernambuco', NULL, '08:25', NULL, 'Céu Conforto', NULL, NULL);
INSERT INTO `voo01` VALUES(5, 149, NULL, 'Recife - Pernambuco', NULL, '08:30', NULL, 'Total conforto', NULL, NULL);
INSERT INTO `voo01` VALUES(6, 148, NULL, 'Recife - Pernambuco', NULL, '09:30', NULL, 'Voe alto', NULL, NULL);
