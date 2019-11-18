<%-- 
    Document   : reporte
    Created on : 29/10/2019, 12:48:42 AM
    Author     : ARMENI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>PollCap</title>
<link href="http://localhost:8089/CSS/cssReporte.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>



</head>


<body>


	<div class="alert alert-primary" style="text-align: center;">
		<h3>${mensaje}</h3>
		<h3>${usuario.getNombres()}-${usuario.getRol().getNombre()}</h3>
	</div>
	<br>
	<div>
		<div>

			<form>
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
							<li style="color: white;display: ${ menuEncuesta }" id="item"><a
								href="/encuesta/${ usuario.getId()}">Encuesta<img
									src="http://localhost:8089/IMG/encuesta.png" align="left"></a></li>
							<li style="color: white; display: ${ menuReporte }" id="item"><a
								href="/reporte/${ usuario.getId()}/1">Reporte<img
									src="http://localhost:8089/IMG/reporte.png" align="left"></a></li>
							<li style="color: white;" id="item"><a
								href="http://localhost:8089/">Salir<img align="left"></a></li>
						</ul>
					</nav>
				</div>
				<br>

				<div class="drop-servicio container">
					<div class="btn-group" style="color: white;">
						<button type="button"
							class="btn btn-warning btn-lg dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Selecciona la informacion a consultar</button>
						<div class="dropdown-menu">
							<c:forEach items="${servicioBienestar}" var="encuestaTem">
								<a class="dropdown-item"
									href="/reporte/${ usuario.getId()}/${ encuestaTem.getId() }">${ encuestaTem.getNombre() }</a>
							</c:forEach>
						</div>
					</div>
				</div>
				<br>
				<div class="alert alert-primary"
					style="text-align: center; display: ${mensajeGuardado}">
					<h4>${mensaje}${mensaje2}</h4>
				</div>

				<div style="display: ${ showReporte }">
					<h1 id="titulo">REPORTE DE LAS ENCUESTAS</h1>
					<c:forEach items="${preguntas}" var="preguntaTem" varStatus="loop1">
							<div style="display: none;">
							${ cantidadRespuestasDeacuerdo = 0 }
							${ cantidadRespuestasDesacuerdo = 0 }
							${ cantidadRespuestasIndiferente = 0 }
							<c:forEach items="${respuestas.get(loop1.index)}" var="respuestasTem" varStatus="loop">
								${ cantidadRespuestasDeacuerdo = cantidadRespuestasDeacuerdo + respuestasTem.getContenido().getDeacuerdo() }								 
								${ cantidadRespuestasDesacuerdo = cantidadRespuestasDesacuerdo + respuestasTem.getContenido().getDesacuerdo() }
								${ cantidadRespuestasIndiferente = cantidadRespuestasIndiferente + respuestasTem.getContenido().getIndiferente() }
							</c:forEach>
							</div>
							<div>
							<section class="grafico-barras">
								<ul>
									<span class="barra-fondo">
										<li class="barras" data-value="${ cantidadRespuestasDeacuerdo }">De_acuerdo</li>
									</span>
									<span class="barra-fondo">
										<li class="barras" data-value="${ cantidadRespuestasIndiferente  }">Indiferente</li>
									</span>
									<span class="barra-fondo">
										<li class="barras" data-value="${ cantidadRespuestasDesacuerdo  }">Desacuerdo</li>
									</span>

								</ul>
							</section>
							<div>
								<h4 id="pregunta">PREGUNTA: ${ preguntaTem.getContenido() }</h4>
								<h6 id="pregunta">De acuerdo: ${ cantidadRespuestasDeacuerdo }</h6>
								<h6 id="pregunta">Indiferente: ${ cantidadRespuestasIndiferente  }</h6>
								<h6 id="pregunta">Desacuerdo: ${ cantidadRespuestasDesacuerdo  }</h6>
								
								<h5 id="total">TOTAL: ${ respuestas.get(loop1.index).size() }</h5>
							</div>
						</div>
					</c:forEach>
					<div id="pie">
						<h4>NURLYS VIVIANA PATIÑO EPALZA</h4>
						<h5>UNIVERSIDAD DE SANTANDER</h5>
					</div>
				</div>

			</form>

		</div>
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
		<script type="text/javascript">
		$(document).ready(function() {
		  $('.barras').each(function() {
		     var dataWidth = $(this).data('value');
		     $(this).css("width", dataWidth + "%");
		    if (dataWidth < 1) { $(this).css("background-color", "transparent");}
		    else if (dataWidth <=25) { $(this).css("background-color", "orange"); }
				else if (dataWidth >25 && dataWidth <=50){ $(this).css("background-color", "red"); }
				else if (dataWidth >50 && dataWidth<=75) { $(this).css("background-color", "yellow"); }
				else if (dataWidth >75 && dataWidth<=100) { $(this).css("background-color", "green"); }	
		  });
		});
	</script>
</body>
</html>
