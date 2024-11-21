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
<title>Cadastro Voo</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	body{
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 10px
		
	}
	form{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.form-group{
		display: flex;
		justify-content: space-around;
	}
</style>
</head>
<body>
	
	<!-- retornando view de acordo com a autenticação -->
	<%if(logado.equals("false")){%>
	
		<div class="jumbotron">
			  <h1 class="display-4">Apenas administradores</h1>
			  <p class="lead">É necessário se cadastrar como administrador para acessar essa página!</p>
			  <hr class="my-4">
			  <a class="btn btn-primary btn-lg" href="login.do?action=getIndex" role="button">Página inicial</a>
			  <a class="btn btn-primary btn-lg" href="login.do?action=getLogin" role="button">Cadastrar-se</a>
		</div>
  	
  	<%}else{%>
  		<h1>Cadastrar Voo!</h1>
		
		<form action="admin.do?action=getCadastrarVoo" method="post">
			  <div class="form-group row">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Número: </label>
			    <div class="col-sm-8">
			      <input type="number" class="form-control" id="inputEmail3" placeholder="Número do Voo" name="text_numero_voo" required="required"> 
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Companhia: </label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="inputPassword3" placeholder="Companhia" name="text_companhia" required="required">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Data/Hora: </label>
			    <div class="col-sm-8">
			      <input type="datetime-local" class="form-control" id="inputPassword3" placeholder="Data/Hora" name="text_data_hora" required="required">
			    </div>
			  </div>
			  <div class="form-group row">
			    <div class="col-sm-8">
			      <button type="submit" class="btn btn-primary">Cadastrar</button>
			    </div>
			  </div>
	  	</form>
	  	
	  	<a href="login.do?action=getAdm">Voltar para administração</a>
  	<%};%>
  	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</body>
</html>