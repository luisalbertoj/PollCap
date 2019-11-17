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
       
        <title>PollCap </title>
        <link href="./CSS/cssIniciarSesion.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="inicio.jsp" method="post">
        <div id="cuadro" >
            
            
                <p id="titulo">  <img src="./IMG/logoEncuesta.png" align="left" > PollCap</p> 
                
                </br></br>
                <label id="usuario">Usuario</label>
                </br>
                <input type="text" class="entrada">
                <hr>
                </br>
                <label id="contrasena">Contraseña</label>
                </br>
                <input type="password" class="entrada">
                <hr>
                </br>
                <input type="submit" value="Iniciar sesión" id="botonIniciar"/>
            
            <br/> <br/>
            <img src="./IMG/LogoUniversidad.png" id="logoU">
        </div>
            
</form>
    </body>
</html>
