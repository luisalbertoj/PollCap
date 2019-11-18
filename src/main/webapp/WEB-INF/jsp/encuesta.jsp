<%-- 
    Document   : encuesta
    Created on : 29/10/2019, 12:48:29 AM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	<div id="top">
		<img src="http://localhost:8089/IMG/logoUDES.png" align="left"
			id="img">
		<h1>PollCap</h1>
	</div>
	<div id="menu">
		<nav class="nav">
			<ul>
				<li id="item"><a href="/inicio/${ usuario.getId()}">Inicio<img
						src="http://localhost:8089/IMG/inicio.png" align="left">
				</a></li>
				<li id="item"><a href="/usuario/${ usuario.getId()}">Usuario<img
						src="http://localhost:8089/IMG/user.png" align="left">
				</a></li>
				<li id="item"><a href="/encuesta/${ usuario.getId()}">Encuesta<img
						src="http://localhost:8089/IMG/encuesta.png" align="left"></a></li>
				<li id="item"><a href="/reporte/${ usuario.getId()}">Reporte<img
						src="http://localhost:8089/IMG/reporte.png" align="left"></a></li>
			</ul>
		</nav>
	</div>
	<br>
	<br>
	<div class="container-fluid">
		<div class="container">
			<div class="card">
				<div class="card-header">Pregunta 1</div>
				<div class="card-body">
					<h5 class="card-title">El servicio de natacion</h5>
					<p class="card-text">Cumple tus espectativas?</p>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios1" value="option1" checked> <label
							class="form-check-label" for="exampleRadios1"> Default
							radio </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios2" value="option2"> <label
							class="form-check-label" for="exampleRadios2"> Second
							default radio </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios"
							id="exampleRadios3" value="option3" > <label
							class="form-check-label" for="exampleRadios3"> Disabled
							radio </label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div id="pie">
		<h4>NURLYS VIVIANA PATIÑO EPALZA</h4>
		<h5>UNIVERSIDAD DE SANTANDER</h5>
	</div>
</body>
</html>
