<?php
session_start();

if (!isset($_SESSION["email"])) { // se nao estiver logado...
	header("location: index.php"); // ...vai para a pagina inicial.
	exit;
} 

setCookie("score", 0); // criando um cookie para guarda o score obtido.
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<?php include_once("includes/header.php"); ?>
	<title>Como jogar Mr. Data Analyst</title>
	<link href="css/comoJogar.css" rel="stylesheet">
</head>
<body class='corDoFundo'>

<?php 
$_SESSION["navbar"] = "comojogar";
include_once("includes/navbar.php");
?>

<div class="row">
	<iframe height="570" class="col-md-6 col-md-offset-3" src="//www.youtube.com/embed/cqTlLL9fp1E" frameborder="0" allowfullscreen></iframe>
</div>

</body>
</html>                                		