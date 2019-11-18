    
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PollCap</title>  
        <link href="http://localhost:8089/CSS/cssMenu.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
      
    </head>
    <body>
    <div class="alert alert-primary" style="text-align: center; ">
		<h3>${mensaje}</h3>
		<h3>${usuario.getNombres()} - ${usuario.getRol().getNombre()}</h3>
	</div>
	<br>
	<div class="container-fluid">
		<div >
		
		<form>
        <div id="top"> 
            <img src="http://localhost:8089/IMG/logoUDES.png" align="left" id="img"> <h1> PollCap </h1>
        </div>
        <div id="menu">   
            <nav class="nav">
             <ul>
				<li style="color: white; display: ${ menuIncio }" id="item"><a href="/inicio/${ usuario.getId()}">Inicio<img
						src="http://localhost:8089/IMG/inicio.png" align="left">
				</a></li>
				<li style="color: white; display: ${ menuUsuario }" id="item"><a href="/usuario/${ usuario.getId()}">Usuario<img
						src="http://localhost:8089/IMG/user.png" align="left">
				</a></li>
				<li style="color: white; display: ${ menuEncuesta }" id="item"><a href="/encuesta/${ usuario.getId()}">Encuesta<img
						src="http://localhost:8089/IMG/encuesta.png" align="left"></a></li>
				<li style="color: white; display: ${ menuReporte }" id="item"><a href="/reporte/${ usuario.getId()}/1">Reporte<img
						src="http://localhost:8089/IMG/reporte.png" align="left"></a></li>
				<li style="color: white;" id="item"><a href="http://localhost:8089/">Salir<img
						align="left"></a></li>
			</ul>    
          </nav>
        </div>
           <div class="carrusel">
               <div class="slider">
			<ul>
                            <li>
                                <img class="d-block w-100" src="http://localhost:8089/IMG/bailoterapia.jpg" alt="">
                            </li>
                                                              <li>
                                <img class="d-block w-100" src="http://localhost:8089/IMG/natacion.jpg" alt="">
                              </li>
                                                              <li>
                                <img class="d-block w-100" src="http://localhost:8089/IMG/yoga.jpg" alt="">
                              </li>
			
			</ul>
                   </div>
		</div>
            <div id="pie">
                <h4> NURLYS VIVIANA PATIÑO EPALZA</h4>
                <h5> UNIVERSIDAD DE SANTANDER </h5>
            </div>
        </form>
        
		</div>
	</div>
        
    </body>
</html>
