package com.vivi.server.poll.cap.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.vivi.server.poll.cap.models.entity.Usuario;
import com.vivi.server.poll.cap.models.services.IUsuarioService;

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
	@GetMapping("/encuesta")
	public String encuesta() {
		return "encuesta";
	}
	
	@GetMapping("/inicio/{id}")
	public String inicioGet(Model view, @PathVariable Long id) {
		Usuario usuario = usuarioService.findById(id);
		view.addAttribute("usuario", usuario);
		return "inicio";
	}
	
	@PostMapping("/inicio")
	public String inicio(Model view, Usuario usuario) {
		if(usuario.getUsername().isEmpty() || usuario.getPassword().isEmpty()) {
			view.addAttribute("mensaje", "Los campos no pueden estar vacios");
			return "index";
		}
		
		Usuario usuarioLogueado = usuarioService.login(usuario);
		
		if(usuarioLogueado == null) {
			view.addAttribute("mensaje", "Usuario o contraseña incorrectos");
			return "index";
		}
		view.addAttribute("usuario", usuarioLogueado);
		return "inicio";
	}
	@GetMapping("/reporte")
	public String reporte() {
		return "reporte";
	}
	@GetMapping("/usuario")
	public String usuario(Model view) {
		view.addAttribute("usuarios", usuarioService.findAll());
		return "usuario";
	}
}
