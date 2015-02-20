<?php

include("acessaBD.php");
$email = $_GET['email'];

$sql_check = mysql_query("SELECT email FROM cadastros WHERE email='$email'");

if(mysql_num_rows($sql_check) > 0){
echo  1;
}
else
{
echo 0;
}




?>