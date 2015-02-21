function validaEmail(field) { 
	usuario = field.value.substring(0, field.value.indexOf("@")); 
	dominio = field.value.substring(field.value.indexOf("@")+ 1,  field.value.length); 
	if ((usuario.length >=1) && (dominio.length >=3)
		&& (usuario.search("@")==-1) && (dominio.search("@")==-1) 
		&& (usuario.search(" ")==-1) && (dominio.search(" ")==-1) 
		&& (dominio.search(".")!=-1) && (dominio.indexOf(".") >=1)
		&& (dominio.lastIndexOf(".") < dominio.length - 1)) { 
			document.getElementById("msgEmail").innerHTML="E-mail válido"; 
	} else { 
		document.getElementById("msgEmail").innerHTML="<font color='red'>E-mail inválido </font>";
	} 
}

$("#loginSubmitBtn").on("click", function() {
	$("#loginForm").submit();
});

$("#loginForm").on("submit", function() {
	$.ajax({
		type: 'POST',
		url: 'database/autentificaLogin.php',
		data: $(this).serialize(),
		success: function() {
			window.location.href = "comoJogar.php";
		},
		error: function(data) {
			$("#msgLoginError").css("display", "");
			$("#msgLoginError p").html(data.statusText);
		}
	});
	return false;
});