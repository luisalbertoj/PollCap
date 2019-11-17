<%-- 
    Document   : index
    Created on : 18-oct-2019, 23:19:18
    Author     : viviana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>PollCap</title>
<link href="http://localhost:8080/CSS/cssIniciarSesion.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	<div class="banner" style="text-align: center; color: white; padding: 0; background-color: transparent;">
		<h1>${mensaje}</h1>
	</div>

	<form action="inicio" method="post">
		<div id="cuadro">


			<p id="titulo">
				<img src="http://localhost:8080/IMG/logoEncuesta.png" align="left"> PollCap
			</p>

			</br>
			</br> <label id="usuario">Usuario</label> </br> <input type="text"
				class="entrada" name="username" required="required">

			<hr>
			</br> <label id="contrasena">Contraseña</label> </br> <input type="password"
				class="entrada" name="password" required="required">
			<hr>
			</br> <input type="submit" value="Iniciar sesión" id="botonIniciar" /> <br />
			<br /> <img src="http://localhost:8080/IMG/LogoUniversidad.png" id="logoU">
		</div>

	</form>
</body>
</html>
