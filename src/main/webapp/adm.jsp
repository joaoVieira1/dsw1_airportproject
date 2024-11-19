<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	var logado = session.getAttribute("logado");

	//verificando se o atributo da sessão é verdadeiro, caso a sessão não esteja inicializada 
	//a variável assume como false
	if(logado == null){
		logado = "false";
	}
%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administração</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	body{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	
	<!-- Autenticando o acesso de acordo com o atributo da sessão -->
	<%if(logado.equals("false")){%>
	
		<div class="jumbotron">
			  <h1 class="display-4">Apenas administradores</h1>
			  <p class="lead">É necessário se cadastrar como administrador para acessar essa página!</p>
			  <hr class="my-4">
			  <a class="btn btn-primary btn-lg" href="login.do?action=getIndex" role="button">Página inicial</a>
			  <a class="btn btn-primary btn-lg" href="login.do?action=getLogin" role="button">Cadastrar-se</a>
		</div>
	
	<%}else{%>
	
		<div class="container">
				<nav class="navbar navbar-expand-lg bg-secondary-subtle">
					<div class="container-fluid">
						<a class="navbar-brand" href="login.do?action=getAdm">Administração</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="login.do?action=getIndex">
										Página inicial</a></li>
								<li class="nav-item"><a class="nav-link" href="admin.do?action=getCadastroVoo">
										Cadastrar voo</a></li>
								<li class="nav-item"><a class="nav-link" href="admin.do?action=getAtualizarVoo"> 
										Atualizar voo</a></li>
							</ul>
							<ul class="navbar-nav ms-auto">
								<li class="nav-item"><a class="nav-link" href="login.do?action=getLogout">Logout</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
	
	<%};%>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>