<%@page import="java.util.List"%>
<%@page import="br.edu.ifsp.dsw1.model.entity.FlightData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hall 1</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	.alert-success{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.container{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
</style>
</head>
<body>
	<%
		var flightsArriving = (List<FlightData>) request.getAttribute("flightsArriving");
	%>
	<%if(flightsArriving != null && !flightsArriving.isEmpty()){%>
		<table class="table table-dark">
			  <thead>
				    <tr>
					      <th scope="col">Número</th>
					      <th scope="col">Companhia</th>
					      <th scope="col">Data/Hora</th>
					      <th scope="col">Estado</th>
				    </tr>
			  </thead>
			  <tbody>
			  		<%for(var flights : flightsArriving){%>
				    <tr>
					      <th scope="row"><%= flights.getFlightNumber()%></th>
					      <td><%= flights.getCompany()%></td>
					      <td><%= flights.getTime() %></td>
					      <td><%= flights.getState().getClass().getSimpleName() %></td>
				    </tr>
				    <%};%>
			  </tbody>
		</table>
	<%}else{ %>
		<div class="alert alert-success" role="alert">
		  <h4 class="alert-heading">Nenhum voo cadastrado!</h4>
	    </div>
	<%}; %>
	
	<div class="container">
		<a class="btn btn-primary btn-lg" href="login.do?action=getIndex" role="button">Página Inicial</a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>