<?php
class Model {

	function __construct() {
		require_once($_SERVER['DOCUMENT_ROOT'] . dirname($_SERVER['SCRIPT_NAME']) . '\database\acessaBD.php');
	}
	
}
?>