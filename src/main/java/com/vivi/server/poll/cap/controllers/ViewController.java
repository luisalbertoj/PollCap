package com.vivi.server.poll.cap.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vivi.server.poll.cap.models.entity.Programa;
import com.vivi.server.poll.cap.models.entity.Rol;
import com.vivi.server.poll.cap.models.entity.Semestre;
import com.vivi.server.poll.cap.models.entity.Usuario;
import com.vivi.server.poll.cap.models.services.IUsuarioService;
import com.vivi.server.poll.cap.util.Excel;

@Controller
public class ViewController {

	@Autowired
	private IUsuarioService usuarioService;

	@GetMapping("/")
	public String index(Model view) {
		String resultado = "luis";
		view.addAttribute("resultado", resultado);
		return "index";
	}

	@GetMapping("/encuesta/{id}")
	public String encuesta(@PathVariable Long id) {
		return "encuesta";
	}

	@GetMapping("/inicio/{id}")
	public String inicioGet(Model view, @PathVariable Long id) {
		view.addAttribute("usuario", loadUser(id));
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
		return "inicio";
	}

	@GetMapping("/reporte/{id}")
	public String reporte(@PathVariable Long id) {
		return "reporte";
	}

	@GetMapping("/usuario/{id}")
	public String usuario(Model view, @PathVariable Long id) {
		view.addAttribute("usuario", loadUser(id));
		view.addAttribute("usuarios", usuarioService.findAll());
		return "usuario";
	}

	@PostMapping("/usuario/{id}")
	public String uploadUsuarios(Model view, @PathVariable Long id, @RequestParam("archivo") MultipartFile archivo) {

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
					
				}
			}

		}
		view.addAttribute("mensaje2", "Elementos Actualizados y creados");
		view.addAttribute("usuario", loadUser(id));
		view.addAttribute("usuarios", usuarioService.findAll());
		return "usuario";
	}

	public Usuario loadUser(Long id) {
		return usuarioService.findById(id);

	}
}
