<%-- 
    Document   : usuario
    Created on : 26/10/2019, 06:48:23 PM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PollCap</title>
        <link href="./CSS/cssUsuario.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
         <form>
        <div id="top"> 
            <img src="./IMG/logoUDES.png" align="left" id="img"> <h1> PollCap </h1>
        </div>
        <div id="menu">   
            <nav class="nav">
            <ul>
                <li id="item"><a href="inicio.jsp">Inicio<img src="./IMG/inicio.png" align="left"> </a></li>
                <li id="item"><a href="usuario.jsp">Usuario<img src="./IMG/user.png" align="left"> </a></li>
                <li id="item"><a href="encuesta.jsp">Encuesta<img src="./IMG/encuesta.png" align="left"></a></li>
                <li id="item"><a href="reporte.jsp">Reporte<img src="./IMG/reporte.png" align="left"></a></li>
            </ul>  
          </nav>
        </div>
             
             <input type="submit" value="Actualizar Usuarios" id="botonActualizar"/>
             <input type="submit" value="" id="botonBuscar"/>
             <input type="text" class="buscar">
             <table >
                 <tr>
                     <td>NOMBRE</td>
                     <td>NOMBRE</td>
                 </tr> 
                  <tr>
                     
                 </tr>
             </table>
            <div id="pie">
                <h4> NURLYS VIVIANA PATIÑO EPALZA</h4>
                <h5> UNIVERSIDAD DE SANTANDER </h5>
            </div>
        </form>
    </body>
</html>
