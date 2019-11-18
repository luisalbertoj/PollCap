<%-- 
    Document   : reporte
    Created on : 29/10/2019, 12:48:42 AM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <title>PollCap</title>  
        <link href="http://localhost:8089/CSS/cssReporte.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        
        
      
    </head>
    
    
    <body>
    
    
    <div class="alert alert-primary" style="text-align: center; ">
		<h3>${mensaje}</h3>
		<h3>${usuario.getNombres()} - ${usuario.getRol().getNombre()}</h3>
	</div>
	<br>
	<div>
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
				<li style="color: white;display: ${ menuEncuesta }" id="item"><a href="/encuesta/${ usuario.getId()}">Encuesta<img
						src="http://localhost:8089/IMG/encuesta.png" align="left"></a></li>
				<li style="color: white; display: ${ menuReporte }" id="item"><a href="/reporte/${ usuario.getId()}">Reporte<img
						src="http://localhost:8089/IMG/reporte.png" align="left"></a></li>
				<li style="color: white;" id="item"><a href="http://localhost:8089/">Salir<img
						align="left"></a></li>
			</ul>    
          </nav>
        </div>
        
        <h1 id="titulo">REPORTE DE LAS ENCUESTAS</h1>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        
        <div>
        <h4 id="pregunta">PREGUNTA 1: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        <div>
        <h4 id="pregunta">PREGUNTA 2: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        <div>
        <h4 id="pregunta">PREGUNTA 3: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        
        <div>
        <h4 id="pregunta">PREGUNTA 4: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        <div>
        <h4 id="pregunta">PREGUNTA 5: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        <div>
        <h4 id="pregunta">PREGUNTA 6: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        
        <div>
        <h4 id="pregunta">PREGUNTA 7: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        
        <div>
        <h4 id="pregunta">PREGUNTA 8: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
        
        <div>
        <h4 id="pregunta">PREGUNTA 9: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
        </div>
        
        <section class="grafico-barras">
				<ul>
             <span class="barra-fondo">
                <li class="barras" data-value="70">De_acuerdo</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="25">Indiferente</li>
             </span>
             <span class="barra-fondo">
              	<li class="barras" data-value="50">Desacuerdo</li>
             </span>
                         
				</ul>
</section>
	
        <div>
        <h4 id="pregunta">PREGUNTA 10: </h4>
        <h6 id="pregunta">De acuerdo: </h6>
        <h6 id="pregunta">Indiferente: </h6>
        <h6 id="pregunta">Desacuerdo: </h6>
        
        <h5 id= "total">TOTAL:</h5>
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
