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
        <link href="http://localhost:8080/CSS/cssEncuesta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form>
        <div id="top"> 
            <img src="http://localhost:8080/IMG/logoUDES.png" align="left" id="img"> <h1> PollCap </h1>
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
            <div id="pie">
                <h4> NURLYS VIVIANA PATIÑO EPALZA</h4>
                <h5> UNIVERSIDAD DE SANTANDER </h5>
            </div>
        </form>
    </body>
</html>
