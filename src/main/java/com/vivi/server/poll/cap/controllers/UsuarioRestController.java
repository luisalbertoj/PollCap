package com.vivi.server.poll.cap.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.vivi.server.poll.cap.models.entity.Usuario;
import com.vivi.server.poll.cap.models.services.IUsuarioService;

@RestController
@RequestMapping("/api")
public class UsuarioRestController {

	@Autowired
	private IUsuarioService usuarioService;

	@GetMapping("/usuarios")
	public List<Usuario> index() {
		return usuarioService.findAll();
	}

	@GetMapping("/usuarios/{id}")
	public ResponseEntity<?> show(@PathVariable Long id) {
		Usuario usuario = null;
		Map<String, Object> response = new HashMap<>();

		try {
			usuario = usuarioService.findById(id);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la consulta en la BD");
			response.put("error", e.getMessage().concat(" : ").concat(e.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}

		if (usuario == null) {
			response.put("mensaje", "El usuario ID: ".concat(id.toString()).concat(" no existe en la base de datos!"));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<Usuario>(usuario, HttpStatus.OK);
	}

	@PostMapping("/login")
	public Usuario login(@RequestBody Usuario user) {
		return usuarioService.login(user);
	}

	@PostMapping("/usuarios")
	@ResponseStatus(HttpStatus.CREATED)
	public ResponseEntity<?> create(@RequestBody Usuario usuario) {
		Usuario usuarioNew = null;
		Map<String, Object> response = new HashMap<>();
		try {
			usuarioNew = usuarioService.save(usuario);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar el insert en la base de datos");
			response.put("error", e.getMessage().concat(" : ").concat(e.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		response.put("mensaje", "El usuario ha sido creado con exito!");
		response.put("data", usuarioNew);
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}

	@PutMapping("/usuarios/{id}")
	public ResponseEntity<?> update(@RequestBody Usuario usuario, @PathVariable Long id) {
		Usuario usuarioActual = usuarioService.findById(id);
		Usuario usuarioUpdate = null;
		Map<String, Object> response = new HashMap<>();

		if (usuarioActual == null) {
			response.put("mensaje", "El usuario ID: ".concat(id.toString()).concat(" no existe en la base de datos!"));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.NOT_FOUND);
		}

		try {
			usuarioActual.setNombres(usuario.getNombres());
			usuarioActual.setEmail(usuario.getEmail());
			usuarioActual.setCodigo(usuario.getCodigo());

			usuarioUpdate = usuarioService.save(usuarioActual);

		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la actualizacion  en la base de datos");
			response.put("error", e.getMessage().concat(" : ").concat(e.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "El usuario ha sido actualizado con exito!");
		response.put("data", usuarioUpdate);

		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.CREATED);
	}

	@DeleteMapping("/usuarios/{id}")
	public ResponseEntity<?> delete(@PathVariable Long id) {
		Map<String, Object> response = new HashMap<>();
		try {
			usuarioService.delete(id);
		} catch (DataAccessException e) {
			response.put("mensaje", "Error al realizar la eliminacion  en la base de datos");
			response.put("error", e.getMessage().concat(" : ").concat(e.getMostSpecificCause().getMessage()));
			return new ResponseEntity<Map<String, Object>>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		response.put("mensaje", "El usuario ha sido eliminado con exito!");
		return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
}
