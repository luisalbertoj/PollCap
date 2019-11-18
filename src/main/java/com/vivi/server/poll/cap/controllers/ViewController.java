package com.vivi.server.poll.cap.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vivi.server.poll.cap.models.entity.Encuesta;
import com.vivi.server.poll.cap.models.entity.Contenido;
import com.vivi.server.poll.cap.models.entity.Pregunta;
import com.vivi.server.poll.cap.models.entity.Programa;
import com.vivi.server.poll.cap.models.entity.Respuesta;
import com.vivi.server.poll.cap.models.entity.Rol;
import com.vivi.server.poll.cap.models.entity.Semestre;
import com.vivi.server.poll.cap.models.entity.ServicioBienestar;
import com.vivi.server.poll.cap.models.entity.Usuario;
import com.vivi.server.poll.cap.models.services.IEncuestaService;
import com.vivi.server.poll.cap.models.services.IPreguntaService;
import com.vivi.server.poll.cap.models.services.IRespuestaService;
import com.vivi.server.poll.cap.models.services.IServicioBienestarService;
import com.vivi.server.poll.cap.models.services.IUsuarioService;
import com.vivi.server.poll.cap.util.Excel;

@Controller
public class ViewController {

	@Autowired
	private IUsuarioService usuarioService;
	@Autowired
	private IEncuestaService encuestaService;
	@Autowired
	private IPreguntaService preguntaService;
	@Autowired
	private IRespuestaService respuestaService;
	@Autowired
	private IServicioBienestarService servicioBienestarService;
	
	@GetMapping("/")
	public String index(Model view) {
		String resultado = "luis";
		view.addAttribute("resultado", resultado);
		return "index";
	}

	@GetMapping("/encuesta/{id}")
	public String encuesta(Model view,@PathVariable Long id) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		List<Encuesta> encuestas = encuestaService.findAll();
		ArrayList<Encuesta> encuestasDelUsuario = new ArrayList<Encuesta>();
		for(Encuesta encuestaTem: encuestas) {
			if(encuestaTem.getUsuario().getId().equals(id)) encuestasDelUsuario.add(encuestaTem);
		}
		view.addAttribute("encuestas", encuestasDelUsuario);
		System.out.println(encuestasDelUsuario);
		view.addAttribute("servicioSeleccionado", "none");
		view.addAttribute("servicioSeleccionado", "none");
		return "encuesta";
	}
	
	@GetMapping("/encuesta/{id}/{id_encuesta}")
	public String encuestaLlenar(Model view,@PathVariable Long id, @PathVariable Long id_encuesta) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		List<Encuesta> encuestas = encuestaService.findAll();
		ArrayList<Encuesta> encuestasDelUsuario = new ArrayList<Encuesta>();
		for(Encuesta encuestaTem: encuestas) {
			if(encuestaTem.getUsuario().getId().equals(id)) encuestasDelUsuario.add(encuestaTem);
		}
		
		List<Pregunta> preguntas = preguntaService.findAll();
		ArrayList<Pregunta> preguntasDelUsuario = new ArrayList<Pregunta>();
		for(Pregunta preguntaTem: preguntas) {
			if(preguntaTem.getEncuesta().getId().equals(id_encuesta)) preguntasDelUsuario.add(preguntaTem);
		}
		System.out.println(preguntasDelUsuario);
		view.addAttribute("encuestaSeleccionada", id_encuesta );
		view.addAttribute("preguntas", preguntasDelUsuario);
		view.addAttribute("preguntaNum", 0);
		view.addAttribute("encuestas", encuestasDelUsuario);
		view.addAttribute("servicioSeleccionado", "block");
		
		return "encuesta";
	}
	
	@PostMapping("/encuesta/{id}/{id_encuesta}/{num_pregunta}")
	public String encuestaGuardar(Model view,@PathVariable Long id,@PathVariable int num_pregunta, @PathVariable Long id_encuesta,Contenido formModel) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		List<Encuesta> encuestas = encuestaService.findAll();
		ArrayList<Encuesta> encuestasDelUsuario = new ArrayList<Encuesta>();
		for(Encuesta encuestaTem: encuestas) {
			if(encuestaTem.getUsuario().getId().equals(id)) encuestasDelUsuario.add(encuestaTem);
		}
		
		List<Pregunta> preguntas = preguntaService.findAll();
		ArrayList<Pregunta> preguntasDelUsuario = new ArrayList<Pregunta>();
		for(Pregunta preguntaTem: preguntas) {
			if(preguntaTem.getEncuesta().getId().equals(id_encuesta)) preguntasDelUsuario.add(preguntaTem);
		}
		Respuesta respuesta = new Respuesta();
		Contenido contenido = new Contenido();
		Pregunta pregunta = new Pregunta();
		if(formModel.getDeacuerdo() != null) {
			pregunta.setId(Long.parseLong(formModel.getDeacuerdo()));
			contenido.setId(Long.parseLong("1"));
			respuesta.setContenido(contenido);
		}
		if(formModel.getDesacuerdo() != null) {
			pregunta.setId(Long.parseLong(formModel.getDesacuerdo()));
			contenido.setId(Long.parseLong("2"));
			respuesta.setContenido(contenido);
		}
		if(formModel.getIndiferente() != null) {
			pregunta.setId(Long.parseLong(formModel.getIndiferente()));
			contenido.setId(Long.parseLong("3"));
			respuesta.setContenido(contenido);
		}
		respuesta.setPregunta(pregunta);		
		try {
			respuestaService.save(respuesta);
		} catch (Exception e) {
			view.addAttribute("mensaje2", "- !Esta Pregunta ya ha sido respondida la nueva respuesta no sera guardada");
		}
		
		num_pregunta ++;
		view.addAttribute("encuestaSeleccionada", id_encuesta );
		view.addAttribute("preguntas", preguntasDelUsuario);
		view.addAttribute("preguntaNum", num_pregunta);
		view.addAttribute("encuestas", encuestasDelUsuario);
		view.addAttribute("mensajeGuardado", "block");
		view.addAttribute("mensaje", "Pregunta: " + num_pregunta);
		if(preguntasDelUsuario.size() == (num_pregunta)) {
			view.addAttribute("preguntaNum", 0);
			view.addAttribute("servicioSeleccionado", "none");
			view.addAttribute("mensaje", "Encuesta finalizada!");
		}	
		return "encuesta";
	}
	@GetMapping("/inicio/{id}")
	public String inicioGet(Model view, @PathVariable Long id) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		return "inicio";
	}
	@PostMapping("/inicio")
	public String inicio(Model view, Usuario usuario) {
		if (usuario.getUsername().isEmpty() || usuario.getPassword().isEmpty()) {
			view.addAttribute("mensaje", "Los campos no pueden estar vacios");
			return "index";
		}

		Usuario usuarioLogueado = usuarioService.login(usuario);

		if (usuarioLogueado == null) {
			view.addAttribute("mensaje", "Usuario o contraseña incorrectos");
			return "index";
		}
		view.addAttribute("usuario", usuarioLogueado);
		view = permisos(view, usuarioLogueado);
		return "inicio";
	}
	@GetMapping("/reporte/{id}")
	public String reporte(Model view, @PathVariable Long id) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		
		List<ServicioBienestar> servicioBienestar = servicioBienestarService.findAll();
		view.addAttribute("servicioBienestar", servicioBienestar);
		
		view.addAttribute("showReporte", "none");
		return "reporte";
	}
	
	@GetMapping("/reporte/{id}/{id_seleccion}")
	public String reporte(Model view, @PathVariable Long id, @PathVariable Long id_seleccion) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		
		List<ServicioBienestar> servicioBienestar = servicioBienestarService.findAll();
		view.addAttribute("servicioBienestar", servicioBienestar);
		
		List<Pregunta> preguntas = preguntaService.findAll();
		ArrayList<Pregunta> preguntasDeSeleccion = new ArrayList<Pregunta>();
		for(Pregunta preguntaTem: preguntas) {
			if(preguntaTem.getEncuesta().getId().equals(id_seleccion)) preguntasDeSeleccion.add(preguntaTem);
		}
		
		List<Respuesta> respuestas = respuestaService.findAll();
		ArrayList<ArrayList<Respuesta>> respuestasDeSeleccion = new ArrayList<ArrayList<Respuesta>>();
		ArrayList<Respuesta> respuestasTemporal = new ArrayList<Respuesta>();
		for(Respuesta respuestaTem: respuestas) {
			respuestasTemporal = new ArrayList<Respuesta>();
			for(Pregunta preguntaTem: preguntasDeSeleccion) {
				if(respuestaTem.getPregunta().getId().equals(preguntaTem.getId())) {
					System.out.println("id pregunta "+ preguntaTem.getId());
					System.out.println("id respuesta "+ respuestaTem.getId());
					System.out.println("id respuesta y id pregunta "+ respuestaTem.getPregunta().getId());
					respuestasTemporal.add(respuestaTem);
				}
			}
			respuestasDeSeleccion.add(respuestasTemporal);
		}
		if( respuestasDeSeleccion.size() == 0) {
			view.addAttribute("mensaje2", "El elemento seleccionado no ha sido respondido aun");
			view.addAttribute("showReporte", "none");
		} else {
			view.addAttribute("showReporte", "block");
		}
		view.addAttribute("encuestaSeleccionada", id_seleccion );
		view.addAttribute("preguntas", preguntasDeSeleccion);
		view.addAttribute("respuestas", respuestasDeSeleccion);
		return "reporte";
	}

	@GetMapping("/usuario/{id}")
	public String usuario(Model view, @PathVariable Long id) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		view.addAttribute("usuarios", usuarioService.findAll());
		return "usuario";
	}

	@PostMapping("/usuario/{id}")
	public String uploadUsuarios(Model view, @PathVariable Long id, @RequestParam("archivo") MultipartFile archivo) {
		Usuario user = loadUser(id);
		view.addAttribute("usuario", user);
		view = permisos(view, user);
		
		if (!archivo.isEmpty()) {
			String nombreArchivo = UUID.randomUUID().toString() + "_" + archivo.getOriginalFilename().replace(" ", "");
			Path rutaArchivo = Paths.get("multimedia").resolve(nombreArchivo).toAbsolutePath();
			try {
				Files.copy(archivo.getInputStream(), rutaArchivo);
			} catch (IOException e) {
				view.addAttribute("mensaje", "Error al cargar el arhcio");
			}
			ArrayList<String[]> usuarios = null;
			try {
				usuarios = Excel.readExcelFileToArray(new File("multimedia/" + nombreArchivo));
			} catch (Exception e) {
				view.addAttribute("mensaje", "ALgo ha salido mal al interpretar el excel");
			}
			if (usuarios != null) {
				int r = 0;
				for (String[] next : usuarios) {
					Usuario usuarionuevo = new Usuario();
					Programa programa = new Programa();
					Semestre semestre = new Semestre();
					Rol rol = new Rol();
					
					try {
						if (next[0] != null) {
							usuarionuevo.setId(Long.parseLong(Math.round(Float.parseFloat(next[0]))+ ""));
						}
						usuarionuevo.setCodigo(next[1]);
						usuarionuevo.setEmail(next[2]);
						usuarionuevo.setNombres(next[3]);
						usuarionuevo.setPassword(next[4]);
						usuarionuevo.setTelefono(next[5]);
						usuarionuevo.setUsername(next[6]);
						programa.setId(Long.parseLong(Math.round(Float.parseFloat(next[7]))+ ""));
						usuarionuevo.setPrograma(programa);
						rol.setId(Long.parseLong(Math.round(Float.parseFloat(next[8]))+ ""));
						usuarionuevo.setRol(rol);
						semestre.setId(Long.parseLong(Math.round(Float.parseFloat(next[9]))+ ""));
						usuarionuevo.setSemestre(semestre);
						usuarioService.save(usuarionuevo);
					} catch (Exception e) {
						view.addAttribute("mensaje", "El elemento llamado: " + next[3]
								+ " no se pudo registrar revise que los datos sean correctos o que su codigo o correo ya esten registrados");
					}
				}
			}

		}
		view.addAttribute("mensaje2", "Elementos Actualizados y creados");
		view.addAttribute("usuarios", usuarioService.findAll());
		return "usuario";
	}

	public Usuario loadUser(Long id) {
		return usuarioService.findById(id);

	}
	public Model permisos(Model view, Usuario usuario) {
		
		if(usuario.getRol().getNombre().equals("estudiante")) {
			view.addAttribute("menuIncio", "block");
			view.addAttribute("menuUsuario", "none");
			view.addAttribute("menuEncuesta", "block");
			view.addAttribute("menuReporte", "none");
		} else if(usuario.getRol().getNombre().equals("coordinador")) {
			view.addAttribute("menuIncio", "none");
			view.addAttribute("menuUsuario", "block");
			view.addAttribute("menuEncuesta", "none");
			view.addAttribute("menuReporte", "block");
		}
		return view;
	}
}
