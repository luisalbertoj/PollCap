<%-- 
    Document   : usuario
    Created on : 26/10/2019, 06:48:23 PM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PollCap</title>
<link href="http://localhost:8080/CSS/cssUsuario.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


</head>
<body>
	<div class="alert alert-primary" style="text-align: center; ">
		<h3>${mensaje}</h3>
		<h3>${usuario.getNombres()} - ${usuario.getRol().getNombre()}</h3>
	</div>
	<div id="top">
		<img src="http://localhost:8080/IMG/logoUDES.png" align="left"
			id="img">
		<h1>PollCap</h1>
	</div>
	<div id="menu">
		<nav class="nav">
			<ul>
				<li id="item"><a href="/inicio/${ usuario.getId()}">Inicio<img
						src="http://localhost:8080/IMG/inicio.png" align="left">
				</a></li>
				<li id="item"><a href="/usuario/${ usuario.getId()}">Usuario<img
						src="http://localhost:8080/IMG/user.png" align="left">
				</a></li>
				<li id="item"><a href="/encuesta/${ usuario.getId()}">Encuesta<img
						src="http://localhost:8080/IMG/encuesta.png" align="left"></a></li>
				<li id="item"><a href="/reporte/${ usuario.getId()}">Reporte<img
						src="http://localhost:8080/IMG/reporte.png" align="left"></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<div class="container-fluid">
		<div class="container">
			<form>
				<div class="form-group">
					<label for="exampleFormControlFile1">Carga de Estudiantes</label> <input
						type="file" class="form-control-file" id="exampleFormControlFile1"
						name="estudiantes">
				</div>
				<button type="submit" class="btn btn-primary">Cargar</button>
			</form>
		</div>
	</div>


	<br>

	<div class="container-fluid">
		<div class="container">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">id</th>
						<th scope="col">Nombres</th>
						<th scope="col">Codigo</th>
						<th scope="col">Fecha de creacion</th>
						<th scope="col">Email</th>
						<th scope="col">Telefono</th>
						<th scope="col">Username</th>
						<th scope="col">Programa</th>
						<th scope="col">Rol</th>
						<th scope="col">Semestre</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${usuarios}" var="usuarioTem">
					    <tr>      
					        <td>${usuarioTem.getId()}</td>
					        <td>${usuarioTem.getNombres()}</td>
					        <td>${usuarioTem.getCodigo()}</td>
					        <td>${usuarioTem.getCreateAt()}</td>
					        <td>${usuarioTem.getEmail()}</td>
					        <td>${usuarioTem.getTelefono()}</td>  
					        <td>${usuarioTem.getUsername()}</td> 
					        <td>${usuarioTem.getPrograma().getNombre()}</td> 
					        <td>${usuarioTem.getRol().getNombre()}</td> 
					        <td>${usuarioTem.getSemestre().getNumero()}</td> 
					    </tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<div id="pie">
		<h4>NURLYS VIVIANA PATIÑO EPALZA</h4>
		<h5>UNIVERSIDAD DE SANTANDER</h5>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
