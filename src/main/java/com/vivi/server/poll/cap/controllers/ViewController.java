package com.vivi.server.poll.cap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/encuesta")
	public String encuesta() {
		return "encuesta";
	}
	@GetMapping("/inicio")
	public String inicio() {
		return "inicio";
	}
	@GetMapping("/reporte")
	public String reporte() {
		return "reporte";
	}
	@GetMapping("/usuario")
	public String usuario() {
		return "usuario";
	}
}
