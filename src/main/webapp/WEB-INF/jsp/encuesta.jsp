<%-- 
    Document   : encuesta
    Created on : 29/10/2019, 12:48:29 AM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PollCap</title>
<link href="http://localhost:8089/CSS/cssEncuesta.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="alert alert-primary"
		style="text-align: center;">
		<h4>${usuario.getNombres()}-${usuario.getRol().getNombre()}</h4>
	</div>
	<div id="top">
		<img src="http://localhost:8089/IMG/logoUDES.png" align="left"
			id="img">
		<h1>PollCap</h1>
	</div>
	<div id="menu">
		<nav class="nav">
			<ul>
				<li style="color: white; display: ${ menuIncio }" id="item"><a
					href="/inicio/${ usuario.getId()}">Inicio<img
						src="http://localhost:8089/IMG/inicio.png" align="left">
				</a></li>
				<li style="color: white; display: ${ menuUsuario }" id="item"><a
					href="/usuario/${ usuario.getId()}">Usuario<img
						src="http://localhost:8089/IMG/user.png" align="left">
				</a></li>
				<li style="color: white; display: ${ menuEncuesta }" id="item"><a
					href="/encuesta/${ usuario.getId()}">Encuesta<img
						src="http://localhost:8089/IMG/encuesta.png" align="left"></a></li>
				<li style="color: white; display: ${ menuReporte }" id="item"><a
					href="/reporte/${ usuario.getId()}">Reporte<img
						src="http://localhost:8089/IMG/reporte.png" align="left"></a></li>
				<li style="color: white;" id="item"><a
					href="http://localhost:8089/">Salir<img align="left"></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<br>
	<div class="container-fluid">
		<div class="container">
			<div class="alert alert-primary"
				style="text-align: center; display: ${mensajeGuardado}">
				<h4>${mensaje}${mensaje2}</h4>
			</div>
			<div class="btn-group" style="color: white;">
				<button type="button" class="btn btn-warning btn-lg dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Selecciona la encuesta que quieres completar</button>
				<div class="dropdown-menu">
					<c:forEach items="${encuestas}" var="encuestaTem">
						<a class="dropdown-item"
							href="/encuesta/${ usuario.getId()}/${ encuestaTem.getServicioBienestar().getId() }">${ encuestaTem.getServicioBienestar().getNombre() }</a>
					</c:forEach>
				</div>
			</div>
			<br> <br>

			<div style="display: ${servicioSeleccionado}">
				<form
					action="http://localhost:8089/encuesta/${ usuario.getId()}/${ encuestaSeleccionada }/${ preguntaNum}"
					method="post">



					<div class="card">
						<div class="card-header">Pregunta</div>
						<div class="card-body">
							<h5 class="card-title">${ preguntas.get(preguntaNum).getContenido() }</h5>
							<p class="card-text">¿Tu opinion?</p>

							<div class="form-check">
								<input class="form-check-input" type="radio" name="deacuerdo"
									id="exampleRadios1"
									value="${ preguntas.get(preguntaNum).getId() }"> <label
									class="form-check-label"
									for="exampleRadios-${ preguntas.get(preguntaNum).getId() }">
									de acuerdo </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="indiferente"
									id="exampleRadios2"
									value="${ preguntas.get(preguntaNum).getId() }"> <label
									class="form-check-label"
									for="exampleRadios-${ preguntas.get(preguntaNum).getId() }">
									indiferente </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="desacuerdo"
									id="exampleRadios3"
									value="${ preguntas.get(preguntaNum).getId() }"> <label
									class="form-check-label"
									for="exampleRadios-${ preguntas.get(preguntaNum).getId() }">
									desacuerdo </label>
							</div>
						</div>
					</div>

					<button type="submit" class="btn btn-primary">Guardar
						Respuestas</button>
				</form>
			</div>

		</div>
	</div>
	<br>
	<br>
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
