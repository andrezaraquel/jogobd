<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">	
<link rel="icon" href="img/favicon.ico">
<title>Mr. Data Analyst</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" >
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" >
<link href="css/font-awesome.min.css" rel="stylesheet">

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type= "text/javascript"></script>
<!--Muda as cores de alguns itens visuais do jogo dependendo do sexo do usuario-->
<?php
	if (isset($_SESSION) and $_SESSION['sexo'] == 'feminino'){
		echo "<link rel='stylesheet' type='text/css' href='css/feminino.css'/>";
	} else {
		echo "<link rel='stylesheet' type='text/css' href='css/masculino.css'/>";
	}
?> 	
