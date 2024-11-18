<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	boolean logado = (boolean) request.getAttribute("logado");
	var user = request.getAttribute("user");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logado</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	body{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	
	<%if(logado){%>
		<div class="jumbotron">
			  <h1 class="display-4">Logado como <%=user%>!</h1>
			  <p class="lead">Seu cadastro foi um sucesso!</p>
			  <hr class="my-4">
			  <a class="btn btn-primary btn-lg" href="login.do?action=getIndex" role="button">Página inicial</a>
			  <a class="btn btn-primary btn-lg" href="login.do?action=getAdm" role="button">Administração</a>
		</div>
	<%}else{%>
		<div class="jumbotron">
			  <h1 class="display-4">Login mal sucedido!</h1>
			  <p class="lead">Senha ou usuário inválidos!</p>
			  <hr class="my-4">
			  <a class="btn btn-primary btn-lg" href="login.do?action=getIndex" role="button">Página inicial</a>
			  <a class="btn btn-primary btn-lg" href="login.do?action=getLogin" role="button">Tentar novamente</a>
		</div>
	<%}; %>	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>