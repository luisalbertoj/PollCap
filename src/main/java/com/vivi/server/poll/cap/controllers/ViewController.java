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
	
	public Usuario loadUser(Long id) {
		return usuarioService.findById(id);
		
	}
}
